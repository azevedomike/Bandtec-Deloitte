RESTORE DATABASE TAX_ANALYTICS FROM DISK = '\\Brdcvmtaxandbd\backup_mirror\TAX_ANALYTICS.bak' WITH STATS = 1

RESTORE FILELISTONLY FROM DISK = '\\Brdcvmtaxandbd\backup_mirror\SPED_ 10763773_TAA.bak'

RESTORE DATABASE [SPED_ 10763773_TAA] FROM DISK = '\\Brdcvmtaxandbd\backup_mirror\SPED_ 10763773_TAA.bak' WITH STATS = 1,
MOVE 'dbSPED_TAA_MODEL' TO 'E:\Program Files\Microsoft SQL Server\MSSQL13.ESPELHOPRODUCAO\MSSQL\DATA\SPED_ 10763773_TAA.mdf',
MOVE 'dbSPED_TAA_MODEL_log' TO 'E:\Program Files\Microsoft SQL Server\MSSQL13.ESPELHOPRODUCAO\MSSQL\DATA\SPED_ 10763773_TAA.ldf'

exec sp_who2
use master

use SPED_10763773_TAA
create user TSA_eProd from login TSA_eProd with default_schema = dbo

exec sp_addrolemember 'db_datawriter','TSA_eProd' 
exec sp_addrolemember 'db_datareader','TSA_eProd' 
exec sp_addrolemember 'db_owner','TSA_eProd' 


kill 62