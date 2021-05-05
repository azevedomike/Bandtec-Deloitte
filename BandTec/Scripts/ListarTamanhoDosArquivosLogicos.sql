SELECT d.name DatabaseName, f.name LogicalName,
f.physical_name AS PhysicalName, db.RazaoSocial, db.AnoReferencia,
f.type_desc TypeofFile, f.size/128.0 FileSizeInMB
FROM sys.master_files f
INNER JOIN sys.databases d ON d.database_id = f.database_id 
INNER JOIN [BRDCVMTPDB2\TAX07].[db_tps_admin].[dbo].[tblBancoDados] db  ON d.name = db.badNome collate SQL_Latin1_General_CP850_CI_AI
where d.name <> 'master' and d.name <> 'tempdb' and d.name <> 'model' and d.name <> 'msdb' order by d.name
GO


