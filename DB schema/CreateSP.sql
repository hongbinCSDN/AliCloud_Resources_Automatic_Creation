USE [PSMS_Sub_SIT]
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_COMMON_GetCurrentDBInstMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_COMMON_GetCurrentDBInstMasterID]
as


begin
select * from DB_INST_MASTER where IS_CURRENT_INSTANCE = 'true'

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_COMMON_GetDBInfoByPaymentMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_COMMON_GetDBInfoByPaymentMasterID]
@PaymentMasterID bigint
as

begin
	select PM.*, DBIM.DB_INSTANCE_ID, DBIM.CONNECTION_STRING, DBIM.WHITELIST, DBM.[DB_NAME] from SUS_T_PAYMENT PM 
		inner join DB_MASTER DBM on PM.RECORD_ID = DBM.PAYMENT_MASTER_ID
		inner join DB_INST_MASTER DBIM on DBIM.RECORD_ID = DBM.DB_INSTANCE_MASTER_ID
			
	where PM.RECORD_ID = @PaymentMasterID			
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_COMMON_GetScriptFileNameByTriggerSequence]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_COMMON_GetScriptFileNameByTriggerSequence]

@TriggerSequence nvarchar(50)

as 
begin

select * from CLOUD_DB_PROVISION_STATUS_DEF where [TRIGGER_SEQUENCE] = @TriggerSequence

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_COMMON_GetWFEPollingInterval]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_COMMON_GetWFEPollingInterval]

as
begin
select [VALUE] from CLOUD_SYS_PARAM where [KEY] = 'WFEPollingInterval'

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_COMMON_GetWFEPollingMaxRetryCount]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_COMMON_GetWFEPollingMaxRetryCount]

as
begin
select [VALUE] from CLOUD_SYS_PARAM where [KEY] = 'WFEPollingMaxRetryCount'

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DB_AddNewRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_DB_AddNewRecord]

@PaymentMasterID bigint,
@DBInstanceMasterID bigint,
@DBName nvarchar(255)

as


begin
insert into DB_MASTER (PAYMENT_MASTER_ID, DB_INSTANCE_MASTER_ID, [DB_NAME], PROVISION_STATUS_CODE, IS_ACTIVE, LAST_UPDATED)
values (@PaymentMasterID, @DBInstanceMasterID, @DBName, '000', 'true', GETDATE())

select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DB_GetRecordByPaymentMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[AUTOMATION_DB_GetRecordByPaymentMasterID]
@PaymentMasterID bigint

as

begin

select * from DB_MASTER where PAYMENT_MASTER_ID = @PaymentMasterID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DB_GetRecordByRecordID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[AUTOMATION_DB_GetRecordByRecordID]
@RecordID bigint

as

begin

select * from DB_MASTER where RECORD_ID = @RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DB_UpdateProvisionStatusCodeByRecordID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_DB_UpdateProvisionStatusCodeByRecordID]

@RecordID bigint

as
begin

declare @CurrentSequence nvarchar(50)
set @CurrentSequence = (select PROVISION_STATUS_CODE from DB_MASTER where RECORD_ID = @RecordID)

declare @UpdateSequence nvarchar(50)
set @UpdateSequence = (select UPDATE_SEQUENCE from CLOUD_DB_PROVISION_STATUS_DEF where TRIGGER_SEQUENCE = @CurrentSequence)
update DB_MASTER set PROVISION_STATUS_CODE = @UpdateSequence, LAST_UPDATED = GETDATE() where RECORD_ID = @RecordID

select @UpdateSequence
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DBINST_GetRecordByPaymentMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_DBINST_GetRecordByPaymentMasterID]
@PaymentMasterID bigint
as

begin


select DBIM.* from DB_INST_MASTER DBIM inner join DB_MASTER DBM on DBIM.RECORD_ID = DBM.DB_INSTANCE_MASTER_ID
where DBM.PAYMENT_MASTER_ID = @PaymentMasterID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DBINST_GetRecordByRecordID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_DBINST_GetRecordByRecordID]
@RecordID bigint
as

begin
select * from DB_INST_MASTER where RECORD_ID = @RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DBINST_UpdateWhitelistByRecordID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_DBINST_UpdateWhitelistByRecordID]

@RecordID bigint,
@Whitelist nvarchar(max)

as

begin

update DB_INST_MASTER
set whitelist = @Whitelist
where RECORD_ID = @RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DNS_AddNewRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_DNS_AddNewRecord]

@PaymentMasterID bigint,
@Subdomain nvarchar(100)

as


begin
insert into DNS_MASTER (PAYMENT_MASTER_ID, SUBDOMAIN, IS_ACTIVE, LAST_UPDATED)
values (@PaymentMasterID, @Subdomain, 'true', GETDATE())

select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DNS_GetRecordByPaymentMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[AUTOMATION_DNS_GetRecordByPaymentMasterID]
@PaymentMasterID bigint

as

begin

select * from DNS_MASTER where PAYMENT_MASTER_ID = @PaymentMasterID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_DNS_UpdateDNSIP]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_DNS_UpdateDNSIP]
@RecordID bigint,
@DNSIP nvarchar(50)
as

begin
update DNS_MASTER set DNS_IP = @DNSIP, LAST_UPDATED = GETDATE()
where RECORD_ID = @RecordID
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_PM_GetLastOrderRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_PM_GetLastOrderRecord]
@LastOrderRef nvarchar(50)

as
begin

select * from SUS_T_PAYMENT where ORDERREF = @LastOrderRef

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_PM_GetRecordByPaymentMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_PM_GetRecordByPaymentMasterID]
@PaymentMasterID bigint
as 

begin
select * from SUS_T_PAYMENT where RECORD_ID = @PaymentMasterID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_PM_GetRecordByStatusCode]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_PM_GetRecordByStatusCode]
@StatusCode nvarchar(255)
as 

begin
select * from SUS_T_PAYMENT where STATUS_CODE = @StatusCode

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_PM_UpdateStatusCode]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_PM_UpdateStatusCode]
@RecordID bigint,
@StatusCode nvarchar(20)
as

