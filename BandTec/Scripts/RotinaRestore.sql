USE [DATABASE_EVENTS]
GO

/****** Object:  StoredProcedure [dbo].[eGot_RotinaRestore]    Script Date: 21/09/2020 14:34:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON 
GO


  
  
--Sript deve ser adaptado    
CREATE PROCEDURE [dbo].[eGot_RotinaRestore]    
AS    
    
SET NOCOUNT ON    
  
CREATE TABLE #tblTmp    
(    
cmd VARCHAR (MAX)    
)    
    
    
    
CREATE  TABLE #tblRestore (    
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
    
    
insert into #tblTmp (cmd)    
exec xp_cmdshell 'dir E:\Backup\eGot\'    
    
    
SELECT 'E:\Backup\eGot\' + SUBSTRING (cmd, CHARINDEX ('db',cmd),len(cmd)) as PathFile,    
   SUBSTRING (cmd, CHARINDEX ('db',cmd),len(cmd)) BkpFl     
INTO #tblBackupFile    
FROM #tblTmp    
WHERE cmd LIKE '%.BAK'    
  
    
    
DECLARE @cmd VARCHAR (MAX),   
  @bkpFl VARCHAR (MAX),   
  @PathFile VARCHAR (MAX),   
  @LogicalNameData varchar(128),  
  @LogicalNameLog varchar(128),  
  @kill varchar(8000)  
  
SET @kill = ''  
    
WHILE EXISTS (SELECT TOP 1 1 FROM #tblBackupFile)    
BEGIN    
    
 SELECT TOP 1 @bkpFl = bkpFl, @PathFile = PathFile FROM #tblBackupFile    
   
   
 SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), spid) + ';'    
 FROM master..sysprocesses    
 WHERE dbid = db_id(REPLACE ('.BAK','',@bkpFl))  
  
 EXEC(@kill);   
    
     
    
 
 IF NOT EXISTS(SELECT NAME FROM SYSDATABASES WHERE NAME = REPLACE ('.BAK','',@bkpFl))
	  BEGIN
 INSERT INTO #tblRestore 
 EXEC ('RESTORE FILELISTONLY FROM DISK=''' +@PathFile+ '''')    
     
    
    SET @LogicalNameData=(SELECT LogicalName FROM #tblRestore WHERE Type='D')    
    SET @LogicalNameLog=(SELECT LogicalName FROM #tblRestore WHERE Type='L')    
    
      
    SET @cmd = 'RESTORE DATABASE '+ REPLACE (@bkpFl,'.BAK','')+ ' FROM DISK = '''+@PathFile+''' WITH REPLACE,   
MOVE '''+@LogicalNameData+''' to ''E:\Program Files\Microsoft SQL Server\MSSQL13.EGOT\MSSQL\DATA\'+REPLACE (@bkpFl,'.BAK','')+'.mdf'',
MOVE '''+@LogicalNameLog+''' to ''E:\Program Files\Microsoft SQL Server\MSSQL13.EGOT\MSSQL\DATA\'+REPLACE (@bkpFl,'.BAK','')+'_log.ldf'''    
      END

	 IF EXISTS(SELECT NAME FROM SYSDATABASES WHERE NAME = REPLACE ('.BAK','',@bkpFl))
	  BEGIN 
	 SET @cmd =	'RESTORE DATABASE' + REPLACE (@bkpFl,'.BAK','''''') + 'FROM DISK = '''+@PathFile+''''
	  END
   	
    EXEC (@cmd)   

 
    TRUNCATE TABLE #tblRestore  
    
    INSERT INTO DATABASE_EVENTS.DBO.tblLogRestore (lreBaseDados) VALUES (REPLACE (@bkpFl,'.BAK',''))    
    
 DELETE FROM #tblBackupFile WHERE bkpFl = @bkpFl    
    
END    
GO

