import argparse
import time

import numpy as np

import visa

# Parse folder path, file name, and measurement parameters from command line
# arguments. Remember to include the "python" keyword before the call to the
# python file from the command line, e.g. python example.py "arg1" "arg2".
# Folder paths must use forward slashes to separate subfolders.
parser = argparse.ArgumentParser(
    description='Measure and save max power point tracking data')
parser.add_argument(
    'folder_path',
    metavar='folder_path',
    type=str,
    help='Absolute path to the folder containing max P stabilisation data')
parser.add_argument(
    'file_name',
    metavar='file_name',
    type=str,
    help='Name of the file to save the data to')
parser.add_argument(
    'V_start',
    metavar='V_start',
    type=float,
    help='Seed voltage for maximum power point tracker (V)')
parser.add_argument(
    'I_comp', metavar='I_comp', type=float, help='Compliance current (A)')
parser.add_argument(
    'nplc',
    metavar='nplc',
    type=float,
    help='Integration filter in number of power line cycles (NPLC)')
parser.add_argument(
    't_settling', metavar='t_settling', type=float, help='Settling delay (ms)')
args = parser.parse_args()
parser.add_argument(
    't_track',
    metavar='t_track',
    type=float,
    help='Time to track maximum power point for (s)')
parser.add_argument('A', metavar='A', type=float, help='Device area (cm^2)')
parser.add_argument(
    'num_of_suns',
    metavar='num_of_suns',
    type=float,
    help='Number of suns equivalent illumination intensity')
args = parser.parse_args()

# Assign argparse arguments to variables
folderpath = args.folder_path
filename = args.file_name
V_start = args.V_start
A = args.A
I_comp = args.I_comp
nplc = args.nplc
t_settling = args.t_settling
t_track = args.t_track
suns = args.num_of_suns

# Assign the VISA resource to a variable and reset Keithley 2450
rm = visa.ResourceManager()
keithley2450 = rm.open_resource('USB0::0x05E6::0x2450::04049675::INSTR')
keithley2450.query('*IDN?')
keithley2450.write('*RST')
keithley2450.encoding = 'latin-1'

# Turn off output
keithley2450.write('OUTP OFF')

# Enable 4-wire sense measurement
keithley2450.write(':SYST:RSEN ON')

# Set digital I/O line 1 as a digital output line
keithley2450.write(':DIG:LINE1:MODE DIG, OUT')

# Don't auto-off source after measurement
keithley2450.write(':SOUR:CLE:AUTO OFF')

# Set source function to voltage
keithley2450.write(':SOUR:FUNC VOLT')

# Set source readback to on (measure the source voltage when measuring the
# source current)
keithley2450.write(':SOUR:VOLT:READ:BACK ON')

# Enable voltage source autoranging
keithley2450.write(':SOUR:VOLT:RANG:AUTO ON')

# Set settling delay for sourcing voltage
keithley2450.write(':SOUR:VOLT:DEL {}'.format(t_settling))

# Set measurement function to current
keithley2450.write(':SOUR:FUNC CURR')

# Enable current measurement autoranging
keithley2450.write(':SENS:CURR:RANG:AUTO ON')

# Set compliance current
keithley2450.write(':SENS:CURR:PROT {}'.format(I_comp))

# Set the integration filter
keithley2450.write(':SENS:CURR:NPLC {}'.format(nplc))


