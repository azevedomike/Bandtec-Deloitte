USE dbSendMail

select * from tblMailing
select * from tblComunicado
select * from tblEmail

insert into tblEmail (emlNome,emlEmail,emlAtivo) values ('Mike Melo Azevedo','mikazevedo@deloitte.com.br',1)


insert into tblComunicado values ('Teste da nova procedure')

insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (2,1455,'teste1','27/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (2,1456,'teste2','27/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (2,1457,'teste3','27/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (2,1458,'teste4','27/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (2,1459,'teste5','27/01/2020',2)

insert into tblComunicado values ('Teste da nova procedure 2')

insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (3,1455,'teste1','27/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (3,1456,'teste2','27/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (3,1457,'teste3','27/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (3,1458,'teste4','27/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (3,1459,'teste5','27/01/2020',2)

insert into tblComunicado values ('Teste da nova procedure 3')

insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (4,1460,'teste1','28/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (4,1461,'teste2','28/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (4,1462,'teste3','28/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (4,1463,'teste4','28/01/2020',2)
insert into tblMailing (comCodigo,proCodigo,proNome,proDataCadastro,emlCodigo) values (4,1464,'teste5','28/01/2020',2)


EXEC sndMailComunicadoCopia @comCodigo=2

select * from tblLog
