

select * from usuario_fisico_vaga

INSERT INTO VAGA(titulo,causa,descricao,data_inicio,data_fim,foto,fk_endereco,fk_usuario_juridico) VALUES 
('Trabalho de marcenaria para construir m�veis', 'Lares','Design e montagem de m�veis para lares de pessoas com baixa renda e restaura��o de carteiras e mesas de escolas e orfanatos que n�o possuem a verba para adquirir novos.',
'2021-02-01','2021-03-01','fotos/vaga-lares.jpg',1,8),
('Odontologia para crian�as na comunidade','Crian�as','Visitar as comunidades para realizar consultas odontol�gicas em crian�as de 2 � 12 anos, visando sanar as manuten��es necess�rias e tamb�m efetuar uma educa��o de sa�de dent�ria.',
'2020-12-09','2020-03-08','fotos/vaga-criancas.jpg',2,5),
('Criando um bom lar para as nossas tartarugas','Animais','Buscando pessoas com ou sem conhecimento em medicina veterin�ria, para ajudar a melhorar o meio-ambiente de nossos amigos marinhos e ajudar as tartarugas com necessidade de ajuda veterin�ria.',
'2021-07-03','2021-09-14','fotos/vaga-animais.jpg',3,3),
('Levar alegria aos nossos pequenos amiguinhos','Crian�as com Defici�ncia','Voc� est� disposto a gerar um sorriso ? Tem a vontade de induzir as pequenas crian�as que est�o em um hospital a ter sempre mais esperan�a ? Ent�o este � o lugar certo para voc� se candidatar.',
'2020-12-12','2021-03-02','fotos/vaga-criancas-com-deficiencia.jpg',4,7),
('Assist�ncia jur�dica para defender causa de viol�ncias dom�sticas','Direitos Civis','Procuramos pessoas com forma��o e experi�ncia jur�dica para poder realizar atividades pr�-bonos, visando defender a causa de prote��o para as mulheres v�timas de viol�ncia dom�stica para que mais vozes sejam ouvidas sobre essa quest�o.',
'2021-04-02','2021-05-08','fotos/vaga-direitos-civis.jpg',5,6),
('Visita m�dica a lares de idosos','Idosos','Vaga para pessoas da �rea m�dica para efetuarem consulta e poss�veis pedidos para exames m�dicos, em lares de idosos aonde o mesmo se encontra com dificuldades para levar os seus idosos para os hospitais.',
'2020-12-09','2020-03-08','fotos/vaga-idosos.jpg',6,2),
('Reciclagem nas �reas litor�neas e urbanas ap�s o Reveillon','Meio-ambiente','Voc� gosta de morar ou de visitar uma cidade e ela estiver limpinha ? Ent�o cadastre nessa vaga para que possamos nos orgarnizarmos para viver em um mundo mais Ecologicamente consciente.',
'2020-12-28','2021-01-02','fotos/vaga-meio-ambiente.jpg',7,4)

delete from vaga

select * from endere


INSERT INTO Endereco(logradouro,numero_endereco,CEP,bairro,estado,cidade) VALUES
('Rua do Carmo', 21, '04500-930','Vila Ede','SP','Campinas'),
('Rua Royal', 33,'29300-982','Nova Aurora', 'PA','Jo�o Pessoa'),
('Rua do Abutre', 594,'33045-721','Palestra Nuestra', 'PE','Recife'),
('Avenida do Sert�o', 3300, '09855-102','Nova Almeida','SP','S�o Paulo'),
('Rua dos Unidos', 1200,'09978-130','Colorado','BA','Salvador'),
('Travessa da Alegria', 344, '08823-122','Maestria Nova','PR','Foz do Igua��'),
('Avenida Jabaquara', 3045,'02203-455','Jabaquara','SP','S�o Paulo')

delete from endereco where id = 11

INSERT INTO usuario_juridico(nome_ong,email,senha,telefone,cnpj,causa,foto,descricao,fk_endereco,logado) VALUES
('Vida Nova','vidanova@vidanova.com','dda2ac89aa5adffd132d7ef4a7beb6ca','1194546-0092','51.875.261/0001-96','Idosos',null,'A melhor idade � a de agora. Transformando a vida de uma gera��o n�o esquecida.',6,0),
('Futuro Belo','futurobelo@futurobelo.com','d2ee6f39c83dd22e0267a02405671705','1597483-0293','62.608.656/0001-49','Animais',null,'Al�m da ra�a humana, levando para nosso planeta uma vis�o de que n�o estamos sozinhos.',3,0),
('GreenPeace','greenpeace@greenpeace.com','e94c4c98058240f5343f18e9e4f7c07b','133784-9453','83.046.136/0001-60','Meio-Ambiente',null,'Dentro de n�s existe o meio-ambiente, ajude a nos proteger.',7,0),
('PeaceCorp','peacecorp@peacecorp.com','cfd135e95704025707981b3f1b05d56f','197634-1585','25.518.215/0001-20','Crian�as',null,'Voc� j� fez alguma coisa no presente que mudou o nosso futuro ? Pois o nosso futuro s�o as crian�as de hoje.',2,0),
('Esperan�a Sempre','esperancasempre@esperancasempre.com','01fe906bfecf6ce5740bfe20aa23051c','2195634-0928','48.717.652/0001-78','Direitos Civis',null,'A suprema arte da guerra � derrotar o inimigo sem lutar. Vamos em buscas dos direitos dos necessitados.',5,0),
('Crian�a Esperan�a','criancaesperanca@criancaesperanca.com','219092f75b76092fe761edc8a3512f50','2297689-1234','78.465.348/0001-41','Crian�as com Defici�ncia',null,'Buscamos levar para pessoas portadoras de defici�ncias a oportunidade de uma vida esperan�osa e cheia de possibilidades.',4,0),
('InovaLar','inovalar@inovalar.com','e88ad6bc7d8aab1e167388190cd0719f','1398765-4321','82.028.974/0001-48','Lares',null,'Todos merecem se sentir confortav�is em seu pr�prio lar, isso que temos como meta.',4,0)


