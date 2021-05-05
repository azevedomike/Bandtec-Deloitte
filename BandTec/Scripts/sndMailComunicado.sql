USE [dbSendMail]
GO

/****** Object:  StoredProcedure [dbo].[sndMailComunicado]    Script Date: 03/12/2020 11:50:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[sndMailComunicado] @comCodigo INT

AS

--EXEC [sndMailComunicado] 2

DECLARE @string Nvarchar (max),
		@string1 Nvarchar (max),
		@string2 Nvarchar (max),
		@comSubject varchar (max),
		@dateMail varchar (50),
		@query varchar (max),
		@tableHTML varchar (max),
		@proEmail varchar (255)

/*DESCRIÇÃO DA DATA ATUAL PARA ENVIO DO E-MAIL*/
	SET LANGUAGE portugues
	SET @dateMail = CAST (DATEPART (DD,GETDATE()) AS varchar (2)) + ' de ' +	DATENAME(MONTH, GETDATE()) + + ' de ' + CAST (DATEPART (YYYY,GETDATE()) AS varchar (4))
	SET LANGUAGE us_english
 

/*SELECIONA ASSUNTO DO E-MAIL*/
	SELECT @comSubject = comSubject
	FROM tblComunicado 
	WHERE comCodigo = @comCodigo


/*SELECIONA ENDEREÇOS DE E-MAIL DO MAILING*/
	SELECT DISTINCT  proEmail
	INTO #tblMailingEmail
	FROM tblMailing
	WHERE comCodigo = @comCodigo
	AND proEmail IS NOT NULL
	--AND proemail in ('danielacosta@deloitte.com','marcouto@deloitte.com')


WHILE EXISTS (SELECT TOP 1 1 FROM #tblMailingEmail)

BEGIN

	SELECT TOP 1 @proEmail = proEmail
	FROM #tblMailingEmail


set @string1 = 
'<html>

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=Generator content="Microsoft Word 15 (filtered)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:#954F72;
	text-decoration:underline;}
