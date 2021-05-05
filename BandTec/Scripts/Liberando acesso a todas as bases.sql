drop table #tbldatabases	

use master

SELECT name
INTO #tbldatabases
FROM sys.databases
WHERE NAME <> 'master' and name <> 'msdb' and name <> 'model' and name <> 'tempdb'

set nocount on

declare @name varchar (100), @cmd varchar (max)

while exists (select top 1 1 from #tbldatabases)
begin
	
	select top 1 @name = name from #tbldatabases


	set @cmd ='USE '+@name+' 
	
	create user [ATRAME\kwakassuqui] from login [ATRAME\kwakassuqui] with default_schema = dbo
	exec sp_addrolemember ''db_datawriter'',''ATRAME\kwakassuqui'' exec sp_addrolemember ''db_datareader'',''ATRAME\kwakassuqui'' exec sp_addrolemember ''db_owner'',''ATRAME\kwakassuqui'''

	print (@cmd)
	
	delete from #tbldatabases where name = @name

end
