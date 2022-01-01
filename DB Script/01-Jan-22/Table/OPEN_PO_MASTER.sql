USE [IndustriesDB]
GO

/****** Object:  Table [dbo].[OpenPOMaster]    Script Date: 01-Jan-22 10:19:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OpenPOMaster](
	[POwithItemCode] [varchar](175) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[PONumber] [varchar](75) NULL,
	[PODate] [datetime] NULL,
	[HSNCode] [varchar](50) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[UnitCostorBasicPrice] [numeric](38, 5) NULL,
	[PODeliveryQty] [int] NULL,
	[TotalSalePrice] [numeric](38, 5) NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[TaxSet] [varchar](50) NULL,
	[TaxClass] [varchar](50) NULL,
	[FullAddress] [varchar](500) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[Remarks] [varchar](500) NULL,
	[QtyLoaded] [int] NULL,
	[QtyNotLoaded] [int] NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[POwithItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[OpenPOMasterHistory]    Script Date: 01-Jan-22 10:19:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OpenPOMasterHistory](
	[POMasterIdentity] [int] IDENTITY(1,1) NOT NULL,
	[POwithItemCode] [varchar](175) NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[PONumber] [varchar](75) NULL,
	[PODate] [datetime] NULL,
	[HSNCode] [varchar](50) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[UnitCostorBasicPrice] [numeric](38, 5) NULL,
	[PODeliveryQty] [int] NULL,
	[TotalSalePrice] [numeric](38, 5) NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[TaxSet] [varchar](50) NULL,
	[TaxClass] [varchar](50) NULL,
	[FullAddress] [varchar](500) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[Remarks] [varchar](500) NULL,
	[QtyLoaded] [int] NULL,
	[QtyNotLoaded] [int] NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[POMasterIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO