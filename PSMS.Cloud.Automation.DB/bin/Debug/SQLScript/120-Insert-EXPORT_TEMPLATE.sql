USE [<<DBNAME>>]
GO
BEGIN TRAN
INSERT [dbo].[EXPORT_TEMPLATE] ([TEMPLATE_CODE], [TEMPLATE_TYPE], [TEMPLATE_NAME], [TEMPLATE_NAME_MSG_CDE]) VALUES (N'AG001', N'AG', N'AG - Sales', N'6021')
GO
INSERT [dbo].[EXPORT_TEMPLATE] ([TEMPLATE_CODE], [TEMPLATE_TYPE], [TEMPLATE_NAME], [TEMPLATE_NAME_MSG_CDE]) VALUES (N'AG002', N'AG', N'AG - Account', N'6022')
GO
INSERT [dbo].[EXPORT_TEMPLATE] ([TEMPLATE_CODE], [TEMPLATE_TYPE], [TEMPLATE_NAME], [TEMPLATE_NAME_MSG_CDE]) VALUES (N'BI001', N'BI', N'BI - Buyer Information', N'6306')
GO
INSERT [dbo].[EXPORT_TEMPLATE] ([TEMPLATE_CODE], [TEMPLATE_TYPE], [TEMPLATE_NAME], [TEMPLATE_NAME_MSG_CDE]) VALUES (N'CP001', N'CP', N'CP - Sales', N'6023')
GO
INSERT [dbo].[EXPORT_TEMPLATE] ([TEMPLATE_CODE], [TEMPLATE_TYPE], [TEMPLATE_NAME], [TEMPLATE_NAME_MSG_CDE]) VALUES (N'FM001', N'FM', N'FM - Sales', N'6024')
GO
COMMIT TRAN