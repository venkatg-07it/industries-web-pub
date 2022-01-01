USE [IndustriesDB]
GO

/****** Object:  Table [dbo].[ConsolidatedDummyPOAdjust]    Script Date: 01-Jan-22 12:09:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ConsolidatedDummyPOAdjust](
	[DummyPOAdjustIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](100) NULL,
	[Itemdescription] [varchar](150) NULL,
	[RMCode] [varchar](100) NULL,
	[RMDescription] [varchar](150) NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[Size1] [varchar](50) NULL,
	[Size2] [varchar](50) NULL,
	[Size3] [varchar](50) NULL,
	[TotalQty] [int] NULL,
	[DummyPOQty] [int] NULL,
	[BalanceDummyPOQty] [int] NULL,
	[process1] [varchar](30) NULL,
	[process2] [varchar](30) NULL,
	[process3] [varchar](30) NULL,
	[process4] [varchar](30) NULL,
	[process5] [varchar](30) NULL,
	[process6] [varchar](30) NULL,
	[process7] [varchar](30) NULL,
	[process8] [varchar](30) NULL,
	[process9] [varchar](30) NULL,
	[process10] [varchar](30) NULL,
	[process11] [varchar](30) NULL,
	[process12] [varchar](30) NULL,
	[process13] [varchar](30) NULL,
	[process14] [varchar](30) NULL,
	[process15] [varchar](30) NULL,
	[finishtype] [varchar](75) NULL,
	[surfacepreparation] [varchar](75) NULL,
	[primercolour] [varchar](75) NULL,
	[primerDFT] [varchar](75) NULL,
	[IMOColour] [varchar](75) NULL,
	[IMODFT] [varchar](75) NULL,
	[TopCoatColour] [varchar](75) NULL,
	[TopCoatDFT] [varchar](75) NULL,
	[remarks] [varchar](500) NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[DummyPOAdjustIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


