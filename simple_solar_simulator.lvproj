<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="16008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="add_light-dark_j-t_measurements_to_queue.vi" Type="VI" URL="../SubVIs/add_light-dark_j-t_measurements_to_queue.vi"/>
		<Item Name="add_light-dark_measurements_to_queue.vi" Type="VI" URL="../SubVIs/add_light-dark_measurements_to_queue.vi"/>
		<Item Name="add_max_p_measurement_to_queue.vi" Type="VI" URL="../SubVIs/add_max_p_measurement_to_queue.vi"/>
		<Item Name="add_mppt_data_to_log.vi" Type="VI" URL="../SubVIs/add_mppt_data_to_log.vi"/>
		<Item Name="add_repeat_measurements_to_queue.vi" Type="VI" URL="../SubVIs/add_repeat_measurements_to_queue.vi"/>
		<Item Name="build_meas_status_string.vi" Type="VI" URL="../SubVIs/build_meas_status_string.vi"/>
		<Item Name="build_queue.vi" Type="VI" URL="../SubVIs/build_queue.vi"/>
		<Item Name="calculate_scan_rate.vi" Type="VI" URL="../SubVIs/calculate_scan_rate.vi"/>
		<Item Name="check_keithley_is_connected.vi" Type="VI" URL="../SubVIs/check_keithley_is_connected.vi"/>
		<Item Name="check_mux_is_connected.vi" Type="VI" URL="../SubVIs/check_mux_is_connected.vi"/>
		<Item Name="create_data_folders.vi" Type="VI" URL="../SubVIs/create_data_folders.vi"/>
		<Item Name="create_date_array.vi" Type="VI" URL="../SubVIs/create_date_array.vi"/>
		<Item Name="create_j-t_folder.vi" Type="VI" URL="../SubVIs/create_j-t_folder.vi"/>
		<Item Name="create_max_power_folder.vi" Type="VI" URL="../SubVIs/create_max_power_folder.vi"/>
		<Item Name="data_to_plot.vi" Type="VI" URL="../SubVIs/data_to_plot.vi"/>
		<Item Name="delete_scan_settings.vi" Type="VI" URL="../SubVIs/delete_scan_settings.vi"/>
		<Item Name="find_best_pixel_from_log.vi" Type="VI" URL="../SubVIs/find_best_pixel_from_log.vi"/>
		<Item Name="find_v-mp_from_log.vi" Type="VI" URL="../SubVIs/find_v-mp_from_log.vi"/>
		<Item Name="Generate report control.ctl" Type="VI" URL="../SubVIs/Generate report control.ctl"/>
		<Item Name="generate_voltage_lists.vi" Type="VI" URL="../SubVIs/generate_voltage_lists.vi"/>
		<Item Name="get_mux_pin.vi" Type="VI" URL="../SubVIs/get_mux_pin.vi"/>
		<Item Name="j-t_data_to_plot.vi" Type="VI" URL="../SubVIs/j-t_data_to_plot.vi"/>
		<Item Name="JV Data analysis from master log file.vi" Type="VI" URL="../SubVIs/JV Data analysis from master log file.vi"/>
		<Item Name="Keithley 24XX.lvlib" Type="Library" URL="/&lt;instrlib&gt;/Keithley 24XX/Keithley 24XX.lvlib"/>
		<Item Name="keithley-2400_j-t_list.vi" Type="VI" URL="../SubVIs/keithley-2400_j-t_list.vi"/>
		<Item Name="keithley-2400_max_p_list.vi" Type="VI" URL="../SubVIs/keithley-2400_max_p_list.vi"/>
		<Item Name="keithley-2400_sweep.vi" Type="VI" URL="../SubVIs/keithley-2400_sweep.vi"/>
		<Item Name="keithley-2450_j-t_list.vi" Type="VI" URL="../SubVIs/keithley-2450_j-t_list.vi"/>
		<Item Name="keithley-2450_max_p_list.vi" Type="VI" URL="../SubVIs/keithley-2450_max_p_list.vi"/>
		<Item Name="keithley-2450_sweep.vi" Type="VI" URL="../SubVIs/keithley-2450_sweep.vi"/>
		<Item Name="Lamp_power_control.vi" Type="VI" URL="../../J-V Measurement/Prelim/Lamp_power_control.vi"/>
		<Item Name="load_saved_scan_settings.vi" Type="VI" URL="../SubVIs/load_saved_scan_settings.vi"/>
		<Item Name="log_file_to_display_data.vi" Type="VI" URL="../SubVIs/log_file_to_display_data.vi"/>
		<Item Name="Login_dialog.vi" Type="VI" URL="../SubVIs/Login_dialog.vi"/>
		<Item Name="main.vi" Type="VI" URL="../main.vi"/>
		<Item Name="max_power_data_to_plot.vi" Type="VI" URL="../SubVIs/max_power_data_to_plot.vi"/>
		<Item Name="measure_current_keithley-2400.vi" Type="VI" URL="../SubVIs/measure_current_keithley-2400.vi"/>
		<Item Name="measure_current_keithley-2450.vi" Type="VI" URL="../SubVIs/measure_current_keithley-2450.vi"/>
		<Item Name="measure_j-t_keithley-2400.vi" Type="VI" URL="../SubVIs/measure_j-t_keithley-2400.vi"/>
		<Item Name="measure_j-t_keithley-2450.vi" Type="VI" URL="../SubVIs/measure_j-t_keithley-2450.vi"/>
		<Item Name="measure_j-v_keithley-2400.vi" Type="VI" URL="../SubVIs/measure_j-v_keithley-2400.vi"/>
		<Item Name="measure_j-v_keithley-2450.vi" Type="VI" URL="../SubVIs/measure_j-v_keithley-2450.vi"/>
		<Item Name="measure_max_power_stabilisation_keithley-2400.vi" Type="VI" URL="../SubVIs/measure_max_power_stabilisation_keithley-2400.vi"/>
		<Item Name="measure_max_power_stabilisation_keithley-2450.vi" Type="VI" URL="../SubVIs/measure_max_power_stabilisation_keithley-2450.vi"/>
		<Item Name="nplc_for_j-v_scan.ctl" Type="VI" URL="../TypeDefs/nplc_for_j-v_scan.ctl"/>
		<Item Name="remove_duplicates_by_column.vi" Type="VI" URL="../SubVIs/remove_duplicates_by_column.vi"/>
		<Item Name="save_data.vi" Type="VI" URL="../SubVIs/save_data.vi"/>
		<Item Name="save_device_details.vi" Type="VI" URL="../SubVIs/save_device_details.vi"/>
		<Item Name="save_j-t_data.vi" Type="VI" URL="../SubVIs/save_j-t_data.vi"/>
		<Item Name="save_max_p_Data.vi" Type="VI" URL="../SubVIs/save_max_p_Data.vi"/>
		<Item Name="save_scan_settings.vi" Type="VI" URL="../SubVIs/save_scan_settings.vi"/>
		<Item Name="scan_settings.ctl" Type="VI" URL="../TypeDefs/scan_settings.ctl"/>
		<Item Name="Send_lamp_power_supply_command.vi" Type="VI" URL="../SubVIs/Send_lamp_power_supply_command.vi"/>
		<Item Name="Settings Boolean.ctl" Type="VI" URL="../TypeDefs/Settings Boolean.ctl"/>
		<Item Name="sort_2d_cell_details_array.vi" Type="VI" URL="../SubVIs/sort_2d_cell_details_array.vi"/>
		<Item Name="sort_scan_settings.vi" Type="VI" URL="../SubVIs/sort_scan_settings.vi"/>
		<Item Name="State Enumerate Ring.ctl" Type="VI" URL="../TypeDefs/State Enumerate Ring.ctl"/>
		<Item Name="time_left_calculator.vi" Type="VI" URL="../SubVIs/time_left_calculator.vi"/>
		<Item Name="timing_calculator.vi" Type="VI" URL="../SubVIs/timing_calculator.vi"/>
		<Item Name="Update Meas Type to Best J-t Scan.vi" Type="VI" URL="../SubVIs/Update Meas Type to Best J-t Scan.vi"/>
		<Item Name="Update Meas Type to Best MaxPowStab.vi" Type="VI" URL="../SubVIs/Update Meas Type to Best MaxPowStab.vi"/>
		<Item Name="Update Meas Type to J-t Scan.vi" Type="VI" URL="../SubVIs/Update Meas Type to J-t Scan.vi"/>
		<Item Name="Update Meas Type to JV Scan.vi" Type="VI" URL="../SubVIs/Update Meas Type to JV Scan.vi"/>
		<Item Name="Update Meas Type to MaxPowStab.vi" Type="VI" URL="../SubVIs/Update Meas Type to MaxPowStab.vi"/>
		<Item Name="Update Meas Type to Repeat JV Scan for best.vi" Type="VI" URL="../SubVIs/Update Meas Type to Repeat JV Scan for best.vi"/>
		<Item Name="upload_details_from_spreadsheet.vi" Type="VI" URL="../SubVIs/upload_details_from_spreadsheet.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="Keithley 2450.lvlib" Type="Library" URL="/&lt;instrlib&gt;/Keithley 2450/Keithley 2450.lvlib"/>
				<Item Name="QuickMux Error Handler.vi" Type="VI" URL="/&lt;instrlib&gt;/QuickMux/QuickMux Error Handler.vi"/>
				<Item Name="QuickMux.lvlib" Type="Library" URL="/&lt;instrlib&gt;/QuickMux/QuickMux.lvlib"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check Color Table Size.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Color Table Size.vi"/>
				<Item Name="Check Data Size.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Data Size.vi"/>
				<Item Name="Check File Permissions.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check File Permissions.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Path.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Path.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Directory of Top Level VI.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Directory of Top Level VI.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="FormatTime String.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/FormatTime String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="List Directory and LLBs.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/List Directory and LLBs.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Read Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Read Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet (I64).vi"/>
				<Item Name="Read Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet (string).vi"/>
				<Item Name="Read Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Read From Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (DBL).vi"/>
				<Item Name="Read From Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (I64).vi"/>
				<Item Name="Read From Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (string).vi"/>
				<Item Name="Read From Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File.vi"/>
				<Item Name="Read Lines From File (with error IO).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File (with error IO).vi"/>
				<Item Name="Read Lines From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File.vi"/>
				<Item Name="Recursive File List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Recursive File List.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="subElapsedTime.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/subElapsedTime.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Write Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (I64).vi"/>
				<Item Name="Write Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (string).vi"/>
				<Item Name="Write Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet.vi"/>
				<Item Name="Write JPEG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Write JPEG File.vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
				<Item Name="Write To Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (DBL).vi"/>
				<Item Name="Write To Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (I64).vi"/>
				<Item Name="Write To Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (string).vi"/>
				<Item Name="Write To Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File.vi"/>
			</Item>
			<Item Name="Add dark EQE measurement to queue.vi" Type="VI" URL="../SubVIs/Add dark EQE measurement to queue.vi"/>
			<Item Name="check_keithley-2400_is_connected.vi" Type="VI" URL="../SubVIs/check_keithley-2400_is_connected.vi"/>
			<Item Name="check_keithley-2450_is_connected.vi" Type="VI" URL="../SubVIs/check_keithley-2450_is_connected.vi"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="measure_current_keithley-2450_python.vi" Type="VI" URL="../SubVIs/measure_current_keithley-2450_python.vi"/>
			<Item Name="mppt_keithley-2400_python.vi" Type="VI" URL="../SubVIs/mppt_keithley-2400_python.vi"/>
			<Item Name="mppt_keithley-2450_python.vi" Type="VI" URL="../SubVIs/mppt_keithley-2450_python.vi"/>
			<Item Name="QuickMuxAMD64.dll" Type="Document" URL="/C/Program Files (x86)/Bitwise Systems/QuickMux/Drivers/v1.0.0/amd64/QuickMuxAMD64.dll"/>
			<Item Name="QuickMuxAMD64.dll" Type="Document" URL="/C/Program Files/Bitwise Systems/QuickMux/Drivers/v1.0.0/amd64/QuickMuxAMD64.dll"/>
			<Item Name="set_multiplexor.vi" Type="VI" URL="../SubVIs/set_multiplexor.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Automated PV Measurement" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{F52AF132-3EF5-4D47-891B-7683AD0EFAB7}</Property>
				<Property Name="App_INI_GUID" Type="Str">{371BE36C-DA84-4831-8722-351A6426FAD3}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{3D0434C3-655D-4307-995F-6691C099E444}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated PV Measurement</Property>
				<Property Name="Bld_compilerOptLevel" Type="Int">0</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Automated PV Measurement</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{65218141-FB31-4B09-A2F6-E5C08397FD8D}</Property>
				<Property Name="Bld_version.major" Type="Int">2</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated PV Measurement_v2.0.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated PV Measurement/Automated PV Measurement_v2.0.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated PV Measurement/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{C99FC351-ECED-4B43-90C1-3B81C958B188}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/main.vi</Property>
				<Property Name="Source[1].properties[0].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[1].properties[0].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[1].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[1].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[10].type" Type="Str">Allow debugging</Property>
				<Property Name="Source[1].properties[10].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[11].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[1].properties[11].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[12].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[1].properties[12].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[2].type" Type="Str">Show vertical scroll bar</Property>
				<Property Name="Source[1].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[3].type" Type="Str">Show horizontal scroll bar</Property>
				<Property Name="Source[1].properties[3].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[4].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[1].properties[4].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[5].type" Type="Str">Show Abort button</Property>
				<Property Name="Source[1].properties[5].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[6].type" Type="Str">Show fp when called</Property>
				<Property Name="Source[1].properties[6].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[7].type" Type="Str">Window behavior</Property>
				<Property Name="Source[1].properties[7].value" Type="Str">Modal</Property>
				<Property Name="Source[1].properties[8].type" Type="Str">Allow user to close window</Property>
				<Property Name="Source[1].properties[8].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[9].type" Type="Str">Window run-time position</Property>
				<Property Name="Source[1].properties[9].value" Type="Str">Maximized</Property>
				<Property Name="Source[1].propertiesCount" Type="Int">13</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].itemID" Type="Ref"></Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Show vertical scroll bar</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[1].type" Type="Str">Show horizontal scroll bar</Property>
				<Property Name="Source[2].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[10].type" Type="Str">Show fp when called</Property>
				<Property Name="Source[2].properties[10].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[11].type" Type="Str">Window behavior</Property>
				<Property Name="Source[2].properties[11].value" Type="Str">Default</Property>
				<Property Name="Source[2].properties[12].type" Type="Str">Allow user to close window</Property>
				<Property Name="Source[2].properties[12].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[13].type" Type="Str">Allow debugging</Property>
				<Property Name="Source[2].properties[13].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[2].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[2].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[3].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[2].properties[3].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[4].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[4].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[5].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[2].properties[5].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[6].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[2].properties[6].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[7].type" Type="Str">Show Abort button</Property>
				<Property Name="Source[2].properties[7].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[8].type" Type="Str">Window run-time position</Property>
				<Property Name="Source[2].properties[8].value" Type="Str">Maximized</Property>
				<Property Name="Source[2].properties[9].type" Type="Str">Run when opened</Property>
				<Property Name="Source[2].properties[9].value" Type="Bool">true</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">14</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2016 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{1554B717-9B6C-4835-B385-35C66BDF09D2}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated PV Measurement_v2.0.exe</Property>
			</Item>
			<Item Name="Automated PV Measurement v2.1.8" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{05D4B823-5183-494D-A4B6-4194B1A3FBD5}</Property>
				<Property Name="App_INI_GUID" Type="Str">{83079F92-76F1-4213-8422-CD470FEE9F49}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{B0D3DA73-393F-4BEC-B4E4-932AF229A9C4}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated PV Measurement v2.1.8</Property>
				<Property Name="Bld_compilerOptLevel" Type="Int">0</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../Automated_PV_Measurement/builds/Automated PV Measurement v2.1.8</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{CE5D3E30-9F6B-4248-BD9A-2F8A1285AFCC}</Property>
				<Property Name="Bld_version.major" Type="Int">2</Property>
				<Property Name="Bld_version.minor" Type="Int">1</Property>
				<Property Name="Bld_version.patch" Type="Int">8</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated PV Measurement v2.1.8.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../Automated_PV_Measurement/builds/Automated PV Measurement v2.1.8/Automated PV Measurement v2.1.8.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../Automated_PV_Measurement/builds/Automated PV Measurement v2.1.8/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{9A20BFBD-E37E-4235-BDC2-BC5FA8AA6779}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/main.vi</Property>
				<Property Name="Source[1].properties[0].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[1].properties[0].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[1].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[1].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[10].type" Type="Str">Allow debugging</Property>
				<Property Name="Source[1].properties[10].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[11].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[1].properties[11].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[12].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[1].properties[12].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[2].type" Type="Str">Show vertical scroll bar</Property>
				<Property Name="Source[1].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[3].type" Type="Str">Show horizontal scroll bar</Property>
				<Property Name="Source[1].properties[3].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[4].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[1].properties[4].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[5].type" Type="Str">Show Abort button</Property>
				<Property Name="Source[1].properties[5].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[6].type" Type="Str">Show fp when called</Property>
				<Property Name="Source[1].properties[6].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[7].type" Type="Str">Window behavior</Property>
				<Property Name="Source[1].properties[7].value" Type="Str">Modal</Property>
				<Property Name="Source[1].properties[8].type" Type="Str">Allow user to close window</Property>
				<Property Name="Source[1].properties[8].value" Type="Bool">true</Property>
				<Property Name="Source[1].properties[9].type" Type="Str">Window run-time position</Property>
				<Property Name="Source[1].properties[9].value" Type="Str">Maximized</Property>
				<Property Name="Source[1].propertiesCount" Type="Int">13</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].itemID" Type="Ref"></Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Show vertical scroll bar</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[1].type" Type="Str">Show horizontal scroll bar</Property>
				<Property Name="Source[2].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[10].type" Type="Str">Show fp when called</Property>
				<Property Name="Source[2].properties[10].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[11].type" Type="Str">Window behavior</Property>
				<Property Name="Source[2].properties[11].value" Type="Str">Default</Property>
				<Property Name="Source[2].properties[12].type" Type="Str">Allow user to close window</Property>
				<Property Name="Source[2].properties[12].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[13].type" Type="Str">Allow debugging</Property>
				<Property Name="Source[2].properties[13].value" Type="Bool">true</Property>
				<Property Name="Source[2].properties[2].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[2].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[3].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[2].properties[3].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[4].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[4].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[5].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[2].properties[5].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[6].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[2].properties[6].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[7].type" Type="Str">Show Abort button</Property>
				<Property Name="Source[2].properties[7].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[8].type" Type="Str">Window run-time position</Property>
				<Property Name="Source[2].properties[8].value" Type="Str">Maximized</Property>
				<Property Name="Source[2].properties[9].type" Type="Str">Run when opened</Property>
				<Property Name="Source[2].properties[9].value" Type="Bool">true</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">14</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2016 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated PV Measurement</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{DE62D59D-FAD5-4EBB-9D75-1653E941F304}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated PV Measurement v2.1.8.exe</Property>
			</Item>
			<Item Name="Automated Solar Sim" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{B8150494-913C-4D51-885F-D3483375CF1B}</Property>
				<Property Name="App_INI_GUID" Type="Str">{43C1B416-7713-41D8-8AFC-3FBE413564A6}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{8489497E-5325-49D3-9CA3-B3E37E31F930}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated Solar Sim</Property>
				<Property Name="Bld_compilerOptLevel" Type="Int">0</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{75D126E7-439B-43E0-8F8B-7363456712BB}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated Solar Sim.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim/Automated Solar Sim.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{27926DCE-D054-44FC-A30D-3F41E082CC28}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/main.vi</Property>
				<Property Name="Source[1].properties[0].type" Type="Str">Show menu bar</Property>
				<Property Name="Source[1].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[1].type" Type="Str">Window has title bar</Property>
				<Property Name="Source[1].properties[1].value" Type="Bool">false</Property>
				<Property Name="Source[1].properties[2].type" Type="Str">Show toolbar</Property>
				<Property Name="Source[1].properties[2].value" Type="Bool">false</Property>
				<Property Name="Source[1].propertiesCount" Type="Int">3</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated Solar Sim</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated Solar Sim</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2015 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated Solar Sim</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{A031AABF-B034-46B0-9368-66B5EBBC29FA}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated Solar Sim.exe</Property>
			</Item>
			<Item Name="Automated Solar Sim 1.1" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{AD8A8572-438C-46E7-AF4E-B765CAE84F26}</Property>
				<Property Name="App_INI_GUID" Type="Str">{3CD989B2-CBB8-4682-A7F3-BB5F44EB359E}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{2B3E0964-0582-467E-84D8-5C2A2E7808E9}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated Solar Sim 1.1</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.1</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{A6124AE2-E8E0-488B-9165-52ACF237962F}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Bld_version.minor" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated Solar Sim 1.1.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.1/Automated Solar Sim 1.1.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.1/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{3BD19F4B-D097-457A-BE5C-8588C86098B4}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/main.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated Solar Sim 1.1</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated Solar Sim 1.1</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2015 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated Solar Sim 1.1</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{C13F47FD-8B8F-4318-8F1F-30A0097665BD}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated Solar Sim 1.1.exe</Property>
			</Item>
			<Item Name="Automated Solar Sim 1.2" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{0BBF2728-809A-4410-A39C-B2D61639C448}</Property>
				<Property Name="App_INI_GUID" Type="Str">{96E6E1A1-18E4-4DAC-9DE0-99AB041BB7B6}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{130B1B2B-278C-4B65-8ADD-AEC071521AFC}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Automated Solar Sim 1.2</Property>
				<Property Name="Bld_compilerOptLevel" Type="Int">0</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.2</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{EEC1CB5F-9482-4DA1-A2C0-F1A5FB66FE87}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Bld_version.minor" Type="Int">2</Property>
				<Property Name="Destination[0].destName" Type="Str">Automated Solar Sim 1.2.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.2/Automated Solar Sim 1.2.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Automated Solar Sim 1.2/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{22D43BD4-EF80-4E29-BCD7-9ACF93477A5C}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/main.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Automated Solar Sim 1.2</Property>
				<Property Name="TgtF_internalName" Type="Str">Automated Solar Sim 1.2</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2015 Istituto Italiano di Tecnologia</Property>
				<Property Name="TgtF_productName" Type="Str">Automated Solar Sim 1.2</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{27375F8B-DEFB-4A7C-A3E7-7BF242E4EC68}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Automated Solar Sim 1.2.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
