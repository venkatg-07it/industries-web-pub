USE [IndustriesDB]
GO
/****** Object:  UserDefinedTableType [dbo].[typeCTQMaster]    Script Date: 15-02-2022 15:28:01 ******/
CREATE TYPE [dbo].[typeCTQMaster] AS TABLE(
	[Customername] [varchar](100) NULL,
	[Itemcode] [varchar](100) NULL,
	[Description] [varchar](150) NULL,
	[Revision] [varchar](50) NULL,
	[DrawingNum] [varchar](100) NULL,
	[Liveorretired] [varchar](1) NULL,
	[Process1] [varchar](30) NULL,
	[Dim1] [varchar](30) NULL,
	[Min1] [varchar](30) NULL,
	[Max1] [varchar](30) NULL,
	[Process2] [varchar](30) NULL,
	[Dim2] [varchar](30) NULL,
	[Min2] [varchar](30) NULL,
	[Max2] [varchar](30) NULL,
	[Process3] [varchar](30) NULL,
	[Dim3] [varchar](30) NULL,
	[Min3] [varchar](30) NULL,
	[Max3] [varchar](30) NULL,
	[Process4] [varchar](30) NULL,
	[Dim4] [varchar](30) NULL,
	[Min4] [varchar](30) NULL,
	[Max4] [varchar](30) NULL,
	[Process5] [varchar](30) NULL,
	[Dim5] [varchar](30) NULL,
	[Min5] [varchar](30) NULL,
	[Max5] [varchar](30) NULL,
	[Process6] [varchar](30) NULL,
	[Dim6] [varchar](30) NULL,
	[Min6] [varchar](30) NULL,
	[Max6] [varchar](30) NULL,
	[Process7] [varchar](30) NULL,
	[Dim7] [varchar](30) NULL,
	[Min7] [varchar](30) NULL,
	[Max7] [varchar](30) NULL,
	[Process8] [varchar](30) NULL,
	[Dim8] [varchar](30) NULL,
	[Min8] [varchar](30) NULL,
	[Max8] [varchar](30) NULL,
	[Process9] [varchar](30) NULL,
	[Dim9] [varchar](30) NULL,
	[Min9] [varchar](30) NULL,
	[Max9] [varchar](30) NULL,
	[Process10] [varchar](30) NULL,
	[Dim10] [varchar](30) NULL,
	[Min10] [varchar](30) NULL,
	[Max10] [varchar](30) NULL,
	[Process11] [varchar](30) NULL,
	[Dim11] [varchar](30) NULL,
	[Min11] [varchar](30) NULL,
	[Max11] [varchar](30) NULL,
	[Process12] [varchar](30) NULL,
	[Dim12] [varchar](30) NULL,
	[Min12] [varchar](30) NULL,
	[Max12] [varchar](30) NULL,
	[Process13] [varchar](30) NULL,
	[Dim13] [varchar](30) NULL,
	[Min13] [varchar](30) NULL,
	[Max13] [varchar](30) NULL,
	[Process14] [varchar](30) NULL,
	[Dim14] [varchar](30) NULL,
	[Min14] [varchar](30) NULL,
	[Max14] [varchar](30) NULL,
	[Process15] [varchar](30) NULL,
	[Dim15] [varchar](30) NULL,
	[Min15] [varchar](30) NULL,
	[Max15] [varchar](30) NULL,
	[Drawingprojection] [varchar](25) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[typeIndividualBatch]    Script Date: 15-02-2022 15:28:02 ******/
CREATE TYPE [dbo].[typeIndividualBatch] AS TABLE(
	[Partnumber] [varchar](100) NULL,
	[IorB] [varchar](5) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[CTQMaster]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTQMaster](
	[Customername] [varchar](100) NULL,
	[Itemcode] [varchar](100) NOT NULL,
	[Description] [varchar](150) NULL,
	[Revision] [varchar](50) NULL,
	[DrawingNum] [varchar](100) NULL,
	[Liveorretired] [varchar](1) NULL,
	[Process1] [varchar](30) NULL,
	[Dim1] [varchar](30) NULL,
	[Min1] [varchar](30) NULL,
	[Max1] [varchar](30) NULL,
	[Process2] [varchar](30) NULL,
	[Dim2] [varchar](30) NULL,
	[Min2] [varchar](30) NULL,
	[Max2] [varchar](30) NULL,
	[Process3] [varchar](30) NULL,
	[Dim3] [varchar](30) NULL,
	[Min3] [varchar](30) NULL,
	[Max3] [varchar](30) NULL,
	[Process4] [varchar](30) NULL,
	[Dim4] [varchar](30) NULL,
	[Min4] [varchar](30) NULL,
	[Max4] [varchar](30) NULL,
	[Process5] [varchar](30) NULL,
	[Dim5] [varchar](30) NULL,
	[Min5] [varchar](30) NULL,
	[Max5] [varchar](30) NULL,
	[Process6] [varchar](30) NULL,
	[Dim6] [varchar](30) NULL,
	[Min6] [varchar](30) NULL,
	[Max6] [varchar](30) NULL,
	[Process7] [varchar](30) NULL,
	[Dim7] [varchar](30) NULL,
	[Min7] [varchar](30) NULL,
	[Max7] [varchar](30) NULL,
	[Process8] [varchar](30) NULL,
	[Dim8] [varchar](30) NULL,
	[Min8] [varchar](30) NULL,
	[Max8] [varchar](30) NULL,
	[Process9] [varchar](30) NULL,
	[Dim9] [varchar](30) NULL,
	[Min9] [varchar](30) NULL,
	[Max9] [varchar](30) NULL,
	[Process10] [varchar](30) NULL,
	[Dim10] [varchar](30) NULL,
	[Min10] [varchar](30) NULL,
	[Max10] [varchar](30) NULL,
	[Process11] [varchar](30) NULL,
	[Dim11] [varchar](30) NULL,
	[Min11] [varchar](30) NULL,
	[Max11] [varchar](30) NULL,
	[Process12] [varchar](30) NULL,
	[Dim12] [varchar](30) NULL,
	[Min12] [varchar](30) NULL,
	[Max12] [varchar](30) NULL,
	[Process13] [varchar](30) NULL,
	[Dim13] [varchar](30) NULL,
	[Min13] [varchar](30) NULL,
	[Max13] [varchar](30) NULL,
	[Process14] [varchar](30) NULL,
	[Dim14] [varchar](30) NULL,
	[Min14] [varchar](30) NULL,
	[Max14] [varchar](30) NULL,
	[Process15] [varchar](30) NULL,
	[Dim15] [varchar](30) NULL,
	[Min15] [varchar](30) NULL,
	[Max15] [varchar](30) NULL,
	[Drawingprojection] [varchar](25) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Itemcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTQMasterHistory]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTQMasterHistory](
	[CTQMasterIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Customername] [varchar](100) NULL,
	[Itemcode] [varchar](100) NULL,
	[Description] [varchar](150) NULL,
	[Revision] [varchar](50) NULL,
	[DrawingNum] [varchar](100) NULL,
	[Liveorretired] [varchar](1) NULL,
	[Process1] [varchar](30) NULL,
	[Dim1] [varchar](30) NULL,
	[Min1] [varchar](30) NULL,
	[Max1] [varchar](30) NULL,
	[Process2] [varchar](30) NULL,
	[Dim2] [varchar](30) NULL,
	[Min2] [varchar](30) NULL,
	[Max2] [varchar](30) NULL,
	[Process3] [varchar](30) NULL,
	[Dim3] [varchar](30) NULL,
	[Min3] [varchar](30) NULL,
	[Max3] [varchar](30) NULL,
	[Process4] [varchar](30) NULL,
	[Dim4] [varchar](30) NULL,
	[Min4] [varchar](30) NULL,
	[Max4] [varchar](30) NULL,
	[Process5] [varchar](30) NULL,
	[Dim5] [varchar](30) NULL,
	[Min5] [varchar](30) NULL,
	[Max5] [varchar](30) NULL,
	[Process6] [varchar](30) NULL,
	[Dim6] [varchar](30) NULL,
	[Min6] [varchar](30) NULL,
	[Max6] [varchar](30) NULL,
	[Process7] [varchar](30) NULL,
	[Dim7] [varchar](30) NULL,
	[Min7] [varchar](30) NULL,
	[Max7] [varchar](30) NULL,
	[Process8] [varchar](30) NULL,
	[Dim8] [varchar](30) NULL,
	[Min8] [varchar](30) NULL,
	[Max8] [varchar](30) NULL,
	[Process9] [varchar](30) NULL,
	[Dim9] [varchar](30) NULL,
	[Min9] [varchar](30) NULL,
	[Max9] [varchar](30) NULL,
	[Process10] [varchar](30) NULL,
	[Dim10] [varchar](30) NULL,
	[Min10] [varchar](30) NULL,
	[Max10] [varchar](30) NULL,
	[Process11] [varchar](30) NULL,
	[Dim11] [varchar](30) NULL,
	[Min11] [varchar](30) NULL,
	[Max11] [varchar](30) NULL,
	[Process12] [varchar](30) NULL,
	[Dim12] [varchar](30) NULL,
	[Min12] [varchar](30) NULL,
	[Max12] [varchar](30) NULL,
	[Process13] [varchar](30) NULL,
	[Dim13] [varchar](30) NULL,
	[Min13] [varchar](30) NULL,
	[Max13] [varchar](30) NULL,
	[Process14] [varchar](30) NULL,
	[Dim14] [varchar](30) NULL,
	[Min14] [varchar](30) NULL,
	[Max14] [varchar](30) NULL,
	[Process15] [varchar](30) NULL,
	[Dim15] [varchar](30) NULL,
	[Min15] [varchar](30) NULL,
	[Max15] [varchar](30) NULL,
	[Drawingprojection] [varchar](25) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CTQMasterIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndividualBatch]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IndividualBatch](
	[Partnumber] [varchar](100) NOT NULL,
	[IorB] [varchar](5) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Partnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndividualBatchHistory]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IndividualBatchHistory](
	[IndividualBatchIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Partnumber] [varchar](100) NULL,
	[IorB] [varchar](5) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IndividualBatchIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCTQMaster]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spDeleteCTQMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[CTQMaster]
	delete from [dbo].[CTQMasterHistory]
