import argparse
import time

import numpy as np
import scipy as sp

import scipy.interpolate
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
parser.add_argument(
    'dual', metavar='dual', type=bool, help='Dual sweep (True or False)?')
parser.add_argument(
    'inverted',
    metavar='inverted',
    type=bool,
    help='Inverted device structure (True or False)?')
parser.add_argument(
    't_meas', metavar='t_meas', type=float, help='Measurement delay (s)')
parser.add_argument(
    'nplc',
    metavar='nplc',
    type=float,
    help='Integration filter in number of power line cycles (NPLC)')
parser.add_argument(
    't_stabilisation',
    metavar='t_stabilisation',
    type=float,
    help='Stabilisation time (s)')
parser.add_argument(
    'stabilisation_mode',
    metavar='stabilisation_mode',
    type=str,
    help='Stabilisation mode (V or I)')
parser.add_argument(
    'stabilisation_level',
    metavar='stabilisation_level',
    type=float,
    help='Stabilisation level (V or A)')
parser.add_argument(
    'condition',
    metavar='condition',
    type=str,
    help='Illumination conditions (light or dark)')
parser.add_argument(
    'dark_stabilisation',
    metavar='dark_stabilisation',
    type=bool,
    help='Stabilisation in the dark (True or False)')
parser.add_argument('A', metavar='A', type=float, help='Device area (cm^2)')
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
dual = args.dual
inverted = args.inverted
t_meas = args.t_meas
nplc = args.nplc
t_stabilisation = args.t_stabilisation
stab_mode = args.stabilisation_mode
stab_level = args.stabilisation_level
condition = args.condition
condition = condition.lower()
dark_stab = args.dark_stabilisation
A = args.A
suns = args.suns
points = int(round(1 + (np.absolute(V_start - V_stop) / V_step)))
V_range = np.max([np.absolute(V_start), np.absolute(V_stop)])

# Calculate total measurement time + 3 ms per point 
t_exp = 2 * points * (t_meas + nplc * 0.02 + 0.003)

# Set current measurement range to 10 times SQ limit for 0.5 eV
# bandgap for the given area
I_range = 100 * 0.065 * A

# Turn off output
keithley2450.write('OUTP OFF')

# Enable 4-wire sense measurement
keithley2450.write(':SYST:RSEN ON')

# Set digital I/O line 1 as output, and close shutter
keithley2450.write(':DIG:LINE1:MODE DIG, OUT')
keithley2450.write(':DIG:LINE1:STAT 1')

# Set the integration filter
keithley2450.write(':SENS:CURR:NPLC {}'.format(nplc))

# Disable current and voltage autozero
keithley2450.write(':CURR:AZER OFF')
keithley2450.write(':VOLT:AZER OFF')


