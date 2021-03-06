USE [IndustriesDB]
GO
/****** Object:  UserDefinedTableType [dbo].[typeMRPMaster]    Script Date: 29-06-2022 11:46:28 ******/
CREATE TYPE [dbo].[typeMRPMaster] AS TABLE(
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[PODeliveryQty] [int] NULL,
	[MRPGeneratedDate] [datetime] NULL,
	[LoadDay] [varchar](25) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[MRPConsolidatedBoughtOutReport]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPConsolidatedBoughtOutReport](
	[BoughtOutReportIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](100) NULL,
	[description] [varchar](150) NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[FinalQty] [int] NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[BoughtOutReportIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRPConsolidatedComponentList]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPConsolidatedComponentList](
	[ComponentListIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](100) NULL,
	[description] [varchar](150) NULL,
	[RMCode] [varchar](100) NULL,
	[RMDescription] [varchar](150) NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[Size1] [varchar](50) NULL,
	[Size2] [varchar](50) NULL,
	[Size3] [varchar](50) NULL,
	[FinalQty] [int] NULL,
	[process1] [varchar](30) NULL,
	[process2] [varchar](30) NULL,
	[process3] [varchar](30) NULL,
	[process4] [varchar](30) NULL,
	[process5] [varchar](30) NULL,
	[process6] [varchar](30) NULL,
	[process7] [varchar](30) NULL,
	[process8] [varchar](30) NULL,
	[process9] [varchar](30) NULL,
	[process10] [varchar](30) NULL,
	[process11] [varchar](30) NULL,
	[process12] [varchar](30) NULL,
	[process13] [varchar](30) NULL,
	[process14] [varchar](30) NULL,
	[process15] [varchar](30) NULL,
	[finishtype] [varchar](75) NULL,
	[surfacepreparation] [varchar](75) NULL,
	[primercolour] [varchar](75) NULL,
	[primerDFT] [varchar](75) NULL,
	[IMOColour] [varchar](75) NULL,
	[IMODFT] [varchar](75) NULL,
	[TopCoatColour] [varchar](75) NULL,
	[TopCoatDFT] [varchar](75) NULL,
	[remarks] [varchar](500) NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ComponentListIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRPConsolidatedLoadDayList]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPConsolidatedLoadDayList](
	[LoadDayListIdentity] [int] IDENTITY(1,1) NOT NULL,
	[POItemcode] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[PODeliveryQty] [int] NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoadDayListIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRPConsolidatedProcessList]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPConsolidatedProcessList](
	[ProcessListIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](100) NULL,
	[description] [varchar](150) NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[FinalQty] [int] NULL,
	[process1] [varchar](30) NULL,
	[process2] [varchar](30) NULL,
	[process3] [varchar](30) NULL,
	[process4] [varchar](30) NULL,
	[process5] [varchar](30) NULL,
	[process6] [varchar](30) NULL,
	[process7] [varchar](30) NULL,
	[process8] [varchar](30) NULL,
	[process9] [varchar](30) NULL,
	[process10] [varchar](30) NULL,
	[process11] [varchar](30) NULL,
	[process12] [varchar](30) NULL,
	[process13] [varchar](30) NULL,
	[process14] [varchar](30) NULL,
	[process15] [varchar](30) NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProcessListIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRPConsolidatedReport]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPConsolidatedReport](
	[ConsolidatedReportIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](100) NULL,
	[Qty] [int] NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[level] [int] NULL,
	[PrevRoot] [varchar](100) NULL,
	[Root] [varchar](100) NULL,
	[FinalQty] [int] NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConsolidatedReportIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRPConsolidatedRMReport]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPConsolidatedRMReport](
	[RMReportIdentity] [int] IDENTITY(1,1) NOT NULL,
	[RMCode] [varchar](75) NULL,
	[RMDescription] [varchar](150) NULL,
	[Size1] [varchar](50) NULL,
	[Size2] [varchar](50) NULL,
	[Size3] [varchar](50) NULL,
	[tables] [int] NULL,
	[ScrapPercent] [int] NULL,
	[Qty] [int] NULL,
	[SUOM] [varchar](20) NULL,
	[Table1OrTable2] [decimal](30, 10) NULL,
	[AddPercent] [decimal](30, 10) NULL,
	[Total] [decimal](30, 10) NULL,
	[TotalwithQty] [decimal](30, 10) NULL,
	[RMS2] [varchar](20) NULL,
	[RMS3] [varchar](20) NULL,
	[InMetres] [decimal](30, 10) NULL,
	[NumberOfSheetsOrLengthRequired] [decimal](30, 10) NULL,
	[LoadDay] [varchar](25) NULL,
	[Itemcode] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RMReportIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRPConsolidatedStoreReportTable1]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPConsolidatedStoreReportTable1](
	[StoreReportTable1Identity] [int] IDENTITY(1,1) NOT NULL,
	[RMCode] [varchar](75) NULL,
	[RMDescription] [varchar](150) NULL,
	[size1] [varchar](20) NULL,
	[size2] [varchar](20) NULL,
	[size3] [varchar](20) NULL,
	[tables] [int] NULL,
	[NumberOfSheetsRequiredinNumbers] [decimal](30, 10) NULL,
	[NumberOfSheetsPerNesting] [decimal](30, 10) NULL,
	[NumberOfSheetsIssued] [decimal](30, 10) NULL,
	[Remarks] [varchar](500) NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreReportTable1Identity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRPConsolidatedStoreReportTable2]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPConsolidatedStoreReportTable2](
	[StoreReportTable2Identity] [int] IDENTITY(1,1) NOT NULL,
	[RMCode] [varchar](75) NULL,
	[RMDescription] [varchar](150) NULL,
	[size1] [varchar](20) NULL,
	[size2] [varchar](20) NULL,
	[size3] [varchar](20) NULL,
	[tables] [int] NULL,
	[LengthRequiredinMetre] [decimal](30, 10) NULL,
	[NumberOfSheetsIssued] [decimal](30, 10) NULL,
	[Remarks] [varchar](500) NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreReportTable2Identity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRPConsolidatedSummaryReport]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPConsolidatedSummaryReport](
	[SummaryReportIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](100) NULL,
	[description] [varchar](150) NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](2) NULL,
	[Qty] [int] NULL,
	[FinalQty] [int] NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[SummaryReportIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRPMaster]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRPMaster](
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NOT NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[PODeliveryQty] [int] NULL,
	[MRPGeneratedDate] [datetime] NULL,
	[LoadDay] [varchar](25) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemcodeforLoading] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spDeleteMRPMaster]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spDeleteMRPMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[MRPMaster]
