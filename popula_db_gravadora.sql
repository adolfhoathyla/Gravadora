INSERT INTO telefones(tipo, numero, id_musico)
	VALUES('Celular', '85 8945-8970', 1);

INSERT INTO enderecos(cidade, bairro, logradouro, numero)
	VALUES('Fortaleza', 'Aerolandia', 'Rua alegre', 22);

INSERT INTO musicos(cpf, nome, id_endereco)
	VALUES('089.453.345-89', 'Goku', 1);

INSERT INTO instrumentos(nome, tom)
	VALUES('Piano', 'C#');

INSERT INTO musico_instrumento(musico_id, instrumento_id)
	VALUES(1, 1);

INSERT INTO albuns(data_direitos_auto, formato, produtor)
	VALUES('12/04/2011', 'CD', 1);

INSERT INTO musicas(titulo, autor, id_album)
	VALUES('Música da meia noite', 'Vegeta', 1);

INSERT INTO musicas(titulo, autor, id_album)
	VALUES('DBZ', 'Gohan', 1);

INSERT INTO musico_musica(musico_id, musica_id)
	VALUES(1, 1);

SELECT mus.nome, a.formato, musicas.titulo
FROM musicos mus INNER JOIN albuns a ON mus.musico_id = a.produtor
	INNER JOIN musicas ON a.album_id = musicas.id_album
	WHERE mus.musico_id = 1;