begin
update SUS_T_PAYMENT set STATUS_CODE = @StatusCode
where RECORD_ID = @RecordID
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_AddNewRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_AddNewRecord]
@OldWFEMasterID bigint,
@VMInstanceID nvarchar(255),
@OldPaymentMasterID bigint,
@NewPaymentMasterID bigint,
@RenewAction nvarchar(50)
as
begin

insert into RENEW_PROCESS_MASTER (OLD_WFE_MASTER_ID, VM_INSTANCE_ID, OLD_PAYMENT_MASTER_ID, NEW_PAYMENT_MASTER_ID, RENEW_ACTION, RENEW_STATUS_CODE)
values(@OldWFEMasterID, @VMInstanceID, @OldPaymentMasterID, @NewPaymentMasterID, @RenewAction, 'INIT')

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_DuplicateDBRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_DuplicateDBRecord]
@OldDBMasterID bigint,
@NewPaymentMasterID bigint
as
begin

begin tran

insert into DB_MASTER(PAYMENT_MASTER_ID, DB_INSTANCE_MASTER_ID, [DB_NAME], PROVISION_STATUS_CODE, IS_ACTIVE, LAST_UPDATED)
select @NewPaymentMasterID, DB_INSTANCE_MASTER_ID, [DB_NAME], PROVISION_STATUS_CODE, IS_ACTIVE, GETDATE() from DB_MASTER
where RECORD_ID = @OldDBMasterID

declare @NewDBMasterID bigint
set @NewDBMasterID = (select SCOPE_IDENTITY())

update DB_MASTER set IS_ACTIVE = 0, LAST_UPDATED = GETDATE() where RECORD_ID = @OldDBMasterID


commit tran

end


GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_DuplicateDNSRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_DuplicateDNSRecord]
@OldDNSMasterID bigint,
@NewPaymentMasterID bigint
as
begin

begin tran

insert into DNS_MASTER(PAYMENT_MASTER_ID, SUBDOMAIN, DNS_IP, IS_ACTIVE, LAST_UPDATED)
select @NewPaymentMasterID, SUBDOMAIN, DNS_IP, IS_ACTIVE, GETDATE() from DNS_MASTER
where RECORD_ID = @OldDNSMasterID

declare @NewDNSMasterID bigint
set @NewDNSMasterID = (select SCOPE_IDENTITY())

update DNS_MASTER set IS_ACTIVE = 0, LAST_UPDATED = GETDATE() where RECORD_ID = @OldDNSMasterID


commit tran

end



GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_DuplicateSLBRecordWithNewProvisionStatusCode]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_DuplicateSLBRecordWithNewProvisionStatusCode]
@OldSLBMasterID bigint,
@NewPaymentMasterID bigint,
@ProvisionStatusCode nvarchar(50)
as
begin

begin tran

insert into SLB_MASTER(PAYMENT_MASTER_ID, SLB_INSTANCE_ID, SLB_STATUS, INTERNET_IP, CLIENT_TOKEN, PROVISION_STATUS_CODE, CREATED_ON, IS_ACTIVE, LAST_UPDATED)
select @NewPaymentMasterID, SLB_INSTANCE_ID, SLB_STATUS, INTERNET_IP, CLIENT_TOKEN, @ProvisionStatusCode, CREATED_ON, IS_ACTIVE, GETDATE() from SLB_MASTER
where RECORD_ID = @OldSLBMasterID

declare @NewSLBMasterID bigint
set @NewSLBMasterID = (select SCOPE_IDENTITY())

update SLB_MASTER set IS_ACTIVE = 0, LAST_UPDATED = GETDATE() where RECORD_ID = @OldSLBMasterID


commit tran

end




GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_DuplicateWFERecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_DuplicateWFERecord]
@OldWFEMasterID bigint,
@NewPaymentMasterID bigint
as
begin

begin tran

insert into WFE_MASTER(PAYMENT_MASTER_ID, SLB_MASTER_ID, VM_INSTANCE_ID, VM_IP, INTERNET_IP, VM_STATUS, CREATED_ON, CONFIG_FILE_UPDATED, IIS_BINDING_UPDATED, CLIENT_TOKEN, IS_ACTIVE, EXPIRE_ON, LAST_UPDATED)
select @NewPaymentMasterID, SLB_MASTER_ID, VM_INSTANCE_ID, VM_IP, INTERNET_IP, VM_STATUS, CREATED_ON, CONFIG_FILE_UPDATED, IIS_BINDING_UPDATED, CLIENT_TOKEN, IS_ACTIVE, EXPIRE_ON, GETDATE() from WFE_MASTER
where RECORD_ID = @OldWFEMasterID

declare @NewWFEMasterID bigint
set @NewWFEMasterID = (select SCOPE_IDENTITY())

update WFE_MASTER set IS_ACTIVE = 0, LAST_UPDATED = GETDATE() where RECORD_ID = @OldWFEMasterID

update RENEW_PROCESS_MASTER set NEW_WFE_MASTER_ID = @NewWFEMasterID where OLD_WFE_MASTER_ID = @OldWFEMasterID

commit tran

end


GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_GetRecordByNewPaymentMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_GetRecordByNewPaymentMasterID]

@NewPaymentMasterID bigint

as
begin

select * from RENEW_PROCESS_MASTER where NEW_PAYMENT_MASTER_ID = @NewPaymentMasterID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_GetRecordByNewPaymentMasterIDAndRenewAction]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_GetRecordByNewPaymentMasterIDAndRenewAction]
@NewPaymentMasterID bigint,
@RenewAction nvarchar(50)
as
begin
select * from RENEW_PROCESS_MASTER where NEW_PAYMENT_MASTER_ID = @NewPaymentMasterID and RENEW_ACTION = @RenewAction
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_GetRecordByNewWFEMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_GetRecordByNewWFEMasterID]
@NewWFEMasterID bigint

as

begin

