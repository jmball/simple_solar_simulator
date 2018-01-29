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
    'V_start', metavar='V_start', type=float, help='Start voltage (V)')
parser.add_argument(
    'V_stop', metavar='V_stop', type=float, help='Stop voltage (V)')
parser.add_argument(
    'V_step', metavar='V_step', type=float, help='Step voltage (V)')
parser.add_argument(
    't_step',
    metavar='t_step',
    type=float,
    help='Time to hold for each voltage (s)')
parser.add_argument(
    'dual', metavar='dual', type=bool, help='Dual sweep (True or False)?')
parser.add_argument(
    'inverted',
    metavar='inverted',
    type=bool,
    help='Inverted device structure (True or False)?')
parser.add_argument(
    't_settling', metavar='t_settling', type=float, help='Settling delay (ms)')
parser.add_argument(
    'nplc',
    metavar='nplc',
    type=float,
    help='Integration filter in number of power line cycles (NPLC)')
parser.add_argument(
    'condition',
    metavar='condition',
    type=str,
    help='Illumination conditions (light or dark)')
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
V_stop = args.V_stop
V_step = args.V_step
t_step = args.t_step
dual = args.dual
inverted = args.inverted
t_settling = args.t_settling
nplc = args.nplc
condition = args.condition
condition = condition.lower()
suns = args.num_of_suns
A = args.A
points = int(round(1 + (np.absolute(V_start - V_stop) / V_step)))
V_range = np.max([np.absolute(V_start), np.absolute(V_stop)])

# Make voltage array
V_arr = np.linspace(V_start, V_stop, points)
if dual:
    V_arr_rev = np.flip(V_arr, axis=0)
    V_arr = np.concatenate((V_arr, V_arr_rev))

# Set current measurement range to 10 times SQ limit for 0.5 eV
# bandgap for the given area
I_range = 100 * 0.065 * A

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


def jt_scan(V_arr, t_step, condition):
    """Measure current as a function of time for a voltage sweep.

    Parameters
    ----------
    V_arr : array of float
        Voltages to stabilise at
    t_step : float
        Time to hold each voltage at (s)
    condition : str
        Illumination condition (light or dark)

    Returns
    -------
    ts : list of float
        Timestamps for every measurement (UTC)
    Vs : list of float
        Measured Vs (V)
    Is : list of float
        Measured Is (A)
    Js : list of float
        Current densities (mA / cm^2)
    """

    # Initialise empty lists for storing data
    ts = []
    Vs = []
    Is = []
    Js = []

    if condition == 'light':
        # Open the shutter of the solar simulator
        keithley2450.write(':DIG:LINE1:STAT 0')

    # Turn on the Keithley output at zero volts
    keithley2450.write(':SOUR:VOLT {}'.format(V_arr[0]))
    keithley2450.write('OUTP ON')

    for V in V_arr:
        # Set voltage
        keithley2450.write(':SOUR:VOLT {}'.format(V))

        # Reset step timer
        t_step_start = time.time()

        # Take readings continuously for t_step
        while time.time() - t_step_start < t_step:
            data = keithley2450.query(
                ':MEAS:CURR? "defbuffer1", REL, SOUR, READ')
            data = data.split(',')
            data = [float(item) for item in data]
            ts.append(data[0])
            Vs.append(data[1])
            Is.append(data[2])
            Js.append(data[2] * 1000 / A)

    return ts, Vs, Is, Js


# Manually reset zero reference values
keithley2450.write(':AZER:ONCE')

# Track max power
jt_data = jt_scan(V_arr, t_step, condition)

# Disable the output
keithley2450.write('OUTP OFF')

if condition == 'light':
    # Close the shutter
    keithley2450.write(':DIG:LINE1:STAT 1')

# Clear measurement buffer
keithley2450.write(':TRAC:CLE "defbuffer1"')

# Convert to numpy array
jt_data_arr = np.array(jt_data).T

half_len = int(round((len(jt_data_arr[:,0]) / 2)))

# Split scan directions
if V_start < V_stop:
    jt_data_LH = jt_data_arr[:half_len, :]
    jt_data_HL = jt_data_arr[half_len - 1:, :]
else:
    jt_data_HL = jt_data_arr[:half_len, :]
    jt_data_LH = jt_data_arr[half_len - 1:, :]

# Format and save the results
np.savetxt(
    (folderpath + filename).replace('.txt', '_LH.txt'),
    jt_data_LH,
    fmt='%.6e',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)\tV\tI (A)\tJ (mA/cm^2)',
    comments='')

np.savetxt(
    (folderpath + filename).replace('.txt', '_HL.txt'),
    jt_data_HL,
    fmt='%.6e',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)\tV\tI (A)\tJ (mA/cm^2)',
    comments='')

# Close the visa resource manager
keithley2450.close()
