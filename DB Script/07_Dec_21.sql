USE [IndustriesDB]
GO

ALTER TABLE [dbo].[NestingMaster] ALTER COLUMN StartPosition int;
ALTER TABLE [dbo].[NestingMaster] ALTER COLUMN EndPosition int;
ALTER TABLE [dbo].[NestingMaster] ALTER COLUMN Printflag int;

ALTER TABLE [dbo].[NestingMasterHistory] ALTER COLUMN StartPosition int;
ALTER TABLE [dbo].[NestingMasterHistory] ALTER COLUMN EndPosition int;
ALTER TABLE [dbo].[NestingMasterHistory] ALTER COLUMN Printflag int;

/****** Object:  StoredProcedure [dbo].[spSelectNestingPrintDetails]    Script Date: 31-Dec-21 8:14:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spSelectNestingPrintDetails]
@Loadday AS varchar(25),
@NestingNum AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select PlanningLoadDay,Itemcode,Qty,BatchOrIndividual,NestingQty,ProcessQty,Printflag,StartPosition,EndPosition,Nestingno from [dbo].[NestingMaster] where PlanningLoadDay=@Loadday and Nestingnumber=@NestingNum

END
GO

/****** Object:  StoredProcedure [dbo].[spSelectMatchItemcodeListForCustomer]    Script Date: 31-Dec-21 7:57:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spSelectMatchItemcodeListForCustomer]
@CustomerName AS varchar(200)
AS
BEGIN	
	SET NOCOUNT ON;	

	select itemcode from [dbo].[ItemMaster] where customername=@CustomerName and lc1=1 and lc2='F'
		and itemcode in (select ItemCode from [dbo].[ComponentMaster]);

END
GO

/****** Object:  UserDefinedTableType [dbo].[typeDummyNestingMaster]    Script Date: 31-Dec-21 7:53:25 PM ******/
DROP TYPE [dbo].[typeDummyNestingMaster]
GO

