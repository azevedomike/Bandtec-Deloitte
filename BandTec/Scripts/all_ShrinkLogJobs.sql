CREATE OR ALTER  PROCEDURE all_ShrinkLogsJob
AS
BEGIN
DECLARE @name1 varchar(100)
	select
			name
		into #tblDatabases
		from master.sys.sysdatabases
		where name <> 'master' and name <> 'tempdb' and name <> 'model' and name <> 'msdb'

					
					while exists(select top 1 name from #tblDatabases) 
					
					
						begin 
							SELECT top 1  @name1 = name FROM #tblDatabases
							DBCC SHRINKDATABASE (@name1, 10)

							DELETE FROM #tblDatabases WHERE name = @name1
						end
		

	
END
