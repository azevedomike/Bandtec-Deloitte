import pyodbc

server = "BRDCVMTAXDBD\BDADMIN"
database = "DATABASE_EVENTS"
username = "usrZabbixMonitoramento"
password = "ZabbixMonitoramento@123"
string_conexao = 'Driver={SQL Server Native Client 11.0};Server='+server+';Database='+database+';UID='+username+';PWD='+ password
#string_conexao = 'Driver={SQL Server Native Client 11.0};Server='+server+';Database='+database+';Trusted_Connection=yes;'
conexao = pyodbc.connect(string_conexao)

cursor = conexao.cursor()
cursor.execute("INSERT INTO tblTeste (idTeste,testeEscrita,testeData) VALUES (1,'Teste','2021-01-07')")
conexao.commit()

