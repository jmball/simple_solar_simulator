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
		<Item Name="add_light-dark_jt_to_queue.vi" Type="VI" URL="../SubVIs/add_light-dark_jt_to_queue.vi"/>
		<Item Name="add_light-dark_jv_to_queue.vi" Type="VI" URL="../SubVIs/add_light-dark_jv_to_queue.vi"/>
		<Item Name="add_light_mpps_to_queue.vi" Type="VI" URL="../SubVIs/add_light_mpps_to_queue.vi"/>
		<Item Name="add_mppt_data_to_log.vi" Type="VI" URL="../SubVIs/add_mppt_data_to_log.vi"/>
		<Item Name="add_repeat_measurements_to_queue.vi" Type="VI" URL="../SubVIs/add_repeat_measurements_to_queue.vi"/>
		<Item Name="bool_to_string.vi" Type="VI" URL="../SubVIs/bool_to_string.vi"/>
		<Item Name="build_meas_status_string.vi" Type="VI" URL="../SubVIs/build_meas_status_string.vi"/>
		<Item Name="build_queue.vi" Type="VI" URL="../SubVIs/build_queue.vi"/>
		<Item Name="calcualte_jv_metrics.vi" Type="VI" URL="../SubVIs/calcualte_jv_metrics.vi"/>
		<Item Name="check_keithley-2400_is_connected.vi" Type="VI" URL="../SubVIs/check_keithley-2400_is_connected.vi"/>
		<Item Name="check_keithley-2450_is_connected.vi" Type="VI" URL="../SubVIs/check_keithley-2450_is_connected.vi"/>
		<Item Name="check_mux_is_connected.vi" Type="VI" URL="../SubVIs/check_mux_is_connected.vi"/>
		<Item Name="create_data_folders.vi" Type="VI" URL="../SubVIs/create_data_folders.vi"/>
		<Item Name="create_date_array.vi" Type="VI" URL="../SubVIs/create_date_array.vi"/>
		<Item Name="create_folders_and_log.vi" Type="VI" URL="../SubVIs/create_folders_and_log.vi"/>
		<Item Name="create_jt_folder.vi" Type="VI" URL="../SubVIs/create_jt_folder.vi"/>
		<Item Name="create_mpps_folder.vi" Type="VI" URL="../SubVIs/create_mpps_folder.vi"/>
		<Item Name="delete_scan_settings.vi" Type="VI" URL="../SubVIs/delete_scan_settings.vi"/>
		<Item Name="find_best_pixel_from_log.vi" Type="VI" URL="../SubVIs/find_best_pixel_from_log.vi"/>
		<Item Name="find_vmp_from_log.vi" Type="VI" URL="../SubVIs/find_vmp_from_log.vi"/>
		<Item Name="format_jv_file_data.vi" Type="VI" URL="../SubVIs/format_jv_file_data.vi"/>
		<Item Name="generate_jv_filepath.vi" Type="VI" URL="../SubVIs/generate_jv_filepath.vi"/>
		<Item Name="jt_analysis_from_master_log.vi" Type="VI" URL="../SubVIs/jt_analysis_from_master_log.vi"/>
		<Item Name="jt_data_to_plot.vi" Type="VI" URL="../SubVIs/jt_data_to_plot.vi"/>
		<Item Name="jt_keithley-2400_python.vi" Type="VI" URL="../SubVIs/jt_keithley-2400_python.vi"/>
		<Item Name="jt_keithley-2450_python.vi" Type="VI" URL="../SubVIs/jt_keithley-2450_python.vi"/>
		<Item Name="jv_data_to_plot.vi" Type="VI" URL="../SubVIs/jv_data_to_plot.vi"/>
		<Item Name="jv_keithley-2400.vi" Type="VI" URL="../SubVIs/jv_keithley-2400.vi"/>
		<Item Name="jv_keithley-2450_python.vi" Type="VI" URL="../SubVIs/jv_keithley-2450_python.vi"/>
		<Item Name="Keithley 24XX.lvlib" Type="Library" URL="/&lt;instrlib&gt;/Keithley 24XX/Keithley 24XX.lvlib"/>
		<Item Name="keithley-2400_sweep.vi" Type="VI" URL="../SubVIs/keithley-2400_sweep.vi"/>
		<Item Name="load_saved_scan_settings.vi" Type="VI" URL="../SubVIs/load_saved_scan_settings.vi"/>
		<Item Name="log_file_to_display_data.vi" Type="VI" URL="../SubVIs/log_file_to_display_data.vi"/>
		<Item Name="login_dialog.vi" Type="VI" URL="../SubVIs/login_dialog.vi"/>
		<Item Name="main.vi" Type="VI" URL="../main.vi"/>
		<Item Name="measure_current_keithley-2400.vi" Type="VI" URL="../SubVIs/measure_current_keithley-2400.vi"/>
		<Item Name="measure_current_keithley-2450_python.vi" Type="VI" URL="../SubVIs/measure_current_keithley-2450_python.vi"/>
		<Item Name="measure_jt.vi" Type="VI" URL="../SubVIs/measure_jt.vi"/>
		<Item Name="measure_jv.vi" Type="VI" URL="../SubVIs/measure_jv.vi"/>
		<Item Name="measure_mpps.vi" Type="VI" URL="../SubVIs/measure_mpps.vi"/>
		<Item Name="mpps_data_to_plot.vi" Type="VI" URL="../SubVIs/mpps_data_to_plot.vi"/>
		<Item Name="mpps_keithley-2400_python.vi" Type="VI" URL="../SubVIs/mpps_keithley-2400_python.vi"/>
		<Item Name="mpps_keithley-2450_python.vi" Type="VI" URL="../SubVIs/mpps_keithley-2450_python.vi"/>
		<Item Name="mppt_keithley-2400_python.vi" Type="VI" URL="../SubVIs/mppt_keithley-2400_python.vi"/>
		<Item Name="mppt_keithley-2450_python.vi" Type="VI" URL="../SubVIs/mppt_keithley-2450_python.vi"/>
		<Item Name="remove_duplicates_by_column.vi" Type="VI" URL="../SubVIs/remove_duplicates_by_column.vi"/>
		<Item Name="save_device_details.vi" Type="VI" URL="../SubVIs/save_device_details.vi"/>
		<Item Name="save_jt_data.vi" Type="VI" URL="../SubVIs/save_jt_data.vi"/>
		<Item Name="save_jv_data.vi" Type="VI" URL="../SubVIs/save_jv_data.vi"/>
		<Item Name="save_scan_settings.vi" Type="VI" URL="../SubVIs/save_scan_settings.vi"/>
		<Item Name="save_stabilisation_data.vi" Type="VI" URL="../SubVIs/save_stabilisation_data.vi"/>
		<Item Name="scan_settings.ctl" Type="VI" URL="../TypeDefs/scan_settings.ctl"/>
		<Item Name="send_lamp_psu_command.vi" Type="VI" URL="../SubVIs/send_lamp_psu_command.vi"/>
		<Item Name="set_mux.vi" Type="VI" URL="../SubVIs/set_mux.vi"/>
		<Item Name="sort_2d_cell_details_array.vi" Type="VI" URL="../SubVIs/sort_2d_cell_details_array.vi"/>
		<Item Name="sort_scan_settings.vi" Type="VI" URL="../SubVIs/sort_scan_settings.vi"/>
		<Item Name="state_enumerate_ring.ctl" Type="VI" URL="../TypeDefs/state_enumerate_ring.ctl"/>
		<Item Name="update_jv_log.vi" Type="VI" URL="../SubVIs/update_jv_log.vi"/>
		<Item Name="update_meas_type_to_jt.vi" Type="VI" URL="../SubVIs/update_meas_type_to_jt.vi"/>
		<Item Name="update_meas_type_to_jv.vi" Type="VI" URL="../SubVIs/update_meas_type_to_jv.vi"/>
		<Item Name="update_meas_type_to_mpps.vi" Type="VI" URL="../SubVIs/update_meas_type_to_mpps.vi"/>
		<Item Name="update_meas_type_to_repeat-jv-for-best.vi" Type="VI" URL="../SubVIs/update_meas_type_to_repeat-jv-for-best.vi"/>
		<Item Name="upload_details_from_spreadsheet.vi" Type="VI" URL="../SubVIs/upload_details_from_spreadsheet.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="QuickMux Error Handler.vi" Type="VI" URL="/&lt;instrlib&gt;/QuickMux/QuickMux Error Handler.vi"/>
				<Item Name="QuickMux.lvlib" Type="Library" URL="/&lt;instrlib&gt;/QuickMux/QuickMux.lvlib"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="Current VIs Parent Directory__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/file/file.llb/Current VIs Parent Directory__ogtk.vi"/>
				<Item Name="Current VIs Parents Ref__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/appcontrol/appcontrol.llb/Current VIs Parents Ref__ogtk.vi"/>
				<Item Name="Strip Path - Arrays__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/file/file.llb/Strip Path - Arrays__ogtk.vi"/>
				<Item Name="Strip Path - Traditional__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/file/file.llb/Strip Path - Traditional__ogtk.vi"/>
				<Item Name="Strip Path__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/file/file.llb/Strip Path__ogtk.vi"/>
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
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="QuickMuxAMD64.dll" Type="Document" URL="/C/Program Files (x86)/Bitwise Systems/QuickMux/Drivers/v1.0.0/amd64/QuickMuxAMD64.dll"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Solar Simulator" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{C9215006-BDCF-4AF5-AC99-3B754DBDD006}</Property>
				<Property Name="App_INI_GUID" Type="Str">{0A531CB3-33D9-4F42-884A-8E4B2F0E8D2F}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{E61E11B7-2238-4B3A-AED5-AA997AEFC68B}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Solar Simulator</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/Solar Simulator</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToProject</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{626F77E8-C9BA-4F54-9AC5-495892E30056}</Property>
				<Property Name="Bld_version.build" Type="Int">2</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">Solar Simulator.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/Solar Simulator/Solar Simulator.exe</Property>
				<Property Name="Destination[0].path.type" Type="Str">relativeToProject</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/Solar Simulator/data</Property>
				<Property Name="Destination[1].path.type" Type="Str">relativeToProject</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{CCD5135F-1991-4246-B4D7-A34E4082DAF9}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/main.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">Oxford University Department Of Physics</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Solar Simulator</Property>
				<Property Name="TgtF_internalName" Type="Str">Solar Simulator</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2018 Oxford University Department Of Physics</Property>
				<Property Name="TgtF_productName" Type="Str">Solar Simulator</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{E34DB7B5-90B2-4092-B08B-5D10681CB8E1}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Solar Simulator.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
