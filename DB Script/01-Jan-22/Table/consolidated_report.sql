USE [IndustriesDB]
GO

/****** Object:  Table [dbo].[ConsolidatedStoreReportTable1]    Script Date: 01-Jan-22 12:17:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ConsolidatedStoreReportTable1](
	[StoreReportTable1Identity] [int] IDENTITY(1,1) NOT NULL,
	[RMCode] [varchar](75) NULL,
	[RMDescription] [varchar](150) NULL,
	[size1] [varchar](20) NULL,
	[size2] [varchar](20) NULL,
	[size3] [varchar](20) NULL,
	[tables] [int] NULL,
	[NumberOfSheetsRequiredinNumbers] [decimal](30, 10) NULL,
	[NumberOfSheetsPerNesting] [decimal](30, 10) NULL,
	[NumberOfSheetsIssued] [decimal](30, 10) NULL,
	[Remarks] [varchar](500) NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreReportTable1Identity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[ConsolidatedStoreReportTable2]    Script Date: 01-Jan-22 12:18:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ConsolidatedStoreReportTable2](
	[StoreReportTable2Identity] [int] IDENTITY(1,1) NOT NULL,
	[RMCode] [varchar](75) NULL,
	[RMDescription] [varchar](150) NULL,
	[size1] [varchar](20) NULL,
	[size2] [varchar](20) NULL,
	[size3] [varchar](20) NULL,
	[tables] [int] NULL,
	[LengthRequiredinMetre] [decimal](30, 10) NULL,
	[NumberOfSheetsIssued] [decimal](30, 10) NULL,
	[Remarks] [varchar](500) NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreReportTable2Identity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[ConsolidatedSummaryReport]    Script Date: 01-Jan-22 12:18:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ConsolidatedSummaryReport](
	[SummaryReportIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](100) NULL,
	[description] [varchar](150) NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](2) NULL,
	[Qty] [int] NULL,
	[FinalQty] [int] NULL,
	[LoadDay] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[SummaryReportIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO