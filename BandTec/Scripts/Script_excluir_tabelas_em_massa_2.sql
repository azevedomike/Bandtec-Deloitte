drop table #tblTables

use SPED_17692901

SELECT name
--INTO #tblTables
FROM sys.tables
where name <> 'TBLNFE' and name <> 'TBLNFE_IDE' and name <> 'TBLNFE_EMIT' 
and name <> 'TBLNFE_DET' and name <> 'TBLNFE_PROD' and name <> 'TBLNFE_ICMS'
and name <> 'TBLNFE_IPI' and name <> 'TBLNFE_PIS' and name <> 'TBLNFE_COFINS'
and name <> 'TBLNFE_DEST' and name <> 'TBLNFE_ENDEREMIT' and name <> 'TBLNFE_ENDERDEST'
and name <> 'TBLNFE_TOTALIMPOSTO' and name <> 'TBLNFE_INFADIC' and name <> 'Tblefd'
and name <> 'tbl_efd_c100' and name <> 'tbl_efd_0150' and name <> 'tbl_efd_c170'
and name <> 'tbl_efd_0200' and name <> 'tbl_efd_0205' and name <> 'tbl_efd_c500'
and name <> 'tbl_efd_h010' and name <> 'TBL_EFD_0000'

--select count(*) from #tblTables

set nocount on

declare @name varchar (100), @cmd varchar (max)

while exists (select top 1 1 from #tblTables)
begin
	
	select top 1 @name = name from #tblTables


	set @cmd ='drop table '+@name+''

	print (@cmd)
	
	delete from #tblTables where name = @name

end
