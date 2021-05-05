USE [DATABASE_EVENTS]
GO

/****** Object:  StoredProcedure [dbo].[all_MapeaLogins]    Script Date: 04/06/2020 15:10:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE or alter PROCEDURE   [dbo].[all_MapeaLogins]
@login varchar(100)
AS
BEGIN
DECLARE
@cmd varchar(max),
@name varchar(100)	
select
        SRV_NAME  = srv.name
	into #tblLinkedServer
    from
        sys.servers srv
    order by 1

while exists (select top 1 1 from #tblLinkedServer)
begin

	select top 1 @name = SRV_NAME from #tblLinkedServer

	SET @CMD = ' select  
					name   
					into #tblLogin  
					from ['+@name+'].master.dbo.syslogins
					where name = '''+@login+''''
	--execute sp_executesql @CMD
	PRINT(@CMD)

	select name from master.dbo.syslogins where name = 'ATRAME\luoliveira'
	select name from [BRDCVMTAXANDBD\ESPELHOPRODUCAO].master.dbo.syslogins where name = 'ATRAME\luoliveira'

--	while exists(select top 1 1 from #tblLogin)
--		begin

--		print (@cmd) 


		
--		delete from #tblLogin where name = @login	
--end

--	delete from #tblLinkedServer where SRV_NAME = @name

end


END
GO