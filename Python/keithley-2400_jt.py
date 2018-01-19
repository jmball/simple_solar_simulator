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
suns = args.num_of_suns
A = args.A
points = int(1 + (np.absolute(V_start - V_stop) / V_step))
V_range = np.max([np.absolute(V_start), np.absolute(V_stop)])

# Make voltage array
V_arr = np.linspace(V_start, V_stop, points)
if dual:
    V_arr_rev = np.flip(V_arr)
    V_arr = np.concatenate(V_arr, V_arr_rev)

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
        # Open the shutter
        keithley2400.write(':SOUR2:TTL 0')

    # Set start voltage and enable output
    keithley2400.write(':SOUR:VOLT {}'.format(V_arr[0]))
    keithley2400.write('OUTP ON')

    # Define global start time
    t_start = time.time()

    for V in V_arr:
        # Set voltage
        keithley2400.write(':SOUR:VOLT {}'.format(V))

        # Reset step timer
        t_step_start = time.time()
        t = time.time()

        # Take readings continuously for t_step
        while t - t_step_start < t_step:
            ts.append(t - t_start)
            data = keithley2400.query(':MEAS:CURR?')  # Measure the current
            data = data.split(',')
            data = [float(item) for item in data]
            Vs.append(data[0])
            Is.append(data[1])
            Js.append(data[1] * 1000 / A)
            t = time.time()

    return ts, Vs, Is, Js


# Turn off display
keithley2400.write(':DISP:ENAB 0')

# Manually reset zero reference values
keithley2400.write(':SYST:AZER ONCE')

# Carry out J-t voltage sweep
jt_data = jt_scan(V_arr, t_step, condition)

# Disable output
keithley2400.write('OUTP OFF')

if condition == 'light':
    # Close shutter
    keithley2400.write(':SOUR2:TTL 1')

# Turn on display
keithley2400.write(':DISP:ENAB 1')

# Convert to numpy array
jt_data_arr = np.array(jt_data).T

# Split scan directions
if V_start < V_stop:
    jt_data_LH = jt_data_arr[:points, :]
    jt_data_HL = jt_data_arr[points - 1:, :]
else:
    jt_data_HL = jt_data_arr[:points, :]
    jt_data_LH = jt_data_arr[points - 1:, :]

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
