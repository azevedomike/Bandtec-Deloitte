-- Habilita a utilização da procedure xp_cmdshell
EXEC sp_configure 'show advanced options', 1
GO

RECONFIGURE
GO

EXEC sp_configure 'xp_cmdshell', 1
GO

RECONFIGURE
GO

-- Cria tabelas a serem utilizadas no processamento 
IF OBJECT_ID('dbo.SPED_Arquivos') IS NULL
BEGIN
	CREATE TABLE SPED_Arquivos
		(
		[Arq_ID] INT IDENTITY(1,1) NOT NULL,
		[Arq_Nome] VARCHAR(MAX) NULL,
		[Arq_Inserido] BIT NULL DEFAULT('0')
				CONSTRAINT [PK_SPED_Arquivos] PRIMARY KEY CLUSTERED
			(
			[Arq_ID] ASC
			) ON [PRIMARY]
		) ON [PRIMARY]
END
/*ELSE
BEGIN

	TRUNCATE TABLE SPED_Arquivos
	drop table SPED_Arquivos
    drop table SPED_Conteudo
	drop table SPED_C100
	drop table SPED_C170
	drop table SPED_C190
	drop table SPED_H010
	drop table SPED_0150
	drop table SPED_0200

END*/
GO

-- Cria tabelas a serem utilizadas no processamento 
IF OBJECT_ID('dbo.SPED_Conteudo') IS NULL
BEGIN
	CREATE TABLE SPED_Conteudo
		(
		[Con_Dados] VARCHAR(MAX) NULL
		) ON [PRIMARY]
END/*
ELSE
BEGIN

	TRUNCATE TABLE SPED_Conteudo
	
END*/
GO

-- Dropa função caso exista na base
IF EXISTS(SELECT * FROM SYS.objects WHERE NAME = 'FN_SEPARA_COLUNAS' AND TYPE = 'FN')
BEGIN
DROP FUNCTION [dbo].[FN_SEPARA_COLUNAS]
END
GO

-- Cria função para realizar o split das linhas
CREATE FUNCTION [dbo].[FN_SEPARA_COLUNAS]
                (
                @TEXTO VARCHAR(8000)
               ,@NR_COLUNA TINYINT
               ,@SEPARADOR CHAR(1)
                ) RETURNS VARCHAR(MAX)
AS BEGIN

DECLARE @INICIO INT
DECLARE @FIM INT
SET @INICIO =1
SET @FIM =CHARINDEX( @SEPARADOR,@TEXTO ,@INICIO)

WHILE (@NR_COLUNA >1 AND @FIM> 0)
BEGIN
        SET @INICIO = @FIM + 1
        SET @FIM = CHARINDEX(@SEPARADOR ,@TEXTO, @INICIO)
        SET @NR_COLUNA = @NR_COLUNA - 1
END

IF @NR_COLUNA > 1 SET @INICIO = LEN(@TEXTO ) + 1
IF @FIM = 0 SET @FIM = LEN(@TEXTO ) + 1
RETURN SUBSTRING (@TEXTO, @INICIO, @FIM - @INICIO )
END
GO

DECLARE @String VARCHAR(MAX),
		@Cam VARCHAR (255)

SET @Cam = 'F:\Joao\Avon\Industrial\'

-- Realiza o processamento
SET @String = 'INSERT INTO SPED_Arquivos (Arq_Nome) EXEC master.dbo.xp_cmdshell ''dir ' + @Cam + '*.txt /b'''
EXEC (@String)

DELETE FROM SPED_Arquivos WHERE (Arq_Nome IS NULL)

DECLARE @Arq_ID INT,
        @Arq_Nome VARCHAR(MAX),
        @SqlString VARCHAR(MAX)

