ALTER PROCEDURE all_UltimoAcesso_

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
DECLARE @ultimaModificacao DATETIME, @start DATETIME
SELECT @ultimaModificacao = max(modify_date) from sys.tables
SELECT @start =		
INSERT INTO DATABASE_EVENTS.dbo.ultimoAcesso (baseDeDados,ultimaModificacao,startSQL) values ('''+@name+''',@ultimaModificacao, @start) 
'
 
PRINT (@cmd)

DELETE FROM #tblDatabase WHERE NAME = @name

END

END

