USE [IndustriesDB]
GO
/****** Object:  Table [dbo].[SACConsolidatedReport]    Script Date: 08-08-2022 19:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SACConsolidatedReport](
	[ConsolidatedReportIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Itemcode] [varchar](100) NULL,
	[Qty] [int] NULL,
	[lc1] [int] NULL,
	[lc2] [varchar](1) NULL,
	[level] [int] NULL,
	[PrevRoot] [varchar](100) NULL,
	[Root] [varchar](100) NULL,
	[FinalQty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ConsolidatedReportIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spSAConsolidateReport]    Script Date: 08-08-2022 19:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSAConsolidateReport]
@POitemcode varchar(75),
@POqty int
AS
BEGIN	
	SET NOCOUNT ON;	

	BEGIN TRY
		BEGIN TRANSACTION
			
			delete from dbo.SACConsolidatedReport
			create table LevelTableOrg(Itemcode varchar(75))
			create table LevelTableDup(Itemcode varchar(75))		
			DECLARE @AssemblyNumber varchar(75),@lc1 int,@lc2 varchar(1),@level int,@POLevelitemcode varchar(75),@POLevelqty int,@Levellc1 int,@Levellc2 varchar(1),@Parentitemcode varchar(75),@Count int,@AssemplyQty int;
			
			set @level=0	
				SELECT @lc1 = (select lc1 from [dbo].[ItemMaster] where itemcode=@POitemcode) 
				SELECT @lc2 = (select lc2 from [dbo].[ItemMaster] where itemcode=@POitemcode)

				insert into dbo.SACConsolidatedReport(Itemcode,Qty,lc1,lc2,level,PrevRoot,Root,FinalQty) values (@POitemcode,@POqty,@lc1,@lc2,@level,null,null,@POqty)
				
				delete from LevelTableOrg
				insert into LevelTableOrg values(@POitemcode)
				set @Count=1

				IF @lc1 = 2 and @lc2='F'
				BEGIN
					WHILE ( @Count > 0)
					BEGIN										
						DECLARE SACLevel_cursor CURSOR FOR select a.Itemcode,a.Qty,a.AssemblyNumber from dbo.AssemblyMaster a,LevelTableOrg b where a.AssemblyNumber=b.Itemcode
						OPEN SACLevel_cursor
						FETCH NEXT FROM SACLevel_cursor INTO @POLevelitemcode,@POLevelqty,@AssemblyNumber						
						
						set @level=@level+1						

						WHILE @@FETCH_STATUS = 0
						BEGIN
							Set	@Parentitemcode=@AssemblyNumber
							IF @level=1
							begin
								SELECT @AssemplyQty=(select top 1 FinalQty from dbo.SACConsolidatedReport where Itemcode=@AssemblyNumber and Root is null)
							end
							IF @level>1
							begin
								SELECT @AssemplyQty=(select top 1 FinalQty from dbo.SACConsolidatedReport where Itemcode=@AssemblyNumber and Root=@POitemcode)
							end
							SELECT @Levellc1 = (select lc1 from [dbo].[ItemMaster] where itemcode=@POLevelitemcode) 
							SELECT @Levellc2 = (select lc2 from [dbo].[ItemMaster] where itemcode=@POLevelitemcode)

							insert into dbo.SACConsolidatedReport(Itemcode,Qty,lc1,lc2,level,PrevRoot,Root,FinalQty) values (@POLevelitemcode,@POLevelqty,@Levellc1,@Levellc2,@level,@Parentitemcode,@POitemcode,@AssemplyQty*@POLevelqty)

							IF @Levellc1 = 2 and @Levellc2='F'
							BEGIN
								insert into LevelTableDup values(@POLevelitemcode)
							END

							FETCH NEXT FROM SACLevel_cursor INTO @POLevelitemcode,@POLevelqty,@AssemblyNumber
						END

						delete from LevelTableOrg
						SELECT @Count=(select count(Itemcode) from LevelTableDup)
						--print 'Count:' + CAST(@Count as varchar(10))
						insert into LevelTableOrg select * from LevelTableDup
						delete from LevelTableDup

						CLOSE SACLevel_cursor;
						DEALLOCATE SACLevel_cursor;
					END --whille
				END --if
			drop table LevelTableOrg
			drop table LevelTableDup

			select Itemcode,FinalQty 'Qty',lc1,lc2 from dbo.SACConsolidatedReport where Root is not null

		COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH	
	CLOSE SACLevel_cursor;
	DEALLOCATE SACLevel_cursor;
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
		
        DECLARE @Message nvarchar(2048) = ERROR_MESSAGE();
        DECLARE @Severity integer = ERROR_SEVERITY();
        DECLARE @State integer = ERROR_STATE();

        RAISERROR(@Message, @Severity, @State);
        RETURN -1;
  END CATCH
END


GO
