USE [<<DBNAME>>]
GO
BEGIN TRAN
INSERT [dbo].[UOM] ([UOM_CODE], [UOM_DESC]) VALUES (N'ESQF', N'Square Feet')
GO
INSERT [dbo].[UOM] ([UOM_CODE], [UOM_DESC]) VALUES (N'ESQM', N'Square Meter')
GO
COMMIT TRAN
