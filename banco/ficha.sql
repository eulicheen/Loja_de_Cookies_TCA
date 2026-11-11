DROP TABLE IF EXISTS permissoes_perfil;
DROP TABLE IF EXISTS perfil;
DROP TABLE IF EXISTS permissoes;


CREATE TABLE permissoes(
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT,
    cargo VARCHAR(50) CHECK (cargo IN ('usuario', 'administrador'))
);


CREATE TABLE perfil(
    user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    PRIMARY KEY(user_id),
    nome VARCHAR(50) NOT NULL,
    cargo VARCHAR(50) CHECK (cargo IN ('usuario', 'administrador'))
);

CREATE TABLE permissoes_perfil(
    id_permissoes INT NOT NULL REFERENCES permissoes(id),
    user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    PRIMARY KEY(user_id)
);


INSERT INTO permissoes(codigo, descricao, cargo)
VALUES

-- USUÁRIO
('criar.ficha', 'criar fichas', 'usuario'),
('ver.ficha', 'ver fichas', 'usuario'),
('editar.ficha', 'editar fichas', 'usuario'),
('apagar.ficha', 'apagar fichas', 'usuario'),


-- ADMINISTRADOR 
('criar.ficha', 'criar fichas', 'administrador'),
('ver.ficha', 'ver fichas', 'administrador'),
('editar.ficha', 'editar fichas', 'administrador'),
('apagar.ficha', 'apagar fichas', 'administrador');


CREATE TABLE arquetipo(
    id PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE pericias(
    id PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE ficha(
    id PRIMARY KEY,
    nome_player VARCHAR(50),
    vida INT check (vida <= 6),
    dados INT check (dados <= 6),
    habilidades TEXT,
    id_arquetipo INT REFERENCES arquetipo(id),
    id_pericias INT REFERENCES pericias(id)
);


INSERT INTO arquetipo (nome)
VALUES

('herói'),
('atleta'),
('valentão'),
('esbelto'),
('inocente'),
('nerd'),
('relaxado'),
('cético');

INSERT INTO pericias (nome)
VALUES

('força'),
('agilidade'),
('astucia'),
('vigor'),
('carisma');