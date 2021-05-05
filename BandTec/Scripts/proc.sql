
<-- bulk na tabela temporaria, dps faz o insert into na tabela bkBase -->
USE [dbBackup]






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE [dbo].[sp_InserirNovosDados] 

AS

BEGIN

create table #tblTeste (
	bkbIdBkpBase int,
	bkbBase varchar(max) ,
	bkbProjeto varchar(max) ,
	bkbServidorInstancia varchar(max) ,
	bkbCaminho varchar(max) ,
	bkbBkpFita varchar(max) ,
	bkbDtSolicitacao varchar(max) ,
	bkbInstanciaOrigem varchar(max) ,
	bkbStatus varchar(max) ,
	bkbBkpRest varchar(max)); 

BULK INSERT #tblTeste FROM 'E:\Backup\Backup_Fita.csv'  WITH (KEEPIDENTITY, FIRSTROW=2 , FORMAT = 'csv',
							FIELDTERMINATOR = ';');

WHILE EXISTS (SELECT TOP 1 bkbIdBkpBase FROM #tblTeste)
BEGIN
DECLARE @idBase varchar (60)
SELECT TOP 1 @idBase = bkbIdBkpBase FROM #tblTeste 


if EXISTS (SELECT bkbIdBkpBase FROM tblBkpBase where bkbIdBkpBase =  @idBase)  
BEGIN


INSERT INTO tblBkpBase(bkbIdBkpBase, bkbBase, bkbProjeto, bkbServidorInstancia, bkbCaminho, bkbBkpFita, bkbDtSolicitacao, 
bkbInstanciaOrigem, bkbStatus, bkbBkpRest)
SELECT 
     bkbIdBkpBase, bkbBase, bkbProjeto, bkbServidorInstancia, bkbCaminho,bkbBkpFita, bkbDtSolicitacao, bkbInstanciaOrigem, bkbStatus,bkbBkpRest 
FROM 
    #tblTeste 
	
END
DELETE FROM #tblTeste WHERE @idBase = bkbIdBkpBase;
END

END


drop procedure [dbo].[sp_InserirNovosDados] 



 select * from #tblTeste 
 exec [dbo].[sp_InserirNovosDados] 


 
 
