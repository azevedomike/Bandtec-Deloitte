CREATE OR ALTER  PROCEDURE all_ShrinkDatabasesExec
AS
BEGIN
DECLARE
    @cmd varchar(max),
    @name varchar(100)


    SELECT
        srv_name  = srv.[name]
    INTO
        #tblLinkedServer
    FROM
        sys.servers srv
    order by 1


	while exists (select top  1 1 from #tblLinkedServer)
	BEGIN

	SELECT top 1 @name = srv_name from #tblLinkedServer
	
	SET @cmd = 'EXEC ['+@name+'].[DATABASE_EVENTS].dbo.all_ShrinkLogsJob'


PRINT @cmd

DELETE from #tblLinkedServer WHERE srv_name = @name
	END

	
	END

