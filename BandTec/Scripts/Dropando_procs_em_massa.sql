drop table #tblProcs

use SPED_17692901_CAT83

SELECT  ROUTINE_NAME 
INTO #tblProcs
FROM INFORMATION_SCHEMA.ROUTINES


set nocount on

declare @name varchar (100), @cmd varchar (max)

while exists (select top 1 1 from#tblProcs)
begin
	
	select top 1 @name = ROUTINE_NAME from #tblProcs


	set @cmd ='DROP PROCEDURE '+@name+''

	print (@cmd)
	
	delete from #tblProcs where ROUTINE_NAME = @name

end
