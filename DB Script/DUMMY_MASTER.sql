USE [IndustriesDB]
GO

/****** Object:  Table [dbo].[DummyMaster]    Script Date: 01-Jan-22 10:09:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DummyMaster](
	[LoaddaywithItemcode] [varchar](100) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[DeliveryQty] [int] NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[CustomerServiceLoadDay] [varchar](25) NULL,
	[PlanningLoadDay] [varchar](25) NULL,
	[Ageing] [varchar](75) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[ReasonforLoading] [varchar](500) NULL,
	[Status] [varchar](20) NULL,
	[CurrentQty] [int] NULL,
	[AdjustedinPOLoadday1] [varchar](25) NULL,
	[AdjustedQty1] [int] NULL,
	[AdjustedinPOLoadday2] [varchar](25) NULL,
	[AdjustedQty2] [int] NULL,
	[AdjustedinPOLoadday3] [varchar](25) NULL,
	[AdjustedQty3] [int] NULL,
	[AdjustedinPOLoadday4] [varchar](25) NULL,
	[AdjustedQty4] [int] NULL,
	[AdjustedinPOLoadday5] [varchar](25) NULL,
	[AdjustedQty5] [int] NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoaddaywithItemcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DummyMasterHistory]    Script Date: 01-Jan-22 10:10:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DummyMasterHistory](
	[POMasterIdentity] [int] IDENTITY(1,1) NOT NULL,
	[LoaddaywithItemcode] [varchar](100) NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[DeliveryQty] [int] NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[CustomerServiceLoadDay] [varchar](25) NULL,
	[PlanningLoadDay] [varchar](25) NULL,
	[Ageing] [varchar](75) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[ReasonforLoading] [varchar](500) NULL,
	[Status] [varchar](20) NULL,
	[CurrentQty] [int] NULL,
	[AdjustedinPOLoadday1] [varchar](25) NULL,
	[AdjustedQty1] [int] NULL,
	[AdjustedinPOLoadday2] [varchar](25) NULL,
	[AdjustedQty2] [int] NULL,
	[AdjustedinPOLoadday3] [varchar](25) NULL,
	[AdjustedQty3] [int] NULL,
	[AdjustedinPOLoadday4] [varchar](25) NULL,
	[AdjustedQty4] [int] NULL,
	[AdjustedinPOLoadday5] [varchar](25) NULL,
	[AdjustedQty5] [int] NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[POMasterIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


