from pyzabbix import ZabbixAPI
import pyodbc

server = "BRDCVMTAXDBD\BDADMIN"
database = "DATABASE_EVENTS"
username = "usrZabbixMonitoramento"
password = "ZabbixMonitoramento@123"
#string_conexao = 'Driver={SQL Server Native Client 11.0};Server='+server+';Database='+database+';UID='+username+';PWD='+ password
string_conexao = 'Driver={SQL Server Native Client 11.0};Server='+server+';Database='+database+';Trusted_Connection=yes;'
conexao = pyodbc.connect(string_conexao)

print("\nLogin Zabbix API")
zapi = ZabbixAPI(url='http://monitorzbx.deloitte.com.br/', user='mikazevedo', password='Espanha$5120')

print("Connected to Zabbix API Version %s" % zapi.api_version())

hosts = zapi.item.get(
    filter={
        "key_": ["os.windows.inventory.hostname"
        ]
    },
    output="extend"
)

cursor = conexao.cursor()
hst = cursor.execute('SELECT hostName FROM tblMonitoramentoZabbixHostsNames')

print(hst)

for names in hst:
    for hostTrace in hosts:
        if hostTrace['lastvalue'] != names:
            cursor.execute('''
            INSERT INTO DATABASE_EVENTS.dbo.tblMonitoramentoZabbixHostsNames (hostId,hostName) 
            VALUES (?,?)''',
                            hostTrace['hostid'],hostTrace['lastvalue'])
            conexao.commit()

print("\nLogout Zabbix API")
zapi.user.logout()
