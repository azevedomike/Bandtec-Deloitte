CREATE or ALTER PROCEDURE all_VerificaLoginBDADMIN


as
BEGIN



SELECT name
INTO #tbldatabases
FROM sys.databases
WHERE NAME <> 'master' and name <> 'msdb' and name <> 'model' and name <> 'tempdb'

set nocount on

declare @name varchar (100), @cmd varchar (max)

while exists (select top 1 1 from #tbldatabases)
begin
	
	select top 1 @name = name from #tbldatabases
	
  
	set @cmd ='
	USE ['+@name+'] 
	IF NOT EXISTS(select name from sysusers where name = ''usrBDAdmin'')
	BEGIN
	create user usrBDAdmin from login usrBDAdmin with default_schema = dbo
	exec sp_addrolemember ''db_datawriter'',''usrBDAdmin'' 
	exec sp_addrolemember ''db_datareader'',''usrBDAdmin'' 
	exec sp_addrolemember ''db_owner'',''usrBDAdmin''
 	END
	'

	EXEC (@cmd)
	
	delete from #tbldatabases where name = @name
	
	END

END