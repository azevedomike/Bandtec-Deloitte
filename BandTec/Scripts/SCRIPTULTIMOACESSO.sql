USE [DATABASE_EVENTS]
GO

/****** Object:  StoredProcedure [dbo].[all_UltimoAcesso]    Script Date: 08/10/2020 09:47:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[all_UltimoAcesso]

AS

BEGIN



SELECT NAME
INTO #tblDatabase
FROM SYS.DATABASES

WHILE EXISTS (SELECT TOP 1 1 FROM #tblDatabase)
BEGIN
DECLARE @name varchar(35),@cmd varchar(max)

SELECT @name = NAME FROM #tblDatabase


set @cmd = 'use ['+@name+']
DECLARE  @ultimaModificacao DATETIME, @start DATETIME
select @ultimaModificacao = max(modify_date) from sys.tables
SELECT @start = sqlserver_start_time FROM sys.dm_os_sys_info
INSERT INTO DATABASE_EVENTS.dbo.tblLogAcessosBases (base,ultimaModificacao,startSQL,dataLog) values ('''+@name+''',@ultimaModificacao, @start,GETDATE()) 
'


EXEC (@cmd)


DELETE FROM #tblDatabase WHERE NAME = @name

END



END

GO

