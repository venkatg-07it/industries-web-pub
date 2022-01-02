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