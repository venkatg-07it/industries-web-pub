USE [master]
GO

/****** Object:  Database [IndustriesDB]    Script Date: 18-Nov-21 11:20:41 AM ******/
DROP DATABASE [IndustriesDB]
GO

/****** Object:  Database [IndustriesDB]    Script Date: 18-Nov-21 11:20:41 AM ******/
CREATE DATABASE [IndustriesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IndustriesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IndustriesDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IndustriesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IndustriesDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IndustriesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [IndustriesDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [IndustriesDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [IndustriesDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [IndustriesDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [IndustriesDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [IndustriesDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [IndustriesDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [IndustriesDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [IndustriesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [IndustriesDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [IndustriesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [IndustriesDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [IndustriesDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [IndustriesDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [IndustriesDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [IndustriesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [IndustriesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [IndustriesDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [IndustriesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [IndustriesDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [IndustriesDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [IndustriesDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [IndustriesDB] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [IndustriesDB] SET  MULTI_USER 
GO

ALTER DATABASE [IndustriesDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [IndustriesDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [IndustriesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [IndustriesDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [IndustriesDB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [IndustriesDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [IndustriesDB] SET QUERY_STORE = OFF
GO

ALTER DATABASE [IndustriesDB] SET  READ_WRITE 
GO


USE [IndustriesDB]
GO
/****** Object:  UserDefinedTableType [dbo].[typeAssemblyMaster]    Script Date: 17-11-2021 18:50:19 ******/
CREATE TYPE [dbo].[typeAssemblyMaster] AS TABLE(
	[AssemblyIdentity] [int] NULL,
	[AssemblyNumber] [varchar](100) NULL,
	[AssemblyDescription] [varchar](150) NULL,
	[Itemcode] [varchar](100) NULL,
	[ItemcodeDescription] [varchar](150) NULL,
	[Qty] [int] NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[typeComponentMaster]    Script Date: 17-11-2021 18:50:19 ******/
CREATE TYPE [dbo].[typeComponentMaster] AS TABLE(
	[ItemCode] [varchar](75) NOT NULL,
	[Description] [varchar](150) NULL,
	[RMCode] [varchar](75) NULL,
	[RMDescription] [varchar](150) NULL,
	[Size1] [varchar](50) NULL,
	[Size2] [varchar](50) NULL,
	[Size3] [varchar](50) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[typeCustomerMaster]    Script Date: 17-11-2021 18:50:19 ******/
CREATE TYPE [dbo].[typeCustomerMaster] AS TABLE(
	[NewCustomerCode] [varchar](75) NULL,
	[CustomerCode] [varchar](75) NULL,
	[CustomerName] [varchar](100) NULL,
	[HSNCode] [varchar](75) NULL,
	[GSTINNumber] [varchar](40) NULL,
	[Address] [varchar](500) NULL,
	[Paymentterms] [varchar](250) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[typeItemMaster]    Script Date: 17-11-2021 18:50:19 ******/
CREATE TYPE [dbo].[typeItemMaster] AS TABLE(
	[customername] [varchar](75) NULL,
	[customercode] [varchar](20) NULL,
	[itemcode] [varchar](100) NULL,
	[description] [varchar](150) NULL,
	[referencestandard] [varchar](30) NULL,
	[equivalentsamrajitemcode] [varchar](35) NULL,
	[liveorretired] [varchar](1) NULL,
	[revisionlevel] [varchar](50) NULL,
	[uom] [int] NULL,
	[suom] [int] NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[remarks] [varchar](500) NULL,
	[processrevisionlevel] [varchar](30) NULL,
	[process1] [varchar](30) NULL,
	[machine1] [varchar](30) NULL,
	[process2] [varchar](30) NULL,
	[machine2] [varchar](30) NULL,
	[process3] [varchar](30) NULL,
	[machine3] [varchar](30) NULL,
	[process4] [varchar](30) NULL,
	[machine4] [varchar](30) NULL,
	[process5] [varchar](30) NULL,
	[machine5] [varchar](30) NULL,
	[process6] [varchar](30) NULL,
	[machine6] [varchar](30) NULL,
	[process7] [varchar](30) NULL,
	[machine7] [varchar](30) NULL,
	[process8] [varchar](30) NULL,
	[machine8] [varchar](30) NULL,
	[process9] [varchar](30) NULL,
	[machine9] [varchar](30) NULL,
	[process10] [varchar](30) NULL,
	[machine10] [varchar](30) NULL,
	[process11] [varchar](30) NULL,
	[machine11] [varchar](30) NULL,
	[process12] [varchar](30) NULL,
	[machine12] [varchar](30) NULL,
	[process13] [varchar](30) NULL,
	[machine13] [varchar](30) NULL,
	[process14] [varchar](30) NULL,
	[machine14] [varchar](30) NULL,
	[process15] [varchar](30) NULL,
	[machine15] [varchar](30) NULL,
	[finishtype] [varchar](75) NULL,
	[surfacepreparation] [varchar](75) NULL,
	[primercolour] [varchar](75) NULL,
	[primerDFT] [varchar](75) NULL,
	[IMOColour] [varchar](75) NULL,
	[IMODFT] [varchar](75) NULL,
	[TopCoatColour] [varchar](75) NULL,
	[TopCoatDFT] [varchar](75) NULL,
	[SpecialFinishdetails] [varchar](75) NULL,
	[QualityFlagforLaserOrTPP] [varchar](75) NULL,
	[InspectionCriteriaforLaserOrTPP] [varchar](75) NULL,
	[QtytobeInspectedforLaserOrTPP] [varchar](75) NULL,
	[QualityFlagforOtherthanLaserOrTPP] [varchar](75) NULL,
	[InspectionCriteriaforOtherthanLaserOrTPP] [varchar](75) NULL,
	[QtytobeInspectedforOtherthanLaserOrTPP] [varchar](75) NULL,
	[Image1] [varchar](250) NULL,
	[Image2] [varchar](250) NULL,
	[GroupCode] [varchar](75) NULL,
	[Inventorycode] [varchar](75) NULL,
	[HandlingPerson1] [varchar](75) NULL,
	[HandlingPerson2] [varchar](75) NULL,
	[ClassificationCode] [varchar](75) NULL,
	[ItemClassification] [varchar](75) NULL,
	[Locationoforigin] [varchar](75) NULL,
	[Engineeringissuelevel] [varchar](75) NULL,
	[RawmaterialSpecifications] [varchar](75) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[typeItemMasterRM]    Script Date: 17-11-2021 18:50:19 ******/
CREATE TYPE [dbo].[typeItemMasterRM] AS TABLE(
	[itemcode] [varchar](100) NOT NULL,
	[description] [varchar](150) NULL,
	[liveorretired] [varchar](1) NULL,
	[size1] [varchar](20) NULL,
	[size2] [varchar](20) NULL,
	[size3] [varchar](20) NULL,
	[tables] [int] NULL,
	[remarks] [varchar](500) NULL,
	[uom] [int] NULL,
	[suom] [int] NULL,
	[GroupCode] [varchar](75) NULL,
	[Inventorycode] [varchar](50) NULL,
	[HandlingPerson1] [varchar](50) NULL,
	[HandlingPerson2] [varchar](50) NULL,
	[ClassificationCode] [varchar](75) NULL,
	[ItemClassification] [varchar](75) NULL,
	[Locationoforigin] [varchar](75) NULL,
	[Engineeringissuelevel] [varchar](75) NULL,
	[RawmaterialSpecifications] [varchar](75) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
	PRIMARY KEY CLUSTERED 
(
	[itemcode] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[typePOMaster]    Script Date: 17-11-2021 18:50:19 ******/
CREATE TYPE [dbo].[typePOMaster] AS TABLE(
	[POwithItemCode] [varchar](175) NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[PONumber] [varchar](75) NULL,
	[PODate] [datetime] NULL,
	[POModifiedDate] [datetime] NULL,
	[POType] [varchar](15) NULL,
	[POScanedImage] [varchar](250) NULL,
	[HSNCode] [varchar](50) NULL,
	[SalesOrderNumber] [varchar](50) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[UnitCostorBasicPrice] [numeric](10, 5) NULL,
	[PODeliveryDate] [datetime] NULL,
	[PODeliveryQty] [int] NULL,
	[TotalSalePrice] [numeric](10, 5) NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[TaxSet] [varchar](50) NULL,
	[TaxClass] [varchar](50) NULL,
	[FullAddress] [varchar](500) NULL,
	[RealisticDeliveryDate] [datetime] NULL,
	[Comments] [varchar](500) NULL,
	[CustomerServiceLoadDay] [varchar](25) NULL,
	[PlanningLoadDay] [date] NULL,
	[Ageing] [varchar](75) NULL,
	[SamrajInvoiceDate] [datetime] NULL,
	[DispatchedQty] [int] NULL,
	[Dispatch100PercentorPartial] [varchar](25) NULL,
	[COT] [varchar](25) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
	[Status] [varchar](20) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[typePriceMaster]    Script Date: 17-11-2021 18:50:19 ******/
CREATE TYPE [dbo].[typePriceMaster] AS TABLE(
	[Itemcode] [varchar](75) NULL,
	[Description] [varchar](150) NULL,
	[Referencestandard] [varchar](30) NULL,
	[EquivalentSamrajItemcode] [varchar](75) NULL,
	[Customer] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[HSNCode] [varchar](50) NULL,
	[RevisionLevel] [int] NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[BasicPrice] [numeric](10, 5) NULL,
	[Taxset] [varchar](15) NULL,
	[Taxclass] [varchar](15) NULL,
	[FullAddress] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[AssemblyMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssemblyMaster](
	[AssemblyIdentity] [int] IDENTITY(1,1) NOT NULL,
	[AssemblyNumber] [varchar](100) NULL,
	[AssemblyDescription] [varchar](150) NULL,
	[Itemcode] [varchar](100) NULL,
	[ItemcodeDescription] [varchar](150) NULL,
	[Qty] [int] NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssemblyIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Assembly] UNIQUE NONCLUSTERED 
(
	[AssemblyNumber] ASC,
	[Itemcode] ASC,
	[Qty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssemblyMasterHistory]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssemblyMasterHistory](
	[AssemblyIdentity] [int] IDENTITY(1,1) NOT NULL,
	[AssemblyNumber] [varchar](100) NULL,
	[AssemblyDescription] [varchar](150) NULL,
	[Itemcode] [varchar](100) NULL,
	[ItemcodeDescription] [varchar](150) NULL,
	[Qty] [int] NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssemblyIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComponentMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComponentMaster](
	[ItemCode] [varchar](75) NOT NULL,
	[Description] [varchar](150) NULL,
	[RMCode] [varchar](75) NULL,
	[RMDescription] [varchar](150) NULL,
	[Size1] [varchar](50) NULL,
	[Size2] [varchar](50) NULL,
	[Size3] [varchar](50) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Component] UNIQUE NONCLUSTERED 
(
	[ItemCode] ASC,
	[RMCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComponentMasterHistory]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComponentMasterHistory](
	[ComponentMasterIdentity] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [varchar](75) NULL,
	[Description] [varchar](150) NULL,
	[RMCode] [varchar](75) NULL,
	[RMDescription] [varchar](150) NULL,
	[Size1] [varchar](50) NULL,
	[Size2] [varchar](50) NULL,
	[Size3] [varchar](50) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ComponentMasterIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConsolidatedReport]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConsolidatedReport](
	[ConsolidatedReportIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](100) NULL,
	[Qty] [int] NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[level] [int] NULL,
	[PrevRoot] [varchar](100) NULL,
	[Root] [varchar](100) NULL,
	[FinalQty] [int] NULL,
	[PONumber] [varchar](75) NULL,
	[LoadDay] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ConsolidatedReportIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerMaster](
	[NewCustomerCode] [varchar](75) NOT NULL,
	[CustomerCode] [varchar](75) NULL,
	[CustomerName] [varchar](100) NULL,
	[HSNCode] [varchar](75) NULL,
	[GSTINNumber] [varchar](40) NULL,
	[Address] [varchar](500) NULL,
	[Paymentterms] [varchar](250) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewCustomerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerMasterHistory]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerMasterHistory](
	[CustomerMasterIdentity] [int] IDENTITY(1,1) NOT NULL,
	[NewCustomerCode] [varchar](75) NULL,
	[CustomerCode] [varchar](75) NULL,
	[CustomerName] [varchar](100) NULL,
	[HSNCode] [varchar](75) NULL,
	[GSTINNumber] [varchar](40) NULL,
	[Address] [varchar](500) NULL,
	[Paymentterms] [varchar](250) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerMasterIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[customername] [varchar](75) NULL,
	[customercode] [varchar](20) NULL,
	[itemcode] [varchar](100) NOT NULL,
	[description] [varchar](150) NULL,
	[referencestandard] [varchar](30) NULL,
	[equivalentsamrajitemcode] [varchar](35) NULL,
	[liveorretired] [varchar](1) NULL,
	[revisionlevel] [varchar](50) NULL,
	[uom] [int] NULL,
	[suom] [int] NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[remarks] [varchar](500) NULL,
	[processrevisionlevel] [varchar](30) NULL,
	[process1] [varchar](30) NULL,
	[machine1] [varchar](30) NULL,
	[process2] [varchar](30) NULL,
	[machine2] [varchar](30) NULL,
	[process3] [varchar](30) NULL,
	[machine3] [varchar](30) NULL,
	[process4] [varchar](30) NULL,
	[machine4] [varchar](30) NULL,
	[process5] [varchar](30) NULL,
	[machine5] [varchar](30) NULL,
	[process6] [varchar](30) NULL,
	[machine6] [varchar](30) NULL,
	[process7] [varchar](30) NULL,
	[machine7] [varchar](30) NULL,
	[process8] [varchar](30) NULL,
	[machine8] [varchar](30) NULL,
	[process9] [varchar](30) NULL,
	[machine9] [varchar](30) NULL,
	[process10] [varchar](30) NULL,
	[machine10] [varchar](30) NULL,
	[process11] [varchar](30) NULL,
	[machine11] [varchar](30) NULL,
	[process12] [varchar](30) NULL,
	[machine12] [varchar](30) NULL,
	[process13] [varchar](30) NULL,
	[machine13] [varchar](30) NULL,
	[process14] [varchar](30) NULL,
	[machine14] [varchar](30) NULL,
	[process15] [varchar](30) NULL,
	[machine15] [varchar](30) NULL,
	[finishtype] [varchar](75) NULL,
	[surfacepreparation] [varchar](75) NULL,
	[primercolour] [varchar](75) NULL,
	[primerDFT] [varchar](75) NULL,
	[IMOColour] [varchar](75) NULL,
	[IMODFT] [varchar](75) NULL,
	[TopCoatColour] [varchar](75) NULL,
	[TopCoatDFT] [varchar](75) NULL,
	[SpecialFinishdetails] [varchar](75) NULL,
	[QualityFlagforLaserOrTPP] [varchar](75) NULL,
	[InspectionCriteriaforLaserOrTPP] [varchar](75) NULL,
	[QtytobeInspectedforLaserOrTPP] [varchar](75) NULL,
	[QualityFlagforOtherthanLaserOrTPP] [varchar](75) NULL,
	[InspectionCriteriaforOtherthanLaserOrTPP] [varchar](75) NULL,
	[QtytobeInspectedforOtherthanLaserOrTPP] [varchar](75) NULL,
	[Image1] [varchar](250) NULL,
	[Image2] [varchar](250) NULL,
	[GroupCode] [varchar](75) NULL,
	[Inventorycode] [varchar](75) NULL,
	[HandlingPerson1] [varchar](75) NULL,
	[HandlingPerson2] [varchar](75) NULL,
	[ClassificationCode] [varchar](75) NULL,
	[ItemClassification] [varchar](75) NULL,
	[Locationoforigin] [varchar](75) NULL,
	[Engineeringissuelevel] [varchar](75) NULL,
	[RawmaterialSpecifications] [varchar](75) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[itemcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemMasterHistory]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemMasterHistory](
	[ItemMasterIdentity] [int] IDENTITY(1,1) NOT NULL,
	[customername] [varchar](75) NULL,
	[customercode] [varchar](20) NULL,
	[itemcode] [varchar](100) NULL,
	[description] [varchar](150) NULL,
	[referencestandard] [varchar](30) NULL,
	[equivalentsamrajitemcode] [varchar](35) NULL,
	[liveorretired] [varchar](1) NULL,
	[revisionlevel] [varchar](50) NULL,
	[uom] [int] NULL,
	[suom] [int] NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[remarks] [varchar](500) NULL,
	[processrevisionlevel] [varchar](30) NULL,
	[process1] [varchar](30) NULL,
	[machine1] [varchar](30) NULL,
	[process2] [varchar](30) NULL,
	[machine2] [varchar](30) NULL,
	[process3] [varchar](30) NULL,
	[machine3] [varchar](30) NULL,
	[process4] [varchar](30) NULL,
	[machine4] [varchar](30) NULL,
	[process5] [varchar](30) NULL,
	[machine5] [varchar](30) NULL,
	[process6] [varchar](30) NULL,
	[machine6] [varchar](30) NULL,
	[process7] [varchar](30) NULL,
	[machine7] [varchar](30) NULL,
	[process8] [varchar](30) NULL,
	[machine8] [varchar](30) NULL,
	[process9] [varchar](30) NULL,
	[machine9] [varchar](30) NULL,
	[process10] [varchar](30) NULL,
	[machine10] [varchar](30) NULL,
	[process11] [varchar](30) NULL,
	[machine11] [varchar](30) NULL,
	[process12] [varchar](30) NULL,
	[machine12] [varchar](30) NULL,
	[process13] [varchar](30) NULL,
	[machine13] [varchar](30) NULL,
	[process14] [varchar](30) NULL,
	[machine14] [varchar](30) NULL,
	[process15] [varchar](30) NULL,
	[machine15] [varchar](30) NULL,
	[finishtype] [varchar](75) NULL,
	[surfacepreparation] [varchar](75) NULL,
	[primercolour] [varchar](75) NULL,
	[primerDFT] [varchar](75) NULL,
	[IMOColour] [varchar](75) NULL,
	[IMODFT] [varchar](75) NULL,
	[TopCoatColour] [varchar](75) NULL,
	[TopCoatDFT] [varchar](75) NULL,
	[SpecialFinishdetails] [varchar](75) NULL,
	[QualityFlagforLaserOrTPP] [varchar](75) NULL,
	[InspectionCriteriaforLaserOrTPP] [varchar](75) NULL,
	[QtytobeInspectedforLaserOrTPP] [varchar](75) NULL,
	[QualityFlagforOtherthanLaserOrTPP] [varchar](75) NULL,
	[InspectionCriteriaforOtherthanLaserOrTPP] [varchar](75) NULL,
	[QtytobeInspectedforOtherthanLaserOrTPP] [varchar](75) NULL,
	[Image1] [varchar](250) NULL,
	[Image2] [varchar](250) NULL,
	[GroupCode] [varchar](75) NULL,
	[Inventorycode] [varchar](75) NULL,
	[HandlingPerson1] [varchar](75) NULL,
	[HandlingPerson2] [varchar](75) NULL,
	[ClassificationCode] [varchar](75) NULL,
	[ItemClassification] [varchar](75) NULL,
	[Locationoforigin] [varchar](75) NULL,
	[Engineeringissuelevel] [varchar](75) NULL,
	[RawmaterialSpecifications] [varchar](75) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemMasterIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemMasterRM]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemMasterRM](
	[itemcode] [varchar](100) NOT NULL,
	[description] [varchar](150) NULL,
	[liveorretired] [varchar](1) NULL,
	[size1] [varchar](20) NULL,
	[size2] [varchar](20) NULL,
	[size3] [varchar](20) NULL,
	[tables] [int] NULL,
	[remarks] [varchar](500) NULL,
	[uom] [int] NULL,
	[suom] [int] NULL,
	[GroupCode] [varchar](75) NULL,
	[Inventorycode] [varchar](50) NULL,
	[HandlingPerson1] [varchar](50) NULL,
	[HandlingPerson2] [varchar](50) NULL,
	[ClassificationCode] [varchar](75) NULL,
	[ItemClassification] [varchar](75) NULL,
	[Locationoforigin] [varchar](75) NULL,
	[Engineeringissuelevel] [varchar](75) NULL,
	[RawmaterialSpecifications] [varchar](75) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[itemcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemMasterRMHistory]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemMasterRMHistory](
	[ItemMasterRMIdentity] [int] IDENTITY(1,1) NOT NULL,
	[itemcode] [varchar](100) NULL,
	[description] [varchar](150) NULL,
	[liveorretired] [varchar](1) NULL,
	[size1] [varchar](20) NULL,
	[size2] [varchar](20) NULL,
	[size3] [varchar](20) NULL,
	[tables] [int] NULL,
	[remarks] [varchar](500) NULL,
	[uom] [int] NULL,
	[suom] [int] NULL,
	[GroupCode] [varchar](75) NULL,
	[Inventorycode] [varchar](50) NULL,
	[HandlingPerson1] [varchar](50) NULL,
	[HandlingPerson2] [varchar](50) NULL,
	[ClassificationCode] [varchar](75) NULL,
	[ItemClassification] [varchar](75) NULL,
	[Locationoforigin] [varchar](75) NULL,
	[Engineeringissuelevel] [varchar](75) NULL,
	[RawmaterialSpecifications] [varchar](75) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemMasterRMIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POMaster](
	[POwithItemCode] [varchar](175) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[PONumber] [varchar](75) NULL,
	[PODate] [datetime] NULL,
	[POModifiedDate] [datetime] NULL,
	[POType] [varchar](15) NULL,
	[POScanedImage] [varchar](250) NULL,
	[HSNCode] [varchar](50) NULL,
	[SalesOrderNumber] [varchar](50) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[UnitCostorBasicPrice] [numeric](10, 5) NULL,
	[PODeliveryDate] [datetime] NULL,
	[PODeliveryQty] [int] NULL,
	[TotalSalePrice] [numeric](10, 5) NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[TaxSet] [varchar](50) NULL,
	[TaxClass] [varchar](50) NULL,
	[FullAddress] [varchar](500) NULL,
	[RealisticDeliveryDate] [datetime] NULL,
	[Comments] [varchar](500) NULL,
	[CustomerServiceLoadDay] [varchar](25) NULL,
	[PlanningLoadDay] [date] NULL,
	[Ageing] [varchar](75) NULL,
	[SamrajInvoiceDate] [datetime] NULL,
	[DispatchedQty] [int] NULL,
	[Dispatch100PercentorPartial] [varchar](25) NULL,
	[COT] [varchar](25) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[POwithItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POMasterHistory]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POMasterHistory](
	[POMasterIdentity] [int] IDENTITY(1,1) NOT NULL,
	[POwithItemCode] [varchar](175) NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[PONumber] [varchar](75) NULL,
	[PODate] [datetime] NULL,
	[POModifiedDate] [datetime] NULL,
	[POType] [varchar](15) NULL,
	[POScanedImage] [varchar](250) NULL,
	[HSNCode] [varchar](50) NULL,
	[SalesOrderNumber] [varchar](50) NULL,
	[POItemcode] [varchar](75) NULL,
	[ItemcodeforLoading] [varchar](75) NULL,
	[ITEMDESCRIPTION] [varchar](150) NULL,
	[RevisionLevel] [int] NULL,
	[UnitCostorBasicPrice] [numeric](10, 5) NULL,
	[PODeliveryDate] [datetime] NULL,
	[PODeliveryQty] [int] NULL,
	[TotalSalePrice] [numeric](10, 5) NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[TaxSet] [varchar](50) NULL,
	[TaxClass] [varchar](50) NULL,
	[FullAddress] [varchar](500) NULL,
	[RealisticDeliveryDate] [datetime] NULL,
	[Comments] [varchar](500) NULL,
	[CustomerServiceLoadDay] [varchar](25) NULL,
	[PlanningLoadDay] [date] NULL,
	[Ageing] [varchar](75) NULL,
	[SamrajInvoiceDate] [datetime] NULL,
	[DispatchedQty] [int] NULL,
	[Dispatch100PercentorPartial] [varchar](25) NULL,
	[COT] [varchar](25) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[Remarks] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[POMasterIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PriceMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PriceMaster](
	[Itemcode] [varchar](75) NOT NULL,
	[Description] [varchar](150) NULL,
	[Referencestandard] [varchar](30) NULL,
	[EquivalentSamrajItemcode] [varchar](75) NULL,
	[Customer] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[HSNCode] [varchar](50) NULL,
	[RevisionLevel] [int] NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[BasicPrice] [numeric](10, 5) NULL,
	[Taxset] [varchar](15) NULL,
	[Taxclass] [varchar](15) NULL,
	[FullAddress] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Itemcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PriceMasterHistory]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PriceMasterHistory](
	[PriceMasterIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](75) NULL,
	[Description] [varchar](150) NULL,
	[Referencestandard] [varchar](30) NULL,
	[EquivalentSamrajItemcode] [varchar](75) NULL,
	[Customer] [varchar](100) NULL,
	[CustomerCode] [varchar](75) NULL,
	[HSNCode] [varchar](50) NULL,
	[RevisionLevel] [int] NULL,
	[UOM] [int] NULL,
	[SUOM] [int] NULL,
	[BasicPrice] [numeric](10, 5) NULL,
	[Taxset] [varchar](15) NULL,
	[Taxclass] [varchar](15) NULL,
	[FullAddress] [varchar](500) NULL,
	[createdby] [varchar](25) NULL,
	[modifiedby] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PriceMasterIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableMaster](
	[TableType] [int] NOT NULL,
	[ScrapPercent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TableType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[spConsolidateReport]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsolidateReport]
@Loaddate AS Datetime
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION	

			delete from dbo.ConsolidatedReport
			create table LevelTableOrg(Itemcode varchar(75))
			create table LevelTableDup(Itemcode varchar(75))		

			DECLARE @PONumber varchar(75),@AssemblyNumber varchar(75),@POitemcode varchar(75),@POqty int,@lc1 int,@lc2 varchar(1),@level int,@POLevelitemcode varchar(75),@POLevelqty int,@Levellc1 int,@Levellc2 varchar(1),@Parentitemcode varchar(75),@Count int,@AssemplyQty int;

			--PRINT '-------- PO DETAILS --------';--print '   ' + CAST(@emp_id as varchar(10)) +'           '+cast(@emp_name as varchar(20))

			DECLARE PO_cursor CURSOR FOR SELECT ItemcodeforLoading,PODeliveryQty,PONumber FROM dbo.POMaster where PlanningLoadDay=@Loaddate;
			OPEN PO_cursor
			FETCH NEXT FROM PO_cursor INTO @POitemcode,@POqty,@PONumber					

			WHILE @@FETCH_STATUS = 0
			BEGIN
				set @level=0	
				SELECT @lc1 = (select lc1 from [dbo].[ItemMaster] where itemcode=@POitemcode) 
				SELECT @lc2 = (select lc2 from [dbo].[ItemMaster] where itemcode=@POitemcode)

				insert into dbo.ConsolidatedReport(Itemcode,Qty,lc1,lc2,level,PrevRoot,Root,FinalQty,PONumber,LoadDay) values (@POitemcode,@POqty,@lc1,@lc2,@level,null,null,@POqty,@PONumber,@Loaddate)
				
				delete from LevelTableOrg
				insert into LevelTableOrg values(@POitemcode)
				set @Count=1

				IF @lc1 = 2 and @lc2='F'
				BEGIN
					WHILE ( @Count > 0)
					BEGIN										
						DECLARE POLevel_cursor CURSOR FOR select Itemcode,Qty,AssemblyNumber from dbo.AssemblyMaster where AssemblyNumber in (select Itemcode from LevelTableOrg)
						OPEN POLevel_cursor
						FETCH NEXT FROM POLevel_cursor INTO @POLevelitemcode,@POLevelqty,@AssemblyNumber						
						
						set @level=@level+1						

						WHILE @@FETCH_STATUS = 0
						BEGIN
							set	@Parentitemcode=@AssemblyNumber
							SELECT @AssemplyQty=(select FinalQty from dbo.ConsolidatedReport where Itemcode=@AssemblyNumber)
							SELECT @Levellc1 = (select lc1 from [dbo].[ItemMaster] where itemcode=@POLevelitemcode) 
							SELECT @Levellc2 = (select lc2 from [dbo].[ItemMaster] where itemcode=@POLevelitemcode)

							insert into dbo.ConsolidatedReport(Itemcode,Qty,lc1,lc2,level,PrevRoot,Root,FinalQty,PONumber,LoadDay) values (@POLevelitemcode,@POLevelqty,@Levellc1,@Levellc2,@level,@Parentitemcode,@POitemcode,@AssemplyQty*@POLevelqty,@PONumber,@Loaddate)

							IF @Levellc1 = 2 and @Levellc2='F'
							BEGIN
								insert into LevelTableDup values(@POLevelitemcode)
							END

							FETCH NEXT FROM POLevel_cursor INTO @POLevelitemcode,@POLevelqty,@AssemblyNumber
						END

						delete from LevelTableOrg
						SELECT @Count=(select count(Itemcode) from LevelTableDup)
						--print 'Count:' + CAST(@Count as varchar(10))
						insert into LevelTableOrg select * from LevelTableDup
						delete from LevelTableDup

						CLOSE POLevel_cursor;
						DEALLOCATE POLevel_cursor;
					END --whille
				END --if				

				FETCH NEXT FROM PO_cursor INTO @POitemcode,@POqty,@PONumber
			END
			CLOSE PO_cursor;
			DEALLOCATE PO_cursor;

			drop table LevelTableOrg
			drop table LevelTableDup

			--select Itemcode,Qty,lc1,lc2,level,PrevRoot,Root,FinalQty,PONumber,LoadDay from ConsolidatedReport order by Root,level,PrevRoot

		COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
	CLOSE PO_cursor;
	DEALLOCATE PO_cursor;
	CLOSE POLevel_cursor;
	DEALLOCATE POLevel_cursor;
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
		
        DECLARE @Message nvarchar(2048) = ERROR_MESSAGE();
        DECLARE @Severity integer = ERROR_SEVERITY();
        DECLARE @State integer = ERROR_STATE();

        RAISERROR(@Message, @Severity, @State);
        RETURN -1;
  END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[spDeleteAssemplyMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteAssemplyMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[AssemblyMaster]  
	delete from [dbo].[AssemblyMasterHistory]  
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteComponentMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteComponentMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[ComponentMaster]
	delete from [dbo].[ComponentMasterHistory]
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCustomerMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteCustomerMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[CustomerMaster]
	delete from [dbo].[CustomerMasterHistory]
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteItemMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteItemMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[ItemMaster]
	delete from [dbo].[ItemMasterHistory]  
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteItemMasterRM]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteItemMasterRM]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].ItemMasterRM  
	delete from [dbo].[ItemMasterRMHistory]  
END
GO
/****** Object:  StoredProcedure [dbo].[spDeletePOMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spDeletePOMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[POMaster]
	delete from [dbo].[POMasterHistory]
END
GO
/****** Object:  StoredProcedure [dbo].[spDeletePriceMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spDeletePriceMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[PriceMaster]
	delete from [dbo].[PriceMasterHistory]
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertAssemplyMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertAssemplyMaster]
@typAssemply AS dbo.typeAssemblyMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			insert into [dbo].[AssemblyMaster]([AssemblyNumber],[AssemblyDescription],[Itemcode],[ItemcodeDescription],[Qty],
			[Remarks],[createdby],[modifiedby],[createddate],[updateddate]) select AssemblyNumber,AssemblyDescription,
			Itemcode,ItemcodeDescription,Qty,Remarks,createdby,modifiedby,GETDATE(),GETDATE() from @typAssemply typ
			where typ.Itemcode in (select itemcode from [dbo].[ItemMaster]) and typ.AssemblyNumber in (select itemcode from [dbo].[ItemMaster])

			select AssemblyIdentity,AssemblyNumber,AssemblyDescription,Itemcode,ItemcodeDescription,Qty,Remarks,createdby,modifiedby,createddate,
			updateddate from @typAssemply typ where typ.Itemcode not in (select itemcode from [dbo].[ItemMaster]) or typ.AssemblyNumber not in (select itemcode from [dbo].[ItemMaster])
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
/****** Object:  StoredProcedure [dbo].[spInsertComponentMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertComponentMaster]
@typComponentMaster AS dbo.typeComponentMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[ComponentMaster]([ItemCode],[Description],[RMCode],[RMDescription],[Size1],[Size2],[Size3]
			,[Remarks],[createdby],[modifiedby],[createddate],[updateddate]) select [ItemCode],[Description],[RMCode],[RMDescription],[Size1],[Size2],[Size3]
			,[Remarks],[createdby],[modifiedby],GETDATE(),GETDATE() from @typComponentMaster typ where typ.Itemcode in (select itemcode from [dbo].[ItemMaster])
			and typ.RMCode in (select itemcode from [dbo].[ItemMasterRM])

			SELECT [ItemCode],[Description],[RMCode],[RMDescription],[Size1],[Size2],[Size3],[Remarks],[createdby],[modifiedby]
			,[createddate],[updateddate] FROM @typComponentMaster typ where typ.Itemcode not in (select itemcode from [dbo].[ItemMaster])
			or typ.RMCode not in (select itemcode from [dbo].[ItemMasterRM])
		
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
/****** Object:  StoredProcedure [dbo].[spInsertCustomerMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertCustomerMaster]
@typCustomerMaster AS dbo.typeCustomerMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[CustomerMaster] (NewCustomerCode,CustomerCode,CustomerName,HSNCode,GSTINNumber,Address,Paymentterms,Remarks,
			createdby,modifiedby,createddate,updateddate) select NewCustomerCode,CustomerCode,CustomerName,HSNCode,GSTINNumber,Address,Paymentterms,Remarks,
			createdby,modifiedby,GETDATE(),GETDATE() from @typCustomerMaster
		
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
/****** Object:  StoredProcedure [dbo].[spInsertItemMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertItemMaster]
@typItemMaster AS dbo.typeItemMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[ItemMaster](customername,customercode,itemcode,description,referencestandard,equivalentsamrajitemcode,liveorretired,
			revisionlevel,uom,suom,lc1,lc2,remarks,processrevisionlevel,process1 ,machine1 ,process2,machine2,
			process3,machine3,process4,machine4,process5,machine5,process6,machine6,process7,machine7,process8,
			machine8,process9,machine9,process10,machine10,process11,machine11,process12,machine12,process13,
			machine13,process14,machine14,process15,machine15,finishtype,surfacepreparation,primercolour,
			primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,SpecialFinishdetails,QualityFlagforLaserOrTPP,
			InspectionCriteriaforLaserOrTPP,QtytobeInspectedforLaserOrTPP,QualityFlagforOtherthanLaserOrTPP,
			InspectionCriteriaforOtherthanLaserOrTPP,QtytobeInspectedforOtherthanLaserOrTPP,Image1,Image2,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,
			Locationoforigin,Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate) 
			select customername,customercode,itemcode,description,referencestandard,equivalentsamrajitemcode,liveorretired,
			revisionlevel,uom,suom,lc1,lc2,remarks,processrevisionlevel,process1 ,machine1 ,process2,machine2,
			process3,machine3,process4,machine4,process5,machine5,process6,machine6,process7,machine7,process8,
			machine8,process9,machine9,process10,machine10,process11,machine11,process12,machine12,process13,
			machine13,process14,machine14,process15,machine15,finishtype,surfacepreparation,primercolour,
			primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,SpecialFinishdetails,QualityFlagforLaserOrTPP,
			InspectionCriteriaforLaserOrTPP,QtytobeInspectedforLaserOrTPP,QualityFlagforOtherthanLaserOrTPP,
			InspectionCriteriaforOtherthanLaserOrTPP,QtytobeInspectedforOtherthanLaserOrTPP,Image1,Image2,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,
			Locationoforigin,Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,GETDATE(),GETDATE() 
			from @typItemMaster typ where typ.customercode in (select CustomerCode from [dbo].[CustomerMaster])

			select customername,customercode,itemcode,description,referencestandard,equivalentsamrajitemcode,liveorretired,
			revisionlevel,uom,suom,lc1,lc2,remarks,processrevisionlevel,process1 ,machine1 ,process2,machine2,
			process3,machine3,process4,machine4,process5,machine5,process6,machine6,process7,machine7,process8,
			machine8,process9,machine9,process10,machine10,process11,machine11,process12,machine12,process13,
			machine13,process14,machine14,process15,machine15,finishtype,surfacepreparation,primercolour,
			primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,SpecialFinishdetails,QualityFlagforLaserOrTPP,
			InspectionCriteriaforLaserOrTPP,QtytobeInspectedforLaserOrTPP,QualityFlagforOtherthanLaserOrTPP,
			InspectionCriteriaforOtherthanLaserOrTPP,QtytobeInspectedforOtherthanLaserOrTPP,Image1,Image2,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,
			Locationoforigin,Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate 
			from @typItemMaster typ where typ.customercode not in (select CustomerCode from [dbo].[CustomerMaster])
		
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
/****** Object:  StoredProcedure [dbo].[spInsertItemMasterRM]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertItemMasterRM]
@typItemMasterRM AS dbo.typeItemMasterRM READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[ItemMasterRM](itemcode,description,liveorretired,size1,size2,size3,tables,remarks,uom,suom,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,Locationoforigin,
			Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate) select itemcode,description,liveorretired,size1,size2,size3,tables,remarks,uom,suom,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,Locationoforigin,
			Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,GETDATE(),GETDATE() from @typItemMasterRM

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
/****** Object:  StoredProcedure [dbo].[spInsertPOMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertPOMaster]
@typPOMaster AS dbo.typePOMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[POMaster](POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,POModifiedDate,POType,POScanedImage,HSNCode,SalesOrderNumber,
			POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,UnitCostorBasicPrice,PODeliveryDate,PODeliveryQty,
			TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,RealisticDeliveryDate,Comments,CustomerServiceLoadDay,PlanningLoadDay,
			Ageing,SamrajInvoiceDate,DispatchedQty,Dispatch100PercentorPartial,COT,LiveorRetired,Remarks,createdby,modifiedby,
			createddate,updateddate,Status) select CONCAT(PONumber,ItemcodeforLoading),CustomerName,CustomerCode,PONumber,PODate,POModifiedDate,POType,POScanedImage,HSNCode,SalesOrderNumber,
			POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,UnitCostorBasicPrice,PODeliveryDate,PODeliveryQty,
			TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,RealisticDeliveryDate,Comments,CustomerServiceLoadDay,PlanningLoadDay,
			Ageing,SamrajInvoiceDate,DispatchedQty,Dispatch100PercentorPartial,COT,LiveorRetired,Remarks,createdby,modifiedby,GETDATE(),GETDATE(),Status from @typPOMaster typ where typ.ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster])
			and typ.CustomerCode in (select CustomerCode from [dbo].[CustomerMaster])

			SELECT POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,POModifiedDate,POType,POScanedImage,HSNCode,SalesOrderNumber,
			POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,UnitCostorBasicPrice,PODeliveryDate,PODeliveryQty,
			TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,RealisticDeliveryDate,Comments,CustomerServiceLoadDay,PlanningLoadDay,
			Ageing,SamrajInvoiceDate,DispatchedQty,Dispatch100PercentorPartial,COT,LiveorRetired,Remarks,createdby,modifiedby,
			createddate,updateddate,Status FROM @typPOMaster typ where typ.ItemcodeforLoading not in (select itemcode from [dbo].[ItemMaster])
			or typ.CustomerCode not in (select CustomerCode from [dbo].[CustomerMaster])
		
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
/****** Object:  StoredProcedure [dbo].[spInsertPriceMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertPriceMaster]
@typPriceMaster AS dbo.typePriceMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[PriceMaster](Itemcode,Description,Referencestandard,EquivalentSamrajItemcode,Customer,CustomerCode,HSNCode,RevisionLevel,UOM,
			SUOM,BasicPrice,Taxset,Taxclass,FullAddress,createdby,modifiedby,createddate,updateddate) select Itemcode,Description,Referencestandard,EquivalentSamrajItemcode,Customer,CustomerCode,HSNCode,RevisionLevel,UOM,
			SUOM,BasicPrice,Taxset,Taxclass,FullAddress,createdby,modifiedby,GETDATE(),GETDATE() from @typPriceMaster typ where typ.Itemcode in (select itemcode from [dbo].[ItemMaster])
			and typ.CustomerCode in (select CustomerCode from [dbo].[CustomerMaster])

			SELECT Itemcode,Description,Referencestandard,EquivalentSamrajItemcode,Customer,CustomerCode,HSNCode,RevisionLevel,UOM,
			SUOM,BasicPrice,Taxset,Taxclass,FullAddress,createdby,modifiedby,createddate,updateddate FROM @typPriceMaster typ where typ.Itemcode not in (select itemcode from [dbo].[ItemMaster])
			or typ.CustomerCode not in (select CustomerCode from [dbo].[CustomerMaster])
		
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
/****** Object:  StoredProcedure [dbo].[spSelectAssemplyMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectAssemplyMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	select AssemblyIdentity,AssemblyNumber,AssemblyDescription,Itemcode,ItemcodeDescription,Qty,Remarks,createdby,modifiedby,createddate,
	updateddate from [dbo].[AssemblyMaster]   
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectBoughtOutReport]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectBoughtOutReport]
AS
BEGIN	
	SET NOCOUNT ON;	

	select a.Itemcode,b.description,a.lc1,a.lc2,a.FinalQty from [dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b 
	where a.Itemcode=b.itemcode and a.lc1=9 and a.lc2='B'

END
GO
/****** Object:  StoredProcedure [dbo].[spSelectComponentList]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectComponentList]
AS
BEGIN	
	SET NOCOUNT ON;	

	select a.Itemcode,b.description,c.RMCode,c.RMDescription,a.lc1,a.lc2,c.Size1,c.Size2,c.Size3,sum(a.FinalQty) 'FinalQty',b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15,b.finishtype,b.surfacepreparation,b.primercolour,b.primerDFT,b.IMOColour,b.IMODFT,b.TopCoatColour,b.TopCoatDFT,b.remarks
	from [dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b,[dbo].[ComponentMaster] c where a.Itemcode=b.itemcode and a.Itemcode=c.ItemCode group by a.Itemcode,b.description,c.RMCode,c.RMDescription,a.lc1,a.lc2,c.Size1,c.Size2,c.Size3,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15,b.finishtype,b.surfacepreparation,b.primercolour,b.primerDFT,b.IMOColour,b.IMODFT,b.TopCoatColour,b.TopCoatDFT,b.remarks

END
GO
/****** Object:  StoredProcedure [dbo].[spSelectComponentMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectComponentMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	SELECT [ItemCode]
      ,[Description]
      ,[RMCode]
      ,[RMDescription]
      ,[Size1]
      ,[Size2]
      ,[Size3]
      ,[Remarks]
      ,[createdby]
      ,[modifiedby]
      ,[createddate]
      ,[updateddate]
  FROM [IndustriesDB].[dbo].[ComponentMaster]  
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectConsolidationSummaryReport]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectConsolidationSummaryReport]
AS
BEGIN	
	SET NOCOUNT ON;	

	select a.Itemcode,b.description,a.lc1,a.lc2,a.Qty,a.FinalQty from [dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b where a.Itemcode=b.itemcode

END

GO
/****** Object:  StoredProcedure [dbo].[spSelectCustomerMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectCustomerMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	select NewCustomerCode,CustomerCode,CustomerName,HSNCode,GSTINNumber,Address,Paymentterms,Remarks,
	createdby,modifiedby,createddate,updateddate from [IndustriesDB].[dbo].[CustomerMaster]
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectItemMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectItemMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	select customername,customercode,itemcode,description,referencestandard,equivalentsamrajitemcode,liveorretired,
	revisionlevel,uom,suom,lc1,lc2,remarks,processrevisionlevel,process1 ,machine1 ,process2,machine2,
	process3,machine3,process4,machine4,process5,machine5,process6,machine6,process7,machine7,process8,
	machine8,process9,machine9,process10,machine10,process11,machine11,process12,machine12,process13,
	machine13,process14,machine14,process15,machine15,finishtype,surfacepreparation,primercolour,
	primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,SpecialFinishdetails,QualityFlagforLaserOrTPP,
	InspectionCriteriaforLaserOrTPP,QtytobeInspectedforLaserOrTPP,QualityFlagforOtherthanLaserOrTPP,
	InspectionCriteriaforOtherthanLaserOrTPP,QtytobeInspectedforOtherthanLaserOrTPP,Image1,Image2,GroupCode,
	Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,
	Locationoforigin,Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate 
	from dbo.ItemMaster

END

GO
/****** Object:  StoredProcedure [dbo].[spSelectItemMasterRM]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectItemMasterRM]
AS
BEGIN	
	SET NOCOUNT ON;	

	select [itemcode],[description],[liveorretired],[size1],[size2],[size3],[tables],[remarks],[uom],[suom],[GroupCode],
	[Inventorycode],[HandlingPerson1],[HandlingPerson2],[ClassificationCode],[ItemClassification],[Locationoforigin],
	[Engineeringissuelevel],[RawmaterialSpecifications],[createdby],[modifiedby],[createddate],[updateddate]
    FROM [IndustriesDB].[dbo].[ItemMasterRM]
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectLoadDayList]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectLoadDayList]
AS
BEGIN	
	SET NOCOUNT ON;	

	select a.PODeliveryDate,a.POItemcode,a.ITEMDESCRIPTION,a.PODeliveryQty,a.PONumber from [dbo].[POMaster] a,[dbo].[ConsolidatedReport] b
	where a.PONumber=b.PONumber and a.ItemcodeforLoading=b.Itemcode and a.PlanningLoadDay=b.LoadDay
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectPOMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectPOMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	select POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,POModifiedDate,POType,POScanedImage,
HSNCode,SalesOrderNumber,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,UnitCostorBasicPrice,PODeliveryDate,
PODeliveryQty,TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,RealisticDeliveryDate,Comments,
CustomerServiceLoadDay,PlanningLoadDay,Ageing,SamrajInvoiceDate,DispatchedQty,Dispatch100PercentorPartial,COT,
LiveorRetired,Remarks,Status,createdby,modifiedby,createddate,updateddate from dbo.POMaster

END

GO
/****** Object:  StoredProcedure [dbo].[spSelectPriceMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spSelectPriceMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	SELECT Itemcode,Description,Referencestandard,EquivalentSamrajItemcode,Customer,CustomerCode,HSNCode,RevisionLevel,UOM,
    SUOM,BasicPrice,Taxset,Taxclass,FullAddress,createdby,modifiedby,createddate,updateddate FROM [IndustriesDB].[dbo].[PriceMaster]
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectProcessList]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectProcessList]
AS
BEGIN	
	SET NOCOUNT ON;	

	select a.Itemcode,b.description,a.lc1,a.lc2,sum(a.FinalQty) 'FinalQty',b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15 
	from [dbo].[ConsolidatedReport] a,[dbo].[ItemMaster] b where a.Itemcode=b.itemcode group by a.Itemcode,b.description,a.lc1,a.lc2,b.process1,b.process2,b.process3,b.process4,b.process5,b.process6,b.process7,b.process8,b.process9,b.process10,b.process11,b.process12,b.process13,b.process14,b.process15

END

GO
/****** Object:  StoredProcedure [dbo].[spSelectRMConsolidationReport]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectRMConsolidationReport]
AS
BEGIN		
	select b.RMCode,b.RMDescription,b.Size1,b.Size2,b.Size3,c.tables,d.ScrapPercent,sum(a.FinalQty) 'Qty',
			CASE
				WHEN c.tables=1 THEN 'Sq-m'
				WHEN c.tables=2 THEN 'm'
			END AS SUOM,
			CASE
				WHEN c.tables=1 THEN (cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000 
				ELSE cast(b.Size3 as DECIMAL(10, 6))/1000
			END AS Table1OrTable2,
			CASE
				WHEN c.tables=1 THEN ((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100
				ELSE (cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100
			END AS AddPercent,
			CASE
				WHEN c.tables=1 THEN ((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100)
				ELSE (cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100)
			END AS Total,
			CASE
				WHEN c.tables=1 THEN (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*sum(a.FinalQty)
				ELSE ((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*sum(a.FinalQty)
			END AS TotalwithQty,c.size2 'RMS2',c.size3 'RMS3',
			(cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000 'InMetres',
			CASE
				WHEN c.tables=1 THEN ((((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*sum(a.FinalQty))/((cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000)
				ELSE ((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*sum(a.FinalQty)
			END AS NumberOfSheetsOrLengthRequired
			from [dbo].[ConsolidatedReport] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
			where a.Itemcode=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType
			group by a.Itemcode,b.RMCode,b.RMDescription,b.Size1,b.Size2,b.Size3,c.tables,d.ScrapPercent,c.size2,c.size3
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectStoreReportTable1]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectStoreReportTable1]
AS
BEGIN	
	SET NOCOUNT ON;	

	WITH Report	AS (
	select b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,			
	((((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000) + (((cast(b.Size2 as DECIMAL(10, 6))*cast(b.Size3 as DECIMAL(10, 6)))/1000000)*d.ScrapPercent/100))*sum(a.FinalQty))/((cast(c.size2 as DECIMAL(10, 6))*cast(c.size3 as DECIMAL(10, 6)))/1000000) 'NumberOfSheetsOrLengthRequired'
	from [dbo].[ConsolidatedReport] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
	where a.Itemcode=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and c.tables=1
	group by a.Itemcode,b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,b.Size2,b.Size3,d.ScrapPercent
	)
	select RMCode,RMDescription,size1,size2,size3,tables,sum(NumberOfSheetsOrLengthRequired) 'NumberOfSheetsRequiredinNumbers', 
	null 'NumberOfSheetsPerNesting',null 'NumberOfSheetsIssued',null 'Remarks'
	from Report group by RMCode,RMDescription,size1,size2,size3,tables

END

GO
/****** Object:  StoredProcedure [dbo].[spSelectStoreReportTable2]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectStoreReportTable2]
AS
BEGIN	
	SET NOCOUNT ON;	

	WITH Report	AS (
	select b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,
	((cast(b.Size3 as DECIMAL(10, 6))/1000) + ((cast(b.Size3 as DECIMAL(10, 6))/1000)*d.ScrapPercent/100))*sum(a.FinalQty) 'NumberOfSheetsOrLengthRequired'			
	from [dbo].[ConsolidatedReport] a,[dbo].[ComponentMaster] b,[dbo].[ItemMasterRM] c,[dbo].[TableMaster] d
	where a.Itemcode=b.ItemCode and b.RMCode=c.itemcode and c.tables=d.TableType and c.tables=2
	group by a.Itemcode,b.RMCode,b.RMDescription,c.size1,c.size2,c.size3,c.tables,b.Size2,b.Size3,d.ScrapPercent
	)
	select RMCode,RMDescription,size1,size2,size3,tables,sum(NumberOfSheetsOrLengthRequired) 'LengthRequiredinMetre', 
	null 'NumberOfSheetsIssued',null 'Remarks'
	from Report group by RMCode,RMDescription,size1,size2,size3,tables

END
GO
/****** Object:  StoredProcedure [dbo].[spSelectUnApprovedList]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectUnApprovedList]
AS
BEGIN	
	SET NOCOUNT ON;	

	select POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,POModifiedDate,POType,POScanedImage,
HSNCode,SalesOrderNumber,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,UnitCostorBasicPrice,PODeliveryDate,
PODeliveryQty,TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,RealisticDeliveryDate,Comments,
CustomerServiceLoadDay,PlanningLoadDay,Ageing,SamrajInvoiceDate,DispatchedQty,Dispatch100PercentorPartial,COT,
LiveorRetired,Remarks,Status,createdby,modifiedby,createddate,updateddate from dbo.POMaster where Status is null
END

GO
/****** Object:  StoredProcedure [dbo].[spSelectUnLoaddayList]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spSelectUnLoaddayList]
AS
BEGIN	
	SET NOCOUNT ON;	

	select POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,POModifiedDate,POType,POScanedImage,
HSNCode,SalesOrderNumber,POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,UnitCostorBasicPrice,PODeliveryDate,
PODeliveryQty,TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,RealisticDeliveryDate,Comments,
CustomerServiceLoadDay,PlanningLoadDay,Ageing,SamrajInvoiceDate,DispatchedQty,Dispatch100PercentorPartial,COT,
LiveorRetired,Remarks,Status,createdby,modifiedby,createddate,updateddate from dbo.POMaster 
where Status='Approved' and (PlanningLoadDay='1900-01-01' or PlanningLoadDay is null or PlanningLoadDay='')
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateAssemplyMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateAssemplyMaster]
@typAssemply AS dbo.typeAssemblyMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			Insert into [dbo].[AssemblyMasterHistory]([AssemblyNumber],[AssemblyDescription],[Itemcode],[ItemcodeDescription],[Qty],
			[Remarks],[createdby],[modifiedby],[createddate],[updateddate]) select AssemblyNumber,AssemblyDescription,
			Itemcode,ItemcodeDescription,Qty,Remarks,createdby,modifiedby,createddate,updateddate from [dbo].[AssemblyMaster]
			where AssemblyNumber in (select AssemblyNumber from @typAssemply typ where typ.Itemcode in (select itemcode from [dbo].[ItemMaster]) and typ.AssemblyNumber in (select itemcode from [dbo].[ItemMaster]))

			delete from [dbo].[AssemblyMaster] where AssemblyNumber in (select AssemblyNumber from @typAssemply typ where typ.Itemcode in (select itemcode from [dbo].[ItemMaster]) and typ.AssemblyNumber in (select itemcode from [dbo].[ItemMaster]))

			insert into [dbo].[AssemblyMaster]([AssemblyNumber],[AssemblyDescription],[Itemcode],[ItemcodeDescription],[Qty],
			[Remarks],[createdby],[modifiedby],[createddate],[updateddate]) select AssemblyNumber,AssemblyDescription,
			Itemcode,ItemcodeDescription,Qty,Remarks,createdby,modifiedby,GETDATE(),GETDATE() from @typAssemply typ
			where typ.Itemcode in (select itemcode from [dbo].[ItemMaster]) and typ.AssemblyNumber in (select itemcode from [dbo].[ItemMaster])

			select typ.AssemblyIdentity,typ.AssemblyNumber,typ.AssemblyDescription,typ.Itemcode,typ.ItemcodeDescription,typ.Qty,typ.Remarks,typ.createdby,typ.modifiedby,typ.createddate,
			typ.updateddate from @typAssemply typ where typ.Itemcode not in (select itemcode from [dbo].[ItemMaster]) or typ.AssemblyNumber not in (select itemcode from [dbo].[ItemMaster])

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
/****** Object:  StoredProcedure [dbo].[spUpdateComponentMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateComponentMaster]
@typComponentMaster AS dbo.typeComponentMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			Insert into [dbo].[ComponentMasterHistory](ItemCode,Description,RMCode,RMDescription,Size1,Size2,
			Size3,Remarks,createdby,modifiedby,createddate,updateddate) select ItemCode,Description,RMCode,RMDescription,Size1,Size2,
			Size3,Remarks,createdby,modifiedby,createddate,updateddate from [dbo].[ComponentMaster]
			where ItemCode in (select ItemCode from @typComponentMaster typ where typ.ItemCode in (select itemcode from [dbo].[ItemMaster])
			and typ.RMCode in (select itemcode from [dbo].[ItemMasterRM]))

			update [dbo].[ComponentMaster] set ItemCode=typ.ItemCode,Description=typ.Description,RMCode=typ.RMCode,RMDescription=typ.RMDescription,Size1=typ.Size1,Size2=typ.Size2,
			Size3=typ.Size3,Remarks=typ.Remarks,createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE() from @typComponentMaster typ
			where [dbo].[ComponentMaster].ItemCode=typ.ItemCode and typ.Itemcode in (select itemcode from [dbo].[ItemMaster])
			and typ.RMCode in (select itemcode from [dbo].[ItemMasterRM])

			select ItemCode,Description,RMCode,RMDescription,Size1,Size2,Size3,Remarks,createdby,modifiedby,createddate,updateddate 
			from @typComponentMaster typ where typ.Itemcode not in (select itemcode from [dbo].[ItemMaster])
			or typ.RMCode not in (select itemcode from [dbo].[ItemMasterRM]) 

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
/****** Object:  StoredProcedure [dbo].[spUpdateCustomerMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateCustomerMaster]
@typCustomerMaster AS dbo.typeCustomerMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			insert into [dbo].[CustomerMasterHistory] (NewCustomerCode,CustomerCode,CustomerName,HSNCode,GSTINNumber,Address,Paymentterms,Remarks,
			createdby,modifiedby,createddate,updateddate) select NewCustomerCode,CustomerCode,CustomerName,HSNCode,GSTINNumber,Address,Paymentterms,Remarks,
			createdby,modifiedby,createddate,updateddate from [dbo].[CustomerMaster] where NewCustomerCode in (select NewCustomerCode from @typCustomerMaster)
			
			update [dbo].[CustomerMaster] set NewCustomerCode=typ.NewCustomerCode,CustomerCode=typ.CustomerCode,CustomerName=typ.CustomerName,
			HSNCode=typ.HSNCode,GSTINNumber=typ.GSTINNumber,Address=typ.Address,Paymentterms=typ.Paymentterms,Remarks=typ.Remarks,
			createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE() from @typCustomerMaster typ
			where [dbo].[CustomerMaster].NewCustomerCode=typ.NewCustomerCode

			select NewCustomerCode,CustomerCode,CustomerName,HSNCode,GSTINNumber,Address,Paymentterms,Remarks,
			createdby,modifiedby,createddate,updateddate from @typCustomerMaster typ where typ.NewCustomerCode not in (select NewCustomerCode from [dbo].[CustomerMaster])

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
/****** Object:  StoredProcedure [dbo].[spUpdateItemMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateItemMaster]
@typItemMaster AS dbo.typeItemMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			Insert into [dbo].[ItemMasterHistory](customername,customercode,itemcode,description,referencestandard,equivalentsamrajitemcode,liveorretired,
			revisionlevel,uom,suom,lc1,lc2,remarks,processrevisionlevel,process1 ,machine1 ,process2,machine2,
			process3,machine3,process4,machine4,process5,machine5,process6,machine6,process7,machine7,process8,
			machine8,process9,machine9,process10,machine10,process11,machine11,process12,machine12,process13,
			machine13,process14,machine14,process15,machine15,finishtype,surfacepreparation,primercolour,
			primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,SpecialFinishdetails,QualityFlagforLaserOrTPP,
			InspectionCriteriaforLaserOrTPP,QtytobeInspectedforLaserOrTPP,QualityFlagforOtherthanLaserOrTPP,
			InspectionCriteriaforOtherthanLaserOrTPP,QtytobeInspectedforOtherthanLaserOrTPP,Image1,Image2,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,
			Locationoforigin,Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate) 
			select customername,customercode,itemcode,description,referencestandard,equivalentsamrajitemcode,liveorretired,
			revisionlevel,uom,suom,lc1,lc2,remarks,processrevisionlevel,process1 ,machine1 ,process2,machine2,
			process3,machine3,process4,machine4,process5,machine5,process6,machine6,process7,machine7,process8,
			machine8,process9,machine9,process10,machine10,process11,machine11,process12,machine12,process13,
			machine13,process14,machine14,process15,machine15,finishtype,surfacepreparation,primercolour,
			primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,SpecialFinishdetails,QualityFlagforLaserOrTPP,
			InspectionCriteriaforLaserOrTPP,QtytobeInspectedforLaserOrTPP,QualityFlagforOtherthanLaserOrTPP,
			InspectionCriteriaforOtherthanLaserOrTPP,QtytobeInspectedforOtherthanLaserOrTPP,Image1,Image2,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,
			Locationoforigin,Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate from [dbo].[ItemMaster]
			where itemcode in (select itemcode from @typItemMaster where customercode in (select CustomerCode from [dbo].[CustomerMaster]))

			update [dbo].[ItemMaster] set customername=typ.customername,customercode=typ.customercode,itemcode=typ.itemcode,
			description=typ.description,referencestandard=typ.referencestandard,equivalentsamrajitemcode=typ.equivalentsamrajitemcode,liveorretired=typ.liveorretired,
			revisionlevel=typ.revisionlevel,uom=typ.uom,suom=typ.suom,lc1=typ.lc1,lc2=typ.lc2,remarks=typ.remarks,
			processrevisionlevel=typ.processrevisionlevel,process1 =typ.process1,machine1 =typ.machine1,process2=typ.process2,
			machine2=typ.machine2,process3=typ.process3,machine3=typ.machine3,process4=typ.process4,machine4=typ.machine4,
			process5=typ.process5,machine5=typ.machine5,process6=typ.process6,machine6=typ.machine6,process7=typ.process7,
			machine7=typ.machine7,process8=typ.process8,machine8=typ.machine8,process9=typ.process9,machine9=typ.machine9,
			process10=typ.process10,machine10=typ.machine10,process11=typ.process11,machine11=typ.machine11,process12=typ.process12,
			machine12=typ.machine12,process13=typ.process13,machine13=typ.machine13,process14=typ.process14,machine14=typ.machine14,
			process15=typ.process15,machine15=typ.machine15,finishtype=typ.finishtype,surfacepreparation=typ.surfacepreparation,primercolour=typ.primercolour,
			primerDFT=typ.primerDFT,IMOColour=typ.IMOColour,IMODFT=typ.IMODFT,TopCoatColour=typ.TopCoatColour,TopCoatDFT=typ.TopCoatDFT,
			SpecialFinishdetails=typ.SpecialFinishdetails,QualityFlagforLaserOrTPP=typ.QualityFlagforLaserOrTPP,
			InspectionCriteriaforLaserOrTPP=typ.InspectionCriteriaforLaserOrTPP,QtytobeInspectedforLaserOrTPP=typ.QtytobeInspectedforLaserOrTPP,
			QualityFlagforOtherthanLaserOrTPP=typ.QualityFlagforOtherthanLaserOrTPP,InspectionCriteriaforOtherthanLaserOrTPP=typ.InspectionCriteriaforOtherthanLaserOrTPP,
			QtytobeInspectedforOtherthanLaserOrTPP=typ.QtytobeInspectedforOtherthanLaserOrTPP,Image1=typ.Image1,Image2=typ.Image2,
			GroupCode=typ.GroupCode,Inventorycode=typ.Inventorycode,HandlingPerson1=typ.HandlingPerson1,HandlingPerson2=typ.HandlingPerson2,
			ClassificationCode=typ.ClassificationCode,ItemClassification=typ.ItemClassification,
			Locationoforigin=typ.Locationoforigin,Engineeringissuelevel=typ.Engineeringissuelevel,RawmaterialSpecifications=typ.RawmaterialSpecifications,
			createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE() from @typItemMaster typ
			where [dbo].[ItemMaster].itemcode=typ.itemcode and typ.customercode in (select CustomerCode from [dbo].[CustomerMaster])

			select customername,customercode,itemcode,description,referencestandard,equivalentsamrajitemcode,liveorretired,
			revisionlevel,uom,suom,lc1,lc2,remarks,processrevisionlevel,process1 ,machine1 ,process2,machine2,
			process3,machine3,process4,machine4,process5,machine5,process6,machine6,process7,machine7,process8,
			machine8,process9,machine9,process10,machine10,process11,machine11,process12,machine12,process13,
			machine13,process14,machine14,process15,machine15,finishtype,surfacepreparation,primercolour,
			primerDFT,IMOColour,IMODFT,TopCoatColour,TopCoatDFT,SpecialFinishdetails,QualityFlagforLaserOrTPP,
			InspectionCriteriaforLaserOrTPP,QtytobeInspectedforLaserOrTPP,QualityFlagforOtherthanLaserOrTPP,
			InspectionCriteriaforOtherthanLaserOrTPP,QtytobeInspectedforOtherthanLaserOrTPP,Image1,Image2,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,
			Locationoforigin,Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate 
			from @typItemMaster typ where typ.customercode not in (select CustomerCode from [dbo].[CustomerMaster]) 

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
/****** Object:  StoredProcedure [dbo].[spUpdateItemMasterRM]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateItemMasterRM]
@typItemMasterRM AS dbo.typeItemMasterRM READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			Insert into [dbo].[ItemMasterRMHistory](itemcode,description,liveorretired,size1,size2,size3,tables,remarks,uom,suom,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,Locationoforigin,
			Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate) select itemcode,description,liveorretired,size1,size2,size3,tables,remarks,uom,suom,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,Locationoforigin,
			Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate from [dbo].[ItemMasterRM]
			where itemcode in (select itemcode from @typItemMasterRM)

			update [dbo].[ItemMasterRM] set itemcode=typ.itemcode,description=typ.description,liveorretired=typ.liveorretired,
			size1=typ.size1,size2=typ.size2,size3=typ.size3,tables=typ.tables,remarks=typ.remarks,uom=typ.uom,suom=typ.suom,GroupCode=typ.GroupCode,
			Inventorycode=typ.Inventorycode,HandlingPerson1=typ.HandlingPerson1,HandlingPerson2=typ.HandlingPerson2,
			ClassificationCode=typ.ClassificationCode,ItemClassification=typ.ItemClassification,Locationoforigin=typ.Locationoforigin,
			Engineeringissuelevel=typ.Engineeringissuelevel,RawmaterialSpecifications=typ.RawmaterialSpecifications,
			createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE() from @typItemMasterRM typ
			where [dbo].[ItemMasterRM].itemcode=typ.itemcode 

			select itemcode,description,liveorretired,size1,size2,size3,tables,remarks,uom,suom,GroupCode,
			Inventorycode,HandlingPerson1,HandlingPerson2,ClassificationCode,ItemClassification,Locationoforigin,
			Engineeringissuelevel,RawmaterialSpecifications,createdby,modifiedby,createddate,updateddate 
			from @typItemMasterRM typ where typ.itemcode not in (select itemcode from [dbo].[ItemMasterRM]) 

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
/****** Object:  StoredProcedure [dbo].[spUpdatePOMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdatePOMaster]
@typPOMaster AS dbo.typePOMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			Insert into [dbo].[POMasterHistory](POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,POModifiedDate,POType,POScanedImage,HSNCode,SalesOrderNumber,
			POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,UnitCostorBasicPrice,PODeliveryDate,PODeliveryQty,
			TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,RealisticDeliveryDate,Comments,CustomerServiceLoadDay,PlanningLoadDay,
			Ageing,SamrajInvoiceDate,DispatchedQty,Dispatch100PercentorPartial,COT,LiveorRetired,Remarks,createdby,modifiedby,
			createddate,updateddate,Status) select POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,POModifiedDate,POType,POScanedImage,HSNCode,SalesOrderNumber,
			POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,UnitCostorBasicPrice,PODeliveryDate,PODeliveryQty,
			TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,RealisticDeliveryDate,Comments,CustomerServiceLoadDay,PlanningLoadDay,
			Ageing,SamrajInvoiceDate,DispatchedQty,Dispatch100PercentorPartial,COT,LiveorRetired,Remarks,createdby,modifiedby,
			createddate,updateddate,Status from [dbo].[POMaster] where ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster])	and CustomerCode in (select CustomerCode from [dbo].[CustomerMaster])

			update [dbo].[POMaster] set POwithItemCode=CONCAT(typ.PONumber,typ.ItemcodeforLoading),CustomerName=typ.CustomerName,CustomerCode=typ.CustomerCode,PONumber=typ.PONumber,PODate=typ.PODate,POModifiedDate=typ.POModifiedDate,POType=typ.POType,POScanedImage=typ.POScanedImage,HSNCode=typ.HSNCode,SalesOrderNumber=typ.SalesOrderNumber,
			POItemcode=typ.POItemcode,ItemcodeforLoading=typ.ItemcodeforLoading,ITEMDESCRIPTION=typ.ITEMDESCRIPTION,RevisionLevel=typ.RevisionLevel,UnitCostorBasicPrice=typ.UnitCostorBasicPrice,PODeliveryDate=typ.PODeliveryDate,PODeliveryQty=typ.PODeliveryQty,
			TotalSalePrice=typ.TotalSalePrice,UOM=typ.UOM,SUOM=typ.SUOM,TaxSet=typ.TaxSet,TaxClass=typ.TaxClass,FullAddress=typ.FullAddress,RealisticDeliveryDate=typ.RealisticDeliveryDate,Comments=typ.Comments,CustomerServiceLoadDay=typ.CustomerServiceLoadDay,PlanningLoadDay=typ.PlanningLoadDay,
			Ageing=typ.Ageing,SamrajInvoiceDate=typ.SamrajInvoiceDate,DispatchedQty=typ.DispatchedQty,Dispatch100PercentorPartial=typ.Dispatch100PercentorPartial,COT=typ.COT,LiveorRetired=typ.LiveorRetired,Remarks=typ.Remarks,createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE(),Status=typ.Status from @typPOMaster typ
			where [dbo].[POMaster].ItemcodeforLoading=typ.ItemcodeforLoading and [dbo].[POMaster].PONumber=typ.PONumber and typ.ItemcodeforLoading in (select itemcode from [dbo].[ItemMaster])
			and typ.CustomerCode in (select CustomerCode from [dbo].[CustomerMaster])

			SELECT POwithItemCode,CustomerName,CustomerCode,PONumber,PODate,POModifiedDate,POType,POScanedImage,HSNCode,SalesOrderNumber,
			POItemcode,ItemcodeforLoading,ITEMDESCRIPTION,RevisionLevel,UnitCostorBasicPrice,PODeliveryDate,PODeliveryQty,
			TotalSalePrice,UOM,SUOM,TaxSet,TaxClass,FullAddress,RealisticDeliveryDate,Comments,CustomerServiceLoadDay,PlanningLoadDay,
			Ageing,SamrajInvoiceDate,DispatchedQty,Dispatch100PercentorPartial,COT,LiveorRetired,Remarks,createdby,modifiedby,
			createddate,updateddate,Status FROM @typPOMaster typ where typ.ItemcodeforLoading not in (select itemcode from [dbo].[ItemMaster])
			or typ.CustomerCode not in (select CustomerCode from [dbo].[CustomerMaster]) 

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
/****** Object:  StoredProcedure [dbo].[spUpdatePriceMaster]    Script Date: 17-11-2021 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdatePriceMaster]
@typPriceMaster AS dbo.typePriceMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			Insert into [dbo].[PriceMasterHistory](Itemcode,Description,Referencestandard,EquivalentSamrajItemcode,Customer,CustomerCode,HSNCode,RevisionLevel,UOM,
			SUOM,BasicPrice,Taxset,Taxclass,FullAddress,createdby,modifiedby,createddate,updateddate) select Itemcode,Description,Referencestandard,EquivalentSamrajItemcode,Customer,CustomerCode,HSNCode,RevisionLevel,UOM,
			SUOM,BasicPrice,Taxset,Taxclass,FullAddress,createdby,modifiedby,createddate,updateddate from [dbo].[PriceMaster]
			where ItemCode in (select itemcode from [dbo].[ItemMaster])	and CustomerCode in (select CustomerCode from [dbo].[CustomerMaster])

			update [dbo].[PriceMaster] set Itemcode=typ.Itemcode,Description=typ.Description,Referencestandard=typ.Referencestandard,EquivalentSamrajItemcode=typ.EquivalentSamrajItemcode,Customer=typ.Customer,CustomerCode=typ.CustomerCode,HSNCode=typ.HSNCode,RevisionLevel=typ.RevisionLevel,UOM=typ.UOM,
			SUOM=typ.SUOM,BasicPrice=typ.BasicPrice,Taxset=typ.Taxset,Taxclass=typ.Taxclass,FullAddress=typ.FullAddress,createdby=typ.createdby,modifiedby=typ.modifiedby,createddate=GETDATE(),updateddate=GETDATE() from @typPriceMaster typ
			where [dbo].[PriceMaster].ItemCode=typ.ItemCode and typ.Itemcode in (select itemcode from [dbo].[ItemMaster])
			and typ.CustomerCode in (select CustomerCode from [dbo].[CustomerMaster])

			SELECT Itemcode,Description,Referencestandard,EquivalentSamrajItemcode,Customer,CustomerCode,HSNCode,RevisionLevel,UOM,
			SUOM,BasicPrice,Taxset,Taxclass,FullAddress,createdby,modifiedby,createddate,updateddate FROM @typPriceMaster typ where typ.Itemcode not in (select itemcode from [dbo].[ItemMaster])
			or typ.CustomerCode not in (select CustomerCode from [dbo].[CustomerMaster]) 

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
