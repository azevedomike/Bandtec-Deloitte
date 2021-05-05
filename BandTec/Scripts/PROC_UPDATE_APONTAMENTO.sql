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
--            @funTime - int : código do funcionário a ser modificado
--			  @dataAnterior - datetime : Data anterior a que será modificada
--			  @qtdHorasAnterior - decimal(3,1) : Quantidade de horas trabalhadas colocadas anteriormente
--			  @proEngagementAnterior - varchar(10) : código de engagement colocados anteriormente
--			  @data - datetime : data a ser atualizada
--			  @qtdHoras - decimal(3,1) : quantidade de horas a ser atualizada
--			  @proEngagement - varchar(10): Engagement a ser atualizado
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
--    @dataAnterior = '2019-01-01',
--	  @qtdHorasAnterior = '3.0',
--	  @proEngagementAnterior 90120146,
--	  @data = '2019-01-29',
--	  @qtdHoras = '4.0,
--	  @proEngament = 90120158,
--	  @descricao = '*Colocar a descricao do apontamento*'

-- DROP PROCEDURE dbo.Sdt_InserirApontamento_u

ALTER PROCEDURE dbo.Sdt_AlterarApontamento_u
       -- Add the parameters for the stored procedure here
       @funTime int,
	   @dataAnterior datetime,
       @qtdHorasAnterior decimal(3,1),
       @proEngagementAnterior varchar(10),
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

       -- update na tabela tblApontamentoDiario
       UPDATE dbo.tblApontamentoDiario 
       SET   data = @data,
             projeto = @projeto,
			 qtdHoras = @qtdHoras,
			 descricao = @descricao,
			 proEngagement = @proEngagement			 
       WHERE data = @dataAnterior
	   AND qtdHoras = @qtdHorasAnterior
	   AND proEngagement = @proEngagementAnterior
	   AND funTime = @funTime;

       SET @inserido = @@ROWCOUNT;

    -- Insert statements for procedure here
       SELECT @inserido as inserido, NULL as mensagem;
END
GO

--EXEC dbo.sdt_InserirApontamento_u 
--     -- Add the parameters for the stored procedure here
--     @funTime = 5498,
--     @dataAnterior = '2017-09-25',
--     @qtdHorasAnterior = 5.0,
--	   @proEngagementAnterior = 90120190
--     @data = '2020-01-01'
--     @qtdHoras = 2.0,
--	   @proEngagement = 90120101
--	   @descricao = 'teste5j'