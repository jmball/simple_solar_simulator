import argparse

import numpy as np
import scipy as sp

import sp.interpolate
import visa

# Assign the VISA resource to a variable and reset Keithley 2450
rm = visa.ResourceManager()
keithley2450 = rm.open_resource('USB0::0x05E6::0x2450::04049675::INSTR')
keithley2450.query('*IDN?')
keithley2450.write('*RST')
keithley2450.encoding = 'latin-1'

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
    'nplc',
    metavar='nplc',
    type=float,
    help='Integration filter in number of power line cycles (NPLC)')
parser.add_argument(
    't_meas', metavar='t_meas', type=float, help='Measurement delay (s)')
parser.add_argument(
    'condition',
    metavar='condition',
    type=str,
    help='Illumination conditions (light or dark)')
parser.add_argument(
    'suns',
    metavar='suns',
    type=float,
    help='Illumination intensity in equivalent number of suns')
args = parser.parse_args()

# Assign argparse arguments to variables
folderpath = args.folder_path
filename = args.file_name
V_start = args.V_start
V_stop = args.V_stop
V_step = args.V_step
A = args.A
nplc = args.nplc
t_meas = args.t_meas
condition = args.condition
suns = args.suns
points = int(1 + (np.absolute(V_start - V_stop) / V_step))
V_range = np.max([np.absolute(V_start), np.absolute(V_stop)])

# Set current measurement range to 10 times SQ limit for 0.5 eV
# bandgap for the given area
I_range = 10 * 0.065 * A

# Turn off output
keithley2450.write('OUTP OFF')

# Enable 4-wire sense measurement
keithley2450.write(':SYST:RSEN ON')

# Set digital I/O line 1 as a digital output line
keithley2450.write(':DIG:LINE1:MODE DIG, OUT')

# Set source function to voltage
keithley2450.write(':SOUR:FUNC VOLT')

# Set source readback to on (measure the source voltage when measuring the
# source current)
keithley2450.write(':SOUR:VOLT:READ:BACK ON')

# Set the voltage source range
keithley2450.write(':SOUR:VOLT:RANG {}'.format(V_range))

# Set measurement function to current
keithley2450.write(':SENS:FUNC "CURR"')

# Set current measurement range
keithley2450.write(':SENS:CURR:RANG {}'.format(I_range))

# Set the integration filter
keithley2450.write(':SENS:CURR:NPLC {}'.format(nplc))

# Disable current and voltage autozero
keithley2450.write(':CURR:AZER OFF')
keithley2450.write(':VOLT:AZER OFF')

# Manually reset zero reference values
keithley2450.write(':AZER:ONCE')

# Configure the voltage sweep
keithley2450.write(
    ':SOUR:SWE:VOLT:LIN:STEP {0}, {1}, {2}, {3}, 1, FIXED, OFF, ON, "defbuffer1"'.
    format(V_start, V_stop, V_step, t_meas))

# Open the shutter of the solar simulator if needed
if condition == 'light':
    keithley2450.write(':DIG:LINE1:STAT 1')

# Initiate the sweep and wait until finished
keithley2450.write(':INIT')
keithley2450.write('*WAI')

# Close the shutter of the solar simulator if needed
if condition == 'light':
    keithley2450.write(':DIG:LINE1:STAT 0')

# Read data from buffer
iv_data = keithley2450.query(
    ':TRAC:DATA? 1, {}, "defbuffer1", REL, SOUR, READ'.format(2 * points - 1))

# Format buffer data
iv_data = iv_data.split(",")
iv_data[len(iv_data) - 1] = iv_data[len(iv_data) - 1].strip("\n")

# Convert to numpy arrays
t = np.array(iv_data[::3], dtype='float')
v = np.array(iv_data[1::3], dtype='float')
i = np.array(iv_data[2::3], dtype='float')
j = i / A
iv_data_arr = np.stack((t, v, i, j), axis=1)

# Split scan directions
if V_start < V_stop:
    iv_data_LH = iv_data_arr[:points, :]
    iv_data_HL = iv_data_arr[points - 1:, :]
