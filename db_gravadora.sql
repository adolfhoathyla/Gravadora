CREATE DATABASE db_gravadora;

USE db_gravadora;

CREATE TABLE enderecos (
	endereco_id INT auto_increment NOT NULL,
	cidade varchar(45) NOT NULL,
	bairro varchar(45) NOT NULL,
	logradouro varchar(45) NOT NULL,
	numero INT not null,
	CONSTRAINT pk_endereco PRIMARY KEY(endereco_id)
);

CREATE TABLE instrumentos (
	instrumento_id INT auto_increment NOT NULL,
	nome varchar(45) NOT NULL,
	tom varchar(45) NOT NULL,
	CONSTRAINT pk_instrumento PRIMARY KEY(instrumento_id)
);

CREATE TABLE musicos (
	musico_id INT auto_increment NOT NULL,
	cpf varchar(45) NOT NULL,
	nome varchar(45) NOT NULL,
	id_endereco INT NOT NULL,
	CONSTRAINT pk_musico PRIMARY KEY(musico_id),
	CONSTRAINT fk_musico_endereco FOREIGN KEY(id_endereco) REFERENCES enderecos(endereco_id)
);

CREATE TABLE telefones (
	telefone_id INT auto_increment NOT NULL,
	tipo varchar(45) NOT NULL,
	numero varchar(45) NOT NULL,
	id_musico INT NOT NULL,
	CONSTRAINT pk_telefone PRIMARY KEY(telefone_id),
	CONSTRAINT fk_telefone_musico FOREIGN KEY(id_musico) REFERENCES musicos(musico_id)
);

CREATE TABLE albuns (
	album_id INT auto_increment NOT NULL,
	data_direitos_auto varchar(45) NOT NULL,
	formato varchar(45) NOT NULL,
	produtor INT NOT NULL,
	CONSTRAINT pk_album PRIMARY KEY(album_id),
	CONSTRAINT fk_album_musico FOREIGN KEY(produtor) REFERENCES musicos(musico_id)
);

CREATE TABLE musicas (
	musica_id INT auto_increment NOT NULL,
	titulo varchar(45) NOT NULL,
	autor varchar(45) NOT NULL,
	id_album INT NOT NULL,
	CONSTRAINT pk_musica PRIMARY KEY(musica_id),
	CONSTRAINT fk_musica_album FOREIGN KEY(id_album) REFERENCES albuns(album_id)
);

CREATE TABLE musico_instrumento (
	musico_id INT NOT NULL,
	instrumento_id INT NOT NULL,
	CONSTRAINT pk_musico_instrumento PRIMARY KEY(musico_id, instrumento_id),
	CONSTRAINT fk_musico_instrumento_musico FOREIGN KEY(musico_id) REFERENCES musicos(musico_id),
	CONSTRAINT fk_musico_instrumento_instrumento FOREIGN KEY(instrumento_id) REFERENCES instrumentos(instrumento_id)
);


CREATE TABLE musico_musica (
	musico_id INT NOT NULL,
	musica_id INT NOT NULL,
	CONSTRAINT pk_musico_musica PRIMARY KEY(musico_id, musica_id),
	CONSTRAINT fk_musico_musica_musico FOREIGN KEY(musico_id) REFERENCES musicos(musico_id),
	CONSTRAINT fk_musico_musica_musica FOREIGN KEY(musica_id) REFERENCES musicas(musica_id)
);