p
	{margin-right:0cm;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
.MsoChpDefault
	{font-family:"Calibri",sans-serif;}
.MsoPapDefault
	{margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:841.9pt 595.3pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
-->
</style>

</head>

<body lang=PT-BR link="#0563C1" vlink="#954F72">

<div class=WordSection1>

<div align=center>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width="100%"
 style=''width:100.0%;background:black;border-collapse:collapse''>
 <tr style=''height:1.0cm''>
  <td width="100%" valign=bottom style=''width:100.0%;padding:0cm 0cm 0cm 0cm;
  height:1.0cm''>
  <div align=center>
  <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=0
   style=''width:500.1pt;background:white;border-collapse:collapse''>
   <tr style=''height:1.0cm''>
    <td width=552 style=''width:413.85pt;background:black;padding:11.35pt 0cm 11.35pt 0cm;
    height:1.0cm''>
    <p class=MsoNormal style=''line-height:105%''><a name="_MailOriginal"></a><span
    style=''color:black''><img width=150 height=28
    src="https://taxcoe.deloitte.com.br/comunicacao/comunicado1/Deloitte.png"></span></p>
    </td>
    <td width=115 style=''width:86.25pt;background:black;padding:11.35pt 0cm 11.35pt 0cm;
    height:1.0cm''>
    <p class=MsoNormal align=right style=''text-align:right;line-height:105%''><span
    lang=EN-GB>&nbsp;</span></p>
    </td>
   </tr>
  </table>
  </div>
  </td>
 </tr>
</table>

</div>

<p class=MsoNormal><span lang=EN-GB style=''font-size:2.0pt;font-family:"Verdana",sans-serif;
color:black''>&nbsp;</span></p>

<div align=center>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=0
 style=''width:431.35pt;background:#F2F2F2;border-collapse:collapse''>
 <tr>
  <td width=712 valign=top style=''width:431.35pt;padding:5.65pt 5.65pt 5.65pt 5.65pt''>
  <div align=center>
  <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=0
   style=''width:420.05pt;background:#F2F2F2;border-collapse:collapse''>
   <tr>
    <td width=697 valign=top style=''width:420.05pt;padding:5.65pt 5.65pt 5.65pt 5.65pt''>
    <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
     align=left width=0 style=''width:396.75pt;border-collapse:collapse;
     margin-left:5.25pt;margin-right:5.25pt''>
     <tr>
      <td width=529 valign=top style=''width:396.75pt;background:#F2F2F2;
      padding:0cm 0cm 0cm 0cm''>
      <p class=MsoNormal style=''margin-top:12.0pt;margin-right:0cm;margin-bottom:
      12.0pt;margin-left:0cm;line-height:105%''><span style=''font-size:8.0pt;
      line-height:105%;color:#7F7F7F''>Tax Technology CoE  | '+ @dateMail +'</span></span></p>
      </td>
     </tr>
    </table>
    </td>
   </tr>
   <tr>
    <td width=697 valign=top style=''width:420.05pt;padding:5.65pt 5.65pt 5.65pt 5.65pt''>
    <div align=center>
    <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=0
     style=''width:510.9pt;background:white;border-collapse:collapse''>
     <tr style=''height:64.65pt''>
      <td width=681 style=''width:510.9pt;border:none;border-bottom:solid #F2F2F2 1.5pt;
      background:black;padding:0cm 0cm 0cm 0cm;height:64.65pt''>
      <p class=MsoNormal align=center style=''text-align:center;line-height:
      105%''><span lang=EN-US style=''color:black''><img width=357 height=240
      src="https://taxcoe.deloitte.com.br/comunicacao/comunicado1/Imagem2.gif"></span></p>
      </td>
     </tr>
     <tr style=''height:4.35pt''>
      <td width=681 valign=top style=''width:510.9pt;background:black;
      padding:22.7pt 22.7pt 22.7pt 22.7pt;height:4.35pt''>
      <p class=MsoNormal style=''line-height:105%;page-break-after:avoid''><span
      lang=EN-US style=''font-size:13.5pt;line-height:105%;font-family:"Arial",sans-serif;
      color:white''>Tax Scan Analytics – Tax Technology – CoE</span></p>
      </td>
     </tr>
    </table>
    </div>
    </td>
   </tr>
   <tr>
    <td width=697 valign=top style=''width:420.05pt;padding:5.65pt 5.65pt 5.65pt 5.65pt''>
    <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
    <div align=center>
    <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=0
     style=''width:511.2pt;background:white;border-collapse:collapse''>
     <tr style=''height:19.8pt''>
      <td width=682 valign=top style=''width:511.2pt;border:none;border-top:
      solid #86BC25 3.0pt;padding:0cm 22.7pt 0cm 22.7pt;height:19.8pt''>
      <p style=''text-align:justify;line-height:105%;background:white''><b><span
      style=''font-size:13.5pt;line-height:105%;font-family:"Arial",sans-serif;
      color:black''><br>
      Inclusão dos números de engagement ou oportunidade
	  </span></b></p>
      <p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''>
	  A
      partir do dia 20 de janeiro de 2020 passou a ser obrigatória a inclusão
      do(s) número(s) de engagement(s) ou oportunidade(s) para os projetos criados
      no Tax Scan Analytics (TSA).</span></p>
      <p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''>&nbsp;</span></p>
      <p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''>Identificamos
      que para os projetos abaixo não foram informados o número do engagement
      ou oportunidade:</span></p>
      <p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''>&nbsp;</span></p>
      <p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''>

'

SET @query = 	
		N'<table border="1",table align="center",border-width:1px,border-style:solid; td, th {
  padding: .7em;
  margin: 0;
  /*border: 1px solid #ccc;*/
 
}>'+
		N'<span  style=''font-size:9.0pt;font-family:"Verdana",sans-serif;color:black''> '+
		N'<tr><th>Projeto</th><th>Data do Cadastro</th>' + 
		CAST ( ( SELECT DISTINCT td = UPPER (proNome),'',
				tdd = proDataCadastro
			FROM [dbSendMail].dbo.tblMailing
			Where comCodigo = @comCodigo AND proEmail = @proEmail
			FOR XML PATH('tr'), TYPE
		) AS NVARCHAR(MAX)) +
		N'</table> '

SET @query = REPLACE(@query, '<tdd>', '<td style="text-align:center">')

SET @string2 = '		  
	  </span></p>
		<p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''>&nbsp;</span></p>
      <p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''>Para
      que o projeto continue ativo solicitamos a atualização deste com a
      inclusão do número do engagement ou da oportunidade <b><u>até 21/02/2020.</u></b></span></p>
      <p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><b><u><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''><span
       style=''text-decoration:none''>&nbsp;</span></span></u></b></p>
      <p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''>Caso
      não seja atualizado os dados do projeto o mesmo será arquivado e o acesso
      bloqueado.</span></p>
      <p class=MsoNormal><b><span style=''font-size:17.0pt;font-family:"Verdana",sans-serif''>&nbsp;</span></b></p>
      <p class=MsoNormal><b><span style=''font-size:17.0pt;font-family:"Verdana",sans-serif''>Dúvidas?</span></b></p>
      <p class=MsoNormal><span style=''font-family:"Verdana",sans-serif''>&nbsp;</span></p>
      <p class=MsoNormal style=''margin-bottom:6.0pt;text-align:justify''><span
      style=''font-size:10.0pt;font-family:"Verdana",sans-serif;color:black''>Para
      mais informações, entre em contato com a área de Tax Tecnology – CoE.</span></p>
      <p style=''text-align:justify;line-height:105%;background:white''><b><span
      style=''font-size:10.0pt;line-height:105%;font-family:"Verdana",sans-serif''>&nbsp;</span></b></p>
      </td>
     </tr>
     <tr style=''height:3.45pt''>
      <td width=682 valign=top style=''width:511.2pt;padding:0cm 22.7pt 0cm 22.7pt;
      height:3.45pt''>
      <p class=MsoNormal style=''line-height:105%''><span style=''color:black''>&nbsp;</span></p>
      </td>
     </tr>
     <tr style=''height:19.8pt''>
      <td width=682 valign=top style=''width:511.2pt;border:none;border-top:
      solid #86BC25 3.0pt;padding:0cm 22.7pt 0cm 22.7pt;height:19.8pt''>
      <p style=''text-align:justify;line-height:105%;background:white''><b><span
      style=''font-size:10.0pt;line-height:105%;font-family:"Verdana",sans-serif''>&nbsp;</span></b></p>
      </td>
     </tr>
     <tr style=''height:3.45pt''>
      <td width=682 valign=top style=''width:511.2pt;padding:0cm 22.7pt 0cm 22.7pt;
      height:3.45pt''>
      <p class=MsoNormal style=''line-height:105%''><span style=''color:black''>&nbsp;</span></p>
      </td>
     </tr>
    </table>
    </div>
    </td>
   </tr>
   <tr>
    <td width=697 valign=top style=''width:420.05pt;padding:5.65pt 5.65pt 5.65pt 5.65pt''>
    <div align=center>
    <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=0
     style=''width:510.95pt;background:white;border-collapse:collapse''>
     <tr style=''height:42.55pt''>
      <td width=681 style=''width:510.95pt;padding:14.2pt 22.7pt 14.2pt 22.7pt;
      height:42.55pt''>
      <p class=MsoNormal style=''text-align:justify''><span style=''font-size:
      7.0pt;font-family:"Verdana",sans-serif;color:#7F7F7F;background:white''>A
      Deloitte refere-se a uma ou mais entidades da Deloitte Touche Tohmatsu
      Limited, uma sociedade privada, de responsabilidade limitada,
      estabelecida no Reino Unido (&quot;DTTL&quot;), sua rede de
      firmas-membro, e entidades a ela relacionadas. A DTTL e cada uma de suas
      firmas-membro são entidades legalmente separadas e independentes. A DTTL
      (também chamada &quot;Deloitte Global&quot;) não presta serviços a
      clientes. Consulte <b>www.deloitte.com/about</b> para obter uma descrição
      mais detalhada da DTTL e suas firmas-membro.</span></p>
      <p class=MsoNormal style=''text-align:justify''><span style=''font-size:
      7.0pt;font-family:"Verdana",sans-serif;color:#7F7F7F;background:white''>&nbsp;</span></p>
      <p class=MsoNormal style=''text-align:justify''><span style=''font-size:
      7.0pt;font-family:"Verdana",sans-serif;color:#7F7F7F;background:white''>A
      Deloitte oferece serviços de auditoria, consultoria, assessoria
      financeira, gestão de riscos e consultoria tributária para clientes
      públicos e privados dos mais diversos setores. A Deloitte atende a quatro
      de cada cinco organizações listadas pela Fortune Global 500®, por meio de
      uma rede globalmente conectada de firmas-membro em mais de 150 países,
      trazendo capacidades de classe global, visões e serviços de alta
      qualidade para abordar os mais complexos desafios de negócios dos
      clientes. Para saber mais sobre como os cerca de 244.400 profissionais da
      Deloitte impactam positivamente nossos clientes, conecte-se a nós pelo
      Facebook, LinkedIn e Twitter.</span></p>
      <p class=MsoNormal style=''text-align:justify''><span style=''font-size:
      7.0pt;font-family:"Verdana",sans-serif;color:#7F7F7F;background:white''>&nbsp;</span></p>
      <p class=MsoNormal style=''line-height:105%''><span style=''font-size:7.0pt;
      line-height:105%;font-family:"Verdana",sans-serif;color:#7F7F7F;
      background:white''>©2020 Deloitte Touche Tohmatsu. Todos os direitos
      reservados.</span></p>
      </td>
     </tr>
    </table>
    </div>
    </td>
   </tr>
  </table>
  </div>
  </td>
 </tr>
</table>

</div>

<p class=MsoNormal>&nbsp;</p>

</div>

</body>

</html>'

SET @string = @string1 + @query + @string2

/*EXECUTA PROCEDURE msdb.dbo.sp_send_dbmail PARA ENVIAR E-MAIL*/
EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'brcoebrasil@deloitte.com',
@recipients = @proEmail,
--@blind_copy_recipients = 'pedrosouza@deloitte.com; aogatha@deloitte.com; danielacosta@deloitte.com',
----@blind_copy_recipients = 'danielacosta@deloitte.com',
--@subject = @comSubject,
--@body = @string,
--@body_format = 'HTML',
--@query_result_width = 90,
--@query_result_separator = ' ',
--@query_result_header = 0,
--@attach_query_result_as_file = 0,
--@execute_query_database = 'dbSendMail'

/*APAGA E-MAIL DA TABELA TEMPORÁRIA PARA RECEBER O PRÓXIMO*/
		DELETE
		FROM #tblMailingEmail
		WHERE proEmail = @proEmail


END

/*APAGA TABELA TEMPORÁRIA*/
DROP TABLE #tblMailingEmail

GO