# Function for tracking maximum power point
def track_max_power(V_start, t_track):
    """Maximum power point tracker.

    Starting at the seed voltage (V_start), find and track the maximum power
    point for a fixed amount of time (t_track), taking as many measurements as
    possible.

    Tracking is based on the method of steepest descent as follows:

    V_i+1 = V_i - a * (P_i - P_i-1) / (V_i - V_i-1)

    where V is the applied voltage, P is the power output, i is the current
    time step, i-1 is the previous step, and i+1 will be the next step. The
    learning rate, a, limits or increases the step size and should be tuned to
    ensure the voltage step can update fast enough to follow changes in the
    output but without overshooting. When the voltage stabilises at the
    maximum power point (V_i+1 = V_i) a small purturbation is either added or
    subtracted randomly to ensure that the algorithm can still track changes
    after a period of stability.

    Parameters
    ----------
    V_start : float
        Seed voltage for the maximum power point tracker (V)
    t_track : float
        Time to track the maximum power point for (s)

    Returns
    -------
    ts : list of float
        Timestamps for every measurement (UTC)
    Vs : list of float
        Vs (V)
    Is : list of float
        Is (A)
    Ps : list of float
        Ps (W)
    Js : list of float
        Current densities (mA / cm^2)
    PCEs : list of float
        Power conversion PCEs (%)
    """

    # Subtract a small amount from the start voltage to initialise the tracker
    V = V_start - 0.02

    # Initialise empty lists for storing data
    ts = []
    Vs = []
    Is = []
    Js = []
    Ps = []
    PCEs = []

    # Set the learning rate
    a = 0.1

    # Turn on the Keithley output at zero volts and measure for 4s in the dark
    keithley2450.write(':SOUR:VOLT 0')
    keithley2450.write('OUTP ON')

    # Start timing
    t_start = time.time()

    # Measure Jsc in the dark for 3s
    while time.time() - t_start < 3:
        data = keithley2450.query(':MEAS:CURR? SEC, SOUR, READ')
        data = data.split(',')
        data = [float(item) for item in data]
        ts.append(data[0])
        Vs.append(data[1])
        Is.append(data[2])
        Js.append(data[2] * 1000 / A)
        Ps.append(data[1] * data[2])
        PCEs.append(np.absolute(data[1] * data[2] * 1000 / (suns * A)))

    # Open the shutter of the solar simulator
    keithley2450.write(':DIG:LINE1:STAT 1')

    # Take a few measurements near the start voltage to initialise the tracker
    for i in range(2):
        keithley2450.write(':SOUR:VOLT {}'.format(V))
        data = keithley2450.query(':MEAS:CURR? SEC, SOUR, READ')
        data = data.split(',')
        data = [float(item) for item in data]
        ts.append(data[0])
        Vs.append(data[1])
        Is.append(data[2])
        Js.append(data[2] * 1000 / A)
        Ps.append(data[1] * data[2])
        PCEs.append(np.absolute(data[1] * data[2] * 1000 / (suns * A)))
        V += 0.02

    # Track the maximum point using method of steepest descent
    i = len(Vs) - 1
    while time.time() - t_start < t_track + 3:
        if Vs[i] != Vs[i - 1]:
            dP_dV = (Ps[i] - Ps[i - 1]) / (Vs[i] - Vs[i - 1])
        else:
            dP_dV = np.sign((1 - (-1)) * np.random.random_sample() +
                            (-1)) * 0.002
        V = Vs[i] - a * dP_dV
        keithley2450.write(':SOUR:VOLT {}'.format(V))
        data = keithley2450.query(':MEAS:CURR? SEC, SOUR, READ')
        data = data.split(',')
        data = [float(item) for item in data]
        ts.append(data[0])
        Vs.append(data[1])
        Is.append(data[2])
        Js.append(data[2] * 1000 / A)
        Ps.append(data[1] * data[2])
        PCEs.append(np.absolute(data[1] * data[2] * 1000 / (suns * A)))
        i += 1

    return ts, Vs, Is, Js, Ps, PCEs


# Track max power
mppt_results = track_max_power(V_start, t_track)

# Disable the output
keithley2450.write('OUTP OFF')

# Close the shutter
keithley2450.write(':DIG:LINE1:STAT 0')

# Format and save the results
np.savetxt(
    folderpath + filename,
    np.transpose(np.array(mppt_results)),
    fmt='%.9f',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)' + '\t' + 'V' + '\t' + 'I (A)' + '\t' + 'J (mA/cm^2)' +
    '\t' + 'P (W)' + '\t' + 'PCE (%)',
    comments='')
