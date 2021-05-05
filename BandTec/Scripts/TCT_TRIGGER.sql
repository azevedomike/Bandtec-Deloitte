CREATE DATABASE NEW_TCT

USE SPED_TCC
SELECT * FROM I_MovimentacaoBasesTCT

EXEC tct_AlteraViewListaArquivosSUPORTE_s

create table I_MovimentacaoBasesTCT(
logon varchar(100),
databaseName varchar(70),
date datetime,
acao varchar(7)
)

DROP database  SPED_2_TCT

backup database SPED_TCC to disk = '\\brspgtfs\publico\Lucas Oliveira\SPED_TCC.bak' with stats = 1
use SPED_TCC
select * from I_MovimentacaoBasesTCT