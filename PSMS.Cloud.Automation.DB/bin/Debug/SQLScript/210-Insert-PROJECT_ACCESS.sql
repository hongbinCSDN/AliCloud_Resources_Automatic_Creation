USE [<<DBNAME>>]
GO
BEGIN TRAN
INSERT [dbo].[PROJECT_ACCESS] ([UID], [PROJECT_ID]) VALUES (N'asladmin', N'ASL')
GO

INSERT [dbo].[PROJECT_ACCESS] ([UID], [PROJECT_ID]) VALUES (N'admin', N'ASL')
GO
COMMIT TRAN