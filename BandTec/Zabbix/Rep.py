from pyzabbix import ZabbixAPI

def retornar_conexao_sql():
    server = "BRDCVMTAXDBD\BDADMIN"
    database = "DATABASE_EVENTS"
    username = "usrZabbixMonitoramento"
    password = "ZabbixMonitoramento@123"
    #string_conexao = 'Driver={SQL Server Native Client 11.0};Server='+server+';Database='+database+';UID='+username+';PWD='+ password
    string_conexao = 'Driver={SQL Server Native Client 11.0};Server='+server+';Database='+database+';Trusted_Connection=yes;'
    conexao = pyodbc.connect(string_conexao)
    return conexao.cursor()
print("\nLogin Zabbix API")
zapi = ZabbixAPI(url='http://monitorzbx.deloitte.com.br/', user='mikazevedo', password='Espanha$5120')

print("Connected to Zabbix API Version %s" % zapi.api_version())

hosts = zapi.item.get(
    filter={
        "key_": [
            "wmi.get[root\cimv2,select PercentProcessorTime from Win32_PerfformattedData_PerfOS_Processor where Name='_Total']",
            "wmi.get[root\cimv2,SELECT CommittedBytes FROM Win32_PerfRawData_PerfOS_Memory]",
            "wmi.get[root\cimv2,select Size from win32_logicaldisk where DeviceID='C:']",
            "os.windows.active.ldisk.used.bytes[C:]",
            "wmi.get[root\cimv2,select FreeSpace from win32_logicaldisk where DeviceID='C:']",
            "wmi.get[root\cimv2,select Size from win32_logicaldisk where DeviceID='E:']",
            "os.windows.active.ldisk.used.bytes[E:]",
            "wmi.get[root\cimv2,select FreeSpace from win32_logicaldisk where DeviceID='E:']",
            "wmi.get[root\cimv2,select Size from win32_logicaldisk where DeviceID='F:']",
            "os.windows.active.ldisk.used.bytes[F:]",
            "wmi.get[root\cimv2,select FreeSpace from win32_logicaldisk where DeviceID='F:']",
            "wmi.get[root\cimv2,select Size from win32_logicaldisk where DeviceID='H:']",
            "os.windows.active.ldisk.used.bytes[H:]",
            "wmi.get[root\cimv2,select FreeSpace from win32_logicaldisk where DeviceID='H:']",
            "wmi.get[root\cimv2,select Size from win32_logicaldisk where DeviceID='S:']",
            "os.windows.active.ldisk.used.bytes[S:]",
            "wmi.get[root\cimv2,select FreeSpace from win32_logicaldisk where DeviceID='S:']"
        ]
    },
    output="extend"
)

class SaveData:
    def __init__(self):
        self.__cnxn = connection.conn()

    def insertRecord(self,idItemZabbix,tzmLastValue):
    for host in hosts:
        cursor = self.__cnxn.cursor()
        cursor.execute("""
        INSERT INTO DATABASE_EVENTS.dbo.tblZabbixMonitoramento (idItemZabbix,tzmLastValue) 
        VALUES (?,?)""",
                     host['hostid'],host['lastvalue'] )
        self.__cnxn.commit()
        cursor.fetchone()

print("\nLogout Zabbix API")
zapi.user.logout()
