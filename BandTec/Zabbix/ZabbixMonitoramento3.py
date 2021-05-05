from pyzabbix import ZabbixAPI, ZabbixMetric, ZabbixSender


zapi = ZabbixAPI(url='http://monitorzbx.deloitte.com.br/zabbix.php?action=host.view', user='', password='')

result1 = zapi.host.get(monitored_hosts=1, output='extend')

packet = [
  ZabbixMetric('BRDCVMTAXANDBD', 'test[cpu_usage]', 2),
  ZabbixMetric('BRDCVMTAXANDBD', 'test[system_status]', "OK"),
  ZabbixMetric('BRDCVMTAXANDBD', 'test[disk_io]', '0.1'),
  ZabbixMetric('BRDCVMTAXANDBD', 'test[cpu_usage]', 20, 1411598020),
]

result = ZabbixSender(use_config=True).send(packet)

result2 = zapi.do_request('host.get',
                          {
                              'filter': {'status': 1},
                              'output': 'extend'
                          })

hostnames1 = [host['10583'] for host in result1]

hostnames1 = [host['host'] for host in result1]
hostnames2 = [host['host'] for host in result2['result']]


packet = [
  ZabbixMetric('hostnames1', 'test[cpu_usage]', 2),
  ZabbixMetric('hostnames1', 'test[system_status]', "OK"),
  ZabbixMetric('hostnames1', 'test[disk_io]', '0.1'),
  ZabbixMetric('hostnames1', 'test[cpu_usage]', 20, 1411598020),
]

result = ZabbixSender(use_config=True).send(packet)

for host in zapi.item.get(filter={"key_": {[
    "wmi.get[root\cimv2,select FreeSpace from win32_logicaldisk where DeviceID='C:']"]}},
        output="extend"):
    print(host["lastvalue"] + ", " + host["hostid"])

    print("\nCollecting Info")
    for h in zapi.host.get(output="extend"):
        print(h['hostid'] + ', ' + h['host'])

for hosts in zapi.item.get(filter={"key_": [
    "wmi.get[root\cimv2,select PercentProcessorTime from Win32_PerfformattedData_PerfOS_Processor where Name='_Total']",
    "wmi.get[root\cimv2,select FreeSpace from win32_logicaldisk where DeviceID='C:']"]}, output="extend"):
    for line in hosts:
        line = open("monitoramento.csv", "w+")
        line.writelines(hosts["hostid"] + ";" + hosts["lastvalue"])
        print(line)
        line.close()



self.server = 'BRDCVMTAXDBD\BDADMIN'
sel.database = 'DATABASE_EVENTS'
username = 'usrZabbixMonitoramento'
password = 'ZabbixMonitoramento@123'
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()