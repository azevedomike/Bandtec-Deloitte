USE SPED_TCC

CREATE TABLE I_MovimentacaoBases
(
logon varchar(100),
databaseName varchar(70),
date datetime,
acao varchar(7)
)

ALTER TRIGGER [Bd_VerificarMovimentacaoCreateBases_i]
ON ALL SERVER
FOR CREATE_DATABASE
AS
BEGIN
DECLARE 
@DATABASENAME VARCHAR(70),
@DATE DATETIME,
@DATA XML

SET @DATA = EVENTDATA();

SET @DATE = GETDATE();

SET @DATABASENAME = @DATA.value('(/EVENT_INSTANCE/DatabaseName)[1]','SYSNAME'); 

INSERT INTO [SPED_TCC].[dbo].[I_movimentacaoBases] values (
Suser_Name(),
@DATABASENAME,
@DATE,
'CREATE'
)

END 
GO


USE SPED_TCC
SELECT * FROM I_movimentacaoBases

drop database TESTE3

CREATE DATABASE TESTE7
SELECT Current_User, User_Name(), Session_User, Suser_Name(), Suser_ID(), Suser_SID(), Suser_SName(), System_User