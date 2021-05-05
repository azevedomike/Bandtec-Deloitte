USE [DATABASE_EVENTS]
GO
/****** Object:  StoredProcedure [dbo].[all_ShrinkLogsJob]    Script Date: 28/01/2021 09:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[all_ShrinkLogsJob]
AS
BEGIN

SET NOCOUNT ON 

DECLARE @name1 varchar(100), @cmd VARCHAR(1000),@cmd1 VARCHAR(1000)
	select
			name
		into #tblDatabases
		from master.sys.sysdatabases
		where name <> 'master' and name <> 'tempdb' and name <> 'model' and name <> 'msdb'

					while exists(select top 1 name from #tblDatabases) 
					
					
						begin 

						


							SELECT  @name1 = name FROM #tblDatabases

							SET @cmd = '								

								USE '+@name1+'											

								DECLARE  @log VARCHAR(100)

								SELECT @log = name FROM SYSFILES WHERE groupid = 0

								DBCC SHRINKFILE(@log, 1)
							'

							EXEC (@cmd)



							DELETE FROM #tblDatabases WHERE name = @name1
						END
			
END