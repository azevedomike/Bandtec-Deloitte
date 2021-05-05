use TAX_ANALYTICS

create user TSA_eProd from login TSA_eProd with default_schema = dbo

exec sp_addrolemember 'db_datawriter', 'TSA_eProd'
exec sp_addrolemember 'db_datareader', 'TSA_eProd'
exec sp_addrolemember 'db_owner', 'TSA_eProd'