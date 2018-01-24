import argparse
import time

import numpy as np

import pyvisa

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
    'nplc',
    metavar='nplc',
    type=float,
    help='Integration filter in number of power line cycles (NPLC)')
parser.add_argument(
    't_settling', metavar='t_settling', type=float, help='Settling delay (ms)')
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
nplc = args.nplc
t_settling = args.t_settling
t_track = args.t_track
suns = args.num_of_suns
V_range = np.absolute(V_start)

# Set current measurement range to 10 times SQ limit for 0.5 eV
# bandgap for the given area
I_range = 10 * 0.065 * A

# Assign the VISA resource to a variable
rm = pyvisa.ResourceManager()
keithley2400 = rm.open_resource('GPIB1::24::INSTR')
keithley2400.query('*IDN?')
keithley2400.write('*RST')
keithley2400.encoding = 'latin-1'

# Disable the output
keithley2400.write('OUTP OFF')

# Enable 4-wire sense
keithley2400.write(':SYST:RSEN 1')

# Don't auto-off source after measurement
keithley2400.write(':SOUR:CLE:AUTO OFF')

# Set source mode to voltage
keithley2400.write(':SOUR:FUNC VOLT')

# Set output-off mode to high impedance
keithley2400.write(':OUTP:SMOD HIMP')

# Set the voltage range
keithley2400.write(':SOUR:VOLT:RANG {}'.format(V_range))

# Set the current range
keithley2400.write(':SOUR:CURR:RANG {}'.format(I_range))

# Set the delay
keithley2400.write(':SOUR:DEL {}'.format(t_settling))

# Set the integration filter
keithley2400.write(':SENS:CURR:NPLC {}'.format(nplc))

# Disable autozero
keithley2400.write(':SYST:AZER OFF')


def track_max_power(V_start, t_track):
    """
    Function for tracking the maximum power point of a solar cell starting at
    the seed voltage (V) for a fixed amount of time (t_track), taking
    as many measurements as possible.

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
    keithley2400.write(':SOUR:VOLT 0')
    keithley2400.write('OUTP ON')

    # Start timing
    t_start = time.time()
    t = time.time()

    # Measure Jsc in the dark for 3s
    while t - t_start < 3:
        ts.append(t - t_start)
        data = keithley2400.query(':MEAS:CURR?')  # Measure the current
        data = data.split(',')
        data = [float(item) for item in data]
        Vs.append(data[0])
        Is.append(data[1])
        Js.append(data[1] * 1000 / A)
        Ps.append(data[0] * data[1])
        PCEs.append(np.absolute(data[0] * data[1] * 1000 / (suns * A)))
        t = time.time()

    # Open the shutter of the solar simulator and take a few measurements
    # around the seed voltage to initialise the tracking algorithm.
    keithley2400.write(':SOUR2:TTL 0')  # open the shutter
    for i in range(2):
        ts.append(t - t_start)
        keithley2400.write(':SOUR:VOLT {}'.fortmat(V))
        data = keithley2400.query(':MEAS:CURR?')  # Measure the current
        data = data.split(',')
        data = [float(item) for item in data]
        Vs.append(data[0])
        Is.append(data[1])
        Js.append(data[1] * 1000 / A)
        Ps.append(data[0] * data[1])
        PCEs.append(np.absolute(data[0] * data[1] * 1000 / (suns * A)))
        V += 0.02
        t = time.time()

    # Start tracking the maximum point using method of steepest descent
    i = len(Vs) - 1
    while t - t_start < t_track + 3:
        if Vs[i] != Vs[i - 1]:
            dP_dV = (Ps[i] - Ps[i - 1]) / (Vs[i] - Vs[i - 1])
        else:
            dP_dV = np.sign((1 - (-1)) * np.random.random_sample() +
                            (-1)) * 0.002
        V = Vs[i] - a * dP_dV
        ts.append(t - t_start)
        keithley2400.write(':SOUR:VOLT {}'.format(V))
        data = keithley2400.query(':MEAS:CURR?')  # Measure the current
        data = data.split(',')
        data = [float(item) for item in data]
        Vs.append(data[0])
        Is.append(data[1])
        Js.append(data[1] * 1000 / A)
        Ps.append(data[0] * data[1])
        PCEs.append(np.absolute(data[0] * data[1] * 1000 / (suns * A)))
        t = time.time()
        i += 1

    return ts, Vs, Is, Js, Ps, PCEs


# Turn off display
keithley2400.write(':DISP:ENAB 0')

# Manually reset zero reference values
keithley2400.write(':SYST:AZER ONCE')

# Track max power
mppt_results = track_max_power(V_start, t_track)

# Disable output
keithley2400.write('OUTP OFF')

# Close shutter
keithley2400.write(':SOUR2:TTL 1')

# Turn off display
keithley2400.write(':DISP:ENAB 1')

# Format and save the results
np.savetxt(
    folderpath + filename,
    np.array(mppt_results).T,
    fmt='%.9f',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)\tV\tI (A)\tJ (mA/cm^2)\tP (W)\tPCE (%)',
    comments='')

# Close the visa resource manager
keithley2400.close()