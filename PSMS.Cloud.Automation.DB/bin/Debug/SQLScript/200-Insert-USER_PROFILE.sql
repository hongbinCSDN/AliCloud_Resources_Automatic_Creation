USE [<<DBNAME>>]
GO
BEGIN TRAN
INSERT [dbo].[USER_PROFILE] ([UID], [LEVEL_ID], [FIRST_NAME], [LAST_NAME], [PASSWORD], [ID], [EMAIL], [ADDR1], [ADDR2], [ADDR3], [TEL], [GENDER], [EXP_DATE], [TERMINATE], [LANG_ID], [ID_TYPE], [COMPANY], [SELECT_RESERVE], [OVERDUE], [LESS_DEPOSIT], [REFUND], [PAYMENT_SCHEDULE], [VOID_AM], [MODIFY_CONFIRM_MOA], [COMPANY_PERCENT], [BLACK_LIST], [SALES_BATCH], [MAX_PURCHASE_BUYER], [MAX_PURCHASE_COMBINE]) VALUES (N'asladmin', CAST(6 AS Numeric(1, 0)), N'ADMIN', N'ASL', HASHBYTES('MD5', N'asl@2018q3'), N'A1234567', N'', N'11/F Topsail Plaza', N'11 On Sum Street', N'', N'2608 6297', N'M', CAST(N'2109-12-31T00:00:00.000' AS DateTime), NULL, N'E', N' ', N'ASL', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y')
GO


INSERT [dbo].[USER_PROFILE] ([UID], [LEVEL_ID], [FIRST_NAME], [LAST_NAME], [PASSWORD], [ID], [EMAIL], [ADDR1], [ADDR2], [ADDR3], [TEL], [GENDER], [EXP_DATE], [TERMINATE], [LANG_ID], [ID_TYPE], [COMPANY], [SELECT_RESERVE], [OVERDUE], [LESS_DEPOSIT], [REFUND], [PAYMENT_SCHEDULE], [VOID_AM], [MODIFY_CONFIRM_MOA], [COMPANY_PERCENT], [BLACK_LIST], [SALES_BATCH], [MAX_PURCHASE_BUYER], [MAX_PURCHASE_COMBINE]) VALUES (N'admin', CAST(6 AS Numeric(1, 0)), N'ADMIN', N'', HASHBYTES('MD5', N'<<PASSWORD>>') , N'ADMIN', N'', N'ADMIN', N'', N'', N'', N'M', CAST(N'2109-12-31T00:00:00.000' AS DateTime), NULL, N'E', N' ', N'ADMIN', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y', N'Y')
GO
COMMIT TRAN