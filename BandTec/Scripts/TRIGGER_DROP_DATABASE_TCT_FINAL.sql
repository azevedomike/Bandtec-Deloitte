USE [master]
GO

/****** Object:  DdlTrigger [Bd_VerificarMovimentacaoBasesTCT_i]    Script Date: 10/03/2020 09:23:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Bd_VerificarMovimentacaoBasesTCT_i]
ON ALL SERVER
FOR DROP_DATABASE
AS
BEGIN
DECLARE 
@DATABASENAME VARCHAR(70),
@DATE DATETIME,
@DATA XML

SET @DATA = EVENTDATA();

SET @DATE = GETDATE();

SET @DATABASENAME = @DATA.value('(/EVENT_INSTANCE/DatabaseName)[1]','SYSNAME'); 

IF @DATABASENAME LIKE '%TCT'
BEGIN

IF (NOT EXISTS(SELECT name from master..sysdatabases WHERE NAME = @DATABASENAME))
BEGIN
INSERT INTO [SPED_TCC].[dbo].[I_MovimentacaoBasesTCT] values (
Suser_Name(),
@DATABASENAME,
@DATE,
'DROP'
)

END
EXEC [SPED_TCC].[dbo].[tct_AlteraViewListaArquivosSUPORTE_s]
END
END 
GO

ENABLE TRIGGER [Bd_VerificarMovimentacaoBasesTCT_i] ON ALL SERVER
GO


