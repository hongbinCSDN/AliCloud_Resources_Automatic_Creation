USE [<<DBNAME>>]
GO
BEGIN TRAN
INSERT [dbo].[REGION] ([REGION_CODE], [REGION_DESC], [UP_FID], [UP_UID], [UP_DT]) VALUES (N'HK', N'Hong Kong', NULL, N'asladmin', CAST(N'2017-04-03T17:17:33.207' AS DateTime))
GO
INSERT [dbo].[REGION] ([REGION_CODE], [REGION_DESC], [UP_FID], [UP_UID], [UP_DT]) VALUES (N'KL', N'Kowloon', NULL, N'asladmin', CAST(N'2017-04-03T17:17:40.740' AS DateTime))
GO
INSERT [dbo].[REGION] ([REGION_CODE], [REGION_DESC], [UP_FID], [UP_UID], [UP_DT]) VALUES (N'NT', N'New Territories', NULL, N'asladmin', CAST(N'2017-04-03T17:17:48.187' AS DateTime))
GO
COMMIT TRAN