/****** Object:  UserDefinedTableType [dbo].[typeDummyNestingMaster]    Script Date: 31-Dec-21 7:53:25 PM ******/
CREATE TYPE [dbo].[typeDummyNestingMaster] AS TABLE(
	[ItemcodewithNestingnum] [varchar](100) NULL,
	[PlanningLoadDay] [varchar](25) NULL,
	[POType] [varchar](15) NULL,
	[Process1] [varchar](30) NULL,
	[Process2] [varchar](30) NULL,
	[Itemcode] [varchar](75) NULL,
	[Itemdescription] [varchar](150) NULL,
	[RMCode] [varchar](100) NULL,
	[RMDescription] [varchar](150) NULL,
	[Qty] [int] NULL,
	[BatchOrIndividual] [varchar](1) NULL,
	[Nestingnumber] [varchar](25) NULL,
	[FY] [int] NULL,
	[LoadDay] [int] NULL,
	[S1ofRM] [varchar](10) NULL,
	[Material] [varchar](30) NULL,
	[Nestingno] [varchar](5) NULL,
	[NestingQty] [int] NULL,
	[ProcessQty] [int] NULL,
	[Printflag] [int] NULL,
	[StartPosition] [int] NULL,
	[EndPosition] [int] NULL,
	[CustomerName] [varchar](100) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[typeDummyMaster]    Script Date: 31-Dec-21 7:54:04 PM ******/
DROP TYPE [dbo].[typeDummyMaster]
GO

/****** Object:  UserDefinedTableType [dbo].[typeDummyMaster]    Script Date: 31-Dec-21 7:54:04 PM ******/
CREATE TYPE [dbo].[typeDummyMaster] AS TABLE(
	[LoaddaywithItemcode] [varchar](100) NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[DeliveryQty] [int] NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[CustomerServiceLoadDay] [varchar](25) NULL,
	[PlanningLoadDay] [varchar](25) NULL,
	[Ageing] [varchar](75) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[ReasonforLoading] [varchar](500) NULL,
	[Status] [varchar](20) NULL,
	[CurrentQty] [int] NULL,
	[AdjustedinPOLoadday1] [varchar](25) NULL,
	[AdjustedQty1] [int] NULL,
	[AdjustedinPOLoadday2] [varchar](25) NULL,
	[AdjustedQty2] [int] NULL,
	[AdjustedinPOLoadday3] [varchar](25) NULL,
	[AdjustedQty3] [int] NULL,
	[AdjustedinPOLoadday4] [varchar](25) NULL,
	[AdjustedQty4] [int] NULL,
	[AdjustedinPOLoadday5] [varchar](25) NULL,
	[AdjustedQty5] [int] NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[typeNestingMaster]    Script Date: 31-Dec-21 7:54:59 PM ******/
DROP TYPE [dbo].[typeNestingMaster]
GO

/****** Object:  UserDefinedTableType [dbo].[typeNestingMaster]    Script Date: 31-Dec-21 7:54:59 PM ******/
CREATE TYPE [dbo].[typeNestingMaster] AS TABLE(
	[ItemcodewithNestingnum] [varchar](100) NULL,
	[PlanningLoadDay] [varchar](25) NULL,
	[POType] [varchar](15) NULL,
	[Process1] [varchar](30) NULL,
	[Process2] [varchar](30) NULL,
	[Itemcode] [varchar](75) NULL,
	[Itemdescription] [varchar](150) NULL,
	[RMCode] [varchar](100) NULL,
	[RMDescription] [varchar](150) NULL,
	[Qty] [int] NULL,
	[BatchOrIndividual] [varchar](1) NULL,
	[Nestingnumber] [varchar](25) NULL,
	[FY] [int] NULL,
	[LoadDay] [int] NULL,
	[S1ofRM] [varchar](10) NULL,
	[Material] [varchar](30) NULL,
	[Nestingno] [varchar](5) NULL,
	[NestingQty] [int] NULL,
	[ProcessQty] [int] NULL,
	[Printflag] [int] NULL,
	[StartPosition] [int] NULL,
	[EndPosition] [int] NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[typeOpenPOMaster]    Script Date: 31-Dec-21 7:55:42 PM ******/
DROP TYPE [dbo].[typeOpenPOMaster]
GO

/****** Object:  UserDefinedTableType [dbo].[typeOpenPOMaster]    Script Date: 31-Dec-21 7:55:42 PM ******/
CREATE TYPE [dbo].[typeOpenPOMaster] AS TABLE(
	[POwithItemCode] [varchar](175) NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[PONumber] [varchar](75) NULL,
	[PODate] [datetime] NULL,
	[HSNCode] [varchar](50) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[UnitCostorBasicPrice] [numeric](38, 5) NULL,
	[PODeliveryQty] [int] NULL,
	[TotalSalePrice] [numeric](38, 5) NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[TaxSet] [varchar](50) NULL,
	[TaxClass] [varchar](50) NULL,
	[FullAddress] [varchar](500) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[Remarks] [varchar](500) NULL,
	[QtyLoaded] [int] NULL,
	[QtyNotLoaded] [int] NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO

/****** Object:  Table [dbo].[OpenPOMaster]    Script Date: 31-Dec-21 7:18:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPOMaster]') AND type in (N'U'))
DROP TABLE [dbo].[OpenPOMaster]
GO

/****** Object:  Table [dbo].[OpenPOMaster]    Script Date: 31-Dec-21 7:18:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OpenPOMaster](
	[POwithItemCode] [varchar](175) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[PONumber] [varchar](75) NULL,
	[PODate] [datetime] NULL,
	[HSNCode] [varchar](50) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[UnitCostorBasicPrice] [numeric](38, 5) NULL,
	[PODeliveryQty] [int] NULL,
	[TotalSalePrice] [numeric](38, 5) NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[TaxSet] [varchar](50) NULL,
	[TaxClass] [varchar](50) NULL,
	[FullAddress] [varchar](500) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[Remarks] [varchar](500) NULL,
	[QtyLoaded] [int] NULL,
	[QtyNotLoaded] [int] NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[POwithItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[OpenPOMasterHistory]    Script Date: 31-Dec-21 7:19:25 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPOMasterHistory]') AND type in (N'U'))
DROP TABLE [dbo].[OpenPOMasterHistory]
GO

/****** Object:  Table [dbo].[OpenPOMasterHistory]    Script Date: 31-Dec-21 7:19:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OpenPOMasterHistory](
	[POMasterIdentity] [int] IDENTITY(1,1) NOT NULL,
	[POwithItemCode] [varchar](175) NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[PONumber] [varchar](75) NULL,
	[PODate] [datetime] NULL,
	[HSNCode] [varchar](50) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[UnitCostorBasicPrice] [numeric](38, 5) NULL,
	[PODeliveryQty] [int] NULL,
	[TotalSalePrice] [numeric](38, 5) NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[TaxSet] [varchar](50) NULL,
	[TaxClass] [varchar](50) NULL,
	[FullAddress] [varchar](500) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[Remarks] [varchar](500) NULL,
	[QtyLoaded] [int] NULL,
	[QtyNotLoaded] [int] NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[POMasterIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  StoredProcedure [dbo].[spDeleteDummyMaster]    Script Date: 31-Dec-21 7:21:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spDeleteDummyMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[DummyMaster]
	delete from [dbo].[DummyMasterHistory]
END
GO

/****** Object:  StoredProcedure [dbo].[spDummyAdjusment]    Script Date: 31-Dec-21 7:22:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spDummyAdjusment]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @Itemcode varchar(75),@Qty int,@Count int,@SumQty int,@SLoadday varchar(25),@AvailQty int,@CurrentQty int,@AdjCount int,@DummyTotalQty int

			DECLARE Adjust_cursor CURSOR FOR SELECT Itemcode,FinalQty FROM dbo.ConsolidatedComponentList where LoadDay=@Loadday;
			OPEN Adjust_cursor
			FETCH NEXT FROM Adjust_cursor INTO @Itemcode,@Qty					

			WHILE @@FETCH_STATUS = 0
			BEGIN
				set @Count=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode)
				IF @Count > 0
				BEGIN
					set @AvailQty=@Qty
					set @SumQty=(select sum(CurrentQty) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode group by ItemcodeforLoading)
					set @DummyTotalQty=@SumQty
					WHILE @SumQty>0 and @AvailQty>0
					BEGIN
						set @SLoadday=(select top 1 PlanningLoadDay from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and CurrentQty>0)
						set @CurrentQty=(select CurrentQty from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday)
						
						IF @CurrentQty>=@AvailQty
						BEGIN
							set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday1 is null or AdjustedinPOLoadday1=''))
							IF @Count > 0
							BEGIN
								update dbo.DummyMaster set AdjustedinPOLoadday1=@Loadday,AdjustedQty1=@AvailQty,CurrentQty=CurrentQty-@AvailQty where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
							END
							ELSE--
							BEGIN
								set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday2 is null or AdjustedinPOLoadday2=''))
								IF @Count > 0
								BEGIN
									update dbo.DummyMaster set AdjustedinPOLoadday2=@Loadday,AdjustedQty2=@AvailQty,CurrentQty=CurrentQty-@AvailQty where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
								END
								ELSE
								BEGIN
									set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday3 is null or AdjustedinPOLoadday3=''))
									IF @Count > 0
									BEGIN
										update dbo.DummyMaster set AdjustedinPOLoadday3=@Loadday,AdjustedQty3=@AvailQty,CurrentQty=CurrentQty-@AvailQty where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
									END
									ELSE
									BEGIN
										set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday4 is null or AdjustedinPOLoadday4=''))
										IF @Count > 0
										BEGIN
											update dbo.DummyMaster set AdjustedinPOLoadday4=@Loadday,AdjustedQty4=@AvailQty,CurrentQty=CurrentQty-@AvailQty where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
										END
										ELSE
										BEGIN
											set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday5 is null or AdjustedinPOLoadday5=''))
											IF @Count > 0
											BEGIN
												update dbo.DummyMaster set AdjustedinPOLoadday5=@Loadday,AdjustedQty5=@AvailQty,CurrentQty=CurrentQty-@AvailQty where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
											END
										END
									END
								END
							END--
							set @AvailQty=0
						END --IF @CurrentQty>=@Qty
						ELSE
						BEGIN
							set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday1 is null or AdjustedinPOLoadday1=''))
							IF @Count > 0
							BEGIN
								update dbo.DummyMaster set AdjustedinPOLoadday1=@Loadday,AdjustedQty1=CurrentQty,CurrentQty=0 where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
							END
							ELSE--
							BEGIN
								set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday2 is null or AdjustedinPOLoadday2=''))
								IF @Count > 0
								BEGIN
									update dbo.DummyMaster set AdjustedinPOLoadday2=@Loadday,AdjustedQty2=CurrentQty,CurrentQty=0 where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
								END
								ELSE
								BEGIN
									set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday3 is null or AdjustedinPOLoadday3=''))
									IF @Count > 0
									BEGIN
										update dbo.DummyMaster set AdjustedinPOLoadday3=@Loadday,AdjustedQty3=CurrentQty,CurrentQty=0 where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
									END
									ELSE
									BEGIN
										set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday4 is null or AdjustedinPOLoadday4=''))
										IF @Count > 0
										BEGIN
											update dbo.DummyMaster set AdjustedinPOLoadday4=@Loadday,AdjustedQty4=CurrentQty,CurrentQty=0 where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
										END
										ELSE
										BEGIN
											set @AdjCount=(select count(ItemcodeforLoading) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday and (AdjustedinPOLoadday5 is null or AdjustedinPOLoadday5=''))
											IF @Count > 0
											BEGIN
												update dbo.DummyMaster set AdjustedinPOLoadday5=@Loadday,AdjustedQty5=CurrentQty,CurrentQty=0 where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday
											END
										END
									END
								END
							END--
							set @AvailQty=(select @AvailQty-CurrentQty from dbo.DummyMaster where ItemcodeforLoading=@Itemcode and PlanningLoadDay=@SLoadday)
						END--ELSE

						set @SumQty=(select sum(CurrentQty) from dbo.DummyMaster where ItemcodeforLoading=@Itemcode group by ItemcodeforLoading)
					END--@SumQty>0 and @AvailQty>0
					IF @SumQty=0
					BEGIN
						update dbo.ConsolidatedComponentList set FinalQty=@AvailQty where Itemcode=@Itemcode and LoadDay=@Loadday
						update dbo.ConsolidatedDummyPOAdjust set DummyPOQty=@DummyTotalQty,BalanceDummyPOQty=0 where Itemcode=@Itemcode and LoadDay=@Loadday
					END
					IF @AvailQty=0
					BEGIN
						update dbo.ConsolidatedComponentList set FinalQty=0 where Itemcode=@Itemcode and LoadDay=@Loadday
						update dbo.ConsolidatedDummyPOAdjust set DummyPOQty=@DummyTotalQty,BalanceDummyPOQty=@DummyTotalQty-@Qty where Itemcode=@Itemcode and LoadDay=@Loadday
					END
				END--IF @Count > 0

				FETCH NEXT FROM Adjust_cursor INTO @Itemcode,@Qty
			END
			CLOSE Adjust_cursor;
			DEALLOCATE Adjust_cursor;
			
		COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
	CLOSE Adjust_cursor;
	DEALLOCATE Adjust_cursor;
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

        DECLARE @Message nvarchar(2048) = ERROR_MESSAGE();
        DECLARE @Severity integer = ERROR_SEVERITY();
        DECLARE @State integer = ERROR_STATE();

        RAISERROR(@Message, @Severity, @State);
        RETURN -1;
  END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[spDummyConsolidateReport]    Script Date: 31-Dec-21 7:23:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spDummyConsolidateReport]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into dbo.ConsolidatedComponentList(Itemcode,description,RMCode,RMDescription,lc1,lc2,c.Size1,c.Size2,c.Size3,FinalQty,process1,process2,process3,process4,process5,process6,process7,process8,process9,process10,process11,process12,process13,process14,process15,finishtype,surfacepreparation,primercolour,primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,remarks,LoadDay)
			select a.ItemcodeforLoading,b.description,c.RMCode,d.description,b.lc1,b.lc2,c.Size1,c.Size2,c.Size3,a.DeliveryQty,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15,b.finishtype,b.surfacepreparation,b.primercolour,b.primerDFT,b.IMOColour,b.IMODFT,b.TopCoatColour,b.TopCoatDFT,b.remarks,@Loadday
			from [dbo].[DummyMaster] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d where a.ItemcodeforLoading=b.itemcode and a.ItemcodeforLoading=c.ItemCode and c.RMCode=d.itemcode and a.PlanningLoadDay=@Loadday 
			
			insert into dbo.ConsolidatedRMReport(RMCode,RMDescription,Size1,Size2,Size3,tables,ScrapPercent,Qty,SUOM,Table1OrTable2,AddPercent,Total,TotalwithQty,RMS2,RMS3,InMetres,NumberOfSheetsOrLengthRequired,LoadDay)
			select b.RMCode,b.RMDescription,b.Size1,b.Size2,b.Size3,c.tables,d.ScrapPercent,a.DeliveryQty,
			CASE
				WHEN c.tables=1 THEN 'Sq-m'
				WHEN c.tables=2 THEN 'm'
			END AS SUOM,
			CASE
				WHEN c.tables=1 THEN (cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000 
				ELSE cast(b.Size3 as DECIMAL(10, 6))/1000
			END AS Table1OrTable2,
			CASE
				WHEN c.tables=1 THEN ((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100
				ELSE (cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100
			END AS AddPercent,
			CASE
				WHEN c.tables=1 THEN ((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100)
				ELSE (cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100)
			END AS Total,
			CASE
				WHEN c.tables=1 THEN (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*a.DeliveryQty
				ELSE ((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*a.DeliveryQty
			END AS TotalwithQty,c.size2 'RMS2',c.size3 'RMS3',
			CASE
				WHEN c.tables=1 THEN (cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000 
				ELSE cast(c.size3 as DECIMAL(10, 6))/1000
			END AS 'InMetres',
			CASE
				WHEN c.tables=1 THEN ((((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*a.DeliveryQty)/((cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000)
				ELSE (((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*a.DeliveryQty)/(cast(c.size3 as DECIMAL(10, 6))/1000)
			END AS NumberOfSheetsOrLengthRequired,@Loadday
			from [dbo].[DummyMaster] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.ItemcodeforLoading=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and a.PlanningLoadDay=@Loadday
			
			;WITH Report AS (
			select b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,			
			((((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*a.DeliveryQty)/((cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000) 'NumberOfSheetsOrLengthRequired'
			from [dbo].[DummyMaster] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.ItemcodeforLoading=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and c.tables=1 and a.PlanningLoadDay=@Loadday)
			insert into dbo.ConsolidatedStoreReportTable1(RMCode,RMDescription,size1,size2,size3,tables,NumberOfSheetsRequiredinNumbers, 
			NumberOfSheetsPerNesting,NumberOfSheetsIssued,Remarks,LoadDay)
			select RMCode,RMDescription,size1,size2,size3,tables,sum(NumberOfSheetsOrLengthRequired),null,null,null,@Loadday from Report group by RMCode,RMDescription,size1,size2,size3,tables

			;WITH Report AS (
			select b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,
			(((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*a.DeliveryQty)/(cast(c.size3 as DECIMAL(10, 6))/1000) 'NumberOfSheetsOrLengthRequired'			
			from [dbo].[DummyMaster] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.ItemcodeforLoading=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and c.tables=2 and a.PlanningLoadDay=@Loadday)
			insert into dbo.ConsolidatedStoreReportTable2(RMCode,RMDescription,size1,size2,size3,tables,LengthRequiredinMetre,NumberOfSheetsIssued,Remarks,LoadDay)
			select RMCode,RMDescription,size1,size2,size3,tables,sum(NumberOfSheetsOrLengthRequired),null,null,@Loadday from Report group by RMCode,RMDescription,size1,size2,size3,tables

		COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
	CLOSE PO_cursor;
	DEALLOCATE PO_cursor;
	CLOSE POLevel_cursor;
	DEALLOCATE POLevel_cursor;
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
		
        DECLARE @Message nvarchar(2048) = ERROR_MESSAGE();
        DECLARE @Severity integer = ERROR_SEVERITY();
        DECLARE @State integer = ERROR_STATE();

        RAISERROR(@Message, @Severity, @State);
        RETURN -1;
  END CATCH
END
GO

USE [IndustriesDB]
GO

/****** Object:  StoredProcedure [dbo].[spDummyInsertNestingMaster]    Script Date: 31-Dec-21 7:23:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spDummyInsertNestingMaster]
@typDummyNestingMaster AS dbo.typeDummyNestingMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[DummyMaster](LoaddaywithItemcode,CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
			CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,AdjustedinPOLoadday1,AdjustedQty1,
			AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
			AdjustedQty5,createdby,modifiedby,createddate,updateddate) 
			select Concat(Concat('D',typ.PlanningLoadDay),typ.Itemcode),i.customername,c.CustomerCode,typ.Itemcode,i.description,i.revisionlevel,
			(SELECT SUM(FinalQty) FROM [IndustriesDB].[dbo].[ConsolidatedReport] where LoadDay=typ.PlanningLoadDay and lc1=1 and Itemcode=typ.Itemcode group by Itemcode),i.uom,i.suom,
			null,Concat('D',typ.PlanningLoadDay),null,'L','Extra added for Nesting for Utilisation','Approved',null,null,null,null,null,null,null,null,null,null,
			typ.createdby,typ.modifiedby,GETDATE(),GETDATE() from @typDummyNestingMaster typ,dbo.CustomerMaster c,dbo.ItemMaster i
			where i.customername=c.CustomerName and typ.Itemcode=i.itemcode and typ.Itemcode in (select itemcode from [dbo].[ItemMaster] where LiveorRetired='L' and lc1=1 and lc2='F') and typ.Itemcode in (select ItemCode from [dbo].[ComponentMaster])


			insert into [dbo].[NestingMaster](ItemcodewithNestingnum,PlanningLoadDay,POType,Process1,Process2,Itemcode,
			Itemdescription,RMCode,RMDescription,Qty,BatchOrIndividual,Nestingnumber,FY,LoadDay,S1ofRM,Material,Nestingno,
			NestingQty,ProcessQty,Printflag,StartPosition,EndPosition,createdby,modifiedby,createddate,updateddate) 
			select CONCAT(typ.Itemcode,CONCAT(typ.PlanningLoadDay,'-',typ.Nestingno,'-',typ.S1ofRM,'T-',typ.Material)),
			typ.PlanningLoadDay,typ.POType,
			CASE
				WHEN b.process1='LASERCUTTING' or b.process2='LASERCUTTING' or b.process3='LASERCUTTING' or
				b.process4='LASERCUTTING' or b.process5='LASERCUTTING' or b.process6='LASERCUTTING' or b.process7='LASERCUTTING' or 
				b.process8='LASERCUTTING' or b.process9='LASERCUTTING' or b.process10='LASERCUTTING' or b.process11='LASERCUTTING' or 
				b.process12='LASERCUTTING' or b.process13='LASERCUTTING' or b.process14='LASERCUTTING' or b.process15='LASERCUTTING' or 
				b.process1='LASER CUTTING' or b.process2='LASER CUTTING' or b.process3='LASER CUTTING' or b.process4='LASER CUTTING' or 
				b.process5='LASER CUTTING' or b.process6='LASER CUTTING' or b.process7='LASER CUTTING' or b.process8='LASER CUTTING' or 
				b.process9='LASER CUTTING' or b.process10='LASER CUTTING' or b.process11='LASER CUTTING' or b.process12='LASER CUTTING' or 
				b.process13='LASER CUTTING' or b.process14='LASER CUTTING' or b.process15='LASER CUTTING'
				THEN 'LASERCUTTING'
			END AS Process1,
			CASE
				WHEN b.process1='TPP' or b.process2='TPP' or b.process3='TPP' or b.process4='TPP' or b.process5='TPP' or 
				b.process6='TPP' or b.process7='TPP' or b.process8='TPP' or b.process9='TPP' or b.process10='TPP' or 
				b.process11='TPP' or b.process12='TPP' or b.process13='TPP' or b.process14='TPP' or b.process15='TPP' 
				THEN 'TPP'
			END AS Process2,typ.Itemcode,b.description,c.RMCode,d.description,
			(SELECT SUM(FinalQty) FROM [IndustriesDB].[dbo].[ConsolidatedReport] where LoadDay=typ.PlanningLoadDay and lc1=1 and Itemcode=typ.Itemcode group by Itemcode),typ.BatchOrIndividual,
			CONCAT(typ.PlanningLoadDay,'-',typ.Nestingno,'-',typ.S1ofRM,'T-',typ.Material),LEFT(typ.PlanningLoadDay, 4),
			RIGHT(typ.PlanningLoadDay, 4),CONCAT(typ.S1ofRM,'T'),typ.Material,typ.Nestingno,typ.NestingQty,typ.ProcessQty,
			0,
			CASE
				WHEN RIGHT(typ.Nestingno,1) = 1 THEN 1
				WHEN RIGHT(typ.Nestingno,1) != 1 
				THEN (select EndPosition+1 from [dbo].[NestingMaster] where PlanningLoadDay=typ.PlanningLoadDay and Itemcode=typ.Itemcode and Nestingno in (select MAX(Nestingno) from [dbo].[NestingMaster] where Nestingno<typ.Nestingno and PlanningLoadDay=typ.PlanningLoadDay and Itemcode=typ.Itemcode))
			END AS StartPosition,
			CASE
				WHEN RIGHT(typ.Nestingno,1) = 1 THEN typ.NestingQty*typ.ProcessQty
				WHEN RIGHT(typ.Nestingno,1) != 1 
				THEN (select EndPosition+(typ.NestingQty*typ.ProcessQty) from [dbo].[NestingMaster] where PlanningLoadDay=typ.PlanningLoadDay and Itemcode=typ.Itemcode and Nestingno in (select MAX(Nestingno) from [dbo].[NestingMaster] where Nestingno<typ.Nestingno and PlanningLoadDay=typ.PlanningLoadDay and Itemcode=typ.Itemcode))
			END AS EndPosition,typ.createdby,typ.modifiedby,GETDATE(),GETDATE()
			from @typDummyNestingMaster typ,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d
			where typ.Itemcode=b.itemcode and typ.Itemcode=c.ItemCode and c.RMCode=d.itemcode and
			(b.process1='LASERCUTTING' or b.process2='LASERCUTTING' or b.process3='LASERCUTTING' or
			b.process4='LASERCUTTING' or b.process5='LASERCUTTING' or b.process6='LASERCUTTING' or b.process7='LASERCUTTING' or 
			b.process8='LASERCUTTING' or b.process9='LASERCUTTING' or b.process10='LASERCUTTING' or b.process11='LASERCUTTING' or 
			b.process12='LASERCUTTING' or b.process13='LASERCUTTING' or b.process14='LASERCUTTING' or b.process15='LASERCUTTING' or 
			b.process1='LASER CUTTING' or b.process2='LASER CUTTING' or b.process3='LASER CUTTING' or b.process4='LASER CUTTING' or 
			b.process5='LASER CUTTING' or b.process6='LASER CUTTING' or b.process7='LASER CUTTING' or b.process8='LASER CUTTING' or 
			b.process9='LASER CUTTING' or b.process10='LASER CUTTING' or b.process11='LASER CUTTING' or b.process12='LASER CUTTING' or 
			b.process13='LASER CUTTING' or b.process14='LASER CUTTING' or b.process15='LASER CUTTING' or
			b.process1='TPP' or b.process2='TPP' or b.process3='TPP' or b.process4='TPP' or b.process5='TPP' or 
			b.process6='TPP' or b.process7='TPP' or b.process8='TPP' or b.process9='TPP' or b.process10='TPP' or 
			b.process11='TPP' or b.process12='TPP' or b.process13='TPP' or b.process14='TPP' or b.process15='TPP')

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

        DECLARE @Message nvarchar(2048) = ERROR_MESSAGE();
        DECLARE @Severity integer = ERROR_SEVERITY();
        DECLARE @State integer = ERROR_STATE();

        RAISERROR(@Message, @Severity, @State);
        RETURN -1;
	END CATCH	  
END
GO


/****** Object:  StoredProcedure [dbo].[spInsertDummyMaster]    Script Date: 31-Dec-21 7:24:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spInsertDummyMaster]
@typDummyMaster AS dbo.typeDummyMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[DummyMaster](LoaddaywithItemcode,CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
			CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
			AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
			AdjustedQty5,createdby,modifiedby,createddate,updateddate) 
			select Concat(Concat('D',typ.CustomerServiceLoadDay),typ.ItemcodeforLoading),typ.CustomerName,c.CustomerCode,typ.ItemcodeforLoading,i.description,i.revisionlevel,typ.DeliveryQty,i.uom,i.suom,
			typ.CustomerServiceLoadDay,Concat('D',typ.PlanningLoadDay),typ.Ageing,typ.LiveorRetired,typ.ReasonforLoading,typ.Status,typ.DeliveryQty,typ.AdjustedinPOLoadday1,typ.AdjustedQty1,
			typ.AdjustedinPOLoadday2,typ.AdjustedQty2,typ.AdjustedinPOLoadday3,typ.AdjustedQty3,typ.AdjustedinPOLoadday4,typ.AdjustedQty4,typ.AdjustedinPOLoadday5,
			typ.AdjustedQty5,typ.createdby,typ.modifiedby,GETDATE(),GETDATE() from @typDummyMaster typ,dbo.CustomerMaster c,dbo.ItemMaster i
			where typ.CustomerName=c.CustomerName and typ.ItemcodeforLoading=i.itemcode and typ.ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster] where LiveorRetired='L' and lc1=1 and lc2='F') and typ.ItemcodeforLoading in (select ItemCode from [dbo].[ComponentMaster])

			select Concat(Concat('D',CustomerServiceLoadDay),ItemcodeforLoading) 'LoaddaywithItemcode',CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
			CustomerServiceLoadDay 'CustomerServiceLoadDay',Concat('D',PlanningLoadDay) 'PlanningLoadDay',Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
			AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
			AdjustedQty5,createdby,modifiedby,createddate,updateddate from @typDummyMaster typ
			where typ.ItemcodeforLoading not in (select itemcode from [dbo].[ItemMaster] where LiveorRetired='L' and lc1=1 and lc2='F') or typ.CustomerName not in (select CustomerName from dbo.CustomerMaster) or typ.ItemcodeforLoading not in (select ItemCode from [dbo].[ComponentMaster])

		
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

        DECLARE @Message nvarchar(2048) = ERROR_MESSAGE();
        DECLARE @Severity integer = ERROR_SEVERITY();
        DECLARE @State integer = ERROR_STATE();

        RAISERROR(@Message, @Severity, @State);
        RETURN -1;
	END CATCH	  
END
GO

/****** Object:  StoredProcedure [dbo].[spSelectDummyApprovedLoaddayList]    Script Date: 31-Dec-21 7:24:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spSelectDummyApprovedLoaddayList]
AS
BEGIN	
	SET NOCOUNT ON;	

	select LoaddaywithItemcode,CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
	CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
	AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
	AdjustedQty5,createdby,modifiedby,createddate,updateddate from [IndustriesDB].[dbo].[DummyMaster] 
	where Status='Approved' and PlanningLoadDay is not null
END
GO

/****** Object:  StoredProcedure [dbo].[spSelectDummyLoaddayGroupList]    Script Date: 31-Dec-21 7:25:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spSelectDummyLoaddayGroupList]
@Loadday AS varchar(25)
AS
BEGIN
	SET NOCOUNT ON;
	select distinct RIGHT(PlanningLoadDay, 1) 'PlanningLoadDay' from dbo.DummyMaster where PlanningLoadDay like @Loadday+'_'
END
GO

/****** Object:  StoredProcedure [dbo].[spSelectDummyLoadDayList]    Script Date: 31-Dec-21 7:25:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spSelectDummyLoadDayList]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select ItemcodeforLoading,ITEMDESCRIPTION,DeliveryQty from [dbo].[DummyMaster] where PlanningLoadDay=@Loadday
END

GO

/****** Object:  StoredProcedure [dbo].[spSelectDummyMaster]    Script Date: 31-Dec-21 7:26:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spSelectDummyMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	select LoaddaywithItemcode,CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
	CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty, AdjustedinPOLoadday1,AdjustedQty1,
	AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
	AdjustedQty5,createdby,modifiedby,createddate,updateddate from [IndustriesDB].[dbo].[DummyMaster]
	
END
GO

/****** Object:  StoredProcedure [dbo].[spSelectDummyPOAdjust]    Script Date: 31-Dec-21 7:26:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spSelectDummyPOAdjust]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select Itemcode,Itemdescription,RMCode,RMDescription,lc1,lc2,Size1,Size2,Size3,TotalQty,DummyPOQty,BalanceDummyPOQty,process1,process2,process3,process4,process5,process6,process7,process8,process9,process10,process11,process12,process13,process14,process15,finishtype,surfacepreparation,primercolour,primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,remarks
	from [dbo].[ConsolidatedDummyPOAdjust] where LoadDay=@Loadday

END
GO

/****** Object:  StoredProcedure [dbo].[spSelectDummyUnApprovedList]    Script Date: 31-Dec-21 7:27:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spSelectDummyUnApprovedList]
AS
BEGIN	
	SET NOCOUNT ON;	

	select LoaddaywithItemcode,CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
	CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
	AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
	AdjustedQty5,createdby,modifiedby,createddate,updateddate from [IndustriesDB].[dbo].[DummyMaster] where (Status is null or Status = '')

END
GO

/****** Object:  StoredProcedure [dbo].[spSelectDummyUnLoaddayList]    Script Date: 31-Dec-21 7:27:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spSelectDummyUnLoaddayList]
AS
BEGIN	
	SET NOCOUNT ON;	
	select LoaddaywithItemcode,CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
	CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
	AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
	AdjustedQty5,createdby,modifiedby,createddate,updateddate from [IndustriesDB].[dbo].[DummyMaster]
	where Status='Approved' and (PlanningLoadDay is null or PlanningLoadDay = '')

END
GO

/****** Object:  StoredProcedure [dbo].[spUpdateDummyMaster]    Script Date: 31-Dec-21 7:27:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[spUpdateDummyMaster]
@typDummyMaster AS dbo.typeDummyMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION			
			
			Insert into [dbo].[DummyMasterHistory](LoaddaywithItemcode,CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
			CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
			AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
			AdjustedQty5,createdby,modifiedby,createddate,updateddate) 
			select LoaddaywithItemcode,CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
			CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
			AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
			AdjustedQty5,createdby,modifiedby,createddate,updateddate from [dbo].[DummyMaster] 
			where ItemcodeforLoading in (select ItemcodeforLoading from @typDummyMaster typ where typ.ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster] where LiveorRetired='L' and lc1=1 and lc2='F') and 
			typ.CustomerCode in (select CustomerCode from [dbo].[CustomerMaster]) and typ.ItemcodeforLoading in (select ItemCode from [dbo].[ComponentMaster]))


			update [dbo].[DummyMaster] set LoaddaywithItemcode=Concat(Concat('D',typ.CustomerServiceLoadDay),typ.ItemcodeforLoading),CustomerName=typ.CustomerName,CustomerCode=c.CustomerCode,ItemcodeforLoading=typ.ItemcodeforLoading,ITEMDESCRIPTION=i.description,RevisionLevel=i.revisionlevel,DeliveryQty=typ.DeliveryQty,UOM=i.uom,SUOM=i.suom,
			CustomerServiceLoadDay=typ.CustomerServiceLoadDay,PlanningLoadDay=typ.PlanningLoadDay,Ageing=typ.Ageing,LiveorRetired=typ.LiveorRetired,ReasonforLoading=typ.ReasonforLoading,Status=typ.Status,CurrentQty=typ.DeliveryQty,AdjustedinPOLoadday1=typ.AdjustedinPOLoadday1,AdjustedQty1=typ.AdjustedQty1,
			AdjustedinPOLoadday2=typ.AdjustedinPOLoadday2,AdjustedQty2=typ.AdjustedQty2,AdjustedinPOLoadday3=typ.AdjustedinPOLoadday3,AdjustedQty3=typ.AdjustedQty3,AdjustedinPOLoadday4=typ.AdjustedinPOLoadday4,AdjustedQty4=typ.AdjustedQty4,AdjustedinPOLoadday5=typ.AdjustedinPOLoadday5,
			AdjustedQty5=typ.AdjustedQty5,createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE()
			from @typDummyMaster typ,dbo.CustomerMaster c,dbo.ItemMaster i
			where typ.CustomerName=c.CustomerName and typ.ItemcodeforLoading=i.itemcode and typ.ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster] where LiveorRetired='L' and lc1=1 and lc2='F') and typ.ItemcodeforLoading in (select ItemCode from [dbo].[ComponentMaster])

			select Concat(Concat('D',CustomerServiceLoadDay),ItemcodeforLoading) 'LoaddaywithItemcode',CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
			CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
			AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
			AdjustedQty5,createdby,modifiedby,createddate,updateddate from @typDummyMaster typ
			where typ.ItemcodeforLoading not in (select itemcode from [dbo].[ItemMaster] where LiveorRetired='L' and lc1=1 and lc2='F') or typ.CustomerName not in (select CustomerName from dbo.CustomerMaster) or typ.ItemcodeforLoading not in (select ItemCode from [dbo].[ComponentMaster])

		COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

        DECLARE @Message nvarchar(2048) = ERROR_MESSAGE();
        DECLARE @Severity integer = ERROR_SEVERITY();
        DECLARE @State integer = ERROR_STATE();

        RAISERROR(@Message, @Severity, @State);
        RETURN -1;
  END CATCH
END
GO