END

GO
/****** Object:  StoredProcedure [dbo].[spInsertMRPMaster]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertMRPMaster]
@typMRPMaster AS dbo.typeMRPMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[MRPMaster] (CustomerName,CustomerCode,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,
			RevisionLevel,PODeliveryQty,MRPGeneratedDate,LoadDay,createdby,modifiedby,createddate,updateddate) 
			select typ.CustomerName,typ.CustomerCode,typ.POItemcode,typ.ItemcodeforLoading,typ.ITEMDESCRIPTION,
			typ.RevisionLevel,typ.PODeliveryQty,typ.MRPGeneratedDate,typ.LoadDay,typ.createdby,null,GETDATE(),null from @typMRPMaster typ,dbo.CustomerMaster c,dbo.ItemMaster i 
			where typ.ItemcodeforLoading=i.itemcode and typ.CustomerName=c.CustomerName and i.liveorretired='L'

			select typ.CustomerName,typ.CustomerCode,typ.POItemcode,typ.ItemcodeforLoading,typ.ITEMDESCRIPTION,
			typ.RevisionLevel,typ.PODeliveryQty,typ.MRPGeneratedDate,typ.LoadDay,typ.createdby,typ.modifiedby,
			typ.createddate,typ.updateddate from @typMRPMaster typ 
			where (typ.ItemcodeforLoading not in (select itemcode from [dbo].[ItemMaster] where liveorretired='L')) or (typ.CustomerName not in(select CustomerName from dbo.CustomerMaster))
		
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
/****** Object:  StoredProcedure [dbo].[spMRPConsolidateReport]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMRPConsolidateReport]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			create table LevelTableOrg(Itemcode varchar(75))
			create table LevelTableDup(Itemcode varchar(75))		
			DECLARE @AssemblyNumber varchar(75),@POitemcode varchar(75),@POqty int,@lc1 int,@lc2 varchar(1),@level int,@POLevelitemcode varchar(75),@POLevelqty int,@Levellc1 int,@Levellc2 varchar(1),@Parentitemcode varchar(75),@Count int,@AssemplyQty int;
			
			DECLARE MRP_cursor CURSOR FOR SELECT ItemcodeforLoading,PODeliveryQty FROM dbo.MRPMaster where LoadDay=@Loadday;			
			OPEN MRP_cursor
			FETCH NEXT FROM MRP_cursor INTO @POitemcode,@POqty

			WHILE @@FETCH_STATUS = 0
			BEGIN
				set @level=0	
				SELECT @lc1 = (select lc1 from [dbo].[ItemMaster] where itemcode=@POitemcode) 
				SELECT @lc2 = (select lc2 from [dbo].[ItemMaster] where itemcode=@POitemcode)

				insert into dbo.MRPConsolidatedReport(Itemcode,Qty,lc1,lc2,level,PrevRoot,Root,FinalQty,LoadDay) values (@POitemcode,@POqty,@lc1,@lc2,@level,null,null,@POqty,@Loadday)
				
				delete from LevelTableOrg
				insert into LevelTableOrg values(@POitemcode)
				set @Count=1

				IF @lc1 = 2 and @lc2='F'
				BEGIN
					WHILE ( @Count > 0)
					BEGIN										
						DECLARE MRPLevel_cursor CURSOR FOR select a.Itemcode,a.Qty,a.AssemblyNumber from dbo.AssemblyMaster a,LevelTableOrg b where a.AssemblyNumber=b.Itemcode
						OPEN MRPLevel_cursor
						FETCH NEXT FROM MRPLevel_cursor INTO @POLevelitemcode,@POLevelqty,@AssemblyNumber						
						
						set @level=@level+1						

						WHILE @@FETCH_STATUS = 0
						BEGIN
							Set	@Parentitemcode=@AssemblyNumber
							IF @level=1
							begin
								SELECT @AssemplyQty=(select top 1 FinalQty from dbo.MRPConsolidatedReport where Itemcode=@AssemblyNumber and LoadDay=@Loadday and Root is null)
							end
							IF @level>1
							begin
								SELECT @AssemplyQty=(select top 1 FinalQty from dbo.MRPConsolidatedReport where Itemcode=@AssemblyNumber and LoadDay=@Loadday and Root=@POitemcode)
							end
							SELECT @Levellc1 = (select lc1 from [dbo].[ItemMaster] where itemcode=@POLevelitemcode) 
							SELECT @Levellc2 = (select lc2 from [dbo].[ItemMaster] where itemcode=@POLevelitemcode)

							insert into dbo.MRPConsolidatedReport(Itemcode,Qty,lc1,lc2,level,PrevRoot,Root,FinalQty,LoadDay) values (@POLevelitemcode,@POLevelqty,@Levellc1,@Levellc2,@level,@Parentitemcode,@POitemcode,@AssemplyQty*@POLevelqty,@Loadday)

							IF @Levellc1 = 2 and @Levellc2='F'
							BEGIN
								insert into LevelTableDup values(@POLevelitemcode)
							END

							FETCH NEXT FROM MRPLevel_cursor INTO @POLevelitemcode,@POLevelqty,@AssemblyNumber
						END

						delete from LevelTableOrg
						SELECT @Count=(select count(Itemcode) from LevelTableDup)
						--print 'Count:' + CAST(@Count as varchar(10))
						insert into LevelTableOrg select * from LevelTableDup
						delete from LevelTableDup

						CLOSE MRPLevel_cursor;
						DEALLOCATE MRPLevel_cursor;
					END --whille
				END --if				

				FETCH NEXT FROM MRP_cursor INTO @POitemcode,@POqty
			END
			CLOSE MRP_cursor;
			DEALLOCATE MRP_cursor;
			drop table LevelTableOrg
			drop table LevelTableDup

			print 'Inside Insert'

			insert into dbo.MRPConsolidatedLoadDayList(POItemcode,ITEMDESCRIPTION,PODeliveryQty,LoadDay)
			select a.POItemcode,a.ITEMDESCRIPTION,a.PODeliveryQty,@Loadday from [dbo].[MRPMaster] a,[dbo].[MRPConsolidatedReport] b
			where a.ItemcodeforLoading=b.Itemcode and a.LoadDay=b.LoadDay and b.LoadDay=@Loadday and b.Root is null

			insert into dbo.MRPConsolidatedSummaryReport(Itemcode,description,lc1,lc2,Qty,FinalQty,LoadDay)
			select a.Itemcode,b.description,a.lc1,a.lc2,a.Qty,a.FinalQty,@Loadday from [dbo].[MRPConsolidatedReport] a,[dbo].[ItemMaster] b 
			where a.Itemcode=b.itemcode and a.LoadDay=@Loadday

			insert into dbo.MRPConsolidatedProcessList(Itemcode,description,lc1,lc2,FinalQty,process1,process2,process3,process4,process5,
			process6,process7,process8,process9,process10,process11,process12,process13,process14,process15,LoadDay)
			select a.Itemcode,b.description,a.lc1,a.lc2,sum(a.FinalQty),b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15,@Loadday
			from [dbo].[MRPConsolidatedReport] a,[dbo].[ItemMaster] b where a.Itemcode=b.itemcode and a.LoadDay=@Loadday group by a.Itemcode,b.description,a.lc1,a.lc2,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15

			insert into dbo.MRPConsolidatedComponentList(Itemcode,description,RMCode,RMDescription,lc1,lc2,c.Size1,c.Size2,c.Size3,FinalQty,process1,process2,process3,process4,process5,process6,process7,process8,process9,process10,process11,process12,process13,process14,process15,finishtype,surfacepreparation,primercolour,primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,remarks,LoadDay)
			select a.Itemcode,b.description,c.RMCode,d.description,a.lc1,a.lc2,c.Size1,c.Size2,c.Size3,sum(a.FinalQty),b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15,b.finishtype,b.surfacepreparation,b.primercolour,b.primerDFT,b.IMOColour,b.IMODFT,b.TopCoatColour,b.TopCoatDFT,b.remarks,@Loadday
			from [dbo].[MRPConsolidatedReport] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d where a.Itemcode=b.itemcode and a.Itemcode=c.ItemCode and c.RMCode=d.itemcode and a.LoadDay=@Loadday group by a.Itemcode,b.description,c.RMCode,d.description,a.lc1,a.lc2,c.Size1,c.Size2,c.Size3,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,
			b.process11,b.process12,b.process13,b.process14,b.process15,b.finishtype,b.surfacepreparation,b.primercolour,b.primerDFT,b.IMOColour,b.IMODFT,b.TopCoatColour,b.TopCoatDFT,b.remarks
				
			print 'Half'
			
			insert into dbo.MRPConsolidatedRMReport(RMCode,RMDescription,Size1,Size2,Size3,tables,ScrapPercent,Qty,SUOM,Table1OrTable2,AddPercent,Total,TotalwithQty,RMS2,RMS3,InMetres,NumberOfSheetsOrLengthRequired,LoadDay,Itemcode)
			select b.RMCode,b.RMDescription,b.Size1,b.Size2,b.Size3,c.tables,d.ScrapPercent,sum(a.FinalQty) 'Qty',
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
				WHEN c.tables=1 THEN (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*sum(a.FinalQty)
				ELSE ((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*sum(a.FinalQty)
			END AS TotalwithQty,c.size2 'RMS2',c.size3 'RMS3',
			CASE
				WHEN c.tables=1 THEN (cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000 
				ELSE cast(c.size3 as DECIMAL(10, 6))/1000
			END AS 'InMetres',
			CASE
				WHEN c.tables=1 THEN ((((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*sum(a.FinalQty))/((cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000)
				ELSE (((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*sum(a.FinalQty))/(cast(c.size3 as DECIMAL(10, 6))/1000)
			END AS NumberOfSheetsOrLengthRequired,@Loadday,a.Itemcode
			from [dbo].[MRPConsolidatedReport] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.Itemcode=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and a.LoadDay=@Loadday
			group by a.Itemcode,b.RMCode,b.RMDescription,b.Size1,b.Size2,b.Size3,c.tables,d.ScrapPercent,c.size2,c.size3
			
			print 'Middle'
				
			;WITH Report AS (
			select b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,			
			((((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*sum(a.FinalQty))/((cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000) 'NumberOfSheetsOrLengthRequired'
			from [dbo].[MRPConsolidatedReport] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.Itemcode=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and c.tables=1 and a.LoadDay=@Loadday
			group by a.Itemcode,b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,b.Size2,b.Size3,d.ScrapPercent)
			insert into dbo.MRPConsolidatedStoreReportTable1(RMCode,RMDescription,size1,size2,size3,tables,NumberOfSheetsRequiredinNumbers, 
			NumberOfSheetsPerNesting,NumberOfSheetsIssued,Remarks,LoadDay)
			select RMCode,RMDescription,size1,size2,size3,tables,sum(NumberOfSheetsOrLengthRequired),null,null,null,@Loadday from Report group by RMCode,RMDescription,size1,size2,size3,tables

			;WITH Report AS (
			select b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,
			(((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*sum(a.FinalQty))/(cast(c.size3 as DECIMAL(10, 6))/1000) 'NumberOfSheetsOrLengthRequired'			
			from [dbo].[MRPConsolidatedReport] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.Itemcode=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and c.tables=2 and a.LoadDay=@Loadday
			group by a.Itemcode,b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,b.Size2,b.Size3,d.ScrapPercent)
			insert into dbo.MRPConsolidatedStoreReportTable2(RMCode,RMDescription,size1,size2,size3,tables,LengthRequiredinMetre,NumberOfSheetsIssued,Remarks,LoadDay)
			select RMCode,RMDescription,size1,size2,size3,tables,sum(NumberOfSheetsOrLengthRequired),null,null,@Loadday from Report group by RMCode,RMDescription,size1,size2,size3,tables

			insert into dbo.MRPConsolidatedBoughtOutReport(Itemcode,description,lc1,lc2,FinalQty,LoadDay) 
			select a.Itemcode,b.description,a.lc1,a.lc2,sum(a.FinalQty),@Loadday from [dbo].[MRPConsolidatedReport] a,[dbo].[ItemMaster] b 
			where a.Itemcode=b.itemcode and a.lc1=9 and a.lc2='B' and a.LoadDay=@Loadday group by a.Itemcode,b.description,a.lc1,a.lc2

		COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
	CLOSE MRP_cursor;
	DEALLOCATE MRP_cursor;
	CLOSE MRPLevel_cursor;
	DEALLOCATE MRPLevel_cursor;
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
		
        DECLARE @Message nvarchar(2048) = ERROR_MESSAGE();
        DECLARE @Severity integer = ERROR_SEVERITY();
        DECLARE @State integer = ERROR_STATE();

        RAISERROR(@Message, @Severity, @State);
        RETURN -1;
  END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPBoughtOutReport]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spSelectMRPBoughtOutReport]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select Itemcode,description,lc1,lc2,FinalQty from dbo.MRPConsolidatedBoughtOutReport where LoadDay=@Loadday
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPComponentList]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spSelectMRPComponentList]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select Itemcode,description,RMCode,RMDescription,lc1,lc2,Size1,Size2,Size3,FinalQty,process1,process2,process3,process4,process5,process6,process7,process8,process9,process10,process11,process12,process13,process14,process15,finishtype,surfacepreparation,primercolour,primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,remarks
	from [IndustriesDB].[dbo].[MRPConsolidatedComponentList] where LoadDay=@Loadday 

END

GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPConsolidatedLoadDayList]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spSelectMRPConsolidatedLoadDayList]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select POItemcode,ITEMDESCRIPTION,PODeliveryQty from [dbo].[MRPConsolidatedLoadDayList]
	where LoadDay=@Loadday
END


GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPConsolidationSummaryReport]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spSelectMRPConsolidationSummaryReport]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select Itemcode,description,lc1,lc2,Qty,FinalQty from [dbo].[MRPConsolidatedSummaryReport] where LoadDay=@Loadday

END


GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPLoaddayList]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spSelectMRPLoaddayList]
@Month AS int,
@Year AS int
AS
BEGIN
	SET NOCOUNT ON;
	select distinct LoadDay from dbo.MRPMaster where MONTH(MRPGeneratedDate)=@Month and YEAR(MRPGeneratedDate)=@Year
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPMaster]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectMRPMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	SELECT CustomerName,CustomerCode,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,PODeliveryQty,MRPGeneratedDate,
	LoadDay,createdby,modifiedby,createddate,updateddate
	FROM [IndustriesDB].[dbo].[MRPMaster]

END


GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPProcessList]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spSelectMRPProcessList]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select Itemcode,description,lc1,lc2,FinalQty,process1,process2,process3,process4,process5,process6,process7,process8,process9,process10,process11,process12,process13,process14,process15 
	from [dbo].[MRPConsolidatedProcessList] where LoadDay=@Loadday

END


GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPRMConsolidationReport]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectMRPRMConsolidationReport]
@Loadday AS varchar(25)
AS
BEGIN		
	select RMCode,RMDescription,Size1,Size2,Size3,tables,ScrapPercent,Qty,SUOM,Table1OrTable2,AddPercent,Total,
	TotalwithQty,RMS2,RMS3,InMetres,NumberOfSheetsOrLengthRequired,Itemcode from [dbo].[MRPConsolidatedRMReport] 
	where LoadDay=@Loadday
END


GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPStoreReportTable1]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectMRPStoreReportTable1]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select RMCode,RMDescription,size1,size2,size3,tables,NumberOfSheetsRequiredinNumbers,NumberOfSheetsPerNesting,NumberOfSheetsIssued,Remarks
	from dbo.MRPConsolidatedStoreReportTable1 where LoadDay=@Loadday

END


GO
/****** Object:  StoredProcedure [dbo].[spSelectMRPStoreReportTable2]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spSelectMRPStoreReportTable2]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select RMCode,RMDescription,size1,size2,size3,tables,LengthRequiredinMetre,NumberOfSheetsIssued,Remarks from dbo.ConsolidatedStoreReportTable2 where LoadDay=@Loadday

END

GO
/****** Object:  StoredProcedure [dbo].[spUpdateMRPMaster]    Script Date: 29-06-2022 11:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spUpdateMRPMaster]
@typMRPMaster AS dbo.typeMRPMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION			
			
			update [dbo].[MRPMaster] set CustomerName=typ.CustomerName,CustomerCode=c.CustomerCode,
			POItemcode=typ.POItemcode,ItemcodeforLoading=typ.ItemcodeforLoading,ITEMDESCRIPTION=i.description,RevisionLevel=i.revisionlevel,PODeliveryQty=typ.PODeliveryQty,
			MRPGeneratedDate=typ.MRPGeneratedDate,LoadDay=typ.LoadDay,modifiedby=typ.modifiedby,updateddate=GETDATE() 
			from @typMRPMaster typ,dbo.CustomerMaster c,dbo.ItemMaster i
			where typ.ItemcodeforLoading=i.itemcode and typ.CustomerName=c.CustomerName 

			select typ.CustomerName,typ.CustomerCode,typ.POItemcode,typ.ItemcodeforLoading,typ.ITEMDESCRIPTION,
			typ.RevisionLevel,typ.PODeliveryQty,typ.MRPGeneratedDate,typ.LoadDay,typ.createdby,typ.modifiedby,
			typ.createddate,typ.updateddate from @typMRPMaster typ 
			where (typ.ItemcodeforLoading not in (select itemcode from [dbo].[ItemMaster] where liveorretired='L')) or (typ.CustomerName not in(select CustomerName from dbo.CustomerMaster))
			
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
