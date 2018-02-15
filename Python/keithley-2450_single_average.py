import argparse
import time

import visa

# Parse folder path, file name, and measurement parameters from command line
# arguments. Remember to include the "python" keyword before the call to the
# python file from the command line, e.g. python example.py "arg1" "arg2".
# Folder paths must use forward slashes to separate subfolders.
parser = argparse.ArgumentParser(description='Measure current')
parser.add_argument('V', metavar='V', type=float, help='Applied voltage (V)')
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

# Assign argparse arguments to variables
V = args.V
I_comp = args.I_comp
nplc = args.nplc
t_settling = args.t_settling

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

# Enable voltage source autoranging
keithley2450.write(':SOUR:VOLT:RANG:AUTO ON')
keithley2450.write(':SOUR:VOLT:ILIM {}'.format(I_comp))

# Set settling delay for sourcing voltage
keithley2450.write(':SOUR:VOLT:DEL {}'.format(t_settling))

# Set measurement function to current
keithley2450.write(':SENS:FUNC "CURR"')

# Enable current measurement autoranging
keithley2450.write(':SENS:CURR:RANG:AUTO ON')

# Set compliance current
keithley2450.write(':SENS:CURR:RANG {}'.format(I_comp))

# Set the integration filter
keithley2450.write(':SENS:CURR:NPLC {}'.format(nplc))

# Initialise empty list for storing current densities
Is = []

# Open the shutter of the solar simulator
keithley2450.write(':DIG:LINE1:STAT 0')

# Set voltage and enable ouput
keithley2450.write(':SOUR:VOLT {}'.format(V))
keithley2450.write('OUTP ON')

# Start timing
t_start = time.time()

# Measure current for 2 seconds
while time.time() - t_start < 2:
    I = float(keithley2450.query(':MEAS:CURR? "defbuffer1", READ'))
    Is.append(I)

# Disable the output
keithley2450.write('OUTP OFF')

# Close the shutter
keithley2450.write(':DIG:LINE1:STAT 1')

# Clear measurement buffer
keithley2450.write(':TRAC:CLE "defbuffer1"')

# Calculate and print average current density
print(sum(Is) / len(Is))

# Close the visa resource manager
keithley2450.close()
