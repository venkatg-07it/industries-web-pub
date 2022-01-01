USE [IndustriesDB]
GO

/****** Object:  Table [dbo].[ConsolidatedRMReport]    Script Date: 01-Jan-22 12:14:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ConsolidatedRMReport](
	[RMReportIdentity] [int] IDENTITY(1,1) NOT NULL,
	[RMCode] [varchar](75) NULL,
	[RMDescription] [varchar](150) NULL,
	[Size1] [varchar](50) NULL,
	[Size2] [varchar](50) NULL,
	[Size3] [varchar](50) NULL,
	[tables] [int] NULL,
	[ScrapPercent] [int] NULL,
	[Qty] [int] NULL,
	[SUOM] [varchar](20) NULL,
	[Table1OrTable2] [decimal](30, 10) NULL,
	[AddPercent] [decimal](30, 10) NULL,
	[Total] [decimal](30, 10) NULL,
	[TotalwithQty] [decimal](30, 10) NULL,
	[RMS2] [varchar](20) NULL,
	[RMS3] [varchar](20) NULL,
	[InMetres] [decimal](30, 10) NULL,
	[NumberOfSheetsOrLengthRequired] [decimal](30, 10) NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[RMReportIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


