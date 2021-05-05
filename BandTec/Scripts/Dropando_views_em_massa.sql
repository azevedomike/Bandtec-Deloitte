drop table #tblViews

use SPED_17692901

SELECT  TABLE_NAME 
INTO #tblViews
FROM INFORMATION_SCHEMA.VIEWS


set nocount on

declare @name varchar (100), @cmd varchar (max)

while exists (select top 1 1 from #tblViews)
begin
	
	select top 1 @name = TABLE_NAME from #tblViews


	set @cmd ='DROP VIEW '+@name+''

	print (@cmd)
	
	delete from #tblViews where TABLE_NAME = @name

end
