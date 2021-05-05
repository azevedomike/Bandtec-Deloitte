drop table #tbldatabases

select name
into #tbldatabases
from SysDatabases;

declare @cmd varchar (max), @nome varchar (50)

while exists (select top 1 1 from #tbldatabases)
 
 begin
 
 select @nome = name from #tbldatabases;

 set @cmd = 'use '+ @nome + ' 
 create user [ATRAME\iscosta] from login [ATRAME\iscosta] with default_schema =dbo
 exec sp_addrolemember ''db_datawriter'', ''ATRAME\iscosta''
 exec sp_addrolemember ''db_datareader'', ''ATRAME\iscosta''
 exec sp_addrolemember ''db_owner'',''ATRAME\iscosta'''

 EXEC (@cmd)

 DELETE FROM #tbldatabases WHERE name = @nome

 end





 
 