select * from RENEW_PROCESS_MASTER where NEW_WFE_MASTER_ID = @NewWFEMasterID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_GetRenewRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_GetRenewRecord]
@VMInstanceID nvarchar(255),
@OldPaymentMasterID bigint,
@NewPaymentMasterID bigint

as

begin
select * from RENEW_PROCESS_MASTER where VM_INSTANCE_ID = @VMInstanceID and OLD_PAYMENT_MASTER_ID = @OldPaymentMasterID and NEW_PAYMENT_MASTER_ID = @NewPaymentMasterID


end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_UpdateAllMasterRecords]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_UpdateAllMasterRecords]
@LastOrderRecordID bigint,
@NewOrderRecordID bigint,
@ExpireOn datetime
as

begin

begin tran
-- DB
insert into DB_MASTER(PAYMENT_MASTER_ID, DB_INSTANCE_MASTER_ID, [DB_NAME], PROVISION_STATUS_CODE, IS_ACTIVE, LAST_UPDATED)
select @NewOrderRecordID, DB_INSTANCE_MASTER_ID, [DB_NAME], PROVISION_STATUS_CODE, IS_ACTIVE, GETDATE() from DB_MASTER
where PAYMENT_MASTER_ID = @LastOrderRecordID

update DB_MASTER set IS_ACTIVE = 0, LAST_UPDATED = GETDATE() where PAYMENT_MASTER_ID = @LastOrderRecordID

-- DNS
insert into DNS_MASTER(PAYMENT_MASTER_ID, SUBDOMAIN, DNS_IP, IS_ACTIVE, LAST_UPDATED) 
select @NewOrderRecordID, SUBDOMAIN, DNS_IP, IS_ACTIVE, GETDATE() from DNS_MASTER
where PAYMENT_MASTER_ID = @LastOrderRecordID

update DNS_MASTER set IS_ACTIVE = 0, LAST_UPDATED = GETDATE() where PAYMENT_MASTER_ID = @LastOrderRecordID

-- SLB
insert into SLB_MASTER(PAYMENT_MASTER_ID, SLB_INSTANCE_ID, SLB_STATUS, INTERNET_IP, CLIENT_TOKEN, PROVISION_STATUS_CODE, CREATED_ON, IS_ACTIVE, LAST_UPDATED)
select @NewOrderRecordID, SLB_INSTANCE_ID, SLB_STATUS, INTERNET_IP, CLIENT_TOKEN, PROVISION_STATUS_CODE, GETDATE(), IS_ACTIVE, GETDATE() from SLB_MASTER
where PAYMENT_MASTER_ID = @LastOrderRecordID

update SLB_MASTER set IS_ACTIVE = 0, LAST_UPDATED = GETDATE() where PAYMENT_MASTER_ID = @LastOrderRecordID

declare @SLBMasterID bigint
set @SLBMasterID = (select top 1 RECORD_ID from SLB_MASTER where PAYMENT_MASTER_ID = @NewOrderRecordID)

-- WFE
insert into WFE_Master(PAYMENT_MASTER_ID, SLB_MASTER_ID, VM_INSTANCE_ID, VM_IP, INTERNET_IP, VM_STATUS, CREATED_ON, CONFIG_FILE_UPDATED, IIS_BINDING_UPDATED, CLIENT_TOKEN, IS_ACTIVE, EXPIRE_ON, LAST_UPDATED)
select @NewOrderRecordID, @SLBMasterID, VM_INSTANCE_ID, VM_IP, INTERNET_IP, VM_STATUS, GETDATE(), CONFIG_FILE_UPDATED, IIS_BINDING_UPDATED, CLIENT_TOKEN, IS_ACTIVE, @ExpireOn, GETDATE() from WFE_MASTER
where PAYMENT_MASTER_ID = @LastOrderRecordID

update WFE_MASTER set IS_ACTIVE = 0, LAST_UPDATED = GETDATE() where PAYMENT_MASTER_ID = @LastOrderRecordID




commit tran

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_UpdateLastProcessOn]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_UpdateLastProcessOn]
@VMInstanceID nvarchar(255),
@OldPaymentMasterID bigint,
@NewPaymentMasterID bigint,
@LastProcessOn datetime
as
begin
update RENEW_PROCESS_MASTER set LAST_PROCESS_ON = @LastProcessOn where VM_INSTANCE_ID = @VMInstanceID and OLD_PAYMENT_MASTER_ID = @OldPaymentMasterID and NEW_PAYMENT_MASTER_ID = @NewPaymentMasterID
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_UpdateNewWFEMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_UpdateNewWFEMasterID]
@RecordID bigint,
@NewWFEMasterID bigint

as 

begin

update RENEW_PROCESS_MASTER set NEW_WFE_MASTER_ID = @NewWFEMasterID where RECORD_ID = @RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_UpdateRenewAction]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_UpdateRenewAction]
@VMInstanceID nvarchar(255),
@OldPaymentMasterID bigint,
@NewPaymentMasterID bigint,
@RenewAction nvarchar(50)
as
begin
update RENEW_PROCESS_MASTER set RENEW_ACTION = @RenewAction where VM_INSTANCE_ID = @VMInstanceID and OLD_PAYMENT_MASTER_ID = @OldPaymentMasterID and NEW_PAYMENT_MASTER_ID = @NewPaymentMasterID
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_UpdateRenewRequestSentOn]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_UpdateRenewRequestSentOn]
@VMInstanceID nvarchar(255),
@OldPaymentMasterID bigint,
@NewPaymentMasterID bigint,
@RenewRequestSentOn datetime
as
begin
update RENEW_PROCESS_MASTER set RENEW_REQUEST_SENT_ON = @RenewRequestSentOn where VM_INSTANCE_ID = @VMInstanceID and OLD_PAYMENT_MASTER_ID = @OldPaymentMasterID and NEW_PAYMENT_MASTER_ID = @NewPaymentMasterID
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_RENEW_UpdateRenewStatusCode]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_RENEW_UpdateRenewStatusCode]
@VMInstanceID nvarchar(255),
@OldPaymentMasterID bigint,
@NewPaymentMasterID bigint,
@RenewStatusCode nvarchar(50)
as
begin
update RENEW_PROCESS_MASTER set RENEW_STATUS_CODE = @RenewStatusCode where VM_INSTANCE_ID = @VMInstanceID and OLD_PAYMENT_MASTER_ID = @OldPaymentMasterID and NEW_PAYMENT_MASTER_ID = @NewPaymentMasterID
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_SLB_AddNewRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_SLB_AddNewRecord]
@PaymentMasterID bigint,
@ClientToken nvarchar(255)

