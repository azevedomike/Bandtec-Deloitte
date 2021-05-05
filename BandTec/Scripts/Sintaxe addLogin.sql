use master
		CREATE LOGIN  [usrGot_1044_Cliente] WITH PASSWORD = 'usrGot_1044_Cliente@1234',DEFAULT_DATABASE = dbGot_1044_Cliente, DEFAULT_LANGUAGE=us_english, CHECK_POLICY = OF
		use dbGot_1044_Cliente
	EXEC sp_change_users_login 'Auto_Fix', 'usrGot_1044_Cliente'

	CREATE LOGIN [usrGot_1044_Monitoramento] WITH PASSWORD = 'usrGot_1044_Monitoramento@1234' ,DEFAULT_DATABASE = dbGot_1044_Monitoramento, DEFAULT_LANGUAGE=us_english, CHECK_POLICY = OFF
		USE [dbGot_1044_Monitoramento]
		EXEC sp_change_users_login 'Auto_Fix', usrGot_1044_Monitoramento

		
		
