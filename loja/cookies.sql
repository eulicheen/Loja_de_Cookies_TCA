DROP DATABASE IF EXISTS cookies;
CREATE DATABASE cookies;
\c cookies;

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



CREATE TABLE pedido(
    id SERIAL PRIMARY KEY,
    hora_pedido TIMESTAMP NOT NULL,
    id_cliente INT REFERENCES cliente(id)
);

CREATE TABLE tipo_produto(
    id SERIAL PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL,
);

CREATE TABLE produto(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    quantidade INT,
    preco INT,
    id_tipo_produto INT REFERENCES tipo_produto(id)
);

CREATE TABLE ingredientes(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    quantidade INT
);

CREATE TABLE estoque(
    id SERIAL PRIMARY KEY,
    id_ingredientes INT REFERENCES ingredientes(id)
    quantidade INT,
    PRIMARY KEY(id_ingredientes)
);

-- CREATE TABLE ingrediente_produto

INSERT INTO tipo_produto(categoria)
VALUES
('Comida'),
('Bebida');

INSERT INTO produto(nome, quantidade, preco, tipo_produto)
VALUES
('Água sem gás 500ml', '150', '3,00', '2'),
('Água com gás 500ml', '150', '3,00', '2'),
('Café preto 300ml', '50', '5,00', '2'),
()