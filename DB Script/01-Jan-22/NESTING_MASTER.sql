USE [IndustriesDB]
GO

/****** Object:  StoredProcedure [dbo].[spInsertNestingMaster]    Script Date: 01-Jan-22 11:31:40 AM ******/
DROP PROCEDURE [dbo].[spInsertNestingMaster]
GO

/****** Object:  StoredProcedure [dbo].[spUpdateNestingMaster]    Script Date: 01-Jan-22 11:32:38 AM ******/
DROP PROCEDURE [dbo].[spUpdateNestingMaster]
GO

/****** Object:  UserDefinedTableType [dbo].[typeNestingMaster]    Script Date: 01-Jan-22 11:33:29 AM ******/
DROP TYPE [dbo].[typeNestingMaster]
GO

/****** Object:  UserDefinedTableType [dbo].[typeNestingMaster]    Script Date: 01-Jan-22 11:33:54 AM ******/
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

/****** Object:  StoredProcedure [dbo].[spInsertNestingMaster]    Script Date: 01-Jan-22 11:34:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spInsertNestingMaster]
@typNestingMaster AS dbo.typeNestingMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[NestingMaster](ItemcodewithNestingnum,PlanningLoadDay,POType,Process1,Process2,Itemcode,
			Itemdescription,RMCode,RMDescription,Qty,BatchOrIndividual,Nestingnumber,FY,LoadDay,S1ofRM,Material,Nestingno,
			NestingQty,ProcessQty,Printflag,StartPosition,EndPosition,createdby,modifiedby,createddate,updateddate) 
			select (typ.Itemcode + (typ.PlanningLoadDay + '-' + typ.Nestingno + '-' + typ.S1ofRM + 'T-' + typ.Material)),
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
			(typ.PlanningLoadDay + '-' + typ.Nestingno + '-' + typ.S1ofRM + 'T-' + typ.Material),LEFT(typ.PlanningLoadDay, 4),
			RIGHT(typ.PlanningLoadDay, 4),(typ.S1ofRM + 'T'),typ.Material,typ.Nestingno,typ.NestingQty,typ.ProcessQty,
			0,
			CASE
				WHEN RIGHT(typ.Nestingno,1) = 1 THEN 1
				WHEN RIGHT(typ.Nestingno,1) != 1 
				THEN (select (StartPosition + (ProcessQty * NestingQty)) from [dbo].[NestingMaster] where PlanningLoadDay=typ.PlanningLoadDay and Itemcode=typ.Itemcode and RIGHT(Nestingno,1) in (select MAX(RIGHT(Nestingno,1)) from [dbo].[NestingMaster] where RIGHT(Nestingno,1)<RIGHT(typ.Nestingno,1) and PlanningLoadDay=typ.PlanningLoadDay and Itemcode=typ.Itemcode))
			END AS StartPosition,
			CASE
				WHEN RIGHT(typ.Nestingno,1) = 1 THEN typ.NestingQty*typ.ProcessQty
				WHEN RIGHT(typ.Nestingno,1) != 1 
				THEN (select EndPosition+(typ.NestingQty*typ.ProcessQty) from [dbo].[NestingMaster] where PlanningLoadDay=typ.PlanningLoadDay and Itemcode=typ.Itemcode and Nestingno in (select MAX(Nestingno) from [dbo].[NestingMaster] where Nestingno<typ.Nestingno and PlanningLoadDay=typ.PlanningLoadDay and Itemcode=typ.Itemcode))
			END AS EndPosition,typ.createdby,typ.modifiedby,GETDATE(),GETDATE()
			from @typNestingMaster typ,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d
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

CREATE PROCEDURE [dbo].[spUpdateNestingMaster]
@typNestingMaster AS dbo.typeNestingMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION			
			
			Insert into [dbo].[NestingMasterHistory](ItemcodewithNestingnum,PlanningLoadDay,POType,Process1,Process2,Itemcode,Itemdescription,RMCode,RMDescription,Qty,
			BatchOrIndividual,Nestingnumber,FY,LoadDay,S1ofRM,Material,Nestingno,NestingQty,ProcessQty,Printflag,StartPosition,EndPosition,createdby,modifiedby,createddate,
			updateddate) 
			select ItemcodewithNestingnum,PlanningLoadDay,POType,Process1,Process2,Itemcode,Itemdescription,RMCode,RMDescription,Qty,
			BatchOrIndividual,Nestingnumber,FY,LoadDay,S1ofRM,Material,Nestingno,NestingQty,ProcessQty,Printflag,StartPosition,EndPosition,createdby,modifiedby,createddate,
			updateddate from [dbo].[NestingMaster] where PlanningLoadDay in (select PlanningLoadDay from @typNestingMaster typ) and Itemcode in (select Itemcode from @typNestingMaster typ)

			delete from [dbo].[NestingMaster] where PlanningLoadDay in (select PlanningLoadDay from @typNestingMaster typ) and Itemcode in (select Itemcode from @typNestingMaster typ)

			insert into [dbo].[NestingMaster](ItemcodewithNestingnum,PlanningLoadDay,POType,Process1,Process2,Itemcode,
			Itemdescription,RMCode,RMDescription,Qty,BatchOrIndividual,Nestingnumber,FY,LoadDay,S1ofRM,Material,Nestingno,
			NestingQty,ProcessQty,Printflag,StartPosition,EndPosition,createdby,modifiedby,createddate,updateddate) 
			select (typ.Itemcode + (typ.PlanningLoadDay + '-' + typ.Nestingno + '-' + typ.S1ofRM + 'T-' + typ.Material)),
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
			(typ.PlanningLoadDay + '-' + typ.Nestingno + '-' + typ.S1ofRM + 'T-' + typ.Material),LEFT(typ.PlanningLoadDay, 4),
			RIGHT(typ.PlanningLoadDay, 4),(typ.S1ofRM + 'T'),typ.Material,typ.Nestingno,typ.NestingQty,typ.ProcessQty,
			typ.Printflag,
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
			from @typNestingMaster typ,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d
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

			--update [dbo].[NestingMaster] set ItemcodewithNestingnum=CONCAT(typ.Itemcode,CONCAT(typ.PlanningLoadDay,'-',typ.Nestingno,'-',typ.S1ofRM,'T-',typ.Material)),
			--PlanningLoadDay=typ.PlanningLoadDay,POType=typ.POType,
			--Process1=CASE
			--	WHEN b.process1='LASERCUTTING' or b.process2='LASERCUTTING' or b.process3='LASERCUTTING' or
			--	b.process4='LASERCUTTING' or b.process5='LASERCUTTING' or b.process6='LASERCUTTING' or b.process7='LASERCUTTING' or 
			--	b.process8='LASERCUTTING' or b.process9='LASERCUTTING' or b.process10='LASERCUTTING' or b.process11='LASERCUTTING' or 
			--	b.process12='LASERCUTTING' or b.process13='LASERCUTTING' or b.process14='LASERCUTTING' or b.process15='LASERCUTTING' or 
			--	b.process1='LASER CUTTING' or b.process2='LASER CUTTING' or b.process3='LASER CUTTING' or b.process4='LASER CUTTING' or 
			--	b.process5='LASER CUTTING' or b.process6='LASER CUTTING' or b.process7='LASER CUTTING' or b.process8='LASER CUTTING' or 
			--	b.process9='LASER CUTTING' or b.process10='LASER CUTTING' or b.process11='LASER CUTTING' or b.process12='LASER CUTTING' or 
			--	b.process13='LASER CUTTING' or b.process14='LASER CUTTING' or b.process15='LASER CUTTING'
			--	THEN 'LASERCUTTING'
			--END,
			--Process2=CASE
			--	WHEN b.process1='TPP' or b.process2='TPP' or b.process3='TPP' or b.process4='TPP' or b.process5='TPP' or 
			--	b.process6='TPP' or b.process7='TPP' or b.process8='TPP' or b.process9='TPP' or b.process10='TPP' or 
			--	b.process11='TPP' or b.process12='TPP' or b.process13='TPP' or b.process14='TPP' or b.process15='TPP' 
			--	THEN 'TPP'
			--END,
			--Itemcode=typ.Itemcode,Itemdescription=b.description,RMCode=c.RMCode,RMDescription=d.description,Qty=a.FinalQty,
			--BatchOrIndividual=typ.BatchOrIndividual,Nestingnumber=CONCAT(typ.PlanningLoadDay,'-',typ.Nestingno,'-',typ.S1ofRM,'T-',typ.Material),
			--FY=LEFT(typ.PlanningLoadDay, 4),LoadDay=RIGHT(typ.PlanningLoadDay, 4),S1ofRM=CONCAT(typ.S1ofRM,'T'),Material=typ.Material,
			--Nestingno=typ.Nestingno,NestingQty=typ.NestingQty,ProcessQty=typ.ProcessQty,createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE()
			--from @typNestingMaster typ,[dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d
			--where a.Itemcode=b.itemcode and a.Itemcode=c.ItemCode and c.RMCode=d.itemcode and a.Itemcode=typ.Itemcode and a.LoadDay=typ.PlanningLoadDay and
			--(b.process1='LASERCUTTING' or b.process2='LASERCUTTING' or b.process3='LASERCUTTING' or
			--b.process4='LASERCUTTING' or b.process5='LASERCUTTING' or b.process6='LASERCUTTING' or b.process7='LASERCUTTING' or 
			--b.process8='LASERCUTTING' or b.process9='LASERCUTTING' or b.process10='LASERCUTTING' or b.process11='LASERCUTTING' or 
			--b.process12='LASERCUTTING' or b.process13='LASERCUTTING' or b.process14='LASERCUTTING' or b.process15='LASERCUTTING' or 
			--b.process1='LASER CUTTING' or b.process2='LASER CUTTING' or b.process3='LASER CUTTING' or b.process4='LASER CUTTING' or 
			--b.process5='LASER CUTTING' or b.process6='LASER CUTTING' or b.process7='LASER CUTTING' or b.process8='LASER CUTTING' or 
			--b.process9='LASER CUTTING' or b.process10='LASER CUTTING' or b.process11='LASER CUTTING' or b.process12='LASER CUTTING' or 
			--b.process13='LASER CUTTING' or b.process14='LASER CUTTING' or b.process15='LASER CUTTING' or
			--b.process1='TPP' or b.process2='TPP' or b.process3='TPP' or b.process4='TPP' or b.process5='TPP' or 
			--b.process6='TPP' or b.process7='TPP' or b.process8='TPP' or b.process9='TPP' or b.process10='TPP' or 
			--b.process11='TPP' or b.process12='TPP' or b.process13='TPP' or b.process14='TPP' or b.process15='TPP')

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