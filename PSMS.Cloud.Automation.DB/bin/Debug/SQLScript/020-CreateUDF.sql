USE [<<DBNAME>>]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertAmtB5]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ConvertAmtB5]	(@dollar_amt	money,
			 	@options	smallint)

returns	nvarchar(4000)

 

as
begin


/*
	@options:	1 (Converting the input money to English version (sample output: ****$543元0角****))
			4 (Perform cheque foramt (sample output: $543元零角))
			
			else (sample output: 伍佰肆拾叁元叁元)
*/

declare	@dollar_temp	bigint,        
	@dollar_bigint	bigint,
	@dollar_temp_2	bigint,
	@dollar_bigint_2	bigint,
	@temp_text	nvarchar(4000),
	@temp_text_2	nvarchar(4000),
	@temp_text_3	nvarchar(4000),
	@bookmark	tinyint,
	@org_amt	money,
	@final		nvarchar(4000)

select @org_amt = @dollar_amt

if @dollar_amt = 0
begin
	select @final = N'零元'
	goto EndSection
end

--Return original value if >= trillion
if (@dollar_amt - 999999999999) > 0
begin
	select @temp_text_2 = convert (nvarchar, @dollar_amt) + N'元'
	goto EndSection
end

	
if @options = 1 
begin	
	select	@temp_text	= convert(nvarchar, @dollar_amt)
	select	@dollar_bigint_2 	= convert(bigint, substring(@temp_text, 1, datalength(@temp_text) - 3))

	select	@temp_text_2 	= '****' + convert(nvarchar, convert(bigint, @dollar_bigint_2)) + N'元' + convert(varchar, convert(bigint,(@dollar_amt - @dollar_bigint_2)*100)) + N'角'+ '****'
	
	goto EndSection
end

if @options = 4 
begin	
	select	@temp_text	= convert(nvarchar, @dollar_amt)
	select	@dollar_bigint_2	= convert(bigint, substring(@temp_text, 1, datalength(@temp_text) - 3))
	select  @dollar_bigint	= convert(bigint,(@dollar_amt - @dollar_bigint_2) * 100)

	if @dollar_bigint = 0 
		select	@temp_text_2	= N'零'
	else
		select	@temp_text_2 	= convert(nvarchar, @dollar_bigint)
	
	select	@temp_text_2	= '$' + convert(nvarchar, convert(bigint, @dollar_bigint_2)) + N'元' + @temp_text_2 + N'角'
	
	goto EndSection
end
--New add billion


select	@dollar_bigint_2	= convert(bigint, convert(real, @dollar_amt / 100000000))

if @dollar_bigint_2 >= 1
begin
	select	@bookmark	= 0,
		@dollar_temp	= @dollar_bigint_2

	goto ConvertThousand

BillionSection:
  	select	@temp_text_2	= isnull(@temp_text, '') + N'億'

	select	@dollar_amt	= @dollar_amt - (@dollar_bigint_2 * 100000000)   
end

--new add billion end
select	@dollar_bigint_2	= convert(bigint, convert(real, @dollar_amt / 10000))

if @dollar_bigint_2 >= 1
begin
	select	@bookmark	= 1,
		@dollar_temp	= @dollar_bigint_2

	goto ConvertThousand

MillionSection:
  	select	@temp_text_2	= isnull(@temp_text_2, '') + isnull(@temp_text, '') + N'萬'

	select	@dollar_amt	= @dollar_amt - (@dollar_bigint_2 * 10000)   
end
/*
select	@dollar_bigint_2 = convert(bigint, convert(real, @dollar_amt / 1000))

if @dollar_bigint_2 >=1
begin  
	select	@bookmark	= 2,
		@dollar_temp	= @dollar_bigint_2

	goto ConvertHundred


ThousandSection:
  	select	@temp_text_2	= isnull(@temp_text_2, '') + isnull(@temp_text, '') + N'仟'

	select	@dollar_amt	= @dollar_amt - (@dollar_bigint_2 * 1000) 
end
*/
select	@dollar_bigint_2	= convert(bigint, convert(real, @dollar_amt))
	





select	@bookmark	= 2,
	@dollar_temp	= @dollar_bigint_2

goto ConvertThousand



ThousandSection:

select	@temp_text_2	= isnull(@temp_text_2, '') + isnull(@temp_text, '')








if isnull(@temp_text_2, '') <> ''
	select	@temp_text_2	= isnull(@temp_text_2, '') + N'元'


select @final = @temp_text_2



--------------Unit Area


--select	@dollar_amt	= (@dollar_amt - convert(money, @dollar_bigint_2))
select @dollar_amt	=	@org_amt - floor(@org_amt)


if @dollar_amt > 0
begin
		select	@dollar_bigint	= convert(bigint, convert(real, @dollar_amt * 100))

		--Unit (角)


		select	@dollar_bigint_2	= convert(bigint, convert(real, @dollar_bigint / 10))
		
		if @dollar_bigint_2 >= 1
		begin
			select	@bookmark	= 3
		
			goto ConvertUnit
		
		UnitKSection:
		  	select	@temp_text_2	= isnull(@temp_text_3, '') + N'角'
		
			select	@dollar_bigint	= @dollar_bigint - (@dollar_bigint_2 * 10)   
		end
		
		--Unit (角) end



		--Unit (分)


		select	@dollar_bigint_2	= convert(bigint, convert(real, @dollar_bigint))
		
		if @dollar_bigint_2 >= 1
		begin
			select	@bookmark	= 4
		
			goto ConvertUnit
		
		UnitFSection:
		  	select	@temp_text_2	= isnull(@temp_text_2, '') + isnull(@temp_text_3, '') + N'分'
		
		end
		
		--Unit (分) end

		select @final = isnull(@final, '') + isnull(@temp_text_2, '')
end



-------------End of Unit Area

goto EndSection

ConvertThousand:

select	@temp_text	= N''

select 	@dollar_bigint	= convert(bigint, @dollar_temp / 1000)
	
if @dollar_bigint >=1 
begin
	select	@temp_text	= isnull(@temp_text, '') +  case @dollar_bigint
				when 1
				then N'壹仟'
				when 2
				then N'貳仟'
				when 3
				then N'叁仟'
				when 4
				then N'肆仟'
				when 5
				then N'伍仟'
				when 6
				then N'陸仟'
				when 7
				then N'柒仟'
				when 8
				then N'捌仟'
				when 9
				then N'玖仟'


			  end

	select	@dollar_temp	= @dollar_temp - (@dollar_bigint * 1000)   	
end     

select 	@dollar_bigint	= convert(bigint, @dollar_temp / 100)
	
if @dollar_bigint >=1 
begin
	select	@temp_text	= isnull(@temp_text, '') + case @dollar_bigint
				when 1
				then N'壹佰'
				when 2
				then N'貳佰'
				when 3
				then N'叁佰'
				when 4
				then N'肆佰'
				when 5
				then N'伍佰'
				when 6
				then N'陸佰'
				when 7
				then N'柒佰'
				when 8
				then N'捌佰'
				when 9
				then N'玖佰'
			  end

	select	@dollar_temp	= @dollar_temp - (@dollar_bigint * 100)   	
end      
/*
if @bookmark = 3 and @options = 9181 and @dollar_temp > 0 
	select	@temp_text	= isnull(@temp_text, '') + 'and '
*/
select	@dollar_bigint = convert(bigint, @dollar_temp / 10)

if @dollar_bigint = 1
begin
	select	@temp_text	= isnull(@temp_text, '') + case
								when isnull(@temp_text, '') = ''
								then N'拾'
								when isnull(@temp_text, '') != ''
								then N'壹拾'
							   end
	select	@dollar_temp	= @dollar_temp - (@dollar_bigint * 10)
end

else if @dollar_bigint > 1
begin
   	select	@temp_text	= isnull(@temp_text, '') + case @dollar_bigint															
								when 2
								then N'貳拾'
								when 3
								then N'叁拾'
								when 4
								then N'肆拾'
								when 5
								then N'伍拾'
								when 6
								then N'陸拾'
								when 7
								then N'柒拾'
								when 8
								then N'捌拾'
								when 9
								then N'玖拾'
							   end

   	select	@dollar_temp	= @dollar_temp - (@dollar_bigint * 10)
end

if @dollar_temp <> 0 
begin
	select @temp_text	= isnull(@temp_text, '') + case @dollar_temp
								when 1
								then N'壹'
								when 2
								then N'貳'
								when 3
								then N'叁'
								when 4
								then N'肆'
								when 5
								then N'伍'
								when 6
								then N'陸'
								when 7
								then N'柒'
								when 8
								then N'捌'
								when 9
								then N'玖'
							   end
end	
goto AnotherSection		

ConvertUnit:
if @dollar_bigint_2 <> 0 
begin
	select @temp_text_3	= ''
	select @temp_text_3	= case @dollar_bigint_2
									when 1
									then N'壹'
									when 2
									then N'貳'
									when 3
									then N'叁'
									when 4
									then N'肆'
									when 5
									then N'伍'
									when 6
									then N'陸'
									when 7
									then N'柒'
									when 8
									then N'捌'
									when 9
									then N'玖'
	else 'dddddddddddddd'
								   end
end					
goto AnotherSection

AnotherSection:
if @bookmark = 0 goto BillionSection
else if @bookmark = 1 goto MillionSection
--else if @bookmark = 2 goto ThousandSection
else if @bookmark = 2 goto ThousandSection
--else if @bookmark = 3 goto UnitSection
else if @bookmark = 3 goto UnitKSection
else if @bookmark = 4 goto UnitFSection


EndSection:

return(@final)


end
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertAmtEN]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ConvertAmtEN]	(@dollar_amt	money,
			 	@options	smallint)

returns	varchar(8000)

 

as
begin


/*
	@options:	1 (Converting the input money to English version (sample output: ****543 DOLLARS 0 CENTS****))
			4 (Perform cheque foramt (sample output: $543dollars0cents))
			
			else (sample output: FIVE HUNDRED FORTY THREE DOLLARS and TWENTY ONE CENTS)
*/

declare	@dollar_temp	bigint,        
	@dollar_bigint	bigint,
	@dollar_temp_2	bigint,
	@dollar_bigint_2	bigint,
	@temp_text	varchar(8000),
	@temp_text_2	varchar(8000),
	@bookmark	tinyint


--Return original value if >= trillion
if (@dollar_amt - 999999999999) > 0
begin
	select @temp_text_2 = convert (varchar, @dollar_amt) + ' DOLLARS'
	goto EndSection
end

	
if @options = 1 
begin	
	select	@temp_text	= convert(varchar, @dollar_amt)
	select	@dollar_bigint_2 	= convert(bigint, substring(@temp_text, 1, datalength(@temp_text) - 3))

	select	@temp_text_2 	= '****' + convert(varchar, convert(bigint, @dollar_bigint_2)) + ' DOLLARS ' + convert(varchar, convert(bigint,(@dollar_amt - @dollar_bigint_2)*100)) + ' CENTS'+ '****'
	
	goto EndSection
end

if @options = 4 
begin	
	select	@temp_text	= convert(varchar, @dollar_amt)
	select	@dollar_bigint_2	= convert(bigint, substring(@temp_text, 1, datalength(@temp_text) - 3))
	select  @dollar_bigint	= convert(bigint,(@dollar_amt - @dollar_bigint_2) * 100)

	if @dollar_bigint = 0 
		select	@temp_text_2	= '00'
	else
		select	@temp_text_2 	= convert(varchar, @dollar_bigint)
	
	select	@temp_text_2	= '$' + convert(varchar, convert(bigint, @dollar_bigint_2)) + 'DOLLARS' + @temp_text_2 + 'CENTS'
	
	goto EndSection
end
--New add billion


select	@dollar_bigint_2	= convert(bigint, convert(real, @dollar_amt / 1000000000))

if @dollar_bigint_2 >= 1
begin
	select	@bookmark	= 0,
		@dollar_temp	= @dollar_bigint_2

	goto ConvertHundred

BillionSection:
  	select	@temp_text_2	= isnull(@temp_text, '') + 'BILLION '

	select	@dollar_amt	= @dollar_amt - (@dollar_bigint_2 * 1000000000)   
end

--new add billion end
select	@dollar_bigint_2	= convert(bigint, convert(real, @dollar_amt / 1000000))

if @dollar_bigint_2 >= 1
begin
	select	@bookmark	= 1,
		@dollar_temp	= @dollar_bigint_2

	goto ConvertHundred

MillionSection:
  	select	@temp_text_2	= isnull(@temp_text_2, '') + isnull(@temp_text, '') + 'MILLION '

	select	@dollar_amt	= @dollar_amt - (@dollar_bigint_2 * 1000000)   
end

select	@dollar_bigint_2 = convert(bigint, convert(real, @dollar_amt / 1000))

if @dollar_bigint_2 >=1
begin  
	select	@bookmark	= 2,
		@dollar_temp	= @dollar_bigint_2

	goto ConvertHundred

ThousandSection:
  	select	@temp_text_2	= isnull(@temp_text_2, '') + isnull(@temp_text, '') + 'THOUSAND '

	select	@dollar_amt	= @dollar_amt - (@dollar_bigint_2 * 1000) 
end

select	@dollar_bigint_2	= convert(bigint, convert(real, @dollar_amt))
	
select	@bookmark	= 3,
	@dollar_temp	= @dollar_bigint_2

goto ConvertHundred

HundredSection:

select	@temp_text_2	= isnull(@temp_text_2, '') + isnull(@temp_text, '')

if isnull(@temp_text_2, '') <> ''
	select	@temp_text_2	= isnull(@temp_text_2, '') + 'DOLLARS '

select	@dollar_amt	= @dollar_amt - convert(money, @dollar_bigint_2)

if @dollar_amt > 0
begin
	/*
	if @options = 9181   --CMG format
	begin
		if isnull(@temp_text_2, '') = '' 
			select	@temp_text_2	= 'ZERO DOLLAR ' + substring(convert(varchar, convert(real, @dollar_amt) * 100), 1, 2) + '/100'		
		else
			select	@temp_text_2 	= isnull(upper(ltrim(rtrim(@temp_text_2))), '') + '. ' +  substring(convert(varchar, @dollar_amt * 100), 1, 2) + '/100'
	end
	
	else	
	begin
	*/
   		select	@dollar_bigint_2	= convert(bigint, convert(real, @dollar_amt * 100))

		select	@bookmark	= 4,
			@dollar_temp	= @dollar_bigint_2

		goto ConvertHundred

DecimalSection:
		if isnull(@temp_text_2, '') <> ''
			select	@temp_text_2	= isnull(@temp_text_2, '') + 'and '

		select	@temp_text_2	= isnull(@temp_text_2, '') + isnull(@temp_text, '') + 'CENTS'
	--end
end

goto EndSection

ConvertHundred:

select	@temp_text	= '',
	@dollar_bigint	= convert(bigint, @dollar_temp / 100)
	
