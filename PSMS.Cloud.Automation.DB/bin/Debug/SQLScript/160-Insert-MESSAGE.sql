USE [<<DBNAME>>]
GO
BEGIN TRAN
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'001', N'Update Successfully!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'002', N'Update Fail!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'003', N'{0} is not found, please re-enter the information in the Corresponding Unit!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'004', N'{0} already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'005', N'Delete Successfully!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'010', N'{0} is selected and put to pending status.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'011', N'{0} is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'012', N'{0} is DELETED and it is NOT AVAILABLE.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'013', N'{0} and it is NOT AVAILABLE.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'014', N'{0} is duplicated.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'015', N'{0} has no authority to perform this.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'016', N'{0} does not match.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'017', N'The project has not been initialized!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'018', N'{0} already balloted.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'019', N'{0} balloted successfully.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'020', N'Registration No. already exists or out of range!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'021', N'This project not allow duplicate registration!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'022', N'You cannot access the system because you haven''t logged in \nor your session has been expired, please login!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'023', N'Login Fails, please login again!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'024', N'{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'025', N'{0} is used by the system, it cannot be deleted!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'026', N'{0} already used by the system!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'027', N'{0} cannot refer to an existing Agreement!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'028', N'Package is on longer left for selection!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'029', N'No record is found!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'030', N'Either unit or car park must be selected for making an Agreement!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'031', N'*Part of records is invalid, please refer to the UPLOAD_MSG.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'032', N'Upload Successfully!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'033', N'File invalid!  Unable to open the specified file.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'034', N'{0} already registrated.\nDuplicate Registration is not allowed!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'035', N'Due to invalid key entries, please verify your file & upload again!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'036', N'Due to insufficient key entries, please verify your file & upload again!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'037', N'No record in this table!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'038', N'No Batch Segment has been setup for Balloting!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'039', N'No Registration Type has not been created!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'040', N'Balloting has been already processed for current project!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'041', N'No selected Unit/Car Park found!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'042', N'Please set up number ranges properly before registration!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'043', N'Registration Number Allocation has been updated successfully!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'044', N'Questionnaire is already answered by user. Cannot be modified or deleted!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'045', N'Please set up System Agreement number range properly for current project!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'046', N'{0} is out of range!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'047', N'Ballot setup complete!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'048', N'Batch Segment for current project has not been setup!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'049', N'Project Batch for current project has not been setup!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'050', N'Your request is successfully added to the database.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'051', N'Sorry, you have no authorization to log into current project!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'052', N'System Agreement number, ballot order or walk in order must be entered!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'053', N'Unit / Car parks have been selected for this applicant already!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'054', N'{0} already used by the system!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'055', N'{0} is already used in Questionnaire and cannot be modified!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'056', N'{0} does not have a payment schedule and is not allowed to be confirmed!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'057', N'Unit selected is not avaliable, cannot be deleted!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'058', N'{0} already used by the system!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'059', N'Can''t enter both Ballot order and Walk In Order!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'060', N'Delete Successfully!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'061', N'{0} already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'062', N'Can''t enter both Registration No. and Walk In Order!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'063', N'{0} is not confirmed!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'064', N'{0} does not exist!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'065', N'{0} is made available!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'066', N'{0} is duplicated!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'067', N'{0} has not been balloted, can not be transfered!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'068', N'Registration(s) transfered!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'069', N' ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'070', N'No Record is avaliable for transfer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'071', N'{0} registration cannot be Voided or Cancelled!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'072', N'Import failed\n\nProject ID mismatch!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'073', N'{0} is not Confirmed and therefore will not be transferred for O/S balance payment!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'074', N'{0} has selected a unit!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'075', N'{0} has selected a car park!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'076', N'Please set up payment method properly for current project!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'077', N'Car park selected is not avaliable, cannot be deleted!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'078', N'{0} has car park(s) and cannot be deleted.\nPlease delete car park(s) before deleting unit!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'079', N'{0} does not have ''Confirmed'' status to be a master Agreement!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'080', N'You do not possess sufficient authority to delete users!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'081', N'{0} has a bank draft that has been used. Please seek supervisor for assistance!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'082', N'Agreement has been done for this unit, please void the Agreement for any unit de-selection!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'083', N'{0} has been used. Please seek supervisor for assistance!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'084', N'{0} has been used for a completed Agreement. No transfer for the O/S balance is allowed. Please seek supervisor for assistance!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'085', N'You have no right to access \n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'086', N'Property Sales System')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'087', N'Sales Office')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'088', N'Project')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'089', N'User ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'090', N'Password')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'091', N'Login')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'092', N'Reset')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'093', N'You must enter a value in the following fields:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'094', N'Project ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'095', N'Screen ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'096', N'Logout')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'097', N'Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'098', N'Main Menu')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'099', N'Buyers Registration')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'100', N'Unit Selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1001', N'Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1002', N'Agreement Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1003', N'Agreement Voiding')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1004', N'Agreement Printing')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1005', N'Agreement Mailing List Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1006', N'Agreement Mailing List Export')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1007', N'Deed Execution')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1008', N'Search By Purchaser ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1009', N'System Agreement Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'101', N'Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1010', N'Search')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1011', N'Purchaser ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1012', N'Agreement Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1013', N'Agreement Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1014', N'From')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1015', N'To')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1016', N'Show Agreement For')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1017', N'Open')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1018', N'Confirmed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1019', N'Cancel')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'102', N'Project Administration')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1020', N'Void')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1021', N'Unit & Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1022', N'Unit Only')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1023', N'Car Park Only')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1024', N'----- Select Agreement Status -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1025', N'Unit / Car Park (Exclude Void and C anceled Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1026', N'Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1027', N'Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1028', N'Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1029', N'(Applicable to Unit Only)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'103', N'Reports')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1030', N'Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1031', N'Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1032', N'House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1033', N'Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1034', N'Street')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1035', N'Time table already created for solicitor {0}!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1036', N'Create New Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1037', N'Confirm Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1038', N'Browse Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1039', N'Modify Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'104', N'System Administration')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1040', N'Search Selected Unit / Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1041', N'Unit Identifier')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1042', N'Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1043', N'Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1044', N'Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1045', N'House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1046', N'Street')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1047', N'Matched Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1048', N'Matched Car Parks')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1049', N'Car Park ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'105', N'Create New Project')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1050', N'Car Park No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1051', N'Level')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1052', N'Invalid Agreement Maintenance Action!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1053', N'New Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1054', N'Purchaser Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1055', N'Agreement Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1056', N'Master Agreement Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1057', N'----- Select Purchaser Type -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1058', N'Invalid Purchaser ID!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1059', N'Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'106', N'Browse Project')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1060', N'Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1061', N'Sex')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1062', N'Male')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1063', N'Female')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1064', N'ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1065', N'Hong Kong Identity Card No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1066', N'Date Of Birth')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1067', N'Nationality')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1068', N'----- Select Nationality -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1069', N'Surname must be specified!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'107', N'Modify Project')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1070', N'Previous')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1071', N'Do you want to save?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1072', N'Personal')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1073', N'Length should be 8 - 9')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1074', N'Format should be ??999999X')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1075', N'Format should be AA??????X')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1076', N'Format of the following fields are not correct:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1077', N'Month should be 01 - 12')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1078', N'Year should be 1900 - 2079')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1079', N'Age should be greater than 18')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'108', N'Menu')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1080', N'Format should be dd-mm-yyyy')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1081', N'Company Purchaser')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1082', N'Company Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1083', N'Business Registration No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1084', N'Director 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1085', N'Director 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1086', N'Personal')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1087', N'Company')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1088', N'Others')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1089', N'Joint Buyers')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'109', N'Project Master Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1090', N'Joint Buyer 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1091', N'Joint Buyer 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1092', N'Joint Buyer 3')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1093', N'Contact Person')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1094', N'Address')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1095', N'District')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1096', N'Country')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1097', N'Work Phone No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1098', N'Home Phone No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1099', N'Mobile Phone No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'110', N'Analysis District Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1100', N'Fax No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1101', N'Email Address')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1102', N'----- Select Country -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1103', N'----- Select Analysis District -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1104', N'Contact Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1105', N'Analysis District')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1106', N'Phone number should be numeric')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1107', N'Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1108', N'Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1109', N'Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'111', N'Version')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1110', N'Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1111', N'Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1112', N'House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1113', N'Street')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1114', N'List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1115', N'Property')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1116', N'Missing Agreement Search Command!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1117', N'Create Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1118', N'Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1119', N'Car Park No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'112', N'Click here to login')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1120', N'Level')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1121', N'System Administration')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1122', N'Unit Selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1123', N'Reports')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1124', N'Solicitor Firm')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1125', N'Agency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1126', N'Agency Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1127', N'Agent/Salesperson Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1128', N'Agent/Salesperson ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1129', N'Agent/Salesperson Phone No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'113', N'District Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1130', N'----- Select Agency Name -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1131', N'Sales')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1132', N'Sales ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1133', N'Remark')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1134', N'You must NOT enter a value in the following fields:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1135', N'Length should be less than 500')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1136', N'Master Agreement Number does not exist!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1137', N'Master Agreement Number does not have ''Confirmed'' status!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1138', N'Deselect')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1139', N'[ Search By Unit ]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'114', N'General')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1140', N'Search By Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1141', N'Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1142', N'[ Search By Purchaser ID ]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1143', N'Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1144', N'Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1145', N'Floor / Car Park Level')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1146', N'Flat / Car Park No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1147', N'House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1148', N'Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1149', N'Street')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'115', N'Project Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1150', N'Search By Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1151', N'Car Park No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1152', N'Level')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1153', N'[ Search By Car Park ]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1154', N'Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1155', N'Search Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1156', N'System Agreement Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1157', N'Agreement Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1158', N'Matched Agreements')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1159', N'Purchaser Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'116', N'Project ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1160', N'Purchaser Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1161', N'Company Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1162', N'Agreement Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1163', N'Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1164', N'From')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1165', N'To')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1166', N'Show Agreement For')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1167', N'[ Search By Purchaser ]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1168', N'Unit / Car Park (Exclude Void & Canceled Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1169', N'(Applicable to Unit only)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'117', N'Open')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1170', N'Number Of Payment Stages')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1171', N'Outstanding Balance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1172', N'Number Of Payment Stage cannot be smaller than the previous selected value!\nPlease use the delete button next to each Payment Stage row to remove unnecessary rows!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1173', N'Cannot delete this payment method.\nIt is currently used by the system!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1174', N'Cannot modify this payment method.\nIt is currently used by the system!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1175', N'----- Select Agreement Status -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1176', N'Open')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1177', N'Confirmed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1178', N'Cancel')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1179', N'Void')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'118', N'Address')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1180', N'Unit & Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1181', N'Unit Only')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1182', N'Car Park Only')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1183', N'[ Search By Premises ]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1184', N'Purchaser')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1185', N'Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1186', N'Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1187', N'ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1188', N'Company Purchaser')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1189', N'Company Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'119', N'District')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1190', N'Business Registration No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1191', N'Director Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1192', N'Director Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1193', N'From date should not be later than To date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1194', N'Result<br>Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1195', N'No Agreement can be found!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1196', N'Search By Premise Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1197', N'Search By Purchaser Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1198', N'Purchase Intention')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1199', N'----- Select Purchase Intention -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'120', N'Unit of Measurement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1200', N'Investment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1201', N'Immigrant')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1202', N'Self-Use')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1203', N'Confirm Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1204', N'Confirm Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1205', N'Print Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1206', N'Confirm & Print Agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1207', N'Missing System Agreement Number!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1208', N'Browse Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1209', N'Void Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'121', N'S&P Days (Calendar Days)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1210', N'Void Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1211', N'Cancel Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1212', N'Cancel Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1213', N'Void this agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1214', N'Cancel this confirmed agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1215', N'Print Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1216', N'Report Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1217', N'Direct Print')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1218', N'To-Mail Merge')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1219', N'For To-Mail Merge: After the report is retrieved, please click the ''Export'' button and choose ''Excel'' format.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'122', N'Duplicated Registration')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1220', N'Report Selection Criteria')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1221', N'Get Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1222', N'----- Select Project -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1223', N'Browse Agreement Mailing List')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1224', N'Modify Agreement Mailing List')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1225', N'Delete Agreement Mailing List')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1226', N'Search Agreement Mailing List')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1227', N'Selection Criteria')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1228', N'Matched Agreement Mailing List')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1229', N'Direct Mail')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'123', N'Package Price Before/After Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1230', N'Missing Agreement Mailing List Search Command!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1231', N'No Agreement Mailing List can be found!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1232', N'Agreement Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1233', N'All')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1234', N'PASP Signed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1235', N'Deed Not Executed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1236', N'With O/S Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1237', N'Agreement Mailing List')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1238', N'Contact Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1239', N'Direct Mailing')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'124', N'Min. Deposit Amount 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1240', N'Modify')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1241', N'Void Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1242', N'Refund')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1243', N'Remarks')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1244', N'ID should not be the same as other joint buyers'' ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1245', N'Save this agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1246', N'Quit without saving this agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1247', N'Package Selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1248', N'Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1249', N'System Agreement Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'125', N'Min. Deposit Amount 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1250', N'Selected Packages')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1251', N'List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1252', N'Package ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1253', N'Package Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1254', N'Package Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1255', N'Quota')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1256', N'Deselect')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1257', N'Available Packages')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1258', N'Select')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1259', N'Save Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'126', N'Min. Deposit Amount 3')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1260', N'Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1261', N'Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1262', N'No. of Months')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1263', N'Should be a non-negative integer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1264', N'Failed to select package.\nThe specified package is out of stock!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1265', N'Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1266', N'S&P Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1267', N'Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1268', N'Save Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1269', N'Go to previous page without saving this agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'127', N'Min. Deposit Amount 4')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1270', N'Go to Agreement page without saving this payment setting?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1271', N'Go to Package Selection page without saving this payment setting?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1272', N'Package')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1273', N'Quit without saving this payment setting?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1274', N'Payment Term Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1275', N'----- Select Payment Method -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1276', N'Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1277', N'Payment Stage')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1278', N'Factor Relative to S&P Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1279', N'Amount / Payment Basis')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'128', N'Remark 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1280', N'Day(s)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1281', N'Month(s)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1282', N'Year(s)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1283', N'Interest Subsidy')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1284', N'Down - Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1285', N'Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1286', N'List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1287', N'Package')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1288', N'List Price Before Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1289', N'Adjustment ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'129', N'Remark 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1290', N'List Price After Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1291', N'Interest Subsidy')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1292', N'Contract Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1293', N'Payment Schedule')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1294', N'Interest Subsidy Percentage must be a number between 0 and 100!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1295', N'(Agreement Creation Date)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1296', N'Interest Subsidy on List Price ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1297', N'OutStanding Balance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1298', N'Payment Due')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1299', N'Due Date<br>(dd-mm-yyyy)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'130', N'Yes')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1300', N'ID should not be the same as other company director''s ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1301', N'Final Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1302', N'Paid Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1303', N'Cheque Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1304', N'Cheque No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1305', N'Bank')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1306', N'Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1307', N'Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1308', N'----- Select Bank -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1309', N'Payment Due cannot be empty!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'131', N'No')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1310', N'Payment Due must be a non-negative integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1311', N'Payment Due is too large!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1312', N'Total payment is larger than total payment due!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1313', N'Authorization')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1314', N'Username')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1315', N'Password')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1316', N'OK')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1317', N'Cancel')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1318', N'Your total input payment is smaller than the amount of first payment due (Outstanding Balance: <span style=''color:red;font-weight:bold;''>{0} {1}</span>).')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1319', N'Please input authorization username and password then press ""OK"", or press ""Cancel"" to modify your payment.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'132', N'----- Select District -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1320', N'Authorization Needed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1321', N'Authorization Failed - Wrong Username or Password')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1322', N'Authorization Failed - Insufficient Privilege')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1323', N'Save this Payment Method?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1324', N'Cannot delete package ""{0}"".\nIt is currently used by the system!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1325', N'Package ""{0}"" already exist!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1326', N'Package ""')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1327', N'"" already exist!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1328', N'System cannot allocate a new System Agreement Number for this agreement!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1329', N'Show Interest Subsidy On Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'133', N'----- Select UOM -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1330', N'Car Park List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1331', N'Net Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1332', N'Cheque No. should not be the same as other Cheque No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1333', N'Cannot modify a confirmed Agreement!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1334', N'No Agency was selected, save anyway?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1335', N'Agreement Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1336', N'Appointment Time')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1337', N'S&P Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1338', N'System Agreement Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1339', N'Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'134', N'Block Type Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1340', N'Created By')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1341', N'Updated By')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1342', N'Others')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1343', N'Contract Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1344', N'Net Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1345', N'Interest Subsidy')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1346', N'Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1347', N'Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1348', N'Modify Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1349', N'Invalid agreement status!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'135', N'Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1350', N'Since the agreement date has been changed, S&P and Payemnt Due Date will be updated by the system automatically, you''re advised to check the payment plan and transactions details again.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1351', N'Save changes before leaving this page?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1352', N'Go to Payment Method page without saving this agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1353', N'Package Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1354', N'List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1355', N'Currently Selected Method ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1356', N'Authorization is needed since you have selected refund!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1357', N'Please input authorization username and password and press ""OK"" or press ""Cancel"" to cancel the process.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1358', N'Deed Execution')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1359', N'Deed Executed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'136', N'Total Number of Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1360', N'Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1361', N'The Agreement Deed Execution status updated!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1362', N'Cash Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1363', N'Car Park Particulars')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1364', N'Property Particulars')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1365', N'Information of the selected Unit has been updated during creating the Agreement!\nPlease verify the change and create the Agreement again.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1366', N'Information of the selected Car Park has been updated during creating the Agreement!\nPlease verify the change and create the Agreement again.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1367', N'Extract Data File')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1368', N'Selection Criteria')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1369', N'Export')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'137', N'Registration Deposit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1370', N'Available Columns')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1371', N'Selected Columns')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1372', N'Export Data Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1373', N'----- Select Export Data Type -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1374', N'Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1375', N'Agreement Transfer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1376', N'Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1377', N'Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1378', N'No Column was selected!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1379', N'Paid')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'138', N'Extra Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1380', N'Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1381', N'Hold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1382', N'Reserved')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1383', N'Sold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1384', N'No data can be exported!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1385', N'----- Select Payment Stage -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1386', N'Payment Due ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1387', N'Paid Amount ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1388', N'View Transaction History')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1389', N'Payment Stage (Cheque)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'139', N'Save')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1390', N'Payment Stage (Cash)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1391', N'Bank (Cheque)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1392', N'Bank (Mortgage)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1393', N'Mortgage Bank should not be the same as other Mortgage Bank')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1394', N'Transaction History')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1395', N'Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1396', N'Factor Relative to S&P Date / Transaction Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1397', N'Payment Due ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1398', N'Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1399', N'Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'140', N'Quit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1400', N'Transaction Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1401', N'Transaction Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1402', N'Paid Amount ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1403', N'Void?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1404', N'Void')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1405', N'Payment Follow-up: Transaction History')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1406', N'Void Transaction<br />Transaction No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1407', N'Bank Cheque')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1408', N'Cash')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1409', N'Authorization is needed since you have made an overdue payment!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'141', N'Phase Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1410', N'Please input authorization username and password and press ""OK"" or press ""Cancel"" to cancel the process.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1411', N'Authorization is needed since you have made an overdue payment!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1412', N'Please input authorization username and password and press ""OK"" or press ""Cancel"" to cancel the process.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1413', N'Authorization is needed since you have made an overdue payment!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1414', N'Please input authorization username and password and press ""OK"" or press ""Cancel"" to cancel the process.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1415', N'Penalty ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1416', N'Penalty should be a non-negative integer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1417', N'OverDue Penalty')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1418', N'OverDue Penalty on {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1419', N'Outstanding Balance ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'142', N'Units Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1420', N'Last Allocated System Agreement Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1421', N'House: ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1422', N'Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1423', N'Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1424', N'No Display Setting defined!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1425', N'Block: ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1426', N'Block / House / Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1427', N'Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1428', N'Car Park:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1429', N'Sold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'143', N'Project Total')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1430', N'Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1431', N'Reserved')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1432', N'Whole Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1433', N'Maximum Number Of Rows Per Screen')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1434', N'Should be a positive integer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1435', N'House: ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1436', N'Legend')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1437', N'<nobr>No. {0},</nobr><br><nobr>Level {1}</nobr>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1438', N'<nobr>House {0},</nobr><br><nobr>{1}</nobr>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1439', N'{0}/F')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'144', N'Total No. of Available Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1440', N'<nobr>Unit {0}</nobr>, <nobr>{1}/F</nobr>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1441', N'<nobr>House {0},</nobr><br><nobr>{1}</nobr>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1442', N'Level {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1443', N'House {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1444', N'House {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1445', N'&nbsp;{0}&nbsp;<br>{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1446', N'&nbsp;{0}&nbsp;<br>{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1447', N'Maximum Number Of Columns Per Screen')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1448', N'(Not applicable to Block View)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1449', N'Void this transaction?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'145', N'Total No. of Sold Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1450', N'Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1451', N'Corresponding Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1452', N'Corresponding Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1453', N'The corresponding car park of your selected unit will also be selected automatically!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1454', N'The corresponding unit of your selected car park will also be selected automatically!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1455', N'Sales Report - Date of Sales')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1456', N'Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1457', N'Country')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1458', N'----- All -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1459', N'Sales Report - Group by Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'146', N'Total No. of Reserved Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1460', N'Sales Report - Group by Block and Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1461', N'Online Selection Result')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1462', N'Hold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1463', N'Display Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1464', N'Sold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1465', N'Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1466', N'Reserved')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1467', N'Hold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1468', N'{0}<br>{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1469', N'Sales Report - Group by Analysis Group and Selling Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'147', N'Total No. of Hold Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1470', N'Property Particulars')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1471', N'Overdue Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1472', N'----- Others -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1473', N'Agreement Selection Criteria')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1474', N'S&P Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1475', N'Bank Code and Bank Name should be entered if Others is selected.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1476', N'Confirm & Print Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1477', N'Quit without saving?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1478', N'Confirm & Print Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1479', N'Confirm & View Agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'148', N'No. of Available Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1480', N'Print current agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1481', N'Payment Due ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1482', N'Paid Amount ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1483', N'Outstanding Balance ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1484', N'Overpaid')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1485', N'Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1486', N'Internal Cost ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1487', N'List Price ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1488', N'Car Park List Price is too large!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1489', N'List Price is too large!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'149', N'No. of Sold Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1490', N'Gross Floor Area ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1491', N'Net Floor Area ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1492', N'Area ({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1493', N'Additional Field 1 is too large!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1494', N'Rate Reference')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1495', N'Currency Rate Reference must be a positive number!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1496', N'Direct Print')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1497', N'Export As Mail-Merge')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1498', N'No matching unit was found!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1499', N'Matched Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'150', N'No. of Reserved Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1500', N'Matched Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1501', N'System will break the linkage between the select car park and its corresponding unit.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1502', N'[ Search Car Park ]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1503', N'[ Search Unit ]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1504', N'No matching car park found!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1505', N'Only 1 unit matches your search criteria.\nSelect this matched unit?\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1506', N'Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1507', N'Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1508', N'Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1509', N'House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'151', N'No. of Hold Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1510', N'Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1511', N'Street Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1512', N'Car Park No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1513', N'Level')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1514', N'House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1515', N'Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1516', N'Street Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1517', N'There is a car park linked up with this unit.\nSelect this corresponding car park also?\n\n{0}\nIf choose ""No"", the system will break the linkage between the selected unit and its corresponding car ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1518', N'Only 1 car park matches your search criteria.\nSelect this matched car park?\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1519', N'There is a unit linked up with this car park.\nSelect this matched car park anyway?\n\nContinue selecting this matched car park will break\nthe linkage between the selected car park and its\ncorrespon')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'152', N'Project Packages Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1520', N'No unit or car park was selected!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1521', N'Unit / Car Park Selection - Confirm')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1522', N'Followings are selected unit and/or car parks:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1523', N'Confirm')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1524', N'Cancel')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1525', N'Username')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1526', N'Password')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1527', N'Please enter overriding username and password, as some of the selected unit and/or car parks are reserved:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1528', N'Unit / Car Park Selection - Result')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1529', N'Followings are result for your unit selection:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'153', N'Add')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1530', N'Create Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1531', N'Close')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1532', N'Successful Selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1533', N'Unsuccessful Selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1534', N'Error occurred during submit selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1535', N'Unit does not exist')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1536', N'Unit has been deleted')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1537', N'Unit not available for selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1538', N'Unit has been modified by others')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1539', N'Linkage between the unit and its corresponding car park has been modified by others')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'154', N'Package ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1540', N'More than one car parks are associated with the unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1541', N'Error occurred during submit selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1542', N'Corresponding car park has been deleted')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1543', N'Status of the unit and its corresponding car park are not synchronized')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1544', N'Corresponding car park has been modified by others')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1545', N'Error occurred during submit selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1546', N'Car park does not exist')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1547', N'Car park has been deleted')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1548', N'Car park not available for selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1549', N'Car park has been modified by others')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'155', N'Package Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1550', N'Linkage between the car park and its corresponding unit has been modified by others')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1551', N'Overriding username is needed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1552', N'No such overriding user')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1553', N'Incorrect password for overrding user')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1554', N'Overriding user account has been expired')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1555', N'Overriding: permission denied')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1556', N'Error occurred during submit selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1557', N'Unit / Car Park Selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1558', N'Payment Slip Printed!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1559', N'Payment Method is not applicable to this agreement.\nThe down - payment stage payment due amount is greater than the next stage payment due amount.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'156', N'Package Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1560', N'Hold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1561', N'Sold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1562', N'Deselected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1563', N'Paid Amount is smaller than the required payment amount of some stages, continue?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1564', N'Receipt Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1565', N'Search Receipt')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1567', N'No Receipt can be found!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1568', N'Re-generate Receipt')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1569', N'Tenant Share')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'157', N'Edit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1570', N'Company Tenant Share')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1571', N'Confirmed (Transferred)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1572', N'Cancel (Transferred)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1573', N'Car Park Level Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1574', N'Level Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1575', N'Level Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1576', N'Level Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1577', N'Level Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1578', N'Cannot delete this level. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1579', N'&nbsp;{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'158', N'Update')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1580', N'&nbsp;{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1581', N'&nbsp;{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1582', N'Invalid Pay Date!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1583', N'Pay Date must be smaller than or equals to current date!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1584', N'Payment Stage (Credit Card)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1585', N'Total No. of units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1586', N'Edit Agreement Date/Agency Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1587', N'Authorization is needed for modifying Package and Payment Method information of a Confirmed agreement!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1588', N'Please input authorization username and password and press "OK" or press "Cancel" and click "Save Buyer Information" button to save this page information only.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1589', N'  Are you sure you want to proceed?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'159', N'Cancel')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1590', N'Agreement Creation Process Not Yet Completed for Open Status Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1591', N'Agreement Modification Process Not Yet Completed for Confirmed Status Agreement. Please check the payment plan and transactions details of the agreement again.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1592', N'Payment Plan could not be loaded due to incomplete Agreement Creation Process for Open Status Agreement.  Please check the payment plan and transactions details of the agreement again. ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1593', N'Payment Plan could not be loaded due to incomplete Agreement Modification Process for Confirmed Status Agreement. Please check the payment plan and transactions details of the agreement again.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1594', N'Package has been added or removed, you must go to payment page in order to update the latest Contract/Net Price and Payment Schedule for the agreement.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1595', N'Cannot Print Open Agreement.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1596', N'Cannot Print: Contract/Net Price and Payment Plan could not be loaded due to incomplete Agreement Modification Process. Please check the payment plan and transactions details of the agreement again.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1598', N'Negotiation Adjustment has been changed or package has been added/removed, please re-select the payment method to update the latest Contract/Net Price and Payment Schedule for the agreement.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1599', N'Are you sure you want to proceed without saving any data?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'160', N'Delete')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1600', N'Modify Confirmed Agreement (Agreement Date, Agency, Package, Payment)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1601', N'Range')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1603', N'Invalid upper range price for Range')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1604', N'Stamp Duty Set Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1605', N'Stamp Duty Set Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1608', N'Set Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1609', N'Set Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'161', N'Quota')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1610', N'In Use By Project?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1611', N'Remarks for the Stamp Duty Amount Formula,<br>&nbsp;&nbsp;&nbsp;&nbsp;a  +  <font color=red><b>( Contract Price  +  b )</b></font>  X  c %')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1612', N'<br><br>&nbsp;&nbsp;&nbsp;&nbsp;a : +/- ve Decimal<br>&nbsp;&nbsp;&nbsp;&nbsp;b : +/- ve Decimal<br>&nbsp;&nbsp;&nbsp;&nbsp;c : + ve Decimal')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1613', N'<br><br>&nbsp;&nbsp;&nbsp;&nbsp;If result of highlighted part in the formula is negative, the stamp duty amount will be equal to a.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1614', N'Car Park Stamp Duty')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1615', N'Unit Stamp Duty')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1616', N'Cannot modify this stamp duty set.\nIt is currently used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1617', N'Formula Factor c Percentage must be a number between 0 and 100!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1618', N'Agreement cannot be modified as it had already been updated in Payment Follow-up module.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1619', N'Show Overdue Agreement Only')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'162', N'Quota Used')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1620', N'Modify car park failed. Status of the car park and its corresponding unit are not synchronized.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1621', N'Create car park failed. Status of the car park and its corresponding unit are not synchronized.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1622', N'Import Operation Abort!\nSolicitor Firm Contact Person Code exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1623', N'Import Operation Abort!\nRegion Code exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1624', N'Import Operation Abort!\nUtility Platform Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1625', N'Import Operation Abort!\nUtility Platform Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1626', N'Import Operation Abort!\nUtility Platform Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1627', N'Import Operation Abort!\nAC Room Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1628', N'Import Operation Abort!\nAC Room Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1629', N'Import Operation Abort!\nAC Room Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'163', N'Quota Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1630', N'Import Operation Abort!\nAC Platform Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1631', N'Import Operation Abort!\nAC Platform Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1632', N'Import Operation Abort!\nAC Platform Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1633', N'Import Operation Abort!\nDistrict must be provided if Region is not empty.\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1634', N'Import Operation Abort!\nRegion must be provided if District is not empty.\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1635', N'Import Operation Abort!\nIncorrect Solicitor Information (Firm Code and Contact Person Code).\nRow {0} Column {1} Column {2}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1636', N'Import Operation Abort!\nIncorrect Region District Information (Region Code and District Code).\nRow {0} Column {1} Column {2}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1637', N'Agency Tel. No. already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1638', N'Analysis Code Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1639', N'Unit Type Description already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'164', N'Unit Type Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1640', N'Analysis District Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1641', N'Payment Stage Due Date cannot be empty!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1642', N'Each Payment Stage Due Date should be later than due date in previous stage. Please check your Payment Schedule')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1643', N'Payment Stage Due Date Format should be dd-mm-yyyy')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1644', N'Payment Stage Due Date Month should be 01 - 12')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1645', N'Payment Stage Due Date Year should be 1900 - 2079')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1646', N'Invalid Payment Plan:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1647', N'Payment Stage Due Date Cannot be earlier than Agreement Date!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1648', N'Total No. of Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1649', N'Price List Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'165', N'Project Batch Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1650', N'Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1651', N'No Unit has been selected!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1652', N'Adjustment factor must be input!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1653', N'Update Failed: Missing List Price for unit ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1654', N'Update Failed: Missing GFA for unit ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1655', N'Update Failed: Invalid GFA for unit ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1656', N'Update Failed: Others has updated Master Information for unit ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1657', N'Update Failed!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1658', N'From Floor should be smaller than To Floor!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1659', N'Back To Setup')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'166', N'Batch No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1660', N'Percentage must be a number between 0 and 100!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1661', N'No Unit for Selected Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1662', N'Price List Adjustment Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1663', N'Only one set of stamp duty can be setup in Phase 1!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1664', N'Update Failed: Unit already on hold or sold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'1665', N'Stamp Duty')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'167', N'Number of Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'168', N'Registration Type Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'169', N'Total Units')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'170', N'Sales Type Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'171', N'Project Payment Method Setup')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'172', N'Add New Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'173', N'Browse Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'174', N'Modify Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'175', N'Delete Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'176', N'Import Unit/Car Park Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'177', N'Import')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'178', N'Street Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'179', N'Choose Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'180', N'Choose File')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'181', N'Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'182', N'Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'183', N'Upload')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'184', N'Export Unit/Car Park Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'185', N'Export')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'186', N'House')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'187', N'Unit & House')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'188', N'Solicitor Time Table Check')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'189', N'Solicitor Time Table Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'190', N'Unit Master Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'191', N'Car Park Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'192', N'Project System Agreement Number Allocation')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'193', N'Project Questionnaire Setup')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'194', N'Create New Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'195', N'Browse Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'196', N'Modify Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'197', N'Delete Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'198', N'Create New Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'199', N'Browse Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'200', N'Modify Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2001', N'Agreement Transfer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2002', N'System Agreement No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2003', N'First Purchaser')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2004', N'Unit Summary')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2005', N'Car Park Summary')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2006', N'Agreement Transfer History')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2007', N'Add New Transfer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2008', N'Delete Last Transfer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2009', N'Transfer No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'201', N'Delete Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2010', N'Transfer Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2011', N'Transferor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2012', N'Buyer Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2013', N'Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2014', N'ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2015', N'Address')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2016', N'Contact No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2017', N'Transfer Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2018', N'Transfer Fee')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2019', N'Payment Follow-up')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'202', N'Create New Time Table')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2020', N'Last Purchaser')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2021', N'Payment Plan')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2022', N'Factor Relative to S&P Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2023', N'Payment Due')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2024', N'Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2025', N'Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2026', N'Paid Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2027', N'Paid Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2028', N'Cheque')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2029', N'Cash')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'203', N'Browse Time Table')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2030', N'Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2031', N'Cheque No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2032', N'Bank')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2033', N'Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2034', N'Mortgage Bank')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2035', N'Personal')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2036', N'BR No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2037', N'Joint Buyer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2038', N'Contact Person 2 Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2039', N'[Transfer Agreement]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'204', N'Modify Time Table')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2040', N'[Delete Last Transfer]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2041', N'Buyer Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2042', N'Buyer ID/BRN')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2043', N'Details')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2044', N'Transfer Amount & Transfer Fee')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2045', N'PAID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'205', N'Delete Time Table')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2055', N'Close')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2056', N'Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2057', N'Transaction No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2058', N'Agreement Transfer - Details')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2059', N'Transfer Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'206', N'Solicitor Firm')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2060', N'Transfer Fee Payment Method')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2061', N'>> Final Charge')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2062', N'----- Select Service Charge Type-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2063', N'Transfer Amount must be a non-negative integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2064', N'Service Charge must be a non-negative integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2065', N'Transfer Agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2066', N'Payment Amount must be a non-negative integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2067', N'Quit before saving this agreement transfer?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2068', N'Are you sure to delete the last transfer record?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2069', N'Last Transfer Record deleted successfully!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'207', N'Unit Identifier')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2070', N'Fail to delete last transfer Record!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2071', N'You have no right to re-print the agreement.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2072', N'RP01 - Carpark Allocation Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2073', N'Total Paid Amount exceeds Total Outstanding Balance by ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2074', N'Are you sure you want to proceed?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2075', N'Required Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2076', N'Payment Method is not applicable to this agreement.\nFixed Payment Due amount of payment plan stages already exists agreement net price by ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2077', N'Required Amount: ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2078', N'Overpaid Amount: ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2079', N'Commission should be in the format 999.99')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'208', N'Unit Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2080', N'Service Charge must be a number. (Format:9999.99)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'209', N'Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'210', N'Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'211', N'Base Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'212', N'----- Select Base Currency -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'213', N'!!O')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'214', N'Sales Office Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'215', N'New Batch')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'216', N'Existing Batches')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'217', N'Calculate with GFA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'218', N'Internal Cost')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'219', N'Active')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'22', N'""You cannot access the system because you haven''t logged in \nor your session has been expired, please login!""')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'220', N'New Package')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'221', N'Existing Packages')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'222', N'----- Select Solicitor Firm -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'223', N'Solicitor that do not have S&P Schedule for Unit/Houses')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'224', N'Solicitor that do not have S&P Schedule for Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'225', N'All Units and Car Parks are checked to have Solicitor''s S&P Schedule.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'226', N'Please correct the problems before proceed to Agreement!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'227', N'Please correct the problems before proceed to Agreement Maintenance!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'228', N'Unit of Measurement Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'229', N'Create New Time Table')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'230', N'Max Amount Per Slot')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'231', N'Bank Information Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'232', N'Invalid Solicitor Code!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'233', N'Solicitor Firm Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'234', N'Slot No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'235', N'Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'236', N'Reserved')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'237', N'Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'238', N'Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'239', N'Floor Sequence')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'240', N'Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'241', N'Nationality Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'242', N'House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'243', N'Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'244', N'Street')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'245', N'Analysis Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'246', N'Sales Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'247', N'List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2477', N'Required Amount:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2478', N'Overpaid Amount:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2479', N'Deleted')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'248', N'Sales Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2480', N'Agreement Supplemental')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'2481', N'1st Deposit Receipt')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'249', N'Gross Floor Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'250', N'Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'251', N'Net Floor Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'252', N'Usable Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'253', N'Bay Window')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'254', N'Garden')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'255', N'Yard')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'256', N'Terrace')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'257', N'Balcony')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'258', N'Roof')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'259', N'Flat Roof')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'260', N'Area in SMP')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'261', N'Remark')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'262', N'Extra')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'263', N'----- Select Unit Type -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'264', N'----- Select Phase -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'265', N'----- Select Block -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'266', N'----- Select Street -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'267', N'Country of Residence Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'268', N'----- Select Sales Type -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'269', N'----- Select Analysis Code -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'270', N'----- Select Export Type -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'271', N'Invalid Export Type!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'272', N'Exception occurred during exporting data!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'273', N'Invalid Import Type!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'274', N'Data Import Completed.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'275', N'Car Park No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'276', N'Level')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'277', N'Create New Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'278', N'Car Park Identifier')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'279', N'Corresponding Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'280', N'(if applicable)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'281', N'Range')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'282', N'Start Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'283', N'End Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'284', N'Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'285', N'System')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'286', N'Max Amount Per Slot must be an integer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'287', N'Solicitor: {0} does not have any S&P schedule!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'288', N'No. of Appointment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'289', N'View Error(s)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'290', N'Upload aborted.\nDue to column name is empty!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'291', N'Method Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'292', N'Method Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'293', N'Show List Price on Argeement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'294', N'Adjustment (%) on List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'295', N'Interest Subsidy')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'296', N'Down - Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'297', N'Payment Stage')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'298', N'Amount / Payment Basis')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'299', N'Fixed / Relative Date to S&P / Relative Date to Agreement Date / Remarks')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'300', N'Before Date Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'301', N'Fixed Date / Relative Date to S&P / Relative Date to Agreement Date / Remarks')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'302', N'Date Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'303', N'After Date Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'304', N'- Select -')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'305', N'Relative to S&P')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'306', N'Fixed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'307', N'Remarks')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'308', N'Days')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'309', N'Months')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'310', N'Years')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3100', N'Make Checked Car Park(s) Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3101', N'Make Checked Car Park(s) Reserved')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3102', N'Car park List Price must be positive number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3103', N'More than one Corresponding Unit record detected.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3104', N'Corresponding Unit is not found or not available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3105', N'Selected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3106', N'Selection Criteria')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3107', N'Car Park list price exceed maximum list price set at Rule Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3108', N'Car Park list price below minimum list price set at Rule Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3109', N'Either Level or House No. must be input to identify a car park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'311', N'Exception occurred during importing data!\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3110', N'Car Park Number must be specified if Level is selected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3111', N'Level must be specified if Car Park Number is selected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3112', N'Street Number must be specified if Street Name is selected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3113', N'Street Name must be specified if Street Number is selected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3114', N'----- Select Analysis Group -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3115', N'Missing Car Park Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3116', N'Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3117', N'Missing Car Park number Search Command!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3118', N'This Unit has been selected by Car Park {0} ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3119', N'Search Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'312', N'View Import Error Messages')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3120', N'Unit Master Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3121', N'Create New Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E ', N'3122', N'Browse Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3123', N'Modify Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3124', N'Delete Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E ', N'3125', N'Unit Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3126 ', N'Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3127', N'Net Floor Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3128', N'Analysis')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3129', N'Group 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'313', N'Batch No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3130', N'---- Select Unit Type ----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3131', N'--Select Code--')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3132', N'List Price must be positive')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3133', N'Either Floor or House No. must be input to identify a Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3134', N'Floor and Flat must be specified if Block is selected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3135', N'Flat must be specified if Floor is selected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3136', N'Final List Price exceed maximum list price set at Rule Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3137', N'Final List Price below minimum list price set at Rule Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3138', N'Unit create fail')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3139', N'Block must be specified if Floor is selected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'314', N'Upload Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3140', N'Either Block or House No. must be input to identify a Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3141', N'Floor sequence must be specified if Floor is selected')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3142', N'Either Floor or House No. must be input to identify a Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3143', N'Gross Floor Area (GFA) is missing.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3144', N'Net Floor Area (NFA) is missing')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3145', N'Gross Floor Area (GFA) must be a positive number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3146', N'Net Floor Area (NFA) must be a positive number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3147', N'Unit {0} has been created before. Please re-enter the unit information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3148', N'Unit''s Gross Floor Area exceed maximum limition set at Rule Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3149', N'Unit''s Gross Floor Area below minimum limition set at Rule Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'315', N'Error Message')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3150', N'Unit''s Net Floor Area exceed maximum limition set at Rule Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3151', N'Unit''s Net Floor Area below minimum limition set at Rule Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3152', N'Floor sequence must be a numeric number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3153', N'Unit Number missing')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3154', N'Matched Result')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3155', N'Make Selected Unit/House Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3156', N'Make Selected Unit/House Reserved')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3157', N'--- Select Unit Type ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3158', N'--- Select Block ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3159', N'--- Select Status ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'316', N'Project System Agreement Number Allocation has been updated successfully!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E ', N'3160', N'Bay Window must be a numeric number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3161', N'Garden must be a numeric number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3162', N'Yard must be a numeric number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3163', N'Terrace must be a numeric number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3164', N'Balcony must be a numeric number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3165', N'Roof must be a numeric number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3166', N'Flat Roof must be a numeric number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'317', N'Exception occurred during updating records!\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3176', N'This field must be a numeric number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3177', N'Flat Roof')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3178', N'File Path')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3179', N'Number of columns and number of Data is not match in row {0}  column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'318', N'Start or End Number must be a non-zero integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3180', N'Import Operation Abort!\nError occur at Row {0} Column {1}\n{2}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3181', N'Import Operation Abort!\nProject ID missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3182', N'Import Operation Abort!\nProject ID exceed 6 characters at Row {0} Column {1} ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3183', N'Import Operation Abort!\nUnit Type Code missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3184', N'Import Operation Abort!\nUnit Type Code exceed 6 characters at Row{0} Column {1} ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3185', N'Import Operation Abort!\nBlock Code missing!\nRow {0} Column{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3186', N'Import Operation Abort!\nBlock Code exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3187', N'Import Operation Abort!\nFloor missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3188', N'Import Operation Abort!\nFloor exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3189', N'Import Operation Abort!\nFloor sequence missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'319', N'No Range is defined!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3190', N'Import Operation Abort!\nFloor sequence is not numeric at Row {0} Colnum {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3191', N'Import Operation Abort!\nFloor sequence exceed 4 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3192', N'Import Operation Abort!\nFlat missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3193', N'Import Operation Abort!\nFlat exceed 3 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3194', N'Import Operation Abort!\nPhase missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3195', N'Import Operation Abort!\nPhase exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3196', N'Import Operation Abort!\nGross Floor Area missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3197', N'Import Operation Abort!\nGross Floor Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3198', N'Import Operation Abort!\nGross Floor Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3199', N'Import Operation Abort!\nDecimal place not allow in Floor sequence at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'320', N'Start Number must greater than the End Number of the previous range!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3200', N'Import Operation Abort!\nFloor sequence must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3201', N'Import Operation Abort!\nGross Floor Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3202', N'Import Operation Abort!\nNet Floor Area missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3203', N'Import Operation Abort!\nNet Floor Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3204', N'Import Operation Abort!\nNet Floor Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3205', N'Import Operation Abort!\nNet Floor Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3206', N'Import Operation Abort!\nTerrace Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3207', N'Import Operation Abort!\nTerrace Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3208', N'Import Operation Abort!\nTerrace Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3209', N'Import Operation Abort!\nGarden Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'321', N'Gap is not allowed between ranges!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3210', N'Import Operation Abort!\nGarden Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3211', N'Import Operation Abort!\nGarden Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3212', N'Import Operation Abort!\nYard Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3213', N'Import Operation Abort!\nYard Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3214', N'Import Operation Abort!\nYard Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3215', N'Import Operation Abort!\nBay Window Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3216', N'Import Operation Abort!\nBay Window Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3217', N'Import Operation Abort!\nBay WindowArea must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3218', N'Import Operation Abort!\nRoof Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3219', N'Import Operation Abort!\nRoof Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'322', N'End Number must greater than the Start Number!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3220', N'Import Operation Abort!\nRoof Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3221', N'Import Operation Abort!\nFlat Roof Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3222', N'Import Operation Abort!\nFlat Roof Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3223', N'Import Operation Abort!\nFlat Roof Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3224', N'Import Operation Abort!\nBalcony Area is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3225', N'Import Operation Abort!\nBalcony Area exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3226', N'Import Operation Abort!\nBalcony Area must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3227', N'Import Operation Abort!\nOther 1 is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3228', N'Import Operation Abort!\nOther 1 exceed 8 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3229', N'Import Operation Abort!\nOther 2 exceed 20 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'323', N'End Number must be specified if Start Number is Entered!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3230', N'Import Operation Abort!\nList Price missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3231', N'Import Operation Abort!\nList Price is not numeric at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3232', N'Import Operation Abort!\nList Price exceed 12 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3233', N'Import Operation Abort!\nList Price must be a positive number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3234', N'Import Operation Abort!\nStatus missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3235', N'Import Operation Abort!\nStatus exceed 1 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3236', N'Import Operation Abort!\nUser ID missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3237', N'Import Operation Abort!\nUser ID exceed 10 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3238', N'Import Operation Abort!\nSolicitor Information missing!\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3239', N'Import Operation Abort!\nSolicitor Information exceed 10 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'324', N'Start Number must be specified if End Number is Entered!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3240', N'Import Operation Abort!\nUnit Deleted missing\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3241', N'Import Operation Abort!\nUnit Deleted exceed 1 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3242', N'Import Operation Abort!\nSales Type exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3243', N'Import Operation Abort!\nDistrict Code missing\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3244', N'Import Operation Abort!\nDistrict Code exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3245', N'Import Operation Abort!\nAnalysis Code 1 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3246', N'Import Operation Abort!\nAnalysis Code 2 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3247', N'Import Operation Abort!\nAnalysis Code 3 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3248', N'Import Operation Abort!\nAnalysis Code 4 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3249', N'Import Operation Abort!\nAnalysis Code 5 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'325', N'Max Amount Per Slot must be a positive integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3250', N'Import Operation Abort!\nAnalysis Code 6 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3251', N'Import Operation Abort!\nAnalysis Code 7 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3252', N'Import Operation Abort!\nAnalysis Code 8 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3253', N'Import Operation Abort!\nAnalysis Code 9 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3254', N'Import Operation Abort!\nAnalysis Code 10 exceed 6 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3255', N'Import Operation Abort!\nPhase ID Incorrect at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3256', N'Import Operation Abort!\nIncorrect Unit Type Code at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3257', N'Import Operation Abort!\nIncorrect Block Code at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3258', N'Import Operation Abort!\nIncorrect Project ID at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3259', N'Import Operation Abort!\nGross Floor Area exceed range set at Rule Maintenance\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'326', N'No Slot is defined!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3260', N'Import Operation Abort!\nNet Floor Area exceed range set at Rule Maintenance\nRow {0} Column {1}	')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3261', N'Import Operation Abort!\nList Price exceed range set at Rule Maintenance\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3262', N'Import Operation Abort!\nIncorrect Solicitor Information at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3263', N'Import Operation Abort!\nIncorrect Sales Type Code at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3264', N'Import Operation Abort!\nIncorrect District Code at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3265', N'Import Operation Abort!\nIncorrect Analysis Code{2} at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3266', N'Import Operation Abort!\nRow {0} Unit information exist in database already')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3267', N'Import Operation Abort!\nIncorrect User ID at Row {0} Column {1}\nUser ID is Case Sensitive')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3268', N'{0} Import Success!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3269', N'Import Operation Abort!\nHouse Number Missing at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'327', N'Gap is not allowed between Slots!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3270', N'Import Operation Abort!\nHouse Nnumber exceed 7 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3271', N'Import Operation Abort!\nStreet Number Missing at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3272', N'Import Operation Abort!\nStreet Number exceed 4 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3273', N'Import Operation Abort!\nStreet CodeMissing at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3274', N'Import Operation Abort!\nStreet Code exceed 4 characters at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3275', N'Import Operation Abort!\nStatus must be in:\n""R"" - Reserved\n""A"" - Avaiable \nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3276', N'Import Operation Abort!\nIncorrect Street Code at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3277', N'Import Operation Abort!\nStreet Number and Street Code can not be empty if House Number provided\nRow {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3278', N'Import Operation Abort!\nEither Park Level or House No must provide.\nRow {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3279', N'Import Operation Abort!\nCarpark Number must provide if Level is not empty.\nRow {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'328', N'No. of Appointment must be a positive integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3280', N'Import Operation Abort!\nEither Carpark number or House Number must provide.\nRow {0} ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3281', N'Import Operation Abort!\nStreet Code exceed 6 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3282', N'Import Operation Abort!\nCarpark Number exceed 6 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3283', N'Import Operation Abort!\nCarpark Level exceed 2 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3284', N'Import Operation Abort!\nHouse number exceed 7 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3285', N'Import Operation Abort!\nStreet number exceed 4 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3286', N'Import Operation Abort!\nCorresponding Unit Code exceed 80 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3287', N'Import Operation Abort!\nCarpark Deleted missing at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3288', N'Import Operation Abort!\nCarpark Deleted exceed 1 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3289', N'Import Operation Abort!\nAnalysis Group exceed 1 numerical number at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'329', N'No. of Appointment must not greater than Max Amount Per Slot!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3290', N'Import Operation Abort!\nCorresponding Unit {0} assigned to Carpark {1}\nAssign another Unit to this carpark at Row {2} ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3291', N'Import Operation Abort!\nUnit {0} not found or deleted. \nAssign this Carpark to another Unit at Row {1} Column 7')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3292', N'Import Operation Abort!\nNo duplicate Unit Code allow \nRow {0} Column 7')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3293', N'Duplicate Carpark Detected!\nCarpark number exist in database. ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3294', N'Analysis Code is mandatory in this project.\nPlease select Analsysis Code in the list. ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3295', N'Please select Analysis Code from drop down list ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3296', N'Both Carpark and Unit status will change\n(if this carpark has corresponding unit assigned)\nContinue?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3297', N'Do you really want to delete the Carpark?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3298', N'Do you really want to delete the Unit?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3299', N'(sqt)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'330', N'Number of Units must be a positive integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3300', N'List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3301', N'Import Operation Abort!\nDuplicate {0} information in Row {1} and Row {2}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3302', N'Import Operation Abort!\nAnalysis Code Missing in Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3303', N'Import Operation Abort!\nAnalysis Code not set in Project Master in Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3304', N'Import Operation Abort!\nCould not assign ""Hold"" (P)  or ""Sold"" (S) status in import file\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3305', N'Carpark Allocation Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3306', N'Selection Criteria')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3307', N'Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3308', N'Generate PDF Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3309', N'Project ID missing')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'331', N'Are you sure to delete this record?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3310', N'*')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3311', N'Analysis Code 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3312', N'Analysis Code 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3313', N'Analysis Code 3')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3314', N'Analysis Code 4')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3315', N'Analysis Code 5')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3316', N'Analysis Code 6')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3317', N'Analysis Code 7')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3318', N'Analysis Code 8')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3319', N'Analysis Code 9')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'332', N'S&P Days must be a positive integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3320', N'Analysis Code 10')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3321', N'Search Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3322', N'Both Carpark and Unit status will change (if selected Unit or Carpark has a corresponding Unit or Carpark assigned),Continue?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3323', N'Import Operation Abort!\nUnit at Row {0} can not import since the status of the Unit is ""{1}""')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3324', N'Carpark Allocation Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3325', N'Sold and Unsold Residential Units Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3326', N'Sold and Unsold Carpark Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3327', N'List of Unsold Residential Unit and Carpark')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3328', N'Sale Report order by Date of Sale')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3329', N'Sales Report - Group by Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'333', N'Min. Deposit Amounts must be a positive number!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3330', N'Sales Report group by Block and Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3331', N'Overdue Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3332', N'Sales Report - Group by Analysis Group and Selling Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3333', N'Exception/Audit Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3334', N'Transfer Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3335', N'This Report is under construction')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3336', N'UAT v0.4')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3337', N'Please enter Import File Path')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3338', N'Corresponding Unit assign fault!\nUnit is in ""Hold"" status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3339', N'Corresponding Unit assign fault!\nUnit has been sold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'334', N'Min. Deposit Amounts are too large!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3340', N'Corresponding Unit assign fault!\nUnit is in ""Hold"" status\nRow{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3341', N'Corresponding Unit assign fault!\nUnit has been sold\nAt Row {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3342', N'Generate Excel Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3343', N'Only Block or House No. should be input to identify a Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3344', N'Only Level or House No. should be input to identify a car park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3345', N'To avoid affecting the system performance, please avoid loading all audit log during bussiness hour.  Are you sure you want to proceed now?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'335', N'Exception occurred during retrieving data!\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'3351', N'The buyer ID is existing in Black List.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'336', N'Balloted')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'337', N'Pending')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'338', N'Closed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'339', N'Undefined')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'340', N'Package ID does not allow chinese or odd characters!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'341', N'Package Adjustment must be a integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'342', N'Package Adjustment is too large!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'343', N'Quota must be a positive integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'344', N'Currency Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'345', N'Analysis Code Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'346', N'Analysis Code Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'347', N'Quota must be greater then Quota Used!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'348', N'Agreement Service Charge Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'349', N'Unit/Car Park Rule Checking Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'350', N'Max')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'351', N'Min')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'352', N'Adjustment Rate must be a numeric value between -100 and 100, \nwith maximum two decimal places!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'353', N'Please enter Relative date!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'354', N'Relative date must be a positive number!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'355', N'Master Calendar Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'356', N'Calendar')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'357', N'Year')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'358', N'No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'359', N'Month')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'360', N'Day')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'361', N'Sunday')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'362', N'General Access Control Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'363', N'Agency Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'364', N'Secondary Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'365', N'----- Select Secondary Currency -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'366', N'You must enter the following fields:{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'367', N'Inactive')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'368', N'Internal Cost must be a  non-negative integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'369', N'Internal Cost is too large!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'370', N'Package Adjustment Percentage must be a number between 0 and 100!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'371', N'Agency Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'372', N'Agency Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'373', N'Package ID already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'374', N'Project ID already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'375', N'Tel. No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'376', N'Agency Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'377', N'Please select schedule of payment!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'378', N'Please input the fixed date!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'379', N'Please input the fixed date in format ""dd-mm-yyyy""!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'380', N'Month cannot be greater than 12!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'381', N'Date must be later than or equal to today!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'382', N'Tel. No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'383', N'Please input the relative date!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'384', N'Relative date must be a non-negative integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'385', N'Please input the remarks!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'386', N'Please input payment amount!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'387', N'Agency Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'388', N'Payment amount must be a non-negative integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'389', N'Please input payment percentage!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'390', N'Payment percentage must be a numeric value between 0 and 100!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'391', N'Payment stage description is too long!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'392', N'The sum of payment percentage should be less than 100%!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'393', N'Method Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'394', N'Cannot delete this agency. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'395', N'Please input the payment stage!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'396', N'Before date description is too long!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'397', N'After date description is too long!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'398', N'Fixed date is too long!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'399', N'Relative date is too long!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'400', N'Remarks is too long!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4000', N'Property Sales System')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4001', N'Screen ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4002', N'(Flat/Floor/Block)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4003', N'(Building/Estate Name)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4004', N'(Street No. & Street Name)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4005', N'(Sub Region)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4006', N'Country/Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4007', N'HK')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4008', N'KLN')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4009', N'NT')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'401', N'Interest Subsidy must be a non-negative integer!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4010', N'China')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4011', N'Overseas')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4012', N'Personal/Joint Buyers')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4013', N'Project Remark')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4014', N'Agreement Remark')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4015', N'Package affecting Contract Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4016', N'Allow Multiple Units for Single Purchaser')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4017', N'Package affecting Contract Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4018', N'----- Select Contact Person -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'402', N'Down - Payment must be a non-negative number!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'403', N'Interest Subsidy is too large!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'404', N'Down - Payment is too large!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'405', N'Save Error. Please look at error log.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'406', N'Analysis District Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'407', N'Analysis District Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'408', N'Analysis District Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'409', N'Analysis District Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'410', N'Cannot delete this analysis district. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4100', N'Solicitor Firm Contact Person Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4101', N'Contact Person Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4102', N'Contact Person Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4103', N'Contact Person Tel No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4104', N'Solicitor Firm Contact Person Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4105', N'Cannot delete this solicitor firm contact person. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4106', N'Contact Person is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4107', N'Next')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4108', N'Print Agreement and Supplemental')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4109', N'Please input Project Remark!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'411', N'District Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4110', N'----- Select Contact Person -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4111', N'Edit Payment Schedule')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4112', N'Void Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4113', N'Solicitor Firm Address')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4114', N'Search Agreement for Re-print')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4115', N'Print')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4116', N'OK')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4117', N'Select a printer:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4118', N'Pay Date:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4119', N'Adjustment:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'412', N'District Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4120', N'List Price after Adjustment:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4121', N'Unit Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4122', N'Unit Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4123', N'--- Select a template ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4124', N'Column Template')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4125', N'Paid Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'4126', N'Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'413', N'District Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'414', N'District Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'415', N'Cannot delete this district. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'416', N'Modify')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'417', N'Block Type Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'418', N'Block Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'419', N'Block Type Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'420', N'Block Type Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'421', N'Cannot delete this block type. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'422', N'Phase Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'423', N'Phase Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'424', N'Phase Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'425', N'Phase Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'426', N'Cannot delete this phase. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'427', N'Unit Type Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'428', N'Unit Type Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'429', N'Unit Type Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'430', N'Unit Type Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'431', N'Cannot delete this unit type. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'432', N'Seq.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'433', N'Currency Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'434', N'Currency Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'435', N'Currency Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'436', N'Cannot delete this currency code. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'437', N'Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'438', N'Currency Rate must be a positive number!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'439', N'Please select the date type!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'440', N'Setup Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'441', N'Project ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'442', N'Sales Type Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'443', N'Sales Type Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'444', N'Sales Type Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'445', N'Cannot delete this sales type code. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'446', N'Sales Type Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'447', N'Rules Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'448', N'Street Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'449', N'Street Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'450', N'Street Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'451', N'Street Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'452', N'Cannot delete this street code. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'453', N'Sales Office Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'454', N'Sales Office Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'455', N'Sales Office Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'456', N'Sales Office Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'457', N'Cannot delete this sales office. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'458', N'UOM Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'459', N'UOM Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'460', N'UOM Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'461', N'Cannot delete this UOM. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'462', N'Bank Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'463', N'Bank Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'464', N'Bank Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'465', N'Bank Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'466', N'Cannot delete this bank. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'467', N'Solicitor Firm Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'468', N'Solicitor Firm Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'469', N'Solicitor Firm Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'470', N'Solicitor Firm Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'471', N'Cannot delete this solicitor firm. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'472', N'Nationality Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'473', N'Nationality Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'474', N'Nationality Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'475', N'Nationality Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'476', N'Cannot delete this nationality. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'477', N'Country Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'478', N'Country Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'479', N'Country Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'480', N'Country Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'481', N'Cannot delete this country. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'482', N'Analysis Code Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'483', N'Agreement Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'484', N'Agreement Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'485', N'Service Charge')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'486', N'Agreement Service Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'487', N'Agreement Service Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'488', N'Cannot delete this agreement service. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'489', N'Service Charge must be a number. (Format:99999.99)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'490', N'Service Charge must be a percentage.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'491', N'Analysis Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'492', N'Analysis Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'493', N'Cannot delete this analysis code. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'494', N'Analysis Group Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'495', N'Analysis Group Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'496', N'Analysis Group Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'497', N'Analysis Group Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'498', N'Analysis Group Codeis not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'499', N'Cannot delete this analysis group. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'500', N'Property Particulars For Analysis Group')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5000', N'Passport')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5001', N'Confirm & Print')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5002', N'Confirm & View')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5003', N'Cancel Confirmation')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5004', N'Negotiation Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5005', N'Credit Card Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5006', N'Card Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5007', N'Card No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5008', N'Expiry Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5009', N'Card Holder Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'501', N'- Minimum List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5010', N'Approval Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5011', N'Edit Payment Schedule')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5012', N'Please input authorization username and password and press ""OK"" or press ""Cancel"" to modify your payment schedule.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5013', N'Visa')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5014', N'MC')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5015', N'Confirm, Go to Unit Selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5016', N'Confirm & Create Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5017', N'Maximum selection limit reached')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5018', N'Package Adjustment on Contract Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5019', N'Authentication Failed!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'502', N'- Maximum List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5020', N'Visa/MC')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5021', N'Paid amount cannot be more than the scheduled amount!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5022', N'Void & Re-Create Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5023', N'Contract Price (After Round Down)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5024', N'EAA License/Staff ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5025', N'Before')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5026', N'After')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5027', N'Total')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5028', N'Contract Price (Before Round Down)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5029', N'Round Down')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'503', N'- Minimum Unit Gross Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5030', N'Package Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5031', N'Package Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5032', N'Package Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5033', N'Modify current agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5034', N'Modify Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5035', N'Confirm, Select Linked Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5036', N'View')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5037', N'Last Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5038', N'Please input authorization username and password and press ""OK"" in order to void this agreement.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5039', N'Total Units (Project)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'504', N'- Maximum Unit Gross Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5040', N'Total Units (Phase)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5041', N'Import Operation Abort!\nShould assign ""Price"" (P)  or ""Rate"" (R) status in import file\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5042', N'Import Operation Abort!\nShould assign ""Percent"" (P)  or ""Dollars"" (D) status in import file\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5043', N'Import Operation Abort!\nShould assign numeric in import file\nRow {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'5044', N'Import Operation Abort!\nInvalid Add Car Park List Price Before Adjustment Value  at Row {0} Column {1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'505', N'- Minimum Unit Net Floor Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'506', N'- Maximum Unit Net Floor Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'507', N'- Minimum Car Park List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'508', N'- Maximum Car Park List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'509', N'Please enter positive integer for the following fields:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'510', N'The following fields are not in the format 99999999.99:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'511', N'The following fields are not in the format 999999.99:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'512', N'- List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'513', N'The max. value must be larger than the min. value for the following fields:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'514', N'- Unit Gross Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'515', N'- Unit Net Floor Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'516', N'- Car Park List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'517', N'Are you sure to save the information?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'518', N'Save Complete.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'519', N'Function Group')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'520', N'---- Select Function Group -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'521', N'Agreement Transfer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'522', N'Payment FollowUp')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'523', N'Please Select a Function Group')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'524', N'Function ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'525', N'Function Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'526', N'Access Level')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'527', N'Sales Ambassador')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'528', N'Sales Supervisor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'529', N'Senior Officer')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'530', N'Assistant Manager')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'531', N'Senior Manager')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'532', N'System Administrator')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'533', N'Jan')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'534', N'Feb')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'535', N'Mar')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'536', N'Apr')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'537', N'May')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'538', N'Jun')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'539', N'Jul')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'540', N'Aug')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'541', N'Sep')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'542', N'Oct')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'543', N'Nov')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'544', N'Dec')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'545', N'User Profile Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'546', N'Add User')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'547', N'Browse User')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'548', N'Modify User')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'549', N'Delete User')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'550', N'Skipped Dates:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'551', N'No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'552', N'User Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'553', N'User ID:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'554', N'Re-type Password:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'555', N'Surname/Given Name:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'556', N'Password:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'557', N'Re-type Password')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'558', N'Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'559', N'Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'560', N'Commission')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'561', N'Commission must be a percentage.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'562', N'ID:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'563', N'ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'564', N'Sex:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'565', N'Telephone No.:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'566', N'E-mail Address:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'567', N'Address:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'568', N'Expiry Date:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'569', N'(dd-mm-yyyy)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'570', N'Expiry Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'571', N'Access Level:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'572', N'--- Select Access Level ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'573', N'Male')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'574', N'Female')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'575', N'Project Access')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'576', N'Access')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'578', N'Password and Confirm Password must be same.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'579', N'is not a valid HK ID No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'580', N'Expiry Date Format is not correct.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'581', N'Expiry Date should not earlier than today.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'582', N'At least one Project must be selected.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'583', N'User ID already exists.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'584', N'User is successfully added to the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'585', N'Terminated')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'586', N'Search User')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'587', N'Selection Criteria')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'588', N'Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'589', N'Project Access:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'590', N'-- All --')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'591', N'--- Select Project ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'592', N'Cannot delete this user. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'593', N'New Password:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'594', N'User ID cannot be found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'595', N'Special User Access Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'596', N'Modify User Access')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'597', N'Browse User Access')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'598', N'User Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'599', N'ID No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6001', N'You have changed the Agreement Date previously.\nPlease make sure you re-select the payment method to refresh the S&P Date and Payment Schedule!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6002', N'S&P Date does not align with the agreement date, are you sure you want to save this payment schedule?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6003', N'You have changed the Agreement Date previously.\nPlease make sure you re-select the payment method to refresh the SPC Date and Payment Schedule!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6004', N'SPC Date does not align with the agreement date, are you sure you want to save this payment schedule?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6005', N'Current Password')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6006', N'New Password')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6007', N'Re-Type New Password')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6008', N'Reset Password')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6009', N'New Password does not match with the re-type new password!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'601', N'[Sales Ambassador]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6010', N'Password Changed!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6011', N'Invalid old password!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6012', N'您的密碼強度不足\n要想使你的密碼更安全，可採取以下方法:\n- 字元數應在 8 至 16 之間\n- 使用字母和數字\n- 使用特殊字元 (如 @)\n- 混合使用大小寫')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6013', N'Fax')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6014', N'Telephone')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6015', N'The license limit of PSMS has been reached.\nPlease contact you system administrator for purchasing more user licenses.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6016', N'Language')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6017', N'English')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6018', N'繁體')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6019', N'HSE: ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'602', N'[Sales Supervisor]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6020', N'Unsold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6021', N'Agreement - Sales')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6022', N'Agreement - Account')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6023', N'Car Park - Sales')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6024', N'Unit - Sales')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6025', N'Project Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6026', N'Client Identity')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6027', N'Agreement Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6028', N'Purchaser Gender')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6029', N'Purchaser ID Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'603', N'[Senior Officer]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6030', N'Purchaser Date Of Birth')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6031', N'Purchaser Nationality')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6032', N'1st Joint Buyer Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6033', N'1st Joint Buyer Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6034', N'1st Joint Buyer Gender')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6035', N'1st Joint Buyer ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6036', N'1st Joint Buyer ID Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6037', N'1st Joint Buyer Date Of Birth')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6038', N'1st Joint Buyer Nationality')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6039', N'2nd Joint Buyer Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'604', N'[Assistant Manager]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6040', N'2nd Joint Buyer Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6041', N'2nd Joint Buyer Gender')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6042', N'2nd Joint Buyer ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6043', N'2nd Joint Buyer ID Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6044', N'2nd Joint Buyer Date Of Birth')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6045', N'2nd Joint Buyer Nationality')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6046', N'3rd Joint Buyer Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6047', N'3rd Joint Buyer Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6048', N'3rd Joint Buyer Gender')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6049', N'3rd Joint Buyer ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'605', N'[Senior Manager]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6050', N'3rd Joint Buyer ID Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6051', N'3rd Joint Buyer Date Of Birth')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6052', N'3rd Joint Buyer Nationality')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6053', N'Company BR Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6054', N'1st Director Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6055', N'1st Director Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6056', N'1st Director Gender')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6057', N'1st Director ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6058', N'1st Director ID Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6059', N'1st Director Date Of Birth')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'606', N'[System Administrator]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6060', N'1st Director Nationality')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6061', N'2nd Director Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6062', N'2nd Director Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6063', N'2nd Director ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6064', N'2nd Director ID Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6065', N'Contact Person Address 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6066', N'Contact Person Address 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6067', N'Contact Person Address 3')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6068', N'Contact Person District')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6069', N'Contact Person Region')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'607', N'Function Access Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6070', N'Contact Person Country')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6071', N'Contact Person Home Phone')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6072', N'Contact Person Office Phone')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6073', N'Contact Person Mobile Phone')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6074', N'Contact Person Fax')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6075', N'Contact Person Email Address')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6076', N'Contact Person Analysis District')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6077', N'Unit Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6078', N'Unit Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6079', N'Unit Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'608', N'Nothing Change.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6080', N'Unit Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6081', N'Unit House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6082', N'Unit Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6083', N'Unit Street')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6084', N'Unit GFA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6085', N'Unit SA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6086', N'Unit List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6087', N'Car Park Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6088', N'Car Park Level')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6089', N'Car Park House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'609', N'Unit / Car Park Selection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6090', N'Car Park Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6091', N'Car Park Street')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6092', N'Solicitor Firm Contact Person')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6093', N'S&P Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6094', N'Agent Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6095', N'Agent ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6096', N'Agent ID Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6097', N'Agent Phone')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6098', N'Agreement Base Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6099', N'Agreement Base Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'610', N'Purchaser Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6100', N'Agreement Secondary Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6101', N'Agreement Secondary Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6102', N'Cash Rebate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6103', N'Agreement Contract Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6104', N'Agreement Net Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6105', N'Agreement Remarks')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6106', N'Agreement Deleted')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6107', N'Agreement Print Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6108', N'PASP Signed Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6109', N'Void Refund')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'611', N'Purchaser ID:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6110', N'Void Remarks')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6111', N'Create Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6112', N'Update Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6113', N'1st Package')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6114', N'1st Package Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6115', N'1st Package Internal Cost')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6116', N'2nd Package')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6117', N'2nd Package Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6118', N'2nd Package Internal Cost')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6119', N'3rd Package')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'612', N'Purchaser ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6120', N'3rd Package Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6121', N'3rd Package Internal Cost')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6122', N'4th Package')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6123', N'4th Package Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6124', N'4th Package Internal Cost')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6125', N'5th Package')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6126', N'5th Package Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6127', N'5th Package Internal Cost')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6128', N'Adjustment Percentage')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6129', N'Is 1st Payment Down - Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'613', N'Unit Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6130', N'1st Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6131', N'1st Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6132', N'1st Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6133', N'1st Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6134', N'1st Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6135', N'1st Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6136', N'1st Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6137', N'1st Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6138', N'2nd Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6139', N'2nd Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'614', N'Development:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6140', N'2nd Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6141', N'2nd Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6142', N'2nd Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6143', N'2nd Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6144', N'2nd Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6145', N'2nd Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6146', N'3rd Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6147', N'3rd Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6148', N'3rd Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6149', N'3rd Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'615', N'Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6150', N'3rd Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6151', N'3rd Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6152', N'3rd Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6153', N'3rd Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6154', N'4th Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6155', N'4th Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6156', N'4th Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6157', N'4th Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6158', N'4th Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6159', N'4th Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'616', N'Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6160', N'4th Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6161', N'4th Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6162', N'5th Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6163', N'5th Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6164', N'5th Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6165', N'5th Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6166', N'5th Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6167', N'5th Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6168', N'5th Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6169', N'5th Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'617', N'Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6170', N'1st Mortgage Bank')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6171', N'1st Mortgage Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6172', N'2nd Mortgage Bank')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6173', N'2nd Mortgage Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6174', N'Assignee Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6175', N'Transfer Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6176', N'Transfer Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6177', N'Transfer Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6178', N'Assignee Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6179', N'Assignee Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'618', N'Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6180', N'Assignee Gender')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6181', N'Assignee ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6182', N'Assignee ID Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6183', N'Assignee Date Of Birth')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6184', N'Assignee Nationality')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6185', N'Transfer Remarks')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6186', N'Corresponding Unit Phase')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6189', N'Corresponding Unit Block')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'619', N'House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6190', N'Corresponding Unit Floor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6191', N'Corresponding Unit Flat')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6192', N'Corresponding Unit House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6193', N'Corresponding Unit Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6194', N'Corresponding Unit Street')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6195', N'(English)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6196', N'Project Name (English)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6197', N'Project Name (Chinese)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6198', N'Add Car Park Price Before Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6199', N'On Hold By (Client Identity)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'620', N'Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6200', N'Car Park Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6201', N'Car Park Deleted')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6202', N'Analysis Group 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6203', N'Analysis Group 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6204', N'Bay Window Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6205', N'Balcony Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6206', N'Roof Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6207', N'Terrace Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6208', N'Garden Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6209', N'Mark All Sundays')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'621', N'Street Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6210', N'Yard Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6211', N'GO')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6212', N'Flat Roof Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6213', N'Label 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6214', N'Label 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6215', N'Unit Deleted')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6216', N'Analysis Group 3')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6217', N'Analysis Group 4')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6218', N'Analysis Group 5')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6219', N'Analysis Group 6')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'622', N'For Reserved Unit, please type in Overriding User ID and Password.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6220', N'Analysis Group 7')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6221', N'Analysis Group 8')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6222', N'Analysis Group 9')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6223', N'Analysis Group 10')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6224', N'Region Description')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6225', N'Browse..')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6226', N'Import Operation Abort!\nIf Street Name has been specified, Street Number must be specified at Row {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6227', N'Import Operation Abort!\nIf Street Number has been specified, Street Name must be specified at Row {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6228', N'Import Operation Abort!\nEither Level or House No. must be input to identify a car park at Row {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6229', N'Import Operation Abort!\nCar Park Number must be specified if Level is selected at Row {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'623', N'Submit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6230', N'Import Operation Abort!\nLevel must be specified if Car Park Number is selected at Row {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6231', N'Import Operation Abort!\nOnly Level or House No. should be input to identify a car park at Row {0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6232', N'Other 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6233', N'Other 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6234', N'Adjustment Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6235', N'Adjustment Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6236', N'Adjustment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6237', N'Upload User ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6238', N'Solicitor Contact Person Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6239', N'Street Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'624', N'Either Block or House must be selected.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6240', N'Unit Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6241', N'No Analysis Group')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'625', N'Only one block or one house should be selected.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'626', N'Floor must be specified.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'627', N'Do you want to confirm the unit selection?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'628', N'Unsuccessful Selection.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'629', N'The unit is not existed.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'630', N'The unit is deleted.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6300', N'Section')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6301', N'Block No. of Section')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6302', N'Register No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6304', N'Identity Card Holder?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6305', N'Cheque Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6306', N'Buyer Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6308', N'Surname')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6309', N'Given Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'631', N'The unit is ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6310', N'Contact Person')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6311', N'Address 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6312', N'Address 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6313', N'Address 3')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6314', N'Address 4')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6315', N'Country')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6316', N'Tel.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6317', N'Office Tel.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6318', N'Mobile')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6319', N'Fax')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'632', N'Unsuccessful Multiple Selection.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6320', N'Email')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6321', N'Director Surname 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6322', N'Director Given Name 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6323', N'Director Surname 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6324', N'Director Given Name 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6325', N'Purchaser Type of Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6326', N'Show Contact Person Only')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6327', N'S&P Days')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6328', N'Buyer Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6329', N'Buyer/Director Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'633', N'Please enter overriding user id and password.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6330', N'Agreement No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6334', N'Identity Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6335', N'Chinese Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6336', N'English Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6337', N'Contact Person Phone No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6338', N'Company Representative 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6339', N'Company Representative 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'634', N'The overriding user id has no authority to perform this.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6340', N'Quantity')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6341', N'Hong Kong Identity Card No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6342', N'Length of Macau Identity Card No. must be 8')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6343', N'銀聯')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6344', N'AE')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6345', N'Are you sure to continues?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6346', N'Chinese Name or English Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'635', N'The overriding user password is not correct.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6351', N'Formal Agreement Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6352', N'Marital Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6353', N'Single')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6354', N'Married')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6355', N'Divorced')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6356', N'Widowed')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6357', N'Unknown')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6358', N'Preliminary Agreement Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6359', N'Formal Agreement Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'636', N'Flat must be specified.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6360', N'Preliminary Agreement Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6361', N'Create Formal Agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6362', N'Modify Formal Agreement?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6364', N'Preliminary Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6365', N'Formal Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6366', N'Search Formal Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6367', N'Create Formal Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6368', N'Confirm Formal Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6369', N'Browse Formal Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'637', N'Street No. must be specified.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6370', N'Modify Formal Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6371', N'Void Formal Agreement')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6372', N'Void Remark')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6373', N'Module Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6374', N'--- Select Module ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6375', N'--')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6379', N'Purchaser Surname (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'638', N'Street Name must be specified.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6380', N'Purchaser Given Name (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6381', N'Purchaser Gender (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6382', N'Purchaser ID (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6383', N'Purchaser ID Type (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6384', N'Purchaser Date Of Birth (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6385', N'Purchaser Nationality (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6386', N'1st Joint Buyer Surname (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6387', N'1st Joint Buyer Given Name (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6388', N'1st Joint Buyer Gender (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6389', N'1st Joint Buyer ID (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'639', N'Sold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6390', N'1st Joint Buyer ID Type (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6391', N'1st Joint Buyer Date Of Birth (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6392', N'1st Joint Buyer Nationality (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6393', N'2nd Joint Buyer Surname (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6394', N'2nd Joint Buyer Given Name (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6395', N'2nd Joint Buyer Gender (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6396', N'2nd Joint Buyer ID (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6397', N'2nd Joint Buyer ID Type (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6398', N'2nd Joint Buyer Date Of Birth (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6399', N'2nd Joint Buyer Nationality (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'640', N'belongs to this unit. Do you want to select it also?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6400', N'3rd Joint Buyer Surname (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6401', N'3rd Joint Buyer Given Name (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6402', N'3rd Joint Buyer Gender (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6403', N'3rd Joint Buyer ID (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6404', N'3rd Joint Buyer ID Type (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6405', N'3rd Joint Buyer Date Of Birth (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6406', N'3rd Joint Buyer Nationality (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6407', N'Company Name (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6408', N'Company BR Number (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6409', N'1st Director Surname (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'641', N'Car Park Selection - Submit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6410', N'1st Director Given Name (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6411', N'1st Director Gender (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6412', N'1st Director ID (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6413', N'1st Director ID Type (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6414', N'1st Director Date Of Birth (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6415', N'1st Director Nationality (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6416', N'2nd Director Surname (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6417', N'2nd Director Given Name (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6418', N'2nd Director ID (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6419', N'2nd Director ID Type (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'642', N'Car Park No.:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6420', N'Contact Person Name (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6421', N'Contact Person Address 1 (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6422', N'Contact Person Address 2 (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6423', N'Contact Person Address 3 (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6424', N'Contact Person District (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6425', N'Contact Person Region (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6426', N'Contact Person Country (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6427', N'Contact Person Home Phone (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6428', N'Contact Person Office Phone (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6429', N'Contact Person Mobile Phone (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'643', N'Level:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6430', N'Contact Person Fax (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6431', N'Contact Person Email Address (Formal Agreement)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6432', N'Contract/Net Price and Payment Plan could not be loaded due to incomplete Agreement Modification Process. Please check the payment plan and transactions details of the preliminary agreement again.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'645', N'hold')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'646', N'Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'647', N'Project Base Currency:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'648', N'Special Access Right')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'649', N'Select Reserved Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'650', N'Overdue Penalty')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6501', N'6th Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6502', N'6th Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6503', N'6th Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6504', N'6th Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6505', N'6th Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6506', N'6th Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6507', N'6th Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6508', N'6th Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6509', N'7th Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'651', N'Insufficient Deposit of First Payment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6510', N'7th Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6511', N'7th Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6512', N'7th Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6513', N'7th Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6514', N'7th Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6515', N'7th Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6516', N'7th Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6517', N'8th Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6518', N'8th Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6519', N'8th Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'652', N'Company:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6520', N'8th Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6521', N'8th Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6522', N'8th Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6523', N'8th Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6524', N'8th Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6525', N'9th Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6526', N'9th Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6527', N'9th Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6528', N'9th Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6529', N'9th Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'653', N'Purchaser ID:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6530', N'9th Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6531', N'9th Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6532', N'9th Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6533', N'10th Payment Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6534', N'10th Payment Due Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6535', N'10th Payment Before Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6536', N'10th Payment After Date Desc')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6537', N'10th Payment Amount')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6538', N'10th Payment Currency')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6539', N'10th Payment Currency Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'654', N'Selected unit is a reserved unit. Please enter overriding user id and password in order to select it.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6540', N'10th Payment Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6541', N'Confirmed Agreement Number')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6542', N'Overdue Payment Case Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6543', N'Date cannot be empty!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6544', N'From Date should be later than current date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6545', N'Deadline')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6546', N'Show ''Remarks'' Record(s)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6547', N'Agreement/Transfer Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6548', N'Other Income')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6549', N'Date 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'655', N'Unsuccessful Reserved Unit Selection.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6550', N'Date 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6551', N'Date 3')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6552', N'Date 4')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6553', N'Date 5')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6554', N'Log to Register of Transaction')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6555', N'Log to Register of Transaction Remarks')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6556', N'Has Relationship with Vendor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6557', N'Average contract price per GFA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6558', N'Average contract price per SA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6559', N'Average list price per GFA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'656', N'The overriding user id has no authority to select a reserved unit.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6560', N'Average list price per SA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6561', N'Average net price per GFA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6562', N'Average net price per SA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6563', N'ASP date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6564', N'ASP Signing Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'6565', N'ASP Signing Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'657', N'Successful unit selection. The unit:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'658', N'is selected and is put to Hold status.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'659', N'Either Car Park No. or House No. must be input.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'660', N'Only one level or one house should be selected.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'661', N'Either Level or House No. must be specified.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'662', N'Do you want to confirm the car park selection?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'663', N'The car park is not existed.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'664', N'The car park is deleted.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'665', N'The cark park is')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'666', N'Selected car park is a reserved car park. Please enter overriding user id and password in order to select it.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'667', N'For Reserved Car Park, please type in Overriding User ID and Password.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'668', N'Unsuccessful Reserved Car Park Selection.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'669', N'The overriding user id has no authority to select a reserved car park.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'670', N'This car park corresponds to unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'671', N'In order to select it, the system has to break the linkage between the unit and the car park.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'672', N'Do you want to perform this?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'673', N'Successful car park selection.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'674', N'The car park:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'675', N'The unit:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'676', N'Unit / Car Park Deselection')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'677', N'Find')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'678', N'De-select')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'679', N'Check to de-select unit and/or corresponding car park.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'680', N'Please enter Purchaser ID.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'681', N'Check to de-select car park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'682', N'No unit or car park has de-selected.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'683', N'Are you sure to de-select the unit / car park?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'684', N'Corr. Car Park ID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'685', N'Deselect Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'686', N'Deselect Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'687', N'Do you want to de-select the corresponding car park as well?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'688', N'De-select the car park will also de-select the unit. Do you want to continue?''')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'689', N'unit(s)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'690', N'and')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'691', N'car park(s) have been de-selected successfully.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'692', N'Unit Selection History')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'693', N'Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'694', N'Selection Date Format is not correct.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'695', N'Unit Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'696', N'Floor Sequence')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'697', N'District')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'698', N'Solicitor Firm')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'699', N'List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'700', N'Sales Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'7001', N'Identity Card No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'701', N'Gross Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'702', N'Usable Area')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'703', N'Bay Window')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'704', N'Garden')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'705', N'Yard')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'706', N'Terrace')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'707', N'Balcony')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'708', N'Roof')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'709', N'Flat Roof')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'710', N'Additional1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'711', N'Additional2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'712', N'System Agreement No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'713', N'Agreement Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'714', N'Back')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'715', N'Total Number:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'716', N'[Quit]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'717', N'[Top]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'718', N'Car Park Selection History')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'719', N'Unit Deselection History')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'720', N'Make Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'721', N'Are you sure to make this unit available?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'722', N'The unit status has changed to Available.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'723', N'Fail to make this unit available because the record has been modified by other users.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'724', N'Car Park Deselection History')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'725', N'Car Park Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'726', N'Selection Date:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'727', N'Deselection Date:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'728', N'Are you sure to make this car park available?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'729', N'Fail to make this car park available because the record has been modified by other users.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'730', N'The car park status has changed to Available.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'731', N'Selection Result')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'732', N'Refresh Interval')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'733', N'Seconds')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'734', N'Show Sold/Reserved Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'735', N'Please Check The Blocks/Houses For Viewing and Input the Display Sequence in Ascending Order')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'736', N'Display Sequence')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'737', N'View')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'740', N'Floor Sequence Error')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'741', N'Select All')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'742', N'Deselect All')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'743', N'Colour Setup')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'744', N'Unit Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'745', N'Current Value')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'746', N'New Value')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'747', N'Available')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'748', N'Please select at least one new colour value.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'749', N'Please select at least one block or house to view.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'750', N'Please specify the refresh interval.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'751', N'Refresh interval must be a positive integer.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'752', N'Please specify the display sequence.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'753', N'Display sequence must be a positive integer.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'754', N'Display sequence cannot be duplicated.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'755', N'Down - Payment Refund')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'756', N'Corresponding Car Park:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'757', N'Sold & Unsold Residential Units Report')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'758', N'Package Adjustment must be a numeric value between -100 and 100!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'759', N'List of Unsold Unit and Carpark')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'760', N'--- Select Analysis Group ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'761', N'--- Select Function Name ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'762', N'Add Car Park Price Before/After Adjustment')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'763', N'Vendor')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'764', N'Vendor Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'765', N'No unit/car park can be displayed.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'766', N'The input value is too long to be displayed on the Agreement.\nYou can input 130 English characters or 65 Chinese characters for each remark field.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'767', N'The name is too long to be displayed on the Agreement.\nYou can input 70 English or 35 Chinese characters for each surname + given name.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'768', N'The input value is too long to be displayed on the Agreement.\nYou can input 50 English characters or 25 Chinese characters for each address line.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'769', N'The company name is too long to be displayed on the Agreement.\nYou can input 50 English characters or 25 Chinese characters for the company name.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'770', N'Credit Card')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'771', N'Information of the same card are different')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'772', N'<span style=""color:red; font-weight:bold;"">Floor sequence inconsistent in units of floor(s):<br>{0}</span>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'773', N'Floor Sequence inconsistent in units!\nPlease correct the error first.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'774', N'Confirm Agreement Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'775', N'Save Buyer Information')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'776', N'Price Range')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'777', N'Stamp Duty Amount Formula')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'778', N'Stamp Duty Set Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'779', N'Stamp Duty Set Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'780', N'Number of Price Ranges')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'781', N'Cannot delete this stamp duty set.\nIt is currently used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'782', N'Stamp Duty Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'783', N'Include Stamp Duty')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'784', N'Waive Stamp Duty')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'785', N'Add New Stamp Duty Set')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'786', N'Modify Stamp Duty Set')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'787', N'Delete Stamp Duty Set')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'788', N'Browse Stamp Duty Set')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'789', N'Number Of Price Ranges cannot be smaller than the previous selected value!\nPlease use the delete button next to each price range row to remove unnecessary rows!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'790', N'No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'791', N'Below or Equal To')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'792', N'Above or Equal To')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'793', N' - ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'794', N' + ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'795', N' ( ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'796', N' ) ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'797', N' X ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'798', N' % ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'799', N'Contract Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'800', N'Relative to Agreement Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'801', N'Status')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'802', N'GFA')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'803', N'Unit Rate')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'804', N'List Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'805', N'Payment Method Price')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'806', N'Date Time')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'807', N'User')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'808', N'Show Items')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'809', N'Available Payment Methods')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'81', N'[Search By Purchaser]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'810', N'Selected Payment Methods')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'811', N'Relative to S&P Date')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'812', N'[Search By Unit]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'813', N'[Search By Car Park]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'815', N'System Hold Time')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'816', N'Check to de-select car park (Car Park Hold Only)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'820', N'Project Display Setup')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'821', N'Please select at least one payment method for display')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'822', N'System will not hold Unit nor Car Park status!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'823', N'FS10 - Unit/Car Park Selection (View Page)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'824', N'Release')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'825', N'Check to release unit and/or corresponding car park.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'826', N'Check to release car park (Car Park Hold Only)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'827', N'Release System On-Hold Unit/Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'828', N'Unit/Car Park Not Availabe for selection! Refresh your screen to view latest status.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'829', N'Amount should be greater than zero')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'830', N'Card Type')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'850', N'Bank Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'851', N'Solicitor Firm Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'852', N'District Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'853', N'Sales Office Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'854', N'Release Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'855', N'Release Car Park')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'856', N'Agency Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'857', N'UOM Description already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'858', N'Nationality Description already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'859', N'Phase Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'860', N'Sales Type Description already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'861', N'Country Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'862', N'Analysis Group Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'863', N'Method Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'864', N'Package Description already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'865', N'Block Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'866', N'Description already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'867', N'Street Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'868', N'Project Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'869', N'Project Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'871', N'Region Code')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'872', N'Region Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'873', N'Region Code already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'874', N'Region Code is not found.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'875', N'Cannot delete this region. It is used by the system.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'876', N'Region Maintenance')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'877', N'Region')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'878', N' ----- Select Region -----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'879', N'Browse Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'880', N'Modify Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'881', N'Delete Unit')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'882', N'Utility Platform')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'883', N'AC Room')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'884', N'AC Platform')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'885', N'Utility Platform must a numeric number.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'886', N'AC Room must a numeric number.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'887', N'AC Platform must a numeric number.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'888', N'Block / House No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'889', N'Flat / Street No.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'890', N'Floor / Street Name')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'891', N'Region Name already exists!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'892', N'District must be select if Region is selected!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'893', N'No Record Found!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'894', N'Save Status Only')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'895', N'(Cashs)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'896', N'(Cheque)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'897', N'(Credit Card)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'898', N'HKID')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'899', N'(Chinese)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'9994', N'Invalid PSMS Licence, please inform your system administrator immediately.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'9995', N'The system will still be valid for use for ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'9996', N' day(s)!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'9997', N'Invalid PSMS Licence, you are not authorized to use the system. ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'9998', N'Please inform your system administrator immediately.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'E', N'9999', N'Your evaluation period will expire on Aug 1 2006!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'001', N'更新成功!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'002', N'更新失敗!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'003', N'{0}找不到,請在這符合的單位重新輸入資料!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'004', N'{0}已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'005', N'刪除成功!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'010', N'{0}已被選擇處於待定狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'011', N'{0}找不到')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'012', N'{0}已被刪除及並未生效')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'013', N'{0}並未生效')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'014', N'{0}已被複製')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'015', N'{0}未被授權去執行')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'016', N'{0}不相同')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'017', N'這項目未初始化!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'018', N'{0}已經抽籤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'019', N'{0}成功地抽籤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'020', N'登記編號已經存在或者超出範圍!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'021', N'這項目不准許重複登記!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'022', N'你不能進入這系統因為你未登錄\n或你登入已逾時，請重新登入!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'023', N'登入失敗，請重新登入!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'024', N'{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'025', N'{0}已被系統使用，無法被刪除!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'026', N'{0}已被系統使用!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'027', N'{0}不能查詢一份現存的合約!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'028', N'這配套是長期留在選購!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'029', N'未找到記錄資料!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'030', N'做一份合約前先選擇單位或車位!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'031', N'*有部份記錄是無效，請查詢UPLOAD_MSG')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'032', N'上載成功!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'033', N'檔案無效!未能打開指定檔案')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'034', N'{0}已經登記.\n不能重複登記!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'035', N'由於資料是無效的，請核對你的檔案及再次上載!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'036', N'由於沒有足夠資料，請核對你的檔案及再次上載!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'037', N'表格上沒有記錄!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'038', N'在抽籤中這郡組部分未被設定!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'039', N'登記類別未被新增!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'040', N'這項目抽籤程序進行中!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'041', N'已選擇的單位/車位並未找到!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'042', N'在登記之前請適當地設定編號範圍!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'043', N'登記編號更新成功!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'044', N'用戶已完成問卷調查.不能更改或刪除!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'045', N'請為這項目適當地設定系統合約編號範圍!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'046', N'{0}已超出範圍!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'047', N'抽籤設定完成!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'048', N'這項目郡組部分未被設定!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'049', N'這項目的項目郡組未被設定!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'050', N'你的要求已成功地加到資料庫')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'051', N'對不起，你未授權登入這項目!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'052', N'一定要輸入系統合約編號、抽籤指示或未經預約指示!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'053', N'這單位/車位已被申請人選擇!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'054', N'{0}已被系統使用!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'055', N'{0}已被問卷調查使用及不能更改!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'056', N'{0}沒有一個付款計劃及並未批准確認!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'057', N'已選單位並未生效,無法刪除!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'058', N'{0}已被系統使用!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'059', N'不能同時輸入抽籤指示及未經預約指示!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'060', N'成功刪除!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'061', N'{0}已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'062', N'不能同時輸入登記編號及未經預約指示!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'063', N'{0}並未確認!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'064', N'{0}並不存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'065', N'{0}已生效!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'066', N'{0}是重複的!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'067', N'{0}並未抽籤,不能轉讓!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'068', N'登記資料已轉讓!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'069', N'')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'070', N'沒有記錄可以轉讓!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'071', N'{0}登記資料不能無效或被取消!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'072', N'匯入失敗\n\n項目編號不配對!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'073', N'{0}並未確認因此不會被轉讓到未付餘額款項!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'074', N'{0}已選擇一個單位!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'075', N'{0}已選擇一個車位!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'076', N'請在這項目適當地設定付款方法!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'077', N'已選擇的車位並未生效，不能刪除!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'078', N'{0}有車位及不能刪除\n刪除單位前請先刪除車位!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'079', N'{0}並不在''確認''狀態，因此不能成為一個主要合約!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'080', N'你沒有足夠授權去刪除用戶!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'081', N'{0}有一個銀行匯票被使用了，請找管理人員協助!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'082', N'這單位的合約己完成了,合約內其他未被選擇單位請作無效!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'083', N'{0}被使用了.請找管理人員在協助!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'084', N'{0}被使用了在一個完成合約.不准許轉讓到未付餘額.請找管理人員協助!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'085', N'你沒有權利進入\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'086', N'物業銷售系統')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'087', N'銷售處')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'088', N'項目')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'089', N'用戶編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'090', N'密碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'091', N'登入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'092', N'重新設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'093', N'你需要在以下地方輸入資料:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'094', N'項目編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'095', N'顯示編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'096', N'登出')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'097', N'合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'098', N'主選單')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'099', N'買家登記')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'100', N'單位選購')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1001', N'合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1002', N'合約管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1003', N'取消合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1004', N'列印合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1005', N'合約郵寄名單管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1006', N'匯出合約郵寄名單')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1007', N'記錄合約簽署')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1008', N'搜尋購買者編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1009', N'系統合約編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'101', N'合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1010', N'搜尋')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1011', N'購買者編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1012', N'合約狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1013', N'合約日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1014', N'由')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1015', N'至')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1016', N'顯示合約為')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1017', N'開啟')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1018', N'確認')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1019', N'取消')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'102', N'項目管理模組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1020', N'無效')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1021', N'單位及車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1022', N'只有單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1023', N'只有車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1024', N'-----選擇合約狀態-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1025', N'單位/車位(不包括無效及取消合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1026', N'項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1027', N'項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1028', N'大廈')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1029', N'(只適用於單位)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'103', N'報告')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1030', N'樓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1031', N'房號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1032', N'樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1033', N'街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1034', N'街道')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1035', N'時間表已經新增在律師{0}!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1036', N'新增合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1037', N'確認合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1038', N'瀏覽合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1039', N'修改合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'104', N'系統管理模組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1040', N'搜尋已選單位/車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1041', N'驗樓師')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1042', N'大廈')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1043', N'樓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1044', N'房號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1045', N'樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1046', N'街道')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1047', N'合適的單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1048', N'合適的車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1049', N'車位編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'105', N'新增項目')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1050', N'車位號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1051', N'層')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1052', N'無效的合約管理指令!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1053', N'新合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1054', N'購買者類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1055', N'合約日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1056', N'主要的合約編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1057', N'-----選擇購買者類別-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1058', N'無效的購買者編號!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1059', N'姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'106', N'瀏覽項目')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1060', N'名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1061', N'性別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1062', N'男')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1063', N'女')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1064', N'編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1065', N'香港身份證編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1066', N'出生日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1067', N'國籍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1068', N'-----選擇國籍-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1069', N'姓氏需要詳細指明!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'107', N'修改項目')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1070', N'前一頁')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1071', N'你是否需要儲存?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1072', N'個人')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1073', N'文字長度應該是8-9')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1074', N'格式應該是??999999X')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1075', N'格式應該是AA??????X')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1076', N'以下資料格式不正確:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1077', N'月份應該是01-12')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1078', N'年份應該是1900-2079')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1079', N'年齡應該是大過18')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'108', N'選單')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1080', N'格式應該是日日-月月-年年年年')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1081', N'公司購買者')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1082', N'公司名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1083', N'商業登記編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1084', N'董事(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1085', N'董事(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1086', N'個人')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1087', N'公司')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1088', N'其他')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1089', N'聯名買家')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'109', N'銷售項目管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1090', N'聯名買家(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1091', N'聯名買家(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1092', N'聯名買家(三)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1093', N'聯絡人')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1094', N'地址')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1095', N'地區')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1096', N'國家')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1097', N'工作電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1098', N'住宅電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1099', N'手提電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'110', N'分析地區管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1100', N'傳真號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1101', N'電郵地址')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1102', N'-----選擇國家-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1103', N'-----選擇分析地區-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1104', N'聯絡資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1105', N'分析地區')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1106', N'電話編號應該是數字的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1107', N'項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1108', N'項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1109', N'房號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'111', N'版本')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1110', N'樓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1111', N'大廈')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1112', N'樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1113', N'街道')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1114', N'定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1115', N'物業')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1116', N'找不到合約搜尋指令!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1117', N'新增合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1118', N'車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1119', N'車位號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'112', N'點擊這裡登入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1120', N'層')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1121', N'系統管理模組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1122', N'單位選購')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1123', N'報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1124', N'律師事務所')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1125', N'代理商')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1126', N'代理商名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1127', N'代理人/銷售人名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1128', N'代理人/銷售人編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1129', N'代理人/銷售人電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'113', N'地區編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1130', N'-----選擇代理商名稱-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1131', N'銷售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1132', N'銷售編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1133', N'備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1134', N'在以下資料你不能輸入數值:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1135', N'文字長度應該是少於500')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1136', N'主要的合約編號並不存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1137', N'主要的合約編號並未在''確認''狀態!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1138', N'撤除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1139', N'[按單位搜尋]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'114', N'一般的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1140', N'按單位搜尋')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1141', N'項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1142', N'[按購買者編號搜尋]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1143', N'項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1144', N'大廈')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1145', N'樓層/車位層')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1146', N'房號/車位號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1147', N'樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1148', N'街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1149', N'街道')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'115', N'項目編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1150', N'按車位搜尋')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1151', N'車位號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1152', N'層')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1153', N'[按車位搜尋]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1154', N'街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1155', N'搜尋合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1156', N'系統合約編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1157', N'合約狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1158', N'合適的合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1159', N'購買者姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'116', N'項目編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1160', N'購買者名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1161', N'公司名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1162', N'合約日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1163', N'單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1164', N'由')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1165', N'至')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1166', N'顯示合約為')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1167', N'[按購買者搜尋]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1168', N'單位/車位(不包括無效的及取消的合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1169', N'(只適用於單位)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'117', N'開啟')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1170', N'期數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1171', N'未付餘額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1172', N'期數不能少於先前已選擇數值!\n請用刪除鈕在每個付款期的列然後取消不需要的列!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1173', N'不能刪除這付款方法.\n系統使用中!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1174', N'不能修改這付款方法.\n系統使用中!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1175', N'-----選擇合約狀態-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1176', N'開啟')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1177', N'確認')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1178', N'取消')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1179', N'無效')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'118', N'地址')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1180', N'單位及車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1181', N'只有單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1182', N'只有車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1183', N'[按商業大廈搜尋]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1184', N'購買者')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1185', N'姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1186', N'名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1187', N'編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1188', N'公司購買者')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1189', N'公司名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'119', N'地區')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1190', N'商業登記編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1191', N'董事姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1192', N'董事名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1193', N'開始的日期不應該大過最後的日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1194', N'結果<br>編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1195', N'找不到合約!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1196', N'按商業大廈資料搜尋')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1197', N'按購買者資料搜尋')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1198', N'購買目的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1199', N'-----選擇購買目的-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'120', N'單位的尺寸')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1200', N'投資')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1201', N'移民')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1202', N'自用')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1203', N'確認合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1204', N'確認合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1205', N'列印合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1206', N'確認及列印合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1207', N'找不到系統合約編號!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1208', N'瀏覽合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1209', N'使合約無效')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'121', N'S&P日(年曆日)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1210', N'使合約無效')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1211', N'取消合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1212', N'取消合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1213', N'使這合約無效?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1214', N'取消這確認的合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1215', N'列印合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1216', N'報表類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1217', N'直接列印')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1218', N'郵件合併')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1219', N'郵件合併:這報表被擷取後,請按下這''匯出''按鈕及選擇''試算報表''格式.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'122', N'重複登記')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1220', N'報表搜尋條件')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1221', N'獲取報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1222', N'-----選擇項目-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1223', N'瀏覽合約郵寄名單')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1224', N'修改合約郵寄名單')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1225', N'刪除合約郵寄名單')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1226', N'搜尋合約郵寄名單')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1227', N'搜尋條件')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1228', N'合適的合約郵寄名單')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1229', N'直接郵寄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'123', N'配套價格之前/之後的調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1230', N'找不到合約郵寄名單搜尋指令!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1231', N'找不到合約郵寄名單!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1232', N'合約狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1233', N'全部')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1234', N'合約簽署記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1235', N'合約未簽署記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1236', N'與未付款項')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1237', N'合約郵寄名單')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1238', N'聯絡資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1239', N'直接郵寄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'124', N'最少存款額(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1240', N'修改')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1241', N'無效資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1242', N'退還')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1243', N'備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1244', N'這編號不應該與其他聯名買家的編號一樣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1245', N'儲存這合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1246', N'離開而不儲存這合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1247', N'配套選購')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1248', N'合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1249', N'系統合約編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'125', N'最少存款額(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1250', N'已選擇配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1251', N'定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1252', N'配套編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1253', N'配套名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1254', N'配套調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1255', N'限額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1256', N'撤除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1257', N'有效的配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1258', N'選擇')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1259', N'儲存合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'126', N'最少存款額(三)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1260', N'合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1261', N'付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1262', N'有多少個月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1263', N'應該是一個非負整數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1264', N'不能選擇配套.\n這指定配套是超額!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1265', N'付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1266', N'S&P日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1267', N'付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1268', N'儲存付款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1269', N'去前一頁而不儲存這合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'127', N'最少存款額(四)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1270', N'去合約版頁而不儲存這付款設定?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1271', N'去配套選擇版頁而不儲存這付款設定?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1272', N'配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1273', N'離開而不儲存這付款設定?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1274', N'付款方法調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1275', N'-----選擇付款方法-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1276', N'付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1277', N'付款期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1278', N'S&P日期相關因素')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1279', N'數額/付款依據')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'128', N'備註(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1280', N'日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1281', N'月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1282', N'年')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1283', N'利息津貼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1284', N'訂金')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1285', N'價錢')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1286', N'定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1287', N'配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1288', N'調整前定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1289', N'調整({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'129', N'備註(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1290', N'調整後定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1291', N'利息津貼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1292', N'合約價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1293', N'付款計劃')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1294', N'利息津貼百分率需要是0與100之間!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1295', N'(合約新增日期)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1296', N'利息津貼在定價({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1297', N'未付餘額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1298', N'應繳付金額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1299', N'到期日<br>(日日-月月-年年年年)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'130', N'是')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1300', N'這編號不應該與其他公司董事編號一樣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1301', N'最後付款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1302', N'已付總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1303', N'支票付款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1304', N'支票號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1305', N'銀行')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1306', N'貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1307', N'總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1308', N'-----選擇銀行-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1309', N'不能沒有應繳付金額!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'131', N'否')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1310', N'應繳付金額需要是一個非負整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1311', N'應繳付金額太大!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1312', N'付款總金額大過於應繳付總金額!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1313', N'授權')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1314', N'用戶名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1315', N'密碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1316', N'可以')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1317', N'取消')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1318', N'你輸入的付款總金額少於第一次應繳付總金額(未付餘額:<spanstyle=''color:red;font-weight:bold;''>{0}{1}</span>).')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1319', N'請輸入授權用戶名稱及密碼之後按''可以'',或按''取消''去修改你的付款.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'132', N'-----選擇地區-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1320', N'授權必要')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1321', N'授權失敗-用戶名稱或密碼錯誤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1322', N'授權失敗-沒有足夠特權')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1323', N'儲存這付款方法?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1324', N'不能刪除配套''{0}''.\n系統使用中!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1325', N'配套''{0}''已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1326', N'配套''')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1327', N'''已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1328', N'系統不能在這合約分派一個新的系統合約編號!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1329', N'顯示利息津貼在這合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'133', N'-----選擇量度單位-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1330', N'車位定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1331', N'淨價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1332', N'支票號碼不應該與其他支票的號碼一樣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1333', N'不能修改一個確認的合約!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1334', N'無選擇代理商，是否儲存?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1335', N'合約狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1336', N'預約時間')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1337', N'S&P日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1338', N'系統合約編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1339', N'合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'134', N'大廈編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1340', N'新增由')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1341', N'更新由')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1342', N'其他')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1343', N'合約價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1344', N'淨價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1345', N'利息津貼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1346', N'方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1347', N'到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1348', N'修改合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1349', N'無效的合約狀態!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'135', N'狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1350', N'因為這合約的日期已改變，系統會自動更新S&P及應支付的付款日期，建議你再次去核對這付款計劃及交易詳情')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1351', N'儲存更改前離開這版頁?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1352', N'去付款方法版頁而不儲存這合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1353', N'配套調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1354', N'定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1355', N'只有已選擇方法({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1356', N'授權是必要的因為你已選擇退還!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1357', N'請輸入授權用戶名稱及密碼並按''可以''或按''取消''去取消這程序.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1358', N'記錄合約簽署')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1359', N'已記錄合約簽署')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'136', N'總共單位數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1360', N'日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1361', N'這記錄合約簽署狀態更新!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1362', N'現金付款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1363', N'車位特式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1364', N'物業特色')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1365', N'當新增這合約時已選擇單位的資料已更新!\n請再次證實這改變及新增這合約.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1366', N'當新增這合約時已選擇車位的資料已更新!\n請再次證實這改變及新增這合約.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1367', N'匯出資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1368', N'搜尋條件')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1369', N'匯出')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'137', N'登記存款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1370', N'有效的欄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1371', N'已選擇的欄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1372', N'匯出資料類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1373', N'-----選擇匯出資料類別-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1374', N'合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1375', N'合約轉讓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1376', N'單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1377', N'車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1378', N'無選擇欄!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1379', N'已付')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'138', N'額外資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1380', N'可認購')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1381', N'已選')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1382', N'預留')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1383', N'已售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1384', N'無資料匯出!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1385', N'-----選擇付款期-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1386', N'應繳付金額({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1387', N'已付總額({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1388', N'查看交易記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1389', N'付款期(支票)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'139', N'儲存')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1390', N'付款期(現金)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1391', N'銀行(支票)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1392', N'銀行(按揭)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1393', N'按揭銀行不應該與其他按揭銀行一樣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1394', N'交易記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1395', N'付款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1396', N'S&P日期相關因素/交易名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1397', N'應繳付金額({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1398', N'到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1399', N'狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'140', N'離開')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1400', N'交易日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1401', N'交易總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1402', N'已付總額({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1403', N'取消?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1404', N'取消')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1405', N'付款跟進:交易記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1406', N'取消交易<商業/>交易號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1407', N'銀行支票')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1408', N'現金')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1409', N'授權是必要的因為你新增一個過期的付款!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'141', N'項目期編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1410', N'請輸入授權用戶名稱及密碼及按''可以''或按''取消''去取消這程序.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1411', N'授權是必要的因為你新增一個過期的付款!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1412', N'請輸入授權用戶名稱及密碼及按''可以''或按''取消''去取消這程序.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1413', N'授權是必要的因為你新增一個過期的付款!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1414', N'請輸入授權用戶名稱及密碼及按''可以''或按''取消''去取消這程序.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1415', N'罰款({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1416', N'罰款應該是一個非負整數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1417', N'過期的罰款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1418', N'過期的罰款在{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1419', N'未付餘額({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'142', N'單位資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1420', N'最後分配系統合約編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1421', N'樓宇:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1422', N'樓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1423', N'單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1424', N'未定義顯示設定!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1425', N'大廈:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1426', N'大廈/樓宇/車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1427', N'車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1428', N'車位:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1429', N'已售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'143', N'總共項目')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1430', N'可認購的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1431', N'預留')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1432', N'整樓層')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1433', N'每個屏幕的列上最大號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1434', N'應該是一個正數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1435', N'樓宇:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1436', N'圖例')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1437', N'<nobr>號碼{0},</nobr><br><nobr>層{1}</nobr>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1438', N'<nobr>樓宇{0},</nobr><br><nobr>{1}</nobr>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1439', N'{0}/F')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'144', N'可認購的單位總共數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1440', N'<nobr>單位{0}</nobr>,<nobr>{1}/F</nobr>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1441', N'<nobr>樓宇{0},</nobr><br><nobr>{1}</nobr>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1442', N'層{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1443', N'樓宇{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1444', N'樓宇{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1445', N'&nbsp;{0}&nbsp;<br>{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1446', N'&nbsp;{0}&nbsp;<br>{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1447', N'每個屏幕的欄上最大編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1448', N'(不可適用於查看大廈)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1449', N'取消這交易?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'145', N'已售單位總共數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1450', N'樓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1451', N'符合的車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1452', N'符合的單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1453', N'你已選擇的單位，符合的車位會自動選擇!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1454', N'你已選擇的車位，符合的單位會自動選擇!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1455', N'銷售報表-銷售日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1456', N'日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1457', N'國家')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1458', N'-----全部-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1459', N'銷售報表-按大廈分類')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'146', N'預留單位總共數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1460', N'銷售報表-按大廈及房號分類')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1461', N'單位/車位選購情況')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1462', N'已選')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1463', N'顯示名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1464', N'已售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1465', N'可認購的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1466', N'預留')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1467', N'已選')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1468', N'{0}<br>{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1469', N'銷售報表-用分析組別及售賣狀態來組別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'147', N'已選單位總共數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1470', N'物業特色')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1471', N'過期付款報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1472', N'-----其他-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1473', N'合約搜尋條件')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1474', N'S&P日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1475', N'如果其他已選擇,銀行編碼及銀行名稱需要輸入.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1476', N'確認及列印合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1477', N'離開而不儲存?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1478', N'確認及列印合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1479', N'確認及查看合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'148', N'可認購的單位數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1480', N'列印這合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1481', N'應繳付金額({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1482', N'已付總額({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1483', N'未付餘額({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1484', N'過期的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1485', N'單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1486', N'成本({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1487', N'單位價格({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1488', N'車位定價過大!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1489', N'定價過大!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'149', N'已售單位數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1490', N'建築面積({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1491', N'實用面積({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1492', N'面積({0})')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1493', N'附加名稱(一)過大!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1494', N'兌換率參考')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1495', N'貨幣兌換率參考需要一個正數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1496', N'直接列印')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1497', N'匯出為郵件合併')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1498', N'找不到相配單位!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1499', N'合適的單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'150', N'預留單位數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1500', N'合適的車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1501', N'系統會分開已選的車位與它的符合的單位之間連接.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1502', N'[搜尋車位]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1503', N'[搜尋單位]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1504', N'找不到相配車位!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1505', N'只有一個單位相配你的搜尋準則.\n選擇這合適的單位?\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1506', N'大廈')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1507', N'樓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1508', N'房號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1509', N'樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'151', N'已選單位數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1510', N'街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1511', N'街道名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1512', N'車位號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1513', N'層')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1514', N'樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1515', N'街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1516', N'街道名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1517', N'這裡有一個車位連接這單位.\n選擇這符合的車位?\n\n{0}\n如果選擇''否'',系統會分開已選擇單位與它的符合的車位之間連接')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1518', N'只有一個車位相配你的搜尋準則.\n選擇這合適的車位?\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1519', N'這裡有一個單位連接這車位.\n選擇這合適的車位?\n\n繼續選擇這合適的車位會分開\n已選擇車位與它的\n符合的單位之間連接')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'152', N'配件管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1520', N'沒有選擇單位或車位!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1521', N'選購單位/車位-確認')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1522', N'以下是已選擇單位及/或車位:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1523', N'確認')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1524', N'取消')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1525', N'用戶名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1526', N'密碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1527', N'當已選擇單位及/或車位是預留,請先輸入優先用戶名稱及密碼:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1528', N'選購單位/車位-結果')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1529', N'以下是結果在你的單位選購:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'153', N'新增')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1530', N'新增合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1531', N'關閉')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1532', N'選購成功')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1533', N'選購不成功')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1534', N'當提交選購時發生錯誤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1535', N'單位並不存在')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1536', N'單位已刪除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1537', N'單位不可以選購')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1538', N'其他人已更改單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1539', N'其他人已更改這單位與它的符合車位之間的連接')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'154', N'配套編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1540', N'這單位多過一個車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1541', N'當提交選購時發生錯誤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1542', N'符合的車位已刪除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1543', N'這單位及它的符合車位的狀態不相同')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1544', N'其他人已更改符合的車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1545', N'當提交選購發生錯誤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1546', N'車位並不存在')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1547', N'車位已刪除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1548', N'車位不可選購')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1549', N'其他人已更改車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'155', N'配套名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1550', N'其他人已更改這車位與它的符合的單位之間連接')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1551', N'優先用戶名稱是必要的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1552', N'沒有這優先用戶')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1553', N'優先用戶密碼不正確')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1554', N'優先用戶帳戶已過期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1555', N'優先:允許否定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1556', N'當提交選購發生錯誤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1557', N'選購單位/車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1558', N'付款發票已列印!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1559', N'付款方法不適用於這合約.\n在訂金期裡應繳付金額是大過另一期應繳付金額.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'156', N'配套調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1560', N'已選')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1561', N'已售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1562', N'已撤除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1563', N'已付總額少於某些階段的付款要求總額,是否繼續?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1564', N'收據編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1565', N'搜尋收據')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1567', N'找不到收據!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1568', N'重印收據')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1569', N'分租')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'157', N'修改')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1570', N'公司分租')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1571', N'確認(已轉讓)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1572', N'取消(已轉讓)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1573', N'車位級別管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1574', N'級別編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1575', N'級別名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1576', N'級別編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1577', N'找不到級別編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1578', N'不能刪除這級別.系統使中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1579', N'&nbsp;{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'158', N'更新')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1580', N'&nbsp;{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1581', N'&nbsp;{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1582', N'無效的付款日期!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1583', N'付款日期需要少於或相等這日期!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1584', N'付款期(信用卡)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1585', N'單位總共數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1586', N'修改合約日期/代理商資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1587', N'在修改配套及付款方法資料於一個確認合約是必須授權!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1588', N'請輸入授權用戶名稱及密碼並按''可以''或按''取消''並按下''儲存買家資料''按鈕去儲存這一頁資料.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1589', N'你是否想繼續進行?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'159', N'取消')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1590', N'在這開啟狀態的合約有未完成的合約新增程序未完成')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1591', N'在這確認狀態的合約有未完成的合約修改程序.請再次核對這合約的付款計劃及交易詳情.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1592', N'付款計劃不能讀取,因為在開啟狀態的合約有未完成的合約新增程序.請再次核對這合約的付款計劃及交易詳情')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1593', N'付款計劃不能讀取,因為在確認狀態的合約有未完成的合約修改程序.請再次核對這合約的付款計劃及交易詳情')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1594', N'配套已新增或移除,你需要去付款版頁更新這合約的最新合約/淨價及付款計劃.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1595', N'不能列印開啟中的合約.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1596', N'不能列印:合約/淨價及付款計劃不能讀取,因為合約修改程序未完成.請再次核對這合約的付款計劃及交易詳情.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1598', N'協商調整已新增或移除,請重新選擇在這合約的付款方法去更新最新合約/淨價及付款計劃')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1599', N'你是否想繼續進行而不儲存其他資料?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'160', N'刪除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1600', N'修改確認合約(合約日期,代理商,配套,付款)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1601', N'範圍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1603', N'最高的範圍價格在這範圍是無效的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1604', N'印花稅設定編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1605', N'印花稅設定名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1608', N'設定編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1609', N'設定名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'161', N'限額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1610', N'用於這項目?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1611', N'備註在這印花稅總額程式,<br>&nbsp;&nbsp;&nbsp;&nbsp;a+<fontcolor=red><b>(合約價格+b)</b></font>Xc%')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1612', N'<br><br>&nbsp;&nbsp;&nbsp;&nbsp;a:+/-ve小數<br>&nbsp;&nbsp;&nbsp;&nbsp;b:+/-ve小數<br>&nbsp;&nbsp;&nbsp;&nbsp;c:+ve小數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1613', N'<br><br>&nbsp;&nbsp;&nbsp;&nbsp;如果在程式最重要部份的結果是負數,這印花稅總額會等於a.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1614', N'車位印花稅')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1615', N'單位印花稅')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1616', N'不能修改這印花稅設定.\n系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1617', N'程式系數c百分率需要一個編號是0與100之間!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1618', N'合約不能更改因為這合約已經更新在付款跟進單元.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1619', N'只顯示過期的合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'162', N'已選購數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1620', N'修改車位失敗.這車位的狀態與相對單位不符.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1621', N'新增車位失敗.這車位的狀態與相對單位不符.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1622', N'匯入作業已被中止!\n律師事務所聯絡人編碼超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1623', N'匯入作業已被中止!\n區域編碼超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1624', N'匯入作業已被中止!\n工作平臺面積不是數字的在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1625', N'匯入作業已被中止!\n工作平臺面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1626', N'匯入作業已被中止!\n工作平臺面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1627', N'匯入作業已被中止!\n空調房間面積不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1628', N'匯入作業已被中止!\n空調房間面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1629', N'匯入作業已被中止!\n空調房間面積需要是一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'163', N'剩餘限額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1630', N'匯入作業已被中止!\n空調平臺面積不是數字的在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1631', N'匯入作業已被中止!\n空調平臺面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1632', N'匯入作業已被中止!\n空調平臺面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1633', N'匯入作業已被中止!\n如果有區域資料,需要輸入地區資料.\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1634', N'匯入作業已被中止!\n如果有地區資料,需要輸入區域資料.\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1635', N'匯入作業已被中止!\n不正確律師資料(事務所編碼及聯絡人編碼).\n列{0}欄{1}欄{2}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1636', N'匯入作業已被中止!\n不正確區域地區資料(區域編碼及地區編碼).\n列{0}欄{1}欄{2}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1637', N'代理商電話號碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1638', N'分析碼名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1639', N'單位類別名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'164', N'單位類別管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1640', N'分析地區名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1641', N'不能沒有付款期到期日!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1642', N'每個付款期到期日應該是遲過前一個付款期到期日.請核對你的付款計劃')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1643', N'付款期到期日的格式應該是日日-月月-年年年年')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1644', N'付款期到期日的月份應該是01-12')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1645', N'付款期到期日的年份應該是1900-2079')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1646', N'無效的付款計劃:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1647', N'付款期到期日不能早過合約日期!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1648', N'單位的總共數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1649', N'調整價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'165', N'項目郡組管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1650', N'調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1651', N'沒有選擇單位!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1652', N'需要輸入調整因素!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1653', N'更新失敗:找不到這單位的定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1654', N'更新失敗:找不到這單位的建築面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1655', N'更新失敗:這單位的建築面積無效')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1656', N'更新失敗:因為其他人已更新這單位的主要資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1657', N'更新失敗!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1658', N'由幾多樓層的數值應該是小過到幾多樓層的數值!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1659', N'返去設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'166', N'郡組號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1660', N'百分率需要一個編號是0與100之間!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1661', N'已選大廈沒有單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1662', N'調整價格管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1663', N'只有一套印花稅能設定在項目期1!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1664', N'更新失敗:單位選購或已售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'1665', N'印花稅')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'167', N'單位數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'168', N'登記類別編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'169', N'單位總數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'170', N'銷售類別編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'171', N'付款方法管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'172', N'新增新付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'173', N'瀏覽付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'174', N'修改付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'175', N'刪除付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'176', N'匯入單位/車位資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'177', N'匯入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'178', N'街道編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'179', N'選擇類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'180', N'選擇檔案')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'181', N'房號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'182', N'車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'183', N'上載')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'184', N'匯出單位/車位資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'185', N'匯出')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'186', N'樓宇')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'187', N'單位及樓宇')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'188', N'律師時間表核對')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'189', N'律師時間表管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'190', N'單位主要的管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'191', N'車位管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'192', N'項目系統合約編號管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'193', N'項目問卷調查設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'194', N'新增單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'195', N'瀏覽單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'196', N'修改單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'197', N'刪除單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'198', N'新增車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'199', N'瀏覽車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'200', N'修改車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2001', N'合約轉讓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2002', N'系統合約號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2003', N'第一個購買者')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2004', N'單位一覽')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2005', N'車位一覽')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2006', N'合約轉讓記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2007', N'新增新轉讓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2008', N'刪除最後轉讓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2009', N'轉讓號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'201', N'刪除車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2010', N'轉讓日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2011', N'轉讓人')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2012', N'買家資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2013', N'名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2014', N'編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2015', N'地址')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2016', N'聯絡號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2017', N'轉讓總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2018', N'轉讓費用')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2019', N'付款跟進')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'202', N'新增時間表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2020', N'最後購買者')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2021', N'付款計劃')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2022', N'S&P日期相關因素')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2023', N'應繳付金額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2024', N'到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2025', N'狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2026', N'已付日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2027', N'已付總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2028', N'支票')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2029', N'現金')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'203', N'瀏覽時間表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2030', N'付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2031', N'支票號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2032', N'銀行')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2033', N'貨幣匯率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2034', N'按揭銀行')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2035', N'個人')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2036', N'商業號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2037', N'聯名買家')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2038', N'聯絡人(二)姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2039', N'[轉讓合約]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'204', N'修改時間表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2040', N'[刪除最後轉讓]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2041', N'買家名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2042', N'買家編號/BRN')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2043', N'詳情')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2044', N'轉讓總額及轉讓費用')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2045', N'已付')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'205', N'刪除時間表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2055', N'關閉')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2056', N'名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2057', N'交易編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2058', N'合約轉讓-詳情')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2059', N'轉讓合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'206', N'律師事務所')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2060', N'轉讓費付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2061', N'>>最後費用')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2062', N'-----選擇服務費類別-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2063', N'轉讓總額需要一個非負整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2064', N'服務費需要一個非負整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2065', N'轉讓合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2066', N'付款總額需要一個非負整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2067', N'離開前儲存這合約轉讓?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2068', N'你是否刪除這最後轉讓記錄?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2069', N'最後轉讓記錄刪除成功!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'207', N'驗樓師')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2070', N'刪除最後轉讓記錄失敗!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2071', N'你沒有權利去重新列印這合約.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2072', N'RP01-車位分派報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2073', N'已付總額超過未付總餘額由')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2074', N'你是否繼續進行?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2075', N'要求總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2076', N'這付款方法不適用於這合約.\n固定的應繳付金額在付款期已經有合約的淨價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2077', N'要求總額:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2078', N'多付總額:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2079', N'佣金格式應該是999.99')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'208', N'單位類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2080', N'服務費需要一個編號.(格式:9999.99)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'209', N'項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'210', N'項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'211', N'基本貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'212', N'-----選擇基本貨幣-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'213', N'!!O')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'214', N'銷售處編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'215', N'新郡組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'216', N'現有郡組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'217', N'與建築面積計算')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'218', N'成本')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'219', N'有效')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'22', N'''你不能進入這系統因為你未登入\n或你的登入逾時,請再次登入!''')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'220', N'新配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'221', N'現有配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'222', N'-----選擇律師事務所-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'223', N'律師在這單位/樓宇沒有S&P計劃')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'224', N'律師在這車位沒有S&P計劃')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'225', N'全部單位及車位已核對持有律師的S&P計劃.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'226', N'繼續進行合約前請先更正這問題!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'227', N'繼續進行合約管理前請先更正這問題!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'228', N'量度單位編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'229', N'新增時間表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'230', N'每個位置最多總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'231', N'銀行資料管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'232', N'無效的律師編碼!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'233', N'律師事務所編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'234', N'位置號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'235', N'名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'236', N'預留')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'237', N'大廈')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'238', N'樓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'239', N'樓層顯示次序')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'240', N'房號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'241', N'國籍編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'242', N'樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'243', N'街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'244', N'街道')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'245', N'分析碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'246', N'銷售資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'247', N'定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2477', N'要求總額:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2478', N'多付總額:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2479', N'刪除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'248', N'銷售類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2480', N'合約附加資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'2481', N'第一次存款收據')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'249', N'建築面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'250', N'面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'251', N'實用面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'252', N'實用樓面面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'253', N'窗台')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'254', N'花園')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'255', N'庭園')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'256', N'平臺')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'257', N'露臺')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'258', N'屋頂')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'259', N'天花')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'260', N'在SMP面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'261', N'備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'262', N'額外')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'263', N'-----選擇單位類別-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'264', N'-----選擇項目期-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'265', N'-----選擇大廈-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'266', N'-----選擇街道-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'267', N'國家編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'268', N'-----選擇銷售類別-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'269', N'-----選擇分析碼-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'270', N'-----選擇匯出類別-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'271', N'無效的匯出類別!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'272', N'當匯出資料時發生問題!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'273', N'無效的匯入類別!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'274', N'資料匯入完成.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'275', N'車位號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'276', N'層')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'277', N'新增車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'278', N'車位編號鑑定人')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'279', N'符合的單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'280', N'(如果可適用)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'281', N'範圍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'282', N'閞始編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'283', N'完結編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'284', N'類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'285', N'系統')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'286', N'每個位置最多總額要是整數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'287', N'律師:{0}沒有其他S&P計劃!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'288', N'預約數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'289', N'查看錯誤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'290', N'上載停止.\n因為欄的名稱是空的!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'291', N'方法編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'292', N'方法名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'293', N'顯示定價在同意書')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'294', N'調整定價(%)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'295', N'利息津貼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'296', N'訂金')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'297', N'付款期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'298', N'數額/付款依據')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'299', N'固定日期/相對S&P日期/相對合約日期/備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'300', N'在日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'301', N'固定日期/相對S&P日期/相對合約日期/備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'302', N'相對日期單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'303', N'在日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'304', N'-選擇-')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'305', N'相對S&P')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'306', N'付清')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'307', N'備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'308', N'日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'309', N'月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'310', N'年')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3100', N'已核對的車位成為可認購的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3101', N'已核對的車位成為預留')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3102', N'車位定價需要是正數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3103', N'發現多於一個符合的單位記錄.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3104', N'符合的單位找不到或不可認購的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3105', N'已選擇')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3106', N'搜尋條件')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3107', N'車位定價超出設定單位/車位規則的最大定價設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3108', N'車位定價低於設定單位/車位規則的最少定價設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3109', N'識別一個車位, 層數或樓宇號碼是需要輸入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'311', N'當匯入資料時發生問題!\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3110', N'如果已選擇層數,車位編號也需要註明')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3111', N'如果已選擇車位編號,層數也需要註明')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3112', N'如果已選擇街道名稱,街道編號也需要註明')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3113', N'如果已選擇街道編號,街道名稱也需要註明')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3114', N'-----選擇分析組碼-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3115', N'找不到車位編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3116', N'可認購的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3117', N'找不到車位編號搜尋指令!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3118', N'這單位已被車位選擇{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3119', N'搜尋車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'312', N'查看匯入錯誤信息')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3120', N'主要的單位編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3121', N'新增單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3122', N'瀏覽單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3123', N'修改單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3124', N'刪除單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3125', N'單位類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3126', N'面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3127', N'實用面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3128', N'分析')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3129', N'郡組(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'313', N'郡組號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3130', N'----選擇單位類別----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3131', N'--選擇編碼--')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3132', N'定價需要是正數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3133', N'識別一個單位,樓層或樓宇號碼是需要輸入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3134', N'如果已選擇大廈,樓層及房號需要註明')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3135', N'如果已選擇樓層,房號需要註明')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3136', N'最後定價超出設定單位/車位規則的最大定價設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3137', N'最後定價低於設定單位/車位規則的最少定價設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3138', N'單位新增失敗')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3139', N'如果已選擇樓層,大廈需要註明')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'314', N'上載日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3140', N'識別一個單位,大廈或樓宇號碼是需要輸入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3141', N'樓層顯示次序需要註明如果樓層是已選擇')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3142', N'識別一個單位,樓層或樓宇號碼是需要輸入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3143', N'找不到建築面積(GFA).')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3144', N'找不到實用面積(NFA).')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3145', N'建築面積(GFA)需要一個正數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3146', N'實用面積(NFA)需要一個正數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3147', N'單位{0}先前已新增.請重新輸入這單位資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3148', N'單位的建築面積超出設定單位/車位規則的最大限制設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3149', N'單位的建築面積少於設定單位/車位規則的最少限制設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'315', N'錯誤信息')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3150', N'單位實用面積超出設定單位/車位規則的最大限制設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3151', N'單位實用面積少於設定單位/車位規則的最少限制設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3152', N'樓層顯示次序需要數字格式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3153', N'找不到單位編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3154', N'合適的結果')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3155', N'已選擇單位/樓宇成為可認購的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3156', N'已選擇單位/樓宇成為預留')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3157', N'---選擇單位類別---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3158', N'---選擇大廈---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3159', N'---選擇狀態---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'316', N'項目系統合約編號管理已更新成功!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3160', N'窗台一定是數字格式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3161', N'花園一定是數字格式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3162', N'庭園一定是數字格式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3163', N'平臺一定是數字格式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3164', N'露臺一定是數字格式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3165', N'屋頂一定是數字格式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3166', N'天花一定是數字格式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'317', N'當更新記錄時發生問題!\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3176', N'這資料需要是數字格式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3177', N'天花')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3178', N'檔案路徑')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3179', N'欄的號碼及資料的號碼不是相對在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'318', N'開始或完結號碼需要一個非零整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3180', N'匯入作業已被中止!\n發現錯誤在列{0}欄{1}\n{2}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3181', N'匯入作業已被中止!\n找不到項目編號!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3182', N'匯入作業已被中止!\n項目編號超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3183', N'匯入作業已被中止!\n找不到單位類別編碼!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3184', N'匯入作業已被中止!\n單位類別編碼超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3185', N'匯入作業已被中止!\n找不到大廈編碼!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3186', N'匯入作業已被中止!\n大廈編碼超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3187', N'匯入作業已被中止!\n找不到樓層!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3188', N'匯入作業已被中止!\n樓層超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3189', N'匯入作業已被中止!\n找不到樓層顯示次序!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'319', N'範圍未被定義!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3190', N'匯入作業已被中止!\n樓層顯示次序不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3191', N'匯入作業已被中止!\n樓層顯示次序超出4個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3192', N'匯入作業已被中止!\n找不到房號!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3193', N'匯入作業已被中止!\n房號超出3個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3194', N'匯入作業已被中止!\n找不到項目期!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3195', N'匯入作業已被中止!\n項目期超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3196', N'匯入作業已被中止!\n找不到建築面積!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3197', N'匯入作業已被中止!\n建築面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3198', N'匯入作業已被中止!\n建築面積不是數字的在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3199', N'匯入作業已被中止!\n不准許有小數點在樓層顯示次序在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'320', N'閞始數值需要大過前一個範圍設定的完結數值!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3200', N'匯入作業已被中止!\n樓層顯示次序需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3201', N'匯入作業已被中止!\n建築面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3202', N'匯入作業已被中止!\n找不到實用面積!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3203', N'匯入作業已被中止!\n實用面積不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3204', N'匯入作業已被中止!\n實用面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3205', N'匯入作業已被中止!\n實用面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3206', N'匯入作業已被中止!\n平臺面積不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3207', N'匯入作業已被中止!\n平臺面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3208', N'匯入作業已被中止!\n平臺面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3209', N'匯入作業已被中止!\n花園面積不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'321', N'範圍之間不准許有空格!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3210', N'匯入作業已被中止!\n花園面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3211', N'匯入作業已被中止!\n花園面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3212', N'匯入作業已被中止!\n庭園面積不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3213', N'匯入作業已被中止!\n庭園面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3214', N'匯入作業已被中止!\n庭園面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3215', N'匯入作業已被中止!\n窗台面積不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3216', N'匯入作業已被中止!\n窗台面積超出8數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3217', N'匯入作業已被中止!\n窗台面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3218', N'匯入作業已被中止!\n屋頂面積不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3219', N'匯入作業已被中止!\n屋頂面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'322', N'完結數值需要大過閞始數值!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3220', N'匯入作業已被中止!\n屋頂面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3221', N'匯入作業已被中止!\n天花面積不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3222', N'匯入作業已被中止!\n天花面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3223', N'匯入作業已被中止!\n天花面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3224', N'匯入作業已被中止!\n露臺面積不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3225', N'匯入作業已被中止!\n露臺面積超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3226', N'匯入作業已被中止!\n露臺面積需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3227', N'匯入作業已被中止!\n其他(一)不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3228', N'匯入作業已被中止!\n其他(一)超出8個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3229', N'匯入作業已被中止!\n其他(二)超出20個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'323', N'如果閞始數值已輸入,完結數值需要輸入!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3230', N'匯入作業已被中止!\n找不到定價!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3231', N'匯入作業已被中止!\n定價不是數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3232', N'匯入作業已被中止!\n定價超出12個數字編號在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3233', N'匯入作業已被中止!\n定價需要一個正數在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3234', N'匯入作業已被中止!\n找不到狀態!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3235', N'匯入作業已被中止!\n狀態超出1個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3236', N'匯入作業已被中止!\n找不到用戶編號!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3237', N'匯入作業已被中止!\n用戶編號超出10個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3238', N'匯入作業已被中止!\n找不到律師資料!\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3239', N'匯入作業已被中止!\n律師資料超出10個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'324', N'如果完結數值已輸入,閞始數值需要輸入!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3240', N'匯入作業已被中止!\n找不到單位刪除\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3241', N'匯入作業已被中止!\n單位刪除超出1個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3242', N'匯入作業已被中止!\n銷售類別超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3243', N'匯入作業已被中止!\n找不到地區編碼\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3244', N'匯入作業已被中止!\n地區編碼超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3245', N'匯入作業已被中止!\n分析碼(一)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3246', N'匯入作業已被中止!\n分析碼(二)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3247', N'匯入作業已被中止!\n分析碼(三)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3248', N'匯入作業已被中止!\n分析碼(四)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3249', N'匯入作業已被中止!\n分析碼(五)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'325', N'每個位置的最多總額要正數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3250', N'匯入作業已被中止!\n分析碼(六)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3251', N'匯入作業已被中止!\n分析碼(七)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3252', N'匯入作業已被中止!\n分析碼(八)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3253', N'匯入作業已被中止!\n分析碼(九)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3254', N'匯入作業已被中止!\n分析碼(十)超出6個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3255', N'匯入作業已被中止!\n項目期編號不正確在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3256', N'匯入作業已被中止!\n不正確單位類別編碼在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3257', N'匯入作業已被中止!\n不正確大廈編碼在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3258', N'匯入作業已被中止!\n不正確項目編號在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3259', N'匯入作業已被中止!\n建築面積超出設定單位/車位規則的範圍設定\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'326', N'位置是未被定義!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3260', N'匯入作業已被中止!\n實用面積超出設定單位/車位規則的範圍設定\n列{0}欄{1}	')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3261', N'匯入作業已被中止!\n定價超出設定單位/車位規則的範圍設定\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3262', N'匯入作業已被中止!\n不正確律師資料在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3263', N'匯入作業已被中止!\n不正確銷售類別編碼在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3264', N'匯入作業已被中止!\n不正確地區編碼在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3265', N'匯入作業已被中止!\n不正確分析碼{2}在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3266', N'匯入作業已被中止!\n列{0}單位資料在資料庫已經存在')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3267', N'匯入作業已被中止!\n不正確用戶編號在列{0}欄{1}\n用戶編號有分大小楷')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3268', N'{0}匯入成功!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3269', N'匯入作業已被中止!\n找不到樓宇編號在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'327', N'位置之間不准許有空格!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3270', N'匯入作業已被中止!\n樓宇號碼超出7個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3271', N'匯入作業已被中止!\n找不到街道號碼在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3272', N'匯入作業已被中止!\n街道號碼超出4個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3273', N'匯入作業已被中止!\n找不到街道編碼在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3274', N'匯入作業已被中止!\n街道編碼超出4個字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3275', N'匯入作業已被中止!\n狀態需要是在:\n''R''-預留\n''A''-可認購的\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3276', N'匯入作業已被中止!\n不正確街道編碼在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3277', N'匯入作業已被中止!\n如果有樓宇編號,街道編號及街道編碼不能沒有\n列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3278', N'匯入作業已被中止!\n車位層數或樓宇號碼需要提供.\n列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3279', N'匯入作業已被中止!\n如果沒有層數,車位編號需要提供.\n列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'328', N'預約數量需要正數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3280', N'匯入作業已被中止!\n車位編號或樓宇編號需要提供.\n列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3281', N'匯入作業已被中止!\n街道編碼超出6個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3282', N'匯入作業已被中止!\n車位編號超出6個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3283', N'匯入作業已被中止!\n車位層數超出2個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3284', N'匯入作業已被中止!\n樓宇編號超出7個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3285', N'匯入作業已被中止!\n街道編號超出4個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3286', N'匯入作業已被中止!\n符合的單位編碼超出80個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3287', N'匯入作業已被中止!\n找不到已刪除車位在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3288', N'匯入作業已被中止!\n已刪除車位超出1個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3289', N'匯入作業已被中止!\n分析組超出1個數字在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'329', N'預約數量不能大過每個位置的最大總額!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3290', N'匯入作業已被中止!\n符合的單位{0}分派到這車位{1}\n另一個單位都分派到這車位在列{2}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3291', N'匯入作業已被中止!\n單位{0}找不到或刪除.\n分派這車位去其他單位在列{1}欄7')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3292', N'匯入作業已被中止!\n不能重複單位編碼\n列{0}欄7')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3293', N'發現重複車位!\n車位編號在資料庫已存在.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3294', N'項目的分析碼是必須的.\n請在這目錄選擇分析碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3295', N'請由目錄選擇分析碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3296', N'車位及單位狀態會改變\n(如果這車位已被分派到符合的單位)\n是否繼續?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3297', N'你是否去刪除這車位?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3298', N'你是否去刪除這單位?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3299', N'(sqt)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'330', N'單位數量需要正數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3300', N'定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3301', N'匯入作業已被中止!\n重複{0}資料在列{1}及列{2}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3302', N'匯入作業已被中止!\n找不到分析碼在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3303', N'匯入作業已被中止!\n在銷售項目分析碼未設定在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3304', N'匯入作業已被中止!\n不能提供''已選''(P)或''已售''(S)狀態在匯入檔案\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3305', N'車位分派報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3306', N'搜尋條件')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3307', N'可認購的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3308', N'匯出PDF報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3309', N'項目編號找不到')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'331', N'你是否去刪除這記錄?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3310', N'*')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3311', N'分析碼(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3312', N'分析碼(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3313', N'分析碼(三)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3314', N'分析碼(四)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3315', N'分析碼(五)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3316', N'分析碼(六)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3317', N'分析碼(七)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3318', N'分析碼(八)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3319', N'分析碼(九)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'332', N'S&P日期需要是正數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3320', N'分析碼(十)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3321', N'搜尋單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3322', N'車位及單位狀態會改變(如果已選擇的單位或車位已被分派到一個符合的單位或車位),是否繼續?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3323', N'匯入作業已被中止!\n單位在列{0}不能匯入因為這單位狀態是''{1}''')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3324', N'車位分派報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3325', N'已售及未售單位報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3326', N'已售及未售車位報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3327', N'未售單位及車位報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3328', N'銷售報表 - 按合約日期排列')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3329', N'銷售報表 - 按大廈分組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'333', N'最少存款額需要正數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3330', N'銷售報表 - 按大廈及房號類別分組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3331', N'過期付款報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3332', N'銷售報表 - 按分析組及銷售類別分組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3333', N'審核報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3334', N'合約轉讓報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3335', N'這報表在建立中')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3336', N'UAT v0.4')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3337', N'請輸入匯入檔案路徑')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3338', N'符合的單位分派失敗!\n單位是''已選''狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3339', N'符合的單位分派失敗!\n單位已售出')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'334', N'最少存款額過大!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3340', N'符合的單位分派失敗!\n單位是''已選''狀態\n列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3341', N'符合的單位分派失敗!\n單位已售出\n在列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3342', N'匯出試算表報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3343', N'識別一個單位,大廈或樓宇號碼是需要輸入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3344', N'識別一個車位,層數或樓宇號碼是需要輸入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'3345', N'為免影響系統效能，建議在非繁忙時間才滙出所有審核記錄。 現在確定要滙出所有審核記錄?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'335', N'當擷取資料時發生問題!\n\n{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'336', N'抽籤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'337', N'待定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'338', N'關閉')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'339', N'未定義的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'340', N'配套編號不可以中文或奇怪符號!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'341', N'配套調整需要整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'342', N'配套調整過大!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'343', N'限額需要是正數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'344', N'貨幣編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'345', N'分析碼編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'346', N'分析碼編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'347', N'限額需要大過已選購數量!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'348', N'合約服務費管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'349', N'單位/車位規則檢查管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'350', N'最多')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'351', N'最少')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'352', N'調整率的數值需要-100與100之間,\n同時最多兩個小數位!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'353', N'請輸入相對日期!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'354', N'相對日期需要正數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'355', N'年曆管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'356', N'年曆')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'357', N'年')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'358', N'號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'359', N'月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'360', N'日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'361', N'星期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'362', N'層級管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'363', N'代理編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'364', N'第二貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'365', N'-----選擇第二貨幣-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'366', N'你需要輸入以下資料:{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'367', N'無效的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'368', N'成本需要一個非負整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'369', N'成本過大!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'370', N'配套調整百分率數值需要0與100之間!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'371', N'代理商編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'372', N'代理商名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'373', N'配套編號已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'374', N'項目編號已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'375', N'電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'376', N'代理商編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'377', N'請選擇付款計劃!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'378', N'請輸入固定日期!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'379', N'請輸入固定日期,格式''日日-月月-年年年年''!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'380', N'月份不能大過12!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'381', N'這日期需要遲過或等於今日的日期!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'382', N'電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'383', N'請輸入這相關日期!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'384', N'相關日期需要一個非負整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'385', N'請輸入這備註!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'386', N'請輸入付款總額!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'387', N'代理商編碼找不到.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'388', N'付款總額需要一個非負整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'389', N'請輸入付款百分率!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'390', N'付款百分率的數值需要0與100之間!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'391', N'付款期名稱太長!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'392', N'這付款總和百分率應該是少於100%!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'393', N'方法編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'394', N'不能刪除這代理商.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'395', N'請輸入付款期!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'396', N'之前日期名稱太長!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'397', N'之後日期名稱太長!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'398', N'固定日期太長!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'399', N'相關日期太長!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'400', N'備註太長!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4000', N'物業銷售系統')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4001', N'顯示編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4002', N'(房號/樓/大廈)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4003', N'(大廈/屋村名稱)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4004', N'(街號及街道名稱)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4005', N'(子區域)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4006', N'國家/地區')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4007', N'香港')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4008', N'九龍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4009', N'新界')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'401', N'利息津貼需要一個非負整數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4010', N'中國')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4011', N'海外')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4012', N'個人/聯名買家')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4013', N'項目備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4014', N'合約備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4015', N'配套影響合約價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4016', N'准許一個購買者擁有多個單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4017', N'配套影響合約價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4018', N'-----選擇聯絡人-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'402', N'訂金需要一個非負數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'403', N'利息津貼過大!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'404', N'訂金過大!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'405', N'儲存錯誤.請查看錯誤記錄.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'406', N'分析地區編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'407', N'分析地區名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'408', N'分析地區編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'409', N'分析地區編碼找不到.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'410', N'不能刪除這分析地區.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4100', N'律師事務所聯絡人管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4101', N'聯絡人編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4102', N'聯絡人名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4103', N'聯絡人電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4104', N'律師事務所聯絡人編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4105', N'不能刪除這律師事務所聯絡人.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4106', N'聯絡人找不到.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4107', N'下一頁')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4108', N'列印合約及附加資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4109', N'請輸入項目備註!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'411', N'地區編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4110', N'-----選擇聯絡人-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4111', N'修改付款計劃')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4112', N'使合約無效')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4113', N'律師事務所地址')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4114', N'搜尋合約為重新列印')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4115', N'列印')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4116', N'可以')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4117', N'選擇列印機:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4118', N'付款日期:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4119', N'調整:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'412', N'地區名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4120', N'調整之後定價:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4121', N'單位價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4122', N'單位比率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4123', N'---選擇一個樣式---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4124', N'欄的樣式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4125', N'已付日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'4126', N'到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'413', N'地區編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'414', N'找不到地區編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'415', N'不能刪除這地區.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'416', N'修改')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'417', N'大廈編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'418', N'大廈名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'419', N'大廈編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'420', N'大廈編碼找不到.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'421', N'不能刪除這大廈編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'422', N'項目期編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'423', N'項目期名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'424', N'項目期編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'425', N'找不到項目期編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'426', N'不能刪除這項目期.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'427', N'單位類別編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'428', N'單位類別名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'429', N'單位類別編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'430', N'找不到單位類別編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'431', N'不能刪除這單位類別編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'432', N'以下')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'433', N'貨幣編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'434', N'貨幣編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'435', N'貨幣編碼找不到.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'436', N'不能刪除這貨幣編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'437', N'比率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'438', N'貨幣兌換率需要一個正數!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'439', N'請選擇這日期類別!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'440', N'設定日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'441', N'項目編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'442', N'銷售類別編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'443', N'銷售類別編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'444', N'找不到銷售類別編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'445', N'不能刪除這銷售類別編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'446', N'銷售類別名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'447', N'設定單位/車位規則')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'448', N'街道編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'449', N'街道名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'450', N'街道編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'451', N'找不到街道編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'452', N'不能刪除這街道編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'453', N'銷售處編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'454', N'銷售處名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'455', N'銷售處編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'456', N'找不到銷售處編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'457', N'不能刪除這銷售處編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'458', N'量度單位編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'459', N'量度單位編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'460', N'找不到量度單位編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'461', N'不能刪除這量度單位編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'462', N'銀行編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'463', N'銀行名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'464', N'銀行編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'465', N'找不到銀行編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'466', N'不能刪除這銀行編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'467', N'律師事務所編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'468', N'律師事務所名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'469', N'律師事務所編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'470', N'找不到律師事務所編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'471', N'不能刪除這律師事務所編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'472', N'國籍編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'473', N'國籍名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'474', N'國籍編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'475', N'找不到國籍編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'476', N'不能刪除這國籍編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'477', N'國家編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'478', N'國家名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'479', N'國家編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'480', N'找不到國家編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'481', N'不能刪除這國家編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'482', N'分析碼名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'483', N'合約編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'484', N'合約名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'485', N'服務費')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'486', N'合約服務編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'487', N'找不到合約服務編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'488', N'不能刪除這合約服務編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'489', N'服務費需要一個數值.(格式:99999.99)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'490', N'服務費需要一個百分率.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'491', N'分析碼編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'492', N'找不到分析碼編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'493', N'不能刪除這分析碼編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'494', N'分析組碼編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'495', N'分析組碼編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'496', N'分析組碼名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'497', N'分析組碼編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'498', N'找不到分析組碼編碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'499', N'不能刪除這分析組碼編碼.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'500', N'物業分析組概覽')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5000', N'護照')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5001', N'確認及列印')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5002', N'確認及查看')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5003', N'取消確認')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5004', N'協商調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5005', N'信用卡付款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5006', N'信用卡類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5007', N'信用卡號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5008', N'有效日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5009', N'持卡者名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'501', N'-最少定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5010', N'批准編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5011', N'修改付款計劃')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5012', N'請輸入認可用戶名稱及密碼並按''可以''或按''取消''去修改你的付款計劃.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5013', N'Visa')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5014', N'MC')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5015', N'確認,去單位選購版頁')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5016', N'確認及新增合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5017', N'超出容許選擇數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5018', N'合約價格上配套調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5019', N'確認失敗!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'502', N'-最多定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5020', N'Visa/MC')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5021', N'已付總額不能多於計劃的總額!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5022', N'取消及重新新增合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5023', N'合約價格(下舍入之後)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5024', N'地產代理監管局牌照/員工編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5025', N'之前')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5026', N'之後')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5027', N'總共')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5028', N'合約價格(下舍入之前)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5029', N'下舍入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'503', N'-最少單位建築面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5030', N'配套調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5031', N'配套調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5032', N'配套調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5033', N'修改這合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5034', N'修改合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5035', N'確認,選擇連接的車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5036', N'查看')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5037', N'最後調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5038', N'為了取消這合約請輸入認可用戶名稱及密碼並按''可以''.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5039', N'總共單位數目(項目)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'504', N'-最大單位建築面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5040', N'總共單位數目(項目期)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5041', N'匯入作業已被中止!\n應該提供''價錢''(P)或''比率''(R)狀態在匯入檔案\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5042', N'匯入作業已被中止!\n應該提供''百分比''(P)或''元''(D)狀態在匯入檔案\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5043', N'匯入作業已被中止!\n應該提供數字在匯入檔案\n列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'5044', N'匯入作業已被中止!\n新增車位定價無效因先前已調整數值在列{0}欄{1}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'505', N'-最細單位實用面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'506', N'-最大單位實用面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'507', N'-最細車位定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'508', N'-最大車位定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'509', N'請在這以下資料輸入正數:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'510', N'以下資料不是在這格式99999999.99:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'511', N'以下資料不是在這格式999999.99:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'512', N'-定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'513', N'以下資料需要最大值大過最少值:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'514', N'-單位建築面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'515', N'-單位實用面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'516', N'-車位定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'517', N'你是否儲存這資料?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'518', N'儲存完成.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'519', N'模組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'520', N'----選擇模組-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'521', N'合約轉讓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'522', N'付款跟進')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'523', N'請選擇一個模組')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'524', N'功能編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'525', N'功能名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'526', N'用戶層級')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'527', N'銷售代表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'528', N'銷售管理人員')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'529', N'高級管理人員')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'530', N'副經理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'531', N'高級經理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'532', N'系統管理員')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'533', N'一月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'534', N'二月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'535', N'三月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'536', N'四月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'537', N'五月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'538', N'六月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'539', N'七月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'540', N'八月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'541', N'九月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'542', N'十月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'543', N'十一月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'544', N'十二月')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'545', N'用戶管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'546', N'新增用戶')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'547', N'瀏覽用戶')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'548', N'修改用戶')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'549', N'刪除用戶')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'550', N'省略日期:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'551', N'號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'552', N'用戶資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'553', N'用戶編號:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'554', N'重新輸入密碼:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'555', N'姓氏/名字:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'556', N'密碼:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'557', N'重新輸入密碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'558', N'姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'559', N'名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'560', N'佣金')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'561', N'佣金需要百分率.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'562', N'編號:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'563', N'編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'564', N'性別:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'565', N'電話號碼:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'566', N'電郵地址:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'567', N'地址:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'568', N'有效日期:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'569', N'(日日-月月-年年年年)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'570', N'有效日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'571', N'用戶層級:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'572', N'---選擇用戶層級---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'573', N'男')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'574', N'女')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'575', N'項目存取')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'576', N'存取')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'578', N'密碼及確認密碼要相同.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'579', N'不是一個有效香港身份証號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'580', N'有效日期格式不正確.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'581', N'有效日期不能早過今日日期.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'582', N'只少選擇一個項目.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'583', N'用戶編號已經存在.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'584', N'用戶資料成功地新增到這系統.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'585', N'終止')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'586', N'搜尋用戶')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'587', N'搜尋條件')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'588', N'狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'589', N'項目存取:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'590', N'--全部--')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'591', N'---選擇項目---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'592', N'不能刪除這用戶.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'593', N'新密碼:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'594', N'找不到用戶編號.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'595', N'特別用戶層級管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'596', N'修改用戶層級')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'597', N'瀏覽用戶層級')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'598', N'用戶名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'599', N'編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6001', N'你先前已更改合約日期.\n請確定你重新選擇付款方法去更新S&P日期及付款計劃!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6002', N'S&P日期不能與這合約日期相配,你是否確認儲存這付款計劃?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6003', N'你先前已更改合約日期.\n請確定你重新選擇付款方法去更新SPC日期及付款計劃!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6004', N'SPC日期不能與這合約日期相配,你是否確認儲存這付款計劃?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6005', N'現時的密碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6006', N'新密碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6007', N'重新輸入新密碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6008', N'重設密碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6009', N'新密碼與重新輸入新密碼不相同!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'601', N'[銷售代表]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6010', N'密碼已更改!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6011', N'舊密碼無效!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6012', N'您的密碼強度不足\n要想使你的密碼更安全，可採取以下方法:\n- 字元數應在 8 至 16 之間\n- 使用字母和數字\n- 使用特殊字元 (如 @)\n- 混合使用大小寫')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6013', N'傳真')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6014', N'電話')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6015', N'物業銷售系統之用戶權限極限已滿。\n請聯絡您的系統管理員以購買更多用戶權限。')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6016', N'語言')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6017', N'English')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6018', N'繁體')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6019', N'樓宇號碼: ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'602', N'[銷售管理人員]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6020', N'未售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6021', N'合約 - 銷售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6022', N'合約 - 會計')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6023', N'車位 - 銷售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6024', N'單位 - 銷售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6025', N'項目名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6026', N'客戶身分')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6027', N'合約編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6028', N'購買者性別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6029', N'購買者編號類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'603', N'[高級管理人員]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6030', N'購買者出生日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6031', N'購買者國籍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6032', N'第一名聯名買家姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6033', N'第一名聯名買家名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6034', N'第一名聯名買家性別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6035', N'第一名聯名買家編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6036', N'第一名聯名買家編號類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6037', N'第一名聯名買家出生日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6038', N'第一名聯名買家國籍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6039', N'第二名聯名買家姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'604', N'[副經理]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6040', N'第二名聯名買家名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6041', N'第二名聯名買家性別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6042', N'第二名聯名買家編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6043', N'第二名聯名買家編號類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6044', N'第二名聯名買家出生日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6045', N'第二名聯名買家國籍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6046', N'第三名聯名買家姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6047', N'第三名聯名買家名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6048', N'第三名聯名買家性別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6049', N'第三名聯名買家編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'605', N'[高級經理]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6050', N'第三名聯名買家編號類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6051', N'第三名聯名買家出生日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6052', N'第三名聯名買家國籍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6053', N'公司商業登記號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6054', N'第一名董事姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6055', N'第一名董事名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6056', N'第一名董事性別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6057', N'第一名董事編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6058', N'第一名董事編號類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6059', N'第一名董事出生日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'606', N'[系統管理員]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6060', N'第一名董事國籍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6061', N'第二名董事姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6062', N'第二名董事名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6063', N'第二名董事編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6064', N'第二名董事編號類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6065', N'聯絡人地址(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6066', N'聯絡人地址(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6067', N'聯絡人地址(三)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6068', N'聯絡人地區')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6069', N'聯絡人區域')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'607', N'功能存取資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6070', N'聯絡人國家')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6071', N'聯絡人住宅電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6072', N'聯絡人辦公室電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6073', N'聯絡人手提電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6074', N'聯絡人傳真號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6075', N'聯絡人電郵地址')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6076', N'聯絡人分析地區')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6077', N'單位的項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6078', N'單位的大廈名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6079', N'單位的樓層')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'608', N'沒有更改.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6080', N'單位的房號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6081', N'單位的樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6082', N'單位的街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6083', N'單位的街道名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6084', N'單位的建築面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6085', N'單位的實用面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6086', N'單位的定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6087', N'車位項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6088', N'車位層數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6089', N'車位樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'609', N'選購單位/車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6090', N'車位街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6091', N'車位街道名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6092', N'律師事務所聯絡人')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6093', N'S&P日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6094', N'代理人名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6095', N'代理人編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6096', N'代理人編號類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6097', N'代理人電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6098', N'合約基本貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6099', N'合約基本貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'610', N'購買者資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6100', N'合約第二貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6101', N'合約第二貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6102', N'現金津貼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6103', N'合約成交價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6104', N'合約淨價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6105', N'合約備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6106', N'合約刪除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6107', N'合約列印日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6108', N'記錄合約簽署日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6109', N'無效退還')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'611', N'購買者編號:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6110', N'無效備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6111', N'新增日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6112', N'更新日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6113', N'第一個配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6114', N'第一個配套價錢')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6115', N'第一個配套成本')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6116', N'第二個配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6117', N'第二個配套價錢')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6118', N'第二個配套成本')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6119', N'第三個配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'612', N'購買者編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6120', N'第三個配套價錢')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6121', N'第三個配套成本')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6122', N'第四個配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6123', N'第四個配套價錢')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6124', N'第四個配套成本')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6125', N'第五個配套')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6126', N'第五個配套價錢')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6127', N'第五個配套成本')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6128', N'調整百分率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6129', N'是否第一次付款就是訂金')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'613', N'單位資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6130', N'第一次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6131', N'第一次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6132', N'第一次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6133', N'第一次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6134', N'第一次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6135', N'第一次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6136', N'第一次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6137', N'第一次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6138', N'第二次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6139', N'第二次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'614', N'發展:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6140', N'第二次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6141', N'第二次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6142', N'第二次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6143', N'第二次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6144', N'第二次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6145', N'第二次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6146', N'第三次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6147', N'第三次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6148', N'第三次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6149', N'第三次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'615', N'項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6150', N'第三次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6151', N'第三次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6152', N'第三次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6153', N'第三次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6154', N'第四次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6155', N'第四次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6156', N'第四次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6157', N'第四次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6158', N'第四次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6159', N'第四次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'616', N'大廈')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6160', N'第四次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6161', N'第四次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6162', N'第五次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6163', N'第五次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6164', N'第五次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6165', N'第五次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6166', N'第五次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6167', N'第五次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6168', N'第五次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6169', N'第五次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'617', N'樓')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6170', N'第一間按揭銀行')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6171', N'第一次按揭借款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6172', N'第二間按揭銀行')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6173', N'第二次按揭借款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6174', N'承讓人類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6175', N'轉讓號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6176', N'轉讓貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6177', N'轉讓貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6178', N'承讓人姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6179', N'承讓人名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'618', N'房號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6180', N'承讓人性別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6181', N'承讓人編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6182', N'承讓人編號類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6183', N'承讓人出生日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6184', N'承讓人國籍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6185', N'轉讓備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6186', N'符合單位的項目期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6189', N'符合單位的大廈名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'619', N'樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6190', N'符合單位的樓層')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6191', N'符合單位的房號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6192', N'符合單位的樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6193', N'符合單位的街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6194', N'符合單位的街道名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6195', N'(英文)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6196', N'項目名稱 (英文)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6197', N'項目名稱 (中文)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6198', N'調整之新增車位價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6199', N'由(客戶身分)已選的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'620', N'街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6200', N'車位狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6201', N'車位刪除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6202', N'分析組碼(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6203', N'分析組碼(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6204', N'窗台面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6205', N'露台面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6206', N'屋頂面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6207', N'平台面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6208', N'花園面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6209', N' 標記所有星期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'621', N'街道名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6210', N'庭園面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6211', N'到')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6212', N'天花面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6213', N'說明(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6214', N'說明(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6215', N'單位刪除')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6216', N'分析組碼(三)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6217', N'分析組碼(四)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6218', N'分析組碼(五)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6219', N'分析組碼(六)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'622', N'在預留單位,請輸入優先用戶編號及密碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6220', N'分析組碼(七)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6221', N'分析組碼(八)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6222', N'分析組碼(九)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6223', N'分析組碼(十)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6224', N'區域名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6225', N'瀏覽..')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6226', N'匯入作業已被中止!\n如果已註明街道名稱,街道編號也需要註明在列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6227', N'匯入作業已被中止!\n如果已註明街道編號,街道名稱也需要註明在列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6228', N'匯入作業已被中止!\n識別一個車位, 層數或樓宇號碼是需要輸入在列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6229', N'匯入作業已被中止!\n如果已選擇層數,車位編號也需要註明在列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'623', N'提交')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6230', N'匯入作業已被中止!\n如果已選擇車位編號,層數也需要註明在列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6231', N'匯入作業已被中止!\n識別一個車位,只需輸入層數或樓宇號碼在列{0}')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6232', N'其他一')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6233', N'其他二')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6234', N'調整類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6235', N'調整單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6236', N'調整數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6237', N'匯入用戶編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6238', N'律師事務所聯絡人編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6239', N'街道編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'624', N'需要選擇大廈或樓宇.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6240', N'單位編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6241', N'沒有分析碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'625', N'只可選擇一座大廈或一座樓.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'626', N'需要輸入樓層.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'627', N'你是否確認這單位選購?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'628', N'選購不成功.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'629', N'沒有這單位.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'630', N'這單位已被刪除.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6300', N'地段')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6301', N'地段座數')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6302', N'登記局編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6304', N'持身份證?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6305', N'支票號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6306', N'買家資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6308', N'姓氏')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6309', N'名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'631', N'這單位是')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6310', N'聯絡人')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6311', N'地址一')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6312', N'地址二')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6313', N'地址三')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6314', N'地址四')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6315', N'國家')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6316', N'住宅電話')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6317', N'辦公室電話')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6318', N'手提電話')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6319', N'傳真')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'632', N'多項選購不成功.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6320', N'電郵')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6321', N'董事姓氏一')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6322', N'董事名字一')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6323', N'董事姓氏二')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6324', N'董事名字二')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6325', N'合約購買者類型')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6326', N'只顯示聯絡人')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6327', N'S&P日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6328', N'買家類型')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6329', N'買家/董事姓名')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'633', N'請輸入優先用戶編號及密碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6330', N'合約編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6334', N'證件類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6335', N'中文名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6336', N'英文名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6337', N'聯絡人電話號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6338', N'公司代表(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6339', N'公司代表(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'634', N'這優先用戶編號無權去執行.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6340', N'數量')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6341', N'香港身份證編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6342', N'澳門身份證編號的長度必須是8位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6343', N'銀聯')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6344', N'AE')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6345', N'確定要繼續嗎?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6346', N'中文名字或英文名字')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'635', N'這優先用戶密碼不正確.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6351', N'正式合約日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6352', N'婚姻狀況')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6353', N'未婚')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6354', N'已婚')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6355', N'離婚')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6356', N'鰥寡')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6357', N'不適用')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6358', N'臨時合約狀況')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6359', N'正式合約狀況')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'636', N'需要輸入房號.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6360', N'臨時合約日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6361', N'新增正式合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6362', N'修改正式合約?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6364', N'臨時合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6365', N'正式合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6366', N'搜尋正式合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6367', N'新增正式合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6368', N'確認正式合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6369', N'瀏覽正式合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'637', N'需要輸入街號.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6370', N'修改正式合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6371', N'取消正式合約')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6372', N'取消備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6373', N'模組名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6374', N'--- 選擇模組 ---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6375', N'--')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6379', N'購買者姓氏 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'638', N'需要輸入街道名稱.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6380', N'購買者名字 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6381', N'購買者性別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6382', N'購買者編號 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6383', N'購買者編號類別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6384', N'購買者出生日期 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6385', N'購買者國籍 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6386', N'第一名聯名買家姓氏 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6387', N'第一名聯名買家名字 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6388', N'第一名聯名買家性別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6389', N'第一名聯名買家編號 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'639', N'已售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6390', N'第一名聯名買家編號類別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6391', N'第一名聯名買家出生日期 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6392', N'第一名聯名買家國籍 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6393', N'第二名聯名買家姓氏 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6394', N'第二名聯名買家名字 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6395', N'第二名聯名買家性別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6396', N'第二名聯名買家編號 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6397', N'第二名聯名買家編號類別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6398', N'第二名聯名買家出生日期 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6399', N'第二名聯名買家國籍 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'640', N'屬於這單位.你是否仍想選擇?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6400', N'第三名聯名買家姓氏 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6401', N'第三名聯名買家名字 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6402', N'第三名聯名買家性別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6403', N'第三名聯名買家編號 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6404', N'第三名聯名買家編號類別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6405', N'第三名聯名買家出生日期 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6406', N'第三名聯名買家國籍 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6407', N'公司名稱 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6408', N'公司商業登記號碼 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6409', N'第一名董事姓氏 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'641', N'車位選購-提交')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6410', N'第一名董事名字 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6411', N'第一名董事性別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6412', N'第一名董事編號 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6413', N'第一名董事編號類別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6414', N'第一名董事出生日期 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6415', N'第一名董事國籍 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6416', N'第二名董事姓氏 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6417', N'第二名董事名字 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6418', N'第二名董事編號 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6419', N'第二名董事編號類別 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'642', N'車位號碼:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6420', N'聯絡人名稱 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6421', N'聯絡人地址(一) (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6422', N'聯絡人地址(二) (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6423', N'聯絡人地址(三) (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6424', N'聯絡人地區 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6425', N'聯絡人區域 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6426', N'聯絡人國家 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6427', N'聯絡人住宅電話號碼 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6428', N'聯絡人辦公室電話號碼 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6429', N'聯絡人手提電話號碼 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'643', N'層數:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6430', N'聯絡人傳真號碼 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6431', N'聯絡人電郵地址 (正式合約)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6432', N'合約/淨價及付款計劃不能讀取,因為合約修改程序未完成.請再次核對這合約的付款計劃及交易詳情.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'645', N'已選')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'646', N'單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'647', N'項目基本貨幣:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'648', N'特別存取權限')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'649', N'選擇預留單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'650', N'過期的罰款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6501', N'第六次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6502', N'第六次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6503', N'第六次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6504', N'第六次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6505', N'第六次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6506', N'第六次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6507', N'第六次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6508', N'第六次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6509', N'第七次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'651', N'第一次付款沒有足夠存款')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6510', N'第七次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6511', N'第七次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6512', N'第七次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6513', N'第七次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6514', N'第七次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6515', N'第七次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6516', N'第七次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6517', N'第八次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6518', N'第八次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6519', N'第八次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'652', N'公司:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6520', N'第八次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6521', N'第八次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6522', N'第八次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6523', N'第八次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6524', N'第八次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6525', N'第九次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6526', N'第九次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6527', N'第九次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6528', N'第九次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6529', N'第九次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'653', N'購買者編號:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6530', N'第九次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6531', N'第九次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6532', N'第九次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6533', N'第十次付款名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6534', N'第十次付款到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6535', N'第十次付款日期前之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6536', N'第十次付款日期後之描述')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6537', N'第十次付款總額')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6538', N'第十次付款貨幣')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6539', N'第十次付款貨幣兌換率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'654', N'已選擇單位是一個預留單位.為了選擇這單位請輸入優先用戶編號及密碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6540', N'第十次付款狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6541', N'確認合約號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6542', N'到期付款情況報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6543', N'不能沒有日期!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6544', N'開始的日期應大於今天日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6545', N'到期日')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6546', N'顯示非日期記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6547', N'合約/轉讓日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6548', N'其他收入')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6549', N'日期 1')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'655', N'預留單位選購不成功.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6550', N'日期 2')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6551', N'日期 3')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6552', N'日期 4')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6553', N'日期 5')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6554', N'記錄交易登記')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6555', N'記錄交易登記備註')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6556', N'與買家有關連')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6557', N'每建築面積平均合約價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6558', N'每實用面積平均合約價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6559', N'每建築面積平均定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'656', N'這優先用戶編號無權去選擇一個預留單位.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6560', N'每實用面積平均定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6561', N'每建築面積平均淨價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6562', N'每實用面積平均淨價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6563', N'ASP 日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6564', N'ASP 簽署日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'6565', N'ASP 狀況')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'657', N'成功選購單位.這單位:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'658', N'已被選擇及變成已選狀態.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'659', N'需要輸入車位號碼或樓宇號碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'660', N'只可選擇層數或樓宇.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'661', N'需要輸入層數或樓宇號碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'662', N'你是否確認這車位選購?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'663', N'這車位不存在.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'664', N'這車位已刪除.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'665', N'這車位是')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'666', N'已選擇車位是一個預留車位.為了選擇這車位請先輸入優先用戶編號及密碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'667', N'在預留車位,請輸入優先用戶編號及密碼.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'668', N'預留車位選購不成功.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'669', N'這優先用戶編號無權去選擇一個預留車位.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'670', N'這車位符合單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'671', N'因為要選擇,系統已分開這單位與車位之間連接.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'672', N'你是否執行?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'673', N'成功車位選購.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'674', N'這車位:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'675', N'這單位:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'676', N'已取消選購單位/車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'677', N'找到')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'678', N'取消已選購')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'679', N'核對已取消選單位及/或符合的車位.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'680', N'請輸入購買者編號.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'681', N'核對已取消選購車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'682', N'沒有已選購單位或車位被取消.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'683', N'你是否取消這已選購單位/車位?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'684', N'符合的車位編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'685', N'取消已選購單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'686', N'取消已選購車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'687', N'你仍想繼續取消已選購符合的車位?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'688', N'取消了已選購車位會連單位都取消.你仍想繼續?''')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'689', N'單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'690', N'及')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'691', N'成功地取消已選車位.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'692', N'單位選購記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'693', N'日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'694', N'已選日期格式不正確.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'695', N'單位類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'696', N'樓層顯示次序')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'697', N'地區')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'698', N'律師事務所')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'699', N'定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'700', N'銷售類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'7001', N'身份證編號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'701', N'建築面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'702', N'實用樓面面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'703', N'窗台')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'704', N'花園')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'705', N'庭園')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'706', N'平臺')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'707', N'露臺')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'708', N'屋頂')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'709', N'天花')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'710', N'附加(一)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'711', N'附加(二)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'712', N'系統合約號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'713', N'合約狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'714', N'前一頁')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'715', N'總數:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'716', N'[離開]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'717', N'[最上]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'718', N'車位選購記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'719', N'已取消選購單位記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'720', N'成為可認購')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'721', N'你是否將這單位成為可認購?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'722', N'這單位狀態已改為可認購.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'723', N'這單位不能改為可認購因為其他用戶已更改這記錄.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'724', N'已取消選購車位記錄')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'725', N'車位資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'726', N'已選購日期:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'727', N'已取消選購日期:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'728', N'你是否將這車位成為可認購?')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'729', N'這車位不能改為可認購因為這記錄其他用戶已更改.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'730', N'這車位狀態已改為可認購.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'731', N'選購結果')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'732', N'更新時間')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'733', N'秒')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'734', N'顯示已售/預留日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'735', N'查看前請選擇大廈/樓宇及輸入由小至大的顯示次序')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'736', N'顯示次序')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'737', N'查看')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'740', N'樓層顯示次序錯誤')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'741', N'全部選擇')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'742', N'取消全部選擇')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'743', N'顏色設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'744', N'單位狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'745', N'現在數值')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'746', N'新的數值')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'747', N'可用的')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'748', N'請只少選擇一個新顏色數值.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'749', N'查看前請只少選擇一座大廈或樓宇.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'750', N'請詳細指明這更新時間.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'751', N'更新時間需要一個正數.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'752', N'請詳細指明這顯示次序.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'753', N'顯示次序需要一個正數.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'754', N'顯示次序不能重複.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'755', N'訂金退還')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'756', N'符合的車位:')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'757', N'已售及未售單位報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'758', N'配套調整的數值只可以-100與100之間!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'759', N'未售單位及車位報表')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'760', N'---選擇分組編碼---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'761', N'---選擇功能名稱---')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'762', N'新增車位價格之前/之後調整')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'763', N'賣主')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'764', N'賣主名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'765', N'未有單位/車位能夠顯示.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'766', N'顯示在這合約的輸入數值太長.\n在每個備註欄你只能輸入130英文字或65中文字.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'767', N'顯示在這合約的名稱太長.\n在每個姓氏+名字你只能輸入70英文字或35中文字.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'768', N'顯示在這合約的數值太長.\n在每個地址你只能輸入50個英文字或25個中文字.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'769', N'顯示在這合約的公司名稱太長.\n在這公司名稱你只能輸入50個英文字或25個中文字.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'770', N'信用卡')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'771', N'同一張信用卡的資料是不相同')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'772', N'<spanstyle=''color:red;font-weight:bold;''>在單位上樓層顯示次序不一致:<br>{0}</span>')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'773', N'在單位上樓層顯示次序不一致!\n請先更正這錯誤.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'774', N'確認合約日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'775', N'儲存買家資料')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'776', N'價錢範圍')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'777', N'印花稅總額程式')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'778', N'印花稅設定編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'779', N'印花稅設定名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'780', N'價格範圍數值')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'781', N'不能刪除這印花稅設定.\n系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'782', N'印花稅管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'783', N'包括印花稅')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'784', N'擱置印花稅')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'785', N'新增新印花稅設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'786', N'修改印花稅設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'787', N'刪除印花稅設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'788', N'瀏覽印花稅設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'789', N'價格範圍的數值不能少於先前已選擇的數值!\n請用刪除鈕在每個價格範圍的列移除不必要的列!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'790', N'號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'791', N'以下或等於')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'792', N'以上或等於')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'793', N'-')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'794', N'+')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'795', N'(')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'796', N')')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'797', N'X')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'798', N'%')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'799', N'合約價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'800', N'相關合約日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'801', N'狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'802', N'建築面積')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'803', N'單位比率')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'804', N'定價')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'805', N'付款方法價格')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'806', N'日期時間')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'807', N'用戶')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'808', N'顯示項目')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'809', N'可選之付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'81', N'[按購買者搜尋]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'810', N'已選之付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'811', N'相關S&P日期')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'812', N'[按單位搜尋]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'813', N'[按車位搜尋]')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'815', N'系統已選時間')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'816', N'檢查已取消選購車位(只有已選車位)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'820', N'項目顯示設定')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'821', N'請在顯示上選擇只少一個付款方法')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'822', N'系統不會保持單位或車位狀態!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'823', N'FS10 - 選購單位/車位(查看)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'824', N'發售')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'825', N'核對發售單位及/或符合的車位.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'826', N'核對發售車位(只有已選車位)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'827', N'發售系統已選單位/車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'828', N'單位/車位不可選購!更新你的顯示去查看最新狀態.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'829', N'總額應該是大過零')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'830', N'信用卡類別')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'850', N'銀行名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'851', N'律師事務所名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'852', N'地區名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'853', N'銷售處名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'854', N'發售單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'855', N'發售車位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'856', N'代理商名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'857', N'量度單位名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'858', N'國籍名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'859', N'項目期名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'860', N'銷售類別名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'861', N'國家名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'862', N'分析組碼名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'863', N'方法名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'864', N'配套名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'865', N'大廈名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'866', N'名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'867', N'街道名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'868', N'項目名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'869', N'項目名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'871', N'區域編碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'872', N'區域名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'873', N'區域編碼已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'874', N'區域編碼找不到.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'875', N'不能刪除這區域.系統使用中.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'876', N'區域編碼管理')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'877', N'區域')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'878', N'-----選擇區域-----')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'879', N'瀏覽單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'880', N'修改單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'881', N'刪除單位')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'882', N'工作平臺')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'883', N'空調房間')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'884', N'空調平臺')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'885', N'工作平臺需要數字格式.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'886', N'空調房間需要數字格式.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'887', N'空調平臺需要數字格式.')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'888', N'大廈/樓宇號碼')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'889', N'房號/街號')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'890', N'樓層/街道名稱')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'891', N'區域名稱已經存在!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'892', N'如果已選擇地區,區域必需要選擇!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'893', N'找不到記錄!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'894', N'只儲存狀態')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'895', N'(現金)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'896', N'(支票)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'897', N'(信用卡)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'898', N'香港身份證')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'899', N'(中文)')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'9994', N'證明無效! 請立即通知您的系統管理員!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'9995', N'系統將仍然有效使用期為 ')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'9996', N' 日!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'9997', N'證明無效! 您未被授權使用本系統!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'9998', N'請立即通知您的系統管理員!')
GO
INSERT [dbo].[MESSAGE] ([Lang_ID], [Msg_Cde], [Msg]) VALUES (N'T', N'9999', N'你的試用期將在2006年8月1日將到期!')
GO
COMMIT TRAN