


CREATE DATABASE dbBancoCentral


USE dbBancoCentral

DROP TABLE tblCabecalho
DROP TABLE tblCabecalhoId


CREATE TABLE tblCabecalhoId
(
datasBaseReferencia INT PRIMARY KEY,
id VARCHAR (10),
data VARCHAR (10)
)


CREATE TABLE tblCabecalho
(
cnpj VARCHAR (14),
codigoDocumento VARCHAR (55),
tipoRemessa VARCHAR (15),
unidadeMedida VARCHAR (15),
dataBas VARCHAR (15),
datasBaseReferencia INT FOREIGN KEY REFERENCES tblCabecalhoId (datasBaseReferencia)
)




INSERT INTO tblCabecalhoId VALUES (1, 'dt1', 'S062019')
INSERT INTO tblCabecalhoId VALUES (2, 'dt2', 'S122018')
INSERT INTO tblCabecalhoId VALUES (3, 'dt3', 'S062018')

INSERT INTO  tblCabecalho VALUES ('99999999', '9999', 'S', '1000', '062019',1)
INSERT INTO  tblCabecalho VALUES ('99999999', '9999', 'S', '1000', '062019',2)
INSERT INTO  tblCabecalho VALUES ('99999999', '9999', 'S', '1000', '062019',3)



SELECT	cnpj as '@cnpj',
		codigoDocumento as '@codigoDocumento' ,
		tipoRemessa as '@tipoRemessa',
		unidadeMedida as '@unidadeMedida',
		dataBas as '@database',
		id as '@id',
		data as '@data'
FROM tblCabecalho a
	INNER JOIN tblCabecalhoId datasBaseReferencia
	ON a.datasBaseReferencia = datasBaseReferencia.datasBaseReferencia
	FOR JSON AUTO



----- Balanço Patrimonial

--drop table tblValoIndividual
--drop table tblValoConsolidado
--drop table tblBalancoPatrimonial

CREATE TABLE tblValoIndividual
(
idValoresIndividualizados int primary key,
dtBaseInd varchar (50),
valorInd varchar (50)
)


CREATE TABLE tblValoConsolidado
(
idValoresConsolidados int primary key,
dtBaseCons varchar (50),
valorCons varchar (50)
)


CREATE TABLE tblBalancoPatrimonial
(
idbalanco int identity (1,1) primary key,
id	varchar (50),
nivel varchar (50),	
descricao	varchar (50),
contaPai varchar (50),
idValoresIndividualizados INT FOREIGN KEY REFERENCES tblValoIndividual (idValoresIndividualizados),
idValoresConsolidados INT FOREIGN KEY REFERENCES tblValoConsolidado (idValoresConsolidados)
)

INSERT INTO tblValoIndividual VALUES (1, 'dt1', '9999.99')
INSERT INTO tblValoIndividual VALUES (2, 'dt2', '9999.99')


INSERT INTO tblValoConsolidado VALUES (1, 'dt1', '9999.99')
INSERT INTO tblValoConsolidado VALUES (2, 'dt2', '9999.99')

INSERT INTO tblBalancoPatrimonial (id, nivel, descricao,contaPai,idValoresIndividualizados,idValoresConsolidados) VALUES ('conta1','1','Ativo','',1,1)
INSERT INTO tblBalancoPatrimonial (id, nivel, descricao,contaPai,idValoresIndividualizados,idValoresConsolidados) VALUES ('conta1','1','Ativo','',2,2)




SELECT			id	as '@id',
		nivel  as '@nivel',	
		descricao as '@descricao',
		contaPai as '@contaPai',
		dtBaseInd as '@dtBase',
		valorInd as '@valor',
		dtBaseCons as '@dtBase',
		valorCons as '@valor'

FROM tblBalancoPatrimonial BalancoPatrimonial

	LEFT JOIN tblValoIndividual AS valoresIndividualizados
	ON BalancoPatrimonial.idValoresIndividualizados = valoresIndividualizados.idValoresIndividualizados

	LEFT JOIN tblValoConsolidado AS valoresConsolidados
	ON BalancoPatrimonial.idValoresConsolidados = valoresConsolidados.idValoresConsolidados

	FOR JSON AUTO


	--select * from tblBalancoPatrimonial
	--	select * from tblValoIndividual
	--		select * from tblValoConsolidado