if @dollar_bigint >=1 
begin
	select	@temp_text	= case @dollar_bigint
				when 1
				then 'ONE HUNDRED '
				when 2
				then 'TWO HUNDRED '
				when 3
				then 'THREE HUNDRED '
				when 4
				then 'FOUR HUNDRED '
				when 5
				then 'FIVE HUNDRED '
				when 6
				then 'SIX HUNDRED '
				when 7
				then 'SEVEN HUNDRED '
				when 8
				then 'EIGHT HUNDRED '
				when 9
				then 'NINE HUNDRED '
			  end

	select	@dollar_temp	= @dollar_temp - (@dollar_bigint * 100)   	
end      
/*
if @bookmark = 3 and @options = 9181 and @dollar_temp > 0 
	select	@temp_text	= isnull(@temp_text, '') + 'and '
*/
select	@dollar_bigint = convert(bigint, @dollar_temp / 10)

if @dollar_bigint >= 2
begin
   	select	@temp_text	= isnull(@temp_text, '') + case @dollar_bigint
								when 2
								then 'TWENTY '
								when 3
								then 'THIRTY '
								when 4
								then 'FORTY '
								when 5
								then 'FIFTY '
								when 6
								then 'SIXTY '
								when 7
								then 'SEVENTY '
								when 8
								then 'EIGHTY '
								when 9
								then 'NINETY '
							   end

   	select	@dollar_temp	= @dollar_temp - (@dollar_bigint * 10)
end

if @dollar_temp <> 0 
begin
	select @temp_text	= isnull(@temp_text, '') + case @dollar_temp
								when 1
								then 'ONE '
								when 2
								then 'TWO '
								when 3
								then 'THREE '
								when 4
								then 'FOUR '
								when 5
								then 'FIVE '
								when 6
								then 'SIX '
								when 7
								then 'SEVEN '
								when 8
								then 'EIGHT '
								when 9
								then 'NINE '
								when 10
								then 'TEN '
								when 11
								then 'ELEVEN '
								when 12
								then 'TWELVE '
								when 13
								then 'THIRTEEN '
								when 14
								then 'FOURTEEN '
								when 15
								then 'FIFTEEN '
								when 16
								then 'SIXTEEN '
								when 17
								then 'SEVENTEEN '
								when 18
								then 'EIGHTEEN '
								when 19
								then 'NINETEEN '
							   end
end


if @bookmark = 0 goto BillionSection
else if @bookmark = 1 goto MillionSection
else if @bookmark = 2 goto ThousandSection
else if @bookmark = 3 goto HundredSection
else if @bookmark = 4 goto DecimalSection


EndSection:

return(@temp_text_2)



end
GO
/****** Object:  UserDefinedFunction [dbo].[GetLimit]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetLimit](@projectid [nvarchar](20))
RETURNS @Info TABLE (
	[CURRENT_COUNT] [int] NULL,
	[LIMIT] [int] NULL,
	[HASHKEY] [varbinary](60) NULL
) WITH  EXECUTE AS CALLER
AS BEGIN
DECLARE @LIMIT int = 9999

INSERT @Info 
select  count(1), @LIMIT, HASHBYTES ('SHA2_256',CONCAT(count(1),',', @LIMIT,',', @projectid))
from FLAT_MASTER 
WHERE
PROJECT_ID = @projectid

RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[SF_AUDIT_FormatColumn]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_AUDIT_FormatColumn](@column [nvarchar](max))
RETURNS [nvarchar](4000) WITH  EXECUTE AS CALLER
AS Begin
	If Len(@column) > 2
	Begin
		Select @column = Left(@column, Len(@column) - 2)
	End

	Return Left(@column, 4000)
End
GO
/****** Object:  UserDefinedFunction [dbo].[SF_Ballot_GetCFID]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[SF_Ballot_GetCFID]
(
	@BallotPoolID int,
	@BallotRegID int
)
Returns int
 
Begin

	DECLARE @Return_ID int;

	SELECT @Return_ID = BALLOT_POOL_REG_ID 
	FROM BALLOT_POOL_REG 
	WHERE BALLOT_POOL_ID = @BallotPoolID AND BALLOT_REG_ID = @BallotRegID;
	
	Return @Return_ID;

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_BallotAppName]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[SF_BallotAppName]
(
	@TICKET_ID INT

)
Returns NVARCHAR(MAX)  
Begin

	DECLARE @ReturnBuyer NVARCHAR(MAX)

	SELECT
		@ReturnBuyer = COALESCE(@ReturnBuyer+', ', '') + BuyerName
	FROM
	(
		SELECT ISNULL(CO_NAME,ISNULL(BUYER_ENG_NAME,BUYER_CHI_NAME)) BuyerName, BUYER_SEQ
		from BALLOT_REG_BUYER
		WHERE
			BALLOT_REG_ID = @TICKET_ID  and buyer_seq <>6
	) tmp
	ORDER BY BUYER_SEQ

	Return @ReturnBuyer

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_BallotSameID]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log
-- #20151011 Modified by Tommyay on 2015-10-11 , Change the stored for new structure.

CREATE Function [dbo].[SF_BallotSameID]
(
	@TicketID INT,
	@BALLOT_BATCH_ID INT

)
Returns NVARCHAR(MAX)  
Begin

	DECLARE 
		@ReturnDisplayTicket NVARCHAR(MAX),
		@BuyerCount INT,
		@BatchID INT;

	
	SELECT @BuyerCount = COUNT(*) FROM BALLOT_REG_BUYER WHERE BALLOT_REG_ID = @TicketID;
	-- SELECT @BatchID = BALLOT_BATCH_ID FROM BALLOT_TICKET bt WHERE TICKET_ID = @TicketID;
	SET @BATCHID = @BALLOT_BATCH_ID

	SELECT @ReturnDisplayTicket = COALESCE(@ReturnDisplayTicket + ', ', '') + dt.REG_NO_DISPLAY 
	FROM 
		BALLOT_REG dt
		JOIN 
		(
		-- Begin 20151011
			SELECT bt.BALLOT_REG_ID
			FROM 
				BALLOT_REG_BUYER bb
				JOIN (SELECT BALLOT_REG_ID, COUNT(*) RecCount FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID) bc 
					ON bb.BALLOT_REG_ID = bc.BALLOT_REG_ID AND bc.RecCount = @BuyerCount
				JOIN BALLOT_REG bt ON bb.BALLOT_REG_ID = bt.BALLOT_REG_ID
				JOIN BALLOT_POOL_REG BPR ON BALLOT_BATCH_ID =@BatchID
				JOIN 
					(SELECT BUYER_ID, BUYER_ID_IS_IDEN, BUYER_NAT_CODE, CO_BRN FROM BALLOT_REG_BUYER WHERE BALLOT_REG_ID = @TicketID) tmp
						ON 
						-- bb.BUYER_ID = tmp.BUYER_ID AND bb.BUYER_ID_IS_IDEN = tmp.BUYER_ID_IS_IDEN AND bb.BUYER_NAT_CODE = tmp.BUYER_NAT_CODE
						(
							bb.BUYER_ID = tmp.BUYER_ID AND 
							bb.BUYER_ID_IS_IDEN = tmp.BUYER_ID_IS_IDEN AND 
							bb.BUYER_NAT_CODE = tmp.BUYER_NAT_CODE AND 
							tmp.CO_BRN IS NULL AND bb.CO_BRN IS NULL
						) OR (
							bb.BUYER_ID IS NULL AND tmp.BUYER_ID IS NULL AND 
							bb.BUYER_ID_IS_IDEN IS NULL AND tmp.BUYER_ID_IS_IDEN IS NULL AND 
							bb.BUYER_NAT_CODE = tmp.BUYER_NAT_CODE AND 
							tmp.CO_BRN = bb.CO_BRN
						)
			GROUP BY bt.BALLOT_REG_ID
			HAVING COUNT(*) = @BuyerCount
		) l ON dt.BALLOT_REG_ID = l.BALLOT_REG_ID
	ORDER BY dt.BALLOT_REG_ID ASC;

	-- End 20151011

	Return @ReturnDisplayTicket;

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_BallotTicketCount]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log
-- #2015107 Modified by Tommyay on 2015-10-07 , Change the stored for new structure.


CREATE Function [dbo].[SF_BallotTicketCount]
(
    @BALLOT_POOL_ID int,
    
	@CompanyName     nvarchar(50),			
	@CompanyBR       nvarchar(30),

	@BuyerChiName_1  nvarchar(50),
	@BuyerengName_1  nvarchar(100),
	@BuyerID_1       nvarchar(20),
	@Buyeridisiden_1 nchar(1),
	@Buyernatcode_1  nvarchar(6),

	@BuyerChiName_2  nvarchar(50),
	@BuyerengName_2  nvarchar(100),
	@BuyerID_2       nvarchar(20),
	@Buyeridisiden_2 nchar(1),
	@Buyernatcode_2  nvarchar(6),

	@BuyerChiName_3  nvarchar(50),
	@BuyerengName_3  nvarchar(100),
	@BuyerID_3       nvarchar(20),
	@Buyeridisiden_3 nchar(1),
	@Buyernatcode_3  nvarchar(6),

	@BuyerChiName_4  nvarchar(50),
	@BuyerengName_4  nvarchar(100),
	@BuyerID_4       nvarchar(20),
	@Buyeridisiden_4 nchar(1),
	@Buyernatcode_4  nvarchar(6),
	@BALLOT_POOL_REG_ID int
)
Returns Int  
Begin
    Declare @MaxApp int;
    Declare @CheckCOUNT int = null;
	Declare @ReturnCount Int = 0;
	Declare @BALLOT_REG_ID Int = 0;
	if (@BALLOT_POOL_REG_ID is null)

	set @BALLOT_POOL_REG_ID=-1


	--SELECT @BALLOT_POOL_ID= BALLOT_POOL_ID, @BALLOT_REG_ID=BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE @BALLOT_POOL_REG_ID=BALLOT_POOL_REG_ID
	
	

	select @MaxApp = MAX_APP from BALLOT_POOL where BALLOT_POOL_ID = @BALLOT_POOL_ID;
    if(@MaxApp=0)
    BEGIN
    set @MaxApp = 99999
    End

	if (@CompanyName is null)
	Begin
    IF(@BuyerChiName_4 IS NOT NULL or @BuyerengName_4 is not null)
    BEGIN
    SELECT  @CheckCOUNT = COUNT(*)
		FROM
		(
			SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
				BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 4)
				AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2) OR
						(BUYER_ID = @BuyerID_3 AND BUYER_ID_IS_IDEN = @Buyeridisiden_3 AND BUYER_NAT_CODE = @Buyernatcode_3) OR
						(BUYER_ID = @BuyerID_4 AND BUYER_ID_IS_IDEN = @Buyeridisiden_4 AND BUYER_NAT_CODE = @Buyernatcode_4)
					)
				And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
					
			GROUP BY BALLOT_REG_ID
			HAVING COUNT(*) >= 4
		) tmp
    End
    ELSE IF(@BuyerChiName_3 IS NOT NULL or @BuyerengName_3 is not null)	
	BEGIN
	SELECT  @CheckCOUNT = COUNT(*)
		FROM
		(
			SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
				BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 3)
							AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2) OR
						(BUYER_ID = @BuyerID_3 AND BUYER_ID_IS_IDEN = @Buyeridisiden_3 AND BUYER_NAT_CODE = @Buyernatcode_3)
			         )
					 	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
			GROUP BY BALLOT_REG_ID
			HAVING COUNT(*) >= 3
		) tmp
    End
    ELSE IF(@BuyerChiName_2 IS NOT NULL or @BuyerengName_2 is not null)	
	BEGIN
    SELECT  @CheckCOUNT = COUNT(*)
		FROM
		(
			SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
				BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 2)
							AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2)
			         )
					 	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
			GROUP BY BALLOT_REG_ID
			HAVING COUNT(*) >= 2
		) tmp
    End
    ELSE IF(@BuyerChiName_1 IS NOT NULL or @BuyerengName_1 is not null )	
	BEGIN
  	SELECT @CheckCOUNT = COUNT(*)
			FROM BALLOT_REG_BUYER 
			WHERE
			   BUYER_ID = @BuyerID_1 AND 
			   BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND 
			   BUYER_NAT_CODE = @Buyernatcode_1 AND 
			   			BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) AND
			   			 BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 1)
						 	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID);
				
    End
	End
	Else if (@BuyerChiName_1 is  null and @BuyerengName_1 is  null 
	and @BuyerChiName_2 is  null and @BuyerengName_2 is  null 
	and @BuyerChiName_3 is  null and @BuyerengName_3 is  null 
	and @BuyerChiName_4	is  null and @BuyerengName_4 is  null)
	begin
    IF(@CompanyName IS NOT NULL)	
	BEGIN
  	SELECT @CheckCOUNT = COUNT(*)
			FROM BALLOT_REG_BUYER 
			WHERE
               CO_BRN = @CompanyBR
			   	AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) 
			   			   AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 1)
						   	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID);
				
    End
	End


	Else
	Begin
	    IF(@BuyerChiName_4 IS NOT NULL or @BuyerengName_4 is not null)
		begin
		SELECT @CheckCOUNT = COUNT(*)
			FROM BALLOT_REG_BUYER 
			WHERE
               CO_BRN = @CompanyBR
			   	AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) 
						     AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*)>=5)
						   	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID) and 
							BALLOT_REG_ID in(
	    SELECT  BALLOT_REG_ID
		FROM
		(
			SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
			BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=5)
				AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2) OR
						(BUYER_ID = @BuyerID_3 AND BUYER_ID_IS_IDEN = @Buyeridisiden_3 AND BUYER_NAT_CODE = @Buyernatcode_3) OR
						(BUYER_ID = @BuyerID_4 AND BUYER_ID_IS_IDEN = @Buyeridisiden_4 AND BUYER_NAT_CODE = @Buyernatcode_4)
					)
				And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
					
			GROUP BY BALLOT_REG_ID
			HAVING COUNT(*) >= 4
		) tmp
		)
    End
    ELSE IF(@BuyerChiName_3 IS NOT NULL or @BuyerengName_3 is not null)	
	BEGIN

	SELECT @CheckCOUNT = COUNT(*)
			FROM BALLOT_REG_BUYER 
			WHERE
               CO_BRN = @CompanyBR
			   	AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) 
			   			  AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=4)
						   	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID) and 
							BALLOT_REG_ID in(
	SELECT  BALLOT_REG_ID
		FROM
		(
			SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
				BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=4)
							AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2) OR
						(BUYER_ID = @BuyerID_3 AND BUYER_ID_IS_IDEN = @Buyeridisiden_3 AND BUYER_NAT_CODE = @Buyernatcode_3)
			         )
					 	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
			GROUP BY BALLOT_REG_ID
			HAVING COUNT(*) >= 3
		) tmp
		)
    End
    ELSE IF(@BuyerChiName_2 IS NOT NULL or @BuyerengName_2 is not null)	
	BEGIN
		SELECT @CheckCOUNT = COUNT(*)
			FROM BALLOT_REG_BUYER 
			WHERE
               CO_BRN = @CompanyBR
			   	AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) 
			   			   AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=3)
						   	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID) and 
							BALLOT_REG_ID in(
    SELECT BALLOT_REG_ID
		FROM
		(
			SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
				BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*)>=3)
							AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2)
			         )
					 	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
			GROUP BY BALLOT_REG_ID
			HAVING COUNT(*) >= 2
		) tmp
		)
    End
    ELSE IF(@BuyerChiName_1 IS NOT NULL or @BuyerengName_1 is not null )	
	BEGIN
	SELECT @CheckCOUNT = COUNT(*)
			FROM BALLOT_REG_BUYER 
			WHERE
               CO_BRN = @CompanyBR
			   	AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) 
			   			   AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=2)
						   	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID) and 
							BALLOT_REG_ID in(
  	SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
			   BUYER_ID = @BuyerID_1 AND 
			   BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND 
			   BUYER_NAT_CODE = @Buyernatcode_1 AND 
			   			BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) AND
			   			 BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=2)
						 	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
							);
				
    End
	end























	

	IF (@CheckCOUNT >= @MaxApp)
	BEGIN
    SET @ReturnCount = -1;
	Return @ReturnCount
    End
	 IF (@CheckCOUNT <> 0)
	BEGIN
		Return @CheckCOUNT
	End

	Return @ReturnCount

End



----------------------------------------------------------------------------------
/*
	Declare @_access_flag Char(1)
	Declare @_return_code Int

	Select @_return_code = -1  -- Unauthorized

	Select @_access_flag = Access_Flag
	From SPECIAL_ACCESS
	Where FN_ID = @Function_ID And UPPER(UID) = UPPER(@Username)
	--Where FN_ID = @Function_ID And Convert(VarBinary, UID) = Convert(VarBinary, @Username)

	If @_access_flag Is Null
	Begin
		Declare @_access_level1 Numeric(3, 0)
		Declare @_access_level2 Numeric(3, 0)

		Select @_access_level1 = AccessLevelCode
		From FUNCTION_PROFILE
		Where Fn_ID = @Function_ID

		Select @_access_level2 = Level_ID
		From USER_PROFILE
		Where UPPER(UID) = UPPER(@Username)
--		Where Convert(VarBinary, UID) = Convert(VarBinary, @Username)

		If @_access_level1 <= @_access_level2
		Begin
			Select @_return_code = 0  -- Authorized
		End
	End
	Else
	Begin
		If @_access_flag = 'G'
		Begin
			Select @_return_code = 0  -- Authorized
		End
	End
*/