END

GO
/****** Object:  StoredProcedure [dbo].[spDeleteIndividualBatch]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spDeleteIndividualBatch]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[IndividualBatch]  
	delete from [dbo].[IndividualBatchHistory]  
END

GO
/****** Object:  StoredProcedure [dbo].[spInsertCTQMaster]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertCTQMaster]
@typCTQMaster AS dbo.typeCTQMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[CTQMaster](Customername,Itemcode,Description,Revision,DrawingNum,Liveorretired,Process1,Dim1,Min1,Max1,Process2,Dim2,Min2,Max2,
			Process3,Dim3,Min3,Max3,Process4,Dim4,Min4,Max4,Process5,Dim5,Min5,Max5,Process6,Dim6,Min6,Max6,Process7,Dim7,Min7,Max7,
			Process8,Dim8,Min8,Max8,Process9,Dim9,Min9,Max9,Process10,Dim10,Min10,Max10,Process11,Dim11,Min11,Max11,
			Process12,Dim12,Min12,Max12,Process13,Dim13,Min13,Max13,Process14,Dim14,Min14,Max14,Process15,Dim15,Min15,Max15,
			Drawingprojection,Remarks,createdby,modifiedby,createddate,updateddate) 
			select Customername,Itemcode,Description,Revision,DrawingNum,Liveorretired,Process1,Dim1,Min1,Max1,Process2,Dim2,Min2,Max2,
			Process3,Dim3,Min3,Max3,Process4,Dim4,Min4,Max4,Process5,Dim5,Min5,Max5,Process6,Dim6,Min6,Max6,Process7,Dim7,Min7,Max7,
			Process8,Dim8,Min8,Max8,Process9,Dim9,Min9,Max9,Process10,Dim10,Min10,Max10,Process11,Dim11,Min11,Max11,
			Process12,Dim12,Min12,Max12,Process13,Dim13,Min13,Max13,Process14,Dim14,Min14,Max14,Process15,Dim15,Min15,Max15,
			Drawingprojection,Remarks,createdby,modifiedby,GETDATE(),GETDATE() 
			from @typCTQMaster typ where typ.Itemcode in (select itemcode from [dbo].[ItemMaster] where liveorretired='L') and typ.Customername in (select CustomerName from [dbo].[CustomerMaster])

			SELECT Customername,Itemcode,Description,Revision,DrawingNum,Liveorretired,Process1,Dim1,Min1,Max1,Process2,Dim2,Min2,Max2,
			Process3,Dim3,Min3,Max3,Process4,Dim4,Min4,Max4,Process5,Dim5,Min5,Max5,Process6,Dim6,Min6,Max6,Process7,Dim7,Min7,Max7,
			Process8,Dim8,Min8,Max8,Process9,Dim9,Min9,Max9,Process10,Dim10,Min10,Max10,Process11,Dim11,Min11,Max11,
			Process12,Dim12,Min12,Max12,Process13,Dim13,Min13,Max13,Process14,Dim14,Min14,Max14,Process15,Dim15,Min15,Max15,
			Drawingprojection,Remarks,createdby,modifiedby,createddate,updateddate 
			from @typCTQMaster typ where typ.Itemcode not in (select itemcode from [dbo].[ItemMaster] where liveorretired='L') or typ.Customername not in (select CustomerName from [dbo].[CustomerMaster])
		
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
/****** Object:  StoredProcedure [dbo].[spInsertIndividualBatch]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertIndividualBatch]
@typIndividualBatch AS dbo.typeIndividualBatch READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[IndividualBatch] (Partnumber,IorB,createdby,modifiedby,createddate,updateddate) 
			select Partnumber,IorB,createdby,modifiedby,GETDATE(),GETDATE() from @typIndividualBatch typ 
			where typ.Partnumber in (select itemcode from [dbo].[ItemMaster] where liveorretired='L')

			select Partnumber,IorB,createdby,modifiedby,createddate,updateddate from @typIndividualBatch typ 
			where typ.Partnumber not in (select itemcode from [dbo].[ItemMaster] where liveorretired='L')
		
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
/****** Object:  StoredProcedure [dbo].[spSelectCTQMaster]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spSelectCTQMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	select Customername,Itemcode,Description,Revision,DrawingNum,Liveorretired,Process1,Dim1,Min1,Max1,Process2,Dim2,Min2,Max2,
Process3,Dim3,Min3,Max3,Process4,Dim4,Min4,Max4,Process5,Dim5,Min5,Max5,Process6,Dim6,Min6,Max6,Process7,Dim7,Min7,Max7,
Process8,Dim8,Min8,Max8,Process9,Dim9,Min9,Max9,Process10,Dim10,Min10,Max10,Process11,Dim11,Min11,Max11,
Process12,Dim12,Min12,Max12,Process13,Dim13,Min13,Max13,Process14,Dim14,Min14,Max14,Process15,Dim15,Min15,Max15,
Drawingprojection,Remarks,createdby,modifiedby,createddate,updateddate 
from [IndustriesDB].[dbo].[CTQMaster]
	
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectIndividualBatch]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spSelectIndividualBatch]
AS
BEGIN	
	SET NOCOUNT ON;	

	SELECT Partnumber,IorB,createdby,modifiedby,createddate,updateddate FROM [IndustriesDB].[dbo].[IndividualBatch]

END


GO
/****** Object:  StoredProcedure [dbo].[spSelectNestingItemcodeList]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spSelectNestingItemcodeList]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select distinct Itemcode,FinalQty 'Qty' from [dbo].[ConsolidatedProcessList] where LoadDay=@Loadday and (lc1=1 or lc1=2)

END

GO
/****** Object:  StoredProcedure [dbo].[spSelectNestingRePrintDetails]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectNestingRePrintDetails]
@Loadday AS varchar(25),
@Itemcode AS varchar(100),
@Printnum AS int
AS
BEGIN	
	SET NOCOUNT ON;	
	
	IF EXISTS (select * from [dbo].[NestingMaster] where PlanningLoadDay=@Loadday and Itemcode=@Itemcode)
	BEGIN
		select a.PlanningLoadDay,a.Itemcode,a.Itemdescription,a.Qty,a.BatchOrIndividual,a.NestingQty,a.ProcessQty,a.Printflag,@Printnum 'StartPosition',@Printnum 'EndPosition',a.Nestingno,b.customername,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15 from [dbo].[NestingMaster] a,[dbo].[ItemMaster] b 
		where a.PlanningLoadDay=@Loadday and a.Itemcode=@Itemcode and a.Nestingnumber=(select top 1 Nestingnumber from [dbo].[NestingMaster] where StartPosition<=@Printnum and EndPosition>=@Printnum and PlanningLoadDay=@Loadday and Itemcode=@Itemcode) and a.Itemcode=b.itemcode
	END 
	ELSE
	BEGIN
		select a.LoadDay,a.Itemcode,a.description 'Itemdescription',a.FinalQty 'Qty',c.IorB 'BatchOrIndividual',0 'NestingQty',0 'ProcessQty',null 'Printflag',@Printnum 'StartPosition',@Printnum 'EndPosition',null 'Nestingno',b.customername,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15 from [dbo].[ConsolidatedProcessList] a,[dbo].[ItemMaster] b,[dbo].[IndividualBatch] c
		where a.LoadDay=@Loadday and a.Itemcode=@Itemcode and a.Itemcode=b.itemcode and a.Itemcode=c.Partnumber
	END 	
END


GO
/****** Object:  StoredProcedure [dbo].[spSelectOtherthanLaserList]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectOtherthanLaserList]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select a.LoadDay,a.Itemcode,b.description 'Itemdescription',a.FinalQty 'Qty',c.IorB 'BatchOrIndividual',b.customername,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15
	from [dbo].[ConsolidatedProcessList] a,[dbo].[ItemMaster] b,[dbo].[IndividualBatch] c
	where a.LoadDay=@Loadday and a.Itemcode=b.itemcode and (b.lc1=1 or b.lc1=2) and a.Itemcode=c.Partnumber and
	b.process1!='LASERCUTTING' and b.process2!='LASERCUTTING' and b.process3!='LASERCUTTING' and
	b.process4!='LASERCUTTING' and b.process5!='LASERCUTTING' and b.process6!='LASERCUTTING' and b.process7!='LASERCUTTING' and 
	b.process8!='LASERCUTTING' and b.process9!='LASERCUTTING' and b.process10!='LASERCUTTING' and b.process11!='LASERCUTTING' and 
	b.process12!='LASERCUTTING' and b.process13!='LASERCUTTING' and b.process14!='LASERCUTTING' and b.process15!='LASERCUTTING' and 
	b.process1!='LASER CUTTING' and b.process2!='LASER CUTTING' and b.process3!='LASER CUTTING' and b.process4!='LASER CUTTING' and 
	b.process5!='LASER CUTTING' and b.process6!='LASER CUTTING' and b.process7!='LASER CUTTING' and b.process8!='LASER CUTTING' and 
	b.process9!='LASER CUTTING' and b.process10!='LASER CUTTING' and b.process11!='LASER CUTTING' and b.process12!='LASER CUTTING' and 
	b.process13!='LASER CUTTING' and b.process14!='LASER CUTTING' and b.process15!='LASER CUTTING' and
	b.process1!='TPP' and b.process2!='TPP' and b.process3!='TPP' and b.process4!='TPP' and b.process5!='TPP' and 
	b.process6!='TPP' and b.process7!='TPP' and b.process8!='TPP' and b.process9!='TPP' and b.process10!='TPP' and 
	b.process11!='TPP' and b.process12!='TPP' and b.process13!='TPP' and b.process14!='TPP' and b.process15!='TPP'

END

GO
/****** Object:  StoredProcedure [dbo].[spUpdateCTQMaster]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateCTQMaster]
@typCTQMaster AS dbo.typeCTQMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			Insert into [dbo].[CTQMasterHistory](Customername,Itemcode,Description,Revision,DrawingNum,Liveorretired,Process1,Dim1,Min1,Max1,Process2,Dim2,Min2,Max2,
			Process3,Dim3,Min3,Max3,Process4,Dim4,Min4,Max4,Process5,Dim5,Min5,Max5,Process6,Dim6,Min6,Max6,Process7,Dim7,Min7,Max7,
			Process8,Dim8,Min8,Max8,Process9,Dim9,Min9,Max9,Process10,Dim10,Min10,Max10,Process11,Dim11,Min11,Max11,
			Process12,Dim12,Min12,Max12,Process13,Dim13,Min13,Max13,Process14,Dim14,Min14,Max14,Process15,Dim15,Min15,Max15,
			Drawingprojection,Remarks,createdby,modifiedby,createddate,updateddate) 
			select Customername,Itemcode,Description,Revision,DrawingNum,Liveorretired,Process1,Dim1,Min1,Max1,Process2,Dim2,Min2,Max2,
			Process3,Dim3,Min3,Max3,Process4,Dim4,Min4,Max4,Process5,Dim5,Min5,Max5,Process6,Dim6,Min6,Max6,Process7,Dim7,Min7,Max7,
			Process8,Dim8,Min8,Max8,Process9,Dim9,Min9,Max9,Process10,Dim10,Min10,Max10,Process11,Dim11,Min11,Max11,
			Process12,Dim12,Min12,Max12,Process13,Dim13,Min13,Max13,Process14,Dim14,Min14,Max14,Process15,Dim15,Min15,Max15,
			Drawingprojection,Remarks,createdby,modifiedby,createddate,updateddate from [dbo].[CTQMaster]
			where ItemCode in (select Itemcode from @typCTQMaster typ where typ.Itemcode in (select itemcode from [dbo].[ItemMaster] where liveorretired='L') and typ.Customername in (select CustomerName from [dbo].[CustomerMaster]))

			update [dbo].[CTQMaster] set Customername=typ.Customername,Itemcode=typ.Itemcode,Description=typ.Description,Revision=typ.Revision,DrawingNum=typ.DrawingNum,Liveorretired=typ.Liveorretired,Process1=typ.Process1,Dim1=typ.Dim1,Min1=typ.Min1,Max1=typ.Max1,Process2=typ.Process2,Dim2=typ.Dim2,Min2=typ.Min2,Max2=typ.Max2,
			Process3=typ.Process3,Dim3=typ.Dim3,Min3=typ.Min3,Max3=typ.Max3,Process4=typ.Process4,Dim4=typ.Dim4,Min4=typ.Min4,Max4=typ.Max4,Process5=typ.Process5,Dim5=typ.Dim5,Min5=typ.Min5,Max5=typ.Max5,Process6=typ.Process6,Dim6=typ.Dim6,Min6=typ.Min6,Max6=typ.Max6,Process7=typ.Process7,Dim7=typ.Dim7,Min7=typ.Min7,Max7=typ.Max7,
			Process8=typ.Process8,Dim8=typ.Dim8,Min8=typ.Min8,Max8=typ.Max8,Process9=typ.Process9,Dim9=typ.Dim9,Min9=typ.Min9,Max9=typ.Max9,Process10=typ.Process10,Dim10=typ.Dim10,Min10=typ.Min10,Max10=typ.Max10,Process11=typ.Process11,Dim11=typ.Dim11,Min11=typ.Min11,Max11=typ.Max11,
			Process12=typ.Process12,Dim12=typ.Dim12,Min12=typ.Min12,Max12=typ.Max12,Process13=typ.Process13,Dim13=typ.Dim13,Min13=typ.Min13,Max13=typ.Max13,Process14=typ.Process14,Dim14=typ.Dim14,Min14=typ.Min14,Max14=typ.Max14,Process15=typ.Process15,Dim15=typ.Dim15,Min15=typ.Min15,Max15=typ.Max15,
			Drawingprojection=typ.Drawingprojection,Remarks=typ.Remarks,createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE()
			from @typCTQMaster typ where [dbo].[CTQMaster].Itemcode=typ.Itemcode and typ.Itemcode in (select itemcode from [dbo].[ItemMaster] where liveorretired='L')
			and typ.Customername in (select CustomerName from [dbo].[CustomerMaster])

			SELECT Customername,Itemcode,Description,Revision,DrawingNum,Liveorretired,Process1,Dim1,Min1,Max1,Process2,Dim2,Min2,Max2,
			Process3,Dim3,Min3,Max3,Process4,Dim4,Min4,Max4,Process5,Dim5,Min5,Max5,Process6,Dim6,Min6,Max6,Process7,Dim7,Min7,Max7,
			Process8,Dim8,Min8,Max8,Process9,Dim9,Min9,Max9,Process10,Dim10,Min10,Max10,Process11,Dim11,Min11,Max11,
			Process12,Dim12,Min12,Max12,Process13,Dim13,Min13,Max13,Process14,Dim14,Min14,Max14,Process15,Dim15,Min15,Max15,
			Drawingprojection,Remarks,createdby,modifiedby,createddate,updateddate 
			from @typCTQMaster typ where typ.Itemcode not in (select itemcode from [dbo].[ItemMaster] where liveorretired='L') or typ.Customername not in (select CustomerName from [dbo].[CustomerMaster])

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
/****** Object:  StoredProcedure [dbo].[spUpdateIndividualBatch]    Script Date: 15-02-2022 15:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateIndividualBatch]
@typIndividualBatch AS dbo.typeIndividualBatch READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			insert into [dbo].[IndividualBatchHistory] (Partnumber,IorB,createdby,modifiedby,createddate,updateddate) 
			select Partnumber,IorB,createdby,modifiedby,createddate,updateddate from IndividualBatch 
			where Partnumber in (select Partnumber from @typIndividualBatch where Partnumber in (select itemcode from [dbo].[ItemMaster] where liveorretired='L')) 
			
			update [dbo].[IndividualBatch] set Partnumber=typ.Partnumber,IorB=typ.IorB,createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE() 
			from @typIndividualBatch typ where [dbo].[IndividualBatch].Partnumber=typ.Partnumber

			select Partnumber,IorB,createdby,modifiedby,createddate,updateddate from @typIndividualBatch typ 
			where typ.Partnumber not in (select Partnumber from [dbo].[IndividualBatch]) or typ.Partnumber not in (select itemcode from [dbo].[ItemMaster] where liveorretired='L')

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
