import pyodbc

class Connection:
    def __init__(self,server,database,username,password):
        self.server = 'BRDCVMTAXDBD\BDADMIN'
        self.database = 'DATABASE_EVENTS'
        self.username = 'usrZabbixMonitoramento'
        self.password = 'ZabbixMonitoramento@123'

    def conn(self):
        cnxn = pyodbc.connect(
            'DRIVER={ODBC Driver 17 for SQL Server};SERVER=' + self.server + ';DATABASE=' + self.database + ';UID=' + self.username + ';PWD=' + self.password)
        return cnxn
        cursor = cnxn.cursor()