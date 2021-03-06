USE [database_events]
GO
/****** Object:  StoredProcedure [dbo].[Job_DesabilitaLogin]    Script Date: 23/03/2021 10:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Job_DesabilitaLogin]

as
DECLARE @database VARCHAR (MAX), @CMD VARCHAR (MAX), @CMD1 VARCHAR (MAX),@delNovoBloqueio DATETIME,@DB VARCHAR(MAX)

SET NOCOUNT ON 


SELECT D.dalDatabase,
DL.delUsuario, 
DL.delNovoBloqueio
INTO #tblDesabilita
FROM tblDatabaseLogin D
INNER JOIN tblDeleteLogin DL
ON DL.delCodigo = D.delCodigo
INNER JOIN sys.databases SD
ON SD.name = D.dalDatabase
WHERE DL.delNovoBloqueio <= GETDATE()
AND DL.delAtivo = 1

DECLARE @LOGIN VARCHAR (150)

WHILE EXISTS (SELECT TOP 1 1 FROM #tblDesabilita)
BEGIN

SELECT TOP 1 @LOGIN =  delUsuario, @delNovoBloqueio = delNovoBloqueio, @DB = dalDatabase FROM #tblDesabilita

		SET @CMD = 

		
		'
		USE ['+@DB+']

		IF EXISTS (SELECT NAME FROM SYSUSERS WHERE NAME = '''+@LOGIN+''')
		BEGIN
		DROP USER "'+ @LOGIN+'";
		END
		'
		
		EXEC (@CMD)

		IF NOT EXISTS (SELECT d.delCodigo FROM tblDeleteLogin d inner join  tblDatabaseLogin db on d.delCodigo = db.delCodigo 
	WHERE delNovoBloqueio > @delNovoBloqueio AND d.delUsuario = @LOGIN AND d.delAtivo = 1 )

		BEGIN
		SET @CMD = 
		'

		ALTER LOGIN ['+ @LOGIN+'] DISABLE;

		'

		EXEC (@CMD)
		END

		IF EXISTS (SELECT delUsuario FROM tblDeleteLogin WHERE delAtivo = 1 AND delUsuario = @LOGIN
		AND  CONVERT (VARCHAR (10), delNovoBloqueio,112) <= CONVERT (VARCHAR (10),  GETDATE() ,112))
		BEGIN

		DECLARE @DELCODIGO INT

		SELECT @DELCODIGO = delCodigo FROM tblDeleteLogin WHERE delAtivo = 1 AND delUsuario = @LOGIN 
		AND  CONVERT (VARCHAR (10), delNovoBloqueio,112) <= CONVERT (VARCHAR (10),  GETDATE() ,112)
	
	
		INSERT INTO database_events.dbo.tblDeleteLoginhistory (delCodigo,delUsuario,delAtivo,delMotivoLiberacao,delNovoBloqueio) 
		SELECT delCodigo,delUsuario,delAtivo,delMotivoLiberacao,delNovoBloqueio
		FROM tblDeleteLogin
		WHERE  DelUsuario = @LOGIN 
		AND delAtivo = 1
		AND delNovoBloqueio <= @delNovoBloqueio
		
		UPDATE DATABASE_EVENTS.dbo.tblDeleteLogin SET delAtivo = 0 WHERE delUsuario = @LOGIN and delCodigo = @DELCODIGO

		END


		DELETE FROM #tblDesabilita WHERE  delUsuario  = @LOGIN AND @DB = dalDatabase


END

DROP TABLE #tblDesabilita

--select * from tblDeleteLogin order by delCodigo desc

--select * from tblDeleteLoginHistory ORDER BY delCodigo desc

--exec Job_DesabilitaLogin



