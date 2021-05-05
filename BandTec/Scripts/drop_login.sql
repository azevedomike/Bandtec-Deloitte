USE [DATABASE_EVENTS]
GO

/****** Object:  StoredProcedure [dbo].[all_MapeaLogins]    Script Date: 19/06/2020 09:17:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  OR ALTER PROCEDURE   [dbo].[all_MapeaLogins]
@login varchar(100)
AS
BEGIN
DECLARE
@cmd varchar(max),
@name varchar(100)	
--select
--        SRV_NAME  = srv.name
--	into #tblLinkedServer
--    from
--        sys.servers srv
--    order by 1

--while exists (select top 1 1 from #tblLinkedServer)
--begin

--	select top 1 @name = SRV_NAME from #tblLinkedServer

	
	SET @CMD = ' IF EXISTS (select name  
					from [BRDCVMTAXTPSDBD\TPSDESENV03].master.dbo.syslogins
					where name = '''+@login+''')
					BEGIN 
					 	DROP LOGIN ['+@login+']
					END'

	exec(@CMD)


--delete from #tblLinkedServer where SRV_NAME = @name

--end


END
GO

--
--exec sp_droplinkedsrvlogin [BRDCVMTAXTPSDBD\TPSDESENV03],['+@login+']