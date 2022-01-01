USE [IndustriesDB]
GO

/****** Object:  StoredProcedure [dbo].[spConsolidateReport]    Script Date: 01-Jan-22 11:06:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[spConsolidateReport]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			create table LevelTableOrg(Itemcode varchar(75))
			create table LevelTableDup(Itemcode varchar(75))		
			DECLARE @PONumber varchar(75),@AssemblyNumber varchar(75),@POitemcode varchar(75),@POqty int,@lc1 int,@lc2 varchar(1),@level int,@POLevelitemcode varchar(75),@POLevelqty int,@Levellc1 int,@Levellc2 varchar(1),@Parentitemcode varchar(75),@Count int,@AssemplyQty int;
			DECLARE PO_cursor CURSOR FOR SELECT ItemcodeforLoading,PODeliveryQty,PONumber FROM dbo.POMaster where PlanningLoadDay=@Loadday;			
			OPEN PO_cursor
			FETCH NEXT FROM PO_cursor INTO @POitemcode,@POqty,@PONumber

			WHILE @@FETCH_STATUS = 0
			BEGIN
				set @level=0	
				SELECT @lc1 = (select lc1 from [dbo].[ItemMaster] where itemcode=@POitemcode) 
				SELECT @lc2 = (select lc2 from [dbo].[ItemMaster] where itemcode=@POitemcode)

				insert into dbo.ConsolidatedReport(Itemcode,Qty,lc1,lc2,level,PrevRoot,Root,FinalQty,PONumber,LoadDay) values (@POitemcode,@POqty,@lc1,@lc2,@level,null,null,@POqty,@PONumber,@Loadday)
				
				delete from LevelTableOrg
				insert into LevelTableOrg values(@POitemcode)
				set @Count=1

				IF @lc1 = 2 and @lc2='F'
				BEGIN
					WHILE ( @Count > 0)
					BEGIN										
						DECLARE POLevel_cursor CURSOR FOR select a.Itemcode,a.Qty,a.AssemblyNumber from dbo.AssemblyMaster a,LevelTableOrg b where a.AssemblyNumber=b.Itemcode
						OPEN POLevel_cursor
						FETCH NEXT FROM POLevel_cursor INTO @POLevelitemcode,@POLevelqty,@AssemblyNumber						
						
						set @level=@level+1						

						WHILE @@FETCH_STATUS = 0
						BEGIN
							--print '@AssemblyNumber:' + CAST(@AssemblyNumber as varchar(100))
							--print '@PONumber:' + CAST(@PONumber as varchar(100))
							--print '-----------------------------------------------'
							Set	@Parentitemcode=@AssemblyNumber
							SELECT @AssemplyQty=(select top 1 FinalQty from dbo.ConsolidatedReport where Itemcode=@AssemblyNumber and PONumber=@PONumber)
							SELECT @Levellc1 = (select lc1 from [dbo].[ItemMaster] where itemcode=@POLevelitemcode) 
							SELECT @Levellc2 = (select lc2 from [dbo].[ItemMaster] where itemcode=@POLevelitemcode)

							insert into dbo.ConsolidatedReport(Itemcode,Qty,lc1,lc2,level,PrevRoot,Root,FinalQty,PONumber,LoadDay) values (@POLevelitemcode,@POLevelqty,@Levellc1,@Levellc2,@level,@Parentitemcode,@POitemcode,@AssemplyQty*@POLevelqty,@PONumber,@Loadday)

							IF @Levellc1 = 2 and @Levellc2='F'
							BEGIN
								insert into LevelTableDup values(@POLevelitemcode)
							END

							FETCH NEXT FROM POLevel_cursor INTO @POLevelitemcode,@POLevelqty,@AssemblyNumber
						END

						delete from LevelTableOrg
						SELECT @Count=(select count(Itemcode) from LevelTableDup)
						--print 'Count:' + CAST(@Count as varchar(10))
						insert into LevelTableOrg select * from LevelTableDup
						delete from LevelTableDup

						CLOSE POLevel_cursor;
						DEALLOCATE POLevel_cursor;
					END --whille
				END --if				

				FETCH NEXT FROM PO_cursor INTO @POitemcode,@POqty,@PONumber
			END
			CLOSE PO_cursor;
			DEALLOCATE PO_cursor;
			drop table LevelTableOrg
			drop table LevelTableDup

			insert into dbo.ConsolidatedLoadDayList(PODeliveryDate,POItemcode,ITEMDESCRIPTION,PODeliveryQty,PONumber,LoadDay)
			select a.PODeliveryDate,a.POItemcode,a.ITEMDESCRIPTION,a.PODeliveryQty,a.PONumber,@Loadday from [dbo].[POMaster] a,[dbo].[ConsolidatedReport] b
			where a.PONumber=b.PONumber and a.ItemcodeforLoading=b.Itemcode and a.PlanningLoadDay=b.LoadDay and b.LoadDay=@Loadday

			insert into dbo.ConsolidatedSummaryReport(Itemcode,description,lc1,lc2,Qty,FinalQty,LoadDay)
			select a.Itemcode,b.description,a.lc1,a.lc2,a.Qty,a.FinalQty,@Loadday from [dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b 
			where a.Itemcode=b.itemcode and a.LoadDay=@Loadday

			insert into dbo.ConsolidatedProcessList(Itemcode,description,lc1,lc2,FinalQty,process1,process2,process3,process4,process5,
			process6,process7,process8,process9,process10,process11,process12,process13,process14,process15,LoadDay)
			select a.Itemcode,b.description,a.lc1,a.lc2,sum(a.FinalQty),b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15,@Loadday
			from [dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b where a.Itemcode=b.itemcode and a.LoadDay=@Loadday group by a.Itemcode,b.description,a.lc1,a.lc2,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15

			insert into dbo.ConsolidatedComponentList(Itemcode,description,RMCode,RMDescription,lc1,lc2,c.Size1,c.Size2,c.Size3,FinalQty,process1,process2,process3,process4,process5,process6,process7,process8,process9,process10,process11,process12,process13,process14,process15,finishtype,surfacepreparation,primercolour,primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,remarks,LoadDay)
			select a.Itemcode,b.description,c.RMCode,d.description,a.lc1,a.lc2,c.Size1,c.Size2,c.Size3,sum(a.FinalQty),b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15,b.finishtype,b.surfacepreparation,b.primercolour,b.primerDFT,b.IMOColour,b.IMODFT,b.TopCoatColour,b.TopCoatDFT,b.remarks,@Loadday
			from [dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d where a.Itemcode=b.itemcode and a.Itemcode=c.ItemCode and c.RMCode=d.itemcode and a.LoadDay=@Loadday group by a.Itemcode,b.description,c.RMCode,d.description,a.lc1,a.lc2,c.Size1,c.Size2,c.Size3,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,
			b.process11,b.process12,b.process13,b.process14,b.process15,b.finishtype,b.surfacepreparation,b.primercolour,b.primerDFT,b.IMOColour,b.IMODFT,b.TopCoatColour,b.TopCoatDFT,b.remarks
			
			insert into dbo.ConsolidatedRMReport(RMCode,RMDescription,Size1,Size2,Size3,tables,ScrapPercent,Qty,SUOM,Table1OrTable2,AddPercent,Total,TotalwithQty,RMS2,RMS3,InMetres,NumberOfSheetsOrLengthRequired,LoadDay)
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
			END AS NumberOfSheetsOrLengthRequired,@Loadday
			from [dbo].[ConsolidatedReport] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.Itemcode=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and a.LoadDay=@Loadday
			group by a.Itemcode,b.RMCode,b.RMDescription,b.Size1,b.Size2,b.Size3,c.tables,d.ScrapPercent,c.size2,c.size3
			
			;WITH Report AS (
			select b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,			
			((((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*sum(a.FinalQty))/((cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000) 'NumberOfSheetsOrLengthRequired'
			from [dbo].[ConsolidatedReport] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.Itemcode=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and c.tables=1 and a.LoadDay=@Loadday
			group by a.Itemcode,b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,b.Size2,b.Size3,d.ScrapPercent)
			insert into dbo.ConsolidatedStoreReportTable1(RMCode,RMDescription,size1,size2,size3,tables,NumberOfSheetsRequiredinNumbers, 
			NumberOfSheetsPerNesting,NumberOfSheetsIssued,Remarks,LoadDay)
			select RMCode,RMDescription,size1,size2,size3,tables,sum(NumberOfSheetsOrLengthRequired),null,null,null,@Loadday from Report group by RMCode,RMDescription,size1,size2,size3,tables

			;WITH Report AS (
			select b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,
			(((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*sum(a.FinalQty))/(cast(c.size3 as DECIMAL(10, 6))/1000) 'NumberOfSheetsOrLengthRequired'			
			from [dbo].[ConsolidatedReport] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.Itemcode=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and c.tables=2 and a.LoadDay=@Loadday
			group by a.Itemcode,b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,b.Size2,b.Size3,d.ScrapPercent)
			insert into dbo.ConsolidatedStoreReportTable2(RMCode,RMDescription,size1,size2,size3,tables,LengthRequiredinMetre,NumberOfSheetsIssued,Remarks,LoadDay)
			select RMCode,RMDescription,size1,size2,size3,tables,sum(NumberOfSheetsOrLengthRequired),null,null,@Loadday from Report group by RMCode,RMDescription,size1,size2,size3,tables

			insert into dbo.ConsolidatedBoughtOutReport(Itemcode,description,lc1,lc2,FinalQty,LoadDay) 
			select a.Itemcode,b.description,a.lc1,a.lc2,sum(a.FinalQty),@Loadday from [dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b 
			where a.Itemcode=b.itemcode and a.lc1=9 and a.lc2='B' and a.LoadDay=@Loadday group by a.Itemcode,b.description,a.lc1,a.lc2

			insert into dbo.ConsolidatedDummyPOAdjust(Itemcode,Itemdescription,RMCode,RMDescription,lc1,lc2,Size1,Size2,
			Size3,TotalQty,DummyPOQty,BalanceDummyPOQty,process1,process2,process3,process4,process5,process6,process7,
			process8,process9,process10,process11,process12,process13,process14,process15,finishtype,surfacepreparation,
			primercolour,primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,remarks,LoadDay)
			select a.Itemcode,b.description,c.RMCode,d.description,a.lc1,a.lc2,c.Size1,c.Size2,c.Size3,sum(a.FinalQty),0,0,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15,b.finishtype,b.surfacepreparation,b.primercolour,b.primerDFT,b.IMOColour,b.IMODFT,b.TopCoatColour,b.TopCoatDFT,b.remarks,@Loadday
			from [dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d where a.Itemcode=b.itemcode and a.Itemcode=c.ItemCode and c.RMCode=d.itemcode and a.LoadDay=@Loadday group by a.Itemcode,b.description,c.RMCode,d.description,a.lc1,a.lc2,c.Size1,c.Size2,c.Size3,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,
			b.process11,b.process12,b.process13,b.process14,b.process15,b.finishtype,b.surfacepreparation,b.primercolour,b.primerDFT,b.IMOColour,b.IMODFT,b.TopCoatColour,b.TopCoatDFT,b.remarks
			
			exec dbo.spDummyAdjusment @Loadday

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