GO
/****** Object:  UserDefinedFunction [dbo].[SF_BUYER_CHECK_AM]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[SF_BUYER_CHECK_AM]
(
	@PROJECT_ID NVARCHAR(10),
	@AM_NO 	NVARCHAR(20) = NULL,
	@BUYER_ID NVARCHAR(20) = NULL,
	@NAT 	NVARCHAR(10) = NULL
)
Returns int
 
Begin

	DECLARE @ReturnCount int;

	SELECT @ReturnCount = COUNT(*)
	FROM
		AM_BASE b
		JOIN AM_BUYER ab ON b.PROJECT_ID = ab.PROJECT_ID AND b.AM_NO = ab.AM_NO
		JOIN AM_ITEM i ON b.PROJECT_ID = i.PROJECT_ID AND b.AM_NO= i.AM_NO AND i.FM_CP = 'F'
	WHERE
		b.PROJECT_ID = @PROJECT_ID AND
		b.AM_STATUS IN ('C', 'O') AND 
		b.AM_NO != ISNULL(@AM_NO, '') AND
		ab.BUYER_TYPE = 'P' 
		AND ISNULL(ab.BUYER_ID, '') = ISNULL(@BUYER_ID, '') AND ISNULL(ab.BUYER_NAT, '') = ISNULL(@NAT, '');

	Return @ReturnCount;

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_BUYER_CHECK_AM_COMP]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[SF_BUYER_CHECK_AM_COMP]
(
	@PROJECT_ID NVARCHAR(10),
	@AM_NO 	NVARCHAR(20) = NULL,
	@BR_NO 	NVARCHAR(20) = NULL
)
Returns int
 
Begin

	DECLARE @ReturnCount int;

	SELECT @ReturnCount = COUNT(DISTINCT(i.FM_CP_CODE))
	FROM
		AM_BASE b
		JOIN AM_BUYER ab ON b.PROJECT_ID = ab.PROJECT_ID AND b.AM_NO = ab.AM_NO
		JOIN AM_ITEM i ON b.PROJECT_ID = i.PROJECT_ID AND b.AM_NO= i.AM_NO AND i.FM_CP = 'F'
	WHERE
		b.PROJECT_ID = @PROJECT_ID AND
		b.AM_STATUS IN ('C', 'O') AND 
		b.AM_NO != ISNULL(@AM_NO, '') AND
		ab.BUYER_TYPE = 'C' AND 
		ab.BUYER_ID = ISNULL(@BR_NO, '');

	Return @ReturnCount;

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_BUYER_CHECK_BA]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[SF_BUYER_CHECK_BA]
(
	@PROJECT_ID NVARCHAR(10),
	@BA_NO 	NVARCHAR(20) = NULL,	-- REG_NO_DISPLAY
	@BUYER_ID NVARCHAR(20) = NULL,
	@NAT 	NVARCHAR(10) = NULL,
	@CurrentPoolID INT = NULL
)
Returns int
 
Begin

	DECLARE @ReturnCount int;

	SELECT @ReturnCount = ISNULL(SUM(br.UNIT_INTEND), 0) 
	FROM
		BALLOT_REG br
		JOIN BALLOT_REG_BUYER brb ON br.BALLOT_REG_ID = brb.BALLOT_REG_ID
		JOIN BALLOT_POOL_REG bpr ON br.BALLOT_REG_ID = bpr.BALLOT_REG_ID
		-- JOIN BALLOT_POOL bp ON bpr.BALLOT_POOL_ID = bp.BALLOT_POOL_ID
	WHERE
		br.PROJECT_ID = @PROJECT_ID AND
		-- bp.BALLOT_POOL_STATUS IN ('O', 'F') AND
		bpr.BALLOT_REG_STATUS IN ('N', 'V', 'B', 'I') AND 
		brb.BUYER_TYPE = 'P' AND
		br.REG_NO_DISPLAY != ISNULL(@BA_NO, '') AND
		bpr.BALLOT_POOL_ID = @CurrentPoolID AND
		ISNULL(brb.BUYER_ID, '') = ISNULL(@BUYER_ID, '') AND ISNULL(brb.BUYER_NAT_CODE, '') = ISNULL(@NAT, '');

	
	Return @ReturnCount;

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_BUYER_CHECK_BA_COMP]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[SF_BUYER_CHECK_BA_COMP]
(
	@PROJECT_ID NVARCHAR(10),
	@BA_NO 	NVARCHAR(20) = NULL,	-- REG_NO_DISPLAY
	@BR_NO 	NVARCHAR(20) = NULL,
	@CurrentPoolID INT = NULL
)
Returns int
 
Begin

	DECLARE @ReturnCount int;

	SELECT @ReturnCount = ISNULL(SUM(UNIT_INTEND), 0)
	FROM
	(
		SELECT 
			DISTINCT br.BALLOT_REG_ID,  br.UNIT_INTEND
		FROM
			BALLOT_REG br
			JOIN BALLOT_REG_BUYER brb ON br.BALLOT_REG_ID = brb.BALLOT_REG_ID
			JOIN BALLOT_POOL_REG bpr ON br.BALLOT_REG_ID = bpr.BALLOT_REG_ID
			-- JOIN BALLOT_POOL bp ON bpr.BALLOT_POOL_ID = bp.BALLOT_POOL_ID
		WHERE
			br.PROJECT_ID = @PROJECT_ID AND
			-- bp.BALLOT_POOL_STATUS IN ('O', 'F') AND
			bpr.BALLOT_REG_STATUS IN ('N', 'V', 'B', 'I') AND 
			brb.BUYER_TYPE = 'D' AND
			br.REG_NO_DISPLAY != ISNULL(@BA_NO, '') AND
			bpr.BALLOT_POOL_ID = @CurrentPoolID AND
			ISNULL(brb.CO_BRN, '') = ISNULL(@BR_NO, '') 
	) t;	
	

	
	Return @ReturnCount;

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_BuyerChineseNameRow]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_BuyerChineseNameRow](@PROJECT_ID [nvarchar](6), @MOA_NO [nvarchar](20))
RETURNS [nvarchar](max) WITH  EXECUTE AS CALLER
AS Begin

	DECLARE @ReturnBuyer NVARCHAR(MAX)

	SELECT
		@ReturnBuyer = COALESCE(@ReturnBuyer + CHAR(13)+CHAR(10), '') + Buyer_Row
	FROM
	(
		SELECT -2 ORDER_SEQ, LTRIM(RTRIM(isnull(M.CHI_NAME,''))) 'Buyer_Row'
		FROM AM_BUYER M
		WHERE 
			Upper(M.Project_ID) = @PROJECT_ID AND M.AM_No = @MOA_NO AND BUYER_TYPE = 'D' AND BUYER_SEQ = 1
			AND (M.CHI_NAME IS NOT NULL OR M.ENG_NAME IS NOT NULL)
		
		UNION ALL

		SELECT -1 ORDER_SEQ, LTRIM(RTRIM(isnull(M.CHI_NAME,'') )) 'Buyer_Row'
		FROM AM_BUYER M
		WHERE 
			Upper(M.Project_ID) = @PROJECT_ID AND M.AM_No = @MOA_NO AND BUYER_TYPE = 'D' AND BUYER_SEQ = 2
			AND (M.CHI_NAME IS NOT NULL OR M.ENG_NAME IS NOT NULL)
		
		UNION ALL
			
		SELECT 0 ORDER_SEQ, LTRIM(RTRIM(isnull(M.CHI_NAME,'') )) 'Buyer_Row'
		FROM AM_BUYER M
		WHERE Upper(M.Project_ID) = @PROJECT_ID AND M.AM_No = @MOA_NO AND BUYER_TYPE = 'P' AND BUYER_SEQ = 1
	
		UNION ALL

		SELECT M.BUYER_SEQ, isnull(M.CHI_NAME, '') 'Buyer_Row'
		FROM AM_BUYER M
		WHERE Upper(M.Project_ID) = @PROJECT_ID AND M.AM_No = @MOA_NO AND BUYER_TYPE = 'P' AND BUYER_SEQ > 1
	) tmp
	ORDER BY ORDER_SEQ

	Return @ReturnBuyer

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_BuyerNameRow]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_BuyerNameRow](@PROJECT_ID [nvarchar](6), @MOA_NO [nvarchar](20))
RETURNS [nvarchar](max) WITH  EXECUTE AS CALLER
AS Begin

	DECLARE @ReturnBuyer NVARCHAR(MAX)

	SELECT
		@ReturnBuyer = COALESCE(@ReturnBuyer + CHAR(13)+CHAR(10), '') + Buyer_Row
	FROM
	(
		SELECT -2 ORDER_SEQ, LTRIM(RTRIM(isnull(M.CHI_NAME,'') + ' ' + isnull(M.ENG_NAME,'') + isnull(' [' + M.BUYER_ID + ']',''))) 'Buyer_Row'
		FROM AM_BUYER M
		WHERE 
			Upper(M.Project_ID) = @PROJECT_ID AND M.AM_No = @MOA_NO AND BUYER_TYPE = 'D' AND BUYER_SEQ = 1
			AND (M.CHI_NAME IS NOT NULL OR M.ENG_NAME IS NOT NULL)
		
		UNION ALL

		SELECT -1 ORDER_SEQ, LTRIM(RTRIM(isnull(M.CHI_NAME,'') + ' ' + isnull(M.ENG_NAME,'') + isnull(' [' + M.BUYER_ID + ']',''))) 'Buyer_Row'
		FROM AM_BUYER M
		WHERE 
			Upper(M.Project_ID) = @PROJECT_ID AND M.AM_No = @MOA_NO AND BUYER_TYPE = 'D' AND BUYER_SEQ = 2
			AND (M.CHI_NAME IS NOT NULL OR M.ENG_NAME IS NOT NULL)
		
		UNION ALL
			
		SELECT 0 ORDER_SEQ, LTRIM(RTRIM(isnull(M.CHI_NAME,'') + isnull(' ' + M.ENG_NAME,'') + isnull(' [' + M.Buyer_ID + ']',''))) 'Buyer_Row'
		FROM AM_BUYER M
		WHERE Upper(M.Project_ID) = @PROJECT_ID AND M.AM_No = @MOA_NO AND BUYER_TYPE = 'P' AND BUYER_SEQ = 1
	
		UNION ALL

		SELECT M.BUYER_SEQ, isnull(M.CHI_NAME,'') + ' ' + isnull(M.ENG_Name,'') + ISNULL(' [' + M.Buyer_ID + ']','') 'Buyer_Row'
		FROM AM_BUYER M
		WHERE Upper(M.Project_ID) = @PROJECT_ID AND M.AM_No = @MOA_NO AND BUYER_TYPE = 'P' AND BUYER_SEQ > 1
	) tmp
	ORDER BY ORDER_SEQ

	Return @ReturnBuyer

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_CalculateAdjPrice]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE Function [dbo].[SF_CalculateAdjPrice]
(
	@project_id NVarChar(6), 
	@fm_code NVarChar(80), 
	@adj_type char(1), 
	@adj_unit char(1), 
	@adj numeric(12,2)
)
Returns Numeric(12,2)
Begin

	Declare @gfa numeric(8,2)
	Declare @orgListPrice numeric(12,2)
	Declare @adjListPrice numeric(12,2)
	Declare @ProjectUnit NVARCHAR(6)

	
	SELECT @ProjectUnit = UOM_CODE FROM PROJECT_MASTER WHERE PROJECT_ID = @project_id;

	IF (@ProjectUnit = 'SQF') 
		BEGIN
			-- Select @orgListPrice = Fm_List_Price, @gfa = FM_GR_AREA_SF
			Select @orgListPrice = Fm_List_Price, @gfa = FM_USABLE_SF
			From Flat_Master 
			Where Fm_Code = @fm_code and Project_Id = @project_id;
		END
	ELSE
		BEGIN
			-- Select @orgListPrice = Fm_List_Price, @gfa = FM_GR_AREA_SM 
			Select @orgListPrice = Fm_List_Price, @gfa = FM_USABLE_SM 
			From Flat_Master 
			Where Fm_Code = @fm_code and Project_Id = @project_id;
		END

	
	
	If @orgListPrice Is Null 
		BEGIN
			Return -1 	-- Error: Null Price
		END

	If @gfa Is Null 
		BEGIN
			Return -2 	-- Error: Null GFA
		END

	If @gfa = 0 
		BEGIN
			Return -3 	-- Error: Zero GFA
		END

	If @adj_type = "P" 
		BEGIN
			/****** Unit Price Adjustment ******/
			
			If @adj_unit = "P" 
				/*** % Adj ***/
				Select @adjListPrice = @orgListPrice * (1+(@adj/100))
			Else
				/*** $ Adj ***/
				Select @adjListPrice = @orgListPrice + @adj
		END 
			
		
	Else
		BEGIN 
															
			/****** Unit Rate Adjustment ******/
			If @adj_unit = "P" 
				BEGIN
					/*** % Adj ***/
					Select @adjListPrice = @gfa * ((@orgListPrice/@gfa) * (1 + (@adj/100)))			
				END			
			Else
				BEGIN
					/*** $ Adj ***/
					Select @adjListPrice = @gfa * ((@orgListPrice/@gfa) + @adj)			
				END
		END


	Return Round(@adjListPrice, 0)