as



begin
insert into SLB_MASTER (PAYMENT_MASTER_ID, CLIENT_TOKEN, IS_ACTIVE, LAST_UPDATED)
values (@PaymentMasterID, @ClientToken, 'true', GETDATE())

select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_SLB_GetRecordByPaymentMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[AUTOMATION_SLB_GetRecordByPaymentMasterID]
@PaymentMasterID bigint

as

begin

select * from SLB_MASTER where PAYMENT_MASTER_ID = @PaymentMasterID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_SLB_UpdateProvisionStatusCode]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_SLB_UpdateProvisionStatusCode]
@RecordID bigint,
@ProvisionStatusCode nvarchar(50)
as

begin
update SLB_MASTER set PROVISION_STATUS_CODE = @ProvisionStatusCode, LAST_UPDATED = GETDATE()
where RECORD_ID = @RecordID
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_SLB_UpdateRecordAfterInstanceCreated]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_SLB_UpdateRecordAfterInstanceCreated]
@RecordID bigint,
@SLBInstanceID nvarchar(255),
@SLBStatus nvarchar(255),
@InternetIP nvarchar(50),
@ProvisionStatusCode nvarchar(50),
@CreatedOn datetime
as

begin
update SLB_MASTER
set SLB_INSTANCE_ID = @SLBInstanceID,
SLB_STATUS = @SLBStatus,
INTERNET_IP = @InternetIP,
PROVISION_STATUS_CODE = @ProvisionStatusCode,
CREATED_ON = @CreatedOn,
LAST_UPDATED = GETDATE()

where RECORD_ID =@RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_SLB_UpdateSLBStatus]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_SLB_UpdateSLBStatus]
@RecordID bigint,
@SLBStatus nvarchar(255)
as

begin
update SLB_MASTER
set SLB_STATUS = @SLBStatus,
LAST_UPDATED = GETDATE()
where RECORD_ID =@RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_AddNewRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AUTOMATION_WFE_AddNewRecord]
@PaymentMasterID bigint,
@SLBMasterID bigint = null,
@VMInstanceID nvarchar(255) = null,
@VMIP nvarchar(50) = null,
@VMStatus nvarchar(50) = null,
@CreatedOn datetime = null,
@ConfigFileUpdated bit = null,
@IISBindingUpdated bit = null,
@ClientToken nvarchar(255) = null

as



begin
insert into WFE_MASTER (PAYMENT_MASTER_ID, SLB_MASTER_ID, VM_INSTANCE_ID, VM_IP, VM_STATUS, CREATED_ON, CONFIG_FILE_UPDATED, IIS_BINDING_UPDATED, CLIENT_TOKEN, IS_ACTIVE, LAST_UPDATED)
values (@PaymentMasterID, @SLBMasterID, @VMInstanceID, @VMInstanceID, @VMStatus, @CreatedOn, @ConfigFileUpdated, @IISBindingUpdated, @ClientToken, 'true', GETDATE())

select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_GetRecordByPaymentMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_WFE_GetRecordByPaymentMasterID]
@PaymentMasterID bigint

as

begin

select * from WFE_MASTER where PAYMENT_MASTER_ID = @PaymentMasterID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_GetRecordByRecordID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_WFE_GetRecordByRecordID]
@RecordID bigint
as
begin
select * from WFE_MASTER where RECORD_ID = @RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_GetRecordWithEarliestExpiryDate]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AUTOMATION_WFE_GetRecordWithEarliestExpiryDate]
@PaymentMasterID bigint
as
begin

select top 1 * from WFE_MASTER where PAYMENT_MASTER_ID = @PaymentMasterID order by EXPIRE_ON

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_SetToInactive]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_WFE_SetToInactive]
@RecordID bigint

as
begin

update WFE_MASTER set IS_ACTIVE = 'false' where RECORD_ID = @RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_UpdateConfigFlagByWFEMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_WFE_UpdateConfigFlagByWFEMasterID]
@RecordID bigint,
@ConfigFileUpdated bit
as
begin
update WFE_MASTER set CONFIG_FILE_UPDATED = @ConfigFileUpdated, LAST_UPDATED = GETDATE() where RECORD_ID = @RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_UpdateExpireOnByWFEMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[AUTOMATION_WFE_UpdateExpireOnByWFEMasterID]
@RecordID bigint,
@ExpireOn datetime
as

begin
update WFE_MASTER
set EXPIRE_ON=@ExpireOn,
LAST_UPDATED = GETDATE()

where RECORD_ID =@RecordID



end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_UpdateRecordAfterInstanceCreated]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_WFE_UpdateRecordAfterInstanceCreated]
@RecordID bigint,
@VMInstanceID nvarchar(255),
@VMStatus nvarchar(50),
@CreatedOn datetime
as

begin
update WFE_MASTER
set VM_INSTANCE_ID = @VMInstanceID,
VM_STATUS = @VMStatus,
CREATED_ON = @CreatedOn,
LAST_UPDATED = GETDATE()

where RECORD_ID =@RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_UpdateRecordAfterSLBCreated]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_WFE_UpdateRecordAfterSLBCreated]
@RecordID bigint,
@SLBMasterID bigint,
@InternetIP nvarchar(50)
as

begin
update WFE_MASTER
set SLB_MASTER_ID = @SLBMasterID,
INTERNET_IP = @InternetIP,
LAST_UPDATED = GETDATE()

where RECORD_ID =@RecordID

