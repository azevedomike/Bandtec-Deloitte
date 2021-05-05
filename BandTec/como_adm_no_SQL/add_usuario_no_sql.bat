sqlcmd -S %computername%\SQLEXPRESS -E -Q "EXEC master..sp_addsrvrolemember @loginame = N'ATRAME\%username%', @rolename = N'sysadmin'"
sqlcmd -S %computername%\SQLEXPRESS -E -Q "SELECT sysadmin FROM SYS.syslogins  where loginname = 'ATRAME\%username%'"
pause