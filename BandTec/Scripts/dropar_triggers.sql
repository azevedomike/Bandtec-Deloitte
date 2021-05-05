USE [DATABASE_EVENTS]
GO

/****** Object:  StoredProcedure [dbo].[bd_RestoreDroparTriggers_d]    Script Date: 12/06/2020 08:45:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[bd_RestoreDroparTriggers_d]
as
BEGIN 
set nocount on
DECLARE  @name1 varchar(35)

select name 
into #tbl
from sysdatabases where name  in ('sped_1', 'sped_2','sped_3','SPED_4')

while exists (select top 1 1 from #tbl)

BEGIN

DECLARE 
@cmd varchar(max), @name varchar(100)


select top 1 @name1 = name from #tbl

	BEGIN	
set @cmd = ('select name
into #tblTrigger
from '+@name1+'.sys.triggers where name <> ''tgr_teste234''
			
WHILE EXISTS (SELECT  TOP 1 1 FROM #tblTrigger) 
BEGIN
		
		select top 1 @name = name from #tblTrigger
		 set '+@cmd+' = DROP TRIGGER  '+@name+'
	 
		print ('+@cmd+')

		delete from #tblTrigger where name = '+@name+' 
	
delete from #tblTrigger where name = '+@name+'

END')

print (@cmd)




delete from #tbl where name = @name1
END


END
GO

--drop table #tbl