end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_UpdateVMIPByWFEMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_WFE_UpdateVMIPByWFEMasterID]
@RecordID bigint,
@VMIP nvarchar(50)
as

begin
update WFE_MASTER
set VM_IP = @VMIP,
LAST_UPDATED = GETDATE()

where RECORD_ID =@RecordID



end
GO
/****** Object:  StoredProcedure [dbo].[AUTOMATION_WFE_UpdateVMStatusByWFEMasterID]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AUTOMATION_WFE_UpdateVMStatusByWFEMasterID]
@RecordID bigint,
@VMStatus nvarchar(50)
as

begin
update WFE_MASTER
set VM_STATUS = @VMStatus,
LAST_UPDATED = GETDATE()

where RECORD_ID =@RecordID



end
GO
/****** Object:  StoredProcedure [dbo].[SP_CheckTokenValues]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CheckTokenValues]
(
	@TOKEN VARCHAR(500),
	@USERNAME VARCHAR(50)
)
AS
BEGIN
	DECLARE @ISEXITS INT
	SELECT @ISEXITS = 1 FROM SYS_T_CUSTOMER WHERE CUSTOMER_ID = @USERNAME AND TOKEN = @TOKEN AND GETDATE() < TOKEN_AT_DT
	--ADD BY BILL 2018.8.27
	DECLARE @TOEKN_ISEXIST INT  
	SELECT @TOEKN_ISEXIST = 1 FROM SYS_T_CUSTOMER WHERE CUSTOMER_ID = @USERNAME AND TOKEN != @TOKEN AND GETDATE() < TOKEN_AT_DT
	--END
	
	IF @ISEXITS = 1
		BEGIN
			UPDATE SYS_T_CUSTOMER SET TOKEN_CR_DT=GETDATE(),TOKEN_AT_DT=DATEADD(MINUTE,30,GETDATE()) WHERE CUSTOMER_ID = @USERNAME
			GOTO SUCCESS;
		END
	--ADD BY BILL 2018.8.27
	ELSE IF @TOEKN_ISEXIST = 1
		BEGIN
			GOTO EXIST;
		END
	--END
	ELSE
		BEGIN
			GOTO ERROR;
		END

	SUCCESS:
		BEGIN
			SELECT 1 AS 'RESULT'
			RETURN;
		END
	ERROR:
		BEGIN
			SELECT 0 AS 'RESULT'
			RETURN;
		END
	-- ADD BY BILL 2018.8.27
	EXIST:
		BEGIN
			SELECT -1 AS 'RESULT'
			RETURN;
		END
	--END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ExternalInterface_UpdateProductExpireDate]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ExternalInterface_UpdateProductExpireDate]
(
	@RECORD_ID BIGINT,
	@PRODUCT_AT_TIME DATETIME
)
AS
BEGIN
	 DECLARE @ISEXITS INT  
	 DECLARE @ISCODE INT 
	 SET @ISEXITS = 0	 
	 SELECT @ISEXITS = 1 FROM SUS_T_PAYMENT WHERE RECORD_ID = @RECORD_ID AND STATUS_PAYMENT = '0'	 
	 IF @ISEXITS = 1 
	 BEGIN
		UPDATE SUS_T_PAYMENT SET PRODUCT_AT_TIME=@PRODUCT_AT_TIME WHERE RECORD_ID=@RECORD_ID AND STATUS_PAYMENT='0'
		GOTO SUCCESS;
	 END	 
	 ELSE
	 BEGIN
		GOTO ERROR;
	 END

	 SUCCESS:
	 BEGIN
		SELECT 0 AS 'RESULT'
		RETURN;
	 END

	 ERROR:
	 BEGIN
		SELECT 100 AS 'RESULT'
		RETURN;
	 END	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ExternalInterface_UpdateStatusCode]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ExternalInterface_UpdateStatusCode]
(
	@RECORD_ID BIGINT,
	@STATUS_CODE VARCHAR(20)
)
AS
BEGIN
	 DECLARE @ISEXITS INT  
	 DECLARE @ISCODE INT 
	 SET @ISEXITS = 0
	 SET @ISCODE = 0
	 SELECT @ISEXITS = 1 FROM SUS_T_PAYMENT WHERE RECORD_ID = @RECORD_ID AND STATUS_PAYMENT = '0'
	 SELECT @ISCODE = 1 FROM SYS_T_ALICLOUDSTATUS WHERE STATUS_CODE = @STATUS_CODE
	 IF @ISEXITS = 1 AND @ISCODE = 1
	 BEGIN
		UPDATE SUS_T_PAYMENT SET STATUS_CODE=@STATUS_CODE WHERE RECORD_ID=@RECORD_ID AND STATUS_PAYMENT='0'
		GOTO SUCCESS;
	 END
	 ELSE IF @ISCODE = 0
	 BEGIN
		GOTO ERROR1;
	 END
	 ELSE
	 BEGIN
		GOTO ERROR2;
	 END

	 SUCCESS:
	 BEGIN
		SELECT 0 AS 'RESULT'
		RETURN;
	 END

	 ERROR1:
	 BEGIN
		SELECT 200 AS 'RESULT'
		RETURN;
	 END

	 ERROR2:
	 BEGIN
		SELECT 100 AS 'RESULT'
		RETURN;
	 END	 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Notification_SelectExpireProductUser]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Notification_SelectExpireProductUser]
AS
BEGIN
	SELECT * FROM 
	(SELECT SUS_T_PAYMENT.*,SYS_T_CUSTOMER.EMAIL 
	FROM SUS_T_PAYMENT LEFT JOIN SYS_T_CUSTOMER ON SUS_T_PAYMENT.CUSTOMER_ID = SYS_T_CUSTOMER.CUSTOMER_ID
	) AS A
	WHERE DATEDIFF(dd,getdate(),PRODUCT_AT_TIME) < 8 AND DATEDIFF(dd,getdate(),PRODUCT_AT_TIME) > 0 AND STATUS_PAYMENT='0' AND STATUS_CODE <> 'EXPIRE' 	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Payment_AddPaymentRecord]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Payment_AddPaymentRecord]
(
	@PRC INT = 0,
	@SRC INT = 0,
	@ORD VARCHAR(40)=NULL,
	@REF VARCHAR(100)=NULL,
	@PAYREF INT = 0,
	@SUCCESSCODE INT = 0,
	@AMT VARCHAR(30) = NULL,
	@CUR VARCHAR(3) = NULL,
	@HOLDER VARCHAR(40) = NULL,
	@AUTHID VARCHAR(50) = NULL,
	@ALERTCODE VARCHAR(50)=NULL,
	@REMARK VARCHAR(200)=NULL,
	@ECI VARCHAR(2)=NULL,
	@PAYERAUTH VARCHAR(1)=NULL,
	@SOURCEIP VARCHAR(15)=NULL,
	@IPCOUNTRY VARCHAR(3)=NULL,
	@PAYMETHOD VARCHAR(10)=NULL,
	@CARDLSSUINGCOUNTRY VARCHAR(3)=NULL,
	@CHANNELTYPE VARCHAR(3)=NULL
)
AS
BEGIN
	DECLARE @DT DATETIME = GETDATE()
	INSERT INTO PAY_T_PAYMENTRECORD (PRC,SRC,ORD,REF,PAYREF,SUCCESSCODE,AMT,CUR,HOLDER,AUTHID,ALERTCODE,REMARK,ECI,PAYERAUTH,SOURCEIP,IPCOUNTRY,PAYMETHOD,CARDLSSUINGCOUNTRY,CHANNELTYPE,CREATE_TIME)
	VALUES (@PRC,@SRC,@ORD,@REF,@PAYREF,@SUCCESSCODE,@AMT,@CUR,@HOLDER,@AUTHID,@ALERTCODE,@REMARK,@ECI,@PAYERAUTH,@SOURCEIP,@IPCOUNTRY,@PAYMETHOD,@CARDLSSUINGCOUNTRY,@CHANNELTYPE,@DT)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Payment_CheckIsCanRenew]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Payment_CheckIsCanRenew]
(
	@ORDERREF VARCHAR(50)
)
AS
BEGIN
	DECLARE @EXPIREDATE DATETIME
	SELECT @EXPIREDATE = PRODUCT_AT_TIME FROM SUS_T_PAYMENT WHERE ORDERREF = @ORDERREF
	IF DATEDIFF(DAY,GETDATE(),@EXPIREDATE) > 7 OR DATEDIFF(DAY,GETDATE(),@EXPIREDATE) < -15
	BEGIN
		GOTO ERROR;		
	END
	ELSE IF DATEDIFF(DAY,GETDATE(),@EXPIREDATE) < 7 AND DATEDIFF(DAY,GETDATE(),@EXPIREDATE) > -15
	BEGIN
		GOTO SUCCESS;
	END
	SUCCESS:
	BEGIN
		SELECT 1 AS 'RESULT'
	RETURN;
	END

	ERROR:
	BEGIN
		SELECT 0 AS 'RESULT'
	RETURN;
END
END

DECLARE @DAY INT
Select @DAY =  DATEDIFF(DAY,GETDATE(),'2018-08-20 10:59:51.973')
PRINT  @DAY
GO
/****** Object:  StoredProcedure [dbo].[SP_Payment_CreateOrder]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Payment_CreateOrder]
(
	@ORDERREF VARCHAR(50),
	@CUSTOMER_ID VARCHAR(50),
	@STATUS_CODE VARCHAR(10),
	@STATUS_PAYMENT	VARCHAR(1) = '1',
	@AMOUNT DECIMAL,
	@PAYMENT_TYPE_ID VARCHAR(5),
	@DOMAIN_NAME VARCHAR(100),
	@RENEWAL_LAST_ORDERREF VARCHAR(50),
	@MULTILINGUAL_ID VARCHAR(2)
)
AS
BEGIN
	DECLARE @RECORD_ID INT
	IF (SELECT COUNT(*) FROM SUS_T_PAYMENT) = 0
		BEGIN
			SET @RECORD_ID = 1
		END
	ELSE
		BEGIN
			SET @RECORD_ID = (SELECT MAX(RECORD_ID) FROM SUS_T_PAYMENT) +1 
		END
	INSERT INTO SUS_T_PAYMENT (RECORD_ID,ORDERREF,CUSTOMER_ID,STATUS_CODE,STATUS_PAYMENT,AMOUNT,PAYMENT_TYPE_ID,DOMAIN_NAME,CREATE_TIME,UPDATE_TIME,RENEWAL_LAST_ORDERREF,MULTILINGUAL_ID)
	VALUES (@RECORD_ID,@ORDERREF,@CUSTOMER_ID,@STATUS_CODE,@STATUS_PAYMENT,@AMOUNT,@PAYMENT_TYPE_ID,@DOMAIN_NAME,GETDATE(),GETDATE(),@RENEWAL_LAST_ORDERREF,@MULTILINGUAL_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Payment_SelectProductInfo]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Payment_SelectProductInfo]
(
	@REF VARCHAR(50),
	@MULTILINGUAL_ID VARCHAR(2)
)
AS
BEGIN
	DECLARE @PRODUCR_ID VARCHAR(2)
	DECLARE @CUSTOMER_ID VARCHAR(50)
	SELECT @PRODUCR_ID=PAYMENT_TYPE_ID,@CUSTOMER_ID = CUSTOMER_ID FROM SUS_T_PAYMENT WHERE ORDERREF = @REF
	SELECT * FROM PAY_T_PRODUCTINFO WHERE PRODUCT_ID = @PRODUCR_ID AND MULTILINGUAL_ID=@MULTILINGUAL_ID
	SELECT EMAIL,CUSTOMER_ID FROM SYS_T_CUSTOMER WHERE CUSTOMER_ID = @CUSTOMER_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Payment_SelectProductPostForm]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Payment_SelectProductPostForm]
(
	@CATEGORY VARCHAR(2)
)
AS
BEGIN
	--SELECT * FROM PAY_T_PAYMENTPOSTFORM WHERE PRODUCRID = @CATEGORY	
	--MODIFY BY BILL 2018.8.13
	DECLARE @ORDERREF VARCHAR(50)
	SELECT @ORDERREF=ORDERREF FROM PAY_T_PAYMENTPOSTFORM WHERE PRODUCRID = @CATEGORY
	WHILE EXISTS(SELECT * FROM PAY_T_PAYMENTRECORD WHERE REF = @ORDERREF)
		BEGIN
			UPDATE PAY_T_PAYMENTPOSTFORM SET ORDERREF = CONVERT(VARCHAR,(CONVERT(int,@ORDERREF)+1)) WHERE PRODUCRID = @CATEGORY
		END
	SELECT * FROM PAY_T_PAYMENTPOSTFORM WHERE PRODUCRID = @CATEGORY    
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Payment_UpdatePaymentStatus]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Payment_UpdatePaymentStatus]
(
	@REF VARCHAR(100),
	@AMT VARCHAR(50),
	@SUCCESSCODE INT
)
AS
BEGIN
	DECLARE @AMTOUNT DECIMAL(18,2)
	SELECT @AMTOUNT=AMOUNT FROM  SUS_T_PAYMENT WHERE ORDERREF=@REF
	IF @AMTOUNT = CONVERT(DECIMAL(18,2),@AMT) 
		BEGIN
			UPDATE SUS_T_PAYMENT SET STATUS_PAYMENT=@SUCCESSCODE,UPDATE_TIME = GETDATE() WHERE ORDERREF=@REF
			IF @SUCCESSCODE = '0'
				BEGIN
					--UPDATE SUS_T_PAYMENT SET STATUS_CODE = 'INIT' WHERE ORDERREF=@REF
					--MODIFY BY BILL 2018.8.24
					DECLARE @RENEWAL_LAST_ORDERREF VARCHAR(50)
					DECLARE @RENEWAL_LAST_PRODUCT_AT_TIME DATETIME
					SELECT @RENEWAL_LAST_ORDERREF=RENEWAL_LAST_ORDERREF FROM SUS_T_PAYMENT WHERE ORDERREF = @REF
					SELECT @RENEWAL_LAST_PRODUCT_AT_TIME = PRODUCT_AT_TIME FROM SUS_T_PAYMENT WHERE ORDERREF = @RENEWAL_LAST_ORDERREF
					IF @RENEWAL_LAST_ORDERREF <> 'N' AND @RENEWAL_LAST_PRODUCT_AT_TIME > GETDATE()
						BEGIN
							UPDATE SUS_T_PAYMENT SET STATUS_CODE = 'RENEWAL',PRODUCT_CR_TIME = GETDATE(),PRODUCT_AT_TIME = DATEADD(DAY,DATEDIFF(DAY,GETDATE(),@RENEWAL_LAST_PRODUCT_AT_TIME),DATEADD(MONTH,1,GETDATE())) WHERE ORDERREF=@REF  
							UPDATE SUS_T_PAYMENT SET STATUS_CODE = 'EXPIRE',STATUS_PAYMENT='1'  WHERE ORDERREF = @RENEWAL_LAST_ORDERREF
						END
					ELSE IF @RENEWAL_LAST_ORDERREF <> 'N' AND @RENEWAL_LAST_PRODUCT_AT_TIME < GETDATE()
						BEGIN
							UPDATE SUS_T_PAYMENT SET STATUS_CODE = 'RENEWAL',PRODUCT_CR_TIME = GETDATE(),PRODUCT_AT_TIME = DATEADD(MONTH,1,GETDATE()) WHERE ORDERREF=@REF  
							UPDATE SUS_T_PAYMENT SET STATUS_CODE = 'EXPIRE',STATUS_PAYMENT='1'  WHERE ORDERREF = @RENEWAL_LAST_ORDERREF
						END
					ELSE
						BEGIN
							UPDATE SUS_T_PAYMENT SET STATUS_CODE = 'INIT',PRODUCT_CR_TIME = GETDATE(),PRODUCT_AT_TIME = DATEADD(MONTH,1,GETDATE()) WHERE ORDERREF=@REF
						END					
					SELECT 1 AS 'RESULT'
					RETURN;	
				END
		END
	ELSE
		BEGIN
			SELECT 0 AS 'RESULT'
		    RETURN;
		END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Personal_UpdatePassword]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Personal_UpdatePassword]
	-- Add the parameters for the stored procedure here
	@NEWPASSWORD varchar(100),
	@USERNAME VARCHAR(50)
AS
BEGIN
	UPDATE SYS_T_CUSTOMER SET PASSWORD=@NEWPASSWORD WHERE CUSTOMER_ID=@USERNAME
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Prod_SubcriptedProduct]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Prod_SubcriptedProduct]
(
	@USERNAME VARCHAR(50),
	@MULTILINGUAL VARCHAR(2)
)
AS
BEGIN
	SELECT * FROM [dbo].[PAY_T_PRODUCTINFO] WHERE PRODUCT_ID=(SELECT TOP 1 PAYMENT_TYPE_ID FROM SUS_T_PAYMENT WHERE CUSTOMER_ID = @USERNAME AND STATUS_PAYMENT='0' ORDER BY CREATE_TIME DESC) AND MULTILINGUAL_ID=@MULTILINGUAL
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Prod_SubscriptionDetail]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chester>
-- Create date: <2018.08.20>
-- Description:	<Select The Subscription Detail>
-- =============================================
CREATE PROCEDURE  [dbo].[SP_Prod_SubscriptionDetail]
	@USERNAME VARCHAR(50),
	@ORDERREF VARCHAR(50),
	@MULTILINGUAL VARCHAR(2)
AS
BEGIN
	SELECT * FROM SUS_T_PAYMENT JOIN PAY_T_PRODUCTINFO ON
	(
		PAYMENT_TYPE_ID=PRODUCT_ID
		AND
		CUSTOMER_ID=@USERNAME
		AND
		ORDERREF=@ORDERREF
		AND
		PAY_T_PRODUCTINFO.MULTILINGUAL_ID=@MULTILINGUAL
	)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Prod_SubscriptionList]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chester>
-- Create date: <2018.08.20>
-- Description:	<Select Customer's Subscription List>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Prod_SubscriptionList]
	@USERNAME VARCHAR(50)
AS
BEGIN

  --   SELECT DISTINCT [dbo].[SUS_T_PAYMENT].[RECORD_ID] as PAYMENT_RECORD_ID,[PAYMENT_MASTER_ID],SUS_T_PAYMENT.ORDERREF,SUS_T_PAYMENT.DOMAIN_NAME,SUS_T_PAYMENT.CREATE_TIME,SUS_T_PAYMENT.STATUS_CODE,[VM_STATUS]
		--FROM SUS_T_PAYMENT  LEFT JOIN WFE_MASTER ON 
		--( SUS_T_PAYMENT.[RECORD_ID]=WFE_MASTER.[PAYMENT_MASTER_ID])
		--	WHERE SUS_T_PAYMENT.CUSTOMER_ID=@USERNAME AND SUS_T_PAYMENT.STATUS_PAYMENT='0'
		--Modify by bill 2018.8.30
		  SELECT DISTINCT 
	 [dbo].[SUS_T_PAYMENT].[RECORD_ID] as PAYMENT_RECORD_ID,
	 [PAYMENT_MASTER_ID],
	 PAYMENT_TYPE_ID, -- Add by bill 2018.9.3
	 SUS_T_PAYMENT.ORDERREF,
	 SUS_T_PAYMENT.DOMAIN_NAME,
	 SUS_T_PAYMENT.CREATE_TIME,
	 [PRODUCT_CR_TIME],
     [PRODUCT_AT_TIME],
	 SUS_T_PAYMENT.STATUS_CODE,
	 [VM_STATUS]
		FROM SUS_T_PAYMENT  LEFT JOIN WFE_MASTER ON 
		( SUS_T_PAYMENT.[RECORD_ID]=WFE_MASTER.[PAYMENT_MASTER_ID])
			WHERE SUS_T_PAYMENT.CUSTOMER_ID=@USERNAME AND SUS_T_PAYMENT.STATUS_PAYMENT='0'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Register_Account]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SP_Register_Account]
@CUSTOMER_ID varchar(50),
@PASSWORD varchar(100),
@CUSTOMER_NAME varchar(50),
@STATUS varchar(1),
@CNAME varchar(20) = NULL,
@COMPANY varchar(50),
@COMPANY_ADDRESS varchar(100) = NULL,
@PHONE varchar(20),
@FIXED_TELEPHONE varchar(15) = NULL,
@EMAIL varchar(50),
@ACTIVECODE varchar(50),
@ACTIVECODE_AT_DT datetime,
@CREATE_DATE datetime
AS
BEGIN

	INSERT INTO SYS_T_CUSTOMER(CUSTOMER_ID,PASSWORD,CUSTOMER_NAME,STATUS,COMPANY,COMPANY_ADDRESS,PHONE,FIXED_TELEPHONE,EMAIL,ACTIVECODE,ACTIVECODE_AT_DT,CNAME,CREATE_DATE) VALUES 
	(@CUSTOMER_ID,@PASSWORD,@CUSTOMER_NAME,@STATUS,@COMPANY,@COMPANY_ADDRESS,@PHONE,@FIXED_TELEPHONE,@EMAIL,@ACTIVECODE,@ACTIVECODE_AT_DT,@CNAME,@CREATE_DATE)

	SELECT * FROM SYS_T_CUSTOMER WHERE CUSTOMER_ID = @CUSTOMER_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ResetPassword]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_ResetPassword]
(
	@CUSTOMER_ID VARCHAR(50),
	@PASSWORD VARCHAR(200)
)
AS
BEGIN
	UPDATE [dbo].[SYS_T_CUSTOMER] SET PASSWORD =@PASSWORD WHERE CUSTOMER_ID = @CUSTOMER_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_PersonalInfo]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chester>
-- Create date: <2018.07.26>
-- Description:	<Update Personal Information>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Update_PersonalInfo] 
	-- Add the parameters for the stored procedure here
	@CUSTOMER_NAME varchar(50),
	@CNAME varchar(20),
	@EMAIL varchar(50),
	@PHONE varchar(20),
	@FIXED_TELEPHONE varchar(15),
	@COMPANY varchar(50),
	@COMPANY_ADDRESS varchar(100),
	@CUSTOMER_ID varchar(50)
AS
BEGIN
	UPDATE SYS_T_CUSTOMER SET CUSTOMER_NAME=@CUSTOMER_NAME,CNAME=@CNAME,EMAIL=@EMAIL,PHONE=@PHONE,FIXED_TELEPHONE=@FIXED_TELEPHONE,COMPANY=@COMPANY,COMPANY_ADDRESS=@COMPANY_ADDRESS WHERE CUSTOMER_ID=@CUSTOMER_ID

	SELECT * FROM SYS_T_CUSTOMER WHERE CUSTOMER_ID = @CUSTOMER_ID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUserToken]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UpdateUserToken]
(
	@TOKEN VARCHAR(500),
	@USERNAME VARCHAR(50)
)
AS
BEGIN 
	 UPDATE SYS_T_CUSTOMER SET TOKEN = @TOKEN, TOKEN_CR_DT = GETDATE(),TOKEN_AT_DT = DATEADD(MINUTE,30,GETDATE()) WHERE CUSTOMER_ID = @USERNAME
END
GO
/****** Object:  StoredProcedure [dbo].[SP_WriteLoginLog]    Script Date: 15/10/2018 9:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_WriteLoginLog]
(
	@USERNAME VARCHAR(50),
	@ACCESS_IP VARCHAR(50)
)
AS
BEGIN
	INSERT INTO SYS_T_LOGIN_LOG (USERNAME,LOGIN_TIME,ACCESS_IP) VALUES (@USERNAME,GETDATE(),@ACCESS_IP)
END
GO
