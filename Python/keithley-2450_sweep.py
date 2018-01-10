import argparse

import numpy as np

import visa

# Parse folder path, file name, and measurement parameters from command line
# arguments. Remember to include the "python" keyword before the call to the
# python file from the command line, e.g. python example.py "arg1" "arg2".
# Folder paths must use forward slashes to separate subfolders.
parser = argparse.ArgumentParser(description='Measure current')
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
parser.add_argument('A', metavar='A', type=float, help='Device area (cm^2)')
parser.add_argument(
    'I_comp', metavar='I_comp', type=float, help='Compliance current (A)')
parser.add_argument(
    'nplc',
    metavar='nplc',
    type=float,
    help='Integration filter in number of power line cycles (NPLC)')
parser.add_argument(
    't_meas', metavar='t_meas', type=float, help='Measurement delay (s)')
parser.add_argument(
    'condition',
    metavar='condition',
    type=float,
    help='Illumination conditions (light or dark)')
args = parser.parse_args()

# Assign argparse arguments to variables
folderpath = args.folder_path
filename = args.file_name
V_start = args.V_start
V_stop = args.V_stop
V_step = args.V_step
A = args.A
I_comp = args.I_comp
nplc = args.nplc
t_meas = args.t_meas
condition = args.condition
points = 1 + ((V_start - V_stop) / V_step)

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

# Set measurement function to current
keithley2450.write(':SOUR:FUNC CURR')

# Enable current measurement autoranging
keithley2450.write(':SENS:CURR:RANG:AUTO ON')

# Set compliance current
keithley2450.write(':SENS:CURR:PROT {}'.format(I_comp))

# Set the integration filter
keithley2450.write(':SENS:CURR:NPLC {}'.format(nplc))

# Disable current and voltage autozero
keithley2450.write(':CURR:AZER OFF')
keithley2450.write(':VOLT:AZER OFF')

# Manually reset current and voltage zero reference values
keithley2450.write(':CURR:AZER:ONCE')
keithley2450.write(':VOLT:AZER:ONCE')

# Create reading buffers
keithley2450.write(':TRAC:MAKE "scan1", {}'.format(points))
keithley2450.write(':TRAC:MAKE "scan2", {}'.format(points))

# Sweep the voltage and measure the current forwards
keithley2450.write(
    ':SOUR:SWE:VOLT:LIN:STE {0}, {1}, {2}, {3}, 1, AUTO, OFF, OFF, "scan1"'.
    format(V_start, V_stop, V_step, t_meas))

# Sweep the voltage and measure the current backwards
keithley2450.write(
    ':SOUR:SWE:VOLT:LIN:STE {0}, {1}, {2}, {3}, 1, AUTO, OFF, OFF, "scan2"'.
    format(V_stop, V_start, V_step, t_meas))

# Open the shutter of the solar simulator if needed
if condition == 'Light':
    keithley2450.write(':DIG:LINE1:STAT 1')

# Enable ouput
keithley2450.write('OUTP ON')

# Initiate the sweep
keithley2450.write(':INIT')

# Close the shutter of the solar simulator if needed
if condition == 'Light':
    keithley2450.write(':DIG:LINE1:STAT 0')

# Disable the output
keithley2450.write('OUTP OFF')

# Read data from buffers
scan1 = keithley2450.query(
    ':TRAC:DATA? 1, {}, "scan1", SEC, SOUR, READ'.format(points))
scan2 = keithley2450.query(
    ':TRAC:DATA? 1, {}, "scan2", SEC, SOUR, READ'.format(points))

# Delete buffers
keithley2450.write(':TRAC:DEL "scan1"')
keithley2450.write(':TRAC:DEL "scan2"')

# Convert buffer data to arrays
scan1_arr = np.array(scan1)
scan2_arr = np.array(scan1)

# Add J data to arrays
scan1_arr[:, 3] = scan1_arr[:, 2] / A
scan2_arr[:, 3] = scan2_arr[:, 2] / A

# Format and save the results
np.savetxt(
    folderpath + filename + "_forward",
    np.transpose(scan1_arr),
    fmt='%.9f',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)' + '\t' + 'V' + '\t' + 'I (A)' + '\t' + 'J (mA/cm^2)',
    comments='')
np.savetxt(
    folderpath + filename + "_backward",
    np.transpose(scan2_arr),
    fmt='%.9f',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)' + '\t' + 'V' + '\t' + 'I (A)' + '\t' + 'J (mA/cm^2)',
    comments='')
