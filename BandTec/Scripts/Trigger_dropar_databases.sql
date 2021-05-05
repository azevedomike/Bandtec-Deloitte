USE SPED_TCC

CREATE TABLE I_MovimentacaoBases
(
logon varchar(100),
databaseName varchar(70),
date datetime,
acao varchar(7)
)


ALTER TRIGGER [Bd_VerificarMovimentacaoDropBases_i]
ON ALL SERVER
FOR DROP_DATABASE
AS
BEGIN
DECLARE 
@DATABASENAME VARCHAR(70),
@DATE DATETIME,
@DATA XML

SET @DATA = EVENTDATA()

SET @DATE = GETDATE()

SET @DATABASENAME = @DATA.value('(/EVENT_INSTANCE/DatabaseName)[1]','SYSNAME'); 

INSERT INTO [SPED_TCC].[dbo].[I_MovimentacaoBases] values (
Suser_Name(),
@DATABASENAME,
@DATE,
'DROP'
)

END 
GO


USE SPED_TCC
SELECT * FROM I_MovimentacaoBases

drop database TESTE6

CREATE DATABASE TESTE5

