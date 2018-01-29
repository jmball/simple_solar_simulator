import visa

# Assign the VISA resource to a variable and reset Keithley 2450
rm = visa.ResourceManager()
keithley2450 = rm.open_resource('USB0::0x05E6::0x2450::04049675::INSTR')
print(keithley2450.query('*IDN?'))
keithley2450.write('*RST')
keithley2450.encoding = 'latin-1'

# Close the visa resource manager
keithley2450.close()
