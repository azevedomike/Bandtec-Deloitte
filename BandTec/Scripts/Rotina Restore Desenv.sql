
--CRIANDO TABELA DE LOG
CREATE DATABASE DATABASE_EVENTS

USE DATABASE_EVENTS

CREATE TABLE tblLogRestore
(
lreBaseDados varchar (100),
lreData datetime default (getdate())
)



use DATABASE_EVENTS

--Sript deve ser adaptado
CREATE OR ALTER PROCEDURE eGot_RotinaRestore
AS
BEGIN
SET NOCOUNT ON 
CREATE TABLE #tblTmp
(
cmd VARCHAR (MAX)
)

insert into #tblTmp (cmd)
exec xp_cmdshell 'dir E:\Backup\eGot\'


--Ajustando o nome do arquivo de backup
SELECT SUBSTRING (cmd, CHARINDEX ('db',cmd),len(cmd)) as BkpFl
INTO #tblBackupFile
FROM #tblTmp
WHERE cmd LIKE '%.BAK'


DECLARE @cmd VARCHAR (MAX), @bkpFl VARCHAR (MAX)

WHILE EXISTS (SELECT TOP 1 1 FROM #tblBackupFile)
BEGIN

	SELECT TOP 1 @bkpFl = bkpFl FROM #tblBackupFile 

	BEGIN

		SET @cmd = 'RESTORE DATABASE ' + REPLACE (@bkpFl,'.BAK','') + ' FROM DISK = ''E:\Backup\eGot\'+@bkpFl+''' WITH REPLACE'

		EXEC (@cmd)

		INSERT INTO DATABASE_EVENTS.DBO.tblLogRestore VALUES (REPLACE (@bkpFl,'.BAK',''),DEFAULT)

	END

	DELETE FROM #tblBackupFile WHERE bkpFl = @bkpFl

END

DROP TABLE #tblBackupFile
DROP TABLE #tblTmp
END