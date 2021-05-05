SET NOCOUNT ON 

DECLARE @LOGIN VARCHAR (255), @CMD VARCHAR (MAX), @delMotivo VARCHAR (MAX), @delDataNovoBloqueio DATETIME,@DB VARCHAR(100),@delCodigo INT

SET @LOGIN = 'teste'
SET @delMotivo = 'TESTE'
SET @delDataNovoBloqueio = '2021-01-14'
SET @DB = 'dbBackup'



IF EXISTS (SELECT TOP 1 1 FROM tblDeleteLogin 
WHERE delAtivo = 0  )

SELECT @delCodigo = delCodigo FROM tblDeleteLogin WHERE delUsuario = @LOGIN 

BEGIN

	IF NOT EXISTS ( SELECT DL.delCodigo FROM tblDeleteLogin DL 
	INNER JOIN tblDataLogin D 
	ON DL.delCodigo = D.fkDelCodigo 
	INNER JOIN tblDatabaseLogin TD 
	ON TD.dalCodigo = D.fkDalCodigo  
	WHERE DL.delUsuario = @LOGIN
	AND DL.delNovoBloqueio = @delDataNovoBloqueio
	)

	BEGIN

		INSERT INTO tblDeleteLogin (delUsuario, delAtivo, delMotivoLiberacao, delNovoBloqueio)
		VALUES (@LOGIN, 1, @delMotivo, @delDataNovoBloqueio)

	END

	IF NOT EXISTS ( SELECT dalDatabase, delUsuario FROM tblDatabaseLogin 
	WHERE dalDatabase = @DB 
	AND delUsuario = @LOGIN
	)

	BEGIN

		INSERT INTO tblDatabaseLogin(dalDatabase,delUsuario,delCodigo) 
		VALUES (@DB,@LOGIN,@delCodigo)

	END

	SET @CMD = '
	USE ['+@DB+']

	GRANT CONNECT TO "'+ @LOGIN+'";
	'

	EXEC (@cmd)
				
END



