create user [atrame\luoliveira] from login [atrame\luoliveira] with default_schema = dbo

EXEC sp_addrolemember 'db_datawriter', 'atrame\luoliveira'
EXEC sp_addrolemember 'db_datareader', 'atrame\luoliveira'
EXEC sp_addrolemember 'db_owner', 'atrame\luoliveira'

GRANT SELECT ON OBJECT::DBO.TESTE_1 TO TESTE_2
GRANT SELECT ON OBJECT::DBO.TESTE_2 TO TESTE_2

use TESTE_LUCAS

EXEC [gecd].[sp
