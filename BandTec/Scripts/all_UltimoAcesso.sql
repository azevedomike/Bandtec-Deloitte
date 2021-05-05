USE [database_events]
GO

/****** Object:  StoredProcedure [dbo].[all_UltimoAcesso]    Script Date: 15/10/2020 10:24:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[all_UltimoAcesso]

AS

BEGIN



SELECT NAME
INTO #tblDatabase
FROM SYS.DATABASES WHERE state_desc = 'ONLINE'


WHILE EXISTS (SELECT TOP 1 1 FROM #tblDatabase)
BEGIN
DECLARE @name varchar(255),@cmd varchar(max)

SELECT @name = NAME FROM #tblDatabase


set @cmd = 'use ['+@name+']
DECLARE  @ultimaModificacao DATETIME, @start DATETIME, @SizeMDF int, @SizeLDF int, @SizeMDFeLDF int
select @ultimaModificacao = max(modify_date) from sys.tables
SELECT @start = sqlserver_start_time FROM sys.dm_os_sys_info
SELECT @SizeMDF = size * 8/1024  from sys.database_files where type = 0
SELECT @SizeLDF = size * 8/1024  from sys.database_files where type = 1
SET @SizeMDFeLDF = @SizeMDF + @SizeLDF
INSERT INTO DATABASE_EVENTS.dbo.tblLogAcessosBases (base,ultimaModificacao,startSQL,dataLog,[sizeMDF(MB)],[sizeLDF(MB)],[somaMDFeLDF(MB)]) values ('''+@name+''',@ultimaModificacao, @start,GETDATE(), @SizeMDF, @SizeLDF, @SizeMDFeLDF) 
'


EXEC (@cmd)


DELETE FROM #tblDatabase WHERE NAME = @name

END


END
GO


