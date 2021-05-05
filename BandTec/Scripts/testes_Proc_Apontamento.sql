USE dbCOEServiceDesk

SELECT * FROM tblApontamentoDiario where proEngagement is not null and funTime = 12750 order by data desc

--codApontamento= 46

EXEC dbo.sdt_AlterarApontamento_u 
@funTime = 12750,
@dataAnterior = '2017-10-05',
@qtdHorasAnterior = 4.0,
@proEngagementAnterior = 90120115,
@data = '2020-01-23',
@qtdHoras = 5.0,
@proEngagement = 90120172,
@descricao = 'testando'

EXEC dbo.sdt_InserirApontamento_i 
@funTime = 5498,
@data = '2019-01-12',
@qtdHoras = 2.1,
@proEngagement = 90120158,
@descricao = '*Descrição do apontamento*'