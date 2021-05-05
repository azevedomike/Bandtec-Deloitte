SET NOCOUNT ON 

DECLARE @LOGIN VARCHAR (255), @CMD VARCHAR (MAX), @delMotivo VARCHAR (MAX), @delDataNovoBloqueio DATETIME,@DB VARCHAR(100),@delCodigo INT,@DBREADER BIT, @DBWRITER BIT,@DBOWNER BIT

SET @LOGIN = 'teste3'
SET @delMotivo = 'Teste'
SET @delDataNovoBloqueio = '2021-03-11'
SET @DB = 'DATABASE_EVENTS' 
SET @DBREADER = 1
SET @DBWRITER = 1
SET @DBOWNER = 1


IF NOT EXISTS (SELECT name FROM sysusers WHERE name = @LOGIN)
BEGIN

DECLARE @SQL VARCHAR(MAX)

SET @SQL = '	
			ALTER LOGIN ['+@LOGIN+'] ENABLE;
			'

EXEC (@SQL)

SET @SQL = '
			USE ['+@DB+']
			CREATE USER ['+@LOGIN+'] FROM LOGIN ['+@LOGIN+'] WITH DEFAULT_SCHEMA = dbo;
			'

EXEC (@SQL)
		

END

IF NOT EXISTS (SELECT d.delCodigo FROM tblDeleteLogin d INNER JOIN tblDatabaseLogin db ON d.delCodigo = db.delCodigo
WHERE D.delUsuario = @LOGIN
AND D.delNovoBloqueio = @delDataNovoBloqueio
AND db.dalDatabase = @DB)

BEGIN
		
		 

		INSERT INTO tblDeleteLogin (delUsuario, delAtivo, delMotivoLiberacao, delNovoBloqueio)
		VALUES (@LOGIN, 1, @delMotivo, @delDataNovoBloqueio)
	
	/*declare @delCodigo varchar(max)*/

	SELECT @delCodigo = MAX(delCodigo) FROM tblDeleteLogin

	/*select * from tblDeleteLogin where delcodigo = 631
	print (@delCodigo)*/

	

	IF NOT EXISTS ( SELECT DL.dalDatabase, D.delUsuario FROM tblDatabaseLogin DL inner join tblDeleteLogin D ON D.delCodigo = DL.delCodigo
	WHERE DL.delCodigo <> D.delCodigo
	AND D.delUsuario = @LOGIN
	)

	BEGIN

		INSERT INTO tblDatabaseLogin(dalDatabase,delUsuario,delCodigo) 
		VALUES (@DB,@LOGIN,@delCodigo)

	END

	SET @CMD = '
	USE ['+@DB+']

	GRANT CONNECT TO "'+@LOGIN+'";
	'

	EXEC (@cmd)

	IF (@DBREADER = 1)
	BEGIN
	EXEC sp_addrolemember 'db_datareader',@LOGIN
	END

	IF (@DBWRITER = 1)
	BEGIN
	EXEC sp_addrolemember 'db_datawriter',@LOGIN
	END

	IF (@DBOWNER = 1)
	BEGIN
	EXEC sp_addrolemember 'db_owner',@LOGIN
	END
				
END

--select * from tblDeleteLogin order by delcodigo desc

--select * from tblDatabaseLogin

--select * from tblDatabaseLogin

--delete from tblDeleteLogin where delativo = 1

