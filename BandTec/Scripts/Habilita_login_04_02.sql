SET NOCOUNT ON 

DECLARE @LOGIN VARCHAR (255), @CMD VARCHAR (MAX), @delMotivo VARCHAR (MAX), @delDataNovoBloqueio DATETIME,@DB VARCHAR(100),@delCodigo INT,@DBREADER BIT, @DBWRITER BIT,@DBOWNER BIT

SET @LOGIN = 'teste'
SET @delMotivo = 'Acesso a base SQL da Unilever para realizar a analise'
SET @delDataNovoBloqueio = '2021-03-14'
SET @DB = 'DATABASE_EVENTS' 
SET @DBREADER = 1
SET @DBWRITER = 1
SET @DBOWNER = 1


IF EXISTS (SELECT TOP 1 1 FROM tblDeleteLogin 
WHERE delAtivo = 0 )
BEGIN


	IF NOT EXISTS ( 
	SELECT DL.delCodigo FROM tblDeleteLogin DL 
	INNER JOIN tblDatabaseLogin D 
	ON DL.delCodigo = D.DelCodigo  
	WHERE DL.delUsuario = @LOGIN
	AND DL.delNovoBloqueio = @delDataNovoBloqueio
	AND D.dalDatabase = @DB
	AND D.delCodigo = DL.delCodigo
	)

	BEGIN

		INSERT INTO tblDeleteLogin (delUsuario, delAtivo, delMotivoLiberacao, delNovoBloqueio)
		VALUES (@LOGIN, 1, @delMotivo, @delDataNovoBloqueio)

	END
	
	/*declare @delCodigo varchar(max)*/

	SELECT @delCodigo = MAX(delCodigo) FROM tblDeleteLogin

	/*select * from tblDeleteLogin where delcodigo = 631
	print (@delCodigo)*/

	

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

	GRANT CONNECT TO '+@LOGIN+';
	'

	EXEC (@cmd)

	IF (@DBREADER = 1)
	BEGIN
	EXEC sp_addrolemember 'db_datareader',''+@LOGIN+''
	END

	IF (@DBWRITER = 1)
	BEGIN
	EXEC sp_addrolemember 'db_datawriter',''+@LOGIN+''
	END

	IF (@DBOWNER = 1)
	BEGIN
	EXEC sp_addrolemember 'db_owner',''+@LOGIN+''
	END
				
END
--select * from tblDatabaseLogin

--SELECT * FROM tblDeleteLogin ORDER BY delcodigo DESC

--USE DATABASE_EVENTS
--GRANT teste2 ENABLE

--SELECT d.delCodigo,db.dalDatabase,d.delUsuario FROM tblDeleteLogin d inner join  tblDatabaseLogin db on d.delCodigo = db.delCodigo order by delCodigo desc

--select * from tblDeleteLogin order by delCodigo desc