End
GO
/****** Object:  UserDefinedFunction [dbo].[SF_CalculateStampDutyAmount]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_CalculateStampDutyAmount](@FM_CP_ListPrice [numeric](12, 2), @Project_Id [nvarchar](6))
RETURNS [numeric](12, 2) WITH  EXECUTE AS CALLER
AS Begin
	Declare @_Formula_Factor_A Numeric(12,2)
	Declare @_Formula_Factor_B Numeric(12,2)
	Declare @_Formula_Factor_C Numeric(12,2)
	Declare @_Amt Numeric(12,2)
	Declare @_tmp Numeric(12,2)
	
	
	--Get Formula Factor
	Select @_Formula_Factor_A = R.Formula_Factor_A, @_Formula_Factor_B = R.Formula_Factor_B, @_Formula_Factor_C = R.Formula_Factor_C
		From Stamp_Duty_Range R, Project_Master M
		Where ((@FM_CP_ListPrice>=R.Range_Start and @FM_CP_ListPrice<=R.Range_End) 
			Or (@FM_CP_ListPrice>=R.Range_Start and R.Range_End Is Null))
			And M.Project_Id = @Project_Id And M.Stamp_Duty_Code = R.Stamp_Duty_Code

	--Calculate Stamp Duty Amount
	
	If @_Formula_Factor_C = 0 	
		Begin 
			-- 0%
			Select @_Amt = @_Formula_Factor_A
			Return @_Amt
		End
	Else
		Begin
			Select @_tmp = (@FM_CP_ListPrice + @_Formula_Factor_B)
			If @_tmp < 0 
				Begin
					Select @_tmp = 0
				End
			Select @_Amt = @_Formula_Factor_A + @_tmp * (@_Formula_Factor_C/100)
			Return @_Amt
		End
	
	Return @_Amt

End
GO
/****** Object:  UserDefinedFunction [dbo].[SF_CHI_ENG_DESC]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Function [dbo].[SF_CHI_ENG_DESC]
(
	@CHI_DESC NVARCHAR(MAX),
	@ENG_DESC NVARCHAR(MAX)
)
Returns NVARCHAR(MAX)
 
Begin

	DECLARE 
		@Return_DESC NVARCHAR(MAX);


	IF (@CHI_DESC IS NOT NULL) AND (@CHI_DESC != '') AND (@ENG_DESC IS NOT NULL) AND (@ENG_DESC != '')
	BEGIN
		SET @Return_DESC = RTRIM(LTRIM(ISNULL(@CHI_DESC, '') + CHAR(13)+CHAR(10) + ISNULL(@ENG_DESC, '')));	
	END
	ELSE
	BEGIN
		SET @Return_DESC = RTRIM(LTRIM(ISNULL(@CHI_DESC, '') + ' ' + ISNULL(@ENG_DESC, '')));
	END

	

	
	Return @Return_DESC;

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_ComBuyerNameRow]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[SF_ComBuyerNameRow]
(
	@PROJECT_ID NVARCHAR(6), 
	@MOA_NO NVARCHAR(20)
)

Returns NVARCHAR(MAX)
  
Begin

	DECLARE @ReturnBuyer NVARCHAR(MAX)

	SELECT
		@ReturnBuyer = COALESCE(@ReturnBuyer + CHAR(13)+CHAR(10), '') + Buyer_Row
	FROM
	(


		SELECT M.BUYER_SEQ ORDER_SEQ, isnull(M.CHI_NAME,'')  'Buyer_Row'
		FROM AM_BUYER M
		WHERE Upper(M.Project_ID) = @PROJECT_ID AND M.AM_No = @MOA_NO AND BUYER_TYPE = 'C' AND BUYER_SEQ = 1



	) tmp
	ORDER BY ORDER_SEQ

	Return @ReturnBuyer

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_CONCAT]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Function [dbo].[SF_CONCAT]
(
	@LINE_1 NVARCHAR(MAX),
	@LINE_2 NVARCHAR(MAX),
	@LINE_3 NVARCHAR(MAX) = NULL,
	@LINE_4 NVARCHAR(MAX) = NULL,
	@LINE_5 NVARCHAR(MAX) = NULL,
	@LINE_6 NVARCHAR(MAX) = NULL
)
Returns NVARCHAR(MAX)
 
Begin

	DECLARE 
		@Return_DESC NVARCHAR(MAX) = '';

	IF (@LINE_1 IS NOT NULL) AND (LTRIM(RTRIM(@LINE_1)) != '')
	BEGIN
		
		IF ((@Return_DESC IS NOT NULL) AND  (LTRIM(RTRIM(@Return_DESC)) != ''))
		BEGIN 
			SET @Return_DESC = @Return_DESC + CHAR(13)+CHAR(10);
		END

		SET @Return_DESC = @Return_DESC + RTRIM(LTRIM(@LINE_1));
	END
	
	IF (@LINE_2 IS NOT NULL) AND (LTRIM(RTRIM(@LINE_2)) != '')
	BEGIN
		
		IF ((@Return_DESC IS NOT NULL) AND  (LTRIM(RTRIM(@Return_DESC)) != ''))
		BEGIN 
			SET @Return_DESC = @Return_DESC + CHAR(13)+CHAR(10);
		END

		SET @Return_DESC = @Return_DESC + RTRIM(LTRIM(@LINE_2));
	END

	IF (@LINE_3 IS NOT NULL) AND (LTRIM(RTRIM(@LINE_3)) != '')
	BEGIN
		
		IF ((@Return_DESC IS NOT NULL) AND  (LTRIM(RTRIM(@Return_DESC)) != ''))
		BEGIN 
			SET @Return_DESC = @Return_DESC + CHAR(13)+CHAR(10);
		END

		SET @Return_DESC = @Return_DESC + RTRIM(LTRIM(@LINE_3));
	END

	IF (@LINE_4 IS NOT NULL) AND (LTRIM(RTRIM(@LINE_4)) != '')
	BEGIN
		
		IF ((@Return_DESC IS NOT NULL) AND  (LTRIM(RTRIM(@Return_DESC)) != ''))
		BEGIN 
			SET @Return_DESC = @Return_DESC + CHAR(13)+CHAR(10);
		END

		SET @Return_DESC = @Return_DESC + RTRIM(LTRIM(@LINE_4));
	END

	IF (@LINE_5 IS NOT NULL) AND (LTRIM(RTRIM(@LINE_5)) != '')
	BEGIN

		IF ((@Return_DESC IS NOT NULL) AND  (LTRIM(RTRIM(@Return_DESC)) != ''))
		BEGIN 
			SET @Return_DESC = @Return_DESC + CHAR(13)+CHAR(10);
		END

		SET @Return_DESC = @Return_DESC + RTRIM(LTRIM(@LINE_5));
	END

	IF (@LINE_6 IS NOT NULL) AND (LTRIM(RTRIM(@LINE_6)) != '')
	BEGIN

		IF ((@Return_DESC IS NOT NULL) AND  (LTRIM(RTRIM(@Return_DESC)) != ''))
		BEGIN 
			SET @Return_DESC = @Return_DESC + CHAR(13)+CHAR(10);
		END

		SET @Return_DESC = @Return_DESC + RTRIM(LTRIM(@LINE_6));
	END
	

	
	Return @Return_DESC;

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_CSV_Col_Index]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SF_CSV_Col_Index]
(
    @Line nvarchar(MAX),
	@StartIndex int
)
RETURNS int
  AS 
BEGIN

	DECLARE @ReturnIndex INT;
	DECLARE @StartChar NVARCHAR(MAX);

	SET @StartChar = SUBSTRING(@Line, @StartIndex, 1);

	IF ( LEFT(@StartChar, 1) != '"') 
	BEGIN
		SET @ReturnIndex = CHARINDEX( ',', @Line, @StartIndex)
	END ELSE BEGIN
		SET @ReturnIndex = CHARINDEX( '",', REPLACE(@Line, '""', '**'), (@StartIndex + 1)) + 1;
	END

	/*
	SELECT 
		LEFT('"5,6&R/F",E (SKYPOOL RESORT 8),,,,.', 1) IsWithDQ, 
		CHARINDEX( ',', '"5,6&R/F",E (SKYPOOL RESORT 8),,,,.' ),  
		CHARINDEX( '",', REPLACE('"5,6&R/F",E (SKYPOOL RESORT 8),,,,.', '""', '**')) + 1,  
		substring('"5,6&R/F",E (SKYPOOL RESORT 8),,,,.', 1, 9 ), * 
	*/
	

    RETURN @ReturnIndex;
