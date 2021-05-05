CREATE DATABASE TALENT_QLIK

CREATE TABLE qlikTalentData (
usuário VARCHAR(60),
email VARCHAR(90),
questao VARCHAR(120),
resposta VARCHAR(120),
acerto CHAR(3),
dataResposta DATETIME
)

CREATE TABLE qlikTalentCenso(
data DATE,
presencial CHAR(3),
remoto CHAR(3)
)

CREATE TABLE qlikTalentPresencial(
data DATE,
local VARCHAR (20),
quantidade INTEGER
)

CREATE TABLE qlikTalentEscritorio(
data DATE,
escritorio VARCHAR(40),
quantidade INTEGER
)