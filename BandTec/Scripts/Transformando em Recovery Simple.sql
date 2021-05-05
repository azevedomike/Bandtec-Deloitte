USE TAX_ANALYTICS
declare
@isql varchar(2000),
@dbname varchar(64),
@logfile varchar(128)

declare c1 cursor for
SELECT d.name, mf.name as logfile--, physical_name AS current_file_location, size
FROM sys.master_files mf
inner join sys.databases d
on mf.database_id = d.database_id
where recovery_model_desc = 'FULL'
and d.name not in ('master','model','msdb','tempdb')
and mf.type_desc = 'LOG'
open c1
fetch next from c1 into @dbname, @logfile
While @@fetch_status <> -1
begin
if NOT EXISTS (select STATUS from sysprocesses where status = 'runnable')
BEGIN
SET @isql = 'ALTER DATABASE ' + @dbname + ' SET RECOVERY SIMPLE'
print @isql
exec(@isql)
SET @isql='USE ' + @dbname + ' checkpoint'
print @isql
exec(@isql)
SET @isql = 'USE ' + @dbname + ' DBCC SHRINKFILE (' + @logfile + ', 1)'
print @isql
exec(@isql)
END

fetch next from c1 into @dbname, @logfile
end
close c1
deallocate c1