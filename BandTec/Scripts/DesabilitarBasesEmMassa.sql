SET NOCOUNT ON

DROP TABLE #tblDatabases

DECLARE @DB VARCHAR(100), @CMD VARCHAR(MAX)

SELECT name 
INTO #tblDatabases
FROM sys.databases
WHERE name in ('dbGot_2_Cliente',
'dbGot_2_Empregado',
'dbGot_2_Monitoramento',
'dbGot_4_Cliente',
'dbGot_4_Empregado',
'dbGot_4_Monitoramento',
'dbGot_5_Cliente',
'dbGot_5_Empregado',
'dbGot_5_Monitoramento',
'dbGot_6_Cliente',
'dbGot_6_Empregado',
'dbGot_6_Monitoramento',
'dbGot_11_Cliente',
'dbGot_11_Empregado',
'dbGot_11_Monitoramento',
'dbGot_12_Cliente',
'dbGot_12_Empregado',
'dbGot_12_Monitoramento',
'dbGot_15_Cliente',
'dbGot_15_Empregado',
'dbGot_15_Monitoramento',
'dbGot_16_Cliente',
'dbGot_16_Empregado',
'dbGot_16_Monitoramento'
)

WHILE EXISTS (SELECT TOP 1 1 FROM #tblDatabases)
BEGIN

SELECT TOP 1 @DB = name FROM #tblDatabases

SET @CMD = '
		ALTER DATABASE ['+@DB+']

		SET OFFLINE
'

EXEC (@CMD)

DELETE FROM #tblDatabases WHERE @DB = name

END