else:
    iv_data_HL = iv_data_arr[:points, :]
    iv_data_LH = iv_data_arr[points - 1:, :]

# Illumination intensity, mW / cm^2
pin = 100 * suns

# Calculate J-V metrics
dt_HL = np.mean(np.diff(iv_data_HL[:, 0]))
dt_LH = np.mean(np.diff(iv_data_LH[:, 0]))
v_HL = iv_data_HL[:, 1]
v_LH = iv_data_LH[:, 1]
dv_HL = np.absolute(np.mean(np.diff(v_HL)))
dv_LH = np.absolute(np.mean(np.diff(v_LH)))
j_HL = iv_data_HL[:, 3]
j_LH = iv_data_LH[:, 3]
p_HL = v_HL * j_HL
p_LH = v_LH * j_LH
dpdv_HL = np.gradient(p_HL, dv_HL)
dpdv_LH = np.gradient(p_LH, dv_LH)
f_jv_HL = sp.interpolate.interp1d(v_HL, j_HL, 'cubic')
f_jv_LH = sp.interpolate.interp1d(v_LH, j_LH, 'cubic')
f_vj_HL = sp.interpolate.interp1d(j_HL, v_HL, 'cubic')
f_vj_LH = sp.interpolate.interp1d(j_LH, v_LH, 'cubic')
f_dpdv_HL = sp.interpolate.interp1d(dpdv_HL, v_HL)
f_dpdv_LH = sp.interpolate.interp1d(dpdv_LH, v_LH)
rate_HL = dv_HL / dt_HL
rate_LH = dv_LH / dt_LH
jsc_HL = f_jv_HL(0)
jsc_LH = f_jv_LH(0)
voc_HL = f_vj_HL(0)
voc_LH = f_vj_LH(0)
vmp_HL = f_dpdv_HL(0)
vmp_LH = f_dpdv_LH(0)
jmp_HL = f_jv_HL(vmp_HL)
jmp_LH = f_jv_LH(vmp_LH)
pmax_HL = vmp_HL * jmp_HL
pmax_LH = vmp_LH * jmp_LH
ff_HL = pmax_HL / (voc_HL * jsc_HL)
ff_LH = pmax_LH / (voc_LH * jsc_LH)
pce_HL = pmax_HL * 100 / pin
pce_LH = pmax_LH * 100 / pin

# Save results to text files
np.savetxt(
    (folderpath + filename).replace('.txt', '_LH.txt'),
    iv_data_LH,
    fmt='%.6e',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)\tV\tI (A)\tJ (mA/cm^2)',
    footer=('\r\n'
            'jsc = {0} mA/cm^2\r\n'
            'voc = {1} V\r\n'
            'ff = {2}\r\n'
            'pce = {4} %\r\n'
            'vmp = {5} V\r\n'
            'jmp = {6} mA/cm^2\r\n'
            'pmax = {7} mW/cm^2\r\n'
            'scan rate = {8} V/s\r\n'
            'area = {9} cm^2\r\n'
            'number of suns = {10}').format(jsc_LH, voc_LH, ff_LH, pce_LH,
                                            vmp_LH, jmp_LH, pmax_LH, rate_LH,
                                            A, suns),
    comments='')
np.savetxt(
    (folderpath + filename).replace('.txt', '_HL.txt'),
    iv_data_HL,
    fmt='%.6e',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)\tV\tI (A)\tJ (mA/cm^2)',
    footer=('\r\n'
            'jsc = {0} mA/cm^2\r\n'
            'voc = {1} V\r\n'
            'ff = {2}\r\n'
            'pce = {4} %\r\n'
            'vmp = {5} V\r\n'
            'jmp = {6} mA/cm^2\r\n'
            'pmax = {7} mW/cm^2\r\n'
            'scan rate = {8} V/s\r\n'
            'area = {9} cm^2\r\n'
            'number of suns = {10}').format(jsc_LH, voc_LH, ff_LH, pce_LH,
                                            vmp_LH, jmp_LH, pmax_LH, rate_LH,
                                            A, suns),
    comments='')