def stabilisation(t_stabilisation, stab_mode, stab_level, dark_stab, condition,
                  area):
    """Stabilise the device before a fixed amount of time.

    Parameters
    ----------
    t_stabilisation : float
        time to stabilise for (s)
    stab_mode : str
        stabilisation mode (V or I)
    stab_level : float
        stabilisation value (V or A)
    dark_stab : bool
        stabilise in the dark? (True or False)
    condition : str
        illumination condition (light or dark)
    area : float
        device area (cm^2)

    Returns
    -------
    ts : array of float
        times (s)
    Vs : array of float
        applied voltages (V)
    Is : array of float
        currents (A)
    Js : array of float
        current densities (mA/cm^2)
    """

    if t_stabilisation == 0:
        return None

    if condition == 'dark':
        if not dark_stab:
            return None

    # Initialise empty lists for storing data
    ts = []
    Vs = []
    Is = []
    Js = []

    # Configure output depending on stabilisation mode
    if stab_mode == 'V':
        keithley2450.write(':SOUR:FUNC VOLT')
        keithley2450.write(':OUTP:SMOD HIMP')
        keithley2450.write(':SOUR:VOLT:READ:BACK ON')
        keithley2450.write(':SOUR:VOLT:RANG {}'.format(V_range))
        keithley2450.write(':SOUR:VOLT:DEL {}'.format(t_meas))
        keithley2450.write(':SENS:FUNC "CURR"')
        keithley2450.write(':SENS:CURR:RANG {}'.format(I_range))
        keithley2450.write(':SOUR:VOLT {}'.format(stab_level))
    elif stab_mode == 'I':
        keithley2450.write(':SOUR:FUNC CURR')
        keithley2450.write(':OUTP:SMOD HIMP')
        keithley2450.write(':SOUR:CURR:READ:BACK ON')
        keithley2450.write(':SOUR:CURR:RANG {}'.format(I_range))
        keithley2450.write(':SOUR:CURR:DEL {}'.format(t_meas))
        keithley2450.write(':SENS:FUNC "VOLT"')
        keithley2450.write(':SENS:VOLT:RANG {}'.format(V_range))
        keithley2450.write(':SOUR:CURR {}'.format(stab_level))

    if condition == 'light':
        # Open the shutter of the solar simulator
        keithley2450.write(':DIG:LINE1:STAT 0')

    # Turn on output
    keithley2450.write('OUTP ON')

    # Reset stabilisation timer
    t_start = time.time()

    # Take readings continuously for t_stabilisation depending on mode
    if stab_mode == 'V':
        while time.time() - t_start < t_stabilisation:
            data = keithley2450.query(
                ':MEAS:CURR? "defbuffer1", REL, SOUR, READ')
            data = data.split(',')
            data = [float(item) for item in data]
            ts.append(data[0])
            Vs.append(data[1])
            Is.append(data[2])
            Js.append(data[2] * 1000 / A)
    elif stab_mode == 'I':
        while time.time() - t_start < t_stabilisation:
            data = keithley2450.query(
                ':MEAS:CURR? "defbuffer1", REL, SOUR, READ')
            data = data.split(',')
            data = [float(item) for item in data]
            ts.append(data[0])
            Is.append(data[1])
            Vs.append(data[2])
            Js.append(data[2] * 1000 / A)

    # Clear measurement buffer
    keithley2450.write(':TRAC:CLE "defbuffer1"')

    return ts, Vs, Is, Js


# Manually reset zero reference values
keithley2450.write(':AZER:ONCE')

# Carry out pre-sweep stabilisation if required
stab_data = stabilisation(t_stabilisation, stab_mode, stab_level, dark_stab,
                          condition, A)

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

# Configure the voltage sweep
keithley2450.write(
    ':SOUR:SWE:VOLT:LIN:STEP {0}, {1}, {2}, {3}, 1, FIXED, OFF, ON, "defbuffer1"'.
    format(V_start, V_stop, V_step, t_meas))

# Open the shutter of the solar simulator if needed
if condition == 'light':
    keithley2450.write(':DIG:LINE1:STAT 0')

# Initiate the sweep and wait until finished
keithley2450.write(':INIT')
keithley2450.write('*WAI')

# Close the shutter of the solar simulator if needed
if condition == 'light':
    keithley2450.write(':DIG:LINE1:STAT 1')

# Format and save stabilisation data
if stab_data is not None:
    np.savetxt(
        (folderpath + filename).replace('.txt', '_stabilisation.txt'),
        np.array(stab_data).T,
        fmt='%.6e',
        delimiter='\t',
        newline='\r\n',
        header='Time (s)\tV\tI (A)\tJ (mA/cm^2)',
        comments='')

# sleep before reading buffer
time.sleep(t_exp)

# Read J-V data from buffer
iv_data = keithley2450.query(
    ':TRAC:DATA? 1, {}, "defbuffer1", REL, SOUR, READ'.format(2 * points - 1))

# Format buffer data
iv_data = iv_data.split(",")
iv_data[len(iv_data) - 1] = iv_data[len(iv_data) - 1].strip("\n")

# Clear measurement buffer
keithley2450.write(':TRAC:CLE "defbuffer1"')

# Convert to numpy array
ts = iv_data[::3]
Vs = iv_data[1::3]
Is = iv_data[2::3]
iv_data_arr = np.array([ts, Vs, Is], dtype=float).T
Js = iv_data_arr[:, 2] / A
iv_data_arr = np.insert(iv_data_arr, iv_data_arr.shape[1], Js, axis=1)

# Split scan directions
if V_start < V_stop:
    iv_data_LH = iv_data_arr[:points, :]
    iv_data_HL = iv_data_arr[points - 1:, :]
else:
    iv_data_HL = iv_data_arr[:points, :]
    iv_data_LH = iv_data_arr[points - 1:, :]

