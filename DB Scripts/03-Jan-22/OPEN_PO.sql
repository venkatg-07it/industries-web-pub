USE [IndustriesDB]
GO

/****** Object:  StoredProcedure [dbo].[spInsertOpenPOMaster]    Script Date: 03-Jan-22 8:01:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spInsertOpenPOMaster]
@typOpenPOMaster AS dbo.typeOpenPOMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[OpenPOMaster](POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,HSNCode,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,
			RevisionLevel,UnitCostorBasicPrice,PODeliveryQty,TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,LiveorRetired,Remarks,
			QtyLoaded,QtyNotLoaded,createdby,modifiedby,createddate,updateddate) 
			select (typ.PONumber + typ.ItemcodeforLoading),typ.CustomerName,c.CustomerCode,typ.PONumber,typ.PODate,c.HSNCode,typ.POItemcode,
			typ.ItemcodeforLoading,i.description,i.revisionlevel,typ.UnitCostorBasicPrice,typ.PODeliveryQty,typ.UnitCostorBasicPrice*typ.PODeliveryQty,i.uom,i.suom,
			p.Taxset,p.Taxclass,p.FullAddress,typ.LiveorRetired,typ.Remarks,0,0,typ.createdby,typ.modifiedby,GETDATE(),GETDATE() 
			from @typOpenPOMaster typ,dbo.CustomerMaster c,dbo.ItemMaster i,dbo.PriceMaster p
			where typ.CustomerName=c.CustomerName and typ.ItemcodeforLoading=i.itemcode and typ.ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster] where liveorretired='L') and typ.ItemcodeforLoading=p.Itemcode and typ.UnitCostorBasicPrice=p.BasicPrice

			select (PONumber + ItemcodeforLoading) 'POwithItemCode',CustomerName,CustomerCode,PONumber,PODate,HSNCode,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,
			RevisionLevel,UnitCostorBasicPrice,PODeliveryQty,TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,LiveorRetired,Remarks,
			QtyLoaded,QtyNotLoaded,createdby,modifiedby,createddate,updateddate
			from @typOpenPOMaster typ where typ.ItemcodeforLoading not in (select itemcode from [dbo].[ItemMaster] where liveorretired='L') or typ.CustomerName not in (select CustomerName from dbo.CustomerMaster) or typ.UnitCostorBasicPrice not in (select BasicPrice from [IndustriesDB].[dbo].[PriceMaster] where Itemcode=typ.ItemcodeforLoading)

		
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

/****** Object:  StoredProcedure [dbo].[spUpdateOpenPOMaster]    Script Date: 03-Jan-22 8:02:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spUpdateOpenPOMaster]
@typOpenPOMaster AS dbo.typeOpenPOMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION			
			
			Insert into [dbo].[OpenPOMasterHistory](POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,HSNCode,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,
			RevisionLevel,UnitCostorBasicPrice,PODeliveryQty,TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,LiveorRetired,Remarks,
			QtyLoaded,QtyNotLoaded,createdby,modifiedby,createddate,updateddate) 
			select POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,HSNCode,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,
			RevisionLevel,UnitCostorBasicPrice,PODeliveryQty,TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,LiveorRetired,Remarks,
			QtyLoaded,QtyNotLoaded,createdby,modifiedby,createddate,updateddate from [dbo].[OpenPOMaster] where ItemcodeforLoading in (select ItemcodeforLoading from @typOpenPOMaster typ where typ.ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster] where liveorretired='L') and typ.CustomerCode in (select CustomerCode from [dbo].[CustomerMaster]) and typ.UnitCostorBasicPrice in (select BasicPrice from [IndustriesDB].[dbo].[PriceMaster] where Itemcode=typ.ItemcodeforLoading))

			update [dbo].[OpenPOMaster] set POwithItemCode=(typ.PONumber + typ.ItemcodeforLoading),CustomerName=typ.CustomerName,CustomerCode=c.CustomerCode,PONumber=typ.PONumber,PODate=typ.PODate,HSNCode=c.HSNCode,
			POItemcode=typ.POItemcode,ItemcodeforLoading=typ.ItemcodeforLoading,ITEMDESCRIPTION=i.description,RevisionLevel=i.revisionlevel,UnitCostorBasicPrice=typ.UnitCostorBasicPrice,PODeliveryQty=typ.PODeliveryQty,
			TotalSalePrice=typ.UnitCostorBasicPrice*typ.PODeliveryQty,UOM=i.uom,SUOM=i.suom,TaxSet=p.Taxset,TaxClass=p.Taxclass,FullAddress=p.FullAddress,LiveorRetired=typ.LiveorRetired,Remarks=typ.Remarks,
			QtyLoaded=typ.QtyLoaded,QtyNotLoaded=typ.QtyNotLoaded,createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE()
			from @typOpenPOMaster typ,dbo.CustomerMaster c,dbo.ItemMaster i,dbo.PriceMaster p
			where typ.CustomerName=c.CustomerName and typ.ItemcodeforLoading=i.itemcode and typ.ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster] where liveorretired='L') and typ.ItemcodeforLoading=p.Itemcode and typ.UnitCostorBasicPrice=p.BasicPrice

			select (PONumber + ItemcodeforLoading) 'POwithItemCode',CustomerName,CustomerCode,PONumber,PODate,HSNCode,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,
			RevisionLevel,UnitCostorBasicPrice,PODeliveryQty,TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,LiveorRetired,Remarks,
			QtyLoaded,QtyNotLoaded,createdby,modifiedby,createddate,updateddate
			from @typOpenPOMaster typ where typ.ItemcodeforLoading not in (select itemcode from [dbo].[ItemMaster] where liveorretired='L') or typ.CustomerName not in (select CustomerName from dbo.CustomerMaster) or typ.UnitCostorBasicPrice not in (select BasicPrice from [IndustriesDB].[dbo].[PriceMaster] where Itemcode=typ.ItemcodeforLoading)

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

/****** Object:  StoredProcedure [dbo].[spSelectOpenPOMaster]    Script Date: 03-Jan-22 8:03:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spSelectOpenPOMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	SELECT POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,HSNCode,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,
	RevisionLevel,UnitCostorBasicPrice,PODeliveryQty,TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,LiveorRetired,Remarks,
	QtyLoaded,QtyNotLoaded,createdby,modifiedby,createddate,updateddate FROM [IndustriesDB].[dbo].[OpenPOMaster]
	
END
GO

/****** Object:  StoredProcedure [dbo].[spDeleteOpenPOMaster]    Script Date: 03-Jan-22 8:03:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spDeleteOpenPOMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[OpenPOMaster]  
	delete from [dbo].[OpenPOMasterHistory]  
END
GO
