USE [IndustriesDB]
GO
/****** Object:  StoredProcedure [dbo].[spSelectDummyNestingRMSizeList]    Script Date: 08-01-2022 08:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectDummyNestingRMSizeList]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select distinct d.size1 from [dbo].[DummyMaster] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d
	where a.ItemcodeforLoading=b.itemcode and a.ItemcodeforLoading=c.ItemCode and c.RMCode=d.itemcode and a.PlanningLoadDay=@Loadday and 
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
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectDummyNestingRMCodeList]    Script Date: 08-01-2022 08:36:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectDummyNestingRMCodeList]
@Loadday AS varchar(25),
@RMSize AS varchar(20)
AS
BEGIN	
	SET NOCOUNT ON;	

	select distinct c.RMCode from [dbo].[DummyMaster] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d
	where a.ItemcodeforLoading=b.itemcode and a.ItemcodeforLoading=c.ItemCode and c.RMCode=d.itemcode and a.PlanningLoadDay=@Loadday and d.size1=@RMSize and
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
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectDummyNestingItemCodeListForInsert]    Script Date: 08-01-2022 09:34:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectDummyNestingItemCodeListForInsert]
@Loadday AS varchar(25),
@RMSize AS varchar(20),
@RMCode AS varchar(100)
AS
BEGIN	
	SET NOCOUNT ON;	

	select a.ItemcodeforLoading,sum(DeliveryQty) 'FinalQty' from [dbo].[DummyMaster] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d
	where a.ItemcodeforLoading=b.itemcode and a.ItemcodeforLoading=c.ItemCode and c.RMCode=d.itemcode and a.PlanningLoadDay=@Loadday and d.size1=@RMSize and d.itemcode=@RMCode and a.ReasonforLoading != 'Extra added for Nesting for Utilisation' and
	a.ItemcodeforLoading not in (select Itemcode from dbo.NestingMaster where PlanningLoadDay=@Loadday) and
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
	group by a.ItemcodeforLoading,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15

END

GO
/****** Object:  StoredProcedure [dbo].[spSelectDummyNestingItemCodeListForUpdate]    Script Date: 08-01-2022 09:35:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectDummyNestingItemCodeListForUpdate]
@Loadday AS varchar(25),
@RMSize AS varchar(20),
@RMCode AS varchar(100)
AS
BEGIN	
	SET NOCOUNT ON;	

	select a.ItemcodeforLoading,sum(DeliveryQty) 'FinalQty' from [dbo].[DummyMaster] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c,[dbo].[ItemMasterRM] d
	where a.ItemcodeforLoading=b.itemcode and a.ItemcodeforLoading=c.ItemCode and c.RMCode=d.itemcode and a.PlanningLoadDay=@Loadday and d.size1=@RMSize and d.itemcode=@RMCode and a.ReasonforLoading != 'Extra added for Nesting for Utilisation' and
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
	group by a.ItemcodeforLoading,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15

END