END
GO
/****** Object:  UserDefinedFunction [dbo].[SF_CSV_Col_Value]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SF_CSV_Col_Value]
(
    @Column nvarchar(MAX)
)
RETURNS NVARCHAR(MAX)
  AS
BEGIN

	DECLARE @ReturnCol NVARCHAR(MAX);
	SET @ReturnCol = RTRIM(LTRIM(@Column));

	IF ( LEFT(@ReturnCol, 1) = '"') 
	BEGIN
		SET @ReturnCol = REPLACE(SUBSTRING(@ReturnCol, 2, LEN(@ReturnCol)-2), '""', '"');  
	END

    RETURN @ReturnCol;
END

GO
/****** Object:  UserDefinedFunction [dbo].[SF_CSV2ROW]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SF_CSV2ROW]
(
    @Line nvarchar(MAX),
    @SplitOn nvarchar(5) = ','
)
RETURNS @RtnValue table
(
	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    CSVRow nvarchar(MAX) NOT NULL
)
  AS
BEGIN
    IF @Line IS NULL RETURN

	DECLARE @split_on_len INT = LEN(@SplitOn)
	DECLARE @start_at INT = 1
	DECLARE @end_at INT
    DECLARE @data_len INT

    WHILE 1=1
    BEGIN
        SET @end_at = CHARINDEX(@SplitOn,@Line,@start_at)
        SET @data_len = CASE @end_at WHEN 0 THEN LEN(@Line) ELSE @end_at-@start_at END
        INSERT INTO @RtnValue (CSVRow) VALUES( SUBSTRING(@Line,@start_at,@data_len) );
        IF @end_at = 0 BREAK;
        SET @start_at = @end_at + @split_on_len
    END

    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[SF_DIV_BatchDisplay]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[SF_DIV_BatchDisplay]
(
	@BatchNo INT,
	@SubBatch NVARCHAR
)
Returns NVARCHAR(20)  
Begin
	Return CONVERT(varchar, @BatchNo) + ISNULL(@SubBatch, '');
End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_DIV_TicketID]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[SF_DIV_TicketID]
(
	@TicketID INT
)
Returns INT  
Begin

	DECLARE 
		@ReturnMinSeqTicketID NVARCHAR(MAX),
		@BuyerCount INT,
		@BatchID INT;

	
	SELECT @BuyerCount = COUNT(*) FROM BALLOT_BUYER WHERE TICKET_ID = @TicketID;
	SELECT @BatchID = BALLOT_BATCH_ID FROM BALLOT_TICKET bt WHERE TICKET_ID = @TicketID;

	
	SELECT @ReturnMinSeqTicketID = MIN(TICKET_ID)
	FROM 
		(
			SELECT bt.TICKET_ID
			FROM 
				BALLOT_BUYER bb
				JOIN (SELECT TICKET_ID, COUNT(*) RecCount FROM BALLOT_BUYER GROUP BY TICKET_ID) bc 
					ON bb.TICKET_ID = bc.TICKET_ID AND bc.RecCount = @BuyerCount
				JOIN BALLOT_TICKET bt ON bb.TICKET_ID = bt.TICKET_ID
				JOIN 
					(SELECT BUYER_ID, BUYER_ID_IS_IDEN, BUYER_NAT_CODE, CO_BRN FROM BALLOT_BUYER WHERE TICKET_ID = @TicketID) tmp
						ON 
						(
							bb.BUYER_ID = tmp.BUYER_ID AND 
							bb.BUYER_ID_IS_IDEN = tmp.BUYER_ID_IS_IDEN AND 
							bb.BUYER_NAT_CODE = tmp.BUYER_NAT_CODE AND 
							tmp.CO_BRN IS NULL AND bb.CO_BRN IS NULL
						) OR (
							bb.BUYER_ID IS NULL AND tmp.BUYER_ID IS NULL AND 
							ISNULL(bb.BUYER_ID_IS_IDEN, '') =  ISNULL(tmp.BUYER_ID_IS_IDEN, '' ) AND 
							bb.BUYER_NAT_CODE IS NULL AND tmp.BUYER_NAT_CODE IS NULL AND 
							tmp.CO_BRN = bb.CO_BRN
						)
				WHERE bt.BALLOT_BATCH_ID = @BatchID
			GROUP BY bt.TICKET_ID
			HAVING COUNT(*) = @BuyerCount
		) tmp;
	
	
	
	
	
	
	Return @ReturnMinSeqTicketID;

End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_FM_CODE]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Function [dbo].[SF_FM_CODE]
(
	@UnitDev NVARCHAR(MAX),
	@UnitBlock NVARCHAR(MAX),
	@UnitFloor NVARCHAR(MAX),
	@UnitFlat NVARCHAR(MAX),
    @UnitHouseNo  NVARCHAR(MAX),
	@UnitStreetNo NVARCHAR(MAX),
	@UnitStrCode NVARCHAR(MAX)
)
Returns NVARCHAR(MAX)
  Begin

	DECLARE 
		@Return_GenKey NVARCHAR(MAX);
	

	SET @Return_GenKey = '';

	If (@UnitDev IS NOT NULL) AND (LEN(LTRIM(RTRIM(@UnitDev))) > 0 )
	BEGIN
		SET @Return_GenKey = @Return_GenKey + @UnitDev + '/';
	END 
	ELSE
	BEGIN
		SET @Return_GenKey = @Return_GenKey + 'NIL/'
	END


	If (@UnitBlock IS NOT NULL) AND (LEN(LTRIM(RTRIM(@UnitBlock))) > 0 )
	BEGIN
		SET @Return_GenKey = @Return_GenKey + @UnitBlock + '/';
	END 
	ELSE
	BEGIN
		SET @Return_GenKey = @Return_GenKey + 'NIL/'
	END


	If (@UnitFloor IS NOT NULL) AND (LEN(LTRIM(RTRIM(@UnitFloor))) > 0 )
	BEGIN
		SET @Return_GenKey = @Return_GenKey + @UnitFloor + '/';
	END 
	ELSE
	BEGIN
		SET @Return_GenKey = @Return_GenKey + 'NIL/'
	END

	
	If (@UnitFlat IS NOT NULL) AND (LEN(LTRIM(RTRIM(@UnitFlat))) > 0 )
	BEGIN
		SET @Return_GenKey = @Return_GenKey + @UnitFlat + '/';
	END 
	ELSE
	BEGIN
		SET @Return_GenKey = @Return_GenKey + 'NIL/'
	END


	If (@UnitHouseNo IS NOT NULL) AND (LEN(LTRIM(RTRIM(@UnitHouseNo))) > 0 )
	BEGIN
		SET @Return_GenKey = @Return_GenKey + @UnitHouseNo + '/';
	END 
	ELSE
	BEGIN
		SET @Return_GenKey = @Return_GenKey + 'NIL/'
	END


	If (@UnitStreetNo IS NOT NULL) AND (LEN(LTRIM(RTRIM(@UnitStreetNo))) > 0 )
	BEGIN
		SET @Return_GenKey = @Return_GenKey + @UnitStreetNo + '/';
	END 
	ELSE
	BEGIN
		SET @Return_GenKey = @Return_GenKey + 'NIL/'
	END

	
	If (@UnitStrCode IS NOT NULL) AND (LEN(LTRIM(RTRIM(@UnitStrCode))) > 0 )
	BEGIN
		SET @Return_GenKey = @Return_GenKey + @UnitStrCode;
	END 
	ELSE
	BEGIN
		SET @Return_GenKey = @Return_GenKey + 'NIL'
	END


	SET @Return_GenKey = UPPER(@Return_GenKey);

	
	Return @Return_GenKey;

End
GO
/****** Object:  UserDefinedFunction [dbo].[SF_GenBTicketNo]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[SF_GenBTicketNo]
(
	 @PROJECT_ID  nvarchar(10),
	 @BALLOT_POOL_NO INT,
     @TICKET_NO int
) 
Returns nvarchar(20)  
Begin
	Declare @ReturnTicket NVARCHAR(20) = NULL;
	Declare @TicketLength int = ISNULL(LEN(@TICKET_NO), 7);
	
	IF (@TicketLength < 7)
	BEGIN
		SET @TicketLength = 7;
	END 
	
	
	
	SET @ReturnTicket = @PROJECT_ID +'-'+CONVERT(varchar(10),@BALLOT_POOL_NO)+'-'+ REPLACE(STR(@TICKET_NO,@TicketLength),SPACE(1),'0');

	Return @ReturnTicket
End



GO
/****** Object:  UserDefinedFunction [dbo].[SF_GetBallotStatus]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[SF_GetBallotStatus]
(
	 @PROJECT_ID  nvarchar(10)
)
Returns nvarchar(20)  
Begin
	Declare @ReturnStatus NVARCHAR(1) = NULL;
	
	SELECT @ReturnStatus = [BALLOT_POOL_STATUS] 
	FROM BALLOT_POOL
	WHERE BALLOT_POOL_NO = (SELECT MAX([BALLOT_POOL_NO]) FROM [BALLOT_POOL] WHERE [PROJECT_ID] = @PROJECT_ID);
	
	Return ISNULL(@ReturnStatus, 'X') 
	
End















GO
/****** Object:  UserDefinedFunction [dbo].[SF_GetBallotStatus_BA03]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log
-- #20151006 Modified by Tommyay on 2015-10-06 , Change the stored for new structure.

CREATE Function [dbo].[SF_GetBallotStatus_BA03]
(
	 @CurrentPoolRegID  nvarchar(10)
)
Returns nvarchar(20)  
Begin
	Declare @ReturnStatus NVARCHAR(1) = NULL;
	Declare @BALLOT_BATCH_ID INT = NULL;

	SELECT 	@BALLOT_BATCH_ID=BALLOT_BATCH_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_REG_ID=@CurrentPoolRegID

	SELECT @ReturnStatus = [BALLOT_BATCH_STATUS] 
	FROM [BALLOT_BATCH]
	WHERE [BALLOT_BATCH_ID] = @BALLOT_BATCH_ID

	Return ISNULL(@ReturnStatus, 'X') 
End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_GetLastPurchaser]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_GetLastPurchaser](@project_id [nvarchar](6), @moa_no [nvarchar](20), @result_type [nvarchar](1))
RETURNS [nvarchar](4000) WITH  EXECUTE AS CALLER
AS Begin

	Declare @Buyer_Surname NVarChar(50)
	Declare @Buyer_Given_Name NVarChar(50)
	Declare @Moa_Co_Name NVarChar(50)
	Declare @Joint_Buyer NVarChar(400)
	Declare @Surname NVarChar(50)
	Declare @Given_Name NVarChar(50)
	Declare @Transfer_Seq Numeric(3,0)
	Declare @Contact_Person NVarChar(400)
	Declare @Region NVarChar(50)
	Declare @Country NVarChar(50)
	Declare @District NVarChar(50)
	Declare @Address NVarChar(400)
	Declare @Address1 NVarChar(400)
	Declare @Address2 NVarChar(400)
	Declare @Address3 NVarChar(400)
	Declare @Address4 NVarChar(400)
	Declare @Tel NVarChar(200)
	Declare @Tel_No NVarChar(50)
	Declare @Off_Tel NVarChar(50)
	Declare @Mobile NVarChar(50)
	Declare @Fax NVarChar(50)
	Declare @Email NVarChar(50)
	Declare @Formal_Seq Numeric(3,0)
	Declare @Formal_Count Int
	
	Declare @Contact_Table Table 
	(
		Contact_Person NVarChar(400), 
		Region_Code NVarChar(50), 
		Dist_Code NVarChar(50), 
		Country_Code NVarChar(50),
		Add1 NVarChar(400), 
		Add2 NVarChar(400), 
		Add3 NVarChar(400), 
		Tel_No NVarChar(50), 
		Off_Tel NVarChar(50), 
		Mobile NVarChar(50),
		Fax NVarChar(50), 
		Email NVarChar(50)
	)
	
	Declare @Last_Purchaser NVarChar(4000)

	Select @Last_Purchaser = ''
	
	-- Get Last Transfer Sequence
	Select @Transfer_Seq = max(transfer_seq) from moa_transfer where MOA_NO = @moa_no And PROJECT_ID = @project_id

	-- Get Last Formal Agreement Seq
	Select @Formal_Count = Count(*) From Moa_Formal Where MOA_NO = @Moa_NO and Project_ID = @project_ID and Formal_Status = 'C'
	
	If @Formal_Count = 1
	Begin
		Select @Formal_Seq = Formal_Seq From Moa_Formal Where MOA_NO = @Moa_NO and Project_ID = @project_ID and Formal_Status = 'C'
	End

	-- Create table to store selected data
	Select	@Contact_Person = case when T.Moa_No Is Null then IsNull(M.Cont_Person,'') else IsNull(T.Cont_Person, '') end,
			@Region = case when T.Moa_No Is Null then isnull(M.Region_Code,'') else isnull(T.Region_Code, '') end,
			@Country = case when T.Moa_No Is Null then isnull(M.Country_Code,'') else isnull(T.Country_Code, '') end,
			@District = case when T.Moa_No Is Null then isnull(M.Dist_Code,'') else isnull(T.Dist_Code, '') end,
			@Address1 = case when T.Moa_No Is Null then isnull(M.Add1,'') else isnull(T.Add1, '') end,
			@Address2 = case when T.Moa_No Is Null then isnull(M.Add2,'') else isnull(T.Add2, '') end,
			@Address3 = case when T.Moa_No Is Null then isnull(M.Add3,'') else isnull(T.Add3, '') end,
			@Tel_No = case when T.Moa_No Is Null then isnull(M.Tel_No,'') else isnull(T.Tel_No, '') end,
			@Off_Tel = case when T.Moa_No Is Null then isnull(M.Off_Tel,'') else isnull(T.Off_Tel, '') end,
			@Mobile = case when T.Moa_No Is Null then isnull(M.Mobile,'') else isnull(T.Mobile, '') end,
			@Fax = case when T.Moa_No Is Null then isnull(M.Fax,'') else isnull(T.Fax, '') end,
			@Email = case when T.Moa_No Is Null then isnull(M.Email,'') else isnull(T.Email, '') end 
	From 
		MOA_FORMAL M
		left outer join (
							select 
								* 
							from 
								moa_transfer a 
							where 
								a.transfer_seq >= 0 
								and a.transfer_seq = (
														select 
															max(b.transfer_seq) 
														from 
															moa_transfer b 
														where a.moa_no = b.moa_no
													  )
						) T on (M.Project_ID = T.Project_ID and M.Moa_No = T.Moa_No)
	Where M.MOA_NO = @moa_no And M.PROJECT_ID = @project_id
						
	If @Transfer_Seq IS NOT NULL And @Transfer_Seq > 0
	-- Get from moa_transfer
	BEGIN 
		Declare CP_Cursor Cursor For
		Select 
			isnull(Cont_Person,''), 
			isnull(Region_Code,''), 
			isnull(Dist_Code,''), 
			isnull(Country_Code,''), 
			isnull(Add1,''), 
			isnull(Add2,''), 
			isnull(Add3,''), 
			isnull(Tel_No,''), 
			isnull(Off_Tel,''), 
			isnull(Mobile,''), 
			isnull(Fax,''), 
			isnull(Email,'')
		From 
			MOA_TRANSFER
		Where 
			MOA_NO = @moa_no 
			And PROJECT_ID = @project_id 
			and TRANSFER_SEQ = @Transfer_Seq
	END
	Else
		--Get from moa_formal
	BEGIN 
		Declare CP_Cursor Cursor For
		Select 
			isnull(Cont_Person,''), 
			isnull(Region_Code,''), 
			isnull(Dist_Code,''), 
			isnull(Country_Code,''), 
			isnull(Add1,''), 
			isnull(Add2,''), 
			isnull(Add3,''), 
			isnull(Tel_No,''), 
			isnull(Off_Tel,''), 
			isnull(Mobile,''), 
			isnull(Fax,''), 
			isnull(Email,'')
		From 
			MOA_FORMAL
		Where 
			MOA_NO = @moa_no 
			And PROJECT_ID = @project_id
	END
						
	Open CP_Cursor 

	Fetch Next From CP_Cursor 
	Into @Contact_Person, @Region, @District, @Country, @Address1, @Address2, @Address3, 
	     @Tel_No, @Off_Tel, @Mobile, @Fax, @Email
						
	Close CP_Cursor
	Deallocate CP_Cursor
	
	Insert into @Contact_Table 
	(Contact_Person, Region_Code, Dist_Code, Country_Code, Add1, Add2, Add3, Tel_No, Off_Tel, Mobile, Fax, Email) 
	values 
	(@Contact_Person, @Region, @District, @Country, @Address1, @Address2, @Address3, @Tel_No, @Off_Tel, @Mobile, @Fax, @Email)

	If @result_type = 'N'	--Name
	Begin
		-- Get Main Buyer Name from Moa or Moa_Transfer
		Select 
			@Buyer_Surname = Case 
								When T.MOA_NO IS NOT NULL Then isnull(T.Surname,'')
								When MF.MOA_NO IS NOT NULL Then isnull(MF.Surname,'')
								Else isnull(M.Buyer_Surname,'')
							 End,
			@Buyer_Given_Name = Case
									When T.MOA_NO IS NOT NULL Then isnull(T.Given_Name,'')
									When MF.MOA_NO IS NOT NULL Then isnull(MF.Given_Name,'')
									Else isnull(M.Buyer_Given_Name,'')
								End,
			@Moa_Co_Name = Case
							When T.MOA_NO IS NOT NULL Then isnull(T.Co_Name,'')
							When MF.MOA_NO IS NOT NULL Then isnull(MF.CO_Name,'')
							Else isnull(M.Moa_Co_Name,'')
						   End
		From 
			MOA M
			left outer join (
								select 
									* 
								from 
									moa_transfer a 
								where 
									a.transfer_seq >= 0 
									and a.transfer_seq = (
															select 
																max(b.transfer_seq) 
															from 
																moa_transfer b 
															where a.moa_no = b.moa_no
														  )
							) T on (M.Project_ID = T.Project_ID and M.Moa_No = T.Moa_No)
			left outer join MOA_FORMAL MF on M.MOA_NO = MF.MOA_NO And M.PROJECT_ID = MF.PROJECT_ID and MF.FORMAL_STATUS = 'C'
		Where 
			M.MOA_NO = @moa_no 
			And M.PROJECT_ID = @project_id

		Select @Joint_Buyer = N''
						
		If  @Transfer_Seq > 0
		-- Get from moa_transfer_Assignee_joint_Buyer
		BEGIN 
			Declare JB_Cursor Cursor For
			Select 
				isnull(Surname,''), 
				isnull(Given_name,'')
			From 
				MOA_TRANSFER_ASSIGNEE_JOINT_BUYER
			Where 
				MOA_NO = @moa_no 
				And PROJECT_ID = @project_id 
				and TRANSFER_SEQ = @Transfer_Seq
		END
		ELSE
		--Get from moa_joint_buyer
		BEGIN 
			If @Formal_Count > 0
			Begin
				Declare JB_Cursor Cursor For
				Select
					isnull(MFJB.Surname,''),
					isnull(MFJB.Given_name,'')
				From
					MOA_FORMAL MF 
					INNER JOIN MOA_FORMAL_JOINT_BUYER MFJB On MF.MOA_NO = MFJB.MOA_NO and MF.PROJECT_ID = MFJB.PROJECT_ID And MF.FORMAL_SEQ = MFJB.FORMAL_SEQ And MF.FORMAL_STATUS = 'C'
				Where
					MF.MOA_NO = @moa_no
					And MF.Project_ID = @project_id
			End
			Else
			Begin
				Declare JB_Cursor Cursor For
				Select 
					isnull(Surname,''), 
					isnull(Given_name,'')
				From 
					MOA_JOINT_BUYER
				Where 
					MOA_NO = @moa_no 
					And PROJECT_ID = @project_id			
			End 
		END
						
		-- Get Joint Buyer(s) from Moa or Moa_Transfer
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

		-- Concat all fields
		If @Buyer_Surname <> N''
		Begin
			Select @Last_Purchaser = @Buyer_Surname
		End
		
		If @Buyer_Given_Name <> N''
		Begin
			If @Last_Purchaser <> N''
			Begin
				Select @Last_Purchaser = @Last_Purchaser + ', ' + @Buyer_Given_Name
			End
			Else
			Begin
				Select @Last_Purchaser = @Buyer_Given_Name
			End
		End

		If @Moa_Co_Name <> N''
		Begin
			If @Last_Purchaser <> N''
			Begin
				Select @Last_Purchaser = @Last_Purchaser + ', ' + @Moa_Co_Name
			End
			Else
			Begin
				Select @Last_Purchaser = @Moa_Co_Name
			End
		End	

		If @Joint_Buyer <> N''
		Begin
			Select @Last_Purchaser = @Last_Purchaser + ', ' + @Joint_Buyer
		End
				
		Return @Last_Purchaser
	End
	
	If @result_type = 'P'	--Contact Person
		Begin
		Select @Contact_Person = Contact_Person From @Contact_Table
		Return @Contact_Person	
	End
	
	If @result_type = 'R'	--Region
		Begin
		Select @Region = ISNULL((SELECT REGION_DESC FROM REGION WHERE REGION_CODE=(Select Region_Code From @Contact_Table)),'')
		Return @Region
	End
	
	If @result_type = 'D'	--District
		Begin
		Select @District = ISNULL((SELECT DIST_NAME FROM DISTRICT WHERE DIST_CODE=(Select Dist_Code From @Contact_Table)),'')
		Return @District
	End
	
	If @result_type = 'C'	--Country
		Begin
		Select @Country = ISNULL((SELECT COUNTRY_DESC FROM COUNTRY WHERE COUNTRY_CODE=(Select Country_Code From @Contact_Table)),'')
		Return @Country
	End
	
	If @result_type = 'A'	--Address
		Begin
		Select @Address = (Select Add1 From @Contact_Table) + ' ' + (Select Add2 From @Contact_Table) + ' ' + (Select Add3 From @Contact_Table)
		Return @Address
	End
	
	If @result_type = 'T'
		Begin
		Select @Tel = (Select Tel_No From @Contact_Table) + ' ' + (Select Off_Tel From @Contact_Table) + ' ' + (Select Mobile From @Contact_Table)
		Return @Tel
	End
	
	If @result_type = 'F'
		Begin
		Select @Fax = (Select Fax From @Contact_Table)
		Return @Fax
	End
	
	If @result_type = 'E'
		Begin
		Select @Email = (Select Email From @Contact_Table)
		Return @Email
	End
	
	Return Convert(NVarchar(4000), @Transfer_Seq)
	
End
GO
/****** Object:  UserDefinedFunction [dbo].[SF_GetNull]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_GetNull]()
RETURNS [char](1) WITH  EXECUTE AS CALLER
AS Begin

	Declare @result char(1)

	select top 0 @result = project_id from project_master where 1=0


	Return @result

End
GO
/****** Object:  UserDefinedFunction [dbo].[SF_GETPAYMENTTERMS]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_GETPAYMENTTERMS](@PROJECT_ID [nvarchar](10), @AM_NO [nvarchar](20), @PAYMENT_METHOD_CODE [nvarchar](10), @EXCEPT_FLAG [nvarchar](1))
RETURNS [nvarchar](4000) WITH  EXECUTE AS CALLER
AS Begin
	DECLARE @PACKAGE_DESC NVARCHAR(4000)
	DECLARE @PRICE_LIST_NO NVARCHAR(20)
	DECLARE @PAY_TERMS NVARCHAR(4000)
	DECLARE @CNT INT
	DECLARE @TERMS_OF_PAYMENT NVARCHAR(4000)
	DECLARE @METHOD_DESC NVARCHAR(100)
	DECLARE @ADJ_PER NUMERIC(5,2)

	SET @TERMS_OF_PAYMENT = ''

	SELECT @PRICE_LIST_NO = 
	pl.PRICE_LIST_ID FROM FLAT_MASTER F
	outer APPLY (select TOP 1 PROJECT_ID, FM_CP_CODE, PRICE_LIST_ID, LIST_PRICE,EFFECTIVE_DT from PRICE_LIST_EFFECTIVE pl 
	where F.PROJECT_ID = pl.PROJECT_ID and F.FM_CODE = pl.FM_CP_CODE and EFFECTIVE_DT < getdate() order by EFFECTIVE_DT desc) pl  
	WHERE MOA_NO = @AM_NO AND f.PROJECT_ID = @PROJECT_ID

	

	IF @PRICE_LIST_NO IS NOT NULL
	BEGIN
		SET @TERMS_OF_PAYMENT = '- 價單第' + @PRICE_LIST_NO + '號 Price List No.' + @PRICE_LIST_NO + CHAR(13) + CHAR(10)
	END

	SELECT @CNT = COUNT(*) FROM AM_PAYMENT_PLAN WHERE AM_NO = @AM_NO AND PROJECT_ID = @PROJECT_ID

	IF @CNT > 0
	BEGIN
		IF @EXCEPT_FLAG = 'Y'
		BEGIN
			SELECT 
				@METHOD_DESC = METHOD_DESC_ENG, 
				@ADJ_PER = PAY_ADJ_PER 
			FROM 
				PRJ_PAY_METHOD PPM
			WHERE
				PROJECT_ID = @PROJECT_ID
				AND METHOD_CODE = @PAYMENT_METHOD_CODE

			SET @TERMS_OF_PAYMENT = @TERMS_OF_PAYMENT + '- 付款計劃名稱 Payment Method Name: ' + @METHOD_DESC + CHAR(13) + CHAR(10) 
	
			IF @ADJ_PER <> 0
			BEGIN
				SET @TERMS_OF_PAYMENT = @TERMS_OF_PAYMENT + '- 特別折扣' + CONVERT(VARCHAR,@ADJ_PER) + '% ' + CONVERT(VARCHAR,@ADJ_PER) + '% discount being Special Discount'  + CHAR(13) + CHAR(10)
			END	
		END
		ELSE
		BEGIN
			SELECT @PAY_TERMS = isnull(CHANGE_PAY_TERMS,PAY_TERMS) FROM AM_BASE where AM_NO = @AM_NO AND PROJECT_ID = @PROJECT_ID
			RETURN @PAY_TERMS
		END
	END
	ELSE
	BEGIN
		SELECT 
			@METHOD_DESC = METHOD_DESC_ENG, 
			@ADJ_PER = PAY_ADJ_PER 
		FROM 
			PRJ_PAY_METHOD PPM
		WHERE
			PROJECT_ID = @PROJECT_ID
			AND METHOD_CODE = @PAYMENT_METHOD_CODE

		SET @TERMS_OF_PAYMENT = @TERMS_OF_PAYMENT + '- 付款計劃名稱 Payment Method Name: ' + @METHOD_DESC + CHAR(13) + CHAR(10) 
	
		IF @ADJ_PER <> 0
		BEGIN
			SET @TERMS_OF_PAYMENT = @TERMS_OF_PAYMENT + '- 特別折扣' + CONVERT(VARCHAR,@ADJ_PER) + '% ' + CONVERT(VARCHAR,@ADJ_PER) + '% discount being Special Discount'  + CHAR(13) + CHAR(10)
		END	
	END

	DECLARE PACKAGE_CUR CURSOR
	FOR
		SELECT 
			--Begin 20160303 Tommy For Display Package ID instead of Decscription
			--P.PACKAGE_DESC 
			-- End
			P.PACKAGE_ID
		FROM 
			AM_PACKAGES AP
			INNER JOIN PACKAGES P ON AP.PROJECT_ID = P.PROJECT_ID AND AP.PACKAGE_ID = P.PACKAGE_ID 
		WHERE 
		AP.AM_NO = @AM_NO
		AND AP.PROJECT_ID = @PROJECT_ID

	OPEN PACKAGE_CUR
	FETCH NEXT FROM PACKAGE_CUR INTO @PACKAGE_DESC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @TERMS_OF_PAYMENT = @TERMS_OF_PAYMENT + '- ' + @PACKAGE_DESC + CHAR(13) + CHAR(10)

		FETCH NEXT FROM PACKAGE_CUR INTO @PACKAGE_DESC
	END

	CLOSE PACKAGE_CUR
	DEALLOCATE PACKAGE_CUR

	RETURN @TERMS_OF_PAYMENT	
End















GO
/****** Object:  UserDefinedFunction [dbo].[SF_isAvailablePackage]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE Function [dbo].[SF_isAvailablePackage]
(
	@Project_ID NVarChar(6),
	@AM_No Nvarchar(20),
	@FM_Code NVarchar(80),
	@Package_ID NvarChar(10),
	@Package_Type NVarchar(1)
)
Returns varchar(1)
Begin
	-- RETURN
	-- 0 --> NO PACKAGE AVAILABLE FOR THIS FLAT
	-- 1 --> ONLY PACKAGE TYPE = 'A' IS AVAILABLE
	-- 2 --> PACKAGE TYPE IN ('A', 'N') ARE AVAILABLE
	-- 3 --> PACKAGE TYPE IN ('A', 'P') ARE AVAILABLE

	DECLARE @CNT INT
	SELECT @CNT = COUNT(*) FROM FLAT_PACKAGE WHERE PROJECT_ID = @Project_ID AND FM_CODE = @FM_Code AND PACKAGE_ID = @Package_ID

	IF @CNT = 0
	BEGIN
		RETURN '0'
	END

	SELECT @CNT = COUNT(*) FROM AM_BUYER WHERE PROJECT_ID = @Project_ID AND AM_NO = @AM_No AND BUYER_TYPE = 'C'

	IF @CNT > 0
	BEGIN
		IF @Package_Type = 'A'
		BEGIN
			RETURN '1'
		END
		ELSE
		BEGIN
			RETURN '0'
		END
	END
	
	SELECT @CNT = COUNT(*) FROM AM_BUYER WHERE PROJECT_ID = @Project_ID AND AM_NO = @AM_No AND BUYER_TYPE = 'P' AND BUYER_ID_IS_IDEN = 'F'

	IF @CNT > 0 
	BEGIN
		IF @Package_Type = 'A' OR @Package_Type = 'N'
		BEGIN
			RETURN '1'
		END
		ELSE
		BEGIN
			RETURN '0'
		END
	END
	ELSE
	BEGIN
		IF @Package_Type = 'A' OR @Package_Type = 'P'
		BEGIN
			RETURN '1'
		END
		ELSE
		BEGIN
			RETURN '0'
		END
	END

	RETURN "0"
End
GO
/****** Object:  UserDefinedFunction [dbo].[SF_MaximumPurchase]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE Function [dbo].[SF_MaximumPurchase]
(
	@ProjectID nvarchar(10),
	@MemberID nvarchar(10)=null,
	@ViewMaxP nvarchar(1)	
)
Returns  int
   
Begin

	--DECLARE @ReturnValue nvarchar;
	DECLARE @MaxNum int=null ;

		 
	select TOP 1 @MaxNum= [MAX_PURCHASE_UNIT]  FROM [dbo].[PROJECT_MASTER] where PROJECT_ID = @ProjectID;

	--select [MAX_PURCHASE_UNIT] from [dbo].[PROJECT_MASTER]; -- where PROJECT_ID LIKE @ProjectID;
	if(@ViewMaxP='Y')
	begin 
		if(ISNULL(@MaxNum, 0) = 0 )
		begin 
		return 0;
		end else
		begin 
		return @MaxNum;
		end

		end else begin
		
		return 0;
		
	end
			--	SET @ReturnValue = 'N';
	Return @MaxNum;

End


GO
/****** Object:  UserDefinedFunction [dbo].[SF_NEW_BALLOT_ID]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_NEW_BALLOT_ID](@PROJECT_ID [nvarchar](10), @BALLOT_POOL_ID [int], @AGENCY [nvarchar](6), @SEED [uniqueidentifier])
RETURNS @info TABLE (
	[TARGET_POOL] [int] NULL,
	[NEW_REG_NO] [int] NULL,
	[NEW_REG_NO_DISPLAY] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL
) WITH  EXECUTE AS CALLER
AS Begin

DECLARE @BALLOT_POOL_NO NVARCHAR(10)
DECLARE @NEW_REG_NO INT;
DECLARE @NEW_REG_NO_DISPLAY NVARCHAR(30);



					SELECT @BALLOT_POOL_NO=BALLOT_POOL_NO FROM BALLOT_POOL WHERE @BALLOT_POOL_ID=BALLOT_POOL_ID
						
					DECLARE @REG_NO_DISPLAY_HEADER NVARCHAR (20) = CONCAT(@PROJECT_ID,'-',@BALLOT_POOL_NO,'-');
					declare @REG_NO_DISPLAY_HEADER_like nvarchar(21)=concat (@REG_NO_DISPLAY_HEADER,'%');

					select
						@NEW_REG_NO = max(REG_NO) +1  
					from 
						BALLOT_POOL_REG bpr 
						join BALLOT_REG br on bpr.BALLOT_REG_ID = br.BALLOT_REG_ID 
					where 
						br.PROJECT_ID = @PROJECT_ID and 
						bpr.BALLOT_POOL_ID = @BALLOT_POOL_ID and 
						br.REG_NO_DISPLAY like  @REG_NO_DISPLAY_HEADER_like
				
					if (@NEW_REG_NO is null)
					BEGIN
						(select @NEW_REG_NO=START_TICKET_NO from BALLOT_POOL where BALLOT_POOL_ID=@BALLOT_POOL_ID)
					END

					SET @NEW_REG_NO_DISPLAY = @PROJECT_ID+REPLACE(STR(@NEW_REG_NO,9),SPACE(1),'0') 
					SET @NEW_REG_NO_DISPLAY = dbo.SF_GenBTicketNo(@PROJECT_ID, @BALLOT_POOL_NO,@NEW_REG_NO);
					SET @NEW_REG_NO_DISPLAY = @NEW_REG_NO_DISPLAY + '-' +@AGENCY 

					INSERT @info
						SELECT @BALLOT_POOL_ID, @NEW_REG_NO, @NEW_REG_NO_DISPLAY;

					return 
END
GO
/****** Object:  UserDefinedFunction [dbo].[SF_NO_OF_COMPANY_BALLOT_REG]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_NO_OF_COMPANY_BALLOT_REG](@PROJECT_ID [nvarchar](10), @BALLOT_POOL_ID [int])
RETURNS [int] WITH  EXECUTE AS CALLER
AS BEGIN
	DECLARE @NO_OF_COMPANY_REG INT;

	SELECT
		@NO_OF_COMPANY_REG = COUNT(*)
	FROM
		BALLOT_POOL_REG BPR
		INNER JOIN BALLOT_POOL BP ON BPR.BALLOT_POOL_ID = BP.BALLOT_POOL_ID
		INNER JOIN BALLOT_REG BR ON BPR.BALLOT_REG_ID = BR.BALLOT_REG_ID
	WHERE
		BP.BALLOT_POOL_ID = @BALLOT_POOL_ID
		AND BP.PROJECT_ID = @PROJECT_ID
		AND BR.REG_TYPE = 'C'

	RETURN @NO_OF_COMPANY_REG;
END
GO
/****** Object:  UserDefinedFunction [dbo].[SF_NO_OF_UNIT]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_NO_OF_UNIT](@PROJECT_ID [nvarchar](10))
RETURNS [int] WITH  EXECUTE AS CALLER
AS BEGIN
	DECLARE @NO_OF_ALL_UNIT INT;

	SELECT @NO_OF_ALL_UNIT = COUNT(*) FROM FLAT_MASTER WHERE PROJECT_ID = @PROJECT_ID;

	RETURN @NO_OF_ALL_UNIT;
END
GO
/****** Object:  UserDefinedFunction [dbo].[SF_NO_OF_UNIT_SOLD_TO_COMPANY]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_NO_OF_UNIT_SOLD_TO_COMPANY](@PROJECT_ID [nvarchar](10))
RETURNS [int] WITH  EXECUTE AS CALLER
AS BEGIN
	DECLARE @NO_OF_SOLD INT;

	SELECT
		@NO_OF_SOLD = COUNT(DISTINCT FM.FM_CODE)
	FROM
		FLAT_MASTER FM
		INNER JOIN AM_BASE AB ON FM.PROJECT_ID = AB.PROJECT_ID AND FM.MOA_NO = AB.AM_NO AND AB.AM_TYPE = 'C'
	WHERE
		FM.MOA_NO IS NOT NULL
		AND FM.PROJECT_ID = @PROJECT_ID;

	RETURN @NO_OF_SOLD;
END
GO
/****** Object:  UserDefinedFunction [dbo].[SF_NO_SELECTED_BY_COMPANY]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_NO_SELECTED_BY_COMPANY](@PROJECT_ID [nvarchar](10))
RETURNS [int] WITH  EXECUTE AS CALLER
AS BEGIN
	DECLARE @NO_OF_SELECTED_BY_COMPANY INT;

	SELECT
		@NO_OF_SELECTED_BY_COMPANY = COUNT(DISTINCT FM.FM_CODE)
	FROM
		FLAT_MASTER FM
		INNER JOIN (
						SELECT 
							PROJECT_ID, FM_CODE, MAX(UPDATE_DATE) UPDATE_DT
						FROM 
							FLAT_SELECTION
						WHERE
							[STATUS] = 'S' 
							AND ID_TYPE = 'B'
						GROUP BY
							PROJECT_ID, FM_CODE				
					) TMP ON FM.PROJECT_ID = TMP.PROJECT_ID AND FM.FM_CODE = TMP.FM_CODE
	WHERE
		FM.PROJECT_ID = @PROJECT_ID

	RETURN @NO_OF_SELECTED_BY_COMPANY;
END
GO
/****** Object:  UserDefinedFunction [dbo].[SF_RPT_ActualPrice]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_RPT_ActualPrice](@PROJECT_ID [nvarchar](20), @AM_NO [nvarchar](50))
RETURNS [nvarchar](max) WITH  EXECUTE AS CALLER
AS Begin

DECLARE @col NVARCHAR(MAX);

select @col  = AM_PRICE from AM_BASE where PROJECT_ID = @PROJECT_ID  AND AM_NO = @AM_NO
	Return @col


END

GO
/****** Object:  UserDefinedFunction [dbo].[SF_RPT_ApprovedListPriceRow]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_RPT_ApprovedListPriceRow](@PROJECT_ID [nvarchar](20), @AM_NO [nvarchar](50))
RETURNS [nvarchar](max) WITH  EXECUTE AS CALLER
AS Begin

DECLARE @col NVARCHAR(MAX);

SELECT 
--v001s
--@col = COALESCE(@col + ', ', '') + concat(   CAST(item.FM_CP_LIST_PRICE * ( 1 + M.PAY_ADJ_PER /100 ) AS INT)   , ' ' ,''
--@col = COALESCE(@col + '', '') + concat(   format( CAST(item.FM_CP_LIST_PRICE * ( 1 + M.PAY_ADJ_PER /100 ) AS INT)  , '#,##0'  ) , char(13) ,'' )  v002
@col = COALESCE(@col + '', '') + concat(   format(   round( CAST(  item.FM_CP_LIST_PRICE * ( 1 + M.PAY_ADJ_PER /100 ) AS INT),-2, 1) , '#,##0'  ) , char(13) ,'' )
--v001e
FROM 
am_payment_plan P INNER JOIN PRJ_PAY_METHOD M ON P.METHOD_CODE = M.METHOD_CODE AND P.PROJECT_ID = M.PROJECT_ID
                  INNER JOIN AM_ITEM  item on item.AM_NO = p.AM_NO 
WHERE P.PROJECT_ID = @PROJECT_ID AND PY_PLAN_SEQ = 1 and P.AM_NO = @AM_NO
order by p.AM_NO


 set @col =	 LEFT(@col, LEN(@col) - 1)
	Return @col


END

GO
/****** Object:  UserDefinedFunction [dbo].[SF_RPT_ListPriceRow]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_RPT_ListPriceRow](@PROJECT_ID [nvarchar](20), @AM_NO [nvarchar](50))
RETURNS [nvarchar](max) WITH  EXECUTE AS CALLER
AS Begin

DECLARE @col NVARCHAR(MAX);


		SELECT 
		--v001s
		--@col = COALESCE(@col + ', ', '') + concat(   CAST(FM.FM_LIST_PRICE AS INT)   , ' ' ,'' )
		@col = COALESCE(@col + '', '') + concat(   format(CAST(FM.FM_LIST_PRICE AS INT), '#,##0')   , char(13) ,'' )
		--v001e
	FROM AM_BASE b
		inner join AM_ITEM ai ON ai.AM_NO = b.AM_NO and ai.PROJECT_ID = b.PROJECT_ID
		inner JOIN FLAT_MASTER fm ON ai.FM_CP = 'F' AND ai.FM_CP_CODE = fm.FM_CODE AND ai.PROJECT_ID = fm.PROJECT_ID 
		WHERE B.PROJECT_ID = @PROJECT_ID  AND B.AM_NO = @AM_NO

		 set @col =	 LEFT(@col, LEN(@col) - 1)

	Return @col


END

GO
/****** Object:  UserDefinedFunction [dbo].[SF_RPT_SQF_AREA_Row]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_RPT_SQF_AREA_Row](@PROJECT_ID [nvarchar](20), @AM_NO [nvarchar](50))
RETURNS [nvarchar](max) WITH  EXECUTE AS CALLER
AS Begin

	DECLARE @col NVARCHAR(MAX);
	

SELECT 
--v001s
--@col = COALESCE(@col + ', ', '') + concat(fm.FM_USABLE_SF , ' '  )
@col = COALESCE(@col + '', '') +  CONCAT( FORMAT(   CAST( FM.FM_USABLE_SF AS INT)   , '#,##0'), CHAR(13) )
 --v001e 
  FROM FLAT_MASTER fm
		left join am_item ai on ai.PROJECT_ID = fm.PROJECT_ID and ai.FM_CP_CODE = fm.FM_CODE
	WHERE 
		fm.PROJECT_ID = @PROJECT_ID and ai.AM_NO = @AM_NO 


 set @col =	 LEFT(@col, LEN(@col) - 1)
	Return @col


END

GO
/****** Object:  UserDefinedFunction [dbo].[SF_RPT_UNIT]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_RPT_UNIT](@PROJECT_ID [nvarchar](20), @AM_NO [nvarchar](50))
RETURNS [nvarchar](max) WITH  EXECUTE AS CALLER
AS Begin

		--v001s
		/*
			DECLARE @col NVARCHAR(MAX);
		SELECT @col = COALESCE(@col + ', ', '') + concat(fm.fm_blk , ' ' , fm.FM_FLOOR,fm_flat )
		  FROM FLAT_MASTER fm
				left join am_item ai on ai.PROJECT_ID = fm.PROJECT_ID and ai.FM_CP_CODE = fm.FM_CODE
			WHERE 
				fm.PROJECT_ID = @PROJECT_ID and ai.AM_NO = @AM_NO 
		*/


			DECLARE @col NVARCHAR(MAX);
			SELECT @col = COALESCE(@col + '', '') + concat(  bk.BLOCK_DESC  , '' , fm.FM_FLOOR, fm_flat , char(13) )
		  FROM FLAT_MASTER fm
				left join block bk on bk.PROJECT_ID = fm.PROJECT_ID and bk.BLOCK_ID = fm.FM_BLK
				left join am_item ai on ai.PROJECT_ID = fm.PROJECT_ID and ai.FM_CP_CODE = fm.FM_CODE
			WHERE 
				fm.PROJECT_ID = @PROJECT_ID and ai.AM_NO = @AM_NO 
		--v001e
	set @col =	 LEFT(@col, LEN(@col) - 1)

	Return @col


