SET NOCOUNT ON

SELECT NAME
INTO #tblDatabases
FROM [BRDCVMTAXANDBD\ESPELHOPRODUCAO].master.dbo.SYSDATABASES
WHERE NAME <> 'master' AND NAME <> 'tempdb' AND NAME <> 'model' AND NAME <> 'msdb' and NAME NOT LIKE 'SPED%'

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

DROP TABLE #tblDatabases

SELECT * FROM  #tblDatabases

DECLARE @CMD VARCHAR(MAX), @DB VARCHAR(100), @LogicalNameData VARCHAR(MAX),@LogicalNameLog VARCHAR(MAX)

WHILE EXISTS(SELECT TOP 1 1 FROM #tblDatabases)
BEGIN 
	
SELECT TOP 1 @DB = NAME FROM #tblDatabases

INSERT INTO #tblRestore 
 EXEC ('RESTORE FILELISTONLY FROM DISK= ''\\Brdcvmtaxecfdbd\backup\'+@DB+'.bak''')

 
    SET @LogicalNameData=(SELECT LogicalName FROM #tblRestore WHERE Type='D')    
    SET @LogicalNameLog=(SELECT LogicalName FROM #tblRestore WHERE Type='L') 

SET @CMD = '

RESTORE DATABASE '+@DB+' FROM DISK = ''\\Brdcvmtaxecfdbd\backup\'+@DB+'.bak '' WITH REPLACE,
MOVE '''+@LogicalNameData+''' TO ''E:\DATA\'+@DB+'.mdf'',
MOVE '''+@LogicalNameLog+''' TO ''E:\LOG\'+@DB+'_log.ldf''
'

PRINT (@CMD)

DELETE FROM #tblDatabases WHERE @DB = NAME 

TRUNCATE TABLE #tblRestore
	
END



