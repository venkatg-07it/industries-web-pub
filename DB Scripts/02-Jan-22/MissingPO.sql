USE [IndustriesDB]
GO

/****** Object:  Table [dbo].[MissingItemcodeinAssemblyMaster]    Script Date: 02-Jan-22 3:28:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MissingItemcodeinAssemblyMaster](
	[Itemcode] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Itemcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[MissingItemcodeinComponentMaster]    Script Date: 02-Jan-22 3:29:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MissingItemcodeinComponentMaster](
	[Itemcode] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Itemcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  StoredProcedure [dbo].[spSelectMatchItemcodeList]    Script Date: 02-Jan-22 3:30:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spSelectMatchItemcodeList]
@POItemCode AS varchar(75)
AS
BEGIN	
	SET NOCOUNT ON;	

	select ItemcodeforLoading from [dbo].[POItemCodeMatch] where POItemcode=@POItemCode

END
GO

/****** Object:  StoredProcedure [dbo].[spSelectMissingItemcodeinAssemblyMaster]    Script Date: 02-Jan-22 3:30:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[spSelectMissingItemcodeinAssemblyMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	select Itemcode from dbo.MissingItemcodeinAssemblyMaster
END

GO

/****** Object:  StoredProcedure [dbo].[spSelectMissingItemcodeinComponentMaster]    Script Date: 02-Jan-22 3:30:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[spSelectMissingItemcodeinComponentMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	select Itemcode from dbo.MissingItemcodeinComponentMaster
END

GO

/****** Object:  StoredProcedure [dbo].[spMissingItemcode]    Script Date: 02-Jan-22 3:38:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spMissingItemcode]
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION 

			delete  from [dbo].[MissingItemcodeinAssemblyMaster]
			delete from [dbo].[MissingItemcodeinComponentMaster]

			insert into [dbo].[MissingItemcodeinAssemblyMaster](Itemcode)
			select itemcode from [dbo].[ItemMaster] where lc1=2 and lc2='F' and liveorretired='L' and 
			itemcode not in (select Itemcode from [dbo].[AssemblyMaster]) 
			
			insert into [dbo].[MissingItemcodeinComponentMaster](Itemcode)
			select itemcode from [dbo].[ItemMaster] where lc1=1 and lc2='F' and liveorretired='L' and 
			itemcode not in (select ItemCode from [dbo].[ComponentMaster]) 
		
			select (select count(Itemcode) from [dbo].[MissingItemcodeinAssemblyMaster]) 'MissingItemcodeinAssemblyMaster',
			(select count(Itemcode) from [dbo].[MissingItemcodeinComponentMaster]) 'MissingItemcodeinComponentMaster'

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