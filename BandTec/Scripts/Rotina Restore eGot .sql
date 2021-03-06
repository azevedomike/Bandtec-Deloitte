USE [DATABASE_EVENTS]
GO
/****** Object:  StoredProcedure [dbo].[eGot_RotinaRestore]    Script Date: 26/03/2020 09:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Sript deve ser adaptado
ALTER PROCEDURE [dbo].[eGot_RotinaRestore_TESTE]
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

	IF EXISTS (SELECT NAME FROM SYS.DATABASES WHERE NAME = REPLACE (@bkpFl,'.BAK',''))
	BEGIN
		SET @cmd = 'RESTORE DATABASE ' + REPLACE (@bkpFl,'.BAK','') + ' FROM DISK = ''E:\Backup\eGot\'+@bkpFl+''' WITH REPLACE'

		PRINT (@cmd)

		INSERT INTO DATABASE_EVENTS.DBO.tblLogRestore VALUES (REPLACE (@bkpFl,'.BAK',''),DEFAULT)
	END
	IF NOT EXISTS (SELECT NAME FROM SYS.DATABASES WHERE NAME = REPLACE (@bkpFl,'.BAK',''))
	BEGIN
		DECLARE @Table TABLE (
    LogicalName varchar(128),
    [PhysicalName] varchar(128), 
    [Type] varchar, 
    [FileGroupName] varchar(128), 
    [Size] varchar(128),
    [MaxSize] varchar(128), 
    [FileId]varchar(128), 
    [CreateLSN]varchar(128), 
    [DropLSN]varchar(128), 
    [UniqueId]varchar(128), 
    [ReadOnlyLSN]varchar(128), 
    [ReadWriteLSN]varchar(128),
    [BackupSizeInBytes]varchar(128), 
    [SourceBlockSize]varchar(128), 
    [FileGroupId]varchar(128), 
    [LogGroupGUID]varchar(128), 
    [DifferentialBaseLSN]varchar(128), 
    [DifferentialBaseGUID]varchar(128), 
    [IsReadOnly]varchar(128), 
    [IsPresent]varchar(128), 
    [TDEThumbprint]varchar(128),
    [SnapshotUrl]varchar(128)
)
DECLARE @Path varchar(1000)='E:\Backup\eGot\'+@bkpfl+''
DECLARE @LogicalNameData varchar(128),@LogicalNameLog varchar(128)
INSERT INTO @table
EXEC ('
RESTORE FILELISTONLY
   FROM DISK=''' +@Path+ '''
   ')

   SET @LogicalNameData=(SELECT LogicalName FROM @Table WHERE Type='D')
   SET @LogicalNameLog=(SELECT LogicalName FROM @Table WHERE Type='L')
	
	SET @cmd = 'RESTORE DATABASE '+ REPLACE (@bkpFl,'.BAK','')+ 'FROM DISK = ''E:\Backup\eGot\'+@bkpFl+'''WITH MOVE '''+@LogicalNameData+''' to ''E:\Program Files\Microsoft SQL Server\MSSQL13.EGOT\MSSQL\DATA\'''+@bkpfl+'''.mdf'', MOVE '''+@LogicalNameLog+''' to ''E:\Program Files\Microsoft SQL Server\MSSQL13.EGOT\MSSQL\DATA\'''+@bkpfl+'''_log.ldf'''
	PRINT (@cmd)

	INSERT INTO DATABASE_EVENTS.DBO.tblLogRestore VALUES (REPLACE (@bkpFl,'.BAK',''),DEFAULT)
	END
	END

	DELETE FROM #tblBackupFile WHERE bkpFl = @bkpFl

END

DROP TABLE #tblBackupFile
DROP TABLE #tblTmp
END