restore filelistonly from disk = 'C:\Users\mikazevedo\Desktop\Backup\TESTE_LUCAS_16012020.bak'

restore database TESTE_LUCAS from disk = 'C:\Users\mikazevedo\Desktop\Backup\TESTE_LUCAS_16012020.bak' with stats = 1,
move 'Modelo_MSDE_Data' to 'C:\Program Files\Microsoft SQL Server\MSSQL13.TAX\MSSQL\DATA\TESTE_LUCAS.mdf',
move 'Modelo_MSDE_Log' to 'C:\Program Files\Microsoft SQL Server\MSSQL13.TAX\MSSQL\DATA\TESTE_LUCAS_LOG.ldf'