END

GO
/****** Object:  UserDefinedFunction [dbo].[SF_RPT_UnitRate]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE Function [dbo].[SF_RPT_UnitRate]
(
	@Area [numeric](9, 3),
	@Price [numeric](12, 2)
)
Returns  [numeric](12, 2)
   
Begin

	DECLARE 
		@ReturnValue [numeric](12, 2);


	IF (ISNULL(@Area, 0) = 0 )
	BEGIN
		SET @ReturnValue = 0;
	END ELSE BEGIN
		SET @ReturnValue = ISNULL(@Price, 0) / @Area;
	END
		
	Return @ReturnValue;

End


GO
/****** Object:  UserDefinedFunction [dbo].[SF_SameCombinationBuyer]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Modification Log
-- #2015107 Modified by Tommyay on 2015-10-07 , Change the stored for new structure.


CREATE Function [dbo].[SF_SameCombinationBuyer]
(
    @BALLOT_POOL_ID int,
    
	@CompanyName     nvarchar(50),			
	@CompanyBR       nvarchar(30),

	@BuyerChiName_1  nvarchar(50),
	@BuyerengName_1  nvarchar(100),
	@BuyerID_1       nvarchar(20),
	@Buyeridisiden_1 nchar(1),
	@Buyernatcode_1  nvarchar(6),

	@BuyerChiName_2  nvarchar(50),
	@BuyerengName_2  nvarchar(100),
	@BuyerID_2       nvarchar(20),
	@Buyeridisiden_2 nchar(1),
	@Buyernatcode_2  nvarchar(6),

	@BuyerChiName_3  nvarchar(50),
	@BuyerengName_3  nvarchar(100),
	@BuyerID_3       nvarchar(20),
	@Buyeridisiden_3 nchar(1),
	@Buyernatcode_3  nvarchar(6),

	@BuyerChiName_4  nvarchar(50),
	@BuyerengName_4  nvarchar(100),
	@BuyerID_4       nvarchar(20),
	@Buyeridisiden_4 nchar(1),
	@Buyernatcode_4  nvarchar(6),
		@BALLOT_POOL_REG_ID int

)
Returns Nvarchar(4000)  
Begin
    Declare @MaxApp int;
    Declare @Related_REG_NO_DISPLAY nvarchar (4000);
	 Declare @Related_CO_BRN nvarchar (4000);
	Declare @ReturnCount Int = 0;
	Declare @BALLOT_REG_ID Int = 0;
	Declare @NewLineChar nvarchar(10)='\n'

	if (@BALLOT_POOL_REG_ID is null)
	begin
	set @BALLOT_POOL_REG_ID=-1
	end
	--SELECT @BALLOT_POOL_ID= BALLOT_POOL_ID, @BALLOT_REG_ID=BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE @BALLOT_POOL_REG_ID=BALLOT_POOL_REG_ID
	
	

	select @MaxApp = MAX_APP from BALLOT_POOL where BALLOT_POOL_ID = @BALLOT_POOL_ID;
    if(@MaxApp=0)
    BEGIN
    set @MaxApp = 99999
    End
	set @Related_REG_NO_DISPLAY = @NewLineChar


	--+ @BuyerChiName_1 +' -  ' + @BuyerID_1 +' '+@BuyerChiName_2 +' -  ' + @BuyerID_2+' '+ @BuyerChiName_3 +' -  ' + @BuyerID_3+' '+@BuyerChiName_4 +' -  ' + @BuyerID_4 +  @NewLineChar+  @Related_REG_NO_DISPLAY
	if (@BuyerID_1 is not null)
	begin
	if (@BuyerChiName_1 is not null and @BuyerChiName_1 <>'')
	Begin
	set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+ @BuyerChiName_1 +' -  ' + @BuyerID_1 
	end
	else
	
	set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+ @BuyerengName_1 +' -  ' + @BuyerID_1 
	end
	if (@BuyerID_2 is not null)
	begin
	if (@BuyerChiName_2 is not null and @BuyerChiName_2 <>'')
	Begin
	set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+ @BuyerChiName_2 +' -  ' + @BuyerID_2 
	end
	else

	set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+ @BuyerengName_2 +' -  ' + @BuyerID_2 

	end
	if (@BuyerID_3 is not null)
	begin
	if (@BuyerChiName_3 is not null and @BuyerChiName_3 <>'')
	Begin
	set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+ @BuyerChiName_3 +' -  ' + @BuyerID_3 
	end
	else

	set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+ @BuyerengName_3 +' -  ' + @BuyerID_3 

	End

	if (@BuyerID_4 is not null)
	begin
	if (@BuyerChiName_4 is not null and @BuyerChiName_4 <>'')
	Begin
	set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+ @BuyerChiName_4 +' -  ' + @BuyerID_4 
	end
	else

	set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+ @BuyerengName_4 +' -  ' + @BuyerID_4 

	end

	if(@CompanyName is not null)
	Begin
	set @Related_REG_NO_DISPLAY = @Related_REG_NO_DISPLAY+ @CompanyName +' -  ' + @CompanyBR 
	end

		
	if (@CompanyName is null)
	Begin
    IF(@BuyerChiName_4 IS NOT NULL or @BuyerengName_4 is not null)
    BEGIN
SELECT @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY
FROM BALLOT_REG BR JOIN 
		(
			SELECT brb.BALLOT_REG_ID
			FROM BALLOT_REG_BUYER brb
					join BALLOT_REG br on br.BALLOT_REG_ID = brb.BALLOT_REG_ID

			WHERE
				brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 4)
				AND brb. BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2) OR
						(BUYER_ID = @BuyerID_3 AND BUYER_ID_IS_IDEN = @Buyeridisiden_3 AND BUYER_NAT_CODE = @Buyernatcode_3) OR
						(BUYER_ID = @BuyerID_4 AND BUYER_ID_IS_IDEN = @Buyeridisiden_4 AND BUYER_NAT_CODE = @Buyernatcode_4)
					)
	And brb.BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
			GROUP BY brb.BALLOT_REG_ID
			HAVING COUNT(*) >= 4
				) tmp on tmp.BALLOT_REG_ID = br.BALLOT_REG_ID
				set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
    End
    ELSE IF(@BuyerChiName_3 IS NOT NULL or @BuyerengName_3 is not null)	
	BEGIN
	set @Related_REG_NO_DISPLAY =  @Related_REG_NO_DISPLAY+@NewLineChar+ @BuyerChiName_1 +' -  ' + @BuyerID_1 +' '+@BuyerChiName_2 +' -  ' + @BuyerID_2+' '+ @BuyerChiName_3 +' -  ' + @BuyerID_3

  	
	SELECT @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY
FROM BALLOT_REG BR JOIN 
		(
			SELECT  brb.BALLOT_REG_ID
			FROM BALLOT_REG_BUYER brb
					join BALLOT_REG br on br.BALLOT_REG_ID = brb.BALLOT_REG_ID

			WHERE
				brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 3)
				AND brb. BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2) OR
						(BUYER_ID = @BuyerID_3 AND BUYER_ID_IS_IDEN = @Buyeridisiden_3 AND BUYER_NAT_CODE = @Buyernatcode_3)
			         )
	And brb.BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
			GROUP BY brb.BALLOT_REG_ID
			HAVING COUNT(*) >= 3
			) tmp on tmp.BALLOT_REG_ID = br.BALLOT_REG_ID
			set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
    End
    ELSE IF(@BuyerChiName_2 IS NOT NULL or @BuyerengName_2 is not null)		
	BEGIN
  	
	SELECT @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY
FROM BALLOT_REG BR JOIN 
		
		(
			SELECT brb.BALLOT_REG_ID
			FROM BALLOT_REG_BUYER brb
					join BALLOT_REG br on br.BALLOT_REG_ID = brb.BALLOT_REG_ID

			WHERE
				brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 2)
				AND brb. BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2)
			         )
	And brb.BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
				GROUP BY brb.BALLOT_REG_ID
			HAVING COUNT(*) >= 2
		) tmp on tmp.BALLOT_REG_ID = br.BALLOT_REG_ID
		set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
    End
    ELSE IF(@BuyerChiName_1 IS NOT NULL or @BuyerengName_1 is not null )	
	BEGIN

  	
  	SELECT @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
		FROM BALLOT_REG_BUYER brb
					join BALLOT_REG br on br.BALLOT_REG_ID = brb.BALLOT_REG_ID

			WHERE
			   BUYER_ID = @BuyerID_1 AND 
			   BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND 
			   BUYER_NAT_CODE = @Buyernatcode_1 AND 
			   			brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) AND
			   			brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 1)
							And brb.BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID);
						
						set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
				
    End
	end
	else if (@BuyerChiName_1 is  null and @BuyerengName_1 is  null 
	and @BuyerChiName_2 is  null and @BuyerengName_2 is  null 
	and @BuyerChiName_3 is  null and @BuyerengName_3 is  null 
	and @BuyerChiName_4	is  null and @BuyerengName_4 is not null)
	begin
	    IF(@CompanyName IS NOT NULL)
	begin

				set @Related_CO_BRN = @Related_REG_NO_DISPLAY +@NewLineChar + @CompanyName +'  -  '+@CompanyBR
		select @Related_CO_BRN= coalesce(@Related_CO_BRN + '\n', '') +REG_NO_DISPLAY 
			FROM BALLOT_REG_BUYER brb
					join BALLOT_REG br on br.BALLOT_REG_ID = brb.BALLOT_REG_ID
			WHERE
               CO_BRN = @CompanyBR
			   	AND brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) AND
			   			brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) = 1)
							And brb.BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID);
						
						set @Related_REG_NO_DISPLAY =@Related_REG_NO_DISPLAY+@NewLineChar
				
	end
	end
	else
	begin
	    IF(@BuyerChiName_4 IS NOT NULL or @BuyerengName_4 is not null)
		begin
		SELECT @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
			FROM BALLOT_REG_BUYER brb join BALLOT_REG br on brb.BALLOT_REG_ID=br.BALLOT_REG_ID
			WHERE
               CO_BRN = @CompanyBR
			   	AND brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) 
			   			   AND brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=5)
						   	And brb.BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID) and 
							brb.BALLOT_REG_ID in(
	    SELECT  BALLOT_REG_ID
		FROM
		(
			SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
				BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=5)
				AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2) OR
						(BUYER_ID = @BuyerID_3 AND BUYER_ID_IS_IDEN = @Buyeridisiden_3 AND BUYER_NAT_CODE = @Buyernatcode_3) OR
						(BUYER_ID = @BuyerID_4 AND BUYER_ID_IS_IDEN = @Buyeridisiden_4 AND BUYER_NAT_CODE = @Buyernatcode_4)
					)
				And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
					
			GROUP BY BALLOT_REG_ID
			HAVING COUNT(*) >= 4
		) tmp
		)
    End
    ELSE IF(@BuyerChiName_3 IS NOT NULL or @BuyerengName_3 is not null)	
	BEGIN

	SELECT @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
			FROM BALLOT_REG_BUYER brb join BALLOT_REG br on brb.BALLOT_REG_ID=br.BALLOT_REG_ID
			WHERE
               CO_BRN = @CompanyBR
			   	AND brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) 
			   			   AND brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*)>=4)
						   	And brb.BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID) and 
							brb.BALLOT_REG_ID in(
	SELECT  BALLOT_REG_ID
		FROM
		(
			SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
				BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=4)
							AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2) OR
						(BUYER_ID = @BuyerID_3 AND BUYER_ID_IS_IDEN = @Buyeridisiden_3 AND BUYER_NAT_CODE = @Buyernatcode_3)
			         )
					 	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
			GROUP BY BALLOT_REG_ID
			HAVING COUNT(*) >= 3
		) tmp
		)
    End
    ELSE IF(@BuyerChiName_2 IS NOT NULL or @BuyerengName_2 is not null)	
	BEGIN
		SELECT @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
			FROM BALLOT_REG_BUYER brb join BALLOT_REG br on brb.BALLOT_REG_ID=br.BALLOT_REG_ID
			WHERE
               CO_BRN = @CompanyBR
			   	AND brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) 
			   			   AND brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=3)
						   	And brb.BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID) and 
							brb.BALLOT_REG_ID in(
    SELECT BALLOT_REG_ID
		FROM
		(
			SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
				BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=3)
							AND BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID)
				AND (
						(BUYER_ID = @BuyerID_1 AND BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND BUYER_NAT_CODE = @Buyernatcode_1) OR
						(BUYER_ID = @BuyerID_2 AND BUYER_ID_IS_IDEN = @Buyeridisiden_2 AND BUYER_NAT_CODE = @Buyernatcode_2)
			         )
					 	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
			GROUP BY BALLOT_REG_ID
			HAVING COUNT(*) >= 2
		) tmp
		)
    End
    ELSE IF(@BuyerChiName_1 IS NOT NULL or @BuyerengName_1 is not null )	
	BEGIN
	SELECT @Related_REG_NO_DISPLAY= coalesce(@Related_REG_NO_DISPLAY + '\n', '') + REG_NO_DISPLAY 
			FROM BALLOT_REG_BUYER brb join BALLOT_REG br on brb.BALLOT_REG_ID=br.BALLOT_REG_ID

			WHERE
               CO_BRN = @CompanyBR
			   	AND  brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) 
			   			   AND  brb.BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*)>=2)
						   	And  brb.BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID) and 
							 brb.BALLOT_REG_ID in(
  	SELECT BALLOT_REG_ID
			FROM BALLOT_REG_BUYER 
			WHERE
			   BUYER_ID = @BuyerID_1 AND 
			   BUYER_ID_IS_IDEN = @Buyeridisiden_1 AND 
			   BUYER_NAT_CODE = @Buyernatcode_1 AND 
			   			BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG WHERE BALLOT_POOL_ID = @BALLOT_POOL_ID) AND
			   			 BALLOT_REG_ID IN (SELECT BALLOT_REG_ID FROM BALLOT_REG_BUYER GROUP BY BALLOT_REG_ID HAVING COUNT(*) >=2)
						 	And BALLOT_REG_ID not in (SELECT BALLOT_REG_ID FROM BALLOT_POOL_REG where BALLOT_POOL_REG_ID = @BALLOT_POOL_REG_ID)
							);
				
    End
	end




















	
	
	Return @Related_REG_NO_DISPLAY
End



----------------------------------------------------------------------------------
/*
	Declare @_access_flag Char(1)
	Declare @_return_code Int

	Select @_return_code = -1  -- Unauthorized

	Select @_access_flag = Access_Flag
	From SPECIAL_ACCESS
	Where FN_ID = @Function_ID And UPPER(UID) = UPPER(@Username)
	--Where FN_ID = @Function_ID And Convert(VarBinary, UID) = Convert(VarBinary, @Username)

	If @_access_flag Is Null
	Begin
		Declare @_access_level1 Numeric(3, 0)
		Declare @_access_level2 Numeric(3, 0)

		Select @_access_level1 = AccessLevelCode
		From FUNCTION_PROFILE
		Where Fn_ID = @Function_ID

		Select @_access_level2 = Level_ID
		From USER_PROFILE
		Where UPPER(UID) = UPPER(@Username)
--		Where Convert(VarBinary, UID) = Convert(VarBinary, @Username)

		If @_access_level1 <= @_access_level2
		Begin
			Select @_return_code = 0  -- Authorized
		End
	End
	Else
	Begin
		If @_access_flag = 'G'
		Begin
			Select @_return_code = 0  -- Authorized
		End
	End
*/

