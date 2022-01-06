USE [IndustriesDB]
GO
/****** Object:  StoredProcedure [dbo].[spSelectNestingPrintDetails]    Script Date: 06-01-2022 03:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spSelectNestingPrintDetails]
@Loadday AS varchar(25),
@NestingNum AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select a.PlanningLoadDay,a.Itemcode,a.Itemdescription,a.Qty,a.BatchOrIndividual,a.NestingQty,a.ProcessQty,a.Printflag,a.StartPosition,a.EndPosition,a.Nestingno,b.customername,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15 from [dbo].[NestingMaster] a,[dbo].[ItemMaster] b where a.PlanningLoadDay=@Loadday and a.Nestingnumber=@NestingNum and a.Itemcode=b.itemcode

END

--------------------------------------------------------------------------------------------------------------
USE [IndustriesDB]
GO
/****** Object:  StoredProcedure [dbo].[spUpdateDummyPOLoadday]    Script Date: 06-01-2022 09:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spUpdateDummyPOLoadday]
@typDummyMaster AS dbo.typeDummyMaster READONLY,
@Loadday as varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			DECLARE @Count int
			SET @Count=0
			
			SELECT @Count = (select count(PlanningLoadDay) from [dbo].[DummyMaster] where PlanningLoadDay=@Loadday+'d')
			IF @Count>=1
			BEGIN				
				select (PlanningLoadDay + ItemcodeforLoading) 'LoaddaywithItemcode',CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
				CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
				AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
				AdjustedQty5,createdby,modifiedby,createddate,updateddate from @typDummyMaster 
			END
			ELSE 
			BEGIN
				SELECT @Count = (select count(PlanningLoadDay) from [dbo].[DummyMaster] where PlanningLoadDay=@Loadday+'c')
				IF @Count>=1
				BEGIN
					SET @Loadday = @Loadday + 'd'
				END
				ELSE
				BEGIN
					SELECT @Count = (select count(PlanningLoadDay) from [dbo].[DummyMaster] where PlanningLoadDay=@Loadday+'b')
					IF @Count>=1
					BEGIN
						SET @Loadday = @Loadday + 'c'
					END
					ELSE
					BEGIN
						SELECT @Count = (select count(PlanningLoadDay) from [dbo].[DummyMaster] where PlanningLoadDay=@Loadday+'a')
						IF @Count>=1
						BEGIN
							SET @Loadday = @Loadday + 'b'
						END
						ELSE
						BEGIN
							SELECT @Count = (select count(PlanningLoadDay) from [dbo].[DummyMaster] where PlanningLoadDay=@Loadday)
							
							IF @Count>=1
							BEGIN	
								SET @Loadday = @Loadday + 'a'
							END
							ELSE
							BEGIN	
								SET @Loadday = @Loadday
							END
						END
					END
				END
			END
			SELECT @Count = (select count(PlanningLoadDay) from [dbo].[DummyMaster] where PlanningLoadDay=@Loadday+'d')
			IF @Count=0
			BEGIN
				update [dbo].[DummyMaster] set LoaddaywithItemcode=(typ.PlanningLoadDay + typ.ItemcodeforLoading),CustomerName=typ.CustomerName,CustomerCode=c.CustomerCode,ItemcodeforLoading=typ.ItemcodeforLoading,ITEMDESCRIPTION=i.description,RevisionLevel=i.revisionlevel,DeliveryQty=typ.DeliveryQty,UOM=i.uom,SUOM=i.suom,
				CustomerServiceLoadDay=typ.CustomerServiceLoadDay,PlanningLoadDay=typ.PlanningLoadDay,Ageing=typ.Ageing,LiveorRetired=typ.LiveorRetired,ReasonforLoading=typ.ReasonforLoading,Status=typ.Status,CurrentQty=typ.DeliveryQty,AdjustedinPOLoadday1=typ.AdjustedinPOLoadday1,AdjustedQty1=typ.AdjustedQty1,
				AdjustedinPOLoadday2=typ.AdjustedinPOLoadday2,AdjustedQty2=typ.AdjustedQty2,AdjustedinPOLoadday3=typ.AdjustedinPOLoadday3,AdjustedQty3=typ.AdjustedQty3,AdjustedinPOLoadday4=typ.AdjustedinPOLoadday4,AdjustedQty4=typ.AdjustedQty4,AdjustedinPOLoadday5=typ.AdjustedinPOLoadday5,
				AdjustedQty5=typ.AdjustedQty5,createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE()
				from @typDummyMaster typ,dbo.CustomerMaster c,dbo.ItemMaster i
				where typ.CustomerName=c.CustomerName and typ.ItemcodeforLoading=i.itemcode and typ.ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster] where LiveorRetired='L' and lc1=1 and lc2='F') and typ.ItemcodeforLoading in (select ItemCode from [dbo].[ComponentMaster])

				select (PlanningLoadDay + ItemcodeforLoading) 'LoaddaywithItemcode',CustomerName,CustomerCode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,DeliveryQty,UOM,SUOM,
				CustomerServiceLoadDay,PlanningLoadDay,Ageing,LiveorRetired,ReasonforLoading,Status,CurrentQty,AdjustedinPOLoadday1,AdjustedQty1,
				AdjustedinPOLoadday2,AdjustedQty2,AdjustedinPOLoadday3,AdjustedQty3,AdjustedinPOLoadday4,AdjustedQty4,AdjustedinPOLoadday5,
				AdjustedQty5,createdby,modifiedby,createddate,updateddate from @typDummyMaster typ
				where typ.ItemcodeforLoading not in (select itemcode from [dbo].[ItemMaster] where LiveorRetired='L' and lc1=1 and lc2='F') or typ.CustomerName not in (select CustomerName from dbo.CustomerMaster) or typ.ItemcodeforLoading not in (select ItemCode from [dbo].[ComponentMaster])
	
			END
			
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
