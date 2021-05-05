USE [SPED_1]
GO

/****** Object:  DdlTrigger [Taa_VersionamentoDeObjetos_u]    Script Date: 18/06/2020 13:23:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--
CREATE TRIGGER [Taa_VersionamentoDeObjetos_u]
ON DATABASE 
FOR DDL_DATABASE_LEVEL_EVENTS
AS
BEGIN
    SET NOCOUNT ON
    SET ARITHABORT ON

	-- Declaração das variaveis para receber os eventos
    DECLARE @Evento XML, @object_id int
    SET @Evento = EVENTDATA()
	
	--Declaração das variaveis para verificar condição
	DECLARE @cmd varchar(256), @cmd1 varchar(256), @base varchar(256), @objeto varchar(256)
	SET @cmd = (SELECT TOP 1 [taoNomeObjeto] FROM [DATABASE_EVENTS].[dbo].[tblTraceAlteracaoObjeto] where [taoNomeObjeto] = (@Evento.value('(/EVENT_INSTANCE/ObjectName/text())[1]','VARCHAR(256)')))
	SET @base = (SELECT TOP 1 [taoNomeDatabase] FROM [DATABASE_EVENTS].[dbo].[tblTraceAlteracaoObjeto] where [taoNomeDatabase] = (@Evento.value('(/EVENT_INSTANCE/DatabaseName/text())[1]','VARCHAR(256)')))
	SET @objeto = (SELECT TOP 1 [taoTipoObjeto] FROM [DATABASE_EVENTS].[dbo].[tblTraceAlteracaoObjeto] where [taoTipoObjeto] = (@Evento.value('(/EVENT_INSTANCE/ObjectType/text())[1]','VARCHAR(256)')))
	
	--Verifica se o Nome do Objeto e o Nome da Base existem na tabela 	[tblTraceAlteracaoObjeto]
	--IF EXISTS (SELECT TOP 1 1 FROM [DATABASE_EVENTS].[dbo].[tblTraceAlteracaoObjeto] WHERE taoNomeDatabase = @base AND  taoNomeObjeto = @cmd and taoTipoObjeto = @objeto)
	Set @object_id = object_id (@Evento.value('(/EVENT_INSTANCE/ObjectName/text())[1]','VARCHAR(256)'))
	
	IF EXISTS (SELECT TOP 1 1 FROM [DATABASE_EVENTS].[dbo].[tblTraceAlteracaoObjeto] WHERE taoNomeDatabase = @base AND  taoNomeObjeto = @cmd and taoTipoObjeto = @objeto) And (@base = 'TAX_ANALYTICS' or @base = 'dbSPED_TAA_Model')
	
	-- Caso sim
	BEGIN
		--Seleciona a ultima versão do objeto já adicionada na tabela [tblTraceAlteracaoObjeto] e soma mais um
		
	SELECT @cmd1 =(MAX ([taoNumeroVersao]) + 1)  From [DATABASE_EVENTS].[dbo].[tblTraceAlteracaoObjeto] where [taoNomeObjeto] = @cmd AND taoNomeDatabase = @base and [taoTipoObjeto] = @objeto
	
	
	
	-- Insere na tabela [tblTraceAlteracaoObjeto] todos os eventos realizados no momento
	 INSERT INTO [DATABASE_EVENTS].[dbo].[tblTraceAlteracaoObjeto] ([saoObjectID], [taoTipoEvento], [taoDataAlteracao], [taoNomeServidor], [taoNomeLogin], [taoNomeDatabase], [taoNomeObjeto], [taoNumeroVersao],[taoTipoObjeto],[taoEvento])
    SELECT  @object_id,
			@Evento.value('(/EVENT_INSTANCE/EventType/text())[1]','VARCHAR(256)') [Tipo_Evento],
            @Evento.value('(/EVENT_INSTANCE/PostTime/text())[1]','DATETIME') [PostTime],
            @Evento.value('(/EVENT_INSTANCE/ServerName/text())[1]','VARCHAR(256)') [ServerName],
            @Evento.value('(/EVENT_INSTANCE/LoginName/text())[1]','VARCHAR(256)') [LoginName],
            @Evento.value('(/EVENT_INSTANCE/DatabaseName/text())[1]','VARCHAR(256)') [DatabaseName],
            @Evento.value('(/EVENT_INSTANCE/ObjectName/text())[1]','VARCHAR(256)') [ObjectName], 
            @cmd1,
			@Evento.value('(/EVENT_INSTANCE/ObjectType/text())[1]','VARCHAR(256)')[ObjectType],
			@Evento
		   
END

	--Caso não exista nenhum registro na tabela [tblTraceAlteracaoObjeto]
	--ELSE
	
	ELSE IF NOT EXISTS (SELECT TOP 1 1 FROM [DATABASE_EVENTS].[dbo].[tblTraceAlteracaoObjeto] WHERE taoNomeDatabase = @base AND  taoNomeObjeto = @cmd and taoTipoObjeto = @objeto) And (@base = 'TAX_ANALYTICS' or @base = 'dbSPED_TAA_Model')

begin
	
	--Insere na tabela [tblTraceAlteracaoObjeto] todos os eventos realizados no momento como versão 1
	 INSERT INTO [DATABASE_EVENTS].[dbo].[tblTraceAlteracaoObjeto] ([saoObjectID], [taoTipoEvento], [taoDataAlteracao], [taoNomeServidor], [taoNomeLogin], [taoNomeDatabase], [taoNomeObjeto], [taoNumeroVersao],[taoTipoObjeto],[taoEvento])
    SELECT  @object_id,
			@Evento.value('(/EVENT_INSTANCE/EventType/text())[1]','VARCHAR(256)') [Tipo_Evento],
            @Evento.value('(/EVENT_INSTANCE/PostTime/text())[1]','DATETIME') [PostTime],
            @Evento.value('(/EVENT_INSTANCE/ServerName/text())[1]','VARCHAR(256)') [ServerName],
            @Evento.value('(/EVENT_INSTANCE/LoginName/text())[1]','VARCHAR(256)') [LoginName],
            @Evento.value('(/EVENT_INSTANCE/DatabaseName/text())[1]','VARCHAR(256)') [DatabaseName],
            @Evento.value('(/EVENT_INSTANCE/ObjectName/text())[1]','VARCHAR(256)') [ObjectName], 
            1,
			@Evento.value('(/EVENT_INSTANCE/ObjectType/text())[1]','VARCHAR(256)')[ObjectType],
			@Evento

END
END





GO

ENABLE TRIGGER [Taa_VersionamentoDeObjetos_u] ON DATABASE
GO


