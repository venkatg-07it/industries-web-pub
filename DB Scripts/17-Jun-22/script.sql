USE [IndustriesDB]
GO
/****** Object:  UserDefinedTableType [dbo].[typeLoginForms]    Script Date: 25-05-2022 10:22:42 ******/
CREATE TYPE [dbo].[typeLoginForms] AS TABLE(
	[LoginId] [varchar](150) NULL,
	[FormAccess] [nvarchar](max) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[typeLoginMaster]    Script Date: 25-05-2022 10:22:42 ******/
CREATE TYPE [dbo].[typeLoginMaster] AS TABLE(
	[Username] [varchar](200) NULL,
	[LoginId] [varchar](150) NULL,
	[Department] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[LoginForms]    Script Date: 25-05-2022 10:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginForms](
	[LoginId] [varchar](150) NOT NULL,
	[FormAccess] [nvarchar](max) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginMaster]    Script Date: 25-05-2022 10:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginMaster](
	[Username] [varchar](200) NULL,
	[LoginId] [varchar](150) NOT NULL,
	[Department] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[LiveorRetired] [varchar](1) NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spDeleteLoginForms]    Script Date: 25-05-2022 10:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spDeleteLoginForms]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[LoginForms]
END



GO
/****** Object:  StoredProcedure [dbo].[spDeleteLoginMaster]    Script Date: 25-05-2022 10:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spDeleteLoginMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	delete from [dbo].[LoginMaster]
END


GO
/****** Object:  StoredProcedure [dbo].[spInsertLoginForms]    Script Date: 25-05-2022 10:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spInsertLoginForms]
@typLoginForms AS dbo.typeLoginForms READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[LoginForms](LoginId,FormAccess,createddate,updateddate) 
			select LoginId,FormAccess,GETDATE(),GETDATE() 
			from @typLoginForms;

			select * from @typLoginForms;			

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
/****** Object:  StoredProcedure [dbo].[spInsertLoginMaster]    Script Date: 25-05-2022 10:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spInsertLoginMaster]
@typLoginMaster AS dbo.typeLoginMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION

			insert into [dbo].[LoginMaster](Username,LoginId,Department,Password,LiveorRetired,createddate,updateddate) 
			select Username,LoginId,Department,Password,LiveorRetired,GETDATE(),GETDATE() 
			from @typLoginMaster;
			
			select * from @typLoginMaster;			

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
/****** Object:  StoredProcedure [dbo].[spSelectLoginForms]    Script Date: 25-05-2022 10:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[spSelectLoginForms]
AS
BEGIN	
	SET NOCOUNT ON;	

	select LoginId,FormAccess,createddate,updateddate 
	from [IndustriesDB].[dbo].[LoginForms]
	
END


GO
/****** Object:  StoredProcedure [dbo].[spSelectLoginMaster]    Script Date: 25-05-2022 10:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spSelectLoginMaster]
AS
BEGIN	
	SET NOCOUNT ON;	

	select Username,LoginId,Department,Password,LiveorRetired,createddate,updateddate 
	from [IndustriesDB].[dbo].[LoginMaster]
	
END


GO
/****** Object:  StoredProcedure [dbo].[spUpdateLoginForms]    Script Date: 25-05-2022 10:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spUpdateLoginForms]
@typLoginForms AS dbo.typeLoginForms READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
					
			update [dbo].[LoginForms] set LoginId=typ.LoginId,FormAccess=typ.FormAccess,createddate=GETDATE(),updateddate=GETDATE()
			from @typLoginForms typ where [dbo].[LoginForms].LoginId=typ.LoginId;
			select * from @typLoginForms;

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
/****** Object:  StoredProcedure [dbo].[spUpdateLoginMaster]    Script Date: 25-05-2022 10:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spUpdateLoginMaster]
@typLoginMaster AS dbo.typeLoginMaster READONLY
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
					
			update [dbo].[LoginMaster] set Username=typ.Username,LoginId=typ.LoginId,Department=typ.Department,Password=typ.Password,LiveorRetired=typ.LiveorRetired,createddate=GETDATE(),updateddate=GETDATE()
			from @typLoginMaster typ where [dbo].[LoginMaster].LoginId=typ.LoginId;
			
			select * from @typLoginMaster;

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
