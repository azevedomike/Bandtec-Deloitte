SET NOCOUNT ON 

DROP TABLE #tblDatabases

DECLARE @DB VARCHAR(200), @LOGIN VARCHAR(25), @CMD VARCHAR(MAX)

SET @LOGIN = 'ATRAME\danieledsilva'

SELECT NAME
INTO #tblDatabases
FROM SYS.DATABASES
WHERE NAME <> 'master' and NAME <> 'tempdb' and NAME <> 'model' and NAME <> 'msdb' and NAME <> 'dbAutentica' and NAME <> 'dbAutentica_OLD'


WHILE EXISTS(SELECT TOP 1  NAME FROM #tblDatabases)
BEGIN
SELECT TOP 1 @DB = NAME FROM #tblDatabases

	SET @CMD = 'USE ['+@DB+']

			CREATE USER ['+@LOGIN+'] FROM LOGIN ['+@LOGIN+'] WITH DEFAULT_SCHEMA = dbo

			EXEC sp_addrolemember ''db_datawriter'','''+@LOGIN+'''
			EXEC sp_addrolemember ''db_datareader'', '''+@LOGIN+'''
			'

	EXEC (@CMD)
		

DELETE FROM #tblDatabases WHERE NAME = @DB
END