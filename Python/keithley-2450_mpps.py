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
nplc = args.nplc
t_settling = args.t_settling
t_track = args.t_track
A = args.A
suns = args.num_of_suns

# Set V_range. Allow values > 2V for tandems with V_mp > 2
if np.absolute(V_start) > 2:
    V_range = np.absolute(V_start)
else:
    V_range = 2

# Set current measurement range to 10 times SQ limit for 0.5 eV
# bandgap for the given area
I_range = 100 * 0.065 * A
if I_range > 1:
    I_range = 1

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

# Set digital I/O line 1 as output, and close shutter
keithley2450.write(':DIG:LINE1:MODE DIG, OUT')
keithley2450.write(':DIG:LINE1:STAT 1')

# Set source function to voltage
keithley2450.write(':SOUR:FUNC VOLT')

# Set output-off mode to high impedance
keithley2450.write(':OUTP:SMOD HIMP')

# Set source readback to on (measure the source voltage when measuring the
# source current)
keithley2450.write(':SOUR:VOLT:READ:BACK ON')

# Set the voltage source range
keithley2450.write(':SOUR:VOLT:RANG {}'.format(V_range))
keithley2450.write(':SOUR:VOLT:ILIM {}'.format(I_range))

# Set settling delay for sourcing voltage
keithley2450.write(':SOUR:VOLT:DEL {}'.format(t_settling))

# Set measurement function to current
keithley2450.write(':SENS:FUNC "CURR"')

# Set current measurement range
keithley2450.write(':SENS:CURR:RANG {}'.format(I_range))

# Set the integration filter
keithley2450.write(':SENS:CURR:NPLC {}'.format(nplc))

# Disable current and voltage autozero
keithley2450.write(':CURR:AZER OFF')
keithley2450.write(':VOLT:AZER OFF')


# Function for tracking maximum power point
def track_max_power(V, t_track):
    """Maximum power point stabilizer.

    Holding at a fixed voltage (V), measure the power output for a fixed
    amount of time (t_track), taking as many measurements as possible.

    Parameters
    ----------
    V : float
        Voltage for the maximum power point stabilizer (V)
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

    # Initialise empty lists for storing data
    ts = []
    Vs = []
    Is = []
    Js = []
    Ps = []
    PCEs = []

    # Turn on the Keithley output at V
    keithley2450.write(':SOUR:VOLT {}'.format(V))
    keithley2450.write('OUTP ON')

    # Start timing
    t_start = time.time()

    # Measure at V in the dark for 3s
    while time.time() - t_start < 3:
        data = keithley2450.query(':MEAS:CURR? "defbuffer1", REL, SOUR, READ')
        data = data.split(',')
        data = [float(item) for item in data]
        ts.append(data[0])
        Vs.append(data[1])
        Is.append(data[2])
        Js.append(data[2] * 1000 / A)
        Ps.append(data[1] * data[2])
        PCEs.append(np.absolute(data[1] * data[2] * 1000 / (suns * A)))

    # Open the shutter of the solar simulator
    keithley2450.write(':DIG:LINE1:STAT 0')

    # Measure at V in the light for t_track
    while time.time() - t_start < t_track + 3:
        data = keithley2450.query(':MEAS:CURR? "defbuffer1", REL, SOUR, READ')
        data = data.split(',')
        data = [float(item) for item in data]
        ts.append(data[0])
        Vs.append(data[1])
        Is.append(data[2])
        Js.append(data[2] * 1000 / A)
        Ps.append(data[1] * data[2])
        PCEs.append(np.absolute(data[1] * data[2] * 1000 / (suns * A)))

    return ts, Vs, Is, Js, Ps, PCEs


# Manually reset zero reference values
keithley2450.write(':AZER:ONCE')

# Track max power
mppt_results = track_max_power(V_start, t_track)

# Disable the output
keithley2450.write('OUTP OFF')

# Close the shutter
keithley2450.write(':DIG:LINE1:STAT 1')

# Clear measurement buffer
keithley2450.write(':TRAC:CLE "defbuffer1"')

# Format and save the results
np.savetxt(
    folderpath + filename,
    np.transpose(np.array(mppt_results)),
    fmt='%.9f',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)\tV\tI (A)\tJ (mA/cm^2)\tP (W)\tPCE (%)',
    comments='')

# Close the visa resource manager
keithley2450.close()
