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
    nome VARCHAR(50) NOT NULL
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

-- COOKIES
('Cookie Tradicional', '20', '25,00', '1'),
('Cookie Tradicional com amendoim', '20', '25,00', '1'),
('Cookie Chocolate com amendoim', '20', '25,00', '1'),
('Cookie Chocolate com confete', '20', '25,00', '1'),
('Cookie Chocolate com gotas pretas', '20', '25,00', '1'),
('Cookie Chocolate com gotas brancas', '20', '25,00', '1'),
('Cookie Nutella', '20', '25,00', '1'),
('Cookie Ninho', '20', '25,00', '1'),
('Cookie Ferrero Rocher', '20', '25,00', '1'),
('Cookie Red Valvet', '20', '25,00', '1'),

-- ÁGUAS
('Água sem gás 500ml', '100', '3,00', '2'),
('Água com gás 500ml', '100', '3,00', '2'),

-- CAFÉS
('Café expresso 300ml', '70', '5,00', '2'),
('Café expresso 200ml', '70', '3,75', '2'),
('Café expresso 100ml', '70', '2,50', '2'),
('Café com latte 300ml', '70', '6,00', '2'),
('Café com latte 200ml', '70', '4,75', '2'),
('Café com latte 100ml', '70', '3,50', '2'),
('Cappuccino 200ml', '70', '7,50', '2'),
('Cappuccino 300ml', '70', '9,00', '2'),

-- SUCOS
('Suco de Laranja 200ml', '50', '4,00', '2'),
('Suco de Uva 200ml', '50', '4,00', '2'),
('Suco de Abacaxi 200ml', '50', '4,00', '2'),
('Suco de Maçã 200ml', '50', '4,00', '2'),

-- REFRIGERANTES
('Coca-Cola Lata', '350ml', '50', '6,00', '2'),
('Coca-Cola Zero Lata', '350ml', '50', '6,00', '2'),
('Guaraná Lata', '350ml', '50', '6,00', '2'),
('Guaraná Zero Lata', '350ml', '50', '6,00', '2'),
('Sprite', '350ml', '50', '6,00', '2'),
('Sprite Zero Lata', '350ml', '50', '6,00', '2');


INSERT INTO ingredientes(nome)
VALUES

-- GERAIS
('Manteiga 15kg'),
('Açúcar Refinado 50kg'),
('Açúcar Mascavo 20kg'),
('Farinha de Trigo 25kg'),
('Fermento 2kg'),
('Bicarbonato 1kg'),
('Sal Tradicional 5kg'),
('Cartela de Ovos 30 unidades'),
('Essência de Baunilha 1l'),
('Cacau em Pó 5kg'),

-- ESPECIAIS
('Gotas de Chocolate ao Leite 5kg'),
('Gotas de Chocolate Branco 5kg'),
('Amendoim 5kg'),
('Confete Colorido 1kg'),
('Gotas de Chocolate ao Leite 5kg'),
('Corante Vermelho 1l'),
('Nutella 3kg'),
('Ninho 1kg'),
('Kit Ferrero Rocher 1kg');


INSERT INTO estoque(id_ingredientes, quantidade)
VALUES

-- GERAIS
('1', '10'),
('2', '4'),
('3', '6'),
('4', '10'),
('5', '15'),
('6', '15'),
('7', '8'),
('8', '20'),
('9', '5'),
('10', '10'),

-- ESPECIAIS
('11', '15'),
('12', '15'),
('13', '10'),
('14', '15'),
('15', '15'),
('16', '2'),
('17', '5'),
('18', '7'),
('19', '8');