WHILE (SELECT TOP 1 1 FROM SPED_Arquivos WHERE (Arq_Inserido = 0)) = 1
BEGIN

	SET @Arq_ID = (SELECT TOP 1 Arq_ID FROM SPED_Arquivos WHERE (Arq_Inserido = 0) ORDER BY Arq_ID)
	SET @Arq_Nome = (SELECT Arq_Nome FROM SPED_Arquivos WHERE (Arq_ID = @Arq_ID))
	SET @SqlString = 'BULK INSERT SPED_Conteudo FROM ''' + @Cam + @Arq_Nome + ''' WITH (FIELDTERMINATOR = ''$|$NAOTEM$|$'', ROWTERMINATOR = ''\n'')'

	EXEC (@SqlString)

	UPDATE SPED_Arquivos SET Arq_Inserido = 1 WHERE (Arq_ID = @Arq_ID)

END

GO

ALTER TABLE SPED_Conteudo ADD Con_ID INT IDENTITY (1,1) PRIMARY KEY
GO

ALTER TABLE SPED_Conteudo ADD Con_ID_Pai INT
GO

-- Declara cursor para relacionar os registros C100 com os registros C190
DECLARE @Pai INT,
        @Filho INT,
        @Reg VARCHAR(70)

DECLARE Cursor_Pai_x_Filho_SPED CURSOR READ_ONLY STATIC FOR 
SELECT Con_ID, SUBSTRING(Con_Dados, 2, 4)
FROM SPED_Conteudo
WHERE (SUBSTRING(Con_Dados, 2, 4) IN ('C100', 'C170', 'C190')) AND (Con_ID_Pai IS NULL)
ORDER BY Con_ID

OPEN Cursor_Pai_x_Filho_SPED

FETCH NEXT FROM Cursor_Pai_x_Filho_SPED
INTO @Filho, @Reg

SET @Pai = 0

WHILE @@FETCH_STATUS = 0
BEGIN

	IF @Reg = 'C100'
	SET @Pai = @Filho
	ELSE
	UPDATE SPED_Conteudo SET Con_ID_Pai = @Pai WHERE (Con_ID = @Filho)

	FETCH NEXT FROM Cursor_Pai_x_Filho_SPED
	INTO @Filho, @Reg

END

CLOSE Cursor_Pai_x_Filho_SPED
DEALLOCATE Cursor_Pai_x_Filho_SPED
GO

-- Cria tabela para inserir os registros C100
CREATE TABLE [SPED_C100]
                        (
                        [ID_Sped] INT NULL,
                        [ID_Pai] INT NULL,
                        [REG] [VARCHAR] (255) NULL,
                        [IND_OPER] [VARCHAR] (255) NULL,
                        [IND_EMIT] [VARCHAR] (255) NULL,
                        [COD_PART] [VARCHAR] (255) NULL,
                        [COD_MOD] [VARCHAR] (255) NULL,
                        [COD_SIT] [VARCHAR] (255) NULL,
                        [SER] [VARCHAR] (255) NULL,
                        [NUM_DOC] [VARCHAR] (255) NULL,
                        [CHV_NFE] [VARCHAR] (255) NULL,
                        [DT_DOC] [VARCHAR] (255) NULL,
                        [DT_E_S] [VARCHAR] (255) NULL,
                        [VL_DOC] [VARCHAR] (255) NULL,
                        [IND_PGTO] [VARCHAR] (255) NULL,
                        [VL_DESC] [VARCHAR] (255) NULL,
                        [VL_ABAT_NT] [VARCHAR] (255) NULL,
                        [VL_MERC] [VARCHAR] (255) NULL,
                        [IND_FRT] [VARCHAR] (255) NULL,
                        [VL_FRT] [VARCHAR] (255) NULL,
                        [VL_SEG] [VARCHAR] (255) NULL,
                        [VL_OUT_DA] [VARCHAR] (255) NULL,
                        [VL_BC_ICMS] [VARCHAR] (255) NULL,
                        [VL_ICMS] [VARCHAR] (255) NULL,
                        [VL_BC_ICMS_ST] [VARCHAR] (255) NULL,
                        [VL_ICMS_ST] [VARCHAR] (255) NULL,
                        [VL_IPI] [VARCHAR] (255) NULL,
                        [VL_PIS] [VARCHAR] (255) NULL,
                        [VL_COFINS] [VARCHAR] (255) NULL,
                        [VL_PIS_ST] [VARCHAR] (255) NULL,
                        [VL_COFINS_ST] [VARCHAR] (255) NULL
                        )
GO

-- Seleciona as informações do Registro C100
INSERT INTO SPED_C100 
                     ( 
                     ID_Sped, 
                     ID_Pai, 
                     REG, 
                     IND_OPER, 
                     IND_EMIT, 
                     COD_PART, 
                     COD_MOD, 
                     COD_SIT, 
                     SER, 
                     NUM_DOC, 
                     CHV_NFE, 
                     DT_DOC, 
                     DT_E_S, 
                     VL_DOC, 
                     IND_PGTO, 
                     VL_DESC, 
                     VL_ABAT_NT, 
                     VL_MERC, 
                     IND_FRT, 
                     VL_FRT, 
                     VL_SEG, 
                     VL_OUT_DA, 
                     VL_BC_ICMS, 
                     VL_ICMS, 
                     VL_BC_ICMS_ST, 
                     VL_ICMS_ST, 
                     VL_IPI, 
                     VL_PIS, 
                     VL_COFINS, 
                     VL_PIS_ST, 
                     VL_COFINS_ST 
                     )
SELECT Con_ID,
       Con_ID_Pai,
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 3, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 4, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 5, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 6, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 7, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 8, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 9, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 10, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 11, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 12, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 13, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 14, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 15, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 16, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 17, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 18, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 19, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 20, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 21, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 22, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 23, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 24, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 25, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 26, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 27, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 28, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 29, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 30, '|'))
FROM SPED_Conteudo
WHERE (RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|')) = 'C100')

GO

-- Cria tabela para inserir os registros C100
CREATE TABLE [SPED_C170]
                        (
                        [ID_Sped] INT NULL,
                        [ID_Pai] INT NULL,
                        [REG] [VARCHAR] (255) NULL,
                        [NUM_ITEM] [VARCHAR] (255) NULL,
                        [COD_ITEM] [VARCHAR] (255) NULL,
                        [DESCR_COMPL] [VARCHAR] (255) NULL,
                        [QTD] [VARCHAR] (255) NULL,
                        [UNID] [VARCHAR] (255) NULL,
                        [VL_ITEM] [VARCHAR] (255) NULL,
                        [VL_DESC] [VARCHAR] (255) NULL,
                        [IND_MOV] [VARCHAR] (255) NULL,
                        [CST_ICMS] [VARCHAR] (255) NULL,
                        [CFOP] [VARCHAR] (255) NULL,
                        [COD_NAT] [VARCHAR] (255) NULL,
                        [VL_BC_ICMS] [VARCHAR] (255) NULL,
                        [ALIQ_ICMS] [VARCHAR] (255) NULL,
                        [VL_ICMS] [VARCHAR] (255) NULL,
                        [VL_BC_ICMS_ST] [VARCHAR] (255) NULL,
                        [ALIQ_ST] [VARCHAR] (255) NULL,
                        [VL_ICMS_ST] [VARCHAR] (255) NULL,
                        [IND_APUR] [VARCHAR] (255) NULL,
                        [CST_IPI] [VARCHAR] (255) NULL,
                        [COD_ENQ] [VARCHAR] (255) NULL,
                        [VL_BC_IPI] [VARCHAR] (255) NULL,
                        [ALIQ_IPI] [VARCHAR] (255) NULL,
                        [VL_IPI] [VARCHAR] (255) NULL,
                        [CST_PIS] [VARCHAR] (255) NULL,
                        [VL_BC_PIS] [VARCHAR] (255) NULL,
                        [ALIQ_PIS] [VARCHAR] (255) NULL,
                        [QUANT_BC_PIS] [VARCHAR] (255) NULL,
                        [ALIQ_PIS_2] [VARCHAR] (255) NULL,
                        [VL_PIS] [VARCHAR] (255) NULL,
                        [CST_COFINS] [VARCHAR] (255) NULL,
                        [VL_BC_COFINS] [VARCHAR] (255) NULL,
                        [ALIQ_COFINS_2] [VARCHAR] (255) NULL,
                        [QUANT_BC_COFINS] [VARCHAR] (255) NULL,
                        [ALIQ_COFINS] [VARCHAR] (255) NULL,
                        [VL_COFINS] [VARCHAR] (255) NULL,
                        [COD_CTA] [VARCHAR] (255) NULL
                        )
GO

-- Seleciona as informações do Registro C170
INSERT INTO SPED_C170 
                     ( 
                     ID_Sped, 
                     ID_Pai, 
                     REG,
                     NUM_ITEM,
                     COD_ITEM,
                     DESCR_COMPL,
                     QTD,
                     UNID,
                     VL_ITEM,
                     VL_DESC,
                     IND_MOV,
                     CST_ICMS,
                     CFOP,
                     COD_NAT,
                     VL_BC_ICMS,
                     ALIQ_ICMS,
                     VL_ICMS,
                     VL_BC_ICMS_ST,
                     ALIQ_ST,
                     VL_ICMS_ST,
                     IND_APUR,
                     CST_IPI,
                     COD_ENQ,
                     VL_BC_IPI,
                     ALIQ_IPI,
                     VL_IPI,
                     CST_PIS,
                     VL_BC_PIS,
                     ALIQ_PIS,
                     QUANT_BC_PIS,
                     ALIQ_PIS_2,
                     VL_PIS,
                     CST_COFINS,
                     VL_BC_COFINS,
                     ALIQ_COFINS_2,
                     QUANT_BC_COFINS,
                     ALIQ_COFINS,
                     VL_COFINS,
                     COD_CTA
                     )
SELECT Con_ID,
       Con_ID_Pai,
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 3, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 4, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 5, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 6, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 7, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 8, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 9, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 10, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 11, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 12, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 13, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 14, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 15, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 16, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 17, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 18, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 19, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 20, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 21, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 22, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 23, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 24, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 25, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 26, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 27, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 28, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 29, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 30, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 31, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 32, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 33, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 34, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 35, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 36, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 37, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 38, '|'))
FROM SPED_Conteudo
WHERE (RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|')) = 'C170')

GO

--
CREATE TABLE [SPED_C190]
                        (
                        [ID_Sped] INT NULL,
                        [ID_Pai] INT NULL,
                        REG [VARCHAR] (255) NULL,
                        CST_ICMS [VARCHAR] (255) NULL,
                        CFOP [VARCHAR] (255) NULL,
                        ALIQ_ICMS [VARCHAR] (255) NULL,
                        VL_OPR [VARCHAR] (255) NULL,
                        VL_BC_ICMS [VARCHAR] (255) NULL,
                        VL_ICMS [VARCHAR] (255) NULL,
                        VL_BC_ICMS_ST [VARCHAR] (255) NULL,
                        VL_ICMS_ST [VARCHAR] (255) NULL,
                        VL_RED_BC [VARCHAR] (255) NULL,
                        VL_IPI [VARCHAR] (255) NULL,
                        COD_OBS [VARCHAR] (255) NULL
                        )
GO

-- Seleciona as informações do Registro C100
INSERT INTO SPED_C190
                     ( 
                     ID_Sped, 
                     ID_Pai,
                     REG, 
                     CST_ICMS, 
                     CFOP,
                     ALIQ_ICMS,
                     VL_OPR,
                     VL_BC_ICMS,
                     VL_ICMS,
                     VL_BC_ICMS_ST, 
                     VL_ICMS_ST,
                     VL_RED_BC,
                     VL_IPI,
                     COD_OBS
                     )
SELECT Con_ID,
       Con_ID_Pai,
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 3, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 4, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 5, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 6, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 7, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 8, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 9, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 10, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 11, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 12, '|')),
       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 13, '|'))
FROM SPED_Conteudo
WHERE (RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|'))= 'C190')
GO



---- Seleciona as informações do Registro H010
--CREATE TABLE [SPED_H010]
--                        (
--                        REG [VARCHAR] (255) NULL,
--                        COD_ITEM [VARCHAR] (255) NULL,
--                        UNID [VARCHAR] (255) NULL,
--                        QTD [VARCHAR] (255) NULL,
--                        VL_UNIT [VARCHAR] (255) NULL,
--                        VL_ITEM [VARCHAR] (255) NULL,
--                        IND_PROP [VARCHAR] (255) NULL,
--                        COD_PART [VARCHAR] (255) NULL,
--                        TXT_COMPL [VARCHAR] (255) NULL,
--                        COD_CTA [VARCHAR] (255) NULL,
--                        VL_ITEM_IR [VARCHAR] (255) NULL
--                        )
--GO

--INSERT INTO SPED_H010 
--                     ( 
--                     REG, 
--                     COD_ITEM, 
--                     UNID,
--                     QTD,
--                     VL_UNIT,
--                     VL_ITEM,
--                     IND_PROP,
--                     COD_PART, 
--                     TXT_COMPL,
--                     COD_CTA,
--                     VL_ITEM_IR
--                     )
--SELECT RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 3, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 4, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 5, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 6, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 7, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 8, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 9, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 10, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 11, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 12, '|'))
--FROM SPED_Conteudo
--WHERE (RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|'))= 'H010')
--GO


---- Seleciona as informações do Registro 0150
--CREATE TABLE [SPED_0150]
--                        (	
--                        REG [VARCHAR] (255) NULL,
--                        COD_PART [VARCHAR] (255) NULL,
--                        NOME [VARCHAR] (255) NULL,
--                        COD_PAIS [VARCHAR] (255) NULL,
--                        CNPJ [VARCHAR] (255) NULL,
--                        CPF [VARCHAR] (255) NULL,
--                        IE [VARCHAR] (255) NULL,
--                        COD_MUN [VARCHAR] (255) NULL,
--                        SUFRAMA [VARCHAR] (255) NULL,
--                        [END] [VARCHAR] (255) NULL,
--                        NUM [VARCHAR] (255) NULL,
--						COMPL [VARCHAR] (255) NULL,
--						BAIRRO [VARCHAR] (255) NULL
--                        )
--GO

------ Seleciona as informações do Registro 0150
--INSERT INTO SPED_0150 
--                     ( 
--                    REG,
--                    COD_PART,
--                    NOME,
--                    COD_PAIS,
--                    CNPJ,
--                    CPF,
--                    IE,
--                    COD_MUN,
--                    SUFRAMA,
--                    [END],
--                    NUM,
--					COMPL,
--					BAIRRO
--                     )
--SELECT RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 3, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 4, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 5, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 6, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 7, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 8, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 9, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 10, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 11, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 12, '|')),
--	   RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 13, '|')),
--	   RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 14, '|'))
--FROM SPED_Conteudo
--WHERE (RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|'))= '0150')
--GO

------select left (cod_pais, LEN(cod_pais) - 1), * from sped_0150


---- Seleciona as informações do Registro 0200
--CREATE TABLE [SPED_0200]
--                        (
--                        REG [VARCHAR] (255) NULL,
--                        COD_ITEM [VARCHAR] (255) NULL,
--                        DESCR_ITEM [VARCHAR] (255) NULL,
--                        COD_BARRA [VARCHAR] (255) NULL,
--                        COD_ANT_ITEM [VARCHAR] (255) NULL,
--                        UNID_INV [VARCHAR] (255) NULL,
--                        TIPO_ITEM [VARCHAR] (255) NULL,
--                        COD_NCM [VARCHAR] (255) NULL,
--                        EX_IPI [VARCHAR] (255) NULL,
--                        COD_GEN [VARCHAR] (255) NULL,
--                        COD_LST [VARCHAR] (255) NULL,
--						ALIQ_ICMS [VARCHAR] (255) NULL,
--						CEST [VARCHAR] (255) NULL
--                        )
--GO

----  Seleciona as informações do Registro 0200
--INSERT INTO SPED_0200 
--                     ( 
--                    REG,
--                    COD_ITEM,
--                    DESCR_ITEM,
--                    COD_BARRA,
--                    COD_ANT_ITEM,
--                    UNID_INV,
--                    TIPO_ITEM,
--                    COD_NCM,
--                    EX_IPI,
--                    COD_GEN,
--                    COD_LST,
--					ALIQ_ICMS,
--					CEST
--                     )
--SELECT RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 3, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 4, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 5, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 6, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 7, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 8, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 9, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 10, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 11, '|')),
--       RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 12, '|')),
--	   RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 13, '|')),
--	   RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 14, '|'))
--FROM SPED_Conteudo
--WHERE (RTRIM(DBO.FN_SEPARA_COLUNAS(Con_Dados, 2, '|'))= '0200')
--GO

	drop table SPED_Arquivos
    drop table SPED_Conteudo
	drop table SPED_C100
	drop table SPED_C170
	drop table SPED_C190
	drop table SPED_H010
	drop table SPED_0150
	drop table SPED_0200