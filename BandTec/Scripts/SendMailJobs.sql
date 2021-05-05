EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'Dtt TMC',
    @recipients = 'mikazevedo@deloitte.com',
    @subject = 'Jobs',
    @body = 'Olá! Segue lista de jobs com erros',
    @body_format = 'text',
    @from_address = 'mikazevedo@deloitte.com',
    @query = 'SELECT * FROM database_events.dbo.tblLogJobs where with_error = ''Sim'''

	EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'logsdejobs',
    @recipients = 'mikazevedo@deloitte.com',
    @subject = 'Jobs',
    @body = 'Olá! Segue lista de jobs com erros',
    @body_format = 'text',
    @from_address = 'mikazevedo@deloitte.com',
    @query = 'SELECT * FROM database_events.dbo.tblLogJobs where with_error = ''Sim'''

	select * from msdb.dbo.sysmail_profile


select * from sysjobhistory
