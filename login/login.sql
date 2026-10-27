DROP DATABASE IF EXISTS cadastro;
CREATE DATABASE cadastro;
\c cadastro;

CREATE TABLE usuario(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email UNIQUE NOT NULL,
    senha_hash VARCHAR(50) NOT NULL,
    id_cargo INT REFERENCES cargo(id)
);

CREATE TABLE cliente(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
);

CREATE TABLE administrador(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    id_permissoes INT REFERENCES permissoes(id)
);

CREATE TABLE permissoes(
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE cargo(
    id SERIAL PRIMARY KEY,
    cargo CHECK (cargo IN ('administrador', 'cliente')),
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE cargo_permissoes(
    id_cargo INT NOT NULL REFERENCES cargo(id),
    id_permissoes INT NOT NULL REFERENCES permissoes(id),
    PRIMARY KEY(id_cargo, id_permissoes)
);

INSERT INTO permissoes(codigo, descricao)
VALUES
()

INSERT INTO cargo(cargo, nome, descricao)
VALUES
()