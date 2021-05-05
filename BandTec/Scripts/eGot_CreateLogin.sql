ALTER PROCEDURE eGot_CreateLogin

AS
BEGIN

DECLARE @CHAVE nvarchar(30)

		  SET @chave = 'I4eJDOhXfoCB4OPPvo0z'
		  
			SELECT coxUsuario = CONVERT(VARCHAR,DecryptByAsymKey(AsymKey_ID('eGotAsync'),coxUsuario,@chave)),
					coxNomeBase     
			into #tblConexao
			FROM dbGot_Mestre.dbo.tblConexao 

			
			SELECT A.COXUSUARIO,a.coxNomeBase
			INTO #tblLogins
			FROM  #tblconexao A
				LEFT JOIN MASTER..sysLOGINS B
				ON A.coxUsuario = B.[NAME] COLLATE SQL_Latin1_General_CP850_CI_AI
			WHERE B.[NAME] IS NULL

			
			DECLARE @LOGIN VARCHAR(MAX), @CMD VARCHAR(MAX), @SENHALOGIN VARCHAR(MAX), @BASE VARCHAR(MAX)			
	WHILE EXISTS (SELECT TOP 1 coxUsuario FROM #tblLogins)
		BEGIN
		SELECT TOP 1 @LOGIN = coxUsuario, @BASE = coxNomeBase FROM #tblLogins

		SET @CMD = '
		use master
		CREATE LOGIN ['+@LOGIN+'] WITH PASSWORD = '''+@LOGIN+'@1234'' ,DEFAULT_DATABASE = '+@BASE+', DEFAULT_LANGUAGE=us_english, CHECK_POLICY = OFF
		USE ['+@BASE+']
		EXEC sp_change_users_login ''Auto_Fix'', '+@LOGIN+'
		'
		EXEC (@CMD)
		
		DELETE FROM #tbllogins where coxusuario= @login AND coxNomeBase = @BASE  
		end

		
		drop table #tblConexao
		drop table #tblLogins

		END