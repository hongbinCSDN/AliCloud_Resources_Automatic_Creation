USE [<<DBNAME>>]
GO
/****** Object:  StoredProcedure [dbo].[AddAMBASE]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddAMBASE]
	@AM_NO [nvarchar](20),
	@PROJECT_ID [nvarchar](6),
	@SALES_OFF_CODE [nvarchar](6),
	@WALK_IN_SELECTION_ORDER [nvarchar](30),
	@AM_INTENTION [nvarchar](1),
	@AM_DT [nvarchar](10),
	@AM_MASTER_NO [nvarchar](20),
	@AM_TYPE [nvarchar](1),
	@LF_CODE [nvarchar](6),
	@LFC_CODE [nvarchar](10),
	@AGENCY [nvarchar](6),
	@AGENT_NAME [nvarchar](50),
	@AGENT_AG_ID [nvarchar](20),
	@AGENT_ID_TYPE [nvarchar](1),
	@AGENT_TEL [nvarchar](20),
	@AM_REMARKS [nvarchar](500),
	@SNP_DAYS [nvarchar](10),
	@LIST_PRICE_BASE_CURR_ID [nvarchar](6),
	@LIST_PRICE_BASE_CURR_RATE [nvarchar](11),
	@LIST_PRICE_SEC_CURR_ID [nvarchar](6),
	@LIST_PRICE_SEC_CURR_RATE [nvarchar](11),
	@CR_UID [nvarchar](10),
	@UP_UID [nvarchar](10),
	@CR_FID [nvarchar](6),
	@UP_FID [nvarchar](6),
	@RMK_1 [nvarchar](200),
	@RMK_2 [nvarchar](200),
	@RMK_3 [nvarchar](200),
	@RMK_4 [nvarchar](200),
	@RMK_5 [nvarchar](200)
WITH  EXECUTE AS CALLER
AS
Declare @AM_Date DATETIME
	Declare @SNP_Date DateTime
	Declare @SNP_Days_From_Master int
	
	select @SNP_Days_From_Master = SNP_DAYS from project_master

	Exec CalculateSNPDate @Project_ID, @AM_DT, -9999, @SNP_Date Output

	If (Select Convert(NVarChar(10), GetDate(), 105)) = @AM_DT
	Begin
		Select @AM_Date = Convert(DateTime, (substring(@AM_DT,7,4) + '-' + substring(@AM_DT,4,2) + '-' + substring(@AM_DT,1,2) + N' ' + Convert(NVarChar(19), GetDate(), 108)), 120)
	End
	Else
	Begin
		Select @AM_Date = Convert(Datetime, @AM_DT, 105)
	End

	INSERT INTO AM_BASE 
	(
	 AM_NO, PROJECT_ID, SALES_OFF_CODE, SELECTION_ORDER, AM_INTENTION, AM_DT, AM_MASTER_NO, AM_TYPE, LF_CODE, LFC_CODE, AGENCY,
	 AGENT_NAME, AGENT_AG_ID, AGENT_ID_TYPE, AGENT_TEL, SNP_DAYS, SNP_DATE, LIST_PRICE_BASE_CURR_ID, 
	 LIST_PRICE_BASE_CURR_RATE, LIST_PRICE_SEC_CURR_ID, LIST_PRICE_SEC_CURR_RATE, CR_UID, UP_UID, CR_FID, UP_FID, CR_DT, UP_DT, 
	 RMK_1, RMK_2, RMK_3, RMK_4, RMK_5, AM_STATUS
	)
	VALUES
	(
	 @AM_NO, @PROJECT_ID, @SALES_OFF_CODE, @WALK_IN_SELECTION_ORDER, @AM_INTENTION, @AM_Date, @AM_MASTER_NO, @AM_TYPE,
	 @LF_CODE, @LFC_CODE, @AGENCY, @AGENT_NAME, @AGENT_AG_ID, @AGENT_ID_TYPE, @AGENT_TEL, @SNP_DAYS_FROM_MASTER,
	 @SNP_DATE, @LIST_PRICE_BASE_CURR_ID, @LIST_PRICE_BASE_CURR_RATE, @LIST_PRICE_SEC_CURR_ID, @LIST_PRICE_SEC_CURR_RATE, 
	 @CR_UID, @UP_UID, @CR_FID, @UP_FID, GETDATE(), GETDATE(), @RMK_1, @RMK_2, @RMK_3, @RMK_4, @RMK_5, N'O');

Return

GO
/****** Object:  StoredProcedure [dbo].[AddAMBUYER]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AddAMBUYER]
(
	@AM_NO NVarChar(20),
	@PROJECT_ID NVarChar(6),	
	@BUYER_SEQ INT,
	@BUYER_TYPE NVARCHAR(1),
	@CHI_NAME NVARCHAR(100),
	@ENG_NAME NVARCHAR(100),
	@BUYER_ID NVARCHAR(20),
	@BUYER_ID_TYPE NVARCHAR(10),
	@BUYER_ID_IS_IDEN NVARCHAR(1),
	@GENDER NVARCHAR(1),
	@DOB NVARCHAR(10),
	@BUYER_NAT NVARCHAR(10),
	@CONTACT_NO NVARCHAR(20),
	@MARITAL_STATUS NVARCHAR(1),
	@PROPERTY_SYSTEM NVARCHAR(1),
	@SPOUSE_NAME NVARCHAR(100),
	@SPOUSE_ID NVARCHAR(20),
	@IS_ADULT NVARCHAR(1),
	@BUYER_SHARE NVARCHAR(50),
	@CR_UID NVARCHAR(20),
	@UP_UID NVARCHAR(20),
	@CR_FID NVARCHAR(20),
	@UP_FID NVARCHAR(20),
	@IS_LOCAL_COMPANY NVARCHAR(1)
)
 
As
	INSERT INTO AM_BUYER
	(
	 AM_NO, PROJECT_ID, BUYER_SEQ, BUYER_TYPE, CHI_NAME, ENG_NAME, BUYER_ID, BUYER_ID_TYPE, BUYER_ID_IS_IDEN, GENDER, DOB,
	 BUYER_NAT, CONTACT_NO, MARITAL_STATUS, PROPERTY_SYSTEM, SPOUSE_NAME, SPOUSE_ID, IS_ADULT, BUYER_SHARE,
	 CR_UID, CR_DT, CR_FID, UP_UID, UP_DT, UP_FID, LOCAL_COMPANY
	)
    VALUES
    (
	 @AM_NO, @PROJECT_ID, @BUYER_SEQ, @BUYER_TYPE, @CHI_NAME, @ENG_NAME, @BUYER_ID, @BUYER_ID_TYPE, @BUYER_ID_IS_IDEN, @GENDER, 
	 CONVERT(DATETIME, @DOB, 105), @BUYER_NAT, @CONTACT_NO, @MARITAL_STATUS, @PROPERTY_SYSTEM, @SPOUSE_NAME, @SPOUSE_ID, @IS_ADULT, @BUYER_SHARE, 
     @CR_UID, GETDATE(), @CR_FID, @UP_UID, GETDATE(), @UP_FID, @IS_LOCAL_COMPANY
	)

Return
GO
/****** Object:  StoredProcedure [dbo].[AddAMCONTACT]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddAMCONTACT]
(
	@AM_NO NVarChar(20),
	@PROJECT_ID NVarChar(6),	
	@CONT_PERSON NVARCHAR(100),
	@ADDR_1 NVARCHAR(50),
	@ADDR_2 NVARCHAR(50),
	@ADDR_3 NVARCHAR(50),
	@ADDR_4 NVARCHAR(50),
	@TEL_NO NVARCHAR(20),
	@OFF_TEL NVARCHAR(20),
	@MOBILE NVARCHAR(20),
	@FAX NVARCHAR(20),
	@EMAIL NVARCHAR(50),
	@DIST_CODE NVARCHAR(10),
	@COUNTRY_CODE NVARCHAR(10),
	@AREA NVARCHAR(20),
	@REGION_CODE NVARCHAR(10),
	@CR_UID NVARCHAR(20),
	@CR_FID NVARCHAR(20),
	@UP_UID NVARCHAR(20),
	@UP_FID NVARCHAR(20)
)
 
As
	INSERT INTO AM_CONTACT
	(
	 AM_NO, PROJECT_ID, CONT_PERSON, ADDR_1, ADDR_2, ADDR_3, ADDR_4, TEL_NO, OFF_TEL, MOBILE, FAX, EMAIL, DIST_CODE, COUNTRY_CODE,
	 AREA, REGION_CODE, CR_UID, CR_DT, CR_FID, UP_UID, UP_DT, UP_FID
	)
    VALUES
    (
	 @AM_NO, @PROJECT_ID, @CONT_PERSON, @ADDR_1, @ADDR_2, @ADDR_3, @ADDR_4, @TEL_NO, @OFF_TEL, @MOBILE, @FAX, @EMAIL, @DIST_CODE, 
	 @COUNTRY_CODE, @AREA, @REGION_CODE, @CR_UID, GETDATE(), @CR_FID, @UP_UID, GETDATE(), @UP_FID
	)
GO
/****** Object:  StoredProcedure [dbo].[AddAMNo]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AddAMNo]
(
	@Project_ID NVarChar(6),
	@Range_ID NVarChar(2),
	@Start_No NVarChar(7),
	@End_No NVarChar(7)
)
 
As
	Declare @current Numeric(7)
	Declare @start Numeric(7)

	Select @current = Current_No, @start = Start_No
	From AM_NO_RANGE
	Where Project_ID = @Project_ID And Range_ID = Convert(Numeric(2), @Range_ID)

	If @current = @start Or @current Is Null
	Begin
		Delete From AM_NO_RANGE
		Where Project_ID = @Project_ID And Range_ID = Convert(Numeric(2), @Range_ID)

		Insert Into AM_NO_RANGE
		(
			Project_ID, Range_ID, Start_No, End_No, Current_No, Range_Type
		)
		Values
		(
			@Project_ID, Convert(Numeric(2), @Range_ID),
			Convert(Numeric(7), @Start_No), Convert(Numeric(7), @End_No),
			Convert(Numeric(7), @Start_No), N'S'
		)

	End
Return 

GO
/****** Object:  StoredProcedure [dbo].[AddBallotBuyer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[AddBallotBuyer]
(
	@TicketID int,
	@BuyerSeq int,
	@ChiName nvarchar(50),
	@EngName nvarchar(100),
	@BuyerID nvarchar(20),
	@IsIdentity nchar(1),
	@Nationality nvarchar(6),
	@CompanyName nvarchar(50),
	@CompanyBR nvarchar(30),
	@CreateUser nvarchar(10)

)
 
As

	Insert Into BALLOT_BUYER
	(
		TICKET_ID, BUYER_SEQ, 
		BUYER_CHI_NAME, BUYER_ENG_NAME,BUYER_ID, BUYER_ID_IS_IDEN, BUYER_NAT_CODE, 
		CO_NAME, CO_BRN, 
		CR_UID, CR_DT, UP_UID, UP_DT
	)
	Values
	(
		@TicketID, @BuyerSeq, 
		@ChiName, @EngName, @BuyerID, @IsIdentity, @Nationality,
		@CompanyName, @CompanyBR, 
		@CreateUser, GetDate(), @CreateUser, GetDate()
	)

Return
GO
/****** Object:  StoredProcedure [dbo].[AddBank]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddBank]
(
	@Bank_Name NVarChar(50),
	@Bank_Code NVarChar(6) Output
)
 
As
	Declare @New_Bank_Code NVarChar(6)

	Select Top 1 @New_Bank_Code = Bk_Code
	From Bank
	Where Bk_Name = @Bank_Name

	If @New_Bank_Code Is Not Null
	Begin
		Select @Bank_Code = @New_Bank_Code
	End
	Else
	Begin
		Insert Into Bank (BK_CODE, BK_NAME)
		Values (@Bank_Code, @Bank_Name)
		
		--Insert Into Bank
		--	(Bk_Code, Bk_Name)
		--Select N'SY' + Case When Max(Right(Bk_Code, 4)) Is Null Then N'0000' Else Right(Stuff(N'0000', 4, 1, Max(Right(Bk_Code, 4)) + 1), 4) End, @Bank_Name
		--From Bank
		--Where Bk_Code Like N'SY____' And IsNumeric(Right(Bk_Code, 4)) <> 0

		Select Top 1 @Bank_Code = Bk_Code
		From Bank
		Where Bk_Name = @Bank_Name
	End
Return
GO
/****** Object:  StoredProcedure [dbo].[AddBlacklist]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  Procedure [dbo].[AddBlacklist]
(
	@BL_ID nvarchar(20) = NULL,
	@BL_ID_TYPE nvarchar(10) = NULL,
	@BL_NAME nvarchar(100) = NULL,
	@BL_BR_NO nvarchar(20) = NULL
)
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
 
As begin
	
	-- exec master..xp_ASL '[weKDisnmvie)}6&'

	begin
	/* set nocount on */
		INSERT INTO BLACK_LIST (BL_ID, BL_ID_TYPE, BL_NAME, BL_BR_NO)
		values (@BL_ID, @BL_ID_TYPE, @BL_NAME, @BL_BR_NO)

	end
end
	


GO
/****** Object:  StoredProcedure [dbo].[AddCarPark]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AddCarPark] (
@car_park_id NVarChar(255), @project_id NVarChar(6), @str_code NVarChar(6), @fm_code NVarChar(80),
@car_park_no NVarChar(6), @house_no NVarChar(7), @street_no NVarChar(4), @park_level NVarChar(2), 
@dev_code NVarChar(6), @park_list_price NVarChar(13), @cr_uid NVarChar(10), @sales_type_code NVarChar(6),
@car_park_phase NVarChar(2), @dist_code NVarChar(6), @lf_code NVarChar(6), @Ana_code1 NVarChar(6),
@car_park_status NVarChar(1), @car_park_deleted NVarChar(1),@FuncID NVarchar(10), @IsUpload NVarchar(1) = N'Y', @lfc_code NVarChar(6), @Add_CarPark NVarChar(1),
@ana_code2 NVarChar(6), @region_code NVarChar(6))
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
 
As
	
	exec master..xp_ASL '[weKDisnmvie)}6&'
	

	/* set nocount on */
	begin
		if @IsUpload = 'Y'
		begin
			insert into car_park
			(car_park_id, project_id, moa_no, str_code, fm_code, car_park_no, house_no, street_no, 
			park_level,dev_code, park_list_price, status, cr_uid, cr_dt, up_uid, up_dt, upload_date,
			sales_type_code, car_park_phase, dist_code, car_park_deleted, lf_code, lfc_code, up_fid, add_car_park_price_before_adjust, region_code)
			values 
			(@car_park_id, @project_id, null, @str_code, @fm_code, @car_park_no, @house_no, @street_no,
			@park_level, @dev_code, convert(numeric(12,2),@park_list_price),@car_park_status, @cr_uid, getdate(), @cr_uid, getdate(),getdate(),
			@sales_type_code, @car_park_phase, @dist_code,@car_park_deleted, @lf_code, @lfc_code, @FuncID, @Add_CarPark, @region_code)
		
		end
		else
		begin
			insert into car_park
			(car_park_id, project_id, moa_no, str_code, fm_code, car_park_no, house_no, street_no, 
			park_level,dev_code, park_list_price, status, cr_uid, cr_dt, up_uid, up_dt, 
			sales_type_code, car_park_phase, dist_code, car_park_deleted, lf_code, lfc_code, up_fid, add_car_park_price_before_adjust, region_code)
			values 
			(@car_park_id, @project_id, null, @str_code, @fm_code, @car_park_no, @house_no, @street_no,
			@park_level, @dev_code, convert(numeric(12,2),@park_list_price),@car_park_status, @cr_uid, getdate(), @cr_uid, getdate(),
			@sales_type_code, @car_park_phase, @dist_code,@car_park_deleted, @lf_code, @lfc_code, @FuncID, @Add_CarPark, @region_code)
		end

		--BEGIN #20070301_2 
		if (isnull(@ana_code1,N'-') <> N'-' or len(@ana_code1) >0 ) Or (isnull(@ana_code2,N'-') <> N'-' or len(@ana_code2) >0 )
		--END #20070301_2 
			begin

				delete FM_CP_ANALYSIS_CODE 
				where FM_CP_CODE = @car_park_id and
					    PROJECT_ID = @project_id
			
				if upper(@car_park_deleted) <> 'Y' and (isnull(@ana_code1,N'-') <> N'-' or len(@ana_code1) >0 )
				begin 
					insert FM_CP_ANALYSIS_CODE
				 	(PROJECT_ID, FM_CP_CODE, ANA_ID, ANA_GROUP_ID, FLAT_CP, UP_DT, UP_UID, UP_FID)
					select @project_id, @car_park_id,@ana_code1, G.ANA_GROUP_ID,N'C', getdate(), @cr_uid, @FuncID 
					from ANALYSIS_CODE C
					inner join ANALYSIS_GROUP G on (C.ANA_GROUP_ID = G.ANA_GROUP_ID)
					inner join PROJECT_MASTER P on (G.ANA_GROUP_ID = P. CP_ANA_GROUP1_ID) 
					where P.Project_ID = @project_id and C.ANA_ID = @ana_code1
				end
			
				if upper(@car_park_deleted) <> 'Y' and (isnull(@ana_code2,N'-') <> N'-' or len(@ana_code2) >0 )
				begin 
					insert FM_CP_ANALYSIS_CODE
				 	(PROJECT_ID, FM_CP_CODE, ANA_ID, ANA_GROUP_ID, FLAT_CP, UP_DT, UP_UID, UP_FID)
					select @project_id, @car_park_id,@ana_code2, G.ANA_GROUP_ID,N'C', getdate(), @cr_uid, @FuncID 
					from ANALYSIS_CODE C
					inner join ANALYSIS_GROUP G on (C.ANA_GROUP_ID = G.ANA_GROUP_ID)
					inner join PROJECT_MASTER P on (G.ANA_GROUP_ID = P. CP_ANA_GROUP2_ID) 
					where P.Project_ID = @project_id and C.ANA_ID = @ana_code2
				end
		end

	end	

GO
/****** Object:  StoredProcedure [dbo].[AddFirstReceipt]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddFirstReceipt]
(	
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	--@Transact_Seq NVarChar(2000),
	@User_ID NVarChar(10),
	@Sales_Office_Code NVarChar(6),
	@UP_FID NVarChar(10)
)
 
As
	Declare @Paid_Seq numeric(18,0)
	Declare @Paid_Seq_All NVarChar(100)
	Declare @Receipt_No numeric(8,0)
	Declare @Tran_Num numeric(3,0)
	Declare @Buyer_Surname NVarChar(50)
	-- BEGIN #20110831
	Declare @Buyer_Given_Name NVarChar(100)
	-- END #2010831
	Declare @Moa_Co_Name NVarChar(50)
	Declare @Joint_Buyer NVarChar(400)
	Declare @Surname NVarChar(50)
	-- BEGIN #20110831
	Declare @Given_Name NVarChar(100)
	-- END #20110831
	Declare @TRANSACT_AMT Numeric(18,2)
	Declare @Transact_Date Datetime


	Declare PS_Cursor Cursor For

	Select Distinct Paid_Seq
	From AM_PAYMENT_FU_TRANS
	Where AM_NO = @MOA_NO And PROJECT_ID = @Project_ID 

	Select @TRANSACT_AMT = 0

	Select @TRANSACT_AMT = SUM(Paid_Amt)
	From AM_PAYMENT_FU_TRANS
	Where AM_NO = @MOA_NO And PROJECT_ID = @Project_ID


	Select @Tran_Num = 0
	Select @Paid_Seq_All = ''

	Open PS_Cursor 

	Fetch Next From PS_Cursor 
	Into @Paid_Seq

	While @@Fetch_Status = 0
	Begin

		If @Paid_Seq_All <> N''
		Begin
			Select @Paid_Seq_All = @Paid_Seq_All + N', '
		End

		Select @Paid_Seq_All = @Paid_Seq_All +  Convert (Nvarchar(100), @Paid_Seq)

		Fetch Next From PS_Cursor 
		Into @Paid_seq
		
		Select @Tran_Num = @Tran_Num + 1
	End

	Close PS_Cursor 
	Deallocate PS_Cursor 

	SELECT
		@Buyer_Surname = P1.CHI_NAME, @Buyer_Given_Name = P1.ENG_NAME, @Transact_Date = AM_DT,
		@Moa_Co_Name = ISNULL(C1.CHI_NAME, '') + ' ' + ISNULL(C1.ENG_NAME, '')
	FROM
		AM_BASE AB
		LEFT JOIN AM_BUYER P1 ON AB.PROJECT_ID = P1.PROJECT_ID AND AB.AM_NO = P1.AM_NO AND P1.BUYER_TYPE = 'P' 	AND P1.BUYER_SEQ = 1
		LEFT JOIN AM_BUYER C1 ON AB.PROJECT_ID = C1.PROJECT_ID AND AB.AM_NO = C1.AM_NO AND C1.BUYER_TYPE = 'C' AND C1.BUYER_SEQ = 1
	WHERE
		AB.AM_NO = @MOA_NO
		AND AB.PROJECT_ID = @PROJECT_ID
		--AND P1.BUYER_TYPE = 'P'
		--AND P1.BUYER_SEQ = 1
		--AND C1.BUYER_TYPE = 'C'
		--AND C1.BUYER_SEQ = 1

	Select @Joint_Buyer = N''
	
	--BEGIN #20100816
	Declare JB_Cursor Cursor For
	SELECT
		ISNULL(CHI_NAME, ''), ISNULL(ENG_NAME, '')
	FROM
		AM_BUYER
	WHERE
		PROJECT_ID = @Project_ID
		AND AM_NO = @MOA_No
		AND BUYER_TYPE = 'P'
		AND BUYER_SEQ > 1
	ORDER BY BUYER_SEQ
	--END #20100816

	Open JB_Cursor 

	Fetch Next From JB_Cursor 
	Into @Surname, @Given_name

	While @@Fetch_Status = 0
	Begin
		If @Joint_Buyer <> N''
		Begin
			Select @Joint_Buyer = @Joint_Buyer + N', '
		End

		Select @Joint_Buyer = @Joint_Buyer +  @Surname + ' ' + @Given_name

		Fetch Next From JB_Cursor 
		Into @Surname, @Given_name
	End

	Close JB_Cursor 
	Deallocate JB_Cursor 


	If @Tran_Num>0
	BEGIN

		Select @Receipt_No = IsNull(Max(Receipt_NO), 0) + 1
		From Receipt
		Where Project_ID = @Project_ID
	
		--BEGIN #20070208_2
		Update Receipt
			Set Status = 'V', UP_UID = @User_ID, UP_FID = @UP_FID, Up_dt = getdate()
			Where Project_Id = @Project_ID and Moa_No = @MOA_No

		Insert Into Receipt
			(Project_ID, MOA_No, Receipt_NO, Receipt_Type, Receipt_Data, Sales_Office_Code, UID, 
			Cr_Dt, Buyer_Surname, Buyer_Given_Name, Moa_Co_Name, 
			Joint_Buyer, Status, Up_UID, UP_Fid, UP_dt, TRANSACT_AMT, Cr_FID, TRANSACT_DATE)
		Values
			(@Project_ID, @MOA_No, @Receipt_No, N'P', @Paid_Seq_All, @Sales_Office_Code, @User_ID, 
			Convert(DateTime, GetDate(), 103), @Buyer_Surname, @Buyer_Given_Name, @Moa_Co_Name, 
			@Joint_Buyer, 'I', @User_ID, @UP_FID, getDate(), @TRANSACT_AMT, @UP_FID, @Transact_Date)
		--END #20070208_2
	END


Return
GO
/****** Object:  StoredProcedure [dbo].[AddFlat]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddFlat]
	@fm_code [nvarchar](500),
	@project_id [nvarchar](6),
	@ft_id [nvarchar](6),
	@str_code [nvarchar](6),
	@fm_blk [nvarchar](6),
	@fm_floor [nvarchar](50),
	@fm_floor_seq [int],
	@fm_flat [nvarchar](50),
	@fm_str_no [nvarchar](4),
	@fm_hse_no [nvarchar](7),
	@dev_code [nvarchar](6),
	@fm_phase [nvarchar](2),
	@fm_gr_area_sm [nvarchar](13),
	@fm_saleable [nvarchar](13),
	@fm_usable_sm [nvarchar](13),
	@fm_gr_area_sf [nvarchar](13),
	@fm_usable_sf [nvarchar](13),
	@fm_baywindow_sm [nvarchar](13),
	@fm_balcony_sm [nvarchar](13),
	@fm_verandah_sm [nvarchar](13),
	@fm_terrace_sm [nvarchar](13),
	@fm_platform_sm [nvarchar](13),
	@fm_workplatform_sm [nvarchar](13),
	@fm_cockloft_sm [nvarchar](13),
	@fm_roof_sm [nvarchar](13),
	@fm_stairhood_sm [nvarchar](13),
	@fm_acroom_sm [nvarchar](13),
	@fm_garden_sm [nvarchar](13),
	@fm_yard_sm [nvarchar](13),
	@fm_parking_sm [nvarchar](13),
	@fm_baywindow_sf [nvarchar](13),
	@fm_balcony_sf [nvarchar](13),
	@fm_verandah_sf [nvarchar](13),
	@fm_terrace_sf [nvarchar](13),
	@fm_platform_sf [nvarchar](13),
	@fm_workplatform_sf [nvarchar](13),
	@fm_cockloft_sf [nvarchar](13),
	@fm_roof_sf [nvarchar](13),
	@fm_stairhood_sf [nvarchar](13),
	@fm_acroom_sf [nvarchar](13),
	@fm_garden_sf [nvarchar](13),
	@fm_yard_sf [nvarchar](13),
	@fm_parking_sf [nvarchar](13),
	@fm_other1 [nvarchar](13),
	@fm_other2 [nvarchar](20),
	@fm_list_price [nvarchar](15),
	@fm_smp [nvarchar](15),
	@fm_rmk [nvarchar](100),
	@cr_uid [nvarchar](10),
	@lf_code [nvarchar](6),
	@sales_type_code [nvarchar](6),
	@dist_code [nvarchar](6),
	@region_code [nvarchar](6),
	@fm_deleted [nvarchar](1),
	@fm_status [nvarchar](1),
	@FuncID [nvarchar](10),
	@IsUpload [nvarchar](1) = N'Y',
	@lfc_code [nvarchar](6),
	@adj [varchar](15),
	@adj_Type [char](1),
	@adj_Unit [char](1),
	@BATCH_NO [int],
	@SALES_BATCH [nvarchar](10),
	@DUPLEX [char](1)
WITH  EXECUTE AS CALLER
AS
begin


	IF NOT EXISTS(select *
    from GetLimit(@project_id
	) WHERE  CURRENT_COUNT<LIMIT AND HASHKEY = HASHBYTES('SHA2_256', CONCAT(CURRENT_COUNT, ',',LIMIT,',', @project_id) ))
	BEGIN
		RAISERROR (N'Unit is reach system limits, please contact administrator or upgrade your plan.',16,1);
		return
	END

    if @IsUpload = 'Y'
	begin
	/* set nocount on */
		insert into flat_master 
		(
			fm_code, project_id, ft_id, str_code,
			fm_blk, fm_floor, fm_floor_seq, fm_flat, fm_str_no,
			fm_hse_no, dev_code, fm_phase, fm_gr_area_sm,
			fm_saleable, fm_usable_sm, fm_gr_area_sf, fm_usable_sf, 
			FM_BAY_WIN_SM, FM_BALCONY_SM, FM_VERANDAH_SM, FM_TERRACE_SM, FM_PLATFORM_SM, FM_WORK_PF_SM, FM_COCKLOFT_SM,
			FM_ROOF_SM, FM_STAIRHOOD_SM, FM_AC_ROOM_SM, FM_GARDEN_SM, FM_YARD_SM, FM_PARKING_SM,
			FM_BAY_WIN_SF, FM_BALCONY_SF, FM_VERANDAH_SF, FM_TERRACE_SF, FM_PLATFORM_SF, FM_WORK_PF_SF, FM_COCKLOFT_SF,
			FM_ROOF_SF, FM_STAIRHOOD_SF, FM_AC_ROOM_SF, FM_GARDEN_SF, FM_YARD_SF, FM_PARKING_SF,
			fm_other1, fm_other2, fm_list_price, adj, adj_type, adj_unit,
			fm_smp, fm_status, fm_rmk, fm_reg_no, cr_uid, cr_dt, up_uid, up_dt,
			lf_code, lfc_code, fm_deleted, sales_type_code, dist_code, moa_no, upload_date,up_fid, region_code,
			BATCH_NO , SALES_BATCH_CODE, DUPLEX_DIRECTION
		)
		values 
		(
			@fm_code, @project_id , @ft_id, @str_code,
			@fm_blk, @fm_floor, @fm_floor_seq, @fm_flat, @fm_str_no,
			@fm_hse_no, @dev_code, @fm_phase, 
			convert(numeric(9,3),@fm_gr_area_sm), convert(numeric(9,3),@fm_saleable), convert(numeric(9,3),@fm_usable_sm), 
			convert(numeric(9,3),@fm_gr_area_sf), convert(numeric(9,3),@fm_usable_sf), 
			convert(numeric(9,3),@fm_baywindow_sm), convert(numeric(9,3),@fm_balcony_sm), convert(numeric(9,3),@fm_verandah_sm), 
			convert(numeric(9,3),@fm_terrace_sm), convert(numeric(9,3),@fm_platform_sm), convert(numeric(9,3),@fm_workplatform_sm), 
			convert(numeric(9,3),@fm_cockloft_sm), convert(numeric(9,3),@fm_roof_sm), convert(numeric(9,3),@fm_stairhood_sm), 
			convert(numeric(9,3),@fm_acroom_sm), convert(numeric(9,3),@fm_garden_sm), convert(numeric(9,3),@fm_yard_sm), 
			convert(numeric(9,3),@fm_parking_sm), 
			convert(numeric(9,3),@fm_baywindow_sf), convert(numeric(9,3),@fm_balcony_sf), convert(numeric(9,3),@fm_verandah_sf), 
			convert(numeric(9,3),@fm_terrace_sf), convert(numeric(9,3),@fm_platform_sf), convert(numeric(9,3),@fm_workplatform_sf), 
			convert(numeric(9,3),@fm_cockloft_sf), convert(numeric(9,3),@fm_roof_sf), convert(numeric(9,3),@fm_stairhood_sf), 
			convert(numeric(9,3),@fm_acroom_sf), convert(numeric(9,3),@fm_garden_sf), convert(numeric(9,3),@fm_yard_sf), 
			convert(numeric(9,3),@fm_parking_sf), 
			convert(numeric(9,3),@fm_other1), @fm_other2, convert(numeric(12,2),@fm_list_price),
			convert(numeric(12,2),@adj), @adj_type, @adj_unit,
			convert(numeric(12,2),@fm_smp), @fm_status, @fm_rmk, Null, @cr_uid, getdate(), @cr_uid, getdate(),
			@lf_code, @lfc_code, @fm_deleted, @sales_type_code, @dist_code, null,getdate(),@FuncID, @region_code,
			@BATCH_NO,  @SALES_BATCH, @DUPLEX
		)

	--BEGIN #20080222
	--BEGIN #20070312
	
		insert into flat_price_audit
		(
			project_id, fm_code, adj_no, org_price, new_price, 
			adj_type, adj_unit, adj,
			up_fid, up_uid, up_dt
		)
		values
		(
			@project_id, @fm_code, 1, isnull(convert(numeric(12,2),@fm_list_price),0),isnull(convert(numeric(12,2),@fm_list_price),0), 
			@adj_type,  @adj_unit, convert(numeric(12,2),@adj), 
			@FuncID, @cr_uid, getdate() 
		)
	
	--END #20070312
	--END #20080222

	end else begin
	
		insert into flat_master 
		(
			fm_code, project_id, ft_id, str_code,
			fm_blk, fm_floor, fm_floor_seq, fm_flat, fm_str_no,
			fm_hse_no, dev_code, fm_phase, fm_gr_area_sm,
			fm_saleable, fm_usable_sm, fm_gr_area_sf, fm_usable_sf, 
			FM_BAY_WIN_SM, FM_BALCONY_SM, FM_VERANDAH_SM, FM_TERRACE_SM, FM_PLATFORM_SM, FM_WORK_PF_SM, FM_COCKLOFT_SM,
			FM_ROOF_SM, FM_STAIRHOOD_SM, FM_AC_ROOM_SM, FM_GARDEN_SM, FM_YARD_SM, FM_PARKING_SM,
			FM_BAY_WIN_SF, FM_BALCONY_SF, FM_VERANDAH_SF, FM_TERRACE_SF, FM_PLATFORM_SF, FM_WORK_PF_SF, FM_COCKLOFT_SF,
			FM_ROOF_SF, FM_STAIRHOOD_SF, FM_AC_ROOM_SF, FM_GARDEN_SF, FM_YARD_SF, FM_PARKING_SF,
			fm_other1, fm_other2, fm_list_price,
			adj, adj_type, adj_unit,
			fm_smp, fm_status, fm_rmk, fm_reg_no, cr_uid, cr_dt, up_uid, up_dt,
			lf_code, lfc_code, fm_deleted, sales_type_code, dist_code, moa_no, up_fid, region_code,
			BATCH_NO , SALES_BATCH_CODE, DUPLEX_DIRECTION
		)
		values 
		(
			@fm_code, @project_id , @ft_id, @str_code,
			@fm_blk, @fm_floor, @fm_floor_seq, @fm_flat, @fm_str_no,
			@fm_hse_no, @dev_code, @fm_phase,
					convert(numeric(9,3),@fm_gr_area_sm), convert(numeric(9,3),@fm_saleable), convert(numeric(9,3),@fm_usable_sm), 
			convert(numeric(9,3),@fm_gr_area_sf), convert(numeric(9,3),@fm_usable_sf), 
			convert(numeric(9,3),@fm_baywindow_sm), convert(numeric(9,3),@fm_balcony_sm), convert(numeric(9,3),@fm_verandah_sm), 
			convert(numeric(9,3),@fm_terrace_sm), convert(numeric(9,3),@fm_platform_sm), convert(numeric(9,3),@fm_workplatform_sm), 
			convert(numeric(9,3),@fm_cockloft_sm), convert(numeric(9,3),@fm_roof_sm), convert(numeric(9,3),@fm_stairhood_sm), 
			convert(numeric(9,3),@fm_acroom_sm), convert(numeric(9,3),@fm_garden_sm), convert(numeric(9,3),@fm_yard_sm), 
			convert(numeric(9,3),@fm_parking_sm), 
			convert(numeric(9,3),@fm_baywindow_sf), convert(numeric(9,3),@fm_balcony_sf), convert(numeric(9,3),@fm_verandah_sf), 
			convert(numeric(9,3),@fm_terrace_sf), convert(numeric(9,3),@fm_platform_sf), convert(numeric(9,3),@fm_workplatform_sf), 
			convert(numeric(9,3),@fm_cockloft_sf), convert(numeric(9,3),@fm_roof_sf), convert(numeric(9,3),@fm_stairhood_sf), 
			convert(numeric(9,3),@fm_acroom_sf), convert(numeric(9,3),@fm_garden_sf), convert(numeric(9,3),@fm_yard_sf), 
			convert(numeric(9,3),@fm_parking_sf), 
			convert(numeric(9,3),@fm_other1), @fm_other2, convert(numeric(12,2),@fm_list_price),
			convert(numeric(12,2),@adj), @adj_type, @adj_unit,
			convert(numeric(12,2),@fm_smp), @fm_status, @fm_rmk, Null, @cr_uid, getdate(), @cr_uid, getdate(),
			@lf_code, @lfc_code, @fm_deleted, @sales_type_code, @dist_code, null,@FuncID, @region_code,
			@BATCH_NO,  @SALES_BATCH,@DUPLEX
		)

		--BEGIN #20080222
		--BEGIN #20070306
		insert into flat_price_audit
		(
			project_id, fm_code, adj_no, org_price, new_price, 
			adj_type, adj_unit, 
			adj, up_fid, up_uid, up_dt
		)
		values
		(
			@project_id, @fm_code, 1, isnull(convert(numeric(12,2),@fm_list_price),0), isnull(convert(numeric(12,2),@fm_list_price),0), 
			@adj_type, @adj_unit, isnull(convert(numeric(12,2),@adj),0), 
			@FuncID, @cr_uid, getdate() 
		)
		--END #20070306 
		--END #20080222

	end
end
	


GO
/****** Object:  StoredProcedure [dbo].[AddFormal]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[AddFormal]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Intention NVarChar(1),
	@Type NVarChar(1),
	@F_Agreement_Dt NVarchar(10),
	@Cont_Person NVarChar(616),
	@Country_Code NVarChar(6),
	@Buyer_ID NVarChar(20),
	@Surname NVarchar(50),
	-- BEGIN #20110829
	@Given_name NVarchar(100),
	-- END #20110829
	@ID_Type NVarChar(1),
	@ID_Is_Iden NVarchar(1),	
	@Gender NVarchar(1),
	@Nat_Code NVarChar(6),
	@Co_Name NVarchar(50),
	@BRN NVarChar(30),
	@Director_Surname1 NVarChar(50),
	-- BEGIN #20110829
	@Director_Given_Name1 NVarChar(100),
	-- END #20110829
	@Director_ID1 NVarChar(20),
	@Director_ID_Type1 NVarChar(1),
	@Director_Gender1 NVarChar(1),
	@Director_ID_Is_Iden1 NVarchar(1),
	@Director_Nat_Code1 NVarChar(6),
	@Director_Surname2  NVarChar(50),
	-- BEGIN #20110829
	@Director_Given_Name2 NVarChar(100),
	-- END #20110829
	@Director_ID2 NVarChar(20),
	@Director_ID_Type2 NChar(1),	
	@Director_Gender2 NVarChar(1),
	@Director_ID_Is_Iden2 NVarchar(1),
	@Director_Nat_Code2 NVarChar(6),
	@Add1 NVarChar(50),
	@Add2 NVarChar(50),
	@Add3 NVarChar(50),
	@Add4 NVarChar(50),
	@Dist_Code NVarChar(6),
	@Tel_No NVarChar(20),
	@Off_Tel NVarChar(20),
	@Mobile NVarChar(20),
	@Fax NVarChar(20),
	@Email NVarChar(50),	
	@Region_Code NVarchar(6),
	@Remarks NVarChar(500),
	@UserID NVarchar(10),
	@Formal_Seq NVarchar(3) Output,
	@MaritalStatus NVarchar(1),
	@D1MaritalStatus NVarchar(1),
	@D2MaritalStatus NVarchar(1),
	@PropertySystem NVarChar(1),
	@D1PropertySystem NVarchar(1),
	@D2PropertySystem NVarchar(1),
	@isAdult NVARCHAR(1),
	@Spouse NVARCHAR(50),
	@Director_isAdult1 NVARCHAR(1),
	@Director_isAdult2 NVARCHAR(1),
	@Director_Spouse1 NVARCHAR(50),
	@Director_Spouse2 NVARCHAR(50)
)
 
As
	exec master..xp_ASL '[weKDisnmvie)}6&'


	Declare @F_Agreement_Date DateTime
	Declare @Area NVarchar(6)
	
	Select @Area = Area From MOA Where Upper(MOA_NO) = @MOA_No and Upper(Project_ID) = @Project_ID
		
	Select @Formal_Seq = Convert(Numeric(3,0), (Select IsNull(Max(Formal_Seq),0) from MOA_FORMAL Where Upper(MOA_NO) = @MOA_No and Upper(Project_ID) = @Project_ID) +1)
	If @Formal_Seq <=0 
		BEGIN
			Select @Formal_Seq = 1
		END
	
	If @F_Agreement_Dt is not null
	Begin
		Select @F_Agreement_Date = Convert(datetime, @F_Agreement_Dt, 105)
	End
	Else
	Begin
		Select @F_Agreement_Date = Convert(datetime, GETDATE(), 105)
	End

	Insert Into MOA_FORMAL
	(MOA_NO, FORMAL_SEQ, PROJECT_ID, FORMAL_DATE, FORMAL_STATUS, TYPE, BUYER_ID, SURNAME, GIVEN_NAME, ID_TYPE,
	 BUYER_ID_IS_IDEN, GENDER, NAT_CODE, CONT_PERSON, DIRECTOR_SURNAME1, DIRECTOR_GIVEN_NAME1, DIRECTOR_ID1,
	 DIRECTOR_ID_TYPE1, DIRECTOR_ID_IS_IDEN1, DIRECTOR_GENDER1, DIRECTOR_NAT_CODE1, DIRECTOR_SURNAME2, DIRECTOR_GIVEN_NAME2,
	 DIRECTOR_ID2, DIRECTOR_ID_TYPE2, DIRECTOR_ID_IS_IDEN2, DIRECTOR_GENDER2, DIRECTOR_NAT_CODE2, CO_NAME, BRN,
	 ADD1, ADD2, ADD3, ADD4, AREA, REGION_CODE, DIST_CODE, COUNTRY_CODE, TEL_NO, OFF_TEL, MOBILE, FAX, EMAIL,
	 INTENTION, REMARKS, CR_UID, CR_FID, CR_DT, UP_UID, UP_FID, UP_DT, MARITAL_STATUS, DIRECTOR_MARITAL_STATUS1,
	 DIRECTOR_MARITAL_STATUS2, PROPERTY_SYSTEM, DIRECTOR_PROPERTY_SYSTEM1, DIRECTOR_PROPERTY_SYSTEM2, ISADULT, SPOUSE,
	 DIRECTOR_ISADULT1, DIRECTOR_ISADULT2, DIRECTOR_SPOUSE1, DIRECTOR_SPOUSE2)
	Values
	(@MOA_No, @Formal_Seq, @Project_ID, @F_Agreement_Date, 'O', @Type, @Buyer_ID, @Surname, @Given_name, @ID_Type,
	@ID_Is_Iden, @Gender, @Nat_Code, @Cont_Person, @Director_Surname1, @Director_Given_Name1, @Director_ID1,
	@Director_ID_Type1, @Director_ID_Is_Iden1, @Director_Gender1, @Director_Nat_Code1, @Director_Surname2, @Director_Given_Name2,
	@Director_ID2, @Director_ID_Type2, @Director_ID_Is_Iden2, @Director_Gender2, @Director_Nat_Code2, @Co_Name, @BRN,
	@Add1, @Add2, @Add3, @Add4, @Area, @Region_Code, @Dist_Code, @Country_Code, @Tel_No, @Off_Tel, @Mobile, @Fax, @Email,
	@Intention, @Remarks, @UserID, 'FM0103', GETDATE(), @UserID, 'FM0103', GETDATE(), @MaritalStatus, @D1MaritalStatus, 
	@D2MaritalStatus, @PropertySystem, @D1PropertySystem, @D2PropertySystem, @isAdult, @Spouse,
	@Director_isAdult1, @Director_isAdult2, @Director_Spouse1, @Director_Spouse2)
		
Return
GO
/****** Object:  StoredProcedure [dbo].[AddFormalJointBuyer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AddFormalJointBuyer]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Joint_Buyer_Surname NVarChar(50),
	-- BEGIN #20110829
	@Joint_Buyer_Given_Name NVarChar(100),
	-- END #20110829
	@Joint_Buyer_Gender NVarChar(1),
	@Joint_Buyer_ID NVarChar(20),
	@Joint_Buyer_ID_Type NVarChar(1),
	@Joint_Buyer_Date_Of_Birth NVarChar(10),
	@Joint_Buyer_Nationality NVarChar(6),
	@Formal_Seq NVarChar(3),
	@ID_IS_IDEN NVarChar(1),
	@MaritalStatus NVarchar(1),
	@UserID NVarChar(10),
	@PropertySystem NVarChar(1),
	@isAdult NVARCHAR(1),
	@Spouse NVARCHAR(50)
)
 
As
	Delete From MOA_FORMAL_JOINT_BUYER
	Where MOA_No = @MOA_No And Project_ID = @Project_ID And J_Buyer_ID = @Joint_Buyer_ID And Formal_Seq=@Formal_Seq

	Insert Into MOA_FORMAL_JOINT_BUYER
		(MOA_No, Project_ID, Formal_Seq, J_Buyer_ID, Surname, Given_Name, ID_Type, Buyer_DOB, Gender, Nat_Code, ID_IS_IDEN,
		MARITAL_STATUS, PROPERTY_SYSTEM, UP_DT, UP_UID, UP_FID, ISADULT, SPOUSE)
	Values
		(@MOA_No, @Project_ID, Convert(Numeric(3,0), @Formal_Seq), @Joint_Buyer_ID, @Joint_Buyer_Surname, @Joint_Buyer_Given_Name,
		Convert(NChar(1), @Joint_Buyer_ID_Type), Convert(DateTime, @Joint_Buyer_Date_Of_Birth, 103),
		Convert(NChar(1), @Joint_Buyer_Gender), @Joint_Buyer_Nationality, @ID_IS_IDEN, @MaritalStatus, @PropertySystem,
		GETDATE(), @UserID, 'FM0103', @isAdult, @Spouse)
Return
GO
/****** Object:  StoredProcedure [dbo].[AddLawFirm]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLawFirm]
	@LF_CODE [nvarchar](10),
	@LF_NAME_CHI [nvarchar](100),
	@LF_NAME_ENG [nvarchar](100),
	@LF_ADD_CHI_1 [nvarchar](50),
	@LF_ADD_CHI_2 [nvarchar](50),
	@LF_ADD_CHI_3 [nvarchar](50),
	@LF_ADD_ENG_1 [nvarchar](50),
	@LF_ADD_ENG_2 [nvarchar](50),
	@LF_ADD_ENG_3 [nvarchar](50),
	@CreateUser [nvarchar](20),
	@CreateFunction [nvarchar](20)
WITH  EXECUTE AS CALLER
AS
INSERT INTO [dbo].[LAW_FIRMS]
	(
		[LF_CODE],[LF_NAME_CHI],[LF_NAME_ENG],
		[LF_ADD_CHI_1],[LF_ADD_CHI_2],[LF_ADD_CHI_3],
		[LF_ADD_ENG_1],[LF_ADD_ENG_2],[LF_ADD_ENG_3],
		[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	)
	VALUES
	(
		RTRIM(LTRIM(UPPER(@LF_CODE))),@LF_NAME_CHI,@LF_NAME_ENG,
		@LF_ADD_CHI_1,@LF_ADD_CHI_2,@LF_ADD_CHI_3,
		@LF_ADD_ENG_1,@LF_ADD_ENG_2,@LF_ADD_ENG_3,
		@CreateUser,@CreateFunction,GETDATE(),@CreateUser,@CreateFunction,GETDATE()
	);

Return



GO
/****** Object:  StoredProcedure [dbo].[AddLawFirmContact]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLawFirmContact]
	@LF_CODE [nvarchar](10),
	@LFC_CODE [nvarchar](10),
	@LFC_NAME_CHI [nvarchar](100),
	@LFC_NAME_ENG [nvarchar](100),
	@LFC_TEL [nvarchar](20),
	@CreateUser [nvarchar](20),
	@CreateFunction [nvarchar](20)
WITH  EXECUTE AS CALLER
AS
INSERT INTO [dbo].[LAW_FIRMS_CONTACT]
	(
		[LF_CODE],[LFC_CODE],
		[LFC_NAME_CHI],[LFC_NAME_ENG],[LFC_TEL],
		[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT])
     VALUES
     (
		@LF_CODE,RTRIM(LTRIM(UPPER(@LFC_CODE))),
		@LFC_NAME_CHI,@LFC_NAME_ENG,@LFC_TEL,
		@CreateUser,@CreateFunction,GETDATE(),@CreateUser,@CreateFunction,GETDATE()
	 )
	

Return




GO
/****** Object:  StoredProcedure [dbo].[AddLawFirmScheduleDetail]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddLawFirmScheduleDetail]
(
	@Project_ID NVarChar(6),
	@LF_Code NVarChar(6),
	@Slot_No NVarChar(2),
	@Slot_Desc NVarChar(30),
	@No_Appointment NVarChar(3)
)
 
As
	Insert Into SNP_Slots
		(LF_Code, Project_ID, SNP_Slot_No, SNP_Slot_Desc, No_App)
	Values
		(@LF_Code, @Project_ID, Convert(Numeric(2), @Slot_No), @Slot_Desc, Convert(Numeric(3), @No_Appointment))
Return 
GO
/****** Object:  StoredProcedure [dbo].[AddLawFirmScheduleHeader]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddLawFirmScheduleHeader]
(
	@Project_ID NVarChar(6),
	@LF_Code NVarChar(6),
	@Max_Appointment NVarChar(3)
)
 
As
	Insert Into SNP_Schedule
		(LF_Code, Project_ID, Max_Apt)
	Values
		(@LF_Code, @Project_ID, Convert(Numeric(3), @Max_Appointment))
Return 
GO
/****** Object:  StoredProcedure [dbo].[AddMOACarPark]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddMOACarPark]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Selection_Order NVarChar(30),
	@Car_Park_ID NVarChar(80),
	@Car_Park_Last_Update_UID NVarChar(10),
	@Car_Park_Last_Update_Date NVarChar(30),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Declare @Last_Update_UID NVarChar(10)
	Declare @Last_Update_Date NVarChar(30)
	Declare @Status NChar(1)
	Declare @List_Price Numeric(12,2)
	
	Select @Status = Status, @Last_Update_UID = Up_UID, @Last_Update_Date = Convert(NVarChar, Up_Dt, 121), @List_Price = PARK_LIST_PRICE
	From Car_Park
	Where Project_ID = @Project_ID And Car_Park_ID = @Car_Park_ID

	If @Status <> N'P'
	Begin
		RaisError(N'Car Park Updated', 16, 1)
		Return (0)
	End
	
	If @Last_Update_UID <> @Car_Park_Last_Update_UID Or @Last_Update_Date <> @Car_Park_Last_Update_Date
	Begin
		RaisError(N'Car Park Updated', 16, 1)
		Return (0)
	End

	Insert Into Car_Park_Selection
		(Project_ID, Car_Park_ID, Ballot_Seq, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
	Values
		(@Project_ID, @Car_Park_ID, Null, @Selection_Order, N'B', GetDate(), @Update_UID, @Update_UID, @Update_FID)

	Update Car_Park
	Set MOA_No = @MOA_No, Status = N'S', Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
	Where Project_ID = @Project_ID And Car_Park_ID = @Car_Park_ID

	-- 20100728
	Insert Into AM_Item (AM_NO, PROJECT_ID, FM_CP_CODE, FM_CP, CR_UID, CR_DT, FM_CP_LIST_PRICE)
	Values (@MOA_No, @Project_ID, @Car_Park_ID, 'C', @Update_UID, GETDATE(), @List_Price)

Return 
GO
/****** Object:  StoredProcedure [dbo].[AddMOACreditCardPayment]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddMOACreditCardPayment]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Payment_Type NVarChar(1),
	@Cheque_No NVarChar(10),
	@Bank_Code NVarChar(6),
	@Currency NVarChar(6),
	@Amount NVarChar(10),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Credit_Card_No NVarChar(16),
	@Credit_Card_Type Char(1),
	@Credit_Card_Holder_Name NVarChar(50),
	@Credit_Card_Approval_Code NVarChar(10),
	@Credit_Card_Expiry_Month VarChar(2),
	@Credit_Card_Expiry_Year VarChar(4)
)
 
As
	Declare @Curr_Rate Numeric(10, 4)
	Declare @FirstPayDate Datetime
	
	Select @FirstPayDate = AM_DT from AM_BASE
	Where PROJECT_ID = @Project_ID And AM_NO = @MOA_No
	
	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Currency

	Insert Into AM_Payment
		(AM_No, Project_ID, Payment_Type, Cheque_No, Bank_Code, Curr_ID, Curr_Rate, Amount, Dt, Up_Dt, Up_UID, Up_FID, Credit_Card_No, Credit_Card_Type, Credit_Card_Holder, Credit_Card_Approval_Code, Credit_Card_Expiry_Date, Cr_UID, Cr_FID)
	Values
		(@MOA_No, @Project_ID, @Payment_Type, @Cheque_No, @Bank_Code, @Currency, @Curr_Rate, Convert(Numeric(18, 2), @Amount), @FirstPayDate, GetDate(), @Update_UID, @Update_FID, @Credit_Card_No, @Credit_Card_Type, @Credit_Card_Holder_Name, @Credit_Card_Approval_Code, Convert(DateTime, @Credit_Card_Expiry_Month + '/01/' + @Credit_Card_Expiry_Year), @Update_UID, @Update_FID)
Return
GO
/****** Object:  StoredProcedure [dbo].[AddMOAFlat]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddMOAFlat]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Selection_Order NVarChar(30),
	@FM_Code NVarChar(500),
	@Flat_Last_Update_UID NVarChar(10),
	@Flat_Last_Update_Date NVarChar(30),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Declare @Last_Update_UID NVarChar(10)
	Declare @Last_Update_Date NVarChar(30)
	Declare @Status NChar(1)
	Declare @List_Price Numeric(12,2)
	Declare @Cnt Int
	Declare @Ballot_Reg_ID Int
	
	Select @Status = FM_Status, @Last_Update_UID = Up_UID, @Last_Update_Date = Convert(NVarChar, Up_Dt, 121), @List_Price = FM_LIST_PRICE
	From Flat_Master
	Where Project_ID = @Project_ID And FM_Code = @FM_Code

	If @Status <> N'P'
	Begin
		RaisError(N'Flat Updated', 16, 1)
		Return (0)
	End
	
	If @Last_Update_UID <> @Flat_Last_Update_UID Or @Last_Update_Date <> @Flat_Last_Update_Date
	Begin
		RaisError(N'Flat Updated', 16, 1)
		Return (0)
	End
	
	Insert Into	Flat_Selection
		(Project_ID, FM_Code, Ballot_Seq, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
	Values
		(@Project_ID, @FM_Code, Null, @Selection_Order, N'B', GetDate(), @Update_UID, @Update_UID, @Update_FID)

	Update Flat_Master
	Set MOA_No = @MOA_No, FM_Status = N'S', Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
	Where Project_ID = @Project_ID And FM_Code = @FM_Code
	
	--20100728
	Insert Into AM_Item (AM_NO, PROJECT_ID, FM_CP_CODE, FM_CP, CR_UID, CR_DT, FM_CP_LIST_PRICE)
	Values (@MOA_No, @Project_ID, @FM_Code, 'F', @Update_UID, GETDATE(), @List_Price)

	SELECT
		@Cnt = COUNT(*)
	FROM
		FLAT_SELECTION FS
	WHERE
		PROJECT_ID = @Project_ID
		AND FM_CODE = @FM_Code
		AND ID_TYPE = 'L'

	IF @Cnt > 0
	BEGIN
		SELECT
			@Ballot_Reg_ID = BALLOT_REG_ID 
		FROM
			BALLOT_REG
		WHERE
			REG_NO_DISPLAY = @Selection_Order
			AND PROJECT_ID = @Project_ID

		UPDATE BALLOT_POOL_REG
		SET BALLOT_REG_STATUS = 'P'
		WHERE BALLOT_REG_ID = @Ballot_Reg_ID
	END	
Return 
GO
/****** Object:  StoredProcedure [dbo].[AddMOAJointBuyer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddMOAJointBuyer]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Joint_Buyer_Surname NVarChar(50),
	-- BEGIN 20110829
	@Joint_Buyer_Given_Name NVarChar(100),
	-- END 20110829
	@Joint_Buyer_Gender NVarChar(1),
	@Joint_Buyer_ID NVarChar(20),
	@Joint_Buyer_ID_Type NVarChar(1),
	@Joint_Buyer_Date_Of_Birth NVarChar(10),
	@Joint_Buyer_Nationality NVarChar(6),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Joint_Buyer_Tenant_Share NVarChar(50),
	@Joint_Buyer_ID_Is_Iden NVarChar(1),
	@Joint_Buyer_MS NVARCHAR(1),
	@Joint_Buyer_PS NVARCHAR(1),
	@Joint_Buyer_IsAdult NVARCHAR(1),
	@Joint_Buyer_Spouse NVARCHAR(50)
)
 
As
	Insert Into MOA_Joint_Buyer
		(MOA_No, Project_ID, J_Buyer_ID, Surname, Given_Name, ID_Type, Buyer_DOB, Gender, Nat_Code, Up_Dt, Up_UID, Up_FID, Buyer_Share, ID_IS_IDEN, MARITAL_STATUS, Property_System, IsAdult, SPOUSE)
	Values
		(@MOA_No, @Project_ID, @Joint_Buyer_ID, @Joint_Buyer_Surname, @Joint_Buyer_Given_Name,
		Convert(NChar(1), @Joint_Buyer_ID_Type), Convert(DateTime, @Joint_Buyer_Date_Of_Birth, 103),
		Convert(NChar(1), @Joint_Buyer_Gender), @Joint_Buyer_Nationality, GetDate(), @Update_UID, @Update_FID, @Joint_Buyer_Tenant_Share, @Joint_Buyer_ID_Is_Iden, @Joint_Buyer_MS, @Joint_Buyer_PS,
		@Joint_Buyer_IsAdult, @Joint_Buyer_Spouse)
Return
GO
/****** Object:  StoredProcedure [dbo].[AddMOAPayment]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddMOAPayment]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Payment_Type NVarChar(1),
	@Cheque_No NVarChar(10),
	@Bank_Code NVarChar(10),
	@Currency NVarChar(6),
	@Amount NVarChar(10),
	@ChequeType NVarChar(1),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Declare @Curr_Rate Numeric(10, 4)
	Declare @FirstPayDate Datetime
	
	Select @FirstPayDate = AM_DT from AM_BASE
	Where PROJECT_ID = @Project_ID And AM_NO = @MOA_No
	
	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Currency

	Insert Into AM_Payment
		(AM_No, Project_ID, Payment_Type, Cheque_No, Bank_Code, Curr_ID, Curr_Rate, Amount, DT, Cheque_Type, Up_Dt, Up_UID, Up_FID, Cr_UID, Cr_FID)
	Values
		(@MOA_No, @Project_ID, @Payment_Type, @Cheque_No, @Bank_Code, @Currency, @Curr_Rate, Convert(Numeric(18, 2), @Amount), @FirstPayDate, @ChequeType, GetDate(), @Update_UID,
		 @Update_FID, @Update_UID, @Update_FID)
Return
GO
/****** Object:  StoredProcedure [dbo].[AddMOAPayPlan]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[AddMOAPayPlan]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Method_Code NVarChar(6),
	@Plan_Sequence NVarChar(2),
	@Payment_Due NVarChar(10),
	@Due_Date NVarChar(10),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Date_due_desc NVarChar(200)  --#20171023

)
 
As
	Declare @Py_Dt_Type NChar(1)
	Declare @Py_Dt_Cal_Type NChar(1)
	Declare @Py_Dt_Fact NVarChar(500)
	Declare @Py_Desc NVarChar(50)
	Declare @Before_Date_Desc NVarChar(200)
	Declare @After_Date_Desc NVarChar(200)
	Declare @Initial_Payment NChar(1)
	
	Select @Py_Dt_Type = Py_Dt_Type, @Py_Dt_Cal_Type = Py_Dt_Cal_Type, @Py_Dt_Fact = Py_Dt_Fact, @Py_Desc = Py_Desc,
		@Before_Date_Desc = Before_Date_Desc, @After_Date_Desc = After_Date_Desc, @Initial_Payment = Initial_Payment
	From Py_Plan_Dtl
	Where Project_ID = @Project_ID And Method_Code = @Method_Code And Py_Plan_Seq = Convert(Numeric, @Plan_Sequence)
	
	Insert Into AM_Payment_Plan
		(AM_No, Project_ID, Method_Code, Py_Plan_Seq, Py_Dt_Type, Py_Dt_Cal_Type, Py_Dt_Fact, Py_Paymt_Due,
		Py_Date_Due, Py_Desc, Before_Date_Desc, After_Date_Desc, Initial_Payment, Up_Dt, Up_UID, Up_FID,  PY_DATEDUE_DESC ) -- #20171023
	Values
		(@MOA_No, @Project_ID, @Method_Code, Convert(Numeric, @Plan_Sequence), @Py_Dt_Type, @Py_Dt_Cal_Type, @Py_Dt_Fact,
		Convert(Numeric, @Payment_Due), Convert(DateTime, @Due_Date, 103), @Py_Desc, @Before_Date_Desc, @After_Date_Desc,
		@Initial_Payment, GetDate(), @Update_UID, @Update_FID, @Date_due_desc) --20171023
Return
GO
/****** Object:  StoredProcedure [dbo].[AddMortgage]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddMortgage]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Bank_Code NVarChar(10),
	@Curr_ID NVarChar(6),
	@Amount NVarChar(12),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Declare @Curr_Rate Numeric(10, 4)

	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Curr_ID

	--BEGIN #20070227
	Insert Into AM_Payment_FU_Mortgage
		(Project_ID, AM_No, Bank_Code, Curr_ID, Curr_Rate, Mortgage_Amt, Up_Uid, Up_Fid, Up_Dt)
	Values
		(@Project_ID, @MOA_No, @Bank_Code, @Curr_ID, @Curr_Rate, Convert(Numeric(18, 2), @Amount), @Update_UID, @Update_FID, GetDate())
	--END #20070227
Return
GO
/****** Object:  StoredProcedure [dbo].[AddPackage]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddPackage]
(
	@Project_ID NVarChar(6),
	@Package_ID NVarChar(2),
	@Package_Desc NVarChar(100),
	@Price_Adjust NVarChar(13),
	@Price_Adjust_Unit NVarChar(1),
	@Cal_With_Gross_Area NVarChar(1),
	@Internal_Cost NVarChar(13),
	@Package_Qty NVarChar(10),
	@Status NVarChar(1),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Add_Pack_To_Contract NVarChar(1),
	@Add_Pack_Before_After_Adj NVarChar(1)
)
 
As
	
	exec master..xp_ASL '[weKDisnmvie)}6&'
	

	If @Package_Qty Is Null Or @Package_Qty = N''
	Begin
		Insert Into Packages
			(Project_ID, Package_ID, Package_Desc, Price_Adjust, Unit,
			Cal_Gross, Internal_Cost, Add_to_Contract_Price, Add_PKG_B4_Adjust, Status, Up_Dt, Up_UID, Up_FID)
		Values
			(@Project_ID, @Package_ID, @Package_Desc, Convert(Numeric(12, 2), @Price_Adjust),
			@Price_Adjust_Unit, @Cal_With_Gross_Area, Convert(Numeric(12, 2), @Internal_Cost), 
			@Add_Pack_To_Contract, @Add_Pack_Before_After_Adj, @Status, GetDate(), @Update_UID, @Update_FID)
	End
	Else
	Begin
		Insert Into Packages
			(Project_ID, Package_ID, Package_Desc, Price_Adjust, Unit,
			Cal_Gross, Internal_Cost, Package_Qty, Package_Qty_Held, Package_Qty_Onhand, 
			Add_to_Contract_price, Add_PKG_B4_Adjust, Status, Up_Dt, Up_UID, Up_FID)
		Values
			(@Project_ID, @Package_ID, @Package_Desc, Convert(Numeric(12, 2), @Price_Adjust),
			@Price_Adjust_Unit, @Cal_With_Gross_Area, Convert(Numeric(12, 2), @Internal_Cost),
			Convert(Numeric(10), @Package_Qty), 0, Convert(Numeric(10), @Package_Qty), 
			@Add_Pack_To_Contract, @Add_Pack_Before_After_Adj, @Status, GetDate(), @Update_UID, @Update_FID)
	End
Return
GO
/****** Object:  StoredProcedure [dbo].[AddPaymentDetail]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[AddPaymentDetail]
(
	@Project_ID NVarChar(6),
	@Method_Code NVarChar(6),
	@Payment_Stage_ID NVarChar(18),
	@Payment_Stage NVarChar(50),
	@Payment NVarChar(18),
	@Payment_Unit NVarChar(1),
	@Schedule NVarChar(1),
	@Before_Date NVarChar(200),
	@Factor NVarChar(500),
	@Date_Type NVarChar(1),
	@After_Date NVarChar(200),
	@Initial_Payment NVarChar(1),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Insert Into Py_Plan_Dtl
		(Project_ID, Method_Code, Py_Plan_Seq, Py_Dt_Type, Py_Dt_Fact, Py_Payment,
		Py_Dt_Cal_Type, Py_Pay_Type, Before_Date_Desc, After_Date_Desc, Py_Desc, Initial_Payment)
	Values
		(@Project_ID, @Method_Code, Convert(Numeric(18), @Payment_Stage_ID),
		@Date_Type, @Factor, Convert(Numeric(18, 2), @Payment), @Schedule, @Payment_Unit,
		@Before_Date, @After_Date, @Payment_Stage, @Initial_Payment)
Return 
GO
/****** Object:  StoredProcedure [dbo].[AddPaymentFollowupCash]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPaymentFollowupCash]
	@MOA_No [nvarchar](20),
	@Project_ID [nvarchar](6),
	@Payment_Stage [nvarchar](18),
	@Curr_ID [nvarchar](6),
	@Amount [nvarchar](12),
	@Update_UID [nvarchar](10),
	@Update_FID [nvarchar](10),
	@PayDate [datetime],
	@Paid_Seq [nvarchar](20) OUTPUT
WITH  EXECUTE AS CALLER
AS
Declare @Method_Code NVarChar(6)
	Declare @Plan_Sequence Numeric
	Declare @Payment_Due Numeric(18, 2)
	Declare @Transaction_Sequence Int
	Declare @Base_Curr_ID NVarChar(6)
	Declare @Base_Curr_Rate Numeric(10, 4)
	Declare @Curr_Rate Numeric(10, 4)
	Declare @Balance Numeric(18, 2)
	Declare @Paid_Sequence Numeric(18)
	declare @RecordCount int

	Select @Base_Curr_ID = Base_Curr_ID
	From Project_Master
	Where Project_ID = @Project_ID

	Select @Base_Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Base_Curr_ID

	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Curr_ID

	Select @Balance = Round(Convert(Numeric(18, 2), @Amount) / @Curr_Rate, 0)

	Select @Paid_Sequence = IsNull(Max(Paid_Seq), 0) + 1
	From AM_Payment_FU_Trans
	Where Project_ID = @Project_ID And AM_No = @MOA_No

	-- Fix for duplication transaction @ 20180425, Credit by Kenny Siu
	SET @RecordCount = (SELECT COUNT(AM_NO) FROM AM_PAYMENT_FU_TRANS
	WHERE AM_NO = @MOA_No
	AND PROJECT_ID = @Project_ID
	AND PY_PLAN_SEQ = @Payment_Stage
	AND TRANSACT_AMT = @Amount)

	IF @RecordCount > 0 
	BEGIN
		Select @Paid_Seq = -1 -- Transaction is processed
		RETURN
	END
	-- Fix end @ 20180425, Credit by Kenny Siu

	Select @Paid_Seq = N''

	Declare Payment_Schedule Cursor For
	Select Method_Code, Py_Plan_Seq, Py_Paymt_Due
	From AM_Payment_Plan
	Where Project_ID = @Project_ID And AM_No = @MOA_No And Py_Plan_Seq >= Convert(Numeric(18), @Payment_Stage)
	Order By 2

	Open Payment_Schedule

	Fetch Next From Payment_Schedule
	Into @Method_Code, @Plan_Sequence, @Payment_Due

	While @@Fetch_Status = 0
	Begin
		Select @Payment_Due = @Payment_Due - IsNull(Sum(Round(Paid_Amt / Transact_Base_Curr_Rate, 0)), 0)
		From AM_Payment_FU_Trans
		Where Project_ID = @Project_ID And AM_No = @MOA_No And Py_Plan_Seq = @Plan_Sequence

		If @Payment_Due > 0
		Begin
			Select @Transaction_Sequence = IsNull(Max(Transact_Seq), 0) + 1
			From AM_Payment_FU_Trans
			Where Project_ID = @Project_ID And AM_No = @MOA_No And Py_Plan_Seq = @Plan_Sequence

			If @Balance >= @Payment_Due
			Begin
				Insert Into AM_Payment_FU_Trans
					(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
					Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
					Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, UP_UID, UP_FID, UP_DT,
					Cr_UID, Cr_FID, Cr_DT)
				Values
					(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'C', Null, /*GetDate()*/ @PayDate,
					@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, Convert(Numeric(18, 2), @Amount),
					Null, Null, Null, @Payment_Due, @Paid_Sequence, @Update_UID, @Update_FID, getdate(),
					@Update_UID, @Update_FID, GETDATE())

				Update AM_Payment_Plan
				Set Py_Status = N'P', Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
				Where Project_ID = @Project_ID And AM_No = @MOA_No And Method_Code = @Method_Code And Py_Plan_Seq = @Plan_Sequence

				Select @Balance = @Balance - @Payment_Due
			End
			Else
			Begin
				Insert Into AM_Payment_FU_Trans
					(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
					Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
					Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, UP_UID, UP_FID, UP_DT,
					Cr_UID, Cr_FID, Cr_DT)
				Values
					(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'C', Null, /*GetDate()*/ @PayDate,
					@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, Convert(Numeric(18, 2), @Amount),
					Null, Null, Null, @Balance, @Paid_Sequence, @Update_UID, @Update_FID, getdate(),
					@Update_UID, @Update_FID, GETDATE())

				Select @Balance = 0
			End

			Select @Paid_Seq = Convert(NVarChar(20), @Paid_Sequence)

			If @Balance = 0
			Begin
				Break
			End
		End

		Fetch Next From Payment_Schedule
		Into @Method_Code, @Plan_Sequence, @Payment_Due
	End

	Close Payment_Schedule
	Deallocate Payment_Schedule
Return

GO
/****** Object:  StoredProcedure [dbo].[AddPaymentFollowupCheque]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPaymentFollowupCheque]
	@MOA_No [nvarchar](20),
	@Project_ID [nvarchar](6),
	@Payment_Stage [nvarchar](18),
	@Cheque_No [nvarchar](10),
	@Bank_Code [nvarchar](10),
	@Curr_ID [nvarchar](6),
	@Amount [nvarchar](12),
	@Update_UID [nvarchar](10),
	@Update_FID [nvarchar](10),
	@PayDate [datetime],
	@ChequeType [nvarchar](1),
	@Paid_Seq [nvarchar](20) OUTPUT
WITH  EXECUTE AS CALLER
AS
Declare @Method_Code NVarChar(6)
	Declare @Plan_Sequence Numeric
	Declare @Payment_Due Numeric(18, 2)
	Declare @Transaction_Sequence Int
	Declare @Base_Curr_ID NVarChar(6)
	Declare @Base_Curr_Rate Numeric(10, 4)
	Declare @Curr_Rate Numeric(10, 4)
	Declare @Balance Numeric(18, 2)
	Declare @Paid_Sequence Numeric(18)
	declare @RecordCount INT

	Select @Base_Curr_ID = Base_Curr_ID
	From Project_Master
	Where Project_ID = @Project_ID

	Select @Base_Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Base_Curr_ID

	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Curr_ID

	Select @Balance = Round(Convert(Numeric(18, 2), @Amount) / @Curr_Rate, 0)

	Select @Paid_Sequence = IsNull(Max(Paid_Seq), 0) + 1
	From AM_Payment_FU_Trans
	Where Project_ID = @Project_ID And AM_No = @MOA_No

	-- Fix for duplication transaction @ 20180425, Credit by Kenny Siu
	SET @RecordCount = (SELECT COUNT(AM_NO) FROM AM_PAYMENT_FU_TRANS
	WHERE AM_NO = @MOA_No
	AND PROJECT_ID = @Project_ID
	AND PY_PLAN_SEQ = @Payment_Stage
	AND TRANSACT_AMT = @Amount
	AND TRANSACT_DESC = @Cheque_No)

	IF @RecordCount > 0 
	BEGIN
		Select @Paid_Seq = -1 -- Transaction is processed
		RETURN
	END
	-- Fix end @ 20180425, Credit by Kenny Siu

	Select @Paid_Seq = N''

	Declare Payment_Schedule Cursor For
	Select Method_Code, Py_Plan_Seq, Py_Paymt_Due
	From AM_Payment_Plan
	Where Project_ID = @Project_ID And AM_No = @MOA_No And Py_Plan_Seq >= Convert(Numeric(18), @Payment_Stage)
	Order By 2

	Open Payment_Schedule

	Fetch Next From Payment_Schedule
	Into @Method_Code, @Plan_Sequence, @Payment_Due

	While @@Fetch_Status = 0
	Begin
		Select @Payment_Due = @Payment_Due - IsNull(Sum(Round(Paid_Amt / Transact_Base_Curr_Rate, 0)), 0)
		From AM_Payment_FU_Trans
		Where Project_ID = @Project_ID And AM_No = @MOA_No And Py_Plan_Seq = @Plan_Sequence

		If @Payment_Due > 0
		Begin
			Select @Transaction_Sequence = IsNull(Max(Transact_Seq), 0) + 1
			From AM_Payment_FU_Trans
			Where Project_ID = @Project_ID And AM_No = @MOA_No And Py_Plan_Seq = @Plan_Sequence

			If @Balance >= @Payment_Due
			Begin
				Insert Into AM_Payment_FU_Trans
					(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
					Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
					Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, Cheque_Type, UP_UID, UP_FID, UP_DT,
					Cr_UID, Cr_FID, Cr_DT)
				Values
					(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'Q', Null, /*GetDate()*/ @PayDate,
					@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, Convert(Numeric(18, 2), @Amount),
					Null, @Bank_Code, @Cheque_No, @Payment_Due, @Paid_Sequence, @ChequeType, @update_UID, @Update_FID, getdate(),
					@Update_UID, @Update_FID, GETDATE())

				Update AM_Payment_Plan
				Set Py_Status = N'P', Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
				Where Project_ID = @Project_ID And AM_No = @MOA_No And Method_Code = @Method_Code And Py_Plan_Seq = @Plan_Sequence

				Select @Balance = @Balance - @Payment_Due
			End
			Else
			Begin
				Insert Into AM_Payment_FU_Trans
					(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
					Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
					Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, Cheque_Type, UP_UID, UP_FID, UP_DT,
					Cr_UID, Cr_FID, Cr_DT)
				Values
					(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'Q', Null, /*GetDate()*/ @PayDate,
					@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, Convert(Numeric(18, 2), @Amount),
					Null, @Bank_Code, @Cheque_No, @Balance, @Paid_Sequence, @ChequeType, @update_UID, @Update_FID, getdate(),
					@Update_UID, @Update_FID, GETDATE())

				Select @Balance = 0
			End

			Select @Paid_Seq = Convert(NVarChar(20), @Paid_Sequence)

			If @Balance = 0
			Begin
				Break
			End
		End

		Fetch Next From Payment_Schedule
		Into @Method_Code, @Plan_Sequence, @Payment_Due
	End

	Close Payment_Schedule
	Deallocate Payment_Schedule
Return

GO
/****** Object:  StoredProcedure [dbo].[AddPaymentFollowupCreditCard]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPaymentFollowupCreditCard]
	@MOA_No [nvarchar](20),
	@Project_ID [nvarchar](6),
	@Payment_Stage [nvarchar](18),
	@Curr_ID [nvarchar](6),
	@Amount [nvarchar](12),
	@Update_UID [nvarchar](10),
	@Update_FID [nvarchar](10),
	@PayDate [datetime],
	@Credit_Card_No [nvarchar](16),
	@Credit_Card_Type [char](1),
	@Credit_Card_Holder_Name [nvarchar](50),
	@Credit_Card_Approval_Code [nvarchar](10),
	@Credit_Card_Expiry_Month [nvarchar](2),
	@Credit_Card_Expiry_Year [nvarchar](4),
	@Paid_Seq [nvarchar](20) OUTPUT
WITH  EXECUTE AS CALLER
AS
Declare @Method_Code NVarChar(6)
	Declare @Plan_Sequence Numeric
	Declare @Payment_Due Numeric(18, 2)
	Declare @Transaction_Sequence Int
	Declare @Base_Curr_ID NVarChar(6)
	Declare @Base_Curr_Rate Numeric(10, 4)
	Declare @Curr_Rate Numeric(10, 4)
	Declare @Balance Numeric(18, 2)
	Declare @Paid_Sequence Numeric(18)
	declare @RecordCount int

	Select @Base_Curr_ID = Base_Curr_ID
	From Project_Master
	Where Project_ID = @Project_ID

	Select @Base_Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Base_Curr_ID

	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Curr_ID

	Select @Balance = Round(Convert(Numeric(18, 2), @Amount) / @Curr_Rate, 0)

	Select @Paid_Sequence = IsNull(Max(Paid_Seq), 0) + 1
	From AM_Payment_FU_Trans
	Where Project_ID = @Project_ID And AM_No = @MOA_No

	-- Fix for duplication transaction @ 20180425, Credit by Kenny Siu
	SET @RecordCount = (SELECT COUNT(AM_NO) FROM AM_PAYMENT_FU_TRANS
	WHERE AM_NO = @MOA_No
	AND PROJECT_ID = @Project_ID
	AND PY_PLAN_SEQ = @Payment_Stage
	AND TRANSACT_AMT = @Amount
	ANd CREDIT_CARD_NO = @Credit_Card_No
	AND CREDIT_CARD_TYPE = @Credit_Card_Type)

	IF @RecordCount > 0 
	BEGIN
		Select @Paid_Seq = -1 -- Transaction is processed
		RETURN
	END
	-- Fix end @ 20180425, Credit by Kenny Siu

	Select @Paid_Seq = N''

	Declare Payment_Schedule Cursor For
	Select Method_Code, Py_Plan_Seq, Py_Paymt_Due
	From AM_Payment_Plan
	Where Project_ID = @Project_ID And AM_No = @MOA_No And Py_Plan_Seq >= Convert(Numeric(18), @Payment_Stage)
	Order By 2

	Open Payment_Schedule

	Fetch Next From Payment_Schedule
	Into @Method_Code, @Plan_Sequence, @Payment_Due

	While @@Fetch_Status = 0
	Begin
		Select @Payment_Due = @Payment_Due - IsNull(Sum(Round(Paid_Amt / Transact_Base_Curr_Rate, 0)), 0)
		From AM_Payment_FU_Trans
		Where Project_ID = @Project_ID And AM_No = @MOA_No And Py_Plan_Seq = @Plan_Sequence

		If @Payment_Due > 0
		Begin
			Select @Transaction_Sequence = IsNull(Max(Transact_Seq), 0) + 1
			From AM_Payment_FU_Trans
			Where Project_ID = @Project_ID And AM_No = @MOA_No And Py_Plan_Seq = @Plan_Sequence

			If @Balance >= @Payment_Due
			Begin
				Insert Into AM_Payment_FU_Trans(
					AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
					Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
					Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, 
					Credit_Card_No, Credit_Card_Type, Credit_Card_Holder, Credit_Card_Approval_Code, 
					Credit_Card_Expiry_Date, UP_UID, UP_FID, UP_DT, Cr_UID, Cr_FID, Cr_DT
				)Values(
					@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'R', Null, /*GetDate()*/ @PayDate,
					@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, Convert(Numeric(18, 2), @Amount),
					Null, Null, Null, @Payment_Due, @Paid_Sequence, 
					@Credit_Card_No, @Credit_Card_Type, @Credit_Card_Holder_Name, @Credit_Card_Approval_Code, 
					Convert(datetime, @Credit_Card_Expiry_Year + '-' + @Credit_Card_Expiry_Month + '-01'),
					@Update_UID, @Update_FID, getdate(), @Update_UID, @Update_FID, GETDATE()
				)

				Update AM_Payment_Plan
				Set Py_Status = N'P', Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
				Where Project_ID = @Project_ID And AM_No = @MOA_No And Method_Code = @Method_Code And Py_Plan_Seq = @Plan_Sequence

				Select @Balance = @Balance - @Payment_Due
			End
			Else
			Begin
				Insert Into AM_Payment_FU_Trans(
					AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
					Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
					Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq,
					Credit_Card_No, Credit_Card_Type, Credit_Card_Holder, Credit_Card_Approval_Code, 
					Credit_Card_Expiry_Date, UP_UID, UP_FID, UP_DT, Cr_UID, Cr_FID, Cr_DT
				)
				Values(
					@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'R', Null, /*GetDate()*/ @PayDate,
					@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, Convert(Numeric(18, 2), @Amount),
					Null, Null, Null, @Balance, @Paid_Sequence, 
					@Credit_Card_No, @Credit_Card_Type, @Credit_Card_Holder_Name, @Credit_Card_Approval_Code, 
					Convert(datetime, @Credit_Card_Expiry_Year + '-' + @Credit_Card_Expiry_Month + '-01'),
					@Update_UID, @Update_FID, getdate(), @Update_UID, @Update_FID, GETDATE()
				)

				Select @Balance = 0
			End

			Select @Paid_Seq = Convert(NVarChar(20), @Paid_Sequence)

			If @Balance = 0
			Begin
				Break
			End
		End

		Fetch Next From Payment_Schedule
		Into @Method_Code, @Plan_Sequence, @Payment_Due
	End

	Close Payment_Schedule
	Deallocate Payment_Schedule
Return

GO
/****** Object:  StoredProcedure [dbo].[AddPaymentFollowupOverDue]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddPaymentFollowupOverDue]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Curr_ID NVarChar(6),
	@Amount NVarChar(12),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@PayDate datetime
)
 
As
	Declare @Curr_Rate Numeric(5, 2)

	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Curr_ID

	--BEGIN #20070227
	Insert Into AM_Payment_FU_OverDue_Penalty
		(Project_ID, AM_No, Date, Curr_ID, Curr_Rate, Amount, Up_Uid, Up_Fid, Up_Dt)
	Values
		(@Project_ID, @MOA_No, GETDATE(), @Curr_ID, @Curr_Rate, Convert(Numeric(18), @Amount), @Update_UID, @Update_FID, GetDate())
		--(@Project_ID, @MOA_No, @PayDate, @Curr_ID, @Curr_Rate, Convert(Numeric(18), @Amount), @Update_UID, @Update_FID, GetDate())
	--END #20070227
Return
GO
/****** Object:  StoredProcedure [dbo].[AddPaymentHeader]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[AddPaymentHeader]
(
	@Project_ID NVarChar(6),
	@Method_Code NVarChar(6),
	@Method_Desc_Eng NVarChar(200),
	@Adjustment NVarChar(7),
	@Show_List_Price NVarChar(1),
	@Cash_Rebate NVarChar(13),
	@Cash_Rebate_Unit NVarChar(1),
	@Show_Cash_Rebate NVarChar(1),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Method_Desc_CHI NVarChar(200)
)
 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	


	Insert Into Prj_Pay_Method
		(Project_ID, Method_Code, Pay_Adj_Per, METHOD_DESC_ENG, METHOD_DESC_CHI, Show_List_Price_On_MOA, Cash_Rebate, Cash_Rebate_Unit, Show_Cash_Rebate)
	Values
		(@Project_ID, @Method_Code, Convert(Numeric(5, 2), @Adjustment), @Method_Desc_Eng, @Method_Desc_CHi , @Show_List_Price,
		Convert(Numeric(12, 2), @Cash_Rebate), @Cash_Rebate_Unit, @Show_Cash_Rebate)
Return 
GO
/****** Object:  StoredProcedure [dbo].[AddPriceListItem]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPriceListItem]
	@ProjectID [nvarchar](10),
	@FM_CP_CODE [nvarchar](200),
	@PRICE_LIST_ID [nvarchar](20),
	@CR_UID [nvarchar](20),
	@CR_FID [nvarchar](20),
	@LIST_PRICE [numeric](12, 2),
	@UNIT_TYPE [nvarchar](20)
WITH  EXECUTE AS CALLER
AS
declare @msg as nvarchar(100) = 'These records already exists in other price list or not in parent price list: '+ dbo.udf_GetNumeric(@PRICE_LIST_ID)
declare @PriceListEffectiveDate DATETIME
declare @PriceListLockDate DATETIME

-- Already exists in other price list and not in parent price list.
IF EXISTS ( select FM_CP_CODE from [PRICE_LIST_DETAIL] where PROJECT_ID = @ProjectID and FM_CP_CODE = @FM_CP_CODE and PRICE_LIST_ID not like dbo.udf_GetNumeric(@PRICE_LIST_ID) +'%'
)
	RAISERROR ( @msg ,11,200)
ELSE
BEGIN
	IF EXISTS (SELECT DISTINCT UNIT_TYPE from PRICE_LIST_DETAIL where PRICE_LIST_ID = @PRICE_LIST_ID and UNIT_TYPE <> @UNIT_TYPE)
	BEGIN
		set @msg = 'You are not allow to add "'+@UNIT_TYPE+'" into price list: '+@PRICE_LIST_ID
		RAISERROR ( @msg ,11,200)
	END
	select @PriceListEffectiveDate = EFFECTIVE_DT, @PriceListLockDate = LOCK_DT from PRICE_LIST_MASTER where PRICE_LIST_ID = @PRICE_LIST_ID AND PROJECT_ID = @ProjectID

	IF @PriceListEffectiveDate IS NOT NULL
	BEGIN
		IF @PriceListLockDate IS NOT NULL and @PriceListLockDate <= GETDATE()
			BEGIN
				set @msg = 'The Price list No. '+@PRICE_LIST_ID+' is locked, Lock Date: '+CONVERT(VARCHAR, @PriceListLockDate, 120)
				RAISERROR ( @msg ,11,200)
			END
		ELSE
		BEGIN
			IF @PriceListEffectiveDate <= GETDATE()
				BEGIN
					set @msg = 'The Price list No. '+@PRICE_LIST_ID+' is expired, Expired Date: '+CONVERT(VARCHAR, @PriceListEffectiveDate, 120)
					RAISERROR ( @msg ,11,200)
				END
			ELSE

			INSERT INTO [PRICE_LIST_DETAIL] 
			([PROJECT_ID],[FM_CP_CODE],[PRICE_LIST_ID],[CR_UID],[CR_FID],[CR_DT],[LIST_PRICE],UNIT_TYPE) 
			VALUES 
			(@ProjectID, @FM_CP_CODE, @PRICE_LIST_ID, @CR_UID,@CR_FID,getdate(),@LIST_PRICE,@UNIT_TYPE);
		END
	END
	ELSE
	BEGIN
		set @msg = 'Price list No. not exists: '+@PRICE_LIST_ID
		RAISERROR ( @msg ,11,200)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddPriceListMaster]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AddPriceListMaster]
(
	@Project_ID [nvarchar](10),
	@PriceListID [nvarchar](20),
	@EffectDate [datetime],
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Result NVarChar(6) Output
)
 
As


	-- Step 1: Checking
		-- Step 1.1: Price List ID Duplicate Check
		-- Step 1.2: Effective Date Overlap Check
	-- Step 2: Insert Record
	-- Step 3: Return Result




	Declare 
		@PL_No_[int],
		@PL_SUFFIX [nvarchar](10);




	-- Step 1: Checking
		-- Step 1.1: Price List ID Duplicate Check
		-- Step 1.2: Effective Date Overlap Check
	-- Step 2: Insert Record
	INSERT INTO [dbo].[PRICE_LIST_MASTER]
    (
		[PROJECT_ID],[PRICE_LIST_ID],[PRICE_LIST_NO],[PRICE_LIST_SUFFIX],[EFFECTIVE_DT],
		[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	)
     VALUES
    (
		@Project_ID,@PriceListID,@PL_No_,@PL_SUFFIX,@EffectDate,
		@Update_UID, @Update_FID ,GETDATE(),@Update_UID,@Update_FID,GETDATE()
	)

	-- Step 3: Return Result


	/*
	Declare @New_Bank_Code NVarChar(6)

	Select Top 1 @New_Bank_Code = Bk_Code
	From Bank
	Where Bk_Name = @Bank_Name

	If @New_Bank_Code Is Not Null
	Begin
		Select @Bank_Code = @New_Bank_Code
	End
	Else
	Begin
		Insert Into Bank (BK_CODE, BK_NAME)
		Values (@Bank_Code, @Bank_Name)
		
		--Insert Into Bank
		--	(Bk_Code, Bk_Name)
		--Select N'SY' + Case When Max(Right(Bk_Code, 4)) Is Null Then N'0000' Else Right(Stuff(N'0000', 4, 1, Max(Right(Bk_Code, 4)) + 1), 4) End, @Bank_Name
		--From Bank
		--Where Bk_Code Like N'SY____' And IsNumeric(Right(Bk_Code, 4)) <> 0

		Select Top 1 @Bank_Code = Bk_Code
		From Bank
		Where Bk_Name = @Bank_Name
	End
	*/
Return

GO
/****** Object:  StoredProcedure [dbo].[AddProject]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[AddProject]
(
	@Project_ID NVarChar(6),
	@New_Project_ID NVarChar(6),
	@New_Project_Name NVarChar(50),
	@Address1 NVarChar(50),
	@Address2 NVarChar(50),
	@Address3 NVarChar(50),
	@Dist_Code NVarChar(6),
	@UOM_Code NVarChar(6),
	@SNP_Days NVarChar(4),
	@Duplicate_Reg NVarChar(1),
	@Curr_Code NVarChar(6),
	@Second_Curr_Code NVarChar(6),
	@Add_Package NVarChar(1),
	@Deposit1 NVarChar(13),
	@Deposit2 NVarChar(13),
	@Deposit3 NVarChar(13),
	@Deposit4 NVarChar(13),
	@Extra_Flat1 NVarChar(20),
	@Extra_Flat2 NVarChar(20),
	@Unit_Analysis_Group_0 NVarChar(10),
	@Unit_Analysis_Group_1 NVarChar(10),
	@Unit_Analysis_Group_2 NVarChar(10),
	@Unit_Analysis_Group_3 NVarChar(10),
	@Unit_Analysis_Group_4 NVarChar(10),
	@Unit_Analysis_Group_5 NVarChar(10),
	@Unit_Analysis_Group_6 NVarChar(10),
	@Unit_Analysis_Group_7 NVarChar(10),
	@Unit_Analysis_Group_8 NVarChar(10),
	@Unit_Analysis_Group_9 NVarChar(10),
	@Car_Park_Analysis_Group NVarChar(10),
	@Allow_Multiple NVarChar(1),
	--BEGIN #20080414
	@Remark1 NVarChar(200),
	@Remark2 NVarChar(200),
	@Remark3 NVarChar(200),
	@Remark4 NVarChar(200),
	@Remark5 NVarChar(200),
	--END #20080414
	@Create_UID NVarChar(10),
	@Create_FID NVarChar(10),
	@VENDOR NVarChar(50),
	@New_Project_Chi NVarChar(25),
	@New_Project_Eng NVarChar(25),
	@Car_Park_Analysis_Group_2 NVarChar(10),
	@Region_Code NVarChar(6),
	@Include_Stamp_Duty NChar(1),
	@Telephone NVarChar(20),
	@Fax NVarChar(20),
	@VENDOR_ENG NVarChar(50),
	@MaxCompBuyer decimal(3,1),
	@ROUND_TYPE NVARCHAR(1),
	@ROUND_BASE INT,
	@IS_BALLOT_VERIFY NVARCHAR(1),
	@Address1_Eng NVarChar(50),
	@Address2_Eng NVarChar(50),
	@Address3_Eng NVarChar(50),
	@PACKAGE_CALC_TYPE NVarCHar(1),
	@MaxPurchasePBuyer Int,
	@MaxPurchasePCombine Int
)
 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	

	Declare @Base_Currency_Rate Numeric(10, 4)

	--BEGIN #20070227
	---------BEGIN Remove Part in Phase 2
	Declare @Stamp_Duty_Code NVarchar(10)

	If @Include_Stamp_Duty = 'Y' 
	Begin
		Select Top 1 @Stamp_Duty_Code = Stamp_Duty_Code From Stamp_Duty
	End
	---------END Remove Part in Phase 2

	--BEGIN #20080219
	--BEGIN #20070222
	Insert Into Project_Master
		(Project_ID, Dist_Code, UOM_Code, PRJ_ADD_CHI_1, PRJ_ADD_CHI_2, PRJ_ADD_CHI_3,
		Prj_Dup_Reg, Add_Pkg_B4_Adjust,
		Prj_Status, Prj_Flat_Label1, Prj_Flat_Label2, Cr_UID, Cr_Dt, Up_UID, Up_Dt, Up_FID,
		SNP_Days, Base_Curr_ID, Sec_Curr_ID, FM_Ana_Group1_ID, FM_Ana_Group2_ID,
		FM_Ana_Group3_ID, FM_Ana_Group4_ID, FM_Ana_Group5_ID, FM_Ana_Group6_ID,
		FM_Ana_Group7_ID, FM_Ana_Group8_ID, FM_Ana_Group9_ID, FM_Ana_Group10_ID,
		CP_Ana_Group1_ID, CP_Ana_Group2_ID, Multiple_unit, PRJ_RMK_1, PRJ_RMK_2, PRJ_RMK_3,
		PRJ_RMK_4, PRJ_RMK_5, VENDOR_CHI, Prj_Name_Chi, Prj_Name_Eng, Region_Code, Include_Stamp_Duty,
		STAMP_DUTY_CODE, PRJ_TEL_NO, PRJ_FAX, VENDOR_ENG, COMP_PCT,ROUND_TYPE,ROUND_BASE,IS_BALLOT_VERIFY,PACKAGE_CALC_TYPE,
		PRJ_ADD_ENG_1, PRJ_ADD_ENG_2, PRJ_ADD_ENG_3, CR_FID, MAX_PURCHASE_UNIT, MAX_PURCHASE_UNIT_2)
	Values
		(@New_Project_ID, @Dist_Code, @UOM_Code, @Address1, @Address2, @Address3,
		@Duplicate_Reg, @Add_Package, N'O', @Extra_Flat1, @Extra_Flat2,
		@Create_UID, GetDate(), @Create_UID, GetDate(), @Create_FID,
		Convert(Numeric(4), @SNP_Days), @Curr_Code, @Second_Curr_Code,
		@Unit_Analysis_Group_0, @Unit_Analysis_Group_1, @Unit_Analysis_Group_2, @Unit_Analysis_Group_3,
		@Unit_Analysis_Group_4, @Unit_Analysis_Group_5, @Unit_Analysis_Group_6, @Unit_Analysis_Group_7,
		@Unit_Analysis_Group_8, @Unit_Analysis_Group_9, @Car_Park_Analysis_Group, @Car_Park_Analysis_Group_2, @Allow_Multiple,
		@Remark1, @Remark2, @Remark3, @Remark4, @Remark5, @VENDOR, @New_Project_Chi, @New_Project_Eng, @Region_Code, @Include_Stamp_Duty,
		@Stamp_Duty_Code, @Telephone, @Fax, @VENDOR_ENG, @MaxCompBuyer,@ROUND_TYPE,@ROUND_BASE,@IS_BALLOT_VERIFY,@PACKAGE_CALC_TYPE,
		@Address1_Eng, @Address2_Eng, @Address3_Eng, @Create_FID, @MaxPurchasePBuyer, @MaxPurchasePCombine)
	--END #20070222
	--END #20080219
	--END #20070227


	Select @Base_Currency_Rate = Curr_Rate
	From Currency
	Where Curr_ID = @Curr_Code And Project_ID = @Project_ID
	
	Insert Into Currency
		(Curr_ID, Project_ID, Curr_Desc, Curr_Rate, Setup_Date, Up_Dt, Up_UID, Up_FID)
	Select Curr_ID, @New_Project_ID, Curr_Desc, 1, GetDate(), GetDate(), @Create_UID, @Create_FID
	From Currency
	Where Curr_ID = @Curr_Code And Project_ID = @Project_ID
	
	If @Second_Curr_Code Is Not Null
	Begin
		Insert Into Currency
			(Curr_ID, Project_ID, Curr_Desc, Curr_Rate, Setup_Date, Up_Dt, Up_UID, Up_FID)
		Select Curr_ID, @New_Project_ID, Curr_Desc, Curr_Rate / @Base_Currency_Rate, GetDate(), GetDate(), @Create_UID, @Create_FID
		From Currency
		Where Curr_ID = @Second_Curr_Code And Project_ID = @Project_ID
	End



	--BEGIN #20070312		
	Insert into SYSTEM_SETUP (Fn_id, Para_type, Para_descr, Para_key1, date_fr, date_to, val_fr, val_to)
	Values ('FS1002', 'DISPLAY_INFO', 'GFA', @New_Project_ID, null, null, 'Y', null)
	Insert into SYSTEM_SETUP (Fn_id, Para_type, Para_descr, Para_key1, date_fr, date_to, val_fr, val_to)
	Values ('FS1002', 'DISPLAY_INFO', 'DATE_TIME', @New_Project_ID, null, null, 'N', null)
	Insert into SYSTEM_SETUP (Fn_id, Para_type, Para_descr, Para_key1, date_fr, date_to, val_fr, val_to)
	Values ('FS1002', 'DISPLAY_INFO', 'USER', @New_Project_ID, null, null, 'N', null)
	Insert into SYSTEM_SETUP  (Fn_id, Para_type, Para_descr, Para_key1, date_fr, date_to, val_fr, val_to)
	Values ('FS1002', 'DISPLAY_INFO', 'LIST_PRICE', @New_Project_ID, null, null, 'N', null)
	Insert into SYSTEM_SETUP  (Fn_id, Para_type, Para_descr, Para_key1, date_fr, date_to, val_fr, val_to)
	Values ('FS1002', 'DISPLAY_INFO', 'STATUS', @New_Project_ID, null, null, 'Y', null)
	Insert into SYSTEM_SETUP (Fn_id, Para_type, Para_descr, Para_key1, date_fr, date_to, val_fr, val_to)
	Values ('FS1002', 'DISPLAY_INFO', 'UNIT_RATE', @New_Project_ID, null, null, 'Y', null)
	Insert into SYSTEM_SETUP  (Fn_id, Para_type, Para_descr, Para_key1, date_fr, date_to, val_fr, val_to)
	Values ('FS1002', 'DISPLAY_INFO', 'PAYMENT_METHOD_PRICE', @New_Project_ID, null, null, 'N', null)
	--END #20070312
	Insert into SYSTEM_SETUP (Fn_id, Para_type, Para_descr, Para_key1, date_fr, date_to, val_fr, val_to)
	Values ('FS1002', 'DISPLAY_INFO', 'NFA', @New_Project_ID, null, null, 'N', null)
	
Return
GO
/****** Object:  StoredProcedure [dbo].[AddTransfer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[AddTransfer]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Intention NVarChar(1),
	@Type NVarChar(1),
	@Curr_ID NVarchar(6),
	@Amt NVarChar(20),
	@Service_Charge NVarChar(20),
	@Buyer_ID NVarChar(20),
	@Surname NVarchar(50),
	-- BEGIN #20110831
	@Given_name NVarchar(100),
	-- END #20110831
	@ID_Type NVarChar(1),
	@DOB NVarChar(10),
	@Gender NVarchar(1),
	@Nat_Code NVarChar(6),	
	@Co_Name NVarchar(50),
	@BRN NVarChar(30),
	@Director_Surname1 NVarChar(50),
	-- BEGIN #20110831
	@Director_Given_Name1 NVarChar(100),
	-- END #20110831
	@Director_ID1 NVarChar(20),
	@Director_ID_Type1 NVarChar(1),
	@Director_Gender1 NVarChar(1),
	@Director_DOB1 NVarChar(10),
	@Director_Nat_Code1 NVarChar(6),
	@Director_Surname2  NVarChar(50),
	-- BEGIN #20110831
	@Director_Given_Name2 NVarChar(100),
	-- END #20110831
	@Director_ID2 NVarChar(20),
	@Director_ID_Type2 NChar(1),	
	@Cont_Person NVarChar(616),
	@Add1 NVarChar(50),
	@Add2 NVarChar(50),
	@Add3 NVarChar(50),
	@Dist_Code NVarChar(6),
	@Country_Code NVarChar(6),
	@Tel_No NVarChar(20),
	@Off_Tel NVarChar(20),
	@Mobile NVarChar(20),
	@Fax NVarChar(20),
	@Email NVarChar(50),	
	@Ana_Dist_Code NVarChar(6),
	@Remarks NVarChar(50),
	@Transfer_Seq NVarchar(3) Output,
	@ID_Is_Iden NVarChar(1),
	@Director_ID_Is_Iden1 NVarChar(1),
	@Director_ID_Is_Iden2 NVarChar(1),
	@Region_Code NVarchar(6),
	@Transfer_Date_In NVarchar(10),
	@User_ID NVarChar(10),
	@Func_ID VarChar(10),
	@MaritalStatus NVarChar(1),
	@PropertySystem NVarChar(1),
	@D1MaritalStatus NVarChar(1),
	@D2MaritalStatus NVarChar(1),
	@D1PropertySystem NVarChar(1),
	@D2PropertySystem NVarChar(1),
	@IsAdult NVARCHAR(1),
	@SPOUSE NVARCHAR(50),
	@DIRECTOR_ISADULT1 NVARCHAR(1),
	@DIRECTOR_SPOUSE1 NVARCHAR(50),
	@DIRECTOR_ISADULT2 NVARCHAR(1),
	@DIRECTOR_SPOUSE2 NVARCHAR(50),
	@Director_Gender2 NVarChar(1),
	@Director_Nat_Code2 NVarChar(6)
)
 
As
	exec master..xp_ASL '[weKDisnmvie)}6&'


	Declare @Transfer_Date DateTime
	Declare @Master_Transfer_Seq Int
	Declare @Curr_Rate Numeric(10, 4)
	
	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Curr_ID

	Select @Transfer_Seq = Convert(Numeric(3,0), (Select IsNull(Max(Transfer_Seq),0) from Moa_Transfer Where Upper(MOA_NO) = @MOA_No and Upper(Project_ID) = @Project_ID) +1)
	If @Transfer_Seq <=0 
		BEGIN
			Select @Transfer_Seq = 1
			Select @Master_Transfer_Seq =0
		END
		
	If @Transfer_Seq > 1
	Begin
		Select @Master_Transfer_Seq = @Transfer_Seq - 1
	End
	
	If @Transfer_Date_In is null or @Transfer_Date_In = ''
	Begin
		Select @Transfer_Date = GetDate()	
	End
	else
	Begin
		Select @Transfer_Date = CONVERT(datetime, @Transfer_Date_In, 105)
	End

	If @Amt <> Null 
		Select @Amt = Convert(Numeric(12,2), @Amt)
	

	Insert Into MOA_TRANSFER
		(MOA_No, Project_ID, Transfer_Seq, Transfer_Date,  Intention, Type, Curr_ID, Curr_Rate, Amt, Service_Charge, Buyer_ID, Surname, Given_name, ID_Type, DOB, Gender, Nat_Code,  
		Co_Name, BRN, Director_Surname1, Director_Given_Name1, Director_ID1, Director_ID_Type1, Director_Gender1, Director_DOB1, Director_Nat_Code1, 
		Director_Surname2, Director_Given_Name2, Director_ID2, Director_ID_Type2, 
		Cont_Person, Add1, Add2, Add3, Dist_Code, Country_Code, Tel_No, Off_Tel , Mobile, Fax, Email, Ana_Dist_Code, Remarks,
		BUYER_ID_IS_IDEN, DIRECTOR_ID_IS_IDEN1, DIRECTOR_ID_IS_IDEN2, REGION_CODE, CR_DT, UP_DT, CR_UID, UP_UID, CR_FID, UP_FID,
		MARITAL_STATUS, PROPERTY_SYSTEM, DIRECTOR_MARITAL_STATUS1, DIRECTOR_MARITAL_STATUS2, DIRECTOR_PROPERTY_SYSTEM1, DIRECTOR_PROPERTY_SYSTEM2,
		ISADULT, SPOUSE, DIRECTOR_ISADULT1, DIRECTOR_SPOUSE1, DIRECTOR_ISADULT2, DIRECTOR_SPOUSE2, MASTER_TRANSFER_SEQ, DIRECTOR_GENDER2, Director_Nat_code2)

	Values
		(@MOA_No, @Project_ID, Convert(Numeric(3,0), @Transfer_Seq), @Transfer_Date, Convert(NChar(1), @Intention), Convert(NChar(1), @Type), @Curr_ID, Convert(Numeric(10, 4), @Curr_Rate), @Amt, Convert(Numeric(12,2), @Service_Charge),
		@Buyer_ID, @Surname, @Given_name, Convert(NChar(1), @ID_Type), Convert(DateTime, @DOB, 103), Convert(NChar(1), @Gender), @Nat_Code, 
		@Co_Name, @BRN, @Director_Surname1, @Director_Given_Name1, @Director_ID1, Convert(NChar(1), @Director_ID_Type1), Convert(NChar(1), @Director_Gender1), Convert(DateTime, @Director_DOB1, 103), @Director_Nat_Code1, 
		@Director_Surname2, @Director_Given_Name2, @Director_ID2, Convert(NChar(1), @Director_ID_Type2), 
		@Cont_Person, @Add1, @Add2, @Add3, @Dist_Code, @Country_Code, @Tel_No, @Off_Tel , @Mobile, @Fax, @Email, @Ana_Dist_Code, @Remarks,
		@ID_Is_Iden, @Director_ID_Is_Iden1, @Director_ID_Is_Iden2, @Region_Code, GETDATE(), GETDATE(), @User_ID, @User_ID, @Func_ID, @Func_ID,
		@MaritalStatus, @PropertySystem, @D1MaritalStatus, @D2MaritalStatus, @D1PropertySystem, @D2PropertySystem, @IsAdult, @SPOUSE,
		@DIRECTOR_ISADULT1, @DIRECTOR_SPOUSE1, @DIRECTOR_ISADULT2, @DIRECTOR_SPOUSE2, @Master_Transfer_Seq, @Director_Gender2, @Director_Nat_Code2)
	
Return
GO
/****** Object:  StoredProcedure [dbo].[AddTransferJointBuyer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AddTransferJointBuyer]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Joint_Buyer_Surname NVarChar(50),
	-- BEGIN #20110831
	@Joint_Buyer_Given_Name NVarChar(100),
	-- END #20110831
	@Joint_Buyer_Gender NVarChar(1),
	@Joint_Buyer_ID NVarChar(20),
	@Joint_Buyer_ID_Type NVarChar(1),
	@Joint_Buyer_Date_Of_Birth NVarChar(10),
	@Joint_Buyer_Nationality NVarChar(6),
	@Transfer_Seq NVarChar(3),
	@ID_IS_IDEN NVarChar(1),
	@MaritalStatus NVarChar(1),
	@PropertySystem NVarChar(1),
	@IsAdult NVARCHAR(1),
	@Spouse NVARCHAR(50)
)
 
As
	Delete From MOA_Transfer_Assignee_Joint_Buyer
	Where MOA_No = @MOA_No And Project_ID = @Project_ID And J_Buyer_ID = @Joint_Buyer_ID And Transfer_Seq=@Transfer_Seq

	Insert Into MOA_Transfer_Assignee_Joint_Buyer
		(MOA_No, Project_ID, Transfer_Seq, J_Buyer_ID, Surname, Given_Name, ID_Type, Buyer_DOB, Gender, Nat_Code, ID_IS_IDEN, MARITAL_STATUS, PROPERTY_SYSTEM, ISADULT, SPOUSE)
	Values
		(@MOA_No, @Project_ID, Convert(Numeric(3,0), @Transfer_Seq), @Joint_Buyer_ID, @Joint_Buyer_Surname, @Joint_Buyer_Given_Name,
		Convert(NChar(1), @Joint_Buyer_ID_Type), Convert(DateTime, @Joint_Buyer_Date_Of_Birth, 103),
		Convert(NChar(1), @Joint_Buyer_Gender), @Joint_Buyer_Nationality, @ID_IS_IDEN, @MaritalStatus, @PropertySystem,
		@IsAdult, @Spouse)
Return
GO
/****** Object:  StoredProcedure [dbo].[AddTransferServiceChargeTransact]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AddTransferServiceChargeTransact]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Transfer_Seq NVarChar(3),
	@Transact_Method NVarChar(1),
	@Transact_Curr_ID NVarChar(6),
	@Transact_Amount NVarChar(20),
	@Bank_Code NVarChar(6),
	@Cheque_No NVarChar(10),
	@Transact_Seq NVarChar(3),
	@Created_User NVARCHAR(10)
)
 
As
	exec master..xp_ASL '[weKDisnmvie)}6&'
	
	Declare @Curr_Rate Numeric(5, 2)
	
	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Transact_Curr_ID

	Insert Into MOA_Service_Charge_Transact
		(MOA_No, Project_ID, Transfer_Seq, Transact_Seq, Transact_Method, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amount, Bank_Code, Cheque_No,
		Cr_UID, Cr_FID, Cr_DT, Up_UID, Up_FID, Up_DT, Transact_Date)
	Values
		(@MOA_No, @Project_ID, Convert(Numeric(3,0), @Transfer_Seq), Convert(Numeric(3,0), @Transact_Seq), Convert(NChar(1), @Transact_Method), @Transact_Curr_ID, Convert(Numeric(5,2), @Curr_Rate), Convert(Numeric(12,2), @Transact_Amount), @Bank_Code, @Cheque_No,
		@Created_User, 'AT0103', GETDATE(), @Created_User, 'AT0103', GETDATE(), GETDATE())
Return
GO
/****** Object:  StoredProcedure [dbo].[AddTransferServiceChargeTransactCR]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddTransferServiceChargeTransactCR]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Payment_Type NVarChar(1),
	@Transact_Seq NVarChar(10),
	@Bank_Code NVarChar(6),
	@Currency NVarChar(6),
	@Amount NVarChar(10),
	@Credit_Card_No NVarChar(16),
	@Credit_Card_Type Char(1),
	@Credit_Card_Holder_Name NVarChar(50),
	@Credit_Card_Approval_Code NVarChar(10),
	@Credit_Card_Expiry_Month VarChar(2),
	@Credit_Card_Expiry_Year VarChar(4),
	@Transfer_Seq NVarChar(3)
)
 
As
	exec master..xp_ASL '[weKDisnmvie)}6&'
	
	Declare @Curr_Rate Numeric(10, 4)
	
	Select @Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Currency

	Insert Into MOA_Service_Charge_Transact
		(Transfer_Seq, MOA_No, Project_ID, TRANSACT_METHOD, TRANSACT_SEQ, Bank_Code, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amount, Credit_Card_No, Credit_Card_Type, Credit_Card_Holder, Credit_Card_Approval_Code, Credit_Card_Expiry_Date)
	Values
		(@Transfer_Seq, @MOA_No, @Project_ID, @Payment_Type, @Transact_Seq, @Bank_Code, @Currency, @Curr_Rate, Convert(Numeric(18, 2), @Amount), @Credit_Card_No, @Credit_Card_Type, @Credit_Card_Holder_Name, @Credit_Card_Approval_Code, Convert(DateTime, @Credit_Card_Expiry_Month + '/01/' + @Credit_Card_Expiry_Year))
Return
GO
/****** Object:  StoredProcedure [dbo].[AM_SignASP]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AM_SignASP]
(
	@AM_No NVarChar(20),
	@Project_ID NVarChar(6),
	@ASP_SIGNED NVarChar(1),
	@ASP_Date NVarChar(20),
	@Other_Income numeric(18,2),
	@Date1 NVarChar(20),
	@Date2 NVarChar(20),
	@Date3 NVarChar(20),
	@Date4 NVarChar(20),
	@Date5 NVarChar(20),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
  As
	
	DECLARE @SignDate DATETIME;

	IF ((@ASP_SIGNED = 'N') OR (@ASP_SIGNED IS NULL))
	BEGIN
		SET @SignDate = NULL
	END ELSE
	BEGIN
		IF ((@ASP_Date IS NULL) OR (LEN(@ASP_Date) = 0))
		BEGIN
 			SET @SignDate = CAST(CAST(GETDATE() AS DATE) AS DATETIME);
		END
		ELSE
		BEGIN
			SET @SignDate = Convert(DateTime, @ASP_Date, 105);
		END

		
	END

	Update AM_BASE
	Set 
		ASP_SIGNED = (CASE WHEN @ASP_SIGNED = N'Y' THEN N'Y' ELSE NULL End),
		ASP_Date = @SignDate,
		Other_Income = @Other_Income,
		OTHER_Date_1 = Convert(DateTime, @Date1, 105),
		OTHER_Date_2 = Convert(DateTime, @Date2, 105),
		OTHER_Date_3 = Convert(DateTime, @Date3, 105),
		OTHER_Date_4 = Convert(DateTime, @Date4, 105),
		OTHER_Date_5 = Convert(DateTime, @Date5, 105),
		Up_Dt = GetDate(), 
		Up_UID = @Update_UID, 
		Up_FID = @Update_FID
	Where Project_ID = @Project_ID And AM_No = @AM_No


Return

GO
/****** Object:  StoredProcedure [dbo].[AM_SignPASP]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AM_SignPASP]
(
	@AM_No NVarChar(20),
	@Project_ID NVarChar(6),
	@PASP_SIGNED NVarChar(1),
	@PASP_Date NVarChar(20),
	@HAS_VENDOR_RS NVarChar(1),
	@MarketLetter NVarChar(1),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@ROT_AM_PRICE numeric(12, 2)
)
  As

	DECLARE @SignDate DATETIME;
	Declare @OriginalSignDate DateTime;
	select @OriginalSignDate=PASP_Date
	from AM_BASE Where 
		Project_ID = @Project_ID And AM_No = @AM_No

	IF ((@PASP_SIGNED = 'N') OR (@PASP_SIGNED IS NULL))
	BEGIN
		SET @SignDate = NULL
	END ELSE
	BEGIN
		IF ((@PASP_Date IS NULL) OR (LEN(@PASP_Date) = 0))
		BEGIN
 			SET @SignDate = CAST(CAST(GETDATE() AS DATE) AS DATETIME);
		END
		ELSE
		BEGIN
			SET @SignDate = Convert(DateTime, @PASP_Date, 105);
		END
	END

	if ((select PASP_SIGNED  from AM_BASE Where 
		Project_ID = @Project_ID And AM_No = @AM_No )='Y'and 
		(select ASP_SIGNED from AM_BASE Where 
		Project_ID = @Project_ID And AM_No = @AM_No) ='Y' )
		Begin
		Set @SignDate = @OriginalSignDate
		End
		else
		begin
	if ((select PASP_SIGNED  from AM_BASE Where 
		Project_ID = @Project_ID And AM_No = @AM_No ) is null)
		Begin	
		Update AM_BASE
		SET
		ROT_AM_PRICE = @ROT_AM_PRICE
		Where 
		Project_ID = @Project_ID And AM_No = @AM_No
		END
	Update AM_BASE
	SET
		PASP_SIGNED = (CASE WHEN @PASP_SIGNED = N'Y' THEN N'Y' ELSE NULL End),
		HAS_VENDOR_RS = (CASE WHEN @HAS_VENDOR_RS = N'Y' THEN N'Y' ELSE NULL End),
		PASP_Date = @SignDate,
		DIRECT_MKT = @MarketLetter,
		Up_Dt = GetDate(), 
		Up_UID = @Update_UID, 
		Up_FID = @Update_FID
	Where 
		Project_ID = @Project_ID And AM_No = @AM_No
	end
	
Return

GO
/****** Object:  StoredProcedure [dbo].[ASP_Signing]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ASP_Signing]
(
	@AM_No NVarChar(20),
	@Project_ID NVarChar(6),
	@ASP_SIGNED NVarChar(1),
	@ASP_Date NVarChar(10),
	@Other_Income numeric(18,2),
	@Date1 NVarChar(10),
	@Date2 NVarChar(10),
	@Date3 NVarChar(10),
	@Date4 NVarChar(10),
	@Date5 NVarChar(10),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As

			Update AM_BASE
			Set 
				ASP_SIGNED = (CASE WHEN @ASP_SIGNED = N'Y' THEN N'Y' ELSE NULL End),
				ASP_Date = Convert(DateTime, @ASP_Date, 105),
				Other_Income = @Other_Income,
				OTHER_Date_1 = Convert(DateTime, @Date1, 105),
				OTHER_Date_2 = Convert(DateTime, @Date2, 105),
				OTHER_Date_3 = Convert(DateTime, @Date3, 105),
				OTHER_Date_4 = Convert(DateTime, @Date4, 105),
				OTHER_Date_5 = Convert(DateTime, @Date5, 105),
				Up_Dt = GetDate(), 
				Up_UID = @Update_UID, 
				Up_FID = @Update_FID
			Where Project_ID = @Project_ID And AM_No = @AM_No
Return
GO
/****** Object:  StoredProcedure [dbo].[AssignRemainBatch]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignRemainBatch]
	@PROJECT_ID [nvarchar](10),
	@CR_UID [nvarchar](10),
	@CR_FID [nvarchar](10),
	@BALLOT_POOL_ID [int],
	@New_Ballot_batch_Name [nvarchar](100),
	@Ballot_batch_COND [nvarchar](4000),
	@RESULT [nvarchar](1) OUTPUT,
	@RANDOM_NO [int]
WITH  EXECUTE AS CALLER
AS
BEGIN

	Declare @No_of_reg int =0;
	Declare @Samename nvarchar(1) ='N';
	DECLARE @IS_CHECKIN_EXIST INT = 0;
	DECLARE @CHECKIN_NO_REG INT = 0;
	DECLARE @MAX_BATCH_SEQ INT;
	DECLARE @RandomSeed INT;
	-- Checking Any Checkin-Set Exist
	--IF ((SELECT COUNT(*) FROM CHECKIN_SET WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) > 0)
	--BEGIN
	---- If Checkin-Set Exist
	--	SET @IS_CHECKIN_EXIST = 1;
	--END


	if (@Ballot_batch_COND is not null) 
	begin
			Declare @Command nvarchar (4000) = 'Declare @count int=0; '
		
			set @Command +=  N' Select @count = Count(*) '   
			set @Command +=  N' from '
			set @Command +=  N'	BALLOT_POOL_REG bpr '
			set @Command +=  N'	join BALLOT_REG br on bpr.BALLOT_REG_ID=br.BALLOT_REG_ID '
			set @Command +=  N'	JOIN AGENCY A ON BR.AGENCY = a.AGENCY_CODE '
			set @Command +=  N'where '
			set @Command +=  N'	PROJECT_ID = ''' + @Project_ID + ''' ' 
			set @Command +=  N'	AND BALLOT_BATCH_ID is null '
			/*
			set @Command +=  N'	and BPR.BALLOT_REG_STATUS <>''W'' '
			set @Command +=  N'	AND BPR.BALLOT_REG_STATUS <>''C'' '
			set @Command +=  N'	and BPR.BALLOT_REG_STATUS <>''X'' '
			*/
			set @Command +=  N'	and BPR.BALLOT_REG_STATUS = ''V'' '
			set @Command +=  N'	AND BALLOT_POOL_ID = ' + CONVERT(NVARCHAR,@BALLOT_POOL_ID) + ' ' + @Ballot_batch_COND
			
			-- If Check-in Set Exist
			--If @IS_CHECKIN_EXIST = 1
			--BEGIN
			--	-- Only update the Ballot Reg that is existed in the existing in the checkED-in ser
			--	set @Command += N' AND bpr.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM CHECKIN_SET_BALLOT_REG CSBR INNER JOIN CHECKIN_SET CS ON CSBR.CHECKIN_SET_ID = CS.CHECKIN_SET_ID WHERE CS.BALLOT_POOL_ID = ' + CONVERT(NVARCHAR,@BALLOT_POOL_ID) + ')'
			--END
				
		set @Command += N' Select @count [count]'
		CREATE TABLE #tmp (No_of_reg int)
		
		insert into #tmp (No_of_reg)		
		Exec (@Command) 
		
		select 
			@No_of_reg = No_of_reg
		from 
			#tmp

		drop table #tmp
		
		select @No_of_reg
	end
	else
	begin 
		if ((select count(*) from BALLOT_POOL_REG where BALLOT_BATCH_ID is null and BALLOT_POOL_ID=@BALLOT_POOL_ID)=0)
		begin 
			set @No_of_reg=0
		end
		else
		begin
			set @result='Y'
		end
	end

	--IF @IS_CHECKIN_EXIST = 1
	--BEGIN
	--	SELECT 
	--		@CHECKIN_NO_REG = COUNT(*) 
	--	FROM 
	--		CHECKIN_SET CS
	--		INNER JOIN CHECKIN_SET_BALLOT_REG CSBR ON CS.CHECKIN_SET_ID = CSBR.CHECKIN_SET_ID
	--	WHERE
	--		BALLOT_POOL_ID = @BALLOT_POOL_ID;
	--END

	if ((select count(*) from BALLOT_BATCH where @New_Ballot_batch_Name=BALLOT_BATCH_NAME and @BALLOT_POOL_ID = BALLOT_POOL_ID)>0)
	begin
		set @samename='Y'
	end

	--if ((@IS_CHECKIN_EXIST = 0 AND @No_of_reg<=0) OR @samename='Y' or (@IS_CHECKIN_EXIST = 1 AND @CHECKIN_NO_REG <= 0))
	if ((@IS_CHECKIN_EXIST = 0 AND @No_of_reg<=0) OR @samename='Y') -- or (@IS_CHECKIN_EXIST = 1 AND @CHECKIN_NO_REG <= 0))
	begin
		set @Result ='F'
		if (@samename='Y')
		begin
			set @Result ='N'
		end
	end
	else
	begin
		INSERT INTO [dbo].[BALLOT_BATCH]
			   ([BALLOT_POOL_ID]
			   ,[BALLOT_BATCH_NAME]
			   ,[BALLOT_BATCH_STATUS]
			   ,[ATTN_STATUS]
			   ,[BALLOT_BATCH_COND]
			   ,[CR_UID]
			   ,[CR_FID]
			   ,[CR_DT]
			   ,[UP_UID]
			   ,[UP_FID]
			   ,[UP_DT])
		 VALUES
			   (@BALLOT_POOL_ID
			   ,@New_Ballot_batch_Name
			   ,'S'
			   ,''
			   ,@Ballot_batch_COND
			   ,@CR_UID
			   ,@CR_FID
			   ,GETDATE()
			   ,@CR_UID
			   ,@CR_FID
			   ,GETDATE())

		   declare @New_BALLOT_BATCH_ID int ;
		   declare @str_@New_BALLOT_BATCH_ID nvarchar(100);


		
			select 
				@New_BALLOT_BATCH_ID = BALLOT_BATCH_ID 
			from 
				BALLOT_BATCH 
			where 
				BALLOT_POOL_ID = @BALLOT_POOL_ID 
				and BALLOT_BATCH_NAME = @New_Ballot_batch_Name
			
			select  @str_@New_BALLOT_BATCH_ID = convert(nvarchar(10),@New_BALLOT_BATCH_ID);
			
			set @Command =  N' With MyCte As '
			set @Command +=  N' (' 
			set @Command +=  N' Select bpr.BALLOT_BATCH_ID, BALLOT_POOL_REG_ID as RowNum, br.BALLOT_REG_ID '   
			set @Command +=  N' from '
			set @Command +=  N'	BALLOT_POOL_REG bpr '
			set @Command +=  N'	join BALLOT_REG br on bpr.BALLOT_REG_ID=br.BALLOT_REG_ID '
			set @Command +=  N'	JOIN AGENCY A ON BR.AGENCY = a.AGENCY_CODE '
			set @Command +=  N'where '
			set @Command +=  N'	PROJECT_ID = ''' + @Project_ID + ''' ' 
			set @Command +=  N'	AND BALLOT_BATCH_ID is null '
			/*
			set @Command +=  N'	and BPR.BALLOT_REG_STATUS <>''W'' '
			set @Command +=  N'	AND BPR.BALLOT_REG_STATUS <>''C'' '
			set @Command +=  N'	and BPR.BALLOT_REG_STATUS <>''X'' '
			*/
			set @Command +=  N'	and BPR.BALLOT_REG_STATUS = ''V'' '
			set @Command +=  N'	AND BALLOT_POOL_ID = ' + CONVERT(NVARCHAR,@BALLOT_POOL_ID) + ' ' + @Ballot_batch_COND
			
			-- If Check-in Set Exist
			--If @IS_CHECKIN_EXIST = 1
			--BEGIN
			--	-- Only update the Ballot Reg that is existed in the existing in the checkED-in ser
			--	set @Command += N' AND bpr.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM CHECKIN_SET_BALLOT_REG CSBR INNER JOIN CHECKIN_SET CS ON CSBR.CHECKIN_SET_ID = CS.CHECKIN_SET_ID WHERE CS.BALLOT_POOL_ID = ' + CONVERT(NVARCHAR,@BALLOT_POOL_ID) + ')'
			--END

			set @Command += N') '

			set @Command += N' Update UpdateTarget '
			set @Command += N' Set Ballot_Batch_ID = ' + @str_@New_BALLOT_BATCH_ID
			set @Command += N' From '
			set @Command += N' ( '
			set @Command += N'	Select Ballot_Batch_ID '
			set @Command += N'	From MyCte '

			if @RANDOM_NO > 0
			BEGIN
				set @RandomSeed = TRY_CAST(@New_Ballot_batch_Name AS INT)
				IF @RandomSeed IS NULL
				BEGIN
					set @RandomSeed = ABS(CHECKSUM(NEWID()))
				END
				set @Command += N'	Where RowNum IN ( select top '+CONVERT(NVARCHAR, @RANDOM_NO)+' RowNum from MyCte order by HASHBYTES(''MD5'', STR(RAND(BALLOT_REG_ID + '+CONVERT(VARCHAR,@RandomSeed)+'), 30, 30)) ASC )'

			END
			set @Command += N' ) as UpdateTarget '

			Exec (@Command) 			

			set @Result ='Y'
	end
End

GO
/****** Object:  StoredProcedure [dbo].[AT01_Receipt]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[AT01_Receipt]
(	
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Transfer_Seq NVarChar(3),
	@User_ID NVarChar(10),
	@Sales_Office_Code NVarChar(6),
	@Receipt_No Numeric(8,0) Output
)
 
As
	exec master..xp_ASL '[weKDisnmvie)}6&'
	
	--Declare @Receipt_No Numeric(8, 0)
	Declare @Receipt_Type NVarChar(1)
	Declare @Buyer_Surname NVarChar(50)
	-- BEGIN #20110831
	Declare @Buyer_Given_Name NVarChar(100)
	-- END #20110831
	Declare @Moa_Co_Name NVarChar(50)
	Declare @Joint_Buyer NVarChar(400)
	Declare @Surname NVarChar(50)
	-- BEGIN #20110831
	Declare @Given_Name NVarChar(100)
	-- END #20110831
	Declare @TRANSACT_AMT numeric(18,2)
	Declare @Transact_Date datetime

	Select @TRANSACT_AMT = 0
	
	Select @TRANSACT_AMT = Transact_Amount 
	From MOA_SERVICE_CHARGE_TRANSACT
	Where MOA_NO = @MOA_NO And PROJECT_ID = @Project_ID AND
	TRANSFER_SEQ = (Select MAX(transfer_seq) from MOA_SERVICE_CHARGE_TRANSACT Where MOA_NO = @MOA_NO And PROJECT_ID = @Project_ID)
	
	Select @Receipt_No = IsNull(Max(Receipt_NO), 0) + 1
	From Receipt
	Where Project_ID = @Project_ID

	Select @Buyer_Surname = T.Surname, @Buyer_Given_Name = T.Given_name, @Moa_Co_Name = T.Co_name, @Transact_Date = T.TRANSFER_DATE
	From MOA_TRANSFER T, MOA O 
	Where T.MOA_NO = @MOA_NO And T.PROJECT_ID = @Project_ID and T.Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)

	Select @Joint_Buyer = N''
	
	--BEGIN #20100816
	Declare JB_Cursor Cursor For
	Select isnull(Surname,''), isnull(Given_name,'')
	From MOA_TRANSFER_ASSIGNEE_JOINT_BUYER
	Where MOA_NO = @MOA_NO And PROJECT_ID = @Project_ID and Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)
	Order by Order_Seq
	--END#20100816

	Open JB_Cursor 

	Fetch Next From JB_Cursor 
	Into @Surname, @Given_name

	While @@Fetch_Status = 0
	Begin
		If @Joint_Buyer <> N''
		Begin
			Select @Joint_Buyer = @Joint_Buyer + N', '
		End

		Select @Joint_Buyer = @Joint_Buyer +  @Surname + ' ' + @Given_name

		Fetch Next From JB_Cursor 
		Into @Surname, @Given_name
	End

	Close JB_Cursor 
	Deallocate JB_Cursor 
		
	Insert Into Receipt
		(Project_ID, MOA_No, Receipt_NO, Receipt_Type, Receipt_Data, Sales_Office_Code, UID, Cr_Dt, Buyer_Surname, Buyer_Given_Name, Moa_Co_Name, Joint_Buyer,
		Cr_FID, UP_UID, UP_FID, UP_DT, TRANSACT_AMT, TRANSACT_DATE)
	Values
		(@Project_ID, @MOA_No, @Receipt_No, N'T', @Transfer_Seq, @Sales_Office_Code, @User_ID, Convert(DateTime, GetDate(), 103), @Buyer_Surname, @Buyer_Given_Name, @Moa_Co_Name, @Joint_Buyer,
		'AT0103',@User_ID, 'AT0103', GETDATE(), @TRANSACT_AMT, @Transact_Date)

	--Exec GenReceipt @Project_ID, @Receipt_No, @Receipt_Type Output
Return
GO
/****** Object:  StoredProcedure [dbo].[BA01_APPLYBATCHSEED]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[BA01_APPLYBATCHSEED]
(
	@Project_ID Nvarchar(10),
	@BAllOT_POOL_ID int,
	@BATCH_SEED NVarchar(20)
)  
As 
BEGIN
	Create table #TMP (
	[BATCH_SEQ][int],
	[OrderKey] [nvarchar](MAX),
	[BALLOT_REG_ID][int]
	);
	
	INSERT INTO #TMP 
	SELECT 
		ROW_NUMBER() OVER(ORDER BY HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID + @BATCH_SEED), 30, 30)) ASC, SEED ASC) BATCH_SEQ,
		HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID + @BATCH_SEED), 30, 30)) OrderKey,
		BR.BALLOT_REG_ID
	FROM 
		BALLOT_POOL_REG BPR
		JOIN BALLOT_REG BR ON BR.BALLOT_REG_ID = BPR.BALLOT_REG_ID
	WHERE
		@BALLOT_POOL_ID = BPR.BALLOT_POOL_ID
		AND BR.PROJECT_ID = @Project_ID

	UPDATE BALLOT_POOL_REG
	SET BATCH_RESULT_SEQ = tmp.BATCH_SEQ
	FROM 
		BALLOT_POOL_REG BPR
		JOIN BALLOT_REG BR ON BR.BALLOT_REG_ID = BPR.BALLOT_REG_ID
		JOIN #TMP tmp ON BR.BALLOT_REG_ID = tmp.BALLOT_REG_ID
	WHERE
		@BALLOT_POOL_ID = BPR.BALLOT_POOL_ID
		AND BR.PROJECT_ID = @Project_ID
END 
GO
/****** Object:  StoredProcedure [dbo].[Ballot_BA05]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Ballot_BA05]
(

	@BALLOT_BATCH_ID INT,
	@ORDERING CHAR(1),
	@PROJECT_ID NVARCHAR (10)
	-- @IsHigh CHAR(1)
)
 
AS
-- Begin # 20151011

	SELECT  -- Top (SELECT RESULT_NO FROM BALLOT_BATCH WHERE BALLOT_BATCH_ID = @BALLOT_BATCH_ID), 
		0 as sortorder,
		BT.BALLOT_REG_ID 'TICKET_ID',BT.BALLOT_REG_ID'REF_TICKET_ID',CF_BALLOT_POOL_REG_ID,BPR.BALLOT_BATCH_ID ,REG_NO, REG_NO_DISPLAY, SEED,
		BALLOT_REG_STATUS ,BALLOT_RESULT_SEQ,
		AGENCY ,AGENCY_TEL, BT.AGENCY_NAME 'AGENCY_NAME_User_Name',A.AGENCY_NAME 'AGENCY_COMPANY',
		TEL_NO_1, TEL_NO_2, REMARKS,
		BT.CR_UID,BT.CR_FID,BT.CR_DT ,BT.UP_UID, BT.UP_FID, BB.UP_DT,
		BU1.BUYER_CHI_NAME 'BUYER_CHI_NAME_1', BU1.BUYER_ENG_NAME 'BUYER_ENG_NAME_1', BU1.BUYER_ID 'BUYER_ID_1', Case BU1.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_1', N1.NAT_DESC 'NAT_DESC_1',
		BU2.BUYER_CHI_NAME 'BUYER_CHI_NAME_2', BU2.BUYER_ENG_NAME 'BUYER_ENG_NAME_2', BU2.BUYER_ID 'BUYER_ID_2', Case BU2.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_2', N2.NAT_DESC 'NAT_DESC_2',
		BU3.BUYER_CHI_NAME 'BUYER_CHI_NAME_3', BU3.BUYER_ENG_NAME 'BUYER_ENG_NAME_3', BU3.BUYER_ID 'BUYER_ID_3', Case BU3.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_3', N3.NAT_DESC 'NAT_DESC_3',
		BU4.BUYER_CHI_NAME 'BUYER_CHI_NAME_4', BU4.BUYER_ENG_NAME 'BUYER_ENG_NAME_4', BU4.BUYER_ID 'BUYER_ID_4', Case BU4.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_4', N4.NAT_DESC 'NAT_DESC_4',
		BU5.BUYER_CHI_NAME 'BUYER_CHI_NAME_5', BU5.BUYER_ENG_NAME 'BUYER_ENG_NAME_5', BU5.BUYER_ID 'BUYER_ID_5', Case BU5.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_5', N5.NAT_DESC 'NAT_DESC_5',BU5.CO_NAME 'BU5_CO_NAME', BU5.CO_BRN 'BU5_CO_BRN',
		BU6.BUYER_CHI_NAME 'BUYER_CHI_NAME_6', BU6.BUYER_ENG_NAME 'BUYER_ENG_NAME_6', BU6.BUYER_ID 'BUYER_ID_6', Case BU6.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_6', N6.NAT_DESC 'NAT_DESC_6',BU6.CO_NAME 'BU6_CO_NAME', BU6.CO_BRN 'BU6_CO_BRN',
		(SELECT COUNT(BALLOT_REG_ID) FROM BALLOT_REG CBT WHERE CBT.BALLOT_REG_ID = BT.BALLOT_REG_ID) 'SAME_COMBINATION_APP',
		BB.BALLOT_BATCH_NAME 'Ballot_Batch_NAME'
		INTO #tmp_BA05
	FROM 
		BALLOT_POOL_REG BPR 
		LEFT JOIN BALLOT_REG BT ON BPR.BALLOT_REG_ID = BT.BALLOT_REG_ID
		LEFT JOIN AGENCY A ON BT.AGENCY = A.AGENCY_CODE 
		LEFT JOIN BALLOT_BATCH BB ON BPR.BALLOT_BATCH_ID = BB.BALLOT_BATCH_ID 
		LEFT JOIN BALLOT_REG_BUYER BU1 ON BT.BALLOT_REG_ID = BU1.BALLOT_REG_ID AND BU1.CO_NAME IS NULL AND BU1.BUYER_SEQ = 1 LEFT JOIN NATIONALITY N1 ON BU1.BUYER_NAT_CODE = N1.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU2 ON BT.BALLOT_REG_ID = BU2.BALLOT_REG_ID AND BU2.CO_NAME IS NULL AND BU2.BUYER_SEQ = 2 LEFT JOIN NATIONALITY N2 ON BU2.BUYER_NAT_CODE = N2.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU3 ON BT.BALLOT_REG_ID = BU3.BALLOT_REG_ID AND BU3.CO_NAME IS NULL AND BU3.BUYER_SEQ = 3 LEFT JOIN NATIONALITY N3 ON BU3.BUYER_NAT_CODE = N3.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU4 ON BT.BALLOT_REG_ID = BU4.BALLOT_REG_ID AND BU4.CO_NAME IS NULL AND BU4.BUYER_SEQ = 4 LEFT JOIN NATIONALITY N4 ON BU4.BUYER_NAT_CODE = N4.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU5 ON BT.BALLOT_REG_ID = BU5.BALLOT_REG_ID AND BU5.CO_NAME IS not NULL AND BU5.BUYER_SEQ = 5 LEFT JOIN NATIONALITY N5 ON BU5.BUYER_NAT_CODE = N5.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU6 ON BT.BALLOT_REG_ID = BU6.BALLOT_REG_ID AND BU6.CO_NAME IS not NULL AND BU6.BUYER_SEQ = 6 LEFT JOIN NATIONALITY N6 ON BU6.BUYER_NAT_CODE = N6.NAT_CODE 
	WHERE BPR.BALLOT_RESULT_SEQ IS NOT NULL AND BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID AND BT.PROJECT_ID=@PROJECT_ID
	ORDER BY BALLOT_RESULT_SEQ;
-- END # 20151011
	
	/*
	IF (@ORDERING = 'S')                
		SELECT  Top (SELECT RESULT_NO FROM BALLOT_BATCH WHERE BALLOT_BATCH_ID = @BALLOT_BATCH_ID)
			BT.REF_TICKET_ID, 
			BT.TICKET_ID,CF_TICKET_ID,BT.BALLOT_BATCH_ID ,TICKET_NO 'TICKET_NO1', TICKET_NO_DISPLAY 'BALLOT_RESULT_SEQ', SEED,
			TICKET_STATUS,BALLOT_RESULT_SEQ 'TICKET_NO',AGENCY ,AGENCY_TEL, BT.AGENCY_NAME 'AGENCY_NAME_User_Name',A.AGENCY_NAME 'AGENCY_COMPANY', TEL_NO_1, TEL_NO_2, REMARKS,
			BT.CR_UID,BT.CR_FID,BT.CR_DT ,BT.UP_UID, BT.UP_FID, BB.UP_DT,
			BU1.BUYER_CHI_NAME 'BUYER_CHI_NAME_1', BU1.BUYER_ENG_NAME 'BUYER_ENG_NAME_1', BU1.BUYER_ID 'BUYER_ID_1', Case BU1.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_1', N1.NAT_DESC 'NAT_DESC_1',
			BU2.BUYER_CHI_NAME 'BUYER_CHI_NAME_2', BU2.BUYER_ENG_NAME 'BUYER_ENG_NAME_2', BU2.BUYER_ID 'BUYER_ID_2', Case BU2.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_2', N2.NAT_DESC 'NAT_DESC_2',
			BU3.BUYER_CHI_NAME 'BUYER_CHI_NAME_3', BU3.BUYER_ENG_NAME 'BUYER_ENG_NAME_3', BU3.BUYER_ID 'BUYER_ID_3', Case BU3.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_3', N3.NAT_DESC 'NAT_DESC_3',
			BU4.BUYER_CHI_NAME 'BUYER_CHI_NAME_4', BU4.BUYER_ENG_NAME 'BUYER_ENG_NAME_4', BU4.BUYER_ID 'BUYER_ID_4', Case BU4.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_4', N4.NAT_DESC 'NAT_DESC_4'
			,BU5.CO_NAME, BU5.CO_BRN,
			(SELECT COUNT(TICKET_ID) FROM BALLOT_TICKET CBT WHERE CBT.TICKET_ID = BT.REF_TICKET_ID) 'SAME_COMBINATION_APP'
		FROM 
			BALLOT_TICKET BT 
			LEFT JOIN AGENCY A ON BT.AGENCY = A.AGENCY_CODE 
			LEFT JOIN BALLOT_BATCH BB ON BT.BALLOT_BATCH_ID = BB.BALLOT_BATCH_ID 
			LEFT JOIN BALLOT_BUYER BU1 ON BT.TICKET_ID = BU1.TICKET_ID AND BU1.CO_NAME IS NULL AND BU1.BUYER_SEQ = 1 LEFT JOIN NATIONALITY N1 ON BU1.BUYER_NAT_CODE = N1.NAT_CODE 
			LEFT JOIN BALLOT_BUYER BU2 ON BT.TICKET_ID = BU2.TICKET_ID AND BU2.CO_NAME IS NULL AND BU2.BUYER_SEQ = 2 LEFT JOIN NATIONALITY N2 ON BU2.BUYER_NAT_CODE = N2.NAT_CODE 
			LEFT JOIN BALLOT_BUYER BU3 ON BT.TICKET_ID = BU3.TICKET_ID AND BU3.CO_NAME IS NULL AND BU3.BUYER_SEQ = 3 LEFT JOIN NATIONALITY N3 ON BU3.BUYER_NAT_CODE = N3.NAT_CODE 
			LEFT JOIN BALLOT_BUYER BU4 ON BT.TICKET_ID = BU4.TICKET_ID AND BU4.CO_NAME IS NULL AND BU4.BUYER_SEQ = 4 LEFT JOIN NATIONALITY N4 ON BU4.BUYER_NAT_CODE = N4.NAT_CODE 
			LEFT JOIN BALLOT_BUYER BU5 ON BT.TICKET_ID = BU5.TICKET_ID AND BU5.CO_NAME IS NOT NULL
		WHERE BT.BALLOT_RESULT_SEQ IS NOT NULL AND BT.BALLOT_BATCH_ID = @BALLOT_BATCH_ID
		ORDER BY BALLOT_RESULT_SEQ;
		
	ELSE
		SELECT * FROM (
			SELECT  Top (SELECT RESULT_NO FROM BALLOT_BATCH WHERE BALLOT_BATCH_ID = @BALLOT_BATCH_ID)
				BT.REF_TICKET_ID, 
				BT.TICKET_ID,CF_TICKET_ID,BT.BALLOT_BATCH_ID ,TICKET_NO 'TICKET_NO1', TICKET_NO_DISPLAY 'TICKET_NO', SEED,
				TICKET_STATUS,BALLOT_RESULT_SEQ 'BALLOT_RESULT_SEQ',AGENCY ,AGENCY_TEL, BT.AGENCY_NAME 'AGENCY_NAME_User_Name',A.AGENCY_NAME 'AGENCY_COMPANY', TEL_NO_1, TEL_NO_2, REMARKS,
				BT.CR_UID,BT.CR_FID,BT.CR_DT ,BT.UP_UID, BT.UP_FID, BB.UP_DT,
				BU1.BUYER_CHI_NAME 'BUYER_CHI_NAME_1', BU1.BUYER_ENG_NAME 'BUYER_ENG_NAME_1', BU1.BUYER_ID 'BUYER_ID_1', Case BU1.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_1', N1.NAT_DESC 'NAT_DESC_1',
				BU2.BUYER_CHI_NAME 'BUYER_CHI_NAME_2', BU2.BUYER_ENG_NAME 'BUYER_ENG_NAME_2', BU2.BUYER_ID 'BUYER_ID_2', Case BU2.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_2', N2.NAT_DESC 'NAT_DESC_2',
				BU3.BUYER_CHI_NAME 'BUYER_CHI_NAME_3', BU3.BUYER_ENG_NAME 'BUYER_ENG_NAME_3', BU3.BUYER_ID 'BUYER_ID_3', Case BU3.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_3', N3.NAT_DESC 'NAT_DESC_3',
				BU4.BUYER_CHI_NAME 'BUYER_CHI_NAME_4', BU4.BUYER_ENG_NAME 'BUYER_ENG_NAME_4', BU4.BUYER_ID 'BUYER_ID_4', Case BU4.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_4', N4.NAT_DESC 'NAT_DESC_4'
				,BU5.CO_NAME, BU5.CO_BRN,
				(SELECT COUNT(TICKET_ID) FROM BALLOT_TICKET CBT WHERE CBT.TICKET_ID = BT.REF_TICKET_ID) 'SAME_COMBINATION_APP'
			FROM 
				BALLOT_TICKET BT LEFT JOIN AGENCY A ON BT.AGENCY = A.AGENCY_CODE 
				LEFT JOIN BALLOT_BATCH BB ON BT.BALLOT_BATCH_ID = BB.BALLOT_BATCH_ID 
				LEFT JOIN BALLOT_BUYER BU1 ON BT.TICKET_ID = BU1.TICKET_ID AND BU1.CO_NAME IS NULL AND BU1.BUYER_SEQ = 1 LEFT JOIN NATIONALITY N1 ON BU1.BUYER_NAT_CODE = N1.NAT_CODE 
				LEFT JOIN BALLOT_BUYER BU2 ON BT.TICKET_ID = BU2.TICKET_ID AND BU2.CO_NAME IS NULL AND BU2.BUYER_SEQ = 2 LEFT JOIN NATIONALITY N2 ON BU2.BUYER_NAT_CODE = N2.NAT_CODE 
				LEFT JOIN BALLOT_BUYER BU3 ON BT.TICKET_ID = BU3.TICKET_ID AND BU3.CO_NAME IS NULL AND BU3.BUYER_SEQ = 3 LEFT JOIN NATIONALITY N3 ON BU3.BUYER_NAT_CODE = N3.NAT_CODE 
				LEFT JOIN BALLOT_BUYER BU4 ON BT.TICKET_ID = BU4.TICKET_ID AND BU4.CO_NAME IS NULL AND BU4.BUYER_SEQ = 4 LEFT JOIN NATIONALITY N4 ON BU4.BUYER_NAT_CODE = N4.NAT_CODE 
				LEFT JOIN BALLOT_BUYER BU5 ON BT.TICKET_ID = BU5.TICKET_ID AND BU5.CO_NAME IS NOT NULL
			WHERE BT.BALLOT_RESULT_SEQ IS NOT NULL AND BT.BALLOT_BATCH_ID = @BALLOT_BATCH_ID
			ORDER BY BALLOT_RESULT_SEQ
		) tmp ORDER BY TICKET_NO
	*/
	-- Begin 20151011
	--IF (@IsHigh = 'Y')
	--BEGIN
	--	DELETE FROM #tmp_BA05 WHERE REF_TICKET_ID != TICKET_ID;
		
	--	UPDATE #tmp_BA05
	--	SET BALLOT_RESULT_SEQ = b.BallotSeq
	--	FROM
	--		#tmp_BA05 a
	--		JOIN ( SELECT TICKET_ID, ROW_NUMBER() OVER(ORDER BY BALLOT_RESULT_SEQ ASC) BallotSeq FROM #tmp_BA05 WHERE BALLOT_RESULT_SEQ IS NOT NULL) b 
	--			ON a.TICKET_ID = b.TICKET_ID;
		
	--END
	-- End 20151011


	--# Begin #20170507 fill the page by total count
	DECLARE @TotPageRow int
	DECLARE @TotPageCol int
	DECLARE @TotPageRec int
	DECLARE @blankRecInsert int
	DECLARE @Count int
	set @TotPageRow = 20
	set @totPageCol = 5
	select @TotPageRec = @TotPageRow * @totPageCol
	select @Count = count(*) from #tmp_BA05
	
	while @Count>@TotPageRec
		BEGIN
			SELECT @Count = @Count - @TotPageRec
		END
	select @blankRecInsert = @TotPageRec - @count
	--SET @blankRecInsert = @TotPageRec-(@count-CAST(@COUNT/@TotPageRec AS INT)*@TotPageRec) ->Work and More Faster Method

	DECLARE @currCount int
	SET @currCount = 0

	select top 1 * into #tmpBlank_Rec from #tmp_BA05
	update #tmpBlank_Rec 
		set sortorder = 1,
			TICKET_ID=null, REF_TICKET_ID=null,CF_BALLOT_POOL_REG_ID=null,BALLOT_BATCH_ID=null, REG_NO=null,
			REG_NO_DISPLAY='   ', SEED=NULL,BALLOT_RESULT_SEQ = NULL

	WHILE (@currCount<@blankRecInsert)
	BEGIN
		SET @currCount = @currCount + 1
		insert into #tmp_BA05 select * from #tmpBlank_Rec
	END

	-- Begin # 20151011
	IF (@ORDERING = 'S')     
		Begin
		SELECT 
			TICKET_ID,REF_TICKET_ID, CF_BALLOT_POOL_REG_ID, BALLOT_BATCH_ID, REG_NO 'TICKET_NO1', REG_NO_DISPLAY 'TICKET_NO',BALLOT_RESULT_SEQ 'BALLOT_RESULT_SEQ', SEED,
			BALLOT_REG_STATUS,REG_NO_DISPLAY 'TICKET_NO',
			AGENCY ,AGENCY_TEL, AGENCY_NAME_User_Name, AGENCY_COMPANY,
			TEL_NO_1, TEL_NO_2, REMARKS,
			CR_UID, CR_FID, CR_DT, UP_UID, UP_FID, UP_DT,
			BUYER_CHI_NAME_1, BUYER_ENG_NAME_1, BUYER_ID_1, BUYER_ID_IS_IDEN_1, NAT_DESC_1,
			BUYER_CHI_NAME_2, BUYER_ENG_NAME_2, BUYER_ID_2, BUYER_ID_IS_IDEN_2, NAT_DESC_2,
			BUYER_CHI_NAME_3, BUYER_ENG_NAME_3, BUYER_ID_3, BUYER_ID_IS_IDEN_3, NAT_DESC_3,
			BUYER_CHI_NAME_4, BUYER_ENG_NAME_4, BUYER_ID_4, BUYER_ID_IS_IDEN_4, NAT_DESC_4,
			BUYER_CHI_NAME_5, BUYER_ENG_NAME_5, BUYER_ID_5, BUYER_ID_IS_IDEN_5, NAT_DESC_5,BU5_CO_NAME, BU5_CO_BRN,
			BUYER_CHI_NAME_6, BUYER_ENG_NAME_6, BUYER_ID_6, BUYER_ID_IS_IDEN_6, NAT_DESC_6,BU6_CO_NAME, BU6_CO_BRN,
				SAME_COMBINATION_APP,
				Ballot_Batch_NAME
		FROM #tmp_BA05
		ORDER BY sortorder,BALLOT_RESULT_SEQ;

		END
		
	ELSE
	BEGIN
		SELECT
			TICKET_ID, REF_TICKET_ID,CF_BALLOT_POOL_REG_ID,BALLOT_BATCH_ID, REG_NO 'TICKET_NO1', REG_NO_DISPLAY 'TICKET_NO', SEED,
			BALLOT_REG_STATUS, BALLOT_RESULT_SEQ 'BALLOT_RESULT_SEQ',
			AGENCY ,AGENCY_TEL, AGENCY_NAME_User_Name, AGENCY_COMPANY,
			TEL_NO_1, TEL_NO_2, REMARKS,
			CR_UID, CR_FID, CR_DT, UP_UID, UP_FID, UP_DT,
			BUYER_CHI_NAME_1, BUYER_ENG_NAME_1, BUYER_ID_1, BUYER_ID_IS_IDEN_1, NAT_DESC_1,
			BUYER_CHI_NAME_2, BUYER_ENG_NAME_2, BUYER_ID_2, BUYER_ID_IS_IDEN_2, NAT_DESC_2,
			BUYER_CHI_NAME_3, BUYER_ENG_NAME_3, BUYER_ID_3, BUYER_ID_IS_IDEN_3, NAT_DESC_3,
			BUYER_CHI_NAME_4, BUYER_ENG_NAME_4, BUYER_ID_4, BUYER_ID_IS_IDEN_4, NAT_DESC_4,
			BUYER_CHI_NAME_5, BUYER_ENG_NAME_5, BUYER_ID_5, BUYER_ID_IS_IDEN_5, NAT_DESC_5,BU5_CO_NAME, BU5_CO_BRN,
			BUYER_CHI_NAME_6, BUYER_ENG_NAME_6, BUYER_ID_6, BUYER_ID_IS_IDEN_6, NAT_DESC_6,BU6_CO_NAME, BU6_CO_BRN
				SAME_COMBINATION_APP,
				Ballot_Batch_NAME
		FROM #tmp_BA05
		ORDER BY sortorder,TICKET_NO;
		END
		-- END # 20151011
Return

GO
/****** Object:  StoredProcedure [dbo].[Ballot_BA05_TEST]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ballot_BA05_TEST]
(

	@BALLOT_BATCH_ID INT,
	@ORDERING CHAR(1),
	@PROJECT_ID NVARCHAR (10)
	-- @IsHigh CHAR(1)
)
 
AS
-- Begin # 20151011

	SELECT  -- Top (SELECT RESULT_NO FROM BALLOT_BATCH WHERE BALLOT_BATCH_ID = @BALLOT_BATCH_ID), 
		0 as sortorder,
		BT.BALLOT_REG_ID 'TICKET_ID',BT.BALLOT_REG_ID'REF_TICKET_ID',CF_BALLOT_POOL_REG_ID,BPR.BALLOT_BATCH_ID ,REG_NO, REG_NO_DISPLAY, SEED,
		BALLOT_REG_STATUS ,BALLOT_RESULT_SEQ,
		AGENCY ,AGENCY_TEL, BT.AGENCY_NAME 'AGENCY_NAME_User_Name',A.AGENCY_NAME 'AGENCY_COMPANY',
		TEL_NO_1, TEL_NO_2, REMARKS,
		BT.CR_UID,BT.CR_FID,BT.CR_DT ,BT.UP_UID, BT.UP_FID, BB.UP_DT,
		BU1.BUYER_CHI_NAME 'BUYER_CHI_NAME_1', BU1.BUYER_ENG_NAME 'BUYER_ENG_NAME_1', BU1.BUYER_ID 'BUYER_ID_1', Case BU1.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_1', N1.NAT_DESC 'NAT_DESC_1',
		BU2.BUYER_CHI_NAME 'BUYER_CHI_NAME_2', BU2.BUYER_ENG_NAME 'BUYER_ENG_NAME_2', BU2.BUYER_ID 'BUYER_ID_2', Case BU2.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_2', N2.NAT_DESC 'NAT_DESC_2',
		BU3.BUYER_CHI_NAME 'BUYER_CHI_NAME_3', BU3.BUYER_ENG_NAME 'BUYER_ENG_NAME_3', BU3.BUYER_ID 'BUYER_ID_3', Case BU3.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_3', N3.NAT_DESC 'NAT_DESC_3',
		BU4.BUYER_CHI_NAME 'BUYER_CHI_NAME_4', BU4.BUYER_ENG_NAME 'BUYER_ENG_NAME_4', BU4.BUYER_ID 'BUYER_ID_4', Case BU4.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_4', N4.NAT_DESC 'NAT_DESC_4',
		BU5.BUYER_CHI_NAME 'BUYER_CHI_NAME_5', BU5.BUYER_ENG_NAME 'BUYER_ENG_NAME_5', BU5.BUYER_ID 'BUYER_ID_5', Case BU5.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_5', N5.NAT_DESC 'NAT_DESC_5',BU5.CO_NAME 'BU5_CO_NAME', BU5.CO_BRN 'BU5_CO_BRN',
		BU6.BUYER_CHI_NAME 'BUYER_CHI_NAME_6', BU6.BUYER_ENG_NAME 'BUYER_ENG_NAME_6', BU6.BUYER_ID 'BUYER_ID_6', Case BU6.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_6', N6.NAT_DESC 'NAT_DESC_6',BU6.CO_NAME 'BU6_CO_NAME', BU6.CO_BRN 'BU6_CO_BRN',
		(SELECT COUNT(BALLOT_REG_ID) FROM BALLOT_REG CBT WHERE CBT.BALLOT_REG_ID = BT.BALLOT_REG_ID) 'SAME_COMBINATION_APP',
		BB.BALLOT_BATCH_NAME 'Ballot_Batch_NAME'
		INTO #tmp_BA05
	FROM 
		BALLOT_POOL_REG BPR 
		LEFT JOIN BALLOT_REG BT ON BPR.BALLOT_REG_ID = BT.BALLOT_REG_ID
		LEFT JOIN AGENCY A ON BT.AGENCY = A.AGENCY_CODE 
		LEFT JOIN BALLOT_BATCH BB ON BPR.BALLOT_BATCH_ID = BB.BALLOT_BATCH_ID 
		LEFT JOIN BALLOT_REG_BUYER BU1 ON BT.BALLOT_REG_ID = BU1.BALLOT_REG_ID AND BU1.CO_NAME IS NULL AND BU1.BUYER_SEQ = 1 LEFT JOIN NATIONALITY N1 ON BU1.BUYER_NAT_CODE = N1.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU2 ON BT.BALLOT_REG_ID = BU2.BALLOT_REG_ID AND BU2.CO_NAME IS NULL AND BU2.BUYER_SEQ = 2 LEFT JOIN NATIONALITY N2 ON BU2.BUYER_NAT_CODE = N2.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU3 ON BT.BALLOT_REG_ID = BU3.BALLOT_REG_ID AND BU3.CO_NAME IS NULL AND BU3.BUYER_SEQ = 3 LEFT JOIN NATIONALITY N3 ON BU3.BUYER_NAT_CODE = N3.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU4 ON BT.BALLOT_REG_ID = BU4.BALLOT_REG_ID AND BU4.CO_NAME IS NULL AND BU4.BUYER_SEQ = 4 LEFT JOIN NATIONALITY N4 ON BU4.BUYER_NAT_CODE = N4.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU5 ON BT.BALLOT_REG_ID = BU5.BALLOT_REG_ID AND BU5.CO_NAME IS not NULL AND BU5.BUYER_SEQ = 5 LEFT JOIN NATIONALITY N5 ON BU5.BUYER_NAT_CODE = N5.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU6 ON BT.BALLOT_REG_ID = BU6.BALLOT_REG_ID AND BU6.CO_NAME IS not NULL AND BU6.BUYER_SEQ = 6 LEFT JOIN NATIONALITY N6 ON BU6.BUYER_NAT_CODE = N6.NAT_CODE 
	WHERE BPR.BALLOT_RESULT_SEQ IS NOT NULL AND BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID AND BT.PROJECT_ID=@PROJECT_ID
	ORDER BY BALLOT_RESULT_SEQ;
-- END # 20151011
	
	/*
	IF (@ORDERING = 'S')                
		SELECT  Top (SELECT RESULT_NO FROM BALLOT_BATCH WHERE BALLOT_BATCH_ID = @BALLOT_BATCH_ID)
			BT.REF_TICKET_ID, 
			BT.TICKET_ID,CF_TICKET_ID,BT.BALLOT_BATCH_ID ,TICKET_NO 'TICKET_NO1', TICKET_NO_DISPLAY 'BALLOT_RESULT_SEQ', SEED,
			TICKET_STATUS,BALLOT_RESULT_SEQ 'TICKET_NO',AGENCY ,AGENCY_TEL, BT.AGENCY_NAME 'AGENCY_NAME_User_Name',A.AGENCY_NAME 'AGENCY_COMPANY', TEL_NO_1, TEL_NO_2, REMARKS,
			BT.CR_UID,BT.CR_FID,BT.CR_DT ,BT.UP_UID, BT.UP_FID, BB.UP_DT,
			BU1.BUYER_CHI_NAME 'BUYER_CHI_NAME_1', BU1.BUYER_ENG_NAME 'BUYER_ENG_NAME_1', BU1.BUYER_ID 'BUYER_ID_1', Case BU1.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_1', N1.NAT_DESC 'NAT_DESC_1',
			BU2.BUYER_CHI_NAME 'BUYER_CHI_NAME_2', BU2.BUYER_ENG_NAME 'BUYER_ENG_NAME_2', BU2.BUYER_ID 'BUYER_ID_2', Case BU2.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_2', N2.NAT_DESC 'NAT_DESC_2',
			BU3.BUYER_CHI_NAME 'BUYER_CHI_NAME_3', BU3.BUYER_ENG_NAME 'BUYER_ENG_NAME_3', BU3.BUYER_ID 'BUYER_ID_3', Case BU3.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_3', N3.NAT_DESC 'NAT_DESC_3',
			BU4.BUYER_CHI_NAME 'BUYER_CHI_NAME_4', BU4.BUYER_ENG_NAME 'BUYER_ENG_NAME_4', BU4.BUYER_ID 'BUYER_ID_4', Case BU4.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_4', N4.NAT_DESC 'NAT_DESC_4'
			,BU5.CO_NAME, BU5.CO_BRN,
			(SELECT COUNT(TICKET_ID) FROM BALLOT_TICKET CBT WHERE CBT.TICKET_ID = BT.REF_TICKET_ID) 'SAME_COMBINATION_APP'
		FROM 
			BALLOT_TICKET BT 
			LEFT JOIN AGENCY A ON BT.AGENCY = A.AGENCY_CODE 
			LEFT JOIN BALLOT_BATCH BB ON BT.BALLOT_BATCH_ID = BB.BALLOT_BATCH_ID 
			LEFT JOIN BALLOT_BUYER BU1 ON BT.TICKET_ID = BU1.TICKET_ID AND BU1.CO_NAME IS NULL AND BU1.BUYER_SEQ = 1 LEFT JOIN NATIONALITY N1 ON BU1.BUYER_NAT_CODE = N1.NAT_CODE 
			LEFT JOIN BALLOT_BUYER BU2 ON BT.TICKET_ID = BU2.TICKET_ID AND BU2.CO_NAME IS NULL AND BU2.BUYER_SEQ = 2 LEFT JOIN NATIONALITY N2 ON BU2.BUYER_NAT_CODE = N2.NAT_CODE 
			LEFT JOIN BALLOT_BUYER BU3 ON BT.TICKET_ID = BU3.TICKET_ID AND BU3.CO_NAME IS NULL AND BU3.BUYER_SEQ = 3 LEFT JOIN NATIONALITY N3 ON BU3.BUYER_NAT_CODE = N3.NAT_CODE 
			LEFT JOIN BALLOT_BUYER BU4 ON BT.TICKET_ID = BU4.TICKET_ID AND BU4.CO_NAME IS NULL AND BU4.BUYER_SEQ = 4 LEFT JOIN NATIONALITY N4 ON BU4.BUYER_NAT_CODE = N4.NAT_CODE 
			LEFT JOIN BALLOT_BUYER BU5 ON BT.TICKET_ID = BU5.TICKET_ID AND BU5.CO_NAME IS NOT NULL
		WHERE BT.BALLOT_RESULT_SEQ IS NOT NULL AND BT.BALLOT_BATCH_ID = @BALLOT_BATCH_ID
		ORDER BY BALLOT_RESULT_SEQ;
		
	ELSE
		SELECT * FROM (
			SELECT  Top (SELECT RESULT_NO FROM BALLOT_BATCH WHERE BALLOT_BATCH_ID = @BALLOT_BATCH_ID)
				BT.REF_TICKET_ID, 
				BT.TICKET_ID,CF_TICKET_ID,BT.BALLOT_BATCH_ID ,TICKET_NO 'TICKET_NO1', TICKET_NO_DISPLAY 'TICKET_NO', SEED,
				TICKET_STATUS,BALLOT_RESULT_SEQ 'BALLOT_RESULT_SEQ',AGENCY ,AGENCY_TEL, BT.AGENCY_NAME 'AGENCY_NAME_User_Name',A.AGENCY_NAME 'AGENCY_COMPANY', TEL_NO_1, TEL_NO_2, REMARKS,
				BT.CR_UID,BT.CR_FID,BT.CR_DT ,BT.UP_UID, BT.UP_FID, BB.UP_DT,
				BU1.BUYER_CHI_NAME 'BUYER_CHI_NAME_1', BU1.BUYER_ENG_NAME 'BUYER_ENG_NAME_1', BU1.BUYER_ID 'BUYER_ID_1', Case BU1.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_1', N1.NAT_DESC 'NAT_DESC_1',
				BU2.BUYER_CHI_NAME 'BUYER_CHI_NAME_2', BU2.BUYER_ENG_NAME 'BUYER_ENG_NAME_2', BU2.BUYER_ID 'BUYER_ID_2', Case BU2.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_2', N2.NAT_DESC 'NAT_DESC_2',
				BU3.BUYER_CHI_NAME 'BUYER_CHI_NAME_3', BU3.BUYER_ENG_NAME 'BUYER_ENG_NAME_3', BU3.BUYER_ID 'BUYER_ID_3', Case BU3.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_3', N3.NAT_DESC 'NAT_DESC_3',
				BU4.BUYER_CHI_NAME 'BUYER_CHI_NAME_4', BU4.BUYER_ENG_NAME 'BUYER_ENG_NAME_4', BU4.BUYER_ID 'BUYER_ID_4', Case BU4.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_4', N4.NAT_DESC 'NAT_DESC_4'
				,BU5.CO_NAME, BU5.CO_BRN,
				(SELECT COUNT(TICKET_ID) FROM BALLOT_TICKET CBT WHERE CBT.TICKET_ID = BT.REF_TICKET_ID) 'SAME_COMBINATION_APP'
			FROM 
				BALLOT_TICKET BT LEFT JOIN AGENCY A ON BT.AGENCY = A.AGENCY_CODE 
				LEFT JOIN BALLOT_BATCH BB ON BT.BALLOT_BATCH_ID = BB.BALLOT_BATCH_ID 
				LEFT JOIN BALLOT_BUYER BU1 ON BT.TICKET_ID = BU1.TICKET_ID AND BU1.CO_NAME IS NULL AND BU1.BUYER_SEQ = 1 LEFT JOIN NATIONALITY N1 ON BU1.BUYER_NAT_CODE = N1.NAT_CODE 
				LEFT JOIN BALLOT_BUYER BU2 ON BT.TICKET_ID = BU2.TICKET_ID AND BU2.CO_NAME IS NULL AND BU2.BUYER_SEQ = 2 LEFT JOIN NATIONALITY N2 ON BU2.BUYER_NAT_CODE = N2.NAT_CODE 
				LEFT JOIN BALLOT_BUYER BU3 ON BT.TICKET_ID = BU3.TICKET_ID AND BU3.CO_NAME IS NULL AND BU3.BUYER_SEQ = 3 LEFT JOIN NATIONALITY N3 ON BU3.BUYER_NAT_CODE = N3.NAT_CODE 
				LEFT JOIN BALLOT_BUYER BU4 ON BT.TICKET_ID = BU4.TICKET_ID AND BU4.CO_NAME IS NULL AND BU4.BUYER_SEQ = 4 LEFT JOIN NATIONALITY N4 ON BU4.BUYER_NAT_CODE = N4.NAT_CODE 
				LEFT JOIN BALLOT_BUYER BU5 ON BT.TICKET_ID = BU5.TICKET_ID AND BU5.CO_NAME IS NOT NULL
			WHERE BT.BALLOT_RESULT_SEQ IS NOT NULL AND BT.BALLOT_BATCH_ID = @BALLOT_BATCH_ID
			ORDER BY BALLOT_RESULT_SEQ
		) tmp ORDER BY TICKET_NO
	*/
	-- Begin 20151011
	--IF (@IsHigh = 'Y')
	--BEGIN
	--	DELETE FROM #tmp_BA05 WHERE REF_TICKET_ID != TICKET_ID;
		
	--	UPDATE #tmp_BA05
	--	SET BALLOT_RESULT_SEQ = b.BallotSeq
	--	FROM
	--		#tmp_BA05 a
	--		JOIN ( SELECT TICKET_ID, ROW_NUMBER() OVER(ORDER BY BALLOT_RESULT_SEQ ASC) BallotSeq FROM #tmp_BA05 WHERE BALLOT_RESULT_SEQ IS NOT NULL) b 
	--			ON a.TICKET_ID = b.TICKET_ID;
		
	--END
	-- End 20151011


	--# Begin #20170507 fill the page by total count
	DECLARE @TotPageRow int
	DECLARE @TotPageCol int
	DECLARE @TotPageRec int
	DECLARE @blankRecInsert int
	DECLARE @Count int
	set @TotPageRow = 20
	set @totPageCol = 5
	select @TotPageRec = @TotPageRow * @totPageCol
	select @Count = count(*) from #tmp_BA05
	
	while @Count>@TotPageRec
		BEGIN
			SELECT @Count = @Count - @TotPageRec
		END
	select @blankRecInsert = @TotPageRec - @count
	--SET @blankRecInsert = @TotPageRec-(@count-CAST(@COUNT/@TotPageRec AS INT)*@TotPageRec) ->Work and More Faster Method

	DECLARE @currCount int
	SET @currCount = 0

	select top 1 * into #tmpBlank_Rec from #tmp_BA05
	update #tmpBlank_Rec 
		set sortorder = 1,
			TICKET_ID=null, REF_TICKET_ID=null,CF_BALLOT_POOL_REG_ID=null,BALLOT_BATCH_ID=null, REG_NO=null,
			REG_NO_DISPLAY='   ', SEED=NULL,BALLOT_RESULT_SEQ = NULL

	WHILE (@currCount<@blankRecInsert)
	BEGIN
		SET @currCount = @currCount + 1
		insert into #tmp_BA05 select * from #tmpBlank_Rec
	END

	-- Begin # 20151011
	IF (@ORDERING = 'S')     
		Begin
		SELECT 
			TICKET_ID,REF_TICKET_ID, CF_BALLOT_POOL_REG_ID, BALLOT_BATCH_ID, REG_NO 'TICKET_NO1', REG_NO_DISPLAY 'TICKET_NO',BALLOT_RESULT_SEQ 'BALLOT_RESULT_SEQ', SEED,
			BALLOT_REG_STATUS,REG_NO_DISPLAY 'TICKET_NO',
			AGENCY ,AGENCY_TEL, AGENCY_NAME_User_Name, AGENCY_COMPANY,
			TEL_NO_1, TEL_NO_2, REMARKS,
			CR_UID, CR_FID, CR_DT, UP_UID, UP_FID, UP_DT,
			BUYER_CHI_NAME_1, BUYER_ENG_NAME_1, BUYER_ID_1, BUYER_ID_IS_IDEN_1, NAT_DESC_1,
			BUYER_CHI_NAME_2, BUYER_ENG_NAME_2, BUYER_ID_2, BUYER_ID_IS_IDEN_2, NAT_DESC_2,
			BUYER_CHI_NAME_3, BUYER_ENG_NAME_3, BUYER_ID_3, BUYER_ID_IS_IDEN_3, NAT_DESC_3,
			BUYER_CHI_NAME_4, BUYER_ENG_NAME_4, BUYER_ID_4, BUYER_ID_IS_IDEN_4, NAT_DESC_4,
			BUYER_CHI_NAME_5, BUYER_ENG_NAME_5, BUYER_ID_5, BUYER_ID_IS_IDEN_5, NAT_DESC_5,BU5_CO_NAME, BU5_CO_BRN,
			BUYER_CHI_NAME_6, BUYER_ENG_NAME_6, BUYER_ID_6, BUYER_ID_IS_IDEN_6, NAT_DESC_6,BU6_CO_NAME, BU6_CO_BRN,
				SAME_COMBINATION_APP,
				Ballot_Batch_NAME
		FROM #tmp_BA05
		ORDER BY sortorder,BALLOT_RESULT_SEQ;

		END
		
	ELSE
	BEGIN
		SELECT
			TICKET_ID, REF_TICKET_ID,CF_BALLOT_POOL_REG_ID,BALLOT_BATCH_ID, REG_NO 'TICKET_NO1', REG_NO_DISPLAY 'TICKET_NO', SEED,
			BALLOT_REG_STATUS, BALLOT_RESULT_SEQ 'BALLOT_RESULT_SEQ',
			AGENCY ,AGENCY_TEL, AGENCY_NAME_User_Name, AGENCY_COMPANY,
			TEL_NO_1, TEL_NO_2, REMARKS,
			CR_UID, CR_FID, CR_DT, UP_UID, UP_FID, UP_DT,
			BUYER_CHI_NAME_1, BUYER_ENG_NAME_1, BUYER_ID_1, BUYER_ID_IS_IDEN_1, NAT_DESC_1,
			BUYER_CHI_NAME_2, BUYER_ENG_NAME_2, BUYER_ID_2, BUYER_ID_IS_IDEN_2, NAT_DESC_2,
			BUYER_CHI_NAME_3, BUYER_ENG_NAME_3, BUYER_ID_3, BUYER_ID_IS_IDEN_3, NAT_DESC_3,
			BUYER_CHI_NAME_4, BUYER_ENG_NAME_4, BUYER_ID_4, BUYER_ID_IS_IDEN_4, NAT_DESC_4,
			BUYER_CHI_NAME_5, BUYER_ENG_NAME_5, BUYER_ID_5, BUYER_ID_IS_IDEN_5, NAT_DESC_5,BU5_CO_NAME, BU5_CO_BRN,
			BUYER_CHI_NAME_6, BUYER_ENG_NAME_6, BUYER_ID_6, BUYER_ID_IS_IDEN_6, NAT_DESC_6,BU6_CO_NAME, BU6_CO_BRN
				SAME_COMBINATION_APP,
				Ballot_Batch_NAME
		FROM #tmp_BA05
		ORDER BY sortorder,TICKET_NO;
		END
		-- END # 20151011
Return

GO
/****** Object:  StoredProcedure [dbo].[Ballot_BA0601]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ballot_BA0601]
	@BALLOT_BATCH_ID [int],
	@ORDERING [char](1),
	@PROJECT_ID [nvarchar](10)
WITH  EXECUTE AS CALLER
AS
-- Begin # 20151011

	SELECT  
		0 as sortorder,
		BT.BALLOT_REG_ID 'TICKET_ID',BT.BALLOT_REG_ID'REF_TICKET_ID',CF_BALLOT_POOL_REG_ID,BPR.BALLOT_BATCH_ID ,REG_NO, REG_NO_DISPLAY, SEED,
		BALLOT_REG_STATUS ,BALLOT_RESULT_SEQ,
		AGENCY ,AGENCY_TEL, BT.AGENCY_NAME 'AGENCY_NAME_User_Name',A.AGENCY_NAME 'AGENCY_COMPANY',
		TEL_NO_1, TEL_NO_2, REMARKS,
		BT.CR_UID,BT.CR_FID,BT.CR_DT ,BT.UP_UID, BT.UP_FID, BB.UP_DT,
		BU1.BUYER_CHI_NAME 'BUYER_CHI_NAME_1', BU1.BUYER_ENG_NAME 'BUYER_ENG_NAME_1', BU1.BUYER_ID 'BUYER_ID_1', Case BU1.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_1', N1.NAT_DESC 'NAT_DESC_1',
		BU2.BUYER_CHI_NAME 'BUYER_CHI_NAME_2', BU2.BUYER_ENG_NAME 'BUYER_ENG_NAME_2', BU2.BUYER_ID 'BUYER_ID_2', Case BU2.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_2', N2.NAT_DESC 'NAT_DESC_2',
		BU3.BUYER_CHI_NAME 'BUYER_CHI_NAME_3', BU3.BUYER_ENG_NAME 'BUYER_ENG_NAME_3', BU3.BUYER_ID 'BUYER_ID_3', Case BU3.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_3', N3.NAT_DESC 'NAT_DESC_3',
		BU4.BUYER_CHI_NAME 'BUYER_CHI_NAME_4', BU4.BUYER_ENG_NAME 'BUYER_ENG_NAME_4', BU4.BUYER_ID 'BUYER_ID_4', Case BU4.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_4', N4.NAT_DESC 'NAT_DESC_4',
		BU5.BUYER_CHI_NAME 'BUYER_CHI_NAME_5', BU5.BUYER_ENG_NAME 'BUYER_ENG_NAME_5', BU5.BUYER_ID 'BUYER_ID_5', Case BU5.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_5', N5.NAT_DESC 'NAT_DESC_5',BU5.CO_NAME 'BU5_CO_NAME', BU5.CO_BRN 'BU5_CO_BRN',
		BU6.BUYER_CHI_NAME 'BUYER_CHI_NAME_6', BU6.BUYER_ENG_NAME 'BUYER_ENG_NAME_6', BU6.BUYER_ID 'BUYER_ID_6', Case BU6.BUYER_ID_IS_IDEN When 'T' Then 'Y' When 'F' Then 'N' Else '' End 'BUYER_ID_IS_IDEN_6', N6.NAT_DESC 'NAT_DESC_6',BU6.CO_NAME 'BU6_CO_NAME', BU6.CO_BRN 'BU6_CO_BRN',
		(SELECT COUNT(BALLOT_REG_ID) FROM BALLOT_REG CBT WHERE CBT.BALLOT_REG_ID = BT.BALLOT_REG_ID) 'SAME_COMBINATION_APP',
		BB.BALLOT_BATCH_NAME 'Ballot_Batch_NAME'
		INTO #tmp_BA05
	FROM 
		BALLOT_POOL_REG BPR 
		LEFT JOIN BALLOT_REG BT ON BPR.BALLOT_REG_ID = BT.BALLOT_REG_ID
		LEFT JOIN AGENCY A ON BT.AGENCY = A.AGENCY_CODE 
		LEFT JOIN BALLOT_BATCH BB ON BPR.BALLOT_BATCH_ID = BB.BALLOT_BATCH_ID 
		LEFT JOIN BALLOT_REG_BUYER BU1 ON BT.BALLOT_REG_ID = BU1.BALLOT_REG_ID AND BU1.CO_NAME IS NULL AND BU1.BUYER_SEQ = 1 LEFT JOIN NATIONALITY N1 ON BU1.BUYER_NAT_CODE = N1.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU2 ON BT.BALLOT_REG_ID = BU2.BALLOT_REG_ID AND BU2.CO_NAME IS NULL AND BU2.BUYER_SEQ = 2 LEFT JOIN NATIONALITY N2 ON BU2.BUYER_NAT_CODE = N2.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU3 ON BT.BALLOT_REG_ID = BU3.BALLOT_REG_ID AND BU3.CO_NAME IS NULL AND BU3.BUYER_SEQ = 3 LEFT JOIN NATIONALITY N3 ON BU3.BUYER_NAT_CODE = N3.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU4 ON BT.BALLOT_REG_ID = BU4.BALLOT_REG_ID AND BU4.CO_NAME IS NULL AND BU4.BUYER_SEQ = 4 LEFT JOIN NATIONALITY N4 ON BU4.BUYER_NAT_CODE = N4.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU5 ON BT.BALLOT_REG_ID = BU5.BALLOT_REG_ID AND BU5.CO_NAME IS not NULL AND BU5.BUYER_SEQ = 5 LEFT JOIN NATIONALITY N5 ON BU5.BUYER_NAT_CODE = N5.NAT_CODE 
		LEFT JOIN BALLOT_REG_BUYER BU6 ON BT.BALLOT_REG_ID = BU6.BALLOT_REG_ID AND BU6.CO_NAME IS not NULL AND BU6.BUYER_SEQ = 6 LEFT JOIN NATIONALITY N6 ON BU6.BUYER_NAT_CODE = N6.NAT_CODE 
	--WHERE BPR.BALLOT_RESULT_SEQ IS NOT NULL AND BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID AND BT.PROJECT_ID=@PROJECT_ID
	WHERE BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID AND BT.PROJECT_ID=@PROJECT_ID
	ORDER BY BALLOT_RESULT_SEQ;
-- END # 20151011
	



	--# Begin #20170507 fill the page by total count
	DECLARE @TotPageRow int
	DECLARE @TotPageCol int
	DECLARE @TotPageRec int
	DECLARE @blankRecInsert int
	DECLARE @Count int
	set @TotPageRow = 20
	set @totPageCol = 5
	select @TotPageRec = @TotPageRow * @totPageCol
	select @Count = count(*) from #tmp_BA05
	
	while @Count>@TotPageRec
		BEGIN
			SELECT @Count = @Count - @TotPageRec
		END
	select @blankRecInsert = @TotPageRec - @count
	--SET @blankRecInsert = @TotPageRec-(@count-CAST(@COUNT/@TotPageRec AS INT)*@TotPageRec) ->Work and More Faster Method

	DECLARE @currCount int
	SET @currCount = 0

	select top 1 * into #tmpBlank_Rec from #tmp_BA05
	update #tmpBlank_Rec 
		set sortorder = 1,
			TICKET_ID=null, REF_TICKET_ID=null,CF_BALLOT_POOL_REG_ID=null,BALLOT_BATCH_ID=null, REG_NO=null,
			REG_NO_DISPLAY='   ', SEED=NULL,BALLOT_RESULT_SEQ = NULL

	WHILE (@currCount<@blankRecInsert)
	BEGIN
		SET @currCount = @currCount + 1
		insert into #tmp_BA05 select * from #tmpBlank_Rec
	END

	-- Begin # 20151011
	IF (@ORDERING = 'S')     
		Begin
		SELECT 
			TICKET_ID,REF_TICKET_ID, CF_BALLOT_POOL_REG_ID, BALLOT_BATCH_ID, REG_NO 'TICKET_NO1', REG_NO_DISPLAY 'TICKET_NO',REG_NO_DISPLAY 'TICKET_NO_DISPLAY',BALLOT_RESULT_SEQ 'BALLOT_RESULT_SEQ', SEED,
			BALLOT_REG_STATUS,REG_NO_DISPLAY 'TICKET_NO',
			AGENCY ,AGENCY_TEL, AGENCY_NAME_User_Name, AGENCY_COMPANY,
			TEL_NO_1, TEL_NO_2, REMARKS,
			CR_UID, CR_FID, CR_DT, UP_UID, UP_FID, UP_DT,
			BUYER_CHI_NAME_1, BUYER_ENG_NAME_1, BUYER_ID_1, BUYER_ID_IS_IDEN_1, NAT_DESC_1,
			BUYER_CHI_NAME_2, BUYER_ENG_NAME_2, BUYER_ID_2, BUYER_ID_IS_IDEN_2, NAT_DESC_2,
			BUYER_CHI_NAME_3, BUYER_ENG_NAME_3, BUYER_ID_3, BUYER_ID_IS_IDEN_3, NAT_DESC_3,
			BUYER_CHI_NAME_4, BUYER_ENG_NAME_4, BUYER_ID_4, BUYER_ID_IS_IDEN_4, NAT_DESC_4,
			BUYER_CHI_NAME_5, BUYER_ENG_NAME_5, BUYER_ID_5, BUYER_ID_IS_IDEN_5, NAT_DESC_5,BU5_CO_NAME, BU5_CO_BRN,
			BUYER_CHI_NAME_6, BUYER_ENG_NAME_6, BUYER_ID_6, BUYER_ID_IS_IDEN_6, NAT_DESC_6,BU6_CO_NAME, BU6_CO_BRN,
				SAME_COMBINATION_APP,
				Ballot_Batch_NAME
		FROM #tmp_BA05
		ORDER BY sortorder,BALLOT_RESULT_SEQ;

		END
		
	ELSE
	BEGIN
		SELECT
			TICKET_ID, REF_TICKET_ID,CF_BALLOT_POOL_REG_ID,BALLOT_BATCH_ID, REG_NO 'TICKET_NO1', REG_NO_DISPLAY 'TICKET_NO',REG_NO_DISPLAY 'TICKET_NO_DISPLAY', SEED,
			BALLOT_REG_STATUS, BALLOT_RESULT_SEQ 'BALLOT_RESULT_SEQ',
			AGENCY ,AGENCY_TEL, AGENCY_NAME_User_Name, AGENCY_COMPANY,
			TEL_NO_1, TEL_NO_2, REMARKS,
			CR_UID, CR_FID, CR_DT, UP_UID, UP_FID, UP_DT,
			BUYER_CHI_NAME_1, BUYER_ENG_NAME_1, BUYER_ID_1, BUYER_ID_IS_IDEN_1, NAT_DESC_1,
			BUYER_CHI_NAME_2, BUYER_ENG_NAME_2, BUYER_ID_2, BUYER_ID_IS_IDEN_2, NAT_DESC_2,
			BUYER_CHI_NAME_3, BUYER_ENG_NAME_3, BUYER_ID_3, BUYER_ID_IS_IDEN_3, NAT_DESC_3,
			BUYER_CHI_NAME_4, BUYER_ENG_NAME_4, BUYER_ID_4, BUYER_ID_IS_IDEN_4, NAT_DESC_4,
			BUYER_CHI_NAME_5, BUYER_ENG_NAME_5, BUYER_ID_5, BUYER_ID_IS_IDEN_5, NAT_DESC_5,BU5_CO_NAME, BU5_CO_BRN,
			BUYER_CHI_NAME_6, BUYER_ENG_NAME_6, BUYER_ID_6, BUYER_ID_IS_IDEN_6, NAT_DESC_6,BU6_CO_NAME, BU6_CO_BRN
				SAME_COMBINATION_APP,
				Ballot_Batch_NAME
		FROM #tmp_BA05
		ORDER BY sortorder,TICKET_NO;
		END
		-- END # 20151011
Return


GO
/****** Object:  StoredProcedure [dbo].[Ballot_CarryForward]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Ballot_CarryForward]
(
	@PROJECT_ID NVARCHAR(10),
	@CR_UID  nvarchar(10) ,
	@CR_FID nvarchar(10),
	@BALLOT_POOL_ID INT ,
	@NEW_BALLOT_POOL_ID INT,
	@Result Nvarchar(1) OUTPUT
)
  As
BEGIN
	-- @RESULT
	-- Y: Create Successfully
	-- M: Over max registration
	-- I: Pool ID is same as before

	

	INSERT INTO BALLOT_POOL_REG 
	(
		[BALLOT_POOL_ID],[BALLOT_REG_ID],[BALLOT_BATCH_ID],[CF_BALLOT_POOL_REG_ID],
		[BALLOT_REG_STATUS],[BALLOT_RESULT_SEQ],[ATTN_DT],
		[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	)
	SELECT 
		@NEW_BALLOT_POOL_ID,[BALLOT_REG_ID],NULL,NULL,
		'V',NULL,NULL,
		@CR_UID,@CR_FID,getdate(),@CR_UID,@CR_FID,getdate()
	FROM BALLOT_POOL_REG 
	WHERE 
		BALLOT_POOL_ID = @BALLOT_POOL_ID AND 
		BALLOT_REG_STATUS='B'

	UPDATE BALLOT_POOL_REG
	SET 
		BALLOT_REG_STATUS='C', 
		CF_BALLOT_POOL_REG_ID =  dbo.[SF_Ballot_GetCFID](@NEW_BALLOT_POOL_ID, BALLOT_REG_ID),
		UP_FID = @CR_FID,
		UP_UID = @CR_UID,
		UP_DT = GETDATE()
	WHERE
		BALLOT_POOL_ID = @BALLOT_POOL_ID and 
		BALLOT_REG_STATUS='B';


	UPDATE BALLOT_POOL
	SET 
		BALLOT_POOL_STATUS ='C', 
		CF_BALLOT_POOL_ID = @NEW_BALLOT_POOL_ID,
		UP_FID = @CR_FID,
		UP_UID = @CR_UID,
		UP_DT = GETDATE()
	WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID;


	set @Result='Y'

End;


GO
/****** Object:  StoredProcedure [dbo].[Ballot_CarryForward_newRegID]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Ballot_CarryForward_newRegID]
(
	@PROJECT_ID NVARCHAR(10),
	@CR_UID  nvarchar(10) ,
	@CR_FID nvarchar(10),
	@BALLOT_POOL_ID INT ,
	@NEW_BALLOT_POOL_ID INT,
	@Result Nvarchar(1) OUTPUT
)
  As
BEGIN
	-- @RESULT
	-- Y: Create Successfully
	-- M: Over max registration
	-- I: Pool ID is same as before

	

	INSERT INTO BALLOT_POOL_REG 
	(
		[BALLOT_POOL_ID],[BALLOT_REG_ID],[BALLOT_BATCH_ID],[CF_BALLOT_POOL_REG_ID],
		[BALLOT_REG_STATUS],[BALLOT_RESULT_SEQ],[ATTN_DT],
		[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	)
	SELECT 
		@NEW_BALLOT_POOL_ID,[BALLOT_REG_ID],NULL,NULL,
		'V',NULL,NULL,
		@CR_UID,@CR_FID,getdate(),@CR_UID,@CR_FID,getdate()
	FROM BALLOT_POOL_REG 
	WHERE 
		BALLOT_POOL_ID = @BALLOT_POOL_ID AND 
		BALLOT_REG_STATUS='B'


	

	UPDATE BALLOT_POOL_REG
	SET 
		BALLOT_REG_STATUS='C', 
		CF_BALLOT_POOL_REG_ID =  dbo.[SF_Ballot_GetCFID](@NEW_BALLOT_POOL_ID, BALLOT_REG_ID),		
		UP_FID = @CR_FID,
		UP_UID = @CR_UID,
		UP_DT = GETDATE()
	WHERE
		BALLOT_POOL_ID = @BALLOT_POOL_ID and 
		BALLOT_REG_STATUS='B';		
		
	
	UPDATE BALLOT_POOL
	SET 
		BALLOT_POOL_STATUS ='C', 
		CF_BALLOT_POOL_ID = @NEW_BALLOT_POOL_ID,
		UP_FID = @CR_FID,
		UP_UID = @CR_UID,
		UP_DT = GETDATE()
	WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID;
	

		declare @poolNo int;
		SET @poolNo=0;


		select TOP 1 @poolNo = BALLOT_POOL_NO from [dbo].[BALLOT_POOL] where BALLOT_POOL_ID= @NEW_BALLOT_POOL_ID;


		
  update BALLOT_REG 
	SET
	REG_NO_DISPLAY=CONCAT(BALLOT_REG.[PROJECT_ID] , '-',@poolNo,'-',RIGHT('000000'+CAST(ISNULL(BALLOT_REG.[REG_NO],0) AS VARCHAR),8) )
	from [dbo].[BALLOT_POOL_REG] AS A
	join [dbo].[BALLOT_POOL_REG] AS B on 
	  B.CF_BALLOT_POOL_REG_ID=A.BALLOT_POOL_REG_ID
	where 	
	BALLOT_REG.BALLOT_REG_ID= A.BALLOT_REG_ID and A.BALLOT_POOL_ID=@NEW_BALLOT_POOL_ID

		
		/*
	update BALLOT_REG
	SET
	REG_NO_DISPLAY=CONCAT([PROJECT_ID] , '-',@poolNo,'-',RIGHT('000000'+CAST(ISNULL([REG_NO],0) AS VARCHAR),8) )
	where 	
	BALLOT_REG_ID= ( 
	 SELECT A.BALLOT_REG_ID  FROM [dbo].[BALLOT_POOL_REG] AS A  INNER JOIN [BALLOT_POOL_REG] AS B ON B.CF_BALLOT_POOL_REG_ID=A.BALLOT_POOL_REG_ID
  where A.BALLOT_POOL_ID=@NEW_BALLOT_POOL_ID)*/


	set @Result='Y'

End;


GO
/****** Object:  StoredProcedure [dbo].[Ballot_DivBatch]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Ballot_DivBatch]
(
	@BallotBatchID int,
	@BuyerCount_01 int,
	@BuyerCount_02 int,
	@BuyerCount_03 int,
	@BuyerCount_04 int,
	@BuyerCount_05 int,
	@BuyerCount_06 int,
	@BuyerCount_07 int,
	@BuyerCount_08 int,
	@BuyerCount_09 int,
	@BuyerCount_10 int,
	@BallotSeed int,
	@Up_UID NVarChar(10),
	@Up_FID NVarChar(10),
	@Return_Status Int Output
)
 
As

	--Step 1: Get Basic Inoformation
	--	Step 1.1: Assign Sequence for Application
	--Step 2: Divide Batch Logic
	--	Step 2.1: Divide S1 - Distribute application to different group
	--	Step 2.2: Divide S2 - Move the same buyer to same group
	--	Step 2.3: Divide S3 - Check Buyer Limit according to buyer count
	--		Step 2.3.1: Get the TARGET buyer count from setting
	--		Step 2.3.2: Get the Actial buyer count from setting
	--		Step 2.3.3: Move excessed application next batch
	--		Step 2.3.4: Move application if not enough
	--Step 3: Create new sub batch
	--Step 4: Move application to new sub bacth
	

	Declare @BatchCount int = 0;
	DECLARE @tmpLoop int = 1;
	DECLARE @tmpCount int;
	DECLARE @tmpBuyerCount int;
	SET @Return_Status = 0;
	
	
	
	SELECT
		ROW_NUMBER() OVER(ORDER BY HASHBYTES('MD5', STR(RAND(TICKET_ID + @BallotSeed), 30, 30)) ASC, SEED ASC) BallotSeq,
		HASHBYTES('MD5', STR(RAND(TICKET_ID + @BallotSeed), 30, 30)) OrderKey,
		TICKET_ID
		INTO #tmpTicket
	FROM BALLOT_TICKET
	WHERE
		BALLOT_BATCH_ID = @BallotBatchID;
	
	
	UPDATE BALLOT_TICKET
	SET
		BALLOT_TICKET.DIV_SEQ = (tmp.BallotSeq)
	FROM 
		BALLOT_TICKET bt
		INNER JOIN #tmpTicket tmp ON bt.TICKET_ID = tmp.TICKET_ID
	WHERE
		bt.BALLOT_BATCH_ID = @BallotBatchID;

	
	
	
	
	--Step 1: Get Basic Inoformation
	SELECT * INTO #tmpDivBuyer
	FROM
	(
		SELECT 1 DivBatch, @BuyerCount_01 BuyerCount UNION ALL
		SELECT 2 DivBatch, @BuyerCount_02 BuyerCount UNION ALL
		SELECT 3 DivBatch, @BuyerCount_03 BuyerCount UNION ALL
		SELECT 4 DivBatch, @BuyerCount_04 BuyerCount UNION ALL
		SELECT 5 DivBatch, @BuyerCount_05 BuyerCount UNION ALL
		SELECT 6 DivBatch, @BuyerCount_06 BuyerCount UNION ALL
		SELECT 7 DivBatch, @BuyerCount_07 BuyerCount UNION ALL
		SELECT 8 DivBatch, @BuyerCount_08 BuyerCount UNION ALL
		SELECT 9 DivBatch, @BuyerCount_09 BuyerCount UNION ALL
		SELECT 10 DivBatch, @BuyerCount_10 BuyerCount
	) tmp;
	
	
	SELECT @BatchCount = MAX(DivBatch) 
	FROM #tmpDivBuyer 
	WHERE BuyerCount > 0 AND BuyerCount IS NOT NULL
	
	
	IF (@BatchCount IS NULL)
	BEGIN
		RETURN
	END
	
	
	INSERT INTO [BALLOT_DIV_STATUS]
	(
		[BALLOT_BATCH_ID] ,[BALLOT_SUB_BATCH],[BUYER_BATCH_NO],[BUYER_BATCH_COUNT],
		[CR_UID],[CR_DT],[UP_UID],[UP_DT]
	)
	SELECT 
		@BallotBatchID, CHAR(DivBatch + 64) SubBatch, DivBatch, BuyerCount,
		@Up_UID, GETDATE(), @Up_UID, GETDATE()
	FROM #tmpDivBuyer 
	WHERE 
		BuyerCount > 0 AND BuyerCount IS NOT NULL;



	
	
	
	
	
	--Step 2: Divide Batch Logic
	--Step 2.1: Divide S1 - Distribute application to different group
	SELECT
		TICKET_ID, DIV_SEQ, 
		CASE WHEN DIV_SEQ % @BatchCount = 0 THEN @BatchCount ELSE DIV_SEQ % @BatchCount END S1_Group,
		CAST(0 AS INT) S2_Group,
		CAST(0 AS INT) S3_Group,
		CAST(0 AS INT) MinSeq,
		dbo.SF_DIV_TicketID(TICKET_ID) BuyerTicketID INTO #tmpDivTicket
	FROM BALLOT_TICKET
	WHERE BALLOT_BATCH_ID = @BallotBatchID
	ORDER BY DIV_SEQ;

		

	--Step 2.2: Divide S2 - Move the same buyer to same group
	UPDATE #tmpDivTicket
	SET
		S2_Group = t2.MinGroup,
		S3_Group = t2.MinGroup,
		MinSeq = t2.MinSeq
	FROM
		#tmpDivTicket t1
		JOIN
		(
			SELECT BuyerTicketID, MIN(S1_Group) MinGroup, MIN(DIV_SEQ) MinSeq
			FROM #tmpDivTicket
			GROUP BY BuyerTicketID
		) t2 ON t1.BuyerTicketID = t2.BuyerTicketID;
	
	
	
	-- Step 2.3: Divide S3 - Check Buyer Limit according to buyer count
	WHILE (@tmpLoop <= @BatchCount)
	BEGIN
		-- Step 2.3.1: Get the TARGET buyer count from setting
		SELECT @tmpBuyerCount = BuyerCount FROM #tmpDivBuyer WHERE DivBatch = @tmpLoop;
		
		-- Step 2.3.2: Get the Actial buyer count from setting
		SELECT @tmpCount = COUNT(DISTINCT BuyerTicketID) FROM #tmpDivTicket WHERE S3_Group = @tmpLoop;
		
	
		-- Step 2.3.3: Move excessed application next batch
		IF (@tmpCount > @tmpBuyerCount)
		BEGIN

			UPDATE #tmpDivTicket
			SET S3_Group = @tmpLoop + 1
			WHERE 
				BuyerTicketID IN (
					SELECT TOP (@tmpCount - @tmpBuyerCount) BuyerTicketID
					FROM (
						SELECT BuyerTicketID, S2_Group, MinSeq 
						FROM #tmpDivTicket 
						WHERE S3_Group = @tmpLoop 
						GROUP BY  BuyerTicketID, S2_Group, MinSeq
						) tmp
					ORDER BY S2_Group DESC, MinSeq DESC
				);
		END
		
		-- Step 2.3.4: Move application if not enough
		IF (@tmpCount < @tmpBuyerCount)
		BEGIN

			UPDATE #tmpDivTicket
			SET S3_Group = @tmpLoop
			WHERE 
				BuyerTicketID IN (
					SELECT TOP (@tmpBuyerCount - @tmpCount) BuyerTicketID
					FROM (
						SELECT BuyerTicketID, S2_Group, MinSeq
						FROM #tmpDivTicket
						WHERE S3_Group > @tmpLoop 
						GROUP BY  BuyerTicketID, S2_Group, MinSeq
						) tmp
					ORDER BY S2_Group ASC, MinSeq ASC
				);
		END
		
		SET @tmpLoop = (@tmpLoop + 1)
	END
	
	/*
	DROP TABLE tmpDivTicket;
	SELECT * INTO tmpDivTicket FROM #tmpDivTicket;
	*/
	
	
	--Step 3: Create new sub batch
	INSERT INTO [BALLOT_BATCH]
	(
		[PROJECT_ID],[BALLOT_BATCH_NO],[BALLOT_BATCH_STATUS],[MAX_APP],[DEPOSIT_CURR_ID], [DEPOSIT_AMT],
		[CR_UID],[CR_DT],[UP_UID],[UP_DT],[CF_BALLOT_BATCH_ID],[START_TICKET_NO], [BALLOT_SUB_BATCH]
	)
	SELECT
		[PROJECT_ID],[BALLOT_BATCH_NO], 'F',[MAX_APP],[DEPOSIT_CURR_ID], [DEPOSIT_AMT],
		@Up_UID, GETDATE(),@Up_UID, GETDATE(),[CF_BALLOT_BATCH_ID],[START_TICKET_NO], SubBatch
	FROM 
		[BALLOT_BATCH] bb
		JOIN ( SELECT DISTINCT S3_Group, CHAR(S3_Group + 64) SubBatch FROM #tmpDivTicket ) tdt ON 1 = 1
	WHERE
		BALLOT_BATCH_ID = @BallotBatchID;
    
	
	--Step 4: Move application to new sub bacth
	UPDATE BALLOT_TICKET
	SET DIV_BALLOT_BATCH_ID = BALLOT_BATCH_ID
	WHERE
		BALLOT_BATCH_ID =@BallotBatchID;
	

	UPDATE BALLOT_TICKET
	SET
		DIV_BALLOT_BATCH_ID = t1.BALLOT_BATCH_ID,
		BALLOT_BATCH_ID = t2.BALLOT_BATCH_ID,
		UP_UID = @Up_UID,
		UP_FID = @Up_FID,
		UP_DT = GETDATE()
	FROM
		BALLOT_TICKET t1
		JOIN
		(
			SELECT dt.TICKET_ID, bb.BALLOT_BATCH_ID
			FROM 
				BALLOT_BATCH bb 
				JOIN BALLOT_BATCH t ON bb.PROJECT_ID = t.PROJECT_ID AND bb.BALLOT_BATCH_NO = t.BALLOT_BATCH_NO AND 
					t.BALLOT_BATCH_ID = @BallotBatchID AND bb.BALLOT_BATCH_ID != @BallotBatchID
				JOIN #tmpDivTicket dt ON bb.BALLOT_SUB_BATCH = CHAR(S3_Group + 64)
		) t2 ON t1.TICKET_ID = t2.TICKET_ID;
			
	

	SET @Return_Status = 1;
	
	Return
GO
/****** Object:  StoredProcedure [dbo].[Ballot_Export]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  Stored Procedure dbo.psmsBallot_Export    Script Date: 12/3/2004 2:32:22 PM ******/
CREATE  Procedure [dbo].[Ballot_Export]
(
	@ProjectID nvarchar(10),
	@BallotBatchID int
)
  As begin

	 SELECT 
		Ballot_Pool_No_Batch_Name'Ballot Pool No - Batch Name',TICKET_NO_DISPLAY 'Registration No.',  
		BUYER_ENG_NAME_1 'BUYER 1 ENG NAME', BUYER_CHI_NAME_1 'BUYER 1 CHI NAME', BUYER_Identity_Number_1 'BUYER 1 Identity Number', case when BUYER_IS_Identity_1 = 'T' then 'Permanent' when BUYER_IS_Identity_1 = 'F' then  'Non-Permanent' else '' end [Buyer 1 Permanent / Non-Permanent],BUYER_Identity_Type1 'BUYER 1 Identity Type', 
		BUYER_ENG_NAME_2 'BUYER 2 ENG NAME', BUYER_CHI_NAME_2 'BUYER 2 CHI NAME', BUYER_Identity_Number_2 'BUYER 2 Identity Number', case when BUYER_IS_Identity_2 = 'T' then 'Permanent' when BUYER_IS_Identity_2 = 'F' then  'Non-Permanent' else '' end [Buyer 2 Permanent / Non-Permanent],BUYER_Identity_Type2 'BUYER 2 Identity Type',
		BUYER_ENG_NAME_3 'BUYER 3 ENG NAME', BUYER_CHI_NAME_3 'BUYER 3 CHI NAME', BUYER_Identity_Number_3 'BUYER 3 Identity Number', case when BUYER_IS_Identity_3 = 'T' then 'Permanent' when BUYER_IS_Identity_3 = 'F' then 'Non-Permanent' else '' end [Buyer 3 Permanent / Non-Permanent],BUYER_Identity_Type3 'BUYER 3 Identity Type',
		BUYER_ENG_NAME_4 'BUYER 4 ENG NAME', BUYER_CHI_NAME_4 'BUYER 4 CHI NAME', BUYER_Identity_Number_4 'BUYER 4 Identity Number', case when BUYER_IS_Identity_4 = 'T' then 'Permanent' when BUYER_IS_Identity_4 = 'F' then 'Non-Permanent' else '' end [Buyer 4 Permanent / Non-Permanent],BUYER_Identity_Type4 'BUYER 4 Identity Type',
		BUYER_ENG_NAME_5 'Director 1 ENG NAME', BUYER_CHI_NAME_5 'Director 1 CHI NAME', BUYER_Identity_Number_5 'Director 1 Identity Number', case when BUYER_IS_Identity_5 = 'T' then 'Permanent'  when BUYER_IS_Identity_5 = 'F' then 'Non-Permanent' else '' end [Director 1 Permanent / Non-Permanent], BUYER_Identity_Type5 'Director 1 Identity Type',
		BUYER_ENG_NAME_6 'Director 2 ENG NAME', BUYER_CHI_NAME_6 'Director 2 CHI NAME', BUYER_Identity_Number_6 'Director 2 Identity Number', case when BUYER_IS_Identity_6 = 'T' then 'Permanent'  when BUYER_IS_Identity_6 = 'FT' then  'Non-Permanent' else '' end [Director 2 Permanent / Non-Permanent], BUYER_Identity_Type6 'Director 2 Identity Type', 
		CO_NAME 'Company Name', CO_BRN 'Company BR Number', 
		TEL_NO_1 'TEL NO 1',TEL_NO_2 'TEL NO 2',
		ADDR_1 'ADDRESS 1',ADDR_2 'ADDRESS 2',ADDR_3 'ADDRESS 3' , ADDR_4 'ADDRESS 4',
		HAS_VENDOR_RS 'HAS_VENDOR_RELATIONSHIP', DIRECT_MKT 'RECEIVE_MARKETING_LETTER',
		CHEQUE_NO_1 'Cheque No. (1)', BK_NAME_1 'Cheque Bank (1)',Cheque_Type_1 'Cheque Type (1)', AMOUNT_1 'Cheque Amount (1)',
		CHEQUE_NO_2 'Cheque No. (2)', BK_NAME_2 'Cheque Bank (2)',Cheque_Type_2 'Cheque Type (2)',AMOUNT_2 'Cheque Amount (2)',
		CHEQUE_NO_3 'Cheque No. (3)', BK_NAME_3 'Cheque Bank (3)',Cheque_Type_3 'Cheque Type (3)',AMOUNT_3 'Cheque Amount (3)',
		CHEQUE_NO_4 'Cheque No. (4)', BK_NAME_4 'Cheque Bank (4)',Cheque_Type_4 'Cheque Type (4)',AMOUNT_4 'Cheque Amount (4)',
		CHEQUE_NO_5 'Cheque No. (5)', BK_NAME_5 'Cheque Bank (5)',Cheque_Type_5 'Cheque Type (5)',AMOUNT_5 'Cheque Amount (5)',
		CHEQUE_NO_6 'Cheque No. (6)', BK_NAME_6 'Cheque Bank (6)',Cheque_Type_6 'Cheque Type (6)',AMOUNT_6 'Cheque Amount (6)',
		CHEQUE_NO_7 'Cheque No. (7)', BK_NAME_7 'Cheque Bank (7)',Cheque_Type_7 'Cheque Type (7)',AMOUNT_7 'Cheque Amount (7)',
		CHEQUE_NO_8 'Cheque No. (8)', BK_NAME_8 'Cheque Bank (8)',Cheque_Type_8 'Cheque Type (8)',AMOUNT_8 'Cheque Amount (8)',
		CHEQUE_NO_9 'Cheque No. (9)', BK_NAME_9 'Cheque Bank (9)',Cheque_Type_9 'Cheque Type (9)',AMOUNT_9 'Cheque Amount (9)',
		CHEQUE_NO_10 'Cheque No. (10)', BK_NAME_10 'Cheque Bank (10)',Cheque_Type_10 'Cheque Type (10)', AMOUNT_10 'Cheque Amount (10)',  
		AGENCY 'AGENCY' , AGENCY_NAME 'Agent Name', AGENCY_License_No 'Agent License No.', 
		BALLOT_RESULT_SEQ 'Ballot Sequence', 
		TICKET_STATUS 'Registration Status',
		CONVERT(NVARCHAR(19), vbe.CR_DT, 121) 'Registration Creation Date Time', 
		CONVERT(NVARCHAR(19), vbe.ATTN_DT, 121) 'Attendance Time'  ,
		GROUP_ID 'Group ID' , UNIT_INTEND 'No. of Unit Intended to Buy', AGENCY_DISTRICT, AGENCY_REGION, AGENT_NUMBER --#20170906
	 FROM VW_BallotExport vbe
	 WHERE
		PROJECT_ID = @ProjectID AND BALLOT_BATCH_ID = @BallotBatchID
	 ORDER BY TICKET_NO_DISPLAY
	
end
	


GO
/****** Object:  StoredProcedure [dbo].[Ballot_GetTicketDetail]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Ballot_GetTicketDetail]
(
     @PROJECT_ID  nvarchar(10),
     @TicketNo nvarchar(20)
)

 
As

	Declare @TicketID int;
	
	SELECT
		@TicketID = TICKET_ID
	FROM 
		BALLOT_TICKET bt
		JOIN BALLOT_BATCH bb ON bt.BALLOT_BATCH_ID = bb.BALLOT_BATCH_ID
	WHERE 
		bt.TICKET_NO_DISPLAY = @TicketNo AND
		bb.PROJECT_ID = @PROJECT_ID;
   	

	IF (@TicketID is not null)
	BEGIN
	
		--1st Set: Ballot Batch and Ballot Ticket Basic Info
		SELECT
			bb.[BALLOT_BATCH_ID],bb.[BALLOT_BATCH_DISPLAY],bb.[BALLOT_BATCH_STATUS],bb.[ATTN_STATUS],
			bb.[DEPOSIT_CURR_ID],bb.[DEPOSIT_AMT],
			bt.[TICKET_ID],bt.[CF_TICKET_ID],bt.[TICKET_NO_DISPLAY],bt.[TICKET_STATUS],bt.[BALLOT_RESULT_SEQ],
			bt.[AGENCY],bt.[AGENCY_TEL],bt.[AGENCY_NAME],bt.[AGENCY_ID],bt.[AGENCY_ID_TYPE],
			bt.[TEL_NO_1],bt.[TEL_NO_2],bt.[REMARKS]
		FROM 
			BALLOT_TICKET bt
			JOIN BALLOT_BATCH bb ON bt.BALLOT_BATCH_ID = bb.BALLOT_BATCH_ID
		WHERE
			 TICKET_ID = @TicketID;
		
		
		--2nd Set: Buyer Info
		SELECT 
			-- [BALLOT_BUYER_ID],[TICKET_ID],[BUYER_SEQ],
			[BUYER_CHI_NAME],[BUYER_ENG_NAME],[BUYER_ID],[BUYER_ID_IS_IDEN],[BUYER_NAT_CODE],
			[CO_NAME],[CO_BRN]
		FROM BALLOT_BUYER
		WHERE TICKET_ID = @TicketID
		ORDER BY [TICKET_ID],[BUYER_SEQ];
		
		
		--3rd Set: Buyer Info
		SELECT 
			[PAYMENT_SEQ], [CHEQUE_NO],[BANK_CODE],[CURR_ID],[CURR_RATE],[AMOUNT]
		FROM [BALLOT_PAYMENT]
		WHERE TICKET_ID = @TicketID
		ORDER BY [PAYMENT_SEQ];
	
	END




Return
GO
/****** Object:  StoredProcedure [dbo].[Ballot_ImportBallotResult]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ballot_ImportBallotResult]
	@ProjectID [nvarchar](10),
	@BallotBatchID [int],
	@CSVFile [nvarchar](max),
	@CR_UID [nvarchar](10),
	@CR_FID [nchar](10),
	@OUT_ErrorType [nvarchar](1) OUTPUT,
	@OUT_ErrorRow [nvarchar](4000) OUTPUT
WITH  EXECUTE AS CALLER
AS
BEGIN

	-- Step 1: Prepare Environment
	-- Step 2: Read CSV into Row
	-- Step 3: Read CSV into Field
	-- Step 4: Tidy up CSV value
	-- Step 5: Checking
	--	Step 5.1: Registration No. Existance
	--	Step 5.2: Registration No. Duplication
	--	Step 5.3: Ballot Result Format
	--	Step 5.4: Ballot Result Sequence
	-- Step 6: Update Database Record
	--	Step 6.1: Update Ballot Batach Statsu
	--	Step 6.2: Update Ballot Ballot Result Sequence
	
	-- Step 1: Prepare Environment
	DECLARE @ErrorMsg NVARCHAR(MAX);

	CREATE TABLE #TMP_BALLOT_CSV(
		[CSV_ID] [int] ,
		[CSV_ROW] [nvarchar](MAX) NOT NULL
	);

	
	CREATE TABLE #TMP_BALLOT_COLUMN(
		CSV_ID INT NULL,
		[REG_NO] [nvarchar](MAX) NULL,
		[BALLOT_RESULT] [nvarchar](MAX) NULL,
		[BALLOT_SEQ] int NULL
	);
	
	--select * from #TMP_BALLOT_COLUMN
	-- Step 2: Read CSV into Row
	INSERT INTO #TMP_BALLOT_CSV (CSV_ID, CSV_ROW)
	SELECT ID, CSVRow
	FROM [dbo].[SF_CSV2ROW](@CSVFile, CHAR(13) + CHAR(10));
	

	-- Step 3: Read CSV into Field
	INSERT INTO #TMP_BALLOT_COLUMN([CSV_ID], [REG_NO], [BALLOT_RESULT])
	SELECT 
		[CSV_ID], [REG_NO], [BALLOT_RESULT]
	FROM #TMP_BALLOT_CSV
		cross apply ( select str = CSV_ROW + ',,' ) f1
		cross apply ( select p1 = charindex( ',', str ) ) ap1
		cross apply ( select p2 = charindex( ',', str, p1 + 1 ) ) ap2
		cross apply ( 
			select 
				[REG_NO] = substring( str, 1, p1-1 ), 
				[BALLOT_RESULT] = substring( str, p1+1, p2-p1-1 )
		) ParsedData

	-- Step 4: Tidy up CSV value
	-- Step 4.1: Remove Header and Teail Record	
	DELETE #TMP_BALLOT_COLUMN WHERE CSV_ID = 1 or REG_NO ='';
	--DELETE #TMP_BALLOT_COLUMN WHERE CSV_ID = (SELECT MAX(CSV_ID) FROM #TMP_BALLOT_CSV);


	-- Step 4.2: Remove Double Quote
	UPDATE #TMP_BALLOT_COLUMN
	SET
		[REG_NO] = REPLACE([REG_NO], '"', ''), 
		[BALLOT_RESULT] = REPLACE([BALLOT_RESULT], '"', '')
		
	
	-- Step 5: Checking
	--	Step 5.1: Registration No. Existance
	SET @OUT_ErrorType = '1'
	SELECT @ErrorMsg = 
	(
		SELECT CAST(CSV_ID as varchar(10)) + ',' AS [text()] 
		FROM
			#TMP_BALLOT_COLUMN t
			LEFT JOIN BALLOT_REG r ON 
				r.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_BATCH_ID = @BallotBatchID) AND 
				t.REG_NO = r.REG_NO_DISPLAY
		WHERE r.REG_NO_DISPLAY IS NULL
		ORDER BY CSV_ID
		For XML PATH ('')
	);

	--	Step 5.2: Registration No. Duplication
	IF ((@ErrorMsg IS NULL) OR (LEN(@ErrorMsg)) = 0)
	BEGIN
		SET @OUT_ErrorType = '2';
		SELECT @ErrorMsg = 
		(
			SELECT CAST(CSV_ID as varchar(10)) + ',' AS [text()] 
			FROM #TMP_BALLOT_COLUMN 
			WHERE REG_NO IN (SELECT REG_NO FROM #TMP_BALLOT_COLUMN GROUP BY REG_NO HAVING COUNT(*) > 1)
			ORDER BY CSV_ID
			For XML PATH ('')
		);
	END
	
	--	Step 5.3: Ballot Result Format
	IF ((@ErrorMsg IS NULL) OR (LEN(@ErrorMsg)) = 0)
	BEGIN
		SET @OUT_ErrorType = '3';
		SELECT @ErrorMsg = 
		(
			SELECT CAST(CSV_ID as varchar(10)) + ',' AS [text()] 
			FROM #TMP_BALLOT_COLUMN 
			WHERE ISNUMERIC(BALLOT_RESULT) = 0
			ORDER BY CSV_ID
			For XML PATH ('')
		);
	END

	--select * from #TMP_BALLOT_COLUMN
	--	Step 5.4: Ballot Result Sequence
	--IF ((@ErrorMsg IS NULL) OR (LEN(@ErrorMsg)) = 0)
	--BEGIN
	--	SET @OUT_ErrorType = '4';
	--	SELECT @ErrorMsg = 
	--	(
	--		SELECT CAST(CSV_ID as varchar(10)) + ',' AS [text()] 
	--		FROM
	--		(
	--			SELECT CSV_ID, BALLOT_RESULT, ROW_NUMBER() over (order by BALLOT_RESULT asc ) RowIndex FROM #TMP_BALLOT_COLUMN 
	--		) t
	--		WHERE BALLOT_RESULT != RowIndex
	--		ORDER BY CSV_ID
	--		For XML PATH ('')
	--	);
	--END
	

	
	-- Step 6: Clear DB Record and Insert
	IF ((@ErrorMsg IS NULL) OR (LEN(@ErrorMsg)) = 0)
	BEGIN
		SET @OUT_ErrorType = NULL;
		SET @OUT_ErrorRow = NULL;


		--	Step 6.1: Update Ballot Batach Statsu
		--UPDATE BALLOT_BATCH
		--SET
		--	BALLOT_BATCH_STATUS = 'E',
		--	UP_UID = @CR_UID,
		--	UP_FID = @CR_FID,
		--	UP_DT = GETDATE()
		--WHERE
		--	BALLOT_BATCH_ID = @BallotBatchID;


		--	Step 6.2: Update Ballot Ballot Result Sequence
		UPDATE #TMP_BALLOT_COLUMN
		SET BALLOT_SEQ = CAST([BALLOT_RESULT] AS INT);


		UPDATE BALLOT_POOL_REG
		SET BALLOT_RESULT_SEQ = t.BALLOT_SEQ
		FROM
			BALLOT_POOL_REG pr
			JOIN BALLOT_REG r ON pr.BALLOT_REG_ID = r.BALLOT_REG_ID
			JOIN #TMP_BALLOT_COLUMN t ON r.REG_NO_DISPLAY = t.REG_NO
		WHERE
			pr.BALLOT_BATCH_ID = @BallotBatchID;


		UPDATE BALLOT_POOL_REG
		SET
			BALLOT_REG_STATUS = 'B',
			UP_UID = @CR_UID,
			UP_FID = @CR_FID,
			UP_DT = GETDATE()
		WHERE BALLOT_BATCH_ID = @BallotBatchID;

	END 
	ELSE
	BEGIN
		SET @OUT_ErrorRow = LEFT(@ErrorMsg, (LEN(@ErrorMsg)-1));
	END
	
END



GO
/****** Object:  StoredProcedure [dbo].[Ballot_Pool_Export]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  Procedure [dbo].[Ballot_Pool_Export]
(
	@ProjectID nvarchar(10),
	@BallotPoolID int
)
  As begin

	 SELECT 
		Ballot_Pool_No_Batch_Name'Ballot Pool No - Batch Name',TICKET_NO_DISPLAY 'Registration No.',  
		BUYER_ENG_NAME_1 'BUYER 1 ENG NAME', BUYER_CHI_NAME_1 'BUYER 1 CHI NAME', BUYER_Identity_Number_1 'BUYER 1 Identity Number', case when BUYER_IS_Identity_1 = 'T' then 'Permanent' when BUYER_IS_Identity_1 = 'F' then  'Non-Permanent' else '' end [Buyer 1 Permanent / Non-Permanent],BUYER_Identity_Type1 'BUYER 1 Identity Type', 
		BUYER_ENG_NAME_2 'BUYER 2 ENG NAME', BUYER_CHI_NAME_2 'BUYER 2 CHI NAME', BUYER_Identity_Number_2 'BUYER 2 Identity Number', case when BUYER_IS_Identity_2 = 'T' then 'Permanent' when BUYER_IS_Identity_2 = 'F' then  'Non-Permanent' else '' end [Buyer 2 Permanent / Non-Permanent],BUYER_Identity_Type2 'BUYER 2 Identity Type',
		BUYER_ENG_NAME_3 'BUYER 3 ENG NAME', BUYER_CHI_NAME_3 'BUYER 3 CHI NAME', BUYER_Identity_Number_3 'BUYER 3 Identity Number', case when BUYER_IS_Identity_3 = 'T' then 'Permanent' when BUYER_IS_Identity_3 = 'F' then 'Non-Permanent' else '' end [Buyer 3 Permanent / Non-Permanent],BUYER_Identity_Type3 'BUYER 3 Identity Type',
		BUYER_ENG_NAME_4 'BUYER 4 ENG NAME', BUYER_CHI_NAME_4 'BUYER 4 CHI NAME', BUYER_Identity_Number_4 'BUYER 4 Identity Number', case when BUYER_IS_Identity_4 = 'T' then 'Permanent' when BUYER_IS_Identity_4 = 'F' then 'Non-Permanent' else '' end [Buyer 4 Permanent / Non-Permanent],BUYER_Identity_Type4 'BUYER 4 Identity Type',
		BUYER_ENG_NAME_5 'Director 1 ENG NAME', BUYER_CHI_NAME_5 'Director 1 CHI NAME', BUYER_Identity_Number_5 'Director 1 Identity Number', case when BUYER_IS_Identity_5 = 'T' then 'Permanent'  when BUYER_IS_Identity_5 = 'F' then 'Non-Permanent' else '' end [Director 1 Permanent / Non-Permanent], BUYER_Identity_Type5 'Director 1 Identity Type',
		BUYER_ENG_NAME_6 'Director 2 ENG NAME', BUYER_CHI_NAME_6 'Director 2 CHI NAME', BUYER_Identity_Number_6 'Director 2 Identity Number', case when BUYER_IS_Identity_6 = 'T' then 'Permanent'  when BUYER_IS_Identity_6 = 'FT' then  'Non-Permanent' else '' end [Director 2 Permanent / Non-Permanent], BUYER_Identity_Type6 'Director 2 Identity Type', 
		CO_NAME 'Company Name', CO_BRN 'Company BR Number', 
		TEL_NO_1 'TEL NO 1',TEL_NO_2 'TEL NO 2',
		ADDR_1 'ADDRESS 1',ADDR_2 'ADDRESS 2',ADDR_3 'ADDRESS 3' , ADDR_4 'ADDRESS 4',
		HAS_VENDOR_RS 'HAS_VENDOR_RELATIONSHIP', DIRECT_MKT 'RECEIVE_MARKETING_LETTER',
		CHEQUE_NO_1 'Cheque No. (1)', BK_NAME_1 'Cheque Bank (1)',Cheque_Type_1 'Cheque Type (1)', AMOUNT_1 'Cheque Amount (1)',
		CHEQUE_NO_2 'Cheque No. (2)', BK_NAME_2 'Cheque Bank (2)',Cheque_Type_2 'Cheque Type (2)',AMOUNT_2 'Cheque Amount (2)',
		CHEQUE_NO_3 'Cheque No. (3)', BK_NAME_3 'Cheque Bank (3)',Cheque_Type_3 'Cheque Type (3)',AMOUNT_3 'Cheque Amount (3)',
		CHEQUE_NO_4 'Cheque No. (4)', BK_NAME_4 'Cheque Bank (4)',Cheque_Type_4 'Cheque Type (4)',AMOUNT_4 'Cheque Amount (4)',
		CHEQUE_NO_5 'Cheque No. (5)', BK_NAME_5 'Cheque Bank (5)',Cheque_Type_5 'Cheque Type (5)',AMOUNT_5 'Cheque Amount (5)',
		CHEQUE_NO_6 'Cheque No. (6)', BK_NAME_6 'Cheque Bank (6)',Cheque_Type_6 'Cheque Type (6)',AMOUNT_6 'Cheque Amount (6)',
		CHEQUE_NO_7 'Cheque No. (7)', BK_NAME_7 'Cheque Bank (7)',Cheque_Type_7 'Cheque Type (7)',AMOUNT_7 'Cheque Amount (7)',
		CHEQUE_NO_8 'Cheque No. (8)', BK_NAME_8 'Cheque Bank (8)',Cheque_Type_8 'Cheque Type (8)',AMOUNT_8 'Cheque Amount (8)',
		CHEQUE_NO_9 'Cheque No. (9)', BK_NAME_9 'Cheque Bank (9)',Cheque_Type_9 'Cheque Type (9)',AMOUNT_9 'Cheque Amount (9)',
		CHEQUE_NO_10 'Cheque No. (10)', BK_NAME_10 'Cheque Bank (10)',Cheque_Type_10 'Cheque Type (10)', AMOUNT_10 'Cheque Amount (10)',  
		AGENCY 'AGENCY' , AGENCY_NAME 'Agent Name', AGENCY_License_No 'Agent License No.', 
		BALLOT_RESULT_SEQ 'Ballot Sequence', 
		TICKET_STATUS 'Registration Status',
		CONVERT(NVARCHAR(19), vbe.CR_DT, 121) 'Registration Creation Date Time', 
		CONVERT(NVARCHAR(19), vbe.ATTN_DT, 121) 'Attendance Time',
		GROUP_ID 'Group ID' , UNIT_INTEND 'No. of Unit Intended to Buy', AGENCY_DISTRICT, AGENCY_REGION, AGENT_NUMBER --#20170906
	 FROM VW_BallotExport vbe
	 WHERE
		PROJECT_ID = @ProjectID AND BALLOT_Pool_ID = @BallotPoolID
	 ORDER BY Ballot_Pool_No_Batch_Name,TICKET_NO_DISPLAY
	
end
	





GO
/****** Object:  StoredProcedure [dbo].[Ballot_UpdateBatchAttn]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Ballot_UpdateBatchAttn]
(
	@BallotBatchID int,
	@NewStatus NVarChar(1),
	@Up_UID NVarChar(10),
	@Up_FID NVarChar(10),
	@Return_Status Int Output
)
 
As
   
	SET @Return_Status = 0;
	if ((select count(*) from BALLOT_BATCH BB join BALLOT_POOL BP on bb.BALLOT_POOL_ID=Bp.BALLOT_POOL_ID 
	WHERE BALLOT_BATCH_ID = @BallotBatchID and Bp.BALLOT_POOL_STATUS='I')>0)
	Begin
	UPDATE BALLOT_BATCH 
	SET
		ATTN_STATUS = @NewStatus,
		UP_UID = @Up_UID,
		UP_DT = GETDATE(),
		UP_FID=@Up_FID
		from BALLOT_BATCH BB join BALLOT_POOL BP on bb.BALLOT_POOL_ID=Bp.BALLOT_POOL_ID
	WHERE BALLOT_BATCH_ID = @BallotBatchID and Bp.BALLOT_POOL_STATUS='I';

		
	SET @Return_Status = 1;
  End

	Return
GO
/****** Object:  StoredProcedure [dbo].[Ballot_UpdateTicketAttn]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ballot_UpdateTicketAttn]
	@PROJECT_ID [nvarchar](10),
	@REG_NO_DISPLAY [nvarchar](50),
	@Up_UID [nvarchar](10),
	@Return_Status [int] OUTPUT
WITH  EXECUTE AS CALLER
AS
Declare @AttnStatus nvarchar(1);
	Declare @BatchStatus nvarchar(1);
	Declare @BatchID int;
	Declare @BALLOT_REG_ID int;
	Declare @RecCount int;
	declare @AttnTIME datetime;
   DECLARE @MaxBPoolNo INT;
   DECLARE @BALLOT_POOL_REG_ID INT ;
	SET @Return_Status = 0;
	
	
	/*
		@Return_Status
		0: Entered the procedure
		1: Success to insert transaction history
		-1: Ticket not existed in project
		-2: Ballot Batch not in correct status
		-3: Ticket already has the attendance record
	*/

	SELECT @BALLOT_REG_ID= BR.BALLOT_REG_ID, 	@AttnStatus = ISNULL(BB.ATTN_STATUS, 'N'), @BatchStatus = bb.BALLOT_BATCH_STATUS, 
	@BatchID = bb.BALLOT_BATCH_ID,	@BALLOT_REG_ID = br.BALLOT_REG_ID
	FROM
	BALLOT_REG BR JOIN BALLOT_POOL_REG BPR ON BR.BALLOT_REG_ID= BPR.BALLOT_REG_ID
	left JOIN BALLOT_BATCH BB ON BPR.BALLOT_BATCH_ID=BB.BALLOT_BATCH_ID
	WHERE  @PROJECT_ID=PROJECT_ID and REG_NO_DISPLAY=LTRIM(RTRIM(@REG_NO_DISPLAY)) 


	IF (@BALLOT_REG_ID IS NULL)
	BEGIN 
		SET @Return_Status = '-1';
	END ELSE IF ((@BatchStatus NOT IN ('S','E')) OR @AttnStatus != 'Y')
	BEGIN
		SET @Return_Status = '-2';
	END 
	ELSE BEGIN

	
		SELECT @AttnTIME=ATTN_DT from BALLOT_POOL_REG where BALLOT_BATCH_ID = @BatchID And BALLOT_REG_ID=@BALLOT_REG_ID
		if (@AttnTIME is null)
		Begin 
		update BALLOT_POOL_REG
		set ATTN_DT=GETDATE() from BALLOT_POOL_REG where BALLOT_BATCH_ID = @BatchID And BALLOT_REG_ID=@BALLOT_REG_ID
		SET @Return_Status = 1;
		End
		ELSE 
		BEGIN
			SET @Return_Status = -3;
		END


	END
  
	Return
GO
/****** Object:  StoredProcedure [dbo].[BallotOnBatch]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BallotOnBatch]
	@PROJECT_ID [nvarchar](10),
	@UP_UID [nvarchar](10),
	@UP_FID [nvarchar](10),
	@BALLOT_POOL_ID [int],
	@BALLOT_BATCH_ID [int],
	@BallotSeed [int],
	@BallotOnBatchType [nvarchar](1),
	@Result [nvarchar](1) OUTPUT
WITH  EXECUTE AS CALLER
AS
BEGIN

SET @Result='Y'

-------------------------------------------------------------------------------
-- Scenario A: Ballot with Seed
-- Scenario B: Ballot with Seed on Attendance Records
-- Scenario C: Ballot with Draw certain Numbers
-- Scenario D or others: Ballot with Draw certain Numbers on Attendance Records
-------------------------------------------------------------------------------

Create table #TMP (
[BallotSeq][int],
[OrderKey] [nvarchar](MAX),
[BALLOT_REG_ID][int],
[REF_TICKET_ID] [int]
);




if (@BallotOnBatchType='B')
Begin

	insert into #TMP 
	select 
		ROW_NUMBER() OVER(ORDER BY HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID + @BallotSeed), 30, 30)) ASC, SEED ASC) BallotSeq,
		HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID + @BallotSeed), 30, 30)) OrderKey,
		BR.BALLOT_REG_ID, BR.BALLOT_REG_ID REF_TICKET_ID
	
	FROM BALLOT_POOL_REG BPR
	JOIN BALLOT_BATCH BB ON BB.BALLOT_BATCH_ID=BPR.BALLOT_BATCH_ID
	JOIN BALLOT_REG BR ON BR.BALLOT_REG_ID =BPR.BALLOT_REG_ID
	WHERE
		BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID and @BALLOT_POOL_ID=bpr.BALLOT_POOL_ID

		-- Step 3: Applied the Ballot Sequence to Application
	UPDATE BALLOT_POOL_REG
	SET 
	    BALLOT_REG_STATUS = 'B',
		-- BALLOT_TICKET.BALLOT_RESULT_SEQ = (tmp.BallotSeq + @InitBallotSeq),
		BALLOT_RESULT_SEQ = (tmp.BallotSeq),
		Up_UID = @Up_UID,
		UP_FID = @Up_FID,
		UP_DT = GETDATE()
	FROM 
		BALLOT_POOL_REG BPR
		JOIN BALLOT_REG br on bpr.BALLOT_REG_ID = br.BALLOT_REG_ID
		INNER JOIN #TMP tmp ON BR.BALLOT_REG_ID = tmp.BALLOT_REG_ID
	WHERE
		BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID and BALLOT_POOL_ID=@BALLOT_POOL_ID 

end
Else if  (@BallotOnBatchType='A')
begin 
	insert into #TMP 
	select 
		ROW_NUMBER() OVER(ORDER BY HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID + @BallotSeed), 30, 30)) ASC, SEED ASC) BallotSeq,
		HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID + @BallotSeed), 30, 30)) OrderKey,
		BR.BALLOT_REG_ID, BR.BALLOT_REG_ID REF_TICKET_ID
	
	FROM BALLOT_POOL_REG BPR
	JOIN BALLOT_BATCH BB ON BB.BALLOT_BATCH_ID=BPR.BALLOT_BATCH_ID
	JOIN BALLOT_REG BR ON BR.BALLOT_REG_ID =BPR.BALLOT_REG_ID
	WHERE
		BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID and @BALLOT_POOL_ID=bpr.BALLOT_POOL_ID and bpr.ATTN_DT is not null

-- Step 3: Applied the Ballot Sequence to Application
	UPDATE BALLOT_POOL_REG
	SET 
	    BALLOT_REG_STATUS = 'B',
		-- BALLOT_TICKET.BALLOT_RESULT_SEQ = (tmp.BallotSeq + @InitBallotSeq),
		BALLOT_RESULT_SEQ = (tmp.BallotSeq),
		Up_UID = @Up_UID,
		UP_FID = @Up_FID,
		UP_DT = GETDATE()
	FROM 
		BALLOT_POOL_REG BPR
		JOIN BALLOT_REG br on bpr.BALLOT_REG_ID = br.BALLOT_REG_ID
		INNER JOIN #TMP tmp ON BR.BALLOT_REG_ID = tmp.BALLOT_REG_ID
	WHERE
		BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID and BALLOT_POOL_ID=@BALLOT_POOL_ID and bpr.ATTN_DT is not null


end
ELSE if(@BallotOnBatchType='C')
begin
DECLARE @LastCount INT

select @LASTCOUNT=COUNT(1) FROM BALLOT_POOL_REG WHERE BALLOT_BATCH_ID = @BALLOT_BATCH_ID and BALLOT_RESULT_SEQ is not null

	INSERT into #TMP 

	select TOP (@BallotSeed)
		@LastCount + ROW_NUMBER() OVER(ORDER BY HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID ), 30, 30)) ASC, SEED ASC) BallotSeq,
		HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID + @BallotSeed), 30, 30)) OrderKey,
		BR.BALLOT_REG_ID, BR.BALLOT_REG_ID REF_TICKET_ID
	
	FROM BALLOT_POOL_REG BPR
	JOIN BALLOT_BATCH BB ON BB.BALLOT_BATCH_ID=BPR.BALLOT_BATCH_ID
	JOIN BALLOT_REG BR ON BR.BALLOT_REG_ID =BPR.BALLOT_REG_ID
	WHERE
		BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID and @BALLOT_POOL_ID=bpr.BALLOT_POOL_ID and BPR.BALLOT_RESULT_SEQ is null AND BPR.ATTN_DT IS NOT NULL
	
	select * from #TMP

	UPDATE BALLOT_POOL_REG
	SET 
	    BALLOT_REG_STATUS = 'B',
		-- BALLOT_TICKET.BALLOT_RESULT_SEQ = (tmp.BallotSeq + @InitBallotSeq),
		BALLOT_RESULT_SEQ = (tmp.BallotSeq),
		Up_UID = @Up_UID,
		UP_FID = @Up_FID,
		UP_DT = GETDATE()
	FROM 
		BALLOT_POOL_REG BPR
		JOIN BALLOT_REG br on bpr.BALLOT_REG_ID = br.BALLOT_REG_ID
		INNER JOIN #TMP tmp ON BR.BALLOT_REG_ID = tmp.BALLOT_REG_ID
	WHERE
		BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID and BALLOT_POOL_ID=@BALLOT_POOL_ID 
end
ELSE
BEGIN
select @LASTCOUNT=COUNT(1) FROM BALLOT_POOL_REG WHERE BALLOT_BATCH_ID = @BALLOT_BATCH_ID and BALLOT_RESULT_SEQ is not null
	INSERT into #TMP 
	select TOP (@BallotSeed)
		@LastCount+ROW_NUMBER() OVER(ORDER BY HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID ), 30, 30)) ASC, SEED ASC) BallotSeq,
		HASHBYTES('MD5', STR(RAND(BR.BALLOT_REG_ID + @BallotSeed), 30, 30)) OrderKey,
		BR.BALLOT_REG_ID, BR.BALLOT_REG_ID REF_TICKET_ID
	
	FROM BALLOT_POOL_REG BPR
	JOIN BALLOT_BATCH BB ON BB.BALLOT_BATCH_ID=BPR.BALLOT_BATCH_ID
	JOIN BALLOT_REG BR ON BR.BALLOT_REG_ID =BPR.BALLOT_REG_ID
	WHERE
		BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID and @BALLOT_POOL_ID=bpr.BALLOT_POOL_ID and BPR.BALLOT_RESULT_SEQ is null AND BPR.ATTN_DT IS NOT NULL

	UPDATE BALLOT_POOL_REG
	SET 
	    BALLOT_REG_STATUS = 'B',
		-- BALLOT_TICKET.BALLOT_RESULT_SEQ = (tmp.BallotSeq + @InitBallotSeq),
		BALLOT_RESULT_SEQ = (tmp.BallotSeq),
		Up_UID = @Up_UID,
		UP_FID = @Up_FID,
		UP_DT = GETDATE()
	FROM 
		BALLOT_POOL_REG BPR
		JOIN BALLOT_REG br on bpr.BALLOT_REG_ID = br.BALLOT_REG_ID
		INNER JOIN #TMP tmp ON BR.BALLOT_REG_ID = tmp.BALLOT_REG_ID
	WHERE
		BPR.BALLOT_BATCH_ID = @BALLOT_BATCH_ID and BALLOT_POOL_ID=@BALLOT_POOL_ID and bpr.ATTN_DT is not null
END
IF @@ROWCOUNT = 0  
SET @Result = 'N'
END
GO
/****** Object:  StoredProcedure [dbo].[CalculateMOAScheduleDate]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CalculateMOAScheduleDate]
(
	@Project_ID NVarChar(6),
	@RelativeDate NVarChar(10),
	@Relative NVarChar(3),
	@RelativeUnit NVarChar(1),
	@ScheduleDate NVarChar(10) Output
)
 
As
	Declare @Result DateTime

	If @RelativeUnit = N'M'
	Begin
		Select @Result = DateAdd(Month, Convert(Int, @Relative), Convert(DateTime, @RelativeDate, 105))
	End
	Else If @RelativeUnit = N'Y'
	Begin
		Select @Result = DateAdd(Year, Convert(Int, @Relative), Convert(DateTime, @RelativeDate, 105))
	End
	Else
	Begin
		Select @Result = DateAdd(Day, Convert(Int, @Relative), Convert(DateTime, @RelativeDate, 105))
	End

	While (Select Count(*) From Skip_Date Where Project_ID = @Project_ID And Skip_Date = @Result) > 0
	Begin
		Select @Result = DateAdd(Day, 1, @Result)
	End

	Select @ScheduleDate = Convert(NVarChar(10), @Result, 105)
Return 
GO
/****** Object:  StoredProcedure [dbo].[CalculateSNPDate]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CalculateSNPDate]
(
	@Project_ID NVarChar(6),
	@MOA_Date NVarChar(10),
	@New_SNP_DAYS int,
	@SNP_Date DateTime Output
)
 
As
	Declare @Count Int
	Declare @SNP_Days Int
	Declare @Start_Date DateTime

	Select @Count = 0

	Select @SNP_Days = SNP_Days
	From Project_Master
	Where Project_ID = @Project_ID

	if @New_SNP_DAYS is not null and @New_SNP_DAYS <> -9999
		set @SNP_Days = @New_SNP_DAYS

	Select @Start_Date = Convert(DateTime, @MOA_Date, 105)

	While @Count < @SNP_Days
	Begin
		Select @Count = @Count + 1
		Select @Start_Date = @Start_Date + 1

		If (Select Count(*) From Skip_Date Where Project_ID = @Project_ID And Skip_Date = @Start_Date) = 1
		Begin
			Select @Count = @Count - 1
		End
	End

	Select @SNP_Date = @Start_Date
Return
GO
/****** Object:  StoredProcedure [dbo].[CancelCarParkSale]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[CancelCarParkSale]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Approve_UID NVarChar(10),
	@Approve_FID NVarChar(10)
)
 
As

	Declare @Selection_Order NVarChar(30)
	Declare @Car_Park_ID NVarChar(80)

	Select  @Selection_Order = Selection_Order
	From AM_BASE
	Where Project_ID = @Project_ID And AM_NO = @MOA_No

	Declare GetCarPark Cursor For
	Select Car_Park_ID
	From Car_Park
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Open GetCarPark
	Fetch GetCarPark Into @Car_Park_ID

	While @@Fetch_Status = 0
	Begin
		Insert Into Car_Park_Selection
			(Project_ID, Car_Park_ID, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
		Values
			(@Project_ID, @Car_Park_ID, @Selection_Order, N'D', GetDate(), @Approve_UID, @Approve_UID, @Approve_FID)

		Update Car_Park
		Set Status = N'R', MOA_No = Null, Last_Reserve_Date = GetDate(), Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID
		Where Project_ID = @Project_ID And Car_Park_ID = @Car_Park_ID

		Fetch GetCarPark Into @Car_Park_ID
	End

	Close GetCarPark
	Deallocate GetCarPark
Return
GO
/****** Object:  StoredProcedure [dbo].[CancelFlatSale]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[CancelFlatSale]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Approve_UID NVarChar(10),
	@Approve_FID NVarChar(10)
)
 
As
	Declare @Selection_Order NVarChar(30)
	Declare @FM_Code NVarChar(80)

	Select @Selection_Order = Selection_Order
	From AM_BASE
	Where Project_ID = @Project_ID And AM_NO = @MOA_No

	Declare GetFlat Cursor For
	Select FM_Code
	From Flat_Master
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Open GetFlat
	Fetch GetFlat Into @FM_Code

	While @@Fetch_Status = 0
	Begin
		Insert Into	Flat_Selection
			(Project_ID, FM_Code, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
		Values
			(@Project_ID, @FM_Code, @Selection_Order, N'D', GetDate(), @Approve_UID, @Approve_UID, @Approve_FID)

		Update Flat_Master
		Set FM_Status = N'R', MOA_No = Null, Last_Reserve_Date = GetDate(), Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID
		Where Project_ID = @Project_ID And FM_Code = @FM_Code

		Fetch GetFlat Into @FM_Code
	End

	Close GetFlat
	Deallocate GetFlat
Return
GO
/****** Object:  StoredProcedure [dbo].[CancelMOA]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP PROCEDURE [dbo].CancelMOA
CREATE Procedure [dbo].[CancelMOA]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@IS_VOID_LOG NVarChar(1),
	@Void_Date nvarchar(20),
	@Void_Remarks NVarChar(500),
	@Approve_UID NVarChar(10),
	@Approve_FID NVarChar(10),
	@Void_UID NVarChar(10)
)
 
As
	--Update MOA
	--Set MOA_Status = N'X', MOA_Refund = @Void_Refund, MOA_Remarks = @Void_Remarks,
	--	Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID, Void_UID = @Void_UID
	--Where Project_ID = @Project_ID And MOA_No = @MOA_No

	--Update MOA_FORMAL
	--Set FORMAL_STATUS = N'X', REMARKS = @Void_Remarks,
	--	Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID, Void_UID = @Void_UID
	--Where Project_ID = @Project_ID And MOA_No = @MOA_No
		declare @VoidDate datetime
	set @VoidDate = Convert(DateTime,@Void_Date, 105)

	update AM_BASE
	set AM_STATUS = N'X' ,IS_VOID_LOG=@IS_VOID_LOG , Void_Date=@VoidDate, VOID_REMARK= @Void_Remarks, 
	Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID, Void_UID = @Void_UID
	where PROJECT_ID=@Project_ID and AM_NO=@MOA_No


Return
GO
/****** Object:  StoredProcedure [dbo].[CHECK_DUPLEX]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CHECK_DUPLEX]
	@project_id [nvarchar](10),
	@code [nvarchar](200)
WITH  EXECUTE AS CALLER
AS
BEGIN

DECLARE @NUMERIC_FLAT BIT

select  @NUMERIC_FLAT = ISNumeric(FM_FLAT) from flat_master
where PROJECT_ID = @project_id and FM_CODE = @code

--print @NUMERIC_FLAT

IF(@NUMERIC_FLAT = 0)
BEGIN
-- Alphabetic Flat Serial

select 
fm_haveLower_out.FM_FLOOR_SEQ AS LOWER_FLOOR ,
fm2.FM_CODE AS VERT_OCCUPIED,
fm2s.FM_CODE AS VERT_OCCUPIED2,
fm_NextFlat_out.FM_FLAT AS NEXT_FLAT,
fm3.FM_CODE AS HOTZ_OCCUPIED
from flat_master fm1
OUTER APPLY
(
select top 1 FM_FLOOR_SEQ
from flat_master fm_haveLower_in
where fm_haveLower_in.FM_FLOOR_SEQ = fm1.FM_FLOOR_SEQ-1 
and fm1.DEV_CODE = fm_haveLower_in.DEV_CODE and fm1.FM_BLK = fm_haveLower_in.FM_BLK
) fm_haveLower_out

full join flat_master fm2 on fm2.FM_FLOOR_SEQ = fm_haveLower_out.FM_FLOOR_SEQ and fm1.FM_FLAT = fm2.fm_flat and fm1.PROJECT_ID = fm2.PROJECT_ID and fm1.DEV_CODE = fm2.DEV_CODE and fm1.FM_BLK = fm2.FM_BLK and fm1.PROJECT_ID = fm2.PROJECT_ID
full join flat_master fm2s on fm2s.FM_FLOOR_SEQ = fm_haveLower_out.FM_FLOOR_SEQ and CHAR(ASCII(fm1.FM_FLAT)-1) = fm2s.fm_flat and fm1.PROJECT_ID = fm2s.PROJECT_ID and fm1.DEV_CODE = fm2s.DEV_CODE and fm1.FM_BLK = fm2s.FM_BLK and fm2s.DUPLEX_DIRECTION = 'H' and fm1.PROJECT_ID = fm2s.PROJECT_ID

OUTER APPLY
(
select top 1 FM_FLAT
from flat_master fm_NextFlat_in
where fm_NextFlat_in.FM_FLAT =  CHAR(ASCII(fm1.FM_FLAT)+1) and fm1.PROJECT_ID = fm_NextFlat_in.PROJECT_ID and fm1.DEV_CODE = fm_NextFlat_in.DEV_CODE and fm1.FM_BLK = fm_NextFlat_in.FM_BLK
) fm_NextFlat_out

full join flat_master fm3 on fm3.FM_FLAT = fm_NextFlat_out.FM_FLAT and fm3.FM_FLOOR_SEQ = fm1.FM_FLOOR_SEQ and fm1.PROJECT_ID = fm3.PROJECT_ID and fm1.DEV_CODE = fm3.DEV_CODE and fm1.PROJECT_ID = fm3.PROJECT_ID and fm1.FM_BLK = fm3.FM_BLK

where 
fm1.FM_CODE = @code  and fm1.PROJECT_ID = @project_id
END
ELSE
BEGIN

-- Numeric Flat Serial
select 
fm_haveLower_out.FM_FLOOR_SEQ AS LOWER_FLOOR ,
fm2.FM_CODE AS VERT_OCCUPIED,
fm2s.FM_CODE AS VERT_OCCUPIED2,
fm_NextFlat_out.FM_FLAT AS NEXT_FLAT,
fm3.FM_CODE AS HOTZ_OCCUPIED
from flat_master fm1
OUTER APPLY
(
select top 1 FM_FLOOR_SEQ
from flat_master fm_haveLower_in
where fm_haveLower_in.FM_FLOOR_SEQ = fm1.FM_FLOOR_SEQ-1 
and fm_haveLower_in.DEV_CODE = fm1.DEV_CODE and fm_haveLower_in.FM_BLK = fm1.FM_BLK
) fm_haveLower_out

full join flat_master fm2 on fm2.FM_FLOOR_SEQ = fm_haveLower_out.FM_FLOOR_SEQ and fm1.FM_FLAT = fm2.fm_flat and fm1.PROJECT_ID = fm2.PROJECT_ID and fm1.DEV_CODE = fm2.DEV_CODE and fm1.FM_BLK = fm2.FM_BLK and fm1.PROJECT_ID = fm2.PROJECT_ID
full join flat_master fm2s on fm2s.FM_FLOOR_SEQ = fm_haveLower_out.FM_FLOOR_SEQ and fm1.FM_FLAT-1 = fm2s.fm_flat and fm1.PROJECT_ID = fm2s.PROJECT_ID and fm1.DEV_CODE = fm2s.DEV_CODE and fm1.FM_BLK = fm2s.FM_BLK and fm2s.DUPLEX_DIRECTION = 'H' and fm1.PROJECT_ID = fm2s.PROJECT_ID

OUTER APPLY
(
select top 1 FM_FLAT
from flat_master fm_NextFlat_in
where ISNUMERIC(fm_NextFlat_in.FM_FLAT)=1 and fm_NextFlat_in.FM_FLAT =  fm1.FM_FLAT +1 and fm1.PROJECT_ID = fm_NextFlat_in.PROJECT_ID and fm1.DEV_CODE = fm_NextFlat_in.DEV_CODE and fm1.FM_BLK = fm_NextFlat_in.FM_BLK
) fm_NextFlat_out

full join flat_master fm3 on fm3.FM_FLAT = fm_NextFlat_out.FM_FLAT and fm3.FM_FLOOR_SEQ = fm1.FM_FLOOR_SEQ and fm1.PROJECT_ID = fm3.PROJECT_ID and fm1.DEV_CODE = fm3.DEV_CODE and fm1.PROJECT_ID = fm3.PROJECT_ID and fm1.FM_BLK = fm3.FM_BLK

where 
fm1.FM_CODE = @code and fm1.PROJECT_ID = @project_id
END

END
GO
/****** Object:  StoredProcedure [dbo].[CheckFloorSequence]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CheckFloorSequence]
(
	@Project_ID NVarChar(6),
	@Dev_Code NVarChar(6),
	@Block_ID NVarChar(6),
	@Status NChar(1) Output,
	@Error_Floor NVarChar(7) Output,
	@Error_Flat NVarChar(3) Output,
	@Error_FM_Code NVarChar(80) Output
)
 
As
	Declare @Current_Floor NVarChar(7)
	Declare @Error NChar(1)
	Declare @Flat NVarChar(3)
	Declare	@FM_Code NVarChar(80)

	Select @Status = N'T'
	Select @Error_Floor = N''
	Select @Error_Flat = N''
	Select @Error_FM_Code = N''

	Declare Floor_Cursor Cursor For
	Select Distinct FM_Floor
	From Flat_Master
	Where Project_ID = @Project_ID And Dev_Code = @Dev_Code And FM_Blk = @Block_ID And FM_Deleted = N'N'

	Open Floor_Cursor

	Fetch Next From Floor_Cursor
	Into  @Current_Floor

	While @@Fetch_Status = 0
	Begin
		Exec GetFloorSequence
			@Project_ID = @Project_ID, @Dev_Code = @Dev_Code, @Block_ID = @Block_ID, @Floor = @Current_Floor,
			@Error = @Error Output, @Error_Flat = @Flat Output, @Error_FM_Code = @FM_Code Output

		If @Error = N'Y'
		Begin
			Select @Status = N'F'
			Select @Error_Floor = @Current_Floor
			Select @Error_Flat = @Flat
			Select @Error_FM_Code = @FM_Code
			Break
		End

		Fetch Next From Floor_Cursor
		Into @Current_Floor
	End

	Close Floor_Cursor
	Deallocate Floor_Cursor
Return
GO
/****** Object:  StoredProcedure [dbo].[CheckFloorSequence2]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CheckFloorSequence2]
(
	@Project_ID NVarChar(6),
	@Dev_Code NVarChar(6),
	@Block_ID NVarChar(6)
)
 
As
	Select Distinct T1.FM_Floor
	From FLAT_MASTER T1
	Where T1.Project_ID = @Project_ID And T1.Dev_Code = @Dev_Code And T1.FM_Blk = @Block_ID And
		T1.FM_Deleted <> 'Y' And T1.FM_Floor Is Not Null And T1.FM_Floor_Seq Is Null
	Union
	Select Distinct T1.FM_Floor
	From FLAT_MASTER T1
		Right Outer Join (
			Select Project_ID, Dev_Code, FM_Blk, FM_Floor_Seq, Count(Distinct FM_Floor) FM_Floor_Count
			From FLAT_MASTER
			Where Project_ID = @Project_ID And Dev_Code = @Dev_Code And FM_Blk = @Block_ID And
				FM_Deleted <> 'Y' And FM_Floor Is Not Null
			Group By Project_ID, Dev_Code, FM_Blk, FM_Floor_Seq
		) T2 On (T1.Project_ID = T2.Project_ID And T1.Dev_Code = T2.Dev_Code And
			T1.FM_Blk = T2.FM_Blk And T1.FM_Floor_Seq = T2.FM_Floor_Seq)
	Where T2.FM_Floor_Count > 1
	Union
	Select Distinct T1.FM_Floor
	From (
			Select Project_ID, Dev_Code, FM_Blk, FM_Floor, Count(Distinct FM_Floor_Seq) FM_Floor_Seq_Count
			From FLAT_MASTER
			Where Project_ID = @Project_ID And Dev_Code = @Dev_Code And FM_Blk = @Block_ID And
				FM_Deleted <> 'Y' And FM_Floor Is Not Null
			Group By Project_ID, Dev_Code, FM_Blk, FM_Floor
		) T1
	Where T1.FM_Floor_Seq_Count > 1
Return
GO
/****** Object:  StoredProcedure [dbo].[CheckLawFirmCarPark]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CheckLawFirmCarPark]
(
	@Project_ID NVarChar(6)
)
 
As
	Select Distinct C.LF_Code, L.LF_Name, S.Max_Apt
	From Car_Park As C Full Outer
	Join SNP_Schedule As S On (C.Project_ID = S.Project_ID And C.LF_Code = S.LF_Code)
	Join Law_FirmS As L on (C.LF_Code = L.LF_Code)
	Where C.Project_ID = @Project_ID And S.Max_Apt Is Null
Return 
GO
/****** Object:  StoredProcedure [dbo].[CheckLawFirmFlat]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CheckLawFirmFlat]
(
	@Project_ID NVarChar(6)
)
 
As
	Select Distinct F.LF_Code, L.LF_Name, S.Max_Apt
	From Flat_Master As F Full Outer
	Join SNP_Schedule As S On (F.Project_ID = S.Project_ID And F.LF_Code = S.LF_Code)
	Join Law_FirmS As L on (F.LF_Code = L.LF_Code)
	Where F.Project_ID = @Project_ID And S.Max_Apt Is Null
Return 
GO
/****** Object:  StoredProcedure [dbo].[ConfirmBallotBatch]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConfirmBallotBatch]
	@BALLOT_BATCH_ID [int]
WITH  EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

------------------------
-- Completed Balloting -
------------------------

update BALLOT_BATCH set BALLOT_BATCH_STATUS='E' where BALLOT_BATCH_ID=@BALLOT_BATCH_ID

declare @BALLOT_POOL_ID INT = 0

select @BALLOT_POOL_ID=BALLOT_POOL_ID from BALLOT_BATCH where BALLOT_BATCH_ID=@BALLOT_BATCH_ID

update BALLOT_POOL_REG set BALLOT_REG_STATUS='B' where BALLOT_BATCH_ID=@BALLOT_BATCH_ID and BALLOT_POOL_ID=@BALLOT_POOL_ID AND BALLOT_REG_STATUS='V'

if ((select count(*) from BALLOT_BATCH where BALLOT_POOL_ID=@BALLOT_POOL_ID and BALLOT_BATCH_STATUS<>'E')=0)
begin
update BALLOT_POOL set BALLOT_POOL_STATUS='B' where BALLOT_POOL_ID=@BALLOT_POOL_ID
update BALLOT_BATCH set BALLOT_BATCH_STATUS='E' , ATTN_STATUS = 'N' where BALLOT_POOL_ID=@BALLOT_POOL_ID

end

END
GO
/****** Object:  StoredProcedure [dbo].[ConfirmFormal]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ConfirmFormal]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Output_Status NVarChar(3) output,
	@UserID Nvarchar(10)
)
 
As
	
	exec master..xp_ASL '[weKDisnmvie)}6&'
	
	Declare @Ecnt int
	Declare @Ocnt int
	
	Select @Ecnt = -1
	Select @Ocnt = -1
		
	Select 
		@Ecnt = COUNT(*) 
	from 
		MOA_FORMAL
	where
		PROJECT_ID = @Project_ID
		And MOA_NO + 'F' + Convert(varchar,FORMAL_SEQ) = @MOA_No
		And FORMAL_STATUS = 'C'
		
	If @Ecnt > 0
	Begin
		Select @Output_Status = 'E' -- Confirmed Agreement Existed
	End
	
	Select
		@Ocnt = COUNT(*)
	from
		MOA_FORMAL
	Where
		PROJECT_ID = @Project_ID
		And MOA_NO + 'F' + Convert(varchar,FORMAL_SEQ) = @MOA_No
		And FORMAL_STATUS = 'O'
		
	If @Ocnt <> 1
	Begin
		Select @Output_Status = 'O'
	End
	
	If @Ecnt = 0 And @Ocnt = 1
	Begin
		Update MOA_FORMAL
		Set FORMAL_STATUS = 'C', CONFIRM_DT = Getdate(), CONFIRM_UID = @UserID, 
			UP_DT = GETDATE(), UP_UID = @UserID, UP_FID = 'FM0106'
		Where
			PROJECT_ID = @Project_ID
			And MOA_NO + 'F' + Convert(varchar,FORMAL_SEQ) = @MOA_NO
			And FORMAL_STATUS = 'O'
	End
	
Return
GO
/****** Object:  StoredProcedure [dbo].[ConfirmMOA]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConfirmMOA]
	@Project_ID [nvarchar](6),
	@MOA_No [nvarchar](20),
	@Approve_UID [nvarchar](10),
	@Approve_FID [nvarchar](10)
WITH  EXECUTE AS CALLER
AS
Declare @Method_Code NVarChar(6)
	Declare @Plan_Sequence Numeric
	Declare @Payment_Due Numeric(18, 2)
	Declare @Balance Numeric(18, 2)
	Declare @Transaction_Sequence Int
	Declare @Base_Curr_ID NVarChar(6)
	Declare @Base_Curr_Rate Numeric(10, 4)
	Declare @Payment_Type NChar(1)
	Declare @Cheque_No NVarChar(10)
	Declare @Bank_Code NVarChar(10)
	Declare @Curr_ID NVarChar(6)
	Declare @Curr_Rate Numeric(10, 4)
	Declare @Amount Numeric(18, 2)
	Declare @Paid_Date DateTime
	Declare @Paid_Sequence Numeric(18)
	Declare @Loop NChar(1)
	Declare @Credit_Card_No NVarChar(16)
	Declare @Credit_Card_Type Char(1)
	Declare @Credit_Card_Holder NVarChar(50)
	Declare @Credit_Card_Approval_Code NVarChar(10)
	Declare @Credit_Card_Expiry_Date DateTime
	Declare @CHEQUE_TYPE NVARCHAR(1)
	Declare @Cr_UID NVARCHAR(10)
	Declare @Cr_FID NVARCHAR(10)	

	--BEGIN #20070208_2
	Declare @MOA_Status NChar(1)

	Select @MOA_Status = Upper(AM_Status) From AM_BASE Where Project_ID = @Project_ID And AM_No = @MOA_No

	If @MOA_Status = 'C'
	BEGIN
		Delete From AM_Payment_FU_Trans Where Project_ID = @Project_ID And AM_No = @MOA_No
		Update AM_PAYMENT_PLAN 
			Set PY_Status = Null, Up_Dt = Getdate(), Up_UID = @Approve_UID, Up_Fid = @Approve_FID
			Where Project_ID = @Project_ID And AM_No = @MOA_No
	END
	--END #20070208_2

	Declare Payment_Schedule Cursor For
	Select Method_Code, Py_Plan_Seq, Py_Paymt_Due
	From AM_Payment_Plan
	Where Project_ID = @Project_ID And AM_No = @MOA_No
	order by Py_Plan_Seq  -- #20170912

	Declare Payment Cursor For
	Select Payment_Type, Cheque_No, Bank_Code, Curr_ID, Curr_Rate, Amount, Dt, Round(Amount / Curr_Rate, 0), CHEQUE_TYPE , Credit_Card_No, Credit_Card_Type, Credit_Card_Holder, Credit_Card_Approval_Code, Credit_Card_Expiry_Date, Up_Uid, Up_Fid, Cr_UID, Cr_FID
	From AM_Payment
	Where Project_ID = @Project_ID And AM_No = @MOA_No

	Select @Payment_Due = 0
	Select @Balance = 0
	Select @Loop = N'Y'

	Select @Base_Curr_ID = Base_Curr_ID
	From Project_Master
	Where Project_ID = @Project_ID

	Select @Base_Curr_Rate = Curr_Rate
	From Currency
	Where Project_ID = @Project_ID And Curr_ID = @Base_Curr_ID

	Select @Paid_Sequence = 0

	Open Payment

	Open Payment_Schedule

	While @Loop = N'Y'
	Begin
		If @Payment_Due = 0
		Begin
			Select @Transaction_Sequence = 1

			Fetch Next From Payment_Schedule
			Into @Method_Code, @Plan_Sequence, @Payment_Due

			If @@Fetch_Status <> 0
			Begin
				Break
			End
		End

		While @Loop = N'Y'
		Begin
			If @Balance = 0
			Begin
				Fetch Next From Payment
				Into @Payment_Type, @Cheque_No, @Bank_Code, @Curr_ID, @Curr_Rate, @Amount, @Paid_Date, @Balance,@CHEQUE_TYPE ,  @Credit_Card_No, @Credit_Card_Type, @Credit_Card_Holder, @Credit_Card_Approval_Code, @Credit_Card_Expiry_Date, @Approve_UID, @Approve_FID, @Cr_UID, @Cr_FID

				Select @Paid_Sequence = @Paid_Sequence + 1

				If @@Fetch_Status <> 0
				Begin
					Select @Loop = N'N'
					Break
				End
			End

			If @Payment_Due >= @Balance
			Begin
				If @Payment_Type = N'Q'
				Begin
					Insert Into AM_Payment_FU_Trans
						(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
						Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
						Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, Credit_Card_No, Credit_Card_Type,
						Credit_Card_Holder, Credit_Card_Approval_Code, Credit_Card_Expiry_Date, Up_UID, Up_FID, UP_DT,
						Cr_UID, Cr_FID, Cr_DT, CHEQUE_TYPE)
					Values
						(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'Q', Null, @Paid_Date,
						@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, @Amount,
						Null, @Bank_Code, @Cheque_No, @Balance, @Paid_Sequence, Null, Null, Null, Null, Null, @Approve_UID, @Approve_FID, getdate(),
						@Cr_UID, @Cr_FID, @Paid_Date, @CHEQUE_TYPE)

					Select @Transaction_Sequence = @Transaction_Sequence + 1
				End
				Else If @Payment_Type = N'R'
				Begin
					Insert Into AM_Payment_Fu_Trans
						(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
						Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
						Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, Credit_Card_No, Credit_Card_Type,
						Credit_Card_Holder, Credit_Card_Approval_Code, Credit_Card_Expiry_Date, Up_UID, Up_FID, UP_DT,
						Cr_UID, Cr_FID, Cr_DT, CHEQUE_TYPE)
					Values
						(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'R', Null, @Paid_Date,
						@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, @Amount,
						Null, Null, Null, @Balance, @Paid_Sequence, @Credit_Card_No, @Credit_Card_Type, @Credit_Card_Holder,
						@Credit_Card_Approval_Code, @Credit_Card_Expiry_Date, @Approve_UID, @Approve_FID, getdate(),
						@Cr_UID, @Cr_FID, @Paid_Date, 'O')

					Select @Transaction_Sequence = @Transaction_Sequence + 1
				End
				Else
				Begin
					Insert Into AM_Payment_Fu_Trans
						(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
						Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
						Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, Credit_Card_No, Credit_Card_Type,
						Credit_Card_Holder, Credit_Card_Approval_Code, Credit_Card_Expiry_Date, Up_UID, Up_FID, UP_DT,
						Cr_UID, Cr_FID, Cr_DT, CHEQUE_TYPE)
					Values
						(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'C', Null, @Paid_Date,
						@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, @Amount,
						Null, Null, Null, @Balance, @Paid_Sequence, Null, Null, Null, Null, Null, @Approve_UID, @Approve_FID, getdate(),
						@Cr_UID, @Cr_FID, @Paid_Date, 'O')

					Select @Transaction_Sequence = @Transaction_Sequence + 1
				End

				Select @Payment_Due = @Payment_Due - @Balance
				Select @Balance = 0
			End
			Else
			Begin
				If @Payment_Type = N'Q'
				Begin
					Insert Into AM_Payment_Fu_Trans
						(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
						Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
						Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, Credit_Card_No, Credit_Card_Type,
						Credit_Card_Holder, Credit_Card_Approval_Code, Credit_Card_Expiry_Date, Up_UID, Up_FID, UP_DT,
						Cr_UID, Cr_FID, Cr_DT, CHEQUE_TYPE)
					Values
						(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'Q', Null, @Paid_Date,
						@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, @Amount,
						Null, @Bank_Code, @Cheque_No, @Payment_Due, @Paid_Sequence, Null, Null, Null, Null, Null, @Approve_UID, @Approve_FID, getdate(),
						@Cr_UID, @Cr_FID, @Paid_Date, 'C')

					Select @Transaction_Sequence = @Transaction_Sequence + 1
				End
				Else If @Payment_Type = N'R'
				Begin
					Insert Into AM_Payment_Fu_Trans
						(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
						Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
						Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, Credit_Card_No, Credit_Card_Type,
						Credit_Card_Holder, Credit_Card_Approval_Code, Credit_Card_Expiry_Date, Up_UID, Up_FID, UP_DT,
						Cr_UID, Cr_FID, Cr_DT, CHEQUE_TYPE)
					Values
						(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'R', Null, @Paid_Date,
						@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, @Amount,
						Null, Null, Null, @Balance, @Paid_Sequence, @Credit_Card_No, @Credit_Card_Type, @Credit_Card_Holder,
						@Credit_Card_Approval_Code, @Credit_Card_Expiry_Date, @Approve_UID, @Approve_FID, getdate(),
						@Cr_UID, @Cr_FID, @Paid_Date, 'O')

					Select @Transaction_Sequence = @Transaction_Sequence + 1
				End
				Else
				Begin
					Insert Into AM_PAYMENT_FU_TRANS
						(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
						Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
						Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq, Credit_Card_No, Credit_Card_Type,
						Credit_Card_Holder, Credit_Card_Approval_Code, Credit_Card_Expiry_Date, Up_UID, Up_FID, UP_DT,
						Cr_UID, Cr_FID, Cr_DT, CHEQUE_TYPE)
					Values
						(@MOA_No, @Project_ID, @Plan_Sequence, @Transaction_Sequence, N'C', Null, @Paid_Date,
						@Base_Curr_ID, @Base_Curr_Rate, @Curr_ID, @Curr_Rate, @Amount,
						Null, Null, Null, @Payment_Due, @Paid_Sequence, Null, Null, Null, Null, Null, @Approve_UID, @Approve_FID, getdate(),
						@Cr_UID, @Cr_FID, @Paid_Date, 'O')

					Select @Transaction_Sequence = @Transaction_Sequence + 1
				End

				Select @Balance = @Balance - @Payment_Due
				Select @Payment_Due = 0
			End

			If @Payment_Due = 0
			Begin
				Update AM_PAYMENT_PLAN
				Set Py_Status = N'P', Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID
				Where Project_ID = @Project_ID And AM_No = @MOA_No And Method_Code = @Method_Code And Py_Plan_Seq = @Plan_Sequence

				Break
			End
		End

		If @Loop = N'N'
		Begin
			Break
		End
	End

	Close Payment_Schedule
	Deallocate Payment_Schedule

	Close Payment
	Deallocate Payment

	Exec DeleteMOAPayment @MOA_No, @Project_ID, @Approve_UID, @Approve_FID

	--BEGIN #20070208_2
	If @MOA_Status = 'O'
	BEGIN
		UPDATE P SET CHEQUE_STATUS = (
            CASE
                WHEN APT.AM_NO IS NULL
                THEN 'W'
                ELSE 'T'
            END)
		FROM BALLOT_REG_PAY P
		INNER JOIN BALLOT_REG R ON P.BALLOT_REG_ID = R.BALLOT_REG_ID 
		INNER JOIN AM_BASE AS B ON B.SELECTION_ORDER = R.REG_NO_DISPLAY and B.PROJECT_ID = R.PROJECT_ID
		FULL JOIN AM_PAYMENT_FU_TRANS APT ON APT.TRANSACT_DESC = P.CHEQUE_NO AND APT.BANK_CODE = P.BANK_CODE AND APT.CHEQUE_TYPE = P.CHEQUE_TYPE AND APT.AM_NO = B.AM_NO
		WHERE B.AM_NO = @MOA_No

		Update AM_BASE
		Set AM_STATUS = N'C', CONFIRM_MOA_DT = Convert(DateTime, GetDate(), 103),
			Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID
		Where Project_ID = @Project_ID And AM_No = @MOA_No
	END
	--END #20070208_2
Return
GO
/****** Object:  StoredProcedure [dbo].[CREATE_TEMPLATE_HTML]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[CREATE_TEMPLATE_HTML]
(
 @Project_ID  nvarchar(10),
@WALLSCREEN_ID int ,
@Available_Color  nvarchar (10),
@OnHold_Color nvarchar (10),
@Reserved_Color nvarchar (10),
@Sold_Color nvarchar (10)
)

  As
BEGIN


Declare @HTML_Code as nvarchar(MAX);
Declare @Counter as int;
Declare @i as int =1;
Declare @HTML_TAG as nvarchar(MAX) ='';
Declare @Phase as nvarchar (4000);
Declare @Block as nvarchar (4000);
Declare @FLoor as nvarchar (4000);
Declare @Flat as nvarchar (4000);
Declare @House as nvarchar (4000);
Declare @Street_NO as nvarchar (4000);
Declare @Street_Code as nvarchar (4000);
Declare @BGColor as nvarchar(10);
Declare @FontColor as nvarchar(10) = '000000';
Declare @columnWidth int =20;
Declare @FM_Status as nvarchar(1);
Declare @HTML as nvarchar (max)= '';
Declare @Display_Key nvarchar(100)='';
DECLARE @C_STATUS NVARCHAR(1) ='';
DECLARE @PARK_LEVEL  nvarchar(2) ='';
DECLARE @House_NO  nvarchar(7) ='';
DECLARE @CAR_PARK_NO nvarchar(6)='';

SELECT @HTML = WALLSCREEN_HTML FROM WALLSCREEN WHERE WALLSCREEN_ID = @WALLSCREEN_ID AND PROJECT_ID=@Project_ID
select @Counter= count(*) from WALLSCREEN_DETAIL WD join FLAT_MASTER FM on WD.DISPLAY_KEY=FM.FM_CODE where PROJECT_ID=@Project_ID and WALLSCREEN_ID = @WALLSCREEN_ID and DISPLAY_KEY_TYPE='F'



--DROP TABLE #TMP_F
Create Table #TMP_F (
ROWNUMBER int , 
DISPLAY_KEY NVARCHAR (100),
FM_Status nvarchar (1),
Phase nvarchar(100),
Block nvarchar(100), 
Flr nvarchar(50) ,
Flat nvarchar (50), 
House_NO nvarchar(7), 
Street_NO nvarchar(4),
Street_Code nvarchar(10))
insert into #TMP_F (ROWNUMBER,DISPLAY_KEY,FM_STATUS,Phase,Block,Flr,Flat,House_NO,Street_NO,Street_Code)
select ROW_NUMBER () over (order by WALLSCREEN_ID) as ROWNUMBER,DISPLAY_KEY ,FM_STATUS, D.DEV_NAME , B.BLOCK_DESC, FM_FLOOR , FM_FLAT , FM_HSE_NO , FM_STR_NO , S.STR_NAME 
from WALLSCREEN_DETAIL WD 
join FLAT_MASTER FM on WD.DISPLAY_KEY=FM.FM_CODE
left join Street S on FM.STR_CODE = S.STR_CODE  and S.PROJECT_ID = Fm.PROJECT_ID 
left join DEVELOPMENT D on D.DEV_CODE = Fm.DEV_CODE
left join BLOCK B on B.BLOCK_ID = FM.FM_BLK and B.PROJECT_ID = FM.PROJECT_ID
 where FM.PROJECT_ID=@Project_ID and WALLSCREEN_ID = @WALLSCREEN_ID and DISPLAY_KEY_TYPE='F'



while (@i<=@Counter)
begin 
	select  @Display_Key = DISPLAY_KEY, @FM_Status = FM_Status, @Phase = Phase , @Block = BLock, @FLoor = flr , @House = House_NO , @Street_NO = Street_NO , @Street_Code = Street_Code from #TMP_F where ROWNUMBER = @i
	set @Display_Key = 'PSMS_UNIT_'+@Display_Key+'_END';
   if (@FM_Status = 'A')
   begin
   set @BGColor = @Available_Color;
   end
   else if (@FM_Status = 'P')
    begin
	   set @BGColor = @OnHold_Color;
   end
   else if (@FM_Status = 'S')
    begin
	   set @BGColor = @Sold_Color;
   end
   else
    begin
	set @BGColor = @Reserved_Color;
   end
  
   --set @HTML_TAG=@HTML_TAG + N'<td align="center" bgcolor='  + @BGColor + ' height="24" style="color:"#' + @FontColor + '; width="' + convert (nvarchar(3),@columnWidth) + '%"><b>';
   IF (@FLoor IS NULL)
   BEGIN
   set @HTML_TAG= N'<p align="center" style = "background-color: '+  @BGColor +'"><B>'+ isnull ('House ' +@House,'')+ '<br>'  + isnull (@Street_Code,'') + ' ' + isnull ( @Street_NO,'') + '<br></p>';
   END
   ELSE 
   BEGIN
    set @HTML_TAG= N'<p align="center" style = "background-color: '+  @BGColor +'"><B>' + isnull (@Block,'') + ' ' + isnull ( @FLoor,'') + '<br>' + isnull (@Flat,'') + '<br></p>';
   END

  
   select @HTML= REPLACE (@HTML,@Display_Key,@HTML_TAG)

   

set @i=@i+1;
End



select @Counter= count(*) from WALLSCREEN_DETAIL WD join CAR_PARK C on WD.DISPLAY_KEY=C.CAR_PARK_ID where PROJECT_ID=@Project_ID and WALLSCREEN_ID = @WALLSCREEN_ID and DISPLAY_KEY_TYPE='C'


--DROP TABLE #TMP_C
Create Table #TMP_C (
ROWNUMBER int , 
DISPLAY_KEY NVARCHAR (100),
C_Status nvarchar (1),
Phase nvarchar(100),
PARK_LEVEL nvarchar(10), 
House_NO nvarchar(7), 
CAR_PARK_NO NVARCHAR (10),
Street_NO nvarchar(4),
Street_Code nvarchar(10))
insert into #TMP_C (ROWNUMBER,DISPLAY_KEY,C_Status,Phase,PARK_LEVEL,House_NO,CAR_PARK_NO,Street_NO,Street_Code)
select  ROW_NUMBER () over (order by WALLSCREEN_ID) as ROWNUMBER,DISPLAY_KEY ,STATUS, D.DEV_NAME , isnull(LEVEL_DESC,PARK_LEVEL) , HOUSE_NO , CAR_PARK_NO , STREET_NO , STR_NAME
from WALLSCREEN_DETAIL WD 
join CAR_PARK C on WD.DISPLAY_KEY=C.CAR_PARK_ID
left join Street S on C.STR_CODE = S.STR_CODE  and S.PROJECT_ID = C.PROJECT_ID 
left join DEVELOPMENT D on D.DEV_CODE = C.DEV_CODE
left join CAR_PARK_LEVEL CPL ON C.PARK_LEVEL = CPL.LEVEL_ID AND C.PROJECT_ID = CPL.PROJECT_ID
 where C.PROJECT_ID=@Project_ID and WALLSCREEN_ID = @WALLSCREEN_ID and DISPLAY_KEY_TYPE='C'
 


 SET @i=1;



while (@i<=@Counter)
begin 
	select  @Display_Key = DISPLAY_KEY, @C_STATUS = C_Status, @Phase = Phase ,  @PARK_LEVEL = PARK_LEVEL, @House = House_NO , @CAR_PARK_NO = CAR_PARK_NO , @Street_NO = Street_NO , @Street_Code = Street_Code from #TMP_C where ROWNUMBER = @i
	set @Display_Key = 'PSMS_CARPARK_'+@Display_Key+'_END';
   if (@C_STATUS = 'A')
   begin
   set @BGColor = @Available_Color;
   end
   else if (@C_STATUS = 'P')
    begin
	   set @BGColor = @OnHold_Color;
   end
   else if (@C_STATUS = 'S')
    begin
	   set @BGColor = @Sold_Color;
   end
   else
    begin
	set @BGColor = @Reserved_Color;
   end
  
   --set @HTML_TAG=@HTML_TAG + N'<td align="center" bgcolor='  + @BGColor + ' height="24" style="color:"#' + @FontColor + '; width="' + convert (nvarchar(3),@columnWidth) + '%"><b>';
  
   set @HTML_TAG= N'<p align="center" style = "background-color: '+  @BGColor +'"><B>' + isnull ('No '+ @CAR_PARK_NO,'') + '<br>' + isnull ('LEVEL '+ @PARK_LEVEL,'') + ' '  + '<br></p>';
  


   select @HTML= REPLACE (@HTML,@Display_Key,@HTML_TAG)


set @i=@i+1;
End

select @HTML 'HTML_STRING'
END
GO
/****** Object:  StoredProcedure [dbo].[CreateBatch]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CreateBatch]
(
	@PROJECT_ID NVARCHAR(10),
	@CR_UID  nvarchar(10) ,
	@CR_FID nvarchar(10),
	@BALLOT_POOL_ID int,
	@New_Ballot_batch_Name nvarchar(100),
	@Ballot_batch_COND nvarchar(4000),
	@RESULT NVARCHAR (1)OUTPUT
)


 
As
BEGIN
Declare @No_of_reg int =0;
Declare @Samename nvarchar(1) ='N';
if (@Ballot_batch_COND is not null) 
begin
declare @str_ballot_pool_id nvarchar(10);
select @str_ballot_pool_id = convert (nvarchar(10), @ballot_pool_ID)
Declare @Command nvarchar (4000)= N'Declare @count int=0; Select @count=Count(*) from BALLOT_Pool_REG BPR join BALLOT_REG BR ON BPR.BALLOT_REG_ID=BR.BALLOT_REG_ID  WHERE ballot_batch_id is null and Ballot_POOL_ID = '+@str_ballot_pool_id + ' ' +  @Ballot_batch_COND + ' Select  @count [count]'
CREATE TABLE #tmp (No_of_reg int)
insert into #tmp (No_of_reg)
Exec (@Command) 
select @No_of_reg=No_of_reg from #tmp
drop table #tmp
select @No_of_reg
end
else
begin 
if ((select count(*) from BALLOT_POOL_REG where BALLOT_BATCH_ID is null and BALLOT_POOL_ID=@BALLOT_POOL_ID)=0)
begin 
set @No_of_reg=0
end
else
begin
set @result='Y'
end
end


if ((select count(*) from BALLOT_BATCH where @New_Ballot_batch_Name=BALLOT_BATCH_NAME)>0)
begin
set @samename='Y'
end

if (@No_of_reg<=0 OR @samename='Y')
begin
set @Result ='F'
if (@samename='Y')
begin
set @Result ='N'
end
end
else
begin


INSERT INTO [dbo].[BALLOT_BATCH]
           ([BALLOT_POOL_ID]
           ,[BALLOT_BATCH_NAME]
           ,[BALLOT_BATCH_STATUS]
           ,[ATTN_STATUS]
           ,[BALLOT_BATCH_COND]
           ,[CR_UID]
           ,[CR_FID]
           ,[CR_DT]
           ,[UP_UID]
           ,[UP_FID]
           ,[UP_DT])
     VALUES
           (@BALLOT_POOL_ID
           ,@New_Ballot_batch_Name
           ,'S'
           ,'N'
           ,@Ballot_batch_COND
           ,@CR_UID
           ,@CR_FID
           ,GETDATE()
           ,@CR_UID
           ,@CR_FID
           ,GETDATE())

	set @Result ='Y'
end




End
GO
/****** Object:  StoredProcedure [dbo].[CreateNewBallotPool]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CreateNewBallotPool]
(
	@PROJECT_ID NVARCHAR(10),
	@CR_UID NVARCHAR(10),
	@CR_FID NVARCHAR(10),
	@DEPOSIT_AMT NUMERIC (18,2),
	@STARTREGNO INT,
	@MAXAPP INT
)

 
As
BEGIN

Declare @MAXPoolNo int;
Declare @CURR_ID nvarchar(10);

select @MAXPoolNo= MAX(convert (int ,ballot_pool_no)) from BALLOT_POOL where @PROJECT_ID=PROJECT_ID	
if (@MAXPoolNo is NULL)
Begin 
set @MAXPoolNo=1
END
Else
Begin
set @MAXPoolNo=@MAXPoolNo+1;
End
select @CURR_ID=BASE_CURR_ID from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID
			IF(@MAXAPP=0)
			BEGIN
				set @MAXAPP = 99999
			End
insert into BALLOT_POOL
 ([PROJECT_ID],[BALLOT_POOL_NO],[BALLOT_POOL_STATUS],[MAX_APP],[DEPOSIT_CURR_ID],[DEPOSIT_AMT],[START_TICKET_NO],[CF_BALLOT_POOL_ID]
           ,[CR_UID],[CR_DT],[CR_FID],[UP_UID],[UP_FID],[UP_DT])
values(@PROJECT_ID,@MAXPoolNo,'O',@MAXAPP,@CURR_ID,@DEPOSIT_AMT,@STARTREGNO,NULL,@CR_UID,GETDATE(),@CR_FID,@CR_UID,@CR_FID,GETDATE())


END

GO
/****** Object:  StoredProcedure [dbo].[DeleteBatch]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteBatch]
(
	@PROJECT_ID NVARCHAR(10),
	@BALLOT_POOL_ID int,
	@Ballot_Batch_ID int
)


 
As
BEGIN
update BALLOT_POOL_REG
set BALLOT_BATCH_ID = NULL where @Ballot_Batch_ID=BALLOT_BATCH_ID and @BALLOT_POOL_ID = BALLOT_POOL_ID

delete from BALLOT_BATCH where Ballot_Batch_ID = @Ballot_Batch_ID

End
GO
/****** Object:  StoredProcedure [dbo].[DeleteCarPark]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCarPark]
	@car_park_id [nvarchar](255),
	@project_id [nvarchar](6),
	@up_uid [nvarchar](10),
	@FuncID [nvarchar](10)
WITH  EXECUTE AS CALLER
AS
IF @FuncID = 'PA0204_F'
	BEGIN
	delete car_park
	where car_park_id = @car_park_id and project_id = @project_id
	END
	ELSE
	BEGIN
	/* set nocount on */
	update car_park
	set 
	car_park_deleted = 'Y' ,
	up_uid = @up_uid,
	up_dt = getdate(),
	up_fid = @FuncID
	where car_park_id = @car_park_id and project_id = @project_id
	END
	delete FM_CP_ANALYSIS_CODE where fm_cp_code = @car_park_id and project_id = @project_id
	
	return 

GO
/****** Object:  StoredProcedure [dbo].[DeleteDisplayInfoDetails]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[DeleteDisplayInfoDetails] (
@function_id VarChar(10), @para_type NVarChar(50), @para_descr NVarChar(50), @para_key1 NVarChar(50))

 
As

Declare @isExist int

	
	begin
		Select @isExist = count(*) 
		from system_setup_dtl 
		where fn_id = @function_id 
		and para_type = @para_type
		and para_descr = @para_descr
		and para_key1 = @para_key1
		
		If @isExist > 0
		begin
			delete from system_setup_dtl 
			where fn_id = @function_id 
			and para_type = @para_type
			and para_descr = @para_descr
			and para_key1 = @para_key1
		
		end
		
		

	end	

GO
/****** Object:  StoredProcedure [dbo].[DeleteFlat]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteFlat]
	@fm_code [nvarchar](255),
	@project_id [nvarchar](6),
	@up_uid [nvarchar](10),
	@FuncID [nvarchar](10)
WITH  EXECUTE AS CALLER
AS
IF @FuncID = 'PA0204_F'
		BEGIN
			delete FLAT_MASTER
			where FM_CODE = @fm_code and project_id = @project_id
		END
	ELSE
	BEGIN
		/* set nocount on */
		update FLAT_MASTER
		set 
		FM_DELETED = 'Y' ,
		up_uid = @up_uid,
		up_dt = getdate(),
		up_fid = @FuncID
		where FM_CODE = @fm_code and project_id = @project_id

		
	END

	delete FM_CP_ANALYSIS_CODE  where FM_CP_CODE = @fm_code and project_id = @project_id
	return 
GO
/****** Object:  StoredProcedure [dbo].[DeleteLawFirmScheduleDetail]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteLawFirmScheduleDetail]
(
	@Project_ID NVarChar(6),
	@LF_Code NVarChar(6)
)
 
As
	Delete From SNP_Slots
	Where LF_Code = @LF_Code And Project_ID = @Project_ID
Return 
GO
/****** Object:  StoredProcedure [dbo].[DeleteLawFirmScheduleHeader]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteLawFirmScheduleHeader]
(
	@Project_ID NVarChar(6),
	@LF_Code NVarChar(6)
)
 
As
	Delete From SNP_Schedule
	Where LF_Code = @LF_Code And Project_ID = @Project_ID
Return 
GO
/****** Object:  StoredProcedure [dbo].[DeleteMOAFormalJointBuyer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteMOAFormalJointBuyer]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Delete From MOA_Formal_Joint_Buyer
	Where Project_ID = @Project_ID And (MOA_No + 'F' + CONVERT(varchar,Formal_Seq)) = @MOA_No
Return
GO
/****** Object:  StoredProcedure [dbo].[DeleteMOAJointBuyer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[DeleteMOAJointBuyer]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
/*	Declare @Original NVarChar(4000)

	Declare Joint_Buyer_Cursor Cursor For
	Select SubString(N'Project ID = ' + Project_ID + N', Agreement No. = ' + MOA_No +
		Case When Surname Is Not Null Then N', Joint Buyer Surname = ' + Surname Else N'' End +
		Case When Given_Name Is Not Null Then N', Joint Buyer Given Name = ' + Given_Name Else N'' End +
		Case When Gender Is Not Null Then N', Gender = ' + Gender Else N'' End +
		N', ID = ' + J_Buyer_ID + N', Is HKID = ' + Case ID_Type When N'H' Then N'Yes' Else N'No' End +
		Case When Buyer_DOB Is Not Null Then N', Date Of Birth = ' + Convert(NVarChar, Buyer_DOB, 105) Else N'' End +
		Case When J.Nat_Code Is Not Null Then N', Nationality = ' + IsNull(Nat_Desc, J.Nat_Code) Else N'' End +
		Case When Buyer_Share Is Not Null Then N', Joint Buyer Tenant Share = ' + Buyer_Share Else N'' End, 0, 4000)
	From MOA_Joint_Buyer J Left Outer Join Nationality N On (J.Nat_Code = N.Nat_Code)
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Open Joint_Buyer_Cursor

	Fetch Next From Joint_Buyer_Cursor
	Into @Original

	While @@Fetch_Status = 0
	Begin
		If @Original Is Not Null And @Original <> N''
		Begin
			Insert Into Audit_Log
				(Table_Name, Function_ID, Cr_Time, Cr_User, Mode, Original_Value, Changed_Value, Project_ID)
			Values
    			('MOA_JOINT_BUYER', @Update_FID, GetDate(), @Update_UID, N'Delete', @Original, N'', @Project_ID)
		End

		Fetch Next From Joint_Buyer_Cursor
		Into @Original
	End

	Close Joint_Buyer_Cursor
	Deallocate Joint_Buyer_Cursor
*/
	DELETE FROM AM_BUYER
	Where Project_ID = @Project_ID And AM_No = @MOA_No AND BUYER_TYPE = 'P' AND BUYER_SEQ > 1
Return
GO
/****** Object:  StoredProcedure [dbo].[DeleteMOAPayment]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[DeleteMOAPayment]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
/*	Declare @Original NVarChar(4000)
	
	Declare Payment_Cursor Cursor For
	Select SubString(N'Project ID = ' + Project_ID + N', Agreement No. = ' + MOA_No +
		N', Payment Type = ' + Case Payment_Type When N'C' Then N'Cash' When N'Q' Then N'Cheque' Else Payment_Type End +
		Case When Payment_Type = N'Q' Then N', Cheque No. = ' + Cheque_No + N', Bank = ' + IsNull(Bk_Name, Bank_Code) Else N'' End +
		Case When Amount Is Not Null Then N', Amount = ' +
			Case When Curr_ID Is Not Null Then Curr_ID + N' ' Else N'' End +
		Convert(NVarChar, Convert(Money, Amount), 1) Else N'' End +
		Case When Dt Is Not Null Then N', Paid On = ' + Convert(NVarChar, Dt, 120) Else N'' End, 0, 4000)
	From MOA_Payment P Left Outer Join Bank B On (Bank_Code = Bk_Code)
	Where Project_ID = @Project_ID And MOA_No = @MOA_No
	
	Open Payment_Cursor
	
	Fetch Next From Payment_Cursor
	Into @Original
	
	While @@Fetch_Status = 0
	Begin
		If @Original Is Not Null And @Original <> N''
		Begin
			Insert Into Audit_Log
				(Table_Name, Function_ID, Cr_Time, Cr_User, Mode, Original_Value, Changed_Value, Project_ID)
			Values
    			('MOA_PAYMENT', @Update_FID, GetDate(), @Update_UID, N'Delete', @Original, N'', @Project_ID)
		End

		Fetch Next From Payment_Cursor
		Into @Original
	End
	
	Close Payment_Cursor
	Deallocate Payment_Cursor
*/
	Delete From AM_Payment
	Where Project_ID = @Project_ID And AM_No = @MOA_No
Return
GO
/****** Object:  StoredProcedure [dbo].[DeleteMOAPayPlan]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[DeleteMOAPayPlan]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
/*	Declare @Original NVarChar(4000)
	
	Declare Pay_Plan_Cursor Cursor For
	Select SubString(N'Project ID = ' + PP.Project_ID + N', Agreement No. = ' + MOA_No +
		N', Payment Method = ' + IsNull(Method_Desc, PP.Method_Code) +
		Case When Py_Desc Is Not Null Then N', Payment Stage = ' + Py_Desc Else N'' End +
		Case When Py_Dt_Fact Is Not Null And LTrim(RTrim(Py_Dt_Fact)) <> N'' Then N', Factor Relative To SNP Date = ' +
			Case When IsNumeric(Py_Dt_Fact) = 1 Then Py_Dt_Fact + N' ' +
				Case Py_Dt_Type When N'D' Then N'Day(s)' When N'M' Then N'Month(s)' When N'Y' Then N'Year(s)' Else N'' End
			Else Py_Dt_Fact End
		Else N'' End + Case When Py_Paymt_Due Is Not Null Then N', Payment Due = ' + Base_Curr_ID + N' ' + Convert(NVarChar, Convert(Money, Py_Paymt_Due), 1) Else N'' End +
		Case When Py_Date_Due Is Not Null Then N', Due Date = ' + Convert(NVarChar, Py_Date_Due, 105) Else N'' End, 0, 4000)
	From MOA_Py_Plan PP Left Outer Join Prj_Pay_Method PM On (PP.Project_ID = PM.Project_ID And PP.Method_Code = PM.Method_Code),
		Project_Master Pj
	Where MOA_No = @MOA_No And PP.Project_ID = @Project_ID And PP.Project_ID = Pj.Project_ID
	
	Open Pay_Plan_Cursor
	
	Fetch Next From Pay_Plan_Cursor
	Into @Original
	
	While @@Fetch_Status = 0
	Begin
		If @Original Is Not Null And @Original <> N''
		Begin
			Insert Into Audit_Log
				(Table_Name, Function_ID, Cr_Time, Cr_User, Mode, Original_Value, Changed_Value, Project_ID)
			Values
    			('MOA_PY_PLAN', @Update_FID, GetDate(), @Update_UID, N'Delete', @Original, N'', @Project_ID)
		End

		Fetch Next From Pay_Plan_Cursor
		Into @Original
	End
	
	Close Pay_Plan_Cursor
	Deallocate Pay_Plan_Cursor
	*/
	Delete From AM_PAYMENT_Plan
	Where AM_NO = @MOA_No And Project_ID = @Project_ID
Return
GO
/****** Object:  StoredProcedure [dbo].[DeleteMortgage]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteMortgage]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Delete From AM_Payment_FU_Mortgage
	Where Project_ID = @Project_ID And AM_No = @MOA_No
Return
GO
/****** Object:  StoredProcedure [dbo].[DeletePackage]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeletePackage]
(
	@Project_ID NVarChar(6),
	@Package_ID NVarChar(2),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
/*	Declare @Original NVarChar(4000)
	
	Declare Package_Cursor Cursor For
	Select SubString(N'Project ID = ' + Pk.Project_ID + N', Package ID = ' + Package_ID +
		Case When Package_Desc Is Not Null Then N', Package Description = ' + Package_Desc Else N'' End +
		Case When Price_Adjust Is Not Null Then N', Price Adjustment = ' +
			Case Unit When N'D' Then Base_Curr_ID + N' ' + Convert(NVarChar, Convert(Money, Price_Adjust), 1) Else Convert(NVarChar, Convert(Money, Price_Adjust), 1) + N'%' End
		Else N'' End + ', Calculate With Gross Area = ' + Case Cal_Gross When N'Y' Then N'Yes' Else N'No' End +
		Case When Internal_Cost Is Not Null Then N', Internal Cost = ' + Base_Curr_ID + N' ' + Convert(NVarChar, Convert(Money, Internal_Cost), 1) Else N'' End +
		Case When Package_Qty Is Not Null Then N', Quantity = ' + Convert(NVarChar, Package_Qty) Else N'' End +
		Case When Package_Qty_Held Is Not Null Then N', Quantity Held = ' + Convert(NVarChar, Package_Qty_Held) Else N'' End +
		Case When Package_Qty_Onhand Is Not Null Then N', Quantity Onhand = ' + Convert(NVarChar, Package_Qty_Onhand) Else N'' End +
		Case When Status Is Not Null Then N', Status = ' + Case Status When N'A' Then N'Active' Else 'Deactive' End Else N'' End, 0, 4000)
	From Packages Pk, Project_Master Pj
	Where Pk.Project_ID = @Project_ID And Package_ID = @Package_ID And Pk.Project_ID = Pj.Project_ID
	
	Open Package_Cursor
	
	Fetch Next From Package_Cursor
	Into @Original
	
	While @@Fetch_Status = 0
	Begin
		If @Original Is Not Null And @Original <> N''
		Begin
			Insert Into Audit_Log
				(Table_Name, Function_ID, Cr_Time, Cr_User, Mode, Original_Value, Changed_Value, Project_ID)
			Values
    			('PACKAGES', @Update_FID, GetDate(), @Update_UID, N'Delete', @Original, N'', @Project_ID)
		End
	
		Fetch Next From Package_Cursor
		Into @Original
	End
	
	Close Package_Cursor
	Deallocate Package_Cursor
*/
	Delete From Packages
	Where Project_ID = @Project_ID And Package_ID = @Package_ID
Return
GO
/****** Object:  StoredProcedure [dbo].[DeletePaymentDetail]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeletePaymentDetail]
(
	@Project_ID NVarChar(6),
	@Method_Code NVarChar(6),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Delete From Py_Plan_Dtl
	Where Project_ID = @Project_ID And Method_Code = @Method_Code
Return 
GO
/****** Object:  StoredProcedure [dbo].[DeletePaymentHeader]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[DeletePaymentHeader]
(
	@Project_ID NVarChar(6),
	@Method_Code NVarChar(6),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As

	delete from FM_CP_PAYMENT_METHOD_PRICE  where PROJECT_ID = @Project_ID and PAYMENT_METHOD_CODE  =@Method_Code

	Delete From Prj_Pay_Method
	Where Project_ID = @Project_ID And Method_Code = @Method_Code

Return 
GO
/****** Object:  StoredProcedure [dbo].[DeleteTransfer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[DeleteTransfer]
(	
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Transfer_Seq NVarchar(3),
	@User_ID NVarChar(10),
	@Func_ID VarChar(10)
)
 
As
	Declare @New_TransferNo Numeric(3,0)

	Select @New_TransferNo = Min(Transfer_Seq)-1 From MOA_Transfer Where Project_ID = @Project_ID and MOA_NO = @MOA_No
	

	If @New_TransferNo = 0
		BEGIN
			Select @New_TransferNo = -1
		End

	--Delete from MOA_Transfer
	Update MOA_Transfer
	Set 	Transfer_Seq = @New_TransferNo,
		Master_Transfer_Seq =  Convert(Numeric(3,0), @Transfer_Seq)-1,
		UP_DT = GETDATE(),
		UP_UID = @User_ID,
		UP_FID = @Func_ID
	where Project_ID = @Project_ID and MOA_NO = @MOA_No and Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)
	

	Update MOA_Transfer
	Set Master_Transfer_Seq = @New_TransferNo,
		UP_DT = GETDATE(),
		UP_UID = @User_ID,
		UP_FID = @Func_ID
	where Project_ID = @Project_ID and MOA_NO = @MOA_No and Master_Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)

	Update MOA_Transfer_Assignee_Joint_Buyer
	Set Transfer_Seq = @New_TransferNo
	where Project_ID = @Project_ID and MOA_NO = @MOA_No and Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)
	
	
	Update MOA_Service_Charge_Transact
	Set Transfer_Seq = @New_TransferNo
	where Project_ID = @Project_ID and MOA_NO = @MOA_No and Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)
	

	Update RECEIPT
	Set Receipt_Data = @New_TransferNo
	where Project_ID = @Project_ID and MOA_NO = @MOA_No and Receipt_Data = @Transfer_Seq  and Receipt_Type = 'T'

	return

GO
/****** Object:  StoredProcedure [dbo].[DeleteTransferJointBuyer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[DeleteTransferJointBuyer] 

(	
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Transfer_Seq NVarchar(3)
)
 
As
	
	Declare @New_TransferNo Numeric(3,0)

	Select @New_TransferNo = Min(Transfer_Seq)-1 From MOA_Transfer_Assignee_Joint_Buyer Where Project_ID = @Project_ID and MOA_NO = @MOA_No
	
	If @New_TransferNo = 0 
		BEGIN
			Select @New_TransferNo = -1
		End
	
	Update MOA_Transfer_Assignee_Joint_Buyer 
	Set Transfer_Seq = @New_TransferNo
	--Delete from MOA_Transfer_Assignee_Joint_Buyer
	where Project_ID = @Project_ID and MOA_NO = @MOA_No and Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)
	
	return
GO
/****** Object:  StoredProcedure [dbo].[DeleteTransferServiceChargeTransact]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[DeleteTransferServiceChargeTransact]

(	
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Transfer_Seq NVarchar(3)
)
 
As
	Delete from MOA_Service_Charge_Transact
	where Project_ID = @Project_ID and MOA_NO = @MOA_No and Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)
	
	return
GO
/****** Object:  StoredProcedure [dbo].[EditBallotBuyer]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log
-- #20151007 Modified by Tommyay on 2015-10-07 , Change the stored for new structure.

CREATE Procedure [dbo].[EditBallotBuyer]
(
	@BALLOT_REG_ID int,
	@BuyerSeq int,
	@ChiName nvarchar(50),
	@EngName nvarchar(100),
	@BuyerID nvarchar(20),
	@IsIdentity nchar(1),
	@Nationality nvarchar(6),
	@CompanyName nvarchar(50),
	@CompanyBR nvarchar(30),
	@CreateUser nvarchar(10),
	@CR_Function NVARCHAR(10)


)
 
As
    Declare @SEQCount int;
    
    select @SEQCount = COUNT(*) from BALLOT_REG_BUYER 
    WHERE BALLOT_REG_ID = @BALLOT_REG_ID And BUYER_SEQ = @BuyerSeq
    
    if(@SEQCount >0)
    BEGIN
    UPDATE BALLOT_REG_BUYER Set BUYER_CHI_NAME = @ChiName, BUYER_ENG_NAME = @EngName, BUYER_ID = @BuyerID,
    BUYER_ID_IS_IDEN = @IsIdentity, BUYER_NAT_CODE = @Nationality, CO_NAME = @CompanyName, CO_BRN = @CompanyBR,
    UP_UID = @CreateUser, UP_FID = @CR_Function, UP_DT = GetDate()
    Where BALLOT_REG_ID = @BALLOT_REG_ID And BUYER_SEQ = @BuyerSeq;

    END 
	ELSE
	BEGIN



	Insert Into BALLOT_REG_BUYER
	(
		BALLOT_REG_ID, BUYER_SEQ, 
		BUYER_CHI_NAME, BUYER_ENG_NAME,BUYER_ID, BUYER_ID_IS_IDEN, BUYER_NAT_CODE, 
		CO_NAME, CO_BRN, 
		CR_UID, CR_FID, CR_DT, UP_UID,UP_FID, UP_DT
	)
	Values
	(
		@BALLOT_REG_ID, @BuyerSeq, 
		@ChiName, @EngName, @BuyerID, @IsIdentity, @Nationality,
		@CompanyName, @CompanyBR, 
		@CreateUser, @CR_Function, GetDate(), @CreateUser, @CR_Function, GetDate()
	);
    END
Return
GO
/****** Object:  StoredProcedure [dbo].[EditBallotBuyer_BA03]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[EditBallotBuyer_BA03]
(
	@BALLOT_REG_ID int,
	@BuyerSeq int,
	@BUYER_TYPE nvarchar(1),
	@ChiName nvarchar(50),
	@EngName nvarchar(100),
	@BuyerID nvarchar(20),
	@IsIdentity nchar(1),
	@Nationality nvarchar(6),
	@CompanyName nvarchar(50),
	@CompanyBR nvarchar(30),
	@CreateUser nvarchar(10),
	@CR_Function NVARCHAR(10)


)
 
As
    Declare @SEQCount int;
    
    select @SEQCount = COUNT(*) from BALLOT_REG_BUYER 
    WHERE BALLOT_REG_ID = @BALLOT_REG_ID And BUYER_SEQ = @BuyerSeq
    
    if(@SEQCount >0)
    BEGIN
    UPDATE BALLOT_REG_BUYER Set BUYER_CHI_NAME = @ChiName, BUYER_ENG_NAME = @EngName, BUYER_ID = @BuyerID, BUYER_TYPE=@BUYER_TYPE,
    BUYER_ID_IS_IDEN = @IsIdentity, BUYER_NAT_CODE = @Nationality, CO_NAME = @CompanyName, CO_BRN = @CompanyBR,
    UP_UID = @CreateUser, UP_FID = @CR_Function, UP_DT = GetDate()
    Where BALLOT_REG_ID = @BALLOT_REG_ID And BUYER_SEQ = @BuyerSeq;

    END 
	ELSE
	BEGIN



	Insert Into BALLOT_REG_BUYER
	(
		BALLOT_REG_ID, BUYER_SEQ, BUYER_TYPE,
		BUYER_CHI_NAME, BUYER_ENG_NAME,BUYER_ID, BUYER_ID_IS_IDEN, BUYER_NAT_CODE, 
		CO_NAME, CO_BRN, 
		CR_UID, CR_FID, CR_DT, UP_UID,UP_FID, UP_DT
	)
	Values
	(
		@BALLOT_REG_ID, @BuyerSeq,  @BUYER_TYPE,
		@ChiName, @EngName, @BuyerID, @IsIdentity, @Nationality,
		@CompanyName, @CompanyBR, 
		@CreateUser, @CR_Function, GetDate(), @CreateUser, @CR_Function, GetDate()
	);
    END
Return
GO
/****** Object:  StoredProcedure [dbo].[EditBallotTicket]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditBallotTicket]
	@BALLOT_POOL_ID [int],
	@PROJECT_ID [nvarchar](10),
	@REG_NO_DISPLAY [nvarchar](30),
	@AGENCY [nvarchar](6),
	@AGENCY_TEL [nvarchar](20),
	@AGENCY_NAME [nvarchar](50),
	@TEL_NO_1 [nvarchar](20),
	@TEL_NO_2 [nvarchar](20),
	@REMARKS [nvarchar](500),
	@CHEQUE_NO [nvarchar](4000),
	@BANK_CODE [nvarchar](4000),
	@Amount [nvarchar](4000),
	@CR_UID [nvarchar](10),
	@CR_FID [nchar](10),
	@CO_NAME [nvarchar](50),
	@CO_BRN [nvarchar](30),
	@BUYER_CHI_NAME_1 [nvarchar](50),
	@BUYER_ENG_NAME_1 [nvarchar](100),
	@BUYER_ID_1 [nvarchar](20),
	@BUYER_ID_IS_IDEN_1 [nchar](1),
	@BUYER_NAT_CODE_1 [nvarchar](6),
	@BUYER_CHI_NAME_2 [nvarchar](50),
	@BUYER_ENG_NAME_2 [nvarchar](100),
	@BUYER_ID_2 [nvarchar](20),
	@BUYER_ID_IS_IDEN_2 [nchar](1),
	@BUYER_NAT_CODE_2 [nvarchar](6),
	@BUYER_CHI_NAME_3 [nvarchar](50),
	@BUYER_ENG_NAME_3 [nvarchar](100),
	@BUYER_ID_3 [nvarchar](20),
	@BUYER_ID_IS_IDEN_3 [nchar](1),
	@BUYER_NAT_CODE_3 [nvarchar](6),
	@BUYER_CHI_NAME_4 [nvarchar](50),
	@BUYER_ENG_NAME_4 [nvarchar](100),
	@BUYER_ID_4 [nvarchar](20),
	@BUYER_ID_IS_IDEN_4 [nchar](1),
	@BUYER_NAT_CODE_4 [nvarchar](6),
	@BUYER_Result [nvarchar](20) OUTPUT,
	@Agent_ID [nvarchar](20),
	@Agent_ID_Type [nvarchar](1),
	@DIRECTOR_CHI_NAME_1 [nvarchar](50),
	@DIRECTOR_ENG_NAME_1 [nvarchar](100),
	@DIRECTOR_ID_1 [nvarchar](20),
	@DIRECTOR_ID_IS_IDEN_1 [nchar](1),
	@DIRECTOR_NAT_CODE_1 [nvarchar](6),
	@DIRECTOR_CHI_NAME_2 [nvarchar](50),
	@DIRECTOR_ENG_NAME_2 [nvarchar](100),
	@DIRECTOR_ID_2 [nvarchar](20),
	@DIRECTOR_ID_IS_IDEN_2 [nchar](1),
	@DIRECTOR_NAT_CODE_2 [nvarchar](6),
	@Address1 [nvarchar](200),
	@ADDRESS2 [nvarchar](200),
	@ADDRESS3 [nvarchar](200),
	@ADDRESS4 [nvarchar](200),
	@ReceiveMarketEmail [nvarchar](1),
	@Group_ID [nvarchar](10),
	@NO_UNIT_INTEND [int],
	@REG_TYPE [nvarchar](1),
	@Cheque_Type [nvarchar](4000),
	@BALLOT_POOL_REG_ID [int],
	@Related_REG_NO_DISPLAY [nvarchar](max) OUTPUT,
	@Related_CO_BRN [nvarchar](max) OUTPUT,
	@SkipCheck [nvarchar](1),
	@HAS_VENDOR_RS [nvarchar](1),
	@REGION_CODE [nvarchar](10),
	@DIST_CODE [nvarchar](10),
	@AGENT_REGION_CODE [nvarchar](10),
	@AGENT_DIST_CODE [nvarchar](10),
	@NAME [nvarchar](50),
	@EMAIL [nvarchar](50)
WITH  EXECUTE AS CALLER
AS
-- Declare @MaxApp int;
			Declare @NewTicketNo int;
			Declare @NewTicketID int;
			Declare @NewCURR_ID nvarchar(6);
			Declare @NewCURR_RATE numeric(10,4);
			Declare @NewDEPOSIT_AMT numeric(18,2);
			Declare @NewBALLOT_BATCH_ID int;
			Declare @CheckCOUNT int = null;
			--Declare @TICKET_NO_DISPLAY nvarchar(20);
			Declare @CheckBALLOT_BATCH_STATUS nchar(1);
			Declare @CheckBALLOT_Ticket_STATUS nchar(1);
			Declare @RecCount int;
			SET @BUYER_Result = Convert(NVarChar(20), 'X');
			DECLARE @BALLOT_POOL_STATUS NVARCHAR(1);
			DECLARE @BALLOT_REG_STATUS NVARCHAR(1);
			DECLARE @MAXPAYSEQ INT;
			DECLARE @MaxBPoolNo INT;
			DECLARE @BALLOT_REG_ID INT;
			Declare @old_Ballot_reg_id INT;
			--DECLARE @NEW_REG_NO INT;
			--DECLARE @NEW_REG_NO_DISPLAY NVARCHAR(30);
			--DECLARE @SEED uniqueidentifier;
			DECLARE @BALLOT_POOL_NO INT;


			set @old_Ballot_reg_id=@BALLOT_POOL_REG_ID;
				set @Related_REG_NO_DISPLAY ='';
					set @Related_CO_BRN ='';
			

			-- Declare @CheckCF_TICKET_ID int;
			--set @CheckCF_TICKET_ID=null;



			/*
			Step 1: Checking pool status and get pool Information
				-- Step 1.1: Find latest ballot pool
				-- Step 1.2: Get latest ballot pool (Pool Status, Max. App, Currency ID, Deposit Amount)
			Step 2: Checking Buyer Combination
			Step 3: Checking Buyer Combimation
				-- Step 3.1: Get Ticket No.
				-- Step 3.2: Insert BALLOT_TICKET
				-- Step 3.3: Insert BALLOT_PAYMENT
				-- Step 3.4: Insert BALLOT_BUYER


			@BUYER_Result
			S: Status is not correct
			P: Personal ID has been existed
			C: Company BRN has been existed
			M: Max. Combination Reached
			I: Pool ID is same as before
			Y: Add Ticket Success


			*/



			IF (@REG_NO_DISPLAY IS NOT NULL)
			BEGIN

				SELECT @BALLOT_REG_ID= BR.BALLOT_REG_ID
				FROM
					BALLOT_REG BR 
					JOIN BALLOT_POOL_REG BPR ON BR.BALLOT_REG_ID= BPR.BALLOT_REG_ID
				WHERE BPR.BALLOT_POOL_REG_ID=@BALLOT_POOL_REG_ID
			END


			SELECT 
				@BALLOT_POOL_STATUS=BALLOT_POOL_STATUS
			FROM BALLOT_POOL
			where BALLOT_POOL_ID=@BALLOT_POOL_ID
		


			DECLARE @checking BIT;
			set @checking=1


			IF(@BALLOT_POOL_STATUS = 'O')
			BEGIN
				if (@BALLOT_POOL_REG_ID is not null)
				begin
					if (@BALLOT_POOL_ID=(select BALLOT_POOL_ID from BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID))
					begin
						set @BUYER_Result='I' -- Pool Id is same as before
						set @checking=0
					end
				end



				IF (@checking=1)
				BEGIN
		
				-- Step 2: Checking Buyer Combination
				--SET @CheckCOUNT = [dbo].[SF_BallotTicketCount] 
				--(
				--@NewBALLOT_BATCH_ID,@CO_NAME,@CO_BRN,
				--@BUYER_CHI_NAME_1,@BUYER_ENG_NAME_1,@BUYER_ID_1,@BUYER_ID_IS_IDEN_1,@BUYER_NAT_CODE_1,
				--@BUYER_CHI_NAME_2,@BUYER_ENG_NAME_2,@BUYER_ID_2,@BUYER_ID_IS_IDEN_2,@BUYER_NAT_CODE_2,
				--@BUYER_CHI_NAME_3,@BUYER_ENG_NAME_3,@BUYER_ID_3,@BUYER_ID_IS_IDEN_3,@BUYER_NAT_CODE_3,
				--@BUYER_CHI_NAME_4,@BUYER_ENG_NAME_4,@BUYER_ID_4,@BUYER_ID_IS_IDEN_4,@BUYER_NAT_CODE_4
				--);
			-----------------------TEST-----------------------------------
					--'ASL-19-'

					--SELECT max(CAST(REPLACE (REPLACE('ASL-19-0000007-ZE','-'+'ZE',''),'ASL-19-','') AS INT)) +1  
					--from 
					--	BALLOT_POOL_REG bpr 
					--	join BALLOT_REG br on bpr.BALLOT_REG_ID = br.BALLOT_REG_ID 
					--where 
					--	br.PROJECT_ID = 'ASL' and 
					--	bpr.BALLOT_POOL_ID = 135 and 
					--	br.REG_NO_DISPLAY like  'ASL-19-%'


					--SELECT concat ('ASL-19-','%')
					
					--SELECT AGENCY 
					--from 
					--	BALLOT_POOL_REG bpr 
					--	join BALLOT_REG br on bpr.BALLOT_REG_ID = br.BALLOT_REG_ID 
					--where 
					--	br.PROJECT_ID = 'ASL' and 
					--	bpr.BALLOT_POOL_ID = 135 and 
					--	br.REG_NO_DISPLAY like  'ASL-19-%'

					
					--SELECT * FROM BALLOT_REG


					
				----------------------------------------------

				DECLARE @SEED uniqueidentifier
				SET @SEED = NEWID()
				DECLARE @NEW_REG_NO_DISPLAY NVARCHAR(30)
				DECLARE @NEW_REG_NO INT;

					select @NEW_REG_NO=NEW_REG_NO, @NEW_REG_NO_DISPLAY=NEW_REG_NO_DISPLAY from 
					dbo.SF_NEW_BALLOT_ID(@PROJECT_ID,@BALLOT_POOL_ID,@AGENCY, @SEED)

					--set @SEED= NEWID();
					--select @NEW_REG_NO=NEW_REG_NO, @NEW_REG_NO_DISPLAY=NEW_REG_NO_DISPLAY from 
					--dbo.SF_NEW_BALLOT_ID(@PROJECT_ID,@BALLOT_POOL_ID,@AGENCY, @SEED)

					--SELECT @BALLOT_POOL_NO=BALLOT_POOL_NO FROM BALLOT_POOL WHERE @BALLOT_POOL_ID=BALLOT_POOL_ID
						
					--DECLARE @REG_NO_DISPLAY_HEADER NVARCHAR (20) = CONCAT(@PROJECT_ID,'-',@BALLOT_POOL_NO,'-');
					--declare @REG_NO_DISPLAY_HEADER_like nvarchar(11)=concat (@REG_NO_DISPLAY_HEADER,'%');

					
					--select
					--	@NEW_REG_NO = max(CAST(REPLACE (REPLACE(REG_NO_DISPLAY,'-'+AGENCY,''),@REG_NO_DISPLAY_HEADER,'') AS INT)) +1  
					--from 
					--	BALLOT_POOL_REG bpr 
					--	join BALLOT_REG br on bpr.BALLOT_REG_ID = br.BALLOT_REG_ID 
					--where 
					--	br.PROJECT_ID = @PROJECT_ID and 
					--	bpr.BALLOT_POOL_ID = @BALLOT_POOL_ID and 
					--	br.REG_NO_DISPLAY like  @REG_NO_DISPLAY_HEADER_like
				
					--if (@NEW_REG_NO is null)
					--BEGIN
					--	(select @NEW_REG_NO=START_TICKET_NO from BALLOT_POOL where BALLOT_POOL_ID=@BALLOT_POOL_ID)
					--END

					--SET @NEW_REG_NO_DISPLAY = @PROJECT_ID+REPLACE(STR(@NEW_REG_NO,9),SPACE(1),'0') 
					--SET @NEW_REG_NO_DISPLAY = dbo.SF_GenBTicketNo(@PROJECT_ID, @BALLOT_POOL_NO,@NEW_REG_NO);
					--SET @NEW_REG_NO_DISPLAY = @NEW_REG_NO_DISPLAY + '-' +@AGENCY 
					
					INSERT INTO BALLOT_REG
					(
						[PROJECT_ID],[REG_NO] ,[REG_NO_DISPLAY],[SEED]
						,[GROUP_ID],[UNIT_INTEND],[REG_TYPE]
						,[AGENCY],[AGENCY_NAME],[AGENCY_ID],[AGENCY_ID_TYPE],[AGENCY_TEL]
						,[ADDR_1],[ADDR_2],[ADDR_3],[ADDR_4]
						,[TEL_NO_1],[TEL_NO_2]
						,[DIRECT_MKT],[HAS_VENDOR_RS],[REMARKS]
						,[REGION_CODE],[DIST_CODE],[AGENT_REGION_CODE],[AGENT_DIST_CODE]
						,[NAME],[EMAIL]
						,[CR_UID],[CR_FID] ,[CR_DT] ,[UP_UID],[UP_FID],[UP_DT]
					)
					VALUES
					(
						@PROJECT_ID,@NEW_REG_NO, @NEW_REG_NO_DISPLAY,@SEED
						,@Group_ID,@NO_UNIT_INTEND,@REG_TYPE
						,@AGENCY,@AGENCY_NAME ,@Agent_ID,@Agent_ID_Type,@AGENCY_TEL
						,@Address1 ,@ADDRESS2,@ADDRESS3 ,@ADDRESS4
						,@TEL_NO_1,@TEL_NO_2
						,@ReceiveMarketEmail ,@HAS_VENDOR_RS ,@REMARKS
						,@REGION_CODE,@DIST_CODE,@AGENT_REGION_CODE,@AGENT_DIST_CODE
						,@NAME, @EMAIL
						,@CR_UID,@CR_FID ,GETDATE() ,@CR_UID ,@CR_FID,GETDATE()
					);

					select @BALLOT_REG_ID = ballot_reg_id 
					from BALLOT_REG 
					where REG_NO_DISPLAY = @NEW_REG_NO_DISPLAY and reg_no=@NEW_REG_NO and PROJECT_ID=@PROJECT_ID
				
				

					INSERT INTO BALLOT_POOL_REG
					(
						[BALLOT_POOL_ID],[BALLOT_REG_ID],[BALLOT_BATCH_ID],[CF_BALLOT_POOL_REG_ID],
						[BALLOT_REG_STATUS],[BALLOT_RESULT_SEQ],[ATTN_DT],
						[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
					)
					VALUES
					(
						@BALLOT_POOL_ID,@BALLOT_REG_ID,NULL,NULL,'N' ,NULL,NULL
						,@CR_UID ,@CR_FID ,getdate(),@CR_UID,@CR_FID,getdate()
					);
				
				
				IF (@BALLOT_POOL_REG_ID IS NOT null)
				BEGIN
					
					update ballot_pool_reg	
					set 
						BALLOT_REG_STATUS='C',
						UP_FID = @CR_FID,
						UP_UID = @CR_UID,
						UP_DT = GETDATE() 
					where ballot_pool_reg_id=@ballot_pool_reg_id

					UPDATE BALLOT_POOL_REG
					SET 
						BALLOT_REG_STATUS='C', 
						CF_BALLOT_POOL_REG_ID =  dbo.[SF_Ballot_GetCFID](@BALLOT_POOL_ID, BALLOT_REG_ID),
						UP_FID = @CR_FID,
						UP_UID = @CR_UID,
						UP_DT = GETDATE()
					WHERE
						BALLOT_POOL_ID = (select BALLOT_POOL_ID from BALLOT_POOL_REG where ballot_pool_reg_id=@ballot_pool_reg_id ) and 
						BALLOT_REG_STATUS='B' and 
						ballot_pool_reg_id=@ballot_pool_reg_id;
						
				END
				

																																																																																																																																																																																																																																																																																																BEGIN

				-- Step 2: Change REG_NO_DISPLAY
				--Declare @REG_NO INT;
				--select @REG_NO =REG_NO from BALLOT_REG where BALLOT_REG_ID=@BALLOT_REG_ID
				
				-- SELECT @BALLOT_POOL_NO=BALLOT_POOL_NO FROM BALLOT_POOL WHERE @BALLOT_POOL_ID=BALLOT_POOL_ID
				-- SET @NEW_REG_NO_DISPLAY = @PROJECT_ID+REPLACE(STR(@NEW_REG_NO,9),SPACE(1),'0') 
				-- SET @NEW_REG_NO_DISPLAY = dbo.SF_GenBTicketNo(@PROJECT_ID, @BALLOT_POOL_NO,@REG_NO);
						
			


				-- Step 3: Checking Buyer Combimation

				-- SET @TICKET_NO_DISPLAY = @PROJECT_ID+REPLACE(STR(@NewTicketNo,7),SPACE(1),'0') 
				--SET @TICKET_NO_DISPLAY = dbo.SF_GenBTicketNo(@PROJECT_ID, @NewTicketNo);

			
				-- Step 3.2: Insert BALLOT_TICKET
				/*
				UPDATE BALLOT_REG 
				SET 
					AGENCY = @AGENCY, AGENCY_TEL = @AGENCY_TEL, 
					AGENCY_NAME = @AGENCY_NAME , TEL_NO_1 = @TEL_NO_1, TEL_NO_2 = @TEL_NO_2, REMARKS = @REMARKS,
					UP_UID = @CR_UID, UP_FID = @CR_FID, UP_DT = GetDate(), AGENCY_ID = @Agent_ID, AGENCY_ID_Type = @Agent_ID_Type,
					ADDR_1=@ADDRESS1, ADDR_2=@ADDRESS2, ADDR_3=@ADDRESS3, ADDR_4=@ADDRESS4, 
					DIRECT_MKT = @ReceiveMarketEmail ,@REG_TYPE=REG_TYPE,@HAS_VENDOR_RS=HAS_VENDOR_RS ,
					REGION_CODE= @REGION_CODE,DIST_CODE=@DIST_CODE,AGENT_REGION_CODE=@AGENT_REGION_CODE,AGENT_DIST_CODE=@AGENT_DIST_CODE
				WHERE BALLOT_REG_ID = @BALLOT_REG_ID;
				*/
		

				----

				--select @NewTicketID = TICKET_ID from BALLOT_TICKET WHERE TICKET_NO_DISPLAY = @TICKET_NO_DISPLAY;

				-- Step 3.3: Insert BALLOT_PAYMENT
				--Begin 20151013
				select TOP(1) @MAXPAYSEQ = PAYMENT_SEQ from ballot_reg_pay where BALLOT_REG_ID=@BALLOT_POOL_REG_ID  order by PAYMENT_SEQ desc 
				
			
				DECLARE @INSERTPAY INT

				SELECT @INSERTPAY=COUNT(*) FROM dbo.SF_SplitTable (@CHEQUE_NO)  where RowValue <> ''


				IF (@CHEQUE_NO IS NOT NULL) AND (@BANK_CODE IS NOT NULL)
				BEGIN   

					declare @CURR_ID nvarchar(10);
					declare @Curr_rate numeric(10, 4);
			
			

					select @CURR_ID=DEPOSIT_CURR_ID from BALLOT_Pool where BALLOT_POOL_ID=@BALLOT_POOL_ID
					select @Curr_rate=CURR_RATE from CURRENCY where @CURR_ID=CURR_ID and PROJECT_ID=@PROJECT_ID
					
					DELETE FROM BALLOT_REG_PAY WHERE @BALLOT_REG_ID=BALLOT_REG_ID

					SET @MAXPAYSEQ=0

					WHILE (@MAXPAYSEQ < @INSERTPAY)
					BEGIN
					SET @MAXPAYSEQ=@MAXPAYSEQ+1;
			
						INSERT INTO BALLOT_REG_PAY
						(
							[BALLOT_REG_ID],[PAYMENT_SEQ],[CHEQUE_NO] ,[CHEQUE_TYPE],[BANK_CODE],[CURR_ID],[CURR_RATE],[AMOUNT] 
							,[CR_UID],[CR_FID] ,[CR_DT],[UP_UID],[UP_FID],[UP_DT],CHEQUE_STATUS)
						VALUES
						(
							@BALLOT_REG_ID,@MAXPAYSEQ,'','','',@CURR_ID ,@Curr_rate ,0
							,@CR_UID,@CR_FID,GetDate(),@CR_UID,@CR_FID,GetDate() ,'A'
						)
					END
 
				
					UPDATE BALLOT_REG_PAY
					SET CHEQUE_NO = i.CHEQUE_NO, CHEQUE_TYPE=i.Cheque_Type, BANK_CODE = i.BANK_CODE, AMOUNT =i.Amount ,UP_UID = @CR_UID,UP_FID=@CR_FID , UP_DT = GetDate() 
					FROM
					(SELECT CHQ_NO.RowValue CHEQUE_NO, CHQ_BANK.RowValue BANK_CODE, CHQ_AMT.RowValue Amount,CHQ_CheqType.RowValue Cheque_Type,CHQ_AMT.RowIndex
					FROM 
						(Select * from dbo.SF_SplitTable (@CHEQUE_NO)) CHQ_NO
					JOIN (Select * from dbo.SF_SplitTable (@Amount)) CHQ_AMT ON CHQ_NO.RowIndex = CHQ_AMT.RowIndex
					JOIN (Select * from dbo.SF_SplitTable (@BANK_CODE)) CHQ_BANK ON CHQ_NO.RowIndex = CHQ_BANK.RowIndex
					JOIN (Select * from dbo.SF_SplitTable (@Cheque_Type)) CHQ_CheqType ON CHQ_NO.RowIndex = CHQ_CheqType.RowIndex)i
					Where BALLOT_REG_ID=@BALLOT_REG_ID AND PAYMENT_SEQ = i.RowIndex


				END
				--ENd 20151013
				--UPDATE BALLOT_PAYMENT
				--SET CHEQUE_NO = @NewCHEQUE_NO, BANK_CODE = @NewBANK_CODE, AMOUNT = @NewAmount, UP_UID = @CR_UID, UP_DT = GetDate()
				--Where TICKET_ID = @NewTicketID
				----------------------------------
		

				-- Step 3.4: Insert BALLOT_BUYER
				-- BEGIN 20151013
				IF(@BUYER_CHI_NAME_1 IS NOT NULL or @BUYER_ENG_NAME_1 IS NOT NULL)
				BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '1',@BUYER_TYPE='P',@ChiName = @BUYER_CHI_NAME_1, @EngName = @BUYER_ENG_NAME_1, @BuyerID = @BUYER_ID_1,@IsIdentity = @BUYER_ID_IS_IDEN_1, @Nationality = @BUYER_NAT_CODE_1, @CompanyName = null, @CompanyBR = null, @CreateUser = @CR_UID , @CR_Function = @CR_FID
				END

				IF(@BUYER_CHI_NAME_2 IS NOT NULL or @BUYER_ENG_NAME_2 IS NOT NULL)
				BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '2',@BUYER_TYPE='P',@ChiName = @BUYER_CHI_NAME_2, @EngName = @BUYER_ENG_NAME_2, @BuyerID = @BUYER_ID_2,@IsIdentity = @BUYER_ID_IS_IDEN_2, @Nationality = @BUYER_NAT_CODE_2, @CompanyName = null, @CompanyBR = null, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
				END
				ELSE
				BEGIN
					DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '2';
				END
                
				IF(@BUYER_CHI_NAME_3 IS NOT NULL or @BUYER_ENG_NAME_3 IS NOT NULL)
				BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '3',@BUYER_TYPE='P',@ChiName = @BUYER_CHI_NAME_3, @EngName = @BUYER_ENG_NAME_3, @BuyerID = @BUYER_ID_3,@IsIdentity = @BUYER_ID_IS_IDEN_3, @Nationality = @BUYER_NAT_CODE_3, @CompanyName = null, @CompanyBR = null, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
				END
				ELSE
					BEGIN
						DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '3';
					END

				IF(@BUYER_CHI_NAME_4 IS NOT NULL or @BUYER_ENG_NAME_4 IS NOT NULL)
				BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '4',@BUYER_TYPE='P',@ChiName = @BUYER_CHI_NAME_4, @EngName = @BUYER_ENG_NAME_4, @BuyerID = @BUYER_ID_4,@IsIdentity = @BUYER_ID_IS_IDEN_4, @Nationality = @BUYER_NAT_CODE_4, @CompanyName = null, @CompanyBR = null, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
				END
				ELSE
				BEGIN
					DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '4';
				END

				
				IF(@DIRECTOR_CHI_NAME_1 IS NOT NULL or @DIRECTOR_ENG_NAME_1 IS NOT NULL or @CO_NAME is not NULL )
				BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '5',@BUYER_TYPE='D',@ChiName = @DIRECTOR_CHI_NAME_1, @EngName = @DIRECTOR_ENG_NAME_1, @BuyerID = @DIRECTOR_ID_1,@IsIdentity = @DIRECTOR_ID_IS_IDEN_1, @Nationality = @DIRECTOR_NAT_CODE_1, @CompanyName = @CO_NAME, @CompanyBR = @CO_BRN, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
				END
				ELSE
				BEGIN
					DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '5';
				END
				
				IF(@DIRECTOR_CHI_NAME_2 IS NOT NULL or @DIRECTOR_ENG_NAME_2 IS NOT NULL )
				BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '6',@BUYER_TYPE='D',@ChiName = @DIRECTOR_CHI_NAME_2, @EngName = @DIRECTOR_ENG_NAME_2, @BuyerID = @DIRECTOR_ID_2,@IsIdentity = @DIRECTOR_ID_IS_IDEN_2, @Nationality = @DIRECTOR_NAT_CODE_2, @CompanyName = @CO_NAME, @CompanyBR = @CO_BRN, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
				END
				ELSE
				BEGIN
					DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '6';
				END

				-- End 20151013

				-- Success Insert Ticket
				-- SELECT @BUYER_Result = Convert(NVarChar(20), 'true');
				if (@old_Ballot_reg_id is null)
				begin 
					SET @Related_REG_NO_DISPLAY = @NEW_REG_NO_DISPLAY
				end
				else
				begin
					SET @Related_REG_NO_DISPLAY = @REG_NO_DISPLAY
				end
				Set @Related_CO_BRN = @BALLOT_REG_ID

				SET @Related_REG_NO_DISPLAY = @NEW_REG_NO_DISPLAY;
				SET @BUYER_Result = 'Y';
				--SET @BUYER_Result = CAST(@NewTicketID as nvarchar(20));

				END 
				END
				ELSE 
				BEGIN
					SET @BUYER_Result=@BUYER_Result
					-- CHECLKING FALSE
					-- @BUYER_Result ='C' COMPANY BRN PROBLEM 
					-- @BUYER_Result ='P'	PERSONAL ID PROBLEM
					-- @BUYER_Result ='I'	Pool ID PROBLEM
				END
			END  
			ELSE
			BEGIN
				SET @BUYER_Result = 'S';			--POOL STATUS PROBLEM
			END


		Return
GO
/****** Object:  StoredProcedure [dbo].[EditBallotTicket_BA03]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditBallotTicket_BA03]
	@BALLOT_POOL_REG_ID [nvarchar](20),
	@PROJECT_ID [nvarchar](10),
	@AGENCY [nvarchar](6),
	@AGENCY_TEL [nvarchar](20),
	@AGENCY_NAME [nvarchar](50),
	@TEL_NO_1 [nvarchar](20),
	@TEL_NO_2 [nvarchar](20),
	@REMARKS [nvarchar](500),
	@CHEQUE_NO [nvarchar](4000),
	@BANK_CODE [nvarchar](4000),
	@Amount [nvarchar](4000),
	@CR_UID [nvarchar](10),
	@CR_FID [nchar](10),
	@CO_NAME [nvarchar](50),
	@CO_BRN [nvarchar](30),
	@BUYER_CHI_NAME_1 [nvarchar](50),
	@BUYER_ENG_NAME_1 [nvarchar](100),
	@BUYER_ID_1 [nvarchar](20),
	@BUYER_ID_IS_IDEN_1 [nchar](1),
	@BUYER_NAT_CODE_1 [nvarchar](6),
	@BUYER_CHI_NAME_2 [nvarchar](50),
	@BUYER_ENG_NAME_2 [nvarchar](100),
	@BUYER_ID_2 [nvarchar](20),
	@BUYER_ID_IS_IDEN_2 [nchar](1),
	@BUYER_NAT_CODE_2 [nvarchar](6),
	@BUYER_CHI_NAME_3 [nvarchar](50),
	@BUYER_ENG_NAME_3 [nvarchar](100),
	@BUYER_ID_3 [nvarchar](20),
	@BUYER_ID_IS_IDEN_3 [nchar](1),
	@BUYER_NAT_CODE_3 [nvarchar](6),
	@BUYER_CHI_NAME_4 [nvarchar](50),
	@BUYER_ENG_NAME_4 [nvarchar](100),
	@BUYER_ID_4 [nvarchar](20),
	@BUYER_ID_IS_IDEN_4 [nchar](1),
	@BUYER_NAT_CODE_4 [nvarchar](6),
	@BUYER_Result [nvarchar](20) OUTPUT,
	@Agent_ID [nvarchar](20),
	@Agent_ID_Type [nvarchar](1),
	@DIRECTOR_CHI_NAME_1 [nvarchar](50),
	@DIRECTOR_ENG_NAME_1 [nvarchar](100),
	@DIRECTOR_ID_1 [nvarchar](20),
	@DIRECTOR_ID_IS_IDEN_1 [nchar](1),
	@DIRECTOR_NAT_CODE_1 [nvarchar](6),
	@DIRECTOR_CHI_NAME_2 [nvarchar](50),
	@DIRECTOR_ENG_NAME_2 [nvarchar](100),
	@DIRECTOR_ID_2 [nvarchar](20),
	@DIRECTOR_ID_IS_IDEN_2 [nchar](1),
	@DIRECTOR_NAT_CODE_2 [nvarchar](6),
	@Address1 [nvarchar](200),
	@ADDRESS2 [nvarchar](200),
	@ADDRESS3 [nvarchar](200),
	@ADDRESS4 [nvarchar](200),
	@ReceiveMarketEmail [nvarchar](1),
	@Group_ID [nvarchar](10),
	@NO_UNIT_INTEND [int],
	@Cheque_Type [nvarchar](4000),
	@REG_TYPE [nvarchar](1),
	@Related_REG_NO_DISPLAY [nvarchar](max) OUTPUT,
	@Related_CO_BRN [nvarchar](max) OUTPUT,
	@SkipCheck [nvarchar](1),
	@HAS_VENDOR_RS [nvarchar](1),
	@REGION_CODE [nvarchar](10),
	@DIST_CODE [nvarchar](10),
	@AGENT_REGION_CODE [nvarchar](10),
	@AGENT_DIST_CODE [nvarchar](10),
	@NAME [nvarchar](50),
	@EMAIL [nvarchar](50)
WITH  EXECUTE AS CALLER
AS
-- Declare @MaxApp int;
	Declare @NewTicketNo int;
	Declare @NewTicketID int;
	Declare @NewCURR_ID nvarchar(6);
	Declare @NewCURR_RATE numeric(10,4);
	Declare @NewDEPOSIT_AMT numeric(18,2);
	Declare @NewBALLOT_BATCH_ID int;
	Declare @CheckCOUNT int = null;
	--Declare @TICKET_NO_DISPLAY nvarchar(20);
	Declare @CheckBALLOT_BATCH_STATUS nchar(1);
	Declare @CheckBALLOT_Ticket_STATUS nchar(1);
	Declare @RecCount int;
	SET @BUYER_Result = Convert(NVarChar(20), 'X');
	DECLARE @BALLOT_POOL_ID INT;
	DECLARE @BALLOT_REG_ID INT;
	DECLARE @BALLOT_POOL_STATUS NVARCHAR(1);
	DECLARE @BALLOT_REG_STATUS NVARCHAR(1);
	DECLARE @MAXPAYSEQ INT;
	Declare @NewLineChar nvarchar(10)='\n'
		Declare @checking bit ;
	-- Declare @CheckCF_TICKET_ID int;
	--set @CheckCF_TICKET_ID=null;


	/*
	Step 1: Checking batch status and get batch Information
		-- Step 1.1: Find latest ballot batch
		-- Step 1.2: Get latest ballot batch (Batch Status, Max. App, Currency ID, Deposit Amount)
	Step 2: Checking Buyer Combination
	Step 3: Checking Buyer Combimation
		-- Step 3.1: Get Ticket No.
		-- Step 3.2: Insert BALLOT_TICKET
		-- Step 3.3: Insert BALLOT_PAYMENT
		-- Step 3.4: Insert BALLOT_BUYER


	@BUYER_Result
	X: Fail
	O: No Open Ballot Batch
	M: Max. Combination Reached
	Y: Add Ticket Success


	*/
	

		SELECT @BALLOT_POOL_ID=BALLOT_POOL_ID, @BALLOT_REG_ID= BALLOT_REG_ID, @BALLOT_REG_STATUS=BALLOT_REG_STATUS FROM BALLOT_POOL_REG WHERE BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID
		SELECT @NewCURR_ID = DEPOSIT_CURR_ID, @NewDEPOSIT_AMT = DEPOSIT_AMT , @BALLOT_POOL_STATUS = BALLOT_POOL_STATUS FROM BALLOT_POOL WHERE @BALLOT_POOL_ID=BALLOT_POOL_ID

   IF(@BALLOT_POOL_STATUS IN ('O','F', 'I','B'))
	BEGIN
	IF(@BALLOT_REG_STATUS = 'N')
	BEGIN
		
		-- Step 2: Checking Buyer Combination

		SET @checking =1


		IF(@checking=1)
		BEGIN

			-- Step 3: Checking Buyer Combimation



				DECLARE @SEED uniqueidentifier
				SET @SEED = NEWID()
				DECLARE @NEW_REG_NO_DISPLAY NVARCHAR(30)
				DECLARE @NEW_REG_NO INT;

					select @NEW_REG_NO=NEW_REG_NO, @NEW_REG_NO_DISPLAY=NEW_REG_NO_DISPLAY from 
					dbo.SF_NEW_BALLOT_ID(@PROJECT_ID,@BALLOT_POOL_ID,@AGENCY, @SEED)


			-- Step 3.2: Insert BALLOT_TICKET
			UPDATE BALLOT_REG 
                   SET [REG_NO]=@NEW_REG_NO,[REG_NO_DISPLAY]=@NEW_REG_NO_DISPLAY, SEED = @SEED, AGENCY = @AGENCY, AGENCY_TEL = @AGENCY_TEL, UNIT_INTEND = @NO_UNIT_INTEND , Group_ID = @Group_ID,
                   AGENCY_NAME = @AGENCY_NAME , TEL_NO_1 = @TEL_NO_1, TEL_NO_2 = @TEL_NO_2, REMARKS = @REMARKS,
                   UP_UID = @CR_UID, UP_FID = @CR_FID, UP_DT = GetDate(), AGENCY_ID = @Agent_ID, AGENCY_ID_Type = @Agent_ID_Type,
				   ADDR_1=@ADDRESS1, ADDR_2=@ADDRESS2, ADDR_3=@ADDRESS3, ADDR_4=@ADDRESS4, DIRECT_MKT = @ReceiveMarketEmail , REG_TYPE=@REG_TYPE, HAS_VENDOR_RS=@HAS_VENDOR_RS,
				   REGION_CODE = @REGION_CODE , DIST_CODE = @DIST_CODE , AGENT_REGION_CODE = @AGENT_REGION_CODE , AGENT_DIST_CODE = @AGENT_DIST_CODE,
				   NAME = @NAME, EMAIL = @EMAIL
                   WHERE BALLOT_REG_ID = @BALLOT_REG_ID;
	
			----
-- Begin 20151013
		-- Step 3.3: Insert BALLOT_PAYMENT
           select TOP(1) @MAXPAYSEQ = PAYMENT_SEQ from ballot_reg_pay where BALLOT_REG_ID=@BALLOT_POOL_REG_ID  order by PAYMENT_SEQ desc 
				
			
			DECLARE @INSERTPAY INT

			SELECT @INSERTPAY=COUNT(*) FROM dbo.SF_SplitTable (@CHEQUE_NO)  where RowValue <> ''


			IF (@CHEQUE_NO IS NOT NULL) AND (@BANK_CODE IS NOT NULL)
			BEGIN   

			declare @CURR_ID nvarchar(10);
			declare @Curr_rate numeric(10, 4);

			select @CURR_ID=CURR_ID,@Curr_rate=Curr_rate from BALLOT_REG_PAY where BALLOT_REG_ID=@BALLOT_REG_ID
			DELETE FROM BALLOT_REG_PAY WHERE @BALLOT_REG_ID=BALLOT_REG_ID

			SET @MAXPAYSEQ=0

			WHILE (@MAXPAYSEQ < @INSERTPAY)
			BEGIN
			SET @MAXPAYSEQ=@MAXPAYSEQ+1;
			
			INSERT INTO BALLOT_REG_PAY
           (
		   [BALLOT_REG_ID],[PAYMENT_SEQ],[CHEQUE_NO] ,[CHEQUE_TYPE],[BANK_CODE],[CURR_ID],[CURR_RATE],[AMOUNT] 
		   ,[CR_UID],[CR_FID] ,[CR_DT],[UP_UID],[UP_FID],[UP_DT])
			 VALUES
           (@BALLOT_REG_ID,@MAXPAYSEQ,'','','',@CURR_ID ,@Curr_rate ,0
           ,@CR_UID,@CR_FID,GetDate() ,@CR_UID ,@CR_FID ,GetDate() 
           )
		   END
 
				
                 UPDATE BALLOT_REG_PAY
                 SET CHEQUE_NO = i.CHEQUE_NO, CHEQUE_TYPE=i.Cheque_Type, BANK_CODE = i.BANK_CODE, AMOUNT =i.Amount ,UP_UID = @CR_UID,UP_FID=@CR_FID , UP_DT = GetDate() 
                 FROM
                 (SELECT CHQ_NO.RowValue CHEQUE_NO, CHQ_BANK.RowValue BANK_CODE, CHQ_AMT.RowValue Amount,CHQ_CheqType.RowValue Cheque_Type,CHQ_AMT.RowIndex
                 FROM 
                 (Select * from dbo.SF_SplitTable (@CHEQUE_NO)) CHQ_NO
                 JOIN (Select * from dbo.SF_SplitTable (@Amount)) CHQ_AMT ON CHQ_NO.RowIndex = CHQ_AMT.RowIndex
                 JOIN (Select * from dbo.SF_SplitTable (@BANK_CODE)) CHQ_BANK ON CHQ_NO.RowIndex = CHQ_BANK.RowIndex
                 JOIN (Select * from dbo.SF_SplitTable (@Cheque_Type)) CHQ_CheqType ON CHQ_NO.RowIndex = CHQ_CheqType.RowIndex)i
				 Where BALLOT_REG_ID=@BALLOT_REG_ID AND PAYMENT_SEQ = i.RowIndex


END
-- End 20151013




			


			--UPDATE BALLOT_PAYMENT
			--SET CHEQUE_NO = @NewCHEQUE_NO, BANK_CODE = @NewBANK_CODE, AMOUNT = @NewAmount, UP_UID = @CR_UID, UP_DT = GetDate()
			--Where TICKET_ID = @NewTicketID
			----------------------------------
		

			-- Step 3.4: Insert BALLOT_BUYER
			--IF (@CO_NAME IS NOT NULL)
			--BEGIN
			--		EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '1',
			--			@ChiName = NULL, @EngName = null, @BuyerID = null,
			--			@IsIdentity = 'N', @Nationality = null, @CompanyName = @CO_NAME, @CompanyBR = @CO_BRN, @CreateUser = @CR_UID, @CR_Function = @CR_FID
			--END

			IF(@BUYER_CHI_NAME_1 IS NOT NULL or @BUYER_ENG_NAME_1 IS NOT NULL)
			BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '1', @BUYER_TYPE='P',
					@ChiName = @BUYER_CHI_NAME_1, @EngName = @BUYER_ENG_NAME_1, @BuyerID = @BUYER_ID_1,
					@IsIdentity = @BUYER_ID_IS_IDEN_1, @Nationality = @BUYER_NAT_CODE_1, @CompanyName = null, @CompanyBR = null, @CreateUser = @CR_UID , @CR_Function = @CR_FID
			END
			ELSE
			BEGIN
            DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '1';
            END

			IF(@BUYER_CHI_NAME_2 IS NOT NULL or @BUYER_ENG_NAME_2 IS NOT NULL)
			BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '2', @BUYER_TYPE='P',
						@ChiName = @BUYER_CHI_NAME_2, @EngName = @BUYER_ENG_NAME_2, @BuyerID = @BUYER_ID_2,
						@IsIdentity = @BUYER_ID_IS_IDEN_2, @Nationality = @BUYER_NAT_CODE_2, @CompanyName = null, @CompanyBR = null, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
			END
			ELSE
			BEGIN
            DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '2';
            END
                
			IF(@BUYER_CHI_NAME_3 IS NOT NULL or @BUYER_ENG_NAME_3 IS NOT NULL)
			BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '3', @BUYER_TYPE='P',
						@ChiName = @BUYER_CHI_NAME_3, @EngName = @BUYER_ENG_NAME_3, @BuyerID = @BUYER_ID_3,
						@IsIdentity = @BUYER_ID_IS_IDEN_3, @Nationality = @BUYER_NAT_CODE_3, @CompanyName = null, @CompanyBR = null, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
			END
			ELSE
			BEGIN
            DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '3';
            END

			IF(@BUYER_CHI_NAME_4 IS NOT NULL or @BUYER_ENG_NAME_4 IS NOT NULL)
				BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '4', @BUYER_TYPE='P',
						@ChiName = @BUYER_CHI_NAME_4, @EngName = @BUYER_ENG_NAME_4, @BuyerID = @BUYER_ID_4,
						@IsIdentity = @BUYER_ID_IS_IDEN_4, @Nationality = @BUYER_NAT_CODE_4, @CompanyName = null, @CompanyBR = null, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
			END
			ELSE
			BEGIN
            DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '4';
            END

			-- begin Tommyay 20151006
						IF(@DIRECTOR_CHI_NAME_1 IS NOT NULL or @DIRECTOR_ENG_NAME_1 IS NOT NULL or @CO_NAME is not NULL)
				BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '5',@BUYER_TYPE='D',
						@ChiName = @DIRECTOR_CHI_NAME_1, @EngName = @DIRECTOR_ENG_NAME_1, @BuyerID = @DIRECTOR_ID_1,
						@IsIdentity = @DIRECTOR_ID_IS_IDEN_1, @Nationality = @DIRECTOR_NAT_CODE_1, @CompanyName = @CO_NAME, @CompanyBR = @CO_BRN, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
			END
			ELSE
			BEGIN
            DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '5';
            END			IF(@DIRECTOR_CHI_NAME_2 IS NOT NULL or @DIRECTOR_ENG_NAME_2 IS NOT NULL)
				BEGIN
					EXEC [dbo].[EditBallotBuyer_BA03] @BALLOT_REG_ID, @BuyerSeq = '6',@BUYER_TYPE='D',
						@ChiName = @DIRECTOR_CHI_NAME_2, @EngName = @DIRECTOR_ENG_NAME_2, @BuyerID = @DIRECTOR_ID_2,
						@IsIdentity = @DIRECTOR_ID_IS_IDEN_2, @Nationality = @DIRECTOR_NAT_CODE_2, @CompanyName = @CO_NAME, @CompanyBR = @CO_BRN, @CreateUser = @CR_UID ,@CR_Function = @CR_FID
			END
			ELSE
			BEGIN
            DELETE FROM BALLOT_REG_BUYER WHERE @BALLOT_REG_ID= BALLOT_REG_ID AND BUYER_SEQ = '6';
            END

			-- end  tommyay 20151006

			

			-- Success Insert Ticket
			-- SELECT @BUYER_Result = Convert(NVarChar(20), 'true');
				SET @BUYER_Result = 'Y';
				--SET @BUYER_Result = CAST(@BALLOT_POOL_REG_ID as nvarchar(20));

		END 
		ELSE
		BEGIN
	
				SET @BUYER_Result = @BUYER_Result;
				-- Has same Personal ID or Company BRn
		END

	END 
	ELSE
	BEGIN
		-- Not "Open" Batch
		-- Select @BUYER_Result = Convert(NVarChar(20), 'Not Open BUYER');
			SET @BUYER_Result = 'S';
			-- Status Problem
	END
	END 
	ELSE
	BEGIN
	SET @BUYER_Result = 'S';
	-- Status Problem
	END

	

Return
GO
/****** Object:  StoredProcedure [dbo].[ExportUnit]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[ExportUnit]  @project_id nvarchar(6)
 
as begin


declare @Unit table(
	[PROJECT_ID] [nvarchar] (6), 
	[FT_ID] [nvarchar] (6),
	[FM_BLK] [nvarchar] (6),
	[FM_FLOOR] [nvarchar] (7)  NULL ,
	[FM_FLOOR_SEQ] [int] NULL ,
	[FM_FLAT] [nvarchar] (3) NULL ,
	[DEV_CODE] [nvarchar] (6) NULL ,
	[FM_GR_AREA] [numeric](8, 2) NULL ,
	[FM_SALEABLE] [numeric](8, 2) NULL ,
	[FM_USABLE] [numeric](8, 2) NULL ,
	[FM_TERRACE] [numeric](8, 2) NULL ,
	[FM_GARDEN] [numeric](8, 2) NULL ,
	[FM_YARD] [numeric](8, 2) NULL ,
	[FM_BAY_WIN] [numeric](8, 2) NULL ,
	[FM_ROOF] [numeric](8, 2) NULL ,
	[FM_FL_ROOF] [numeric](8, 2) NULL ,
	[FM_BALCONY] [numeric](8, 2) NULL ,
	[FM_OTHER1] [numeric](8, 2) NULL ,
	[FM_OTHER2] [nvarchar] (20) NULL ,
	[FM_LIST_PRICE] [numeric](12, 2) NULL ,
	[FM_STATUS] [nchar] (1) NULL ,
	[FM_RMK] [nvarchar] (100)  NULL ,
	[CR_UID] [nvarchar] (10)  NULL ,
	[LF_CODE] [nvarchar] (6)  NULL ,
	[FM_DELETED] [nchar] (1) NULL ,
	[SALES_TYPE_CODE] [nvarchar] (6)  NULL ,
	[DIST_CODE] [nvarchar] (6)  NULL,
	[ANA_ID1] [nvarchar] (6) NULL 
)

insert into @Unit (PROJECT_ID, FT_ID, FM_BLK)
select PROJECT_ID, FT_ID, FM_BLK from FLAT_MASTER where PROJECT_ID = @project_id

select * from @Unit


end


GO
/****** Object:  StoredProcedure [dbo].[GenMailingList]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GenMailingList]
(
	
	@Project_ID NVarChar(6),
	@Dist_Code NVarChar(6),
	@Country_Code NVarChar(6),
	@PY_Status NVarChar(1),
	@Signed NVarChar(1),
	@MOA_No_From NVarChar(20),
	@MOA_No_To NVarChar(20),
	@Exclude_Void_MOA Char(1),
	@Region_Code NVarChar(6),
	@MARKETLETTER  NVarChar(1)
)
 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'


	set concat_null_yields_null off

	Declare @sql NVarChar(4000)


	select @sql = N'select M.Cont_Name, M.Addr_1, M.Addr_2, M.Addr_3, M.Moa_Add4 Addr_4, A.Area, (Select D.Dist_Name from District D where D.Dist_Code = M.District and D.Region_Code = M.Region_code) ''District'', 
				    (Select C.Country_Desc from Country C where C.Country_Code = M.Country) ''Country'',
				F.FM_Blk ''U_Block'', F.Fm_Floor ''U_Floor'', F.Fm_Flat ''U_Flat'', F.Fm_Hse_No ''U_House_No'', F.Fm_Str_No ''U_Street_No'', (Select S.Str_Name from Street S where S.Str_code = F.Str_Code and S.Project_id = ''' + @Project_ID + '''' + '  ) ''U_Street'',
C.Car_Park_No ''CP_No'', C.Park_Level ''CP_Level'', C.House_No ''CP_House_No'', C.Street_No ''CP_Street_No'', (Select S.Str_Name from Street S where S.Str_code = C.Str_Code and S.Project_id = ''' + @Project_ID + '''' + ' ) ''CP_Street'',
				(Select R.Region_Desc from Region R where R.Region_Code = M.Region_Code) "Region"
			

			from Mailing_List M left outer join Flat_Master F 
			on M.Reg_No = F.Moa_no and F.Project_id = ''' + @Project_ID + ''''
			+ ' left outer join Car_Park C'
			+ ' on M.Reg_No = C.Moa_No and C.Project_Id  = ''' + @Project_ID + '''' 
			+ ' left outer join MOA A on M.prj_id = a.project_id and m.reg_no = a.moa_no and m.type = ''M'' '
			+ ' where M.PRJ_ID = ''' + @Project_ID + ''''


			    	+ case when isnull(@Dist_Code,'') <> '' or len(@Dist_Code) >0 then '  and M.District =  N''' + @Dist_Code +''''  end 
			    	+ case when isnull(@Region_Code,'') <> '' or len(@Region_Code) >0 then '  and M.Region_Code =  N''' + @Region_Code +''''  end 
				+ case when isnull(@Country_Code,'') <> '' or len(@Country_Code) >0 then '  and M.Country =  N''' + @Country_Code +''''  end 


--			    	+ case when isnull(@Dist_Code,'') <> '' or len(@Dist_Code) >0 then '  and M.District =  @Dist_Code'  end
				+ case when isnull(@PY_Status,'') <> '' or len(@PY_Status) >0 then '  and M.Reg_No In(Select Moa_No from Moa_Py_Plan where IsNull(Py_status, '''') = N'''')'  end

--				+ case when isnull(@Signed,'') <> '' or len(@Signed) >0 then '  and M.Reg_No In(Select Moa_No from Moa where Signed = N''' + Convert(NChar(1), @Signed)  + ''')'  end

				+ case when @Signed = 'Y' then '  and M.Reg_No In(Select Moa_No from Moa where Signed = N''Y'')' when @Signed = 'N' then '  and M.Reg_No In(Select Moa_No from Moa where IsNull(Signed,'''') = N'''')' end

					+ case when @MARKETLETTER = 'Y' then '  and M.Reg_No In(Select Moa_No from Moa where DIRECT_MKT = N''Y'')' when @MARKETLETTER = 'N' then '  and M.Reg_No In(Select Moa_No from Moa where IsNull(DIRECT_MKT,'''') = N'''')' end

				+ case when isnull(@MOA_No_From,'') <> '' or len(@MOA_No_From) >0 then '  and M.Reg_No >=  N''' + @MOA_No_From +''''  end 

				+ case when isnull(@MOA_No_To,'') <> '' or len(@MOA_No_To) >0 then '  and M.Reg_No <=  N''' + @MOA_No_To +''''  end 


	if @Exclude_Void_MOA = 'Y'
	begin
		select @sql = @sql + ' and a.moa_status is not null and a.moa_status not in (''X'', ''V'') '
	end

	select @sql = @sql + 'and M.dm=''Y'' order by M.Reg_No'
--Select @sql


	if @MARKETLETTER ='Y'
	begin
		select @sql = @sql
	end

	--exec sp_executesql @sql, N' @Dist_Code nvarchar(6), @Signed nchar(1)', @Dist_Code, @Signed
	exec sp_executesql @sql

Return
GO
/****** Object:  StoredProcedure [dbo].[GenReceipt]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GenReceipt]
(
	@Project_ID NVarChar(6),
	@Receipt_No Numeric(8, 0),
	@Lang NVarChar(1),
	@Receipt_Type NVarChar(1) Output
)
 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	

	Declare @MOA_No NVarChar(20)
	Declare @Receipt_Data NVarChar(2000)
	Declare @Sales_Office_Code NVarChar(6)
	Declare @User_ID NVarChar(10)
	Declare @Cr_Dt DateTime
	Declare @Buyer_Surname NVarChar(50)
	-- BEGIN #20110829
	Declare @Buyer_Given_Name NVarChar(100)
	-- END #20110829
	Declare @Moa_Co_Name NVarChar(50)
	Declare @Joint_Buyer NVarChar(400)
	Declare @TRANSACT_DATE DateTime
	
	--BEGIN #20100816
	Declare @Desc_Deposit NVarchar(20)
	Declare @Desc_Cash NVarchar(20)
	Declare @Desc_CR_Visa NVarchar(20)
	Declare @Desc_CR_Master NVarchar(20)
	Declare @Desc_CR_AE NVarchar(20)
	Declare @Desc_CR_Union NVarchar(20)
	Declare @Desc_AT NVarchar(20)
	
	Select @Desc_Deposit = msg From [MESSAGE] Where Msg_Cde = '1284' and Lang_ID = @lang
	Select @Desc_Cash = msg From [MESSAGE] Where Msg_Cde = '1408' and Lang_ID = @lang	
	Select @Desc_CR_Visa = msg, @Desc_CR_Master = Msg, @Desc_CR_AE = Msg, @Desc_CR_Union = Msg
		From [MESSAGE] Where Msg_Cde = '770' and Lang_ID = @lang	
	Select @Desc_CR_Visa = @Desc_CR_Visa + '(' + msg + ')' From [MESSAGE] Where Msg_Cde = '5013' and Lang_ID = @lang
	Select @Desc_CR_Master = @Desc_CR_Master + '(' + msg + ')' From [MESSAGE] Where Msg_Cde = '5014' and Lang_ID = @lang
	Select @Desc_CR_AE = @Desc_CR_AE + '(' + msg + ')' From [MESSAGE] Where Msg_Cde = '6344' and Lang_ID = @lang
	Select @Desc_CR_Union = @Desc_CR_Union + '(' + msg + ')' From [MESSAGE] Where Msg_Cde = '6343' and Lang_ID = @lang
	Select @Desc_AT = msg From [MESSAGE] Where Msg_Cde = '521' and Lang_ID = @lang
	--END #20100816

	Select 
		@MOA_No = MOA_No, 
		@Receipt_Type = Receipt_Type, 
		@Receipt_Data = Receipt_Data,
		@Sales_Office_Code = Sales_Office_Code, 
		@User_ID = UID, 
		@Cr_Dt = Cr_Dt,
		@Buyer_Surname = Buyer_Surname, 
		@Buyer_Given_Name = Buyer_Given_Name,
		@Moa_Co_Name = Moa_Co_Name, 
		@Joint_Buyer = Joint_Buyer, 
		@TRANSACT_DATE = Transact_Date
	From Receipt
	Where Project_ID = @Project_ID And Receipt_No = @Receipt_No

	set concat_null_yields_null off

		Select 
			@Buyer_Surname Buyer_Surname, 
			@Buyer_Given_Name Buyer_Given_Name, 
			@Moa_Co_Name Moa_Co_Name, 
			AB.AM_NO Moa_No, 
			AB.LIST_PRICE_BASE_CURR_ID Moa_List_Price_Base_Curr_ID, 
			AB.AM_PRICE Moa_Price, 
			(SELECT ISNULL(VENDOR_CHI,'') + ' ' + ISNULL(VENDOR_ENG,'') FROM PROJECT_MASTER WHERE PROJECT_ID = AB.PROJECT_ID)	Moa_Agency,
			'R' + @Project_ID + Right(Stuff(N'00000000', 8, 1, Convert(NVarChar(8), @Receipt_No)), 8) Receipt_No,
			(Select Sales_Off_Desc From Sales_Office Where Sales_Off_Code = @Sales_Office_Code) Sales_Office,
			(Select ISNULL(PRJ_NAME_CHI,'') + ' ' + ISNULL(PRJ_NAME_ENG,'') From Project_Master Where Project_Id = @Project_ID) Project_Desc,
			@TRANSACT_DATE Receipt_Date--@Cr_Dt Receipt_Date
			From AM_BASE AB
			Where AM_NO = @MOA_NO And PROJECT_ID = @Project_ID

	
		---------------Joint Buyer(s) information from MOA_JOINT_BUYER table
		
		Select  IsNull(@Joint_Buyer, N'') J_All_Name
		
		/*
		Select Surname J_Surname, Given_name J_Given_Name, @Joint_Buyer J_All_Name
			From MOA_TRANSFER_ASSIGNEE_JOINT_BUYER
			Where MOA_NO = @MOA_NO And PROJECT_ID = @Project_ID and Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)
		*/
	
		---------------Unit From Unit_Master table
		Select 
			D.Dev_Name U_Phase, 
			IsNull(B.Block_Desc, N'---') U_Block, 
			IsNull(F.FM_Floor, N'---') U_Floor, 
			IsNull(F.FM_Flat, N'---') U_Flat, 
			IsNull(F.FM_Hse_No, N'---') U_House_No, 
			IsNull(F.FM_Str_No, N'---') U_Street_No, 
			IsNull(S.Str_Name, N'---') U_Street, 
			F.Moa_No 
			From 
				Flat_Master F
				LEFT JOIN Development D ON F.DEV_CODE = D.DEV_CODE
				LEFT JOIN Block B ON F.PROJECT_ID = B.PROJECT_ID AND F.FM_BLK = B.BLOCK_ID
				LEFT JOIN Street S ON F.PROJECT_ID = S.PROJECT_ID AND F.STR_CODE = S.STR_CODE
			Where 
				F.MOA_NO = @MOA_NO 
				And F.PROJECT_ID = @Project_ID 
		
		---------------Car park From Car_park table
		Select 
			D.Dev_Name C_Phase, 
			IsNull(C.Car_Park_No, N'---') C_Car_Park_No, 
			IsNull(IsNull((Select CL.Level_Desc From Car_Park_Level CL Where CL.Project_Id = C.Project_Id and CL.Level_id = C.Park_Level) ,C.Park_Level ), N'---') C_Car_Park_Level, 
			IsNull(C.House_No, N'---') C_House_No, 
			IsNull(C.Street_No, N'---') C_Street_No, 
			IsNull(S.Str_Name, N'---') C_Street, 
			C.Moa_No 
		From 
			Car_Park C
			LEFT JOIN Development D ON C.DEV_CODE = D.DEV_CODE
			LEFT JOIN Street S ON C.PROJECT_ID = S.PROJECT_ID AND C.STR_CODE = S.STR_CODE 
		Where 
			C.MOA_NO = @MOA_NO 
			And C.PROJECT_ID = @Project_ID 		
		
		---------------Transaction details
		Declare @Statement NVarChar(4000)
	
		--BEGIN #20100729
		Select @Statement = 'Select '
		Select @Statement = @Statement + 'Case When P.Py_Desc = ''' + @Desc_Deposit + ''' or P.Py_Desc = ''Initial Payment'' Then P.Py_Desc Else '
		--Select @Statement = @Statement + 'P.Py_Desc + '' ('' + (Convert(varchar, cast(((P.PY_PAYMT_DUE / M.MOA_PRICE) * 100) as numeric(6,2)))) + ''%)'' End Nature , T.Transact_Base_Curr_ID Paid_Currency, (Select C.Curr_Desc From Currency C Where C.Curr_ID = T.Transact_Base_Curr_ID And C.PROJECT_ID = @Project_ID) Paid_Currency_Desc, T.Paid_Amt Paid_Amount, '
		Select @Statement = @Statement + 'P.Py_Desc End Nature , T.Transact_Base_Curr_ID Paid_Currency, (Select C.Curr_Desc From Currency C Where C.Curr_ID = T.Transact_Base_Curr_ID And C.PROJECT_ID = @Project_ID) Paid_Currency_Desc, T.Paid_Amt Paid_Amount, '
		Select @Statement = @Statement + 'dbo.ConvertAmtEN(T.Paid_Amt,2) Paid_Amount_En, dbo.ConvertAmtB5(T.Paid_Amt,2) Paid_Amount_B5, '
		Select @Statement = @Statement + 'T.Transact_Curr_ID Trans_Currency, (Select C.Curr_Desc From Currency C Where C.Curr_ID = T.Transact_Curr_ID And C.PROJECT_ID = @Project_ID) Trans_Currency_Desc, T.Transact_Curr_Rate Trans_Currency_Rate, T.Transact_Amt Trans_Amount, '
		Select @Statement = @Statement + 'dbo.ConvertAmtEN(T.Transact_Amt,2) Trans_Amount_En, dbo.ConvertAmtB5(T.Transact_Amt,2) Trans_Amount_B5, '
		-----Select @Statement = @Statement + 'T.Paid_Amt*T.Transact_Curr_Rate Paid_Amount_Trans_Curr, dbo.ConvertAmtEN(T.Paid_Amt*T.Transact_Curr_Rate, 2) Paid_Amount_En_Trans_Curr, dbo.ConvertAmtB5(T.Paid_Amt*T.Transact_Curr_Rate, 2) Paid_Amount_B5_Trans_Curr, '
		Select @Statement = @Statement + 'Round((Convert(Money, T.Paid_Amt)/(Round(T.Transact_Amt/T.Transact_Curr_Rate,0)))*T.Transact_Amt,2) Paid_Amount_Trans_Curr, dbo.ConvertAmtEN(Round((T.Paid_Amt/(Round(T.Transact_Amt/T.Transact_Curr_Rate,0)))*T.Transact_Amt, 2),2) Paid_Amount_En_Trans_Curr, dbo.ConvertAmtB5(Round((T.Paid_Amt/(Round(T.Transact_Amt/T.Transact_Curr_Rate,0)))*T.Transact_Amt, 2),2) Paid_Amount_B5_Trans_Curr, '
		
		Select @Statement = @Statement + 'Case When T.Transact_Method = N''C'' Then N''' + @Desc_Cash + ''' When T.Transact_Method = N''R'' Then Case When T.Credit_Card_Type = N''V'' Then N''' + @Desc_CR_Visa + ''' When T.Credit_Card_Type = N''M'' Then N''' + @Desc_CR_Master + ''' When T.Credit_Card_Type = N''S'' Then N''' + @Desc_CR_Union + ''' When T.Credit_Card_Type = N''A'' Then N''' + @Desc_CR_AE + ''' End Else (Select B.BK_Name from Bank B where B.Bk_Code = T.Bank_Code) End BankCash, '
		--Select @Statement = @Statement + 'Case When T.Transact_Method = N''Q'' Then T.Transact_Desc Else N'''' End ChequeNo, U.Last_Name + N'' '' + U.First_Name HandleBy '
		Select @Statement = @Statement + 'Case When T.Transact_Method = N''Q'' Then T.Transact_Desc When T.Transact_Method = N''R'' Then (Case when len(T.Credit_Card_No) > 4 Then Substring(T.Credit_Card_No,1,len(T.Credit_Card_No) - 4) else '''' End) + ''xxxx'' Else N'''' End ChequeNo, @User_ID HandleBy, Initial_Payment, '
		Select @Statement = @Statement + '(Select dbo.ConvertAmtEN(sum(Paid_Amt),2) From AM_Payment_FU_Trans Where AM_NO = @MOA_NO And PROJECT_ID = @Project_ID and Paid_Seq In (' + Replace(@Receipt_Data, '''', '''''') + ')) Total_En, '
		Select @Statement = @Statement + '(Select dbo.ConvertAmtB5(sum(Paid_Amt),2) From AM_Payment_FU_Trans Where AM_NO = @MOA_NO And PROJECT_ID = @Project_ID and Paid_Seq In (' + Replace(@Receipt_Data, '''', '''''') + ')) Total_B5, T.Transact_Method '
		Select @Statement = @Statement + 'From AM_Payment_FU_Trans T '
		Select @Statement = @Statement + 'Left Outer Join AM_PAYMENT_Plan P On (T.Project_ID = P.Project_ID And T.AM_No = P.AM_No And T.Py_Plan_Seq = P.Py_Plan_Seq) '
		Select @Statement = @Statement + 'Inner Join AM_BASE M on (T.Project_ID = M.Project_ID and T.AM_NO = M.AM_NO) '
		Select @Statement = @Statement + 'Where T.AM_NO = @MOA_NO And T.PROJECT_ID = @Project_ID and T.Paid_Seq In (' + Replace(@Receipt_Data, '''', '''''') + ') '
		--Select @Statement = @Statement + 'Left Outer Join MOA_Py_Plan P On (T.Project_ID = P.Project_ID And T.MOA_No = P.MOA_No And T.Py_Plan_Seq = P.Py_Plan_Seq), User_Profile U '
		--Select @Statement = @Statement + 'Where T.MOA_NO = @MOA_NO And T.PROJECT_ID = @Project_ID and T.Paid_Seq In (' + Replace(@Receipt_Data, '''', '''''') + ') and U.Uid = @User_ID '
		Select @Statement = @Statement + 'order By T.Py_Plan_Seq, T.Transact_Seq '
		--END #20100729
	
		Exec SP_ExecuteSQL @Statement, N' @Project_ID nvarchar(6), @MOA_No nchar(20), @Receipt_Data NVarChar(2000), @User_ID NVarChar(10)', @Project_ID, @MOA_No, @Receipt_Data, @User_ID
	--Else If @Receipt_Type = N'T'
	--Begin
	--	---------------Agreement/Buyer information from MOA_Transfer table
	--	Select @Buyer_Surname Buyer_Surname, @Buyer_Given_Name Buyer_Given_Name, @Moa_Co_Name Moa_Co_Name, T.Moa_No, 
	--		-- BEGIN #20130911
	--		-- O.Moa_List_Price_Base_Curr_ID, O.Moa_Price, O.Moa_Agency,
	--		O.Moa_List_Price_Base_Curr_ID, O.Moa_Price,
	--		(SELECT VENDOR FROM PROJECT_MASTER WHERE PROJECT_ID = O.PROJECT_ID)	Moa_Agency,
	--		-- END #20130911
	--		T.Transfer_Seq, 'R' + @Project_ID + Right(Stuff(N'00000000', 8, 1, Convert(NVarChar(8), @Receipt_No)), 8) Receipt_No,
	--		(Select Sales_Off_Desc From Sales_Office Where Sales_Off_Code = @Sales_Office_Code) Sales_Office,
	--		(Select Prj_Name From Project_Master Where Project_Id = @Project_ID) Project_Desc,			
	--		@TRANSACT_DATE Receipt_Date -- @Cr_Dt Receipt_Date			
	--		From MOA_TRANSFER T, MOA O 
	--		Where T.MOA_NO = @MOA_NO And T.PROJECT_ID = @Project_ID and T.Transfer_Seq = Convert(Numeric(3,0), @Receipt_Data)
	--		and O.MOA_NO = @MOA_NO And O.PROJECT_ID = @Project_ID
	
	
	--	---------------Joint Buyer(s) information from MOA_TRANSFER_ASSIGNEE_JOINT_BUYER table
		
	--	Select  IsNull(@Joint_Buyer, N'') J_All_Name
		
	--	/*
	--	Select Surname J_Surname, Given_name J_Given_Name, @Joint_Buyer J_All_Name
	--		From MOA_TRANSFER_ASSIGNEE_JOINT_BUYER
	--		Where MOA_NO = @MOA_NO And PROJECT_ID = @Project_ID and Transfer_Seq = Convert(Numeric(3,0), @Transfer_Seq)
	--	*/
	
	--	---------------Unit From Unit_Master table
	--	Select D.Dev_Name U_Phase, IsNull(B.Block_Desc, N'---') U_Block, IsNull(F.FM_Floor, N'---') U_Floor, IsNull(F.FM_Flat, N'---') U_Flat, IsNull(F.FM_Hse_No, N'---') U_House_No, IsNull(F.FM_Str_No, N'---') U_Street_No, IsNull(S.Str_Name, N'---') U_Street, F.Moa_No 
	--		From Flat_Master F, Development D, Block B, Street S 
	--		Where F.MOA_NO = @MOA_NO And F.PROJECT_ID = @Project_ID And F.Dev_Code *= D.Dev_Code And F.Project_ID *= B.Project_ID And F.FM_Blk *= B.Block_ID And F.Project_ID *= S.Project_ID And F.Str_Code *= S.Str_Code
	
		
	--	---------------Car park From Car_park table
	--	Select D.Dev_Name C_Phase, IsNull(C.Car_Park_No, N'---') C_Car_Park_No, IsNull(IsNull((Select CL.Level_Desc From Car_Park_Level CL Where CL.Project_Id = C.Project_Id and CL.Level_id = C.Park_Level) ,C.Park_Level ), N'---') C_Car_Park_Level, IsNull(C.House_No, N'---') C_House_No, IsNull(C.Street_No, N'---') C_Street_No, IsNull(S.Str_Name, N'---') C_Street, C.Moa_No 
	--		From Car_Park C, Development D, Street S 
	--		Where C.MOA_NO = @MOA_NO And C.PROJECT_ID = @Project_ID And C.Dev_Code *= D.Dev_Code And C.Project_ID *= S.Project_ID And C.Str_Code *= S.Str_Code
		
	--	---------------Transaction details
	--	Select @Desc_AT Nature, T.Transact_Curr_ID Currency, (Select C.Curr_Desc From Currency C Where C.Curr_ID = T.Transact_Curr_ID And C.PROJECT_ID = @Project_ID) Currency_Desc, 
	--		(T.Transact_Amount/T.TRANSACT_CURR_RATE) PaymentAmt, dbo.ConvertAmtEN((T.Transact_Amount/T.TRANSACT_CURR_RATE),2) PaymentAmtEn, dbo.ConvertAmtB5((T.Transact_Amount/T.TRANSACT_CURR_RATE),2) PaymentAmtB5,
	--		Case When T.Transact_Method=N'C' Then @Desc_Cash When T.Transact_Method = N'R' Then Case When T.Credit_Card_Type = N'V' Then @Desc_CR_Visa When T.Credit_Card_Type = N'M' Then @Desc_CR_Master When T.Credit_Card_Type = N'S' Then @Desc_CR_Union When T.Credit_Card_Type = N'A' Then @Desc_CR_AE End Else (Select B.BK_Name from Bank B where B.Bk_Code = T.Bank_Code) End  BankCash,
	--		--T.Cheque_No ChequeNo, U.Last_Name + " " + U.First_Name HandleBy
	--		--From Moa_Service_Charge_Transact T, User_Profile U
	--		--Where T.MOA_NO = @MOA_NO And T.PROJECT_ID = @Project_ID and T.Transfer_Seq = Convert(Numeric(3,0), @Receipt_Data)  and U.Uid = @User_ID
	--		--T.Cheque_No ChequeNo, 
	--		Case When T.Transact_Method = N'Q' Then T.CHEQUE_NO When T.Transact_Method = N'R' Then (Case when LEN(t.CREDIT_CARD_NO) > 4 then Substring(T.Credit_Card_No,1,LEN(t.CREDIT_CARD_NO) - 4) else '' end) + 'xxxx' Else N'' End ChequeNo,
	--		@User_Id HandleBy,
	--		(Select dbo.ConvertAmtEN(sum((TRANSACT_AMOUNT/TRANSACT_CURR_RATE)),2) From Moa_Service_Charge_Transact Where MOA_NO = @MOA_NO And PROJECT_ID = @Project_ID and TRANSFER_SEQ In (Replace(@Receipt_Data, '''', ''''''))) Total_En, 
	--		(Select dbo.ConvertAmtB5(sum((TRANSACT_AMOUNT/TRANSACT_CURR_RATE)),2) From Moa_Service_Charge_Transact Where MOA_NO = @MOA_NO And PROJECT_ID = @Project_ID and TRANSFER_SEQ In (Replace(@Receipt_Data, '''', ''''''))) Total_B5,
	--		T.TRANSACT_METHOD 			
	--		From Moa_Service_Charge_Transact T
	--		Where T.MOA_NO = @MOA_NO And T.PROJECT_ID = @Project_ID and T.Transfer_Seq = Convert(Numeric(3,0), @Receipt_Data)  
	--End
Return
GO
/****** Object:  StoredProcedure [dbo].[GetBallotSummary]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBallotSummary]
	@v_sql [nvarchar](max)
WITH  EXECUTE AS CALLER
AS
BEGIN

	create table #temp_ballot
	(
	REG_NO_display nvarchar(max),
	Group_id nvarchar(max),
	Unit  nvarchar(max),
	Ballot_pool_reg_id nvarchar(max),
	ballot_pool_no nvarchar(max),
	reg_no nvarchar(max),
	reg_status_desc nvarchar(max),
	ballot_buyer_name nvarchar(max),
	ballot_seq nvarchar(max),
	ballot_pool_status nvarchar(max),
	Ballot_Reg_id INT
	)

	create table #result
	(
	reg_type  nvarchar(max),
	No_of_ballot int
	)

	insert into #temp_ballot
	(
	REG_NO_display,
	Group_id,
	Unit ,
	Ballot_pool_reg_id ,
	ballot_pool_no,
	reg_no ,
	reg_status_desc, 
	ballot_buyer_name, 
	ballot_seq,
	ballot_pool_status,
	Ballot_Reg_id
	)
	exec (@v_sql)


insert into  #result
select 
br.REG_TYPE,
count(1)
from 
#temp_ballot t inner join ballot_pool_reg bpr on t.ballot_pool_reg_id = bpr.BALLOT_POOL_REG_ID
        inner join ballot_reg br  on br.BALLOT_REG_ID = bpr.BALLOT_REG_ID
group by br.REG_TYPE


	select 
	( select No_of_ballot from #result where reg_type = 'P' ) AS PERSONAL,
	( select No_of_ballot from #result where reg_type = 'C' ) AS COMPANY,
	( select SUM(ISNULL(No_of_ballot,0))  from #result where reg_type in ('P', 'C') ) AS TOTAL

END

GO
/****** Object:  StoredProcedure [dbo].[GetBallotTicket_BA03]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetBallotTicket_BA03]
(
		@PROJECT_ID  nvarchar(10),
		@BALLOT_POOL_REG_ID nvarchar(20),

		@BUYER_CHI_NAME_1 nvarchar(50)  = null Output,
		@BUYER_ENG_NAME_1 nvarchar(100)   = null Output ,
		@BUYER_ID_1 nvarchar(20)   	= null Output,
		@BUYER_ID_IS_IDEN_1 nchar(1)    = null Output,
		@BUYER_NAT_CODE_1 nvarchar(6)   = null Output,
     
		@BUYER_CHI_NAME_2 nvarchar(50)     = null Output,
		@BUYER_ENG_NAME_2 nvarchar(100)     = null Output,
		@BUYER_ID_2 nvarchar(20)    = null Output,
		@BUYER_ID_IS_IDEN_2 nchar(1)    = null Output,
		@BUYER_NAT_CODE_2 nvarchar(6)   = null Output,
     
		@BUYER_CHI_NAME_3 nvarchar(50)    = null Output,
		@BUYER_ENG_NAME_3 nvarchar(100)    = null Output,
		@BUYER_ID_3 nvarchar(20)    = null Output,
		@BUYER_ID_IS_IDEN_3 nchar(1)    = null Output,
		@BUYER_NAT_CODE_3 nvarchar(6)   = null Output,
     
		@BUYER_CHI_NAME_4 nvarchar(50)    = null Output,
		@BUYER_ENG_NAME_4 nvarchar(100)    = null Output,
		@BUYER_ID_4 nvarchar(20)    = null Output,
		@BUYER_ID_IS_IDEN_4 nchar(1)    = null Output,
		@BUYER_NAT_CODE_4 nvarchar(6)    = null Output,

		@CO_NAME nvarchar(50)    = null Output,
		@CO_BRN nvarchar(30)    = null Output,
     
		@BALLOT_REG_BUYER_ID int  = null Output,
		@AGENCY nvarchar(6)   = null Output,
		@AGENCY_TEL nvarchar(20)   = null Output,
		@AGENCY_NAME nvarchar(50)  = null Output,
		@TEL_NO_1 nvarchar(20)  = null Output,
		@TEL_NO_2 nvarchar(20)  = null Output,
		@Message nvarchar(1)  = null Output,
		@BALLOT_BATCH_NO int  = null Output,
		@BALLOT_RESULT_SEQ int   = null Output,
		@NAME NVARCHAR(50) = null Output,
		@EMAIL NVARCHAR(50) = null Output


	 

)

 
As
	Declare @NewReg_No nvarchar(20);
	Declare @NewBALLOT_BATCH_ID int;
	Declare @CheckBALLOT_BATCH_STATUS nchar(1);
	Declare @REG_NO nvarchar(20);
	Declare @NewTicketID int;
	DECLARE @i int = 0;
	DECLARE @Director_CHI_NAME_1  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_1 nvarchar(100) ;
	DECLARE @Director_ID_1  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_1 nchar(1);
	DECLARE @Director_NAT_CODE_1 nvarchar(6);
	DECLARE @Director_CHI_NAME_2  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_2 nvarchar(100) ;
	DECLARE @Director_ID_2  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_2 nchar(1);
	DECLARE @Director_NAT_CODE_2 nvarchar(6);
	DECLARE @Director_CHI_NAME_3  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_3 nvarchar(100) ;
	DECLARE @Director_ID_3  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_3 nchar(1);
	DECLARE @Director_NAT_CODE_3 nvarchar(6);
	DECLARE @Director_CHI_NAME_4  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_4 nvarchar(100) ;
	DECLARE @Director_ID_4  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_4 nchar(1);
	DECLARE @Director_NAT_CODE_4 nvarchar(6);
	Declare @CO_NAME_1 nvarchar(50);
	Declare @CO_BRN_1 nvarchar(30);
	Declare @CO_NAME_2 nvarchar(50);
	Declare @CO_BRN_2 nvarchar(30);
	Declare @CO_NAME_3 nvarchar(50);
	Declare @CO_BRN_3 nvarchar(30);
	Declare @CO_NAME_4 nvarchar(50);
	Declare @CO_BRN_4 nvarchar(30);
		Declare @CO_NAME_5 nvarchar(50);
	Declare @CO_BRN_5 nvarchar(30);
		Declare @CO_NAME_6 nvarchar(50);
	Declare @CO_BRN_6 nvarchar(30);
	Declare @CheckBALLOT_BATCH_ID int; 
	Declare @RecCount int;
	Declare @BALLOT_REG_BUYER_ID_1 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_2 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_3 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_4 int=0 ;
		Declare @BALLOT_REG_BUYER_ID_5 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_6 int=0 ;
	Declare @Cheque_NO_1 int =0;
	Declare @Bank_Code_1 nvarchar(30);
	Declare @CURR_ID_1 nvarchar(30);
	Declare @Amount_1  int =0;
	Declare @Cheque_NO_2 int =0;
	Declare @Bank_Code_2 nvarchar(30);
	Declare @CURR_ID_2 nvarchar(30);
	Declare @Amount_2  int =0;
	DECLARE @AGENCY_ID nvarchar(20);
	DEclare @RowPaymentCount int=0;
	Declare @Remarks nvarchar (500);
	Declare @MaxBPoolNo int;
	DECLARE @ATTNSTATUS NVARCHAR(1);
	DECLARE @BALLOT_REG_ID NVARCHAR(20);
	DECLARE @REG_NO_DISPLAY NVARCHAR(20);
	DECLARE @BALLOT_REG_STATUS NVARCHAR(1);
	DECLARE @AGENCY_ID_TYPE NVARCHAR(1);
	DECLARE @Group_ID nvarchar(10);
	DECLARE @UNIT_INTEND INT;
	declare @Address1 nvarchar(200);
	declare @Address2 nvarchar(200);
	declare @Address3 nvarchar(200);
	declare @Address4 nvarchar(200);
declare @Direct_MKT nvarchar(1);
	declare @REG_TYPE nvarchar(1);
	deCLARE @RelationshipVendor nvarchar(1);
	deCLARE @Region_Code nvarchar(10);
	deCLARE @Dist_Code nvarchar(10);
	deCLARE @Agent_Region_code nvarchar(10);
	deCLARE @Agent_Dist_Code nvarchar(10);
	/*
	Declare @BUYER_CHI_NAME_1 nvarchar(50)  ;
		Declare @BUYER_ENG_NAME_1 nvarchar(100)    ;
		Declare @BUYER_ID_1 nvarchar(20)   ;	;
		Declare @BUYER_ID_IS_IDEN_1 nchar(1)    ;
		Declare @BUYER_NAT_CODE_1 nvarchar(6)   ;
     
		Declare @BUYER_CHI_NAME_2 nvarchar(50)     ;
		Declare @BUYER_ENG_NAME_2 nvarchar(100)     ;
		Declare @BUYER_ID_2 nvarchar(20)    ;
		Declare @BUYER_ID_IS_IDEN_2 nchar(1)    ;
		Declare @BUYER_NAT_CODE_2 nvarchar(6)   ;
     
		Declare @BUYER_CHI_NAME_3 nvarchar(50)    ;
		Declare @BUYER_ENG_NAME_3 nvarchar(100)    ;
		Declare @BUYER_ID_3 nvarchar(20)    ;
		Declare @BUYER_ID_IS_IDEN_3 nchar(1)    ;
		Declare @BUYER_NAT_CODE_3 nvarchar(6)   ;
     
		Declare @BUYER_CHI_NAME_4 nvarchar(50)    ;
		Declare @BUYER_ENG_NAME_4 nvarchar(100)    ;
		Declare @BUYER_ID_4 nvarchar(20)    ;
		Declare @BUYER_ID_IS_IDEN_4 nchar(1)    ;
		Declare @BUYER_NAT_CODE_4 nvarchar(6)    ;

		Declare @CO_NAME nvarchar(50)    ;
		Declare @CO_BRN nvarchar(30)    ;
     
		Declare @BALLOT_REG_BUYER_ID int  ;
		Declare @AGENCY nvarchar(6)   ;
		Declare @AGENCY_TEL nvarchar(20)   ;
		Declare @AGENCY_NAME nvarchar(50)  ;
		Declare @TEL_NO_1 nvarchar(20)  ;
		Declare @TEL_NO_2 nvarchar(20)  ;
		Declare @Message nvarchar(1)  ;
		Declare @BALLOT_BATCH_NO int  ;
		Declare @BALLOT_RESULT_SEQ int   ;
	*/
	/* set @NewTICKET_NO_DISPLAY =@TICKET_NO_DISPLAY*/
	Set @Message = 'F' 

	SELECT @BALLOT_REG_ID=BALLOT_REG_ID,@BALLOT_REG_STATUS= BALLOT_REG_STATUS FROM BALLOT_POOL_REG WHERE BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID
	
	

select  
		@REG_NO = REG_NO,
		@REG_NO_DISPLAY = REG_NO_DISPLAY,
		@AGENCY = AGENCY,
		@AGENCY_ID=AGENCY_ID,
		@AGENCY_TEL = AGENCY_TEL ,
		@AGENCY_NAME = AGENCY_NAME ,
		@AGENCY_ID_TYPE = AGENCY_ID_TYPE,
		@TEL_NO_1 = TEL_NO_1,
		@TEL_NO_2 = TEL_NO_2,
		@Group_ID= GROUP_ID,
		@UNIT_INTEND=UNIT_INTEND,
		@Address1=ADDR_1,
		@Address2=ADDR_2,
		@Address3=ADDR_3,
		@Address4=ADDR_4,
		@Direct_MKT=DIRECT_MKT,
		@REG_TYPE=reg_type,
		@RelationshipVendor = HAS_VENDOR_RS,
		@Region_Code=REGION_CODE,
		@Dist_Code = DIST_CODE,
		@Agent_Region_code = AGENT_REGION_CODE,
		@Agent_Dist_Code = AGENT_DIST_CODE,
		@NAME = Name,
		@EMAIL = Email
	from BALLOT_REG 
	where BALLOT_REG_ID = @BALLOT_REG_ID and PROJECT_ID = @PROJECT_ID


	/*
	SELECT 
		@CheckBALLOT_BATCH_ID = BALLOT_BATCH_ID
		/*@BALLOT_BATCH_NO = BALLOT_BATCH_NO*/
	FROM BALLOT_BATCH
	WHERE
	PROJECT_ID = @PROJECT_ID AND BALLOT_BATCH_ID = @NewBALLOT_BATCH_ID;
	*/
	
	-- if((@CheckBALLOT_BATCH_ID is not null))
	if((@BALLOT_REG_ID is not null))
	BEGIN
		

			Select 
			@BALLOT_REG_BUYER_ID_1 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_1 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_1 = BUYER_ENG_NAME,
			@BUYER_ID_1 = BUYER_ID,
			@BUYER_ID_IS_IDEN_1 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_1 = BUYER_NAT_CODE,
			@CO_NAME_1 = CO_NAME,
			@CO_BRN_1 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 1
		

			Select 
			@BALLOT_REG_BUYER_ID_2 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_2 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_2 = BUYER_ENG_NAME,
			@BUYER_ID_2 = BUYER_ID,
			@BUYER_ID_IS_IDEN_2 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_2 = BUYER_NAT_CODE,
			@CO_NAME_2 = CO_NAME,
			@CO_BRN_2 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 2
			
			Select 
			@BALLOT_REG_BUYER_ID_3 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_3 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_3 = BUYER_ENG_NAME,
			@BUYER_ID_3 = BUYER_ID,
			@BUYER_ID_IS_IDEN_3 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_3 = BUYER_NAT_CODE,
			@CO_NAME_3 = CO_NAME,
			@CO_BRN_3 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 3
			
			Select 
			@BALLOT_REG_BUYER_ID_4 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_4 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_4 = BUYER_ENG_NAME,
			@BUYER_ID_4 = BUYER_ID,
			@BUYER_ID_IS_IDEN_4 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_4 = BUYER_NAT_CODE,
			@CO_NAME_4 = CO_NAME,
			@CO_BRN_4 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 4

			select @Remarks=REMARKS from BALLOT_REG where BALLOT_REG_ID=@BALLOT_REG_ID

create table #Temp
(
CHEQUE_NO nvarchar(50),
	BANK_CODE nvarchar(10),
	CURR_ID nvarchar(30),
	Amount numeric (18,2),
	BK_Name nvarchar(100),
	Cheque_Type nvarchar(1)
)
create table #chequetype(
Cheq_type nvarchar(1),
Cheque_Type_DESC nvarchar(20)
)
insert into [#chequetype] ([Cheq_type],[Cheque_Type_DESC])
	values ('O','Cashier Order')
	insert into [#chequetype] ([Cheq_type],[Cheque_Type_DESC])
	values ('I','Cheque')
select @RowPaymentCount=COUNT(*) FROM  BALLOT_REG_PAY where ballot_Reg_ID=@BALLOT_REG_ID
Declare @counter int=1 ;
while (@counter <= @RowPaymentCount)
BEGIN
	-- Benin #Sara 20170524
	INSERT INTO 
	[#Temp] ([CHEQUE_NO],[BANK_CODE],[CURR_ID],[Amount],[BK_Name],[Cheque_Type]) 
	select CHEQUE_NO,BANK_CODE,CURR_ID,cast(AMOUNT as numeric(18,2)) ,BK_Name, Cheque_Type from BALLOT_REG_PAY brp 
	join bank b on brp.BANK_CODE=b.BK_CODE 
	join #chequetype ct on brp.CHEQUE_TYPE= ct.Cheq_type
	where BALLOT_REG_ID=@BALLOT_REG_ID and PAYMENT_SEQ = @counter
	 -- End 20170524
	set @counter= @counter+1

END


			
			if(@CO_NAME_1 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_1
				set @CO_BRN =@CO_BRN_1
			set @Director_CHI_NAME_1 = @BUYER_CHI_NAME_1 
			set @Director_ENG_NAME_1 =@BUYER_ENG_NAME_1 
			set @Director_ID_1 =@BUYER_ID_1 
			set @Director_ID_IS_IDEN_1 =@BUYER_ID_IS_IDEN_1 
			set @Director_NAT_CODE_1 =@BUYER_NAT_CODE_1 
			END
			
			if(@CO_NAME_2 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_2
				set @CO_BRN =@CO_BRN_2
				set @Director_CHI_NAME_2 = @BUYER_CHI_NAME_2 
				set @Director_ENG_NAME_2 =@BUYER_ENG_NAME_2 
				set @Director_ID_2 =@BUYER_ID_2 
				set @Director_ID_IS_IDEN_2 =@BUYER_ID_IS_IDEN_2 
				set @Director_NAT_CODE_2 =@BUYER_NAT_CODE_2 
			END
			
			if(@CO_NAME_3 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_3
				set @CO_BRN =@CO_BRN_3
				set @Director_CHI_NAME_3 = @BUYER_CHI_NAME_3 
				set @Director_ENG_NAME_3 =@BUYER_ENG_NAME_3 
				set @Director_ID_3 =@BUYER_ID_3 
				set @Director_ID_IS_IDEN_3 =@BUYER_ID_IS_IDEN_3 
				set @Director_NAT_CODE_3 =@BUYER_NAT_CODE_3 
			END
			
			if(@CO_NAME_4 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_4
				set @CO_BRN =@CO_BRN_4
				set @Director_CHI_NAME_4 = @BUYER_CHI_NAME_4 
				set @Director_ENG_NAME_4 =@BUYER_ENG_NAME_4 
				set @Director_ID_4 =@BUYER_ID_4 
				set @Director_ID_IS_IDEN_4 =@BUYER_ID_IS_IDEN_4 
				set @Director_NAT_CODE_4 =@BUYER_NAT_CODE_4 
			END

			Select 
			@BALLOT_REG_BUYER_ID_5 = BALLOT_REG_BUYER_ID,
			@DIRECTOR_CHI_NAME_1 = BUYER_CHI_NAME, 
			@DIRECTOR_ENG_NAME_1 = BUYER_ENG_NAME,
			@DIRECTOR_ID_1 = BUYER_ID,
			@DIRECTOR_ID_IS_IDEN_1 = BUYER_ID_IS_IDEN,
			@DIRECTOR_NAT_CODE_1 = BUYER_NAT_CODE,
			@CO_NAME_5 = CO_NAME,
			@CO_BRN_5 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 5

						Select 
			@BALLOT_REG_BUYER_ID_6 = BALLOT_REG_BUYER_ID,
			@DIRECTOR_CHI_NAME_2 = BUYER_CHI_NAME, 
			@DIRECTOR_ENG_NAME_2 = BUYER_ENG_NAME,
			@DIRECTOR_ID_2 = BUYER_ID,
			@DIRECTOR_ID_IS_IDEN_2 = BUYER_ID_IS_IDEN,
			@DIRECTOR_NAT_CODE_2 = BUYER_NAT_CODE,
			@CO_NAME_6 = CO_NAME,
			@CO_BRN_6 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 6



		set @Message = 'T'
		
	END


	
/*
@BUYER_CHI_NAME_1 =
Select * from BALLOT_BUYER where TICKET_ID = 107 and BUYER_SEQ = 1
select TICKET_ID from BALLOT_TICKET where TICKET_NO_DISPLAY = 'GRV0000101' AND BALLOT_BATCH_ID =1
select * from BALLOT_TICKET where TICKET_NO_DISPLAY = 'GRV0000101' AND BALLOT_BATCH_ID =1
select * from BALLOT_TICKET

*/
	
	select 	@BALLOT_REG_BUYER_ID_1[BALLOT_REG_BUYER_ID_1],@BALLOT_REG_BUYER_ID_2[BALLOT_REG_BUYER_ID_2],@BALLOT_REG_BUYER_ID_3[BALLOT_REG_BUYER_ID_3],@BALLOT_REG_BUYER_ID_4[BALLOT_REG_BUYER_ID_4],
	@AGENCY[Agency_Company],@AGENCY_NAME[Agency_Name],@BALLOT_REG_ID[BALLOT_REG_ID],null,@REG_NO[REG_NO],@AGENCY_ID[AGENCY_ID],@AGENCY_TEL[AGENCY_TEL],@AGENCY_ID_TYPE[AGENCY_ID_TYPE],
	@BALLOT_REG_STATUS[BALLOT_REG_STATUS],@TEL_NO_1[TEL_NO_1],@TEL_NO_2[TEL_NO_2],@Group_ID[GROUP_ID],
		@UNIT_INTEND[UNIT_INTEND],@Address1[Address1],@Address2[Address2],@Address3[Address3],@Address4[Address4],@Direct_MKT[Direct_MKT] ,@REG_TYPE[REG_TYPE],
		@RelationshipVendor[HAS_VENDOR_RS] ,
		@Region_Code[REGION_CODE],@Dist_Code [DIST_CODE],@Agent_Region_code [AGENT_REGION_CODE],@Agent_Dist_Code [AGENT_DIST_CODE], @NAME [NAME], @EMAIL [EMAIL]
	
	
	select @BUYER_CHI_NAME_1 [BUYER_CHI_NAME],@BUYER_ENG_NAME_1[BUYER_ENG_NAME],@BUYER_ID_1[BUYER_ID],
				@BUYER_ID_IS_IDEN_1[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_1[BUYER_NAT_CODE],@CO_NAME_1[CO_NAME],@CO_BRN_1[CO_BRN]
	union all
	select @BUYER_CHI_NAME_2 [BUYER_CHI_NAME],@BUYER_ENG_NAME_2[BUYER_ENG_NAME],@BUYER_ID_2[BUYER_ID],
				@BUYER_ID_IS_IDEN_2[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_2[BUYER_NAT_CODE],@CO_NAME_2[CO_NAME],@CO_BRN_2[CO_BRN]
	union all
	select @BUYER_CHI_NAME_3 [BUYER_CHI_NAME],@BUYER_ENG_NAME_3[BUYER_ENG_NAME],@BUYER_ID_3[BUYER_ID],
				@BUYER_ID_IS_IDEN_3[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_3[BUYER_NAT_CODE],@CO_NAME_3[CO_NAME],@CO_BRN_3[CO_BRN]
	union all
	select @BUYER_CHI_NAME_4 [BUYER_CHI_NAME],@BUYER_ENG_NAME_4[BUYER_ENG_NAME],@BUYER_ID_4[BUYER_ID],
				@BUYER_ID_IS_IDEN_4[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_4[BUYER_NAT_CODE],@CO_NAME_4[CO_NAME],@CO_BRN_4[CO_BRN]

	
	
	
	select * from #Temp
	
				
	select 	 @Director_CHI_NAME_1[Director_CHI_NAME],
				@Director_ENG_NAME_1 [Director_ENG_NAME],
				@Director_ID_1 [Director_ID],
				@Director_ID_IS_IDEN_1 [Director_ID_IS_IDEN],
				@Director_NAT_CODE_1 [@Director_NAT_CODE],
				@CO_NAME_5[CO_NAME],
				@CO_BRN_5[CO_BRN]
	union all
	select 	 @Director_CHI_NAME_2[Director_CHI_NAME],
				@Director_ENG_NAME_2 [Director_ENG_NAME],
				@Director_ID_2 [Director_ID],
				@Director_ID_IS_IDEN_2 [Director_ID_IS_IDEN],
				@Director_NAT_CODE_2 [@Director_NAT_CODE],
				@CO_NAME_6[CO_NAME],
				@CO_BRN_6[CO_BRN]
				--order by  [CO_NAME] desc

	select @Remarks[Remarks]
GO
/****** Object:  StoredProcedure [dbo].[GetBallotTicket_Detail]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[GetBallotTicket_Detail]
(
		@PROJECT_ID  nvarchar(10),
		@REG_NO_DISPLAY nvarchar(20),
	 
		-- Begin 20151007
		@BUYER_CHI_NAME_1 nvarchar(50)  = null Output,
		@BUYER_ENG_NAME_1 nvarchar(100)   = null Output ,
		@BUYER_ID_1 nvarchar(20)   	= null Output,
		@BUYER_ID_IS_IDEN_1 nchar(1)    = null Output,
		@BUYER_NAT_CODE_1 nvarchar(6)   = null Output,
     
		@BUYER_CHI_NAME_2 nvarchar(50)     = null Output,
		@BUYER_ENG_NAME_2 nvarchar(100)     = null Output,
		@BUYER_ID_2 nvarchar(20)    = null Output,
		@BUYER_ID_IS_IDEN_2 nchar(1)    = null Output,
		@BUYER_NAT_CODE_2 nvarchar(6)   = null Output,
     
		@BUYER_CHI_NAME_3 nvarchar(50)    = null Output,
		@BUYER_ENG_NAME_3 nvarchar(100)    = null Output,
		@BUYER_ID_3 nvarchar(20)    = null Output,
		@BUYER_ID_IS_IDEN_3 nchar(1)    = null Output,
		@BUYER_NAT_CODE_3 nvarchar(6)   = null Output,
     
		@BUYER_CHI_NAME_4 nvarchar(50)    = null Output,
		@BUYER_ENG_NAME_4 nvarchar(100)    = null Output,
		@BUYER_ID_4 nvarchar(20)    = null Output,
		@BUYER_ID_IS_IDEN_4 nchar(1)    = null Output,
		@BUYER_NAT_CODE_4 nvarchar(6)    = null Output,

		@CO_NAME nvarchar(50)    = null Output,
		@CO_BRN nvarchar(30)    = null Output,
     
		@BALLOT_REG_BUYER_ID int  = null Output,
		@AGENCY nvarchar(6)   = null Output,
		@AGENCY_TEL nvarchar(20)   = null Output,
		@AGENCY_NAME nvarchar(50)  = null Output,
		@TEL_NO_1 nvarchar(20)  = null Output,
		@TEL_NO_2 nvarchar(20)  = null Output,
		@Message nvarchar(1)  = null Output,
		@BALLOT_BATCH_NO int  = null Output,
		@BALLOT_RESULT_SEQ int   = null Output
	 -- End 20151007

)

 
As
	Declare @NewReg_No nvarchar(20);
	Declare @BALLOT_REG_ID nvarchar(20);
	Declare @NewBALLOT_BATCH_ID int;
	Declare @CheckBALLOT_BATCH_STATUS nchar(1);
	Declare @REG_NO nvarchar(20);
	Declare @NewTicketID int;
	DECLARE @i int = 0;
	DECLARE @Director_CHI_NAME_1  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_1 nvarchar(100) ;
	DECLARE @Director_ID_1  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_1 nchar(1);
	DECLARE @Director_NAT_CODE_1 nvarchar(6);
	DECLARE @Director_CHI_NAME_2  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_2 nvarchar(100) ;
	DECLARE @Director_ID_2  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_2 nchar(1);
	DECLARE @Director_NAT_CODE_2 nvarchar(6);
	DECLARE @Director_CHI_NAME_3  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_3 nvarchar(100) ;
	DECLARE @Director_ID_3  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_3 nchar(1);
	DECLARE @Director_NAT_CODE_3 nvarchar(6);
	DECLARE @Director_CHI_NAME_4  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_4 nvarchar(100) ;
	DECLARE @Director_ID_4  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_4 nchar(1);
	DECLARE @Director_NAT_CODE_4 nvarchar(6);
	Declare @CO_NAME_1 nvarchar(50);
	Declare @CO_BRN_1 nvarchar(30);
	Declare @CO_NAME_2 nvarchar(50);
	Declare @CO_BRN_2 nvarchar(30);
	Declare @CO_NAME_3 nvarchar(50);
	Declare @CO_BRN_3 nvarchar(30);
	Declare @CO_NAME_4 nvarchar(50);
	Declare @CO_BRN_4 nvarchar(30);
	Declare @CO_NAME_5 nvarchar(50);
	Declare @CO_BRN_5 nvarchar(30);
	Declare @CO_NAME_6 nvarchar(50);
	Declare @CO_BRN_6 nvarchar(30);
	Declare @CheckBALLOT_BATCH_ID int; 
	Declare @RecCount int;
	Declare @BALLOT_REG_BUYER_ID_1 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_2 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_3 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_4 int=0 ;
	Declare @Cheque_NO_1 int =0;
	Declare @Bank_Code_1 nvarchar(30);
	Declare @CURR_ID_1 nvarchar(30);
	Declare @Amount_1  int =0;
	Declare @Cheque_NO_2 int =0;
	Declare @Bank_Code_2 nvarchar(30);
	Declare @CURR_ID_2 nvarchar(30);
	Declare @Amount_2  int =0;
	DECLARE @AGENCY_ID nvarchar(20);
	DEclare @RowPaymentCount int=0;
	Declare @Remarks nvarchar (500);
	Declare @MaxBPoolNo int;
	DECLARE @ATTNSTATUS NVARCHAR(1);
	DECLARE @BALLOT_POOL_REG_ID INT;
	Declare @BALLOT_REG_BUYER_ID_5 int;
	Declare @BALLOT_REG_BUYER_ID_6 int;
		DECLARE @AGENCY_ID_TYPE NVARCHAR(1);
	DECLARE @Group_ID nvarchar(10);
	DECLARE @UNIT_INTEND INT;
	declare @Address1 nvarchar(200);
	declare @Address2 nvarchar(200);
	declare @Address3 nvarchar(200);
	declare @Address4 nvarchar(200);
declare @Direct_MKT nvarchar(1);
	declare @REG_TYPE nvarchar(1);
	declare @BALLOT_POOL_ID INT;
	declare @BALLOT_ATTN_status nvarchar(1);	
	Declare @Region_code nvarchar(10);
	Declare @Dist_Code nvarchar(10);
	Declare @Agent_Region_code nvarchar(10);
	Declare @Agent_Dist_Code nvarchar(10);
	Declare @hasRelationShip nvarchar(1);


-- Begin 20151007
	--Declare @BUYER_CHI_NAME_1 nvarchar(50)  ;
	--	Declare @BUYER_ENG_NAME_1 nvarchar(100)    ;
	--	Declare @BUYER_ID_1 nvarchar(20)   ;	;
	--	Declare @BUYER_ID_IS_IDEN_1 nchar(1)    ;
	--	Declare @BUYER_NAT_CODE_1 nvarchar(6)   ;
     
	--	Declare @BUYER_CHI_NAME_2 nvarchar(50)     ;
	--	Declare @BUYER_ENG_NAME_2 nvarchar(100)     ;
	--	Declare @BUYER_ID_2 nvarchar(20)    ;
	--	Declare @BUYER_ID_IS_IDEN_2 nchar(1)    ;
	--	Declare @BUYER_NAT_CODE_2 nvarchar(6)   ;
     
	--	Declare @BUYER_CHI_NAME_3 nvarchar(50)    ;
	--	Declare @BUYER_ENG_NAME_3 nvarchar(100)    ;
	--	Declare @BUYER_ID_3 nvarchar(20)    ;
	--	Declare @BUYER_ID_IS_IDEN_3 nchar(1)    ;
	--	Declare @BUYER_NAT_CODE_3 nvarchar(6)   ;
     
	--	Declare @BUYER_CHI_NAME_4 nvarchar(50)    ;
	--	Declare @BUYER_ENG_NAME_4 nvarchar(100)    ;
	--	Declare @BUYER_ID_4 nvarchar(20)    ;
	--	Declare @BUYER_ID_IS_IDEN_4 nchar(1)    ;
	--	Declare @BUYER_NAT_CODE_4 nvarchar(6)    ;

	--	Declare @CO_NAME nvarchar(50)    ;
	--	Declare @CO_BRN nvarchar(30)    ;
     
	--	Declare @BALLOT_REG_BUYER_ID int  ;
	--	Declare @AGENCY nvarchar(6)   ;
	--	Declare @AGENCY_TEL nvarchar(20)   ;
	--	Declare @AGENCY_NAME nvarchar(50)  ;
	--	Declare @TEL_NO_1 nvarchar(20)  ;
	--	Declare @TEL_NO_2 nvarchar(20)  ;
	--	Declare @Message nvarchar(1)  ;
	--	Declare @BALLOT_BATCH_NO int  ;
	--	Declare @BALLOT_RESULT_SEQ int   ;
	
	/* set @NewTICKET_NO_DISPLAY =@TICKET_NO_DISPLAY*/

	-- End 20151007
	Set @Message = 'F'  -- No ths record

	
	-- Begin 20151007

	select @BALLOT_POOL_REG_ID=BPR.BALLOT_POOL_REG_ID
	from 
	BALLOT_REG BR JOIN BALLOT_POOL_REG BPR ON BR.BALLOT_REG_ID= BPR.BALLOT_REG_ID
	JOIN BALLOT_POOL BP ON BPR.BALLOT_POOL_ID=BP.BALLOT_POOL_ID
	WHERE @REG_NO_DISPLAY=BR.REG_NO_DISPLAY AND @PROJECT_ID=BR.PROJECT_ID and bp.BALLOT_POOL_STATUS='I'
	if (@BALLOT_POOL_REG_ID is not null)
	begin
	Set @Message = 'Y' 
	end
	--select 
	--@MaxBPoolNo= MAX(BP.BALLOT_POOL_NO), @BALLOT_POOL_REG_ID=BPR.BALLOT_POOL_REG_ID
	--from
	--BALLOT_REG BR JOIN BALLOT_POOL_REG BPR ON BR.BALLOT_REG_ID= BPR.BALLOT_REG_ID
	--JOIN BALLOT_POOL BP ON BPR.BALLOT_POOL_ID=BP.BALLOT_POOL_ID
	--WHERE @REG_NO_DISPLAY=BR.REG_NO_DISPLAY AND @PROJECT_ID=BR.PROJECT_ID
	--GROUP BY BPR.BALLOT_POOL_REG_ID
	if (@Message='Y')
	BEGIN
	select @BALLOT_ATTN_status= attn_status from BALLOT_BATCH where BALLOT_BATCH_ID = (select BALLOT_BATCH_ID from BALLOT_POOL_REG where @BALLOT_POOL_REG_ID = BALLOT_POOL_REG_ID)
	if (@BALLOT_ATTN_status <>'Y')
	BEGIN
	SEt @Message ='S' -- Status problem
	END
	END

	if (@Message = 'Y' )
	begin
	select @BALLOT_POOL_ID = ballot_POOL_id from BALLOT_POOL_REG where @BALLOT_POOL_REG_ID= BALLOT_POOL_REG_ID


	SELECT @BALLOT_REG_ID= BR.BALLOT_REG_ID
	FROM
	BALLOT_REG BR JOIN BALLOT_POOL_REG BPR ON BR.BALLOT_REG_ID= BPR.BALLOT_REG_ID
	WHERE BPR.BALLOT_POOL_REG_ID=@BALLOT_POOL_REG_ID
	-- End 20151007

	-- Begin 20151012
	select @BALLOT_RESULT_SEQ = BALLOT_RESULT_SEQ from BALLOT_POOL_REG where @BALLOT_POOL_REG_ID = BALLOT_POOL_REG_ID
-- End 20151012

-- Begin 20151007
select  
		@BALLOT_REG_ID = br.BALLOT_REG_ID,
		@REG_NO = REG_NO,
		@REG_NO_DISPLAY = REG_NO_DISPLAY,
		@AGENCY = AGENCY,
		@AGENCY_ID=AGENCY_ID,
		@AGENCY_TEL = AGENCY_TEL ,
		@AGENCY_NAME = AGENCY_NAME ,
		@AGENCY_ID_TYPE = AGENCY_ID_TYPE,
		@Group_ID = Group_ID,
		@TEL_NO_1 = TEL_NO_1,
		@TEL_NO_2 = TEL_NO_2,
		@UNIT_INTEND=UNIT_INTEND,
		@Address1 = ADDR_1,
		@Address2 = ADDR_2,
		@Address3 = ADDR_3,
		@Address4 = ADDR_4,
		@Direct_MKT = Direct_MKT,
		@REG_TYPE = REG_TYPE,	
		@Region_code=REGION_CODE,
		@Dist_Code = Dist_Code ,
		@Agent_Region_code =AGENT_REGION_CODE,
		@Agent_Dist_Code = AGENT_DIST_CODE,
		@hasRelationShip = HAS_VENDOR_RS
	from BALLOT_REG BR 
	where REG_NO_DISPLAY = @REG_NO_DISPLAY and br.PROJECT_ID=@PROJECT_ID


	/*
	SELECT 
		@CheckBALLOT_BATCH_ID = BALLOT_BATCH_ID
		/*@BALLOT_BATCH_NO = BALLOT_BATCH_NO*/
	FROM BALLOT_BATCH
	WHERE
	PROJECT_ID = @PROJECT_ID AND BALLOT_BATCH_ID = @NewBALLOT_BATCH_ID;
	*/
	
	-- if((@CheckBALLOT_BATCH_ID is not null))
	if((@BALLOT_REG_ID is not null))
	BEGIN
		

			Select 
			@BALLOT_REG_BUYER_ID_1 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_1 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_1 = BUYER_ENG_NAME,
			@BUYER_ID_1 = BUYER_ID,
			@BUYER_ID_IS_IDEN_1 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_1 = BUYER_NAT_CODE,
			@CO_NAME_1 = CO_NAME,
			@CO_BRN_1 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 1
		

			Select 
			@BALLOT_REG_BUYER_ID_2 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_2 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_2 = BUYER_ENG_NAME,
			@BUYER_ID_2 = BUYER_ID,
			@BUYER_ID_IS_IDEN_2 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_2 = BUYER_NAT_CODE,
			@CO_NAME_2 = CO_NAME,
			@CO_BRN_2 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 2
			
			Select 
			@BALLOT_REG_BUYER_ID_3 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_3 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_3 = BUYER_ENG_NAME,
			@BUYER_ID_3 = BUYER_ID,
			@BUYER_ID_IS_IDEN_3 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_3 = BUYER_NAT_CODE,
			@CO_NAME_3 = CO_NAME,
			@CO_BRN_3 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 3
			
			Select 
			@BALLOT_REG_BUYER_ID_4 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_4 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_4 = BUYER_ENG_NAME,
			@BUYER_ID_4 = BUYER_ID,
			@BUYER_ID_IS_IDEN_4 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_4 = BUYER_NAT_CODE,
			@CO_NAME_4 = CO_NAME,
			@CO_BRN_4 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 4

			select @Remarks=REMARKS from BALLOT_REG where BALLOT_REG_ID=@BALLOT_REG_ID

			create table #Temp
			(
			CHEQUE_NO nvarchar(50),
				BANK_CODE nvarchar(10),
				CURR_ID nvarchar(30),
				Amount numeric (18,2),
				BK_Name nvarchar(100),
				Cheque_Type_DESC nvarchar(20)
			)
			create table #chequetype(
			Cheq_type nvarchar(1),
			Cheque_Type_DESC nvarchar(20)
			)
			insert into [#chequetype] ([Cheq_type],[Cheque_Type_DESC])
				values ('O','Cashier Order')
				insert into [#chequetype] ([Cheq_type],[Cheque_Type_DESC])
				values ('C','Cheque')

			select @RowPaymentCount=COUNT(*) FROM  BALLOT_REG_PAY where ballot_Reg_ID=@BALLOT_REG_ID
			Declare @counter int=1 ;
			while (@counter <= @RowPaymentCount)
			BEGIN
	


				INSERT INTO 
				[#Temp] ([CHEQUE_NO],[BANK_CODE],[CURR_ID],[Amount],[BK_Name],[Cheque_Type_DESC]) 
				select CHEQUE_NO,BANK_CODE,CURR_ID,AMOUNT,BK_Name, Cheque_Type_DESC from BALLOT_REG_PAY brp 
				join bank b on brp.BANK_CODE=b.BK_CODE 
				join #chequetype ct on brp.CHEQUE_TYPE= ct.Cheq_type
				where BALLOT_REG_ID=@BALLOT_REG_ID and PAYMENT_SEQ = @counter
	 
				set @counter= @counter+1

			END


			
			if(@CO_NAME_1 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_1
				set @CO_BRN =@CO_BRN_1
			set @Director_CHI_NAME_1 = @BUYER_CHI_NAME_1 
			set @Director_ENG_NAME_1 =@BUYER_ENG_NAME_1 
			set @Director_ID_1 =@BUYER_ID_1 
			set @Director_ID_IS_IDEN_1 =@BUYER_ID_IS_IDEN_1 
			set @Director_NAT_CODE_1 =@BUYER_NAT_CODE_1 
			END
			
			if(@CO_NAME_2 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_2
				set @CO_BRN =@CO_BRN_2
				set @Director_CHI_NAME_2 = @BUYER_CHI_NAME_2 
				set @Director_ENG_NAME_2 =@BUYER_ENG_NAME_2 
				set @Director_ID_2 =@BUYER_ID_2 
				set @Director_ID_IS_IDEN_2 =@BUYER_ID_IS_IDEN_2 
				set @Director_NAT_CODE_2 =@BUYER_NAT_CODE_2 
			END
			
			if(@CO_NAME_3 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_3
				set @CO_BRN =@CO_BRN_3
				set @Director_CHI_NAME_3 = @BUYER_CHI_NAME_3 
				set @Director_ENG_NAME_3 =@BUYER_ENG_NAME_3 
				set @Director_ID_3 =@BUYER_ID_3 
				set @Director_ID_IS_IDEN_3 =@BUYER_ID_IS_IDEN_3 
				set @Director_NAT_CODE_3 =@BUYER_NAT_CODE_3 
			END
			
			if(@CO_NAME_4 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_4
				set @CO_BRN =@CO_BRN_4
				set @Director_CHI_NAME_4 = @BUYER_CHI_NAME_4 
				set @Director_ENG_NAME_4 =@BUYER_ENG_NAME_4 
				set @Director_ID_4 =@BUYER_ID_4 
				set @Director_ID_IS_IDEN_4 =@BUYER_ID_IS_IDEN_4 
				set @Director_NAT_CODE_4 =@BUYER_NAT_CODE_4 
			END
			
			Select 
			@BALLOT_REG_BUYER_ID_5 = BALLOT_REG_BUYER_ID,
			@DIRECTOR_CHI_NAME_1 = BUYER_CHI_NAME, 
			@DIRECTOR_ENG_NAME_1 = BUYER_ENG_NAME,
			@DIRECTOR_ID_1 = BUYER_ID,
			@DIRECTOR_ID_IS_IDEN_1 = BUYER_ID_IS_IDEN,
			@DIRECTOR_NAT_CODE_1 = BUYER_NAT_CODE,
			@CO_NAME_5 = CO_NAME,
			@CO_BRN_5 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 5

						Select 
			@BALLOT_REG_BUYER_ID_6 = BALLOT_REG_BUYER_ID,
			@DIRECTOR_CHI_NAME_2 = BUYER_CHI_NAME, 
			@DIRECTOR_ENG_NAME_2 = BUYER_ENG_NAME,
			@DIRECTOR_ID_2 = BUYER_ID,
			@DIRECTOR_ID_IS_IDEN_2 = BUYER_ID_IS_IDEN,
			@DIRECTOR_NAT_CODE_2 = BUYER_NAT_CODE,
			@CO_NAME_6 = CO_NAME,
			@CO_BRN_6 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 6



		set @Message = 'T'
		
	END
-- End 20151007

	
/*
@BUYER_CHI_NAME_1 =
Select * from BALLOT_BUYER where TICKET_ID = 107 and BUYER_SEQ = 1
select TICKET_ID from BALLOT_TICKET where TICKET_NO_DISPLAY = 'GRV0000101' AND BALLOT_BATCH_ID =1
select * from BALLOT_TICKET where TICKET_NO_DISPLAY = 'GRV0000101' AND BALLOT_BATCH_ID =1
select * from BALLOT_TICKET

*/

-- Begin 20151007
	-- Begin 20151012
	select 	@BALLOT_REG_BUYER_ID_1[BALLOT_REG_BUYER_ID_1],@BALLOT_REG_BUYER_ID_2[BALLOT_REG_BUYER_ID_2],@BALLOT_REG_BUYER_ID_3[BALLOT_REG_BUYER_ID_3],@BALLOT_REG_BUYER_ID_4[BALLOT_REG_BUYER_ID_4],
	@AGENCY[Agency_Company],@AGENCY_NAME[Agency_Name],@BALLOT_REG_ID[BALLOT_REG_ID],null,@REG_NO[REG_NO],
	@AGENCY_ID[AGENCY_ID],@AGENCY_TEL[AGENCY_TEL],@AGENCY_ID_TYPE[AGENCY_ID_TYPE],
	@BALLOT_POOL_ID[BALLOT_POOL_ID],@TEL_NO_1[TEL_NO_1],@TEL_NO_2[TEL_NO_2],@Group_ID[GROUP_ID],@UNIT_INTEND[UNIT_INTEND],
	@Address1[Address1],@Address2[Address2],@Address3[Address3],@Address4[Address4],@Direct_MKT[Direct_MKT] ,@REG_TYPE[REG_TYPE],
	@BALLOT_POOL_REG_ID [BALLOT_POOL_REG_ID] , @Region_code[Region_code],@Dist_Code[Dist_Code] ,@Agent_Region_code[Agent_Region_code],@Agent_Dist_Code[Agent_Dist_Code],@hasRelationShip [HAS_VENDOR_RS]
	
	
	-- End 20151012
	
	
	select @BUYER_CHI_NAME_1 [BUYER_CHI_NAME],@BUYER_ENG_NAME_1[BUYER_ENG_NAME],@BUYER_ID_1[BUYER_ID],
				@BUYER_ID_IS_IDEN_1[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_1[BUYER_NAT_CODE],@CO_NAME_1[CO_NAME],@CO_BRN_1[CO_BRN] 
	union all
	select @BUYER_CHI_NAME_2 [BUYER_CHI_NAME],@BUYER_ENG_NAME_2[BUYER_ENG_NAME],@BUYER_ID_2[BUYER_ID],
				@BUYER_ID_IS_IDEN_2[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_2[BUYER_NAT_CODE],@CO_NAME_2[CO_NAME],@CO_BRN_2[CO_BRN]
	union all
	select @BUYER_CHI_NAME_3 [BUYER_CHI_NAME],@BUYER_ENG_NAME_3[BUYER_ENG_NAME],@BUYER_ID_3[BUYER_ID],
				@BUYER_ID_IS_IDEN_3[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_3[BUYER_NAT_CODE],@CO_NAME_3[CO_NAME],@CO_BRN_3[CO_BRN]
	union all
	select @BUYER_CHI_NAME_4 [BUYER_CHI_NAME],@BUYER_ENG_NAME_4[BUYER_ENG_NAME],@BUYER_ID_4[BUYER_ID],
				@BUYER_ID_IS_IDEN_4[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_4[BUYER_NAT_CODE],@CO_NAME_4[CO_NAME],@CO_BRN_4[CO_BRN]

	
	
	
	select * from #Temp
	
				
	select 	 @Director_CHI_NAME_1[Director_CHI_NAME],
				@Director_ENG_NAME_1 [Director_ENG_NAME],
				@Director_ID_1 [Director_ID],
				@Director_ID_IS_IDEN_1 [Director_ID_IS_IDEN],
				@Director_NAT_CODE_1 [@Director_NAT_CODE],
				@CO_NAME_5[CO_NAME],@CO_BRN_5[CO_BRN]
				union all
				select 	 @Director_CHI_NAME_2[Director_CHI_NAME],
				@Director_ENG_NAME_2 [Director_ENG_NAME],
				@Director_ID_2 [Director_ID],
				@Director_ID_IS_IDEN_2 [Director_ID_IS_IDEN],
				@Director_NAT_CODE_2 [@Director_NAT_CODE],
				@CO_NAME_6[CO_NAME],@CO_BRN_6[CO_BRN]

	select @Remarks[Remarks]

end


-- End 20151007
GO
/****** Object:  StoredProcedure [dbo].[GetBallotTicket_Detail_BA02]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBallotTicket_Detail_BA02]
	@PROJECT_ID [nvarchar](10),
	@REG_NO_DISPLAY [nvarchar](50),
	@BUYER_CHI_NAME_1 [nvarchar](50) = null OUTPUT,
	@BUYER_ENG_NAME_1 [nvarchar](100) = null OUTPUT,
	@BUYER_ID_1 [nvarchar](20) = null OUTPUT,
	@BUYER_ID_IS_IDEN_1 [nchar](1) = null OUTPUT,
	@BUYER_NAT_CODE_1 [nvarchar](6) = null OUTPUT,
	@BUYER_CHI_NAME_2 [nvarchar](50) = null OUTPUT,
	@BUYER_ENG_NAME_2 [nvarchar](100) = null OUTPUT,
	@BUYER_ID_2 [nvarchar](20) = null OUTPUT,
	@BUYER_ID_IS_IDEN_2 [nchar](1) = null OUTPUT,
	@BUYER_NAT_CODE_2 [nvarchar](6) = null OUTPUT,
	@BUYER_CHI_NAME_3 [nvarchar](50) = null OUTPUT,
	@BUYER_ENG_NAME_3 [nvarchar](100) = null OUTPUT,
	@BUYER_ID_3 [nvarchar](20) = null OUTPUT,
	@BUYER_ID_IS_IDEN_3 [nchar](1) = null OUTPUT,
	@BUYER_NAT_CODE_3 [nvarchar](6) = null OUTPUT,
	@BUYER_CHI_NAME_4 [nvarchar](50) = null OUTPUT,
	@BUYER_ENG_NAME_4 [nvarchar](100) = null OUTPUT,
	@BUYER_ID_4 [nvarchar](20) = null OUTPUT,
	@BUYER_ID_IS_IDEN_4 [nchar](1) = null OUTPUT,
	@BUYER_NAT_CODE_4 [nvarchar](6) = null OUTPUT,
	@CO_NAME [nvarchar](50) = null OUTPUT,
	@CO_BRN [nvarchar](30) = null OUTPUT,
	@BALLOT_REG_BUYER_ID [int] = null OUTPUT,
	@AGENCY [nvarchar](6) = null OUTPUT,
	@AGENCY_TEL [nvarchar](20) = null OUTPUT,
	@AGENCY_NAME [nvarchar](50) = null OUTPUT,
	@TEL_NO_1 [nvarchar](20) = null OUTPUT,
	@TEL_NO_2 [nvarchar](20) = null OUTPUT,
	@Message [nvarchar](1) = null OUTPUT,
	@BALLOT_BATCH_NO [int] = null OUTPUT,
	@BALLOT_RESULT_SEQ [int] = null OUTPUT,
	@REGION_CODE [nvarchar](10) = null OUTPUT,
	@DIST_CODE [nvarchar](10) = null OUTPUT,
	@AGENT_REGION_CODE [nvarchar](10) = null OUTPUT,
	@AGENT_DIST_CODE [nvarchar](10) = null OUTPUT
WITH  EXECUTE AS CALLER
AS
Declare @NewReg_No nvarchar(20);
	Declare @BALLOT_REG_ID nvarchar(20);
	Declare @NewBALLOT_BATCH_ID int;
	Declare @CheckBALLOT_BATCH_STATUS nchar(1);
	Declare @REG_NO nvarchar(20);
	Declare @NewTicketID int;
	DECLARE @i int = 0;
	DECLARE @Director_CHI_NAME_1  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_1 nvarchar(100) ;
	DECLARE @Director_ID_1  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_1 nchar(1);
	DECLARE @Director_NAT_CODE_1 nvarchar(6);
	DECLARE @Director_CHI_NAME_2  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_2 nvarchar(100) ;
	DECLARE @Director_ID_2  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_2 nchar(1);
	DECLARE @Director_NAT_CODE_2 nvarchar(6);
	DECLARE @Director_CHI_NAME_3  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_3 nvarchar(100) ;
	DECLARE @Director_ID_3  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_3 nchar(1);
	DECLARE @Director_NAT_CODE_3 nvarchar(6);
	DECLARE @Director_CHI_NAME_4  nvarchar(50)  ;  
	DECLARE @Director_ENG_NAME_4 nvarchar(100) ;
	DECLARE @Director_ID_4  nvarchar(20)  ;
	DECLARE @Director_ID_IS_IDEN_4 nchar(1);
	DECLARE @Director_NAT_CODE_4 nvarchar(6);
	Declare @CO_NAME_1 nvarchar(50);
	Declare @CO_BRN_1 nvarchar(30);
	Declare @CO_NAME_2 nvarchar(50);
	Declare @CO_BRN_2 nvarchar(30);
	Declare @CO_NAME_3 nvarchar(50);
	Declare @CO_BRN_3 nvarchar(30);
	Declare @CO_NAME_4 nvarchar(50);
	Declare @CO_BRN_4 nvarchar(30);
	Declare @CO_NAME_5 nvarchar(50);
	Declare @CO_BRN_5 nvarchar(30);
	Declare @CO_NAME_6 nvarchar(50);
	Declare @CO_BRN_6 nvarchar(30);
	Declare @CheckBALLOT_BATCH_ID int; 
	Declare @RecCount int;
	Declare @BALLOT_REG_BUYER_ID_1 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_2 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_3 int=0 ;
	Declare @BALLOT_REG_BUYER_ID_4 int=0 ;
	Declare @Cheque_NO_1 int =0;
	Declare @Bank_Code_1 nvarchar(30);
	Declare @CURR_ID_1 nvarchar(30);
	Declare @Amount_1  int =0;
	Declare @Cheque_NO_2 int =0;
	Declare @Bank_Code_2 nvarchar(30);
	Declare @CURR_ID_2 nvarchar(30);
	Declare @Amount_2  int =0;
	DECLARE @AGENCY_ID nvarchar(20);
	DEclare @RowPaymentCount int=0;
	Declare @Remarks nvarchar (500);
	Declare @MaxBPoolNo int;
	DECLARE @ATTNSTATUS NVARCHAR(1);
	DECLARE @BALLOT_POOL_REG_ID INT;
	Declare @BALLOT_REG_BUYER_ID_5 int;
	Declare @BALLOT_REG_BUYER_ID_6 int;
		DECLARE @AGENCY_ID_TYPE NVARCHAR(1);
	DECLARE @Group_ID nvarchar(10);
	DECLARE @UNIT_INTEND INT;
	declare @Address1 nvarchar(200);
	declare @Address2 nvarchar(200);
	declare @Address3 nvarchar(200);
	declare @Address4 nvarchar(200);
declare @Direct_MKT nvarchar(1);
	declare @REG_TYPE nvarchar(1);
	declare @BALLOT_POOL_ID INT;
	Declare @RelationshipVendor nvarchar(1);
		

-- Begin 20151007
	--Declare @BUYER_CHI_NAME_1 nvarchar(50)  ;
	--	Declare @BUYER_ENG_NAME_1 nvarchar(100)    ;
	--	Declare @BUYER_ID_1 nvarchar(20)   ;	;
	--	Declare @BUYER_ID_IS_IDEN_1 nchar(1)    ;
	--	Declare @BUYER_NAT_CODE_1 nvarchar(6)   ;
     
	--	Declare @BUYER_CHI_NAME_2 nvarchar(50)     ;
	--	Declare @BUYER_ENG_NAME_2 nvarchar(100)     ;
	--	Declare @BUYER_ID_2 nvarchar(20)    ;
	--	Declare @BUYER_ID_IS_IDEN_2 nchar(1)    ;
	--	Declare @BUYER_NAT_CODE_2 nvarchar(6)   ;
     
	--	Declare @BUYER_CHI_NAME_3 nvarchar(50)    ;
	--	Declare @BUYER_ENG_NAME_3 nvarchar(100)    ;
	--	Declare @BUYER_ID_3 nvarchar(20)    ;
	--	Declare @BUYER_ID_IS_IDEN_3 nchar(1)    ;
	--	Declare @BUYER_NAT_CODE_3 nvarchar(6)   ;
     
	--	Declare @BUYER_CHI_NAME_4 nvarchar(50)    ;
	--	Declare @BUYER_ENG_NAME_4 nvarchar(100)    ;
	--	Declare @BUYER_ID_4 nvarchar(20)    ;
	--	Declare @BUYER_ID_IS_IDEN_4 nchar(1)    ;
	--	Declare @BUYER_NAT_CODE_4 nvarchar(6)    ;

	--	Declare @CO_NAME nvarchar(50)    ;
	--	Declare @CO_BRN nvarchar(30)    ;
     
	--	Declare @BALLOT_REG_BUYER_ID int  ;
	--	Declare @AGENCY nvarchar(6)   ;
	--	Declare @AGENCY_TEL nvarchar(20)   ;
	--	Declare @AGENCY_NAME nvarchar(50)  ;
	--	Declare @TEL_NO_1 nvarchar(20)  ;
	--	Declare @TEL_NO_2 nvarchar(20)  ;
	--	Declare @Message nvarchar(1)  ;
	--	Declare @BALLOT_BATCH_NO int  ;
	--	Declare @BALLOT_RESULT_SEQ int   ;
	
	/* set @NewTICKET_NO_DISPLAY =@TICKET_NO_DISPLAY*/

	-- End 20151007
	Set @Message = 'Y' 

	
	-- Begin 20151007
select @BALLOT_POOL_REG_ID=BPR.BALLOT_POOL_REG_ID
	from 
	BALLOT_REG BR JOIN BALLOT_POOL_REG BPR ON BR.BALLOT_REG_ID= BPR.BALLOT_REG_ID
	JOIN BALLOT_POOL BP ON BPR.BALLOT_POOL_ID=BP.BALLOT_POOL_ID
	WHERE @REG_NO_DISPLAY=BR.REG_NO_DISPLAY AND @PROJECT_ID=BR.PROJECT_ID and bpr.BALLOT_REG_STATUS <>'C'
	
	if (@BALLOT_POOL_REG_ID is null)
	Begin 
	Set @Message = 'R' 
	End

	if (@Message = 'Y' )
	Begin
		if ((select BPR.BALLOT_REG_STATUS
	from 
	BALLOT_REG BR JOIN BALLOT_POOL_REG BPR ON BR.BALLOT_REG_ID= BPR.BALLOT_REG_ID
	JOIN BALLOT_POOL BP ON BPR.BALLOT_POOL_ID=BP.BALLOT_POOL_ID
	WHERE @REG_NO_DISPLAY=BR.REG_NO_DISPLAY AND @PROJECT_ID=BR.PROJECT_ID and bpr.BALLOT_REG_STATUS <>'C' )<>'B')
	BEGIN 
	Set @Message = 'S' 
	END
	End





	IF (@Message ='Y')
	BEGIN

	select @BALLOT_POOL_ID = ballot_POOL_id from BALLOT_POOL_REG where @BALLOT_POOL_REG_ID= BALLOT_POOL_REG_ID


	SELECT @BALLOT_REG_ID= BR.BALLOT_REG_ID
	FROM
	BALLOT_REG BR JOIN BALLOT_POOL_REG BPR ON BR.BALLOT_REG_ID= BPR.BALLOT_REG_ID
	WHERE BPR.BALLOT_POOL_REG_ID=@BALLOT_POOL_REG_ID
	-- End 20151007

	-- Begin 20151012
	select @BALLOT_RESULT_SEQ = BALLOT_RESULT_SEQ from BALLOT_POOL_REG where @BALLOT_POOL_REG_ID = BALLOT_POOL_REG_ID
-- End 20151012

-- Begin 20151007
select  
		@BALLOT_REG_ID = br.BALLOT_REG_ID,
		@REG_NO = REG_NO,
		@REG_NO_DISPLAY = REG_NO_DISPLAY,
		@AGENCY = AGENCY,
		@AGENCY_ID=AGENCY_ID,
		@AGENCY_TEL = AGENCY_TEL ,
		@AGENCY_NAME = AGENCY_NAME ,
		@AGENCY_ID_TYPE = AGENCY_ID_TYPE,
		@Group_ID = Group_ID,
		@TEL_NO_1 = TEL_NO_1,
		@TEL_NO_2 = TEL_NO_2,
		@UNIT_INTEND=UNIT_INTEND,
		@Address1 = ADDR_1,
		@Address2 = ADDR_2,
		@Address3 = ADDR_3,
		@Address4 = ADDR_4,
		@Direct_MKT = Direct_MKT,
		@REG_TYPE = REG_TYPE,
		@RelationshipVendor=HAS_VENDOR_RS,
		@REGION_CODE=REGION_CODE,
		@DIST_CODE = DIST_CODE,
		@AGENT_REGION_CODE = AGENT_REGION_CODE,
		@AGENT_DIST_CODE = AGENT_DIST_CODE
	
	from BALLOT_REG BR 
	where REG_NO_DISPLAY = @REG_NO_DISPLAY and br.PROJECT_ID=@PROJECT_ID


	/*
	SELECT 
		@CheckBALLOT_BATCH_ID = BALLOT_BATCH_ID
		/*@BALLOT_BATCH_NO = BALLOT_BATCH_NO*/
	FROM BALLOT_BATCH
	WHERE
	PROJECT_ID = @PROJECT_ID AND BALLOT_BATCH_ID = @NewBALLOT_BATCH_ID;
	*/
	
	-- if((@CheckBALLOT_BATCH_ID is not null))
	if((@BALLOT_REG_ID is not null))
	BEGIN
		

			Select 
			@BALLOT_REG_BUYER_ID_1 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_1 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_1 = BUYER_ENG_NAME,
			@BUYER_ID_1 = BUYER_ID,
			@BUYER_ID_IS_IDEN_1 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_1 = BUYER_NAT_CODE,
			@CO_NAME_1 = CO_NAME,
			@CO_BRN_1 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 1
		

			Select 
			@BALLOT_REG_BUYER_ID_2 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_2 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_2 = BUYER_ENG_NAME,
			@BUYER_ID_2 = BUYER_ID,
			@BUYER_ID_IS_IDEN_2 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_2 = BUYER_NAT_CODE,
			@CO_NAME_2 = CO_NAME,
			@CO_BRN_2 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 2
			
			Select 
			@BALLOT_REG_BUYER_ID_3 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_3 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_3 = BUYER_ENG_NAME,
			@BUYER_ID_3 = BUYER_ID,
			@BUYER_ID_IS_IDEN_3 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_3 = BUYER_NAT_CODE,
			@CO_NAME_3 = CO_NAME,
			@CO_BRN_3 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 3
			
			Select 
			@BALLOT_REG_BUYER_ID_4 = BALLOT_REG_BUYER_ID,
			@BUYER_CHI_NAME_4 = BUYER_CHI_NAME, 
			@BUYER_ENG_NAME_4 = BUYER_ENG_NAME,
			@BUYER_ID_4 = BUYER_ID,
			@BUYER_ID_IS_IDEN_4 = BUYER_ID_IS_IDEN,
			@BUYER_NAT_CODE_4 = BUYER_NAT_CODE,
			@CO_NAME_4 = CO_NAME,
			@CO_BRN_4 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 4

			select @Remarks=REMARKS from BALLOT_REG where BALLOT_REG_ID=@BALLOT_REG_ID

			create table #Temp
			(
			CHEQUE_NO nvarchar(50),
				BANK_CODE nvarchar(10),
				CURR_ID nvarchar(30),
				Amount numeric (10,2),
				BK_Name nvarchar(50),
				Cheq_Type nvarchar(1)
			)
			create table #chequetype(
			Cheq_type nvarchar(1),
			Cheque_Type_DESC nvarchar(20)
			)
			insert into [#chequetype] ([Cheq_type],[Cheque_Type_DESC])
				values ('O','Cashier Order')
				insert into [#chequetype] ([Cheq_type],[Cheque_Type_DESC])
				values ('C','Cheque')

			select @RowPaymentCount=COUNT(*) FROM  BALLOT_REG_PAY where ballot_Reg_ID=@BALLOT_REG_ID
			Declare @counter int=1 ;
			while (@counter <= @RowPaymentCount)
			BEGIN
	


				INSERT INTO 
				[#Temp] ([CHEQUE_NO],[BANK_CODE],[CURR_ID],[Amount],[BK_Name],[Cheq_Type]) 
				select CHEQUE_NO,BANK_CODE,CURR_ID,AMOUNT,BK_Name, Cheque_Type from BALLOT_REG_PAY brp 
				join bank b on brp.BANK_CODE=b.BK_CODE 
				join #chequetype ct on brp.CHEQUE_TYPE= ct.Cheq_type
				where BALLOT_REG_ID=@BALLOT_REG_ID and PAYMENT_SEQ = @counter
	 
				set @counter= @counter+1

			END


			
			if(@CO_NAME_1 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_1
				set @CO_BRN =@CO_BRN_1
			set @Director_CHI_NAME_1 = @BUYER_CHI_NAME_1 
			set @Director_ENG_NAME_1 =@BUYER_ENG_NAME_1 
			set @Director_ID_1 =@BUYER_ID_1 
			set @Director_ID_IS_IDEN_1 =@BUYER_ID_IS_IDEN_1 
			set @Director_NAT_CODE_1 =@BUYER_NAT_CODE_1 
			END
			
			if(@CO_NAME_2 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_2
				set @CO_BRN =@CO_BRN_2
				set @Director_CHI_NAME_2 = @BUYER_CHI_NAME_2 
				set @Director_ENG_NAME_2 =@BUYER_ENG_NAME_2 
				set @Director_ID_2 =@BUYER_ID_2 
				set @Director_ID_IS_IDEN_2 =@BUYER_ID_IS_IDEN_2 
				set @Director_NAT_CODE_2 =@BUYER_NAT_CODE_2 
			END
			
			if(@CO_NAME_3 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_3
				set @CO_BRN =@CO_BRN_3
				set @Director_CHI_NAME_3 = @BUYER_CHI_NAME_3 
				set @Director_ENG_NAME_3 =@BUYER_ENG_NAME_3 
				set @Director_ID_3 =@BUYER_ID_3 
				set @Director_ID_IS_IDEN_3 =@BUYER_ID_IS_IDEN_3 
				set @Director_NAT_CODE_3 =@BUYER_NAT_CODE_3 
			END
			
			if(@CO_NAME_4 is not null)
			BEGIN
				set @CO_NAME = @CO_NAME_4
				set @CO_BRN =@CO_BRN_4
				set @Director_CHI_NAME_4 = @BUYER_CHI_NAME_4 
				set @Director_ENG_NAME_4 =@BUYER_ENG_NAME_4 
				set @Director_ID_4 =@BUYER_ID_4 
				set @Director_ID_IS_IDEN_4 =@BUYER_ID_IS_IDEN_4 
				set @Director_NAT_CODE_4 =@BUYER_NAT_CODE_4 
			END
			
			Select 
			@BALLOT_REG_BUYER_ID_5 = BALLOT_REG_BUYER_ID,
			@DIRECTOR_CHI_NAME_1 = BUYER_CHI_NAME, 
			@DIRECTOR_ENG_NAME_1 = BUYER_ENG_NAME,
			@DIRECTOR_ID_1 = BUYER_ID,
			@DIRECTOR_ID_IS_IDEN_1 = BUYER_ID_IS_IDEN,
			@DIRECTOR_NAT_CODE_1 = BUYER_NAT_CODE,
			@CO_NAME_5 = CO_NAME,
			@CO_BRN_5 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 5

			Select 
			@BALLOT_REG_BUYER_ID_6 = BALLOT_REG_BUYER_ID,
			@DIRECTOR_CHI_NAME_2 = BUYER_CHI_NAME, 
			@DIRECTOR_ENG_NAME_2 = BUYER_ENG_NAME,
			@DIRECTOR_ID_2 = BUYER_ID,
			@DIRECTOR_ID_IS_IDEN_2 = BUYER_ID_IS_IDEN,
			@DIRECTOR_NAT_CODE_2 = BUYER_NAT_CODE,
			@CO_NAME_6 = CO_NAME,
			@CO_BRN_6 = CO_BRN
			from BALLOT_REG_BUYER where BALLOT_REG_ID=@BALLOT_REG_ID and BUYER_SEQ = 6

	
		set @Message = 'Y'
		
	END
-- End 20151007

	
/*
@BUYER_CHI_NAME_1 =
Select * from BALLOT_BUYER where TICKET_ID = 107 and BUYER_SEQ = 1
select TICKET_ID from BALLOT_TICKET where TICKET_NO_DISPLAY = 'GRV0000101' AND BALLOT_BATCH_ID =1
select * from BALLOT_TICKET where TICKET_NO_DISPLAY = 'GRV0000101' AND BALLOT_BATCH_ID =1
select * from BALLOT_TICKET

*/

-- Begin 20151007
	-- Begin 20151012
	select 	@BALLOT_REG_BUYER_ID_1[BALLOT_REG_BUYER_ID_1],@BALLOT_REG_BUYER_ID_2[BALLOT_REG_BUYER_ID_2],@BALLOT_REG_BUYER_ID_3[BALLOT_REG_BUYER_ID_3],@BALLOT_REG_BUYER_ID_4[BALLOT_REG_BUYER_ID_4],
	@AGENCY[Agency_Company],@AGENCY_NAME[Agency_Name],@BALLOT_REG_ID[BALLOT_REG_ID],null,@REG_NO[REG_NO],
	@AGENCY_ID[AGENCY_ID],@AGENCY_TEL[AGENCY_TEL],@AGENCY_ID_TYPE[AGENCY_ID_TYPE],
	@BALLOT_POOL_ID[BALLOT_POOL_ID],@TEL_NO_1[TEL_NO_1],@TEL_NO_2[TEL_NO_2],@Group_ID[GROUP_ID],@UNIT_INTEND[UNIT_INTEND],
	@Address1[Address1],@Address2[Address2],@Address3[Address3],@Address4[Address4],@Direct_MKT[Direct_MKT] ,@REG_TYPE[REG_TYPE],
	@BALLOT_POOL_REG_ID [BALLOT_POOL_REG_ID] ,@RelationshipVendor[HAS_VENDOR_RS],
	@REGION_CODE[@REGION_CODE],@DIST_CODE[@DIST_CODE],@AGENT_REGION_CODE[@AGENT_REGION_CODE],@AGENT_DIST_CODE[@AGENT_DIST_CODE]
	
	
	-- End 20151012
	
	
	select @BUYER_CHI_NAME_1 [BUYER_CHI_NAME],@BUYER_ENG_NAME_1[BUYER_ENG_NAME],@BUYER_ID_1[BUYER_ID],
				@BUYER_ID_IS_IDEN_1[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_1[BUYER_NAT_CODE],@CO_NAME_1[CO_NAME],@CO_BRN_1[CO_BRN] 
	union all
	select @BUYER_CHI_NAME_2 [BUYER_CHI_NAME],@BUYER_ENG_NAME_2[BUYER_ENG_NAME],@BUYER_ID_2[BUYER_ID],
				@BUYER_ID_IS_IDEN_2[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_2[BUYER_NAT_CODE],@CO_NAME_2[CO_NAME],@CO_BRN_2[CO_BRN]
	union all
	select @BUYER_CHI_NAME_3 [BUYER_CHI_NAME],@BUYER_ENG_NAME_3[BUYER_ENG_NAME],@BUYER_ID_3[BUYER_ID],
				@BUYER_ID_IS_IDEN_3[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_3[BUYER_NAT_CODE],@CO_NAME_3[CO_NAME],@CO_BRN_3[CO_BRN]
	union all
	select @BUYER_CHI_NAME_4 [BUYER_CHI_NAME],@BUYER_ENG_NAME_4[BUYER_ENG_NAME],@BUYER_ID_4[BUYER_ID],
				@BUYER_ID_IS_IDEN_4[BUYER_ID_IS_IDEN],@BUYER_NAT_CODE_4[BUYER_NAT_CODE],@CO_NAME_4[CO_NAME],@CO_BRN_4[CO_BRN]

	
	
	
	select * from #Temp
	
				
select 	 @Director_CHI_NAME_1[Director_CHI_NAME],
				@Director_ENG_NAME_1 [Director_ENG_NAME],
				@Director_ID_1 [Director_ID],
				@Director_ID_IS_IDEN_1 [Director_ID_IS_IDEN],
				@Director_NAT_CODE_1 [@Director_NAT_CODE],
				@CO_NAME_5[CO_NAME],
				@CO_BRN_5[CO_BRN]
				union all
				select 	 @Director_CHI_NAME_2[Director_CHI_NAME],
				@Director_ENG_NAME_2 [Director_ENG_NAME],
				@Director_ID_2 [Director_ID],
				@Director_ID_IS_IDEN_2 [Director_ID_IS_IDEN],
				@Director_NAT_CODE_2 [@Director_NAT_CODE],
					@CO_NAME_6[CO_NAME],
				@CO_BRN_6[CO_BRN]
				order by  [CO_NAME] desc

	select @Remarks[Remarks]


	END

-- End 20151007
GO
/****** Object:  StoredProcedure [dbo].[GetFloorSequence]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetFloorSequence]
(
	@Project_ID NVarChar(6),
	@Dev_Code NVarChar(6),
	@Block_ID NVarChar(6),
	@Floor NVarChar(7),
	@Error NChar(1) Output,
	@Error_Flat NVarChar(3) Output,
	@Error_FM_Code NVarChar(80) Output
)
 
As
	Declare @Floor_Seq Int
	Declare @Flat NVarChar(3)
	Declare @FM_Code NVarChar(80)
	Declare @Last_Floor_Seq Int

	Select @Error = N'N'
	Select @Error_Flat = N''
	Select @Error_FM_Code = N''

	Declare FloorSequence_Cursor Cursor For
	Select FM_Floor_Seq, FM_Flat, FM_Code
	From Flat_Master
	Where Project_ID = @Project_ID And Dev_Code = @Dev_Code And FM_Blk = @Block_ID And FM_Floor = @Floor And FM_Deleted = N'N'

	Open FloorSequence_Cursor

	Fetch Next From FloorSequence_Cursor
	Into @Floor_Seq, @Flat, @FM_Code

	If @Floor_Seq Is Null
	Begin
		Select @Error = N'Y'
		Select @Error_Flat = @Flat
		Select @Error_FM_Code = @FM_Code
	End
	Else
	Begin
		Select @Last_Floor_Seq = @Floor_Seq

		While @@Fetch_Status = 0
		Begin
			If @Floor_Seq Is Null Or @Floor_Seq <> @Last_Floor_Seq
			Begin
				Select @Error = N'Y'
				Select @Error_Flat = @Flat
				Select @Error_FM_Code = @FM_Code
			End

			Fetch Next From FloorSequence_Cursor
			Into @Floor_Seq, @Flat, @FM_Code
		end
	End

	Close FloorSequence_Cursor 
	Deallocate FloorSequence_Cursor 
Return
GO
/****** Object:  StoredProcedure [dbo].[GetFMCPStatus]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetFMCPStatus]
(
	@UserID NVarChar(10),
	@LoginToken NVarChar(32),
	@ProjID NVarChar(10),
	@Lang_ID NVarChar(1),
	@Status	NVarChar(1),
	@FMCP NVarChar(2)
)  
As 
	set concat_null_yields_null off
	Declare @RtnStatus NVarChar
	Declare @Message NVarChar(200)
	Declare @Msg_Cde NVarChar(10)
	Declare @Checklogin int = (select count(*) from USER_PROFILE_APP where UID = @UserID and LOGIN_TOKEN = @LoginToken)
	Declare @TokenExp datetime = (Select TOKEN_EXP_DATE from USER_PROFILE_APP where UID = @UserID and LOGIN_TOKEN = @LoginToken)

	if (@Checklogin = 0)
		BEGIN
			set @RtnStatus = 'N'
			set @Msg_Cde = '1320'
			set @Message = (select Msg from MESSAGE where Msg_Cde = @Msg_Cde and Lang_ID = @Lang_ID)
			select @RtnStatus ,@Msg_Cde , @Message
		END
	else if (DATEDIFF(mi, getdate(), @TokenExp) <= 0)
		BEGIN
			set @RtnStatus = 'N'
			set @Msg_Cde = '1320'
			set @Message = (select Msg from MESSAGE where Msg_Cde = @Msg_Cde and Lang_ID = @Lang_ID)
			select @RtnStatus ,@Msg_Cde , @Message
		END
	else 
		BEGIN
			set @RtnStatus = 'Y';


			IF (@FMCP = 'CP')
				BEGIN

					select 
						PH.DEV_NAME,cp.CAR_PARK_NO, cp.PARK_LEVEL, st.STR_NAME,cp.STREET_NO,cp.CAR_PARK_ID, [STATUS]
						into #Output
					from 
						CAR_PARK cp
						left outer join STREET st on st.STR_CODE = cp.STR_CODE
						left outer join DEVELOPMENT PH on PH.DEV_CODE = cp.DEV_CODE
						where cp.PROJECT_ID = @ProjID and cp.CAR_PARK_DELETED = 'N'

				END
			ELSE IF (@FMCP = 'FM')
				BEGIN
				
					select 
						PH.DEV_NAME, fm.FM_BLK, blk.BLOCK_DESC , FM_FLOOR, FM_FLAT, FM_HSE_NO, FM_STR_NO, st.STR_NAME, fm.FM_CODE,FM_STATUS
						into #Output1
					from 
						FLAT_MASTER fm
						left outer join STREET st on st.STR_CODE = fm.STR_CODE
						left outer join DEVELOPMENT PH on PH.DEV_CODE = fm.DEV_CODE
						left outer join BLOCK BLK on BLK.BLOCK_ID = fm.FM_BLK
						where fm.PROJECT_ID = @ProjID and fm.FM_DELETED = 'N'

				END
			
			
			declare @rowcount int = (Select Count(*) from #Output)
			if (@rowcount = 0)
				begin
					set @RtnStatus = 'N'
					set @Msg_Cde = '999'
					set @Message = (select Msg from MESSAGE where Msg_Cde = @Msg_Cde and Lang_ID = @Lang_ID)
					select @RtnStatus,@Msg_Cde, @Message 
					return
				end
			else 
				begin
					select * from #Output
					return
				end


			declare @rowcount1 int = (Select Count(*) from #Output1)
			if (@rowcount1 = 0)
				begin
					set @RtnStatus = 'N'
					set @Msg_Cde = '999'
					set @Message = (select Msg from MESSAGE where Msg_Cde = @Msg_Cde and Lang_ID = @Lang_ID)
					select @RtnStatus,@Msg_Cde, @Message 
					return
				end
			else 
				begin
					select * from #Output1
					return
				end
		END
GO
/****** Object:  StoredProcedure [dbo].[GetSearchSummary]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************
v001  July 26, 2016    fix dupliate amount for agreement price
v002  Sept 19, 2017    fix avg price price / SQF
******************************************/
CREATE PROC [dbo].[GetSearchSummary]
(	
	@v_sql nvarchar(max)
)
 
AS BEGIN

	create table #temp_summary
	(
	MOA_PRICE numeric(12,2),
	MOA_No    nvarchar(max),
	Surname   nvarchar(max),
	Given_Name  nvarchar(max),
	Company_Name  nvarchar(max),
	Status_Code  nvarchar(max),
	Agreement_Status  nvarchar(max),
	Agreement_Date    date,
	PASP_SIGNED    nvarchar(max),
	ASP_SIGNED        nvarchar(max),
	Unit          nvarchar(max),
	Unit_Type         nvarchar(max),
	Block_Desc        nvarchar(max),
	FM_Floor          nvarchar(max),
	FM_Flat           nvarchar(max),
	FM_Hse_No         nvarchar(max),
	FM_Str_No         nvarchar(max),
	Street            nvarchar(max),
	Transfer_Status   nvarchar(1)
	)

	declare @ttl_sold  int
	declare @ttl_price numeric(12,2)
	declare @avg_price numeric(12,2) 
	declare @ttl_pasp int
	declare @ttl_asp int
	declare @project_id nvarchar(20) -- #v002
	declare @ttl_SQF_AERA int --#v002


	insert into #temp_summary
	(
	MOA_PRICE ,
	MOA_No   ,
	Surname  ,
	Given_Name,  
	Company_Name,  
	Status_Code ,
	Agreement_Status,  
	Agreement_Date   ,
	PASP_SIGNED    ,
	ASP_SIGNED     ,
	Unit         ,
	Unit_Type     , 
	Block_Desc     ,
	FM_Floor        , 
	FM_Flat          ,
	FM_Hse_No        ,
	FM_Str_No      ,
	Street          ,  
	Transfer_Status   
	)
	exec (@v_sql)


	--#v002s
	select @project_id = PROJECT_ID  from am_base where am_no = (	select top 1 MOA_No from #temp_summary )

	SELECT 
	@ttl_SQF_AERA = sum(FM.FM_USABLE_SF )
	FROM FLAT_MASTER fm
	left join am_item ai on ai.PROJECT_ID = fm.PROJECT_ID and ai.FM_CP_CODE = fm.FM_CODE
	WHERE 
	fm.PROJECT_ID = @project_id
	and exists( select 1 from #temp_summary t where ai.AM_NO = t.MOA_No and status_code = 'C')
	--#v002e

	

	select @ttl_sold = count(1) from #temp_summary t where t.status_code = 'C'
	--v001s
	--select @ttl_price = sum(isnull( t.moa_price, 0 )) from #temp_summary t where t.status_code = 'C'
	select @ttl_price = sum( v1.moa_price ) from ( select distinct t.moa_price, MOA_No from #temp_summary t where t.status_code = 'C' ) v1	
	--v001e
	
	select @ttl_pasp  = count( distinct MOA_No  ) from #temp_summary t where t.status_code = 'C' and ASP_SIGNED = 'SIGNED' 
	select @ttl_asp =  count( distinct MOA_No  ) from #temp_summary t where t.status_code = 'C' and PASP_SIGNED = 'SIGNED' 

	
	select @ttl_sold as sold, @ttl_price as price , 
	--v002s
	--@ttl_price/@ttl_sold as avg_price, 
	@ttl_price/@ttl_SQF_AERA as avg_price, 
	--v002e
	@ttl_pasp as pasp, @ttl_asp as asp

END

GO
/****** Object:  StoredProcedure [dbo].[GetSystemNumber]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetSystemNumber]
(
	@Project_ID NVarChar(6),
	@Function_Flag NVarChar(3),
	@Input_Type NChar(1),
	@Input_Num NVarChar(20),
	@Out_Char NVarChar(1) Output,
	@Out_Range_ID NVarChar(2) Output,
	@Out_Num NVarChar(20) Output
)
 
As
	Declare @Current_No NVarChar(20)
	Declare @Loop NChar(1)
	Declare @Range_ID Int

	Select @Loop = N'T'
	Select @Out_Char = N'F'

	If @Function_Flag = N'AM'
	Begin
		If @Input_Type = N'S'
		Begin
			While @Loop = N'T'
			Begin
				Select @Range_ID = Range_ID, @Current_No = Right(Stuff(N'000000', 6, 1, Convert(NVarChar(6), Current_No)), 6)
				From AM_No_Range
				Where Project_ID = @Project_ID And Range_Type = @Input_Type And Current_No < End_No + 1 And Start_No = (
					Select Min(Start_No)
					From AM_No_Range
					Where Project_ID = @Project_ID And Range_Type = @Input_Type And Current_No < End_No + 1)

				If @@RowCount = 0
				Begin
					Break
				End

				If (Select Count(*) From AM_BASE Where Project_ID = @Project_ID And AM_No = @Project_ID + @Current_No) = 0
				Begin
					Select @Out_Char = N'S'
					Select @Out_Range_ID = Convert(NVarChar(2), @Range_ID)
					Select @Out_Num = @Project_ID + @Current_No
					Break
				End

				Update AM_No_Range
				Set Current_No = Current_No + 1
				Where Project_ID = @Project_ID And Range_Type = @Input_Type And Range_ID = @Range_ID
			End
		End
		Else If @Input_Type = N'M'
		Begin
			If (Select Count(*) From AM_BASE Where Project_ID = @Project_ID And AM_No = @Input_Num) = 0
			Begin
				Select @Out_Char = N'S'
			End
		End
	End
	--Else If @Function_Flag = N'REG'
	--Begin
	--	If @Input_Type = N'S'
	--	Begin
	--		While @Loop = N'T'
	--		Begin
	--			Select @Range_ID = Range_ID, @Current_No = Right(Stuff(N'0000000', 7, 1, Convert(NVarChar(7), Current_No)), 7)
	--			From Reg_No_Range
	--			Where Project_ID = @Project_ID And Range_Type = @Input_Type And Current_No < End_No + 1 And Start_No = (
	--				Select Min(Start_No)
	--				From Reg_No_Range
	--				Where Project_ID = @Project_ID And Range_Type = @Input_Type And Current_No < End_No + 1)

	--			If @@RowCount = 0
	--			Begin
	--				Break
	--			End

	--			If (Select Count(*) From Registration Where Project_ID = @Project_ID And Reg_No = @Current_No) = 0
	--			Begin
	--				Select @Out_Char = N'S'
	--				Select @Out_Range_ID = Convert(NVarChar(2), @Range_ID)
	--				Select @Out_Num = @Current_No
	--				Break
	--			End
	--		End
	--	End
	--	Else If @Input_Type = N'M'
	--	Begin
	--		If (Select Count(*) From Registration Where Project_ID = @Project_ID And Reg_No = @Input_Num) = 0
	--		Begin
	--			Select @Out_Char = N'S'
	--		End
	--	End
	--End
Return
GO
/****** Object:  StoredProcedure [dbo].[GetUnitPackageList]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetUnitPackageList]
(
	@PROJECT_ID NVARCHAR(10),
	@PACKAGE_ID NVARCHAR(10)
)
  AS
BEGIN 

	
	/*
	SELECT distinct 
		FM.PROJECT_ID,PA.PACKAGE_ID,
		(SELECT TOP 1 BLOCK_DESC FROM BLOCK WHERE PROJECT_ID=FM.PROJECT_ID AND BLOCK.BLOCK_ID=FM.FM_BLK)AS BLOCK_DESC ,
		FM.FM_FLOOR,
		FM.FM_FLAT
	FROM 
		FLAT_MASTER  AS FM 
		LEFT JOIN FLAT_PACKAGE AS FP ON FP.PROJECT_ID =FM.PROJECT_ID AND FM.FM_CODE=FP.FM_CODE
		LEFT JOIN  PACKAGES AS PA ON PA.PACKAGE_ID=FP.PACKAGE_ID AND PA.PROJECT_ID= FP.PROJECT_ID 
	WHERE FM_FLAT IS NOT NULL AND FM_FLOOR IS NOT NULL  AND PA.PROJECT_ID=@PROJECT_ID AND PA.PACKAGE_ID=@PACKAGE_ID  
	*/

	SELECT
		f.DEV_CODE, d.DEV_NAME,
		b.BLOCK_DESC, f.FM_FLAT, f.FM_FLOOR,
		f.FM_HSE_NO, f.FM_STR_NO, s.STR_NAME,
		CONVERT(decimal(12,0),FM_LIST_PRICE) LIST_PRICE,
		CASE isnull(f.FM_STATUS,'') 
			WHEN '' THEN N'Unclassified' 
			WHEN 'R' THEN N'Reserved' 
			WHEN 'P' THEN N'Hold' 
			WHEN 'S' THEN N'Sold' 
			WHEN 'A' THEN N'Available' 
		END [STATUS]
	FROM
		FLAT_MASTER f
		JOIN FLAT_PACKAGE fp ON f.[FM_CODE] = fp.[FM_CODE]
		LEFT JOIN DEVELOPMENT d ON f.DEV_CODE = d.DEV_CODE
		LEFT JOIN STREET s ON f.PROJECT_ID = s.PROJECT_ID AND f.STR_CODE = s.STR_CODE
		LEFT JOIN BLOCK b ON f.PROJECT_ID = b.PROJECT_ID AND b.BLOCK_ID = f.FM_BLK
	WHERE 
		f.FM_DELETED <> 'Y' AND
		f.PROJECT_ID = @PROJECT_ID AND
		fp.PACKAGE_ID = @PACKAGE_ID



END

GO
/****** Object:  StoredProcedure [dbo].[HoldFlatCar]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HoldFlatCar]
	@Project_ID [nvarchar](6),
	@FM_Select [nvarchar](1),
	@FM_Code [nvarchar](500),
	@FM_Last_Update_Date [nvarchar](30),
	@CP_Select [nvarchar](1),
	@CP_Code [nvarchar](80),
	@CP_Last_Update_Date [nvarchar](30),
	@Selection_Order [nvarchar](30),
	@Username [nvarchar](10),
	@Password [nvarchar](8),
	@Up_UID [nvarchar](10),
	@Up_FID [nvarchar](10),
	@Return_Status [int] OUTPUT,
	@Last_Update_Date [nvarchar](30) OUTPUT
WITH  EXECUTE AS CALLER
AS
Declare @_code NVarChar(80)
	Declare @_deleted NVarChar(1)
	Declare @_expire_Date DateTime
	Declare @_have_Permission NVarChar(1)
	Declare @_password NVarChar(8)
	Declare @_position Int
	Declare @_status NVarChar(1)
	Declare @_update_Date DateTime
	Declare @_orig_status NChar(1)

	Select @_update_Date = getdate()
	Select @Last_Update_Date = convert(NVarChar(30), @_update_Date, 121)
	If (@FM_Code Is Not Null And @FM_Code <> N'') And (@FM_Select Is Not Null And @FM_Select = N'Y')
	Begin

		Select @_orig_status = FM_Status from Flat_Master
		Where Project_ID = @Project_ID And FM_Code = @FM_Code
			And Convert(NVarChar(30), Up_Dt, 121) = @FM_Last_Update_Date

		If (Upper(@_orig_status) <> 'R') AND (Upper(@_orig_status) <> 'A') 
		Begin 
			Select @Return_Status = -1005  -- Unit Not Available for selection. Select Unit Failed
			Return
		End
			
		Update Flat_Master
		Set FM_Status = N'P', Up_Dt = @_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
		Where Project_ID = @Project_ID And FM_Code = @FM_Code
			And Convert(NVarChar(30), Up_Dt, 121) = @FM_Last_Update_Date
		
		If @@RowCount = 0
		Begin
			Select @Return_Status = -1004  -- Unit Being Modified
			Return
		End
		
		Insert Into Flat_Selection
			(Project_ID, FM_Code, Selection_Order, Status, Update_Date, Up_UID, Up_FID, ORG_STATUS)
		Values
			(@Project_ID, @FM_Code, Null, N'C', GetDate(), @Up_UID, @Up_FID, @_orig_status)

		If @@Error <> 0
		Begin
			Select @Return_Status = -1000  -- Select Unit Failed
			Return
		End
		Select @Return_Status = 1000  -- Select Unit Succeeded
		Return
	End
	Else If (@CP_Code Is Not Null And @CP_Code <> N'') And (@CP_Select Is Not Null And @CP_Select = N'Y')
		Begin
		Select @_orig_status = Status from Car_Park
		Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
			And Convert(NVarChar(30), Up_Dt, 121) = @CP_Last_Update_Date

		If (Upper(@_orig_status) <> 'R') AND (Upper(@_orig_status) <> 'A') 
		Begin 
			Select @Return_Status = -1005  -- Car park Not Available for selection. Select  Car Park Failed
			Return
		End
			
		Update Car_Park
		Set Status = N'P', Up_Dt = @_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
		Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
			And Convert(NVarChar(30), Up_Dt, 121) = @CP_Last_Update_Date

		If @@RowCount = 0
		Begin
			Rollback Transaction

			Select @Return_Status = -1503  -- Corresponding Car Park Begin Modified
			Return
		End

		Insert Into Car_Park_Selection
			(Project_ID, Car_Park_ID, Selection_Order, Status, Update_Date, Up_UID, Up_FID, ORG_STATUS)
		Values
			(@Project_ID, @CP_Code, Null, N'C', GetDate(), @Up_UID, @Up_FID,@_orig_status)

		If @@Error <> 0
		Begin
			Rollback Transaction

			Select @Return_Status = -1500  -- Select Corresponding Car Park Failed
			Return
		End
	Select @Return_Status = 2000  -- Select Car Park Succeeded
	Return
	End



GO
/****** Object:  StoredProcedure [dbo].[HoldPackage]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[HoldPackage]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Package_ID NVarChar(2),
	@No_Of_Months NVarChar(3),
	@Quantity NVarChar(10),
	@Gross_Area NVarChar(9),
	@FM_CODE Nvarchar(500),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Declare @Factor Numeric(18, 2)
	Declare @Price_Adjust Numeric(18, 2)
	Declare @Price_Adjust_Unit NVarChar(1)
	Declare @Internal_Cost Numeric(18, 2)
	Declare @List_Price Numeric(18, 2)
	Declare @Total_Price Numeric(18, 2) = 0.00
	Declare @Cal_Gross NVarChar(1)
	Declare @Package_Qty Numeric
	Declare @Package_Qty_Onhand Numeric
	Declare @Method_Code NVarChar(6)
	Declare @Add_To_Contract_Price Char(1)
	Declare @Add_Pkg_B4_Adjust Char(1)
	Declare @j as int =1 ;
	Declare @Adjustment int =0;
	Declare @Package_calc_type as nvarchar(1);
	select @Package_calc_type = PACKAGE_CALC_TYPE from PROJECT_MASTER where PROJECT_ID=@Project_ID

	Select @Cal_Gross = Cal_Gross, @Package_Qty = Package_Qty, @Package_Qty_Onhand = Package_Qty_Onhand
	From Packages
	Where Project_ID = @Project_ID And Package_ID = @Package_ID
	 -------------------------------------------------------------------- CHECK THE AVAILABLE PACKAGE QUANTITY--------------------------------------------------------------------
	
	if ((select count(*) from AM_PACKAGES where PROJECT_ID = @Project_ID and FM_code = @FM_CODE and PACKAGE_ID =  @Package_ID and AM_NO = @MOA_No) >0 )
	Begin
			RaisError(N'This Package has been added already', 16, 1)
			Return (0)
	ENd
	
	
	
	If @Package_Qty Is Null
	Begin
		Update Packages
		Set Package_Qty_Held = Package_Qty_Held + Convert(Int, @Quantity),
			Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And Package_ID = @Package_ID
	End
	Else
	Begin
		If @Package_Qty_Onhand <= 0
		Begin
			RaisError(N'Not enough stock', 16, 1)
			Return (0)
		End

		Update Packages
		Set Package_Qty_Held = Package_Qty_Held + Convert(Int, @Quantity),
			Package_Qty_Onhand = Package_Qty_Onhand - Convert(Int, @Quantity),
			Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And Package_ID = @Package_ID

		Select @Package_Qty_Onhand = Package_Qty_Onhand
		From Packages
		Where Project_ID = @Project_ID And Package_ID = @Package_ID

		If @Package_Qty_Onhand < 0
		Begin
			RaisError(N'Not enough stock', 16, 1)
			Return (0)
		End
	End

	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



	If @Cal_Gross = N'Y'
	Begin
		Select @Factor = Convert(Numeric(18, 2), @Gross_Area) * Convert(Numeric(3), @No_Of_Months) * Convert(Int, @Quantity)
	End
	Else
	Begin
		Select @Factor = Convert(Int, @Quantity)
	End


	Select @Price_Adjust = Price_Adjust, @Price_Adjust_Unit = Unit, @Internal_Cost = Internal_Cost,
		@Add_To_Contract_Price = Add_To_Contract_Price, @Add_Pkg_B4_Adjust = Add_Pkg_B4_Adjust
	From Packages
	Where Project_ID = @Project_ID And Package_ID = @Package_ID 
	
	--If @Price_Adjust_Unit = N'P'
	--Begin
	--	Select @List_Price = IsNull(Sum(FM_List_Price), 0)
	--	From Flat_Master
	--	Where Project_ID = @Project_ID And MOA_No = @MOA_No and @FM_CODE =FM_CODE
		
	--	Select @Total_Price = @Price_Adjust * @List_Price / 100.0 * @Factor
	--End
	--Else
	--Begin
	--	Select @Total_Price = @Price_Adjust * @Factor
	--End


	-- Begin 20151204 Tommyay
	Insert Into AM_PACKAGES
		(AM_No, Project_ID, Package_ID, Qty, Price_Adjust, Internal_Cost, No_Of_Months, Up_Dt, Up_UID, Up_FID,
		Add_To_Contract_Price, Add_Pkg_B4_Adjust, FM_CODE)
	Values
		(@MOA_No, @Project_ID, @Package_ID, Convert(Int, @Quantity), Round(@Total_Price, 0),
		Round(@Internal_Cost * @Factor, 0), Convert(Numeric(3), @No_Of_Months),
		GetDate(), @Update_UID, @Update_FID, @Add_To_Contract_Price, @Add_Pkg_B4_Adjust, @FM_CODE)
	


	Select @Method_Code = Method_Code
	From AM_BASE
	Where Project_ID = @Project_ID And AM_No = @MOA_No
	
	If @Method_Code Is Not Null
	Begin
		--  BEGIN #20070313
		Update AM_BASE
		Set AM_PRICE = null, 
			AM_TOT_PRICE = null, Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And AM_NO = @MOA_No
	EnD
	--	-- END #20070313

	-- Begin #20151206  TAY


	--if (@Package_calc_type ='A')
	--Begin

	--IF ((SELECT COUNT(*) FROM AM_PACKAGES WHERE PROJECT_ID = @Project_ID AND AM_NO = @MOA_No )<> 1) 
	--BEGIN
	--SELECT ROW_NUMBER() OVER (ORDER BY P.ADD_TO_CONTRACT_PRICE desc, P.ADD_PKG_B4_ADJUST desc, P.PACKAGE_SEQ asc) 'ROWNUMBER', P.PACKAGE_SEQ ,AP.*,Cal_Gross, Package_Qty, Package_Qty_Onhand,
	-- Unit
	--INTO #TMP
	--FROM AM_PACKAGES AP JOIN PACKAGES P ON AP.PROJECT_ID = P.PROJECT_ID AND P.PACKAGE_ID=AP.PACKAGE_ID 
	--WHERE AM_NO = @MOA_No and @FM_CODE= FM_CODE 


	
	--DECLARE @COUNTER AS INT;
	--DECLARE @i AS INT =1 ;
	--DECLARE @CURRENT_AM_NO AS NVARCHAR(20);
	--DECLARE @CURRENT_PACKAGE_CODE NVARCHAR (20);
	--DECLARE @PRE_PACKAGE NUMERIC (18,2) =0.00;
	--Declare @PRE_Add_Pkg_B4_Adjust nvarchar(1);
	--Declare @PRE_Add_To_Contract_Price nvarchar(1);

	--SELECT @COUNTER= COUNT(*) FROM #TMP



	--WHILE (@i <= @COUNTER)
	--BEGIN

	--Select @CURRENT_PACKAGE_CODE = PACKAGE_ID ,  @Cal_Gross = Cal_Gross ,@CURRENT_AM_NO = AM_NO, @No_Of_Months = NO_OF_MONTHS ,@Quantity = QTY
	--From #TMP WHERE ROWNUMBER = @i

	--If @Cal_Gross = N'Y'
	--Begin
	--	Select @Factor = Convert(Numeric(18, 2), @Gross_Area) * Convert(Numeric(3), @No_Of_Months) * 1 -- Convert(Int, @Quantity)
	--End
	--Else
	--Begin
	--	Select @Factor =  1  --Convert(Int, @Quantity)
	--End
	--Select @Price_Adjust = Price_Adjust, @Price_Adjust_Unit = Unit, @Internal_Cost = Internal_Cost,
	--	@Add_To_Contract_Price = Add_To_Contract_Price, @Add_Pkg_B4_Adjust = Add_Pkg_B4_Adjust
	--From Packages
	--Where Project_ID = @Project_ID And Package_ID = @CURRENT_PACKAGE_CODE
	
	--if (@PRE_Add_Pkg_B4_Adjust <> @Add_Pkg_B4_Adjust or @PRE_Add_To_Contract_Price <> @Add_To_Contract_Price)
	--Begin 
	--set @PRE_PACKAGE=0;
	--End
	--set @Adjustment =0;
	--set @j=1;
	--while (@j <=Convert(Int, @Quantity))
	--Begin
	--If @Price_Adjust_Unit = N'P'
	--Begin
	--	Select @List_Price = IsNull(Sum(FM_List_Price), 0)
	--	From Flat_Master
	--	Where Project_ID = @Project_ID And MOA_No = @CURRENT_AM_NO and @FM_CODE =FM_CODE
		
	--	Select @Total_Price =  @Price_Adjust *( @List_Price +  @PRE_PACKAGE) / 100.0 * @Factor
	--End
	--Else
	--Begin
	--	Select @Total_Price =  @Price_Adjust * @Factor
	--End


	--SELECT @PRE_PACKAGE = @PRE_PACKAGE + Round(@Total_Price, 0);
	--set @Adjustment = @Adjustment + Round(@Total_Price, 0);
	--set @j=@j+1;
	--End

	--set @Total_Price = Round(@Adjustment, 0);
	--UPDATE AM_PACKAGES
	--SET Qty = Convert(Int, @Quantity), Price_Adjust= Round(@Total_Price, 0),
	--Internal_Cost= Round(@Internal_Cost * @Factor, 0), No_Of_Months = Convert(Numeric(3), @No_Of_Months),
	--Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID= @Update_FID, Add_To_Contract_Price = @Add_To_Contract_Price, Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust, FM_CODE = @FM_CODE 
	--WHERE AM_NO = @CURRENT_AM_NO AND PROJECT_ID = @Project_ID AND @CURRENT_PACKAGE_CODE = PACKAGE_ID and FM_CODE =@FM_CODE
	


	--Select @Method_Code = Method_Code
	--From AM_BASE
	--Where Project_ID = @Project_ID And AM_No = @CURRENT_AM_NO
	
	--If @Method_Code Is Not Null
	--Begin
	--	--  BEGIN #20070313
	--	Update AM_BASE
	--	Set AM_PRICE = null, 
	--		AM_TOT_PRICE = null, Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
	--	Where Project_ID = @Project_ID And AM_NO = @MOA_No
	--EnD

	--set @PRE_Add_To_Contract_Price = @Add_To_Contract_Price;
	--set  @PRE_Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust;
	--SET @i=@i+1;
	--END
	--END

	--End



	-- END #20151204 TAY


		/* BEGIN #20070313

		Declare @Flat_List_Price Numeric(18, 2)
		Declare @Car_Park_List_Price_Before_Adjustment Numeric(18, 2)
		Declare @Car_Park_List_Price_After_Adjustment Numeric(18, 2)
		Declare @Package_List_Price_1 Numeric(18, 2)
		Declare @Package_List_Price_2 Numeric(18, 2)
		Declare @Package_List_Price_3 Numeric(18, 2)
		Declare @Contract_Price Numeric(18, 2)
		Declare @Cash_Rebate Numeric(18, 2)
		Declare @Net_Price Numeric(18, 2)
		Declare @Adjustment Numeric(5, 2)
		Declare @Cash_Rebate_Amount Numeric(18, 2)
		Declare @Cash_Rebate_Unit NChar(1)
		Declare @Last_Sequence Int
		Declare @Previous_Sum Numeric(18, 2)
		Declare @Negotiation_Adjustment Numeric(18, 2)
		
		Select @Flat_List_Price = Sum(IsNull(FM_List_Price, 0))
		From Flat_Master
		Where Project_ID = @Project_ID And MOA_No = @MOA_No
		
		Select @Car_Park_List_Price_Before_Adjustment = sum(isnull(case when ADD_CAR_PARK_PRICE_BEFORE_ADJUST = 'Y' then Park_List_Price else 0 end, 0)),
			@Car_Park_List_Price_After_Adjustment = sum(isnull(case when (ADD_CAR_PARK_PRICE_BEFORE_ADJUST is null or ADD_CAR_PARK_PRICE_BEFORE_ADJUST <> 'Y') then Park_List_Price else 0 end, 0)) 
		From Car_Park
		Where Project_ID = @Project_ID And MOA_No = @MOA_No
		
		select @Package_List_Price_1 = sum(isnull(case when add_to_contract_price = 'Y' and add_pkg_b4_adjust = 'Y' Then price_adjust else 0 end, 0)),
			@Package_List_Price_2 = sum(isnull(case when add_to_contract_price = 'Y' and (add_pkg_b4_adjust is null or add_pkg_b4_adjust <> 'Y') Then price_adjust else 0 end, 0)),
			@Package_List_Price_3 = sum(isnull(case when (add_to_contract_price is null or add_to_contract_price <> 'Y') Then price_adjust else 0 end, 0))
		From MOA_Packages
		Where Project_ID = @Project_ID And MOA_No = @MOA_No
		
		Select @Adjustment = IsNull(Pay_Adj_Per, 0), @Cash_Rebate_Amount = IsNull(Cash_Rebate, 0), @Cash_Rebate_Unit = Cash_Rebate_Unit, @Negotiation_Adjustment = IsNull(Negotiation_Adj, 0)
		From MOA
		Where Project_ID = @Project_ID And MOA_No = @MOA_No
		
		Select @Contract_Price = @Flat_List_Price + @Car_Park_List_Price_Before_Adjustment + @Car_Park_List_Price_After_Adjustment + @Negotiation_Adjustment + @Package_List_Price_1 + @Package_List_Price_2 + Round((@Flat_List_Price + @Car_Park_List_Price_Before_Adjustment + @Negotiation_Adjustment + @Package_List_Price_1) * @Adjustment / 100.0, 0)

		Select @Contract_Price = @Contract_Price - (@Contract_Price % 100)
		
		If @Cash_Rebate_Amount Is Not Null
		Begin
			If @Cash_Rebate_Unit = N'P'
			Begin
				Select @Cash_Rebate = @Flat_List_Price * @Cash_Rebate_Amount / 100.0
			End
			Else
			Begin
				Select @Cash_Rebate = @Cash_Rebate_Amount
			End
		End
		
		Select @Net_Price = @Contract_Price + @Cash_Rebate + @Package_List_Price_3
		
		Update MOA
		Set MOA_Price = @Contract_Price, MOA_Cash_Rebate = @Cash_Rebate,
			MOA_Tot_Price = @Net_Price, Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And MOA_No = @MOA_No

		Select @Last_Sequence = Max(Py_Plan_Seq)
		From MOA_Py_Plan
		Where Project_ID = @Project_ID And MOA_No = @MOA_No And Method_Code = @Method_Code
		
		Select @Previous_Sum = Sum(IsNull(Py_Paymt_Due, 0))
		From MOA_Py_Plan
		Where Project_ID = @Project_ID And MOA_No = @MOA_No And Method_Code = @Method_Code And Py_Plan_Seq <> @Last_Sequence
		
		Update MOA_Py_Plan
		Set Py_Paymt_Due = @Net_Price - @Previous_Sum, Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And MOA_No = @MOA_No And Method_Code = @Method_Code And Py_Plan_Seq = @Last_Sequence

		END #20070313 */


Return
GO
/****** Object:  StoredProcedure [dbo].[ImportAndCheckREG_NO_DISPLAY]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log

-- #20151019 Modified by Tommyay on 2015-10-19 , Change the stored for new structure.


CREATE Procedure [dbo].[ImportAndCheckREG_NO_DISPLAY](
		@REG_NO_DISPLAY nvarchar (max),
		@Seq nvarchar (max),
		@Project_ID nvarchar(10),
		@Ballot_POOL_No int,
		@Ballot_batch_id int ,
		@Result nvarchar(1) Output
)
 
As
BEGIN



declare @DT_REG_NO_DISPLAY nvarchar(20);
declare @DB_REG_NO_DISPLAY nvarchar(20);
Declare @SeqCheck as int=1;
Declare @No_of_Reg as int =0;
Declare @counter as int =1;
set @Result='Y'


Select @No_of_Reg = Count(*) from Ballot_Pool_reg bpr join ballot_pool bp on bp.ballot_pool_id = bpr.ballot_pool_id 
where @Ballot_batch_id=ballot_batch_id and @Project_ID=Project_ID and bp.ballot_pool_status='I'

select @SeqCheck=count (*) 
from (select ROW_NUMBER() over (order by RowValue asc ) [Rownumber] , RowValue from SF_SplitTable(@Seq)) tmp where RowValue=Rownumber

if (@SeqCheck<>@No_of_Reg)
Begin
set @Result= 'S'; -- Seq is not connectable or is not equal to database
End

if((select count(*) from BALLOT_POOL_REG bpr join BALLOT_POOL bp on bpr.BALLOT_POOL_ID = bp.BALLOT_POOL_ID where bpr.BALLOT_BATCH_ID = @Ballot_batch_id and bp.PROJECT_ID=@Project_ID and bp.BALLOT_POOL_NO = @Ballot_POOL_No and BALLOT_REG_STATUS ='B')>0)
Begin
set @Result = 'B'
End

while (@counter <= @No_of_Reg and @Result='Y')
Begin

select @DT_REG_NO_DISPLAY=RowValue ,  @DB_REG_NO_DISPLAY=REG_NO_DISPLAY from (
select  ROW_NUMBER() over (order by REG_NO_DISPLAY asc)[rownumber], REG_NO_DISPLAY from BALLOT_POOL_REG bpr 
join BALLOT_BATCH bb on bb.BALLOT_BATCH_ID = bpr.BALLOT_BATCH_ID 
join ballot_reg br on bpr.BALLOT_REG_ID=br.BALLOT_REG_ID
join BALLOT_POOL bp on bpr.BALLOT_POOL_ID = bp.BALLOT_POOL_ID
where bb.BALLOT_BATCH_ID = @Ballot_batch_id and bp.PROJECT_ID=@Project_ID and bp.BALLOT_POOL_NO = @Ballot_POOL_No AND BPR.BALLOT_REG_STATUS<>'B' AND BPR.BALLOT_REG_STATUS<>'C' AND BPR.BALLOT_REG_STATUS<>'X' AND BPR.BALLOT_REG_STATUS<>'W' )tmp1
 join ( 
select ROW_NUMBER() over (order by RowValue asc)[rownumber], RowValue from SF_SplitTable(@REG_NO_DISPLAY)
) tmp2 on tmp1.rownumber=tmp2.rownumber where tmp1.rownumber =@counter

if (@DT_REG_NO_DISPLAY<>@DB_REG_NO_DISPLAY)
begin
set @Result='F'  -- IMPORT DATA IS NOT CONSISTENT WITH DB DATA
end

set @counter = @counter+1
End


if ((select count(*) from BALLOT_POOL_REG bpr join BALLOT_POOL bp on bp.BALLOT_POOL_ID=bpr.BALLOT_POOL_ID where ballot_pool_no=@Ballot_POOL_No and  bp.PROJECT_ID =@Project_ID and bpr.BALLOT_RESULT_SEQ is null )=0)
Begin 
update BALLOT_POOL
set BALLOT_POOL_STATUS='B' where ballot_pool_no=@Ballot_POOL_No and PROJECT_ID =@Project_ID
End

End
GO
/****** Object:  StoredProcedure [dbo].[Init]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Init]
(
	@Result Char(1) Output
)
 
As
	Declare @expiryDate DateTime
	Declare @toDay DateTime

	Select @expiryDate = Convert(DateTime, '12/31/2014', 101)
	Select @toDay = GetDate()

	If @toDay > @expiryDate
	Begin
		Raiserror('Evaluation period expired.', 16, 1)
	End
	Else If DatePart(Year, @toDay) = DatePart(Year, @expiryDate) And
			DatePart(Month, @toDay) = DatePart(Month, @expiryDate)
	Begin
		Select @Result = 'Y'
	End
	Else
	Begin
		Select @Result = 'N'
	End
Return 
GO
/****** Object:  StoredProcedure [dbo].[MakeSelection]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Modification Log: 
#20060922 - Modified on 2006-09-22, add onhold case
#20080214 - Modified on 2008-02-14, update for using encrypted user password
#20140109 - Modified by Oscar Kwok on 2013-09-09, Allow multi-purchase
*/


CREATE Procedure [dbo].[MakeSelection]
(
	@Project_ID NVarChar(6),
	@FM_Select NVarChar(1),
	@FM_Code NVarChar(500),
	@FM_Last_Update_Date NVarChar(30),
	@CP_Select NVarChar(1),
	@CP_Code NVarChar(80),
	@CP_Last_Update_Date NVarChar(30),
	@Selection_Order NVarChar(30),
	@Username NVarChar(10),
	@Password NVarChar(16),
	@Up_UID NVarChar(10),
	@Up_FID NVarChar(10),
	@Return_Status Int Output,
	/* Last Update Date of record, return for unhold purpose */
	@Last_Update_Date NVarChar(30) Output,
	@IDType NVarChar(1)
)
 
As
	Declare @_code NVarChar(80)
	Declare @_deleted NVarChar(1)
	Declare @_expire_Date DateTime
	Declare @_have_Permission NVarChar(1)
	Declare @_password NVarChar(16)
	Declare @_position Int
	Declare @_status NVarChar(1)
	Declare @_update_Date NVarChar(30)
	Declare @_last_update_Date DateTime

	Select @_last_update_Date = getdate()
	Select @Last_Update_Date = convert(NVarChar(30), @_last_update_Date, 121)

	Declare @TotalAllowUnit DECIMAL(9,2)
	Declare @CompUnit Int
	Declare @MaxCompPCT DECIMAL(9,2)


	If (@FM_Code Is Not Null And @FM_Code <> N'') And (@FM_Select Is Not Null And @FM_Select = N'Y')
	Begin
		Declare @_cp_Deleted NVarChar(1)
		Declare @_cp_Status NVarChar(1)
		Declare @_cp_Update_Date NVarChar(30)

		If (Select Count(1) From Flat_Master Where Project_ID = @Project_ID And FM_Code = @FM_Code) = 0
		Begin
			Select @Return_Status = -1001  -- Unit Not Found
			Return
		End

		/*
		Select @_status = FM_Status, @_deleted = Case When FM_Deleted = N'Y' Then N'Y' Else N'N' End,
			@_update_Date = Convert(NVarChar(30), Up_Dt, 121)
		From Flat_Master
		Where Project_ID = @Project_ID And FM_Code = @FM_Code
		*/
		-- BEGIN #20060922 --
		Select @_status = isnull(b.Org_Status, a.FM_Status), @_deleted = Case When a.FM_Deleted = N'Y' Then N'Y' Else N'N' End,
		@_update_Date = Convert(NVarChar(30), a.Up_Dt, 121)
		From Flat_Master a left outer join Flat_Selection b
		on (b.fm_code = a.fm_code and b.project_id = a.project_id
		and b.update_date = (select max(update_date) from  Flat_Selection
		where fm_code = b.fm_code and project_id = b.project_id))
		Where a.Project_ID = @Project_ID And a.FM_Code = @FM_Code
		-- END #20060922 --


		If @_deleted = N'Y'
		Begin
			Select @Return_Status = -1002  -- Unit Deleted
			Return
		End

		If @_status <> N'A' And @_status <> N'R'
		Begin
			Select @Return_Status = -1003  -- Unit Not Available
			Return
		End

		If @FM_Last_Update_Date <> @_update_Date
		Begin
			Select @Return_Status = -1004  -- Unit Being Modified
			Return
		End

		If @_status = N'R'
		Begin
			If (@Username Is Null Or @Username = N'')
			Begin
				Select @Return_Status = -3001 -- No Username
				Return
			End

			If (Select Count(*) From user_Profile Where UID = @Username) = 0
			Begin
				Select @Return_Status = -3002  -- No Such User
				Return
			End

			If (@Password Is Null Or @Password = N'')
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End

			Select @_password = Password, @_expire_Date = Exp_Date,
				@_have_Permission = Case When Select_Reserve = N'Y' Then N'Y' Else N'N' End
			From User_Profile
			Where UID = @Username

			/*BEGIN #20080214*/
			If HASHBYTES('MD5', @Password) <> @_password
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End
			/*
			If Len(@Password) <> Len(@_password)
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End

			
			Select @_position = 1

			While @_position <= Len(@Password)
			Begin
				If Ascii(SubString(@Password, @_position, 1)) <> Ascii(SubString(@_password, @_position, 1))
				Begin
					Select @Return_Status = -3003  -- Incorrect Password
					Return
				End

				Select @_position = @_position + 1
			End
			*/
			/*END #20080214*/

			If @_expire_Date < DateAdd(Day, 1, Convert(DateTime, Convert(NVarChar(10), GetDate(), 105), 105))
			Begin
				Select @Return_Status = -3004  -- User Account Expired
				Return
			End

			If @_have_Permission <> N'Y'
			Begin
				Select @Return_Status = -3005  -- User Have No Permission
				Return
			End
		End

		If (Select Count(*) From Car_Park Where Project_ID = @Project_ID And FM_Code = @FM_Code) > 1
		Begin
			Select @Return_Status = -1006  -- More Then One Corresponding Car Park
			Return
		End

		/*
		Select @_code = Car_Park_ID, @_cp_Status = Status,
			@_cp_Deleted = Case When Car_Park_Deleted = N'Y' Then N'Y' Else N'N' End,
			@_cp_Update_Date = Convert(NVarChar(30), Up_Dt, 121)
		From Car_Park
		Where Project_ID = @Project_ID And FM_Code = @FM_Code
		*/
		-- BEGIN #20060922 --		
		Select @_code = a.Car_Park_ID, @_cp_Status = isnull(b.org_status, a.Status),
		@_cp_Deleted = Case When a.Car_Park_Deleted = N'Y' Then N'Y' Else N'N' End,
		@_cp_Update_Date = Convert(NVarChar(30), a.Up_Dt, 121)
		From Car_Park a left outer join car_park_selection b
		on (b.car_park_id = a.car_park_id and b.project_id = a.project_id
		and b.update_date = (select max(update_date) from car_park_selection
		where car_park_id = b.car_park_id and project_id = b.project_id))
		Where a.Project_ID = @Project_ID And a.FM_Code = @FM_Code
		-- END #20060922 --


		If (@CP_Code Is Not Null And @CP_Code <> N'') Or (@_code Is Not Null And @_code <> N'')
		Begin
			If @CP_Code <> @_code
			Begin
				Select @Return_Status = -1005  -- Linkage Being Modified
				Return
			End
		End
		Else
		Begin
			If ((@CP_Code Is Null Or @CP_Code = N'') And (@_code Is Not Null And @_code <> N'')) Or ((@CP_Code Is Not Null And @CP_Code <> N'') And (@_code Is Null Or @_code = N''))
			Begin
				Select @Return_Status = -1005  -- Linkage Being Modified
				Return
			End
		End

		If (@CP_Code Is Not Null And @CP_Code <> N'')
		Begin
			If @_cp_Deleted = N'Y'
			Begin
				Select @Return_Status = -1501  -- Corresponding Car Park Deleted
				Return
			End

			If @_status <> @_cp_Status
			Begin
				Select @Return_Status = -1502  -- Status Not Synchronized
				Return
			End

			If @CP_Last_Update_Date <> @_cp_Update_Date
			Begin
				Select @Return_Status = -1503  -- Corresponding Car Park Being Modified
				Return
			End
		End


		-- BEGIN #20140109
		DECLARE @MultiUnit [char](1);
		DECLARE @PurchaseUnit [int] = 0;
		DECLARE @SelectUnit [int] = 0;

		SELECT @MultiUnit = Multiple_Unit FROM Project_Master WHERE Project_ID = @Project_ID;
		SELECT @PurchaseUnit = COUNT(1) FROM MOA WHERE Project_ID = @Project_ID And Selection_Order = @Selection_Order AND MOA_Status In ('O', 'C');
		Select @SelectUnit = COUNT(1) FROM Flat_Selection A WHERE A.Status = 'S' AND A.ID_TYPE = @IDType AND A.Selection_Order = @Selection_Order AND A.Update_Date = (SELECT Max(B.Update_Date) FROM Flat_Selection B WHERE A.Project_ID = B.Project_ID And A.FM_Code = B.FM_Code);


		IF ((@MultiUnit = 'N') AND ((@PurchaseUnit + @SelectUnit) > 0))
			BEGIN
				Select @Return_Status = -4000  -- Multiple Selection
				Return
			END
		ELSE IF ((ISNUMERIC (@MultiUnit) = 1) AND ((@PurchaseUnit + @SelectUnit) >= (CAST(@MultiUnit AS INT))))
			BEGIN
				Select @Return_Status = -4000  -- Multiple Selection
				Return
			END



		/*
		If (Select Multiple_Unit From Project_Master Where Project_ID = @Project_ID) = 'N'
		Begin
			If (Select Count(1) From MOA Where Project_ID = @Project_ID And Selection_Order = @Selection_Order And MOA_Status In ('O', 'C')) > 0
				Or (Select Count(1)
					From Flat_Selection A
					Where A.Status = 'S' And A.Selection_Order = @Selection_Order And A.Update_Date = (
						Select Max(B.Update_Date)
						From Flat_Selection B
						Where A.Project_ID = B.Project_ID And A.FM_Code = B.FM_Code
					)) > 0
			Begin
				Select @Return_Status = -4000  -- Multiple Selection
				Return
			End
		End
		*/


		If (@IDType = 'B')
		BEGIN
			
			SELECT @TotalAllowUnit = COUNT(*) FROM FLAT_MASTER WHERE FM_DELETED = 'N' AND PROJECT_ID = @Project_ID;
			SELECT @MaxCompPCT = COMP_PCT FROM PROJECT_MASTER WHERE PROJECT_ID = @Project_ID;
			-- SELECT @CompUnit = COUNT(*) FROM FLAT_SELECTION WHERE PROJECT_ID = 'GRV' AND ID_TYPE = 'B'

			SELECT @CompUnit = COUNT(*)
			FROM 
				FLAT_SELECTION fs
				/*
				JOIN 
				(
					SELECT FM_CODE, PROJECT_ID, MAX(UPDATE_DATE) UPDATE_DATE
					FROM FLAT_SELECTION
					WHERE PROJECT_ID = @Project_ID
					GROUP BY FM_CODE, PROJECT_ID
				) mfs ON fs.FM_CODE = mfs.FM_CODE AND fs.PROJECT_ID = mfs.PROJECT_ID AND fs.UPDATE_DATE = mfs.UPDATE_DATE
				*/
				JOIN 
				(		
					SELECT
						t1.FM_CODE, t1.PROJECT_ID, 
						-- CASE WHEN f.[STATUS] = 'B' THEN 1 ELSE 0 END RecordType,
						CASE WHEN f.[STATUS] = 'B' THEN t2.MAX_S_DATE ELSE t1.MAX_DATE END UPDATE_DATE
					FROM
						FLAT_SELECTION f
						JOIN (
							SELECT FM_CODE, PROJECT_ID, MAX(UPDATE_DATE) MAX_DATE
							FROM FLAT_SELECTION
							WHERE PROJECT_ID = @Project_ID
							GROUP BY FM_CODE, PROJECT_ID
						) t1 ON t1.FM_CODE = f.FM_CODE AND t1.PROJECT_ID = f.PROJECT_ID AND f.UPDATE_DATE = t1.MAX_DATE
						JOIN 
						(
							SELECT FM_CODE, PROJECT_ID, MAX(UPDATE_DATE) MAX_S_DATE
							FROM FLAT_SELECTION
							WHERE PROJECT_ID = @Project_ID AND [STATUS] = 'S'
							GROUP BY FM_CODE, PROJECT_ID
						) t2 ON t1.FM_CODE = t2.FM_CODE AND t1.PROJECT_ID = t2.PROJECT_ID
				) mfs ON fs.FM_CODE = mfs.FM_CODE AND fs.PROJECT_ID = mfs.PROJECT_ID AND fs.UPDATE_DATE = mfs.UPDATE_DATE
			WHERE
				fs.PROJECT_ID = @Project_ID
				AND ID_TYPE  = 'B'
				AND fs.[STATUS] IN ('S', 'B');


			
			SET @MaxCompPCT = @MaxCompPCT / 100;
			SET @TotalAllowUnit = @TotalAllowUnit * @MaxCompPCT;

			-- IF ((@MaxCompPCT IS NOT NULL) AND (ROUND(@TotalAllowUnit, 0) <= @CompUnit))
			IF ((@MaxCompPCT IS NOT NULL) AND (FLOOR(@TotalAllowUnit) <= @CompUnit))
			BEGIN
				Select @Return_Status = -4001  -- Max Company Select Limit
				Return	
			END
		END





		Begin Transaction

		If (@CP_Code Is Not Null And @CP_Code <> N'')
		Begin
			If (@CP_Select Is Not Null And @CP_Select = N'Y')
			Begin
				Update Car_Park
				Set Status = N'P', Up_Dt = @_last_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
				Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
					And Convert(NVarChar(30), Up_Dt, 121) = @CP_Last_Update_Date

				If @@RowCount = 0
				Begin
					Rollback Transaction

					Select @Return_Status = -1503  -- Corresponding Car Park Begin Modified
					Return
				End

				Insert Into Car_Park_Selection
					(Project_ID, Car_Park_ID, Selection_Order, Status, Update_Date, Up_UID, Up_FID)
				Values
					(@Project_ID, @CP_Code, @Selection_Order, N'S', @_last_update_Date, @Up_UID, @Up_FID)

				If @@Error <> 0
				Begin
					Rollback Transaction

					Select @Return_Status = -1500  -- Select Corresponding Car Park Failed
					Return
				End
			End
			Else
			Begin
				Update Car_Park
				Set FM_Code = Null, Up_Dt = @_last_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
				Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
					And Convert(NVarChar(30), Up_Dt, 121) = @CP_Last_Update_Date

				If @@RowCount = 0
				Begin
					Rollback Transaction

					Select @Return_Status = -1503  -- Corresponding Car Park Begin Modified
					Return
				End
			End
		End

		Update Flat_Master
		Set FM_Status = N'P', Up_Dt = @_last_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
		Where Project_ID = @Project_ID And FM_Code = @FM_Code
			And Convert(NVarChar(30), Up_Dt, 121) = @FM_Last_Update_Date

		If @@RowCount = 0
		Begin
			Select @Return_Status = -1004  -- Unit Being Modified
			Return
		End

		Insert Into Flat_Selection
			(Project_ID, FM_Code, Selection_Order, Status, Update_Date, Up_UID, Up_FID, ID_TYPE)
		Values
			(@Project_ID, @FM_Code, @Selection_Order, N'S', @_last_update_Date, @Up_UID, @Up_FID, @IDType)

		If @@Error <> 0
		Begin
			Rollback Transaction

			Select @Return_Status = -1000  -- Select Unit Failed
			Return
		End

		Commit Transaction

		Select @Return_Status = 1000  -- Select Unit Succeeded
		Return
	End
	Else If (@CP_Code Is Not Null And @CP_Code <> N'') And (@CP_Select Is Not Null And @CP_Select = N'Y')
	Begin
		If (Select Count(*) From Car_Park Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code) = 0
		Begin
			Select @Return_Status = -2001  -- Car Park Not Found
			Return
		End

		/*
		Select @_status = Status, @_deleted = Case When Car_Park_Deleted = N'Y' Then N'Y' Else N'N' End,
			@_update_Date = Convert(NVarChar(30), Up_Dt, 121)
		From Car_Park
		Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
		*/
		-- BEGIN #20060922 --
		
		Select @_status = isnull(b.org_status, a.Status), @_deleted = Case When a.Car_Park_Deleted = N'Y' Then N'Y' Else N'N' End,
		@_update_Date = Convert(NVarChar(30), a.Up_Dt, 121)
		From Car_Park a left outer join car_park_selection b
		on (b.car_park_id = a.car_park_id and b.project_id = a.project_id
		and b.update_date = (select max(update_date) from car_park_selection
		where car_park_id = b.car_park_id and project_id = b.project_id))
		Where a.Project_ID = @Project_ID And a.Car_Park_ID = @CP_Code

		-- END #20060922 --

		If @_deleted = N'Y'
		Begin
			Select @Return_Status = -2002  -- Car Park Deleted
			Return
		End

		If @_status <> N'A' And @_status <> N'R'
		Begin
			Select @Return_Status = -2003  -- Car Park Not Available
			Return
		End

		If @CP_Last_Update_Date <> @_update_Date
		Begin
			Select @Return_Status = -2004  -- Car Park Being Modified
			Return
		End

		If @_status = N'R'
		Begin

			If (@Username Is Null Or @Username = N'')
			Begin
				Select @Return_Status = -3001 -- No Username
				Return
			End

			If (Select Count(*) From user_Profile Where UID = @Username) = 0
			Begin
				Select @Return_Status = -3002  -- No Such User
				Return
			End

			If (@Password Is Null Or @Password = N'')
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End

			Select @_password = Password, @_expire_Date = Exp_Date,
				@_have_Permission = Case When Select_Reserve = N'Y' Then N'Y' Else N'N' End
			From User_Profile
			Where UID = @Username

			/*BEGIN #20080214*/
			If HASHBYTES('MD5', @Password) <> @_password
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End
			/*
			If Len(@Password) <> Len(@_password)
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End

			Select @_position = 1

			While @_position <= Len(@Password)
			Begin
				If Ascii(SubString(@Password, @_position, 1)) <> Ascii(SubString(@_password, @_position, 1))
				Begin
					Select @Return_Status = -3003  -- Incorrect Password
					Return
				End

				Select @_position = @_position + 1
			End
			*/
			/*END #20080214*/

			If @_expire_Date < DateAdd(Day, 1, Convert(DateTime, Convert(NVarChar(10), GetDate(), 105), 105))
			Begin
				Select @Return_Status = -3004  -- User Account Expired
				Return
			End

			If @_have_Permission <> N'Y'
			Begin
				Select @Return_Status = -3005  -- User Have No Permission
				Return
			End
		End

		Select @_code = FM_Code
		From Car_Park
		Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code

		If (@FM_Code Is Not Null And @FM_Code <> N'') And (@_code Is Not Null And @_code <> N'')
		Begin
			If @FM_Code <> @_code
			Begin
				Select @Return_Status = -2005  -- Linkage Being Modified
				Return
			End
		End
		Else
		Begin
			If ((@FM_Code Is Null Or @FM_Code = N'') And (@_code Is Not Null And @_code <> N'')) Or ((@FM_Code Is Not Null And @FM_Code <> N'') And (@_code Is Null Or @_code = N''))
			Begin
				Select @Return_Status = -2005  -- Linkage Being Modified
				Return
			End
		End

		Begin Transaction

		Update Car_Park
		Set Status = N'P', FM_Code = Null, Up_Dt = @_last_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
		Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
			And Convert(NVarChar(30), Up_Dt, 121) = @CP_Last_Update_Date

		If @@RowCount = 0
		Begin
			Rollback Transaction

			Select @Return_Status = -2004  -- Car Park Being Modified
			Return
		End

		Insert Into Car_Park_Selection
			(Project_ID, Car_Park_ID, Selection_Order, Status, Update_Date, Up_UID, Up_FID)
		Values
			(@Project_ID, @CP_Code, @Selection_Order, N'S', @_last_update_Date, @Up_UID, @Up_FID)

		If @@Error <> 0
		Begin
			Rollback Transaction

			Select @Return_Status = -2000  -- Select Car Park Failed
			Return
		End

		Commit Transaction

		Select @Return_Status = 2000  -- Select Car Park Succeeded
		Return
	End

	Select @Return_Status = 0  -- Unknown
	Return
GO
/****** Object:  StoredProcedure [dbo].[MakeSelectionWithAuthentication]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[MakeSelectionWithAuthentication]
(
	@Project_ID NVarChar(6),
	@FM_Select NVarChar(1),
	@FM_Code NVarChar(500),
	@FM_Last_Update_Date NVarChar(30),
	@CP_Select NVarChar(1),
	@CP_Code NVarChar(80),
	@CP_Last_Update_Date NVarChar(30),
	@Selection_Order NVarChar(30),
	@Username NVarChar(10),
	@Password NVarChar(16),
	@Up_UID NVarChar(10),
	@Up_FID NVarChar(10),
	@Return_Status Int Output,
	/* Last Update Date of record, return for unhold purpose */
	@Last_Update_Date NVarChar(30) Output,
	@IDType NVarChar(1),
	@Need_Authentication NVarChar(1)
)
 
As
	Declare @_code NVarChar(80)
	Declare @_deleted NVarChar(1)
	Declare @_expire_Date DateTime
	Declare @_have_Permission NVarChar(1)
	Declare @_password NVarChar(16)
	Declare @_position Int
	Declare @_status NVarChar(1)
	Declare @_update_Date NVarChar(30)
	Declare @_last_update_Date DateTime

	Select @_last_update_Date = getdate()
	Select @Last_Update_Date = convert(NVarChar(30), @_last_update_Date, 121)

	Declare @TotalAllowUnit DECIMAL(9,2)
	Declare @CompUnit Int
	Declare @MaxCompPCT DECIMAL(9,2)


	If (@FM_Code Is Not Null And @FM_Code <> N'') And (@FM_Select Is Not Null And @FM_Select = N'Y')
	Begin
		Declare @_cp_Deleted NVarChar(1)
		Declare @_cp_Status NVarChar(1)
		Declare @_cp_Update_Date NVarChar(30)

		If (Select Count(1) From Flat_Master Where Project_ID = @Project_ID And FM_Code = @FM_Code) = 0
		Begin
			Select @Return_Status = -1001  -- Unit Not Found
			Return
		End

		/*
		Select @_status = FM_Status, @_deleted = Case When FM_Deleted = N'Y' Then N'Y' Else N'N' End,
			@_update_Date = Convert(NVarChar(30), Up_Dt, 121)
		From Flat_Master
		Where Project_ID = @Project_ID And FM_Code = @FM_Code
		*/
		-- BEGIN #20060922 --
		Select @_status = isnull(b.Org_Status, a.FM_Status), @_deleted = Case When a.FM_Deleted = N'Y' Then N'Y' Else N'N' End,
		@_update_Date = Convert(NVarChar(30), a.Up_Dt, 121)
		From Flat_Master a left outer join Flat_Selection b
		on (b.fm_code = a.fm_code and b.project_id = a.project_id
		and b.update_date = (select max(update_date) from  Flat_Selection
		where fm_code = b.fm_code and project_id = b.project_id))
		Where a.Project_ID = @Project_ID And a.FM_Code = @FM_Code
		-- END #20060922 --


		If @_deleted = N'Y'
		Begin
			Select @Return_Status = -1002  -- Unit Deleted
			Return
		End

		If @_status <> N'A' And @_status <> N'R'
		Begin
			Select @Return_Status = -1003  -- Unit Not Available
			Return
		End

		If @FM_Last_Update_Date <> @_update_Date
		Begin
			Select @Return_Status = -1004  -- Unit Being Modified
			Return
		End

		If @_status = N'R' or @Need_Authentication = N'Y'
		Begin
			If (@Username Is Null Or @Username = N'')
			Begin
				Select @Return_Status = -3001 -- No Username
				Return
			End

			If (Select Count(*) From user_Profile Where UID = @Username) = 0
			Begin
				Select @Return_Status = -3002  -- No Such User
				Return
			End

			If (@Password Is Null Or @Password = N'')
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End

			Select @_password = Password, @_expire_Date = Exp_Date,
				@_have_Permission = Case When Select_Reserve = N'Y' Then N'Y' Else N'N' End
			From User_Profile
			Where UID = @Username

			/*BEGIN #20080214*/
			If HASHBYTES('MD5', @Password) <> @_password
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End
			/*
			If Len(@Password) <> Len(@_password)
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End

			
			Select @_position = 1

			While @_position <= Len(@Password)
			Begin
				If Ascii(SubString(@Password, @_position, 1)) <> Ascii(SubString(@_password, @_position, 1))
				Begin
					Select @Return_Status = -3003  -- Incorrect Password
					Return
				End

				Select @_position = @_position + 1
			End
			*/
			/*END #20080214*/

			If @_expire_Date < DateAdd(Day, 1, Convert(DateTime, Convert(NVarChar(10), GetDate(), 105), 105))
			Begin
				Select @Return_Status = -3004  -- User Account Expired
				Return
			End

			If @_have_Permission <> N'Y'
			Begin
				Select @Return_Status = -3005  -- User Have No Permission
				Return
			End
		End

		If (Select Count(*) From Car_Park Where Project_ID = @Project_ID And FM_Code = @FM_Code) > 1
		Begin
			Select @Return_Status = -1006  -- More Then One Corresponding Car Park
			Return
		End

		/*
		Select @_code = Car_Park_ID, @_cp_Status = Status,
			@_cp_Deleted = Case When Car_Park_Deleted = N'Y' Then N'Y' Else N'N' End,
			@_cp_Update_Date = Convert(NVarChar(30), Up_Dt, 121)
		From Car_Park
		Where Project_ID = @Project_ID And FM_Code = @FM_Code
		*/
		-- BEGIN #20060922 --		
		Select @_code = a.Car_Park_ID, @_cp_Status = isnull(b.org_status, a.Status),
		@_cp_Deleted = Case When a.Car_Park_Deleted = N'Y' Then N'Y' Else N'N' End,
		@_cp_Update_Date = Convert(NVarChar(30), a.Up_Dt, 121)
		From Car_Park a left outer join car_park_selection b
		on (b.car_park_id = a.car_park_id and b.project_id = a.project_id
		and b.update_date = (select max(update_date) from car_park_selection
		where car_park_id = b.car_park_id and project_id = b.project_id))
		Where a.Project_ID = @Project_ID And a.FM_Code = @FM_Code
		-- END #20060922 --


		If (@CP_Code Is Not Null And @CP_Code <> N'') Or (@_code Is Not Null And @_code <> N'')
		Begin
			If @CP_Code <> @_code
			Begin
				Select @Return_Status = -1005  -- Linkage Being Modified
				Return
			End
		End
		Else
		Begin
			If ((@CP_Code Is Null Or @CP_Code = N'') And (@_code Is Not Null And @_code <> N'')) Or ((@CP_Code Is Not Null And @CP_Code <> N'') And (@_code Is Null Or @_code = N''))
			Begin
				Select @Return_Status = -1005  -- Linkage Being Modified
				Return
			End
		End

		If (@CP_Code Is Not Null And @CP_Code <> N'')
		Begin
			If @_cp_Deleted = N'Y'
			Begin
				Select @Return_Status = -1501  -- Corresponding Car Park Deleted
				Return
			End

			If @_status <> @_cp_Status
			Begin
				Select @Return_Status = -1502  -- Status Not Synchronized
				Return
			End

			If @CP_Last_Update_Date <> @_cp_Update_Date
			Begin
				Select @Return_Status = -1503  -- Corresponding Car Park Being Modified
				Return
			End
		End


		-- BEGIN #20140109
		DECLARE @MultiUnit [char](1);
		DECLARE @PurchaseUnit [int] = 0;
		DECLARE @SelectUnit [int] = 0;

		SELECT @MultiUnit = Multiple_Unit FROM Project_Master WHERE Project_ID = @Project_ID;
		SELECT @PurchaseUnit = COUNT(1) FROM MOA WHERE Project_ID = @Project_ID And Selection_Order = @Selection_Order AND MOA_Status In ('O', 'C');
		Select @SelectUnit = COUNT(1) FROM Flat_Selection A WHERE A.Status = 'S' AND A.ID_TYPE = @IDType AND A.Selection_Order = @Selection_Order AND A.Update_Date = (SELECT Max(B.Update_Date) FROM Flat_Selection B WHERE A.Project_ID = B.Project_ID And A.FM_Code = B.FM_Code);


		IF ((@MultiUnit = 'N') AND ((@PurchaseUnit + @SelectUnit) > 0))
			BEGIN
				Select @Return_Status = -4000  -- Multiple Selection
				Return
			END
		ELSE IF ((ISNUMERIC (@MultiUnit) = 1) AND ((@PurchaseUnit + @SelectUnit) >= (CAST(@MultiUnit AS INT))))
			BEGIN
				Select @Return_Status = -4000  -- Multiple Selection
				Return
			END



		/*
		If (Select Multiple_Unit From Project_Master Where Project_ID = @Project_ID) = 'N'
		Begin
			If (Select Count(1) From MOA Where Project_ID = @Project_ID And Selection_Order = @Selection_Order And MOA_Status In ('O', 'C')) > 0
				Or (Select Count(1)
					From Flat_Selection A
					Where A.Status = 'S' And A.Selection_Order = @Selection_Order And A.Update_Date = (
						Select Max(B.Update_Date)
						From Flat_Selection B
						Where A.Project_ID = B.Project_ID And A.FM_Code = B.FM_Code
					)) > 0
			Begin
				Select @Return_Status = -4000  -- Multiple Selection
				Return
			End
		End
		*/

		/*
		If (@IDType = 'B')
		BEGIN
			
			SELECT @TotalAllowUnit = COUNT(*) FROM FLAT_MASTER WHERE FM_DELETED = 'N' AND PROJECT_ID = @Project_ID;
			SELECT @MaxCompPCT = COMP_PCT FROM PROJECT_MASTER WHERE PROJECT_ID = @Project_ID;
			-- SELECT @CompUnit = COUNT(*) FROM FLAT_SELECTION WHERE PROJECT_ID = 'GRV' AND ID_TYPE = 'B'

			SELECT @CompUnit = COUNT(*)
			FROM 
				FLAT_SELECTION fs
				/*
				JOIN 
				(
					SELECT FM_CODE, PROJECT_ID, MAX(UPDATE_DATE) UPDATE_DATE
					FROM FLAT_SELECTION
					WHERE PROJECT_ID = @Project_ID
					GROUP BY FM_CODE, PROJECT_ID
				) mfs ON fs.FM_CODE = mfs.FM_CODE AND fs.PROJECT_ID = mfs.PROJECT_ID AND fs.UPDATE_DATE = mfs.UPDATE_DATE
				*/
				JOIN 
				(		
					SELECT
						t1.FM_CODE, t1.PROJECT_ID, 
						-- CASE WHEN f.[STATUS] = 'B' THEN 1 ELSE 0 END RecordType,
						CASE WHEN f.[STATUS] = 'B' THEN t2.MAX_S_DATE ELSE t1.MAX_DATE END UPDATE_DATE
					FROM
						FLAT_SELECTION f
						JOIN (
							SELECT FM_CODE, PROJECT_ID, MAX(UPDATE_DATE) MAX_DATE
							FROM FLAT_SELECTION
							WHERE PROJECT_ID = @Project_ID
							GROUP BY FM_CODE, PROJECT_ID
						) t1 ON t1.FM_CODE = f.FM_CODE AND t1.PROJECT_ID = f.PROJECT_ID AND f.UPDATE_DATE = t1.MAX_DATE
						JOIN 
						(
							SELECT FM_CODE, PROJECT_ID, MAX(UPDATE_DATE) MAX_S_DATE
							FROM FLAT_SELECTION
							WHERE PROJECT_ID = @Project_ID AND [STATUS] = 'S'
							GROUP BY FM_CODE, PROJECT_ID
						) t2 ON t1.FM_CODE = t2.FM_CODE AND t1.PROJECT_ID = t2.PROJECT_ID
				) mfs ON fs.FM_CODE = mfs.FM_CODE AND fs.PROJECT_ID = mfs.PROJECT_ID AND fs.UPDATE_DATE = mfs.UPDATE_DATE
			WHERE
				fs.PROJECT_ID = @Project_ID
				AND ID_TYPE  = 'B'
				AND fs.[STATUS] IN ('S', 'B');


			
			SET @MaxCompPCT = @MaxCompPCT / 100;
			SET @TotalAllowUnit = @TotalAllowUnit * @MaxCompPCT;

			-- IF ((@MaxCompPCT IS NOT NULL) AND (ROUND(@TotalAllowUnit, 0) <= @CompUnit))
			IF ((@MaxCompPCT IS NOT NULL) AND (FLOOR(@TotalAllowUnit) <= @CompUnit))
			BEGIN
				Select @Return_Status = -4001  -- Max Company Select Limit
				Return	
			END
		END
		*/




		Begin Transaction

		If (@CP_Code Is Not Null And @CP_Code <> N'')
		Begin
			If (@CP_Select Is Not Null And @CP_Select = N'Y')
			Begin
				Update Car_Park
				Set Status = N'P', Up_Dt = @_last_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
				Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
					And Convert(NVarChar(30), Up_Dt, 121) = @CP_Last_Update_Date

				If @@RowCount = 0
				Begin
					Rollback Transaction

					Select @Return_Status = -1503  -- Corresponding Car Park Begin Modified
					Return
				End

				Insert Into Car_Park_Selection
					(Project_ID, Car_Park_ID, Selection_Order, Status, Update_Date, Up_UID, Up_FID)
				Values
					(@Project_ID, @CP_Code, @Selection_Order, N'S', @_last_update_Date, @Up_UID, @Up_FID)

				If @@Error <> 0
				Begin
					Rollback Transaction

					Select @Return_Status = -1500  -- Select Corresponding Car Park Failed
					Return
				End
			End
			Else
			Begin
				Update Car_Park
				Set FM_Code = Null, Up_Dt = @_last_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
				Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
					And Convert(NVarChar(30), Up_Dt, 121) = @CP_Last_Update_Date

				If @@RowCount = 0
				Begin
					Rollback Transaction

					Select @Return_Status = -1503  -- Corresponding Car Park Begin Modified
					Return
				End
			End
		End

		Update Flat_Master
		Set FM_Status = N'P', Up_Dt = @_last_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
		Where Project_ID = @Project_ID And FM_Code = @FM_Code
			And Convert(NVarChar(30), Up_Dt, 121) = @FM_Last_Update_Date

		If @@RowCount = 0
		Begin
			Select @Return_Status = -1004  -- Unit Being Modified
			Return
		End

		Insert Into Flat_Selection
			(Project_ID, FM_Code, Selection_Order, Status, Update_Date, Up_UID, Up_FID, ID_TYPE)
		Values
			(@Project_ID, @FM_Code, @Selection_Order, N'S', @_last_update_Date, @Up_UID, @Up_FID, @IDType)

		If @@Error <> 0
		Begin
			Rollback Transaction

			Select @Return_Status = -1000  -- Select Unit Failed
			Return
		End

		Commit Transaction

		Select @Return_Status = 1000  -- Select Unit Succeeded
		Return
	End
	Else If (@CP_Code Is Not Null And @CP_Code <> N'') And (@CP_Select Is Not Null And @CP_Select = N'Y')
	Begin
		If (Select Count(*) From Car_Park Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code) = 0
		Begin
			Select @Return_Status = -2001  -- Car Park Not Found
			Return
		End

		/*
		Select @_status = Status, @_deleted = Case When Car_Park_Deleted = N'Y' Then N'Y' Else N'N' End,
			@_update_Date = Convert(NVarChar(30), Up_Dt, 121)
		From Car_Park
		Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
		*/
		-- BEGIN #20060922 --
		
		Select @_status = isnull(b.org_status, a.Status), @_deleted = Case When a.Car_Park_Deleted = N'Y' Then N'Y' Else N'N' End,
		@_update_Date = Convert(NVarChar(30), a.Up_Dt, 121)
		From Car_Park a left outer join car_park_selection b
		on (b.car_park_id = a.car_park_id and b.project_id = a.project_id
		and b.update_date = (select max(update_date) from car_park_selection
		where car_park_id = b.car_park_id and project_id = b.project_id))
		Where a.Project_ID = @Project_ID And a.Car_Park_ID = @CP_Code

		-- END #20060922 --

		If @_deleted = N'Y'
		Begin
			Select @Return_Status = -2002  -- Car Park Deleted
			Return
		End

		If @_status <> N'A' And @_status <> N'R'
		Begin
			Select @Return_Status = -2003  -- Car Park Not Available
			Return
		End

		If @CP_Last_Update_Date <> @_update_Date
		Begin
			Select @Return_Status = -2004  -- Car Park Being Modified
			Return
		End

		If @_status = N'R'
		Begin

			If (@Username Is Null Or @Username = N'')
			Begin
				Select @Return_Status = -3001 -- No Username
				Return
			End

			If (Select Count(*) From user_Profile Where UID = @Username) = 0
			Begin
				Select @Return_Status = -3002  -- No Such User
				Return
			End

			If (@Password Is Null Or @Password = N'')
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End

			Select @_password = Password, @_expire_Date = Exp_Date,
				@_have_Permission = Case When Select_Reserve = N'Y' Then N'Y' Else N'N' End
			From User_Profile
			Where UID = @Username

			/*BEGIN #20080214*/
			If HASHBYTES('MD5', @Password) <> @_password
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End
			/*
			If Len(@Password) <> Len(@_password)
			Begin
				Select @Return_Status = -3003  -- Incorrect Password
				Return
			End

			Select @_position = 1

			While @_position <= Len(@Password)
			Begin
				If Ascii(SubString(@Password, @_position, 1)) <> Ascii(SubString(@_password, @_position, 1))
				Begin
					Select @Return_Status = -3003  -- Incorrect Password
					Return
				End

				Select @_position = @_position + 1
			End
			*/
			/*END #20080214*/

			If @_expire_Date < DateAdd(Day, 1, Convert(DateTime, Convert(NVarChar(10), GetDate(), 105), 105))
			Begin
				Select @Return_Status = -3004  -- User Account Expired
				Return
			End

			If @_have_Permission <> N'Y'
			Begin
				Select @Return_Status = -3005  -- User Have No Permission
				Return
			End
		End

		Select @_code = FM_Code
		From Car_Park
		Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code

		If (@FM_Code Is Not Null And @FM_Code <> N'') And (@_code Is Not Null And @_code <> N'')
		Begin
			If @FM_Code <> @_code
			Begin
				Select @Return_Status = -2005  -- Linkage Being Modified
				Return
			End
		End
		Else
		Begin
			If ((@FM_Code Is Null Or @FM_Code = N'') And (@_code Is Not Null And @_code <> N'')) Or ((@FM_Code Is Not Null And @FM_Code <> N'') And (@_code Is Null Or @_code = N''))
			Begin
				Select @Return_Status = -2005  -- Linkage Being Modified
				Return
			End
		End

		Begin Transaction

		Update Car_Park
		Set Status = N'P', FM_Code = Null, Up_Dt = @_last_update_Date, Up_UID = @Up_UID, Up_FID = @Up_FID
		Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
			And Convert(NVarChar(30), Up_Dt, 121) = @CP_Last_Update_Date

		If @@RowCount = 0
		Begin
			Rollback Transaction

			Select @Return_Status = -2004  -- Car Park Being Modified
			Return
		End

		Insert Into Car_Park_Selection
			(Project_ID, Car_Park_ID, Selection_Order, Status, Update_Date, Up_UID, Up_FID)
		Values
			(@Project_ID, @CP_Code, @Selection_Order, N'S', @_last_update_Date, @Up_UID, @Up_FID)

		If @@Error <> 0
		Begin
			Rollback Transaction

			Select @Return_Status = -2000  -- Select Car Park Failed
			Return
		End

		Commit Transaction

		Select @Return_Status = 2000  -- Select Car Park Succeeded
		Return
	End

	Select @Return_Status = 0  -- Unknown
	Return
GO
/****** Object:  StoredProcedure [dbo].[ModifyMaxPurchase]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyMaxPurchase]
	@ProjectID [nvarchar](10),
	@ModifyMaxP [nvarchar](1),
	@ModifiedNum [int] = null
WITH  EXECUTE AS CALLER
AS
begin
	--DECLARE @ReturnValue nvarchar;
	DECLARE @MaxNum int=null ;

		 
	select TOP 1 @MaxNum= [MAX_PURCHASE_UNIT]  FROM [dbo].[PROJECT_MASTER] where PROJECT_ID = @ProjectID;

	--select [MAX_PURCHASE_UNIT] from [dbo].[PROJECT_MASTER]; -- where PROJECT_ID LIKE @ProjectID;
	if(@ModifyMaxP='Y') begin 
	update [dbo].[PROJECT_MASTER] set [MAX_PURCHASE_UNIT] = isnull(@ModifiedNum, 0) where PROJECT_ID = @ProjectID;
	end
return 

End
GO
/****** Object:  StoredProcedure [dbo].[NewTag]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewTag]
	@code [nvarchar](210),
	@scope [nvarchar](255),
	@tags [nvarchar](4000)
WITH  EXECUTE AS CALLER
AS
if @code is null or @scope is null or LTRIM(RTRIM(@code)) = '' or LTRIM(RTRIM(@scope)) = '' 
BEGIN
  raiserror('Null values not allowed for parameter @code / @scope', 16, 1)
  return
  END

  if @tags is null or LTRIM(RTRIM(@tags)) = ''
  BEGIN
delete from REF_TAG
where ScopeKey = @code and Scope = @scope
return
END
-- Create TEMP table for operation
select Value into #temp from dbo.split2(@tags)

-- Create Tag into table
INSERT INTO TAG (value)
select a.value FROM #temp a
left join TAG b on a.value = b.Value 
where b.Value is null

-- Insert associate Tag
INSERT INTO REF_TAG (TagID,Scope,ScopeKey)
select b.TagID, @scope, @code from #temp a
left join TAG b on a.value = b.Value
left join (select TagID from REF_TAG
where ScopeKey = @code) c on c.TagID = b.TagID
where c.TagID is null

-- Delete de-associate tag
delete from REF_TAG
where ScopeKey = @code and TagID IN 
(
select b.TagID from REF_TAG b
inner join TAG c on b.TagID = c.TagID
left join #temp a on a.value = c.Value
where a.value is null and b.ScopeKey = @code and b.Scope = @scope
)  

-- Drop the TEMP table
drop table #temp

-- TODO: Purge job required
Return
GO
/****** Object:  StoredProcedure [dbo].[PackageAfterAdjustment]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Declare @CDbl(PriceAdjustment.Text) / 100.0 ;

CREATE Procedure [dbo].[PackageAfterAdjustment] 
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@PayTermsAdjustment Numeric(18, 6),
	@Output  nvarchar(1) output ,
	@CalBefore numeric (18,2) =0.00 Output ,
	@CalAfter numeric (18,2) = 0.00 Output ,
	@net numeric (18,2) =0.00 Output ,
	@Result numeric (18,2) =0.00 Output ,
	@Negotiation numeric (18,2),
	@Interest_Subsidy numeric (18,2) ,
	@List_Price_b4_ADJ numeric (18,2) = 0.00 Output ,
	@Payment_Term_Adj numeric (18,2) = 0.00 Output ,
	@List_Price_AF_ADJ numeric (18,2) = 0.00 Output ,
	@After_Round numeric (18,2) = 0.00 Output ,
	@Contract_Price numeric (18,2) = 0.00 Output ,
	@RoundBase int,
	@RoundType Nvarchar(1),
	@WaiveStampDuty NVarChar(1),
	@RoundBeforeSum NVarChar(1)
)
 
As

			Declare @Adjustment Numeric(18, 2);
			Declare @FM_CODE nvarchar (500) 
			Declare @b4Adjustment Numeric(18, 2) ;
			Declare @List_Price  Numeric(18, 2) ;
			Declare	@No_Of_Months NVarChar(3);
			Declare @Quantity NVarChar(10);
			Declare @Gross_Area NVarChar(9);
			Declare @Cal_Gross NVarChar(1)
			Declare @Factor Numeric(18, 2);
			Declare @Adjusted_Price Int;
			Declare @Price_Adjust Numeric(18, 2);
			Declare @Price_Adjust_Unit NVarChar(1);
			Declare @Internal_Cost Numeric(18, 2);
			Declare @Total_Price Numeric(18, 2);
			Declare @Add_To_Contract_Price Char(1) ='';
			Declare @Add_Pkg_B4_Adjust Char(1)	='';
			Declare @Method_Code NVarChar(6);
			Declare @Package_Qty Numeric;
			DECLARE @CURRENT_AM_NO AS NVARCHAR(20);
			DECLARE @CURRENT_PACKAGE_CODE NVARCHAR (20);
			DECLARE @PRE_PACKAGE NUMERIC (18,2) =0.00;
			Declare @PRE_Add_Pkg_B4_Adjust nvarchar(1);
			Declare @PRE_Add_To_Contract_Price nvarchar(1);
			Declare @Package_Qty_Onhand Numeric
			Declare @PackageCounter int =1;
			Declare @i int =1;
			Declare @j int =1;
			Declare @y int =1;
			Declare @z int =1;
			Declare @counter int =0;
			Declare @AfPackCount int ;
			Declare @HaveBefore Nvarchar(1);
			Declare @Package_calc_type Nvarchar(1);
			Declare @Package_ID NVarChar(2);
			Declare @CarTotPriceb4 Numeric (18,2)=0.00;
			Declare @CarTotPriceAf Numeric (18,2)=0.00;
			Declare @RoundBaseInt int =0;
			Declare @WaiveStampDutyAmount Numeric (18,2) = 0.00;
		
		If (@RoundType is not null and @RoundBase is not null)  
			Begin 
			set @RoundBaseInt = @RoundBase
			set @RoundBase =  -1 * LOG10(@RoundBase)
			END
			else
			Begin
			set @RoundBase=0;
			END



			 if ((select COUNT(ADD_CAR_PARK_PRICE_BEFORE_ADJUST) from AM_ITEM AI join CAR_PARK C on AI.FM_CP_CODE = C.CAR_PARK_ID where AI.PROJECT_ID =@Project_ID and C.PROJECT_ID = @Project_ID and AM_NO = @MOA_No) =0)
			 Begin
			 Set @CarTotPriceb4 = 0
			 Set @CarTotPriceAf = 0
			 End
			 else
			 Begin
			 select @CarTotPriceb4 = sum(FM_CP_LIST_PRICE)  from AM_ITEM AI join CAR_PARK C on AI.FM_CP_CODE = C.CAR_PARK_ID where AI.PROJECT_ID =@Project_ID and AM_NO = @MOA_No and ADD_CAR_PARK_PRICE_BEFORE_ADJUST='Y'  and C.PROJECT_ID = @Project_ID
			 select @CarTotPriceb4 = ISNULL(@CarTotPriceb4,0)
			 select @CarTotPriceAf = sum(FM_CP_LIST_PRICE)  from AM_ITEM AI join CAR_PARK C on AI.FM_CP_CODE = C.CAR_PARK_ID where AI.PROJECT_ID =@Project_ID and AM_NO = @MOA_No and ADD_CAR_PARK_PRICE_BEFORE_ADJUST<>'Y'  and C.PROJECT_ID = @Project_ID
			 	 select @CarTotPriceAf = ISNULL(@CarTotPriceAf,0)
			 End

				update AM_PACKAGES
				set PRICE_ADJUST = 0 where PROJECT_ID=@Project_ID and AM_NO=@MOA_No
				
				select @Package_calc_type = PACKAGE_CALC_TYPE from PROJECT_MASTER where PROJECT_ID=@Project_ID	
				select @counter=count(*) from AM_PACKAGES where PROJECT_ID = @Project_ID and AM_NO = @MOA_No	-- Count how many packages user selected

				while (@i<=@counter)
				Begin
					-- Get the Package_ID , Quantity and FM_Code which User selected
				Select @Package_ID = PACKAGE_ID , @Quantity = QTY ,@FM_CODE = FM_CODE
				From 
				(select ROW_NUMBER() over (order by Package_SEQ) 'RowNumber' , AP.PACKAGE_ID ,AP.QTY , AP.FM_CODE
				from  
				AM_PACKAGES AP join Packages P on AP.PACKAGE_ID = P.PACKAGE_ID and AP.PROJECT_ID=P.PROJECT_ID
				Where AP.Project_ID = @Project_ID and AP.AM_NO = @MOA_No 
				) temp	
				Where @i = RowNumber
																
				-- Get Basic information of the Package From Table Packages which User Selected
				Select @Price_Adjust = Price_Adjust, @Price_Adjust_Unit = Unit, @Internal_Cost = Internal_Cost,
					@Add_To_Contract_Price = Add_To_Contract_Price, @Add_Pkg_B4_Adjust = Add_Pkg_B4_Adjust
				From Packages
				Where Project_ID = @Project_ID And Package_ID = @Package_ID				

				If @Cal_Gross = N'Y'
				Begin
					Select @Factor = Convert(Numeric(18, 2), @Gross_Area) * Convert(Numeric(3), @No_Of_Months) * Convert(Int, @Quantity)
				End
				Else
				Begin
					Select @Factor = Convert(Int, @Quantity)		
				End
	
				If @Price_Adjust_Unit = N'P'
				Begin
					-- Get the List Price for Each Flat/Unit
					Select @List_Price = IsNull(Sum(FM_List_Price), 0)
					From Flat_Master
					Where Project_ID = @Project_ID And MOA_No = @MOA_No and @FM_CODE =FM_CODE	
		
					Select @Total_Price = @Price_Adjust * @List_Price / 100.0 * @Factor		-- For Percentage

				End
				Else
				Begin
					Select @Total_Price = @Price_Adjust * @Factor		-- For Integer
				End
			

				Update AM_PACKAGES
				set Price_Adjust = Round(@Total_Price,0) where AM_NO=@MOA_No and PROJECT_ID=@Project_ID and PACKAGE_ID = @Package_ID and @FM_CODE = FM_CODE	-- Store the adjustment into DB for calculate at the end

				set @i=@i+1;
				end


					--Reset Counter
				set @i=1;			
				set @counter=0;			

				if (@Package_calc_type ='A')
							Begin
							Declare @CountFlat int ;
							Declare @k int =1;
							select  @CountFlat = count(distinct FM_CODE) from AM_PACKAGES where PROJECT_ID = @Project_ID and AM_NO = @MOA_NO
							-- K for Count Flat
							while (@k <= @CountFlat)
							Begin
							IF ((SELECT COUNT(*) FROM AM_PACKAGES WHERE PROJECT_ID = @Project_ID AND AM_NO = @MOA_No )<> 1) 
							BEGIN
							-- Loop the FM_Code which User selected
							select @FM_CODE = FM_CODE						
									From
									(SELECT ROW_NUMBER() OVER (Order by FM_CODE asc) 'RowNumber' ,FM_CODE 
									From 
									AM_PACKAGES
									where PROJECT_ID = @Project_ID and AM_NO = @MOA_No group by FM_CODE )Temp
									where RowNumber = @k

									IF OBJECT_ID('tempdb..#TMP2') IS NOT NULL DROP TABLE #TMP2
							-- insert all Basic information of the Package into Table #TMP2 one by one which User Selected
							SELECT ROW_NUMBER() OVER (ORDER BY P.ADD_TO_CONTRACT_PRICE desc, P.ADD_PKG_B4_ADJUST desc, P.PACKAGE_SEQ asc) 'ROWNUMBER', P.PACKAGE_SEQ ,AP.*,Cal_Gross, Package_Qty, Package_Qty_Onhand,
							 Unit
							INTO #TMP2
							FROM AM_PACKAGES AP JOIN PACKAGES P ON AP.PROJECT_ID = P.PROJECT_ID AND P.PACKAGE_ID=AP.PACKAGE_ID 
							WHERE AM_NO = @MOA_No and @FM_CODE= FM_CODE 


							SELECT @COUNTER= COUNT(*) FROM #TMP2
							set @i=1;
							-- I for count involved packages with this flat
							WHILE (@i <= @COUNTER)
							BEGIN

							-- Loop the package in AM_PACKAGE
							Select @CURRENT_PACKAGE_CODE = PACKAGE_ID ,  @Cal_Gross = Cal_Gross ,@CURRENT_AM_NO = AM_NO, @No_Of_Months = NO_OF_MONTHS ,@Quantity = QTY
							From #TMP2 WHERE ROWNUMBER = @i

							If (@Cal_Gross = N'Y')
								Select @Factor = Convert(Numeric(18, 2), @Gross_Area) * Convert(Numeric(3), @No_Of_Months) * 1 -- Convert(Int, @Quantity)
							Else
							Begin
								Select @Factor =  1  --Convert(Int, @Quantity)
							End

							-- Get Basic information of the Package From Table Packages which User Selected
							Select @Price_Adjust = Price_Adjust, @Price_Adjust_Unit = Unit, @Internal_Cost = Internal_Cost,
								@Add_To_Contract_Price = Add_To_Contract_Price, @Add_Pkg_B4_Adjust = Add_Pkg_B4_Adjust
							From Packages
							Where Project_ID = @Project_ID And Package_ID = @CURRENT_PACKAGE_CODE
							
							--	Detect the type : Before, After, Net, Then Reset the @Pre_Package
							if (@PRE_Add_Pkg_B4_Adjust <> @Add_Pkg_B4_Adjust or @PRE_Add_To_Contract_Price <> @Add_To_Contract_Price)
							set @PRE_PACKAGE=0;

							--Reset
							set @Adjustment =0;
							set @j=1;

							-- Calculation
							-- J for the quantity of this package user selected
							while (@j <=Convert(Int, @Quantity))
								Begin
								If @Price_Adjust_Unit = N'P'
									Begin
										Select @List_Price = IsNull(Sum(FM_List_Price), 0)
										From Flat_Master
										Where Project_ID = @Project_ID And MOA_No = @CURRENT_AM_NO and @FM_CODE =FM_CODE
										Select @Total_Price =  @Price_Adjust *( @List_Price +  @PRE_PACKAGE) / 100.0 * @Factor
									End
								Else
									Begin
										Select @Total_Price =  @Price_Adjust * @Factor
									End

							-- Record the previous Total_Price for next CalCulation
							set @PRE_PACKAGE = @PRE_PACKAGE + Round(@Total_Price, 0);
							set @Adjustment = @Adjustment + Round(@Total_Price, 0);
							set @j=@j+1;
								End

							set @Total_Price = Round(@Adjustment, 0);

							-- Update to AM_PACKAGES Table
							UPDATE AM_PACKAGES
							SET Qty = Convert(Int, @Quantity), Price_Adjust= Round(@Total_Price, 0),
							Internal_Cost= Round(@Internal_Cost * @Factor, 0), No_Of_Months = Convert(Numeric(3), @No_Of_Months),
							Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID= @Update_FID, Add_To_Contract_Price = @Add_To_Contract_Price, Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust, FM_CODE = @FM_CODE 
							WHERE AM_NO = @CURRENT_AM_NO AND PROJECT_ID = @Project_ID AND @CURRENT_PACKAGE_CODE = PACKAGE_ID and FM_CODE =@FM_CODE
	
							-- Record the status of the previous Packages 
							set	 @PRE_Add_To_Contract_Price = @Add_To_Contract_Price;
							set  @PRE_Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust;
							SET @i=@i+1;
										END
									END
						 IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE  TABLE_NAME = '#TMP2'))
BEGIN
 	drop table #TMP2
END
							-- Reset
							set @PRE_PACKAGE=0.00
							Set @k=@k+1;
								End
							End

				--Reset Counter
				Set @COUNTER = 0 ;	
				Set @i = 1 ;	
				Set @j = 1;		
				Set @y = 1;		
				Set @z = 1;			
				Set @PRE_PACKAGE  = 0.00;	

			-----------------------------------------------            After Package		-----------------------------------------------------		
				if ( @Package_calc_type ='A')
				Begin
				select ROW_NUMBER() over( order by FM_Code)'RowNumber' ,FM_CODE, sum(PRICE_ADJUST) 'PRICE_ADJUST'  
				into #Tmpb4  
				from AM_PACKAGES  
				where PROJECT_ID = @Project_ID and  AM_NO=@MOA_No and ADD_PKG_B4_ADJUST ='Y' and ADD_TO_CONTRACT_PRICE ='Y'  
				group by FM_CODE  

				select  @AfPackCount = count(distinct fm_code) from am_packages AP  WHERE PROJECT_ID = @Project_ID and  AM_NO = @MOA_No and AP.ADD_TO_CONTRACT_PRICE ='Y' and AP.ADD_PKG_B4_ADJUST <>'Y'
				select @counter = count(*) from #Tmpb4

				set @i=1;

			while (@i<=@AfPackCount)
			Begin
					select @FM_CODE = FM_CODE 
					from 
					(select ROW_NUMBER() over (order by FM_Code) 'Rownumber' , FM_CODE  from am_packages AP  WHERE PROJECT_ID = @Project_ID and  AM_NO = @MOA_No and AP.ADD_TO_CONTRACT_PRICE ='Y' and AP.ADD_PKG_B4_ADJUST <>'Y' group by FM_CODE) Tmp 
					where tmp.Rownumber =@i
	
					set @HaveBefore='N'
					set @j=1;
					while (@j<=@counter)
					Begin
						set @List_Price = 0;
							if ((select count(*) from #Tmpb4 where FM_CODE = @FM_CODE) >0)
										begin
										set @HaveBefore='Y'

										SELECT ROW_NUMBER() OVER (ORDER BY AP.FM_Code, P.PACKAGE_SEQ asc) 'ROWNUMBER', P.PACKAGE_SEQ ,AP.*,
										Cal_Gross, Package_Qty, Package_Qty_Onhand,Unit
										INTO #TMP
										FROM AM_PACKAGES AP JOIN PACKAGES P ON AP.PROJECT_ID = P.PROJECT_ID AND P.PACKAGE_ID=AP.PACKAGE_ID 
										WHERE AM_NO = @MOA_No and AP.ADD_TO_CONTRACT_PRICE ='Y' and AP.ADD_PKG_B4_ADJUST <>'Y' and @FM_CODE =FM_CODE

										select @List_Price = FM.FM_LIST_PRICE , @b4Adjustment =  T.PRICE_ADJUST  
										from FLAT_MASTER FM join #Tmpb4 T on FM.FM_CODE = T.FM_CODE 
										where PROJECT_ID = @Project_ID and  T.FM_CODE = @FM_CODE

										set @List_Price = (@List_Price + @b4Adjustment)+(@List_Price + @b4Adjustment) * @PayTermsAdjustment

										select @PackageCounter = count (*) 
										from #TMP 
										where FM_CODE= @FM_CODE
									
										set @z=1;
										set @PRE_PACKAGE=0;
										set @Adjustment =0;
																		
											

											WHILE (@z <= @PackageCounter)
													BEGIN

													Select @CURRENT_PACKAGE_CODE = PACKAGE_ID ,  @Cal_Gross = Cal_Gross ,
													@CURRENT_AM_NO = AM_NO, @No_Of_Months = NO_OF_MONTHS ,@Quantity = QTY
													From #TMP WHERE ROWNUMBER = @z

													If @Cal_Gross = N'Y'
													Begin
														Select @Factor = Convert(Numeric(18, 2), @Gross_Area) * Convert(Numeric(3), @No_Of_Months) * 1 -- Convert(Int, @Quantity)
													End
													Else
													Begin
														Select @Factor =  1  --Convert(Int, @Quantity)
													End
													Select @Price_Adjust = Price_Adjust, @Price_Adjust_Unit = Unit, @Internal_Cost = Internal_Cost,
														@Add_To_Contract_Price = Add_To_Contract_Price, @Add_Pkg_B4_Adjust = Add_Pkg_B4_Adjust
													From Packages
													Where Project_ID = @Project_ID And Package_ID = @CURRENT_PACKAGE_CODE
	
													if (@PRE_Add_Pkg_B4_Adjust <> @Add_Pkg_B4_Adjust or @PRE_Add_To_Contract_Price <> @Add_To_Contract_Price)
													Begin 
													set @PRE_PACKAGE=0;
													End

													set @Adjustment =0;
										
									
													set @y=1;

													while (@y <=Convert(Int, @Quantity))
													Begin
													If @Price_Adjust_Unit = N'P'
													Begin
														Select @Total_Price =  @Price_Adjust *( @List_Price +  @PRE_PACKAGE) / 100.0 * @Factor
													End
													Else
													Begin
														Select @Total_Price =  @Price_Adjust * @Factor
													End

													set @PRE_PACKAGE = @PRE_PACKAGE + Round(@Total_Price, 0);									
													set @Adjustment = @Adjustment + Round(@Total_Price, 0);
													set @y=@y+1;

													End

													set @Total_Price = Round(@Adjustment, 0);
													UPDATE AM_PACKAGES
													SET Qty = Convert(Int, @Quantity), Price_Adjust= Round(@Total_Price, 0),
													Internal_Cost= Round(@Internal_Cost * @Factor, 0), No_Of_Months = Convert(Numeric(3), @No_Of_Months),
													Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID= @Update_FID, 
													Add_To_Contract_Price = @Add_To_Contract_Price, Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust
													WHERE AM_NO = @CURRENT_AM_NO AND PROJECT_ID = @Project_ID AND @CURRENT_PACKAGE_CODE = PACKAGE_ID and FM_CODE =@FM_CODE

													set @PRE_Add_To_Contract_Price = @Add_To_Contract_Price;
													set  @PRE_Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust;
													SET @z=@z+1;
																				
													END
													drop table #Tmp
													break

								END
								Else
								Begin
								set @j=@j+1;
								End
					End

					If (@HaveBefore <>'Y')
					Begin
						SELECT ROW_NUMBER() OVER (ORDER BY AP.FM_Code, P.PACKAGE_SEQ asc) 'ROWNUMBER', 
						P.PACKAGE_SEQ ,AP.*,Cal_Gross, Package_Qty, Package_Qty_Onhand,Unit
						INTO #TMP1
						FROM AM_PACKAGES AP JOIN PACKAGES P ON AP.PROJECT_ID = P.PROJECT_ID AND P.PACKAGE_ID=AP.PACKAGE_ID 
						WHERE AM_NO = @MOA_No  and ap.PROJECT_ID=@Project_ID and AP.ADD_TO_CONTRACT_PRICE ='Y' and AP.ADD_PKG_B4_ADJUST <>'Y' and @FM_CODE =FM_CODE
														
						select @List_Price = FM_LIST_PRICE 
						from FLAT_MASTER
						where PROJECT_ID = @Project_ID and @FM_CODE= FM_CODE
						
						select @PackageCounter = count (*) 
						from 
						#TMP1

						set @List_Price = @List_Price+@List_Price * @PayTermsAdjustment
						set @z=1;
						set @PRE_PACKAGE=0;
						set @Adjustment =0;												
						WHILE (@z <= @PackageCounter)
							BEGIN

							Select @CURRENT_PACKAGE_CODE = PACKAGE_ID ,  @Cal_Gross = Cal_Gross ,
							@CURRENT_AM_NO = AM_NO, @No_Of_Months = NO_OF_MONTHS ,@Quantity = QTY
							From #TMP1 
							WHERE ROWNUMBER = @z

							If @Cal_Gross = N'Y'
							set @Factor = Convert(Numeric(18, 2), @Gross_Area) * Convert(Numeric(3), @No_Of_Months) * 1 -- Convert(Int, @Quantity)
							Else
							set @Factor =  1  --Convert(Int, @Quantity)


							Select @Price_Adjust = Price_Adjust, @Price_Adjust_Unit = Unit, @Internal_Cost = Internal_Cost,
							@Add_To_Contract_Price = Add_To_Contract_Price, @Add_Pkg_B4_Adjust = Add_Pkg_B4_Adjust
							From Packages
							Where Project_ID = @Project_ID And Package_ID = @CURRENT_PACKAGE_CODE
	
							if (@PRE_Add_Pkg_B4_Adjust <> @Add_Pkg_B4_Adjust or @PRE_Add_To_Contract_Price <> @Add_To_Contract_Price)
							Begin 
							set @PRE_PACKAGE=0;
							End

							set @Adjustment =0;
							set @y=1;
						
						
							while (@y <=Convert(Int, @Quantity))
							Begin
							If @Price_Adjust_Unit = N'P'
							Begin
							
								set @Total_Price =  @Price_Adjust * ( @List_Price +  @PRE_PACKAGE ) / 100.0 * @Factor
							End
							Else
							Begin
								set @Total_Price =  @Price_Adjust * @Factor
							End
							

							set @PRE_PACKAGE = @PRE_PACKAGE + Round(@Total_Price, 0);
						
							set @Adjustment = @Adjustment + Round(@Total_Price, 0);
							set @y=@y+1;
							End

							set @Total_Price = Round(@Adjustment, 0);
							UPDATE AM_PACKAGES
							SET Qty = Convert(Int, @Quantity), Price_Adjust= Round(@Total_Price, 0),
							Internal_Cost= Round(@Internal_Cost * @Factor, 0), No_Of_Months = Convert(Numeric(3), @No_Of_Months),
							Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID= @Update_FID,
							Add_To_Contract_Price = @Add_To_Contract_Price, Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust
							WHERE AM_NO = @CURRENT_AM_NO AND PROJECT_ID = @Project_ID AND @CURRENT_PACKAGE_CODE = PACKAGE_ID and FM_CODE =@FM_CODE
	
							Select @Method_Code = Method_Code
							From AM_BASE
							Where Project_ID = @Project_ID And AM_No = @CURRENT_AM_NO
	
							If @Method_Code Is Not Null
							Begin
								--  BEGIN #20070313
								Update AM_BASE
								Set AM_PRICE = null, 
								AM_TOT_PRICE = null, Up_Dt = GetDate(), 
								Up_UID = @Update_UID, Up_FID = @Update_FID
								Where Project_ID = @Project_ID And AM_NO = @MOA_No
							EnD

							SET @PRE_Add_To_Contract_Price = @Add_To_Contract_Price;
							SET @PRE_Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust;
							SET @z=@z+1;
							END
							drop table #TMP1
					END
				set @i=@i+1
				ENd
				drop table #Tmpb4
				set @Output = 'Y' 
				End
				Else
				Begin
				set @Output = 'L' 
			End
			
			
			select @CalBefore=sum(PRICE_ADJUST) from AM_PACKAGES where PROJECT_ID=@Project_ID and AM_NO = @MOA_No and ADD_PKG_B4_ADJUST ='Y' and ADD_TO_CONTRACT_PRICE ='Y'
			select @CalAfter=sum(PRICE_ADJUST) from AM_PACKAGES where PROJECT_ID=@Project_ID and AM_NO = @MOA_No and (add_pkg_b4_adjust is null or add_pkg_b4_adjust <> 'Y') and ADD_TO_CONTRACT_PRICE ='Y'
			

			
			select @net=sum(PRICE_ADJUST) from AM_PACKAGES where PROJECT_ID=@Project_ID and AM_NO = @MOA_No and ADD_TO_CONTRACT_PRICE <>'Y'
			select @Result = sum(FM_LIST_PRICE) from AM_ITEM  AI join Flat_Master FM on FM.FM_CODE = AI.FM_CP_CODE where FM.PROJECT_ID = @Project_ID AND AI.PROJECT_ID=@Project_ID and AM_NO = @MOA_No and FM_CP ='F'					-- Get the List Price (Flat Only)
			
			
			select @CalBefore = Isnull(@CalBefore,0)
			select @CalAfter = Isnull(@CalAfter,0)
			select @net= ISNULL(@net,0)
			select @Result= ISNULL(@Result,0)

			select @List_Price_b4_ADJ =  @Result + @CalBefore + @CarTotPriceb4

			select @Payment_Term_Adj = @List_Price_b4_ADJ * @PayTermsAdjustment
			select @List_Price_AF_ADJ = @List_Price_b4_ADJ +@Payment_Term_Adj

			if (@RoundBeforeSum ='Y')
			Begin
			Declare @CarParkb4price numeric (18,6) =0.00;
			Declare @CarParkafprice numeric (18,6) =0.00;
			Declare @flatprice numeric (18,6) =0.00;
			--Round Up Formula
			--Round ((@Var)/@RoundBaseInt,0) * @RoundBaseInt +  Ceiling (Convert(numeric (22,10),((@Var)%@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt	
			--Round Down Formula
			--Round((@Var)/@RoundBaseInt,0) * @RoundBaseInt +Floor (Convert(numeric (22,10),((@Var)%@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt					
			if (@RoundType = 'U')	
						Begin
						select @flatprice =  ISNULL(sum(PRICE_ADJUST),0) from (
						select 
						Floor (((((select FM_LIST_PRICE from FLAT_MASTER where PROJECT_ID = @Project_ID AND  FM_CODE= AI.FM_CP_CODE)+ ISNULL(sum (AP.PRICE_ADJUST),0) ) *(1+ isnull(@PayTermsAdjustment,0))  
						+ 
						(select isnull(sum(PRICE_ADJUST),0) from AM_ITEM AI1 left join AM_Packages AP1  on AP1.AM_NO = AI1.AM_NO and   AP1.FM_CODE = AI1.FM_CP_CODE and ADD_PKG_B4_ADJUST ='N' and ADD_TO_CONTRACT_PRICE ='Y' where AI1.am_no=@MOA_No and AI1.PROJECT_ID=@Project_ID  and FM_CP='F' and AI1.FM_CP_CODE = AI.FM_CP_CODE 
						)))/@RoundBaseInt) * @RoundBaseInt +  
						Ceiling (Convert(numeric (22,10),(((((select FM_LIST_PRICE from FLAT_MASTER where PROJECT_ID = @Project_ID AND  FM_CODE= AI.FM_CP_CODE)+ ISNULL(sum (AP.PRICE_ADJUST),0) ) *(1+ isnull(@PayTermsAdjustment,0))  
						+ 
						(select isnull(sum(PRICE_ADJUST),0) from AM_ITEM AI1 left join AM_Packages AP1  on AP1.AM_NO = AI1.AM_NO and   AP1.FM_CODE = AI1.FM_CP_CODE and ADD_PKG_B4_ADJUST ='N' and ADD_TO_CONTRACT_PRICE ='Y' where AI1.am_no=@MOA_No and AI1.PROJECT_ID=@Project_ID  and FM_CP='F' and AI1.FM_CP_CODE = AI.FM_CP_CODE 
						)))%@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt	
			
						'PRICE_ADJUST'  -- Round type apply here
						from 
						 AM_ITEM AI left join AM_Packages AP  on  AP.AM_NO = AI.AM_NO AND AP.FM_CODE = AI.FM_CP_CODE and ADD_PKG_B4_ADJUST ='Y' and ADD_TO_CONTRACT_PRICE ='Y' 
						where AI.am_no=@MOA_No and AI.PROJECT_ID=@Project_ID  and FM_CP='F' group by AI.FM_CP_CODE ) tmp
																		
						select @CarParkb4price= ISNUll(sum(PRICE_ADJUST),0) from (
						select Floor ((sum(PARK_LIST_PRICE) * (1+@PayTermsAdjustment)) /@RoundBaseInt) * @RoundBaseInt +  Ceiling (Convert(numeric (22,10),((sum(PARK_LIST_PRICE) * (1+@PayTermsAdjustment)) %@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt 'PRICE_ADJUST'  -- Round type apply here
						from  AM_ITEM AI join CAR_PARK C on AI.FM_CP_CODE = C.CAR_PARK_ID where AI.PROJECT_ID =@Project_ID and AI.AM_NO=@MOA_No and C.ADD_CAR_PARK_PRICE_BEFORE_ADJUST ='Y' and C.PROJECT_ID = @Project_ID group by AI.FM_CP_CODE )tmpcb4
						select @CarParkafprice = ISNUll(sum(PRICE_ADJUST),0) from (
						select  Floor ((sum(PARK_LIST_PRICE))/@RoundBaseInt) * @RoundBaseInt +  Ceiling (Convert(numeric (22,10),( (sum(PARK_LIST_PRICE))%@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt 'PRICE_ADJUST' -- Round type apply here
						from  AM_ITEM AI join CAR_PARK C on AI.FM_CP_CODE = C.CAR_PARK_ID where AI.PROJECT_ID =@Project_ID and AI.AM_NO=@MOA_No and C.ADD_CAR_PARK_PRICE_BEFORE_ADJUST ='N' and C.PROJECT_ID = @Project_ID group by AI.FM_CP_CODE)tmpcaf
						
						set @After_Round = @CarParkb4price+@CarParkafprice+@flatprice
						
						END
			Else if (@RoundType = 'D')
						Begin
						select @flatprice=  ISNULL(sum(PRICE_ADJUST),0) from (
						select 
						Floor (((((select FM_LIST_PRICE from FLAT_MASTER where PROJECT_ID = @Project_ID AND  FM_CODE= AI.FM_CP_CODE)+ ISNULL(sum (AP.PRICE_ADJUST),0) ) *(1+ isnull(@PayTermsAdjustment,0))  
						+ 
						(select isnull(sum(PRICE_ADJUST),0) from AM_ITEM AI1 left join AM_Packages AP1  on AP1.AM_NO = AI1.AM_NO and   AP1.FM_CODE = AI1.FM_CP_CODE and ADD_PKG_B4_ADJUST ='N' and ADD_TO_CONTRACT_PRICE ='Y' where AI1.am_no=@MOA_No and AI1.PROJECT_ID=@Project_ID  and FM_CP='F' and AI1.FM_CP_CODE = AI.FM_CP_CODE 
						)))/@RoundBaseInt) * @RoundBaseInt +  
						Floor (Convert(numeric (22,10),(((((select FM_LIST_PRICE from FLAT_MASTER where PROJECT_ID = @Project_ID AND  FM_CODE= AI.FM_CP_CODE)+ ISNULL(sum (AP.PRICE_ADJUST),0) ) *(1+ isnull(@PayTermsAdjustment,0))  
						+ 
						(select isnull(sum(PRICE_ADJUST),0) from AM_ITEM AI1 left join AM_Packages AP1  on AP1.AM_NO = AI1.AM_NO and   AP1.FM_CODE = AI1.FM_CP_CODE and ADD_PKG_B4_ADJUST ='N' and ADD_TO_CONTRACT_PRICE ='Y' where AI1.am_no=@MOA_No and AI1.PROJECT_ID=@Project_ID  and FM_CP='F' and AI1.FM_CP_CODE = AI.FM_CP_CODE 
						)))%@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt	
						'PRICE_ADJUST'  -- Round type apply here
						from 
						 AM_ITEM AI left join AM_Packages AP  on   AP.AM_NO = AI.AM_NO AND  AP.FM_CODE = AI.FM_CP_CODE and ADD_PKG_B4_ADJUST ='Y' and ADD_TO_CONTRACT_PRICE ='Y' 
						where AI.am_no=@MOA_No and AI.PROJECT_ID=@Project_ID  and FM_CP='F' group by AI.FM_CP_CODE ) tmp

						select @CarParkb4price=ISNUll(sum(PRICE_ADJUST),0) from (
						select Floor ((sum(PARK_LIST_PRICE) * (1+@PayTermsAdjustment)) /@RoundBaseInt) * @RoundBaseInt +  Floor (Convert(numeric (22,10),((sum(PARK_LIST_PRICE) * (1+@PayTermsAdjustment)) %@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt	'PRICE_ADJUST'  -- Round type apply here
						from  AM_ITEM AI join CAR_PARK C on AI.FM_CP_CODE = C.CAR_PARK_ID where AI.PROJECT_ID =@Project_ID and AI.AM_NO=@MOA_No and C.ADD_CAR_PARK_PRICE_BEFORE_ADJUST ='Y' and C.PROJECT_ID = @Project_ID group by AI.FM_CP_CODE )tmpcb4
						select @CarParkafprice=ISNUll(sum(PRICE_ADJUST),0) from (
						select Floor ( (sum(PARK_LIST_PRICE))/@RoundBaseInt) * @RoundBaseInt +  Floor (Convert(numeric (22,10),( (sum(PARK_LIST_PRICE))%@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt 'PRICE_ADJUST'  -- Round type apply here
						from  AM_ITEM AI join CAR_PARK C on AI.FM_CP_CODE = C.CAR_PARK_ID where AI.PROJECT_ID =@Project_ID and AI.AM_NO=@MOA_No and C.ADD_CAR_PARK_PRICE_BEFORE_ADJUST ='N' and C.PROJECT_ID = @Project_ID group by AI.FM_CP_CODE)tmpcaf
						set @After_Round = @CarParkb4price+@CarParkafprice+@flatprice
						End
			Else if (@RoundType = 'N')
						Begin
						
						select  @flatprice= ISNULL(sum(PRICE_ADJUST),0)from (
						select 
						Round(((select FM_LIST_PRICE from FLAT_MASTER where PROJECT_ID = @Project_ID AND  FM_CODE= AI.FM_CP_CODE)+ ISNULL(sum (AP.PRICE_ADJUST),0) ) *(1+ isnull(@PayTermsAdjustment,0))  
						+ 
						(select isnull(sum(PRICE_ADJUST),0) from AM_ITEM AI1 left join AM_Packages AP1  on AP1.AM_NO = AI1.AM_NO and   AP1.FM_CODE = AI1.FM_CP_CODE and ADD_PKG_B4_ADJUST ='N' and ADD_TO_CONTRACT_PRICE ='Y' where AI1.am_no=@MOA_No and AI1.PROJECT_ID=@Project_ID  and FM_CP='F' and AI1.FM_CP_CODE = AI.FM_CP_CODE 
						),@RoundBase)
						'PRICE_ADJUST'  -- Round type apply here
						from 
							AM_ITEM AI left join AM_Packages AP  on   AP.AM_NO = AI.AM_NO AND  AP.FM_CODE = AI.FM_CP_CODE and ADD_PKG_B4_ADJUST ='Y' and ADD_TO_CONTRACT_PRICE ='Y' 
						where AI.am_no=@MOA_No and AI.PROJECT_ID=@Project_ID  and FM_CP='F' group by AI.FM_CP_CODE ) tmp

						select @CarParkb4price=ISNUll(sum(PRICE_ADJUST),0) from (
						select Round((sum(PARK_LIST_PRICE) * (1+@PayTermsAdjustment)),@RoundBase) 'PRICE_ADJUST'  -- Round type apply here
						from  AM_ITEM AI join CAR_PARK C on AI.FM_CP_CODE = C.CAR_PARK_ID where AI.PROJECT_ID =@Project_ID and AI.AM_NO=@MOA_No and C.ADD_CAR_PARK_PRICE_BEFORE_ADJUST ='Y' and C.PROJECT_ID = @Project_ID group by AI.FM_CP_CODE )tmpcb4
						select @CarParkafprice=ISNUll(sum(PRICE_ADJUST),0) from (
						select  Round((sum(PARK_LIST_PRICE)),@RoundBase)	'PRICE_ADJUST'  -- Round type apply here
						from  AM_ITEM AI join CAR_PARK C on AI.FM_CP_CODE = C.CAR_PARK_ID where AI.PROJECT_ID =@Project_ID and AI.AM_NO=@MOA_No and C.ADD_CAR_PARK_PRICE_BEFORE_ADJUST ='N' and C.PROJECT_ID = @Project_ID group by AI.FM_CP_CODE)tmpcaf
						set @After_Round = @CarParkb4price+@CarParkafprice+@flatprice

						End

					
			Else
			Begin
			set @After_Round = @List_Price_AF_ADJ + @CarTotPriceAf + @CalAfter
			End
						End
			Else
					Begin
					if (@RoundType = 'U')	
					set @After_Round =Round ((@List_Price_AF_ADJ + @CarTotPriceAf + @CalAfter)/@RoundBaseInt,0) * @RoundBaseInt +  Ceiling (Convert(numeric (22,10),((@List_Price_AF_ADJ+ @CarTotPriceAf + @CalAfter)%@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt	
					else if (@RoundType = 'D')
					set @After_Round = Round((@List_Price_AF_ADJ+ @CarTotPriceAf + @CalAfter)/@RoundBaseInt,0) * @RoundBaseInt +Floor (Convert(numeric (22,10),((@List_Price_AF_ADJ + @CarTotPriceAf + @CalAfter)%@RoundBaseInt))/@RoundBaseInt)*@RoundBaseInt	
					else if (@RoundType = 'N')
					set @After_Round = Round (@List_Price_AF_ADJ + @CarTotPriceAf + @CalAfter,@RoundBase)
					else
					set @After_Round = @List_Price_AF_ADJ + @CarTotPriceAf + @CalAfter
			
			End



			select @Contract_Price =  @After_Round + @Negotiation
			if (@WaiveStampDuty is not null)
			Begin
			if (@WaiveStampDuty ='Y') 
			Select @WaiveStampDutyAmount = isnull(dbo.SF_CalculateStampDutyAmount(@Contract_Price,@Project_ID),0)
			else
			set @WaiveStampDutyAmount =0
			end
			else
			set @WaiveStampDutyAmount =0


			select @Result =@Contract_Price+@net + @Interest_Subsidy - @WaiveStampDutyAmount


		

			select @CarTotPriceb4= ISNULL(Round (@CarTotPriceb4,0),0)
			select @CalBefore= ISNULL(Round(@CalBefore,0),0)
			select @List_Price_b4_ADJ= ISNULL(Round(@List_Price_b4_ADJ,0) ,0)
			select @Payment_Term_Adj= ISNULL(Round(@Payment_Term_Adj,0),0)
			select @List_Price_AF_ADJ= ISNULL(Round (@List_Price_AF_ADJ,0),0)
			select @CalAfter= ISNULL(Round (@CalAfter,0),0)
			select @CarTotPriceAf= ISNULL(Round (@CarTotPriceAf,0),0)
			select @After_Round= ISNULL(Round (@After_Round,0),0)
			select @Negotiation= ISNULL(Round(@Negotiation,0),0)
			select @Contract_Price= ISNULL(Round (@Contract_Price,0),0)
			select @Interest_Subsidy= ISNULL(Round(@Interest_Subsidy ,0),0)
			select @net= ISNULL(Round(@net,0),0)
			select @Result= ISNULL(Round(@Result,0),0)
		






			  

			  


GO
/****** Object:  StoredProcedure [dbo].[PASB_Signed]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[PASB_Signed]
(
	@AM_No NVarChar(20),
	@Project_ID NVarChar(6),
	@PASP_SIGNED NVarChar(1),
	@PASP_Date NVarChar(10),
	@HAS_VENDOR_RS NVarChar(1),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As


		Update AM_BASE
		SET
			PASP_SIGNED = (CASE WHEN @PASP_SIGNED = N'Y' THEN N'Y' ELSE NULL End),
			HAS_VENDOR_RS = (CASE WHEN @HAS_VENDOR_RS = N'Y' THEN N'Y' ELSE NULL End),
			PASP_Date = Convert(DateTime, @PASP_Date, 105),
			Up_Dt = GetDate(), 
			Up_UID = @Update_UID, 
			Up_FID = @Update_FID
		Where 
			Project_ID = @Project_ID And AM_No = @AM_No
	
	
Return
GO
/****** Object:  StoredProcedure [dbo].[PF01_Receipt]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PF01_Receipt]
(	
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Paid_Seq NVarChar(2000),
	@User_ID NVarChar(10),
	@Sales_Office_Code NVarChar(6),
	@UP_FID NVarChar(10),
	@Receipt_No Numeric(8,0) Output,
	@PayDate Datetime
)
 
As
	--Declare @Receipt_No Numeric(8, 0)
	Declare @Receipt_Type NVarChar(1)
	Declare @Buyer_Surname NVarChar(50)
	-- BEGIN #20110831
	Declare @Buyer_Given_Name NVarChar(100)
	-- END #20110831
	Declare @Moa_Co_Name NVarChar(50)
	Declare @Joint_Buyer NVarChar(400)
	Declare @Surname NVarChar(50)
	-- BEGIN #20110831
	Declare @Given_Name NVarChar(100)
	-- END #20110831
	Declare @Transfer_Seq Numeric(3,0)
	Declare @TRANSACT_AMT Numeric(18,2)
	Declare @TOTAL_TRANSACT_AMT Numeric(18,2)
	Declare @Return_Str NVARCHAR(20)
	Declare @Remain_Str NVARCHAR(100)
	
	Declare @Formal_seq int
	
	Select @Remain_Str = @Paid_Seq
	Select @TOTAL_TRANSACT_AMT = 0
	
	Select @Formal_seq = 0

	if LEN(@Paid_Seq) > 0
	Begin
		
		While CHARINDEX(',',@Remain_Str) > 0
		Begin
			Select @TRANSACT_AMT = 0
			Select @Return_Str = SUBSTRING(@Remain_Str,0,charindex(',',@Remain_Str))
			Select @Remain_Str = SUBSTRING(@Remain_Str,charindex(',',@Remain_Str) + 1, LEN(@Remain_Str) - charindex(',',@Remain_Str) + 1)
			
			Select @TRANSACT_AMT = SUM(PAID_AMT)
			From AM_PAYMENT_FU_TRANS
			Where AM_NO = @MOA_NO And PROJECT_ID = @Project_ID And PAID_SEQ = @Return_Str	
			
			Select @TOTAL_TRANSACT_AMT = @TOTAL_TRANSACT_AMT + @TRANSACT_AMT	
		End

		Select @TRANSACT_AMT = 0

		Select @TRANSACT_AMT = SUM(PAID_AMT)
		From AM_PAYMENT_FU_TRANS
		Where AM_NO = @MOA_NO And PROJECT_ID = @Project_ID And PAID_SEQ = @Remain_Str	
	
		Select @TOTAL_TRANSACT_AMT = @TOTAL_TRANSACT_AMT + @TRANSACT_AMT	
	End
	
	
	
	Select @Receipt_No = IsNull(Max(Receipt_NO), 0) + 1
	From Receipt
	Where Project_ID = @Project_ID


	SELECT
		@Buyer_Surname = P1.CHI_NAME,
		@Buyer_Given_Name = P1.ENG_NAME,
		@Moa_Co_Name = C.CHI_NAME
	FROM
		AM_BASE AB
		LEFT JOIN AM_BUYER P1 ON AB.PROJECT_ID = P1.PROJECT_ID AND AB.AM_NO = P1.AM_NO AND P1.BUYER_TYPE = 'P' AND P1.BUYER_SEQ = 1
		LEFT JOIN AM_BUYER C ON AB.PROJECT_ID = C.PROJECT_ID AND AB.AM_NO = C.AM_NO AND C.BUYER_TYPE = 'C' AND C.BUYER_SEQ = 1
	Where AB.AM_NO = @MOA_NO And AB.PROJECT_ID = @Project_ID

	Select @Joint_Buyer = N''
	
	Declare JB_Cursor Cursor For
	Select CHI_NAME, ENG_NAME
	From AM_BUYER
	Where AM_NO = @MOA_NO And PROJECT_ID = @Project_ID And Buyer_TYPE = 'P' and BUYER_SEQ > 1
	Order by BUYER_SEQ
	
	--END #20100816
	--END #20070228

	Open JB_Cursor 

	Fetch Next From JB_Cursor 
	Into @Surname, @Given_name

	While @@Fetch_Status = 0
	Begin
		If @Joint_Buyer <> N''
		Begin
			Select @Joint_Buyer = @Joint_Buyer + N', '
		End

		Select @Joint_Buyer = @Joint_Buyer +  ISNULL(@Surname,'') + ' ' + ISNULL(@Given_name,'')

		Fetch Next From JB_Cursor 
		Into @Surname, @Given_name
	End

	Close JB_Cursor 
	Deallocate JB_Cursor 

	--BEGIN #20070208_2
	Insert Into Receipt
		(Project_ID, MOA_No, Receipt_NO, Receipt_Type, Receipt_Data, Sales_Office_Code, UID, 
		Cr_Dt, Buyer_Surname, Buyer_Given_Name, Moa_Co_Name, 
		Joint_Buyer, Status, Up_Uid, Up_Fid, Up_Dt, Cr_FID, TRANSACT_AMT, TRANSACT_DATE)
	Values
		(@Project_ID, @MOA_No, @Receipt_No, N'P', @Paid_Seq, @Sales_Office_Code, @User_ID, 
		Convert(DateTime, GetDate(), 103), @Buyer_Surname, @Buyer_Given_Name, @Moa_Co_Name, 
		@Joint_Buyer, 'I', @User_ID, @Up_Fid, getDate(), @UP_FID, @TOTAL_TRANSACT_AMT, @PayDate)
	--END #20070208_2

	--Exec GenReceipt @Project_ID, @Receipt_No, @Receipt_Type Output
Return
GO


/****** Object:  StoredProcedure [dbo].[PRO_SetPrictListTempPath]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_SetPrictListTempPath]
	@projectid [nvarchar](10),
	@priceListno [int],
	@part [varchar](1),
	@filename [nvarchar](200),
	@file [varbinary](max),
	@actionby [nvarchar](20),
	@functionid [varchar](20)
WITH  EXECUTE AS CALLER
AS
BEGIN

	declare @part1 varbinary(max)=null
	declare @part3 varbinary(max)=null

	declare @part1name nvarchar(200)=null
	declare @part3name nvarchar(200)=null

	if @part='1'
	begin
		set @part1=@file
		set @part1name=@filename
	end
	else
	begin
		set @part3=@file
		set @part3name=@filename
	end

	if exists ( select 1 from PRICE_LIST_TEMPPATH where PROJECT_ID=@projectid and PRICE_LIST_NO =@priceListno)
	begin
		UPDATE PRICE_LIST_TEMPPATH Set 
		PART1_DEFAULT_TEMPLATE=isnull(@part1,PART1_DEFAULT_TEMPLATE)
		,PART3_DEFAULT_TEMPLATE=isnull(@part3,PART3_DEFAULT_TEMPLATE)
		,Part1_FileName=isnull(@part1name,Part1_FileName)
		,Part3_FileName=isnull(@part3name,Part3_FileName)
		,UP_UID=@actionby
		,UP_FID=@functionid
		,UP_DT=getdate()
		WHERE 	PROJECT_ID=@projectid and PRICE_LIST_NO =@priceListno
	end
	else
	begin
		INSERT INTO PRICE_LIST_TEMPPATH
		(
			[PROJECT_ID]
           ,[PRICE_LIST_NO]
           ,[PART1_DEFAULT_TEMPLATE]
           ,[PART3_DEFAULT_TEMPLATE]
           ,[CR_UID]
           ,[CR_FID]
           ,[CR_DT]
		   ,[Part1_FileName]
		   ,[Part3_FileName]
		   )
		 VALUES (
		 @projectid
		,@priceListno
		,@part1
		,@part3
		,@actionby
		,@functionid
		,getdate()
		,@part1name
		,@part3name
		)
	end
END

GO
/****** Object:  StoredProcedure [dbo].[PRO_UpdateConsumptionScreenStatus_FAKE]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_UpdateConsumptionScreenStatus_FAKE]
	@projectid [nvarchar](10),
	@unitid [nvarchar](200),
	@itemtype [varchar](2),
	@status [varchar](2),
	@actionby [nvarchar](20),
	@functionid [varchar](20)
WITH  EXECUTE AS CALLER
AS
BEGIN

	if exists(select 1 from T_CONSUMPTIONSCREENSTATUS_FAKE where UNIT_ID=@unitid and PROJECT_ID=@projectid and ITEMTYPE=@itemtype)
	begin 
		 UPDATE T_CONSUMPTIONSCREENSTATUS_FAKE Set 
		 UNITSTATUS=@status
		,UP_UID=@actionby
		,UP_FID=@functionid
		,UP_DT=getdate()
		WHERE 	UNIT_ID=@unitid and PROJECT_ID=@projectid and ITEMTYPE=@itemtype
	end
	else
	begin
			INSERT INTO [dbo].[T_CONSUMPTIONSCREENSTATUS_FAKE]
			   ([UNIT_ID]
			   ,[PROJECT_ID]
			   ,[ITEMTYPE]
			   ,[UNITSTATUS]
			   ,[CR_UID]
			   ,[CR_FID]
			   ,[CR_DT]
			   )
			VALUES
			(
			@unitid
			,@projectid
			,@itemtype
			,@status
			,@actionby
			,@functionid
			,getdate()
			)
	end
	



	
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_UpdatePriceListMasterTemppath]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_UpdatePriceListMasterTemppath]
	@projectid [nvarchar](10),
	@priceListid [varchar](5),
	@part [varchar](1),
	@filename [nvarchar](200),
	@file [varbinary](max),
	@actionby [nvarchar](20),
	@functionid [varchar](20)
WITH  EXECUTE AS CALLER
AS
BEGIN

	declare @part1 varbinary(max)=null
	declare @part3 varbinary(max)=null

	declare @part1name nvarchar(200)=null
	declare @part3name nvarchar(200)=null

	if @part='1'
	begin
		set @part1=@file
		set @part1name=@filename
	end
	else
	begin
		set @part3=@file
		set @part3name=@filename
	end


	UPDATE PRICE_LIST_MASTER Set 
	 PART1_TEMPLATE=isnull(@part1,PART1_TEMPLATE)
	,PART3_TEMPLATE=isnull(@part3,PART1_TEMPLATE)
	,Part1_FileName=isnull(@part1name,Part1_FileName)
	,Part3_FileName=isnull(@part3name,Part3_FileName)
	,UP_UID=@actionby
	,UP_FID=@functionid
	,UP_DT=getdate()
	WHERE 	PROJECT_ID=@projectid and PRICE_LIST_ID =@priceListid

	
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PRO_SetPrictListTempPath]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
begin
    --select 1
	drop procedure [dbo].[PRO_SetPrictListTempPath]
end

/****** Object:  StoredProcedure [dbo].[PRO_SetPrictListTempPath]    Script Date: 2018/3/15 10:55:50 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ReleasePackage]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ReleasePackage]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Package_ID NVarChar(2),
	@FM_CODE Nvarchar(500),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Declare @Quantity Int
	Declare @Method_Code NVarChar(6)
	Declare @Factor Numeric(18, 2)
	Declare @Price_Adjust Numeric(18, 2)
	Declare @Price_Adjust_Unit NVarChar(1)
	Declare @Internal_Cost Numeric(18, 2)
	Declare @List_Price Numeric(18, 2)
	Declare @Total_Price Numeric(18, 2)
	Declare @Cal_Gross NVarChar(1)
	Declare @Package_Qty Numeric
	Declare @Package_Qty_Onhand Numeric
	Declare @Add_To_Contract_Price Char(1)
	Declare @Add_Pkg_B4_Adjust Char(1)
	Declare @No_Of_Months NVarChar(3);
	Declare @j as int =1 ;
	Declare @Adjustment int =0;
	Declare @Gross_Area NVarChar(9);

	Select @Gross_Area = FM_GR_Area_SF From Flat_Master Where PROJECT_ID=@PROJECT_ID And MOA_NO= @MOA_No

	Select @Quantity = Qty
	From AM_Packages
	Where Project_ID = @Project_ID And AM_No = @MOA_No And Package_ID = @Package_ID

	Update Packages
	Set Package_Qty_Onhand = Package_Qty_Onhand + @Quantity,
		Package_Qty_Held = Package_Qty_Held - @Quantity,
		Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
	Where Project_ID = @Project_ID And Package_ID = @Package_ID
	
/*	Declare @Original NVarChar(4000)
	
	Declare Package_Cursor Cursor For
	Select SubString(N'Project ID = ' + Pk.Project_ID + N', Agreement No. = ' + MOA_No + N', Package ID = ' + Package_ID +
		Case When Qty Is Not Null Then N', Quantity = ' + Convert(NVarChar, Qty) Else N'' End +
		Case When Price_Adjust Is Not Null Then N', Price Adjustment = ' + Base_Curr_ID + N' ' + Convert(NVarChar, Convert(Money, Price_Adjust), 1) Else N'' End +
		Case When No_Of_Months Is Not Null Then N', No. Of Months = ' + Convert(NVarChar, No_Of_Months) Else N'' End +
		Case When Internal_Cost Is Not Null Then N', Internal Cost = ' + Base_Curr_ID + N' ' + Convert(NVarChar, Convert(Money, Internal_Cost), 1) Else N'' End, 0, 4000)
	From MOA_Packages Pk, Project_Master Pj
	Where Pk.Project_ID = @Project_ID And MOA_No = @MOA_No And Package_ID = @Package_ID And Pk.Project_ID = Pj.Project_ID

	Open Package_Cursor
	
	Fetch Next From Package_Cursor
	Into @Original
	
	While @@Fetch_Status = 0
	Begin
		If @Original Is Not Null And @Original <> N''
		Begin
			Insert Into Audit_Log
				(Table_Name, Function_ID, Cr_Time, Cr_User, Mode, Original_Value, Changed_Value, Project_ID)
			Values
    			('MOA_PACKAGES', @Update_FID, GetDate(), @Update_UID, N'Delete', @Original, N'', @Project_ID)
		End

		Fetch Next From Package_Cursor
		Into @Original
	End
	
	Close Package_Cursor
	Deallocate Package_Cursor
*/
	Delete From AM_Packages
	Where Project_ID = @Project_ID And AM_NO = @MOA_No And Package_ID = @Package_ID And FM_CODE = @FM_CODE
	
	Select @Method_Code = Method_Code
	From AM_BASE
	Where Project_ID = @Project_ID And AM_NO = @MOA_No

	If @Method_Code Is Not Null
	Begin
		--  BEGIN #20070313
		Update AM_BASE
		Set AM_PRICE = null, 
			AM_TOT_PRICE = null, Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And AM_NO = @MOA_No

		-- END #20070313
	END

		
	-- BEGIN #20151206
	--Declare @Package_calc_type as nvarchar(1);
	--select @Package_calc_type = PACKAGE_CALC_TYPE from PROJECT_MASTER where PROJECT_ID=@Project_ID

	--if (@Package_calc_type ='A')
	--Begin


	--IF ((SELECT COUNT(*) FROM AM_PACKAGES WHERE PROJECT_ID = @Project_ID AND AM_NO = @MOA_No )<> 1) 
	--BEGIN
	--SELECT ROW_NUMBER()  OVER (ORDER BY P.ADD_TO_CONTRACT_PRICE desc, P.ADD_PKG_B4_ADJUST desc, P.PACKAGE_SEQ asc) 'ROWNUMBER', P.PACKAGE_SEQ ,AP.*,Cal_Gross, Package_Qty, Package_Qty_Onhand,
	-- Unit
	--INTO #TMP
	--FROM AM_PACKAGES AP JOIN PACKAGES P ON AP.PROJECT_ID = P.PROJECT_ID AND P.PACKAGE_ID=AP.PACKAGE_ID 
	--WHERE AM_NO = @MOA_No  and @FM_CODE= FM_CODE 



	--DECLARE @COUNTER AS INT;
	--DECLARE @i AS INT =1 ;
	--DECLARE @CURRENT_AM_NO AS NVARCHAR(20);
	--DECLARE @CURRENT_PACKAGE_CODE NVARCHAR (20);
	--DECLARE @PRE_PACKAGE NUMERIC (18,2) =0.00;
	--Declare @PRE_Add_Pkg_B4_Adjust nvarchar(1);
	--Declare @PRE_Add_To_Contract_Price nvarchar(1);

	--SELECT @COUNTER= COUNT(*) FROM #TMP

	--WHILE (@i <= @COUNTER)
	--BEGIN

	--Select @CURRENT_PACKAGE_CODE = PACKAGE_ID ,  @Cal_Gross = Cal_Gross ,@CURRENT_AM_NO = AM_NO,@No_Of_Months = NO_OF_MONTHS , @Gross_Area = CAL_GROSS ,@Quantity =QTY
	--From #TMP WHERE ROWNUMBER = @i

	--If @Cal_Gross = N'Y'
	--Begin
	--	Select @Factor = Convert(Numeric(18, 2), @Gross_Area) * Convert(Numeric(3), @No_Of_Months) * 1 -- Convert(Int, @Quantity)
	--End
	--Else
	--Begin
	--	Select @Factor = 1 --Convert(Int, @Quantity)
	--End
	--Select @Price_Adjust = Price_Adjust, @Price_Adjust_Unit = Unit, @Internal_Cost = Internal_Cost,
	--	@Add_To_Contract_Price = Add_To_Contract_Price, @Add_Pkg_B4_Adjust = Add_Pkg_B4_Adjust
	--From Packages
	--Where Project_ID = @Project_ID And Package_ID = @CURRENT_PACKAGE_CODE
	
	--if (@PRE_Add_Pkg_B4_Adjust <> @Add_Pkg_B4_Adjust or @PRE_Add_To_Contract_Price <> @Add_To_Contract_Price)
	--Begin 
	--set @PRE_PACKAGE=0;
	--End
	--Set @Adjustment =0;
	--Set @j=1;
	--while (@j <=Convert(Int, @Quantity))
	--Begin
	--If @Price_Adjust_Unit = N'P'
	--Begin
	--	Select @List_Price = IsNull(Sum(FM_List_Price), 0)
	--	From Flat_Master
	--	Where Project_ID = @Project_ID And MOA_No = @CURRENT_AM_NO and @FM_CODE =FM_CODE
		
	--	Select @Total_Price =  @Price_Adjust *( @List_Price +  @PRE_PACKAGE) / 100.0 * @Factor
	--End
	--Else
	--Begin
	--	Select @Total_Price =  @Price_Adjust * @Factor
	--End

	--SELECT @PRE_PACKAGE = @PRE_PACKAGE + Round(@Total_Price, 0);
	--set @Adjustment = @Adjustment + Round(@Total_Price, 0);
	--set @j=@j+1;
	--End
	--	set @Total_Price = Round(@Adjustment, 0);



	--UPDATE AM_PACKAGES
	--SET Qty = Convert(Int, @Quantity), Price_Adjust= Round(@Total_Price, 0),
	--Internal_Cost= Round(@Internal_Cost * @Factor, 0), No_Of_Months = Convert(Numeric(3), @No_Of_Months),
	--Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID= @Update_FID, Add_To_Contract_Price = @Add_To_Contract_Price, Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust, FM_CODE = @FM_CODE
	-- WHERE AM_NO = @CURRENT_AM_NO AND PROJECT_ID = @Project_ID AND @CURRENT_PACKAGE_CODE = PACKAGE_ID and @FM_CODE= FM_CODE
	


	--Select @Method_Code = Method_Code
	--From AM_BASE
	--Where Project_ID = @Project_ID And AM_No = @CURRENT_AM_NO
	
	--If @Method_Code Is Not Null
	--Begin
	--	--  BEGIN #20070313
	--	Update AM_BASE
	--	Set AM_PRICE = null, 
	--		AM_TOT_PRICE = null, Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
	--	Where Project_ID = @Project_ID And AM_NO = @MOA_No
	--EnD

	
	--set @PRE_Add_To_Contract_Price = @Add_To_Contract_Price;
	--set  @PRE_Add_Pkg_B4_Adjust = @Add_Pkg_B4_Adjust;
	--SET @i=@i+1;
	--END
	--END

	--End 
		-- eND #20151206



		/* BEGIN #20070313

		Declare @Flat_List_Price Numeric(18, 2)
		Declare @Car_Park_List_Price_Before_Adjustment Numeric(18, 2)
		Declare @Car_Park_List_Price_After_Adjustment Numeric(18, 2)
		Declare @Package_List_Price_1 Numeric(18, 2)
		Declare @Package_List_Price_2 Numeric(18, 2)
		Declare @Package_List_Price_3 Numeric(18, 2)
		Declare @Contract_Price Numeric(18, 2)
		Declare @Cash_Rebate Numeric(18, 2)
		Declare @Net_Price Numeric(18, 2)
		Declare @Adjustment Numeric(5, 2)
		Declare @Cash_Rebate_Amount Numeric(18, 2)
		Declare @Cash_Rebate_Unit NChar(1)
		Declare @Last_Sequence Int
		Declare @Previous_Sum Numeric(18, 2)
		Declare @Negotiation_Adjustment Numeric(18, 2)
		
		Select @Flat_List_Price = Sum(IsNull(FM_List_Price, 0))
		From Flat_Master
		Where Project_ID = @Project_ID And MOA_No = @MOA_No
		
		Select @Car_Park_List_Price_Before_Adjustment = sum(isnull(case when ADD_CAR_PARK_PRICE_BEFORE_ADJUST = 'Y' then Park_List_Price else 0 end, 0)),
			@Car_Park_List_Price_After_Adjustment = sum(isnull(case when (ADD_CAR_PARK_PRICE_BEFORE_ADJUST is null or ADD_CAR_PARK_PRICE_BEFORE_ADJUST <> 'Y') then Park_List_Price else 0 end, 0)) 
		From Car_Park
		Where Project_ID = @Project_ID And MOA_No = @MOA_No
		
		select @Package_List_Price_1 = sum(isnull(case when add_to_contract_price = 'Y' and add_pkg_b4_adjust = 'Y' Then price_adjust else 0 end, 0)),
			@Package_List_Price_2 = sum(isnull(case when add_to_contract_price = 'Y' and (add_pkg_b4_adjust is null or add_pkg_b4_adjust <> 'Y') Then price_adjust else 0 end, 0)),
			@Package_List_Price_3 = sum(isnull(case when (add_to_contract_price is null or add_to_contract_price <> 'Y') Then price_adjust else 0 end, 0))
		From MOA_Packages
		Where Project_ID = @Project_ID And MOA_No = @MOA_No

		--BEGIN #20070312		
		Select @Package_List_Price_1 = IsNull(@Package_List_Price_1,0)
		Select @Package_List_Price_2 = IsNull(@Package_List_Price_2,0)
		Select @Package_List_Price_3 = IsNull(@Package_List_Price_3,0)		
		--END #20070312

		Select @Adjustment = IsNull(Pay_Adj_Per, 0), @Cash_Rebate_Amount = IsNull(Cash_Rebate, 0), @Cash_Rebate_Unit = Cash_Rebate_Unit, @Negotiation_Adjustment = IsNull(Negotiation_Adj, 0)
		From MOA
		Where Project_ID = @Project_ID And MOA_No = @MOA_No
		
		Select @Contract_Price = @Flat_List_Price + @Car_Park_List_Price_Before_Adjustment + @Car_Park_List_Price_After_Adjustment + @Negotiation_Adjustment + @Package_List_Price_1 + @Package_List_Price_2 + Round((@Flat_List_Price + @Car_Park_List_Price_Before_Adjustment + @Negotiation_Adjustment + @Package_List_Price_1) * @Adjustment / 100.0, 0)

		Select @Contract_Price = @Contract_Price - (@Contract_Price % 100)
		
		If @Cash_Rebate_Amount Is Not Null
		Begin
			If @Cash_Rebate_Unit = N'P'
			Begin
				Select @Cash_Rebate = @Flat_List_Price * @Cash_Rebate_Amount / 100.0
			End
			Else
			Begin
				Select @Cash_Rebate = @Cash_Rebate_Amount
			End
		End
		
		Select @Net_Price = @Contract_Price + @Cash_Rebate + @Package_List_Price_3
		
		Update MOA
		Set MOA_Price = @Contract_Price, MOA_Cash_Rebate = @Cash_Rebate,
			MOA_Tot_Price = @Net_Price, Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And MOA_No = @MOA_No

		Select @Last_Sequence = Max(Py_Plan_Seq)
		From MOA_Py_Plan
		Where Project_ID = @Project_ID And MOA_No = @MOA_No And Method_Code = @Method_Code
		
		Select @Previous_Sum = Sum(IsNull(Py_Paymt_Due, 0))
		From MOA_Py_Plan
		Where Project_ID = @Project_ID And MOA_No = @MOA_No And Method_Code = @Method_Code And Py_Plan_Seq <> @Last_Sequence
		
		Update MOA_Py_Plan
		Set Py_Paymt_Due = @Net_Price - @Previous_Sum, Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And MOA_No = @MOA_No And Method_Code = @Method_Code And Py_Plan_Seq = @Last_Sequence

		END #20070313 */

Return
GO
/****** Object:  StoredProcedure [dbo].[ReMakeSelectionForReCreateMOA]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ReMakeSelectionForReCreateMOA]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Approve_UID NVarChar(10),
	@Approve_FID NVarChar(10)
)
 
As
	Declare @Ballot_No NVarChar(6)
	Declare @Selection_Order NVarChar(30)

	Create Table #_Items (
		[ID] NVarChar(80) Not Null,
		[Type] Char(1) Not Null
	)

	Insert Into #_Items
	Select FM_Code, 'F'
	From Flat_Master
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Insert Into #_Items
	Select Car_Park_ID, 'C'
	From Car_Park
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Select  @Selection_Order = Selection_Order
	From AM_BASE
	Where Project_ID = @Project_ID And AM_NO = @MOA_No

	Insert Into	Flat_Selection
		(Project_ID, FM_Code, Ballot_Seq, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
	Select @Project_ID, [ID], @Ballot_No, @Selection_Order, N'D', GetDate(), @Approve_UID, @Approve_UID, @Approve_FID
	From #_Items
	Where [Type] = 'F'

	Insert Into Car_Park_Selection
		(Project_ID, Car_Park_ID, Ballot_Seq, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
	Select @Project_ID, [ID], @Ballot_No, @Selection_Order, N'D', GetDate(), @Approve_UID, @Approve_UID, @Approve_FID
	From #_Items
	Where [Type] = 'C'

	Update Flat_Master
	Set FM_Status = N'P', MOA_No = Null, Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Update Car_Park
	Set Status = N'P', Moa_No = Null, Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Insert Into	Flat_Selection
		(Project_ID, FM_Code, Ballot_Seq, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
	Select @Project_ID, [ID], @Ballot_No, @Selection_Order, N'S', GetDate(), @Approve_UID, @Approve_UID, @Approve_FID
	From #_Items
	Where [Type] = 'F'

	Insert Into Car_Park_Selection
		(Project_ID, Car_Park_ID, Ballot_Seq, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
	Select @Project_ID, [ID], @Ballot_No, @Selection_Order, N'S', GetDate(), @Approve_UID, @Approve_UID, @Approve_FID
	From #_Items
	Where [Type] = 'C'
Return
GO
/****** Object:  StoredProcedure [dbo].[RP01]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP01]
	@ProjectID [nvarchar](6),
	@Phase [nvarchar](6),
	@Status [nvarchar](1),
	@Block [nvarchar](6),
	@lang [char](1)
WITH  EXECUTE AS CALLER
AS
--exec master..xp_ASL '[weKDisnmvie)}6&'
	
	
	set concat_null_yields_null off

	Declare @sql nvarchar(Max)
	--BEGIN #20080221
	Declare @_Available nvarchar(100)
	Declare @_Reserved nvarchar(100)
	Declare @_Hold nvarchar(100)
	Declare @_Sold nvarchar(100)

	Select @_Available = msg From Message Where lang_id = @lang and msg_cde = '1380'
	Select @_Reserved = msg From Message Where lang_id = @lang and msg_cde = '1382'
	Select @_Hold = msg From Message Where lang_id = @lang and msg_cde = '1381'
	Select @_Sold = msg From Message Where lang_id = @lang and msg_cde = '1383'
	--END #20080221

	--Modify by Alex TotalAvaPrice,TotalSoldPrice,TotalReservedPrice,TotalOnHoldPrice convert int to numeric
	select @sql = N'select F.FM_BLK Block, F.FM_FLOOR ''Floor'', F.FM_FLAT Flat, C.PARK_LEVEL ''Level'', 
				    CAR_PARK_NO CP_NUM, PARK_LIST_PRICE ListPrice, 
				    case C.STATUS when ''A'' then ''' + @_Available + ''' when ''R'' then ''' + @_Reserved + ''' when ''P'' then ''' + @_Hold + ''' when ''S'' then ''' + @_Sold + ''' else ''Unclassified'' end Status, 
				    isnull(ltrim(rtrim(P.BASE_CURR_ID)),''---'') Currency,
 				    (select isnull(count(status),0) from CAR_PARK where STATUS = ''A'' and PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + ''')  TotalAva, 
				    (select isnull(count(status),0) from CAR_PARK where STATUS = ''S'' and PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + ''') TotalSold,	
			   	    (select isnull(count(status),0) from CAR_PARK where STATUS = ''R'' and PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + ''') TotalReserved,
				    (select isnull(count(status),0) from CAR_PARK where STATUS = ''P'' and PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + ''') TotalOnHold,
				    C.PROJECT_ID ProjectID,
				    (select concat(PRJ_NAME_CHI ,PRJ_NAME_ENG)  from PROJECT_MASTER P where P.PROJECT_ID = C.PROJECT_ID) ProjectName,
				    (select DEV_NAME from DEVELOPMENT D where D.DEV_CODE = C.DEV_CODE) Phase,
 				    (select cast(round(isnull(sum(PARK_LIST_PRICE),0.0),0.0) as numeric(16,1)) from CAR_PARK where STATUS = ''A'' and PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + ''')  TotalAvaPrice, 
				    (select cast(round(isnull(sum(PARK_LIST_PRICE),0.0),0.0) as numeric(16,1)) from CAR_PARK where STATUS = ''S'' and PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + ''')  TotalSoldPrice,
				    (select cast(round(isnull(sum(PARK_LIST_PRICE),0.0),0.0) as numeric(16,1)) from CAR_PARK where STATUS = ''R'' and PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + ''')  TotalReservedPrice,
				    (select cast(round(isnull(sum(PARK_LIST_PRICE),0.0),0.0) as numeric(16,1)) from CAR_PARK where STATUS = ''P'' and PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + ''')  TotalOnHoldPrice,
				    (select isnull(count(status),0) from CAR_PARK where PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + ''')  GrandTotalCount,
				    (select cast(round(isnull(sum(PARK_LIST_PRICE), 0.0), 0.0) as numeric(16,1)) from CAR_PARK where PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') +''') GrandTotalSum 
           			     from CAR_PARK C left outer  join VW_RPT_FLAT_MASTER F on (C.FM_CODE = F.FM_CODE and C.PROJECT_ID = F.PROJECT_ID) 	
     										  inner join PROJECT_MASTER P on (P.PROJECT_ID = C.PROJECT_ID) where C.car_park_deleted <> ''Y'' AND C.PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + '''' 
	
				    + case when isnull(@Phase,'') <> '' or len(@Phase) >0 then '  and C.DEV_CODE =  @Phase'  end
      				    + case when isnull(@Status,'') <> '' or len(@Status) > 0 then '  and C.STATUS = @Status ' end
				    + case when isnull(@Block,'') <> '' or len(@Block) > 0 then '  and F.FM_BLK = @Block ' end
				    + ' order by right(Stuff(N''000000'', 6,1, Convert(NVarChar(6), C.PARK_LEVEL)), 6), right(Stuff(N''000000'', 6,1, Convert(NVarChar(6), C.CAR_PARK_NO)), 6)'

	exec sp_executesql @sql, N' @Phase nvarchar(6), @Status nvarchar(1), @Block nvarchar(6)', @Phase, @Status, @Block


GO
/****** Object:  StoredProcedure [dbo].[RP02]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[RP02] (
@ProjectID NVarchar(6), @Phase NVarChar(6), @Block nvarchar(6), @Adjustment nvarchar(6))

 
As
	
-- exec master..xp_ASL '[weKDisnmvie)}6&'
	
	
set concat_null_yields_null off

declare @sql nvarchar(Max)

		select @sql = N'select fl.prj ProjectID, (concat(p.PRJ_NAME_CHI,p.PRJ_NAME_ENG)) ProjectName, '
		select @sql = @sql + N'(Select dev_name from development where dev_code = fl.pha) Phase, p.base_curr_id ProjectCurr, p.uom_code ProjectUom, '
		select @sql = @sql + N'''' + case when @Adjustment is null then '' else replace(@Adjustment, '''', '''''') end + ''' Adjustment, fl.blk Block, fl.tno Total_No, fl.tgfa Total_GFA, '
		select @sql = @sql + N'fl.sun Sold_UnitNo, case when fl.tno = 0 then 0 else cast(fl.sun as numeric(16,2)) / cast(fl.tno as numeric(16,2)) * 100 end Sold_UnitPercent, '
		select @sql = @sql + N'fl.sgfa Sold_GFA, case when fl.tgfa = 0 then 0 else cast(fl.sgfa as numeric(16,2)) / cast(fl.tgfa as numeric(16,2)) * 100 end Sold_GFAPercent, '
        
		select @sql = @sql + N'fl.scpt Sold_ContractPriceTotal, case when fl.sgfa = 0 then 0 else cast(fl.scpt as numeric(16,2)) / cast(fl.sgfa as numeric(16,2))  end Sold_ContractPriceAvg, '
       
		-- select @sql = @sql + N'fl.snpt Sold_NetPriceTotal, case when fl.sgfa = 0 then 0 else cast(fl.snpt as numeric(16,2)) / cast(fl.sgfa as numeric(16,2))  end Sold_NetPriceAvg, '
		-- select @sql = @sql + N'fl.snpt Sold_NetPriceTotal, case when fl.sgfa = 0 then 0 else cast(fl.snpt as numeric(16,2)) / cast(fl.sgfa as numeric(16,2))  end Sold_NetPriceAvg, '
		select @sql = @sql + N'fl.snpt Sold_NetPriceTotal, case when fl.sgfa = 0 then 0 else cast(fl.snpt as numeric(16,2)) / cast(fl.sgfa as numeric(16,2))  end Sold_NetPriceAvg, '
		select @sql = @sql + N'fl.uun Unsold_UnitNo, fl.ugfa Unsold_GFA, fl.ulpt Unsold_ListPriceTotal, '
		select @sql = @sql + N'case when fl.ugfa = 0 then 0 else cast(fl.ulpt as numeric(16,2)) / cast(fl.ugfa as numeric(16,2))  end Unsold_ListPriceAvg, '
		select @sql = @sql + N'fl.ulpt * (100 + cast(''' + case when @Adjustment is null then '0' else replace(@Adjustment, '''', '''''') end + ''' as numeric)) / 100 Unsold_NetPriceTotal, '
		select @sql = @sql + N'case when fl.ugfa = 0 then 0 else (fl.ulpt * (100 + cast(''' + case when @Adjustment is null then '0' else replace(@Adjustment, '''', '''''') end + ''' as numeric)) / 100) / cast(fl.ugfa as numeric(16,2))  end Unsold_NetPriceAvg '
		select @sql = @sql + N'from '


		select @sql = @sql + N'(select t.prj prj, t.pha pha, '
		select @sql = @sql + N'case when t.blk is null then '''' when t.blk = '''' then '''' else (select block_desc from block where project_id = t.prj and block_id = t.blk) end blk, '
		select @sql = @sql + N'isnull(t.tno,0) tno, isnull(t.tArea,0) tgfa, '

		select @sql = @sql + N'isnull(m.tno,0) sun, isnull(m.tarea,0) sgfa, isnull(m.tcprice,0) scpt, '

		select @sql = @sql + N'isnull(m.tnprice,0) snpt, isnull(u.tno,0) uun, isnull(u.tarea,0) ugfa, '	
		select @sql = @sql + N'isnull(u.tlprice,0) ulpt '
		select @sql = @sql + N'from '
		select @sql = @sql + N'(select f.project_id prj, f.dev_code pha, isnull(f.fm_blk,'''') blk, count(f.project_id) tno, '
		-- select @sql = @sql + N'sum(f.fm_gr_area_sf) tarea from flat_master f where '
		select @sql = @sql + N'sum(f.FM_USABLE_SF) tarea from flat_master f where '
		select @sql = @sql + N'f.fm_deleted <> ''Y'' '
                           
		if ((@ProjectID is not null  ) and (@ProjectID != ''))
		select @sql = @sql + N'and f.project_id = ''' + replace(@ProjectID, '''', '''''') + '''' 
         
		if ((@Phase is not null) and (@Phase != ''))   
		select @sql = @sql + N'and f.dev_code = ''' + replace(@Phase, '''', '''''') + ''''
          
		if ((@Block is not null) and (@Block != ''))   
		select @sql = @sql + N'and f.fm_blk = ''' + replace(@Block, '''', '''''') + ''''

		select @sql = @sql + N'group by f.project_id, f.dev_code, f.fm_blk ) t left outer join '
		select @sql = @sql + N'(select f.project_id prj, f.dev_code pha, isnull(f.fm_blk,'''') blk, '
		-- Begin 20160311 TOmmy
		-- Begin 20160504 Tommy
		--select @sql = @sql + N'count(f.project_id) tno, sum(f.FM_USABLE_SF) tarea, sum(case a.show_cash_rebate when N''Y'' then ( case when dist_MOA.FM_CP_CODE is null then 0 else MOA_TOT_PRICE end ) else (case when dist_MOA.FM_CP_CODE is null then null else a.MOA_PRICE end)end) - sum(isnull(c.park_list_price,0)) tcprice, '
		select @sql = @sql + N'count(f.project_id) tno, sum(f.FM_USABLE_SF) tarea, sum(case a.show_cash_rebate when N''Y'' then (ISNULL(APDF.Contract_Price, 0)) else (ISNULL(APDF.Contract_Price ,0))end) tcprice, '
		--select @sql = @sql + N' -  Case when APDF.Contract_Price  <> null Then sum(isnull(c.park_list_price,0))Else 0 END tcprice, '
		-- END 20160504 Tommy
		-- End 20160311 TOmmy
		-- select @sql = @sql + N'sum(isnull(a.moa_tot_price,0)) tnprice from flat_master f left outer join moa a on f.project_id = a.project_id and f.moa_no = a.moa_no '
		select @sql = @sql + N'sum(isnull(f.FM_LIST_PRICE,0)) tnprice from flat_master f left outer join moa a on f.project_id = a.project_id and f.moa_no = a.moa_no '
		-- Begin 20160311 TOmmy
		select @sql = @sql + N' left outer join (select a.moa_no , (select * from (select top(1) FM_CP_CODE from AM_ITEM where f.MOA_NO = AM_NO order by FM_CP_CODE DESC)tmpt where tmpt.FM_CP_CODE = f.FM_CODE) ''FM_CP_CODE'' from flat_master f left outer join moa a on f.project_id = a.project_id and f.moa_no = a.moa_no )dist_MOA on dist_MOA.MOA_NO =a.MOA_NO and dist_MOA.FM_CP_CODE = f.FM_CODE'
		-- End 20160311 TOmmy
		-- Begin 20160506 Tommy
		--select @sql = @sql + N' left outer join car_park c on f.project_id = c.project_id and f.moa_no = c.moa_no '
		-- END 20160506 Tommy
		-- Begin 20160504 Tommy
		--select @sql = @sql + N' Left Outer Join AM_PRICE_DETAIL APDF on APDF.FM_CP =''F'' and APDF.PROJECT_ID = f.PROJECT_ID and APDF.FM_CP_CODE = F.FM_CODE '
		
		--#20170921 
		--select @sql = @sql + N' Left Outer Join ( Select APDC.PROJECT_ID , AM_NO,  DEV_CODE , Sum(Contract_PRICE) ''Contract_PRICE'' , FM_CP_CODE FROM  AM_PRICE_DETAIL APDC  JOin FLAT_MASTER FM on FM.PROJECT_ID = APDC.PROJECT_ID AND FM.FM_CODE = APDC.FM_CP_CODE AND  APDC.FM_CP=''F''  group by APDC.PROJECT_ID,AM_NO,DEV_CODE,FM_CP_CODE ) APDF on  APDF.PROJECT_ID = f.PROJECT_ID and APDF.FM_CP_CODE = F.FM_CODE and F.DEV_CODE = APDF.DEV_CODE '
		  select @sql = @sql + N' Left Outer Join ( Select 	APDC.PROJECT_ID , ab.AM_NO,  DEV_CODE , Sum(apdc.CONTRACT_PRICE) ''Contract_PRICE'' , FM_CP_CODE FROM AM_PRICE_DETAIL APDC right JOin FLAT_MASTER FM on FM.PROJECT_ID = APDC.PROJECT_ID AND FM.FM_CODE = APDC.FM_CP_CODE AND  APDC.FM_CP=''F''   AND Apdc.AM_NO = fm.MOA_NO	right Join AM_BASE ab on fm.PROJECT_ID = ab.PROJECT_ID and fm.MOA_NO = ab.am_no	where ab.AM_Status = ''C'' and fm.FM_STATUS = ''S''	group by APDC.PROJECT_ID,ab.AM_NO,DEV_CODE,FM_CP_CODE ) APDF on  APDF.PROJECT_ID = f.PROJECT_ID and APDF.FM_CP_CODE = F.FM_CODE and F.DEV_CODE = APDF.DEV_CODE '
		--#20170921 
		
		--select @sql = @sql + N' Left Outer Join AM_PRICE_DETAIL APDC on APDC.FM_CP =''C'' and APDC.PROJECT_ID = f.PROJECT_ID and APDC.FM_CP_CODE = C.CAR_PARK_ID '
		-- End 20160504 Tommy
		select @sql = @sql + N'where f.fm_deleted <> ''Y'' '

		if ((@ProjectID is not null  ) and (@ProjectID != ''))
		select @sql = @sql + N'and f.project_id = ''' + replace(@ProjectID, '''', '''''') + '''' 
         
		if ((@Phase is not null) and (@Phase != ''))   
		select @sql = @sql + N'and f.dev_code = ''' + replace(@Phase, '''', '''''') + ''''
          
		if ((@Block is not null) and (@Block != ''))   
		select @sql = @sql + N'and f.fm_blk = ''' + replace(@Block, '''', '''''') + ''''
          
		select @sql = @sql + N'and f.fm_status = ''S'' group by f.project_id, f.dev_code, f.fm_blk) m '
		select @sql = @sql + N'on t.prj = m.prj and t.pha = m.pha and t.blk = m.blk left outer join '
		select @sql = @sql + N'(select f.project_id prj, f.dev_code pha, isnull(f.fm_blk,'''') blk, '
		select @sql = @sql + N'count(f.project_id) tno, sum(f.FM_USABLE_SF) tArea, sum(f.fm_list_price) tlprice '
		select @sql = @sql + N'from flat_master f where f.fm_deleted <> ''Y'' '
          
		if ((@ProjectID is not null  ) and (@ProjectID != ''))
		select @sql = @sql + N'and f.project_id = ''' + replace(@ProjectID, '''', '''''') + '''' 
         
		if ((@Phase is not null) and (@Phase != ''))   
		select @sql = @sql + N'and f.dev_code = ''' + replace(@Phase, '''', '''''') + ''''
          
		if ((@Block is not null) and (@Block != ''))   
		select @sql = @sql + N'and f.fm_blk = ''' + replace(@Block, '''', '''''') + ''''
          
		select @sql = @sql + N'and f.fm_status <> ''S'' group by f.project_id, f.dev_code, f.fm_blk) u '
		select @sql = @sql + N'on t.prj = u.prj and t.pha = u.pha and t.blk = u.blk) fl, '
		select @sql = @sql + N'project_master p '
		select @sql = @sql + N'where fl.prj = p.project_id '
		select @sql = @sql + N'order by fl.prj, fl.pha, (case when fl.blk is null then 0 when fl.blk = '''' then 0 else 1 end) desc, fl.blk'
	
	--select @sql
INSERT INTO [AUDIT_LOG] (TABLE_NAME, FUNCTION_ID, ORIGINAL_VALUE, CR_TIME, CR_USER, MODE, KEY_VALUE, PROJECT_ID) VALUES ('RP02', 'RP02', @sql, GETDATE(), 'RP02', 'R',  @Phase + ',' + @Adjustment + ',' + @Block, @ProjectID);
exec sp_executesql @sql, N' @Phase nvarchar(6), @Block nvarchar(6), @Adjustment nvarchar(6)', @Phase, @Block, @Adjustment

	

GO
/****** Object:  StoredProcedure [dbo].[RP03]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP03]
	@ProjectID [nvarchar](6),
	@Phase [nvarchar](6),
	@Block [nvarchar](6),
	@Adjustment [nvarchar](6)
WITH  EXECUTE AS CALLER
AS
--exec master..xp_ASL '[weKDisnmvie)}6&'
	
	set concat_null_yields_null off

	declare @sql nvarchar(Max)
	--Modify by Alex add BlockName
	select @sql = N'select f.prjID ProjectID, (concat(pm.PRJ_NAME_CHI,pm.PRJ_NAME_ENG)) ProjectName, 
	case when f.devCde is null then '''' when f.devCde = '''' then '''' else (select dev_name from development where dev_code = f.devCde) end Phase, 
	pm.base_curr_id ProjectCurr, pm.uom_code ProjectUOM,
	''' + case when @Adjustment is null then '' else replace(@Adjustment, '''', '''''') end + ''' Adjustment, f.blk Block, f.hse HouseNo, f.tNo Total_No, f.sNo Sold_CpNo, 
    case when f.tNo = 0 then 0 else cast(f.sNo as numeric(18, 2)) / cast(f.tNo as numeric(18, 2)) * 100 end Sold_CpPercent,
    
	f.sTP Sold_ContractPriceTotal,
    case when f.sNo = 0 then 0 else cast(f.sTP as numeric(18, 2)) / cast(f.sNo as numeric(18, 2)) end Sold_ContractPriceAvg,
    
	f.uNo Unsold_CpNo,
    f.uTP Unsold_ListPriceTotal,
    case when f.uNo = 0 then 0 else cast(f.uTP as numeric(18, 2)) / cast(f.uNo as numeric(18, 2)) end Unsold_ListPriceAvg,
    cast(f.uTP as numeric(18, 2)) * (100 + cast(''' + case when @Adjustment is null then '0' else replace(@Adjustment, '''', '''''') end + ''' as numeric)) / 100 Unsold_NetPriceTotal,
    case when f.uNo = 0 then 0 else (cast(f.uTP as numeric(18, 2)) * (100 + cast(''' + case when @Adjustment is null then '0' else replace(@Adjustment, '''', '''''') end + ''' as numeric)) / 100) / cast(f.uNo as numeric(18, 2)) end Unsold_NetPriceAvg,
	(select BLOCK_desc from BLOCK where block.BLOCK_ID = f.blk and BLOCK.PROJECT_ID = f.prjID) BlockName
    from (
      select a.project_id prjID, a.dev_code devCde, a.fm_blk blk, a.fm_hse_no hse, isnull(a.total_no, 0) tNo, isnull(b.total_no, 0) uNo, 
      isnull(c.total_no, 0) sNo, isnull(b.list_price, 0) uTP, isnull(c.list_price, 0) sTP from
      (select cp.project_id project_id, cp.dev_code dev_code, isnull(fm.fm_blk, '''') fm_blk, isnull(fm.fm_hse_no, '''') fm_hse_no, count(cp.dev_code) total_no
      from car_park cp left outer join flat_master fm on cp.project_id = fm.project_id and cp.fm_code = fm.fm_code 
      where cp.car_park_deleted <> ''Y'' and cp.project_id = ''' + replace(@ProjectID, '''', '''''') + ''''
   
   if ((@Phase is not null) and (@Phase <> ''))
    select @sql = @sql + N' and cp.dev_code = ''' + replace(@Phase, '''', '''''') + ''''
    
  select @sql = @sql + N' group by cp.project_id, cp.dev_code, isnull(fm.fm_blk, ''''), isnull(fm.fm_hse_no, '''')) a
  left outer join 
  (select cp.project_id project_id, cp.dev_code dev_code, isnull(fm.fm_blk, '''') fm_blk, isnull(fm.fm_hse_no, '''') fm_hse_no, count(cp.dev_code) total_no,
  sum(isnull(cp.park_list_price, 0)) list_price
  from car_park cp left outer join flat_master fm on cp.project_id = fm.project_id and cp.fm_code = fm.fm_code 
  where cp.car_park_deleted <> ''Y'' and cp.project_id = ''' + replace(@ProjectID, '''', '''''') + '''' 

   if ((@Phase is not null) and (@Phase <> ''))
    select @sql = @sql + N' and cp.dev_code = ''' + replace(@Phase, '''', '''''') + ''''

  select @sql = @sql + N' and cp.status <> ''S'' 
  group by cp.project_id, cp.dev_code, isnull(fm.fm_blk, ''''), isnull(fm.fm_hse_no, '''')) b
  on a.project_id = b.project_id and a.dev_code = b.dev_code and a.fm_blk = b.fm_blk and a.fm_hse_no = b.fm_hse_no
  left outer join (select cp.project_id project_id, cp.dev_code dev_code, isnull(fm.fm_blk, '''') fm_blk, isnull(fm.fm_hse_no, '''') fm_hse_no, 
  count(cp.dev_code) total_no, sum(isnull(APDC.Contract_PRICE, 0)) list_price
  from car_park cp left outer join flat_master fm on cp.project_id = fm.project_id and cp.fm_code = fm.fm_code 
  Left Outer join AM_PRICE_DETAIL APDC on APDC.FM_CP =''C'' and CP.PROJECT_ID = APDC.PROJECT_ID and APDC.FM_CP_CODE = CP.CAR_PARK_ID 
  where cp.car_park_deleted <> ''Y'' and cp.project_id = ''' + replace(@ProjectID, '''', '''''') + '''' 
  
  if ((@Phase is not null) and (@Phase <> ''))
    select @sql = @sql + N' and cp.dev_code = ''' + replace(@Phase, '''', '''''') + ''''

  select @sql = @sql + N' and cp.status = ''S''  
  group by cp.project_id, cp.dev_code, isnull(fm.fm_blk, ''''), isnull(fm.fm_hse_no, '''')) c
  on a.project_id = c.project_id and a.dev_code = c.dev_code and a.fm_blk = c.fm_blk and a.fm_hse_no = c.fm_hse_no) f, project_master pm
  where f.prjID = pm.project_id
  order by f.prjID, f.devCde, (case when f.blk is null then 0 when f.blk = '''' then 0 else 1 end) desc, 
  (case when f.hse is null then 0 when f.hse = '''' then 0 else 1 end) desc'
    

 --select @sql
 exec sp_executesql @sql, N' @Phase nvarchar(6), @Block nvarchar(6), @Adjustment nvarchar(6)', @Phase, @Block, @Adjustment


	

GO
/****** Object:  StoredProcedure [dbo].[RP04]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP04]
	@ProjectID [nvarchar](6),
	@Phase [nvarchar](6),
	@Status [nvarchar](1),
	@AnaGroup [nvarchar](6),
	@lang [char](1)
WITH  EXECUTE AS CALLER
AS
--exec master..xp_ASL '[weKDisnmvie)}6&'
	
	set concat_null_yields_null off
	Declare @sql nvarchar(max)
	Declare @fsql nvarchar(max)
	Declare @fsql2 nvarchar(max)
	Declare @anaGrp nvarchar(6)
	Declare @cnt numeric
	--BEGIN #20080221
	Declare @_Available nvarchar(100)
	Declare @_Reserved nvarchar(100)
	Declare @_Hold nvarchar(100)
	Declare @_Sold nvarchar(100)
	Declare @_hse nvarchar(100)

	Select @_Available = msg From Message Where lang_id = @lang and msg_cde = '1380'
	Select @_Reserved = msg From Message Where lang_id = @lang and msg_cde = '1382'
	Select @_Hold = msg From Message Where lang_id = @lang and msg_cde = '1381'
	Select @_Sold = msg From Message Where lang_id = @lang and msg_cde = '1383'
	Select @_hse = msg From Message Where lang_id = @lang and msg_cde = '6019'
	--END #20080221

	select 
		a.pn ProjectID, concat (p.PRJ_NAME_CHI,' ' ,p.PRJ_NAME_ENG) ProjectName, (select dev_name from development where dev_code =  a.pc) Phase, p.base_curr_id ProjectCurr, 
         p.uom_code ProjectUom, a.bn U_Block, a.hn U_HouseNo, a.fr U_Floor, a.ft U_Flat, a.ga U_GFA, a.na U_NFA, a.lp U_ListPrice,  
         a.fs U_Status, a.pl CP_Level, a.co CP_No, a.ch CP_HouseNo, a.pp CP_ListPrice, a.us CP_Status, a.tp TotalListPrice, a.fe FmCode,
         a.ofs OrigStatus, a.pc devCode,FM_FLOOR_SEQ
	into #RP04
	from ( 
		select 
			fm.project_id pn, fm.dev_code pc,
			-- case when fm.fm_blk is null then '' when fm.fm_blk = '' then ''  else (select block_desc from block where project_id = fm.project_id and block_id = fm.fm_blk) end bn, 
			ISNULL(b.BLOCK_DESC, '') bn, 
			-- case when fm.fm_hse_no is null then '' else ISNULL(s.STR_NAME + ' ', '') + @_hse + fm.fm_hse_no end hn,
			ISNULL(s.STR_NAME + ' ', '') hn,
			isnull(fm.fm_floor, '') fr,
			isnull(fm.fm_flat, '') ft, isnull(fm.fm_gr_area_sf, 0) ga, isnull(fm.fm_usable_sf, 0) na, isnull(fm.fm_list_price, 0) lp,
			case fm.fm_Status when 'A' then @_Available when 'P' then @_Hold when 'R' then @_Reserved  else @_Sold  end fs, 
			isnull(cp.park_level, '') pl, isnull(cp.car_park_no, '') co, 
			case when cp.house_no is null then '' when cp.house_no = '' then '' else ISNULL(s.STR_NAME + ' ', '') + @_hse + cp.house_no end ch, cp.park_list_price pp, 
			case when cp.status is null then '' when cp.Status = 'A' then @_Available when cp.status = 'P' then @_Hold when cp.status = 'R' then @_Reserved else @_Sold end us, 
			isnull(fm.fm_list_price, 0) + isnull(cp.park_list_price, 0) tp, fm.fm_code fe, fm.fm_status ofs ,
			FM_FLOOR_SEQ [FM_FLOOR_SEQ]
		from 
			-- flat_master fm
			VW_RPT_FLAT_MASTER fm
			LEFT JOIN STREET s ON fm.PROJECT_ID = s.PROJECT_ID AND fm.STR_CODE = s.STR_CODE
			LEFT JOIN BLOCK b ON fm.PROJECT_ID = b.PROJECT_ID AND fm.fm_blk = b.block_id
			left outer join car_park cp on fm.project_id = cp.project_id and fm.fm_code = cp.fm_code 
		where 
			fm.fm_status <> 'S' and fm.fm_deleted = 'N' and fm.project_id = @ProjectID
	union all 
       select cp.project_id pn, cp.dev_code pc, '' bn, '' hn, null fr, null ft, null ga, null na, null lp, null fs, 
       isnull(park_level, '') pl, isnull(car_park_no, '') co, 
       case when house_no is null then '' when house_no = '' then '' else ISNULL(s.STR_NAME + ' ', '') + @_hse + house_no end ch, park_list_price pp, 
       case status when 'A' then @_Available when 'P' then @_Hold when 'R' then @_Reserved  else @_Sold  end us, park_list_price tp,
       cp.fm_code fe, cp.status ofs , null [FM_floor_seq]
       from car_park cp
	   LEFT JOIN STREET s ON cp.PROJECT_ID = s.PROJECT_ID AND cp.STR_CODE = s.STR_CODE
       where (cp.fm_code is null or cp.fm_code = '') and cp.status <> 'S' and cp.car_park_deleted = 'N'
       and cp.project_id = '' +@ProjectID+ '') a, project_master p 
      where a.pn = p.project_id
      order by a.pn, a.pc, (case when a.bn is null then 0 when a.bn = '' then 0 else 1 end) desc, a.bn,
      (case when a.hn is null then 0 when a.hn = '' then 0 else 1 end) desc, a.hn,
      (case when a.pl is null then 0 when a.pl = '' then 0 else 1 end) desc, a.pl,
      (case when a.co is null then 0 when a.co = '' then 0 else 1 end) desc, a.co,
      (case when a.ch is null then 0 when a.ch = '' then 0 else 1 end) desc, a.ch






-- select * from #RP04

create table #RP04_Ana (
	prj nvarchar(6) not null,
	fc nvarchar(80) not null,
	ad nvarchar(3914)
)

	DECLARE ana_gp CURSOR FOR 
		SELECT ana_group_id FROM analysis_group where @AnaGroup is null or ana_group_id = @AnaGroup ORDER BY ana_group_id

	select @cnt = 1
	select @sql = N'insert into #RP04_Ana select distinct a.project_id prj,a.fm_cp_code fc,'''''

	open ana_gp FETCH NEXT FROM ana_gp INTO @anaGrp WHILE @@FETCH_STATUS = 0
		BEGIN
			select @sql = @sql + N'+case when a' + cast(@cnt as nvarchar(6)) + '.ana_id is null then '''' when a' + cast(@cnt as nvarchar(6)) + '.ana_id='''' then '''' '
			select @sql = @sql + N'else(select ana_desc+'', '' from analysis_code where ana_id=a' + cast(@cnt as nvarchar(6)) + '.ana_id and ana_group_id=a' + cast(@cnt as nvarchar(6)) + '.ana_group_id)end'

			select @cnt = @cnt + 1
		
			FETCH NEXT FROM ana_gp INTO @anaGrp
		END
	CLOSE ana_gp

	
	select @sql = @sql + N' ad from fm_Cp_analysis_code a'
	select @cnt = 1
    
	open ana_gp FETCH NEXT FROM ana_gp INTO @anaGrp WHILE @@FETCH_STATUS = 0
		BEGIN
			select @sql = @sql + N' left outer join fm_cp_analysis_code a' + cast(@cnt as nvarchar(6)) + ' on '
			select @sql = @sql + 'a.project_id=a' + cast(@cnt as nvarchar(6)) + '.project_id and a.fm_cp_code=a' + cast(@cnt as nvarchar(6)) + '.fm_cp_code and '
			select @sql = @sql + 'a' + cast(@cnt as nvarchar(6)) + '.ana_group_id=''' + @anaGrp + ''''
			select @cnt = @cnt + 1
		
			FETCH NEXT FROM ana_gp INTO @anaGrp
		END
	CLOSE ana_gp

    DEALLOCATE ana_gp

select @sql = @sql + N' where a.project_id=''' + replace(@ProjectID, '''', '''''') + ''''

 exec sp_executesql @sql

select @fsql = N'select r.ProjectID,r.ProjectName,r.Phase,r.ProjectCurr,r.ProjectUom,'
select @fsql = @fsql + N'r.U_Block,r.U_HouseNo,r.U_Floor,r.U_Flat,r.U_GFA,r.U_NFA,r.U_ListPrice,'
select @fsql = @fsql + N'case when fa.ad is null then '''' when fa.ad='''' then '''' else substring(fa.ad,1,len(fa.ad)-1)end U_ANA,'
select @fsql = @fsql + N'r.U_Status,r.CP_Level,r.CP_No,r.CP_HouseNo,r.CP_ListPrice,'
select @fsql = @fsql + N'r.CP_Status,r.TotalListPrice from #RP04 r left outer join #RP04_Ana fa '
--Modfiy by Alex
--select @fsql = @fsql + N'on r.projectID=fa.prj and r.fmCode=fa.fc '
--End 
select @fsql = @fsql + N'on r.projectID Collate Database_Default = fa.prj and r.fmCode Collate Database_Default =fa.fc '
select @fsql = @fsql + N'where r.projectID=''' + replace(@ProjectID, '''', '''''') + ''''

if ((@Phase is not null) and (@Phase != ''))   
  select @fsql = @fsql + N' and r.devCode=''' + replace(@Phase, '''', '''''') + ''''

if ((@Status is not null) and (@Status != ''))
  select @fsql = @fsql + N' and r.OrigStatus=''' + replace(@Status, '''', '''''') + ''''

          select @fsql = @fsql + N' order by r.ProjectID,r.Phase,'
select @fsql = @fsql + N'(case when r.U_Block is null then 0 when r.U_Block='''' then 0 else 1 end)desc,r.U_Block,'
select @fsql = @fsql + N'(case when r.U_HouseNo is null then 0 when r.U_HouseNo='''' then 0 else 1 end)desc,r.U_HouseNo,'
-- BEGIN 20160310 Tommy
select @fsql = @fsql + N'(case when r.FM_FLOOR_SEQ is null then 0 when r.FM_FLOOR_SEQ='''' then 0 else 1 end)desc,r.FM_FLOOR_SEQ,'
-- End 20160310 Tommy
select @fsql = @fsql + N'(case when r.CP_Level is null then 0 when r.CP_Level='''' then 0 else 1 end)desc,r.CP_Level,'
select @fsql = @fsql + N'(case when r.CP_No is null then 0 when r.CP_No='''' then 0 else 1 end)desc,r.CP_No,'
select @fsql = @fsql + N'(case when r.CP_HouseNo is null then 0 when r.CP_HouseNo='''' then 0 else 1 end)desc,r.CP_HouseNo collate Chinese_PRC_CI_AI_WS'

 exec sp_executesql @fsql
return
GO
/****** Object:  StoredProcedure [dbo].[RP05]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[RP05]
(
	@ProjectID NVarChar(6),
	@Phase NVarChar(6),
	@DateFrom NVarChar(10),
	@DateTo NVarChar(10),
	@Country NVarChar(6),
	@PurchaserType NVarChar(1),
	@PurchaseIntention NVarChar(1),
	@lang char(1)
)
 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	
	
	Declare @Condition NVarChar(Max)
	Declare @MOA_No NVarChar(20)
	--BEGIN #20080221
	Declare @_Individual nvarchar(100)
	Declare @_Company nvarchar(100)
	Declare @_Others nvarchar(100)
	Declare @_Investment nvarchar(100)
	Declare @_Immigrant nvarchar(100)
	Declare @_SelfUse nvarchar(100)
	Declare @FM_CODE nvarchar(200)

	Select @_Individual = msg From Message Where lang_id = @lang and msg_cde = '1072'
	Select @_Company = msg From Message Where lang_id = @lang and msg_cde = '1087'
	Select @_Others = msg From Message Where lang_id = @lang and msg_cde = '1088'
	Select @_Investment = msg From Message Where lang_id = @lang and msg_cde = '1383'
	Select @_Immigrant = msg From Message Where lang_id = @lang and msg_cde = '6019'
	Select @_SelfUse = msg From Message Where lang_id = @lang and msg_cde = '6019'
	--END #20080221


	--Begin 20160513
--	Select M.Project_ID N'ProjectID', concat (P.PRJ_NAME_CHI,P.PRJ_NAME_ENG) N'ProjectName',
--		Case When F.Dev_Code Is Not Null Then F.Dev_Code Else CP.Dev_Code End N'PhaseID',
--		Case When F.Dev_Name Is Not Null Then F.Dev_Name Else CP.Dev_Name End N'Phase',
--		P.Base_Curr_ID N'ProjectCurr', M.MOA_Dt N'Date', M.MOA_No N'AgreementNo', 
--		-- F.Block_Desc N'Block',
--		ISNULL(F.Block_Desc, F.FM_BLK) N'Block',
--		F.FM_Hse_No N'HouseNo', isnull(F.FM_Floor,F.FM_STR_NO) N'Floor', isnull(F.FM_Flat,F.STR_CODE) N'Flat',
--		F.FM_USABLE_SF N'GFA', 
--	--	Case When ( F.RowNumber is null) or (F.RowNumber = 1 ) 
--	--	Then 
--	--	--(CP.Car_Park_No)
--	--	(select  (ISNULL(CPNo.CAR_PARK_NO,'')) + char(10)
--	-- From CAR_PARK CPNo
--	--where CPNo.PROJECT_ID =@PROJECTID AND MOA_NO=M.MOA_NO AND ( F.DEV_CODE =CPNo.DEV_CODE or (F.DEV_CODE is NULl AND CPNo.DEV_CODE = CP.DEV_CODE))
--	-- FOR XML PATH(''))
--	--	Else NULL 
--	--	END 
--		NULL
--		N'CpNo',
--		Case When M.MOA_Type = N'C' Then M.MOA_Co_Name Else ISNULL(M.Buyer_Surname,'') + N' ' + ISNULL(M.Buyer_Given_Name,'') End N'Name',
--		Case When M.MOA_Type = N'C' Then M.Director_Gender1 Else MOA_Buyer_Gender End N'Gender',
--		Case When M.MOA_Type = N'C' Then
--			Case When Month(M.Director_DOB1) < Month(M.MOA_Dt) Or (Month(M.Director_DOB1) = Month(M.MOA_Dt) And Day(M.Director_DOB1) <= Day(M.MOA_Dt)) Then
--				DateDiff(Year, M.Director_DOB1, M.MOA_Dt)
--			Else
--				DateDiff(Year, M.Director_DOB1, M.MOA_Dt) - 1
--			End
--		Else
--			Case When Month(M.MOA_Buyer_DOB) < Month(M.MOA_Dt) Or (Month(M.MOA_Buyer_DOB) = Month(M.MOA_Dt) And Day(M.MOA_Buyer_DOB) <= Day(M.MOA_Dt)) Then
--				DateDiff(Year, M.MOA_Buyer_DOB, M.MOA_Dt)
--			Else
--				DateDiff(Year, M.MOA_Buyer_DOB, M.MOA_Dt) - 1
--			End
--		End N'Age',
--		Case When M.MOA_Type = N'C' Then N2.Nat_Desc Else N1.Nat_Desc End N'Nationality',
--		C.Country_Code N'CountryID',
--		C.Country_Desc N'Country',
--		Case M.MOA_Type When N'I' Then N'I' When N'C' Then N'C' When N'O' Then N'O' Else Null End N'PurchaserTypeID',
--		Case M.MOA_Type When N'I' Then @_Individual When N'C' Then @_Company When N'O' Then @_Others Else Null End N'PurchaserType',
--		Case M.MOA_Intention When N'I' Then N'I' When N'X' Then N'X' When N'S' Then N'S' Else Null End N'PurchaserIntentionID',
--		Case M.MOA_Intention When N'I' Then @_Investment When N'X' Then @_Immigrant When N'S' Then @_SelfUse Else Null End N'PurchaserIntention',
--		Case When M.MOA_Type = N'C' Then M.MOA_BRN Else Buyer_ID End N'ID',
--		M.MOA_Email N'Email', M.MOA_Tel_No N'Tel',
----		Case M.Show_Cash_Rebate When N'Y' Then IsNull((select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE 
----		from 
----		(
----	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
----	FROM AM_ITEM 
----	where M.MOA_NO = AM_NO
----	GROUP BY AM_NO, FM_CP)tmp1 order by SEQ
----		) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)),0)
----		Else 
----		IsNull((select MOA_Price from MOA join (select top(1) am_no , FM_CP_CODE 
----		FROM
----(
----	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
----	FROM AM_ITEM 
----	where M.MOA_NO = AM_NO
----	GROUP BY AM_NO, FM_CP
----)tmp1 
----order by SEQ ) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE))
----		,0) 
----		End 
--			Case M.Show_Cash_Rebate When N'Y' Then 
--				case when APDF.Contract_PRICE is null and APDC.Contract_PRICE is null Then
--				--ISNULL(M.MOA_TOT_PRICE,0)
--				0
--				Else 
--				ISNULL(APDF.Contract_PRice,0) + 
--				Case When(F.RowNumber = 1) or F.RowNumber is null Then 
--					 --ISNULL(APDC.Contract_PRice,0)
--					 0
--					 Else
--					 0
--					END
--				END
--			Else
--				case when APDF.Contract_PRICE is null and APDC.Contract_PRICE is null Then
--				--ISNULL(M.MOA_PRICE,0)
--				0
--				Else
--				ISNULL(APDF.Contract_PRice,0) + 
--				Case When(F.RowNumber =1 ) or F.RowNumber is null Then 
--					 --ISNULL(APDC.Contract_PRice,0)
--					 0
--					 Else
--					 0
--					END
--				END
--			END
--		N'ContractPrice',
--		N'                                                                ' N'Package', 
--		M.Method_Desc N'PaymentMethod',
--		Case When M.MOA_Status = N'C' Then 
--		IsNull((
--		select tmp2.Paid_Amt from 
--		(	Select Project_ID, AM_NO, Sum(IsNull(Paid_Amt, 0)) Paid_Amt
--		From AM_PAYMENT_FU_TRANS
--		Group By Project_ID, AM_NO) tmp2 join  
--		(select top(1) am_no , FM_CP_CODE from 
--		(
--	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ
--		) tmp3 on tmp2.AM_NO = tmp3.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)) 
--		, 0)
--		 Else IsNull((select tmp.Amount from(
--		 Select Project_ID, AM_NO, Sum(Round(IsNull(Amount, 0) / IsNull(Curr_Rate, 0), 0)) Amount
--		From AM_PAYMENT
--		Group By Project_ID, AM_NO) tmp join 
--		(select top(1) am_no , FM_CP_CODE from 
--		(
--	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ
--		) tmp1 on tmp1.AM_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)) 
--		 , 0) End 
--		 N'AmountPaid',
--		NULL N'ChequeNo', A.Agency_Name N'Agency', M.MOA_Ag_ID N'AgentID'
--	Into #RP05
--From MOA M
----Left Outer Join 
----(
----select * from Car_park C where C.MOA_NO in
----(select MOA_NO from CAR_PARK C where C.DEV_CODE not in (select F.DEV_CODE from FLAT_MASTER F where F.PROJECT_ID = C.PROJECT_ID AND F.MOA_NO = C.MOA_NO) and (select count(*) from FLAT_MASTER F where F.PROJECT_ID = C.PROJECT_ID AND F.MOA_NO = C.MOA_NO) <>0  )
----) CP1 on M.PROJECT_ID = CP1.PROJECT_ID and M.MOA_NO = CP1.MOA_NO
--	Left Outer Join (
--		Select ROW_NUMBER() over (PARTITION BY  F.MOA_NO,F.DEV_CODE Order by F.PROJECT_ID, F.FM_PHASE,F.FM_HSE_NO,F.FM_STR_NO,F.STR_CODE,FM_BLK,FM_FLOOR_SEQ,F.FM_FLOOR,F.FM_FLAT )
--		'RowNumber', F.*, D.Dev_Name, B.Block_Desc
--		From VW_RPT_FLAT_MASTER F
--		Left Outer Join Development D On (F.Dev_Code = D.Dev_Code)
--		Left Outer Join Block B On (F.Project_ID = B.Project_ID And F.FM_Blk = B.Block_ID)
--	) F On (M.Project_ID = F.Project_ID And M.MOA_No = F.MOA_NO) 
--	--Left Outer Join (
--	--Select ROW_NUMBER() over (PARTITION BY CP.MOA_NO Order by CAR_PARK_ID ) 'RowNumber', CP.*, D.Dev_Name
--	--From Car_Park CP
--	--Left Outer Join Development D On (CP.Dev_Code = D.Dev_Code)
--	--) CP On (M.Project_ID = CP.Project_ID And M.MOA_No = CP.MOA_No)
--		Left Outer Join (
--	select  PROJECT_ID , DEV_CODE , (select DEV_NAME from DEVELOPMENT where DEV_CODE = CP.DEV_CODE) [DEV_NAME] , MOA_NO , 
--	(select max(CAR_PARK_ID) from CAR_PARK where CP.MOA_NO = MOA_NO and PROJECT_ID = CP.PROJECT_ID) 'CAR_PARK_ID'
--	 From CAR_PARK CP 
--	--where CP.PROJECT_ID =@PROJECTID AND MOA_NO=M.MOA_NO
--	where CAR_PARK_DELETED <> 'Y' and DEV_CODE is not null and MOA_No is not null
--	group by PROJECT_ID ,DEV_CODE , MOA_NO ) CP
--	 On (CP.PROJECT_ID = M.PROJECT_ID and M.MOA_NO = CP.MOA_NO and ( F.DEV_CODE = Cp.DEV_CODE or F.DEV_CODE is null ) )  
--	Left Outer Join AM_PRICE_DETAIL APDF on APDF.FM_CP ='F' and APDF.PROJECT_ID = M.PROJECT_ID and APDF.FM_CP_CODE = F.FM_CODE
--	Left Outer Join (
--		 Select APDC.PROJECT_ID , AM_NO,  DEV_CODE , Sum(Contract_PRICE) 'Contract_PRICE'
--		  FROM 
--		  AM_PRICE_DETAIL APDC JOIN CAR_PARK CP on CP.PROJECT_ID = APDC.PROJECT_ID and CP.CAR_PARK_ID = APDC.FM_CP_CODE AND  APDC.FM_CP='C'  group by APDC.PROJECT_ID,AM_NO,DEV_CODE
--	) APDC 
--	 on (APDC.PROJECT_ID = M.PROJECT_ID and APDC.AM_NO = M.MOA_NO AND (F.DEV_CODE = APDC.DEV_CODE or F.DEV_CODE is null)  AND APDC.DEV_CODE = CP.DEV_CODE) 
----	left outer join  FLAT_MASTER F 
----on M.PROJECT_ID = F.PROJECT_ID and M.MOA_NO = F.MOA_NO
----where F.MOA_NO in 
----(select MOA_NO from CAR_PARK C where C.DEV_CODE not in (select F.DEV_CODE from FLAT_MASTER F where F.PROJECT_ID = M.PROJECT_ID AND F.MOA_NO = M.MOA_NO))

--	Left Outer Join Nationality N1 On (M.Nat_Code = N1.Nat_Code)
--	Left Outer Join Nationality N2 On (M.Director_Nat_Code1 = N2.Nat_Code)
--	Left Outer Join Country C On (M.Country_Code = C.Country_Code)
--	Left Outer Join (
--		Select Project_ID, AM_NO, Sum(IsNull(Paid_Amt, 0)) Paid_Amt
--		From AM_PAYMENT_FU_TRANS
--		Group By Project_ID, AM_NO
--	) T On (M.Project_ID = T.Project_ID And M.MOA_No = T.AM_NO)
--	Left Outer Join (
--		Select Project_ID, AM_NO, Sum(Round(IsNull(Amount, 0) / IsNull(Curr_Rate, 0), 0)) Amount
--		From AM_PAYMENT
--		Group By Project_ID, AM_NO
--	) PY On (M.Project_ID = PY.Project_ID And M.MOA_No = PY.AM_NO)
--	Left Outer Join Agency A On (M.MOA_Agency = A.Agency_Code), Project_Master P
--	Where M.Project_ID = P.Project_ID And M.Project_ID = @ProjectID
--	And (M.MOA_Status = N'C' Or M.MOA_Status = N'O') 
--	--And M.MOA_Deleted <> N'Y' And M.MOA_Intention Is Not Null
--	And (F.Dev_Code Is Not Null Or CP.Dev_Code Is Not Null) And M.MOA_Dt Is Not Null
--	And M.Country_Code Is Not Null And M.MOA_Type Is Not Null
--	-- Begin 20160513 Tommy
--	AND F.DEV_CODE is not null
--	-- End 20160513 Tommy
-- --Begin 20160511 Tommy
-- insert  Into #RP05
-- Select M.Project_ID N'ProjectID', concat (P.PRJ_NAME_CHI,P.PRJ_NAME_ENG) N'ProjectName',
--		ISNULL(CP.Dev_Code,'')  N'PhaseID',
--		ISNULL(CP.Dev_Name,'')  N'Phase',
--		P.Base_Curr_ID N'ProjectCurr', M.MOA_Dt N'Date', M.MOA_No N'AgreementNo', 
--		-- F.Block_Desc N'Block',
--		null N'Block',
--		null N'HouseNo', 
--		null N'Floor', 
--		null N'Flat',
--		null N'GFA', 
--	--	Case When ( F.RowNumber is null) or (F.RowNumber = 1 ) 
--	--	Then 
--	--	--(CP.Car_Park_No)
--	--	(select  (ISNULL(CPNo.CAR_PARK_NO,'')) + char(10)
--	-- From CAR_PARK CPNo
--	--where CPNo.PROJECT_ID =@PROJECTID AND MOA_NO=M.MOA_NO AND ( F.DEV_CODE =CPNo.DEV_CODE or (F.DEV_CODE is NULl AND CPNo.DEV_CODE = CP.DEV_CODE))
--	-- FOR XML PATH(''))
--	--	Else
--	--	 NULL 
--	--	END
--		CP.CAR_PARK_NO
--		 N'CpNo',
--		Case When M.MOA_Type = N'C' Then M.MOA_Co_Name Else ISNULL(M.Buyer_Surname,'') + N' ' + ISNULL(M.Buyer_Given_Name,'') End N'Name',
--		Case When M.MOA_Type = N'C' Then M.Director_Gender1 Else MOA_Buyer_Gender End N'Gender',
--		Case When M.MOA_Type = N'C' Then
--			Case When Month(M.Director_DOB1) < Month(M.MOA_Dt) Or (Month(M.Director_DOB1) = Month(M.MOA_Dt) And Day(M.Director_DOB1) <= Day(M.MOA_Dt)) Then
--				DateDiff(Year, M.Director_DOB1, M.MOA_Dt)
--			Else
--				DateDiff(Year, M.Director_DOB1, M.MOA_Dt) - 1
--			End
--		Else
--			Case When Month(M.MOA_Buyer_DOB) < Month(M.MOA_Dt) Or (Month(M.MOA_Buyer_DOB) = Month(M.MOA_Dt) And Day(M.MOA_Buyer_DOB) <= Day(M.MOA_Dt)) Then
--				DateDiff(Year, M.MOA_Buyer_DOB, M.MOA_Dt)
--			Else
--				DateDiff(Year, M.MOA_Buyer_DOB, M.MOA_Dt) - 1
--			End
--		End N'Age',
--		Case When M.MOA_Type = N'C' Then N2.Nat_Desc Else N1.Nat_Desc End N'Nationality',
--		C.Country_Code N'CountryID',
--		C.Country_Desc N'Country',
--		Case M.MOA_Type When N'I' Then N'I' When N'C' Then N'C' When N'O' Then N'O' Else Null End N'PurchaserTypeID',
--		Case M.MOA_Type When N'I' Then @_Individual When N'C' Then @_Company When N'O' Then @_Others Else Null End N'PurchaserType',
--		Case M.MOA_Intention When N'I' Then N'I' When N'X' Then N'X' When N'S' Then N'S' Else Null End N'PurchaserIntentionID',
--		Case M.MOA_Intention When N'I' Then @_Investment When N'X' Then @_Immigrant When N'S' Then @_SelfUse Else Null End N'PurchaserIntention',
--		Case When M.MOA_Type = N'C' Then M.MOA_BRN Else Buyer_ID End N'ID',
--		M.MOA_Email N'Email', M.MOA_Tel_No N'Tel',
--			Case M.Show_Cash_Rebate When N'Y' Then 
--				case when APDF.Contract_PRICE is null and APDC.Contract_PRICE is null Then
--				0
--				Else 
--				 ISNULL(APDC.Contract_PRice,0) 
				  
--				-- + Case When(F.RowNumber = 1) or F.RowNumber is null Then 
					
--				--	 ISNULL(APDF.Contract_PRice,0)
--				--	 Else
--				--	 0
--				--	END
--				END
--			Else
--				case when APDF.Contract_PRICE is null and APDC.Contract_PRICE is null Then
--				--ISNULL(M.MOA_PRICE,0)
--				0
--				Else
--				ISNULL(APDC.Contract_PRice,0) 
--				--+ 
--				--Case When(F.RowNumber =1 ) or F.RowNumber is null Then 
--				--	 ISNULL(APDF.Contract_PRice,0)
--				--	 Else
--				--	 0
--				--	END
--				END
--			END
--		N'ContractPrice',
--		N'                                                                ' N'Package', 
--		M.Method_Desc N'PaymentMethod',
--		Case When M.MOA_Status = N'C' Then 
--		IsNull((
--		select tmp2.Paid_Amt from 
--		(	Select Project_ID, AM_NO, Sum(IsNull(Paid_Amt, 0)) Paid_Amt
--		From AM_PAYMENT_FU_TRANS
--		Group By Project_ID, AM_NO) tmp2 join  
--		(select top(1) am_no , FM_CP_CODE from 
--		(
--	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ
--		) tmp3 on tmp2.AM_NO = tmp3.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)) 
--		, 0)
--		 Else IsNull((select tmp.Amount from(
--		 Select Project_ID, AM_NO, Sum(Round(IsNull(Amount, 0) / IsNull(Curr_Rate, 0), 0)) Amount
--		From AM_PAYMENT
--		Group By Project_ID, AM_NO) tmp join 
--		(select top(1) am_no , FM_CP_CODE from 
--		(
--	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ
--		) tmp1 on tmp1.AM_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)) 
--		 , 0) End 
--		 N'AmountPaid',
--		NULL N'ChequeNo', A.Agency_Name N'Agency', M.MOA_Ag_ID N'AgentID'
	
--From MOA M
--Left Outer Join (
--	select ROW_NUMBER() over (PARTITION BY  CP.MOA_NO,CP.DEV_CODE  ORDER BY DEV_CODE,HOUSE_NO,STREET_NO,STR_CODE,PARK_LEVEL,CAR_PARK_NO )'RowNumber',
--	 (select DEV_NAME from DEVELOPMENT where DEV_CODE = CP.DEV_CODE) [DEV_NAME] ,
--	 CP.*
--	 From CAR_PARK CP 
--	where CAR_PARK_DELETED <> 'Y' and DEV_CODE is not null and MOA_No is not null) CP
--	 On (CP.PROJECT_ID = M.PROJECT_ID and M.MOA_NO = CP.MOA_NO)
--	Left Outer Join (
--		Select F.*, D.Dev_Name, B.Block_Desc
--		From VW_RPT_FLAT_MASTER F
--		Left Outer Join Development D On (F.Dev_Code = D.Dev_Code)
--		Left Outer Join Block B On (F.Project_ID = B.Project_ID And F.FM_Blk = B.Block_ID)
--	) F On (M.Project_ID = F.Project_ID And M.MOA_No = F.MOA_NO and CP.RowNumber <> NULL) 			
--	Left Outer Join AM_PRICE_DETAIL APDF on APDF.FM_CP ='F' and APDF.PROJECT_ID = M.PROJECT_ID and APDF.FM_CP_CODE = F.FM_CODE
--	Left Outer Join AM_PRICE_DETAIL APDC  on CP.PROJECT_ID = APDC.PROJECT_ID and CP.CAR_PARK_ID = APDC.FM_CP_CODE AND  APDC.FM_CP='C'
--	Left Outer Join Nationality N1 On (M.Nat_Code = N1.Nat_Code)
--	Left Outer Join Nationality N2 On (M.Director_Nat_Code1 = N2.Nat_Code)
--	Left Outer Join Country C On (M.Country_Code = C.Country_Code)
--	Left Outer Join (
--		Select Project_ID, AM_NO, Sum(IsNull(Paid_Amt, 0)) Paid_Amt
--		From AM_PAYMENT_FU_TRANS
--		Group By Project_ID, AM_NO
--	) T On (M.Project_ID = T.Project_ID And M.MOA_No = T.AM_NO)
--	Left Outer Join (
--		Select Project_ID, AM_NO, Sum(Round(IsNull(Amount, 0) / IsNull(Curr_Rate, 0), 0)) Amount
--		From AM_PAYMENT
--		Group By Project_ID, AM_NO
--	) PY On (M.Project_ID = PY.Project_ID And M.MOA_No = PY.AM_NO)
-- 	Left Outer Join Agency A On (M.MOA_Agency = A.Agency_Code), Project_Master P
--	Where M.Project_ID = P.Project_ID And M.Project_ID = @ProjectID
--		And (M.MOA_Status = N'C' Or M.MOA_Status = N'O') 
--		--And M.MOA_Deleted <> N'Y'
--		And (F.Dev_Code Is Not Null Or CP.Dev_Code Is Not Null) And M.MOA_Dt Is Not Null
--		And M.Country_Code Is Not Null And M.MOA_Type Is Not Null-- And M.MOA_Intention Is Not Null
	
-- --ENd 20150511 Tommy


 --ENd 20150513 Tommy'AmountPaid'.'ChequeNo'.

SELECT
		 B.Project_ID N'ProjectID', concat (P.PRJ_NAME_CHI,P.PRJ_NAME_ENG) N'ProjectName',
		Case When FM.FM_CODE Is Not Null Then FM.Dev_Code Else CP.Dev_Code End N'PhaseID',
		Case When FM.FM_CODE Is Not Null Then DF.DEV_NAME Else DC.Dev_Name End N'Phase',
		P.Base_Curr_ID N'ProjectCurr', b.AM_DT N'Date', b.AM_NO N'AgreementNo', 
		ISNULL(BL.Block_Desc, FM.FM_BLK) N'Block',
		FM.FM_Hse_No N'HouseNo', isnull(FM.FM_Floor,FM.FM_STR_NO) N'Floor', isnull(FM.FM_Flat,FM.STR_CODE) N'Flat',
		FM.FM_USABLE_SF N'GFA',
		CP.CAR_PARK_NO
		N'CpNo',
		Case When B.AM_TYPE = N'C' Then ABC.CHI_NAME Else ISNULL(ABR.CHI_NAME,'') + N' ' + ISNULL(ABR.ENG_NAME,'') End N'Name',
		Case When B.AM_TYPE = N'C' Then null Else ABR.GENDER End N'Gender',
		Case When B.AM_TYPE = N'C' Then
			null
		Else
			Case When Month(ABR.DOB) < Month(B.AM_DT) Or (Month(ABR.DOB) = Month(B.AM_DT) And Day(ABR.DOB) <= Day(B.AM_DT)) Then
				DateDiff(Year,ABR.DOB, B.AM_DT)
			Else
				DateDiff(Year, ABR.DOB, B.AM_DT) - 1
			End
		End N'Age',
		Case When B.AM_TYPE = N'C' Then NULL Else N1.NAT_DESC End N'Nationality',
		CC.Country_Code N'CountryID',
		CC.Country_Desc N'Country',
		Case  B.AM_TYPE When N'I' Then N'I' When N'C' Then N'C' When N'O' Then N'O' Else Null End N'PurchaserTypeID',
		Case  B.AM_TYPE When N'I' Then @_Individual When N'C' Then @_Company When N'O' Then @_Others Else Null End N'PurchaserType',
		Case B.AM_INTENTION When N'I' Then N'I' When N'X' Then N'X' When N'S' Then N'S' Else Null End N'PurchaserIntentionID',
		Case B.AM_INTENTION When N'I' Then @_Investment When N'X' Then @_Immigrant When N'S' Then @_SelfUse Else Null End N'PurchaserIntention',
		Case When B.AM_TYPE  = N'C' Then ABC.BUYER_ID Else ABR.BUYER_ID End N'ID',
		C.EMAIL N'Email', ISNULL(C.TEL_NO,ISNULL(C.MOBILE,ISNULL(C.OFF_TEL,''))) N'Tel',
		case when FM.FM_CODE is not null
	Then isnull(APDF.CONTRACT_PRICE,0)
	when cp.CAR_PARK_ID is not null
	Then isnull(APDC.CONTRACT_PRICE,0)
	Else
	0
	END
		N'ContractPrice',
		N'                                                                ' N'Package', 
		0 N'AmountPaid',0 N'ChequeNo',
		B.METHOD_DESC N'PaymentMethod',
		A.Agency_Name N'Agency', B.AGENT_AG_ID N'AgentID'
	INTO #RP05
FROM
	AM_BASE b
	JOIN AM_ITEM i ON b.PROJECT_ID = i.PROJECT_ID AND b.AM_NO = i.AM_NO
	LEFT JOIN AM_CONTACT c ON b.PROJECT_ID = c.PROJECT_ID AND b.AM_NO = c.AM_NO
	LEFT JOIN FLAT_MASTER fm ON i.PROJECT_ID = fm.PROJECT_ID AND fm.FM_CODE = i.FM_CP_CODE AND i.FM_CP = 'F' and fm.FM_DELETED <> 'Y'
	LEFT JOIN CAR_PARK cp ON i.PROJECT_ID = cp.PROJECT_ID AND cp.CAR_PARK_ID = i.FM_CP_CODE AND i.FM_CP = 'C'  and cp.CAR_PARK_DELETED <> 'Y'
	Left Outer Join AM_PRICE_DETAIL APDF on APDF.FM_CP ='F' and APDF.PROJECT_ID = b.PROJECT_ID and APDF.FM_CP_CODE = FM.FM_CODE
	Left Outer Join AM_PRICE_DETAIL APDC  on APDC.FM_CP='C' AND b.PROJECT_ID = APDC.PROJECT_ID and CP.CAR_PARK_ID = APDC.FM_CP_CODE 
	Left Outer Join AM_BUYER ABR on ABR.AM_NO = b.AM_NO and ABR.PROJECT_ID = b.PROJECT_ID and ABR.BUYER_SEQ =1 and ABR.BUYER_TYPE = 'P'    
	Left Outer Join AM_BUYER ABC on ABC.AM_NO = b.AM_NO and ABC.PROJECT_ID = b.PROJECT_ID and ABC.BUYER_SEQ =1 and ABC.BUYER_TYPE = 'D'    
	Left Outer Join Nationality N1 On (N1.Nat_Code = ABR.BUYER_NAT)
	Left Outer Join Nationality N2 On (N2.Nat_Code = ABC.BUYER_NAT)
	Left Outer Join Country CC On (C.Country_Code = CC.Country_Code)
	Left Outer Join DEVELOPMENT DF on FM.DEV_CODE = DF.DEV_CODE 
	Left Outer Join DEVELOPMENT DC on CP.DEV_CODE = DC.DEV_CODE 
	left Outer join BLOCK BL on Bl.PROJECT_ID = FM.PROJECT_ID and Bl.PROJECT_ID = FM.FM_BLK
	Left Outer Join (
		Select Project_ID, AM_NO, Sum(IsNull(Paid_Amt, 0)) Paid_Amt
		From AM_PAYMENT_FU_TRANS
		Group By Project_ID, AM_NO
	) T On (B.Project_ID = T.Project_ID And B.AM_NO = T.AM_NO)
	Left Outer Join (
		Select Project_ID, AM_NO, Sum(Round(IsNull(Amount, 0) / IsNull(Curr_Rate, 0), 0)) Amount
		From AM_PAYMENT
		Group By Project_ID, AM_NO
	) PY On (B.Project_ID = PY.Project_ID And B.AM_NO = PY.AM_NO)
 	Left Outer Join Agency A On (B.AGENCY = A.Agency_Code)
	Inner Join Project_Master P on p.PROJECT_ID = b.PROJECT_ID 
	Where B.Project_ID = P.Project_ID And B.Project_ID = @ProjectID
		And (B.AM_STATUS = N'C' Or B.AM_STATUS = N'O') 
		--And M.MOA_Deleted <> N'Y'
		And (FM.Dev_Code Is Not Null Or CP.Dev_Code Is Not Null) And B.AM_DT Is Not Null
		And CC.Country_Code Is Not Null And B.AM_TYPE Is Not Null And B.AM_INTENTION Is Not Null
	






	Select @Condition = N''

	If @Phase Is Not Null And @Phase <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'PhaseID = @Phase'
	End

	If @DateFrom Is Not Null And @DateFrom <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'[Date] >= Convert(DateTime, @DateFrom, 105)'
	End

	If @DateTo Is Not Null And @DateTo <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'[Date] < DateAdd(Day, 1, Convert(DateTime, @DateTo, 105))'
	End

	If @Country Is Not Null And @Country <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'CountryID = @Country'
	End

	If @PurchaserType Is Not Null And @PurchaserType <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'PurchaserTypeID = @PurchaserType'
	End

	If @PurchaseIntention Is Not Null And @PurchaseIntention <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'PurchaserIntentionID = @PurchaseIntention'
	End

	If @Condition <> N''
	Begin
		Declare @Statement NVarChar(Max)	

		Select @Statement = N'Delete From #RP05 Where Not (' + @Condition + N')'
		Exec SP_ExecuteSql @Statement, N'@Phase NVarChar(6), @DateFrom NVarChar(10), @DateTo NVarChar(10), @Country NVarChar(6), @PurchaserType NVarChar(1), @PurchaseIntention NVarChar(1)', @Phase, @DateFrom, @DateTo, @Country, @PurchaserType, @PurchaseIntention
	End

	Declare MOA_Cursor Cursor For
	Select AgreementNo
	From #RP05

	Open MOA_Cursor

	Fetch Next From MOA_Cursor
	Into @MOA_No

	While @@Fetch_Status = 0
	Begin
		Declare @F_Seq Int
		Declare @Name Nvarchar(101)
		Declare @Gender NChar(1)
		Declare @Nationality1 NVarchar(50)
		Declare @Nationality2 NVarchar(50)
		Declare @P_Type NVarchar(100)
		Declare @Identity_No1 NVarchar(30)
		Declare @Identity_No2 NVarchar(30)
		Declare @Email NVarchar(50)
		Declare @Phone_No NVarchar(20)
		Declare @CO_Name NVarchar(50)
		
		--Select
		--	@F_Seq = MF.FORMAL_SEQ, 
		--	@Name = ISNULL(MF.SURNAME,'') + ' ' + ISNULL(MF.GIVEN_NAME,''),
		--	@Gender = MF.GENDER,
		--	@Nationality1 = (SELECT N.NAT_DESC FROM NATIONALITY N WHERE N.NAT_CODE = MF.NAT_CODE),
		--	@Nationality2 = (SELECT N.NAT_DESC FROM NATIONALITY N WHERE N.NAT_CODE = MF.DIRECTOR_NAT_CODE1),
		--	@P_Type = MF.TYPE,
		--	@Identity_No1 = MF.BUYER_ID,
		--	@Identity_No2 = MF.BRN,
		--	@Email = MF.EMAIL,
		--	@Phone_No = MF.TEL_NO,
		--	@CO_Name = MF.CO_NAME
		--From
		--	MOA M
		--	Left Join MOA_FORMAL MF ON M.PROJECT_ID = MF.PROJECT_ID And M.MOA_NO = MF.MOA_NO And MF.FORMAL_STATUS = 'C'
		--Where
		--	M.MOA_NO = @MOA_No

		--If @F_Seq is not null
		--Begin
		--	If @P_Type = 'C'
		--	Begin
		--		Update #RP05
		--		Set Name = @CO_Name,
		--			Gender = @Gender,
		--			Nationality = @Nationality2,
		--			PurchaserTypeID = @P_Type,
		--			PurchaserType = Case @P_Type When N'I' Then @_Individual When N'C' Then @_Company When N'O' Then @_Others Else Null End,
		--			ID = @Identity_No2,
		--			EMail = @Email,
		--			Tel = @Phone_No
		--		Where
		--			AgreementNo = @MOA_No								
		--	End
		--	Else
		--	Begin
		--		Update #RP05
		--		Set Name = @Name,
		--			Gender = @Gender,
		--			Nationality = @Nationality1,
		--			PurchaserTypeID = @P_Type,
		--			PurchaserType = Case @P_Type When N'I' Then @_Individual When N'C' Then @_Company When N'O' Then @_Others Else Null End,
		--			ID = @Identity_No1,
		--			EMail = @Email,
		--			Tel = @Phone_No
		--		Where
		--			AgreementNo = @MOA_No											
		--	End
		--End


		Declare @PackageID NVarChar(6)
		Declare @Packages NVarChar(256)

		Select @Packages = N''
		
	Declare FM_Cursor Cursor For
	Select concat (PhaseID,'/',isnull((SELECT BLOCK_ID FROM BLOCK WHERE  BLOCK_ID= BLOCK  and @ProjectID = PROJECT_ID),'NIL'),'/',case when HOUSENO is null then Floor else 'NIL' END
	,'/', case when HOUSENO is null then Flat else 'NIL'END
	,'/', isnull(HOUSENO,'NIL')
	,'/', case when HOUSENO is null then 'NIL' else Floor END
	,'/',case when HOUSENO is null then 'NIL' else Flat END)
	From #RP05
	where AgreementNo = @MOA_No
	Open FM_Cursor

	

	Fetch Next From FM_Cursor
	Into @FM_CODE
	


	While @@Fetch_Status = 0
		Begin

		Declare Package_Cursor Cursor For
		Select Package_ID
		From AM_PACKAGES
		Where Project_ID = @ProjectID And AM_NO = @MOA_No and FM_CODE = @FM_CODE
		Order By Package_ID

		Open Package_Cursor

		Fetch Next From Package_Cursor
		Into @PackageID

		While @@Fetch_Status = 0
		Begin
			If @Packages <> N''
			Begin
				Select @Packages = @Packages + N', '
			End

			Select @Packages = @Packages + @PackageID
		
			Fetch Next From Package_Cursor
			Into @PackageID
		End
	
		Close Package_Cursor
		Deallocate Package_Cursor

		Update #RP05
		Set Package = Left(@Packages, 64)
		Where AgreementNo = @MOA_No and concat (PhaseID,'/',isnull((SELECT BLOCK_ID FROM BLOCK WHERE  BLOCK_ID= BLOCK  and @ProjectID = PROJECT_ID),'NIL'),'/',case when HOUSENO is null then FLOOR else 'NIL' END
	,'/', case when HOUSENO is null then FLAT else 'NIL'END
	,'/',isnull(HOUSENO,'NIL')
	,'/', case when HOUSENO is null then 'NIL' else FLOOR END
	,'/',case when HOUSENO is null then 'NIL' else FLAT END) = @FM_CODE
			select @Packages=''
		select @FM_CODE =''
	Fetch Next From FM_Cursor
			Into @FM_CODE
		
		End
		Close FM_Cursor
		Deallocate FM_Cursor

		Fetch Next From MOA_Cursor
		Into @MOA_No
	End

	Close MOA_Cursor
	Deallocate MOA_Cursor


	Select ProjectID, ProjectName, Phase, ProjectCurr, CONVERT(DATE,Date,105)[DATE], AgreementNo, Block,
		HouseNo, [Floor], Flat, GFA, CpNo, [Name], Gender, Age, Nationality,
		Country, PurchaserType, PurchaserIntention, [ID], Email, Tel, ContractPrice,
		Package, PaymentMethod, AmountPaid, ChequeNo, Agency, AgentID,
		Case When @DateFrom Is Null Or @DateFrom = N'' Then
			Null
		Else
			Convert(DateTime, @DateFrom, 105)
		End N'FromDate',
		Case When @DateTo Is Null Or @DateTo = N'' Then
			Null
		Else
			Convert(DateTime, @DateTo, 105)
		End N'ToDate'
	From #RP05
	Order By Phase, CONVERT(DATE,Date,121), AgreementNo , CpNo ,BLOCK,FLOOR,FLAT
Return
GO
/****** Object:  StoredProcedure [dbo].[RP06]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[RP06]
(
	@ProjectID NVarChar(6),
	@Phase NVarChar(6),
	@DateFrom NVarChar(10),
	@DateTo NVarChar(10),
	@Block NVarChar(6)
)
 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	

	Declare @Condition NVarChar(Max)
	Declare @MOA_No NVarChar(20)
	Declare @FM_CODE nvarchar (200)

	Select M.Project_ID N'ProjectID', concat(p.prj_name_chi,p.PRJ_NAME_ENG) N'ProjectName', F.Dev_Code N'PhaseID', F.Dev_Name N'Phase',
		P.Base_Curr_ID N'ProjectCurr', F.FM_Blk N'BlockID', 
		-- F.Block_Desc N'U_Block',
		ISNULL(F.Block_Desc, F.FM_BLK) N'U_Block',
		F.FM_Hse_No N'U_HouseNo', F.FM_Floor_Seq N'U_FloorSeq', isnull(F.FM_Floor ,F.FM_STR_NO)N'U_Floor',
		isnull(F.FM_Flat,f.STR_CODE) N'U_Flat', F.fm_gr_area_sf N'U_GFA', F.fm_usable_sf N'U_NFA', F.FM_List_Price N'U_ListPrice',
		-- Begin 20160506 Tommy
--		Case M.Show_Cash_Rebate When N'Y' Then IsNull((select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE 
--		from 
--		(
--		SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ 
--		 ) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)),0)

--		 Else (select MOA_Price from MOA join (select top(1) am_no , FM_CP_CODE from 
--		 (
--		 SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ 
--		  ) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)) 
--		  End - IsNull(CP.Park_List_Price, 0) 
Case M.Show_Cash_Rebate When N'Y' Then ISNULL(APDF.CONTRACT_PRICE,0)
Else ISNULL(APDF.CONTRACT_PRICE,0) END

		  -- END 20160506 Tommy
		  N'U_ContractPrice',
		  -- Begin 20160506 Tommy
--		Case
--			When F.fm_gr_area_sf Is Null Or F.fm_gr_area_sf = 0 Then 0
--			Else (Case M.Show_Cash_Rebate When N'Y' 
--			Then IsNull((select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE from 
--			(
--			SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ 
--			) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)),0)
--			Else (select MOA_Price from MOA join (select top(1) am_no , FM_CP_CODE from 
--			( 
--			SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ   
--			) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)) End - IsNull(CP.Park_List_Price, 0)) / F.FM_USABLE_SF
--		End 
Case
			When F.fm_gr_area_sf Is Null Or F.fm_gr_area_sf = 0 Then 0
			Else (
			Case M.Show_Cash_Rebate When N'Y' 
			Then ISNULL(APDF.Contract_Price,0)
			Else
			ISNULL(APDF.Contract_Price,0)
			END
			/ F.FM_USABLE_SF
			)
			END

		  -- END 20160506 Tommy
		N'U_ContractPriceAvg',
		(select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE from 
		(
		SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	where M.MOA_NO = AM_NO
	GROUP BY AM_NO, FM_CP
)tmp1 
order by SEQ 
		 ) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)) - IsNull(CP.Park_List_Price, 0) N'U_NetPrice',
		Case
			When F.FM_USABLE_SF Is Null Or F.FM_USABLE_SF = 0 Then 0
			Else ((select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE from 
			(
			SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	where M.MOA_NO = AM_NO
	GROUP BY AM_NO, FM_CP
)tmp1 
order by SEQ 
			 ) tmp on moa.MOA_NO = tmp.AM_NO and(f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE))- IsNull(CP.Park_List_Price, 0)) / F.FM_USABLE_SF
		End N'U_NetPriceAvg',
			-- Begin 20160506 Tommy
		--CP.Car_Park_No
				Case When ( F.RowNumber is null) or (F.RowNumber = 1 ) 
		Then 
		(select  (ISNULL(CP.Car_Park_No,'')) + char(10)
	 From CAR_PARK CP
	where CP.PROJECT_ID =@PROJECTID AND MOA_NO=M.MOA_NO AND (F.DEV_CODE =CP.DEV_CODE or F.DEV_CODE is NULL )
	order by CAR_PARK_NO
	 FOR XML PATH(''))
		Else NULL 
		END
		 N'CP_No', 

		(Select Count(*) from CAR_PARK C where PROJECT_ID = @ProjectID and MOA_NO = M.MOA_NO 
		AND (F.DEV_CODE =C.DEV_CODE or F.DEV_CODE is NULL ) AND (F.RowNumber = 1 or F.RowNumber is null)
		AND CAR_PARK_DELETED <>'Y'
		) N'NumofCP',

		case WHEN F.RowNumber = 1 or F.RowNumber is null
		Then
		isnull(APDC.CONTRACT_PRICE,0)
		Else
		NULL
		END
		--CP.Park_List_Price
		-- End 20160506 Tommy 
		N'CP_ContractPrice',
		N'                                                                ' N'Package_Type',
		PK.Price_Adjust N'Package_Price', PK.Internal_Cost N'Package_InternalCost',

--		Case M.Show_Cash_Rebate When N'Y' Then IsNull((select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE from 
--		(
--		SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ 
--		) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)),0)
--		Else IsNull((select MOA_Price from MOA join (select top(1) am_no , FM_CP_CODE from 
--		(SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ 
--		) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)),0) End
Case M.Show_Cash_Rebate When N'Y' Then (
Case When F.RowNumber = 1 or F.RowNumber is null Then 
IsNull(APDF.Contract_PRICE,0) + IsNull(APDC.Contract_PRICE,0)
Else
IsNull(APDF.Contract_PRICE,0) 
END)
Else
(
Case When F.RowNumber = 1 or F.RowNumber is null Then 
IsNull(APDF.Contract_PRICE,0) + IsNull(APDC.Contract_PRICE,0)
Else
IsNull(APDF.Contract_PRICE,0) 
END
)
END
		 N'TotalContractPrice',
		IsNull((select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE from 
		(
		SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	where M.MOA_NO = AM_NO
	GROUP BY AM_NO, FM_CP
)tmp1 
order by SEQ 
		) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)),0) N'TotalNetPrice', M.MOA_Dt N'Date', M.MOA_No N'AgreementNo',
		M.Method_Code N'PaymentMethod', 
		--CP.Park_Level 
			Case When ( F.RowNumber is null) or (F.RowNumber = 1 ) 
		Then 
		(select  (ISNULL(CP.PARK_LEVEL,'')) + char(10)
	 From CAR_PARK CP
	where CP.PROJECT_ID =@PROJECTID AND MOA_NO=M.MOA_NO AND (F.DEV_CODE = NULl or F.DEV_CODE =CP.DEV_CODE)
	order by CAR_PARK_NO
	 FOR XML PATH(''))
		Else NULL 
		END
		N'CP_Level'

	Into #RP06
	From MOA M
	--Left Outer Join (
	--	Select F.*, D.Dev_Name, B.Block_Desc
	--	--From Flat_Master F
	--	From VW_RPT_FLAT_MASTER F
	--	Left Outer Join Development D On (F.Dev_Code = D.Dev_Code)
	--	Left Outer Join Block B On (F.Project_ID = B.Project_ID And F.FM_Blk = B.Block_ID)
	--) F On (M.Project_ID = F.Project_ID And M.MOA_No = F.MOA_No)
	--Left Outer Join Car_Park CP On (M.Project_ID = CP.Project_ID And M.MOA_No = CP.MOA_No)
	--Left Outer Join AM_PRICE_DETAIL APDF on APDF.FM_CP ='F' and APDF.PROJECT_ID = M.PROJECT_ID and APDF.FM_CP_CODE = F.FM_CODE
	--Left Outer Join AM_PRICE_DETAIL APDC on APDC.FM_CP ='C' and APDC.PROJECT_ID = M.PROJECT_ID and APDC.FM_CP_CODE = CP.CAR_PARK_ID
	Left Outer Join (
		Select ROW_NUMBER() over (PARTITION BY  F.MOA_NO,F.DEV_CODE Order by F.PROJECT_ID, F.FM_PHASE,F.FM_HSE_NO,F.FM_STR_NO,F.STR_CODE,FM_BLK,FM_FLOOR_SEQ,F.FM_FLOOR,F.FM_FLAT ) 
		'RowNumber', F.*, D.Dev_Name, B.Block_Desc
		From VW_RPT_FLAT_MASTER F
		Left Outer Join Development D On (F.Dev_Code = D.Dev_Code)
		Left Outer Join Block B On (F.Project_ID = B.Project_ID And F.FM_Blk = B.Block_ID)
	) F On (M.Project_ID = F.Project_ID And M.MOA_No = F.MOA_No) 
		Left Outer Join (
	select  PROJECT_ID , DEV_CODE , (select DEV_NAME from DEVELOPMENT where DEV_CODE = CP.DEV_CODE) [DEV_NAME] , MOA_NO , 
	(select TOP(1) (CAR_PARK_ID) from CAR_PARK where CP.MOA_NO = MOA_NO and PROJECT_ID = CP.PROJECT_ID ORDER BY CAR_PARK_PHASE,HOUSE_NO,STREET_NO,STR_CODE,PARK_LEVEL,CAR_PARK_NO ) 'CAR_PARK_ID',
	 sum(PARK_LIST_PRICE) 'PARK_LIST_PRICE'
	 From CAR_PARK CP 
	where CAR_PARK_DELETED <> 'Y' and DEV_CODE is not null and MOA_No is not null
	group by PROJECT_ID ,DEV_CODE , MOA_NO ) CP
	 On (CP.PROJECT_ID = M.PROJECT_ID and M.MOA_NO = CP.MOA_NO and ( F.DEV_CODE = Cp.DEV_CODE or F.DEV_CODE is null ) )  
	Left Outer Join AM_PRICE_DETAIL APDF on APDF.FM_CP ='F' and APDF.PROJECT_ID = M.PROJECT_ID and APDF.FM_CP_CODE = F.FM_CODE
		 and M.MOA_NO = APDF.AM_NO
	Left Outer Join (
		 Select APDC.PROJECT_ID , AM_NO,  DEV_CODE , Sum(Contract_PRICE) 'Contract_PRICE'
		  FROM 
		  AM_PRICE_DETAIL APDC JOIN CAR_PARK CP on CP.PROJECT_ID = APDC.PROJECT_ID and CP.CAR_PARK_ID = APDC.FM_CP_CODE AND  APDC.FM_CP='C'  group by APDC.PROJECT_ID,AM_NO,DEV_CODE
	) APDC 
	 on (APDC.PROJECT_ID = M.PROJECT_ID and APDC.AM_NO = M.MOA_NO AND (F.DEV_CODE = APDC.DEV_CODE or F.DEV_CODE is null)) 
	
	Left Outer Join (
		Select Project_ID,AM_no, FM_CODE , Sum(IsNull(Price_Adjust, 0)) Price_Adjust, Sum(IsNull(Internal_Cost, 0)) Internal_Cost
		From AM_PACKAGES
		Group By Project_ID ,AM_NO,FM_CODE
	) PK On (M.Project_ID = PK.Project_ID And M.MOA_No = PK.AM_NO and F.FM_CODE = pk.FM_CODE), Project_Master P
	Where M.Project_ID = P.Project_ID And M.Project_ID = @ProjectID
		And (M.MOA_Status = N'C' Or M.MOA_Status = N'O') 
		--And M.MOA_Deleted <> N'Y'
		And F.Dev_Code Is Not Null And M.MOA_Dt Is Not Null

	Select @Condition = N''

	If @Phase Is Not Null And @Phase <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'PhaseID = @Phase'
	End

	If @DateFrom Is Not Null And @DateFrom <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'[Date] >= Convert(DateTime, @DateFrom, 105)'
	End

	If @DateTo Is Not Null And @DateTo <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'[Date] < DateAdd(Day, 1, Convert(DateTime, @DateTo, 105))'
	End

	If @Block Is Not Null And @Block <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'BlockID Is Not Null And BlockID = @Block'
	End

	If @Condition <> N''
	Begin
		Declare @Statement NVarChar(Max)

		Select @Statement = N'Delete From #RP06 Where Not (' + @Condition + N')'
		Exec SP_ExecuteSql @Statement, N'@Phase NVarChar(6), @DateFrom NVarChar(10), @DateTo NVarChar(10), @Block NVarChar(6)', @Phase, @DateFrom, @DateTo, @Block
	End

	Declare MOA_Cursor Cursor For
	Select AgreementNo
	From #RP06

	Open MOA_Cursor

	Fetch Next From MOA_Cursor
	Into @MOA_No

	While @@Fetch_Status = 0
	Begin
		Declare @PackageID NVarChar(6)
		Declare @Packages NVarChar(256)

		Select @Packages = N''
		
	Declare FM_Cursor Cursor For
	Select concat (PhaseID,'/',isnull((SELECT BLOCK_ID FROM BLOCK WHERE  BLOCK_DESC= U_BLOCK  and @ProjectID = PROJECT_ID),'NIL'),'/',case when U_HouseNo is null then U_Floor else 'NIL' END
	,'/', case when U_HouseNo is null then U_Flat else 'NIL'END
	,'/', isnull(U_HouseNo,'NIL')
	,'/', case when U_HouseNo is null then 'NIL' else U_Floor END
	,'/',case when U_HouseNo is null then 'NIL' else U_Flat END)
	From #RP06
	where AgreementNo = @MOA_No
	Open FM_Cursor

	

	Fetch Next From FM_Cursor
	Into @FM_CODE


	While @@Fetch_Status = 0
		Begin

		Declare Package_Cursor Cursor For
		Select Package_ID
		From AM_PACKAGES
		Where Project_ID = @ProjectID And AM_NO = @MOA_No and FM_CODE = @FM_CODE
		Order By Package_ID

		Open Package_Cursor

		Fetch Next From Package_Cursor
		Into @PackageID

		While @@Fetch_Status = 0
		Begin
			If @Packages <> N''
			Begin
				Select @Packages = @Packages + N', '
			End

			Select @Packages = @Packages + @PackageID
		
			Fetch Next From Package_Cursor
			Into @PackageID
		End
	
		Close Package_Cursor
		Deallocate Package_Cursor

		Update #RP06
		Set Package_Type = Left(@Packages, 64)
		Where AgreementNo = @MOA_No and concat (PhaseID,'/',isnull((SELECT BLOCK_ID FROM BLOCK WHERE  BLOCK_DESC= U_BLOCK  and @ProjectID = PROJECT_ID ),'NIL'),'/',case when U_HouseNo is null then U_Floor else 'NIL' END
	,'/', case when U_HouseNo is null then U_Flat else 'NIL'END
	,'/',isnull(U_HouseNo,'NIL')
	,'/', case when U_HouseNo is null then 'NIL' else U_Floor END
	,'/',case when U_HouseNo is null then 'NIL' else U_Flat END) = @FM_CODE
			select @Packages=''
		select @FM_CODE =''
	Fetch Next From FM_Cursor
			Into @FM_CODE
		
		End
		Close FM_Cursor
		Deallocate FM_Cursor

		Fetch Next From MOA_Cursor
		Into @MOA_No
	End

	Close MOA_Cursor
	Deallocate MOA_Cursor

	Select ProjectID, ProjectName, Phase, ProjectCurr, U_Block, U_HouseNo, U_Floor,
		U_Flat, U_GFA, U_NFA, isnull(U_ListPrice,0) U_ListPrice, isnull(U_ContractPrice,0) U_ContractPrice, isnull(U_ContractPriceAvg,0) U_ContractPriceAvg,
		isnull(U_NetPrice,0) U_NetPrice, isnull(U_NetPriceAvg,0) U_NetPriceAvg, CP_No, isnull(NumofCP,0) [NumofCP] , isnull(CP_ContractPrice,0) CP_ContractPrice, Package_Type,
		isnull(Package_Price,0) Package_Price, isnull(Package_InternalCost,0) Package_InternalCost, isnull(TotalContractPrice,0) TotalContractPrice, isnull(TotalNetPrice,0) TotalNetPrice,
		[Date], PaymentMethod, CP_Level,
		Case When @DateFrom Is Null Or @DateFrom = N'' Then
			Null
		Else
			Cast(Convert(DateTime, @DateFrom, 105) as nvarchar(11))
		End N'FromDate',
		Case When @DateTo Is Null Or @DateTo = N'' Then
			Null
		Else
			Cast(Convert(DateTime, @DateTo, 105) as nvarchar(11))
		End N'ToDate'
	From #RP06
	Order By Phase, (Case When U_Block Is Null Then 0 Else 1 End) Desc, U_Block,
		(Case When U_HouseNo Is Null Then 0 Else 1 End) Desc, U_HouseNo,
		U_FloorSeq ASC, (Case When U_Flat Is Null Then 0 Else 1 End) Desc, U_Flat, CP_LEVEL DESC ,CP_NO ASC

		------------------------------------- SUMMARY 1 ----------------------------------------------
	Select P.Package_ID N'PackageName', Sum(P.Qty) N'TotalQty',
		Sum(IsNull(P.Price_Adjust, 0)) N'TotalPrice', Sum(IsNull(P.Internal_Cost, 0)) N'TotalInternalCost'
	From AM_PACKAGES P
	Where P.Project_ID = @ProjectID And P.AM_NO In (
		Select Distinct AgreementNo
		From #RP06
		Where AgreementNo Is Not Null
	)
	Group By P.Package_ID
	Order By P.Package_ID


	------------------------------------- SUMMARY 2 ----------------------------------------------
	Select R.PaymentMethod N'PaymentCode', ISNULL(P.METHOD_DESC_ENG, P.METHOD_DESC_CHI) N'PaymentDescription', R.PaymentQty N'PaymentQty'
	From (
		Select ProjectID, PaymentMethod, Count(PaymentMethod) N'PaymentQty'
		From #RP06
		Where ProjectID = @ProjectID And PaymentMethod Is Not Null
		Group By ProjectID, PaymentMethod
	) R
	Left Outer Join Prj_Pay_Method P On (R.ProjectID = P.Project_ID And R.PaymentMethod = P.Method_Code)
	Where R.ProjectID = @ProjectID
	Order By R.PaymentMethod
Return
GO
/****** Object:  StoredProcedure [dbo].[RP07]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[RP07]
(
	@ProjectID NVarChar(6),
	@Phase NVarChar(6),
	@DateFrom NVarChar(10),
	@DateTo NVarChar(10),
	@Block NVarChar(6)
)
 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	
	
	Declare @Condition NVarChar(Max)

	Select M.Project_ID N'ProjectID', F.Dev_Code N'PhaseID', F.FM_Blk N'BlockID',
		F.FM_Hse_No N'HouseNo', F.FM_Flat N'Flat', F.fm_gr_area_sf N'GFA', F.fm_usable_sf N'NFA', 
		F.FM_List_Price N'ListPrice',

--		Case M.Show_Cash_Rebate When N'Y' Then (select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE from 
--		(
--			SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ 
--		) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE))
--		 Else 
--		 (select MOA_Price from MOA join (select top(1) am_no , FM_CP_CODE from 
--		 (	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
--	FROM AM_ITEM 
--	where M.MOA_NO = AM_NO
--	GROUP BY AM_NO, FM_CP
--)tmp1 
--order by SEQ 
--		   ) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)) End - IsNull(CP.Park_List_Price, 0) 
		 Case M.Show_Cash_Rebate When N'Y' Then 
				case when APDF.Contract_PRICE is null 
				--and APDC.Contract_PRICE is null
				 Then
				--ISNULL(M.MOA_TOT_PRICE,0)
				0
				Else 
				ISNULL(APDF.Contract_PRice,0)
				END			
			Else
				case when APDF.Contract_PRICE is null 
				--and APDC.Contract_PRICE is null 
				Then
				--ISNULL(M.MOA_PRICE,0)
				0
				Else
				ISNULL(APDF.Contract_PRice,0)
				END
				--- IsNull(CP.Park_List_Price, 0) 
			END		   
		   N'ContractPrice',

		(select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE from 
		(
			SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	where M.MOA_NO = AM_NO
	GROUP BY AM_NO, FM_CP
)tmp1 
order by SEQ 
		) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE 
		--or cp.CAR_PARK_ID = FM_CP_CODE)
		))
		--)- IsNull(CP.Park_List_Price, 0) 
		N'NetPrice', 
		M.MOA_Dt N'Date'
	Into #RP07
	From MOA M
	--Left Outer Join Flat_Master F On (M.Project_ID = F.Project_ID And M.MOA_No = F.MOA_No)
	Left Outer Join VW_RPT_Flat_Master F On (M.Project_ID = F.Project_ID And M.MOA_No = F.MOA_No)
	-- Begin 20160506 Tommy
	--Left Outer Join Car_Park CP On (M.Project_ID = CP.Project_ID And M.MOA_No = CP.MOA_No)
	--Left Outer Join AM_PRICE_DETAIL APDF on APDF.FM_CP ='F' and APDF.PROJECT_ID = M.PROJECT_ID and APDF.FM_CP_CODE = F.FM_CODE
	Left Outer Join ( Select APDF.PROJECT_ID , AM_NO,  DEV_CODE , Sum(Contract_PRICE) 'Contract_PRICE' , FM_CP_CODE FROM  AM_PRICE_DETAIL APDF  JOin FLAT_MASTER FM on FM.PROJECT_ID = APDF.PROJECT_ID AND FM.FM_CODE = APDF.FM_CP_CODE AND  APDF.FM_CP='F'  group by APDF.PROJECT_ID,AM_NO,DEV_CODE,FM_CP_CODE ) APDF on  APDF.PROJECT_ID = f.PROJECT_ID and APDF.FM_CP_CODE = F.FM_CODE and F.DEV_CODE = APDF.DEV_CODE 
	--Left Outer Join AM_PRICE_DETAIL APDC on APDC.FM_CP ='C' and APDC.PROJECT_ID = M.PROJECT_ID and APDC.FM_CP_CODE = CP.CAR_PARK_ID
	-- END 20160506 Tommy
	Where M.Project_ID = @ProjectID
		And (M.MOA_Status = N'C' Or M.MOA_Status = N'O')
		 --And M.MOA_Deleted <> N'Y'
		And F.Dev_Code Is Not Null And M.MOA_Dt Is Not Null

	Select @Condition = N''

	If @Phase Is Not Null And @Phase <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'PhaseID = @Phase'
	End

	If @DateFrom Is Not Null And @DateFrom <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'[Date] >= Convert(DateTime, @DateFrom, 105)'
	End

	If @DateTo Is Not Null And @DateTo <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'[Date] < DateAdd(Day, 1, Convert(DateTime, @DateTo, 105))'
	End

	If @Block Is Not Null And @Block <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'BlockID Is Not Null And BlockID = @Block'
	End

	If @Condition <> N''
	Begin
		Declare @Statement NVarChar(Max)

		Select @Statement = N'Delete From #RP07 Where Not (' + @Condition + N')'
		Exec SP_ExecuteSql @Statement, N'@Phase NVarChar(6), @DateFrom NVarChar(10), @DateTo NVarChar(10), @Block NVarChar(6)', @Phase, @DateFrom, @DateTo, @Block
	End

	Select R.ProjectID N'ProjectID', concat (P.PRJ_NAME_CHI,P.PRJ_NAME_ENG) N'ProjectName', R.Dev_Name N'Phase',
		P.Base_Curr_ID N'ProjectCurr', 
		ISNULL(R.Block_Desc, R.BlockID) N'Block', 
		R.HouseNo N'HouseNo',
		R.Flat N'Flat', R.UnitNo N'UnitNo', R.GFA N'GFA', R.NFA N'NFA', R.ListPrice N'ListPrice',
		R.ContractPrice N'ContractPrice',
		Case
			When R.NFA Is Null Or R.NFA = 0 Then 0
			Else (R.ContractPrice / R.NFA)
		End N'ContractPriceAvg',
		R.NetPrice N'NetPrice',
		Case
			When R.NFA Is Null Or R.NFA = 0 Then 0
			Else (R.NetPrice / R.NFA)
		End N'NetPriceAvg',
		Case When @DateFrom Is Null Or @DateFrom = N'' Then
			Null
		Else
			Convert(DateTime, @DateFrom, 105)
		End N'FromDate',
		Case When @DateTo Is Null Or @DateTo = N'' Then
			Null
		Else
			Convert(DateTime, @DateTo, 105)
		End N'ToDate'
	From (
		Select R.*, D.Dev_Name, B.Block_Desc
		From (
			Select ProjectID, PhaseID, BlockID, HouseNo, Flat, Count(ProjectID) N'UnitNo',
				Sum(IsNull(GFA, 0)) N'GFA', Sum(IsNull(NFA, 0)) N'NFA',
				Sum(IsNull(ListPrice, 0)) N'ListPrice', Sum(IsNull(ContractPrice, 0)) N'ContractPrice',
				Sum(IsNull(NetPrice, 0)) N'NetPrice'
			From #RP07
			Group By ProjectID, PhaseID, BlockID, HouseNo, Flat
		) R
		Left outer Join Development D On (R.PhaseID = D.Dev_Code)
		Left Outer Join Block B On (R.ProjectID = B.Project_ID And R.BlockID = B.Block_ID)
	) R, Project_Master P
	Where R.ProjectID = P.Project_ID
	Order By R.Dev_Name, (Case When R.Block_Desc Is Null Then 0 Else 1 End) Desc, R.Block_Desc,
		(Case When R.HouseNo Is Null Then 0 Else 1 End) Desc, R.HouseNo,
		(Case When R.Flat Is Null Then 0 Else 1 End) Desc, R.Flat
Return
GO
/****** Object:  StoredProcedure [dbo].[RP08]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[RP08]
(
	@ProjectID NVarChar(6),
	@Phase NVarChar(6),
	@DateFrom NVarChar(10),
	@DateTo NVarChar(10),
	@OverdueOnly Char(1)
)
 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	
	
	Declare @Condition NVarChar(4000)

	Select M.Project_ID N'ProjectID', concat(P.Prj_Name_CHI,P.PRJ_NAME_ENG) N'ProjectName',
		IsNull(F.Dev_Code, CP.Dev_Code) N'PhaseID',
		IsNull(F.Dev_Name, CP.Dev_Name) N'Phase',
		P.Base_Curr_ID N'ProjectCurr', M.MOA_No N'AgreementNo',
		F.FM_Blk N'BlockID', 
		-- F.Block_Desc N'Block',
		ISNULL(F.Block_Desc, F.FM_Blk) N'Block',
		F.FM_Hse_No N'HouseNo', F.FM_Floor N'Floor', F.FM_Flat N'Flat',
		CP.Car_Park_No N'CPNo', CP.House_No N'CPHseNo', CP.Park_Level N'CPLevel', M.MOA_Dt N'SoldDate',
		Case M.Show_Cash_Rebate When N'Y' Then IsNull((select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE 
		from 
		(
	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	where M.MOA_NO = AM_NO
	GROUP BY AM_NO, FM_CP)tmp1 order by SEQ
		) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)),0)
		Else 
		IsNull((select MOA_Price from MOA join (select top(1) am_no , FM_CP_CODE 
		FROM
(
	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	where M.MOA_NO = AM_NO
	GROUP BY AM_NO, FM_CP
)tmp1 
order by SEQ ) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE))
		,0) 
		End N'ContractPrice',
		IsNull(M.MOA_Cash_Rebate, 0) N'CashRebate', 
		IsNull((select MOA_TOT_PRICE from MOA join (select top(1) am_no , FM_CP_CODE 
		from 
		(
	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	where M.MOA_NO = AM_NO
	GROUP BY AM_NO, FM_CP)tmp1 order by SEQ
		) tmp on moa.MOA_NO = tmp.AM_NO and (f.FM_CODE = FM_CP_CODE or cp.CAR_PARK_ID = FM_CP_CODE)),0)
		
		N'ACReceivable',
		PP1.Py_Date_Due N'DueDate1', PP1.Py_Paymt_Due N'DueAmt1',
		PP2.Py_Date_Due N'DueDate2', PP2.Py_Paymt_Due N'DueAmt2',
		PP3.Py_Date_Due N'DueDate3', PP3.Py_Paymt_Due N'DueAmt3',
		PP4.Py_Date_Due N'DueDate4', PP4.Py_Paymt_Due N'DueAmt4',
		PP5.Py_Date_Due N'DueDate5', PP5.Py_Paymt_Due N'DueAmt5',
		--BEGIN #20070104
		PP6.Py_Date_Due N'DueDate6', PP6.Py_Paymt_Due N'DueAmt6',
		PP7.Py_Date_Due N'DueDate7', PP7.Py_Paymt_Due N'DueAmt7',
		PP8.Py_Date_Due N'DueDate8', PP8.Py_Paymt_Due N'DueAmt8',
		PP9.Py_Date_Due N'DueDate9', PP9.Py_Paymt_Due N'DueAmt9',
		PP10.Py_Date_Due N'DueDate10', PP10.Py_Paymt_Due N'DueAmt10',
		--END #20070104
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > 0 Then
				Case When IsNull(PP1.Py_Paymt_Due, 0) < PP.Amount Then
					IsNull(PP1.Py_Paymt_Due, 0)
				Else
					PP.Amount
				End
			Else
				0
			End
		Else
			PP1.Paid_Amt
		End N'ActualPay1',
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > IsNull(PP1.Py_Paymt_Due, 0) Then
				Case When IsNull(PP2.Py_Paymt_Due, 0) < PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) Then
					IsNull(PP2.Py_Paymt_Due, 0)
				Else
					PP.Amount - IsNull(PP1.Py_Paymt_Due, 0)
				End
			Else
				0
			End
		Else
			PP2.Paid_Amt
		End N'ActualPay2',
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > IsNull(PP1.Py_Paymt_Due, 0) + IsNUll(PP2.Py_Paymt_Due, 0) Then
				Case When IsNull(PP3.Py_Paymt_Due, 0) < PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) Then
					IsNull(PP3.Py_Paymt_Due, 0)
				Else
					PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0)
				End
			Else
				0
			End
		Else
			PP3.Paid_Amt
		End N'ActualPay3',
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > IsNull(PP1.Py_Paymt_Due, 0) + IsNUll(PP2.Py_Paymt_Due, 0) + IsNUll(PP3.Py_Paymt_Due, 0) Then
				Case When IsNull(PP4.Py_Paymt_Due, 0) < PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) Then
					IsNull(PP4.Py_Paymt_Due, 0)
				Else
					PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0)
				End
			Else
				0
			End
		Else
			PP4.Paid_Amt
		End N'ActualPay4',
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > IsNull(PP1.Py_Paymt_Due, 0) + IsNUll(PP2.Py_Paymt_Due, 0) + IsNUll(PP3.Py_Paymt_Due, 0) + IsNUll(PP4.Py_Paymt_Due, 0) Then
				Case When IsNull(PP5.Py_Paymt_Due, 0) < PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) Then
					IsNull(PP5.Py_Paymt_Due, 0)
				Else
					PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0)
				End
			Else
				0
			End
		Else
			PP5.Paid_Amt
		End N'ActualPay5',

		--BEGIN #20070104 
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > IsNull(PP1.Py_Paymt_Due, 0) + IsNUll(PP2.Py_Paymt_Due, 0) + IsNUll(PP3.Py_Paymt_Due, 0) + IsNUll(PP4.Py_Paymt_Due, 0) + IsNUll(PP5.Py_Paymt_Due, 0) Then
				Case When IsNull(PP6.Py_Paymt_Due, 0) < PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0) Then
					IsNull(PP6.Py_Paymt_Due, 0)
				Else
					PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0)
				End
			Else
				0
			End
		Else
			PP6.Paid_Amt
		End N'ActualPay6',
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > IsNull(PP1.Py_Paymt_Due, 0) + IsNUll(PP2.Py_Paymt_Due, 0) + IsNUll(PP3.Py_Paymt_Due, 0) + IsNUll(PP4.Py_Paymt_Due, 0) + IsNUll(PP5.Py_Paymt_Due, 0)  + IsNUll(PP6.Py_Paymt_Due, 0) Then
				Case When IsNull(PP7.Py_Paymt_Due, 0) < PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0) - IsNull(PP6.Py_Paymt_Due, 0) Then
					IsNull(PP7.Py_Paymt_Due, 0)
				Else
					PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0) - IsNull(PP6.Py_Paymt_Due, 0)
				End
			Else
				0
			End
		Else
			PP7.Paid_Amt
		End N'ActualPay7',
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > IsNull(PP1.Py_Paymt_Due, 0) + IsNUll(PP2.Py_Paymt_Due, 0) + IsNUll(PP3.Py_Paymt_Due, 0) + IsNUll(PP4.Py_Paymt_Due, 0) + IsNUll(PP5.Py_Paymt_Due, 0) + IsNUll(PP6.Py_Paymt_Due, 0) + IsNUll(PP7.Py_Paymt_Due, 0) Then
				Case When IsNull(PP8.Py_Paymt_Due, 0) < PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0) - IsNull(PP6.Py_Paymt_Due, 0) - IsNull(PP7.Py_Paymt_Due, 0) Then
					IsNull(PP8.Py_Paymt_Due, 0)
				Else
					PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0) - IsNull(PP6.Py_Paymt_Due, 0) - IsNull(PP7.Py_Paymt_Due, 0)
				End
			Else
				0
			End
		Else
			PP8.Paid_Amt
		End N'ActualPay8',
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > IsNull(PP1.Py_Paymt_Due, 0) + IsNUll(PP2.Py_Paymt_Due, 0) + IsNUll(PP3.Py_Paymt_Due, 0) + IsNUll(PP4.Py_Paymt_Due, 0) + IsNUll(PP5.Py_Paymt_Due, 0) + IsNUll(PP6.Py_Paymt_Due, 0) + IsNUll(PP7.Py_Paymt_Due, 0) + IsNUll(PP8.Py_Paymt_Due, 0) Then
				Case When IsNull(PP9.Py_Paymt_Due, 0) < PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0) - IsNull(PP6.Py_Paymt_Due, 0) - IsNull(PP7.Py_Paymt_Due, 0) - IsNull(PP8.Py_Paymt_Due, 0) Then
					IsNull(PP9.Py_Paymt_Due, 0)
				Else
					PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0) - IsNull(PP6.Py_Paymt_Due, 0) - IsNull(PP7.Py_Paymt_Due, 0) - IsNull(PP8.Py_Paymt_Due, 0)
				End
			Else
				0
			End
		Else
			PP9.Paid_Amt
		End N'ActualPay9',
		Case When M.MOA_Status = N'O' Then
			Case When PP.Amount > IsNull(PP1.Py_Paymt_Due, 0) + IsNUll(PP2.Py_Paymt_Due, 0) + IsNUll(PP3.Py_Paymt_Due, 0) + IsNUll(PP4.Py_Paymt_Due, 0) + IsNUll(PP5.Py_Paymt_Due, 0) + IsNUll(PP6.Py_Paymt_Due, 0) + IsNUll(PP7.Py_Paymt_Due, 0) + IsNUll(PP8.Py_Paymt_Due, 0) + IsNUll(PP9.Py_Paymt_Due, 0) Then
				Case When IsNull(PP10.Py_Paymt_Due, 0) < PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0) - IsNull(PP6.Py_Paymt_Due, 0) - IsNull(PP7.Py_Paymt_Due, 0) - IsNull(PP8.Py_Paymt_Due, 0) - IsNull(PP9.Py_Paymt_Due, 0) Then
					IsNull(PP10.Py_Paymt_Due, 0)
				Else
					PP.Amount - IsNull(PP1.Py_Paymt_Due, 0) - IsNull(PP2.Py_Paymt_Due, 0) - IsNull(PP3.Py_Paymt_Due, 0) - IsNull(PP4.Py_Paymt_Due, 0) - IsNull(PP5.Py_Paymt_Due, 0) - IsNull(PP6.Py_Paymt_Due, 0) - IsNull(PP7.Py_Paymt_Due, 0) - IsNull(PP8.Py_Paymt_Due, 0) - IsNull(PP9.Py_Paymt_Due, 0)
				End
			Else
				0
			End
		Else
			PP10.Paid_Amt
		End N'ActualPay10',
		
		IsNull(PP1.Paid_Amt, 0) + IsNull(PP2.Paid_Amt, 0) + IsNull(PP3.Paid_Amt, 0) + IsNull(PP4.Paid_Amt, 0) + IsNull(PP5.Paid_Amt, 0) + IsNull(PP6.Paid_Amt, 0) + IsNull(PP7.Paid_Amt, 0) + IsNull(PP8.Paid_Amt, 0) + IsNull(PP9.Paid_Amt, 0) + IsNull(PP10.Paid_Amt, 0) N'CumReceived'

		-- END #20070104 

	Into #RP08
	From MOA M
	Left Outer Join (
		Select F.*, D.Dev_Name, B.Block_Desc
		From VW_RPT_Flat_Master F
		Left Outer Join Development D On (F.Dev_Code = D.Dev_Code)
		Left Outer Join Block B On (F.Project_ID = B.Project_ID And F.FM_Blk = B.Block_ID)
	) F On (M.Project_ID = F.Project_ID And M.MOA_No = F.MOA_No)
	Left Outer Join (
		Select CP.*, D.Dev_Name
		From Car_Park CP
		Left Outer Join Development D On (CP.Dev_Code = D.Dev_Code)
	) CP On (M.Project_ID = CP.Project_ID And M.MOA_No = CP.MOA_No)
	Left Outer Join (
select AM_NO, FM_CP_CODE from 
	MOA M join (
	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	GROUP BY AM_NO, FM_CP)tmp
	on ( M.MOA_NO =  AM_NO and 
	(tmp.SEQ =1 or 
	(tmp.seq =2 and m.MOA_NO not in (
	select tmp3.AM_NO from 
	(
	select * from (SELECT  AM_NO, max (FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	GROUP BY AM_NO, FM_CP)
	tmp where tmp.seq =1 )tmp3
	 join 
	(
	select * from (SELECT  AM_NO, max (FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	GROUP BY AM_NO, FM_CP)
	tmp1 where tmp1.seq =2 ) tmp4 
	on  tmp3.AM_NO = tmp4.AM_NO
	))))

	)Uni on (F.FM_CODE = Uni.FM_CP_CODE  or CP.CAR_PARK_ID = FM_CP_CODE ) and M.MOA_NO=Uni.AM_NO
	Left Outer Join (
		Select Project_ID, AM_NO, IsNull(Sum(Round(IsNull(Amount, 0) / IsNull(Curr_Rate, 0), 0)), 0) Amount
		From AM_PAYMENT
		Group By Project_ID, AM_NO
	) PP On (M.Project_ID = PP.Project_ID And M.MOA_No = PP.AM_NO and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	Left Outer Join (
		Select PP.*, IsNUll(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e 
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP1 On (M.Project_ID = PP1.Project_ID And M.MOA_No = PP1.AM_NO And M.Method_Code = PP1.Method_Code and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	Left Outer Join (
		Select PP.*, IsNUll(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e 
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code And B.Py_Plan_Seq Not In (
						Select Top 1 C.Py_Plan_Seq
						From AM_PAYMENT_PLAN C
						Where B.Project_ID = C.Project_ID And B.AM_NO = C.AM_NO
							And B.Method_Code = C.Method_Code
						Order By C.Py_Plan_seq
					)
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP2 On (M.Project_ID = PP2.Project_ID And M.MOA_No = PP2.AM_NO And M.Method_Code = PP2.Method_Code and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	Left Outer Join (
		Select PP.*, IsNull(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e 
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code And B.Py_Plan_Seq Not In (
						Select Top 2 C.Py_Plan_Seq
						From AM_PAYMENT_PLAN C
						Where B.Project_ID = C.Project_ID And B.AM_NO = C.AM_NO
							And B.Method_Code = C.Method_Code
						Order By C.Py_Plan_Seq
					)
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP3 On (M.Project_ID = PP3.Project_ID And M.MOA_No = PP3.AM_NO And M.Method_Code = PP3.Method_Code and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	Left Outer Join (
		Select PP.*, IsNull(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e 
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code And B.Py_Plan_Seq Not In (
						Select Top 3 C.Py_Plan_Seq
						From AM_PAYMENT_PLAN C
						Where B.Project_ID = C.Project_ID And B.AM_NO = C.AM_NO
							And B.Method_Code = C.Method_Code
						Order By C.Py_Plan_Seq
					)
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP4 On (M.Project_ID = PP4.Project_ID And M.MOA_No = PP4.AM_NO And M.Method_Code = PP4.Method_Code  and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	Left Outer Join (
		Select PP.*, IsNull(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e 
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code And B.Py_Plan_Seq Not In (
						Select Top 4 C.Py_Plan_Seq
						From AM_PAYMENT_PLAN C
						Where B.Project_ID = C.Project_ID And B.AM_NO = C.AM_NO
							And B.Method_Code = C.Method_Code
						Order By C.Py_Plan_Seq
					)
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP5 On (M.Project_ID = PP5.Project_ID And M.MOA_No = PP5.AM_NO And M.Method_Code = PP5.Method_Code  and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	--BEGIN #20070104
	Left Outer Join (
		Select PP.*, IsNull(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e 
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code And B.Py_Plan_Seq Not In (
						Select Top 5 C.Py_Plan_Seq
						From AM_PAYMENT_PLAN C
						Where B.Project_ID = C.Project_ID And B.AM_NO = C.AM_NO
							And B.Method_Code = C.Method_Code
						Order By C.Py_Plan_Seq
					)
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP6 On (M.Project_ID = PP6.Project_ID And M.MOA_No = PP6.AM_NO And M.Method_Code = PP6.Method_Code and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	Left Outer Join (
		Select PP.*, IsNull(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e 
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code And B.Py_Plan_Seq Not In (
						Select Top 6 C.Py_Plan_Seq
						From AM_PAYMENT_PLAN C
						Where B.Project_ID = C.Project_ID And B.AM_NO = C.AM_NO
							And B.Method_Code = C.Method_Code
						Order By C.Py_Plan_Seq
					)
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP7 On (M.Project_ID = PP7.Project_ID And M.MOA_No = PP7.AM_NO And M.Method_Code = PP7.Method_Code and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	Left Outer Join (
		Select PP.*, IsNull(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code And B.Py_Plan_Seq Not In (
						Select Top 7 C.Py_Plan_Seq
						From AM_PAYMENT_PLAN C
						Where B.Project_ID = C.Project_ID And B.AM_NO = C.AM_NO
							And B.Method_Code = C.Method_Code
						Order By C.Py_Plan_Seq
					)
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP8 On (M.Project_ID = PP8.Project_ID And M.MOA_No = PP8.AM_NO And M.Method_Code = PP8.Method_Code and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	Left Outer Join (
		Select PP.*, IsNull(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e 
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code And B.Py_Plan_Seq Not In (
						Select Top 8 C.Py_Plan_Seq
						From AM_PAYMENT_PLAN C
						Where B.Project_ID = C.Project_ID And B.AM_NO = C.AM_NO
							And B.Method_Code = C.Method_Code
						Order By C.Py_Plan_Seq
					)
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP9 On (M.Project_ID = PP9.Project_ID And M.MOA_No = PP9.AM_NO And M.Method_Code = PP9.Method_Code  and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	Left Outer Join (
		Select PP.*, IsNull(PS.Paid_Amt, 0) Paid_Amt
		From (
			Select A.Project_ID, A.AM_NO, A.Method_Code, A.Py_Paymt_Due, 
			--#20171030s
			--A.Py_Date_Due, 
			isnull(a.py_date_due, A.OTHER_PY_DUE_DATE) Py_Date_Due,
			--#20171030e 
			A.Py_Plan_Seq
			From AM_PAYMENT_PLAN A
			Where A.Py_Plan_Seq = (
				Select Top 1 B.Py_Plan_Seq
				From AM_PAYMENT_PLAN B
				Where A.Project_ID = B.Project_ID And A.AM_NO = B.AM_NO
					And A.Method_Code = B.Method_Code And B.Py_Plan_Seq Not In (
						Select Top 9 C.Py_Plan_Seq
						From AM_PAYMENT_PLAN C
						Where B.Project_ID = C.Project_ID And B.AM_NO = C.AM_NO
							And B.Method_Code = C.Method_Code
						Order By C.Py_Plan_Seq
					)
				Order By B.Py_Plan_Seq
			)
		) PP
		Left Outer Join (
			Select Project_ID, AM_NO, Py_Plan_Seq, Sum(IsNull(Paid_Amt, 0)) N'Paid_Amt'
			From AM_PAYMENT_FU_TRANS
			Group By Project_ID, AM_NO, Py_Plan_Seq
		) PS On (PP.Project_ID = PS.Project_ID And PP.AM_NO = PS.AM_NO And PP.Py_Plan_Seq = PS.Py_Plan_Seq)
	) PP10 On (M.Project_ID = PP10.Project_ID And M.MOA_No = PP10.AM_NO And M.Method_Code = PP10.Method_Code  and (F.FM_CODE = (select top(1) uni.FM_CP_CODE) or cp.CAR_PARK_ID = (select top(1) uni.FM_CP_CODE) ))
	--END #20070104
	, Project_Master P
	Where M.Project_ID = P.Project_ID And M.Project_ID = @ProjectID
		And (M.MOA_Status = N'C' Or M.MOA_Status = N'O')
		 --And M.MOA_Deleted <> N'Y'
		And (F.Dev_Code Is Not Null Or CP.Dev_Code Is Not Null) And M.MOA_Dt Is Not Null

	Select @Condition = N''

	If @Phase Is Not Null And @Phase <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'PhaseID = @Phase'
	End

	If @DateFrom Is Not Null And @DateFrom <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'SoldDate >= Convert(DateTime, @DateFrom, 105)'
	End

	If @DateTo Is Not Null And @DateTo <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'SoldDate < DateAdd(Day, 1, Convert(DateTime, @DateTo, 105))'
	End

	If @Condition <> N''
	Begin
		Declare @Statement NVarChar(4000)

		Select @Statement = N'Delete From #RP08 Where Not (' + @Condition + N')'
		Exec SP_ExecuteSql @Statement, N'@Phase NVarChar(6), @DateFrom NVarChar(10), @DateTo NVarChar(10)', @Phase, @DateFrom, @DateTo
	End

	Select ProjectID, ProjectName, Phase, ProjectCurr, AgreementNo, Block, HouseNo, [Floor],
		Flat, CPNo, CPHseNo, CPLevel, SoldDate, ContractPrice, CashRebate, ACReceivable, DueDate1,
		DueAmt1, DueDate2, DueAmt2, DueDate3, DueAmt3, DueDate4, DueAmt4, DueDate5, DueAmt5,

		--BEGIN #20070104
		DueDate6, DueAmt6, DueDate7, DueAmt7, DueDate8, DueAmt8, DueDate9, DueAmt9, DueDate10, DueAmt10,

		Case When DueDate1 Is Not Null And DateDiff(Day, DueDate1, GetDate()) > 0 And ActualPay1 < DueAmt1 Then
			DueAmt1 - ActualPay1
		Else
			0
		End + Case When DueDate2 Is Not Null And DateDiff(Day, DueDate2, GetDate()) > 0 And ActualPay2 < DueAmt2 Then
			DueAmt2 - ActualPay2
		Else
			0
		End + Case When DueDate3 Is Not Null And DateDiff(Day, DueDate3, GetDate()) > 0 And ActualPay3 < DueAmt3 Then
			DueAmt3 - ActualPay3
		Else
			0
		End + Case When DueDate4 Is Not Null And DateDiff(Day, DueDate4, GetDate()) > 0 And ActualPay4 < DueAmt4 Then
			DueAmt4 - ActualPay4
		Else
			0
		End + Case When DueDate5 Is Not Null And DateDiff(Day, DueDate5, GetDate()) > 0 And ActualPay5 < DueAmt5 Then
			DueAmt5 - ActualPay5
		Else
			0
		End + Case When DueDate6 Is Not Null And DateDiff(Day, DueDate6, GetDate()) > 0 And ActualPay6 < DueAmt6 Then
			DueAmt6 - ActualPay6
		Else
			0
		End + Case When DueDate7 Is Not Null And DateDiff(Day, DueDate7, GetDate()) > 0 And ActualPay7 < DueAmt7 Then
			DueAmt7 - ActualPay7
		Else
			0
		End + Case When DueDate8 Is Not Null And DateDiff(Day, DueDate8, GetDate()) > 0 And ActualPay8 < DueAmt8 Then
			DueAmt8 - ActualPay8
		Else
			0
		End + Case When DueDate9 Is Not Null And DateDiff(Day, DueDate9, GetDate()) > 0 And ActualPay9 < DueAmt9 Then
			DueAmt9 - ActualPay9
		Else
			0
		End + Case When DueDate10 Is Not Null And DateDiff(Day, DueDate10, GetDate()) > 0 And ActualPay10 < DueAmt10 Then
			DueAmt10 - ActualPay10
		Else
			0		
		End N'TotalOverdue',
		Case When DueDate1 Is Not Null And DateDiff(Day, DueDate1, GetDate()) > 0 And ActualPay1 < DueAmt1 Then
			DateDiff(Day, DueDate1, GetDate())
		When DueDate2 Is Not Null And DateDiff(Day, DueDate2, GetDate()) > 0 And ActualPay2 < DueAmt2 Then
			DateDiff(Day, DueDate2, GetDate())
		When DueDate3 Is Not Null And DateDiff(Day, DueDate3, GetDate()) > 0 And ActualPay3 < DueAmt3 Then
			DateDiff(Day, DueDate3, GetDate())
		When DueDate4 Is Not Null And DateDiff(Day, DueDate4, GetDate()) > 0 And ActualPay4 < DueAmt4 Then
			DateDiff(Day, DueDate4, GetDate())
		When DueDate5 Is Not Null And DateDiff(Day, DueDate5, GetDate()) > 0 And ActualPay5 < DueAmt5 Then
			DateDiff(Day, DueDate5, GetDate())
		When DueDate6 Is Not Null And DateDiff(Day, DueDate6, GetDate()) > 0 And ActualPay6 < DueAmt6 Then
			DateDiff(Day, DueDate6, GetDate())
		When DueDate7 Is Not Null And DateDiff(Day, DueDate7, GetDate()) > 0 And ActualPay7 < DueAmt7 Then
			DateDiff(Day, DueDate7, GetDate())
		When DueDate8 Is Not Null And DateDiff(Day, DueDate8, GetDate()) > 0 And ActualPay8 < DueAmt8 Then
			DateDiff(Day, DueDate8, GetDate())
		When DueDate9 Is Not Null And DateDiff(Day, DueDate9, GetDate()) > 0 And ActualPay9 < DueAmt9 Then
			DateDiff(Day, DueDate9, GetDate())
		When DueDate10 Is Not Null And DateDiff(Day, DueDate10, GetDate()) > 0 And ActualPay10 < DueAmt10 Then
			DateDiff(Day, DueDate10, GetDate())
		Else
			Null
		End N'OverdueDays',
		ActualPay1, ActualPay2, ActualPay3, ActualPay4, ActualPay5, ActualPay6, ActualPay7, ActualPay8, ActualPay9, ActualPay10, CumReceived,

		--END #20070104

		IsNull(ACReceivable, 0) - IsNull(CumReceived, 0) N'Balance',
		Case When @DateFrom Is Null Or @DateFrom = N'' Then
			Null
		Else
			cast(Convert(DateTime, @DateFrom, 105) as nvarchar(11))
		End N'FromDate',
		Case When @DateTo Is Null Or @DateTo = N'' Then
			Null
		Else
			cast(Convert(DateTime, @DateTo, 105) as nvarchar(11))
		End N'ToDate'
	From #RP08
	--BEGIN #20070206
	Where (@OverdueOnly='Y' and 
		Case When DueDate1 Is Not Null And DateDiff(Day, DueDate1, GetDate()) > 0 And ActualPay1 < DueAmt1 Then
			DueAmt1 - ActualPay1
		Else
			0
		End + Case When DueDate2 Is Not Null And DateDiff(Day, DueDate2, GetDate()) > 0 And ActualPay2 < DueAmt2 Then
			DueAmt2 - ActualPay2
		Else
			0
		End + Case When DueDate3 Is Not Null And DateDiff(Day, DueDate3, GetDate()) > 0 And ActualPay3 < DueAmt3 Then
			DueAmt3 - ActualPay3
		Else
			0
		End + Case When DueDate4 Is Not Null And DateDiff(Day, DueDate4, GetDate()) > 0 And ActualPay4 < DueAmt4 Then
			DueAmt4 - ActualPay4
		Else
			0
		End + Case When DueDate5 Is Not Null And DateDiff(Day, DueDate5, GetDate()) > 0 And ActualPay5 < DueAmt5 Then
			DueAmt5 - ActualPay5
		Else
			0
		End + Case When DueDate6 Is Not Null And DateDiff(Day, DueDate6, GetDate()) > 0 And ActualPay6 < DueAmt6 Then
			DueAmt6 - ActualPay6
		Else
			0
		End + Case When DueDate7 Is Not Null And DateDiff(Day, DueDate7, GetDate()) > 0 And ActualPay7 < DueAmt7 Then
			DueAmt7 - ActualPay7
		Else
			0
		End + Case When DueDate8 Is Not Null And DateDiff(Day, DueDate8, GetDate()) > 0 And ActualPay8 < DueAmt8 Then
			DueAmt8 - ActualPay8
		Else
			0
		End + Case When DueDate9 Is Not Null And DateDiff(Day, DueDate9, GetDate()) > 0 And ActualPay9 < DueAmt9 Then
			DueAmt9 - ActualPay9
		Else
			0
		End + Case When DueDate10 Is Not Null And DateDiff(Day, DueDate10, GetDate()) > 0 And ActualPay10 < DueAmt10 Then
			DueAmt10 - ActualPay10
		Else
			0		
		End > 0) OR @OverdueOnly='N'
	--END #20070206
	Order By SoldDate
Return
GO
/****** Object:  StoredProcedure [dbo].[RP09]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[RP09]
(
	@ProjectID NVarChar(6),
	@Phase NVarChar(6),
	@AnalysisGroup NVarChar(6)
)
 
As
	Declare @Condition NVarChar(Max)
	Declare @DeleteAnaMasterStatement NVarChar(Max)

	Select 
		F.Project_ID N'ProjectID', 
		F.Dev_Code N'PhaseID', 
		F.Ana_Group_ID N'ANAGroupID',
		Case F.FM_Status When N'S' Then N'S' Else N'U' End N'Status',
		F.Ana_ID N'ANAID', 
		F.fm_gr_area_sf N'GFA', 
		F.FM_List_Price N'ListPrice',
		Case F.FM_Status
			When N'S' Then Case M.Show_Cash_Rebate
								When N'Y' Then M.MOA_Tot_Price
								Else M.MOA_Price
							End - IsNull(CP.Park_List_Price, 0)
			Else F.FM_List_Price
		End  N'ContractPrice',
		Case F.FM_Status
			When N'S' Then M.MOA_Tot_Price - IsNull(CP.Park_List_Price, 0)
			Else F.FM_List_Price
		End N'NetPrice',
		F.Project_ID + N'/' + F.Dev_Code + N'/' + IsNull(F.Ana_Group_ID, N'') + N'/' + Case F.FM_Status When N'S' Then N'S' Else N'U' End + N'/' + IsNull(F.Ana_ID, N'') N'Key'
	Into #RP09
	From (
		Select 
			F.*, 
			FC.Ana_ID, 
			FC.Ana_Group_ID
		From 
			Flat_Master F 
			Left Outer Join (
								Select 
									*
								From 
									FM_CP_Analysis_Code
								Where 
									Flat_CP = N'F'
							) FC On (F.Project_ID = FC.Project_ID And F.FM_Code = FC.FM_CP_Code)
			) F 
			Left Outer Join (
								Select 
									*
								From 
									MOA
								Where 
									(
										MOA_Status = N'C' 
										Or MOA_Status = N'O'
									)
									--And MOA_Deleted <> N'Y' 
									And MOA_Dt Is Not Null
							) M On (F.Project_ID = M.Project_ID And F.MOA_No = M.MOA_No)
			Left Outer Join Car_Park CP On (F.Project_ID = CP.Project_ID And F.MOA_No = CP.MOA_No)
		Where 
			F.Project_ID = @ProjectID 
			And F.Dev_Code Is Not Null

	Select @Condition = N''

	If @Phase Is Not Null And @Phase <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'PhaseID = @Phase'
	End

	If @AnalysisGroup Is Not Null And @AnalysisGroup <> N''
	Begin
		If @Condition <> N''
		Begin
			Select @Condition = @Condition + N' And '
		End
		
		Select @Condition = @Condition + N'ANAGroupID Is Not Null And ANAGroupID = @AnalysisGroup'
	End

	If @Condition <> N''
	Begin
		Declare @Statement NVarChar(Max)

		Select @Statement = N'Delete From #RP09 Where Not (' + @Condition + N')'
		Exec SP_ExecuteSql @Statement, N'@Phase NVarChar(6), @AnalysisGroup NVarChar(6)', @Phase, @AnalysisGroup
	End

	Select 
		Distinct Ana_Group_ID, 
		Ana_ID
	Into 
		#RP09_Analysis_Master
	From 
		Analysis_Code
	Where 
		Ana_Group_ID In (
							Select 
								FM_Ana_Group1_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
							Union
							Select 
								FM_Ana_Group2_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
							Union
							Select 
								FM_Ana_Group3_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
							Union
							Select 
								FM_Ana_Group4_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
							Union
							Select 
								FM_Ana_Group5_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
							Union
							Select 
								FM_Ana_Group6_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
							Union
							Select 
								FM_Ana_Group7_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
							Union
							Select 
								FM_Ana_Group8_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
							Union
							Select 
								FM_Ana_Group9_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
							Union
							Select 
								FM_Ana_Group10_ID N'Ana_Group_ID'
							From 
								Project_Master
							Where 
								Project_ID = @ProjectID
						)
	Union
	Select Null, Null

	Insert Into #RP09_Analysis_Master
	Select 
		Distinct Ana_Group_ID, Null
	From 
		#RP09_Analysis_Master
	Where 
		Ana_Group_ID Is Not Null
	
	--BEGIN #20100729
	Select @DeleteAnaMasterStatement = N'Delete From #RP09_Analysis_Master Where Ana_Group_ID <> ''' + @AnalysisGroup + N''''
	Exec SP_ExecuteSql @DeleteAnaMasterStatement, N'@AnalysisGroup NVarChar(6)', @AnalysisGroup
	--END #20100729

	Select 
		PH.ProjectID, 
		PH.PhaseID, 
		A.Ana_Group_ID, 
		S.Status, 
		A.Ana_ID,
		PH.ProjectID + N'/' + PH.PhaseID + N'/' + IsNull(A.Ana_Group_ID, N'') + N'/' + S.Status + N'/' + IsNUll(A.Ana_ID, N'') N'Key'
	Into 
		#RP09_Master
	From (
			Select 
				Distinct ProjectID, 
				PhaseID
			From 
				#RP09
		  ) PH, (
					Select 
						N'S' N'Status'
					Union
					Select 
						N'U' N'Status'
				) S, 
		#RP09_Analysis_Master A

	Select 
		R.ProjectID N'ProjectID', 
		P.Prj_Name_CHI + ' ' + P.PRJ_NAME_ENG N'ProjectName', 
		R.Dev_Name N'Phase',
		P.Base_Curr_ID N'ProjectCurr', 
		R.Ana_Group_Desc N'ANAGroup', 
		R.Status N'Status',
		R.Ana_Desc N'ANADesc', 
		R.UnitNo N'UnitNo', 
		R.GFA N'TotalGFA', 
		R.ListPrice N'ListPriceTotal',
		Case
			When R.GFA Is Null Or R.GFA = 0 Then 0
			Else (R.ListPrice / R.GFA)
		End N'ListPriceAvg',
		R.ContractPrice N'ContractPriceTotal',
		Case
			When R.GFA Is Null Or R.GFA = 0 Then 0
			Else (R.ContractPrice / R.GFA)
		End N'ContractPriceAvg',
		R.NetPrice N'NetPriceTotal',
		Case
			When R.GFA Is Null Or R.GFA = 0 Then 0
			Else (R.NetPrice / R.GFA)
		End N'NetPriceAvg'
	From (
			Select 
				R.*, 
				D.Dev_Name, 
				AG.Ana_Group_Desc, 
				AC.Ana_Desc
			From (
					Select	
						M.ProjectID, 
						M.PhaseID, 
						M.Ana_Group_ID N'ANAGroupID', 
						M.Status, 
						M.ANA_ID N'ANAID',
						Count(R.ProjectID) N'UnitNo', 
						Sum(IsNull(R.GFA, 0)) N'GFA',
						Sum(IsNull(R.ListPrice, 0)) N'ListPrice',
						Sum(IsNull(R.ContractPrice, 0)) N'ContractPrice',
						Sum(IsNull(R.NetPrice, 0)) N'NetPrice'
					From 
						#RP09_Master M
						Left Outer Join #RP09 R On (M.[Key] = R.[Key])
					Group By 
						M.ProjectID, M.PhaseID, M.Ana_Group_ID, M.Status, M.Ana_ID
				) R
			Left Outer Join Development D On (R.PhaseID = D.Dev_Code)
			Left Outer Join Analysis_Group AG On (R.ANAGroupID = AG.Ana_Group_ID)
			Left Outer Join Analysis_Code AC On (R.ANAGroupID = AC.Ana_Group_ID And R.ANAID = AC.Ana_ID)
		) R, Project_Master P
	Where 
		R.ProjectID = P.Project_ID 
		And Not (R.UnitNo = 0 And R.ANAID Is Null)
	Order By 
		R.Dev_Name, 
		(Case When R.Ana_Group_Desc Is Null Then 0 Else 1 End) Desc, 
		R.Ana_Group_Desc,
		(Case When R.Status Is Null Then 0 Else 1 End) Desc, 
		R.Status,
		(Case When R.Ana_Desc Is Null Then 0 Else 1 End) Desc, 
		R.Ana_Desc


	--Recordset for chart
	Select 
		R.ProjectID N'ProjectID', 
		P.Prj_Name_CHI + ' ' + P.PRJ_NAME_ENG N'ProjectName', 
		R.Dev_Name N'Phase',
		P.Base_Curr_ID N'ProjectCurr', 
		R.Ana_Group_Desc N'ANAGroup', 
		R.Status N'Status',
		R.Ana_Desc N'ANADesc', 
		R.UnitNo N'UnitNo', 
		R.GFA N'TotalGFA', 
		R.ListPrice N'ListPriceTotal',
		Case
			When R.GFA Is Null Or R.GFA = 0 Then 0
			Else (R.ListPrice / R.GFA)
		End N'ListPriceAvg',
		R.ContractPrice N'ContractPriceTotal',
		Case
			When R.GFA Is Null Or R.GFA = 0 Then 0
			Else (R.ContractPrice / R.GFA)
		End N'ContractPriceAvg',
		R.NetPrice N'NetPriceTotal',
		Case
			When R.GFA Is Null Or R.GFA = 0 Then 0
			Else (R.NetPrice / R.GFA)
		End N'NetPriceAvg'
	From (
			Select 
				R.*, 
				D.Dev_Name, 
				Case 
					When R.AnaGroupID Is Null Then N'Unclassified' 
					Else AG.Ana_Group_Desc 
				End N'Ana_Group_Desc',
				Case 
					When R.ANAID Is Null Then N'Unclassified' 
					Else AC.Ana_Desc 
				End N'Ana_Desc'
			From (
					Select 
						M.ProjectID, 
						M.PhaseID, 
						M.Ana_Group_ID N'ANAGroupID', 
						M.Status, 
						M.ANA_ID N'ANAID',
						Count(R.ProjectID) N'UnitNo', 
						Sum(IsNull(R.GFA, 0)) N'GFA',
						Sum(IsNull(R.ListPrice, 0)) N'ListPrice',
						Sum(IsNull(R.ContractPrice, 0)) N'ContractPrice',
						Sum(IsNull(R.NetPrice, 0)) N'NetPrice'
					From 
						#RP09_Master M
						Left Outer Join #RP09 R On (M.[Key] = R.[Key])
					Group By 
						M.ProjectID, M.PhaseID, M.Ana_Group_ID, M.Status, M.Ana_ID
				) R
				Left Outer Join Development D On (R.PhaseID = D.Dev_Code)
				Left Outer Join Analysis_Group AG On (R.ANAGroupID = AG.Ana_Group_ID)
				Left Outer Join Analysis_Code AC On (R.ANAGroupID = AC.Ana_Group_ID And R.ANAID = AC.Ana_ID)
			) R, Project_Master P
	Where 
		R.ProjectID = P.Project_ID 
		And Not (R.UnitNo = 0 And R.ANAID Is Null)
	Order By 
		R.Dev_Name, 
		(Case When R.Ana_Group_Desc = N'Unclassified' Then 0 Else 1 End) Desc, 
		R.Ana_Group_Desc,
		(Case When R.Ana_Desc Is Null Then 0 Else 1 End) Desc, 
		R.Ana_Desc,
		(Case When R.Status Is Null Then 0 Else 1 End) Desc, 
		R.Status
Return
GO
/****** Object:  StoredProcedure [dbo].[RP10]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[RP10] (
@ProjectID NVarchar(6), @FcnID NVarChar(20), @DateStart NVarchar(20), @DateEnd nvarchar(20))

 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	
	
	set concat_null_yields_null off

	declare @sql nvarchar(max)
	
	select @sql = N'select a.project_id ProjectID, concat(p.prj_name_chi,p.prj_name_eng) ProjectName, f.functionEngname FunctionName, 
	u.first_name + '' '' + u.last_name UserName, a.mode Action, a.cr_time DateTime, a.Key_Value KeyValue, 
	a.original_value OriginalValue, a.changed_value NewValue, '
	
	if (@DateStart is not null and @DateStart <> '')
	  select @sql = @sql + N'convert(Datetime, ''' + replace(@DateStart, '''', '''''') + ''', 105) FromDate, '
	else
	  select @sql = @sql + N''''' FromDate, '
	  
	if (@DateEnd is not null and @DateEnd <> '')
	  select @sql = @sql + N'convert(Datetime, ''' + replace(@DateEnd, '''', '''''') + ''', 105) ToDate '
	else
	  select @sql = @sql + N''''' ToDate '
  
    select @sql = @sql + N'from audit_log a, project_master p, function_profile f, user_profile u
    where a.project_id = p.project_id and a.function_id = f.fn_id and a.cr_user = u.uid '
    
    if (@ProjectID is not null and @ProjectID <> '')
      select @sql = @sql + N' and a.project_id = ''' + replace(@ProjectID, '''', '''''') + ''''
      
    if (@FcnID is not null and @FcnID <> '')
      select @sql = @sql + N' and a.function_id = ''' + replace(@FcnID, '''', '''''') + ''''
    
    if (@DateStart is not null and @DateStart <> '')
      select @sql = @sql + N' and a.cr_time >= convert(Datetime, ''' + replace(@DateStart, '''', '''''') + ''', 105)'

    if (@DateEnd is not null and @DateEnd <> '')
      select @sql = @sql + N' and a.cr_time < dateadd(day, 1, convert(Datetime, ''' + replace(@DateEnd, '''', '''''') + ''', 105))'

    select @sql = @sql + N' order by 1, 6, 3, 5'
    
    -- print @sql
    exec sp_executesql @sql


GO
/****** Object:  StoredProcedure [dbo].[RP11]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[RP11] (
@ProjectID NVarchar(6), @Phase NVarChar(6), @Block nvarchar(6), @DateStart NVarchar(20), @DateEnd nvarchar(20))

 
As
	--exec master..xp_ASL '[weKDisnmvie)}6&'

	set concat_null_yields_null off
	declare @sql nvarchar(max)
	declare @fsql nvarchar(max)
	declare @fsql2 nvarchar(max)
	declare @anaGrp nvarchar(6)
	declare @cnt numeric


select distinct 
	fn.project_id project_id, 
	fn.moa_no moa_no, 
	fn.transfer_seq transfer_seq, 
	case when j1.bName is null then '' when j1.bName = '' then '' else j1.bName + ', ' end +
	case when j2.bName is null then '' when j2.bName = '' then '' else j2.bName + ', ' end + 
	case when j3.bName is null then '' when j3.bName = '' then '' else j3.bName + ', ' end bName
into 
	#RP11a
from 
	moa_transfer_assignee_joint_buyer fn 
	left outer join ( select 
						m1.project_id, 
						m1.moa_no, 
						m1.transfer_seq, 
						m1.j_buyer_id, 
						isnull(m1.surname,'') + ' ' + isnull(m1.given_name,'') bName 
					  from 
						moa_transfer_assignee_joint_buyer m1,
						( select  
							m1.project_id, 
							m1.moa_no, 
							m1.transfer_seq, 
							min(m1.j_buyer_id) min_j_id, 
							case when max(m1.j_buyer_id) = min(m1.j_buyer_id) then '' else max(m1.j_buyer_id) end max_j_id
						  from 
							moa_transfer_assignee_joint_buyer m1 
						  where 
							project_id = '' + @ProjectID + ''
						  group by m1.project_id, m1.moa_no, m1.transfer_seq
						 ) n1
					  where 
						m1.project_id = n1.project_id 
						and m1.moa_no = n1.moa_no 
						and m1.transfer_seq = n1.transfer_seq
						and m1.j_buyer_id = n1.min_j_id 
						and m1.project_id = '' + @ProjectID + ''
					) j1 on fn.project_id = j1.project_id and fn.moa_no = j1.moa_no and fn.transfer_seq = j1.transfer_seq
	left outer join ( select 
						m.project_id, 
						m.moa_no, 
						m.transfer_seq, 
						m.j_buyer_id, 
						isnull(m.surname,'') + ' ' + isnull(m.given_name,'') bName 
					  from 
						moa_transfer_assignee_joint_buyer m,
						( select  
							m1.project_id, 
							m1.moa_no, 
							m1.transfer_seq, 
							min(m1.j_buyer_id) min_j_id, 
							case when max(m1.j_buyer_id) = min(m1.j_buyer_id) then '' else max(m1.j_buyer_id) end max_j_id
						  from 
							moa_transfer_assignee_joint_buyer m1 
						  where 
							project_id = '' + @ProjectID + ''
						  group by m1.project_id, m1.moa_no, m1.transfer_seq
						) n
					  where 
						m.project_id = n.project_id 
						and m.moa_no = n.moa_no 
						and m.transfer_seq = n.transfer_seq
						and m.j_buyer_id > n.min_j_id 
						and m.j_buyer_id < isnull(n.max_j_id, m.j_buyer_id) 
						and m.project_id = '' + @ProjectID + ''
					 ) j2 on fn.project_id = j2.project_id and fn.moa_no = j2.moa_no and fn.transfer_seq = j2.transfer_seq
	left outer join ( select 
						m2.project_id, 
						m2.moa_no, 
						m2.transfer_seq, 
						m2.j_buyer_id, 
						isnull(m2.surname,'') + ' ' + isnull(m2.given_name,'') bName 
					  from
						moa_transfer_assignee_joint_buyer m2,
						( select 
							m1.project_id, 
							m1.moa_no, 
							m1.transfer_seq, 
							min(m1.j_buyer_id) min_j_id, 
							case when max(m1.j_buyer_id) = min(m1.j_buyer_id) then '' else max(m1.j_buyer_id) end max_j_id
						  from 
							moa_transfer_assignee_joint_buyer m1 
						  where 
							project_id = '' + @ProjectID + ''
						  group by m1.project_id, m1.moa_no, m1.transfer_seq
						) n2
					  where 
						m2.project_id = n2.project_id 
						and m2.moa_no = n2.moa_no 
						and m2.transfer_seq = n2.transfer_seq
						and m2.j_buyer_id = n2.max_j_id 
						and m2.project_id = '' + @ProjectID + ''
					 ) j3 on fn.project_id = j3.project_id and fn.moa_no = j3.moa_no and fn.transfer_seq = j3.transfer_seq
where 
	fn.project_id = '' + @ProjectID + ''
/* moa_joint_buyer will be replaced by moa_formal_joint_buyer
select distinct 
	fn.project_id project_id, 
	fn.moa_no moa_no, 
	case when j1.bName is null then '' when j1.bName = '' then '' else j1.bName + ', ' end +
	case when j2.bName is null then '' when j2.bName = '' then '' else j2.bName + ', ' end + 
	case when j3.bName is null then '' when j3.bName = '' then '' else j3.bName + ', ' end bName
into 
	#RP11b
from 
	moa_joint_buyer fn 
	left outer join ( select 
						m1.project_id, 
						m1.moa_no, 
						m1.j_buyer_id, 
						isnull(m1.surname,'') + ' ' + isnull(m1.given_name,'') bName 
					  from 
						moa_joint_buyer m1,
						( select 
							m1.project_id, 
							m1.moa_no, 
							min(m1.j_buyer_id) min_j_id, 
							case when max(m1.j_buyer_id) = min(m1.j_buyer_id) then '' else max(m1.j_buyer_id) end max_j_id
						  from 
							moa_joint_buyer m1 
						  where 
							project_id = '' + @ProjectID + ''
						  group by m1.project_id, m1.moa_no
						) n1
					  where 
						m1.project_id = n1.project_id 
						and m1.moa_no = n1.moa_no 
						and m1.j_buyer_id = n1.min_j_id 
						and m1.project_id = '' + @ProjectID + ''
					 ) j1 on fn.project_id = j1.project_id and fn.moa_no = j1.moa_no 
	left outer join ( select 
						m.project_id, 
						m.moa_no, 
						m.j_buyer_id, 
						isnull(m.surname,'') + ' ' + isnull(m.given_name,'') bName 
					  from 
						moa_joint_buyer m,
						( select 
							m1.project_id, 
							m1.moa_no, 
							min(m1.j_buyer_id) min_j_id, 
							case when max(m1.j_buyer_id) = min(m1.j_buyer_id) then '' else max(m1.j_buyer_id) end max_j_id
						  from 
							moa_joint_buyer m1 
						  where 
							project_id = '' + @ProjectID + ''
						  group by m1.project_id, m1.moa_no
						) n
					  where 
						m.project_id = n.project_id 
						and m.moa_no = n.moa_no 
						and m.j_buyer_id > n.min_j_id 
						and m.j_buyer_id < isnull(n.max_j_id, m.j_buyer_id) 
						and m.project_id = '' + @ProjectID + ''
					 ) j2 on fn.project_id = j2.project_id and fn.moa_no = j2.moa_no 
	left outer join ( select 
						m2.project_id, 
						m2.moa_no, 
						m2.j_buyer_id, 
						isnull(m2.surname,'') + ' ' + isnull(m2.given_name,'') bName 
					  from 
						moa_joint_buyer m2,
						( select 
							m1.project_id, 
							m1.moa_no,
							min(m1.j_buyer_id) min_j_id, 
							case when max(m1.j_buyer_id) = min(m1.j_buyer_id) then '' else max(m1.j_buyer_id) end max_j_id
						  from 
							moa_joint_buyer m1 
						  where 
							project_id = '' + @ProjectID + ''
						  group by m1.project_id, m1.moa_no
						) n2
					  where 
						m2.project_id = n2.project_id 
						and m2.moa_no = n2.moa_no 
						and m2.j_buyer_id = n2.max_j_id 
						and m2.project_id = '' + @ProjectID + ''
					 ) j3 on fn.project_id = j3.project_id and fn.moa_no = j3.moa_no 
where fn.project_id = '' + @ProjectID + ''
*/
select distinct 
	fn.project_id project_id, 
	fn.moa_no moa_no, 
	case when j1.bName is null then '' when j1.bName = '' then '' else j1.bName + ', ' end +
	case when j2.bName is null then '' when j2.bName = '' then '' else j2.bName + ', ' end + 
	case when j3.bName is null then '' when j3.bName = '' then '' else j3.bName + ', ' end bName
into 
	#RP11b
from 
	moa_formal_joint_buyer fn 
	inner join MOA_FORMAL mf on fn.PROJECT_ID = mf.PROJECT_ID and fn.MOA_NO = mf.MOA_NO and fn.FORMAL_SEQ = mf.FORMAL_SEQ and mf.FORMAL_STATUS = 'C'
	left outer join ( select 
						m1.project_id, 
						m1.moa_no, 
						m1.j_buyer_id, 
						isnull(m1.surname,'') + ' ' + isnull(m1.given_name,'') bName 
					  from 
						moa_formal_joint_buyer m1
						inner join MOA_FORMAL mf on m1.PROJECT_ID = mf.PROJECT_ID and m1.MOA_NO = mf.MOA_NO and m1.FORMAL_SEQ = mf.FORMAL_SEQ and mf.FORMAL_STATUS = 'C',
						( select 
							m1.project_id, 
							m1.moa_no, 
							min(m1.j_buyer_id) min_j_id, 
							case when max(m1.j_buyer_id) = min(m1.j_buyer_id) then '' else max(m1.j_buyer_id) end max_j_id
						  from 
							moa_formal_joint_buyer m1 
							inner join MOA_FORMAL mf on m1.PROJECT_ID = mf.PROJECT_ID and m1.MOA_NO = mf.MOA_NO and m1.FORMAL_SEQ = mf.FORMAL_SEQ and mf.FORMAL_STATUS = 'C'						  
						where 
							m1.project_id = '' + @ProjectID + ''
						  group by m1.project_id, m1.moa_no
						) n1
					  where 
						m1.project_id = n1.project_id 
						and m1.moa_no = n1.moa_no 
						and m1.j_buyer_id = n1.min_j_id 
						and m1.project_id = '' + @ProjectID + ''
					 ) j1 on fn.project_id = j1.project_id and fn.moa_no = j1.moa_no 
	left outer join ( select 
						m.project_id, 
						m.moa_no, 
						m.j_buyer_id, 
						isnull(m.surname,'') + ' ' + isnull(m.given_name,'') bName 
					  from 
						moa_formal_joint_buyer m
						inner join MOA_FORMAL mf on m.PROJECT_ID = mf.PROJECT_ID and m.MOA_NO = mf.MOA_NO and m.FORMAL_SEQ = mf.FORMAL_SEQ and mf.FORMAL_STATUS = 'C',
						( select 
							m1.project_id, 
							m1.moa_no, 
							min(m1.j_buyer_id) min_j_id, 
							case when max(m1.j_buyer_id) = min(m1.j_buyer_id) then '' else max(m1.j_buyer_id) end max_j_id
						  from 
							moa_formal_joint_buyer m1 
							inner join MOA_FORMAL mf on m1.PROJECT_ID = mf.PROJECT_ID and m1.MOA_NO = mf.MOA_NO and m1.FORMAL_SEQ = mf.FORMAL_SEQ and mf.FORMAL_STATUS = 'C'
						  where 
							m1.project_id = '' + @ProjectID + ''
						  group by m1.project_id, m1.moa_no
						) n
					  where 
						m.project_id = n.project_id 
						and m.moa_no = n.moa_no 
						and m.j_buyer_id > n.min_j_id 
						and m.j_buyer_id < isnull(n.max_j_id, m.j_buyer_id) 
						and m.project_id = '' + @ProjectID + ''
					 ) j2 on fn.project_id = j2.project_id and fn.moa_no = j2.moa_no 
	left outer join ( select 
						m2.project_id, 
						m2.moa_no, 
						m2.j_buyer_id, 
						isnull(m2.surname,'') + ' ' + isnull(m2.given_name,'') bName 
					  from 
						moa_formal_joint_buyer m2
						inner join MOA_FORMAL mf on m2.PROJECT_ID = mf.PROJECT_ID and m2.MOA_NO = mf.MOA_NO and m2.FORMAL_SEQ = mf.FORMAL_SEQ and mf.FORMAL_STATUS = 'C',
						( select 
							m1.project_id, 
							m1.moa_no,
							min(m1.j_buyer_id) min_j_id, 
							case when max(m1.j_buyer_id) = min(m1.j_buyer_id) then '' else max(m1.j_buyer_id) end max_j_id
						  from 
							moa_formal_joint_buyer m1 
							inner join MOA_FORMAL mf on m1.PROJECT_ID = mf.PROJECT_ID and m1.MOA_NO = mf.MOA_NO and m1.FORMAL_SEQ = mf.FORMAL_SEQ and mf.FORMAL_STATUS = 'C'
						  where 
							m1.project_id = '' + @ProjectID + ''
						  group by m1.project_id, m1.moa_no
						) n2
					  where 
						m2.project_id = n2.project_id 
						and m2.moa_no = n2.moa_no 
						and m2.j_buyer_id = n2.max_j_id 
						and m2.project_id = '' + @ProjectID + ''
					 ) j3 on fn.project_id = j3.project_id and fn.moa_no = j3.moa_no 
where fn.project_id = '' + @ProjectID + ''


select 
	mf.project_id ProjectID,
	pm.prj_name ProjectName,
	case when fm.dev_code is null then (select dev_name from development where dev_code = cp.dev_code) 
		 when fm.dev_code = '' then (select dev_name from development where dev_code = cp.dev_code)
		 else (select dev_name from development where dev_code = fm.dev_code) end Phase,
	pm.base_curr_id ProjectCurr,
	pm.uom_code ProjectUom,
	case when @DateStart is null then null else convert(Datetime, '' + @DateStart + '', 105) end FromDate,
	case when @DateEnd is null then null else convert(Datetime, '' + @DateEnd + '', 105) end ToDate,
	mf.transfer_date Date, 
	case when mf.transfer_seq < 0 then '(Deleted)' else cast(mf.transfer_seq as varchar) end Transfer_Seq, 
	case 
		when fm.fm_blk is null then '' 
		when fm.fm_blk = '' then '' 
		else ISNULL((select block_desc from block where project_id = fm.project_id and block_id = fm.fm_blk), fm_blk)
	end U_Block, 
	case when fm.fm_hse_no is null then '' when fm.fm_hse_no = '' then '' else 'Hse: ' + fm.fm_hse_no end U_HouseNo,
	isnull(fm.fm_floor, '') U_Floor, 
	isnull(fm.fm_flat, '') U_Flat,
	fm.fm_gr_area_sf U_GFA, 
	case when fm.fm_blk is null and fm.fm_hse_no is null then null when mf.amt is null then 0 when mf.amt = 0 then 0 else mf.amt / mf.curr_rate - isnull(cp.park_list_price, 0) end U_Price,
	case 
		when fm.fm_blk is null and fm.fm_hse_no is null then null 
		when fm.fm_gr_area_sf is null then 0 
		when fm.fm_gr_area_sf = 0 then 0 
		else (
				( case 
					when mf.amt is null then 0 
					when mf.amt = 0 then 0 
					else mf.amt / mf.curr_rate - isnull(cp.park_list_price, 0) end
				) / fm.fm_gr_area_sf
			  ) 
	end U_PriceAvg,
	isnull(cp.park_level, '') CP_Level,
	isnull(cp.car_park_no, '') CP_NO,
	isnull(cp.house_no, '') CP_HouseNo,
	cp.park_list_price CP_Price, 
	mf.amt / mf.curr_rate TransferPrice,
	isnull(mf.service_charge, 0) ServiceChargeAmt,
	case moa.show_cash_rebate 
		when N'Y' then moa.moa_tot_price 
		else moa.moa_price 
	end OriginalContractPrice,
	case 
		when case moa.show_cash_rebate 
				when N'Y' then moa.moa_tot_price 
				else moa.moa_price 
			 end is null then 0 
		when case moa.show_cash_rebate 
				when N'Y' then moa.moa_tot_price 
				else moa.moa_price 
			 end = 0 then 0 
		else
			isnull(mf.service_charge, 0) / case moa.show_cash_rebate 
												when N'Y' then moa.moa_tot_price 
												else moa.moa_price 
										   end * 100 
	end ServiceChargePercentOrg,

--BEGIN #20100816
	case 
	when mf.transfer_seq - 1 = 0 
	then ( case	when m.surname is null and m.given_name is null 
				then m.co_name 
				when m.co_name is null 
				then isnull(m.surname,'') + ' ' + isnull(m.given_name,'') + (case when rb.bName is null 
																							  then '' 
																							  when ra.bName = '' 
																							  then '' 
																							  else ', ' + substring(rb.bName, 1, len(rb.bName) - 1) 
																						 end) 
				else isnull(m.surname,'') + ' ' + isnull(m.given_name,'') + (case when rb.bName is null 
																							  then '' 
																							  when ra.bName = '' 
																							  then '' 
																							  else ', ' + substring(rb.bName, 1, len(rb.bName) - 1) 
																						  end) + ', ' + m.co_name 
			end) 
	when mf.transfer_seq - 1 < 0 
	then ( case	when mf.master_transfer_seq = 0 
				then ( case	when m.surname is null and m.given_name is null 
							then m.co_name 
							when m.co_name is null 
							then isnull(m.surname,'') + ' ' + isnull(m.given_name,'') + (case when rb.bName is null 
																										  then '' 
																										  when ra.bName = '' 
																										  then '' 
																										  else ', ' + substring(rb.bName, 1, len(rb.bName) - 1) 
																									 end) 
							else isnull(m.surname,'') + ' ' + isnull(m.given_name,'') + ( case when rb.bName is null 
																										   then '' 
																										   when ra.bName = '' 
																										   then '' 
																										   else ', ' + substring(rb.bName, 1, len(rb.bName) - 1) 
																									  end) + ', ' + m.co_name
					   end) 
				else ( case	when rd.surname is null and rd.given_name is null 
							then rd.co_name 
							when rd.co_name  is null 
							then isnull(rd.surname,'') + ' ' + isnull(rd.given_name,'') + ( case when rd.bName is null 
																								 then '' 
																								 when rd.bName = '' 
																								 then ''
																								 else ', ' + substring(rd.bName, 1, len(rd.bName) - 1) 
																							end) 
							else isnull(rd.surname,'') + ' ' + isnull(rd.given_name,'') + ( case when rd.bName is null 
																								 then '' 
																								 when rd.bName = '' 
																								 then '' 
																								 else ', ' + substring(rd.bName, 1, len(rd.bName) - 1) 
																							end)  + ', ' +  rd.co_name 
						end) 
		 end)
	else
		(case when rc.surname is null and rc.given_name is null 
			  then rc.co_name 
			  when rc.co_name is null 
			  then isnull(rc.surname,'') + ' ' + isnull(rc.given_name,'') + (case when rc.bName is null 
																				  then '' 
																				  when rc.bName = '' 
																				  then '' 
																				  else ', ' + substring(rc.bName, 1, len(rc.bName) - 1) 
																			 end) 
			  else isnull(rc.surname,'') + ' ' + isnull(rc.given_name,'') + (case when rc.bName is null 
																				  then '' 
																				  when rc.bName = '' 
																				  then '' 
																				  else ', ' + substring(rc.bName, 1, len(rc.bName) - 1) 
																			 end) + ', ' + rc.co_name
		end) 
	end Transferor,

	case when mf.surname is null and mf.given_name is null 
		 then mf.co_name 
		 when mf.co_name is null 
		 then isnull(mf.surname,'') + ' ' + isnull(mf.given_name,'') + (case when ra.bName is null 
																			 then '' 
																			 when ra.bName = '' 
																			 then '' 
																			 else ', ' + substring(ra.bName, 1, len(ra.bName) - 1) 
																		end)
		 else isnull(mf.surname,'') + ' ' + isnull(mf.given_name,'') + (case when ra.bName is null 
																			 then '' 
																			 when ra.bName = '' 
																			 then '' 
																			 else ', ' + substring(ra.bName, 1, len(ra.bName) - 1) 
																		end) + ', ' + mf.co_name
	end Transferee
--END #20100816

from 
	moa_transfer mf
	--left outer join flat_master fm on mf.project_id = fm.project_id and mf.moa_no = fm.moa_no
	left outer join VW_RPT_FLAT_MASTER fm on mf.project_id = fm.project_id and mf.moa_no = fm.moa_no
	left outer join car_park cp on mf.project_id = cp.project_id and mf.moa_no = cp.moa_no
	left outer join (select 
						project_id, 
						moa_no, 
						transfer_seq, 
						bName 
					 from 
						#RP11a
					 where 
						project_id = '' + @ProjectID + ''
					) ra on mf.project_id = ra.project_id and mf.moa_no = ra.moa_no and mf.transfer_seq = ra.transfer_seq 
	left outer join (select 
						m.project_id project_id, 
						m.moa_no moa_no, 
						m.transfer_seq transfer_seq, 
						m.co_name co_name, 
						isnull(m.given_name,'') given_name, 
						isnull(m.surname,'') surname, 
						isnull(a.bName, '') bName 
					  from 
						moa_transfer m 
						left outer join (select 
											project_id, 
											moa_no, 
											transfer_seq, 
											bName 
										  from #RP11a
										 ) a on m.project_id = a.project_id and m.moa_no = a.moa_no and m.transfer_seq = a.transfer_seq
					 ) rc on mf.project_id = rc.project_id and mf.moa_no = rc.moa_no and mf.transfer_seq - 1= rc.transfer_seq 
	left outer join (select 
						m.project_id project_id, 
						m.moa_no moa_no, 
						m.transfer_seq transfer_seq, 
						m.co_name co_name, 
						isnull(m.given_name,'') given_name, 
						isnull(m.surname,'') surname, 
						isnull(a.bName, '') bName 
					  from 
						moa_transfer m 
						left outer join (select 
											project_id, 
											moa_no, 
											transfer_seq, 
											bName 
										  from 
											#RP11a
										 ) a on m.project_id = a.project_id and m.moa_no = a.moa_no and m.transfer_seq = a.transfer_seq
					) rd on mf.project_id = rd.project_id and mf.moa_no = rd.moa_no and mf.master_transfer_seq = rd.transfer_seq
	, MOA_FORMAL m left outer join (select 
								project_id, 
								moa_no, 
								bName 
							  from #RP11b
							) rb on m.project_id = rb.project_id and m.moa_no = rb.moa_no, project_master pm, MOA moa
where 
	mf.transfer_seq >0 
	and mf.project_id = '' + @ProjectID + '' 
	and mf.project_id = pm.project_id
	and mf.project_id = m.project_id 
	and mf.moa_no = m.moa_no
	and m.PROJECT_ID = moa.PROJECT_ID
	and m.MOA_NO = moa.MOA_NO
	and m.FORMAL_STATUS = 'C'
	and (@Phase is null or (fm.dev_code is not null and fm.dev_code = '' + @Phase + '') or (fm.dev_code is null and cp.dev_code is not null and cp.dev_code = '' + @Phase + ''))
	and (@Block  is null or (fm.fm_blk is not null and fm.fm_blk = '' + @Block + ''))
	and (@DateStart is null or convert(datetime, convert(varchar(10), mf.transfer_date, 105), 105) >= convert(Datetime, '' + @DateStart + '', 105))
	and (@DateEnd is null or convert(datetime, convert(varchar(10), mf.transfer_date, 105), 105) <= convert(Datetime, '' + @DateEnd + '', 105))
order by transfer_date, transfer_seq

return

GO
/****** Object:  StoredProcedure [dbo].[RP14]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[RP14] (
@ProjectID NVarchar(6), @Phase NVarChar(6), @Block nvarchar(6), @Floor nvarchar(50), @Flat nvarchar(3), @HouseNo nvarchar(7), @StreetNo nvarchar(4), @Street nvarchar(6))

 
As
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	
	
	set concat_null_yields_null off

	declare @sql nvarchar(Max)
	
	--BEGIN #20070321
	--BEGIN #20070308
	select @sql = N'select FM.project_id PROJECTID, concat(PM.prj_name_chi,PM.prj_name_eng) PROJECTNAME, D.Dev_Name Phase, 
			ISNULL(B.Block_Desc, FM.fm_blk) Block, 
			IsNUll(FM.fm_floor,'''') Floors, IsNUll(FM.fm_flat,'''') Flat, IsNUll(FM.fm_hse_no,'''') HouseNo, IsNUll(FM.fm_str_no,'''') StreetNo, S.Str_Name Street,
			FP.adj_no NSeq, FP.up_dt UDate, FP.org_price Org_Price, FP.new_price New_Price,
			FP.Up_Uid Up_Uid, FP.Up_Fid Up_Fid
			from FLAT_PRICE_AUDIT FP 
			left outer join VW_RPT_FLAT_MASTER FM on (FP.fm_code = FM.fm_code And FP.Project_ID = FM.Project_ID) 
			left outer join PROJECT_MASTER PM on (FM.project_id = PM.project_id)
			left outer join Development D on (D.Dev_Code = FM.Dev_Code) 
			left outer join Block B on (FM.fm_blk = B.Block_ID and FM.project_id = B.project_id)
			left outer join Street S on (FM.str_code = S.Str_Code and FM.project_id = S.project_id)
			where FM.PROJECT_ID = ''' + replace(@ProjectID, '''', '''''') + '''' 
			+ case when isnull(@Phase,'') <> '' or len(@Phase) > 0 then ' and FM.Dev_Code = @Phase' end
			+ case when isnull(@Block,'') <> '' or len(@Block) > 0 then ' and FM.fm_blk = @Block' end
			+ case when isnull(@Floor,'') <> '' or len(@Floor) > 0 then ' and FM.fm_floor = @Floor' end
			+ case when isnull(@Flat,'') <> '' or len(@Flat) > 0 then ' and FM.fm_flat = @Flat' end
			+ case when isnull(@HouseNo,'') <> '' or len(@HouseNo) > 0 then ' and FM.fm_hse_no = @HouseNo' end
			+ case when isnull(@StreetNo,'') <> '' or len(@StreetNo) > 0 then ' and FM.fm_str_no = @StreetNo' end
			+ case when isnull(@Street,'') <> '' or len(@Street) > 0 then ' and FM.str_code = @Street' end
			/*+ ' order by right(Stuff(N''000000'', 6,1, Convert(NVarChar(6), C.PARK_LEVEL)), 6), right(Stuff(N''000000'', 6,1, Convert(NVarChar(6), C.CAR_PARK_NO)), 6)'*/
			
			exec sp_executesql @sql, N' @Phase NVarChar(6), @Block nvarchar(6), @Floor nvarchar(7), @Flat nvarchar(3), @HouseNo nvarchar(7), @StreetNo nvarchar(4), @Street nvarchar(6)',
			@Phase , @Block , @Floor , @Flat , @HouseNo , @StreetNo , @Street 

	--END #20070308
	--END #20070321

GO
/****** Object:  StoredProcedure [dbo].[RP15]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[RP15] (
@ProjectID NVarchar(6), @P_AM_Status NVarchar(1), @P_AM_DATE NVarchar(10), @SNP_DATE NVarchar(10), @F_AM_STATUS NVarchar(1), @Phase NVarChar(6), @Block nvarchar(6))

 
As
	
	exec master..xp_ASL '[weKDisnmvie)}6&'
	
	
	set concat_null_yields_null off

	Declare @sql nvarchar(Max)
	Declare @sql_where nvarchar(Max)
	
	Select @sql_where = ''

	Select @sql = 'Select 
						M.MOA_NO P_AM_NO, 
						Case When M.MOA_STATUS = ''O'' Then ''開啟'' 
							When M.MOA_STATUS = ''C'' Then ''確認'' 
							When M.MOA_STATUS = ''X'' Then ''取消'' 
							When M.MOA_STATUS = ''V'' Then ''無效''
							Else ''--'' 
					    End P_AM_STATUS, 
						Convert(Varchar,M.MOA_DT,103) P_AM_DATE, 
						Convert(Varchar,M.SNP_DATE,103) SNP_DATE, 
						Case When Convert(Varchar,MF.FORMAL_SEQ) Is NULL Then ''--'' Else Convert(Varchar,MF.FORMAL_SEQ) End F_AM_SEQ,
						Case When MF.FORMAL_STATUS = ''O'' Then ''開啟''
							When MF.FORMAL_STATUS = ''C'' Then ''確認''
							When MF.FORMAL_STATUS = ''X'' Then ''取消''
							When MF.FORMAL_STATUS = ''V'' Then ''無效''
							Else ''--''
						End F_AM_STATUS,
						Convert(Varchar,MF.FORMAL_DATE,103) F_AM_DATE,
						Case When FM.FM_BLK Is NULL Then ''--'' Else FM.FM_BLK End FM_BLOCK,
						Case When FM.FM_FLOOR Is NULL Then ''--'' Else FM.FM_FLOOR End FM_FLOOR,
						Case When FM.FM_FLAT Is NULL Then ''--'' Else FM.FM_FLAT End FM_FLAT,
						Case When CP.PARK_LEVEL Is NULL Then ''--'' Else CP.PARK_LEVEL End CP_LEVEL,
						Case When CP.CAR_PARK_NO Is NULL Then ''--'' Else CP.CAR_PARK_NO End CP_NO,
						ISNULL(M.MOA_PRICE,0) CONTRACT_PRICE,
						Case When PM.PRJ_NAME_CHI Is NULL Then ''--'' Else PM.PRJ_NAME_CHI End PRJ_NAME_CHI,
						Case When M.MOA_STATUS = ''O'' And M.SNP_DATE < GETDATE() Then ''Y'' Else ''N'' End Flag
				   From
						MOA M
						Left Join MOA_FORMAL MF on M.PROJECT_ID = MF.PROJECT_ID And M.MOA_NO = MF.MOA_NO
						Left Join VW_RPT_FLAT_MASTER FM on M.PROJECT_ID = FM.PROJECT_ID And M.MOA_NO = FM.MOA_NO
						Left Join CAR_PARK CP on M.PROJECT_ID = CP.PROJECT_ID And M.MOA_NO = CP.MOA_NO
						Inner Join PROJECT_MASTER PM on M.PROJECT_ID = PM.PROJECT_ID 
				   Where M.Project_ID = ''' + @ProjectID + ''' '
	
	If @P_AM_Status is not null
		select @sql_where = @sql_where + ' And M.MOA_STATUS = ''' + @P_AM_Status + ''' '
		
	If @P_AM_DATE is not null
		select @sql_where = @sql_where + ' And Convert(varchar,M.MOA_DT,105) = ''' + @P_AM_DATE + ''' '
		
	If @SNP_DATE is not null
		select @sql_where = @sql_where + ' And Convert(varchar,M.SNP_DATE,105) = ''' + @SNP_DATE + ''' '
		
	If @F_AM_STATUS is not null
		select @sql_where = @sql_where + ' And MF.FORMAL_STATUS = ''' + @F_AM_STATUS + ''' '
		
	If @Phase is not null
		select @sql_where = @sql_where + ' And FM.DEV_CODE = ''' + @Phase + ''' '
		
	If @Block is not null
		select @sql_where = @sql_where + ' And FM.FM_BLK = ''' + @Block + ''' '
		
	Select @sql = @sql + @sql_where
					
	Exec sp_executesql @sql

GO
/****** Object:  StoredProcedure [dbo].[RP16]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RP16]
(
	@PROJECTID NVARCHAR(6),
	@PHASE NVARCHAR(6),
	@DATETO NVARCHAR(10),
	@SHOWREMARK NCHAR(1)
)
 
AS
	
	--exec master..xp_ASL '[weKDisnmvie)}6&'

	Declare @MOA_NO NVarChar(20)
	Declare @Phase_Name NVarChar(50)
	
	If @PHASE IS NOT NULL And @PHASE <> ''
	Begin
		Select
			@Phase_Name = DEV_NAME
		From
			DEVELOPMENT
		Where
			DEV_CODE = @PHASE
	End

	SELECT 	M.PROJECT_ID N'ProjectID',
			(SELECT concat(PRJ_NAME_CHI,PRJ_NAME_ENG) FROM PROJECT_MASTER WHERE PROJECT_ID = M.PROJECT_ID) N'ProjectName', 
			ISNULL(F.DEV_CODE, CP.DEV_CODE) N'PhaseID',
			--ISNULL(F.DEV_NAME, CP.DEV_NAME) N'Phase',
			ISNULL(@Phase_Name, '') N'Phase',
			ISNULL(F.FM_BLK,'') N'BlockID', 
			ISNULL(F.BLOCK_DESC,'') N'Block',
			ISNULL(F.FM_HSE_NO,'') N'HouseNo', 
			ISNULL(F.FM_FLOOR,'') N'Floor', 
			ISNULL(F.FM_FLAT,'') N'Flat',
			ISNULL(CP.CAR_PARK_NO,'') N'CPNo', 
			ISNULL(CP.HOUSE_NO,'') N'CPHseNo', 
			ISNULL(CP.PARK_LEVEL,'') N'CPLevel',
			ISNULL(M.MOA_NO,'A') N'AgreementNo',
			--MF.FORMAL_AG_NO N'Formal_Ag_No', 
			--convert(VARCHAR(10), MF.FORMAL_DATE, 105) N'F_MOA_DT', 
			convert(VARCHAR(10), M.LOCK_UP_PERIOD, 105) N'Lock_Up_Period', 
			CONVERT(VARCHAR(10), M.SNP_Date, 105) N'SNP_Date',
			MP.PY_PLAN_SEQ, 
			ISNULL(MPF.PY_PLAN_SEQ,'0') N'PY_PLAN_SEQ_MPF', 
			convert(VARCHAR(10), MP.PY_DATE_DUE, 105) N'Due_Date', 
			 MP.PY_DT_FACT N'SPDate',
			MP.PY_DT_CAL_TYPE,
			ISNULL(MPF.PAID,'0') N'Paid_Amt', 
			MP.PY_STATUS, 
			ISNULL(MP.PY_PAYMT_DUE,'0') N'Payment_Due', 
			ISNULL((ISNULL(MP.PY_PAYMT_DUE,'0')-ISNULL(MPF.PAID,'0')),'0') N'Own_Pament', 
			--CASE WHEN JB.BNAME IS NULL
			--	THEN ISNULL(MF.BUYER,'')
			--ELSE (ISNULL(MF.BUYER,'') + ',' + JB.BNAME) 
			--END N'Buyers',
			--'' N'Buyers',
			--dbo.SF_GetLastPurchaser(@PROJECTID, M.MOA_NO, 'N') N'Buyers',
			--MF.CONT_PERSON N'Cont_Person', 
			--ISNULL((SELECT REGION_DESC 
			--			FROM REGION 
			--		WHERE REGION_CODE=MF.REGION_CODE),'') N'Region',
			--ISNULL((SELECT DIST_NAME 
			--			FROM DISTRICT 
			--		WHERE DIST_CODE=MF.DIST_CODE),'') N'District', 
			--ISNULL((SELECT COUNTRY_DESC 
			--			FROM COUNTRY 
			--		WHERE COUNTRY_CODE=MF.COUNTRY_CODE),'') N'Country',
			--MF.ADDRESS N'Address', 
			--MF.TEL_NO N'Tel', 
			-- BEGIN #20111111
			ML.CONT_NAME N'Cont_Person', 
			R.REGION_DESC N'Region',
			D.DIST_NAME N'District',
			C.COUNTRY_DESC N'Country',
			ISNULL(ML.ADDR_1, '') + ' ' + ISNULL(ML.ADDR_2, '') + ' ' + ISNULL(ML.ADDR_3, '') N'Address',
			ISNULL(ML.HOME_TEL, '') + ' ' + ISNULL(ML.OFFICE_TEL, '') + ' ' + ISNULL(ML.MOBILE, '') N'Tel',
			ML.FAX N'Fax',
			ML.EMAIL N'Email',
			--dbo.SF_GetLastPurchaser(@PROJECTID, M.MOA_NO, 'P') N'Cont_Person',
			--dbo.SF_GetLastPurchaser(@PROJECTID, M.MOA_NO, 'R') N'Region',
			--dbo.SF_GetLastPurchaser(@PROJECTID, M.MOA_NO, 'D') N'District',
			--dbo.SF_GetLastPurchaser(@PROJECTID, M.MOA_NO, 'C') N'Country',
			--dbo.SF_GetLastPurchaser(@PROJECTID, M.MOA_NO, 'A') N'Address',
			--dbo.SF_GetLastPurchaser(@PROJECTID, M.MOA_NO, 'T') N'Tel',
			--dbo.SF_GetLastPurchaser(@PROJECTID, M.MOA_NO, 'F') N'Fax',
			--dbo.SF_GetLastPurchaser(@PROJECTID, M.MOA_NO, 'E') N'Email',
			--MF.OFF_TEL N'Off_Tel', -- Mixed into TEL_NO
			--MF.MOBILE N'Mobile',   -- Mixed into TEL_NO
			-- END #20111111
			--MF.FAX N'Fax', 
			--MF.EMAIL N'Email',
			ISNULL(M.MOA_AG_NAME,'') N'Ag_Name',
			ISNULL(M.MOA_AG_ID,'') N'Ag_ID',
			ISNULL(M.MOA_AG_TEL,'') N'Ag_TEL',
			(SELECT AGENCY_NAME 
				FROM AGENCY 
			WHERE AGENCY_CODE=M.MOA_AGENCY) N'Agency',
			MP.PY_DESC N'Payment_Stage'
	INTO #RP16
	FROM MOA M
		-- INNER JOIN 
		-- (
		--	SELECT 
		--		PROJECT_ID, 
		--		MOA_NO, 
		--		FORMAL_STATUS, 
		--		CASE WHEN FORMAL_STATUS = 'C' THEN MOA_NO + 'F' + CONVERT(VARCHAR,FORMAL_SEQ) END FORMAL_AG_NO, 
		--		FORMAL_DATE, 
		--		CASE WHEN [TYPE] = 'I' Then
		--				ISNULL(SURNAME, '') + ' ' + ISNULL(GIVEN_NAME,'')
		--			 WHEN [TYPE] = 'C' Then
		--				ISNULL(CO_NAME, '') 
		--			 WHEN [TYPE] = 'O' Then
		--				ISNULL(SURNAME, '') + ' ' + ISNULL(GIVEN_NAME,'') + ', ' + ISNULL(CO_NAME, '')
		--		END BUYER,
		--		ISNULL(DIRECTOR_SURNAME1,'')+' '+ ISNULL(DIRECTOR_GIVEN_NAME1,'')D1_NAME,
		--		ISNULL(DIRECTOR_SURNAME2,'')+' '+ISNULL(DIRECTOR_GIVEN_NAME2,'')D2_NAME,  
		--		ISNULL(CONT_PERSON,'')CONT_PERSON, 
		--		ISNULL(ADD1,'') + ISNULL(ADD2,'') + ISNULL(ADD3,'') + ISNULL(ADD4,'')ADDRESS,
		--		ISNULL(AREA,'')AREA, 
		--		ISNULL(REGION_CODE,'')REGION_CODE, 
		--		ISNULL(DIST_CODE,'')DIST_CODE, 
		--		ISNULL(COUNTRY_CODE,'')COUNTRY_CODE,
		--		ISNULL(TEL_NO,'')TEL_NO, 
		--		ISNULL(OFF_TEL,'')OFF_TEL, 
		--		ISNULL(MOBILE,'')MOBILE, 
		--		ISNULL(FAX,'')FAX, 
		--		ISNULL(EMAIL,'')EMAIL
		--	FROM MOA_FORMAL
		--)MF ON MF.PROJECT_ID=M.PROJECT_ID AND MF.MOA_NO=M.MOA_NO AND MF.FORMAL_STATUS = 'C'
		INNER JOIN 
		(
			SELECT 
				PROJECT_ID, 
				AM_NO, 
				PY_PLAN_SEQ, 
				--#20171030 s
				--PY_DATE_DUE, 
				--PY_DT_FACT, 
				ISNULL(PY_DATE_DUE, OTHER_PY_DUE_DATE ) PY_DATE_DUE,
				ISNULL( PY_DATEDUE_DESC, PY_DT_FACT) PY_DT_FACT,
				--#20171030 e
				ISNULL(PY_STATUS,'N')PY_STATUS, 
				PY_PAYMT_DUE, 
				PY_DT_CAL_TYPE,
				PY_DESC
			FROM AM_PAYMENT_PLAN --WHERE PY_DATE_DUE > CONVERT(DATETIME, @DATEFROM, 105) AND PY_DATE_DUE < CONVERT(DATETIME, @DATETO, 105)
		)MP ON MP.PROJECT_ID=M.PROJECT_ID AND MP.AM_NO=M.MOA_NO AND (MP.PY_STATUS='N' OR MP.PY_DT_CAL_TYPE='T')
		--OR (MP.MOA_NO = MF.MOA_NO AND MP.PY_DT_CAL_TYPE='T')
		LEFT OUTER JOIN 
		(
			SELECT 
				PP.* 
			FROM (
					SELECT 	
						A.PROJECT_ID, 
						A.AM_NO, 
						A.METHOD_CODE, 
						A.PY_PAYMT_DUE, 
						A.PY_DATE_DUE, 
						A.PY_PLAN_SEQ
					FROM AM_PAYMENT_PLAN A
					WHERE 
						A.PY_PLAN_SEQ = (
							SELECT 
								TOP 1 B.PY_PLAN_SEQ
							FROM AM_PAYMENT_PLAN B
							WHERE 
								A.PROJECT_ID = B.PROJECT_ID 
								AND A.AM_NO = B.AM_NO
								AND A.METHOD_CODE = B.METHOD_CODE
							ORDER BY B.PY_PLAN_SEQ
						)
				)MPT
				LEFT OUTER JOIN 
				(
					SELECT 
						PROJECT_ID, 
						AM_NO, 
						PY_PLAN_SEQ, 
						SUM(ISNULL(PAID_AMT, 0))PAID
					FROM AM_PAYMENT_FU_TRANS
					GROUP BY PROJECT_ID, AM_NO, PY_PLAN_SEQ
				)PP ON MPT.PROJECT_ID = PP.PROJECT_ID AND MPT.AM_NO = PP.AM_NO
		)MPF ON MPF.PROJECT_ID = MP.PROJECT_ID AND MPF.AM_NO=MP.AM_NO AND MPF.PY_PLAN_SEQ=MP.PY_PLAN_SEQ
		LEFT OUTER JOIN 
		(
			SELECT 
				F.*, 
				D.DEV_NAME, 
				B.BLOCK_DESC
			FROM FLAT_MASTER F
				 LEFT OUTER JOIN DEVELOPMENT D ON (F.DEV_CODE = D.DEV_CODE)
				 LEFT OUTER JOIN BLOCK B ON (F.PROJECT_ID = B.PROJECT_ID AND F.FM_BLK = B.BLOCK_ID)
		) F ON (M.PROJECT_ID = F.PROJECT_ID AND M.MOA_NO = F.MOA_NO)
		LEFT OUTER JOIN 
		(
			SELECT 
				CP.*, 
				D.DEV_NAME
			FROM CAR_PARK CP
				 LEFT OUTER JOIN DEVELOPMENT D ON (CP.DEV_CODE = D.DEV_CODE)
		) CP ON (M.PROJECT_ID = CP.PROJECT_ID AND M.MOA_NO = CP.MOA_NO)
		
		Left Outer Join (
select AM_NO, FM_CP_CODE from 
	MOA M join (
	SELECT AM_NO, MAX(FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	GROUP BY AM_NO, FM_CP)tmp
	on ( M.MOA_NO =  AM_NO and 
	(tmp.SEQ =1 or 
	(tmp.seq =2 and m.MOA_NO not in (
	select tmp3.AM_NO from 
	(
	select * from (SELECT  AM_NO, max (FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	GROUP BY AM_NO, FM_CP)
	tmp where tmp.seq =1 )tmp3
	 join 
	(
	select * from (SELECT  AM_NO, max (FM_CP_CODE)'FM_CP_CODE', CASE WHEN FM_CP = 'F' THEN 1 ELSE 2 END SEQ 
	FROM AM_ITEM 
	GROUP BY AM_NO, FM_CP)
	tmp1 where tmp1.seq =2 ) tmp4 
	on  tmp3.AM_NO = tmp4.AM_NO
	))))

	)Uni on (F.FM_CODE = Uni.FM_CP_CODE  or CP.CAR_PARK_ID = FM_CP_CODE ) and M.MOA_NO=Uni.AM_NO
		-- BEGIN #20111111
		LEFT OUTER JOIN MAILING_LIST ML ON M.PROJECT_ID = ML.PRJ_ID AND M.MOA_NO = ML.REG_NO
		LEFT OUTER JOIN COUNTRY C ON ML.COUNTRY = C.COUNTRY_CODE
		LEFT OUTER JOIN DISTRICT D ON ML.DISTRICT = D.DIST_CODE
		LEFT OUTER JOIN REGION R ON ML.REGION_CODE = R.REGION_CODE
		where uni.FM_CP_CODE = f.FM_CODE or CP.CAR_PARK_ID = FM_CP_CODE 
		-- END #20111111
		--LEFT OUTER JOIN 
		--(
		--	SELECT 
		--		DISTINCT FN.PROJECT_ID PROJECT_ID, 
		--		FN.MOA_NO MOA_NO, 
		--		CASE WHEN J1.BNAME IS NULL THEN '' WHEN J1.BNAME = '' THEN '' ELSE J1.BNAME + ', ' END +
		--		CASE WHEN J2.BNAME IS NULL THEN '' WHEN J2.BNAME = '' THEN '' ELSE J2.BNAME + ', ' END + 
		--		CASE WHEN J3.BNAME IS NULL THEN '' WHEN J3.BNAME = '' THEN '' ELSE J3.BNAME END BNAME
		--	FROM MOA_FORMAL_JOINT_BUYER FN 
		--		 INNER JOIN MOA_FORMAL MF ON FN.PROJECT_ID = MF.PROJECT_ID AND FN.MOA_NO = MF.MOA_NO AND FN.FORMAL_SEQ = MF.FORMAL_SEQ AND MF.FORMAL_STATUS = 'C'
		--		 LEFT OUTER JOIN 
		--		 ( 
		--			SELECT 
		--				M1.PROJECT_ID, 
		--				M1.MOA_NO, 
		--				M1.J_BUYER_ID, 
		--				ISNULL(M1.SURNAME,'') + ' ' + ISNULL(M1.GIVEN_NAME,'') BNAME 
		--			FROM MOA_FORMAL_JOINT_BUYER M1
		--				 INNER JOIN MOA_FORMAL MF ON M1.PROJECT_ID = MF.PROJECT_ID AND M1.MOA_NO = MF.MOA_NO AND M1.FORMAL_SEQ = MF.FORMAL_SEQ AND MF.FORMAL_STATUS = 'C',
		--				 ( 
		--					SELECT 
		--						M1.PROJECT_ID, 
		--						M1.MOA_NO, 
		--						MIN(M1.J_BUYER_ID) MIN_J_ID, 
		--						CASE WHEN MAX(M1.J_BUYER_ID) = MIN(M1.J_BUYER_ID) THEN '' ELSE MAX(M1.J_BUYER_ID) END MAX_J_ID
		--					FROM MOA_FORMAL_JOINT_BUYER M1 
		--						 INNER JOIN MOA_FORMAL MF ON M1.PROJECT_ID = MF.PROJECT_ID AND M1.MOA_NO = MF.MOA_NO AND M1.FORMAL_SEQ = MF.FORMAL_SEQ AND MF.FORMAL_STATUS = 'C'						  
		--					WHERE M1.PROJECT_ID = '' + @PROJECTID + ''
		--					GROUP BY M1.PROJECT_ID, M1.MOA_NO
		--				  ) N1
		--			WHERE M1.PROJECT_ID = N1.PROJECT_ID 
		--				  AND M1.MOA_NO = N1.MOA_NO 
		--				  AND M1.J_BUYER_ID = N1.MIN_J_ID 
		--				  AND M1.PROJECT_ID = '' + @PROJECTID + ''
		--		) J1 ON FN.PROJECT_ID = J1.PROJECT_ID AND FN.MOA_NO = J1.MOA_NO 
		--		LEFT OUTER JOIN 
		--		( 
		--			SELECT 
		--				M.PROJECT_ID, 
		--				M.MOA_NO, 
		--				M.J_BUYER_ID, 
		--				ISNULL(M.SURNAME,'') + ' ' + ISNULL(M.GIVEN_NAME,'') BNAME 
		--			FROM MOA_FORMAL_JOINT_BUYER M
		--				 INNER JOIN MOA_FORMAL MF ON M.PROJECT_ID = MF.PROJECT_ID AND M.MOA_NO = MF.MOA_NO AND M.FORMAL_SEQ = MF.FORMAL_SEQ AND MF.FORMAL_STATUS = 'C',
		--				 ( 
		--					SELECT 
		--						M1.PROJECT_ID, 
		--						M1.MOA_NO, 
		--						MIN(M1.J_BUYER_ID) MIN_J_ID, 
		--						CASE WHEN MAX(M1.J_BUYER_ID) = MIN(M1.J_BUYER_ID) THEN '' ELSE MAX(M1.J_BUYER_ID) END MAX_J_ID
		--					FROM MOA_FORMAL_JOINT_BUYER M1 
		--						 INNER JOIN MOA_FORMAL MF ON M1.PROJECT_ID = MF.PROJECT_ID AND M1.MOA_NO = MF.MOA_NO AND M1.FORMAL_SEQ = MF.FORMAL_SEQ AND MF.FORMAL_STATUS = 'C'
		--					WHERE M1.PROJECT_ID = '' + @PROJECTID + ''
		--					GROUP BY M1.PROJECT_ID, M1.MOA_NO
		--				  ) N
		--			WHERE M.PROJECT_ID = N.PROJECT_ID 
		--				  AND M.MOA_NO = N.MOA_NO 
		--				  AND M.J_BUYER_ID > N.MIN_J_ID 
		--				  AND M.J_BUYER_ID < ISNULL(N.MAX_J_ID, M.J_BUYER_ID) 
		--				  AND M.PROJECT_ID = '' + @PROJECTID + ''
		--		) J2 ON FN.PROJECT_ID = J2.PROJECT_ID AND FN.MOA_NO = J2.MOA_NO 
		--		LEFT OUTER JOIN 
		--		( 
		--			SELECT 
		--				M2.PROJECT_ID, 
		--				M2.MOA_NO, 
		--				M2.J_BUYER_ID, 
		--				ISNULL(M2.SURNAME,'') + ' ' + ISNULL(M2.GIVEN_NAME,'') BNAME 
		--			FROM MOA_FORMAL_JOINT_BUYER M2
		--				 INNER JOIN MOA_FORMAL MF ON M2.PROJECT_ID = MF.PROJECT_ID AND M2.MOA_NO = MF.MOA_NO AND M2.FORMAL_SEQ = MF.FORMAL_SEQ AND MF.FORMAL_STATUS = 'C',
		--				 ( 
		--					SELECT 
		--						M1.PROJECT_ID, 
		--						M1.MOA_NO,
		--						MIN(M1.J_BUYER_ID) MIN_J_ID, 
		--						CASE WHEN MAX(M1.J_BUYER_ID) = MIN(M1.J_BUYER_ID) THEN '' ELSE MAX(M1.J_BUYER_ID) END MAX_J_ID
		--					FROM MOA_FORMAL_JOINT_BUYER M1 
		--						 INNER JOIN MOA_FORMAL MF ON M1.PROJECT_ID = MF.PROJECT_ID AND M1.MOA_NO = MF.MOA_NO AND M1.FORMAL_SEQ = MF.FORMAL_SEQ AND MF.FORMAL_STATUS = 'C'
		--					WHERE M1.PROJECT_ID = '' + @PROJECTID + ''
		--					GROUP BY M1.PROJECT_ID, M1.MOA_NO
		--				 ) N2
		--			WHERE 
		--				M2.PROJECT_ID = N2.PROJECT_ID 
		--				AND M2.MOA_NO = N2.MOA_NO 
		--				AND M2.J_BUYER_ID = N2.MAX_J_ID 
		--				AND M2.PROJECT_ID = '' + @PROJECTID + ''
		--		) J3 ON FN.PROJECT_ID = J3.PROJECT_ID AND FN.MOA_NO = J3.MOA_NO 
		--	WHERE FN.PROJECT_ID = '' + @PROJECTID + '')JB ON JB.PROJECT_ID = MPF.PROJECT_ID AND JB.MOA_NO = MPF.MOA_NO
	
		/*Declare Cur CURSOR FOR
		Select Distinct AgreementNo From #RP16
		
		Open Cur
		fetch next from Cur into @MOA_NO 
		
		While @@FETCH_STATUS = 0
		BEGIN
			Update #RP16
			Set Buyers = dbo.SF_GetLastPurchaser(@PROJECTID, @MOA_NO, 'N')
			Where ProjectID = @PROJECTID and AgreementNo = @MOA_NO

			fetch next from Cur into @MOA_NO 
		END
	
		Close Cur
		Deallocate Cur
	*/
		IF @PHASE is not null and @PHASE <> N''
		BEGIN
			IF @SHOWREMARK = 'Y'
			BEGIN
				Select * 
				from #RP16 
				where @PROJECTID = ProjectID 
					and @PHASE = PhaseID
					and (PY_DT_CAL_TYPE = 'T' OR CONVERT(DATETIME, Due_Date, 105) < CONVERT(DATETIME, @DATETO, 105))
					and Own_Pament > 0
				ORDER BY (case when CONVERT(DATETIME, Due_Date, 105) is null then 1 else 0 end), CONVERT(DATETIME, Due_Date, 105), AgreementNo					
			END
			ELSE
			BEGIN
				Select * 
				from #RP16 
				where @PROJECTID = ProjectID 
					and @PHASE = PhaseID
					and CONVERT(DATETIME, Due_Date, 105) < CONVERT(DATETIME, @DATETO, 105)
					and Own_Pament > 0
				ORDER BY (case when CONVERT(DATETIME, Due_Date, 105) is null then 1 else 0 end), CONVERT(DATETIME, Due_Date, 105), AgreementNo		
			END
		END
		ELSE
		BEGIN
			IF @SHOWREMARK = 'Y'
			BEGIN
				Select * 
				from #RP16 
				where @PROJECTID = ProjectID 
					and (PY_DT_CAL_TYPE = 'T' OR CONVERT(DATETIME, Due_Date, 105) < CONVERT(DATETIME, @DATETO, 105))
					and Own_Pament > 0
				ORDER BY (case when CONVERT(DATETIME, Due_Date, 105) is null then 1 else 0 end), CONVERT(DATETIME, Due_Date, 105), AgreementNo		
			END
			ELSE
			BEGIN
				Select * 
				from #RP16 
				where @PROJECTID = ProjectID 
					and CONVERT(DATETIME, Due_Date, 105) < CONVERT(DATETIME, @DATETO, 105)
					and Own_Pament > 0
				ORDER BY (case when CONVERT(DATETIME, Due_Date, 105) is null then 1 else 0 end), CONVERT(DATETIME, Due_Date, 105), AgreementNo		
			END
		END
			
		
		
Return

GO
/****** Object:  StoredProcedure [dbo].[RP17]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP17]
	@PROJECT_ID [nvarchar](10)
WITH  EXECUTE AS CALLER
AS
BEGIN TRAN

	SELECT
	ISNULL(PRJ_NAME_CHI,'') + ' ' + ISNULL(PRJ_NAME_ENG,'') '#1',
	ISNULL(PRJ_ADD_ENG_1, '') + ' ' + ISNULL(PRJ_ADD_ENG_2, '') + ' ' + ISNULL(PRJ_ADD_ENG_3, '') '#2'
FROM
	PROJECT_MASTER PM
	where PM.PROJECT_ID=@PROJECT_ID

	IF @@ERROR <>  0
BEGIN
	ROLLBACK TRAN
END

COMMIT TRAN

GO
/****** Object:  StoredProcedure [dbo].[RP17_B]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP17_B]
	@PROJECT_ID [nvarchar](10),
	@AgreementdateFrom [nvarchar](20),
	@AgreementdateTo [nvarchar](20)
WITH  EXECUTE AS CALLER
AS
if((@AgreementdateFrom=null and @AgreementdateTo=null )or (@AgreementdateFrom is null and @AgreementdateTo is null) or (@AgreementdateFrom='' and @AgreementdateTo=''))
	BEGIN
	SELECT
	MAX(CONVERT(VARCHAR(10), M.PASP_Date, 105)) '#3',
	MAX(CONVERT(VARCHAR(10), M.ASP_Date, 105)) '#4',

(
	select  (ISNULL(B.BLOCK_DESC, FM.STR_CODE)) + char(10)
	 From FLAT_MASTER FM 
	LEFT JOIN BLOCK B ON FM.FM_BLK = B.BLOCK_ID AND FM.PROJECT_ID = B.PROJECT_ID
	where FM.PROJECT_ID =@PROJECT_ID and (FM.FM_CODE in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	 FOR XML PATH('')
) 
	'#5',
	(
	select  (	ISNULL(FM.FM_FLOOR, FM.FM_STR_NO) ) + char(10)
	 From FLAT_MASTER FM 
	LEFT JOIN BLOCK B ON FM.FM_BLK = B.BLOCK_ID AND FM.PROJECT_ID = B.PROJECT_ID
	where FM.PROJECT_ID =@PROJECT_ID and (FM.FM_CODE in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	 FOR XML PATH('')
	) 
'#6',
	
	(
	select  (ISNULL(FM.FM_FLAT, FM_HSE_NO) ) + char(10)
	 From FLAT_MASTER FM 
	LEFT JOIN BLOCK B ON FM.FM_BLK = B.BLOCK_ID AND FM.PROJECT_ID = B.PROJECT_ID
	where FM.PROJECT_ID =@PROJECT_ID and (FM.FM_CODE in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	 FOR XML PATH('')
	)
	'#7', 
	(
	select  (ISNULL(CP.CAR_PARK_NO,'')) + char(10)
	 From CAR_PARK CP
	where CP.PROJECT_ID =@PROJECT_ID and (CP.CAR_PARK_ID in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	 FOR XML PATH('')
	)
	'#8',
	MAX(ISNULL(M.ROT_AM_PRICE,AM_PRICE)) '#9',
	MAX(CONVERT(VARCHAR(10), M.UP_DT, 105)) '#11',
	--CONVERT(VARCHAR(10), GETDATE(), 105) '#12',
	case when MAX(M.IS_VOID_LOG) ='Y' then MAX(ISNULL(CONVERT(VARCHAR(10),VOID_Date, 105),'')) Else N'' End '#12',	
	--CONVERT(VARCHAR(10), GETDATE(), 105) '#13',
	MAX(M.CHANGE_PAY_REMARK) '#13',
	case when MAX(HAS_VENDOR_RS) = 'Y' then MAX(HAS_VENDOR_RS) else '' End  '#14',
	MAX(M.CHANGE_PAY_TERMS) 'CHANGE_PAY_TERMS',
	MAX(M.PAY_TERMS) 'PAY_TERMS',
	MAX(M.IS_CHANGE_PAY_LOG) 'IS_CHANGE_PAY_LOG',
	MAX(M.VOID_REMARK) 'VOID_REMARK',
	--Modify by Alex 20180531
	(
	select case when FM.fm_blk is null then FM.FM_HSE_NO else NULL end  + char(10)
	 From FLAT_MASTER FM 
	LEFT JOIN BLOCK B ON FM.FM_BLK = B.BLOCK_ID AND FM.PROJECT_ID = B.PROJECT_ID
	where FM.PROJECT_ID =@PROJECT_ID and (FM.FM_CODE in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	FOR XML PATH('')
	)
	'#15'
	--End 20180531
FROM
	AM_BASE M
	JOIN AM_ITEM AI ON M.AM_NO = AI.AM_NO and AI.PROJECT_ID = M.PROJECT_ID 

	where  M.PROJECT_ID=@PROJECT_ID and M.AM_STATUS in('C','V','X')  group by AI.AM_NO ,M.AM_NO
	order by CONVERT(DATETIME, MAX(CONVERT(VARCHAR(10), M.PASP_Date, 105)), 105) 
End
Else 
	BEGIN
	SELECT
	MAX(CONVERT(VARCHAR(10), M.PASP_Date, 105)) '#3',
	MAX(CONVERT(VARCHAR(10), M.ASP_Date, 105)) '#4',

(
	select  (ISNULL(B.BLOCK_DESC, FM.STR_CODE)) + char(10)
	 From FLAT_MASTER FM 
	LEFT JOIN BLOCK B ON FM.FM_BLK = B.BLOCK_ID AND FM.PROJECT_ID = B.PROJECT_ID
	where FM.PROJECT_ID =@PROJECT_ID and (FM.FM_CODE in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	 FOR XML PATH('')
) 
	'#5',
	(
	select  (	ISNULL(FM.FM_FLOOR, FM.FM_STR_NO) ) + char(10)
	 From FLAT_MASTER FM 
	LEFT JOIN BLOCK B ON FM.FM_BLK = B.BLOCK_ID AND FM.PROJECT_ID = B.PROJECT_ID
	where FM.PROJECT_ID =@PROJECT_ID and (FM.FM_CODE in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	 FOR XML PATH('')
	) 
'#6',
	
	(
	select  (ISNULL(FM.FM_FLAT, FM_HSE_NO) ) + char(10)
	 From FLAT_MASTER FM 
	LEFT JOIN BLOCK B ON FM.FM_BLK = B.BLOCK_ID AND FM.PROJECT_ID = B.PROJECT_ID
	where FM.PROJECT_ID =@PROJECT_ID and (FM.FM_CODE in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	 FOR XML PATH('')
	)
	'#7', 
	(
	select  (ISNULL(CP.CAR_PARK_NO,'')) + char(10)
	 From CAR_PARK CP
	where CP.PROJECT_ID =@PROJECT_ID and (CP.CAR_PARK_ID in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	 FOR XML PATH('')
	)
	'#8',
	MAX(ISNULL(M.ROT_AM_PRICE,AM_PRICE)) '#9',
	MAX(CONVERT(VARCHAR(10), M.UP_DT, 105)) '#11',
	--CONVERT(VARCHAR(10), GETDATE(), 105) '#12',
	case when MAX(M.IS_VOID_LOG) ='Y' then MAX(ISNULL(CONVERT(VARCHAR(10),VOID_Date, 105),'')) Else N'' End '#12',	
	--CONVERT(VARCHAR(10), GETDATE(), 105) '#13',
	MAX(M.CHANGE_PAY_REMARK) '#13',
	case when MAX(HAS_VENDOR_RS) = 'Y' then MAX(HAS_VENDOR_RS) else '' End  '#14',
	MAX(M.CHANGE_PAY_TERMS) 'CHANGE_PAY_TERMS',
	MAX(M.PAY_TERMS) 'PAY_TERMS',
	MAX(M.IS_CHANGE_PAY_LOG) 'IS_CHANGE_PAY_LOG',
	MAX(M.VOID_REMARK) 'VOID_REMARK',
	--Modify by Alex 20180531
	(
	select case when FM.fm_blk is null then FM.FM_HSE_NO else NULL end  + char(10)
	 From FLAT_MASTER FM 
	LEFT JOIN BLOCK B ON FM.FM_BLK = B.BLOCK_ID AND FM.PROJECT_ID = B.PROJECT_ID
	where FM.PROJECT_ID =@PROJECT_ID and (FM.FM_CODE in (select FM_CP_CODE  from AM_ITEM where PROJECT_ID=@PROJECT_ID  and AI.AM_NO = AM_NO))
	FOR XML PATH('')
	)
	'#15'
	--End 20180531
FROM
	AM_BASE M
	JOIN AM_ITEM AI ON M.AM_NO = AI.AM_NO and AI.PROJECT_ID = M.PROJECT_ID 
	where M.PROJECT_ID=@PROJECT_ID and ((M.AM_DT >= CONVERT(DATETIME, @AgreementdateFrom, 105)) and (M.AM_DT <= DATEADD(DAY, 1, CONVERT(DATETIME, @AgreementdateTo, 105))))
	And  M.PROJECT_ID=@PROJECT_ID and M.AM_STATUS in('C','V','X')  group by AI.AM_NO ,M.AM_NO
		order by CONVERT(DATETIME, MAX(CONVERT(VARCHAR(10), M.PASP_Date, 105)), 105) 
end


/****** Object:  StoredProcedure [dbo].[RP17_B]    Script Date: 6/6/2018 5:12:08 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[RP17_C]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP17_C]
	@PROJECT_ID [nvarchar](10),
	@AgreementdateFrom [nvarchar](20),
	@AgreementdateTo [nvarchar](20)
WITH  EXECUTE AS CALLER
AS
BEGIN TRAN


	if((@AgreementdateFrom=null and @AgreementdateTo=null )or (@AgreementdateFrom is null and @AgreementdateTo is null) or (@AgreementdateFrom='' and @AgreementdateTo=''))
	BEGIN
	SELECT top(10)
	--PPM.METHOD_CODE 'METHOD_CODE',
	PPM.METHOD_CODE 'METHOD_CODE',
	concat (PPM.METHOD_DESC_ENG, ' ', PPM.METHOD_DESC_CHI) 'METHOD_DESC',
	MPP.INITIAL_PAYMENT 'INITIAL_PAYMENT',
	MPP.PY_PLAN_SEQ 'PY_PLAN_SEQ',
	MPP.PY_DT_TYPE 'PY_DT_TYPE',
	MPP.PY_DT_CAL_TYPE 'PY_DT_CAL_TYPE',
	MPP.PY_DT_FACT 'PY_DT_FACT',
	MPP.PY_PAYMT_DUE 'PY_PAYMT_DUE',
	MPP.PY_DATE_DUE 'PY_DATE_DUE',
	MPP.PY_DESC 'PY_DESC',
	MPP.BEFORE_DATE_DESC 'BEFORE_DATE_DESC',
	MPP.AFTER_DATE_DESC 'AFTER_DATE_DESC'
FROM
	AM_PAYMENT_PLAN MPP
	INNER JOIN PRJ_PAY_METHOD PPM ON MPP.PROJECT_ID = PPM.PROJECT_ID AND MPP.METHOD_CODE = PPM.METHOD_CODE
	 join AM_BASE MA on MPP.PROJECT_ID = MA.PROJECT_ID 
	where MPP.PROJECT_ID=@PROJECT_ID 
	
	ENd
	Else
	Begin
	SELECT top(10)
	PPM.METHOD_CODE,
	concat (PPM.METHOD_DESC_ENG, ' ', PPM.METHOD_DESC_CHI) 'METHOD_DESC',
	MPP.INITIAL_PAYMENT,
	MPP.PY_PLAN_SEQ,
	MPP.PY_DT_TYPE,
	MPP.PY_DT_CAL_TYPE,
	MPP.PY_DT_FACT,
	MPP.PY_PAYMT_DUE,
	MPP.PY_DATE_DUE,
	MPP.PY_DESC,
	MPP.BEFORE_DATE_DESC,
	MPP.AFTER_DATE_DESC
FROM
	AM_PAYMENT_PLAN MPP
	INNER JOIN PRJ_PAY_METHOD PPM ON MPP.PROJECT_ID = PPM.PROJECT_ID AND MPP.METHOD_CODE = PPM.METHOD_CODE
	 join AM_BASE MA on MPP.PROJECT_ID = MA.PROJECT_ID 
	where MPP.PROJECT_ID=@PROJECT_ID and (CONVERT(VARCHAR(10), MA.AM_DT, 105)>=@AgreementdateFrom and CONVERT(VARCHAR(10), MA.AM_DT, 105)<=@AgreementdateTo )
	
	END

	



	IF @@ERROR <>  0
BEGIN
	ROLLBACK TRAN
END

COMMIT TRAN

GO
/****** Object:  StoredProcedure [dbo].[RP18]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP18]
	@PROJECT_ID [nvarchar](6),
	@DEV_CODE [nvarchar](6),
	@LANGUAGE_ID [nvarchar](6)
WITH  EXECUTE AS CALLER
AS
BEGIN

declare @Val_PRN NVARCHAR(20)
declare @Val_LotNo NVARCHAR(10)
IF(@LANGUAGE_ID ='E')
Begin
	set @Val_PRN = ' Lot No.'
	set @Val_LotNo = ',PRN:'
end
Else
begin
	set @Val_PRN = ' 地段 '
	set @Val_LotNo = ',物業參考編號:'
end


--if (@DEV_CODE is not null or @DEV_CODE <>null or @DEV_CODE <>'')

SELECT  
	FM.FM_CODE,
	--UPPER(DEV_CODE) AS DEV_CODE,
	(Select Dev_Name From Development where DEV_CODE=@DEV_CODE) AS DEV_CODE,
	--(select PRJ_NAME_ENG from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID) AS DEV_CODE,
	--isnull(UPPER(FM_BLK),UPPER(STR_Code)) AS FM_BLK,
	(bk.BLOCK_DESC +'('+ bk.SECTION + @Val_PRN + bk.SECTION_BLOCK + @Val_LotNo + bk.REG_NO +')') AS FM_BLK,
	--right('00000'+convert(varchar,FM_FLOOR),2) AS FM_FLOOR_T ,
	isnull(convert(varchar,FM_FLOOR) ,convert(varchar,FM_STR_NO))AS FM_FLOOR_T ,
	isnull(FM_FLAT,FM_HSE_NO) AS FM_FLAT_T ,
	--right('00000'+convert(varchar,FM.FM_FLOOR),2)+'/F' AS FM_FLOOR,
	isnull(convert(varchar,FM.FM_STR_NO),  convert(varchar,FM.FM_FLOOR)) AS FM_FLOOR,
	isnull('Unit '+FM.FM_HSE_NO, 'Unit '+FM.FM_FLAT) AS FM_FLAT
	,FM.FM_STATUS as FM_MOA_STATUS
	 ,CONVERT (NVARCHAR(15), GETDATE(),108) AS 'NUM_1',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID) AS 'NUM_2',
	(SELECT COUNT(1) FROM FLAT_MASTER FM_1 JOIN AM_BASE AB ON FM_1.MOA_NO = AB.AM_NO WHERE FM_1.PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'S' AND (CONVERT (DATE,AB.AM_DT)<=CONVERT (DATE,GETDATE()-1))) AS 'NUM_3',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'A' AND (CONVERT (DATE , FM.EFFECT_DATE)<=CONVERT (DATE, GETDATE()) OR FM.EFFECT_DATE IS NULL)) AS 'NUM_4',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND (FM_STATUS = 'R' OR ((CONVERT (DATE , FM.EFFECT_DATE)>CONVERT (DATE, GETDATE())) AND FM.FM_STATUS='A'))) AS 'NUM_5',
	CONVERT (NVARCHAR(20), GETDATE(),110) AS 'NUM_6',
	--(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS <> 'S') AS 'NUM_7'
	(select PRJ_NAME_CHI from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID)  AS 'NUM_7',
	FM_FLOOR_SEQ [FM_FLOOR_SEQ]
	
	
FROM
	FLAT_MASTER FM  left join BLOCK bk on FM.PROJECT_ID = BK.PROJECT_ID AND FM.FM_BLK = BK.BLOCK_ID 
	
WHERE
	FM.PROJECT_ID = @PROJECT_ID 
	AND  FM.DEV_CODE=@DEV_CODE  
	And DEV_CODE = iif(@DEV_CODE is null, DEV_CODE  , @DEV_CODE)
	--AND DEV_CODE IS NOT NULL 
	AND ( (FM.FM_BLK IS NOT NULL AND  FM.FM_FLOOR IS NOT NULL 
	AND FM.FM_FLAT IS NOT NULL ) or (FM.STR_CODE IS NOT NULL AND  FM.FM_STR_NO IS NOT NULL 
	AND FM.FM_HSE_NO IS NOT NULL))

              
	
	
	ORDER BY DEV_CODE,FM_BLK,
	FM_FLOOR_SEQ,
    FM_FLAT 


END	
GO
/****** Object:  StoredProcedure [dbo].[RP19]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP19]
	@PROJECT_ID [nvarchar](6),
	@DEV_CODE [nvarchar](6)
WITH  EXECUTE AS CALLER
AS
BEGIN

IF (@DEV_CODE is not NULL OR @DEV_CODE <>'' OR @DEV_CODE IS not NULL)
BEGIN
SELECT  
	FM.FM_CODE,
	--UPPER(DEV_CODE) AS DEV_CODE,
	(select PRJ_NAME_ENG from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID) AS DEV_CODE,
	isnull(UPPER(FM_BLK),UPPER(STR_Code)) AS FM_BLK,
	--right('00000'+convert(varchar,FM_FLOOR),2) AS FM_FLOOR_T ,
	isnull(convert(varchar,FM_FLOOR) ,convert(varchar,FM_STR_NO))AS FM_FLOOR_T ,
	isnull(FM_FLAT,FM_HSE_NO) AS FM_FLAT_T ,
	--right('00000'+convert(varchar,FM.FM_FLOOR),2)+'/F' AS FM_FLOOR,
	convert(varchar,FM.FM_FLOOR) AS FM_FLOOR,
	'Unit '+FM.FM_FLAT AS FM_FLAT,
	(
	CASE 

		WHEN FM.FM_STATUS = 'S' THEN
			CASE 
				--WHEN (SELECT TOP 1 MOA_STATUS FROM MOA M WHERE M.PROJECT_ID=FM.PROJECT_ID AND M.MOA_NO=FM.MOA_NO)= 'C' THEN '●'
				--WHEN ((SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) <>'Y' OR (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) IS NULL ) THEN '▲'
				WHEN ((SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) <>'Y' OR (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) IS NULL ) THEN 'T'
				--WHEN (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) ='Y' THEN '●'
				WHEN (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) ='Y' THEN 'C'
			END
			
		WHEN FM.FM_STATUS = 'A' THEN
			CASE  
			--WHEN ((CONVERT (DATE , EFFECT_DATE)<=CONVERT (DATE, GETDATE())) OR ( EFFECT_DATE IS NULL)) THEN '□'
			WHEN ((CONVERT (DATE , EFFECT_DATE)<=CONVERT (DATE, GETDATE())) OR ( EFFECT_DATE IS NULL)) THEN 'S'
			--WHEN (( CONVERT (DATE ,EFFECT_DATE)>CONVERT (DATE, GETDATE()))) THEN '▓'
			WHEN (( CONVERT (DATE ,EFFECT_DATE)>CONVERT (DATE, GETDATE()))) THEN 'G'
		END
		--WHEN FM.FM_STATUS = 'A' THEN '□'
		--WHEN FM.FM_STATUS = 'P' THEN '▲'
		--WHEN FM.FM_STATUS = 'P' THEN 'T'
		--WHEN FM.FM_STATUS = 'R' THEN '▓'
		WHEN FM.FM_STATUS = 'R' THEN 'G'
	END) AS FM_MOA_STATUS,
	GETDATE() AS 'NUM_1',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID) AS 'NUM_2',
	(SELECT COUNT(1) FROM FLAT_MASTER FM_1 JOIN AM_BASE AB ON FM_1.MOA_NO = AB.AM_NO WHERE FM_1.PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'S' AND (CONVERT (DATE,AB.PASP_Date)<CONVERT (DATE,GETDATE()-1))) AS 'NUM_3',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'A' AND (CONVERT (DATE , FM.EFFECT_DATE)<=CONVERT (DATE, GETDATE()) OR FM.EFFECT_DATE IS NULL)) AS 'NUM_4',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND (FM_STATUS = 'R' OR ((CONVERT (DATE , FM.EFFECT_DATE)>CONVERT (DATE, GETDATE())) AND FM.FM_STATUS='A'))) AS 'NUM_5',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS <> 'S') AS 'NUM_6',
	--(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS <> 'S') AS 'NUM_7'
		(select PRJ_NAME_CHI from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID)  AS 'NUM_7'
	
FROM
	FLAT_MASTER FM 
	
WHERE
	FM.PROJECT_ID = @PROJECT_ID AND  FM.DEV_CODE=@DEV_CODE  AND DEV_CODE IS NOT NULL 
	AND  FM.FM_BLK IS NOT NULL AND  FM.FM_FLOOR IS NOT NULL 
	AND FM.FM_FLAT IS NOT NULL 
	
	union all
	SELECT  
	FM.FM_CODE,
	--UPPER(DEV_CODE) AS DEV_CODE,
		(select PRJ_NAME_ENG from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID) AS DEV_CODE,
	isnull(UPPER(FM_BLK),UPPER(STR_Code)) AS FM_BLK,
	--right('00000'+convert(varchar,FM_FLOOR),2) AS FM_FLOOR_T ,
	isnull(convert(varchar,FM_FLOOR) ,convert(varchar,FM_STR_NO))AS FM_FLOOR_T ,
	isnull(FM_FLAT,FM_HSE_NO) AS FM_FLAT_T ,
	--right('00000'+convert(varchar,FM.FM_FLOOR),2)+'/F' AS FM_FLOOR,
	convert(varchar,FM.FM_STR_NO) AS FM_FLOOR,
	'Unit '+FM.FM_HSE_NO AS FM_FLAT,
	(
	CASE 

		WHEN FM.FM_STATUS = 'S' THEN
			CASE 
				--WHEN (SELECT TOP 1 MOA_STATUS FROM MOA M WHERE M.PROJECT_ID=FM.PROJECT_ID AND M.MOA_NO=FM.MOA_NO)= 'C' THEN '●'
				--WHEN ((SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) <>'Y' OR (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) IS NULL ) THEN '▲'
				WHEN ((SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) <>'Y' OR (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) IS NULL ) THEN 'T'
				--WHEN (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) ='Y' THEN '●'
				WHEN (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) ='Y' THEN 'C'
			END
			
		WHEN FM.FM_STATUS = 'A' THEN
			CASE  
			--WHEN ((CONVERT (DATE , EFFECT_DATE)<=CONVERT (DATE, GETDATE())) OR ( EFFECT_DATE IS NULL)) THEN '□'
			WHEN ((CONVERT (DATE , EFFECT_DATE)<=CONVERT (DATE, GETDATE())) OR ( EFFECT_DATE IS NULL)) THEN 'S'
			--WHEN (( CONVERT (DATE ,EFFECT_DATE)>CONVERT (DATE, GETDATE()))) THEN '▓'
			WHEN (( CONVERT (DATE ,EFFECT_DATE)>CONVERT (DATE, GETDATE()))) THEN 'G'
		END
		--WHEN FM.FM_STATUS = 'A' THEN '□'
		--WHEN FM.FM_STATUS = 'P' THEN '▲'
		--WHEN FM.FM_STATUS = 'P' THEN 'T'
		--WHEN FM.FM_STATUS = 'R' THEN '▓'
		WHEN FM.FM_STATUS = 'R' THEN 'G'
	END) AS FM_MOA_STATUS,
		GETDATE() AS 'NUM_1',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID) AS 'NUM_2',
	(SELECT COUNT(1) FROM FLAT_MASTER FM_1 JOIN AM_BASE AB ON FM_1.MOA_NO = AB.AM_NO WHERE FM_1.PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'S' AND (CONVERT (DATE,AB.PASP_Date)<CONVERT (DATE,GETDATE()-1))) AS 'NUM_3',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'A' AND (CONVERT (DATE , FM.EFFECT_DATE)<=CONVERT (DATE, GETDATE()) OR FM.EFFECT_DATE IS NULL)) AS 'NUM_4',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND (FM_STATUS = 'R' OR ((CONVERT (DATE , FM.EFFECT_DATE)>CONVERT (DATE, GETDATE())) AND FM.FM_STATUS='A'))) AS 'NUM_5',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS <> 'S') AS 'NUM_6',
	--(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS <> 'S') AS 'NUM_7'
			(select PRJ_NAME_CHI from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID)  AS 'NUM_7'
	
	
FROM
	FLAT_MASTER FM 
	
WHERE
	FM.PROJECT_ID = @PROJECT_ID AND  FM.DEV_CODE=@DEV_CODE  AND DEV_CODE IS NOT NULL 
	AND  FM.STR_CODE IS NOT NULL AND  FM.FM_STR_NO IS NOT NULL 
	AND FM.FM_HSE_NO IS NOT NULL ORDER BY DEV_CODE,FM_BLK,
	FM_FLOOR,
    FM_FLAT 
	end
	else
BEGIN
SELECT  
	FM.FM_CODE,
	--UPPER(DEV_CODE) AS DEV_CODE,
		(select PRJ_NAME_ENG from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID) AS DEV_CODE,
	isnull(UPPER(FM_BLK),UPPER(STR_Code)) AS FM_BLK,
	--right('00000'+convert(varchar,FM_FLOOR),2) AS FM_FLOOR_T ,
	isnull(convert(varchar,FM_FLOOR) ,convert(varchar,FM_STR_NO))AS FM_FLOOR_T ,
	isnull(FM_FLAT,FM_HSE_NO) AS FM_FLAT_T ,
	--right('00000'+convert(varchar,FM.FM_FLOOR),2)+'/F' AS FM_FLOOR,
	convert(varchar,FM.FM_FLOOR) AS FM_FLOOR,
	'Unit '+FM.FM_FLAT AS FM_FLAT,
	(
	CASE 

		WHEN FM.FM_STATUS = 'S' THEN
			CASE 
				--WHEN (SELECT TOP 1 MOA_STATUS FROM MOA M WHERE M.PROJECT_ID=FM.PROJECT_ID AND M.MOA_NO=FM.MOA_NO)= 'C' THEN '●'
				--WHEN ((SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) <>'Y' OR (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) IS NULL ) THEN '▲'
				WHEN ((SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) <>'Y' OR (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) IS NULL ) THEN 'T'
				--WHEN (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) ='Y' THEN '●'
				WHEN (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) ='Y' THEN 'C'
			END
			
		WHEN FM.FM_STATUS = 'A' THEN
			CASE  
			--WHEN ((CONVERT (DATE , EFFECT_DATE)<=CONVERT (DATE, GETDATE())) OR ( EFFECT_DATE IS NULL)) THEN '□'
			WHEN ((CONVERT (DATE , EFFECT_DATE)<=CONVERT (DATE, GETDATE())) OR ( EFFECT_DATE IS NULL)) THEN 'S'
			--WHEN (( CONVERT (DATE ,EFFECT_DATE)>CONVERT (DATE, GETDATE()))) THEN '▓'
			WHEN (( CONVERT (DATE ,EFFECT_DATE)>CONVERT (DATE, GETDATE()))) THEN 'G'
		END
		--WHEN FM.FM_STATUS = 'A' THEN '□'
		--WHEN FM.FM_STATUS = 'P' THEN '▲'
		--WHEN FM.FM_STATUS = 'P' THEN 'T'
		--WHEN FM.FM_STATUS = 'R' THEN '▓'
		WHEN FM.FM_STATUS = 'R' THEN 'G'
	END) AS FM_MOA_STATUS,
	GETDATE() AS 'NUM_1',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID) AS 'NUM_2',
	(SELECT COUNT(1) FROM FLAT_MASTER FM_1 JOIN AM_BASE AB ON FM_1.MOA_NO = AB.AM_NO WHERE FM_1.PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'S' AND (CONVERT (DATE,AB.AM_DT)<CONVERT (DATE,GETDATE()-1))) AS 'NUM_3',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'A' AND (CONVERT (DATE , FM.EFFECT_DATE)<=CONVERT (DATE, GETDATE()) OR FM.EFFECT_DATE IS NULL)) AS 'NUM_4',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND (FM_STATUS = 'R' OR ((CONVERT (DATE , FM.EFFECT_DATE)>CONVERT (DATE, GETDATE())) AND FM.FM_STATUS='A'))) AS 'NUM_5',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS <> 'S') AS 'NUM_6',
	--(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS <> 'S') AS 'NUM_7'
			(select PRJ_NAME_CHI from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID)  AS 'NUM_7'
	
FROM
	FLAT_MASTER FM 
	
WHERE
	FM.PROJECT_ID = @PROJECT_ID AND   DEV_CODE IS NOT NULL 
	AND  FM.FM_BLK IS NOT NULL AND  FM.FM_FLOOR IS NOT NULL 
	AND FM.FM_FLAT IS NOT NULL 
	
	union all
	SELECT  
	FM.FM_CODE,
	--UPPER(DEV_CODE) AS DEV_CODE,
		(select PRJ_NAME_ENG from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID) AS DEV_CODE,
	isnull(UPPER(FM_BLK),UPPER(STR_Code)) AS FM_BLK,
	--right('00000'+convert(varchar,FM_FLOOR),2) AS FM_FLOOR_T ,
	isnull(convert(varchar,FM_FLOOR) ,convert(varchar,FM_STR_NO))AS FM_FLOOR_T ,
	isnull(FM_FLAT,FM_HSE_NO) AS FM_FLAT_T ,
	--right('00000'+convert(varchar,FM.FM_FLOOR),2)+'/F' AS FM_FLOOR,
	convert(varchar,FM.FM_STR_NO) AS FM_FLOOR,
	'Unit '+FM.FM_HSE_NO AS FM_FLAT,
	(
	CASE 

		WHEN FM.FM_STATUS = 'S' THEN
			CASE 
				--WHEN (SELECT TOP 1 MOA_STATUS FROM MOA M WHERE M.PROJECT_ID=FM.PROJECT_ID AND M.MOA_NO=FM.MOA_NO)= 'C' THEN '●'
				--WHEN ((SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) <>'Y' OR (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) IS NULL ) THEN '▲'
				WHEN ((SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) <>'Y' OR (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) IS NULL ) THEN 'T'
				--WHEN (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) ='Y' THEN '●'
				WHEN (SELECT AB.PASP_SIGNED  FROM AM_BASE AB WHERE AB.PROJECT_ID=FM.PROJECT_ID AND AB.AM_NO=FM.MOA_NO) ='Y' THEN 'C'
			END
			
		WHEN FM.FM_STATUS = 'A' THEN
			CASE  
			--WHEN ((CONVERT (DATE , EFFECT_DATE)<=CONVERT (DATE, GETDATE())) OR ( EFFECT_DATE IS NULL)) THEN '□'
			WHEN ((CONVERT (DATE , EFFECT_DATE)<=CONVERT (DATE, GETDATE())) OR ( EFFECT_DATE IS NULL)) THEN 'S'
			--WHEN (( CONVERT (DATE ,EFFECT_DATE)>CONVERT (DATE, GETDATE()))) THEN '▓'
			WHEN (( CONVERT (DATE ,EFFECT_DATE)>CONVERT (DATE, GETDATE()))) THEN 'G'
		END
		--WHEN FM.FM_STATUS = 'A' THEN '□'
		--WHEN FM.FM_STATUS = 'P' THEN '▲'
		--WHEN FM.FM_STATUS = 'P' THEN 'T'
		--WHEN FM.FM_STATUS = 'R' THEN '▓'
		WHEN FM.FM_STATUS = 'R' THEN 'G'
	END) AS FM_MOA_STATUS,
		GETDATE() AS 'NUM_1',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID) AS 'NUM_2',
	(SELECT COUNT(1) FROM FLAT_MASTER FM_1 JOIN AM_BASE AB ON FM_1.MOA_NO = AB.AM_NO WHERE FM_1.PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'S' AND (CONVERT (DATE,AB.AM_DT)<CONVERT (DATE,GETDATE()-1))) AS 'NUM_3',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS = 'A' AND (CONVERT (DATE , FM.EFFECT_DATE)<=CONVERT (DATE, GETDATE()) OR FM.EFFECT_DATE IS NULL)) AS 'NUM_4',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND (FM_STATUS = 'R' OR ((CONVERT (DATE , FM.EFFECT_DATE)>CONVERT (DATE, GETDATE())) AND FM.FM_STATUS='A'))) AS 'NUM_5',
	(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS <> 'S') AS 'NUM_6',
	--(SELECT COUNT(1) FROM FLAT_MASTER WHERE PROJECT_ID = FM.PROJECT_ID AND FM_STATUS <> 'S') AS 'NUM_7'
			(select PRJ_NAME_CHI from PROJECT_MASTER where PROJECT_ID=@PROJECT_ID)  AS 'NUM_7'
	
	
FROM
	FLAT_MASTER FM 
	
WHERE
	FM.PROJECT_ID = @PROJECT_ID AND   DEV_CODE IS NOT NULL 
	AND  FM.STR_CODE IS NOT NULL AND  FM.FM_STR_NO IS NOT NULL 
	AND FM.FM_HSE_NO IS NOT NULL ORDER BY DEV_CODE,FM_BLK,
	FM_FLOOR,
    FM_FLAT 

	END

	



END	
GO
/****** Object:  StoredProcedure [dbo].[RP20]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*******************************************************
July 7, 2017 v001 Peter   Calculated 'To be Collect' amount
********************************************************/


CREATE PROC [dbo].[RP20]
(
   @PROJECT_ID NVARCHAR(10),
   @AM_DateFrom NVARCHAR(10),
   @AM_DateTo NVARCHAR(10),
   @ReceDateOpt NVARCHAR(1),
   @AgreeStatus NVARCHAR(1),
   @CUT_OFF NVARCHAR(15)
)
  
AS

	

	-- Step 1: Prepare Environmentf
	-- Step 2: Get Agreement List
	-- Step 3: Get Agreement Summary by Agreement Date
	-- Step 4: Get Payment Plan Count
	-- Step 5: Return Result

/*

	-- Step 1: Prepare Environment
	DECLARE @PP_SQL NVARCHAR(MAX);
	SET @PP_SQL = '';

	-- Step 2: Get the Agreement List
	SELECT 
		PROJECT_ID, AM_NO,  cast(AM_DT as date) AM_DT, AM_PRICE, METHOD_CODE,
		(	SELECT COUNT(*) 
				FROM AM_ITEM AI 
			WHERE FM_CP = 'F' AND AI.PROJECT_ID = a.PROJECT_ID AND AI.AM_NO = a.AM_NO AND 
			exists(SELECT 1 FROM AM_PAYMENT_FU_TRANS WHERE PROJECT_ID = AI.PROJECT_ID AND AM_NO = AI.AM_NO   
			--v001s
			--  and (CASE WHEN @ReceDateOpt = '1' THEN TRANSACT_DATE WHEN @ReceDateOpt = '2' THEN BANK_IN_TIME 	END) <= CONVERT(datetime, @CUT_OFF, 105)
			--v001e
			
			)
		) UnitSold,
		
		(SELECT SUM(TRANSACT_AMT) FROM AM_PAYMENT_FU_TRANS WHERE TRANSACT_STATUS IS NULL  AND PAID_SEQ IS NOT NULL AND PROJECT_ID = a.PROJECT_ID AND AM_NO = a.AM_NO AND (CASE WHEN @ReceDateOpt = '1' THEN TRANSACT_DATE WHEN @ReceDateOpt = '2' THEN BANK_IN_TIME	END) <= CONVERT(datetime, @CUT_OFF, 105)) TxAmt,
		a.PASP_SIGNED, a.ASP_SIGNED
		into #tmp_AM
	FROM 
		AM_BASE a
	WHERE
		PROJECT_ID = @PROJECT_ID AND
		AM_STATUS = 'C' AND 
		AM_DT >= convert(datetime,@AM_DateFrom, 105) AND
		AM_DT <= convert(datetime,@AM_DateTo, 105);


	

	if(@AgreeStatus = 'P')
		begin
			delete from #tmp_AM where PASP_SIGNED is null
		end
	else if(@AgreeStatus = 'A')
		begin
			delete from #tmp_AM where ASP_SIGNED is null
		end

	-- Step 3: Get Agreement Summary by Agreement Date
	SELECT
		AM_DT, isnull(SUM(UnitSold) ,0)UnitSold, isnull(SUM(case when unitsold = 0 THEN 0 else AM_PRICE end),0) AM_PRICE, isnull(SUM(TxAmt),0) TxAmt
		INTO #RPT_BASE
	FROM #tmp_AM
	GROUP BY AM_DT
	ORDER BY AM_DT

	
	
	
	-- Step 4: Get Payment Plan Count
	SELECT 
		@PP_SQL = @PP_SQL + 'SUM(CASE WHEN METHOD_CODE = ''' + METHOD_CODE +''' THEN UnitSold ELSE 0 END) N'''+ METHOD_CODE+ ''',' 
	FROM PRJ_PAY_METHOD
	WHERE PROJECT_ID = @PROJECT_ID;



	--select @PP_SQL
	IF OBJECT_ID('tempdb..##tmp_PayPlan','u') IS NOT NULL
	BEGIN
		DROP TABLE ##tmp_PayPlan;
	END;


	SET @PP_SQL = 'SELECT ' + @PP_SQL + 'AM_DT INTO ##tmp_PayPlan FROM #tmp_AM GROUP BY AM_DT;'
	EXEC(@PP_SQL);
	--print @PP_SQL
	SELECT * INTO #tmp_PayPlan FROM ##tmp_PayPlan;
	DROP TABLE ##tmp_PayPlan;


	
	--select * from #tmp_PayPlan
	-- Step 5: Return Result
	SELECT
		convert(varchar(50), r.AM_DT) as amount_date, r.UnitSold, r.AM_PRICE, r.TxAmt, pp.*
	FROM 
		#RPT_BASE r
		LEFT JOIN #tmp_PayPlan pp ON r.AM_DT = pp.AM_DT
	ORDER BY r.AM_DT;

*/


-- Peter July 10, 2017s
declare    @ad_cut_off datetime -- PETER
declare    @v_am_date_from datetime
declare    @v_am_date_to datetime

declare @v_tbc_sql1 nvarchar(max)
declare @v_tbc_sql2 nvarchar(max)

declare @v_default_pay_count int
declare @v_default_zero nvarchar(max)


declare @cnt INT = 1;

declare @v_total_amprice int
declare @v_total_deposit int




/*******************************************************
v001 July 7, 2017  Peter   Calculated 'To be Collect' amount
v002 July 25 , 2017   Peter  handle split payment
********************************************************/

-- Step 1: Get the Agreement List
-- step 2  get paid amt information
-- step 3 perpare payment method
-- step 4 Balance to be Collected
--step 5 merge the TBC with 0 count for the paymethod
-- step 6 group all the payment section and TBC section togther


	-- Step 1: Prepare Environment
	DECLARE @PP_SQL NVARCHAR(MAX);	
	SET @PP_SQL = '';

	--v001s
	 if @AM_DateFrom is null or @AM_DateFrom = '' 
		set    @AM_DateFrom = '01-01-1999'
	if @AM_DateTo is null or @AM_DateTo = '' 
		set    @AM_DateTo = '01-01-2999'
	if @CUT_OFF is null or @CUT_OFF = '' 
		set    @CUT_OFF = convert(nvarchar(15), getdate(), 105)

	set    @ad_cut_off = CONVERT(datetime, @CUT_OFF, 105) 
	set    @v_am_date_from = CONVERT(datetime, @AM_DateFrom, 105) 
	set    @v_am_date_to = CONVERT(datetime, @AM_DateTo, 105) 
	--v001e


	
	-- Step 1: Get the Agreement List
			select 
			@ReceDateOpt as optiont,
			base.project_id,
			cast(AM_DT as date) AM_DT,
			base.METHOD_CODE,
			base.AM_NO,
			pln.PY_PLAN_SEQ,
			--v002 s
			--convert( nvarchar(10), pln.PY_DATE_DUE, 126) as py_date_due,
			isnull( convert( nvarchar(10), pln.PY_DATE_DUE, 126) ,  convert( nvarchar(10), pln.OTHER_PY_DUE_DATE, 126)  )    as py_date_due,
			--v002 e
			trans.BANK_IN_TIME,
			(
				( case when @ReceDateOpt = 1 then convert(nvarchar(10),  trans.TRANSACT_DATE,   126) else convert(nvarchar(10),   trans.BANK_IN_TIME , 126) end )
			--	 isnull(trans.TRANSACT_DATE, pln.PY_DATE_DUE)
			)  as rcv_date_ddmmyyyy,
			pln.py_status, 
			(
				( case when @ReceDateOpt = 1 then convert(nvarchar(7),  trans.TRANSACT_DATE, 126) else convert(nvarchar(7),  trans.BANK_IN_TIME, 126) end )
			--	isnull(trans.TRANSACT_DATE, pln.PY_DATE_DUE)
			) as rcv_date,
			(	SELECT COUNT(*) 
							FROM AM_ITEM AI 
						WHERE FM_CP = 'F' AND AI.PROJECT_ID = base.PROJECT_ID AND AI.AM_NO = base.AM_NO AND 
						exists(SELECT 1 FROM AM_PAYMENT_FU_TRANS WHERE PROJECT_ID = AI.PROJECT_ID AND AM_NO = AI.AM_NO   
						) and pln.py_plan_seq = 1  
					) UnitSold,
			(select  am_price from am_base a where a.PROJECT_ID = base.project_id  and a.AM_NO = base.am_no and pln.py_plan_seq = 1 ) as am_price,
			pln.py_paymt_due paymt_due ,
			trans.TRANSACT_AMT,
			trans.PAID_AMT
			,TRANSACT_DATE
			,base.PASP_SIGNED, base.ASP_SIGNED
			--v002
			,trans.TRANSACT_SEQ
			--v002
			into #temp_am_base
			from 
			am_base base
			left outer join am_payment_plan pln on base.AM_NO = pln.AM_NO and base.PROJECT_ID = pln.PROJECT_ID
			left outer join AM_Payment_FU_Trans trans on pln.AM_NO = trans.AM_NO and pln.PROJECT_ID = trans.PROJECT_ID and pln.PY_PLAN_SEQ = trans.PY_PLAN_SEQ and TRANSACT_STATUS IS NULL AND PAID_SEQ IS NOT NULL
			where
			/*  
			(
					isnull(PY_DATE_DUE, @v_am_date_from) >= convert(datetime,@AM_DateFrom, 105) AND
					isnull(PY_DATE_DUE, @v_am_date_to) <= convert(datetime,@AM_DateTo, 105)
			)and 
			*/
			base.PROJECT_ID = @PROJECT_ID AND
			AM_STATUS = 'C'   
			and base.AM_DT >= @v_am_date_from and base.AM_DT <= @v_am_date_to
		

	


			if(@AgreeStatus = 'P')
			begin
				delete from #temp_am_base where PASP_SIGNED is null
			end
			else if(@AgreeStatus = 'A')
			begin
				delete from #temp_am_base where ASP_SIGNED is null
			end

if ( select count(1) from #temp_am_base ) > 0 
begin


	-- remove extra am_price
			
						select am_no, PY_PLAN_SEQ,   count(1) cnt into #temp_extra from #temp_am_base group by am_no, PY_PLAN_SEQ having count(1) > 1


	
						update base
						set am_price = null, UnitSold =0 , paymt_due = 0
						from
						#temp_am_base base,
						(
						select base.AM_NO, base.PY_PLAN_SEQ, min(base.TRANSACT_SEQ)  transact_seq from #temp_am_base base inner join #temp_extra ex on base.AM_NO = ex.AM_NO and base.PY_PLAN_SEQ = ex.PY_PLAN_SEQ
						group by base.AM_NO, base.PY_PLAN_SEQ
						)v1
						where base.AM_NO = v1.AM_NO and base.PY_PLAN_SEQ = v1.PY_PLAN_SEQ and base.TRANSACT_SEQ > v1.transact_seq
					


					select * into #temp_agreement from #temp_am_base
					truncate table #temp_agreement




						if @ReceDateOpt = 1 
						begin
							select * into #temp_am_rcv from #temp_am_base where rcv_date_ddmmyyyy is null and UnitSold > 0
						

							update #temp_am_rcv 
							set paid_amt = null
							where rcv_date_ddmmyyyy is null

							insert into #temp_agreement
							select * from #temp_am_rcv
							
							
							update #temp_agreement 
							set paid_amt = null
							where rcv_date_ddmmyyyy is null

						end
						else
						begin
						select * into #temp_am_bankin from #temp_am_base where  UnitSold > 0
								
						update #temp_am_bankin 
						set paid_amt = null
						
						insert into #temp_agreement
							select * from #temp_am_bankin

						end
			

					-- #peter
					--	update #temp_agreement 
					--	set paid_amt = null
						--where rcv_date_ddmmyyyy is null

					
						
			
			           SELECT * into #temp_paid_amt FROM #temp_am_base WHERE rcv_date_ddmmyyyy <= @ad_cut_off

				
						if @ReceDateOpt = 2
						begin
							update #temp_paid_amt
							set am_price = 0, UnitSold = 0
							  where PY_PLAN_SEQ = 1
						end 
				
					

						SELECT * into #temp_TBC FROM #temp_am_base WHERE isnull( rcv_date_ddmmyyyy,  convert(nvarchar(10), dateadd( day, 1 ,@ad_cut_off ), 126) ) > @ad_cut_off 

						--ok
	
						select
						distinct
						v1.am_dt,
						v1.method_code,
						v1.rcv_date,
						v1.unitsold,
						v1.am_price,
						v1.tx_amt
						into #temp_outstanding
						from
						(
								select 
								cast( '9999-01-01' as date) am_dt,
								AM_NO,
								PY_PLAN_SEQ,
								method_code,
								convert( nvarchar(7), py_date_due, 126) rcv_date,
								0 unitsold,
								0 am_price,
								(
								case when 
									( select sum( paymt_due) from #temp_am_base t    where  ( t.rcv_date_ddmmyyyy is not null or t.rcv_date_ddmmyyyy <= @ad_cut_off ) and t.AM_NO = base.AM_NO and t.PY_PLAN_SEQ = base.PY_PLAN_SEQ ) -
									( select sum(isnull(t.PAID_AMT,0)) from #temp_am_base t where ( t.rcv_date_ddmmyyyy is not null or t.rcv_date_ddmmyyyy <= @ad_cut_off ) and  t.AM_NO = base.AM_NO and t.PY_PLAN_SEQ = base.PY_PLAN_SEQ ) > 0 then
										( select sum( paymt_due) from #temp_am_base t    where ( t.rcv_date_ddmmyyyy is not null or t.rcv_date_ddmmyyyy <= @ad_cut_off ) and t.AM_NO = base.AM_NO and t.PY_PLAN_SEQ = base.PY_PLAN_SEQ ) -
										( select sum(isnull(t.PAID_AMT,0)) from #temp_am_base t where ( t.rcv_date_ddmmyyyy is not null or t.rcv_date_ddmmyyyy <= @ad_cut_off ) and t.AM_NO = base.AM_NO and t.PY_PLAN_SEQ = base.PY_PLAN_SEQ ) 
									else
										0
									end 
								)tx_amt 	
								 from #temp_am_base base
								where base.rcv_date_ddmmyyyy is not null AND base.rcv_date_ddmmyyyy <= @ad_cut_off
						)v1


				--

	
				--#peter
						select
						am_dt am_dt,
						method_code,
						rcv_date_ddmmyyyy rcv_date,
						sum(v1.UnitSold) unitsold,
						sum(isnull(v1.am_price,0)) am_price,
						sum(isnull(v1.PAID_AMT,0)) tx_amt
						into #temp_result_paid
						from
						(
						select  am_dt , METHOD_CODE, convert(nvarchar(10),  AM_DT,   126) rcv_date_ddmmyyyy,  unitsold, am_price, paid_amt from #temp_agreement
						union all
						select am_dt, METHOD_CODE, rcv_date_ddmmyyyy, unitsold, am_price, paid_amt from #temp_paid_amt where py_plan_seq = 1
						union all 
						select cast('9999-01-01' as date) , METHOD_CODE, rcv_date_ddmmyyyy, unitsold, am_price, paid_amt from #temp_paid_amt where py_plan_seq > 1
			
						)v1
						group by
						v1.am_dt,
						v1.rcv_date_ddmmyyyy,
						v1.METHOD_CODE
						order by v1.rcv_date_ddmmyyyy

		
	


						select
						v1.am_dt,
						v1.METHOD_CODE,
						v1.rcv_date,
						v1.unitsold,
						v1.am_price,
						sum(v1.tx_amt) tx_amt
						into #temp_result_tbc
						from 
						(
						select 
						cast( '9999-01-01' as date) am_dt,
						method_code,
						--convert( nvarchar(7), isnull(rcv_date_ddmmyyyy, py_date_due), 126) rcv_date,
						convert( nvarchar(7), py_date_due, 126) rcv_date,
						0 unitsold,
						0 am_price,
						 sum( paymt_due) tx_amt
						from #temp_TBC
						where py_date_due is not null
						--group by convert( nvarchar(7), isnull(rcv_date_ddmmyyyy, py_date_due), 126), method_code
						group by convert( nvarchar(7), py_date_due, 126), method_code
						union all
						select * from #temp_outstanding where rcv_date is not null
						) v1 
						group by
						v1.am_dt,
						v1.METHOD_CODE,
						v1.rcv_date,
						v1.unitsold,
						v1.am_price
						having sum(v1.tx_amt) >0 
						order by rcv_date
			
	
	





			--test

			--test




						select
						ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS number,
						v1.AM_DT, 
						v1.METHOD_CODE, 
						v1.rcv_date, 
						v1.unitsold unitsold, 
						v1.am_price am_price, 
						v1.tx_amt  tx_amt
						into #temp_result
						from 
						(
						select * from #temp_result_paid
						union all
						select cast( '9999-01-01' as date) am_dt, '', 'To Be Rcv', 0, 0, 0
						union all
						select * from #temp_result_tbc
						union all
						select cast( '9999-01-01' as date) am_dt, '', 'TBC', 0, 0, 0
						) v1




					-- step 3 perpare payment method
			SELECT 
				@PP_SQL = @PP_SQL + 'SUM(CASE WHEN METHOD_CODE = ''' + METHOD_CODE +''' THEN  unitsold else 0 END) N'''+ METHOD_CODE+ ''',' 
			FROM PRJ_PAY_METHOD
			WHERE PROJECT_ID = @PROJECT_ID;

	
			declare @v_deposit_sql nvarchar(max)
			DECLARE @v_sum_method varchar(200)
			SET @v_sum_method = NULL


			--pl

			declare @col nvarchar(max)
			SELECT 
			@col = COALESCE(@col + ', ', ',') + concat( ' sum('+ M. METHOD_CODE+' )' +' N'''+ m.METHOD_CODE  , ''' ' ,'' )
			FROM 
			 PRJ_PAY_METHOD M 
			WHERE M.PROJECT_ID = @PROJECT_ID


			--pl




				IF OBJECT_ID('tempdb..##tmp_PayPlan','u') IS NOT NULL
				BEGIN
					DROP TABLE ##tmp_PayPlan;
				END;

				SET @PP_SQL = 'SELECT ' + @PP_SQL + 'rcv_date pp_rcv_date, am_dt, method_code method_code INTO ##tmp_PayPlan FROM #temp_result  GROUP BY rcv_date, am_dt, method_code;'
	
				EXEC(@PP_SQL);


				SELECT * INTO #tmp_PayPlan FROM ##tmp_PayPlan;

			DROP TABLE ##tmp_PayPlan;



			update #temp_result
			SET tx_amt = ( select sum( am_price) - sum(tx_amt) from #temp_result) 
			where rcv_date = 'TBC'


			delete from #temp_result where rcv_date = 'TBC' AND tx_amt <= 0



			SELECT
				r.number, r.rcv_date, r.UnitSold, r.AM_PRICE,  r.tx_amt, pp.*
				into #temp_output
			FROM 
				#temp_result r
				LEFT JOIN #tmp_PayPlan pp ON r.AM_DT = pp.am_dt and r.rcv_date = pp.pp_rcv_date   and r.METHOD_CODE = pp.method_code  --
			order by r.number





			 declare @v_output_sql nvarchar(max)



			IF OBJECT_ID('tempdb..##tmp_PayPlan','u') IS NOT NULL
			BEGIN
				DROP TABLE ##tmp_PayPlan;
			END;

			

			 set @v_output_sql =
			 '
 				 select v1.seq, base.rcv_date, sum(unitsold) unitsold , sum(am_price) am_price, sum(tx_amt) tx_amt'+@col+', ''9999-01-01''  as am_dt
				 into ##tmp_PayPlan
				 from #temp_output base
				 inner join 
				 (
				 select   min(number)  seq , rcv_date from #temp_output group by rcv_date
				 )v1 on v1.rcv_date = base.rcv_date
				group by base.rcv_date, v1.seq
				order by v1.seq

			 '

			 -- select @v_output_sql

			  	
			 exec( @v_output_sql )

			SELECT * INTO #temp_dataset FROM ##tmp_PayPlan;
			DROP TABLE ##tmp_PayPlan;




			if ( select count(1) from #temp_dataset where rcv_date = 'TBC' ) > 0 
			begin
				alter table #temp_dataset ALTER COLUMN rcv_date nvarchar(20)

				update #temp_dataset
				set rcv_date = '14 Days after OP'
				where rcv_date = 'TBC'

			end 

			ALTER TABLE #temp_dataset DROP COLUMN seq




			select * from #temp_dataset




end



else
begin
	select 'No record', 0,0,0,0
end
GO
/****** Object:  StoredProcedure [dbo].[RP21]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[RP21]
(
   @PROJECT_ID NVARCHAR(10),
   @AM_DateFrom NVARCHAR(10),
   @AM_DateTo NVARCHAR(10),
  -- @ReceDateOpt NVARCHAR(1),
   @AgreeStatus NVARCHAR(1),
   @CUT_OFF  NVARCHAR(15)
)
  
As
	
/****************************************************
v001 Peter July 12, 2017
v002 Peter July 27, 2017  ADD PASP sign data, asp date
v003 Peter Aug 10,  2017  default amt, total bank in amount
v004 Peter Aug 31, 2017  fix actual price into one amount
v005 Peter Sept 12, 2017  default amt -> recviable amount

****************************************************/

-- Peter July 10, 2017s

declare    @ad_cut_off datetime -- PETER

-- #20180201 s
declare @FromDateTime nvarchar(30)
declare @ToDateTime nvarchar(30)
declare @DT_CutOff  nvarchar(30)
-- #20180201 e


--set    @PROJECT_ID = 'RPT'
--set    @AM_DateFrom = '01-05-2017'
--set    @AM_DateTo   = '31-08-2017'
--set    @AgreeStatus   ='C' --5C confirm, P PASP, A ASP
--SET    @CUT_OFF   = '31-05-2017'

--set    @AM_DateFrom = null
--set    @AM_DateTo   = null
--set    @CUT_OFF   = null


--drop table #base
--drop table #paymentBase
--drop table #unitBase
--drop table #paySummary;
--drop table #temp_rp21


-- part one base temp table 

	--v001s
	-- 20180201 s
	 if @AM_DateFrom is null or @AM_DateFrom = '' 
		set    @FromDateTime = '01-01-1999 00:00:00'
	else 
		set    @FromDateTime = @AM_DateFrom + ' 00:00:00'

	if @AM_DateTo is null or @AM_DateTo = '' 
		set    @ToDateTime = '01-01-2999 23:59:59'
	else 
		set    @ToDateTime = @AM_DateTo + ' 23:59:59'

	if @CUT_OFF is null or @CUT_OFF = '' 
	begin
		set    @DT_CutOff = convert(nvarchar(15), getdate(), 105)
		set    @DT_CutOff =  @DT_CutOff + ' 23:59:59'
	end
	else
	begin
		set    @DT_CutOff =  @CUT_OFF + ' 23:59:59'
	end 

		set    @ad_cut_off = CONVERT(datetime, @DT_CutOff, 105) 
	-- 20180201 e

	--v001e

	SELECT
	distinct
	V1.AM_NO,
	V1.BUYER_TYPE
	INTO #temp_am_buyer
	FROM
	(
	SELECT * FROM AM_BUYER WHERE PROJECT_ID = @PROJECT_ID  AND BUYER_TYPE = 'C'
	UNION all
	select * from am_buyer P where project_id = @PROJECT_ID AND BUYER_TYPE <> 'C'
	AND NOT EXISTS (SELECT 1 FROM AM_BUYER A WHERE P.AM_NO = A.AM_NO AND  PROJECT_ID = @PROJECT_ID  AND BUYER_TYPE = 'C') 
	)V1



		select 
		ab.AM_NO, ab.PROJECT_ID, 
		[dbo].[SF_RPT_UNIT](ab.PROJECT_ID,ab.AM_NO) unit, 
		[dbo].[SF_RPT_SQF_AREA_ROW] (ab.PROJECT_ID,ab.AM_NO) SQF, 
		( CASE WHEN b.BUYER_TYPE = 'C' THEN
			[dbo].[SF_ComBuyerNameRow] (ab.PROJECT_ID,ab.AM_NO) 
			ELSE
			[dbo].[SF_BuyerNameRow](ab.PROJECT_ID,ab.AM_NO) 
			END 
		)purchaser ,
			( CASE WHEN b.BUYER_TYPE = 'C' THEN
			''
			ELSE
			[dbo].[SF_BuyerChineseNameRow] (ab.PROJECT_ID,ab.AM_NO)
			END 
		)purchaser_chi,
		--ab.FM_CP_CODE, 
		ab.METHOD_CODE, 
		[dbo].[SF_RPT_ListPriceRow] (ab.PROJECT_ID,ab.AM_NO) list_price, 
		[dbo].[SF_RPT_ApprovedListPriceRow] (ab.PROJECT_ID,ab.AM_NO) approve_list, 
		--v004s
		--[dbo].[SF_RPT_ApprovedListPriceRow] (ab.PROJECT_ID,ab.AM_NO) actual_price, 		
		[dbo].[SF_RPT_ActualPrice] (ab.PROJECT_ID,ab.AM_NO) actual_price,
		--v004e
		 cast( (  ( ab.AM_TOT_PRICE - ab.AM_PRICE) / ab.AM_PRICE * 100 ) as numeric(36,2)) as varience,
		ab.PASP_SIGNED PASP_SIGNED, ab.ASP_SIGNED  ASP_SIGNED,
		--v002s
		--ab.PASP_Date
		ab.AM_DT PASP_DATE,
		ab.PASP_Date PASP_SIGN_DATE,
		ab.ASP_Date  ASP_SIGN_DATE
		--v002e
		into #base
	from 
		AM_BASE ab
		-- left join AM_ITEM ai on ai.AM_NO = ab.AM_NO and ab.PROJECT_ID = ai.PROJECT_ID
		LEFT join #temp_am_buyer b on b.AM_NO = ab.AM_NO
		JOIN 
		(
			SELECT DISTINCT PROJECT_ID, AM_NO FROM AM_ITEM WHERE PROJECT_ID = @PROJECT_ID AND FM_CP = 'F'
		) ai on ai.AM_NO = ab.AM_NO and ab.PROJECT_ID = ai.PROJECT_ID
	WHERE 
		ab.PROJECT_ID = @PROJECT_ID AND
		ab.AM_STATUS = 'C' AND 
		ab.AM_DT >= convert(datetime, @FromDateTime, 105) AND
		ab.AM_DT <= convert(datetime, @ToDateTime, 105);


		 --select * from #base   ok

		if(@AgreeStatus = 'P')
		begin
			delete from #base where PASP_SIGNED is null
		end
	else if(@AgreeStatus = 'A')
		begin
			delete from #base where ASP_SIGNED is null
		end
		
	
	
	select
	b.AM_NO, 
	b.PROJECT_ID, 
	app.PY_PLAN_SEQ,  
	apft.TRANSACT_SEQ  TRANSACT_SEQ,
	app.PY_PAYMT_DUE Target_amt,
	--#20171030 s
	--convert(nvarchar(10), APP.PY_DATE_DUE , 126) Target_date,
	isnull( convert(nvarchar(10), APP.PY_DATE_DUE , 126)     , convert(nvarchar(10), APP.OTHER_PY_DUE_DATE , 126) ) Target_date,
	--20171030 e
	case when BANK_IN_TIME is null then 0 else  apft.PAID_AMT end  bankInAmount,
	apft.TRANSACT_DATE recOn, 
	apft.BANK_IN_TIME  bankInOn, 
	app.PY_DESC,
	apft.PAID_AMT,
	0 receivable,
	0 overdue,
	0 totalbankinamt,
	0 totalRecAmt,
	0 dummy_rcvable
	into #paymentBase
	from
	#base b
	left outer join am_payment_plan app on  app.AM_NO = b.AM_NO and b.PROJECT_ID = app.PROJECT_ID
	left outer join AM_PAYMENT_FU_TRANS apft on apft.AM_NO = app.AM_NO and apft.PROJECT_ID = app.PROJECT_ID and apft.PY_PLAN_SEQ = app.PY_PLAN_SEQ and ( apft.TRANSACT_STATUS ='P' OR APFT.TRANSACT_STATUS IS NULL AND apft.TRANSACT_AMT >= 0 )
	where 
	apft.TRANSACT_STATUS is null AND
	app.PROJECT_ID = @PROJECT_ID
		
	


	alter table #paymentBase ALTER COLUMN Target_date nvarchar(20)


	-- step 2 get  units
	SELECT 
		b.PROJECT_ID, b.AM_NO, sum(fm.FM_LIST_PRICE) listed_price, 
		sum(fm.FM_USABLE_SF) scale_area, 
		count(*) noOfUnit
		INTO #unitBase
	FROM 
		#base b
		JOIN AM_ITEM ai ON ai.AM_NO = b.AM_NO and ai.PROJECT_ID = b.PROJECT_ID
		JOIN FLAT_MASTER fm ON ai.FM_CP = 'F' AND ai.FM_CP_CODE = fm.FM_CODE AND ai.PROJECT_ID = fm.PROJECT_ID
	GROUP BY b.PROJECT_ID, b.AM_NO;

	select PROJECT_ID, FM_CODE, FM_USABLE_SF into #temp_flat_master from FLAT_MASTER fm where fm.PROJECT_ID = @PROJECT_ID
	-- step 2 get  units


select 
am_no,
py_plan_seq,
min(transact_seq) TRANSACT_SEQ,
count(1) cnt
into #temp_duplicate
 from #paymentBase
 group by
 am_no,
py_plan_seq
having count(1) > 1



update base
set Target_amt = 0
from #paymentBase base 
inner join #temp_duplicate du on base.AM_NO = du.AM_NO and base.PY_PLAN_SEQ = du.PY_PLAN_SEQ and base.TRANSACT_SEQ > du.TRANSACT_SEQ


update base
set 
	recOn = (select  iif( base.recOn <=  @ad_cut_off, p.recOn,  null ) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ  and p.TRANSACT_SEQ = base.TRANSACT_SEQ),
	Paid_amt = (select  iif( base.recOn <=  @ad_cut_off, p.paid_amt, 0 ) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ  and p.TRANSACT_SEQ = base.TRANSACT_SEQ),
	totalRecAmt = iif( 
		base.recOn <= @ad_cut_off,   
		( select sum( isnull(p.PAID_AMT,0)) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ and p.recOn <= @ad_cut_off ),  
	0),

	bankInOn = (select  iif( base.bankInOn <=  @ad_cut_off, p.bankInOn, null ) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ  and p.TRANSACT_SEQ = base.TRANSACT_SEQ),
	bankInAmount = (select  iif( base.bankInOn <=  @ad_cut_off, p.bankinamount, 0 ) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ  and p.TRANSACT_SEQ = base.TRANSACT_SEQ),
	totalbankinamt = 
	iif(   	base.bankInOn <=  @ad_cut_off,  
		( select sum( case when p.bankInOn is null then 0 else isnull(p.PAID_AMT,0) end    ) from #paymentBase P where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ and p.bankinOn <= @ad_cut_off), 
		0),
	dummy_rcvable = 
	(
	 (select  sum(isnull(p.Target_amt,0)) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ) - 
	 (select  sum(isnull(p.PAID_AMT,0)) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ)
	),
	receivable = 
	(
	case when base.bankInOn <= @ad_cut_off then
	 (select  sum(isnull(p.Target_amt,0)) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ) 
	 - (select  sum(case when p.bankInOn is null then 0 else (isnull(p.bankInAmount,0)) end ) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ and p.bankInOn <= @ad_cut_off)
	else
		(select  sum(isnull(p.Target_amt,0)) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ) 
	end
	)
from #paymentBase base 


update base
set  receivable = 0,   totalRecAmt = 0, totalbankinamt = 0
from #paymentBase base 
inner join #temp_duplicate du on base.AM_NO = du.AM_NO and base.PY_PLAN_SEQ = du.PY_PLAN_SEQ and base.TRANSACT_SEQ > du.TRANSACT_SEQ


update base
set overdue = iif( base.target_date <= @ad_cut_off,
 (select  sum(isnull(p.Target_amt,0)) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ)  -
 (select  sum(isnull(p.totalbankinamt,0)) from #paymentBase p where p.AM_NO = base.AM_NO and p.PY_PLAN_SEQ = base.PY_PLAN_SEQ),
 0
 ) 
  from #paymentBase base

update base
set  overdue = 0
from #paymentBase base 
inner join #temp_duplicate du on base.AM_NO = du.AM_NO and base.PY_PLAN_SEQ = du.PY_PLAN_SEQ and base.TRANSACT_SEQ > du.TRANSACT_SEQ


-- detail report
	select 
	info.unit, info.SQF, info.purchaser, info.purchaser_chi, 
	ISNULL( CONVERT(NVARCHAR(10), info.PASP_DATE, 126), '') AS AM_DT,
	ISNULL( CONVERT(NVARCHAR(10), info.PASP_SIGN_DATE, 126), '') AS PASP_SIGN_DATE,
	ISNULL( CONVERT(NVARCHAR(10), info.ASP_SIGN_DATE, 126), '') AS  ASP_SIGN_DATE,
	info.list_price, info.METHOD_CODE, info.approve_list, info.actual_price, info.varience,
	--base.AM_NO, base.PROJECT_ID, 
	--base.PY_PLAN_SEQ,
	BASE.PY_DESC,
	base.Target_amt, 
	base.target_date target_date, 
	base.PAID_AMT rcv_amt, 
	ISNULL( CONVERT(NVARCHAR(10), base.recOn, 126), '') AS recOn,
	base.totalRecAmt TotalRcvAmt ,
	base.bankInAmount bankinAmt ,
	ISNULL( CONVERT(NVARCHAR(10), base.bankInOn, 126), '') AS bankInOn,
	base.totalbankinamt ,

	--v004s
	--( (select  sum(t.Target_amt) from #paymentBase t where t.AM_NO = base.AM_NO and t.PY_PLAN_SEQ = base.PY_PLAN_SEQ) - isnull(t.totalbankinamt,0) ) Overdue_amt,
	base.receivable	Receivable,
	base.overdue Overdue,
	--v004e

	0 as late_pay,
	isnull(m.RMK_1 , '') rmk1,
	isnull(m.RMK_2 , '') rmk2,
	isnull(m.RMK_3 , '') rmk3,
	isnull(m.RMK_4 , '') rmk4,
	isnull(m.RMK_5 , '') rmk5,
	base.AM_NO, base.PY_PLAN_SEQ,
	(select  sum(t.Target_amt) from #paymentBase t where t.AM_NO = base.AM_NO and t.PY_PLAN_SEQ = base.PY_PLAN_SEQ) - (select  sum(t.bankInAmount) from #paymentBase t where t.AM_NO = base.AM_NO and t.PY_PLAN_SEQ = base.PY_PLAN_SEQ and t.bankInOn is not null) not_rcv
	,row_number() over( Partition by base.am_no, base.py_plan_seq  order BY base.am_no) as dup_seq
	from #paymentBase base
	inner join #base info on info.AM_NO = base.AM_NO
	left  outer join moa m on m.PROJECT_ID = base.PROJECT_ID and m.MOA_NO = base.AM_NO
	order by info.PASP_DATE,   base.AM_NO, base.PY_PLAN_SEQ



		--  summary
		select
		(
				SELECT  
						sum(fm.FM_USABLE_SF)
						FROM #temp_flat_master fm
						left join am_item ai on ai.PROJECT_ID = fm.PROJECT_ID and ai.FM_CP_CODE = fm.FM_CODE
						WHERE fm.PROJECT_ID = @PROJECT_ID and  exists ( select 1 from #base b where ai.am_no = b.AM_NO   
				) ) ttl_sold_area,
				( select sum(noOfUnit) from #unitBase ) ttl_sold_units,
				( select count(am_no) from #base )  ttl_am,
				( select sum(listed_price) from #unitBase ) ttl_list_price,
				(
				--v004s
				select sum(Target_amt)  from #paymentBase where PROJECT_ID = @PROJECT_ID
				--v004e
				) ttl_discount_price,
				(
				select sum(Target_amt)  from #paymentBase where PROJECT_ID = @PROJECT_ID
				--v004e
			) ttl_actual_price


		select 
		( select sum(fm.FM_USABLE_SF ) from  #temp_flat_master fm where fm.PROJECT_ID = @PROJECT_ID   ) ttl_area,
		( select count(1) from  #temp_flat_master fm where fm.PROJECT_ID = @PROJECT_ID   )ttl_unit



--v001s
--select PY_PLAN_SEQ, sum(isnull( paid_amt, Target_amt)) tx_amt into #temp_overdue from #paymentBase base where isnull( recOn, dateadd( day,1, @ad_cut_off )) >  @ad_cut_off  group by PY_PLAN_SEQ
select PY_PLAN_SEQ, sum(isnull( paid_amt, Target_amt)) tx_amt into #temp_overdue from #paymentBase base where Target_date <  cast (recOn as date) and Target_date is not null  group by PY_PLAN_SEQ
--v001e

	select 
	isnull(convert( nvarchar(7), base.Target_date, 126), '9999') target_date,
	sum(isnull(target_amt,0)) target_amt,  
	sum(isnull(PAID_AMT,0)) rcv ,
	( 
	select sum( case when bankInOn is not null then isnull(bankInAmount,0) else 0 end ) tx_amt  
	from #paymentBase p where isnull(convert( nvarchar(7), p.Target_date, 126), '9999')  = isnull( convert( nvarchar(7), base.Target_date, 126)  , '9999')
	) bankinamt,
	sum(isnull(receivable,0)) receivable,
	sum(isnull(overdue,0)) overdue
	from #paymentBase base
	group by
	convert( nvarchar(7), Target_date, 126)
	order by target_date

GO
/****** Object:  StoredProcedure [dbo].[RP21_2]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP21_2]
	@PROJECT_ID [nvarchar](10),
	@AM_DateFrom [date],
	@AM_DateTo [date]
WITH  EXECUTE AS CALLER
AS
-- part one base temp table 
	select 
		ab.AM_NO, ab.PROJECT_ID, [dbo].[SF_RPT_UNIT](ab.PROJECT_ID,ab.AM_NO) unit, 
		[dbo].[SF_BuyerNameRow](ab.PROJECT_ID,ab.AM_NO) purchaser, ai.FM_CP_CODE, ab.METHOD_CODE, ab.AM_PRICE,	ab.AM_TOT_PRICE 
		into #base
	from 
		AM_BASE ab
		left join AM_ITEM ai on ai.AM_NO = ab.AM_NO and ab.PROJECT_ID = ai.PROJECT_ID
	WHERE 
		ai.FM_CP = 'F' and 
		ab.PROJECT_ID = @PROJECT_ID AND
		ab.AM_STATUS = 'C' AND 
		ab.AM_DT >= @AM_DateFrom AND
		ab.AM_DT <= @AM_DateTo;

	-- Part two base temp table 
	select  
		apft.TRANSACT_STATUS , apft.AM_NO, apft.PROJECT_ID, apft.PY_PLAN_SEQ,apft.TRANSACT_SEQ, 
		TRANSACT_AMT bankInAmount,apft.CR_DT recOn, BANK_IN_TIME bankInOn, 
		apft.PY_PLAN_SEQ
		into #paymentBase
	FROM
		#base b
		LEFT JOIN AM_PAYMENT_FU_TRANS apft ON b.AM_NO = apft.AM_NO and b.PROJECT_ID = apft.PROJECT_ID
		LEFT JOIN AM_PAYMENT_PLAN app on app.AM_NO = apft.AM_NO and app.PROJECT_ID = apft.PROJECT_ID and app.PY_PLAN_SEQ = apft.PY_PLAN_SEQ
	where 
		apft.TRANSACT_STATUS is null AND
		app.PROJECT_ID = @PROJECT_ID ;


	SELECT * FROm #base;
	SELECT * FROm #paymentBase;


		/*
-- join part one and part two
select unit, GFA, purchaser,listed_price, flatInfo.method_code, approvedPrice, actualPrice, payment_stage,
      targetAmount, targetDate, bankInAmount, recOn, bankInOn, totalBankIn ,remain
from (
		select b.am_no, b.project_id,max(b.unit) unit, sum(FM_GR_AREA_SF) GFA, max(purchaser) purchaser, sum(fm.FM_LIST_PRICE) listed_price, 
				max(b.METHOD_CODE) method_code, max(b.AM_PRICE)  approvedPrice, max(b.AM_TOT_PRICE) actualPrice
		from #base b
			join flat_master fm on fm.PROJECT_ID = b.PROJECT_ID and fm.FM_CODE = b.FM_CP_CODE
			join am_item am on am.FM_CP_CODE = fm.fm_code and fm.project_id = am.project_id
		group by b.AM_NO, b.PROJECT_ID
	) flatInfo 
join (
		select app.am_no, app.project_id,
				case apft.TRANSACT_SEQ when 1 then isnull(cast( ppd.PY_DESC as nvarchar(500)),'') else '' end payment_stage, 
				case apft.TRANSACT_SEQ when 1 then isnull(cast( app.PY_PAYMT_DUE as nvarchar(500)),'') else '' end targetAmount,
				case apft.TRANSACT_SEQ when 1 then isnull(cast( app.PY_DATE_DUE as nvarchar(500)),'') else '' end targetDate,
				app.PY_PLAN_SEQ, apft.TRANSACT_SEQ,apft.bankInAmount,apft.recOn, isnull(apft.bankInOn,'') bankInOn,
				case apft.TRANSACT_SEQ when 1 then isnull(cast( sumAmount.totalBankIn as nvarchar(500)),'')  else '' end totalBankIn,
				case when (app.PY_PAYMT_DUE -  sumAmount.totalBankIn) <0 then 0 else (app.PY_PAYMT_DUE -  sumAmount.totalBankIn) end remain	
		from #paymentBase apft
		left join (select am_no, project_id, py_plan_seq, sum(bankInAmount) totalBankIn 
					from #paymentBase 
					group by am_no, project_id, py_plan_seq
				) sumAmount on sumAmount.am_no = apft.AM_NO and sumAmount.project_id = apft.PROJECT_ID and sumAmount.py_plan_seq = apft.py_plan_seq
		left join AM_PAYMENT_PLAN app on apft.AM_NO = app.AM_NO and apft.PROJECT_ID = app.PROJECT_ID and app.PY_PLAN_SEQ = apft.PY_PLAN_SEQ
		left join PY_PLAN_DTL ppd on ppd.PROJECT_ID = app.PROJECT_ID and ppd.PY_PLAN_SEQ = app.PY_PLAN_SEQ
										and ppd.METHOD_CODE = app.METHOD_CODE 
) depositInfo on depositInfo.AM_NO = flatInfo.am_no and depositInfo.PROJECT_ID = flatInfo.PROJECT_ID
*/

GO
/****** Object:  StoredProcedure [dbo].[RP22]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RP22]
	@project [varchar](100),
	@priceListNo [varchar](100)
WITH  EXECUTE AS CALLER
AS
SELECT 	B.BLOCK_DESC 'Block Name', 
        FM.FM_FLOOR 'Floor', 
        FM.FM_FLAT 'Unit', 
		
        CASE WHEN FM.FM_USABLE_SM IS NULL AND FM.FM_USABLE_SF IS NULL THEN '-' ELSE 
        convert(varchar,ISNULL(FM.FM_USABLE_SM,0)) + '(' + Convert(varchar,Cast(ISNULL(FM.FM_USABLE_SF,0) as Decimal(18,0))) + ') ' END + CHAR(13) + CHAR(10) + ' 露台 Balcony: ' + 
        CASE WHEN FM.FM_VERANDAH_SM IS NULL AND FM.FM_VERANDAH_SF IS NULL THEN '-' ELSE 
        convert(varchar,ISNULL(FM.FM_VERANDAH_SM,0)) + '(' + Convert(varchar,Cast(ISNULL(FM.FM_VERANDAH_SF,0) as Decimal(18,0))) + '); ' END + CHAR(13) + CHAR(10) + ' 陽台 Verandah: ' + 
        CASE WHEN FM.FM_BALCONY_SM IS NULL AND FM.FM_BALCONY_SF IS NULL THEN '-' ELSE 
        convert(varchar,ISNULL(FM.FM_BALCONY_SM,0)) + '(' + Convert(varchar,Cast(ISNULL(FM.FM_BALCONY_SF,0) as Decimal(18,0))) + '); ' END + CHAR(13) + CHAR(10) + ' 工作平台 Utility Platform: ' + 
        CASE WHEN FM.FM_WORK_PF_SM IS NULL AND FM.FM_WORK_PF_SF IS NULL THEN '-' ELSE 
        convert(varchar,ISNULL(FM.FM_WORK_PF_SM,0)) + '(' + Convert(varchar,Cast(ISNULL(FM.FM_WORK_PF_SF,0) as Decimal(18,0))) + ') ' END  'Saleable Area Sq. Metre (Sq. Ft.)', 
    	Cast(ISNULL(PLE.LIST_PRICE,0) as decimal(18,0)) 'Price',       
        + CHAR(13) + CHAR(10)+' (' + Convert(varchar,Cast(ISNULL(PLE.LIST_PRICE,0) / (ISNULL(FM.FM_USABLE_SF,0) + ISNULL(FM.FM_BALCONY_SF,0) + ISNULL(FM.FM_WORK_PF_SF,0) + ISNULL(FM.FM_VERANDAH_SF,0)) as money),-1) + ')' 'Unit Rate', 
        Case When FM.FM_AC_ROOM_SM IS NULL And FM.FM_AC_ROOM_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_AC_ROOM_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_AC_ROOM_SF,0) as Decimal(18,0))) + ')' End 'AC Plant Room Sq. Metre (Sq. Ft)', 
        Case When FM.FM_BAY_WIN_SM IS NULL And FM.FM_BAY_WIN_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_BAY_WIN_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_BAY_WIN_SF,0) as Decimal(18,0))) + ')' End 'Bay Window Sq. Metre (Sq. Ft)', 
        Case When FM.FM_COCKLOFT_SM IS NULL And FM.FM_COCKLOFT_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_COCKLOFT_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_COCKLOFT_SF,0) as Decimal(18,0))) + ')' End 'Cockloft Sq. Metre (Sq. Ft)', 
        Case When FM.FM_PLATFORM_SM IS NULL And FM.FM_PLATFORM_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_PLATFORM_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_PLATFORM_SF,0) as Decimal(18,0))) + ')' End 'Flat Roof Sq. Metre (Sq. Ft)', 
        Case When FM.FM_GARDEN_SM IS NULL And FM.FM_GARDEN_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_GARDEN_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_GARDEN_SF,0) as Decimal(18,0))) + ')' End 'Garden Sq. Metre (Sq. Ft)', 
        Case When FM.FM_PARKING_SM IS NULL And FM.FM_PARKING_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_PARKING_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_PARKING_SF,0) as Decimal(18,0))) + ')' End 'Parking Space Sq. Metre (Sq. Ft)', 
        Case When FM.FM_ROOF_SM IS NULL And FM.FM_ROOF_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_ROOF_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_ROOF_SF,0) as Decimal(18,0))) + ')' End 'Roof Sq. Metre (Sq. Ft)', 
        Case When FM.FM_STAIRHOOD_SM IS NULL And FM.FM_STAIRHOOD_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_STAIRHOOD_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_STAIRHOOD_SF,0) as Decimal(18,0))) + ')' End 'Stairhood Sq. Metre (Sq. Ft)', 
        Case When FM.FM_TERRACE_SM IS NULL And FM.FM_TERRACE_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_TERRACE_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_TERRACE_SF,0) as Decimal(18,0))) + ')' End 'Terrace Sq. Metre (Sq. Ft)', 
        Case When FM.FM_YARD_SM IS NULL And FM.FM_YARD_SF IS NULL Then '-' Else 
        Convert(varchar,ISNULL(FM.FM_YARD_SM,0)) + ' (' + Convert(varchar, Cast(ISNULL(FM.FM_YARD_SF,0) as Decimal(18,0))) + ')' End 'Yard Sq. Metre (Sq. Ft)' 
		--Add by Raijin
		,fm.FM_CODE	
		,Cast(ISNULL(PLE.ORI_PRICE,0) as decimal(18,0)) 'OLDPrice'
		,Convert(decimal,Cast(ISNULL(PLE.LIST_PRICE,0) / (ISNULL(FM.FM_USABLE_SM,0) + ISNULL(FM.FM_BALCONY_SM,0) + ISNULL(FM.FM_WORK_PF_SM,0) + ISNULL(FM.FM_VERANDAH_SM,0)) as decimal(18,0))) 
		as  'Old before unit'
		,Convert(decimal,Cast(ISNULL(PLE.LIST_PRICE,0) / (ISNULL(FM.FM_USABLE_SF,0) + ISNULL(FM.FM_BALCONY_SF,0) + ISNULL(FM.FM_WORK_PF_SF,0) + ISNULL(FM.FM_VERANDAH_SF,0)) as decimal(18,0))) 
		as  'Old after unit'
     	,Cast(ISNULL(PLE.LIST_PRICE,0) as decimal(18,0)) 'NewPrice'
		,Convert(decimal,Cast(ISNULL(PLE.LIST_PRICE,0) / (ISNULL(FM.FM_USABLE_SM,0) + ISNULL(FM.FM_BALCONY_SM,0) + ISNULL(FM.FM_WORK_PF_SM,0) + ISNULL(FM.FM_VERANDAH_SM,0)) as decimal(18,0))) as 'new before unit'
		,Convert(decimal,Cast(ISNULL(PLE.LIST_PRICE,0) / (ISNULL(FM.FM_USABLE_SF,0) + ISNULL(FM.FM_BALCONY_SF,0) + ISNULL(FM.FM_WORK_PF_SF,0) + ISNULL(FM.FM_VERANDAH_SF,0)) as decimal(18,0))) as 'new old unit'

		,PLE.seq
		,adjno.MaxAdj_NO
		,PLE.EFFECTIVE_DT
		,Convert(decimal,Cast(ISNULL(PLE.LIST_PRICE,0) / (ISNULL(FM.FM_USABLE_SM,0) + ISNULL(FM.FM_BALCONY_SM,0) + ISNULL(FM.FM_WORK_PF_SM,0) + ISNULL(FM.FM_VERANDAH_SM,0)) as decimal(18,0))) as 'future before' 

		,Convert(decimal,Cast(ISNULL(PLE.LIST_PRICE,0) / (ISNULL(FM.FM_USABLE_SF,0) + ISNULL(FM.FM_BALCONY_SF,0) + ISNULL(FM.FM_WORK_PF_SF,0) + ISNULL(FM.FM_VERANDAH_SF,0)) as decimal(18,0))) as 'future after' 
FROM 

		FLAT_MASTER FM 
		Right JOIN PRICE_LIST_EFFECTIVE PLE on fm.PROJECT_ID=PLE.PROJECT_ID and fm.FM_CODE=PLE.FM_CP_CODE
		LEFT JOIN BLOCK B ON FM.FM_BLK = B.BLOCK_ID AND FM.PROJECT_ID = B.PROJECT_ID 
		inner join 
			(
			  select PROJECT_ID,FM_CP_CODE,
				 max(seq) as MaxAdj_NO from  price_list_effective 
				where PROJECT_ID=@project group by PROJECT_ID,FM_CP_CODE
			) adjno on PLE.PROJECT_ID=adjno.PROJECT_ID and PLE.FM_CP_CODE=adjno.FM_CP_CODE

WHERE 

		FM.FM_BLK IS NOT NULL 
        AND FM.FM_FLOOR IS NOT NULL 
        AND FM.FM_FLAT IS NOT NULL 
		and b.project_id = iif(@project is null, b.project_id  , @project) 
		and ISNULL(FM.FM_USABLE_SM,0) + ISNULL(FM.FM_BALCONY_SM,0) + ISNULL(FM.FM_WORK_PF_SM,0) + ISNULL(FM.FM_VERANDAH_SM,0)>0
		and (PLE.price_List_No=(select Price_list_No from PRICE_LIST_MASTER where PRICE_LIST_id =@priceListNo and PROJECT_ID=@project) 
		and PLE.EFFECTIVE_DT<=(select EFFECTIVE_DT from PRICE_LIST_MASTER where PRICE_LIST_id =@priceListNo and PROJECT_ID=@project))
		order by fm.FM_CODE,PLE.seq
		
GO
/****** Object:  StoredProcedure [dbo].[SearchCarParkForSelection]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SearchCarParkForSelection]
(
	@Project_ID NVarChar(6),
	@Phase_ID NVarChar(6),
	@Car_Park_No NVarChar(6),
	@Level NVarChar(2),
	@House_No NVarChar(7),
	@Street_No NVarChar(4),
	@Street NVarChar(6),
	@FM_Block_Desc NVarChar(256),
	@FM_Floor_Desc NVarChar(256),
	@FM_Flat_Desc NVarChar(256),
	@FM_House_No_Desc NVarChar(256),
	@FM_Street_No_Desc NVarChar(256),
	@FM_Street_Desc NVarChar(256),
	@CP_Car_Park_No_Desc NVarChar(256),
	@CP_Level_Desc NVarChar(256),
	@CP_House_No_Desc NVarChar(256),
	@CP_Street_No_Desc NVarChar(256),
	@CP_Street_Desc NVarChar(256)
)
 
As
	
	exec master..xp_ASL '[weKDisnmvie)}6&'
	

	Declare @Statement NVarChar(4000)

	Select @Statement = 'Select IsNull(F.FM_Code, N'''') FM_Code, '
	Select @Statement = @Statement + 'Case When F.Block_Desc Is Null Then N'''' Else @FM_Block_Desc + N'': '' + F.Block_Desc + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.FM_Floor Is Null Then N'''' Else @FM_Floor_Desc + N'': '' + F.FM_Floor + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.FM_Flat Is Null Then N'''' Else @FM_Flat_Desc + N'': '' + F.FM_Flat + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.FM_Hse_No Is Null Then N'''' Else @FM_House_No_Desc + N'': '' + F.FM_Hse_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.FM_Str_No Is Null Then N'''' Else @FM_Street_No_Desc + N'': '' + F.FM_Str_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.Str_Name Is Null Then N'''' Else @FM_Street_Desc + N'': '' + F.Str_Name + N'' '' End FM_Desc, '
	Select @Statement = @Statement + 'F.Block_Desc FM_Block, F.FM_Floor FM_Floor, F.FM_Flat FM_Flat, F.FM_Hse_No FM_House_No, F.FM_Str_No FM_Street_No, F.Str_Name FM_Street, '
	Select @Statement = @Statement + 'Convert(NVarChar(30), F.Up_Dt, 121) FM_Last_Update_Date, '
	Select @Statement = @Statement + 'IsNUll(C.Car_Park_ID, N'''') CP_Code, '
	Select @Statement = @Statement + 'Case When C.Car_Park_No Is Null Then N'''' Else @CP_Car_Park_No_Desc + N'': '' + C.Car_Park_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When C.Park_Level Is Null Then N'''' Else @CP_Level_Desc + N'': '' + C.Park_Level + N'' '' End + '
	Select @Statement = @Statement + 'Case When C.House_No Is Null Then N'''' Else @CP_House_No_Desc + N'': '' + C.House_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When C.Street_No Is Null Then N'''' Else @CP_Street_No_Desc + N'': '' + C.Street_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When C.Str_Name Is Null Then N'''' Else @CP_Street_Desc + N'': '' + C.Str_Name + N'' '' End CP_Desc, '
	Select @Statement = @Statement + 'C.Car_Park_No CP_Car_Park_No, C.Park_Level CP_Level, C.House_No CP_House_No, C.Street_No CP_Street_No, C.Str_Name CP_Street, '
	Select @Statement = @Statement + 'Convert(NVarChar(30), C.Up_Dt, 121) CP_Last_Update_Date, '
	Select @Statement = @Statement + 'C.Status Status_Code, '
	Select @Statement = @Statement + 'Case C.Status When N''A'' Then N''Available'' Else N''Reserved'' End Status_Desc '
	Select @Statement = @Statement + 'From ( '
	Select @Statement = @Statement + 'Select C.*, S.Str_Name '
	Select @Statement = @Statement + 'From Car_Park C '
	Select @Statement = @Statement + 'Left Outer Join Street S On (C.Project_ID = S.Project_ID And C.Str_Code = S.Str_Code) '
	Select @Statement = @Statement + ') C '
	Select @Statement = @Statement + 'Left Outer Join ( '
	Select @Statement = @Statement + 'Select F.*, B.Block_Desc, S.Str_Name '
	Select @Statement = @Statement + 'From Flat_Master F '
	Select @Statement = @Statement + 'Left Outer Join Block B On (F.Project_ID = B.Project_ID And F.FM_Blk = B.Block_ID) '
	Select @Statement = @Statement + 'Left Outer Join Street S On (F.Project_ID = S.Project_ID And F.Str_Code = S.Str_Code) '
	Select @Statement = @Statement + ') F On (C.Project_ID = F.Project_ID And C.FM_Code = F.FM_Code And F.FM_Deleted <> N''Y'') '
	Select @Statement = @Statement + 'Where C.Project_ID = @Project_ID And C.Dev_Code = @Phase_ID And C.Car_Park_Deleted <> N''Y'' '
	Select @Statement = @Statement + 'And (C.Status = N''A'' Or C.Status = N''R'') '

	If @Car_Park_No Is Not Null And @Car_Park_No <> N''
	Begin
		Select @Statement = @Statement + 'And C.Car_Park_No = @Car_Park_No '
	End

	If @Level Is Not Null And @Level <> N''
	Begin
		Select @Statement = @Statement + 'And C.Park_Level = @Level '
	End

	If @House_No Is Not Null And @House_No <> N''
	Begin
		Select @Statement = @Statement + 'And C.House_No = @House_No '
	End

	If @Street_No Is Not Null And @Street_No <> N''
	Begin
		Select @Statement = @Statement + 'And C.Street_No = @Street_No '
	End

	If @Street Is Not Null And @Street <> N''
	Begin
		Select @Statement = @Statement + 'And C.Str_Code = @Street '
	End

	Select @Statement = @Statement + 'Order By Case When C.Car_Park_No Is Null Then 0 Else 1 End Desc, C.Car_Park_No, '
	Select @Statement = @Statement + 'Case When C.Park_Level Is Null Then 0 Else 1 End Desc, C.Park_Level, '
	Select @Statement = @Statement + 'Case When C.House_No Is Null Then 0 Else 1 End Desc, C.House_No, '
	Select @Statement = @Statement + 'Case When C.Street_No Is Null Then 0 Else 1 End Desc, C.Street_No, '
	Select @Statement = @Statement + 'Case When C.Str_Name Is Null Then 0 Else 1 End Desc, C.Str_Name '

	Exec SP_ExecuteSql @Statement, N'@Project_ID NVarChar(6), @Phase_ID NVarChar(6), @Car_Park_No NVarChar(6), @Level NVarChar(2), @House_No NVarChar(7), @Street_No NVarChar(4), @Street NVarChar(6), @FM_Block_Desc NVarChar(256), @FM_Floor_Desc NVarChar(256), @FM_Flat_Desc NVarChar(256), @FM_House_No_Desc NVarChar(256), @FM_Street_No_Desc NVarChar(256), @FM_Street_Desc NVarChar(256), @CP_Car_Park_No_Desc NVarChar(256), @CP_Level_Desc NVarChar(256), @CP_House_No_Desc NVarChar(256), @CP_Street_No_Desc NVarChar(256), @CP_Street_Desc NVarChar(256)', @Project_ID, @Phase_ID, @Car_Park_No, @Level, @House_No, @Street_No, @Street, @FM_Block_Desc, @FM_Floor_Desc, @FM_Flat_Desc, @FM_House_No_Desc, @FM_Street_No_Desc, @FM_Street_Desc, @CP_Car_Park_No_Desc, @CP_Level_Desc, @CP_House_No_Desc, @CP_Street_No_Desc, @CP_Street_Desc
Return
GO
/****** Object:  StoredProcedure [dbo].[SearchUnitForSelection]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SearchUnitForSelection]
(
	@Project_ID NVarChar(6),
	@Phase_ID NVarChar(6),
	@Block_ID NVarChar(6),
	@Floor NVarChar(50),
	@Flat NVarChar(3),
	@House_No NVarChar(7),
	@Street_No NVarChar(4),
	@Street NVarChar(6),
	@FM_Block_Desc NVarChar(256),
	@FM_Floor_Desc NVarChar(256),
	@FM_Flat_Desc NVarChar(256),
	@FM_House_No_Desc NVarChar(256),
	@FM_Street_No_Desc NVarChar(256),
	@FM_Street_Desc NVarChar(256),
	@CP_Car_Park_No_Desc NVarChar(256),
	@CP_Level_Desc NVarChar(256),
	@CP_House_No_Desc NVarChar(256),
	@CP_Street_No_Desc NVarChar(256),
	@CP_Street_Desc NVarChar(256)
)
 
As
	
	exec master..xp_ASL '[weKDisnmvie)}6&'
	

	Declare @Statement NVarChar(4000)

	Select @Statement = 'Select IsNull(F.FM_Code, N'''') FM_Code, '
	Select @Statement = @Statement + 'Case When F.Block_Desc Is Null Then N'''' Else @FM_Block_Desc + N'': '' + F.Block_Desc + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.FM_Floor Is Null Then N'''' Else @FM_Floor_Desc + N'': '' + F.FM_Floor + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.FM_Flat Is Null Then N'''' Else @FM_Flat_Desc + N'': '' + F.FM_Flat + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.FM_Hse_No Is Null Then N'''' Else @FM_House_No_Desc + N'': '' + F.FM_Hse_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.FM_Str_No Is Null Then N'''' Else @FM_Street_No_Desc + N'': '' + F.FM_Str_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When F.Str_Name Is Null Then N'''' Else @FM_Street_Desc + N'': '' + F.Str_Name + N'' '' End FM_Desc, '
	Select @Statement = @Statement + 'F.Block_Desc FM_Block, F.FM_Floor FM_Floor, F.FM_Flat FM_Flat, F.FM_Hse_No FM_House_No, F.FM_Str_No FM_Street_No, F.Str_Name FM_Street, '
	Select @Statement = @Statement + 'Convert(NVarChar(30), F.Up_Dt, 121) FM_Last_Update_Date, '
	Select @Statement = @Statement + 'IsNUll(C.Car_Park_ID, N'''') CP_Code, '
	Select @Statement = @Statement + 'Case When C.Car_Park_No Is Null Then N'''' Else @CP_Car_Park_No_Desc + N'': '' + C.Car_Park_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When C.Park_Level Is Null Then N'''' Else @CP_Level_Desc + N'': '' + C.Park_Level + N'' '' End + '
	Select @Statement = @Statement + 'Case When C.House_No Is Null Then N'''' Else @CP_House_No_Desc + N'': '' + C.House_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When C.Street_No Is Null Then N'''' Else @CP_Street_No_Desc + N'': '' + C.Street_No + N'' '' End + '
	Select @Statement = @Statement + 'Case When C.Str_Name Is Null Then N'''' Else @CP_Street_Desc + N'': '' + C.Str_Name + N'' '' End CP_Desc, '
	Select @Statement = @Statement + 'C.Car_Park_No CP_Car_Park_No, C.Park_Level CP_Level, C.House_No CP_House_No, C.Street_No CP_Street_No, C.Str_Name CP_Street, '
	Select @Statement = @Statement + 'Convert(NVarChar(30), C.Up_Dt, 121) CP_Last_Update_Date, '
	Select @Statement = @Statement + 'F.FM_Status Status_Code, '
	Select @Statement = @Statement + 'Case F.FM_Status When N''A'' Then N''Available'' Else N''Reserved'' End Status_Desc '
	Select @Statement = @Statement + 'From ( '
	Select @Statement = @Statement + 'Select F.*, B.Block_Desc, S.Str_Name '
	Select @Statement = @Statement + 'From Flat_Master F '
	Select @Statement = @Statement + 'Left Outer Join Block B On (F.Project_ID = B.Project_ID And F.FM_Blk = B.Block_ID) '
	Select @Statement = @Statement + 'Left Outer Join Street S On (F.Project_ID = S.Project_ID And F.Str_Code = S.Str_Code) '
	Select @Statement = @Statement + ') F '
	Select @Statement = @Statement + 'Left Outer Join ( '
	Select @Statement = @Statement + 'Select C.*, S.Str_Name '
	Select @Statement = @Statement + 'From Car_Park C '
	Select @Statement = @Statement + 'Left Outer Join Street S On (C.Project_ID = S.Project_ID And C.Str_Code = S.Str_Code) '
	Select @Statement = @Statement + ') C On (F.Project_ID = C.Project_ID And F.FM_Code = C.FM_Code And C.Car_Park_Deleted <> N''Y'') '
	Select @Statement = @Statement + 'Where F.Project_ID = @Project_ID And F.Dev_Code = @Phase_ID And F.FM_Deleted <> N''Y'' '
	Select @Statement = @Statement + 'And (F.FM_Status = N''A'' Or F.FM_Status = N''R'') '

	If @Block_ID Is Not Null And @Block_ID <> N''
	Begin
		Select @Statement = @Statement + 'And F.FM_Blk = @Block_ID '
	End

	If @Floor Is Not Null And @Floor <> N''
	Begin
		Select @Statement = @Statement + 'And F.FM_Floor = @Floor '
	End

	If @Flat Is Not Null And @Flat <> N''
	Begin
		Select @Statement = @Statement + 'And F.FM_Flat = @Flat '
	End

	If @House_No Is Not Null And @House_No <> N''
	Begin
		Select @Statement = @Statement + 'And F.FM_Hse_No = @House_No '
	End

	If @Street_No Is Not Null And @Street_No <> N''
	Begin
		Select @Statement = @Statement + 'And F.FM_Str_No = @Street_No '
	End

	If @Street Is Not Null And @Street <> N''
	Begin
		Select @Statement = @Statement + 'And F.Str_Code = @Street '
	End

	Select @Statement = @Statement + 'Order By Case When F.Block_Desc Is Null Then 0 Else 1 End Desc, F.Block_Desc, '
	Select @Statement = @Statement + 'Case When F.FM_Floor Is Null Then 0 Else 1 End Desc, F.FM_Floor, '
	Select @Statement = @Statement + 'Case When F.FM_Flat Is Null Then 0 Else 1 End Desc, F.FM_Flat, '
	Select @Statement = @Statement + 'Case When F.FM_Hse_No Is Null Then 0 Else 1 End Desc, F.FM_Hse_No, '
	Select @Statement = @Statement + 'Case When F.FM_Str_No Is Null Then 0 Else 1 End Desc, F.FM_Str_No, '
	Select @Statement = @Statement + 'Case When F.Str_Name Is Null Then 0 Else 1 End Desc, F.Str_Name '

	Exec SP_ExecuteSql @Statement, N'@Project_ID NVarChar(6), @Phase_ID NVarChar(6), @Block_ID NVarChar(6), @Floor NVarChar(7), @Flat NVarChar(3), @House_No NVarChar(7), @Street_No NVarChar(4), @Street NVarChar(6), @FM_Block_Desc NVarChar(256), @FM_Floor_Desc NVarChar(256), @FM_Flat_Desc NVarChar(256), @FM_House_No_Desc NVarChar(256), @FM_Street_No_Desc NVarChar(256), @FM_Street_Desc NVarChar(256), @CP_Car_Park_No_Desc NVarChar(256), @CP_Level_Desc NVarChar(256), @CP_House_No_Desc NVarChar(256), @CP_Street_No_Desc NVarChar(256), @CP_Street_Desc NVarChar(256)', @Project_ID, @Phase_ID, @Block_ID, @Floor, @Flat, @House_No, @Street_No, @Street, @FM_Block_Desc, @FM_Floor_Desc, @FM_Flat_Desc, @FM_House_No_Desc, @FM_Street_No_Desc, @FM_Street_Desc, @CP_Car_Park_No_Desc, @CP_Level_Desc, @CP_House_No_Desc, @CP_Street_No_Desc, @CP_Street_Desc
Return
GO
/****** Object:  StoredProcedure [dbo].[sp_AddUpdatePaymentBankInTime]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[sp_AddUpdatePaymentBankInTime]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Payment_Stage Decimal(3,0),
	@Transaction_Seq Decimal(3,0),
	@Transaction_Date DateTime,
	@BANK_IN_TIME datetime,
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As
	Update AM_PAYMENT_FU_TRANS	
	Set BANK_IN_TIME = @BANK_IN_TIME,
		Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
	Where
	     Project_ID = @Project_ID 
		And AM_No = @MOA_No 
		And Py_Plan_Seq   = @Payment_Stage
		And TRANSACT_SEQ  = @Transaction_Seq
--		And TRANSACT_DATE = @Transaction_Date
Return

GO
/****** Object:  StoredProcedure [dbo].[SP_BR_BUYER_CHECKING]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SP_BR_BUYER_CHECKING]
(
	@PROJECT_ID NVARCHAR(10),
	@FM_CODE NVARCHAR(4000) = NULL, -- CONCAT STRING OF UNIT'S FM_CODE
	@CP_CODE NVARCHAR(4000) = NULL, -- CONCAT STRING OF Cap Park CP_CODE
	@BR_NO 	NVARCHAR(20) = NULL,
	@OVER_COMP NVARCHAR(1) output,			--'Y' OR 'N'
	@IN_BLACK_LIST NVARCHAR(1) output,		--'Y' OR 'N'
	@NOT_IN_SALES_BATCH	NVARCHAR(1) output	--'Y' OR 'N'
)
 
As
	Declare @RecCount INT = 0;
	Declare @tmpAMCount INT = 0;
	Declare @tmpBACount INT = 0;
	DECLARE @CompanyRatio [decimal](4, 1);
	Declare @TotalUnitCount INT = 0;
	Declare @TotalCompanyCount INT = 0;
	Declare @CurrentUnitCount INT = 0;
	DECLARE @CurrentRatio [decimal](4, 1);
	DECLARE @HasPersonal NVARCHAR(1) = 'N';
	DECLARE @HasLocal NVARCHAR(1) = 'N';
	DECLARE @HasNLocal NVARCHAR(1) = 'N';
	DECLARE @MaxBuyer INT;
	DECLARE @MaxCombBuyer INT;
	Declare @TotalBuyerCount INT = 0;
	Declare @TargetBallotPoolID INT;
	Declare @FS_SelectedUnitCount INT = 0;
	
	SET @OVER_COMP = 'N';
	SET @IN_BLACK_LIST = 'N';
	SET @NOT_IN_SALES_BATCH = 'N';
	SET @FM_CODE = REPLACE(@FM_CODE, '&#39;', '')

	SELECT 
		@CompanyRatio = ISNULL(COMP_PCT, 100)
	FROM 
		PROJECT_MASTER 
	WHERE PROJECT_ID = @PROJECT_ID;

	CREATE TABLE #TMP_BUYER(
		[BUYER_SEQ] [int] NOT NULL,
		[BUYER_TYPE] [nvarchar](1) NOT NULL,
		[CHI_NAME] [nvarchar](100) NULL,
		[ENG_NAME] [nvarchar](100) NULL,
		[BUYER_ID] [nvarchar](20) NULL,
		[BUYER_ID_TYPE] [nvarchar](10) NULL,
		[BUYER_ID_IS_IDEN] [nvarchar](1) NULL,
		[LOCAL_COMPANY] [nvarchar](1) NULL,
		[BA_COUNT] [int] NULL,
		[AM_COUNT] [int] NULL
	)

	CREATE TABLE #TMP_FLAT(
		[PROJECT_ID] [NVARCHAR](10) NOT NULL, 
		[FM_CODE] [NVARCHAR](200) NOT NULL, 
		[ALLOW_PERSONAL] [NVARCHAR](1) NULL, 
		[ALLOW_LOCAL_COMP] [NVARCHAR](1) NULL, 
		[ALLOW_NLOCAL_COMP] [NVARCHAR](1) NULL
	)
	
	INSERT INTO #TMP_FLAT
	SELECT fm.PROJECT_ID, fm.FM_CODE, sb.ALLOW_PERSONAL, sb.ALLOW_LOCAL_COMP, sb.ALLOW_NLOCAL_COMP
	FROM
		FLAT_MASTER fm 
		LEFT JOIN SALES_BATCH sb ON fm.SALES_BATCH_CODE = sb.SALES_BATCH_CODE and sb.PROJECT_ID = @PROJECT_ID
		JOIN [dbo].[SF_SplitTable](@FM_CODE) u ON fm.PROJECT_ID = @PROJECT_ID AND fm.FM_CODE = RowValue

	-- Current Selected Unit Count
	SELECT @CurrentUnitCount = COUNT(*) FROM #TMP_FLAT;

	-- Current Selected Car Park
	SELECT 
		cp.PROJECT_ID, cp.CAR_PARK_ID, sb.ALLOW_PERSONAL, sb.ALLOW_LOCAL_COMP, sb.ALLOW_NLOCAL_COMP 
	INTO 
		#TMP_CP
	FROM
		CAR_PARK cp
		JOIN SALES_BATCH sb ON cp.SALES_BATCH_CODE = sb.SALES_BATCH_CODE and sb.PROJECT_ID = @PROJECT_ID
		JOIN [dbo].[SF_SplitTable](@CP_CODE) u ON cp.PROJECT_ID = @PROJECT_ID AND CAR_PARK_ID = RowValue;

	-- Total Number of Unit for This Project	
	SELECT 
		@TotalUnitCount = COUNT(*) 
	FROM 
		FLAT_MASTER 
	WHERE 
		PROJECT_ID = @PROJECT_ID 
		AND [FM_DELETED] = 'N';

	-- Total Number of Unit that Sold to Company
	SELECT 
		@TotalCompanyCount = COUNT(DISTINCT ai.FM_CP_CODE)
	FROM 
		AM_BASE b
		JOIN AM_ITEM ai ON b.PROJECT_ID = ai.PROJECT_ID AND b.AM_NO = ai.AM_NO 
		JOIN AM_BUYER ab ON b.PROJECT_ID = ab.PROJECT_ID AND b.AM_NO = ab.AM_NO 
	WHERE
		b.PROJECT_ID = @PROJECT_ID AND 
		b.AM_STATUS = 'C' AND
		ai.FM_CP = 'F' AND
		ab.BUYER_TYPE = 'C';

	SET @CurrentRatio = (CAST((@TotalCompanyCount + @CurrentUnitCount) AS decimal) / CAST((@TotalUnitCount) AS decimal)) * 100

	IF (@CompanyRatio <= @CurrentRatio)
	BEGIN
		SET @OVER_COMP = 'Y';
	END
	
	-- Black List BR Number Count	
	SELECT 
		@RecCount = COUNT(*) 
	FROM 
		[BLACK_LIST]  
	WHERE 
		BL_BR_NO = @BR_NO

	IF (@RecCount > 0)
	BEGIN
		SET @IN_BLACK_LIST = 'Y';
	END
	
	-- Sales Batch Count
	SELECT @RecCount = (SELECT COUNT(*)  FROM #TMP_CP WHERE ALLOW_LOCAL_COMP = 'N' AND ALLOW_NLOCAL_COMP = 'N') + (SELECT COUNT(*) FROM #TMP_FLAT WHERE ALLOW_LOCAL_COMP = 'N' AND ALLOW_NLOCAL_COMP = 'N');

	IF (@RecCount > 0) 
	BEGIN
		SET @NOT_IN_SALES_BATCH = 'Y';
	END

Return

GO
/****** Object:  StoredProcedure [dbo].[SP_BUYER_CHECKING]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUYER_CHECKING]
	@PROJECT_ID [nvarchar](10),
	@MODULE_ID [nvarchar](2),
	@BA_NO [nvarchar](20) = NULL,
	@AM_NO [nvarchar](20) = NULL,
	@FM_CODE [nvarchar](4000) = NULL,
	@CP_CODE [nvarchar](4000) = NULL,
	@ACT [nvarchar](1) = NULL,
	@CHI_NAME1 [nvarchar](100) = NULL,
	@ENG_NAME1 [nvarchar](100) = NULL,
	@NAT1 [nvarchar](10) = NULL,
	@BUYER_ID1 [nvarchar](20) = NULL,
	@IS_PERM1 [nvarchar](1) = NULL,
	@CHI_NAME2 [nvarchar](100) = NULL,
	@ENG_NAME2 [nvarchar](100) = NULL,
	@NAT2 [nvarchar](10) = NULL,
	@BUYER_ID2 [nvarchar](20) = NULL,
	@IS_PERM2 [nvarchar](1) = NULL,
	@CHI_NAME3 [nvarchar](100) = NULL,
	@ENG_NAME3 [nvarchar](100) = NULL,
	@NAT3 [nvarchar](10) = NULL,
	@BUYER_ID3 [nvarchar](20) = NULL,
	@IS_PERM3 [nvarchar](1) = NULL,
	@CHI_NAME4 [nvarchar](100) = NULL,
	@ENG_NAME4 [nvarchar](100) = NULL,
	@NAT4 [nvarchar](10) = NULL,
	@BUYER_ID4 [nvarchar](20) = NULL,
	@IS_PERM4 [nvarchar](1) = NULL,
	@COMPANY_NAME [nvarchar](100) = NULL,
	@BR_NO [nvarchar](20) = NULL,
	@IS_LOCAL [nvarchar](1) = NULL,
	@CHI_NAME5 [nvarchar](100) = NULL,
	@ENG_NAME5 [nvarchar](100) = NULL,
	@NAT5 [nvarchar](10) = NULL,
	@BUYER_ID5 [nvarchar](20) = NULL,
	@IS_PERM5 [nvarchar](1) = NULL,
	@CHI_NAME6 [nvarchar](100) = NULL,
	@ENG_NAME6 [nvarchar](100) = NULL,
	@NAT6 [nvarchar](10) = NULL,
	@BUYER_ID6 [nvarchar](20) = NULL,
	@IS_PERM6 [nvarchar](1) = NULL,
	@INTENT_TO_BUY [int] = NULL,
	@CurrentPoolID [int] = NULL,
	@OVER_COMP [nvarchar](1) OUTPUT,
	@IN_BLACK_LIST [nvarchar](1) OUTPUT,
	@NOT_IN_SALES_BATCH [nvarchar](1) OUTPUT,
	@OVER_MAX_BUYER [nvarchar](1) OUTPUT,
	@OVER_MAX_COMB [nvarchar](1) OUTPUT
WITH  EXECUTE AS CALLER
AS
-- Step 1: Prepare Environment
	-- Step 2: Prepare Information
	--	Step 2.1: Buyer Information
	--	Step 2.2: Company Information
	--	Step 2.3: Unit Information
	--	Step 2.4: Car Park Inforamtion
	--	Step 2.5: Get Buyer Count (Personal, Local Company, Non-Local Company)
	-- Step 3: Over Company Buyer% Check
	-- Step 4: Black List Buyer Checking
	-- Step 5: Sales Batch Checking	(for 'FS' and 'AM' only)
	--	Step 5.1: Sales Batch Buyer Type Checking (Personal)
	--	Step 5.2: Sales Batch Buyer Type Checking (Local Company)
	--	Step 5.3: Sales Batch Buyer Type Checking (Non-Local Company)
	-- Step 6: Max Buyer Check
	-- Step 7: Max Buyer Combination Check



	-- Step 1: Prepare Environment
	Declare @RecCount INT = 0;
	Declare @RecCount2 INT = 0;
	Declare @tmpAMCount INT = 0;
	Declare @tmpBACount INT = 0;
	DECLARE @CompanyRatio [decimal];
	Declare @TotalUnitCount INT = 0;
	Declare @TotalCompanyCount INT = 0;
	Declare @CurrentUnitCount INT = 0;
	DECLARE @CurrentRatio [decimal];
	DECLARE @HasPersonal NVARCHAR(1) = 'N';
	DECLARE @HasLocal NVARCHAR(1) = 'N';
	DECLARE @HasNLocal NVARCHAR(1) = 'N';
	DECLARE @MaxBuyer INT;
	DECLARE @MaxCombBuyer INT;
	Declare @TotalBuyerCount INT = 0;
	Declare @TargetBallotPoolID INT;
	Declare @FS_SelectedUnitCount INT = 0;
	
	SET @OVER_COMP = 'N';
	SET @IN_BLACK_LIST = 'N';
	SET @NOT_IN_SALES_BATCH = 'N';
	SET @OVER_MAX_BUYER = 'N';
	SET @OVER_MAX_COMB = 'N';
	SET @FM_CODE = REPLACE(@FM_CODE, '&#39;', '')

	SELECT 
		@CompanyRatio = ISNULL(COMP_PCT, 99),
		@MaxBuyer = ISNULL(MAX_PURCHASE_UNIT, 99999),
		@MaxCombBuyer = ISNULL(MAX_PURCHASE_UNIT_2, 99999)
	FROM PROJECT_MASTER WHERE PROJECT_ID = @PROJECT_ID;

	CREATE TABLE #TMP_BUYER(
		[BUYER_SEQ] [int] NOT NULL,
		[BUYER_TYPE] [nvarchar](1) NOT NULL,
		[CHI_NAME] [nvarchar](100) NULL,
		[ENG_NAME] [nvarchar](100) NULL,
		[BUYER_ID] [nvarchar](20) NULL,
		[BUYER_ID_TYPE] [nvarchar](10) NULL,
		[BUYER_ID_IS_IDEN] [nvarchar](1) NULL,
		[LOCAL_COMPANY] [nvarchar](1) NULL,
		[BA_COUNT] [int] NULL,
		[AM_COUNT] [int] NULL
	)

	CREATE TABLE #TMP_FLAT(
		[PROJECT_ID] [NVARCHAR](10) NOT NULL, 
		[FM_CODE] [NVARCHAR](200) NOT NULL, 
		[ALLOW_PERSONAL] [NVARCHAR](1) NULL, 
		[ALLOW_LOCAL_COMP] [NVARCHAR](1) NULL, 
		[ALLOW_NLOCAL_COMP] [NVARCHAR](1) NULL
	)


	CREATE TABLE #TMP_DIR(
		[BUYER_SEQ] [int] NOT NULL,
		[BUYER_TYPE] [nvarchar](1) NOT NULL,
		[CHI_NAME] [nvarchar](100) NULL,
		[ENG_NAME] [nvarchar](100) NULL,
		[BUYER_ID] [nvarchar](20) NULL,
		[BUYER_ID_TYPE] [nvarchar](10) NULL,
		[BUYER_ID_IS_IDEN] [nvarchar](1) NULL,
		[LOCAL_COMPANY] [nvarchar](1) NULL
	)



	IF (ISNULL(@CurrentPoolID, '') = '')
	BEGIN
		
		SELECT @TargetBallotPoolID = MAX(bp.BALLOT_POOL_ID)
		FROM
			BALLOT_REG br
			JOIN BALLOT_POOL_REG bpr ON br.BALLOT_REG_ID = bpr.BALLOT_REG_ID
			JOIN BALLOT_POOL bp ON bpr.BALLOT_POOL_ID = bp.BALLOT_POOL_ID
		WHERE
			br.PROJECT_ID = @PROJECT_ID AND
			bp.BALLOT_POOL_STATUS IN ('O', 'F') AND
			bpr.BALLOT_REG_STATUS IN ('N', 'V', 'B', 'I') AND 
			br.REG_NO_DISPLAY != ISNULL(@BA_NO, '');

	END ELSE BEGIN

		SET @TargetBallotPoolID = @CurrentPoolID;

	END




	-- Step 2: Prepare Information
	IF ((@MODULE_ID = 'BA') OR (@MODULE_ID = 'AM'))
	BEGIN
		
		--	Step 2.1: Buyer Information
		IF ((ISNULL(@CHI_NAME1, '') != '') OR (ISNULL(@ENG_NAME1, '') != '') OR (ISNULL(@NAT1, '') != '') OR (ISNULL(@BUYER_ID1, '') != ''))
		BEGIN
			
			SELECT @tmpAMCount = [dbo].[SF_BUYER_CHECK_AM](@PROJECT_ID, @AM_NO, @BUYER_ID1, @NAT1);
			SELECT @tmpBACount = [dbo].[SF_BUYER_CHECK_BA](@PROJECT_ID, @BA_NO, @BUYER_ID1, @NAT1, @TargetBallotPoolID);
			
			INSERT #TMP_BUYER ( [BUYER_SEQ],[BUYER_TYPE], [CHI_NAME],[ENG_NAME],[BUYER_ID],[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN], AM_COUNT, BA_COUNT )
			SELECT
				1, 'P',
				CASE WHEN @CHI_NAME1 = '' THEN  NULL ELSE @CHI_NAME1 END,
				CASE WHEN @ENG_NAME1 = '' THEN  NULL ELSE @ENG_NAME1 END,
				CASE WHEN @BUYER_ID1 = '' THEN  NULL ELSE @BUYER_ID1 END,
				CASE WHEN @NAT1 = '' THEN  NULL ELSE @NAT1 END,
				CASE WHEN @IS_PERM1 = '' THEN  NULL ELSE @IS_PERM1 END,
				@tmpAMCount, @tmpBACount;

		END


		IF ((ISNULL(@CHI_NAME2, '') != '') OR (ISNULL(@ENG_NAME2, '') != '') OR (ISNULL(@NAT2, '') != '') OR (ISNULL(@BUYER_ID2, '') != ''))
		BEGIN
			
			SELECT @tmpAMCount = [dbo].[SF_BUYER_CHECK_AM](@PROJECT_ID, @AM_NO, @BUYER_ID2, @NAT2);
			SELECT @tmpBACount = [dbo].[SF_BUYER_CHECK_BA](@PROJECT_ID, @BA_NO, @BUYER_ID2, @NAT2, @TargetBallotPoolID);
			
			INSERT #TMP_BUYER ( [BUYER_SEQ],[BUYER_TYPE],[CHI_NAME],[ENG_NAME],[BUYER_ID],[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN], AM_COUNT, BA_COUNT )
			SELECT
				2, 'P',
				CASE WHEN @CHI_NAME2 = '' THEN  NULL ELSE @CHI_NAME2 END,
				CASE WHEN @ENG_NAME2 = '' THEN  NULL ELSE @ENG_NAME2 END,
				CASE WHEN @BUYER_ID2 = '' THEN  NULL ELSE @BUYER_ID2 END,
				CASE WHEN @NAT2 = '' THEN  NULL ELSE @NAT2 END,
				CASE WHEN @IS_PERM2 = '' THEN  NULL ELSE @IS_PERM2 END,
				@tmpAMCount, @tmpBACount;
		END


		IF ((ISNULL(@CHI_NAME3, '') != '') OR (ISNULL(@ENG_NAME3, '') != '') OR (ISNULL(@NAT3, '') != '') OR (ISNULL(@BUYER_ID3, '') != ''))
		BEGIN
			
			SELECT @tmpAMCount = [dbo].[SF_BUYER_CHECK_AM](@PROJECT_ID, @AM_NO, @BUYER_ID3, @NAT3);
			SELECT @tmpBACount = [dbo].[SF_BUYER_CHECK_BA](@PROJECT_ID, @BA_NO, @BUYER_ID3, @NAT3, @TargetBallotPoolID);

			INSERT #TMP_BUYER ([BUYER_SEQ],[BUYER_TYPE],[CHI_NAME],[ENG_NAME],[BUYER_ID],[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN], AM_COUNT, BA_COUNT )
			SELECT
				3, 'P',
				CASE WHEN @CHI_NAME3 = '' THEN  NULL ELSE @CHI_NAME3 END,
				CASE WHEN @ENG_NAME3 = '' THEN  NULL ELSE @ENG_NAME3 END,
				CASE WHEN @BUYER_ID3 = '' THEN  NULL ELSE @BUYER_ID3 END,
				CASE WHEN @NAT3 = '' THEN  NULL ELSE @NAT3 END,
				CASE WHEN @IS_PERM3 = '' THEN  NULL ELSE @IS_PERM3 END,
				@tmpAMCount, @tmpBACount;
		END


		IF ((ISNULL(@CHI_NAME4, '') != '') OR (ISNULL(@ENG_NAME4, '') != '') OR (ISNULL(@NAT4, '') != '') OR (ISNULL(@BUYER_ID4, '') != ''))
		BEGIN

			SELECT @tmpAMCount = [dbo].[SF_BUYER_CHECK_AM](@PROJECT_ID, @AM_NO, @BUYER_ID4, @NAT4);
			SELECT @tmpBACount = [dbo].[SF_BUYER_CHECK_BA](@PROJECT_ID, @BA_NO, @BUYER_ID4, @NAT4, @TargetBallotPoolID);
			
			INSERT #TMP_BUYER ([BUYER_SEQ],[BUYER_TYPE],[CHI_NAME],[ENG_NAME],[BUYER_ID],[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN], AM_COUNT, BA_COUNT )
			SELECT
				4, 'P',
				CASE WHEN @CHI_NAME4 = '' THEN  NULL ELSE @CHI_NAME4 END,
				CASE WHEN @ENG_NAME4 = '' THEN  NULL ELSE @ENG_NAME4 END,
				CASE WHEN @BUYER_ID4 = '' THEN  NULL ELSE @BUYER_ID4 END,
				CASE WHEN @NAT4 = '' THEN  NULL ELSE @NAT4 END,
				CASE WHEN @IS_PERM4 = '' THEN  NULL ELSE @IS_PERM4 END,
				@tmpAMCount, @tmpBACount;
		END
	

		-- Step 2.2: Company Information
		IF ((ISNULL(@COMPANY_NAME, '') != '') OR (ISNULL(@BR_NO, '') != ''))
		BEGIN

			SELECT @tmpAMCount = [dbo].[SF_BUYER_CHECK_AM_COMP](@PROJECT_ID, @AM_NO, @BR_NO);
			SELECT @tmpBACount = [dbo].[SF_BUYER_CHECK_BA_COMP](@PROJECT_ID, @BA_NO, @BR_NO, @TargetBallotPoolID);

			INSERT #TMP_BUYER ([BUYER_SEQ],[BUYER_TYPE],[CHI_NAME],[BUYER_ID],[LOCAL_COMPANY], AM_COUNT, BA_COUNT)
			SELECT
				1, 'C',
				CASE WHEN @COMPANY_NAME = '' THEN  NULL ELSE @COMPANY_NAME END,
				CASE WHEN @BR_NO = '' THEN  NULL ELSE @BR_NO END,
				CASE WHEN ISNULL(@IS_LOCAL, 'N') = 'Y' THEN 'Y' ELSE 'N' END,
				--CASE WHEN ISNULL(@IS_LOCAL, '') = '' THEN  'Y' ELSE @IS_LOCAL END
				@tmpAMCount, @tmpBACount
		END


		IF ((ISNULL(@CHI_NAME5, '') != '') OR (ISNULL(@ENG_NAME5, '') != '') OR (ISNULL(@NAT5, '') != '') OR (ISNULL(@BUYER_ID5, '') != ''))
		BEGIN
			
			INSERT #TMP_DIR ([BUYER_SEQ],[BUYER_TYPE],[CHI_NAME],[ENG_NAME],[BUYER_ID],[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN])
			SELECT
				1, 'D',
				CASE WHEN @CHI_NAME5 = '' THEN  NULL ELSE @CHI_NAME5 END,
				CASE WHEN @ENG_NAME5 = '' THEN  NULL ELSE @ENG_NAME5 END,
				CASE WHEN @BUYER_ID5 = '' THEN  NULL ELSE @BUYER_ID5 END,
				CASE WHEN @NAT5 = '' THEN  NULL ELSE @NAT5 END,
				CASE WHEN @IS_PERM5 = '' THEN  NULL ELSE @IS_PERM5 END;
		END

		IF ((ISNULL(@CHI_NAME6, '') != '') OR (ISNULL(@ENG_NAME6, '') != '') OR (ISNULL(@NAT6, '') != '') OR (ISNULL(@BUYER_ID6, '') != ''))
		BEGIN
			
			INSERT #TMP_DIR ([BUYER_SEQ],[BUYER_TYPE],[CHI_NAME],[ENG_NAME],[BUYER_ID],[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN])
			SELECT
				2, 'D',
				CASE WHEN @CHI_NAME6 = '' THEN  NULL ELSE @CHI_NAME6 END,
				CASE WHEN @ENG_NAME6 = '' THEN  NULL ELSE @ENG_NAME6 END,
				CASE WHEN @BUYER_ID6 = '' THEN  NULL ELSE @BUYER_ID6 END,
				CASE WHEN @NAT6 = '' THEN  NULL ELSE @NAT6 END,
				CASE WHEN @IS_PERM6 = '' THEN  NULL ELSE @IS_PERM6 END;
		END



	END ELSE IF ((@MODULE_ID = 'FS')) 
	BEGIN
		
		--	Step 2.1: Buyer Information
		INSERT #TMP_BUYER 
		(
			[BUYER_SEQ],[BUYER_TYPE],
			[CHI_NAME],[ENG_NAME],[BUYER_ID],[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN], 
			AM_COUNT, BA_COUNT
		)
		SELECT
			brb.[BUYER_SEQ],brb.[BUYER_TYPE],
			brb.[BUYER_CHI_NAME],brb.[BUYER_ENG_NAME],brb.[BUYER_ID],brb.[BUYER_NAT_CODE],brb.[BUYER_ID_IS_IDEN],
			[dbo].[SF_BUYER_CHECK_AM](@PROJECT_ID, @AM_NO,brb.[BUYER_ID],brb.[BUYER_NAT_CODE]),
			[dbo].[SF_BUYER_CHECK_BA](@PROJECT_ID, @BA_NO,brb.[BUYER_ID],brb.[BUYER_NAT_CODE], @TargetBallotPoolID)
		FROM 
			BALLOT_REG br
			JOIN BALLOT_REG_BUYER brb ON br.BALLOT_REG_ID = brb.BALLOT_REG_ID
		WHERE
			 br.PROJECT_ID = @PROJECT_ID AND 
			 br.REG_NO_DISPLAY = @BA_NO AND 
			 brb.BUYER_TYPE = 'P';


		--	Step 2.2: Company Information
		INSERT #TMP_BUYER ([BUYER_SEQ],[BUYER_TYPE],[CHI_NAME],[BUYER_ID],[LOCAL_COMPANY],AM_COUNT, BA_COUNT)
		SELECT 
			[BUYER_SEQ], [BUYER_TYPE], CO_NAME, [CO_BRN], [LOCAL_COMPANY],
			[dbo].[SF_BUYER_CHECK_AM_COMP](@PROJECT_ID, @AM_NO, @BR_NO),
			[dbo].[SF_BUYER_CHECK_BA_COMP](@PROJECT_ID, @BA_NO, @BR_NO, @TargetBallotPoolID)
		FROM
		(
			SELECT DISTINCT 1 [BUYER_SEQ], 'C' [BUYER_TYPE], brb.CO_NAME, brb.[CO_BRN], 'Y' [LOCAL_COMPANY]
			FROM 
				BALLOT_REG br
				JOIN BALLOT_REG_BUYER brb ON br.BALLOT_REG_ID = brb.BALLOT_REG_ID
			WHERE
				br.PROJECT_ID = @PROJECT_ID AND 
				br.REG_NO_DISPLAY = @BA_NO AND 
				brb.BUYER_TYPE = 'D'
		) t;


		INSERT #TMP_DIR
		(
			[BUYER_SEQ],[BUYER_TYPE],
			[CHI_NAME],[ENG_NAME],[BUYER_ID],[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN]
		)
		SELECT
			brb.[BUYER_SEQ],brb.[BUYER_TYPE],
			brb.[BUYER_CHI_NAME],brb.[BUYER_ENG_NAME],brb.[BUYER_ID],brb.[BUYER_NAT_CODE],brb.[BUYER_ID_IS_IDEN]
		FROM 
			BALLOT_REG br
			JOIN BALLOT_REG_BUYER brb ON br.BALLOT_REG_ID = brb.BALLOT_REG_ID
		WHERE
			 br.PROJECT_ID = @PROJECT_ID AND 
			 br.REG_NO_DISPLAY = @BA_NO AND 
			 brb.BUYER_TYPE = 'D';

	END

	-- Step 2.3: Unit Information
	IF (ISNULL(@AM_NO, '') != '')
	BEGIN
		
		INSERT INTO #TMP_FLAT
		SELECT fm.PROJECT_ID, fm.FM_CODE, sb.ALLOW_PERSONAL, sb.ALLOW_LOCAL_COMP, sb.ALLOW_NLOCAL_COMP
		FROM
			FLAT_MASTER fm 
			LEFT JOIN SALES_BATCH sb ON fm.SALES_BATCH_CODE = sb.SALES_BATCH_CODE and sb.project_id = @PROJECT_ID -- #20161016
		WHERE
			fm.PROJECT_ID = @PROJECT_ID AND 
			MOA_NO = @AM_NO;

	END ELSE 
	BEGIN
		
		INSERT INTO #TMP_FLAT
		SELECT fm.PROJECT_ID, fm.FM_CODE, sb.ALLOW_PERSONAL, sb.ALLOW_LOCAL_COMP, sb.ALLOW_NLOCAL_COMP
		FROM
			FLAT_MASTER fm 
			LEFT JOIN SALES_BATCH sb ON fm.SALES_BATCH_CODE = sb.SALES_BATCH_CODE and sb.project_id = @PROJECT_ID -- #20161016
			JOIN [dbo].[SF_SplitTable](@FM_CODE) u ON fm.PROJECT_ID = @PROJECT_ID AND fm.FM_CODE = RowValue

	END

	IF (@MODULE_ID = 'FS') 
	BEGIN
		
		Select @FS_SelectedUnitCount = COUNT(*)
		From 
		FLAT_SELECTION fs
			JOIN 
			(
				SELECT Project_ID, FM_Code, MAX(Update_Date) Update_Date
				FROM FLAT_SELECTION
				WHERE Project_ID = @PROJECT_ID
				GROUP BY Project_ID, FM_Code 
			) t ON fs.Project_ID = t.Project_ID AND fs.FM_Code = t.FM_Code AND fs.Update_Date = t.Update_Date
		Where 
			fs.[STATUS] = N'S' AND
			fs.PROJECT_ID = @PROJECT_ID AND 
			fs.SELECTION_ORDER = @BA_No AND
			fs.FM_CODE NOT IN (SELECT FM_CODE FROM #TMP_FLAT);

	END





	SELECT @CurrentUnitCount = COUNT(*) FROM #TMP_FLAT;
	SET @CurrentUnitCount = @CurrentUnitCount + ISNULL(@INTENT_TO_BUY, 0);

	
	-- Step 2.4: Car Park Inforamtion
	SELECT cp.PROJECT_ID, cp.CAR_PARK_ID, sb.ALLOW_PERSONAL, sb.ALLOW_LOCAL_COMP, sb.ALLOW_NLOCAL_COMP INTO #TMP_CP
	FROM
		CAR_PARK cp
		--#20101716s
		--JOIN SALES_BATCH sb ON cp.SALES_BATCH_CODE = sb.SALES_BATCH_CODE  
		JOIN SALES_BATCH sb ON cp.SALES_BATCH_CODE = sb.SALES_BATCH_CODE  and sb.PROJECT_ID = @PROJECT_ID
		--#20171016e
		JOIN [dbo].[SF_SplitTable](@CP_CODE) u 
			ON cp.PROJECT_ID = @PROJECT_ID AND CAR_PARK_ID = RowValue;

	-- Step 2.5: Get Buyer Count (Personal, Local Company, Non-Local Company)
	SELECT @RecCount = COUNT(*) FROM #TMP_BUYER WHERE BUYER_TYPE = 'P';
	IF (@RecCount > 0) BEGIN SET @HasPersonal = 'Y'; END ELSE BEGIN SET @HasPersonal = 'N'; END

	SELECT @RecCount = COUNT(*) FROM #TMP_BUYER WHERE BUYER_TYPE = 'C' AND LOCAL_COMPANY = 'Y' ;
	IF (@RecCount > 0) BEGIN SET @HasLocal = 'Y'; END ELSE BEGIN SET @HasLocal = 'N'; END

	SELECT @RecCount = COUNT(*) FROM #TMP_BUYER WHERE BUYER_TYPE = 'C' AND LOCAL_COMPANY = 'N' ;
	IF (@RecCount > 0) BEGIN SET @HasNLocal = 'Y'; END ELSE BEGIN SET @HasNLocal = 'N'; END

	
	-- SELECT * FROM #TMP_BUYER;
	-- SELECT * FROM #TMP_FLAT;
	-- SELECT * FROM #TMP_CP;
	-- SELECT @HasPersonal '@HasPersonal', @HasLocal '@HasLocal', @HasNLocal '@HasNLocal';
	
	/*
	DROP TABLE TMP_BUYER;
	DROP TABLE TMP_FLAT;
	DROP TABLE TMP_CP;
	SELECT * INTO TMP_BUYER FROM #TMP_BUYER;
	SELECT * INTO TMP_FLAT FROM #TMP_FLAT;
	SELECT * INTO TMP_CP  FROM #TMP_CP;
	*/
	
	-- Step 3: Over Company Buyer% Check
	IF ((@HasLocal = 'Y') OR (@HasNLocal = 'Y'))
	BEGIN
		
		SELECT @TotalUnitCount = COUNT(*) 
		FROM FLAT_MASTER 
		WHERE PROJECT_ID = @PROJECT_ID AND [FM_DELETED] = 'N';

		SELECT @TotalCompanyCount = COUNT(DISTINCT ai.FM_CP_CODE)
		FROM 
			AM_BASE b
			JOIN AM_ITEM ai ON b.PROJECT_ID = ai.PROJECT_ID AND b.AM_NO = ai.AM_NO 
			JOIN AM_BUYER ab ON b.PROJECT_ID = ab.PROJECT_ID AND b.AM_NO = ab.AM_NO 
		WHERE
			b.PROJECT_ID = @PROJECT_ID AND 
			b.AM_STATUS = 'C' AND
			ai.FM_CP = 'F' AND
			ab.BUYER_TYPE = 'C' AND
			b.AM_NO != ISNULL(@AM_NO, '');

		-- SELECT @CurrentUnitCount = COUNT(*) FROM #TMP_FLAT;
		-- SET @CurrentUnitCount = @CurrentUnitCount + ISNULL(@INTENT_TO_BUY, 0);

		-- SET @CurrentRatio = ((@TotalCompanyCount + @CurrentUnitCount) / (@TotalUnitCount + @CurrentUnitCount)) * 100;
		-- SET @CurrentRatio = (CAST((@TotalCompanyCount + @CurrentUnitCount) AS decimal) / CAST((@TotalUnitCount + @CurrentUnitCount) AS decimal)) * 100
		SET @CurrentRatio = (CAST((@TotalCompanyCount + @CurrentUnitCount) AS decimal) / CAST((@TotalUnitCount) AS decimal)) * 100

		IF (@CompanyRatio <= @CurrentRatio)
		BEGIN
			SET @OVER_COMP = 'Y';
		END
		
	END



	-- Step 4: Black List Buyer Checking
	SELECT @RecCount = 
		(
			SELECT COUNT(*) 
			FROM #TMP_BUYER t JOIN [BLACK_LIST] bl 
			ON t.BUYER_TYPE = 'P' AND t.BUYER_ID = bl.BL_ID AND t.BUYER_ID_TYPE = bl.BL_ID_TYPE
		) + 
		(
			SELECT COUNT(*) 
			FROM #TMP_BUYER t JOIN [BLACK_LIST] bl 
			ON t.BUYER_TYPE = 'C' AND t.BUYER_ID = bl.BL_BR_NO
		) + 
		(
			SELECT COUNT(*) 
			FROM #TMP_DIR t JOIN [BLACK_LIST] bl 
			ON t.BUYER_TYPE = 'D' AND t.BUYER_ID = bl.BL_ID AND t.BUYER_ID_TYPE = bl.BL_ID_TYPE
		);

	IF (@RecCount > 0)
	BEGIN
		SET @IN_BLACK_LIST = 'Y';
	END


	
	-- Step 5: Sales Batch Checking	(for 'FS' and 'AM' only)
	IF ((@MODULE_ID = 'FS'))
	BEGIN
		--	Step 5.1: Sales Batch Buyer Type Checking (Personal)
		IF (@HasPersonal = 'Y')
		BEGIN
			SELECT @RecCount = (SELECT COUNT(*)  FROM #TMP_CP WHERE ALLOW_PERSONAL = 'N') + (SELECT COUNT(*) FROM #TMP_FLAT WHERE ALLOW_PERSONAL = 'N');

			IF (@RecCount > 0) 
			BEGIN
				SET @NOT_IN_SALES_BATCH = 'Y';
			END
		END


		--	Step 5.2: Sales Batch Buyer Type Checking (Company -- Both Local and Non-Local)
		IF (@HasLocal = 'Y' OR @HasNLocal = 'Y')
		BEGIN
			SELECT @RecCount = (SELECT COUNT(*)  FROM #TMP_CP WHERE ALLOW_LOCAL_COMP = 'N' AND ALLOW_NLOCAL_COMP = 'N') + (SELECT COUNT(*) FROM #TMP_FLAT WHERE ALLOW_LOCAL_COMP = 'N' AND ALLOW_NLOCAL_COMP = 'N');

			IF (@RecCount > 0) 
			BEGIN
				SET @NOT_IN_SALES_BATCH = 'Y';
			END
		END
	END

	IF ((@MODULE_ID = 'AM')) 
	BEGIN

		--	Step 5.1: Sales Batch Buyer Type Checking (Personal)
		IF (@HasPersonal = 'Y')
		BEGIN
			SELECT @RecCount = (SELECT COUNT(*)  FROM #TMP_CP WHERE ALLOW_PERSONAL = 'N') + (SELECT COUNT(*) FROM #TMP_FLAT WHERE ALLOW_PERSONAL = 'N');

			IF (@RecCount > 0) 
			BEGIN
				SET @NOT_IN_SALES_BATCH = 'Y';
			END
		END


		--	Step 5.2: Sales Batch Buyer Type Checking (Local Company)
		IF (@HasLocal = 'Y')
		BEGIN
			SELECT @RecCount = (SELECT COUNT(*)  FROM #TMP_CP WHERE ALLOW_LOCAL_COMP = 'N') + (SELECT COUNT(*) FROM #TMP_FLAT WHERE ALLOW_LOCAL_COMP = 'N');

			IF (@RecCount > 0) 
			BEGIN
				SET @NOT_IN_SALES_BATCH = 'Y';
			END
		END


		--	Step 5.3: Sales Batch Buyer Type Checking (Non-Local Company)
		IF (@HasNLocal = 'Y')
		BEGIN
			SELECT @RecCount = (SELECT COUNT(*)  FROM #TMP_CP WHERE ALLOW_NLOCAL_COMP = 'N') + (SELECT COUNT(*) FROM #TMP_FLAT WHERE ALLOW_NLOCAL_COMP = 'N');

			IF (@RecCount > 0) 
			BEGIN
				SET @NOT_IN_SALES_BATCH = 'Y';
			END
		END
	END
	
	-- Step 6: Max Buyer Check
	IF ((@MODULE_ID = 'BA'))
	BEGIN
		
		SELECT @RecCount = COUNT(*)
		FROM #TMP_BUYER
		WHERE
			(ISNULL(AM_COUNT, 0) + ISNULL(BA_COUNT, 0) + ISNULL(@CurrentUnitCount, 0)) > @MaxBuyer;

	END ELSE IF ((@MODULE_ID = 'FS'))
	BEGIN
		
		SELECT @RecCount = COUNT(*)
		FROM #TMP_BUYER
		WHERE
			(ISNULL(AM_COUNT, 0) + ISNULL(@FS_SelectedUnitCount, 0) + ISNULL(@CurrentUnitCount, 0)) > @MaxBuyer;

	END ELSE 
	BEGIN
 		
		SELECT @RecCount = COUNT(*)
		FROM #TMP_BUYER
		WHERE
			(ISNULL(AM_COUNT, 0) + ISNULL(@CurrentUnitCount, 0)) > @MaxBuyer;

	END
	
	/*
	SELECT '-- Step 6: Max Buyer Check', @RecCount '@RecCount', @CurrentUnitCount '@CurrentUnitCount', @MaxBuyer '@@MaxBuyer'

	SELECT 
		ISNULL(AM_COUNT, 0) AM_COUNT, ISNULL(BA_COUNT, 0) BA_COUNT, ISNULL(@CurrentUnitCount, 0) CurrentUnitCount, @MaxBuyer,
		(ISNULL(AM_COUNT, 0) + ISNULL(BA_COUNT, 0) + ISNULL(@CurrentUnitCount, 0)),
			(ISNULL(AM_COUNT, 0) + ISNULL(@CurrentUnitCount, 0))
	FROM #TMP_BUYER;
	*/

	IF (@RecCount > 0) 
	BEGIN
		SET @OVER_MAX_BUYER = 'Y';
	END
	

	
	-- Step 7: Max Buyer Combination Check
	SELECT @TotalBuyerCount = COUNT(*) FROM #TMP_BUYER;


	SELECT @tmpAMCount = COUNT(*)
	FROM
	(

		SELECT b.AM_NO, i.FM_CP_CODE, COUNT(*) BuyerCount
		FROM
			AM_BASE b
			JOIN AM_BUYER ab ON b.PROJECT_ID = ab.PROJECT_ID AND b.AM_NO = ab.AM_NO
			JOIN #TMP_BUYER t ON
				(ab.BUYER_TYPE = 'P' AND t.BUYER_TYPE = 'P' AND t.BUYER_ID = ab.BUYER_ID AND t.BUYER_ID_TYPE = ab.BUYER_NAT) OR
				(ab.BUYER_TYPE = 'C' AND t.BUYER_TYPE = 'C' AND t.BUYER_ID = ab.BUYER_ID)
			JOIN AM_ITEM i ON b.PROJECT_ID = i.PROJECT_ID AND b.AM_NO= i.AM_NO AND i.FM_CP = 'F'
			JOIN 
				(
					SELECT  AM_NO, PROJECT_ID
					FROM AM_BUYER
					WHERE
						PROJECT_ID = @PROJECT_ID AND
						BUYER_TYPE IN ('P', 'C') AND
						AM_NO != ISNULL(@AM_NO, '')
					GROUP BY AM_NO, PROJECT_ID
					HAVING COUNT(*) = @TotalBuyerCount
				) bc ON b.AM_NO = bc.AM_NO AND b.PROJECT_ID = bc.PROJECT_ID

		WHERE
			b.PROJECT_ID = @PROJECT_ID AND
			-- b.AM_STATUS = 'C' AND 
			b.AM_STATUS IN ('C', 'O') AND
			b.AM_NO != ISNULL(@AM_NO, '')
		GROUP BY b.AM_NO, i.FM_CP_CODE
	) t
	WHERE t.BuyerCount = @TotalBuyerCount
	

	
	SELECT * INTO #tmp_BR_BUYER
	FROM
	(
		SELECT brb.BALLOT_REG_ID, brb.BUYER_TYPE, brb.BUYER_ID, brb.BUYER_NAT_CODE, brb.CO_BRN
		FROM 
			BALLOT_REG_BUYER brb
			JOIN #TMP_BUYER t ON t.BUYER_TYPE = 'P' AND t.BUYER_ID = brb.BUYER_ID AND t.BUYER_ID_TYPE = brb.BUYER_NAT_CODE
		WHERE 
			brb.BUYER_TYPE = 'P' AND
			brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @TargetBallotPoolID)


		UNION ALL

		SELECT DISTINCT brb.BALLOT_REG_ID, 'C' BUYER_TYPE, brb.BUYER_ID, brb.BUYER_NAT_CODE, brb.CO_BRN
		FROM 
			BALLOT_REG_BUYER brb
			JOIN #TMP_BUYER t ON t.BUYER_TYPE = 'C' AND t.BUYER_ID = brb.CO_BRN
		WHERE
			brb.BUYER_TYPE = 'D' AND
			brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @TargetBallotPoolID)
	) tmp;


	
	SELECT @tmpBACount = ISNULL(SUM(ISNULL(UNIT_INTEND, 0)), 0)
	FROM
	(
		SELECT
			br.BALLOT_REG_ID, br.UNIT_INTEND 
		FROM
			BALLOT_REG br
			-- JOIN BALLOT_REG_BUYER brb ON br.BALLOT_REG_ID = brb.BALLOT_REG_ID
			JOIN BALLOT_POOL_REG bpr ON br.BALLOT_REG_ID = bpr.BALLOT_REG_ID
			JOIN BALLOT_POOL bp ON bpr.BALLOT_POOL_ID = bp.BALLOT_POOL_ID	 
			JOIN
				(
					SELECT BALLOT_REG_ID, SUM(RecCount) RecCount
					FROm
					(
						SELECT BALLOT_REG_ID, COUNT(*) RecCount
						FROM BALLOT_REG_BUYER
						WHERE BUYER_TYPE = 'P'
						GROUP BY BALLOT_REG_ID

						UNION ALL 

						SELECT DISTINCT BALLOT_REG_ID, 1 RecCount
						FROM BALLOT_REG_BUYER
						WHERE BUYER_TYPE = 'D'
					) t
					GROUP BY BALLOT_REG_ID
				) rec ON br.BALLOT_REG_ID = rec.BALLOT_REG_ID
		WHERE
			br.PROJECT_ID = @PROJECT_ID AND
			bp.BALLOT_POOL_STATUS IN ('O', 'F') AND
			bpr.BALLOT_REG_STATUS IN ('N', 'V') AND 
			br.REG_NO_DISPLAY != ISNULL(@BA_NO, '') AND
			br.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM #tmp_BR_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = @TotalBuyerCount) AND
			rec.RecCount = @TotalBuyerCount AND
			bp.BALLOT_POOL_ID = @TargetBallotPoolID
	) tmp;
	

	IF ((@MODULE_ID = 'BA'))
	BEGIN
		SET @RecCount = ISNULL(@tmpAMCount, 0) + ISNULL(@tmpBACount, 0); 
	END ELSE IF ((@MODULE_ID = 'FS'))
	BEGIN
		SET @RecCount = ISNULL(@tmpAMCount, 0) + ISNULL(@FS_SelectedUnitCount, 0); 
	END ELSE 
	BEGIN
 		SET @RecCount = ISNULL(@tmpAMCount, 0);
	END
	
	

	-- SELECT 'Step 7: Max Buyer Combination Check', @RecCount '@RecCount', @CurrentUnitCount '@CurrentUnitCount', @MaxCombBuyer '@MaxCombBuyer'
	IF ((@RecCount + @CurrentUnitCount) > @MaxCombBuyer) 
	BEGIN
		SET @OVER_MAX_COMB = 'Y';
	END



Return

GO
/****** Object:  StoredProcedure [dbo].[SP_Check_name]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[SP_Check_name]
(
-- Step 1: Prepare Environment
	@PROJECT_ID NVARCHAR(10),
	@AM_NO NVARCHAR(20) = NULL,	
	@BALLOT_POOL_ID INT = NULL,
	@BALLOT_POOL_REG_ID INT = NULL,
	@MODULE_ID NVARCHAR(2) = NULL,
	@CHI_NAME1 NVARCHAR(100) = NULL,
	@ENG_NAME1 NVARCHAR(100) = NULL,
	@CHI_NAME2 NVARCHAR(100) = NULL,
	@ENG_NAME2 NVARCHAR(100) = NULL,
	@CHI_NAME3 NVARCHAR(100) = NULL,
	@ENG_NAME3 NVARCHAR(100) = NULL,
	@CHI_NAME4 NVARCHAR(100) = NULL,
	@ENG_NAME4 NVARCHAR(100) = NULL,	
	@CHI_NAME5 NVARCHAR(100) = NULL,
	@ENG_NAME5 NVARCHAR(100) = NULL,
	@CHI_NAME6 NVARCHAR(100) = NULL,
	@ENG_NAME6 NVARCHAR(100) = NULL,	
	@MESSAGE_DISPLAY NVARCHAR(max) output		
)
  
As

	--Step 2.0: CHECKING WITH AM
	--Step 2.1: Prepare AM_Buyer_Information(CHI)
	--Step 2.2: Check AM_Buyer table if extry chi_name record
	--Step 2.3: Prepare AM_Buyer_Information(ENG)
	--Step 2.4: Check AM_Buyer table if extry eng_name record
	--Step 3.1: Prepare BALLOT_Information(CHI)
	--Step 3.2: Check BALLOT table if extry chi_name record
	--Step 3.3: Prepare BALLOT_Information(ENG)
	--Step 3.4: Check BALLOT table if extry eng_name record
    --Step 4.1: Prepare blacklist Information 
	--Step 4.2: Check blacklist table if extry record
	--Step 5.0: if extry record, so use @MESSAGE_DISPLAY parameter pop up all record
	--Step 6.0: if null vlaue,program handle parameter	
	Declare @am_message nvarchar(max);
	Declare @ba_message nvarchar(max);
	Declare @blacklist_message nvarchar(max);
		

	set @am_message = 'The Buyer name exist in PASP'
	set @ba_message = '\nThe Buyer name exist in Ballot'
	set @blacklist_message = '\nThe Buyer name exist in Blacklist'

	IF @BALLOT_POOL_REG_ID IS NULL
	BEGIN 
		If  @MODULE_ID IS NULL OR @MODULE_ID <> 'AM'
		BEGIN
			select 
				@ba_message = coalesce( @ba_message + '\n','')+CONCAT(BUYER_CHI_NAME,' ','(',REG_NO_DISPLAY,')')
			from 
				BALLOT_REG br
				inner join BALLOT_REG_BUYER brb on brb.BALLOT_REG_ID=br.BALLOT_REG_ID 
				inner join BALLOT_POOL_REG bpr on br.BALLOT_REG_ID = bpr.BALLOT_REG_ID
			where 
				(
					BUYER_CHI_NAME IS NOT NULL
					AND BUYER_CHI_NAME <> '' AND
					(
						@CHI_NAME1 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME2 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME3 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME4 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME5 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME6 Like '%' + BUYER_CHI_NAME + '%'
					)
				)
				AND PROJECT_ID = @PROJECT_ID
				AND bpr.BALLOT_POOL_ID = ISNULL(@BALLOT_POOL_ID, 0)
				AND bpr.BALLOT_REG_STATUS IN ('N', 'V');
		 
	
			select 
				@ba_message = coalesce( @ba_message + '\n','')+CONCAT(BUYER_ENG_NAME,' ','(',REG_NO_DISPLAY,')')
			from 
				BALLOT_REG br
				inner join BALLOT_REG_BUYER brb on brb.BALLOT_REG_ID=br.BALLOT_REG_ID 
				inner join BALLOT_POOL_REG bpr on br.BALLOT_REG_ID = bpr.BALLOT_REG_ID
			where 
				(
					BUYER_ENG_NAME IS NOT NULL
					AND BUYER_ENG_NAME <> '' AND
					(
						@ENG_NAME1 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME2 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME3 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME4 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME5 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME6 Like '%' + BUYER_ENG_NAME + '%'
					)
				)
				AND PROJECT_ID = @PROJECT_ID			
				AND bpr.BALLOT_POOL_ID = ISNULL(@BALLOT_POOL_ID, 0)
				AND bpr.BALLOT_REG_STATUS IN ('N', 'V');
		END
	END
	ELSE
	BEGIN
		If  @MODULE_ID IS NULL OR @MODULE_ID <> 'AM'
		BEGIN
			select 
				@ba_message = coalesce( @ba_message + '\n','')+CONCAT(BUYER_CHI_NAME,' ','(',REG_NO_DISPLAY,')')
			from 
				BALLOT_REG br
				inner join BALLOT_REG_BUYER brb on brb.BALLOT_REG_ID=br.BALLOT_REG_ID 
				inner join BALLOT_POOL_REG bpr on br.BALLOT_REG_ID = bpr.BALLOT_REG_ID
			where 
				(
					BUYER_CHI_NAME IS NOT NULL
					AND BUYER_CHI_NAME <> '' AND
					(
						@CHI_NAME1 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME2 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME3 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME4 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME5 Like '%' + BUYER_CHI_NAME + '%'
						OR @CHI_NAME6 Like '%' + BUYER_CHI_NAME + '%'
					)
				)
				AND PROJECT_ID = @PROJECT_ID
				AND bpr.BALLOT_POOL_REG_ID <> ISNULL(@BALLOT_POOL_REG_ID, 0)
				AND bpr.BALLOT_REG_STATUS IN ('N', 'V');
		 
	
			select 
				@ba_message = coalesce( @ba_message + '\n','')+CONCAT(BUYER_ENG_NAME,' ','(',REG_NO_DISPLAY,')')
			from 
				BALLOT_REG br
				inner join BALLOT_REG_BUYER brb on brb.BALLOT_REG_ID=br.BALLOT_REG_ID 
				inner join BALLOT_POOL_REG bpr on br.BALLOT_REG_ID = bpr.BALLOT_REG_ID
			where 
				(
					BUYER_ENG_NAME IS NOT NULL
					AND BUYER_ENG_NAME <> '' AND
					(
						@ENG_NAME1 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME2 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME3 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME4 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME5 Like '%' + BUYER_ENG_NAME + '%'
						OR @ENG_NAME6 Like '%' + BUYER_ENG_NAME + '%'
					)
				)
				AND PROJECT_ID = @PROJECT_ID			
				AND bpr.BALLOT_POOL_REG_ID <> ISNULL(@BALLOT_POOL_REG_ID, 0)
				AND bpr.BALLOT_REG_STATUS IN ('N', 'V');
		END
	END


	select 
		@blacklist_message = coalesce( @blacklist_message + '\n','')+CONCAT(BL_NAME,'')
    from 
		BLACK_LIST 
    where 
		(
			BL_NAME IS NOT NULL
			AND BL_NAME <> '' AND
			(
				@CHI_NAME1 Like '%' + BL_NAME + '%'
				OR @CHI_NAME2 Like '%' + BL_NAME + '%'
				OR @CHI_NAME3 Like '%' + BL_NAME + '%'
				OR @CHI_NAME4 Like '%' + BL_NAME + '%'
				OR @CHI_NAME5 Like '%' + BL_NAME + '%'
				OR @CHI_NAME6 Like '%' + BL_NAME + '%'
				OR @ENG_NAME1 Like '%' + BL_NAME + '%'
				OR @ENG_NAME2 Like '%' + BL_NAME + '%'
				OR @ENG_NAME3 Like '%' + BL_NAME + '%'
				OR @ENG_NAME4 Like '%' + BL_NAME + '%'
				OR @ENG_NAME5 Like '%' + BL_NAME + '%'
				OR @ENG_NAME6 Like '%' + BL_NAME + '%'
			)
		);

	select
		@am_message = coalesce( @am_message + '\n','')+CONCAT(CHI_NAME,' ','(',AB.AM_NO,')')
	from 
		AM_BUYER AB
		INNER JOIN AM_BASE AM ON AB.PROJECT_ID = AM.PROJECT_ID AND AB.AM_NO = AM.AM_NO
	where 
		(
			CHI_NAME IS NOT NULL
			AND CHI_NAME <> '' AND
			(
				@CHI_NAME1 Like '%' + CHI_NAME + '%'
				OR @CHI_NAME2 Like '%' + CHI_NAME + '%'
				OR @CHI_NAME3 Like '%' + CHI_NAME + '%'
				OR @CHI_NAME4 Like '%' + CHI_NAME + '%'
				OR @CHI_NAME5 Like '%' + CHI_NAME + '%'
				OR @CHI_NAME6 Like '%' + CHI_NAME + '%'
			)
		)
		AND AB.PROJECT_ID = @PROJECT_ID
		AND AM.AM_STATUS IN ('O', 'C')
		AND AB.AM_NO <> ISNULL(@AM_NO, '');

	select 
		@am_message = coalesce( @am_message + '\n','')+CONCAT(ENG_NAME,' ','(',AB.AM_NO,')')
	from 
		AM_BUYER AB
		INNER JOIN AM_BASE AM ON AB.PROJECT_ID = AM.PROJECT_ID AND AB.AM_NO = AM.AM_NO 
	where 
		(
			ENG_NAME IS NOT NULL
			AND ENG_NAME <> '' AND
			(
				@ENG_NAME1 Like '%' + ENG_NAME + '%'
				OR @ENG_NAME2 Like '%' + ENG_NAME + '%'
				OR @ENG_NAME3 Like '%' + ENG_NAME + '%'
				OR @ENG_NAME4 Like '%' + ENG_NAME + '%'
				OR @ENG_NAME5 Like '%' + ENG_NAME + '%'
				OR @ENG_NAME6 Like '%' + ENG_NAME + '%'
			)
		)			
		AND AB.PROJECT_ID = @PROJECT_ID
		AND AM.AM_STATUS IN ('O', 'C')
		AND AB.AM_NO <> ISNULL(@AM_NO, '');


	set @MESSAGE_DISPLAY = '';

	if(LEN(@am_message)>28)
	begin
	set @MESSAGE_DISPLAY=@MESSAGE_DISPLAY+@am_message
	end
	
	if(LEN(@ba_message)>32)
	begin
	set @MESSAGE_DISPLAY=@MESSAGE_DISPLAY+@ba_message
	end

	if(LEN(@blacklist_message)>35)
	begin
	set @MESSAGE_DISPLAY=@MESSAGE_DISPLAY+@blacklist_message
	end

Return

GO
/****** Object:  StoredProcedure [dbo].[SP_CheckDupCheque]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CheckDupCheque]
	@PROJECT_ID [nvarchar](10),
	@BALLOT_POOL_ID [nvarchar](10) = NULL,
	@POOL_REG_ID [nvarchar](10) = NULL,
	@CHEQUE_NO [nvarchar](4000),
	@BANK_ID [nvarchar](4000),
	@CHEQUE_TYPE [nvarchar](100),
	@RETURN_CHEQUE [nvarchar](4000) OUTPUT,
	@BA_NO [nvarchar](20) = NULL
WITH  EXECUTE AS CALLER
AS
SET @RETURN_CHEQUE = ''

	IF ((@BALLOT_POOL_ID = '') OR (@BALLOT_POOL_ID IS NULL))
	BEGIN
		SELECT @BALLOT_POOL_ID = BALLOT_POOL_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_REG_ID = @POOL_REG_ID
	END

	SELECT 
		CHQ_NO.RowValue CHEQUE_NO, 
		CHQ_BANK.RowValue BANK_CODE, 
		CHQ_CheqType.RowValue CHEQUE_TYPE
	INTO
		#TEMP
	FROM 
		(Select * from dbo.SF_SplitTable (@CHEQUE_NO)) CHQ_NO
		JOIN (Select * from dbo.SF_SplitTable (@BANK_ID)) CHQ_BANK ON CHQ_NO.RowIndex = CHQ_BANK.RowIndex
		JOIN (Select * from dbo.SF_SplitTable (@CHEQUE_TYPE)) CHQ_CheqType ON CHQ_NO.RowIndex = CHQ_CheqType.RowIndex

	IF @BA_NO IS NULL
	BEGIN
		SELECT 
			@RETURN_CHEQUE = @RETURN_CHEQUE + ', ' + BRP.CHEQUE_NO 
		FROM 
			BALLOT_REG_PAY BRP
			INNER JOIN #TEMP TMP ON BRP.CHEQUE_NO = TMP.CHEQUE_NO AND BRP.BANK_CODE = TMP.BANK_CODE AND BRP.CHEQUE_TYPE = TMP.CHEQUE_TYPE
			INNER JOIN BALLOT_POOL_REG BPR ON BRP.BALLOT_REG_ID = BPR.BALLOT_REG_ID
			INNER JOIN BALLOT_POOL BP ON BPR.BALLOT_POOL_ID = BP.BALLOT_POOL_ID
		WHERE
			BPR.BALLOT_POOL_ID = @BALLOT_POOL_ID
			AND BP.PROJECT_ID = @PROJECT_ID	 
			AND BRP.CHEQUE_STATUS <> 'W'
	END
	ELSE
	BEGIN
		SELECT 
			@RETURN_CHEQUE = @RETURN_CHEQUE + ', ' + BRP.CHEQUE_NO 
		FROM 
			BALLOT_REG_PAY BRP
			INNER JOIN #TEMP TMP ON BRP.CHEQUE_NO = TMP.CHEQUE_NO AND BRP.BANK_CODE = TMP.BANK_CODE AND BRP.CHEQUE_TYPE = TMP.CHEQUE_TYPE
			INNER JOIN BALLOT_POOL_REG BPR ON BRP.BALLOT_REG_ID = BPR.BALLOT_REG_ID
			INNER JOIN BALLOT_POOL BP ON BPR.BALLOT_POOL_ID = BP.BALLOT_POOL_ID
			INNER JOIN BALLOT_REG BR ON BPR.BALLOT_REG_ID = BR.BALLOT_REG_ID
		WHERE
			BPR.BALLOT_POOL_ID = @BALLOT_POOL_ID
			AND BP.PROJECT_ID = @PROJECT_ID	
			AND BR.REG_NO_DISPLAY <> @BA_NO
			AND BRP.CHEQUE_STATUS <> 'W'
	END			
		
	-- Prevent the cheque is used by any agreement trasnaction
	  SELECT 
		@RETURN_CHEQUE = ', ' +  P.TRANSACT_DESC 
	  FROM 
	  #TEMP TMP
	
		INNER JOIN [AM_PAYMENT_FU_TRANS] P ON P.TRANSACT_DESC = TMP.CHEQUE_NO AND P.BANK_CODE = TMP.BANK_CODE AND P.CHEQUE_TYPE = TMP.CHEQUE_TYPE
		INNER JOIN AM_BASE B on P.PROJECT_ID = B.PROJECT_ID AND P.AM_NO = B.AM_NO
	  WHERE
		B.AM_STATUS <> 'X' and B.AM_STATUS <> 'V' 
		AND P.PROJECT_ID = @PROJECT_ID  


	IF LEN(@RETURN_CHEQUE) > 1
	BEGIN
		SELECT @RETURN_CHEQUE = SUBSTRING(@RETURN_CHEQUE, 2, LEN(@RETURN_CHEQUE) - 1)	
		RETURN 
	END

RETURN 
GO
/****** Object:  StoredProcedure [dbo].[SP_EXT_Login]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EXT_Login]
	@ProjectID [nvarchar](10),
	@UserID [nvarchar](200),
	@Password [nvarchar](20)
WITH  EXECUTE AS CALLER
AS
BEGIN

	DECLARE
		@PRJ_NAME_CHI [nvarchar](100) = NULL,
		@PRJ_NAME_ENG [nvarchar](100) = NULL,
		@UserName [nvarchar](200) = NULL,
		@UID [nvarchar](10) = NULL,
		@tmpCount int;

	
	
    SELECT @tmpCount = COUNT(*)
	FROM User_Profile 
	WHERE
		Terminate Is Null And 
		--convert(date, Exp_Date) > convert(date, GETDATE()) And 
		[UID] = @UserID AND
		[PASSWORD] = HASHBYTES('MD5', @Password);


	IF @tmpCount > 0
	BEGIN
		SELECT 
			@PRJ_NAME_CHI = PRJ_NAME_CHI,
			@PRJ_NAME_ENG = PRJ_NAME_ENG
		FROM PROJECT_MASTER 
		WHERE PROJECT_ID = @ProjectID


		SELECT 
			@UID = [UID], 
			@UserName = RTRIM(LTRIM((ISNULL([FIRST_NAME], '')  + ' ' + ISNULL([LAST_NAME], ''))))
		FROM [USER_PROFILE]
		WHERE [UID] = @UserID;

	END
		
	SELECT @PRJ_NAME_CHI 'PRJ_NAME_CHI' , @PRJ_NAME_ENG 'PRJ_NAME_ENG', @UID 'UserID', @UserName 'UserName';
	

END





GO
/****** Object:  StoredProcedure [dbo].[SP_GENERATE_TRIGGER]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_GENERATE_TRIGGER]
  AS

BEGIN 
Declare @TABLE_NAME NVarChar(128)
Declare @EVENT Char(1)
Declare @TRIGGER_NAME NVarChar(128)
Declare @sql VarChar(8000)
Declare @ORIGINAL_VALUE VarChar(8000)
Declare @CHANGED_VALUE VarChar(8000)
Declare @ORIGINAL_VALUE2 VarChar(8000)
Declare @CHANGED_VALUE2 VarChar(8000)
	/*Declare @ORIGINAL_VALUE_Part2 VarChar(8000)
Declare @CHANGED_VALUE_Part2 VarChar(8000)
	Declare @ORIGINAL_VALUE_Part3 VarChar(8000)

	
	Declare @CHANGED_VALUE_Part3 VarChar(8000)
	Declare @ORIGINAL_VALUE2 VarChar(8000)
	Declare @ORIGINAL_VALUE2_Part2 VarChar(8000)
	Declare @ORIGINAL_VALUE2_Part3 VarChar(8000)
	Declare @CHANGED_VALUE2 VarChar(8000)
	Declare @CHANGED_VALUE2_Part2 VarChar(8000)
	Declare @CHANGED_VALUE2_Part3 VarChar(8000)*/
Declare @KEY_VALUE VarChar(8000)
Declare @KEY_VALUE2 VarChar(8000)
Declare @columnName VarChar(8000)
Declare @dataTypeName VarChar(8000)
Declare @data VarChar(8000)
Declare @data1 VarChar(8000)
Declare @data2 VarChar(8000)
Declare @data3 VarChar(8000)
Declare @data4 VarChar(8000)
Declare @data5 VarChar(8000)
Declare @data6 VarChar(8000)
Declare @data7 VarChar(8000)
Declare @data8 VarChar(8000)
Declare @data9 VarChar(8000)
Declare @data10 VarChar(8000)
Declare @data11 VarChar(8000)
Declare @data12 VarChar(8000)
Declare @data13 VarChar(8000)
Declare @data14 VarChar(8000)
Declare @data15 VarChar(8000)
Declare @data16 VarChar(8000)
Declare @data17 VarChar(8000)




Declare @data18 VarChar(8000)
Declare @data19 VarChar(8000)
Declare @data20 VarChar(8000)
Declare @data21 VarChar(8000)

Declare @data22 VarChar(8000)
Declare @data23 VarChar(8000)
Declare @data24 VarChar(8000)
Declare @data25 VarChar(8000)
Declare @data26 VarChar(8000)
Declare @data27 VarChar(8000)
Declare @data28 VarChar(8000)
Declare @data29 VarChar(8000)

Declare @ORIGINAL_VALUE_Part2 VarChar(8000)
Declare @CHANGED_VALUE_Part2 VarChar(8000)
Declare @ORIGINAL_VALUE_Part3 VarChar(8000)
Declare @CHANGED_VALUE_Part3 VarChar(8000)
Declare @ORIGINAL_VALUE_Part4 VarChar(8000)
Declare @CHANGED_VALUE_Part4 VarChar(8000)
Declare @ORIGINAL_VALUE_Part5 VarChar(8000)
Declare @CHANGED_VALUE_Part5 VarChar(8000)
Declare @ORIGINAL_VALUE_Part6 VarChar(8000)
Declare @CHANGED_VALUE_Part6 VarChar(8000)
Declare @ORIGINAL_VALUE_Part7 VarChar(8000)
Declare @CHANGED_VALUE_Part7 VarChar(8000)
Declare @ORIGINAL_VALUE_Part8 VarChar(8000)
Declare @CHANGED_VALUE_Part8 VarChar(8000)
Declare @ORIGINAL_VALUE_Part9 VarChar(8000)
Declare @CHANGED_VALUE_Part9 VarChar(8000)
Declare @ORIGINAL_VALUE_Part10 VarChar(8000)
Declare @CHANGED_VALUE_Part10 VarChar(8000)
Declare @ORIGINAL_VALUE2_Part2 VarChar(8000)
Declare @CHANGED_VALUE2_Part2 VarChar(8000)
Declare @ORIGINAL_VALUE2_Part3 VarChar(8000)
Declare @CHANGED_VALUE2_Part3 VarChar(8000)
Declare @ORIGINAL_VALUE2_Part4 VarChar(8000)
Declare @CHANGED_VALUE2_Part4 VarChar(8000)
Declare @ORIGINAL_VALUE2_Part5 VarChar(8000)
Declare @CHANGED_VALUE2_Part5 VarChar(8000)
Declare @ORIGINAL_VALUE2_Part6 VarChar(8000)
Declare @CHANGED_VALUE2_Part6 VarChar(8000)
Declare @ORIGINAL_VALUE2_Part7 VarChar(8000)
Declare @CHANGED_VALUE2_Part7 VarChar(8000)
Declare @ORIGINAL_VALUE2_Part8 VarChar(8000)
Declare @CHANGED_VALUE2_Part8 VarChar(8000)
Declare @ORIGINAL_VALUE2_Part9 VarChar(8000)
Declare @CHANGED_VALUE2_Part9 VarChar(8000)
Declare @ORIGINAL_VALUE2_Part10 VarChar(8000)
Declare @CHANGED_VALUE2_Part10 VarChar(8000)


Declare @counter INT
Declare @joinCondition VarChar(8000)

Declare TriggerTableCursor Cursor Local For
Select [TABLE_NAME], [EVENT], [TRIGGER_NAME]
From T_TRIGGER_TABLE 
WHERE GENERATE = 'Y'

Open TriggerTableCursor

Fetch Next From TriggerTableCursor
Into @TABLE_NAME, @EVENT, @TRIGGER_NAME

While @@Fetch_Status = 0
Begin
	Select @sql = N'If Object_ID(N''[' + @TRIGGER_NAME + '_On'
	Select @sql = @sql + Case @EVENT When 'I' Then 'Inserted' When 'U' Then 'Updated' When 'D' Then 'Deleted' End
	Select @sql = @sql + ']'') Is Not Null
Begin
	Drop Trigger ' + @TRIGGER_NAME + '_On'
	Select @sql = @sql + Case @EVENT When 'I' Then 'Inserted' When 'U' Then 'Updated' When 'D' Then 'Deleted' End
	Select @sql = @sql + '
End'

	EXEC (@sql)

	Select @ORIGINAL_VALUE = ''
--	Select @ORIGINAL_VALUE_Part2 = ''
	--Select @ORIGINAL_VALUE_Part3 = ''
	Select @CHANGED_VALUE = ''
--	Select @CHANGED_VALUE_Part2 = ''
	--Select @CHANGED_VALUE_Part3 = ''
	Select @KEY_VALUE = ''
	Select @counter = 0
	Select @data1 = ''
	Select @data2 = ''
	Select @data3 = ''
	Select @data4 = ''
	Select @data5 = ''
	Select @data6 = ''
	Select @data7 = ''
	Select @data8 = ''
	Select @data9 = ''
	Select @data10 = ''
	Select @data11 = ''
	Select @data12 = ''
	Select @data13 = ''
	Select @data14 = ''
	Select @data15 = ''
	Select @data16 = ''
	Select @data17 = ''


	Select @ORIGINAL_VALUE2 = ''
	Select @CHANGED_VALUE2 = ''
	Select @ORIGINAL_VALUE_Part2 = ''
	Select @CHANGED_VALUE_Part2 = ''
	Select @ORIGINAL_VALUE_Part3 = ''
	Select @CHANGED_VALUE_Part3 = ''
	Select @ORIGINAL_VALUE_Part4 = ''
	Select @CHANGED_VALUE_Part4 = ''
	Select @ORIGINAL_VALUE_Part5 = ''
	Select @CHANGED_VALUE_Part5 = ''
	Select @ORIGINAL_VALUE_Part6 = ''
	Select @CHANGED_VALUE_Part6 = ''
	Select @ORIGINAL_VALUE_Part7 = ''
	Select @CHANGED_VALUE_Part7 = ''
	Select @ORIGINAL_VALUE_Part8 = ''
	Select @CHANGED_VALUE_Part8 = ''
	Select @ORIGINAL_VALUE_Part9 = ''
	Select @CHANGED_VALUE_Part9 = ''
	Select @ORIGINAL_VALUE_Part10 = ''
	Select @CHANGED_VALUE_Part10 = ''
	Select @ORIGINAL_VALUE2_Part2 = ''
	Select @CHANGED_VALUE2_Part2 = ''
	Select @ORIGINAL_VALUE2_Part3 = ''
	Select @CHANGED_VALUE2_Part3 = ''
	Select @ORIGINAL_VALUE2_Part4 = ''
	Select @CHANGED_VALUE2_Part4 = ''
	Select @ORIGINAL_VALUE2_Part5 = ''
	Select @CHANGED_VALUE2_Part5 = ''
	Select @ORIGINAL_VALUE2_Part6 = ''
	Select @CHANGED_VALUE2_Part6 = ''
	Select @ORIGINAL_VALUE2_Part7 = ''
	Select @CHANGED_VALUE2_Part7 = ''
	Select @ORIGINAL_VALUE2_Part8 = ''
	Select @CHANGED_VALUE2_Part8 = ''
	Select @ORIGINAL_VALUE2_Part9 = ''
	Select @CHANGED_VALUE2_Part9 = ''
	Select @ORIGINAL_VALUE2_Part10 = ''
	Select @CHANGED_VALUE2_Part10 = ''
	Select @data18 = ''
	Select @data19 = ''
	Select @data20 = ''
	Select @data21 = ''
	Select @data22 = ''
	Select @data23 = ''
	Select @data24 = ''
	Select @data25 = ''
	Select @data26 = ''
	Select @data27 = ''
	Select @data28 = ''
	Select @data29 = ''

	Declare KeyColumnCursor Cursor Local For
	Select C.[Name]
	From syscolumns C
		Join sysobjects O On (C.ID = O.ID)
		Join sysindexkeys IK On (C.ID = IK.ID And C.ColID = IK.ColID)
		Join sysindexes I On (O.ID = I.ID And IK.IndID = I.INDID)
	Where I.Status & 2048 = 2048 And O.[Name] = @TABLE_NAME
	Order By C.ColOrder

	If @EVENT = 'I'
	Begin
		Declare ColumnCursor Cursor Local For
		Select C.[Name], T.[Name]
		From syscolumns C
			Join sysobjects O On (C.ID = O.ID)
			Left Outer Join systypes T On (C.XUserType = T.XUserType)
		Where O.[Name] = @TABLE_NAME
		Order By C.ColOrder

		Open KeyColumnCursor

		Fetch Next From KeyColumnCursor
		Into @columnName

		While @@Fetch_Status = 0
		Begin
			If @KEY_VALUE <> ''
			Begin
				Select @KEY_VALUE = @KEY_VALUE + ', '
			End

			Select @KEY_VALUE = @KEY_VALUE + @columnName + ' = '''''' + Convert(NVarChar(4000), ' + @columnName + ') + '''''''

			Fetch Next From KeyColumnCursor
			Into @columnName
		End

		Close KeyColumnCursor
		Open ColumnCursor

		Fetch Next From ColumnCursor
		Into @columnName, @dataTypeName

		While @@Fetch_Status = 0
		Begin
			If @counter <= 18
			Begin
				If @CHANGED_VALUE <> ''
				Begin
					Select @CHANGED_VALUE = @CHANGED_VALUE + ', '
				End
	
				Select @CHANGED_VALUE = @CHANGED_VALUE + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000),' + @columnName + Case When @dataTypeName = 'datetime' Then ',121' Else '' End + ') + '''''''' End + '''
			End

			If @counter  between 19 and 38
			Begin
				If @CHANGED_VALUE2_Part2 <> ''
				Begin
					Select @CHANGED_VALUE2_Part2 = @CHANGED_VALUE2_Part2 + ', '
				End
	
				Select @CHANGED_VALUE2_Part2 = @CHANGED_VALUE2_Part2 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000),' + @columnName + Case When @dataTypeName = 'datetime' Then ',121' Else '' End + ') + '''''''' End + '''
			End

			If @counter between 39 and 57
			Begin
				If @CHANGED_VALUE2_Part3 <> ''
				Begin
					Select @CHANGED_VALUE2_Part3 = @CHANGED_VALUE2_Part3 + ', '
				End
	
				Select @CHANGED_VALUE2_Part3 = @CHANGED_VALUE2_Part3 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000),' + @columnName + Case When @dataTypeName = 'datetime' Then ',121' Else '' End + ') + '''''''' End + '''
			End

			If @counter between 58 and 77
			Begin
				If @CHANGED_VALUE2_Part4 <> ''
				Begin
					Select @CHANGED_VALUE2_Part4 = @CHANGED_VALUE2_Part4 + ', '
				End
	
				Select @CHANGED_VALUE2_Part4 = @CHANGED_VALUE2_Part4 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000),' + @columnName + Case When @dataTypeName = 'datetime' Then ',121' Else '' End + ') + '''''''' End + '''
			End
			
			If @counter between 78 and 80
			Begin
				If @CHANGED_VALUE2_Part5 <> ''
				Begin
					Select @CHANGED_VALUE2_Part5 = @CHANGED_VALUE2_Part5 + ', '
				End
	
				Select @CHANGED_VALUE2_Part5 = @CHANGED_VALUE2_Part5 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000),' + @columnName + Case When @dataTypeName = 'datetime' Then ',121' Else '' End + ') + '''''''' End + '''
			End

			If @counter BETWEEN 81 AND 93
			Begin
				If @CHANGED_VALUE2_Part6 <> ''
				Begin
					Select @CHANGED_VALUE2_Part6 = @CHANGED_VALUE2_Part6 + ', '
				End
	
				Select @CHANGED_VALUE2_Part6 = @CHANGED_VALUE2_Part6 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000),' + @columnName + Case When @dataTypeName = 'datetime' Then ',121' Else '' End + ') + '''''''' End + '''
			End


			If @counter BETWEEN 84 AND 106
			Begin
				If @CHANGED_VALUE2_Part7 <> ''
				Begin
					Select @CHANGED_VALUE2_Part7 = @CHANGED_VALUE2_Part7 + ', '
				End
	
				Select @CHANGED_VALUE2_Part7 = @CHANGED_VALUE2_Part7 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000),' + @columnName + Case When @dataTypeName = 'datetime' Then ',121' Else '' End + ') + '''''''' End + '''
			End


			If @counter BETWEEN 107 AND 119
			Begin
				If @CHANGED_VALUE2_Part8 <> ''
				Begin
					Select @CHANGED_VALUE2_Part8 = @CHANGED_VALUE2_Part8 + ', '
				End
	
				Select @CHANGED_VALUE2_Part8 = @CHANGED_VALUE2_Part8 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000),' + @columnName + Case When @dataTypeName = 'datetime' Then ',121' Else '' End + ') + '''''''' End + '''
			End


			If @counter BETWEEN 120 AND 132
			Begin
				If @CHANGED_VALUE2_Part9 <> ''
				Begin
					Select @CHANGED_VALUE2_Part9 = @CHANGED_VALUE2_Part9 + ', '
				End
	
				Select @CHANGED_VALUE2_Part9 = @CHANGED_VALUE2_Part9 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000),' + @columnName + Case When @dataTypeName = 'datetime' Then ',121' Else '' End + ') + '''''''' End + '''
			End


			Set @counter = @counter + 1

			Fetch Next From ColumnCursor
			Into @columnName, @dataTypeName
		End

		Close ColumnCursor
		Deallocate ColumnCursor

		Select @data1 = 'Insert Into AUDIT_LOG (	TABLE_NAME, FUNCTION_ID, CR_TIME, CR_USER, MODE,ORIGINAL_VALUE, CHANGED_VALUE, PROJECT_ID, KEY_VALUE)Select Left(''' + @TABLE_NAME + ''', 50), '
		Select @data2 = '@FUNCTION_ID, @CR_TIME, @CR_USER, ''I'',	Left('''', 4000), Left(''' + @CHANGED_VALUE
		Select @data3 = @CHANGED_VALUE2_Part2
		Select @data4 = @CHANGED_VALUE2_Part3
		Select @data5 = @CHANGED_VALUE2_Part4
		Select @data6 = @CHANGED_VALUE2_Part5
		Select @data4 = @CHANGED_VALUE2_Part6
		Select @data5 = @CHANGED_VALUE2_Part7
		Select @data6 = @CHANGED_VALUE2_Part8
		Select @data7 = @CHANGED_VALUE2_Part9 + ''', 4000), @PROJECT_ID, Left(''' + @KEY_VALUE + ''', 4000) From Inserted'
		
		
	End
	Else If @EVENT = 'U'
	Begin
		Select @counter = 0

		Select @ORIGINAL_VALUE2 = ''
		Select @CHANGED_VALUE2 = ''
		Select @KEY_VALUE2 = ''
		Select @joinCondition = ''

		Declare ColumnCursor Cursor Local For
		Select C.[Name], T.[Name]
		From syscolumns C
			Join sysobjects O On (C.ID = O.ID)
			Left Outer Join systypes T On (C.XUserType = T.XUserType)
		Where O.[Name] = @TABLE_NAME
		Order By C.ColOrder

		Open KeyColumnCursor

		Fetch Next From KeyColumnCursor
		Into @columnName

		While @@Fetch_Status = 0
		Begin
			If @joinCondition <> ''
			Begin
				Select @joinCondition = @joinCondition + ' And '
			End

			Select @joinCondition = @joinCondition + 'i.' + @columnName + ' = d.' + @columnName

			If @KEY_VALUE <> ''
			Begin
				Select @KEY_VALUE = @KEY_VALUE + ', '
			End

			Select @KEY_VALUE = @KEY_VALUE + @columnName + ' = '''''' + Convert(NVarChar(4000), ' + @columnName + ') + '''''''

			If @KEY_VALUE2 <> ''
			Begin
				Select @KEY_VALUE2 = @KEY_VALUE2 + ', '
			End

			Select @KEY_VALUE2 = @KEY_VALUE2 + @columnName + ' = '''''' + Convert(NVarChar(4000), i.' + @columnName + ') + '''''''

			Fetch Next From KeyColumnCursor
			Into @columnName
		End

		Close KeyColumnCursor
		Open ColumnCursor

		Fetch Next From ColumnCursor
		Into @columnName, @dataTypeName

		While @@Fetch_Status = 0
		Begin
			If @counter <= 17
			Begin
				If @ORIGINAL_VALUE <> ''
				Begin
					Select @ORIGINAL_VALUE = @ORIGINAL_VALUE + ', '
				End
	
				Select @ORIGINAL_VALUE = @ORIGINAL_VALUE + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
	
				If @CHANGED_VALUE <> ''
				Begin
					Select @CHANGED_VALUE = @CHANGED_VALUE + ', '
				End
	
				Select @CHANGED_VALUE = @CHANGED_VALUE + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
	
				If @ORIGINAL_VALUE2 <> ''
				Begin
					Select @ORIGINAL_VALUE2 = @ORIGINAL_VALUE2 + ' + '
				End
	
				If @CHANGED_VALUE2 <> ''
				Begin
					Select @CHANGED_VALUE2 = @CHANGED_VALUE2 + ' + '
				End

				Select @ORIGINAL_VALUE2 = @ORIGINAL_VALUE2 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When d.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), d.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
				Select @CHANGED_VALUE2 = @CHANGED_VALUE2 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When i.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), i.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
			End --End counter if part1

			If  @counter between 18 and 35
			Begin
				Select @ORIGINAL_VALUE_Part2 = @ORIGINAL_VALUE_Part2 + ', '
				Select @ORIGINAL_VALUE_Part2 = @ORIGINAL_VALUE_Part2 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @CHANGED_VALUE_Part2 = @CHANGED_VALUE_Part2 + ', '
				Select @CHANGED_VALUE_Part2 = @CHANGED_VALUE_Part2 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @ORIGINAL_VALUE2_Part2 = @ORIGINAL_VALUE2_Part2 + ' + '
				Select @CHANGED_VALUE2_Part2 = @CHANGED_VALUE2_Part2 + ' + '
				Select @ORIGINAL_VALUE2_Part2 = @ORIGINAL_VALUE2_Part2 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When d.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), d.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
				Select @CHANGED_VALUE2_Part2 = @CHANGED_VALUE2_Part2 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When i.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), i.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
			End --End counter if part2


			If  @counter between 36 and 55
			Begin
				Select @ORIGINAL_VALUE_Part3 = @ORIGINAL_VALUE_Part3 + ', '
				Select @ORIGINAL_VALUE_Part3 = @ORIGINAL_VALUE_Part3 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @CHANGED_VALUE_Part3 = @CHANGED_VALUE_Part3 + ', '
				Select @CHANGED_VALUE_Part3 = @CHANGED_VALUE_Part3 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @ORIGINAL_VALUE2_Part3 = @ORIGINAL_VALUE2_Part3 + ' + '
				Select @CHANGED_VALUE2_Part3 = @CHANGED_VALUE2_Part3 + ' + '
				Select @ORIGINAL_VALUE2_Part3 = @ORIGINAL_VALUE2_Part3 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When d.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), d.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
				Select @CHANGED_VALUE2_Part3 = @CHANGED_VALUE2_Part3 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When i.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), i.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
			End --End counter if part3

			If  @counter between 56 and 70
			Begin
				Select @ORIGINAL_VALUE_Part4 = @ORIGINAL_VALUE_Part4 + ', '
				Select @ORIGINAL_VALUE_Part4 = @ORIGINAL_VALUE_Part4 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @CHANGED_VALUE_Part4 = @CHANGED_VALUE_Part4 + ', '
				Select @CHANGED_VALUE_Part4 = @CHANGED_VALUE_Part4 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @ORIGINAL_VALUE2_Part4 = @ORIGINAL_VALUE2_Part4 + ' + '
				Select @CHANGED_VALUE2_Part4 = @CHANGED_VALUE2_Part4 + ' + '
				Select @ORIGINAL_VALUE2_Part4 = @ORIGINAL_VALUE2_Part4 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When d.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), d.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
				Select @CHANGED_VALUE2_Part4 = @CHANGED_VALUE2_Part4 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When i.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), i.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
			End --End counter if part4

			If  @counter between 71 and 85
			Begin
				Select @ORIGINAL_VALUE_Part5 = @ORIGINAL_VALUE_Part5 + ', '
				Select @ORIGINAL_VALUE_Part5 = @ORIGINAL_VALUE_Part5 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @CHANGED_VALUE_Part5 = @CHANGED_VALUE_Part5 + ', '
				Select @CHANGED_VALUE_Part5 = @CHANGED_VALUE_Part5 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @ORIGINAL_VALUE2_Part5 = @ORIGINAL_VALUE2_Part5 + ' + '
				Select @CHANGED_VALUE2_Part5 = @CHANGED_VALUE2_Part5 + ' + '
				Select @ORIGINAL_VALUE2_Part5 = @ORIGINAL_VALUE2_Part5 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When d.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), d.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
				Select @CHANGED_VALUE2_Part5 = @CHANGED_VALUE2_Part5 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When i.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), i.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
			End --End counter if part5

			If  @counter BETWEEN 86 AND 98
			Begin
				Select @ORIGINAL_VALUE_Part6 = @ORIGINAL_VALUE_Part6 + ', '
				Select @ORIGINAL_VALUE_Part6 = @ORIGINAL_VALUE_Part6 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @CHANGED_VALUE_Part6 = @CHANGED_VALUE_Part6 + ', '
				Select @CHANGED_VALUE_Part6 = @CHANGED_VALUE_Part6 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @ORIGINAL_VALUE2_Part6 = @ORIGINAL_VALUE2_Part6 + ' + '
				Select @CHANGED_VALUE2_Part6 = @CHANGED_VALUE2_Part6 + ' + '
				Select @ORIGINAL_VALUE2_Part6 = @ORIGINAL_VALUE2_Part6 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When d.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), d.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
				Select @CHANGED_VALUE2_Part6 = @CHANGED_VALUE2_Part6 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When i.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), i.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
			End --End counter if Part6

			If  @counter BETWEEN 99 AND 111
			Begin
				Select @ORIGINAL_VALUE_Part7 = @ORIGINAL_VALUE_Part7 + ', '
				Select @ORIGINAL_VALUE_Part7 = @ORIGINAL_VALUE_Part7 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @CHANGED_VALUE_Part7 = @CHANGED_VALUE_Part7 + ', '
				Select @CHANGED_VALUE_Part7 = @CHANGED_VALUE_Part7 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @ORIGINAL_VALUE2_Part7 = @ORIGINAL_VALUE2_Part7 + ' + '
				Select @CHANGED_VALUE2_Part7 = @CHANGED_VALUE2_Part7 + ' + '
				Select @ORIGINAL_VALUE2_Part7 = @ORIGINAL_VALUE2_Part7 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When d.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), d.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
				Select @CHANGED_VALUE2_Part7 = @CHANGED_VALUE2_Part7 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When i.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), i.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
			End --End counter if Part6

			If  @counter BETWEEN 112 AND 124
			Begin
				Select @ORIGINAL_VALUE_Part8 = @ORIGINAL_VALUE_Part8 + ', '
				Select @ORIGINAL_VALUE_Part8 = @ORIGINAL_VALUE_Part8 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @CHANGED_VALUE_Part8 = @CHANGED_VALUE_Part8 + ', '
				Select @CHANGED_VALUE_Part8 = @CHANGED_VALUE_Part8 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @ORIGINAL_VALUE2_Part8 = @ORIGINAL_VALUE2_Part8 + ' + '
				Select @CHANGED_VALUE2_Part8 = @CHANGED_VALUE2_Part8 + ' + '
				Select @ORIGINAL_VALUE2_Part8 = @ORIGINAL_VALUE2_Part8 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When d.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), d.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
				Select @CHANGED_VALUE2_Part8 = @CHANGED_VALUE2_Part8 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When i.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), i.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
			End --End counter if Part6

			If  @counter BETWEEN 125 AND 137
			Begin
				Select @ORIGINAL_VALUE_Part9 = @ORIGINAL_VALUE_Part9 + ', '
				Select @ORIGINAL_VALUE_Part9 = @ORIGINAL_VALUE_Part9 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @CHANGED_VALUE_Part9 = @CHANGED_VALUE_Part9 + ', '
				Select @CHANGED_VALUE_Part9 = @CHANGED_VALUE_Part9 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
				Select @ORIGINAL_VALUE2_Part9 = @ORIGINAL_VALUE2_Part9 + ' + '
				Select @CHANGED_VALUE2_Part9 = @CHANGED_VALUE2_Part9 + ' + '
				Select @ORIGINAL_VALUE2_Part9 = @ORIGINAL_VALUE2_Part9 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When d.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), d.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
				Select @CHANGED_VALUE2_Part9 = @CHANGED_VALUE2_Part9 + ' Case When ((i.' + @columnName + ' Is Null And d.' + @columnName + ' Is Not Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Null) Or (i.' + @columnName + ' Is Not Null And d.' + @columnName + ' Is Not Null And i.' + @columnName + ' <> d.' + @columnName + ')) Then ''' + @columnName + ' = '' + Case When i.' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), i.' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '', '' Else '''' End'
			End --End counter if Part6

			Set @counter = @counter + 1
			Fetch Next From ColumnCursor
			Into @columnName, @dataTypeName
		End

		Close ColumnCursor
		Deallocate ColumnCursor

	If @joinCondition <> ''
		Begin
			Select @data1 = '
				Insert Into AUDIT_LOG (
					TABLE_NAME, FUNCTION_ID, CR_TIME, CR_USER, MODE,
					ORIGINAL_VALUE, CHANGED_VALUE, PROJECT_ID, KEY_VALUE
				)
				Select Left(''' + @TABLE_NAME + ''', 50), @FUNCTION_ID, @CR_TIME, @CR_USER, ''U'',
					Temp.OriginalValue, Temp.ChangedValue, @PROJECT_ID, Temp.KeyValue '
			Select @data2 = 'From (Select dbo.SF_AUDIT_FormatColumn(' + @ORIGINAL_VALUE2 
			Select @data3 = @ORIGINAL_VALUE2_Part2 
			Select @data4 = @ORIGINAL_VALUE2_Part3 
			Select @data5 = @ORIGINAL_VALUE2_Part4 
			Select @data6 = @ORIGINAL_VALUE2_Part5			
			Select @data4 = @ORIGINAL_VALUE2_Part6 
			Select @data5 = @ORIGINAL_VALUE2_Part7 
			Select @data6 = @ORIGINAL_VALUE2_Part8			
			Select @data7 = @ORIGINAL_VALUE2_Part9 + ') OriginalValue, '
			Select @data8 = 'dbo.SF_AUDIT_FormatColumn (' + @CHANGED_VALUE2 
			Select @data9 = @CHANGED_VALUE2_Part2  
			Select @data10 = @CHANGED_VALUE2_Part3
			Select @data11 = @CHANGED_VALUE2_Part4
			Select @data12 = @CHANGED_VALUE2_Part5
			Select @data10 = @CHANGED_VALUE2_Part6
			Select @data11 = @CHANGED_VALUE2_Part7
			Select @data12 = @CHANGED_VALUE2_Part8
			Select @data13 = @CHANGED_VALUE2_Part9 + ')  ChangedValue, Left(''' + @KEY_VALUE2 + ''', 4000) KeyValue
					From Inserted i, Deleted d
					Where ' + @joinCondition + '
				) Temp 
				Where Temp.OriginalValue <> '''' And Temp.ChangedValue <> '''''
		End

		Select @data14 = 'Insert Into AUDIT_LOG (
				TABLE_NAME, FUNCTION_ID, CR_TIME, CR_USER, MODE,
				ORIGINAL_VALUE, CHANGED_VALUE, PROJECT_ID, KEY_VALUE
			)'
		Select @data15 =	'Select Left(''' + @TABLE_NAME + ''', 50), @FUNCTION_ID, @CR_TIME, @CR_USER, ''D'',
				Left(''' + @ORIGINAL_VALUE 
		Select @data16 = @ORIGINAL_VALUE_Part2 
		Select @data17 = @ORIGINAL_VALUE_Part3
		Select @data18 = @ORIGINAL_VALUE_Part4
		Select @data19 = @ORIGINAL_VALUE_Part5
		Select @data20 = @ORIGINAL_VALUE_Part6 + ''', 4000), Left('''', 4000), @PROJECT_ID, Left(''' + @KEY_VALUE + ''', 4000)
			From Deleted'

		If @joinCondition <> ''
		Begin
			Select @data21 = ' d
				Where Not Exists (
					Select *
					From Inserted i
					Where ' + @joinCondition + '
				)'
		End

		Select @data22  = '
				Insert Into AUDIT_LOG (
					TABLE_NAME, FUNCTION_ID, CR_TIME, CR_USER, MODE,
					ORIGINAL_VALUE, CHANGED_VALUE, PROJECT_ID, KEY_VALUE
				)
				Select Left(''' + @TABLE_NAME + ''', 50), @FUNCTION_ID, @CR_TIME, @CR_USER, ''I'', '
		Select @data23 = 'Left('''', 4000), Left(''' + @CHANGED_VALUE 
		Select @data24 = @CHANGED_VALUE_Part2 
		Select @data25 = @CHANGED_VALUE_Part3 
		Select @data26 = @CHANGED_VALUE_Part4 
		Select @data27 = @CHANGED_VALUE_Part5 
		Select @data28 = @CHANGED_VALUE_Part6 + ''', 4000), @PROJECT_ID, Left(''' + @KEY_VALUE + ''', 4000)
				From Inserted'

		If @joinCondition <> ''
		Begin
			Select @data29 =  ' i
				Where Not Exists (
					Select *
					From Deleted d
					Where ' + @joinCondition + ')'
		End


	End
	Else If @EVENT = 'D'
	Begin
		Declare ColumnCursor Cursor Local For
		Select C.[Name], T.[Name]
		From syscolumns C
			Join sysobjects O On (C.ID = O.ID)
			Left Outer Join systypes T On (C.XUserType = T.XUserType)
		Where O.[Name] = @TABLE_NAME
		Order By C.ColOrder

		Open KeyColumnCursor

		Fetch Next From KeyColumnCursor
		Into @columnName

		While @@Fetch_Status = 0
		Begin
			If @KEY_VALUE <> ''
			Begin
				Select @KEY_VALUE = @KEY_VALUE + ', '
			End

			Select @KEY_VALUE = @KEY_VALUE + @columnName + ' = '''''' + Convert(NVarChar(4000), ' + @columnName + ') + '''''''

			Fetch Next From KeyColumnCursor
			Into @columnName
		End

		Close KeyColumnCursor
		Open ColumnCursor

		Fetch Next From ColumnCursor
		Into @columnName, @dataTypeName

		While @@Fetch_Status = 0
		Begin

			If @counter <= 17
			Begin
				If @ORIGINAL_VALUE <> ''
				Begin
					Select @ORIGINAL_VALUE = @ORIGINAL_VALUE + ', '
				End
	
				Select @ORIGINAL_VALUE = @ORIGINAL_VALUE + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
			End


			If @counter between 18 and 35
			Begin
				If @ORIGINAL_VALUE2_Part2 <> ''
				Begin
					Select @ORIGINAL_VALUE2_Part2 = @ORIGINAL_VALUE2_Part2 + ', '
				End
	
				Select @ORIGINAL_VALUE2_Part2 = @ORIGINAL_VALUE2_Part2 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
			End

			If @counter between 36 and 57
			Begin
				If @ORIGINAL_VALUE2_Part3 <> ''
				Begin
					Select @ORIGINAL_VALUE2_Part3 = @ORIGINAL_VALUE2_Part3 + ', '
				End
	
				Select @ORIGINAL_VALUE2_Part3 = @ORIGINAL_VALUE2_Part3 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
			End
			
			If @counter between 58 and 70
			Begin
				If @ORIGINAL_VALUE2_Part4 <> ''
				Begin
					Select @ORIGINAL_VALUE2_Part4 = @ORIGINAL_VALUE2_Part4 + ', '
				End
	
				Select @ORIGINAL_VALUE2_Part4 = @ORIGINAL_VALUE2_Part4 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
			End
			

			If @counter between 71 and 80
			Begin
				If @ORIGINAL_VALUE2_Part5 <> ''
				Begin
					Select @ORIGINAL_VALUE2_Part5 = @ORIGINAL_VALUE2_Part5 + ', '
				End
	
				Select @ORIGINAL_VALUE2_Part5 = @ORIGINAL_VALUE2_Part5 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
			End

			If @counter >81
			Begin
				If @ORIGINAL_VALUE2_Part6 <> ''
				Begin
					Select @ORIGINAL_VALUE2_Part6 = @ORIGINAL_VALUE2_Part6 + ', '
				End
	
				Select @ORIGINAL_VALUE2_Part6 = @ORIGINAL_VALUE2_Part6 + @columnName + ' = '' + Case When ' + @columnName + ' Is Null Then ''Null'' Else '''''''' + Convert(NVarChar(4000), ' + @columnName + Case When @dataTypeName = 'datetime' Then ', 121' Else '' End + ') + '''''''' End + '''
			End
			
			Set @counter = @counter + 1

			Fetch Next From ColumnCursor
			Into @columnName, @dataTypeName



		End

		Close ColumnCursor
		Deallocate ColumnCursor

		Select @data1 = 'Insert Into AUDIT_LOG (	TABLE_NAME, FUNCTION_ID, CR_TIME, CR_USER, MODE,ORIGINAL_VALUE, CHANGED_VALUE, PROJECT_ID, KEY_VALUE )
				Select Left(''' + @TABLE_NAME + ''', 50), @FUNCTION_ID, @CR_TIME, @CR_USER, ''D'','
		Select @data2 = 'Left(''' + @ORIGINAL_VALUE
		Select @data3 = @ORIGINAL_VALUE2_Part2
		Select @data4 = @ORIGINAL_VALUE2_Part3
		Select @data5 = @ORIGINAL_VALUE2_Part4
		Select @data6 = @ORIGINAL_VALUE2_Part5
		Select @data7 = @ORIGINAL_VALUE2_Part6 + ''', 4000), Left('''', 4000), @PROJECT_ID, Left(''' + @KEY_VALUE + ''', 4000)
				From Deleted'
	End

	Deallocate KeyColumnCursor

	Select @sql = N'Create Trigger [' + @TRIGGER_NAME + '_On' + Case @EVENT When 'I' Then 'Inserted' When 'U' Then 'Updated' When 'D' Then 'Deleted' End + ']
On [' + @TABLE_NAME + ']
With Encryption
After ' + Case @EVENT When 'I' Then 'Insert' When 'U' Then 'Update' When 'D' Then 'Delete' End + '
As
Begin
	Declare @FUNCTION_ID VarChar(20), @CR_TIME DateTime, @CR_USER VarChar(10), @PROJECT_ID NVarChar(50)
	If Object_ID(N''[tempdb]..[#ConnectionProperties]'') Is Not Null
	Begin
		Select @FUNCTION_ID = Convert(VarChar(10), Left([Value], 10))
		From #ConnectionProperties
		Where [Name] = ''FUNCTION_ID''
	End
	Else
	Begin
		Select @FUNCTION_ID = ''''
	End
	If Object_ID(N''[tempdb]..[#ConnectionProperties]'') Is Not Null
	Begin
		Select @CR_USER = Convert(VarChar(16), Left([Value], 16))
		From #ConnectionProperties
		Where [Name] = ''USER_ID''
	End
	Else
	Begin
		Select @CR_USER = ''''
	End
	Select @CR_TIME = GetDate()
	If Object_ID(N''[tempdb]..[#ConnectionProperties]'') Is Not Null
	Begin
		Select @PROJECT_ID = Convert(NVarChar(50), Left([Value], 50))
		From #ConnectionProperties
		Where [Name] = ''PROJECT_ID''
	End
	Else
	Begin
		Select @PROJECT_ID = ''''
	End
' 
	EXEC (@sql + @data1 + @data2 + @data3 + @data4 + @data5 + @data6 + @data7 + @data8 + @data9 + @data10 + @data11 + @data12 + @data13 + @data14 + @data15 + @data16 + @data17 + @data18 + @data19 + @data20 + @data21 + @data22 + @data23 + @data24 + @data25 + @data26 + @data27 + @data28 + @data29 +'  End')

print @sql + @data1 + @data2 + @data3 + @data4 + @data5 + @data6 + @data7 + @data8 + @data9 + @data10 + @data11 + @data12 + @data13 + @data14 + @data15 + @data16 + @data17 + @data18 + @data19 + @data20 + @data21 + @data22 + @data23 + @data24 + @data25 + @data26 + @data27 + @data28 + @data29 +'  End'

	Fetch Next From TriggerTableCursor
	Into @TABLE_NAME, @EVENT, @TRIGGER_NAME
End

Close TriggerTableCursor
Deallocate TriggerTableCursor

END;
    
GO
/****** Object:  StoredProcedure [dbo].[SP_PA001_SAVE_BoundAndBallot]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PA001_SAVE_BoundAndBallot]
	@PROJECT_ID [nvarchar](6),
	@ROUND_TYPE [nvarchar](1),
	@ROUND_BASE [int],
	@IS_BALLOT_VERIFY [nvarchar](1)
WITH  EXECUTE AS CALLER
AS
BEGIN TRAN
update PROJECT_MASTER  set 
ROUND_TYPE=@ROUND_TYPE,
ROUND_BASE=@ROUND_BASE,
IS_BALLOT_VERIFY=@IS_BALLOT_VERIFY 
where  PROJECT_ID=@PROJECT_ID 


	 IF @@ERROR <>  0
BEGIN
	ROLLBACK TRAN
END
COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[SP_PA012_SELECT_UNIT_Flat]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PA012_SELECT_UNIT_Flat]
	@PROJECT_ID [nvarchar](10),
	@PACKAGE_ID [nvarchar](10)
WITH  EXECUTE AS CALLER
AS
BEGIN 

	SELECT distinct 
		FM.PROJECT_ID,PA.PACKAGE_ID,
		(SELECT TOP 1 BLOCK_DESC FROM BLOCK WHERE PROJECT_ID=FM.PROJECT_ID AND BLOCK.BLOCK_ID=FM.FM_BLK)AS BLOCK_DESC ,
		FM.FM_FLOOR,
		FM.FM_FLAT
	FROM 
		FLAT_MASTER  AS FM 
		LEFT JOIN FLAT_PACKAGE AS FP ON FP.PROJECT_ID =FM.PROJECT_ID AND FM.FM_CODE=FP.FM_CODE
		LEFT JOIN  PACKAGES AS PA ON PA.PACKAGE_ID=FP.PACKAGE_ID AND PA.PROJECT_ID= FP.PROJECT_ID 
	WHERE FM_FLAT IS NOT NULL AND FM_FLOOR IS NOT NULL  AND PA.PROJECT_ID=@PROJECT_ID AND PA.PACKAGE_ID=@PACKAGE_ID  


END
GO
/****** Object:  StoredProcedure [dbo].[SP_PA02_UpdatePackage]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PA02_UpdatePackage]
	@ProjectID [nvarchar](10),
	@FM_CODE [nvarchar](200),
	@PACKAGE_ID [nvarchar](10),
	@CR_UID [nvarchar](10),
	@CR_FID [nchar](10)
WITH  EXECUTE AS CALLER
AS
BEGIN

	-- Step 1: Prepare Environment	
	-- Step 2: Add Packages or Check Package
	-- Step 3: Checking Package ID
	-- Step 4: Update Temp table
	-- Step 5: Drop Temp table #TMP_PA02_UpdateFlatPackage

DECLARE @tmp NVARCHAR
DECLARE @Error_msg as nvarchar(100) 
DECLARE @OUT_ErrorCode int

CREATE TABLE #TMP_PA02_UpdatePackage(
	[PROJECT_ID] [nvarchar](10) NULL,
	[FM_CODE] [nvarchar](200) NULL,
	[PACKAGE_ID] [nvarchar](10) NULL,
	[CR_UID] [nvarchar](10) NULL,
	[CR_FID] [nchar](10) NULL,
	[CR_DT] [datetime] NULL,
	[UP_UID] [nvarchar](10) NULL,
	[UP_FID] [nchar](10) NULL,
	[UP_DT] [datetime] NULL,
);

-- Step 2: Add Packages or Check Package

	INSERT INTO #TMP_PA02_UpdatePackage
		(
			[FM_CODE],[PROJECT_ID],[PACKAGE_ID],
			[CR_UID],[CR_FID],[CR_DT],
			[UP_UID],[UP_FID],[UP_DT]
		)
	Values
		(
			@FM_CODE,@ProjectID,@PACKAGE_ID,
			@CR_UID, @CR_FID, GETDATE(), @CR_UID, @CR_FID, GETDATE()
		)



-- Step 3: Checking Package ID


select  @tmp  = (p.[PACKAGE_ID] )  from #TMP_PA02_UpdatePackage t 
LEFT JOIN PACKAGES p on t.PROJECT_ID = p.PROJECT_ID AND t.[PACKAGE_ID] = p.[PACKAGE_ID] 
WHERE p.[PACKAGE_ID] IS Not NULL

If (@tmp is null)
begin
	set @OUT_ErrorCode='1'
	set @Error_msg ='no found,The Package id ' +@PACKAGE_ID+' not exist in Package'
	RAISERROR ( @Error_msg ,11,200)
End

--Step 4: Update Temp table
If (@OUT_ErrorCode is null)
 	INSERT INTO [dbo].[FLAT_PACKAGE]
		(
			[FM_CODE],[PROJECT_ID],[PACKAGE_ID],
			[CR_UID],[CR_FID],[CR_DT],
			[UP_UID],[UP_FID],[UP_DT]
		)
		SELECT 
			[FM_CODE],[PROJECT_ID],[PACKAGE_ID],
			@CR_UID, @CR_FID, GETDATE(), @CR_UID, @CR_FID, GETDATE()
		FROM #TMP_PA02_UpdatePackage
End
-- Step 5: Drop Temp table #TMP_PA02_UpdateFlatPackage
drop table #TMP_PA02_UpdatePackage
GO
/****** Object:  StoredProcedure [dbo].[SP_PA027_UpdateFlatPackage]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PA027_UpdateFlatPackage]
	@PROJECT_ID [nvarchar](10),
	@CSVFile [nvarchar](max),
	@CR_UID [nvarchar](10),
	@CR_FID [nchar](10),
	@OUT_ErrorType [nvarchar](1) OUTPUT,
	@OUT_ErrorRow [nvarchar](4000) OUTPUT
WITH  EXECUTE AS CALLER
AS
BEGIN

	-- Step 1: Prepare Environment
	-- Step 2: Read CSV into Row
	-- Step 3: Read CSV into Field
	-- Step 4: Tidy up CSV value
	-- Step 5: Checking
	-- Step 6: Clear DB Record and Insert

	
	-- Step 1: Prepare Environment
	DECLARE @ErrorMsg NVARCHAR(MAX);

	CREATE TABLE #TMP_CSV(
		[CSV_ID] [int] ,
		[CSV_ROW] [nvarchar](MAX) NOT NULL
	);


	CREATE TABLE #TMP_CSV_COLUMN(
		CSV_ID INT NULL,
		[PACKAGE_ID] [nvarchar](MAX) NULL,
		[PROJECT_ID] [nvarchar](MAX) NULL,
		[Package_Desc][nvarchar](MAX) NULL,
		[FM_CODE] [nvarchar](MAX) NULL,
		[DEV_CODE] [nvarchar](MAX) NULL,
		[FM_BLK] [nvarchar](MAX) NULL,
		[FM_FLOOR] [nvarchar](MAX) NULL,	
		[FM_FLAT] [nvarchar](MAX) NULL,
		[FM_HSE_NO] [nvarchar](MAX) NULL,
		[FM_STR_NO] [nvarchar](MAX) NULL,
		[STR_CODE] [nvarchar](MAX) NULL
	)
	

	-- Step 2: Read CSV into Row
	INSERT INTO #TMP_CSV (CSV_ID, CSV_ROW)
	SELECT ID, CSVRow
	FROM [dbo].[SF_CSV2ROW](@CSVFile, CHAR(13) + CHAR(10));


	-- Step 3: Read CSV into Field
	INSERT INTO #TMP_CSV_COLUMN(
		[CSV_ID], [PACKAGE_ID], [Package_Desc],[PROJECT_ID], 
		[DEV_CODE],[FM_BLK], [FM_FLOOR], [FM_FLAT], [FM_HSE_NO], [FM_STR_NO], [STR_CODE]
	)
	SELECT 
		[CSV_ID], [PACKAGE_ID], [Package_Desc],[PROJECT_ID], 
		[DEV_CODE], [FM_BLK], [FM_FLOOR], [FM_FLAT], [FM_HSE_NO], [FM_STR_NO], [STR_CODE]
	FROM #TMP_CSV
		cross apply ( select str = CSV_ROW + ',,,,,,,,,,' ) f1
		cross apply ( select Np1 =  dbo.SF_CSV_Col_Index(str, 1 )) Nap1
		cross apply ( select Np2 =  dbo.SF_CSV_Col_Index(str, Np1+1)) Nap2
		cross apply ( select Np3 =  dbo.SF_CSV_Col_Index(str, Np2+1)) Nap3
		cross apply ( select Np4 =  dbo.SF_CSV_Col_Index(str, Np3+1)) Nap4
		cross apply ( select Np5 =  dbo.SF_CSV_Col_Index(str, Np4+1)) Nap5
		cross apply ( select Np6 =  dbo.SF_CSV_Col_Index(str, Np5+1)) Nap6
		cross apply ( select Np7 =  dbo.SF_CSV_Col_Index(str, Np6+1)) Nap7
		cross apply ( select Np8 =  dbo.SF_CSV_Col_Index(str, Np7+1)) Nap8
		cross apply ( select Np9 =  dbo.SF_CSV_Col_Index(str, Np8+1)) Nap9
		cross apply ( select Np10 =  dbo.SF_CSV_Col_Index(str, Np9+1)) Nap10
		cross apply ( 
			select 
				[PACKAGE_ID] = substring( str, 1, Np1-1 ), 			
				[Package_Desc] = substring( str, Np1+1, Np2-Np1-1),				
				[PROJECT_ID] = substring( str, Np2+1, Np3-Np2-1 ),
				[DEV_CODE] = substring( str, Np3+1, Np4-Np3-1 ),
				[FM_BLK] = substring( str, Np4+1, Np5-Np4-1 ),
				[FM_FLOOR] = substring( str, Np5+1, Np6-Np5-1 ),
				[FM_FLAT] = substring( str, Np6+1, Np7-Np6-1 ),
				[FM_HSE_NO] = substring( str, Np7+1, Np8-Np7-1 ),
				[FM_STR_NO] = substring( str, Np8+1, Np9-Np8-1 ),
				[STR_CODE] = substring( str, Np9+1, Np10-Np9-1 )
		) NParsedData
	

	-- Step 4: Tidy up CSV value
	-- Step 4.1: Remove Header and Teail Record	and Package_Desc 
	DELETE #TMP_CSV_COLUMN WHERE CSV_ID = 1;
	DELETE #TMP_CSV_COLUMN WHERE CSV_ID = (SELECT MAX(CSV_ID) FROM #TMP_CSV_COLUMN);
	ALTER TABLE #TMP_CSV_COLUMN DROP COLUMN [Package_Desc];


	-- Step 4.2: Remove Double Quote
	UPDATE #TMP_CSV_COLUMN
	SET
		[PACKAGE_ID] = REPLACE([PACKAGE_ID], '"', ''), 
		[PROJECT_ID] = REPLACE([PROJECT_ID], '"', ''), 
		[DEV_CODE] = REPLACE([DEV_CODE], '"', ''),
		[FM_BLK] = REPLACE([FM_BLK], '"', ''), 
		[FM_FLOOR] = REPLACE([FM_FLOOR], '"', ''), 
		[FM_FLAT] = REPLACE([FM_FLAT], '"', ''), 
		[FM_HSE_NO] = REPLACE([FM_HSE_NO], '"', ''), 
		[FM_STR_NO] = REPLACE([FM_STR_NO], '"', ''), 
		[STR_CODE]  = REPLACE([STR_CODE], '"', '')


	-- Step 4.3: Generate FM_CODE
	UPDATE #TMP_CSV_COLUMN
	SET FM_CODE = dbo.[SF_FM_CODE]([DEV_CODE],[FM_BLK],[FM_FLOOR],[FM_FLAT],[FM_HSE_NO],[FM_STR_NO],[STR_CODE]);


	

	-- Step 5: Checking
	-- DELETE #TMP_CSV_COLUMN WHERE CSV_ID IN (2, 3)
	 --Step 5.1: Checking Project ID
	SET @OUT_ErrorType = '1'
	SELECT @ErrorMsg = 
	(
		SELECT CAST(CSV_ID as varchar(10)) + ',' AS [text()] FROM #TMP_CSV_COLUMN WHERE PROJECT_ID != @PROJECT_ID
		ORDER BY CSV_ID
		For XML PATH ('')
	);
	
	

	
	-- Step 5.2: Checking Package ID
	IF ((@ErrorMsg IS NULL) OR (LEN(@ErrorMsg)) = 0)
	BEGIN
		SET @OUT_ErrorType = '2';
		SELECT @ErrorMsg = 
		(
			SELECT CAST(CSV_ID as varchar(10)) + ',' AS [text()]
			FROM 
				#TMP_CSV_COLUMN t
				LEFT JOIN PACKAGES p on t.PROJECT_ID = p.PROJECT_ID AND t.[PACKAGE_ID] = p.[PACKAGE_ID]
			WHERE p.[PACKAGE_ID] IS NULL
			ORDER BY CSV_ID
			For XML PATH ('')
		);
	END
	

	-- Step 5.3: Checking Flat Existance
	IF ((@ErrorMsg IS NULL) OR (LEN(@ErrorMsg)) = 0)
	BEGIN
		SET @OUT_ErrorType = '3';
		SELECT @ErrorMsg = 
		(
			SELECT CAST(CSV_ID as varchar(10)) + ',' AS [text()]
			FROM 
				#TMP_CSV_COLUMN t
				LEFT JOIN FLAT_MASTER f on t.PROJECT_ID = f.PROJECT_ID AND t.FM_CODE = f.FM_CODE
			WHERE
				f.FM_CODE IS NULL
			ORDER BY CSV_ID
			For XML PATH ('')
		);
	END

	-- Step 5.4: Checking Flat Status
	IF ((@ErrorMsg IS NULL) OR (LEN(@ErrorMsg)) = 0)
	BEGIN
		SET @OUT_ErrorType = '4';
		SELECT @ErrorMsg = 
		(
			SELECT CAST(CSV_ID as varchar(10)) + ',' AS [text()]
			FROM 
				#TMP_CSV_COLUMN t
				JOIN FLAT_MASTER f on t.PROJECT_ID = f.PROJECT_ID AND t.FM_CODE = f.FM_CODE
			WHERE
				f.FM_STATUS NOT IN ('R','A')
			ORDER BY CSV_ID
			For XML PATH ('')
		);
	END


	

	
	-- Step 6: Clear DB Record and Insert
	IF ((@ErrorMsg IS NULL) OR (LEN(@ErrorMsg)) = 0)
	BEGIN
		SET @OUT_ErrorType = NULL;
		SET @OUT_ErrorRow = NULL;

		DELETE FROM FLAT_PACKAGE
		WHERE PROJECT_ID = @PROJECT_ID AND FM_CODE IN (SELECT FM_CODE FROM #TMP_CSV_COLUMN);
	
		INSERT INTO [dbo].[FLAT_PACKAGE]
		(
			[FM_CODE],[PROJECT_ID],[PACKAGE_ID],
			[CR_UID],[CR_FID],[CR_DT],
			[UP_UID],[UP_FID],[UP_DT]
		)
		SELECT 
			[FM_CODE],[PROJECT_ID],[PACKAGE_ID],
			@CR_UID, @CR_FID, GETDATE(), @CR_UID, @CR_FID, GETDATE()
		FROM #TMP_CSV_COLUMN
	END 
	ELSE
	BEGIN
		SET @OUT_ErrorRow = LEFT(@ErrorMsg, (LEN(@ErrorMsg)-1));
	END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_PA28_GetPackageUnit]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************
*
* NAME        : SP_SU004_EXPORT_SURVEY
*
* VERSION     : 1.0
*
* DATE        : 14-09-2015
*
* DESCRIPTION : 
*
* PROCEDURE LIST:
*    PROCEDURE    SP_SU004_EXPORT_SURVEY
*    FUNCTION     
*
* MODIFICATION HISTORY
* NAME             DATE         DESCRIPTION
* ==========  =============  =======================================
* ADA.JIANG     14-09-2015    INITIAL VERSION.

**************************************************************************/

CREATE PROC [dbo].[SP_PA28_GetPackageUnit]
(
  @PROJECT_ID NVARCHAR(10)
 
)
  As
BEGIN 

	
	SELECT DISTINCT 
		PA.PACKAGE_ID AS 'Package ID' ,
		PA.PACKAGE_DESC As 'Package Description',
		PA.PROJECT_ID AS 'Project ID',
		FM.DEV_CODE as 'Phase Code',
		FM.FM_BLK as 'Block Type Code',
		FM.FM_FLOOR as 'Floor',
		FM.FM_FLAT as 'Flat',
		FM.FM_HSE_NO as 'House No',
		FM.FM_STR_NO as 'Street No.',
		FM.STR_CODE  as 'Street Code',
		(
			case
				when isnull(FM.FM_STATUS,N'')=N'' then N'Unclassified' 
				when isnull(FM.FM_STATUS,N'')=N'R' then N'Reserved' 
				when isnull(FM.FM_STATUS,N'')=N'P' then N'Hold' 
				when isnull(FM.FM_STATUS,N'')=N'S' then N'Sold' 
				when isnull(FM.FM_STATUS,N'')=N'A' then N'Available' 
			end 
		) AS 'Unit Status' 
	  FROM  
		FLAT_MASTER AS FM 
		LEFT JOIN FLAT_PACKAGE AS FP ON FM.FM_CODE=FP.FM_CODE AND FM.PROJECT_ID=FP.PROJECT_ID 
		LEFT JOIN PACKAGES AS PA ON PA.PACKAGE_ID=FP.PACKAGE_ID AND  PA.PROJECT_ID=FP.PROJECT_ID
	WHERE
		PA.PROJECT_ID=@PROJECT_ID

END



GO
/****** Object:  StoredProcedure [dbo].[SP_PA29_DeleteWallScreen]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_PA29_DeleteWallScreen]
(
	@WALLSCREEN_ID INT
)
  As

	DELETE WALLSCREEN_DETAIL WHERE WALLSCREEN_ID=@WALLSCREEN_ID;
	DELETE WALLSCREEN WHERE WALLSCREEN_ID=@WALLSCREEN_ID;

GO
/****** Object:  StoredProcedure [dbo].[SP_PA29_GetWallScreen]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_PA29_GetWallScreen]
(
	@PROJECT_ID NVARCHAR(10)
)
  As

	SELECT  WALLSCREEN_ID,WALLSCREEN_NAME FROM WALLSCREEN WHERE PROJECT_ID=@PROJECT_ID
		

GO
/****** Object:  StoredProcedure [dbo].[SP_PA29_UploadWallScreen]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_PA29_UploadWallScreen]  
(
	@PROJECT_ID NVARCHAR(10),
	@WALLSCREEN_NAME NVARCHAR(100),
	@WALLSCREEN_HTML NVARCHAR(MAX),
	@CR_UID NVARCHAR(10),
	@CR_FID NCHAR(10),
	@WALLSCREEN_ID INT OUTPUT 
)
  As

	INSERT INTO WALLSCREEN
	(
		[PROJECT_ID],[WALLSCREEN_NAME],[WALLSCREEN_HTML],
		[CR_UID],[CR_FID],[CR_DT],
		[UP_UID],[UP_FID],[UP_DT]
	)
	VALUES
	(
		@PROJECT_ID,@WALLSCREEN_NAME,@WALLSCREEN_HTML,
		@CR_UID,@CR_FID,GETDATE(),
		@CR_UID,@CR_FID,GETDATE()
	);


	SELECT @WALLSCREEN_ID=IDENT_CURRENT('WALLSCREEN') ;


	SELECT Start_POS, End_POS, Tag, KeyType, Tag DISPLAY_KEY INTO #WS_TMP
	FROM
	(
		SELECT Start_POS, End_POS, Tag, 'F' KeyType FROM dbo.[SF_TagFinder](@WALLSCREEN_HTML, 'PSMS_UNIT_%_END', '_END')
		UNION ALL
		SELECT Start_POS, End_POS, Tag, 'C' KeyType FROM dbo.[SF_TagFinder](@WALLSCREEN_HTML, 'PSMS_CAR_%_END', '_END')
	) tmp



	--Remove '_END'
	UPDATE #WS_TMP 
	SET DISPLAY_KEY = LEFT(DISPLAY_KEY, LEN(DISPLAY_KEY ) - 4)

	--Remove 'PSMS_UNIT_'
	UPDATE #WS_TMP 
	SET DISPLAY_KEY = RIGHT(DISPLAY_KEY, LEN(DISPLAY_KEY ) - 10) 
	WHERE KeyType = 'F'

	--Remove 'PSMS_CAR_'
	UPDATE #WS_TMP 
	SET DISPLAY_KEY = RIGHT(DISPLAY_KEY, LEN(DISPLAY_KEY ) - 9) 
	WHERE KeyType = 'C'


	INSERT INTO [dbo].[WALLSCREEN_DETAIL]
	(
		[WALLSCREEN_ID],[DISPLAY_KEY_TYPE],[DISPLAY_KEY],
		[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	)
	SELECT 
		@WALLSCREEN_ID, KeyType, DISPLAY_KEY,
		@CR_UID,@CR_FID,GETDATE(),@CR_UID,@CR_FID,GETDATE()
	FROM #WS_TMP;



GO
/****** Object:  StoredProcedure [dbo].[SP_Select_PaymentDueDate]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_PaymentDueDate]
	@FlatWhere [nvarchar](max),
	@CarWhere [nvarchar](max),
	@MOAWhere [nvarchar](max),
	@ShowType [nvarchar](10)
WITH  EXECUTE AS CALLER
AS
BEGIN
 declare @FlatSql nvarchar(max)
 declare @CarSql nvarchar(max)
 declare @MOASql nvarchar(max)
 declare @Sql nvarchar(max)
 set @FlatSql='Select P.PY_Desc Payment_Stage,M.MOA_No Agreement_No, IsNull(Buyer_Surname, N''---'') Surname, IsNull(Buyer_Given_Name, N''---'') Given_Name, IsNull(MOA_Co_Name, N''---'') Company_Name, MOA_Status Status_Code, Case MOA_Status When N''O'' Then N''1176'' When N''C'' Then N''1177'' When N''X'' Then N''1178'' When N''V'' Then N''1179'' Else Null End Agreement_Status, ISNULL(convert (nvarchar (20), MOA_DT,105), ''N'') Agreement_Date, case when ISNULL(ASP_SIGNED,''N'')=''Y'' then ''SIGNED'' else ''---'' END ''ASP_SIGNED'', case when ISNULL(SIGNED,''N'')=''Y'' then ''SIGNED'' else ''---'' END ''PASP_SIGNED'', N''---'' Unit, N''F'' Unit_Type, Block_Desc Block, FM_Floor Floor, FM_Flat Flat, FM_Hse_No House_No, FM_Str_No Street_No, Str_Name Street, ''T'' Transfer_Status  , ISNULL(Convert(Nvarchar(10),P.OTHER_PY_DUE_DATE,105), ''---'') [OTHER_PY_DUE_DATE] , P.PY_PLAN_SEQ
			From AM_PAYMENT_PLAN P LEFT JOIN MOA M ON P.PROJECT_ID = M.PROJECT_ID AND P.AM_NO=M.MOA_NO
			LEFT JOIN PRJ_PAY_METHOD PP on PP.METHOD_CODE = P.METHOD_CODE and PP.PROJECT_ID = P.PROJECT_ID 
			LEFT JOIN(
				Select F.*, S.Str_Name, B.Block_Desc From Flat_Master F Left Outer Join Street S On (F.Project_ID = S.Project_ID And F.Str_Code = S.Str_Code) Left Outer Join Block B On (F.Project_ID = B.Project_ID And F.FM_Blk = B.Block_ID) 
				Where FM_Deleted <> N''Y'' And MOA_No Is Not Null
			) N ON M.MOA_No = N.MOA_No And M.Project_ID = N.Project_ID
			Where P.PY_DT_CAL_TYPE = ''T'' and P.PY_DATE_DUE is NULL AND N.FM_CODE IS NOT NULL AND  M.MOA_Status = N''C'''+@FlatWhere;
 set @CarSql='Select P.PY_Desc Payment_Stage,M.MOA_No Agreement_No,IsNull(Buyer_Surname, N''---'') Surname,IsNull(Buyer_Given_Name, N''---'') Given_Name,IsNull(MOA_Co_Name, N''---'') Company_Name,MOA_Status Status_Code,Case MOA_Status When N''O'' Then N''1176'' When N''C'' Then N''1177'' When N''X'' Then N''1178'' When N''V'' Then N''1179'' Else Null End Agreement_Status,ISNULL(convert (nvarchar (20), MOA_DT,105), ''N'') Agreement_Date,case when ISNULL(ASP_SIGNED,''N'')=''Y'' then ''SIGNED'' else ''---'' END ''ASP_SIGNED'',case when ISNULL(SIGNED,''N'')=''Y'' then ''SIGNED'' else ''---'' END ''PASP_SIGNED'',  N''---'' Unit,N''C'' Unit_Type, Null Block,IsNull((Select Case IsNull(N.Level_Desc,''ID'') When ''ID'' Then N.Park_Level Else N.Level_Desc End), N''---'') Floor,Car_Park_No Flat, House_No House_No, Street_No Street_No, Str_Name Street, ''T'' Transfer_Status , ISNULL(Convert(Nvarchar(10),P.OTHER_PY_DUE_DATE,105), ''---'') [OTHER_PY_DUE_DATE] , P.PY_PLAN_SEQ
			From AM_PAYMENT_PLAN P LEFT JOIN MOA M ON P.PROJECT_ID = M.PROJECT_ID AND P.AM_NO=M.MOA_NO
			LEFT JOIN PRJ_PAY_METHOD PP on PP.METHOD_CODE = P.METHOD_CODE and PP.PROJECT_ID = P.PROJECT_ID 
			LEFT JOIN(
				Select C.*, S.Str_Name, CL.Level_Desc From Car_Park C Left Outer Join Street S On (C.Project_ID = S.Project_ID And C.Str_Code = S.Str_Code)  Left outer join Car_Park_Level CL on (CL.Project_Id=C.Project_Id and CL.Level_Id=C.Park_Level) 
				Where Car_Park_Deleted <> N''Y'' And MOA_No Is Not Null
			)  N ON M.MOA_No = N.MOA_No And M.Project_ID = N.Project_ID
			Where P.PY_DT_CAL_TYPE = ''T'' and P.PY_DATE_DUE is NULL AND N.CAR_PARK_ID IS NOT NULL And M.MOA_Status = N''C'''+@CarWhere;
 set @MOASql='Select P.PY_Desc Payment_Stage,M.MOA_No Agreement_No, IsNull(Buyer_Surname, N''---'') Surname, IsNull(Buyer_Given_Name, N''---'') Given_Name, IsNull(MOA_Co_Name, N''---'') Company_Name, MOA_Status Status_Code, Case MOA_Status When N''O'' Then N''1176'' When N''C'' Then N''1177'' When N''X'' Then N''1178'' When N''V'' Then N''1179'' Else Null End Agreement_Status, ISNULL(convert (nvarchar (20), MOA_DT,105), ''N'') Agreement_Date, case when ISNULL(ASP_SIGNED,''N'')=''Y'' then ''SIGNED'' else ''---'' END ''ASP_SIGNED'', case when ISNULL(SIGNED,''N'')=''Y'' then ''SIGNED'' else ''---'' END ''PASP_SIGNED'',  N''---'' Unit, N''V'' Unit_Type, Null Block, Null Floor, Null Flat, Null House_No, Null Street_No, Null Street,  ''T'' Transfer_Status , ISNULL(Convert(Nvarchar(10),P.OTHER_PY_DUE_DATE,105), ''---'')  [OTHER_PY_DUE_DATE] , P.PY_PLAN_SEQ
			From AM_PAYMENT_PLAN P LEFT JOIN MOA M ON P.PROJECT_ID = M.PROJECT_ID AND P.AM_NO=M.MOA_NO 
			LEFT JOIN PRJ_PAY_METHOD PP on PP.METHOD_CODE = P.METHOD_CODE and PP.PROJECT_ID = P.PROJECT_ID 
			Where P.PY_DT_CAL_TYPE = ''T'' and P.PY_DATE_DUE is NULL AND (M.MOA_Status = N''C'') '+@MOAWhere;
 set @Sql = @FlatSql+' Union '+@CarSql+' Union '+@MOASql+' Order By M.MOA_No, Unit_Type Desc'
 set @Sql=case 
     when @ShowType='F' then @FlatSql+' Union '+@MOASql+' Order By M.MOA_No, Unit_Type Desc'
     when @ShowType='CP' then @CarSql+' Union '+@MOASql+' Order By M.MOA_No, Unit_Type Desc'
     else @FlatSql+' Union '+ @CarSql+' Union '+@MOASql+' Order By M.MOA_No, Unit_Type Desc'
end

 exec(@Sql) 
END



GO
/****** Object:  StoredProcedure [dbo].[SP_SpecialAccessCheck]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_SpecialAccessCheck]  
(
	@PROJECT_ID NVARCHAR(10),
	@UserName NVARCHAR(20),
	@Password NVARCHAR(20),
	@SAType nvarchar(50),
	@Return_Status NVARCHAR(1) OUTPUT 
)
 
AS BEGIN

	SET @Return_Status = 'N';

	SELECT
		@Return_Status =
		CASE
			WHEN @SAType = 'SELECT_RESERVE' THEN ISNULL(SELECT_RESERVE,'N')
			WHEN @SAType = 'OVERDUE' THEN ISNULL(OVERDUE,'N')
			WHEN @SAType = 'LESS_DEPOSIT' THEN ISNULL(LESS_DEPOSIT,'N')
			WHEN @SAType = 'REFUND' THEN ISNULL(REFUND,'N')
			WHEN @SAType = 'PAYMENT_SCHEDULE' THEN ISNULL(PAYMENT_SCHEDULE,'N')
			WHEN @SAType = 'VOID_AM' THEN ISNULL(VOID_AM,'N')
			WHEN @SAType = 'MODIFY_CONFIRM_MOA' THEN ISNULL(MODIFY_CONFIRM_MOA,'N')
			WHEN @SAType = 'COMPANY_PERCENT' THEN ISNULL(COMPANY_PERCENT,'N')
			WHEN @SAType = 'BLACK_LIST' THEN ISNULL(BLACK_LIST,'N')
			WHEN @SAType = 'SALES_BATCH' THEN ISNULL(SALES_BATCH,'N')
			WHEN @SAType = 'MAX_PURCHASE_BUYER' THEN ISNULL(MAX_PURCHASE_BUYER,'N')
			WHEN @SAType = 'MAX_PURCHASE_COMBINE' THEN ISNULL(MAX_PURCHASE_COMBINE,'N')
		END 
	FROM
		USER_PROFILE
	WHERE
		[UID] = @UserName
		AND [PASSWORD] = HASHBYTES('MD5', @Password)
		AND [UID] IN (SELECT [UID] FROM PROJECT_ACCESS WHERE [UID] = @UserName AND PROJECT_ID = @PROJECT_ID)
		AND	TERMINATE IS NULL 
		AND	Convert(datetime, Convert(Varchar, Exp_Date, 105), 105) > Convert(datetime, Convert(Varchar, Getdate(), 105), 105);

	INSERT INTO AUTH_LOG
	(	
		PROJECT_ID, USERNAME, AUTH_TYPE, AUTH_DT, RESULT
	)
     VALUES
	(
		@PROJECT_ID, @UserName, @SAType, GETDATE(), @Return_Status
	);
		
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_SS001_SelectMenuItem]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SS001_SelectMenuItem]
	@Username [varchar](16)
WITH  EXECUTE AS CALLER
AS
Declare @_loop Char(1)

	Select @_loop = 'Y'

	Create Table #_function_groups
	(
		FunctionGroupID VarChar(10)
	)

	Create Table #_function_groups_temp
	(
		FunctionGroupID VarChar(10)
	)

	Insert Into #_function_groups
	Select Distinct FunctionGroupID
	From FUNCTION_PROFILE
	Where InMenu = 'Y' And dbo.SF_SS001_IsMenuAccessible(@Username, Fn_ID) = 0

	While @_loop = 'Y'
	Begin
		Insert Into #_function_groups_temp
		Select FunctionGroupID
		From #_function_groups
		Union
		Select Distinct ParentGroupID
		From FUNCTION_GROUP
		Where ParentGroupID Is Not Null And FunctionGroupID In
		(
			Select FunctionGroupID
			From #_function_groups
		)

		If (Select Count(1) From #_function_groups_temp) = (Select Count(1) From #_function_groups)
		Begin
			Break
		End

		Delete
		From #_function_groups

		Insert Into #_function_groups
		Select FunctionGroupID
		From #_function_groups_temp

		Delete
		From #_function_groups_temp
	End

	--BEGIN #20080221
	Select FunctionGroupID, ParentGroupID, MenuEngName, MenuChiName, DEFAULT_ICON
	--END #20080221
	From FUNCTION_GROUP
	Where FunctionGroupID In
	(
		Select FunctionGroupID
		From #_function_groups
	)
	Order By ParentGroupID, menuOrder, FunctionGroupID

	--BEGIN #20080221
	Select FunctionGroupID, Fn_ID, AccessPath, MenuEngName, MenuChiName
	--END #20080221
	From FUNCTION_PROFILE
	Where InMenu = 'Y' And dbo.SF_SS001_IsMenuAccessible(@Username, Fn_ID) = 0
	Order By FunctionGroupID, menuOrder
Return

GO
/****** Object:  StoredProcedure [dbo].[SP_SU01_AddSurvey]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_SU01_AddSurvey]  
(
	@PROJECT_ID NVARCHAR(10),
	@SURVEY_NAME NVARCHAR(100),
	@CR_UID NVARCHAR(10),
	@CR_FID NCHAR(10),
	@SURVEY_ID INT OUTPUT 
)
 
AS BEGIN

	INSERT INTO [dbo].[SURVEY]
	(
		[PROJECT_ID],[SURVEY_NAME],[SURVEY_STATUS],
		[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	)
	VALUES
	(
	  @PROJECT_ID,@SURVEY_NAME,'C',
	  @CR_UID,@CR_FID,GETDATE(),@CR_UID,@CR_FID,GETDATE()
	)
	
	SELECT @SURVEY_ID=IDENT_CURRENT('SURVEY') ;

	
END



GO
/****** Object:  StoredProcedure [dbo].[SP_SU01_AddSurveyDetail]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_SU01_AddSurveyDetail]  
(
	@SURVEY_ID int,
	@SURVEY_DETAIL_SEQ int,
	@QUESTION NVARCHAR(500),
	@QUESTION_TYPE NVARCHAR(1),
	@IS_MANDATORY NVARCHAR(1),
	@CR_UID NVARCHAR(10),
	@CR_FID NVARCHAR(10),
	@SURVEY_DETAIL_ID INT OUTPUT 
)
 
AS BEGIN
	
	INSERT INTO SURVEY_DETAIL
	(
	  SURVEY_ID,SURVEY_DETAIL_SEQ,QUESTION,QUESTION_TYPE,IS_MANDATORY,
	  [CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	)
	VALUES
	(
	  @SURVEY_ID, @SURVEY_DETAIL_SEQ, @QUESTION, @QUESTION_TYPE,@IS_MANDATORY,
	  @CR_UID,@CR_FID,GETDATE(),@CR_UID,@CR_FID,GETDATE()
	);

	SELECT @SURVEY_DETAIL_ID=IDENT_CURRENT('SURVEY_DETAIL') ;


	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_SU01_AddSurveyOption]    Script Date: 10/12/2018 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_SU01_AddSurveyOption]  
(	
	@SURVEY_DETAIL_ID int,
	@OPTION_VALUE NVARCHAR(500),
	@CR_UID NVARCHAR(10),
	@CR_FID NCHAR(10) 
)
 
AS BEGIN

	INSERT INTO SURVEY_DETAIL_OPTION
	(
		SURVEY_DETAIL_ID,OPTION_VALUE,
		[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	) 
	VALUES
	(
		@SURVEY_DETAIL_ID,@OPTION_VALUE,
		@CR_UID,@CR_FID,GETDATE(),@CR_UID,@CR_FID,GETDATE()
	);

END


GO
/****** Object:  StoredProcedure [dbo].[SP_SU02_GetSurveyList]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************
*
* NAME        : SP_SU02_GetSurveyList
*
* VERSION     : 1.0
*
* DATE        : 14-09-2015
*
* DESCRIPTION : 
*
* PROCEDURE LIST:
*    PROCEDURE    SP_SU02_GetSurveyList
*    FUNCTION     
*
* MODIFICATION HISTORY
* NAME             DATE         DESCRIPTION
* ==========  =============  =======================================
* ADA.JIANG     14-09-2015    INITIAL VERSION.

**************************************************************************/

CREATE PROC [dbo].[SP_SU02_GetSurveyList]
(
  @PROJECT_ID NVARCHAR(10)
)
 
AS BEGIN	
	
	SELECT 
		SURVEY_ID, SURVEY_NAME, SURVEY_STATUS,
		( CASE WHEN SURVEY_STATUS='O' THEN 'OPEN' ELSE 'CLOSE' END) AS SURVEY_STATUS_DESC
	FROM SURVEY 
	WHERE 
		PROJECT_ID = @PROJECT_ID AND 
		SURVEY_STATUS IN ('O', 'C');

END


GO
/****** Object:  StoredProcedure [dbo].[SP_SU02_UpdateSurvey]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************
*
* NAME        : SP_SU02_UpdateSurvey
*
* VERSION     : 1.0
*
* DATE        : 14-09-2015
*
* DESCRIPTION : 
*
* PROCEDURE LIST:
*    PROCEDURE    SP_SU02_UpdateSurvey
*    FUNCTION     
*
* MODIFICATION HISTORY
* NAME             DATE         DESCRIPTION
* ==========  =============  =======================================
* ADA.JIANG     14-09-2015    INITIAL VERSION.

**************************************************************************/

CREATE PROC [dbo].[SP_SU02_UpdateSurvey]
(
	@SURVEY_ID INT,
	@UpdateStatus NVARCHAR(1),
	@UID NVARCHAR(10),
	@FID NVARCHAR(10),
	@OUT_CHAR NVARCHAR(1) OUTPUT 
)
 
AS BEGIN 

	DECLARE  @RecCount INT
	SET @OUT_CHAR = 'N';

	IF (@UpdateStatus = 'D')
	BEGIN
		SELECT @RecCount = COUNT(*) FROM SURVEY_RESULT WHERE SURVEY_ID=@SURVEY_ID
		
		IF(@RecCount=0)
		BEGIN			
			DELETE [SURVEY_DETAIL_OPTION] WHERE [SURVEY_DETAIL_ID] IN (SELECT [SURVEY_DETAIL_ID] FROM SURVEY_DETAIL WHERE [SURVEY_ID] = @SURVEY_ID);
			DELETE [SURVEY_DETAIL] WHERE [SURVEY_ID] = @SURVEY_ID;
			DELETE [SURVEY] WHERE [SURVEY_ID] = @SURVEY_ID;
			SET @OUT_CHAR = 'Y';
		END
	END ELSE
	BEGIN

		UPDATE SURVEY
		SET 
			SURVEY_STATUS=@UpdateStatus,
			[UP_UID] = @UID,
			[UP_FID] = @FID,
			[UP_DT] = GETDATE()
		WHERE SURVEY_ID=@SURVEY_ID;
		SET @OUT_CHAR = 'Y';
		
	END



	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_SU03_GetSurveyDetail]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************
*
* NAME        : SP_SU03_GetSurveyDetail
*
* VERSION     : 1.0
*
* DATE        : 14-09-2015
*
* DESCRIPTION : 
*
* PROCEDURE LIST:
*    PROCEDURE    SP_SU03_GetSurveyDetail
*    FUNCTION     
*
* MODIFICATION HISTORY
* NAME             DATE         DESCRIPTION
* ==========  =============  =======================================
* ADA.JIANG     16-09-2015    INITIAL VERSION.

**************************************************************************/

CREATE PROC [dbo].[SP_SU03_GetSurveyDetail]  
(
  @SURVEY_ID INT
)
 
AS BEGIN

	SELECT
		SUD.SURVEY_DETAIL_ID,SUD.SURVEY_DETAIL_SEQ,SUD.QUESTION,SUD.QUESTION_TYPE,SUD.IS_MANDATORY,SDO.OPTION_VALUE,SDO.SURVEY_DETAIL_OPTION_ID 
	FROM  
		SURVEY_DETAIL SUD
		LEFT JOIN SURVEY  SU ON SU.SURVEY_ID=SUD.SURVEY_ID 
		LEFT JOIN SURVEY_DETAIL_OPTION SDO ON SDO.SURVEY_DETAIL_ID=SUD.SURVEY_DETAIL_ID
	WHERE SU.SURVEY_ID=@SURVEY_ID AND SURVEY_STATUS='O'
	
END



GO
/****** Object:  StoredProcedure [dbo].[SP_SU03_GetSurveyList]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************
*
* NAME        : SP_SU03_GetSurveyList
*
* VERSION     : 1.0
*
* DATE        : 14-09-2015
*
* DESCRIPTION : 
*
* PROCEDURE LIST:
*    PROCEDURE    SP_SU03_GetSurveyList
*    FUNCTION     
*
* MODIFICATION HISTORY
* NAME             DATE         DESCRIPTION
* ==========  =============  =======================================
* ADA.JIANG     14-09-2015    INITIAL VERSION.

**************************************************************************/

CREATE PROC [dbo].[SP_SU03_GetSurveyList]
(
	@PROJECT_ID NVARCHAR(10)
)
 
AS BEGIN
	
	SELECT SURVEY_ID,SURVEY_NAME FROM  SURVEY WHERE PROJECT_ID=@PROJECT_ID AND SURVEY_STATUS='O';

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SU03_InsertSurveyResult]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************
*
* NAME        : SP_SU03_InsertSurveyResult
*
* VERSION     : 1.0
*
* DATE        : 14-09-2015
*
* DESCRIPTION : 
*
* PROCEDURE LIST:
*    PROCEDURE    SP_SU03_InsertSurveyResult
*    FUNCTION     
*
* MODIFICATION HISTORY
* NAME             DATE         DESCRIPTION
* ==========  =============  =======================================
* ADA.JIANG     16-09-2015    INITIAL VERSION.

**************************************************************************/

CREATE PROC [dbo].[SP_SU03_InsertSurveyResult]  
(
    @SURVEY_ID INT,
	@CR_UID NVARCHAR(10),
	@CR_FID NCHAR(10),
	@SURVEY_RESULT_ID INT OUTPUT
)
 
AS BEGIN



	INSERT INTO [dbo].[SURVEY_RESULT] 
	(
		[SURVEY_ID],[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	)
	VALUES
	( 
		@SURVEY_ID, @CR_UID, @CR_FID, GETDATE(), @CR_UID, @CR_FID, GETDATE()
	);

	SELECT @SURVEY_RESULT_ID=IDENT_CURRENT('SURVEY_RESULT') ;


END

GO
/****** Object:  StoredProcedure [dbo].[SP_SU03_InsertSurveyResultDetail]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************
*
* NAME        : SP_SU03_InsertSurveyResultDetail
*
* VERSION     : 1.0
*
* DATE        : 14-09-2015
*
* DESCRIPTION : 
*
* PROCEDURE LIST:
*    PROCEDURE    SP_SU03_InsertSurveyResultDetail
*    FUNCTION     
*
* MODIFICATION HISTORY
* NAME             DATE         DESCRIPTION
* ==========  =============  =======================================
* ADA.JIANG     16-09-2015    INITIAL VERSION.

**************************************************************************/

CREATE PROC [dbo].[SP_SU03_InsertSurveyResultDetail]  
(
    @SURVEY_RESULT_ID INT,
	@SURVEY_DETAIL_ID INT,
	@SURVEY_DETAIL_OPTION_ID INT,
	@SELECTED_OPTION_VALUE NVARCHAR(500),
	@CR_UID NVARCHAR(10),
	@CR_FID NCHAR(10) 
)
 
AS BEGIN 
	
	
	DECLARE @QUESTION_TYPE NVARCHAR(1)
	SELECT @QUESTION_TYPE=QUESTION_TYPE FROM  SURVEY_DETAIL WHERE  @SURVEY_DETAIL_ID=SURVEY_DETAIL_ID
	
	/*
	IF (@QUESTION_TYPE='3')
		BEGIN
			SELECT @SURVEY_DETAIL_OPTION_ID=SURVEY_DETAIL_OPTION_ID FROM SURVEY_DETAIL_OPTION WHERE SURVEY_DETAIL_ID=@SURVEY_DETAIL_ID AND OPTION_VALUE=@SELECTED_OPTION_VALUE
		END
	ELSE IF (@QUESTION_TYPE='4')
		BEGIN
			SELECT @SURVEY_DETAIL_OPTION_ID=SURVEY_DETAIL_OPTION_ID FROM SURVEY_DETAIL_OPTION WHERE SURVEY_DETAIL_ID=@SURVEY_DETAIL_ID AND OPTION_VALUE=@SELECTED_OPTION_VALUE
		END
	*/


	INSERT INTO [dbo].[SURVEY_RESULT_DETAIL]
	(
		[SURVEY_RESULT_ID],[SURVEY_DETAIL_ID],[SURVEY_DETAIL_OPTION_ID],[SELECTED_OPTION_VALUE],
		[CR_UID],[CR_FID],[CR_DT],[UP_UID],[UP_FID],[UP_DT]
	)
     VALUES
	(
		@SURVEY_RESULT_ID, @SURVEY_DETAIL_ID, @SURVEY_DETAIL_OPTION_ID, @SELECTED_OPTION_VALUE,
		@CR_UID,@CR_FID,GETDATE(),@CR_UID,@CR_FID,GETDATE()
	);
	


END



GO
/****** Object:  StoredProcedure [dbo].[SP_SU04_ExporySurvey]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/**************************************************************************
*
* NAME        : SP_SU04_ExporySurvey
*
* VERSION     : 1.0
*
* DATE        : 14-09-2015
*
* DESCRIPTION : 
*
* PROCEDURE LIST:
*    PROCEDURE    SP_SU04_ExporySurvey
*    FUNCTION     
*
* MODIFICATION HISTORY
* NAME             DATE         DESCRIPTION
* ==========  =============  =======================================
* ADA.JIANG     14-09-2015    INITIAL VERSION.

**************************************************************************/

CREATE PROC [dbo].[SP_SU04_ExporySurvey]
(
	@SURVEY_ID INT
) 
 
AS BEGIN

	DECLARE
		@SurveyDetailSeq INT,
		@ColumnPart NVARCHAR(MAX),
		@JoinPart NVARCHAR(MAX),
		@ColumnFull NVARCHAR(MAX),
		@JoinFull NVARCHAR(MAX),
		@FullSQL NVARCHAR(MAX)



	SET @ColumnFull = '';
	SET @JoinFull = '';

	SELECT
		SURVEY_DETAIL_SEQ, OptKey, ',' + COL_Part COL_Part, JOIN_Part INTO #TMP_SU04
	FROM 
	(
		SELECT DISTINCT 
			sd.SURVEY_DETAIL_SEQ,  
			CASE WHEN sd.QUESTION_TYPE = '4'  THEN sdo.SURVEY_DETAIL_OPTION_ID ELSE sd.SURVEY_DETAIL_SEQ END OptKey,
			CASE WHEN sd.QUESTION_TYPE = '4' 
				THEN 'IIF(Q' + CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10)) + '_' + CAST(sdo.SURVEY_DETAIL_OPTION_ID AS nvarchar(10)) + '.SELECTED_OPTION_VALUE  IS NULL, ''N'', ''Y'') ANS' + CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10)) + '_' + CAST(sdo.SURVEY_DETAIL_OPTION_ID AS nvarchar(10)) 
				ELSE 'Q' + CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10)) + '.SELECTED_OPTION_VALUE' + ' ANS' + CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10))
			END COL_Part,
			CASE WHEN sd.QUESTION_TYPE = '4' 
				THEN 'LEFT JOIN (SELECT SURVEY_RESULT_ID, SURVEY_DETAIL_OPTION_ID, SELECTED_OPTION_VALUE FROM SURVEY_RESULT_DETAIL WHERE SURVEY_DETAIL_ID = ' + CAST(sd.SURVEY_DETAIL_ID AS nvarchar(10)) + ' AND SURVEY_DETAIL_OPTION_ID = '+ CAST(sdo.SURVEY_DETAIL_OPTION_ID AS nvarchar(10)) +') Q'+ CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10)) +'_' + CAST(sdo.SURVEY_DETAIL_OPTION_ID AS nvarchar(10)) +' on s.SURVEY_RESULT_ID = Q'+ CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10)) +'_' + CAST(sdo.SURVEY_DETAIL_OPTION_ID AS nvarchar(10)) +'.SURVEY_RESULT_ID'
				ELSE 'LEFT JOIN (SELECT SURVEY_RESULT_ID, SURVEY_DETAIL_OPTION_ID, SELECTED_OPTION_VALUE FROM SURVEY_RESULT_DETAIL WHERE SURVEY_DETAIL_ID = ' + CAST(sd.SURVEY_DETAIL_ID AS nvarchar(10)) + ') Q'+ CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10)) +' on s.SURVEY_RESULT_ID = Q' + CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10)) + '.SURVEY_RESULT_ID'
			END JOIN_Part	
		FROM
		SURVEY s
		LEFT JOIN SURVEY_DETAIL sd ON s.SURVEY_ID = sd.SURVEY_ID
		LEFT JOIN SURVEY_DETAIL_OPTION sdo ON sd.SURVEY_DETAIL_ID = sdo.SURVEY_DETAIL_ID
		WHERE s.SURVEY_ID = @SURVEY_ID
	) tmp
	ORDER BY SURVEY_DETAIL_SEQ, OptKey



	DECLARE Cursor_tmp CURSOR FOR 
		SELECT SURVEY_DETAIL_SEQ, COL_Part, JOIN_Part
        FROM #TMP_SU04
		ORDER BY SURVEY_DETAIL_SEQ, OptKey
	
 
	OPEN Cursor_tmp
	FETCH NEXT FROM Cursor_tmp INTO @SurveyDetailSeq,@ColumnPart,@JoinPart
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @ColumnFull = @ColumnFull + ' ' +  @ColumnPart;
		SET @JoinFull = @JoinFull + ' ' + @JoinPart;
 
		FETCH NEXT FROM Cursor_tmp INTO  @SurveyDetailSeq,@ColumnPart,@JoinPart
	END      
	CLOSE Cursor_tmp
	DEALLOCATE Cursor_tmp


	SET @FullSQL = 'SELECT CONVERT(NVARCHAR(19), s.CR_DT, 121) CR_DT ' + @ColumnFull + ' FROM SURVEY_RESULT s ' + @JoinFull + ' WHERE s.SURVEY_ID = ' + CAST(@SURVEY_ID AS nvarchar(10));

	--PRINT('@ColumnFull: ' + @ColumnFull);
	--PRINT('@JoinFull: ' + @JoinFull);
	--PRINT('@FullSQL: ' + @FullSQL);

	EXEC sp_executesql @FullSQL;


	
	SELECT
		DISTINCT 
		sd.SURVEY_DETAIL_SEQ,
		CASE WHEN sd.QUESTION_TYPE = '4' 
			THEN 'Q' + CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10)) + ' - [' + sdo.OPTION_VALUE + ']'
			ELSE 'Q' + CAST(sd.SURVEY_DETAIL_SEQ AS nvarchar(10))
		END COL_Part
	FROM
		SURVEY s
		LEFT JOIN SURVEY_DETAIL sd ON s.SURVEY_ID = sd.SURVEY_ID
		LEFT JOIN SURVEY_DETAIL_OPTION sdo ON sd.SURVEY_DETAIL_ID = sdo.SURVEY_DETAIL_ID
	WHERE s.SURVEY_ID = @SURVEY_ID;






/*	
	SELECT DISTINCT 
		SU.SURVEY_ID,
		SU.PROJECT_ID,
		SUD.QUESTION,SUD.QUESTION_TYPE,SUD.SURVEY_DETAIL_SEQ,
		SDO.SURVEY_DETAIL_OPTION_ID,
		SDO.OPTION_VALUE,
		SRD.SURVEY_RESULT_DETAIL_ID,
		SRD.SELECTED_OPTION_VALUE,
		SRD.CR_DT,
		SR.SURVEY_RESULT_ID,
		SUD.SURVEY_DETAIL_ID
	FROM  
		SURVEY_DETAIL_OPTION SDO 
		LEFT JOIN SURVEY_DETAIL SUD ON SDO.SURVEY_DETAIL_ID=SUD.SURVEY_DETAIL_ID
		LEFT JOIN SURVEY SU ON SU.SURVEY_ID=SUD.SURVEY_ID AND  SU.SURVEY_ID=@SURVEY_ID AND  SU.PROJECT_ID=@PROJECT_ID
                                                                 AND SU.SURVEY_ID IS NOT NULL  AND  SU.PROJECT_ID IS NOT NULL 
                                                                  AND SU.SURVEY_ID <>''  AND  SU.PROJECT_ID <>''
		LEFT JOIN SURVEY_RESULT SR ON SU.SURVEY_ID=SR.SURVEY_ID 
               LEFT JOIN SURVEY_RESULT_DETAIL SRD ON SR.SURVEY_RESULT_ID=SRD.SURVEY_RESULT_ID 
                                                     AND SRD.SURVEY_DETAIL_OPTION_ID=SDO.SURVEY_DETAIL_OPTION_ID
                                                     AND SRD.SELECTED_OPTION_VALUE IS NOT NULL 
    WHERE SU.SURVEY_ID  IN ( @SURVEY_ID )   ORDER BY SR.SURVEY_RESULT_ID ASC, SURVEY_DETAIL_SEQ ASC 

*/

END



GO
/****** Object:  StoredProcedure [dbo].[SP_SU04_GetSurveyList]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/**************************************************************************
*
* NAME        : SP_SU04_GetSurveyList
*
* VERSION     : 1.0
*
* DATE        : 14-09-2015
*
* DESCRIPTION : 
*
* PROCEDURE LIST:
*    PROCEDURE    SP_SU04_GetSurveyList
*    FUNCTION     
*
* MODIFICATION HISTORY
* NAME             DATE         DESCRIPTION
* ==========  =============  =======================================
* ADA.JIANG     16-09-2015    INITIAL VERSION.

**************************************************************************/

CREATE PROC [dbo].[SP_SU04_GetSurveyList]  
(
  @PROJECT_ID NVARCHAR(10)
)
  
AS BEGIN

	SELECT SURVEY_ID,SURVEY_NAME 
	FROM  SURVEY 
	WHERE PROJECT_ID=@PROJECT_ID

END


GO
/****** Object:  StoredProcedure [dbo].[SystemSetup]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log
-- #20151008 Modified by Tommyay on 2015-10-08 , Change the stored for new structure.

CREATE Procedure [dbo].[SystemSetup]
(
	@FN_ID varchar(10),
	@PARA_DESCR nvarchar(50),
	@PARA_KEY1 nvarchar(50),
	@VAL_FR nvarchar(50) Output

)
 
As

Declare @PARA_TYPE nvarchar(50);
set @PARA_TYPE ='DISPLAY_INFO';

  SELECT @FN_ID = FN_ID,
    @PARA_DESCR = PARA_DESCR,
	@PARA_KEY1 = PARA_KEY1,
    @VAL_FR = VAL_FR
  FROM [SYSTEM_SETUP] Where FN_ID = @FN_ID AND PARA_KEY1 = @PARA_KEY1 AND PARA_DESCR = @PARA_DESCR



Return
GO
/****** Object:  StoredProcedure [dbo].[TESTING]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TESTING]
	@SQL [nvarchar](4000)
WITH  EXECUTE AS CALLER
AS
BEGIN
	Declare @Final NVARCHAR(MAX)
	Set @Final = 'SELECT * INTO TEMP FROM ('
	Set @Final = @Final + @SQL + ') T'
	Exec (@Final)
END
GO
/****** Object:  StoredProcedure [dbo].[UnHoldFlatCar]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UnHoldFlatCar]
	@Project_ID [nvarchar](6),
	@FM_Select [nvarchar](1),
	@FM_Code [nvarchar](500),
	@FM_Last_Update_Date [nvarchar](30),
	@CP_Select [nvarchar](1),
	@CP_Code [nvarchar](80),
	@CP_Last_Update_Date [nvarchar](30),
	@Selection_Order [nvarchar](30),
	@Username [nvarchar](10),
	@Password [nvarchar](8),
	@Up_UID [nvarchar](10),
	@Up_FID [nvarchar](10),
	@Return_Status [int] OUTPUT
WITH  EXECUTE AS CALLER
AS
Declare @_code NVarChar(80)
	Declare @_deleted NVarChar(1)
	Declare @_expire_Date DateTime
	Declare @_have_Permission NVarChar(1)
	Declare @_password NVarChar(8)
	Declare @_position Int
	Declare @_status NVarChar(1)
	Declare @_update_Date NVarChar(30)
	Declare @_orig_status NChar(1)
	Declare @_select_status NChar(1)
	Declare @_dummy DateTime
	If (@FM_Code Is Not Null And @FM_Code <> N'') And (@FM_Select Is Not Null And @FM_Select = N'Y')
	Begin
		Select top(1) @_dummy = update_date, @_orig_status = org_status, @_select_status = status from 
		Flat_Selection where
		Project_ID = @Project_ID And 
		FM_Code = @FM_Code And 
		Up_UID = @Up_UID
		order by update_date desc
	
		If ((@_select_status Is Not Null) and (@_select_status <> N''))
		Begin
			If @_select_status = 'C'
			Begin
				Update Flat_Master
				Set FM_Status = @_orig_status
				Where Project_ID = @Project_ID And FM_Code = @FM_Code
					And Convert(NVarChar(30), Up_Dt, 121) = @FM_Last_Update_Date
				
				If @@RowCount = 0
				Begin
					Select @Return_Status = -1004  -- Unit Being Modified
					Return
				End
			
				Insert Into Flat_Selection
					(Project_ID, FM_Code, Selection_Order, Status, Update_Date, Up_UID, Up_FID)
				Values
					(@Project_ID, @FM_Code, Null, N'U', GetDate(), @Up_UID, @Up_FID)

				If @@Error <> 0
				Begin
					Select @Return_Status = -1000  -- Select Unit Failed
					Return
				End

				Select @Return_Status = 1000  -- Unhold Unit Succeeded
				Return
			End
		End		
	End
	Else If (@CP_Code Is Not Null And @CP_Code <> N'') And (@CP_Select Is Not Null And @CP_Select = N'Y')
	Begin
		Select top(1) @_dummy = update_date, @_orig_status  = org_status, @_select_status = status from 
		Car_Park_Selection where
		Project_ID = @Project_ID And 
		CAR_PARK_ID = @CP_Code And 
		Up_UID = @Up_UID order by update_date desc
		
		If ((@_select_status Is Not Null) and (@_select_status <> 'N'))
		Begin
			If @_select_status = 'C'
			Begin
				Update Car_Park
				Set Status = @_orig_status
				Where Project_ID = @Project_ID And Car_Park_ID = @CP_Code
					And Convert(NVarChar(30), Up_Dt, 121) = @CP_Last_Update_Date

				If @@RowCount = 0
				Begin
					Select @Return_Status = -1503  -- Corresponding Car Park Begin Modified
					Return
				End

				Insert Into Car_Park_Selection
					(Project_ID, Car_Park_ID, Selection_Order, Status, Update_Date, Up_UID, Up_FID)
				Values
					(@Project_ID, @CP_Code, Null, N'U', GetDate(), @Up_UID, @Up_FID)

				If @@Error <> 0
				Begin
					Select @Return_Status = -1500  -- Select Corresponding Car Park Failed
					Return
				End	
				Select @Return_Status = 2000  -- Select Car Park Succeeded
				Return
			End
		End
	End
	Select @Return_Status = -9999  -- Select Car Park Succeeded
	Return


GO
/****** Object:  StoredProcedure [dbo].[Update_AM_PRICE_DETAIL]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[Update_AM_PRICE_DETAIL]
(
@AM_NO Nvarchar(20),
@Project_ID Nvarchar(6),
@FM_CP_CODE Nvarchar(MAX),
@FM_CP Nvarchar(MAX),
@ContractPrice Nvarchar(MAX),
@Update_UID Nvarchar(10),
@Update_FID Nvarchar(6),
@Delete Nvarchar(1)
)
  
As
Begin

	DECLARE @FM_CP_S NVARCHAR(MAX)
	DECLARE @Typepos INT
	DECLARE @FM_CP_CODE_S NVARCHAR(MAX)
	DECLARE @Codepos INT
	DECLARE @ContractPrice_S NVARCHAR(MAX)
	DECLARE @Priceepos INT

WHILE CHARINDEX(';', @FM_CP) > 0
	BEGIN
	-- Type ---
	SELECT @Typepos  = CHARINDEX(';', @FM_CP)  
	SELECT @FM_CP_S = SUBSTRING(@FM_CP, 1, @Typepos-1)
	SELECT @FM_CP = SUBSTRING(@FM_CP, @Typepos+1, LEN(@FM_CP)-@Typepos)
	-- Code ---
	SELECT @Codepos  = CHARINDEX(';', @FM_CP_CODE)  
	SELECT @FM_CP_CODE_S = SUBSTRING(@FM_CP_CODE, 1, @Codepos-1)
	SELECT @FM_CP_CODE = SUBSTRING(@FM_CP_CODE, @Codepos+1, LEN(@FM_CP_CODE)-@Codepos)
	-- Price ---
	SELECT @Priceepos  = CHARINDEX(';', @ContractPrice)  
	SELECT @ContractPrice_S = SUBSTRING(@ContractPrice, 1, @Priceepos-1)
	SELECT @ContractPrice = SUBSTRING(@ContractPrice, @Priceepos+1, LEN(@ContractPrice)-@Priceepos)

	if ((Select count(*) from AM_PRICE_DETAIL where PROJECT_ID=@Project_ID and FM_CP_CODE = @FM_CP_CODE_S and AM_NO = @AM_NO)>0)
	
	Begin
	Update  AM_PRICE_DETAIL
	Set  CONTRACT_PRICE = @ContractPrice_S, UP_DT = getDate() , UP_FID = @Update_FID , UP_UID = @Update_UID  where PROJECT_ID=@Project_ID and FM_CP_CODE = @FM_CP_CODE_S  and AM_NO = @AM_NO
	END

	Else
	Begin
		INSERT INTO [dbo].[AM_PRICE_DETAIL]
				   ([AM_NO]
				   ,[PROJECT_ID]
				   ,[FM_CP_CODE]
				   ,[FM_CP]
				   ,[CONTRACT_PRICE]
				   ,[CR_UID]
				   ,[CR_FID]
				   ,[CR_DT]
				   ,[UP_UID]
				   ,[UP_FID]
				   ,[UP_DT])
			 VALUES
				  (
				  @AM_NO,
				  @Project_ID,
				  @FM_CP_CODE_S,
				  @FM_CP_S,
				  Convert(int,@ContractPrice_S),
				  @Update_UID,
				  @Update_FID,
				  GETDATE(),
				  @Update_UID,
				  @Update_FID,
				  GETDATE()
				  )
			END
	END

	-- Last Data
	if ((Select count(*) from AM_PRICE_DETAIL where PROJECT_ID=@Project_ID and FM_CP_CODE = @FM_CP_CODE and AM_NO = @AM_NO)>0)
	
	Begin
	Update  AM_PRICE_DETAIL
	Set  CONTRACT_PRICE = @ContractPrice, UP_DT = getDate() , UP_FID = @Update_FID , UP_UID = @Update_UID  where PROJECT_ID=@Project_ID and FM_CP_CODE = @FM_CP_CODE  and AM_NO = @AM_NO
	END

	Else
	Begin
		INSERT INTO [dbo].[AM_PRICE_DETAIL]
				   ([AM_NO]
				   ,[PROJECT_ID]
				   ,[FM_CP_CODE]
				   ,[FM_CP]
				   ,[CONTRACT_PRICE]
				   ,[CR_UID]
				   ,[CR_FID]
				   ,[CR_DT]
				   ,[UP_UID]
				   ,[UP_FID]
				   ,[UP_DT])
			 VALUES
				  (
				  @AM_NO,
				  @Project_ID,
				  @FM_CP_CODE,
				  @FM_CP,
				Convert(int,@ContractPrice),
				  @Update_UID,
				  @Update_FID,
				  GETDATE(),
				  @Update_UID,
				  @Update_FID,
				  GETDATE()
				  )
		END
		IF (@Delete='T') 
		Begin
		Delete from AM_PRICE_DETAIL where PROJECT_ID = @Project_ID and AM_NO = @AM_NO
		END

END


GO
/****** Object:  StoredProcedure [dbo].[Update_Result_SEQ]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log

-- #20151019 Modified by Tommyay on 2015-10-19 , Change the stored for new structure.


CREATE Procedure [dbo].[Update_Result_SEQ](
		@REG_NO_DISPLAY nvarchar (max),
		@Seq nvarchar (max),
		@Project_ID nvarchar(10),
		@Ballot_POOL_No int,
		@Ballot_batch_id int ,
				@UP_UID nvarchar(10),
		@UP_FID nvarchar(10),
		@Result nvarchar(1) Output
)
 
As
BEGIN

declare @DT_REG_NO_DISPLAY nvarchar(20);

DEclare @BALLOT_POOL_REG_ID int;
Declare @No_of_Reg as int =0;
Declare @counter as int =1;
Declare @NewSeq as int ;

Select @No_of_Reg = Count(*) from Ballot_Pool_reg bpr join ballot_pool bp on bp.ballot_pool_id = bpr.ballot_pool_id 
where @Ballot_batch_id=ballot_batch_id and @Project_ID=Project_ID and bp.ballot_pool_status='I'


while (@counter <= @No_of_Reg )
Begin
		select @NewSeq=tmp3.RowValue,@DT_REG_NO_DISPLAY=tmp2.RowValue from (
		(
		select ROW_NUMBER() over (order by Rowindex asc)[rownumber], RowValue from SF_SplitTable(@REG_NO_DISPLAY)
		) tmp2  join(
		select ROW_NUMBER() over (order by Rowindex asc)[rownumber], RowValue from SF_SplitTable(@Seq)
		)tmp3 on tmp2.rownumber  = tmp3.rownumber
		)
		 where tmp2.rownumber =@counter
			


	select @BALLOT_POOL_REG_ID=bpr.ballot_pool_reg_id  from BALLOT_POOL_REG bpr 
		join BALLOT_BATCH bb on bb.BALLOT_BATCH_ID = bpr.BALLOT_BATCH_ID 
		join ballot_reg br on bpr.BALLOT_REG_ID=br.BALLOT_REG_ID
		join BALLOT_POOL bp on bpr.BALLOT_POOL_ID = bp.BALLOT_POOL_ID
			where bb.BALLOT_BATCH_ID = @Ballot_batch_id and bp.PROJECT_ID=@Project_ID and bp.BALLOT_POOL_NO = @Ballot_POOL_No and br.REG_NO_DISPLAY=@DT_REG_NO_DISPLAY

		if (@BALLOT_POOL_REG_ID is not null)
					Begin
					update BALLOT_POOL_REG
					set BALLOT_RESULT_SEQ=@NewSeq , ballot_reg_status='B' , UP_DT=getdate(), UP_UID=@UP_UID, UP_FID=@UP_FID where @BALLOT_POOL_REG_ID=BALLOT_POOL_REG_ID
					End

	set @counter = @counter+1			
	End

					update BALLOT_BATCH
					set BALLOT_BATCH_STATUS='E' , ATTN_STATUS='N' , UP_DT=getdate(), UP_UID=@UP_UID, UP_FID=@UP_FID
					 where @Ballot_batch_id=BALLOT_BATCH_ID
				
set @Result ='Y';
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateBallotTICKET_STATUS]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log
-- #20151004 Modified by Tommyay on 2015-10-04 , Change the stored for new structure.


CREATE Procedure [dbo].[UpdateBallotTICKET_STATUS]
(

	@TICKET_NO_DISPLAY nvarchar(20),
    @TICKET_STATUS nvarchar(1),
    @UP_UID NVarChar(10),
    @UP_FID NChar(10)
)
 
As
    Declare @SEQCount int;

    UPDATE _BALLOT_TICKET 
    Set TICKET_STATUS = @TICKET_STATUS,
    UP_UID =@UP_UID ,UP_FID = @UP_FID,
    UP_DT = GETDATE()
    Where  TICKET_NO_DISPLAY = @TICKET_NO_DISPLAY
	
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateBallotTICKET_STATUS_BA03]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log
-- #20151007 Modified by Tommyay on 2015-10-07 , Change the stored for new structure.

CREATE Procedure [dbo].[UpdateBallotTICKET_STATUS_BA03]
(

	@ballot_pool_reg_id nvarchar(20),
    @BALLOT_REG_STATUS nvarchar(1),
    @UP_UID NVarChar(10),
    @UP_FID NChar(10)
)
 
As
    Declare @SEQCount int;
	


    UPDATE BALLOT_POOL_REG
    Set BALLOT_REG_STATUS = @BALLOT_REG_STATUS,
    UP_UID =@UP_UID ,UP_FID = @UP_FID,
    UP_DT = GETDATE()
    Where  ballot_pool_reg_id = @ballot_pool_reg_id
	
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateCarPark]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCarPark]
	@car_park_id [nvarchar](80),
	@project_id [nvarchar](6),
	@park_list_price [nvarchar](13),
	@up_uid [nvarchar](10),
	@sales_type_code [nvarchar](6),
	@fm_code [nvarchar](500),
	@dist_code [nvarchar](6),
	@lf_code [nvarchar](6),
	@ana_code1 [nvarchar](6),
	@status [nvarchar](1),
	@deleted [nvarchar](1),
	@FuncID [nvarchar](10),
	@lfc_code [nvarchar](6),
	@Add_CarPark [nvarchar](1),
	@ana_code2 [nvarchar](6),
	@region_code [nvarchar](6),
	@BATCH_NO [int],
	@SALES_BATCH [nvarchar](10),
	@house_no [nvarchar](2),
	@park_level [nvarchar](7),
	@street_no [nvarchar](2),
	@str_code [nvarchar](6)
WITH  EXECUTE AS CALLER
AS
--BEGIN #20070214
	Declare @ana_group1 NVarChar(10)
	Declare @ana_group2 NVarChar(10)

	Select @ana_group1 = CP_ANA_GROUP1_ID, @ana_group2 = CP_ANA_GROUP2_ID From Project_Master where project_id = @project_id

	--END #20070214

	
	Update Car_park
	set PARK_LIST_PRICE = convert(numeric(12,2),@park_list_price),
	     UP_UID = @up_uid,
	     UP_DT = getdate(),
	     SALES_TYPE_CODE = @sales_type_code,
	     FM_CODE = @fm_code,
	     DIST_CODE = @dist_code,
	     REGION_CODE = @region_code,
	     LF_CODE = @lf_code,
	     LFC_CODE = @lfc_code,
	     STATUS = @status,
	     CAR_PARK_DELETED = @deleted,
	     UP_FID = @FuncID,
	     ADD_CAR_PARK_PRICE_BEFORE_ADJUST = @Add_CarPark,
		 BATCH_NO = @BATCH_NO,
		 PARK_LEVEL = @park_level,
		 HOUSE_NO = @house_no,
		 SALES_BATCH_CODE = @SALES_BATCH,
		 STREET_NO = @street_no,
		 STR_CODE = @str_code
	where CAR_PARK_ID = @car_park_id and
		    PROJECT_ID = @project_id

	if (isnull(@ana_code1,N'-') <> N'-' or len(@ana_code1) >0 ) or (isnull(@ana_code2,N'-') <> N'-' or len(@ana_code2) >0 )
		begin

			delete FM_CP_ANALYSIS_CODE 
			where FM_CP_CODE = @car_park_id and
				    PROJECT_ID = @project_id
			
			if upper(@deleted) <> 'Y' and (isnull(@ana_code1,N'-') <> N'-' or len(@ana_code1) >0 )
			begin 
				insert FM_CP_ANALYSIS_CODE
			 	(PROJECT_ID, FM_CP_CODE, ANA_ID, ANA_GROUP_ID, FLAT_CP, UP_DT, UP_UID, UP_FID)
				values (@project_id, @car_park_id,@ana_code1,@ana_group1,N'C', getdate(), @up_uid, @FuncID )
			end
			
			if upper(@deleted) <> 'Y' and (isnull(@ana_code2,N'-') <> N'-' or len(@ana_code2) >0 )
			begin 
				insert FM_CP_ANALYSIS_CODE
			 	(PROJECT_ID, FM_CP_CODE, ANA_ID, ANA_GROUP_ID, FLAT_CP, UP_DT, UP_UID, UP_FID)
				values (@project_id, @car_park_id,@ana_code2,@ana_group2,N'C', getdate(), @up_uid, @FuncID )
			end
		end
Return 0


GO
/****** Object:  StoredProcedure [dbo].[UpdateDisplayInfo]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[UpdateDisplayInfo] (
	@function_id VarChar(10), 
	@para_type NVarChar(50), 
	@para_descr NVarChar(50), 
	@para_key1 NVarChar(50),
	@val_fr NVarChar(50))

 
As
	
	begin
		update system_setup set
		val_fr = @val_fr
		where fn_id = @function_id
		and para_type = @para_type
		and para_descr = @para_descr	
		and para_key1 = @para_key1	

	end	

GO
/****** Object:  StoredProcedure [dbo].[UpdateDisplayInfoDetails]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[UpdateDisplayInfoDetails] (
	@function_id VarChar(10), 
	@para_type NVarChar(50), 
	@para_descr NVarChar(50), 
	@para_key1 NVarChar(50), 
	@para_key2 NVarChar(50), 
	@val_fr NVarChar(50),
	@num_fr numeric(18,2)
)

 
As

Declare @isExist int

	
	begin
		
		insert into system_setup_dtl
		(fn_id, para_type, para_descr, para_key1, para_key2, val_fr, num_fr)
		values 
		(@function_id, @para_type, @para_descr, @para_key1, @para_key2, @val_fr, @num_fr)
		

	end	

GO
/****** Object:  StoredProcedure [dbo].[UpdateFirstReceipt]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
' Modification Log:
' #20100816 - Modified by CAHON on 2010-08-16, Ensure Joint Buyer Concatenated in Sequence
' #20110831 - Modified by CLKUAN on 2011-08-31, Change size of GIVEN_NAME from 50 to 100
*/
CREATE Procedure [dbo].[UpdateFirstReceipt]
(	
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	--@Transact_Seq NVarChar(2000),
	@User_ID NVarChar(10),
	@Sales_Office_Code NVarChar(6),
	@UP_FID NVarChar(10)
)
 
As
	Declare @Paid_Seq numeric(18,0)
	Declare @Paid_Seq_All NVarChar(100)
	Declare @Receipt_No numeric(8,0)
	Declare @Tran_Num numeric(3,0)
	Declare @Buyer_Surname NVarChar(50)
	-- BEGIN #20110831
	Declare @Buyer_Given_Name NVarChar(100)
	-- END #20110831
	Declare @Moa_Co_Name NVarChar(50)
	Declare @Joint_Buyer NVarChar(400)
	Declare @Surname NVarChar(50)
	-- BEGIN #20110831
	Declare @Given_Name NVarChar(50)
	-- END #20110831
	Declare @MinReceiptNo numeric(8,0)
	Declare @Transact_Date Datetime
	
	Declare PS_Cursor Cursor For

	Select Distinct Paid_Seq
	From AM_PAYMENT_FU_TRANS
	Where AM_NO = @MOA_NO And PROJECT_ID = @Project_ID 


	Select @Tran_Num = 0
	Select @Paid_Seq_All = ''

	Open PS_Cursor 

	Fetch Next From PS_Cursor 
	Into @Paid_Seq

	While @@Fetch_Status = 0
	Begin

		If @Paid_Seq_All <> N''
		Begin
			Select @Paid_Seq_All = @Paid_Seq_All + N', '
		End

		Select @Paid_Seq_All = @Paid_Seq_All +  Convert (Nvarchar(100), @Paid_Seq)

		Fetch Next From PS_Cursor 
		Into @Paid_seq
		
		Select @Tran_Num = @Tran_Num + 1
	End

	Close PS_Cursor 
	Deallocate PS_Cursor 


	SELECT 
		@BUYER_SURNAME = CHI_NAME, @BUYER_GIVEN_NAME = ENG_NAME, @TRANSACT_DATE = AM_DT
	FROM
		AM_BASE AB
		INNER JOIN AM_BUYER ABU ON AB.PROJECT_ID = ABU.PROJECT_ID AND AB.AM_NO = ABU.AM_NO
	WHERE 
		AB.PROJECT_ID = @Project_ID
		AND AB.AM_NO = @MOA_No
		AND ABU.BUYER_TYPE = 'P'
		AND ABU.BUYER_SEQ = 1

	SELECT 
		@MOA_CO_NAME = CHI_NAME + ' ' + ENG_NAME
	FROM
		AM_BUYER
	WHERE
		PROJECT_ID = @Project_ID
		AND AM_NO = @MOA_No
		AND BUYER_TYPE = 'C'
		AND BUYER_SEQ = 1


	Select @Joint_Buyer = N''
	
	--BEGIN #20100816
	Declare JB_Cursor Cursor For
	SELECT 
		CHI_NAME, ENG_NAME
	FROM
		AM_BUYER
	WHERE
		PROJECT_ID = @Project_ID
		AND AM_NO = @MOA_No
		AND BUYER_TYPE = 'P'
		AND BUYER_SEQ > 1
	ORDER BY BUYER_SEQ

	--END #20100816

	Open JB_Cursor 

	Fetch Next From JB_Cursor 
	Into @Surname, @Given_name

	While @@Fetch_Status = 0
	Begin
		If @Joint_Buyer <> N''
		Begin
			Select @Joint_Buyer = @Joint_Buyer + N', '
		End

		-- BEGIN #20120808
		--Select @Joint_Buyer = @Joint_Buyer +  @Surname + ' ' + @Given_name
		Select @Joint_Buyer = ISNULL(@Joint_Buyer,'') +  ISNULL(@Surname,'') + ' ' + ISNULL(@Given_name,'')
		-- BEGIN #20120808

		Fetch Next From JB_Cursor 
		Into @Surname, @Given_name
	End

	Close JB_Cursor 
	Deallocate JB_Cursor 


	If @Tran_Num>0
	BEGIN

		--Select @Receipt_No = IsNull(Max(Receipt_NO), 0) + 1
		--From Receipt
		--Where Project_ID = @Project_ID
	
		Select @MinReceiptNo = MIN(receipt_no) from RECEIPT
		Where Project_Id = @Project_ID and Moa_No = @MOA_No
	
		Update RECEIPT
		Set PROJECT_ID = @Project_ID, 
			MOA_NO = @MOA_No,
			RECEIPT_TYPE = N'P',
			RECEIPT_DATA = @Paid_Seq_All,
			SALES_OFFICE_CODE = @Sales_Office_Code,
			[UID] = @User_ID,
			Cr_Dt = Convert(DateTime, GetDate(), 103),
			BUYER_SURNAME = @Buyer_Surname,
			BUYER_GIVEN_NAME = @Buyer_Given_Name,
			MOA_CO_NAME = @Moa_Co_Name,
			JOINT_BUYER = @Joint_Buyer,
			[STATUS] = 'I',
			UP_UID = @User_ID,
			UP_FID = @UP_FID,
			UP_DT = GETDATE(),
			TRANSACT_DATE = @Transact_Date
		Where Project_Id = @Project_ID and Moa_No = @MOA_No and RECEIPT_NO = @MinReceiptNo
		

		--BEGIN #20070208_2
		--Update Receipt
		--	Set Status = 'V', UP_UID = @User_ID, UP_FID = @UP_FID, Up_dt = getdate()
		--	Where Project_Id = @Project_ID and Moa_No = @MOA_No

		--Insert Into Receipt
		--	(Project_ID, MOA_No, Receipt_NO, Receipt_Type, Receipt_Data, Sales_Office_Code, UID, 
		--	Cr_Dt, Buyer_Surname, Buyer_Given_Name, Moa_Co_Name, 
		--	Joint_Buyer, Status, Up_UID, UP_Fid, UP_dt)
		--Values
		--	(@Project_ID, @MOA_No, @Receipt_No, N'P', @Paid_Seq_All, @Sales_Office_Code, @User_ID, 
		--	Convert(DateTime, GetDate(), 103), @Buyer_Surname, @Buyer_Given_Name, @Moa_Co_Name, 
		--	@Joint_Buyer, 'I', @User_ID, @UP_FID, getDate())
		--END #20070208_2
	END


Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateFlat]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFlat]
	@fm_code [nvarchar](500),
	@project_id [nvarchar](6),
	@fm_floor_seq [int],
	@lf_code [nvarchar](6),
	@dist_code [nvarchar](6),
	@sales_type_code [nvarchar](6),
	@fm_list_price [nvarchar](15),
	@fm_other1 [nvarchar](13),
	@fm_other2 [nvarchar](20),
	@fm_remark [nvarchar](100),
	@up_uid [nvarchar](10),
	@fm_status [nvarchar](1),
	@fm_deleted [nvarchar](1),
	@FuncID [nvarchar](10),
	@lfc_code [nvarchar](6),
	@adj_type [char](1),
	@adj_unit [char](1),
	@adj [numeric](12, 2),
	@region_code [nvarchar](6),
	@fm_gr_area_sm [nvarchar](13),
	@fm_saleable [nvarchar](13),
	@fm_usable_sm [nvarchar](13),
	@fm_gr_area_sf [nvarchar](13),
	@fm_usable_sf [nvarchar](13),
	@fm_baywindow_sm [nvarchar](13),
	@fm_balcony_sm [nvarchar](13),
	@fm_verandah_sm [nvarchar](13),
	@fm_terrace_sm [nvarchar](13),
	@fm_platform_sm [nvarchar](13),
	@fm_workplatform_sm [nvarchar](13),
	@fm_cockloft_sm [nvarchar](13),
	@fm_roof_sm [nvarchar](13),
	@fm_stairhood_sm [nvarchar](13),
	@fm_acroom_sm [nvarchar](13),
	@fm_garden_sm [nvarchar](13),
	@fm_yard_sm [nvarchar](13),
	@fm_parking_sm [nvarchar](13),
	@fm_baywindow_sf [nvarchar](13),
	@fm_balcony_sf [nvarchar](13),
	@fm_verandah_sf [nvarchar](13),
	@fm_terrace_sf [nvarchar](13),
	@fm_platform_sf [nvarchar](13),
	@fm_workplatform_sf [nvarchar](13),
	@fm_cockloft_sf [nvarchar](13),
	@fm_roof_sf [nvarchar](13),
	@fm_stairhood_sf [nvarchar](13),
	@fm_acroom_sf [nvarchar](13),
	@fm_garden_sf [nvarchar](13),
	@fm_yard_sf [nvarchar](13),
	@fm_parking_sf [nvarchar](13),
	@BATCH_NO [int],
	@EFFECT_DATE [datetime],
	@SALES_BATCH [nvarchar](10),
	@DUPLEX [char](1)
WITH  EXECUTE AS CALLER
AS
-- exec master..xp_ASL '[weKDisnmvie)}6&'
	Declare @Adj_no Int
	Declare @org_price numeric(12,2)

	Begin Transaction AddTransaction
	/*SET QUOTED_IDENTIFIER OFF 
	SET ANSI_NULLS ON 
	SET NOCOUNT ON
	SET ANSI_WARNINGS OFF
	SET CONCAT_NULL_YIELDS_NULL OFF*/

	--BEGIN #20070306
	Select @org_price = fm_list_price From Flat_Master Where FM_CODE = @fm_code and PROJECT_ID = @project_id
	--END #20070306
	

	Update FLAT_MASTER
	set 
		FM_FLOOR_SEQ = @fm_floor_seq,
		DIST_CODE = @dist_code,
		REGION_CODE = @region_code,
		LF_CODE = @lf_code,
		LFC_CODE = @lfc_code,
		SALES_TYPE_CODE = @sales_type_code,
   		FM_LIST_PRICE = ISNULL(convert(numeric(12,2),@fm_list_price), FM_LIST_PRICE),
		FM_OTHER1 = @fm_other1,
		FM_OTHER2 = @fm_other2,
		FM_RMK = @fm_remark,
		UP_UID = @up_uid,
		UP_DT = getdate(),
		FM_DELETED = @fm_deleted,
		FM_STATUS = @fm_status,
		UP_FID = @FuncID,
		ADJ_TYPE = @adj_type,
		ADJ_UNIT = @adj_unit,
		ADJ = @adj,
		FM_GR_AREA_SM = @fm_gr_area_sm,
		FM_USABLE_SM = @fm_usable_sm, 
		FM_GR_AREA_SF = @fm_gr_area_sf,
		FM_USABLE_SF = @fm_usable_sf, 
		FM_BAY_WIN_SM = @fm_baywindow_sm, 
		FM_BALCONY_SM = @fm_balcony_sm, 
		FM_VERANDAH_SM = @fm_verandah_sm, 
		FM_TERRACE_SM = @fm_terrace_sm, 
		FM_PLATFORM_SM = @fm_platform_sm, 
		FM_WORK_PF_SM = @fm_workplatform_sm, 
		FM_COCKLOFT_SM = @fm_cockloft_sm, 
		FM_ROOF_SM = @fm_roof_sm, 
		FM_STAIRHOOD_SM = @fm_stairhood_sm, 
		FM_AC_ROOM_SM = @fm_acroom_sm, 
		FM_GARDEN_SM = @fm_garden_sm, 
		FM_YARD_SM = @fm_yard_sm, 
		FM_PARKING_SM = @fm_parking_sm, 
		FM_BAY_WIN_SF = @fm_baywindow_sf, 
		FM_BALCONY_SF = @fm_balcony_sf, 
		FM_VERANDAH_SF = @fm_verandah_sf, 
		FM_TERRACE_SF = @fm_terrace_sf, 
		FM_PLATFORM_SF = @fm_platform_sf, 
		FM_WORK_PF_SF = @fm_workplatform_sf, 
		FM_COCKLOFT_SF = @fm_cockloft_sf, 
		FM_ROOF_SF = @fm_roof_sf, 
		FM_STAIRHOOD_SF = @fm_stairhood_sf, 
		FM_AC_ROOM_SF = @fm_acroom_sf, 
		FM_GARDEN_SF = @fm_garden_sf, 
		FM_YARD_SF = @fm_yard_sf, 
		FM_PARKING_SF = @fm_parking_sf,
		BATCH_NO = @BATCH_NO,
		EFFECT_DATE = @EFFECT_DATE,
		SALES_BATCH_CODE = @SALES_BATCH,
		DUPLEX_DIRECTION = @DUPLEX
	where FM_CODE = @fm_code and
		    PROJECT_ID = @project_id
	
	--BEGIN #20070306
	If @fm_list_price <> @org_price 
	Begin
		select @Adj_no = isnull(max(adj_no),0)+1 from flat_price_audit where project_id = @project_id and fm_code = @fm_code
		
		insert into flat_price_audit
		(
			project_id, fm_code, adj_no, org_price, new_price, 
			adj_type, adj_unit, adj, 
			up_fid, up_uid, up_dt
		)
		values
		(
			@project_id, @fm_code, @Adj_no, @org_price, @fm_list_price, 
			@adj_type, @adj_unit, convert(numeric(12,2),@adj), 
			@FuncID, @up_uid, getdate() 
		)
	End
	--END #20070306

	If @@error <> 0
	Begin
		Rollback Transaction AddTransaction
		RaisError (N'Unit Creation Failed', 16, 1)
		Return 99
	End
	
	Commit Transaction AddTransaction
Return 0




GO
/****** Object:  StoredProcedure [dbo].[UpdateFlatPrice]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFlatPrice]
	@project_id [nvarchar](6),
	@fm_code [nvarchar](80),
	@adj_type [char](1),
	@adj_unit [char](1),
	@adj [numeric](12, 2),
	@view_time [varchar](25),
	@up_uid [nvarchar](10),
	@up_fid [nvarchar](10),
	@returnStatus [int] OUTPUT
WITH  EXECUTE AS CALLER
AS
Declare @Adj_no Int
	Declare @gfa numeric(9,3)
	Declare @orgListPrice numeric(12,2)
	Declare @adjListPrice numeric(12,2)
	Declare @lastUpDt datetime
	Declare @status nchar(1)

	

	Select @orgListPrice = Fm_List_Price, @gfa = FM_GR_AREA_SF, @status = FM_Status  From Flat_Master Where Fm_Code = @fm_code and Project_Id = @project_id 
	
	If @status = 'P' Or @status = 'S'
		BEGIN
			SET @returnStatus = -6 	-- Error: unit selected or sold
			Return
		END

	If @orgListPrice Is Null 
		BEGIN
			SET @returnStatus = -1 	-- Error: Null Price
			Return
		END

	If @gfa Is Null 
		BEGIN
			SET @returnStatus = -2 	-- Error: Null GFA
			Return
		END

	If @gfa = 0 
		BEGIN
			SET @returnStatus = -3 	-- Error: Zero GFA
			Return
		END

	If @adj_type = 'P'
		BEGIN
			/****** Unit Price Adjustment ******/
			
			If @adj_unit = 'P'
				/*** % Adj ***/
				Select @adjListPrice = @orgListPrice * (1+(@adj/100))
			Else If @adj_unit = 'R'
				Select @adjListPrice = @adj
			Else
				/*** $ Adj ***/
				Select @adjListPrice = @orgListPrice + @adj
		END 
			
	Else
		BEGIN 
															
			/****** Unit Rate Adjustment ******/
			If @adj_unit = 'P' 
					/*** % Adj ***/
					Select @adjListPrice = @gfa * ((@orgListPrice/@gfa) * (1 + (@adj/100)))			
			Else
					/*** $ Adj ***/
					Select @adjListPrice = @gfa * ((@orgListPrice/@gfa) + @adj)			
		END
	

	--Select @lastUpDt = Up_Dt From Flat_Master Where Fm_Code = @fm_code and Project_Id = @project_id  

	
	--If @lastUpDt >  convert(Datetime, @view_time, 126)
	--	BEGIN
	--		Select @returnStatus = -4 	-- Error: Unit Updated By Others
	--		Return
	--	END

	Update FLAT_MASTER
		Set FM_LIST_PRICE = Round(@adjListPrice,0),
			UP_UID = @up_uid,
			UP_DT = getdate(),
			UP_FID = @up_fid
		Where Fm_Code = @fm_code and Project_Id = @project_id 



	Select @Adj_no = (isnull(max(adj_no),0)+1) From FLAT_PRICE_AUDIT Where Fm_Code = @fm_code and Project_Id = @project_id  

	Insert Into FLAT_PRICE_AUDIT
		(Project_Id, Fm_Code, Adj_No, Org_Price, New_Price, Adj_Type,
		Adj_Unit, Adj, Up_Fid, Up_Uid, Up_Dt
		)
	Values
		(@project_id, @fm_code, @Adj_no, @orgListPrice, Round(@adjListPrice, 0), @adj_type,
		@adj_unit, @adj, @up_fid, @up_uid, getdate() 
		)
	

	If @@error <> 0
		BEGIN
			Rollback Transaction
			Select @returnStatus = -5
			Return 			-- Error: Update Insert Error
		END

Select @returnStatus = 0	
Return 		-- Successful


GO
/****** Object:  StoredProcedure [dbo].[UpdateFormal]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[UpdateFormal]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Intention NVarChar(1),
	@Type NVarChar(1),
	@F_Agreement_Dt NVarchar(10),
	@Cont_Person NVarChar(616),
	@Country_Code NVarChar(6),
	@Buyer_ID NVarChar(20),
	@Surname NVarchar(50),
	-- BEGIN #20110830
	@Given_name NVarchar(100),
	-- END #20110830
	@ID_Type NVarChar(1),
	@ID_Is_Iden NVarchar(1),	
	@Gender NVarchar(1),
	@Nat_Code NVarChar(6),
	@Co_Name NVarchar(50),
	@BRN NVarChar(30),
	@Director_Surname1 NVarChar(50),
	-- BEGIN #20110830
	@Director_Given_Name1 NVarChar(100),
	-- END #20110830
	@Director_ID1 NVarChar(20),
	@Director_ID_Type1 NVarChar(1),
	@Director_Gender1 NVarChar(1),
	@Director_ID_Is_Iden1 NVarchar(1),
	@Director_Nat_Code1 NVarChar(6),
	@Director_Surname2  NVarChar(50),
	-- BEGIN #20110830
	@Director_Given_Name2 NVarChar(100),
	-- END #20110830
	@Director_ID2 NVarChar(20),
	@Director_ID_Type2 NChar(1),	
	@Director_Gender2 NVarChar(1),
	@Director_ID_Is_Iden2 NVarchar(1),
	@Director_Nat_Code2 NVarChar(6),
	@Add1 NVarChar(50),
	@Add2 NVarChar(50),
	@Add3 NVarChar(50),
	@Add4 NVarChar(50),
	@Dist_Code NVarChar(6),
	@Tel_No NVarChar(20),
	@Off_Tel NVarChar(20),
	@Mobile NVarChar(20),
	@Fax NVarChar(20),
	@Email NVarChar(50),	
	@Region_Code NVarchar(6),
	@Remarks NVarChar(500),
	@UserID NVarchar(10),
	@Formal_Seq Int,
	@MaritalStatus NVarchar(1),
	@D1MaritalStatus NVarchar(1),
	@D2MaritalStatus NVarchar(1),
	@PropertySystem NVarChar(1),
	@D1PropertySystem NVarChar(1),
	@D2PropertySystem NVarChar(1),
	@isAdult NVARCHAR(1),
	@Spouse NVARCHAR(50),
	@Director_isAdult1 NVARCHAR(1),
	@Director_isAdult2 NVARCHAR(1),
	@Director_Spouse1 NVARCHAR(50),
	@Director_Spouse2 NVARCHAR(50)
)
 
As
	exec master..xp_ASL '[weKDisnmvie)}6&'


	Declare @F_Agreement_Date DateTime		
	
	If @F_Agreement_Dt is not null
	Begin
		Select @F_Agreement_Date = Convert(datetime, @F_Agreement_Dt, 105)
	End
	Else
	Begin
		Select @F_Agreement_Date = Convert(datetime, GETDATE(), 105)
	End
	

	Update MOA_FORMAL
	Set FORMAL_DATE = @F_Agreement_Date, TYPE = @Type, BUYER_ID = @Buyer_ID, SURNAME = @Surname, GIVEN_NAME = @Given_name,
		ID_TYPE = @ID_Type, BUYER_ID_IS_IDEN = @ID_Is_Iden, GENDER = @Gender, NAT_CODE = @Nat_Code, CONT_PERSON = @Cont_Person,
		DIRECTOR_SURNAME1 = @Director_Surname1, DIRECTOR_GIVEN_NAME1 = @Director_Given_Name1, DIRECTOR_ID1 = @Director_ID1,
		DIRECTOR_ID_TYPE1 = @Director_ID_Type1, DIRECTOR_ID_IS_IDEN1 = @Director_ID_Is_Iden1, DIRECTOR_GENDER1 = @Director_Gender1,
		DIRECTOR_NAT_CODE1 = @Director_Nat_Code1, DIRECTOR_SURNAME2 = @Director_Surname2, DIRECTOR_GIVEN_NAME2 = @Director_Given_Name2,
		DIRECTOR_ID2 = @Director_ID2, DIRECTOR_ID_TYPE2 = @Director_ID_Type2, DIRECTOR_ID_IS_IDEN2 = @Director_ID_Is_Iden2,
		DIRECTOR_GENDER2 = @Director_Gender2, DIRECTOR_NAT_CODE2 = @Director_Nat_Code2, CO_NAME = @Co_Name, BRN = @BRN,
		ADD1 = @Add1, ADD2 = @Add2, ADD3 = @Add3, ADD4 = @Add4, REGION_CODE = @Region_Code, DIST_CODE= @Dist_Code,
		COUNTRY_CODE = @Country_Code, TEL_NO = @Tel_No, OFF_TEL = @Off_Tel, MOBILE = @Mobile, FAX = @Fax, EMAIL = @Email,
		INTENTION = @Intention, REMARKS = @Remarks, UP_UID = @UserID, UP_FID = 'FM0107', UP_DT = GETDATE(), MARITAL_STATUS = @MaritalStatus,
		DIRECTOR_MARITAL_STATUS1 = @D1MaritalStatus, DIRECTOR_MARITAL_STATUS2 = @D2MaritalStatus,
		PROPERTY_SYSTEM = @PropertySystem, DIRECTOR_PROPERTY_SYSTEM1 = @D1PropertySystem, DIRECTOR_PROPERTY_SYSTEM2 = @D2PropertySystem,
		ISADULT = @isAdult, SPOUSE = @Spouse, DIRECTOR_ISADULT1 = @Director_isAdult1, DIRECTOR_ISADULT2 = @Director_isAdult2,
		DIRECTOR_SPOUSE1 = @Director_Spouse1, DIRECTOR_SPOUSE2 = @Director_Spouse2
	Where MOA_NO = @MOA_No And PROJECT_ID = @Project_ID And FORMAL_SEQ = @Formal_Seq												
		
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateFormalJointBuyer]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[UpdateFormalJointBuyer]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Joint_Buyer_Surname NVarChar(50),
	-- BEGIN #20110830
	@Joint_Buyer_Given_Name NVarChar(100),
	-- END #20110830
	@Joint_Buyer_Gender NVarChar(1),
	@Joint_Buyer_ID NVarChar(20),
	@Joint_Buyer_ID_Type NVarChar(1),
	@Joint_Buyer_Date_Of_Birth NVarChar(10),
	@Joint_Buyer_Nationality NVarChar(6),
	@Formal_Seq NVarChar(3),
	@ID_IS_IDEN NVarChar(1),
	@MaritalStatus NVarchar(1),
	@UserID	NVarChar(10),
	@PropertySystem NVarChar(1),
	@ISADULT NVARCHAR(1),
	@SPOUSE NVARCHAR(50)
)
 
As
	Delete From MOA_FORMAL_JOINT_BUYER
	Where MOA_No = @MOA_No And Project_ID = @Project_ID And Formal_Seq=@Formal_Seq And J_BUYER_ID = @Joint_Buyer_ID

	Insert Into MOA_FORMAL_JOINT_BUYER
		(MOA_No, Project_ID, Formal_Seq, J_Buyer_ID, Surname, Given_Name, ID_Type, Buyer_DOB, Gender, Nat_Code, ID_IS_IDEN,
		MARITAL_STATUS, PROPERTY_SYSTEM, UP_DT, UP_UID, UP_FID, ISADULT, SPOUSE)
	Values
		(@MOA_No, @Project_ID, Convert(Numeric(3,0), @Formal_Seq), @Joint_Buyer_ID, @Joint_Buyer_Surname, @Joint_Buyer_Given_Name,
		Convert(NChar(1), @Joint_Buyer_ID_Type), Convert(DateTime, @Joint_Buyer_Date_Of_Birth, 103),
		Convert(NChar(1), @Joint_Buyer_Gender), @Joint_Buyer_Nationality, @ID_IS_IDEN, @MaritalStatus, @PropertySystem,
		GETDATE(), @UserID, 'FM0107', @ISADULT, @SPOUSE)
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateFreezeStatus]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFreezeStatus]
	@PROJECT_ID [nvarchar](10),
	@BALLOT_POOL_ID [int],
	@UP_FID [nvarchar](10),
	@UP_UID [nvarchar](10),
	@RESULT [nvarchar](1) OUTPUT
WITH  EXECUTE AS CALLER
AS
BEGIN
Declare @BallotRegVeri nvarchar(1);
DECLARE @REGCOUNT INT;
DECLARE @CHECKING BIT;
SET @RESULT='F';
SET @CHECKING=0;
SELECT * FROM BALLOT_POOL WHERE BALLOT_POOL_STATUS NOT IN ('B','I')
SELECT @BallotRegVeri = IS_BALLOT_VERIFY FROM PROJECT_MASTER WHERE @PROJECT_ID=PROJECT_ID
		if (@BallotRegVeri = 'Y')
		BEGIN
		SELECT @REGCOUNT=COUNT(*) FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID=@BALLOT_POOL_ID AND BALLOT_REG_STATUS NOT IN ('V','X')
		IF (@REGCOUNT>0)
		BEGIN
		SET @CHECKING=0;
		END
		ELSE
		BEGIN
		SET @CHECKING=1;
		END
		END
		ELSE
		BEGIN
		UPDATE BALLOT_POOL_REG
		SET BALLOT_REG_STATUS = 'V' , UP_DT=getdate(), UP_FID=@UP_FID,UP_UID=@UP_UID WHERE BALLOT_POOL_ID=@BALLOT_POOL_ID AND BALLOT_REG_STATUS ='N'
		SET @CHECKING=1;
		END
IF (@CHECKING=1)
BEGIN
update BALLOT_POOL set BALLOT_POOL_STATUS ='F' , UP_DT=getdate(), UP_FID=@UP_FID,UP_UID=@UP_UID where BALLOT_POOL_ID =@BALLOT_POOL_ID
SET @RESULT='Y';
END
ELSE
BEGIN
SET @RESULT='F';
END
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateFunctionProfile]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[UpdateFunctionProfile]
(
	@function_id varchar(10),
	@access numeric(1)
)
 
As
	
	update function_profile set accesslevelcode = @access where fn_id = @function_id
	
return
GO
/****** Object:  StoredProcedure [dbo].[UpdateLawFirmScheduleHeader]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateLawFirmScheduleHeader]
(
	@Project_ID NVarChar(6),
	@LF_Code NVarChar(6),
	@Max_Appointment NVarChar(3)
)
 
As
	Update SNP_Schedule
	Set Max_Apt = Convert(Numeric(3), @Max_Appointment)
	Where LF_Code = @LF_Code And Project_ID = @Project_ID
Return 
GO
/****** Object:  StoredProcedure [dbo].[UpdateMOA]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateMOA]
	(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Purchaser_Intention NVarChar(1),
	@MOA_Date NVarChar(10),
	@MOA_Type NVarChar(1),
	@Purchaser_Surname NVarChar(50),
	-- BEGIN #20110829
	@Purchaser_Given_Name NVarChar(100),
	-- END #20110829
	@Purchaser_Gender NVarChar(1),
	@Purchaser_ID NVarChar(20),
	@Purchaser_ID_Type NVarChar(1),
	@Purchaser_Date_Of_Birth NVarChar(10),
	@Purchaser_Nationality NVarChar(6),
	@Company_Name NVarChar(50),
	@Business_Registration NVarChar(30),
	@Director1_Surname NVarChar(50),
	-- BEGIN #20110829
	@Director1_Given_Name NVarChar(100),
	-- END #20110829
	@Director1_Gender NVarChar(1),
	@Director1_ID NVarChar(20),
	@Director1_ID_Type NVarChar(1),
	@Director1_Date_Of_Birth NVarChar(10),
	@Director1_Nationality NVarChar(6),
	@Director2_Surname NVarChar(50),
	-- BEGIN #20110829
	@Director2_Given_Name NVarChar(100),
	-- END #20110829
	@Director2_Gender NVarChar(1),
	@Director2_ID NVarChar(20),
	@Director2_ID_Type NVarChar(1),
	@Director2_Date_Of_Birth NVarChar(10),
	@Director2_Nationality NVarChar(6),
	@Contact_Person NVarChar(616),
	@Address1 NVarChar(50),
	@Address2 NVarChar(50),
	@Address3 NVarChar(50),
	@District NVarChar(6),
	@Country NVarChar(6),
	@Office_Phone NVarChar(20),
	@Home_Phone NVarChar(20),
	@Mobile_Phone NVarChar(20),
	@Fax NVarChar(20),
	@Email NVarChar(50),
	@Analysis_District NVarChar(6),
	@LF_Code NVarChar(6),
	@SNP_Slot_Desc NVarChar(50),
	@SNP_Date NVarChar(10),
	@Agency NVarChar(6),
	@Agent_Name NVarChar(50),
	@Agent_ID NVarChar(20),
	@Agent_ID_Type NVarChar(1),
	@Agent_Phone NVarChar(20),
	@Remarks NVarChar(500),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@MOA_Tenant_Share NVarChar(1),
	@Purchaser_Tenant_Share NVarChar(50),
	@Company_Tenant_Share NVarChar(50),
	@Address4 NVarChar(50),
	@Area NVarChar(6),
	@Rmk1 NVarChar(200),
	@Rmk2 NVarChar(200),
	@Rmk3 NVarChar(200),
	@Rmk4 NVarChar(200),
	@Rmk5 NVarChar(200),
	@LFC_CODE NVarChar(6),
	@MODIFY_CONFIRM_MOA_UID NVarChar(10),
	@Region_Code NVarChar(6),
	@Purchaser_ID_Is_Iden NVarChar(1),
	@Director1_ID_Is_Iden NVarChar(1),
	@Director2_ID_Is_Iden NVarChar(1),
	@IgnorePostpone NVarChar(1),
	@PURCHASER_MS NVARCHAR(1),
	@PURCHASER_PS NVARCHAR(1),
	@Director1_MS NVARCHAR(1),
	@Director1_PS NVARCHAR(1),
	@Director2_MS NVARCHAR(1),
	@director2_PS NVARCHAR(1),
	@PURCHASER_IsAdult NVARCHAR(1),
	@PURCHASER_Spouse NVARCHAR(50),
	@DIRECTOR1_IsAdult NVARCHAR(1),
	@DIRECTOR1_Spouse NVARCHAR(50),
	@DIRECTOR2_IsAdult NVARCHAR(1),
	@DIRECTOR2_Spouse NVARCHAR(50)
)
 
As
	Declare @_MOA_Dt DateTime
	Declare @_SNP_Date DateTime
	Declare @_SNP_Date_Str NVarchar(10)
	Declare @_Method_Code NVarChar(6)
	Declare @_PY_PLAN_SEQ numeric(18,0)
	Declare @_PY_DT_CAL_TYPE NChar(1)
	Declare @_PY_DT_FACT nvarchar(500)
	Declare @_PY_DT_TYPE NChar(1)
	Declare @_Payment_Due NVarchar(10)
	Declare @_Relative_Date NVarchar(10)
	Declare @MinReceiptNo numeric(8,0)
	Declare @Return_Str NVARCHAR(20)
	Declare @Remain_Str NVARCHAR(100)
	Declare @SNP_Days int
	
	--BEGIN #20070208_2

	Select 
		@_MOA_Dt = Convert(DateTime, Convert(NVarChar(10), AM_Dt, 120)), 
		@_Method_Code = Method_Code
	From 
		AM_BASE
	Where 
		Project_ID = @Project_ID And AM_No = @MOA_No 

	Select 
		@SNP_Days = SNP_DAYS 
	From 
		PROJECT_MASTER
	Where 
		Project_ID = @Project_ID
	
	Update AM_BASE
	Set 
		AM_INTENTION = Convert(NChar(1), @Purchaser_Intention), 
		AM_Type = Convert(NChar(1), @MOA_Type), 
		Ana_Dist_Code = @Analysis_District, 
		LF_Code = @LF_Code, 
		SNP_Date = Convert(DateTime, @SNP_Date, 105),
		AGENCY = @Agency, 
		AGENT_NAME = @Agent_Name, 
		AGENT_AG_ID = @Agent_ID, 
		AGENT_ID_TYPE = Convert(NChar(1), @Agent_ID_Type),
		AGENT_TEL = @Agent_Phone, 
		Up_UID = @Update_UID, 
		Up_Dt = GetDate(), 
		Up_FID = @Update_FID,
		AM_Share = @MOA_Tenant_Share, 
		RMK_1 = @RMK1, 
		RMK_2 = @RMK2, 
		RMK_3 = @RMK3, 
		RMK_4 = @RMK4, 
		RMK_5 = @RMK5, 
		LFC_CODE = @LFC_CODE,
		--BEGIN #20070208_2
		MODIFY_CONFIRM_MOA_UID = @MODIFY_CONFIRM_MOA_UID,
		--END #20070208_2
		AM_DT = CONVERT(DATETIME, @MOA_Date, 105)
	Where 
		Project_ID = @Project_ID 
		And AM_NO = @MOA_No

	UPDATE 
		AM_BUYER
	SET
		CHI_NAME = @Purchaser_Surname,
		ENG_NAME = @Purchaser_Given_Name, 
		GENDER = Convert(NChar(1), @Purchaser_Gender), 
		Buyer_ID = @Purchaser_ID,
		Buyer_ID_Type = Convert(NChar(1), @Purchaser_ID_Type), 
		DOB = Convert(DateTime, @Purchaser_Date_Of_Birth, 105),
		BUYER_NAT = @Purchaser_Nationality, 
		Buyer_Share = @Purchaser_Tenant_Share, 
		BUYER_ID_IS_IDEN = @Purchaser_ID_Is_Iden,
		MARITAL_STATUS = @PURCHASER_MS,
		Property_System = @PURCHASER_PS,
		IS_ADULT = @PURCHASER_IsAdult,
		SPOUSE_NAME = @PURCHASER_Spouse
	WHERE
		PROJECT_ID = @Project_ID
		AND AM_NO = @MOA_No
		AND BUYER_TYPE = 'P'
		AND BUYER_SEQ = 1


	UPDATE
		AM_BUYER
	SET
		CHI_NAME = @Company_Name,
		BUYER_ID = @Business_Registration,
		BUYER_SHARE = @Company_Tenant_Share
	WHERE
		PROJECT_ID = @Project_ID
		AND AM_NO = @MOA_No
		AND BUYER_TYPE = 'C'
		AND BUYER_SEQ = 1

	UPDATE
		AM_BUYER
	SET
		CHI_NAME = @Director1_Surname, 
		ENG_NAME = @Director1_Given_Name,
		Gender = Convert(NChar(1), @Director1_Gender), 
		BUYER_ID = @Director1_ID,
		BUYER_ID_Type = Convert(NChar(1), @Director1_ID_Type), 
		DOB = Convert(DateTime, @Director1_Date_Of_Birth, 105),
		BUYER_NAT = @Director1_Nationality, 
		BUYER_ID_IS_IDEN = @Director1_ID_Is_Iden,
		MARITAL_STATUS = @Director1_MS,
		PROPERTY_SYSTEM = @Director1_PS,
		Is_Adult = @DIRECTOR1_IsAdult,
		SPOUSE_NAME = @DIRECTOR1_Spouse
	WHERE
		PROJECT_ID = @Project_ID
		AND AM_NO = @MOA_NO
		AND BUYER_TYPE = 'D'
		AND BUYER_SEQ = 1


	UPDATE 
		AM_BUYER
	SET
		CHI_NAME = @Director2_Surname, 
		ENG_NAME = @Director2_Given_Name,
		Gender = Convert(NChar(1), @Director2_Gender), 
		BUYER_ID = @Director2_ID, 
		BUYER_ID_TYPE = Convert(NChar(1), @Director2_ID_Type), 
		DOB = Convert(DateTime, @Director2_Date_Of_Birth, 105), 
		BUYER_NAT = @Director2_Nationality, 
		BUYER_ID_IS_IDEN = @Director2_ID_Is_Iden,
		MARITAL_STATUS = @Director2_MS,
		PROPERTY_SYSTEM = @Director2_PS,
		IS_ADULT = @DIRECTOR2_IsAdult,
		SPOUSE_NAME = @DIRECTOR2_Spouse
	WHERE
		PROJECT_ID = @Project_ID
		AND AM_NO = @MOA_No
		AND BUYER_TYPE = 'D'
		AND BUYER_SEQ = 2

	-- Begin 20160703 Tommy for insert Director/Purchaser
	if ((@Purchaser_Surname is not null and  @Purchaser_Surname <> '') or (@Purchaser_Given_Name is not null and  @Purchaser_Given_Name <> ''))
	Begin
		IF (
				(
					Select Count(*) FROM AM_BUYER where AM_NO = @MOA_No and PROJECT_ID = @Project_ID and BUYER_TYPE ='P' and BUYER_SEQ =1
				) = 0
			)
		Begin
			INSERT INTO [dbo].[AM_BUYER]
			     ([AM_NO]
			   ,[PROJECT_ID] ,[BUYER_SEQ] ,[BUYER_TYPE]
			   ,[CHI_NAME] ,[ENG_NAME]
			   ,[BUYER_ID] ,[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN]
			   ,[GENDER],[DOB],[BUYER_NAT]
			   ,[CONTACT_NO]
			   ,[MARITAL_STATUS],[PROPERTY_SYSTEM]
			   ,[SPOUSE_NAME] ,[SPOUSE_ID]
			   ,[IS_ADULT],[BUYER_SHARE]
			   ,[CR_UID] ,[CR_DT] ,[CR_FID]
			   ,[UP_UID] ,[UP_DT],[UP_FID])
			 VALUES
			   (@MOA_No
			   ,@Project_ID,1 ,'P'
			   ,@Purchaser_Surname ,@Purchaser_Given_Name
				,@Purchaser_ID ,  Convert(NChar(1), @Purchaser_ID_Type) ,@Purchaser_ID_Is_Iden
			   , Convert(NChar(1), @Purchaser_Gender) ,  Convert(DateTime, @Purchaser_Date_Of_Birth, 105) ,@Purchaser_Nationality
			   ,''
			   ,@PURCHASER_MS ,@PURCHASER_PS
			   ,@PURCHASER_Spouse ,''
			   ,@PURCHASER_IsAdult ,''
			   , @Update_UID, Getdate() , @Update_FID
			   , @Update_UID, Getdate() , @Update_FID)
		END
	END
	Else
	BEGIN
		Delete from AM_BUYER
		WHERE
			PROJECT_ID = @Project_ID
			AND AM_NO = @MOA_NO
			AND BUYER_TYPE = 'P'
			AND BUYER_SEQ = 1
	END

	if (@Company_Name is not null or @Company_Name <> '')
	Begin
		IF (
				(
					Select Count(*) FROM AM_BUYER where AM_NO = @MOA_No and PROJECT_ID = @Project_ID and BUYER_TYPE ='C' and BUYER_SEQ =1
				) = 0
		   )
		Begin
			INSERT INTO [dbo].[AM_BUYER]
			   ([AM_NO]
			   ,[PROJECT_ID] ,[BUYER_SEQ] ,[BUYER_TYPE]
			   ,[CHI_NAME] ,[ENG_NAME]
			   ,[BUYER_ID] ,[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN]
			   ,[GENDER],[DOB],[BUYER_NAT]
			   ,[CONTACT_NO]
			   ,[MARITAL_STATUS],[PROPERTY_SYSTEM]
			   ,[SPOUSE_NAME] ,[SPOUSE_ID]
			   ,[IS_ADULT],[BUYER_SHARE]
			   ,[CR_UID] ,[CR_DT] ,[CR_FID]
			   ,[UP_UID] ,[UP_DT],[UP_FID])
			VALUES
			   (@MOA_No
			   ,@Project_ID ,1 ,'C'
			   ,@Company_Name ,''
			   ,@Business_Registration ,'' ,''
			   ,'' ,null ,''
			   ,''
			   ,'',''
			   ,'',''
			   ,'' ,case when @Company_Tenant_Share ='' or @Company_Tenant_Share is null then '' Else @Company_Tenant_Share END
			   , @Update_UID, Getdate() , @Update_FID
			   , @Update_UID, Getdate() , @Update_FID)
			END
		END
		Else
		Begin
			Delete From AM_BUYER
			WHERE
				PROJECT_ID = @Project_ID
				AND AM_NO = @MOA_No
				AND BUYER_TYPE = 'C'
				AND BUYER_SEQ = 1
		END


		if (@Director1_ID is not null or @Director1_ID <> '')
		Begin
			IF (
					(
						Select Count(*) FROM AM_BUYER where AM_NO = @MOA_No and PROJECT_ID = @Project_ID and BUYER_TYPE ='D' and BUYER_SEQ =1
					) = 0
				)
			Begin
				INSERT INTO [dbo].[AM_BUYER]
					 ([AM_NO]
				   ,[PROJECT_ID] ,[BUYER_SEQ] ,[BUYER_TYPE]
				   ,[CHI_NAME] ,[ENG_NAME]
				   ,[BUYER_ID] ,[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN]
				   ,[GENDER],[DOB],[BUYER_NAT]
				   ,[CONTACT_NO]
				   ,[MARITAL_STATUS],[PROPERTY_SYSTEM]
				   ,[SPOUSE_NAME] ,[SPOUSE_ID]
				   ,[IS_ADULT],[BUYER_SHARE]
				   ,[CR_UID] ,[CR_DT] ,[CR_FID]
				   ,[UP_UID] ,[UP_DT],[UP_FID])
			 VALUES
				   (@MOA_No
				   ,@Project_ID,1 ,'D'
				   ,@Director1_Surname ,@Director1_Given_Name
					,@Director1_ID , Convert(NChar(1), @Director1_ID_Type) ,@Director1_ID_Is_Iden
				   ,Convert(NChar(1), @Director1_Gender) , Convert(DateTime, @Director1_Date_Of_Birth, 105) ,@Director1_Nationality
				   ,''
				   ,@Director1_MS ,@Director1_PS
				   ,@DIRECTOR1_Spouse ,''
				   ,@DIRECTOR1_IsAdult ,''
				   , @Update_UID, Getdate() , @Update_FID
				   , @Update_UID, Getdate() , @Update_FID)
			END
		END
		Else
		BEGIN
			Delete from AM_BUYER
			WHERE
				PROJECT_ID = @Project_ID
				AND AM_NO = @MOA_NO
				AND BUYER_TYPE = 'D'
				AND BUYER_SEQ = 1
		END


				
		if (@Director2_ID is not null or @Director2_ID <> '')
		Begin
			IF (
					(
						Select Count(*) FROM AM_BUYER where AM_NO = @MOA_No and PROJECT_ID = @Project_ID and BUYER_TYPE ='D' and BUYER_SEQ =2
					) = 0
				)
			Begin
				INSERT INTO [dbo].[AM_BUYER]
					([AM_NO]
				   ,[PROJECT_ID] ,[BUYER_SEQ] ,[BUYER_TYPE]
				   ,[CHI_NAME] ,[ENG_NAME]
				   ,[BUYER_ID] ,[BUYER_ID_TYPE],[BUYER_ID_IS_IDEN]
				   ,[GENDER],[DOB],[BUYER_NAT]
				   ,[CONTACT_NO]
				   ,[MARITAL_STATUS],[PROPERTY_SYSTEM]
				   ,[SPOUSE_NAME] ,[SPOUSE_ID]
				   ,[IS_ADULT],[BUYER_SHARE]
				   ,[CR_UID] ,[CR_DT] ,[CR_FID]
				   ,[UP_UID] ,[UP_DT],[UP_FID])
			 VALUES
				   (@MOA_No
				   ,@Project_ID ,2 ,'D'
				   ,@Director2_Surname ,@Director2_Given_Name
				   ,@Director2_ID , Convert(NChar(1), @Director2_ID_Type) ,@Director2_ID_Is_Iden
				   ,Convert(NChar(1), @Director2_Gender) , Convert(DateTime, @Director2_Date_Of_Birth, 105) ,@Director2_Nationality
				   ,''
				   ,@Director2_MS,@Director2_PS
				   ,@DIRECTOR2_Spouse ,''
				   ,@DIRECTOR2_IsAdult ,''
				   , @Update_UID, Getdate() , @Update_FID
				   , @Update_UID, Getdate() , @Update_FID)
			END
		END
		Else
		Begin
			Delete from AM_BUYER
			WHERE
				PROJECT_ID = @Project_ID
				AND AM_NO = @MOA_No
				AND BUYER_TYPE = 'D'
				AND BUYER_SEQ = 2
		END



				-- End 20160703 Tommy
		UPDATE 
			AM_CONTACT
		SET
			Cont_Person = @Contact_Person,
			ADDR_1 = @Address1, 
			ADDR_2 = @Address2, 
			ADDR_3 = @Address3, 
			Dist_Code = @District, 
			Region_Code = @Region_Code, 
			Country_Code = @Country,
			Off_Tel = @Office_Phone, 
			Tel_No = @Home_Phone, 
			Mobile = @Mobile_Phone, 
			Fax = @Fax, 
			Email = @Email,
			ADDR_4 = @Address4, 
			AREA = @Area
		WHERE
			PROJECT_ID = @Project_ID
			AND AM_NO = @MOA_No


		If @_MOA_Dt <> Convert(DateTime, @MOA_Date, 105)
		Begin
			
			-- Agreement Date has been changed
			Exec CalculateSNPDate @Project_ID, @MOA_Date, -9999, @_SNP_Date Output

			--Update Payment Due Date
			If @_Method_Code Is Not Null
			Begin

				Declare @_token NVarChar(200)
				Create Table #_fullname_token (
					Token NVarChar(200)
				)

			
				Declare Tmp_Cursor Cursor For
				Select PY_PLAN_SEQ, PY_DT_CAL_TYPE, PY_DT_FACT, PY_DT_TYPE
				From AM_PAYMENT_PLAN	
				Where Project_ID = @Project_ID And AM_No = @MOA_No And Method_Code = @_Method_Code	
						and (PY_DT_CAL_TYPE = 'R' OR PY_DT_CAL_TYPE = 'A')
				

				Declare Token_Cursor Cursor For
				Select Token
				From #_fullname_token
				Order By Token

				Open Tmp_Cursor

				Fetch Next
				From Tmp_Cursor
				Into @_PY_PLAN_SEQ, @_PY_DT_CAL_TYPE, @_PY_DT_FACT, @_PY_DT_TYPE

				While @@Fetch_Status = 0
				Begin
					Select @_Payment_Due = ''
					Select @_SNP_Date_Str = ''

					If @_PY_DT_CAL_TYPE Is Not Null
					Begin
					
							If @_PY_DT_CAL_TYPE = 'R'
							Begin
								--Relative to SNP date
								Select @_SNP_Date_Str = Convert(nvarchar, @_SNP_Date, 105)
								Execute CalculateMOAScheduleDate @Project_ID, @_SNP_Date_Str, @_PY_DT_FACT, @_PY_DT_TYPE, @_Payment_Due output
							End
							Else If @_PY_DT_CAL_TYPE = 'A'
							Begin	
								--Relative to Agreement date
								If @_PY_PLAN_SEQ = 1 And @_PY_DT_FACT = 0 And @_PY_DT_TYPE = 'D' And @IgnorePostpone = 'Y'
								Begin
									Select @_Payment_Due = @MOA_Date
								End
								Else
								Begin
									Execute CalculateMOAScheduleDate @Project_ID, @MOA_Date, @_PY_DT_FACT, @_PY_DT_TYPE, @_Payment_Due output								
								End
							End

							
							Update AM_PAYMENT_PLAN
							Set Py_Date_Due = Convert(DateTime, @_Payment_Due, 103),
								Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
							From AM_PAYMENT_PLAN
							Where Project_ID = @Project_ID And AM_NO = @MOA_No And Method_Code = @_Method_Code and Py_Plan_Seq = @_PY_PLAN_SEQ
					
					End
					
					Delete
					From #_fullname_token

					Fetch Next
					From Tmp_Cursor
					Into @_PY_PLAN_SEQ, @_PY_DT_CAL_TYPE, @_PY_DT_FACT, @_PY_DT_TYPE
				End

				Close Tmp_Cursor

				Deallocate Tmp_Cursor

				Select @MinReceiptNo = MIN(receipt_no) from RECEIPT
				Where Project_Id = @Project_ID and MOA_NO = @MOA_No

				Update RECEIPT
				Set TRANSACT_DATE = Convert(DateTime, @MOA_Date, 105)
				Where Project_Id = @Project_ID and MOA_No = @MOA_No and RECEIPT_NO = @MinReceiptNo
				
				Select @Remain_Str = RECEIPT_DATA from RECEIPT
				Where Project_Id = @Project_ID and MOA_No = @MOA_No and RECEIPT_NO = @MinReceiptNo
				
				if LEN(@Remain_Str) > 0
				Begin
					
					While CHARINDEX(',',@Remain_Str) > 0
					Begin
						Select @Return_Str = SUBSTRING(@Remain_Str,0,charindex(',',@Remain_Str))
						Select @Remain_Str = SUBSTRING(@Remain_Str,charindex(',',@Remain_Str) + 1, LEN(@Remain_Str) - charindex(',',@Remain_Str) + 1)
						
						Update AM_PAYMENT_FU_TRANS
						set TRANSACT_DATE = Convert(DateTime, @MOA_Date, 105)
						Where Project_Id = @Project_ID and AM_No = @MOA_No and PAID_SEQ = @Return_Str
					End
				End				
			End
		End
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateMOAFormalPrint]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[UpdateMOAFormalPrint]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Last_Print_Uid NVarChar(10)
)
 
As
	Declare @Last_Print_Dt DateTime
	Select @Last_Print_Dt = GetDate()	

	Update MOA_FORMAL
	Set
		Last_Print_UID = @Last_Print_Uid, 
		Last_Print_Dt = @Last_Print_Dt,
		UP_UID = @Last_Print_Uid, 
		UP_FID = 'FM03',
		UP_DT = @Last_Print_Dt
	Where
		(MOA_NO + 'F' + CONVERT(varchar,FORMAL_SEQ)) = @MOA_No And Project_Id = @Project_ID
	
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateMOAPaymentMethod]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateMOAPaymentMethod]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Method_Code NVarChar(6),
	@Adjustment NVarChar(7),
	@Show_List_Price NVarChar(1),
	@Cash_Rebate_Amount NVarChar(10),
	@Cash_Rebate_Unit NVarChar(1),
	@Show_Cash_Rebate NVarChar(1),
	@Add_Package_Before_Adjustment NVarChar(1),
	@Contract_Price NVarChar(10),
	@Net_Price NVarChar(10),
	@Cash_Rebate NVarChar(10),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Negotiation_Adjustment NVarChar(10),
	@Edit_Payment_Schedule_User NVarChar(10),
	@SNP_Date NVarChar(10),	
	@Stamp_Duty_Code NVarchar(10),
	@Waive_Stamp_Duty NChar(1),	
	@Stamp_Duty_Amt Nvarchar(10),
	@IS_CHANGE_PAY_LOG NVARCHAR(1),
	@CHANGE_PAY_REMARK NVARCHAR(500),
	@CHANGE_PAY_TERMS NVARCHAR(500),
	@PAY_TERMS NVARCHAR(500)
)
 
As
	Declare @Method_Desc_ENG NVarChar(200)
		Declare @Method_Desc_CHI NVarChar(200)
	Declare @AM_Status NVarchar(1)
	
	Select @Method_Desc_ENG = METHOD_DESC_ENG ,
	@Method_Desc_CHI = Method_Desc_CHI
	From Prj_Pay_Method
	Where Project_ID = @Project_ID And Method_Code = @Method_Code

	SELECT 
		@AM_Status = AM_STATUS 
	FROM 
		AM_BASE
	Where Project_ID = @Project_ID And AM_No = @MOA_No
	
	IF @AM_Status = 'C'
	BEGIN
		Update AM_BASE
		Set Method_Code = @Method_Code, Method_Desc = concat (@Method_Desc_ENG ,' ', @Method_Desc_CHI) , Pay_Adj_Per = Convert(Numeric(5, 2), @Adjustment),
			Cash_Rebate = Convert(Numeric(18, 2), @Cash_Rebate_Amount),
			Cash_Rebate_Unit = Convert(NChar(1), @Cash_Rebate_Unit), Show_Cash_Rebate = Convert(NChar(1), @Show_Cash_Rebate),
			Add_Pkg_B4_Adjust = Convert(NChar(1), @Add_Package_Before_Adjustment), AM_Price = Convert(Numeric, @Contract_Price),
			AM_Tot_Price = Convert(Numeric, @Net_Price), AM_Cash_Rebate = Convert(Numeric, @Cash_Rebate),
			Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID,
			Negotiation_Adj = Convert(Numeric, @Negotiation_Adjustment), Edit_Pay_Sche_UID = @Edit_Payment_Schedule_User,
			SNP_Date = Convert(DateTime, @SNP_Date, 105),
			--BEGIN #20070226
			Waive_Stamp_Duty = @Waive_Stamp_Duty, Stamp_Duty_Code = @Stamp_Duty_Code, 
			Stamp_Duty_Amt = Convert(Numeric, @Stamp_Duty_Amt),
			--END #20070226
			IS_CHANGE_PAY_LOG = @IS_CHANGE_PAY_LOG,
			CHANGE_PAY_REMARK = @CHANGE_PAY_REMARK,
			CHANGE_PAY_TERMS = @CHANGE_PAY_TERMS,
			PAY_TERMS =@PAY_TERMS
		Where Project_ID = @Project_ID And AM_No = @MOA_No
	END
	ELSE
	BEGIN
		Update AM_BASE
		Set Method_Code = @Method_Code, Method_Desc = concat (@Method_Desc_ENG ,' ', @Method_Desc_CHI), Pay_Adj_Per = Convert(Numeric(5, 2), @Adjustment),
			Cash_Rebate = Convert(Numeric(18, 2), @Cash_Rebate_Amount),
			Cash_Rebate_Unit = Convert(NChar(1), @Cash_Rebate_Unit), Show_Cash_Rebate = Convert(NChar(1), @Show_Cash_Rebate),
			Add_Pkg_B4_Adjust = Convert(NChar(1), @Add_Package_Before_Adjustment), AM_Price = Convert(Numeric, @Contract_Price),
			AM_Tot_Price = Convert(Numeric, @Net_Price), AM_Cash_Rebate = Convert(Numeric, @Cash_Rebate),
			Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID,
			Negotiation_Adj = Convert(Numeric, @Negotiation_Adjustment), Edit_Pay_Sche_UID = @Edit_Payment_Schedule_User,
			SNP_Date = Convert(DateTime, @SNP_Date, 105),
			--BEGIN #20070226
			Waive_Stamp_Duty = @Waive_Stamp_Duty, Stamp_Duty_Code = @Stamp_Duty_Code, 
			Stamp_Duty_Amt = Convert(Numeric, @Stamp_Duty_Amt),
			--END #20070226
			PAY_TERMS = @PAY_TERMS
		Where Project_ID = @Project_ID And AM_No = @MOA_No
	END

Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateMOAPaymentMethod2]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateMOAPaymentMethod2]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Adjustment NVarChar(7),
	@Show_List_Price NVarChar(1),
	@Cash_Rebate_Amount NVarChar(10),
	@Cash_Rebate_Unit NVarChar(1),
	@Show_Cash_Rebate NVarChar(1),
	@Add_Package_Before_Adjustment NVarChar(1),
	@Contract_Price NVarChar(10),
	@Net_Price NVarChar(10),
	@Cash_Rebate NVarChar(10),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Negotiation_Adjustment NVarChar(10),
	@Edit_Payment_Schedule_User NVarChar(10),
	@Stamp_Duty_Code NVarchar(10),
	@Waive_Stamp_Duty NChar(1),
	@Stamp_Duty_Amt Nvarchar(10),
	@IS_CHANGE_PAY_LOG NVARCHAR(1),
	@CHANGE_PAY_REMARK NVARCHAR(500),
	@CHANGE_PAY_TERMS NVARCHAR(500),
	@PAY_TERMS NVARCHAR(500)
)
 
As
	Declare @AM_Status NVARCHAR(1)

	SELECT 
		@AM_Status = AM_STATUS 
	FROM 
		AM_BASE
	Where Project_ID = @Project_ID And AM_No = @MOA_No
	

	IF @AM_Status = 'C'
	BEGIN
		Update AM_BASE
		Set Pay_Adj_Per = Convert(Numeric(5, 2), @Adjustment),
			Cash_Rebate = Convert(Numeric(18, 2), @Cash_Rebate_Amount),
			Cash_Rebate_Unit = Convert(NChar(1), @Cash_Rebate_Unit), Show_Cash_Rebate = Convert(NChar(1), @Show_Cash_Rebate),
			Add_Pkg_B4_Adjust = Convert(NChar(1), @Add_Package_Before_Adjustment), AM_PRICE = Convert(Numeric, @Contract_Price),
			AM_TOT_PRICE = Convert(Numeric, @Net_Price), AM_CASH_REBATE = Convert(Numeric, @Cash_Rebate),
			Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID,
			Negotiation_Adj = Convert(Numeric, @Negotiation_Adjustment), Edit_Pay_Sche_UID = @Edit_Payment_Schedule_User,
			--BEGIN #20070226
			Waive_Stamp_Duty = @Waive_Stamp_Duty, Stamp_Duty_Code = @Stamp_Duty_Code, 
			Stamp_Duty_Amt = Convert(Numeric, @Stamp_Duty_Amt),
			--END #20070226
			IS_CHANGE_PAY_LOG = @IS_CHANGE_PAY_LOG,
			CHANGE_PAY_REMARK = @CHANGE_PAY_REMARK,
			CHANGE_PAY_TERMS = @CHANGE_PAY_TERMS,
			PAY_TERMS=@PAY_TERMS
		Where Project_ID = @Project_ID And AM_No = @MOA_No
	END
	ELSE
	BEGIN
		Update AM_BASE
		Set Pay_Adj_Per = Convert(Numeric(5, 2), @Adjustment),
			Cash_Rebate = Convert(Numeric(18, 2), @Cash_Rebate_Amount),
			Cash_Rebate_Unit = Convert(NChar(1), @Cash_Rebate_Unit), Show_Cash_Rebate = Convert(NChar(1), @Show_Cash_Rebate),
			Add_Pkg_B4_Adjust = Convert(NChar(1), @Add_Package_Before_Adjustment), AM_PRICE = Convert(Numeric, @Contract_Price),
			AM_TOT_PRICE = Convert(Numeric, @Net_Price), AM_CASH_REBATE = Convert(Numeric, @Cash_Rebate),
			Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID,
			Negotiation_Adj = Convert(Numeric, @Negotiation_Adjustment), Edit_Pay_Sche_UID = @Edit_Payment_Schedule_User,
			--BEGIN #20070226
			Waive_Stamp_Duty = @Waive_Stamp_Duty, Stamp_Duty_Code = @Stamp_Duty_Code, 
			Stamp_Duty_Amt = Convert(Numeric, @Stamp_Duty_Amt),
			--END #20070226
			PAY_TERMS = @PAY_TERMS
		Where Project_ID = @Project_ID And AM_No = @MOA_No
	END
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateMOAPayPlan]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateMOAPayPlan]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Method_Code NVarChar(6),
	@Plan_Sequence NVarChar(2),
	@Payment_Due NVarChar(10),
	@Due_Date NVarChar(10),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Date_due_desc NVarChar(200)  --#20171023

)
 
As
	Update AM_Payment_Plan
	Set Py_Paymt_Due = Convert(Numeric, @Payment_Due), Py_Date_Due = Convert(DateTime, @Due_Date, 103),
		Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID,
		PY_DATEDUE_DESC = @Date_due_desc  --#20171023
	Where Project_ID = @Project_ID And AM_No = @MOA_No And Method_Code = @Method_Code And Py_Plan_Seq = @Plan_Sequence
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateMOAPrint]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[UpdateMOAPrint]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Last_Print_Uid NVarChar(10)
)
 
As
	Declare @Last_Print_Dt DateTime
	Select @Last_Print_Dt = GetDate()	

	--Update MOA
	--Set
	--	Last_Print_UID = @Last_Print_Uid, 
	--	Last_Print_Dt = @Last_Print_Dt
	--Where
	--	MOA_NO = @MOA_No And Project_Id = @Project_ID
	
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdatePackage]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdatePackage]
(
	@Project_ID NVarChar(6),
	@Package_ID NVarChar(2),
	@Package_Desc NVarChar(100),
	@Price_Adjust NVarChar(13),
	@Price_Adjust_Unit NVarChar(1),
	@Cal_With_Gross_Area NVarChar(1),
	@Internal_Cost NVarChar(13),
	@Package_Qty NVarChar(10),
	@Status NVarChar(1),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Add_Pack_To_Contract NVarChar(1),
	@Add_Pack_Before_After_Adj NVarChar(1)
)
 
As
	If @Package_Qty Is Null Or @Package_Qty = N''
	Begin
		Update Packages
		Set Package_Desc = @Package_Desc, Price_Adjust = Convert(Numeric(12, 2), @Price_Adjust),
			Unit = @Price_Adjust_Unit, Cal_Gross = @Cal_With_Gross_Area,
			Internal_Cost = Convert(Numeric(12, 2), @Internal_Cost),
			Package_Qty = Null, Package_Qty_Onhand = Null, Add_To_Contract_Price = @Add_Pack_To_Contract, Add_PKG_B4_Adjust = @Add_Pack_Before_After_Adj, Status = @Status,
			Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And Package_ID = @Package_ID
	End
	Else
	Begin
		Update Packages
		Set Package_Desc = @Package_Desc, Price_Adjust = Convert(Numeric(12, 2), @Price_Adjust),
			Unit = @Price_Adjust_Unit, Cal_Gross = @Cal_With_Gross_Area,
			Internal_Cost = Convert(Numeric(12, 2), @Internal_Cost),
			Package_Qty = Convert(Numeric(10), @Package_Qty),
			Package_Qty_Onhand = Convert(Numeric(10), @Package_Qty) - Package_Qty_Held, Add_To_Contract_Price = @Add_Pack_To_Contract, Add_PKG_B4_Adjust = @Add_Pack_Before_After_Adj, Status = @Status,
			Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where Project_ID = @Project_ID And Package_ID = @Package_ID
	End
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdatePaymentDueDate]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePaymentDueDate]
	@PROJECT_ID [nvarchar](10),
	@DATE_DUE [nvarchar](20),
	@AM_NO [nvarchar](max),
	@PY_PLAN_SEQ [numeric](18, 0),
	@CR_UID [nvarchar](20)
WITH  EXECUTE AS CALLER
AS
Begin
	declare @Sql nvarchar(max)
	set @Sql='UPDATE AM_PAYMENT_PLAN SET OTHER_PY_DUE_DATE = Convert(datetime, '''+@DATE_DUE+''',105) , UP_DT = GETDATE() , UP_FID = N''PF04'' , UP_UID = N'''+@CR_UID+'''  WHERE PY_DT_CAL_TYPE = ''T'' AND PY_DATE_DUE IS NULL AND PY_PLAN_SEQ = '''+ convert(nvarchar(max), @PY_PLAN_SEQ) + ''' AND AM_NO = N'''+@AM_NO+''' AND Project_ID = '''+@PROJECT_ID+'''';
	exec(@Sql)
End
GO
/****** Object:  StoredProcedure [dbo].[UpdatePaymentHeader]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[UpdatePaymentHeader]
(
	@Project_ID NVarChar(6),
	@Method_Code NVarChar(6),
	@Method_Desc_ENG NVarChar(200),
	@Adjustment NVarChar(7),
	@Show_List_Price NVarChar(1),
	@Cash_Rebate NVarChar(13),
	@Cash_Rebate_Unit NVarChar(1),
	@Show_Cash_Rebate NVarChar(1),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Method_Desc_CHI NVarChar(200)
)
 
As
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	

	Update Prj_Pay_Method
	Set METHOD_DESC_ENG = @Method_Desc_ENG ,METHOD_DESC_CHI = @Method_Desc_CHI  , Pay_Adj_Per = Convert(Numeric(5, 2), @Adjustment),
		Show_List_Price_On_MOA = @Show_List_Price, Cash_Rebate = @Cash_Rebate,
		Cash_Rebate_Unit = @Cash_Rebate_Unit, Show_Cash_Rebate = @Show_Cash_Rebate
	Where Project_ID = @Project_ID And Method_Code = @Method_Code
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdatePaymentStatus]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[UpdatePaymentStatus]
(
	@Project_ID NVarChar(6),
	@Method_Code NVarChar(6),
	@Status NChar(1)
)
  As
	--exec master..xp_ASL '[weKDisnmvie)}6&'
	

	Update Prj_Pay_Method
	Set Status = Upper(@Status)
	Where Project_ID = @Project_ID And Method_Code = @Method_Code
Return

GO
/****** Object:  StoredProcedure [dbo].[UpdateProject]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[UpdateProject]
(
	@Project_ID NVarChar(6),
	@Address1 NVarChar(50),
	@Address2 NVarChar(50),
	@Address3 NVarChar(50),
	@Dist_Code NVarChar(6),
	@UOM_Code NVarChar(6),
	@SNP_Days NVarChar(4),
	@Duplicate_Reg NVarChar(1),
	@Add_Package NVarChar(1),
	@Deposit1 NVarChar(13),
	@Deposit2 NVarChar(13),
	@Deposit3 NVarChar(13),
	@Deposit4 NVarChar(13),
	@Extra_Flat1 NVarChar(20),
	@Extra_Flat2 NVarChar(20),
	@Unit_Analysis_Group_0 NVarChar(10),
	@Unit_Analysis_Group_1 NVarChar(10),
	@Unit_Analysis_Group_2 NVarChar(10),
	@Unit_Analysis_Group_3 NVarChar(10),
	@Unit_Analysis_Group_4 NVarChar(10),
	@Unit_Analysis_Group_5 NVarChar(10),
	@Unit_Analysis_Group_6 NVarChar(10),
	@Unit_Analysis_Group_7 NVarChar(10),
	@Unit_Analysis_Group_8 NVarChar(10),
	@Unit_Analysis_Group_9 NVarChar(10),
	@Car_Park_Analysis_Group NVarChar(10),
	@Allow_Multiple NVarChar(1),
	--BEGIN #20080414
	@Remark1 NVarChar(200),
	@Remark2 NVarChar(200),
	@Remark3 NVarChar(200),
	@Remark4 NVarChar(200),
	@Remark5 NVarChar(200),
	--END #20080414
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10),
	@Vendor NVarChar(50),
	@VENDOR_ENG NVarChar(50),
	@Car_Park_Analysis_Group_2 NVarChar(10),
	@Region_Code NVarChar(6),
	@Include_Stamp_Duty NChar(1),
	@Telephone NVarChar(20),
	@Fax NVarChar(20),
	@ROUND_TYPE NVARCHAR(1),
	@ROUND_BASE INT ,
	@IS_BALLOT_VERIFY nvarchar (1),
	@Address1Eng NVarChar(50),
	@Address2Eng NVarChar(50),
	@Address3Eng NVarChar(50),
	@PACKAGE_CALC_TYPE NVarChar(1),
	@MaxCompBuyer decimal(3,1),
	@MaxPurchasePBuyer Int,
	@MaxPurchasePCombine Int
)
 
As
Begin


	--BEGIN #20070313
	---------BEGIN Remove Part in Phase 2
	Declare @Stamp_Duty_Code NVarchar(10)

	If @Include_Stamp_Duty = 'Y' 
	Begin
		Select Top 1 @Stamp_Duty_Code = Stamp_Duty_Code From Stamp_Duty
	End
	---------END Remove Part in Phase 2

	--END #20070313

	Update Project_Master
	Set Region_Code = @Region_Code, Dist_Code = @Dist_Code, UOM_Code = @UOM_Code,
		PRJ_ADD_CHI_1 = @Address1, PRJ_ADD_CHI_2 = @Address2, PRJ_ADD_CHI_3 = @Address3,
		--Prj_Bk_Amt1 = Convert(Numeric(12, 2), @Deposit1),
		--Prj_Bk_Amt2 = Convert(Numeric(12, 2), @Deposit2),
		--Prj_Bk_Amt3 = Convert(Numeric(12, 2), @Deposit3),
		--Prj_Bk_Amt4 = Convert(Numeric(12, 2), @Deposit4),
		Prj_Dup_Reg = @Duplicate_Reg, Add_Pkg_B4_Adjust = @Add_Package,
		Prj_Flat_Label1 = @Extra_Flat1, Prj_Flat_Label2 = @Extra_Flat2,
		FM_Ana_Group1_ID = @Unit_Analysis_Group_0, FM_Ana_Group2_ID = @Unit_Analysis_Group_1,
		FM_Ana_Group3_ID = @Unit_Analysis_Group_2, FM_Ana_Group4_ID = @Unit_Analysis_Group_3,
		FM_Ana_Group5_ID = @Unit_Analysis_Group_4, FM_Ana_Group6_ID = @Unit_Analysis_Group_5,
		FM_Ana_Group7_ID = @Unit_Analysis_Group_6, FM_Ana_Group8_ID = @Unit_Analysis_Group_7,
		FM_Ana_Group9_ID = @Unit_Analysis_Group_8, FM_Ana_Group10_ID = @Unit_Analysis_Group_9,
		CP_Ana_Group1_ID = @Car_Park_Analysis_Group, CP_Ana_Group2_ID = @Car_Park_Analysis_Group_2, SNP_Days = @SNP_Days,
		multiple_unit = @Allow_Multiple, prj_rmk_1 = @Remark1,
		prj_rmk_2 = @Remark2, prj_rmk_3 = @Remark3,
		prj_rmk_4 = @Remark4, prj_rmk_5 = @Remark5,
		Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID, VENDOR_CHI = @Vendor, VENDOR_ENG = @VENDOR_ENG,
		ROUND_BASE=@ROUND_BASE , ROUND_TYPE=@ROUND_TYPE, IS_BALLOT_VERIFY = @IS_BALLOT_VERIFY , PRJ_ADD_ENG_1 =@Address1Eng , PRJ_ADD_ENG_2=@Address2Eng, PRJ_ADD_ENG_3=@Address3Eng,
		--BEGIN #20070222
		Include_Stamp_Duty = @Include_Stamp_Duty,
		--END #20070222
		--BEGIN #20070313
		Stamp_Duty_Code = @Stamp_Duty_Code,
		--END #20070313
		--BEGIN #20080219
		Prj_Tel_No = @Telephone,
		Prj_Fax = @Fax,
		PACKAGE_CALC_TYPE=@PACKAGE_CALC_TYPE,
		--END #20080219
		COMP_PCT=@MaxCompBuyer,

		--20170606 
		MAX_PURCHASE_UNIT = @MaxPurchasePBuyer,
		MAX_PURCHASE_UNIT_2 = @MaxPurchasePCombine

	Where Project_ID = @Project_ID



	
	end
GO
/****** Object:  StoredProcedure [dbo].[UpdateSelectedAsWithdrew]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSelectedAsWithdrew]
	@Pool_Reg_ID [int],
	@Status [nvarchar](1),
	@UP_UID [nvarchar](10),
	@UP_FID [nvarchar](10)
WITH  EXECUTE AS CALLER
AS
Begin
	Declare @BALLOT_STATUS NVARCHAR (10)

	Select @BALLOT_STATUS=BALLOT_REG_STATUS  from  BALLOT_POOL_REG bpr where  @Pool_Reg_ID= bpr.BALLOT_POOL_REG_ID 
	

	if (@BALLOT_STATUS = 'B' or @BALLOT_STATUS = 'I') 
	Begin
	update BALLOT_POOL_REG
	set BALLOT_POOL_REG.BALLOT_REG_STATUS=@Status , UP_DT=getdate(), UP_UID=@UP_UID, UP_FID=@UP_FID from BALLOT_POOL_REG bpr where bpr.BALLOT_POOL_REG_ID =@Pool_Reg_ID 
	End

End
	

/****** Object:  StoredProcedure [dbo].[SP_PA027_UpdateFlatPackage]    Script Date: 11/1/2015 5:37:34 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[UpdateSelectedBallotRegNo]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSelectedBallotRegNo]
	@PROJECT_ID [nvarchar](10),
	@CR_UID [nvarchar](10),
	@CR_FID [nvarchar](10),
	@POOL_REG_NO [int],
	@NEW_BALLOT_POOL_ID [int],
	@Result [nvarchar](1) OUTPUT
WITH  EXECUTE AS CALLER
AS
BEGIN
	-- @RESULT
	-- Y: Create Successfully
	-- M: Over max registration


			DECLARE @SEED uniqueidentifier
				SET @SEED = NEWID()
				DECLARE @NEW_REG_NO_DISPLAY NVARCHAR(30)
				DECLARE @NEW_REG_NO INT
				DECLARE @AGENCY NVARCHAR(6)
				DECLARE @BALLOT_REG_ID INT
			select @AGENCY = bp.AGENCY,@BALLOT_REG_ID= bp.BALLOT_REG_ID from
				BALLOT_POOL_REG bpr INNER JOIN
				BALLOT_REG bp on bpr.BALLOT_REG_ID = bp.BALLOT_REG_ID
			WHERE
				BALLOT_POOL_REG_ID = @POOL_REG_NO 

		select  @NEW_REG_NO=NEW_REG_NO, @NEW_REG_NO_DISPLAY=NEW_REG_NO_DISPLAY from 
					dbo.SF_NEW_BALLOT_ID(@PROJECT_ID,@NEW_BALLOT_POOL_ID,@AGENCY, @SEED)

					UPDATE BALLOT_REG
					SET [REG_NO]=@NEW_REG_NO,[REG_NO_DISPLAY]=@NEW_REG_NO_DISPLAY, SEED = @SEED
					WHERE BALLOT_REG_ID = @BALLOT_REG_ID
	UPDATE BALLOT_POOL_REG
	SET 
		BALLOT_REG_STATUS='N', 
		BALLOT_POOL_ID = @NEW_BALLOT_POOL_ID,
		UP_FID = @CR_FID,
		UP_UID = @CR_UID,
		UP_DT = GETDATE()
	WHERE
		BALLOT_POOL_REG_ID = @POOL_REG_NO 

		
	set @Result='Y'

End;


GO
/****** Object:  StoredProcedure [dbo].[UpdateSNPAppointment]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateSNPAppointment]
(
	@Project_ID NVarChar(6),
	@LF_Code NVarChar(6),
	@MOA_Time_Slot NVarChar(50) Output
)
 
As
	Declare @Max_Appointment Numeric
	Declare @SNP_Slot_No Numeric
	Declare @Max_SNP_Slot_No Numeric
	Declare @No_App_Column_Len Numeric
	Declare @No_App_Data_Len Numeric

	Select @Max_Appointment = Max_Apt
	From SNP_Schedule
	Where LF_Code = @LF_Code And Project_ID = @Project_ID

	Select @Max_SNP_Slot_No = Max(SNP_Slot_No)
	From SNP_Slots
	Where LF_Code = @LF_Code And Project_ID = @Project_ID

	Select @SNP_Slot_No = SNP_Slot_No
	From SNP_Slots
	Where LF_Code = @LF_Code And Project_ID = @Project_ID And No_App < @Max_Appointment And SNP_Slot_No = (
		Select Min(SNP_Slot_No)
		From SNP_Slots
		Where LF_Code = @LF_Code And Project_ID = @Project_ID And No_App < @Max_Appointment)

	Select @No_App_Column_Len = Col_Length(N'SNP_Slots', N'No_App') - 2

	Select @No_App_Data_Len = Len(No_App + 1)
	From SNP_Slots
	Where LF_Code = @LF_Code And Project_ID = @Project_ID And SNP_Slot_No = @SNP_Slot_No

	If @No_App_Data_Len <= @No_App_Column_Len
	Begin
		If Str(@SNP_Slot_No) Is Null Or Str(@SNP_Slot_No) = N''
		Begin
			Update SNP_Slots
			Set No_App = No_App + 1
			Where LF_Code = @LF_Code And Project_ID = @Project_ID And SNP_Slot_No = @Max_SNP_Slot_No

			Select @MOA_Time_Slot = SNP_Slot_Desc
			From SNP_Slots
			Where LF_Code = @LF_Code And Project_ID = @Project_ID And SNP_Slot_No = @Max_SNP_Slot_No
		End
		Else
		Begin
			Update SNP_Slots
			Set No_App = No_App + 1
			Where LF_Code = @LF_Code And Project_ID = @Project_ID And No_App < @Max_Appointment And SNP_Slot_No = (
				Select Min(SNP_Slot_No)
				From SNP_Slots
				Where LF_Code = @LF_Code And Project_ID = @Project_ID And No_App < @Max_Appointment)

			Select @MOA_Time_Slot = SNP_Slot_Desc
			From SNP_Slots
			Where LF_Code = @LF_Code And Project_ID = @Project_ID And No_App < @Max_Appointment And SNP_Slot_No = (
				Select Min(SNP_Slot_No)
				From SNP_Slots
				Where LF_Code = @LF_Code And Project_ID = @Project_ID And No_App < @Max_Appointment)
		End
	End
Return
GO
/****** Object:  StoredProcedure [dbo].[UpdateSNPDays]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateSNPDays]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@SNP_Days int,
	@SNP_DATE NVarChar(20),
	@LockUpPeriod NVarChar(10)
)
 
As
	Update AM_BASE
	SET SNP_DAYS = @SNP_Days, SNP_Date = Convert(datetime, @SNP_Date, 105), Lock_Up_Period	= CONVERT(datetime, @LockUpPeriod, 105)
	WHERE 
		AM_NO = @MOA_No
		And Project_ID = @Project_ID
Return 
GO
/****** Object:  StoredProcedure [dbo].[UpdateSystemNumber]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateSystemNumber]
(
	@Project_ID NVarChar(6),
	@Function_Flag NVarChar(3),
	@Range_ID NVarChar(2)
)
 
As
	If @Function_Flag = N'AM'
	Begin
		Update AM_NO_RANGE 
		Set Current_No = Current_No + 1
		Where Project_ID = @Project_ID And Range_ID = @Range_ID
	End

	--If @Function_Flag = N'REG'
	--Begin
	--	Update Reg_No_Range 
	--	Set Current_No = Current_No + 1
	--	Where Project_ID = @Project_ID And Range_ID = @Range_ID
	--End
Return 
GO
/****** Object:  StoredProcedure [dbo].[UpdateSystemSetup]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSystemSetup]
	@FN_ID [varchar](10),
	@PARA_DESCR [nvarchar](50),
	@PARA_KEY1 [nvarchar](50),
	@VAL_FR [nvarchar](50),
	@VAL_PARA [varbinary](max) = NULL
WITH  EXECUTE AS CALLER
AS
Declare @COUNTData int;
Declare @PARA_TYPE nvarchar(50);
set @PARA_TYPE ='DISPLAY_INFO';

  SELECT  @COUNTData = COUNT(*)
  FROM [dbo].[SYSTEM_SETUP] Where FN_ID = @FN_ID AND PARA_KEY1 = @PARA_KEY1 
  AND PARA_DESCR = @PARA_DESCR
  
IF(@COUNTData > 0)
BEGIN
UPDATE [dbo].[SYSTEM_SETUP] SET VAL_FR = @VAL_FR
, PARA_BYTE = CASE WHEN @VAL_PARA IS NULL then PARA_BYTE ELSE @VAL_PARA end
WHERE FN_ID = @FN_ID AND PARA_KEY1 = @PARA_KEY1 AND PARA_DESCR = @PARA_DESCR
End ELSE 
BEGIN
insert INTO [dbo].[SYSTEM_SETUP] 
(FN_ID,PARA_TYPE,PARA_DESCR,PARA_KEY1,DATE_FR,DATE_TO,VAL_FR,VAL_TO,PARA_BYTE)
	  VALUES(@FN_ID,@PARA_TYPE,@PARA_DESCR,@PARA_KEY1, NULL ,NULL ,@VAL_FR , NULL, CASE WHEN @VAL_PARA IS NULL then NULL ELSE @VAL_PARA end);
End

Return
GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CREATE Procedure UserLogin
CREATE Procedure [dbo].[UserLogin]
(
	@LogName NVARCHAR(100) = NULL,
	@LogDate NVARCHAR(100) = NULL,
	@LogStatus NVARCHAR(100) = NULL,
	@LoginKey NVARCHAR(100) = NULL
)
 
As

	DECLARE @Pass NVARCHAR(128) = 'yUDu6uFedru3';
	DECLARE @PassAuthName NVARCHAR(128) = 'ASL_PSMS_2013';
	DECLARE @EmptyString NVARCHAR(100) = 'EMPTY';
	DECLARE @CurrDate NVARCHAR(100) = CONVERT(NVARCHAR(8), GETDATE(), 112);
	
	DECLARE @EncDate varbinary(256);
	DECLARE @EncEmpty varbinary(256);
	DECLARE @EncCurrDate varbinary(256);
	
	SET @EncDate = EncryptByPassPhrase(@Pass, @LogDate, 1, CONVERT( varbinary, @PassAuthName));
	SET @EncEmpty = EncryptByPassPhrase(@Pass, @EmptyString, 1, CONVERT( varbinary, @PassAuthName));
	SET @EncCurrDate = EncryptByPassPhrase(@Pass, @CurrDate, 1, CONVERT( varbinary, @PassAuthName));

	-- SELECT @LogStatus, @UserID, @LogStatus, @CheckDate, @EncDate, @EncEmpty;



	IF ((@LogStatus = 'SYS_AUTH_SUCCESS') AND (@LoginKey = 'h2zuchat@pe$E5u'))
		BEGIN

			-- SELECT @LogStatus, @UserID, @LogStatus, @CheckDate, @EncDate, @EncEmpty;

			UPDATE SYSTEM_SETUP
			SET PARA_BYTE = @EncDate
			WHERE PARA_DESCR='SERVER_STARTUP_DT' and FN_ID='SYS_AUTH' and PARA_TYPE='AUTH';

			UPDATE SYSTEM_SETUP 
			SET PARA_BYTE = @EncEmpty
			WHERE 
				PARA_DESCR='AUTH_FAIL_DT' AND FN_ID='SYS_AUTH' AND PARA_TYPE='AUTH';


			UPDATE SYSTEM_SETUP 
			SET PARA_BYTE = @EncCurrDate
			WHERE 
				PARA_DESCR='AUTH_SUCCESS_DT' AND FN_ID='SYS_AUTH' AND PARA_TYPE='AUTH';

		END
	ELSE
		BEGIN

			UPDATE SYSTEM_SETUP 
			-- SET PARA_BYTE = @EncDate
			SET PARA_BYTE = @EncCurrDate
			WHERE
				((CONVERT(nvarchar,DecryptByPassphrase(@Pass, PARA_BYTE, 1, CONVERT(varbinary, @PassAuthName))) = @EmptyString) OR PARA_BYTE IS NULL) AND 
				PARA_DESCR='AUTH_FAIL_DT' AND FN_ID='SYS_AUTH' AND PARA_TYPE='AUTH';

		END
	
Return

GO
/****** Object:  StoredProcedure [dbo].[UserLogout]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE Procedure UserLogout
CREATE Procedure [dbo].[UserLogout]
(
	@UserID NVARCHAR(100) = NULL,
	@ReturnDate NVARCHAR(100) Output,
	@ReturnFailDate NVARCHAR(100) Output,
	@ReturnSuccessDate NVARCHAR(100) Output
)
 
As

	DECLARE @Pass nvarchar(128) = 'yUDu6uFedru3';
	DECLARE @PassAuthName nvarchar(128) = 'ASL_PSMS_2013';
	-- DECLARE @CheckDate NVARCHAR(100) = CONVERT(VARCHAR(8), GETDATE(), 112);
	-- SET @DecResult = CONVERT(nvarchar,DecryptByPassphrase(@Pass, @EncResult, 1, CONVERT( varbinary, 'OscarOscar')));
	
	DECLARE @DecStartDate NVARCHAR(100);
	DECLARE @DecFailDate NVARCHAR(100);
	DECLARE @DecSuccessDate NVARCHAR(100);


	SELECT 
		@DecStartDate = CONVERT(nvarchar,DecryptByPassphrase(@Pass, PARA_BYTE, 1, CONVERT(varbinary, @PassAuthName)))
	FROM SYSTEM_SETUP
	WHERE PARA_DESCR='SERVER_STARTUP_DT' and FN_ID='SYS_AUTH' and PARA_TYPE='AUTH';

	SELECT 
		@DecFailDate = CONVERT(nvarchar,DecryptByPassphrase(@Pass, PARA_BYTE, 1, CONVERT(varbinary, @PassAuthName)))
	FROM SYSTEM_SETUP
	WHERE PARA_DESCR='AUTH_FAIL_DT' AND FN_ID='SYS_AUTH' AND PARA_TYPE='AUTH';

	SELECT 
		@DecSuccessDate = CONVERT(nvarchar,DecryptByPassphrase(@Pass, PARA_BYTE, 1, CONVERT(varbinary, @PassAuthName)))
	FROM SYSTEM_SETUP
	WHERE PARA_DESCR='AUTH_SUCCESS_DT' AND FN_ID='SYS_AUTH' AND PARA_TYPE='AUTH';

	/*
	SELECT
		PARA_DESCR, 
		CONVERT(nvarchar,DecryptByPassphrase(@Pass, PARA_BYTE, 1, CONVERT(varbinary, @PassAuthName)))
	FROM SYSTEM_SETUP
	WHERE FN_ID='SYS_AUTH' and PARA_TYPE='AUTH';
	*/


	SET @ReturnDate = @DecStartDate;
	SET @ReturnFailDate = @DecFailDate;
	SET @ReturnSuccessDate = @DecSuccessDate;

Return

GO
/****** Object:  StoredProcedure [dbo].[UserManualLogin]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE Procedure UserManualLogin
CREATE Procedure [dbo].[UserManualLogin]
(
	@LoginKey NVARCHAR(100) = NULL
)
 
As

	DECLARE @Pass NVARCHAR(128) = 'yUDu6uFedru3';
	DECLARE @PassAuthName NVARCHAR(128) = 'ASL_PSMS_2013';
	
	DECLARE @CurrDate NVARCHAR(100) = CONVERT(NVARCHAR(8), GETDATE(), 112);
	DECLARE @EncCurrDate varbinary(256);
	SET @EncCurrDate = EncryptByPassPhrase(@Pass, @CurrDate, 1, CONVERT( varbinary, @PassAuthName));

	IF (@LoginKey = 'xebetu8?bAd!upa')
		BEGIN

			UPDATE SYSTEM_SETUP 
			SET PARA_BYTE = @EncCurrDate
			WHERE 
				PARA_DESCR='AUTH_FAIL_DT' AND FN_ID='SYS_AUTH' AND PARA_TYPE='AUTH';


			UPDATE SYSTEM_SETUP 
			SET PARA_BYTE = @EncCurrDate
			WHERE 
				PARA_DESCR='AUTH_SUCCESS_DT' AND FN_ID='SYS_AUTH' AND PARA_TYPE='AUTH';

		END
	
Return

GO
/****** Object:  StoredProcedure [dbo].[Validation_Create]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE Procedure [dbo].[Validation_Create]
		(
			@BALLOT_POOL_ID INT,
			@PROJECT_ID  nvarchar(10),
			@REG_NO_DISPLAY nvarchar(20),
			
			@CO_NAME nvarchar(50),
			@CO_BRN nvarchar(30),
	
			@BUYER_CHI_NAME_1 nvarchar(50),
			@BUYER_ENG_NAME_1 nvarchar(100),
			@BUYER_ID_1 nvarchar(20),
			@BUYER_ID_IS_IDEN_1 nchar(1),
			@BUYER_NAT_CODE_1 nvarchar(6),
	
	
			@BUYER_CHI_NAME_2 nvarchar(50),
			@BUYER_ENG_NAME_2 nvarchar(100),
			@BUYER_ID_2 nvarchar(20),
			@BUYER_ID_IS_IDEN_2 nchar(1),
			@BUYER_NAT_CODE_2 nvarchar(6),

	
			@BUYER_CHI_NAME_3 nvarchar(50),
			@BUYER_ENG_NAME_3 nvarchar(100),
			@BUYER_ID_3 nvarchar(20),
			@BUYER_ID_IS_IDEN_3 nchar(1),
			@BUYER_NAT_CODE_3 nvarchar(6),
	
			@BUYER_CHI_NAME_4 nvarchar(50),
			@BUYER_ENG_NAME_4 nvarchar(100),
			@BUYER_ID_4 nvarchar(20),
			@BUYER_ID_IS_IDEN_4 nchar(1),
			@BUYER_NAT_CODE_4 nvarchar(6),
			@BUYER_Result NVarChar(20) Output,

	

			@REG_TYPE nvarchar(1),
	
			@BALLOT_POOL_REG_ID int,
			@Related_REG_NO_DISPLAY nvarchar(max) Output,
			@Related_CO_BRN nvarchar(max) Output,
			@SkipCheck nvarchar(1)


		)


		 
		As
			-- Declare @MaxApp int;
			Declare @NewTicketNo int;
			Declare @NewTicketID int;
			Declare @NewCURR_ID nvarchar(6);
			Declare @NewCURR_RATE numeric(10,4);
			Declare @NewDEPOSIT_AMT numeric(18,2);
			Declare @NewBALLOT_BATCH_ID int;
			Declare @CheckCOUNT int = null;
			--Declare @TICKET_NO_DISPLAY nvarchar(20);
			Declare @CheckBALLOT_BATCH_STATUS nchar(1);
			Declare @CheckBALLOT_Ticket_STATUS nchar(1);
			Declare @RecCount int;
			SET @BUYER_Result = Convert(NVarChar(20), 'X');
			DECLARE @BALLOT_POOL_STATUS NVARCHAR(1);
			DECLARE @BALLOT_REG_STATUS NVARCHAR(1);
			DECLARE @MAXPAYSEQ INT;
			DECLARE @MaxBPoolNo INT;
			DECLARE @BALLOT_REG_ID INT;
			Declare @old_Ballot_reg_id INT;
			DECLARE @NEW_REG_NO INT;
			DECLARE @NEW_REG_NO_DISPLAY NVARCHAR(20);
			DECLARE @SEED uniqueidentifier;
			DECLARE @BALLOT_POOL_NO INT;


			set @old_Ballot_reg_id=@BALLOT_POOL_REG_ID;
				set @Related_REG_NO_DISPLAY ='';
					set @Related_CO_BRN ='';


					/*
					
			@BUYER_Result
			S: Status is not correct
			P: Personal ID has been existed
			C: Company BRN has been existed
			M: Max. Combination Reached
			I: Pool ID is same as before
			Y: Add Ticket Success
					*/

			IF (@BUYER_ENG_NAME_1 = '')
			set @BUYER_ENG_NAME_1 = null
			IF (@BUYER_CHI_NAME_1 = '')
			set @BUYER_CHI_NAME_1 = null

			IF (@BUYER_ENG_NAME_2 = '')
			set @BUYER_ENG_NAME_2 = null
			IF (@BUYER_CHI_NAME_2 = '')
			set @BUYER_CHI_NAME_2 = null

			IF (@BUYER_ENG_NAME_3 = '')
			set @BUYER_ENG_NAME_3 = null
			IF (@BUYER_CHI_NAME_3 = '')
			set @BUYER_CHI_NAME_3 = null

			IF (@BUYER_ENG_NAME_4 = '')
			set @BUYER_ENG_NAME_4 = null
			IF (@BUYER_CHI_NAME_4 = '')
			set @BUYER_CHI_NAME_4 = null
	


			IF (@REG_NO_DISPLAY IS NOT NULL)
			BEGIN

			SELECT @BALLOT_REG_ID= BR.BALLOT_REG_ID
			FROM
			BALLOT_REG BR JOIN BALLOT_POOL_REG BPR ON BR.BALLOT_REG_ID= BPR.BALLOT_REG_ID
			WHERE BPR.BALLOT_POOL_REG_ID=@BALLOT_POOL_REG_ID
			END

			-- End 20151007

			-- Step 1.2: Get latest POOL batch (Batch Status, Max. App, Currency ID, Deposit Amount)

			SELECT 
				--@CheckBALLOT_BATCH_STATUS = BALLOT_BATCH_STATUS, @MaxApp = MAX_APP,@NewCURR_ID = DEPOSIT_CURR_ID, @NewDEPOSIT_AMT = DEPOSIT_AMT
				@BALLOT_POOL_STATUS=BALLOT_POOL_STATUS
				from BALLOT_POOL
				where BALLOT_POOL_ID=@BALLOT_POOL_ID
			--select @CheckBALLOT_Ticket_STATUS = TICKET_STATUS from BALLOT_TICKET WHERE TICKET_NO_DISPLAY = @TICKET_NO_DISPLAY

		DECLARE @checking BIT;
			set @checking =1 
			IF (@old_Ballot_reg_id is not null OR @SkipCheck='Y')
			BEGIN
			SET @checking =1 
			END

		Declare @NewLineChar nvarchar(10)='\n'
			if (@REG_TYPE<>'C' and @SkipCheck<>'Y')
			Begin
			IF (
				((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID  where BUYER_ID=@BUYER_ID_1 and @BUYER_ID_IS_IDEN_1=BUYER_ID_IS_IDEN and PROJECT_ID=@PROJECT_ID)>0) OR
				((select COUNT(*)  from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID  where BUYER_ID=@BUYER_ID_2 and @BUYER_ID_IS_IDEN_2=BUYER_ID_IS_IDEN and PROJECT_ID=@PROJECT_ID)>0)OR	
				((select COUNT(*)  from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID  where BUYER_ID=@BUYER_ID_3 and @BUYER_ID_IS_IDEN_3=BUYER_ID_IS_IDEN and PROJECT_ID=@PROJECT_ID)>0)OR
				((select COUNT(*)  from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID  where BUYER_ID=@BUYER_ID_4 and @BUYER_ID_IS_IDEN_4=BUYER_ID_IS_IDEN and PROJECT_ID=@PROJECT_ID)>0)
				)
				BEGIN 
				if ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID  where BUYER_ID=@BUYER_ID_1 and @BUYER_ID_IS_IDEN_1=BUYER_ID_IS_IDEN and PROJECT_ID=@PROJECT_ID)>0)
			begin
				set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+@NewLineChar+ @BUYER_CHI_NAME_1 +' -  ' + @BUYER_ID_1

				select @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
				from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID
				 where PROJECT_ID=@PROJECT_ID and ((BUYER_ID=@BUYER_ID_1 and @BUYER_ID_IS_IDEN_1=BUYER_ID_IS_IDEN)) order by REG_NO_DISPLAY
				
				set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
				
				end

					if ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID  where BUYER_ID=@BUYER_ID_2 and @BUYER_ID_IS_IDEN_2=BUYER_ID_IS_IDEN and PROJECT_ID=@PROJECT_ID)>0)
					Begin 
			
					set @Related_REG_NO_DISPLAY =  @Related_REG_NO_DISPLAY+@NewLineChar+ @BUYER_CHI_NAME_2 +' -  ' + @BUYER_ID_2

					select @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
					from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID
					 where PROJECT_ID=@PROJECT_ID and ((BUYER_ID=@BUYER_ID_2 and @BUYER_ID_IS_IDEN_2=BUYER_ID_IS_IDEN) )order by REG_NO_DISPLAY
				
				set @Related_REG_NO_DISPLAY = @NewLineChar+ @Related_REG_NO_DISPLAY+@NewLineChar
				
					end

				if ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID  where BUYER_ID=@BUYER_ID_3 and @BUYER_ID_IS_IDEN_3=BUYER_ID_IS_IDEN and PROJECT_ID=@PROJECT_ID)>0)
				Begin 
			
				set @Related_REG_NO_DISPLAY =  @Related_REG_NO_DISPLAY+@NewLineChar+@BUYER_CHI_NAME_3 +' -  '+ @BUYER_ID_3

				select @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
				from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID
				 where PROJECT_ID=@PROJECT_ID and ((BUYER_ID=@BUYER_ID_3 and @BUYER_ID_IS_IDEN_3=BUYER_ID_IS_IDEN))order by REG_NO_DISPLAY
				
				set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
				
				end

				if ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID  where BUYER_ID=@BUYER_ID_4 and @BUYER_ID_IS_IDEN_4=BUYER_ID_IS_IDEN and PROJECT_ID=@PROJECT_ID)>0)
				Begin 
			
				set @Related_REG_NO_DISPLAY =   @Related_REG_NO_DISPLAY+@NewLineChar+ @BUYER_CHI_NAME_4 +' -  ' + @BUYER_ID_4

				select @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
		from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID
		 where PROJECT_ID=@PROJECT_ID and ((BUYER_ID=@BUYER_ID_4 and @BUYER_ID_IS_IDEN_4=BUYER_ID_IS_IDEN) )order by REG_NO_DISPLAY
				
				set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
				
				end

				SET @checking =0
				SET @BUYER_Result ='P'
				END

				ELSE 
				BEGIN
					SET @checking =1
				END
			End


			 IF (@REG_TYPE<>'P' and @SkipCheck<>'Y')
			BEGIN 
				IF ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID   where CO_NAME=@CO_NAME and CO_BRN =@CO_BRN  and PROJECT_ID=@PROJECT_ID)>0)
				BEGIN 
				SET @checking =0
				SET @BUYER_Result ='C'
				set @Related_CO_BRN = @Related_REG_NO_DISPLAY +@NewLineChar + @CO_NAME +'  -  '+@CO_BRN
					select   @Related_CO_BRN= coalesce(@Related_CO_BRN + '\n', '') +REG_NO_DISPLAY from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID where  PROJECT_ID=@PROJECT_ID and (CO_BRN =@CO_BRN) 
						set @Related_CO_BRN =@Related_CO_BRN+@NewLineChar
				END
			ELSE 
				BEGIN
				if (@Related_REG_NO_DISPLAY='')
						BEGIN
						SET @checking =1
						END
						else
						BEGIN
						SET @checking =0
						END
				END
			END
		



		   IF(@BALLOT_POOL_STATUS = 'O')
			BEGIN
			if (@BALLOT_POOL_REG_ID is not null)
			begin
			if (@BALLOT_POOL_ID=(select BALLOT_POOL_ID from BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID))
						begin
							set @BUYER_Result='I' -- Pool Id is same as before
							set @checking=0
							end
			end
			
				IF (@checking=1)
				BEGIN


				SET @CheckCOUNT = [dbo].[SF_BallotTicketCount] 
				(
				@BALLOT_POOL_ID,@CO_NAME,@CO_BRN,
				@BUYER_CHI_NAME_1,@BUYER_ENG_NAME_1,@BUYER_ID_1,@BUYER_ID_IS_IDEN_1,@BUYER_NAT_CODE_1,
				@BUYER_CHI_NAME_2,@BUYER_ENG_NAME_2,@BUYER_ID_2,@BUYER_ID_IS_IDEN_2,@BUYER_NAT_CODE_2,
				@BUYER_CHI_NAME_3,@BUYER_ENG_NAME_3,@BUYER_ID_3,@BUYER_ID_IS_IDEN_3,@BUYER_NAT_CODE_3,
				@BUYER_CHI_NAME_4,@BUYER_ENG_NAME_4,@BUYER_ID_4,@BUYER_ID_IS_IDEN_4,@BUYER_NAT_CODE_4,
				null
				);
			If (@CheckCOUNT=-1)
			Begin
	
				SET @BUYER_Result = 'M'; -- Max. combination reached
			end
			ELSE
				BEGIN
				--if (@CheckCOUNT<>-1)
				--Begin
				--if (@SkipCheck <>'Y')
				--Begin
				--SET @Related_REG_NO_DISPLAY = [dbo].[SF_SameCombinationBuyer]
				--		(
				--@BALLOT_POOL_ID,@CO_NAME,@CO_BRN,
				--@BUYER_CHI_NAME_1,@BUYER_ENG_NAME_1,@BUYER_ID_1,@BUYER_ID_IS_IDEN_1,@BUYER_NAT_CODE_1,
				--@BUYER_CHI_NAME_2,@BUYER_ENG_NAME_2,@BUYER_ID_2,@BUYER_ID_IS_IDEN_2,@BUYER_NAT_CODE_2,
				--@BUYER_CHI_NAME_3,@BUYER_ENG_NAME_3,@BUYER_ID_3,@BUYER_ID_IS_IDEN_3,@BUYER_NAT_CODE_3,
				--@BUYER_CHI_NAME_4,@BUYER_ENG_NAME_4,@BUYER_ID_4,@BUYER_ID_IS_IDEN_4,@BUYER_NAT_CODE_4,
				--null
				--);

				--if (@REG_TYPE='P')
				--begin
				--SET @BUYER_Result = 'P'; -- Personal 
				--end
				--else 
				--begin
				--SET @BUYER_Result = 'C';
				--end

				--end
				--else
				--begin
				--set @BUYER_Result ='Y';
				--end
				--end
				--else
				--begin
				--end


						set @BUYER_Result='Y'
				END
		
				End
		ELSE 
				BEGIN
				SET @BUYER_Result=@BUYER_Result
					  -- CHECLKING FALSE
					 -- @BUYER_Result ='C' COMPANY BRN PROBLEM 
					 -- @BUYER_Result ='P'	PERSONAL ID PROBLEM
					  -- @BUYER_Result ='I'	Pool ID PROBLEM
				END
			END  
			ELSE
			BEGIN
			SET @BUYER_Result = 'S';			--POOL STATUS PROBLEM
			END

				
			
		Return
GO
/****** Object:  StoredProcedure [dbo].[Validation_Create_BA03]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE Procedure [dbo].[Validation_Create_BA03]
		(
		@BALLOT_POOL_REG_ID nvarchar(20),
			@PROJECT_ID  nvarchar(10),
			@REG_NO_DISPLAY nvarchar(20),
			
			@CO_NAME nvarchar(50),
			@CO_BRN nvarchar(30),
	
			@BUYER_CHI_NAME_1 nvarchar(50),
			@BUYER_ENG_NAME_1 nvarchar(100),
			@BUYER_ID_1 nvarchar(20),
			@BUYER_ID_IS_IDEN_1 nchar(1),
			@BUYER_NAT_CODE_1 nvarchar(6),
	
	
			@BUYER_CHI_NAME_2 nvarchar(50),
			@BUYER_ENG_NAME_2 nvarchar(100),
			@BUYER_ID_2 nvarchar(20),
			@BUYER_ID_IS_IDEN_2 nchar(1),
			@BUYER_NAT_CODE_2 nvarchar(6),

	
			@BUYER_CHI_NAME_3 nvarchar(50),
			@BUYER_ENG_NAME_3 nvarchar(100),
			@BUYER_ID_3 nvarchar(20),
			@BUYER_ID_IS_IDEN_3 nchar(1),
			@BUYER_NAT_CODE_3 nvarchar(6),
	
			@BUYER_CHI_NAME_4 nvarchar(50),
			@BUYER_ENG_NAME_4 nvarchar(100),
			@BUYER_ID_4 nvarchar(20),
			@BUYER_ID_IS_IDEN_4 nchar(1),
			@BUYER_NAT_CODE_4 nvarchar(6),
			@BUYER_Result NVarChar(20) Output,

	

			@REG_TYPE nvarchar(1),
	
			@Related_REG_NO_DISPLAY nvarchar(max) Output,
			@Related_CO_BRN nvarchar(max) Output,
			@SkipCheck nvarchar(1)


		)


		 
		As
			-- Declare @MaxApp int;
			Declare @NewTicketNo int;
			Declare @NewTicketID int;
			Declare @NewCURR_ID nvarchar(6);
			Declare @NewCURR_RATE numeric(10,4);
			Declare @NewDEPOSIT_AMT numeric(18,2);
			Declare @NewBALLOT_BATCH_ID int;
			Declare @CheckCOUNT int = null;
			--Declare @TICKET_NO_DISPLAY nvarchar(20);
			Declare @CheckBALLOT_BATCH_STATUS nchar(1);
			Declare @CheckBALLOT_Ticket_STATUS nchar(1);
			Declare @RecCount int;
			SET @BUYER_Result = Convert(NVarChar(20), 'X');
			DECLARE @BALLOT_POOL_STATUS NVARCHAR(1);
			DECLARE @BALLOT_REG_STATUS NVARCHAR(1);
			DECLARE @MAXPAYSEQ INT;
			DECLARE @MaxBPoolNo INT;
			DECLARE @BALLOT_REG_ID INT;
			Declare @old_Ballot_reg_id INT;
			DECLARE @NEW_REG_NO INT;
			DECLARE @NEW_REG_NO_DISPLAY NVARCHAR(20);
			DECLARE @SEED uniqueidentifier;
			DECLARE @BALLOT_POOL_NO INT;
				DECLARE @BALLOT_POOL_ID INT;
							
		Declare @NewLineChar nvarchar(10)='\n'
				Declare @checking bit ;
			set @old_Ballot_reg_id=@BALLOT_POOL_REG_ID;
				set @Related_REG_NO_DISPLAY ='';
					set @Related_CO_BRN ='';


		SELECT @BALLOT_POOL_ID=BALLOT_POOL_ID, @BALLOT_REG_ID= BALLOT_REG_ID, @BALLOT_REG_STATUS=BALLOT_REG_STATUS FROM BALLOT_POOL_REG WHERE BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID
		SELECT @NewCURR_ID = DEPOSIT_CURR_ID, @NewDEPOSIT_AMT = DEPOSIT_AMT , @BALLOT_POOL_STATUS = BALLOT_POOL_STATUS FROM BALLOT_POOL WHERE @BALLOT_POOL_ID=BALLOT_POOL_ID


	--@BUYER_Result
	--X: Fail
	--O: No Open Ballot Batch
	--M: Max. Combination Reached
	--Y: Add Ticket Success

		IF (@BUYER_ENG_NAME_1 = '')
		set @BUYER_ENG_NAME_1 = null
		IF (@BUYER_CHI_NAME_1 = '')
		set @BUYER_CHI_NAME_1 = null

		IF (@BUYER_ENG_NAME_2 = '')
		set @BUYER_ENG_NAME_2 = null
		IF (@BUYER_CHI_NAME_2 = '')
		set @BUYER_CHI_NAME_2 = null

		IF (@BUYER_ENG_NAME_3 = '')
		set @BUYER_ENG_NAME_3 = null
		IF (@BUYER_CHI_NAME_3 = '')
		set @BUYER_CHI_NAME_3 = null

		IF (@BUYER_ENG_NAME_4 = '')
		set @BUYER_ENG_NAME_4 = null
		IF (@BUYER_CHI_NAME_4 = '')
		set @BUYER_CHI_NAME_4 = null


	SET @checking =1
	
				set @checking=1;
			if (@REG_TYPE<>'C' and @SkipCheck<>'Y')
			Begin
			IF (
				((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID where BUYER_ID=@BUYER_ID_1 and @BUYER_ID_IS_IDEN_1=BUYER_ID_IS_IDEN and brb.BALLOT_REG_ID<>@BALLOT_REG_ID  and PROJECT_ID=@PROJECT_ID)>0) OR
				((select COUNT(*)  from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID where BUYER_ID=@BUYER_ID_2 and @BUYER_ID_IS_IDEN_2=BUYER_ID_IS_IDEN and brb.BALLOT_REG_ID<>@BALLOT_REG_ID  and PROJECT_ID=@PROJECT_ID)>0)OR	
				((select COUNT(*)  from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID where BUYER_ID=@BUYER_ID_3 and @BUYER_ID_IS_IDEN_3=BUYER_ID_IS_IDEN and brb.BALLOT_REG_ID<>@BALLOT_REG_ID  and PROJECT_ID=@PROJECT_ID)>0)OR
				((select COUNT(*)  from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID where BUYER_ID=@BUYER_ID_4 and @BUYER_ID_IS_IDEN_4=BUYER_ID_IS_IDEN and brb.BALLOT_REG_ID<>@BALLOT_REG_ID  and PROJECT_ID=@PROJECT_ID)>0)
				)
					BEGIN 
					if ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID where BUYER_ID=@BUYER_ID_1 and @BUYER_ID_IS_IDEN_1=BUYER_ID_IS_IDEN and brb.BALLOT_REG_ID<>@BALLOT_REG_ID  and PROJECT_ID=@PROJECT_ID)>0)
			begin
				set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+@NewLineChar+ @BUYER_CHI_NAME_1 +' -  ' + @BUYER_ID_1

				select @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
				from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID
				 where PROJECT_ID=@PROJECT_ID and ((BUYER_ID=@BUYER_ID_1 and @BUYER_ID_IS_IDEN_1=BUYER_ID_IS_IDEN)) and brb.BALLOT_REG_ID<>@BALLOT_REG_ID order by REG_NO_DISPLAY
				
				set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
				
				end

					if ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID where BUYER_ID=@BUYER_ID_2 and @BUYER_ID_IS_IDEN_2=BUYER_ID_IS_IDEN and brb.BALLOT_REG_ID<>@BALLOT_REG_ID  and PROJECT_ID=@PROJECT_ID)>0)
					Begin 
			
					set @Related_REG_NO_DISPLAY =  @Related_REG_NO_DISPLAY+@NewLineChar+ @BUYER_CHI_NAME_2 +' -  ' + @BUYER_ID_2

					select @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
					from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID
					 where PROJECT_ID=@PROJECT_ID and ((BUYER_ID=@BUYER_ID_2 and @BUYER_ID_IS_IDEN_2=BUYER_ID_IS_IDEN) )and brb.BALLOT_REG_ID<>@BALLOT_REG_ID order by REG_NO_DISPLAY
				
				set @Related_REG_NO_DISPLAY = @NewLineChar+ @Related_REG_NO_DISPLAY+@NewLineChar
				
					end

				if ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID where BUYER_ID=@BUYER_ID_3 and @BUYER_ID_IS_IDEN_3=BUYER_ID_IS_IDEN and brb.BALLOT_REG_ID<>@BALLOT_REG_ID  and PROJECT_ID=@PROJECT_ID)>0)
				Begin 
			
				set @Related_REG_NO_DISPLAY =  @Related_REG_NO_DISPLAY+@NewLineChar+@BUYER_CHI_NAME_3 +' -  '+ @BUYER_ID_3

				select @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID
 where PROJECT_ID=@PROJECT_ID and ((BUYER_ID=@BUYER_ID_3 and @BUYER_ID_IS_IDEN_3=BUYER_ID_IS_IDEN))and brb.BALLOT_REG_ID<>@BALLOT_REG_ID order by REG_NO_DISPLAY
				
				set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
				
				end

				if ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID where BUYER_ID=@BUYER_ID_4 and @BUYER_ID_IS_IDEN_4=BUYER_ID_IS_IDEN and brb.BALLOT_REG_ID<>@BALLOT_REG_ID  and PROJECT_ID=@PROJECT_ID)>0)
				Begin 
			
				set @Related_REG_NO_DISPLAY =   @Related_REG_NO_DISPLAY+@NewLineChar+ @BUYER_CHI_NAME_4 +' -  ' + @BUYER_ID_4

				select @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
		from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID
		 where PROJECT_ID=@PROJECT_ID and ((BUYER_ID=@BUYER_ID_4 and @BUYER_ID_IS_IDEN_4=BUYER_ID_IS_IDEN) )and brb.BALLOT_REG_ID<>@BALLOT_REG_ID order by REG_NO_DISPLAY
				
				set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
				
				end


		
				SET @checking =0
				SET @BUYER_Result ='P'
				END

				ELSE 
				BEGIN
					SET @checking =1
				END
			End


			 IF (@REG_TYPE<>'P' and @SkipCheck<>'Y')
			BEGIN 
				IF ((select COUNT(*) from ballot_reg_buyer brb join BALLOT_REG br on brb.BALLOT_REG_ID = br.BALLOT_REG_ID where CO_BRN =@CO_BRN and brb.BALLOT_REG_ID<>@BALLOT_REG_ID  and PROJECT_ID=@PROJECT_ID)>0)
					BEGIN 
				SET @checking =0
				SET @BUYER_Result ='C'
				set @Related_CO_BRN = @Related_REG_NO_DISPLAY +@NewLineChar + @CO_NAME +'  -  '+@CO_BRN
					select  @Related_CO_BRN= coalesce(@Related_CO_BRN + '\n', '') +REG_NO_DISPLAY from BALLOT_REG br join  ballot_reg_buyer brb on br.BALLOT_REG_ID=brb.BALLOT_REG_ID where  PROJECT_ID=@PROJECT_ID and (CO_BRN =@CO_BRN) and brb.BALLOT_REG_ID <> @BALLOT_REG_ID
						set @Related_CO_BRN =@Related_CO_BRN+@NewLineChar
				END
			ELSE 
				BEGIN
				if (@Related_REG_NO_DISPLAY='')
						BEGIN
						set @checking=1
						END
						else
						BEGIN
						SET @checking =0
						END
				END
			END



	
   IF(@BALLOT_POOL_STATUS IN ('O','F', 'I','B'))
	BEGIN
	IF(@BALLOT_REG_STATUS = 'N')
	BEGIN
		
		
				
	

		IF(@checking=1)
		BEGIN

			SET @CheckCOUNT = [dbo].[SF_BallotTicketCount] 
				(
				@BALLOT_POOL_ID,@CO_NAME,@CO_BRN,
				@BUYER_CHI_NAME_1,@BUYER_ENG_NAME_1,@BUYER_ID_1,@BUYER_ID_IS_IDEN_1,@BUYER_NAT_CODE_1,
				@BUYER_CHI_NAME_2,@BUYER_ENG_NAME_2,@BUYER_ID_2,@BUYER_ID_IS_IDEN_2,@BUYER_NAT_CODE_2,
				@BUYER_CHI_NAME_3,@BUYER_ENG_NAME_3,@BUYER_ID_3,@BUYER_ID_IS_IDEN_3,@BUYER_NAT_CODE_3,
				@BUYER_CHI_NAME_4,@BUYER_ENG_NAME_4,@BUYER_ID_4,@BUYER_ID_IS_IDEN_4,@BUYER_NAT_CODE_4,
				@BALLOT_POOL_REG_ID
				);
	If (@CheckCOUNT=-1)
	Begin
	SET @BUYER_Result = 'M'; -- Max. combination reached
	end
	ELSE
				BEGIN
				--if (@CheckCOUNT<>-1)
				--Begin
				--if (@SkipCheck <>'Y')
				--Begin
				--SET @Related_REG_NO_DISPLAY = [dbo].[SF_SameCombinationBuyer]
				--		(
				--@BALLOT_POOL_ID,@CO_NAME,@CO_BRN,
				--@BUYER_CHI_NAME_1,@BUYER_ENG_NAME_1,@BUYER_ID_1,@BUYER_ID_IS_IDEN_1,@BUYER_NAT_CODE_1,
				--@BUYER_CHI_NAME_2,@BUYER_ENG_NAME_2,@BUYER_ID_2,@BUYER_ID_IS_IDEN_2,@BUYER_NAT_CODE_2,
				--@BUYER_CHI_NAME_3,@BUYER_ENG_NAME_3,@BUYER_ID_3,@BUYER_ID_IS_IDEN_3,@BUYER_NAT_CODE_3,
				--@BUYER_CHI_NAME_4,@BUYER_ENG_NAME_4,@BUYER_ID_4,@BUYER_ID_IS_IDEN_4,@BUYER_NAT_CODE_4,
				--@BALLOT_POOL_REG_ID
				--);

				--if (@REG_TYPE='P')
				--begin
				--SET @BUYER_Result = 'P'; -- Personal 
				--end
				--else 
				--begin
				--SET @BUYER_Result = 'C';
				--end

				--end
				--else
				--begin
				--set @BUYER_Result ='Y';
				--end
				--end
				--else
				--begin
				--SET @BUYER_Result = 'M'; -- Max. combination reached
				--end
				--END
	
			SET @BUYER_Result = 'Y'
		End
		End
		ELSE
		BEGIN
	
				SET @BUYER_Result = @BUYER_Result;
				-- Has same Personal ID or Company BRn
		END

	END 
	ELSE
	BEGIN
		-- Not "Open" Batch
		-- Select @BUYER_Result = Convert(NVarChar(20), 'Not Open BUYER');
			SET @BUYER_Result = 'S';
			-- Status Problem
	END
	END 
	ELSE
	BEGIN
	SET @BUYER_Result = 'S';
	-- Status Problem
	END

	
	

Return
GO
/****** Object:  StoredProcedure [dbo].[VoidCarParkSale]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[VoidCarParkSale]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Approve_UID NVarChar(10),
	@Approve_FID NVarChar(10)
)
 
As

	Declare @Selection_Order NVarChar(30)
	Declare @Car_Park_ID NVarChar(80)

	Select @Selection_Order = Selection_Order
	From AM_BASE
	Where Project_ID = @Project_ID And AM_NO = @MOA_No


	Declare GetCarPark Cursor For
	Select Car_Park_ID
	From Car_Park
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Open GetCarPark
	Fetch GetCarPark Into @Car_Park_ID

	While @@Fetch_Status = 0
	Begin
		Insert Into Car_Park_Selection
			(Project_ID, Car_Park_ID, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
		Values
			(@Project_ID, @Car_Park_ID, @Selection_Order, N'D', GetDate(), @Approve_UID, @Approve_UID, @Approve_FID)

		Update Car_Park
		Set Status = N'R', MOA_No = Null, Last_Reserve_Date = GetDate(), Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID
		Where Project_ID = @Project_ID And Car_Park_ID = @Car_Park_ID

		Fetch GetCarPark Into @Car_Park_ID
	End

	Close GetCarPark
	Deallocate GetCarPark
Return
GO
/****** Object:  StoredProcedure [dbo].[VoidFlatSale]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[VoidFlatSale]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@Approve_UID NVarChar(10),
	@Approve_FID NVarChar(10)
)
 
As

	Declare @Selection_Order NVarChar(30)
	Declare @FM_Code NVarChar(80)

	Select @Selection_Order = Selection_Order
	From AM_BASE
	Where Project_ID = @Project_ID And AM_NO = @MOA_No

	Declare GetFlat Cursor For
	Select FM_Code
	From Flat_Master
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Open GetFlat
	Fetch GetFlat Into @FM_Code

	While @@Fetch_Status = 0
	Begin
		Insert Into	Flat_Selection
			(Project_ID, FM_Code, Selection_Order, Status, Update_Date, Approve_UID, Up_UID, Up_FID)
		Values
			(@Project_ID, @FM_Code, @Selection_Order, N'D', GetDate(), @Approve_UID, @Approve_UID, @Approve_FID)

		Update Flat_Master
		Set FM_Status = N'R', MOA_No = Null, Last_Reserve_Date = GetDate(), Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID
		Where Project_ID = @Project_ID And FM_Code = @FM_Code

		Fetch GetFlat Into @FM_Code
	End

	Close GetFlat
	Deallocate GetFlat
Return
GO
/****** Object:  StoredProcedure [dbo].[VoidFormal]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[VoidFormal]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Void_Remarks NVarchar(500),
	@Approve_UID NVarchar(10),
	@Output_Status NVarChar(3) output
)
 
As
	
	exec master..xp_ASL '[weKDisnmvie)}6&'
	
	Declare @CurStatus NVarChar(3)
	
	Select 
		@CurStatus = FORMAL_STATUS 
	from 
		MOA_FORMAL
	where
		PROJECT_ID = @Project_ID
		And MOA_NO + 'F' + Convert(varchar,FORMAL_SEQ) = @MOA_No
		
	If @CurStatus = 'O'
	Begin
		Update MOA_FORMAL
		Set FORMAL_STATUS = 'V', VOID_UID = @Approve_UID, VOID_DT = GETDATE(), VOID_REMARKS = @Void_Remarks,
			UP_DT = GETDATE(), UP_UID = @Approve_UID, UP_FID = 'FM0104'
		Where
			PROJECT_ID = @Project_ID
			And MOA_NO + 'F' + Convert(varchar,FORMAL_SEQ) = @MOA_NO
			And FORMAL_STATUS = 'O'
	End
	
	If @CurStatus = 'C'
	Begin
		Update MOA_FORMAL
		Set FORMAL_STATUS = 'X', VOID_UID = @Approve_UID, VOID_DT = GETDATE(), VOID_REMARKS = @Void_Remarks,
			UP_DT = GETDATE(), UP_UID = @Approve_UID, UP_FID = 'FM0104'		
		Where
			PROJECT_ID = @Project_ID
			And MOA_NO + 'F' + Convert(varchar,FORMAL_SEQ) = @MOA_NO
			And FORMAL_STATUS = 'C'
	End
	
	
Return
GO
/****** Object:  StoredProcedure [dbo].[VoidMOA]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP PROCEDURE [dbo].VoidMOA

CREATE Procedure [dbo].[VoidMOA]
(
	@Project_ID NVarChar(6),
	@MOA_No NVarChar(20),
	@IS_VOID_LOG NVarChar(1),
	@Void_Date nvarchar(20),
	@Void_Remarks NVarChar(500),
	@Approve_UID NVarChar(10),
	@Approve_FID NVarChar(10),
	@Void_UID NVarChar(10)
)
 
As
	Declare @Package_ID NVarChar(2)
	declare @VoidDate datetime
	set @VoidDate = Convert(DateTime,@Void_Date, 105)
	/*
	Declare @Reg_No NVarChar(7)
	Declare @Reg_Status Numeric

	Declare RegCursor Cursor For
	Select Distinct Reg_No, Orig_Reg_Status
	From MOA_Reg_Deposit
	Where Project_ID = @Project_ID And MOA_No = @MOA_No

	Open RegCursor
	Fetch Next From RegCursor
	Into @Reg_No, @Reg_Status

	While @@Fetch_Status = 0
	Begin
		Update Registration
		Set Reg_Status = @Reg_Status
		Where Project_ID = @Project_ID And Reg_No = @Reg_No

		Fetch Next From RegCursor
		Into @Reg_No, @Reg_Status
	End

	Close RegCursor
	Deallocate RegCursor
*/
select * from AM_PACKAGES
	Declare PackageCursor Cursor For
	Select Distinct Package_ID
	From AM_PACKAGES
	Where Project_ID = @Project_ID And AM_NO = @MOA_No

	Open PackageCursor
	Fetch Next From PackageCursor
	Into @Package_ID

	While @@Fetch_Status = 0
	Begin
		Exec ReleasePackage @Project_ID, @MOA_No, @Package_ID, @Approve_UID, @Approve_FID

		Fetch Next From PackageCursor
		Into @Package_ID
	End

	Close PackageCursor
	Deallocate PackageCursor

	Exec DeleteMOAPayment @MOA_No, @Project_ID, @Approve_UID, @Approve_FID

	--Update MOA
	--Set MOA_Status = N'V', MOA_Refund = @Void_Refund, MOA_Remarks = @Void_Remarks,
	--	Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID, Void_UID = @Void_UID
	--Where Project_ID = @Project_ID And MOA_No = @MOA_No
	
	--Update MOA_FORMAL
	--Set FORMAL_STATUS = N'V', REMARKS = @Void_Remarks,
	--	Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID, Void_UID = @Void_UID
	--Where Project_ID = @Project_ID And MOA_No = @MOA_


	update AM_BASE
	set AM_STATUS = N'V' ,IS_VOID_LOG=@IS_VOID_LOG , Void_Date=@VoidDate, VOID_REMARK= @Void_Remarks, 
	Up_Dt = GetDate(), Up_UID = @Approve_UID, Up_FID = @Approve_FID, Void_UID = @Void_UID
	where PROJECT_ID=@Project_ID and AM_NO=@MOA_No



Return
GO
/****** Object:  StoredProcedure [dbo].[VoidPaymentFollowup]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[VoidPaymentFollowup]
(
	@MOA_No NVarChar(20),
	@Project_ID NVarChar(6),
	@Paid_Sequence NVarChar(18),
	@Update_UID NVarChar(10),
	@Update_FID NVarChar(10)
)
 
As	
	Declare @Plan_Sequence Numeric
	Declare @Transaction_Sequence Int
	Declare @Transaction_Method NChar(1)
	Declare @Transaction_Date DateTime
	Declare @Transaction_Base_Currency NVarChar(6)
	Declare @Transaction_Base_Currency_Rate Numeric(5, 2)
	Declare @Transaction_Currency NVarChar(6)
	Declare @Transaction_Currency_Rate Numeric(5, 2)
	Declare @Transaction_Amount Numeric(18, 2)
	Declare @Bank_Code NVarChar(10)
	Declare @Transaction_Desc NVarChar(50)
	Declare @Paid_Amount Numeric(18, 2)
	Declare @Next_Transaction_Sequence Int

	Declare Transaction_Cursor Cursor For
	Select Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Date, Transact_Base_Curr_ID, Transact_Base_Curr_Rate,
		Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt, Bank_Code, Transact_Desc, Paid_Amt
	From AM_Payment_FU_Trans
	Where AM_No = @MOA_No And Project_ID = @Project_ID And Paid_Seq = Convert(Numeric(18, 0), @Paid_Sequence)

	Open Transaction_Cursor

	Fetch Next From Transaction_Cursor
	Into @Plan_Sequence, @Transaction_Sequence, @Transaction_Method, @Transaction_Date,
		@Transaction_Base_Currency, @Transaction_Base_Currency_Rate, @Transaction_Currency, @Transaction_Currency_Rate,
		@Transaction_Amount, @Bank_Code, @Transaction_Desc, @Paid_Amount

	While @@Fetch_Status = 0
	Begin
		Update AM_PAYMENT_PLAN
		Set Py_Status = Null, Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		Where AM_No = @MOA_No And Project_ID = @Project_ID And Py_Plan_Seq = @Plan_Sequence
	
		Select @Next_Transaction_Sequence = IsNull(Max(Transact_Seq), 0) + 1
		From AM_Payment_FU_Trans
		Where AM_No = @MOA_No And Project_ID = @Project_ID And Py_Plan_Seq = @Plan_Sequence

		Update AM_Payment_FU_Trans
		--BEGIN #20070305
		Set Transact_Status = N'V', Up_Dt = GetDate(), Up_UID = @Update_UID, Up_FID = @Update_FID
		--END #20070305
		Where AM_No = @MOA_No And Project_ID = @Project_ID And Py_Plan_Seq = @Plan_Sequence And Transact_Seq = @Transaction_Sequence

		--BEGIN #20070305
		Insert Into AM_Payment_FU_Trans
			(AM_No, Project_ID, Py_Plan_Seq, Transact_Seq, Transact_Method, Transact_Status, Transact_Date,
			Transact_Base_Curr_ID, Transact_Base_Curr_Rate, Transact_Curr_ID, Transact_Curr_Rate, Transact_Amt,
			Master_Trans_Seq, Bank_Code, Transact_Desc, Paid_Amt, Paid_Seq,
			Up_Uid, Up_Fid, Up_Dt, Cr_UID, Cr_FID, Cr_DT)
		Values
			(@MOA_No, @Project_ID, @Plan_Sequence, @Next_Transaction_Sequence, @Transaction_Method, Null, @Transaction_Date,
			@Transaction_Base_Currency, @Transaction_Base_Currency_Rate, @Transaction_Currency, @Transaction_Currency_Rate,
			-@Transaction_Amount, @Transaction_Sequence, @Bank_Code, @Transaction_Desc, -@Paid_Amount, Null,
			@Update_UID, @Update_FID, GetDate(),@Update_UID, @Update_FID, GetDate())
		--END #20070305

		Fetch Next From Transaction_Cursor
		Into @Plan_Sequence, @Transaction_Sequence, @Transaction_Method, @Transaction_Date,
			@Transaction_Base_Currency, @Transaction_Base_Currency_Rate, @Transaction_Currency, @Transaction_Currency_Rate,
			@Transaction_Amount, @Bank_Code, @Transaction_Desc, @Paid_Amount
	End

	Close Transaction_Cursor
	Deallocate Transaction_Cursor
Return
GO
/****** Object:  StoredProcedure [dbo].[xp_ASL]    Script Date: 10/12/2018 11:23:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xp_ASL]
	@Key [varchar](16)
WITH  EXECUTE AS CALLER
AS
BEGIN
	Return 0
END
GO
