
USE MASTER

/*		
		ALTER TABLE tblDeleteLogin ADD delAtivo VARCHAR (255)

		ALTER TABLE tblDeleteLogin ADD delMotivoLiberacao VARCHAR (MAX)

		ALTER TABLE tblDeleteLogin ADD delNovoBloqueio DATETIME 

		UPDATE tblDeleteLogin SET delAtivo = 0

*/

SET NOCOUNT ON 

DECLARE @LOGIN VARCHAR (255), @CMD VARCHAR (MAX), @delMotivo VARCHAR (MAX), @delDataNovoBloqueio DATETIME

SET @LOGIN = 'atrame\aevangelista'
SET @delMotivo = 'Trata-se de uma base do TPS velho onde o login é feito direto via SQL - CBCL_2014'
SET @delDataNovoBloqueio = '2020-08-31'

--SELECT TOP 1 1 FROM MASTER..tblDeleteLogin WHERE delAtivo = 0 AND delUsuario =@LOGIN  

IF EXISTS (SELECT TOP 1 1 FROM MASTER..tblDeleteLogin WHERE delAtivo = 0 AND delUsuario =@LOGIN  )
BEGIN

	INSERT INTO tblDeleteLogin (delUsuario, delAtivo, delMotivoLiberacao, delNovoBloqueio)
	VALUES (@LOGIN, 1, @delMotivo, @delDataNovoBloqueio)

	SET @CMD = 'ALTER LOGIN ['+ @LOGIN + '] ENABLE;'

	EXEC (@cmd)
				
END

select * from tblDeleteLogin
ALTER LOGIN [atrame\dlecomberri] disable

begin tran
delete FROM tblDeleteLogin
WHERE delUsuario = 'atrame\dlecomberri'
AND delMotivoLiberacao IS NOT NULL
commit


BEGIN TRAN
UPDATE tblDeleteLogin 
SET delNovoBloqueio = '2020-08-31', delmotivoliberacao = 'Preciso rodar alguns scripts e serão utilizadas pelo time de TP para testes de alteração de rotina de cálculo'
WHERE delUsuario = 'atrame\aevangelista'
--COMMIT
rollback

SELECT * FROM MASTER..tblDeleteLogin
where delusuario = 'atrame\aevangelista'