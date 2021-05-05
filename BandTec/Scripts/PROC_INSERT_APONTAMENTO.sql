USE dbCOEServiceDesk

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:          <Azevedo, Mike Melo>
-- Create date: <29/01/2020>
-- Description:     <Description,,>
-- Parâmetros: 
--            @funTime - int : código do funcionário a ser inserido
--			  @data - datetime : data a ser inserida
--			  @qtdHoras - decimal(3,1) : quantidade de horas a ser inserido
--			  @proEngagement - varchar(10): Engagement a ser inserido			  
--			  @descricao varchar(2000) : Descricao do Engagement
-- Saída: 
--		 funtime - int
--		 funNome - varchar(100),
--		 data - datetime,
--		 projeto - varchar(100),
--		 qtdHoras - decimal (3,1)
--		 descricao - varchar(2000),
--		 acao - varchar(200),
--		 HoraExtra - bit,
--		 ElegivelPeD - bit,
--		 proEngagement - varchar(100)

-- =============================================
--
-- Exemplo de chamada:
--	  EXEC <> 
--    @funTime = 28451,
--    @data = '2019-01-01',
--	  @qtdHoras = '3.0',
--	  @proEngagement 90120146,
--	  @descricao = '*Colocar a descricao do apontamento*'

-- DROP PROCEDURE dbo.Sdt_InserirApontamento_i

ALTER PROCEDURE dbo.Sdt_InserirApontamento_i
       -- Add the parameters for the stored procedure here
       @funTime int,
	   @data datetime,
       @qtdHoras decimal(3,1),
	   @proEngagement varchar(10),	   
	   @descricao varchar(2000)
       
AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
       SET NOCOUNT ON;

       DECLARE @inserido bit = 0;
       DECLARE @funNome varchar(100);
       DECLARE @projeto varchar(100);

       -- verificando se código de projeto existe
       IF NOT EXISTS (SELECT 1 FROM dbo.tblProjetosApontamento WHERE proEngagement = @proEngagement)
       BEGIN
             SELECT @inserido as inserido, 'Projeto não existente na tabela tblProjetosApontamento' as mensagem;
             RETURN;
       END
       ELSE
       BEGIN
             SELECT @projeto = proDescricao FROM dbo.tblProjetosApontamento WHERE proEngagement = @proEngagement;
       END

       -- falta verificar na tabela tblFuncionario se tem funcionário com funTime recebido
       IF NOT EXISTS (SELECT 1 FROM dbo.tblFuncionario WHERE funTime = @funTime)
       BEGIN
             SELECT @inserido as inserido, 'Funcionário não existente na tabela tblFuncionario' as mensagem;
             RETURN;
       END
       ELSE
       BEGIN
             SELECT @funNome = funNome FROM dbo.tblFuncionario WHERE funTime = @funTime;
       END

       -- INSERT NA TABELA tblApontamentoDiario
       INSERT INTO dbo.tblApontamentoDiario   
			(funTime, funNome, data, projeto, qtdHoras, descricao,acao, horaExtra, ElegivelPeD,proEngagement )
			VALUES
			(@funTime,@funNome,@data,@projeto,@qtdHoras,@descricao,null,0,0,@proEngagement)

       SET @inserido = @@ROWCOUNT;

    -- Insert statements for procedure here
       SELECT @inserido as inserido, NULL as mensagem;
END
GO

--EXEC dbo.sdt_InserirApontamento_i 
--     -- Add the parameters for the stored procedure here
--     @funTime = 2,
--     @data = '2019-01-12',
--     @qtdHoras = 2.1,
--	   @proEngagement = 90120158
--	   @descricao = '*Descrição do apontamento*'