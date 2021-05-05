USE [SPED_M_TCT]
GO

/****** Object:  StoredProcedure [dbo].[tct_AlteraViewListaArquivosSUPORTE_s]    Script Date: 02/03/2020 09:21:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[tct_AlteraViewListaArquivosSUPORTE_s]

AS

DECLARE @view nvarchar(max) = N'ALTER VIEW dbo.vwListaArquivosSUPORTE_s AS
  SELECT ';

SELECT @view += STUFF((SELECT ' 
  UNION ALL 
  SELECT	
			arq.atcCodigo,
			arq.cliCNPJ,
			RIGHT(arq.arqcaminhoUpload,CHARINDEX(''\'',REVERSE(arq.arqcaminhoUpload))-1) AS [Arquivo Carregado],
			RIGHT(arq.arqcaminhoAbby,CHARINDEX(''\'',REVERSE(arq.arqcaminhoAbby))-1) as [Arquivo Abby],
			art.artDescricao 
  FROM ' 
  + QUOTENAME(name) + '.dbo.tblArquivo arq
	INNER JOIN ' 
  + QUOTENAME(name) + '.dbo.tblArquivoTipo art
	ON arq.artCodigo = art.artCodigo 

    ' 
  FROM sys.databases WHERE name LIKE '%TCT' AND name NOT LIKE 'SPED_M_TCT'
  FOR XML PATH, TYPE).value(N'.[1]',N'nvarchar(max)'),1,26,'') + N'
  ;';

EXEC sys.sp_executesql @view;	
GO


