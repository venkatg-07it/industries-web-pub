USE [IndustriesDB]
GO

/****** Object:  StoredProcedure [dbo].[spSelectNestingLoadday]    Script Date: 01-Jan-22 3:15:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[spSelectNestingLoadday]
AS
BEGIN	
	SET NOCOUNT ON;	

	select distinct PlanningLoadDay from [dbo].[NestingMaster] where Printflag=0

END
GO


/****** Object:  StoredProcedure [dbo].[spSelectNestingNumberList]    Script Date: 01-Jan-22 3:16:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[spSelectNestingNumberList]
@Loadday AS varchar(25)
AS
BEGIN	
	SET NOCOUNT ON;	

	select distinct Nestingnumber from [dbo].[NestingMaster] where PlanningLoadDay=@Loadday

END
GO