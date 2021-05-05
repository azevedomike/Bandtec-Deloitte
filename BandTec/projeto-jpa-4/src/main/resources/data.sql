insert into pais (id, pais) values
(null, 'Itália'),
(null, 'EUA'),
(null, 'Japão'),
(null, 'Coreia');

insert into fabricante (id, nome, pais_origem_id) values
(null, 'Fiat', 1),
(null, 'Ferrari', 1),
(null, 'GM', 2),
(null, 'Tesla', 2),
(null, 'Honda', 3),
(null, 'Nissan', 3),
(null, 'Hyndai', 4);

insert into carro (id, modelo, potencia, fabricante_id) values
(null, 'Palio', 1.0, 1),
(null, 'Uno', 1.2, 1),
(null, 'Enzo', 5.0, 2),
(null, 'Gol', 1.0, 3),
(null, 'Model S', 3.5, 4),
(null, 'Fit', 1.8, 5),
(null, 'City', 2.0, 5),
(null, 'Kicks', 1.8, 6),
(null, 'HB20', 1.4, 7),
(null, 'CRV', 1.8, 7);