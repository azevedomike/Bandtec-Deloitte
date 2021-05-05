INSERT INTO USUARIO_FISICO(email,nome,senha,telefone,data_nascimento,cpf,foto,logado) VALUES
('victoria@gmail.com','Victoria Alves','c3601ad2286a4293868ec2a4bc606ba3','(11)94334-2124','1992-03-23','445.657.456-45',null,0),
('carlos@gmail.com','Carlos Rocha','9ad48828b0955513f7cf0f7f6510c8f8','(13)94456-7884','1985-04-12','223.435.344-32',null,0)

INSERT INTO USUARIO_JURIDICO(nome_ong,email,senha,telefone,cnpj,causa,foto,descricao,fk_endereco,logado) VALUES
('Greenpeace','greenpeace@greenpeace.com','e94c4c98058240f5343f18e9e4f7c07b','(11)94556-7655','21.385.837/0001-76',
'Meio-Ambiente',null,'Somos uma ONG que como principal objetivo, buscamos melhorar o meio-ambiente como um todo, tanto nos animais quantos na área ambiental.',7,0),
('Peacecorp','peacecorp@peacecorp.com','cfd135e95704025707981b3f1b05d56f','(11)5594-1234','26.181.759/0001-01',
'Direitos Civis',null,'Nossa verdade universal é que devemos nos unir em todas as situações para ajudar uns aos outros, venha fazer parte dessa mudança',8,0)

select * from usuario_fisico

select * from usuario_juridico

select * from vaga

delete from vaga

select * from usuario_fisico_vaga