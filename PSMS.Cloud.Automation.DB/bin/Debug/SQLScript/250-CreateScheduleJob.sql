USE [msdb]
GO

BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0

IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'PRICE LIST Daily Update_<<DBNAME>>', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'dbsa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Update FLAT_MASTER and CAR_PARK according to PRICE_LIST_MASTER', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'declare @project_id nvarchar(6)
declare @FM_CP_CODE nvarchar(80)
declare @adj_type char(1) = ''P''
declare @adj_unit char(1) = ''R''
declare @ori_price numeric(12,2)
declare @adj numeric(12,2)
declare @view_time varchar(25) = convert(nvarchar, getDate(), 126)
declare @up_uid NVarChar(10) = ''SQLAGENT''
declare @up_fid NVarChar(10) 
declare @returnStatus Int 
declare @outputMsg varchar(max)

declare cur CURSOR LOCAL for

    select  A.project_id,  A.FM_CP_CODE, A.ORI_PRICE, A.LIST_PRICE, A.PRICE_LIST_ID from [PRICE_LIST_EFFECTIVE] A
inner join ( select FM_CP_CODE, MAX(EFFECTIVE_DT) as MAXDATE from [PRICE_LIST_EFFECTIVE] where EFFECTIVE_DT <= GETDATE() group by FM_CP_CODE ) B
 on A.FM_CP_CODE = B.FM_CP_CODE and A.EFFECTIVE_DT = B.MAXDATE
where A.VALID = ''Y'' and A.ORI_PRICE <> A.LIST_PRICE


open cur

fetch next from cur into @project_id, @FM_CP_CODE, @ori_price, @adj, @up_fid

while @@FETCH_STATUS = 0 BEGIN
	IF @up_fid = ''FLAT''
    --execute your sproc on each row
		BEGIN
			exec updateFlatPrice @project_id, @FM_CP_CODE, @adj_type, @adj_unit, @adj, @view_time, @up_uid, @up_fid, @returnStatus OUTPUT

			SELECT @outputMsg = CONCAT(@outputMsg ,CASE @returnStatus
			WHEN  -1 then ''Error: Null Price (''+@project_id+'',''+@FM_CP_CODE+'')''+ CHAR(13)
			WHEN  -2 then ''Error: Null GFA (''+@project_id+'',''+@FM_CP_CODE+'')''+ CHAR(13)
			WHEN -3 then ''Error: Zero GFA (''+@project_id+'',''+@FM_CP_CODE+'')''+ CHAR(13)
			WHEN -4 then ''Error: Unit Updated By Others (''+@project_id+'',''+@FM_CP_CODE+'')''+ CHAR(13)
			WHEN -5 then ''Error: Update Insert Error (''+@project_id+'',''+@FM_CP_CODE+'')''+ CHAR(13)
			WHEN -6 then ''Error: Unit selected or sold (''+@project_id+'',''+@FM_CP_CODE+'')''+ CHAR(13)
			end )
			
		END
	ELSE IF @up_fid = ''CP''
		BEGIN

		declare @Adj_no INT
		Select @Adj_no = (isnull(max(adj_no),0)+1) From FLAT_PRICE_AUDIT Where Fm_Code = @FM_CP_CODE and Project_Id = @project_id  

		Update CAR_PARK
		Set PARK_LIST_PRICE = Round(@adj,0),
			UP_UID = @up_uid,
			UP_DT = getdate(),
			UP_FID = @up_fid
		Where CAR_PARK_ID = @FM_CP_CODE and Project_Id = @project_id 

		Insert Into FLAT_PRICE_AUDIT
		(Project_Id, Fm_Code, Adj_No, Org_Price, New_Price, Adj_Type,
		Adj_Unit, Adj, Up_Fid, Up_Uid, Up_Dt
		)
	Values
		(@project_id, @FM_CP_CODE, @Adj_no, @ori_price, Round(@adj, 0), @adj_type,
		@adj_unit, @adj, @up_fid, @up_uid, getdate() 
		)

		END

    fetch next from cur into @project_id, @FM_CP_CODE, @ori_price, @adj, @up_fid
END

close cur
deallocate cur

IF @outputMsg <> ''''
	RAISERROR( @outputMsg ,11,200)', 
		@database_name=N'<<DBNAME>>', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20180820, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'<<GUID>>'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