# Illumination intensity, mW/cm^2
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
f_jv_HL = sp.interpolate.interp1d(v_HL, j_HL, 'linear')
f_jv_LH = sp.interpolate.interp1d(v_LH, j_LH, 'linear')
f_vj_HL = sp.interpolate.interp1d(j_HL, v_HL, 'linear')
f_vj_LH = sp.interpolate.interp1d(j_LH, v_LH, 'linear')
f_dpdv_HL = sp.interpolate.interp1d(dpdv_HL, v_HL)
f_dpdv_LH = sp.interpolate.interp1d(dpdv_LH, v_LH)
rate_HL = dv_HL / dt_HL
rate_LH = dv_LH / dt_LH
try:
    jsc_HL = f_jv_HL(0)
except ValueError:
    jsc_HL = 0
try:
    jsc_LH = f_jv_LH(0)
except ValueError:
    jsc_LH = 0
try:
    voc_HL = f_vj_HL(0)
except ValueError:
    voc_HL = 0
try:
    voc_LH = f_vj_LH(0)
except ValueError:
    voc_LH = 0
try:
    vmp_HL = f_dpdv_HL(0)
except ValueError:
    vmp_HL = 0
try:
    vmp_LH = f_dpdv_LH(0)
except ValueError:
    vmp_LH = 0
try:
    jmp_HL = f_jv_HL(vmp_HL)
except ValueError:
    jmp_HL = 0
try:
    jmp_LH = f_jv_LH(vmp_LH)
except:
    jmp_LH = 0
pmax_HL = vmp_HL * jmp_HL
pmax_LH = vmp_LH * jmp_LH
ff_HL = pmax_HL / (voc_HL * jsc_HL)
ff_LH = pmax_LH / (voc_LH * jsc_LH)
pce_HL = pmax_HL * 100 / pin
pce_LH = pmax_LH * 100 / pin

# Generate file paths
path_LH = (folderpath + filename).replace('.txt', '_LH.txt')
path_HL = (folderpath + filename).replace('.txt', '_HL.txt')

# Save results to text files
np.savetxt(
    path_LH,
    iv_data_LH,
    fmt='%.6e',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)\tV\tI (A)\tJ (mA/cm^2)',
    footer=('\r\n'
            'jsc = {} mA/cm^2\r\n'
            'voc = {} V\r\n'
            'ff = {}\r\n'
            'pce = {} %\r\n'
            'vmp = {} V\r\n'
            'jmp = {} mA/cm^2\r\n'
            'pmax = {} mW/cm^2\r\n'
            'scan rate = {} V/s\r\n'
            'area = {} cm^2\r\n'
            'number of suns = {}').format(jsc_LH, voc_LH, ff_LH, pce_LH,
                                            vmp_LH, jmp_LH, pmax_LH, rate_LH,
                                            A, suns),
    comments='')
np.savetxt(
    path_HL,
    iv_data_HL,
    fmt='%.6e',
    delimiter='\t',
    newline='\r\n',
    header='Time (s)\tV\tI (A)\tJ (mA/cm^2)',
    footer=('\r\n'
            'jsc = {} mA/cm^2\r\n'
            'voc = {} V\r\n'
            'ff = {}\r\n'
            'pce = {} %\r\n'
            'vmp = {} V\r\n'
            'jmp = {} mA/cm^2\r\n'
            'pmax = {} mW/cm^2\r\n'
            'scan rate = {} V/s\r\n'
            'area = {} cm^2\r\n'
            'number of suns = {}').format(jsc_HL, voc_HL, ff_HL, pce_HL,
                                            vmp_HL, jmp_HL, pmax_HL, rate_HL,
                                            A, suns),
    comments='')

# Print parameters for log file, grouping first scan direction first
if V_start < V_stop:
    print(jsc_LH, voc_LH, ff_LH, pce_LH, A, stab_level, t_stabilisation,
          t_meas, vmp_LH, rate_LH, path_LH, "LH", jsc_HL, voc_HL, ff_HL,
          pce_HL, A, stab_level, t_stabilisation, t_meas, vmp_HL, rate_HL,
          path_HL, "HL")
else:
    print(jsc_HL, voc_HL, ff_HL, pce_HL, A, stab_level, t_stabilisation,
          t_meas, vmp_HL, rate_HL, path_HL, "HL", jsc_LH, voc_LH, ff_LH,
          pce_LH, A, stab_level, t_stabilisation, t_meas, vmp_LH, rate_LH,
          path_LH, "LH")

# Close the visa resource manager
keithley2450.close()
