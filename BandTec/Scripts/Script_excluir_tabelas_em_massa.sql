drop table #tblTables

use SPED_17692901_CAT83

SELECT table_name
INTO #tblTables
FROM information_schema.tables
where table_name <> 'tblCAT83_BaseEntrada' and table_name <> 'tblCAT83_BaseEstoque' and table_name <> 'tblCAT83_BaseRateio' 
and table_name <> 'tblCAT83_BaseRomaneio' and table_name <> 'tblCAT83_BaseSaida' and table_name <> 'tblCAT83_BaseSaldoInicial'

--select * from #tblTables

set nocount on

declare @name varchar (100), @cmd varchar (max)

while exists (select top 1 1 from #tblTables)
begin
	
	select top 1 @name = table_name from #tblTables


	set @cmd ='drop table '+@name+''

	print (@cmd)
	
	delete from #tblTables where table_name = @name

end
