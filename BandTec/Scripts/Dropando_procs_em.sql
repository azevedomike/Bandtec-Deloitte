drop table #tblProcs

SELECT NAME 
INTO #tblProcs
FROM sys.procedures


set nocount on

declare @name varchar (100), @cmd varchar (max)

while exists (select top 1 1 from #tblProcs)
begin
	
	select top 1 @name = name from #tblProcs


	set @cmd ='DROP PROCEDURE [dbo].['+@name+']'

	print (@cmd)
	
	delete from #tblProcs where name = @name

end
