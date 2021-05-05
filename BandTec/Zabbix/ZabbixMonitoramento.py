from pyzabbix import ZabbixAPI

print("\nLogin Zabbix API")
zapi = ZabbixAPI(url='http://monitorzbx.deloitte.com.br/', user='mikazevedo', password='Espanha$5120')

print("Connected to Zabbix API Version %s" % zapi.api_version())

FILENAME = "monitoramento.csv"

monitoring_file = open(FILENAME, "w+")

filtered_hosts = zapi.item.get(
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


for host in filtered_hosts:
    monitoring_file.write(f"{host['hostid']};{host['lastvalue']}\n")

monitoring_file.close()


print("\nLogout Zabbix API")
zapi.user.logout()