GO
/****** Object:  UserDefinedFunction [dbo].[SF_SkipDate]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_SkipDate](@Project_ID [nvarchar](6), @Date [datetime], @Count [int])
RETURNS [datetime] WITH  EXECUTE AS CALLER
AS Begin
	Declare @Index Int
	Declare @Return DateTime

	Select @Index = 0
	Select @Return = @Date

	While @Index < @Count
	Begin
		Select @Index = @Index + 1
		Select @Return = DateAdd(Day, 1, @Return)

		If (Select Count(*) From Skip_Date Where Project_ID = @Project_ID And Convert(NVarChar(30), Skip_Date, 103) = Convert(NVarChar(30), @Return, 103)) = 1
		Begin
			Select @Index = @Index - 1
		End
	End

	Return @Return
End
GO
/****** Object:  UserDefinedFunction [dbo].[SF_SplitTable]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_SplitTable](@InputString [nvarchar](4000))
RETURNS @tblReturn TABLE (
	[RowIndex] [int] NULL,
	[RowValue] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL
) WITH  EXECUTE AS CALLER
AS BEGIN
	DECLARE @CIndex smallint
	DECLARE @RunIndex int;
	
	SET @RunIndex = 0;
	
	
	WHILE (@InputString<>'')
	BEGIN
		SET @CIndex=CHARINDEX(',',@InputString)
		SET @RunIndex = @RunIndex+1;
		IF @CIndex=0 SET @CIndex=LEN(@InputString)+1
		
		INSERT INTO @tblReturn (RowIndex, RowValue) 
		VALUES (@RunIndex, SUBSTRING(@InputString,1,@CIndex-1))
		
		IF @CIndex=LEN(@InputString)+1 BREAK
		SET @InputString=SUBSTRING(@InputString,@CIndex+1,LEN(@InputString)-@CIndex)
	END
	RETURN 
END

GO
/****** Object:  UserDefinedFunction [dbo].[SF_SS001_IsMenuAccessible]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_SS001_IsMenuAccessible](@Username [varchar](16), @Function_ID [varchar](10))
RETURNS [int] WITH  EXECUTE AS CALLER
AS Begin
	Declare @_access_flag Char(1)
	Declare @_return_code Int

	Select @_return_code = -1  -- Unauthorized

	Select @_access_flag = Access_Flag
	From SPECIAL_ACCESS
	Where FN_ID = @Function_ID And UPPER(UID) = UPPER(@Username)
	--Where FN_ID = @Function_ID And Convert(VarBinary, UID) = Convert(VarBinary, @Username)

	If @_access_flag Is Null
	Begin
		Declare @_access_level1 Numeric(3, 0)
		Declare @_access_level2 Numeric(3, 0)

		Select @_access_level1 = AccessLevelCode
		From FUNCTION_PROFILE
		Where Fn_ID = @Function_ID

		Select @_access_level2 = Level_ID
		From USER_PROFILE
		Where UPPER(UID) = UPPER(@Username)
--		Where Convert(VarBinary, UID) = Convert(VarBinary, @Username)

		If @_access_level1 <= @_access_level2
		Begin
			Select @_return_code = 0  -- Authorized
		End
	End
	Else
	Begin
		If @_access_flag = 'G'
		Begin
			Select @_return_code = 0  -- Authorized
		End
	End

	Return @_return_code
End

GO
/****** Object:  UserDefinedFunction [dbo].[SF_TagFinder]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_TagFinder](@in_txt [nvarchar](max), @in_Start [nvarchar](100), @in_End [nvarchar](100))
RETURNS @Return TABLE (
	[Start_POS] [int] NULL,
	[End_POS] [int] NULL,
	[Tag] [nvarchar](max) COLLATE Chinese_PRC_CI_AS NULL
) WITH  EXECUTE AS CALLER
AS BEGIN
	DECLARE @Search_Start NVARCHAR(100);
	DECLARE @Search_End NVARCHAR(100);
	DECLARE @S_POS int;
	DECLARE @E_POS int;
	DECLARE @TMPi int;
	DECLARE @OLD_POS int
	
	SET @Search_Start = '%' + @in_Start + '%';
	SET @Search_End = '%' + @in_End + '%';

	SET @OLD_POS = 0;
	SET @S_POS = patindex(@Search_Start,@in_txt);

	IF(@S_POS > 0)
	BEGIN
		SET @E_pos = PATINDEX(@Search_End,SUBSTRING(@in_txt, @S_POS, LEN(@in_txt)))
	END
	
	WHILE (@S_POS > 0) AND (@E_POS > 0) AND (@OLD_POS <> @S_POS)
	BEGIN
		SET @TMPi = @E_POS + LEN(@in_End) - 1;
		INSERT INTO @Return (Start_POS,End_POS,Tag) Values (@S_POS, @E_POS, SUBSTRING(@in_txt, @S_POS, @TMPi))
		SET @OLD_POS = @S_POS;

		SET @TMPi = @S_POS + @TMPi;

		SET @S_POS = PATINDEX(@Search_Start, SUBSTRING(@in_txt, @TMPi + 1, LEN(@in_txt))) + @TMPi;
		IF(@S_POS > 0)
		BEGIN
			SET @E_pos = PATINDEX(@Search_End,SUBSTRING(@in_txt, @S_POS, LEN(@in_txt)))
		END

		--SET @pos=patindex(@in_txt,Substring(@in_txt,@pos + 1,len(@in_txt))) + @pos
	END

RETURN 
END



GO
/****** Object:  UserDefinedFunction [dbo].[Split2]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Split2](@strString [varchar](4000))
RETURNS @Result TABLE (
	[Value] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL
) WITH  EXECUTE AS CALLER
AS begin

    WITH StrCTE(start, stop) AS
    (
      SELECT  1, CHARINDEX(',' , @strString )
	  UNION ALL
      SELECT  stop + 1, CHARINDEX(',' ,@strString  , stop + 1)
      FROM StrCTE
      WHERE stop > 0
    )

    insert into @Result
    SELECT   SUBSTRING(@strString , start, CASE WHEN stop > 0 THEN stop-start ELSE 4000 END) AS stringValue
    FROM StrCTE
   
    return

end   

GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetNumeric]    Script Date: 10/12/2018 11:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf_GetNumeric](@strAlphaNumeric [varchar](256))
RETURNS [varchar](256) WITH  EXECUTE AS CALLER
AS BEGIN
DECLARE @intAlpha INT
SET @intAlpha = PATINDEX('%[^0-9]%', @strAlphaNumeric)
BEGIN
WHILE @intAlpha > 0
BEGIN
SET @strAlphaNumeric = STUFF(@strAlphaNumeric, @intAlpha, 1, '' )
SET @intAlpha = PATINDEX('%[^0-9]%', @strAlphaNumeric )
END
END
RETURN ISNULL(@strAlphaNumeric,0)
END
GO
