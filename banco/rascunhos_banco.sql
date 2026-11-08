SELECT
FROM 
JOIN
WHERE 




ALTER TABLE "cargo"
enable row level security;


CREATE POLICY "cliente vê os produtos"
ON cliente FOR SELECT
TO AUTHENTICATED
  USING (
     EXISTS (
      SELECT produto.nome FROM produto
      WHERE id = auth.uid() and cargo = ('administrador', 'cliente')
    )
  );


CREATE POLICY "usuario autenticado" 
ON cliente
FOR UPDATE USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);



CREATE POLICY "administrador apaga ingredientes"
ON ingredientes FOR DELETE
TO AUTHENTICATED
  USING (
     EXISTS (
      SELECT 1 FROM ingredientes
      WHERE id = auth.uid() and cargo = 'administrador'
    )
  );

CREATE POLICY "administrador apaga estoque"
ON estoque FOR DELETE
TO AUTHENTICATED
  USING (
     EXISTS (
      SELECT 1 FROM estoque
      WHERE id = auth.uid() and cargo = 'administrador'
    )
  );



-- Anyone can read the leaderboard
create policy "Leaderboard is public"
  on leaderboard
  for select
  to anon, authenticated
  using (true);

-- Authenticated users can submit and update scores
create policy "Authenticated users can submit scores"
  on leaderboard
  for insert
  to authenticated
  with check (true);

create policy "Authenticated users can update scores"
  on leaderboard
  for update
  to authenticated
  using (true)
  with check (true);










DROP TABLE IF EXISTS itens_pedidos CASCADE;
DROP TABLE IF EXISTS pedidos CASCADE;
DROP TABLE IF EXISTS produtos CASCADE;
DROP TABLE IF EXISTS administrador CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS cargo_permissoes CASCADE;
DROP TABLE IF EXISTS permissoes CASCADE;
DROP TABLE IF EXISTS cargo CASCADE;


CREATE TABLE cargo(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
    -- cargo CHECK (cargo IN ('administrador', 'cliente'))
);

CREATE TABLE permissoes(
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE cargo_permissoes(
    id_cargo INT NOT NULL REFERENCES cargo(id),
    id_permissoes INT NOT NULL REFERENCES permissoes(id),
    PRIMARY KEY(id_cargo, id_permissoes)
);

CREATE TABLE cliente(
    id SERIAL PRIMARY KEY,
    user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    nome VARCHAR(50) NOT NULL,
    id_cargo INT REFERENCES cargo(id)
);

CREATE TABLE administrador(
    id SERIAL PRIMARY KEY,
    user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    nome VARCHAR(50) NOT NULL,
    id_cargo INT REFERENCES cargo(id)
);



-- INSERT INTO permissoes(codigo, descricao)
-- VALUES
-- ()

INSERT INTO cargo(nome, descricao)
VALUES
('Cliente', 'Faz pedidos'),
('Administrador', 'Administra pedidos');



CREATE TABLE produtos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    preco FLOAT
);

CREATE TABLE pedidos(
    id SERIAL PRIMARY KEY,
    hora_pedido TIMESTAMP NOT NULL DEFAULT NOW(),
    id_cliente INT REFERENCES cliente(id),
    id_produtos INT REFERENCES produtos(id)
);

CREATE TABLE itens_pedidos(
    id SERIAL PRIMARY KEY,
    quantidade INT NOT NULL DEFAULT 1,
    preco_item FLOAT NOT NULL,
    id_pedidos INT NOT NULL REFERENCES pedidos(id) ON DELETE CASCADE,
    id_produtos INT NOT NULL REFERENCES produtos(id)
);

INSERT INTO produtos(nome, quantidade, preco)
VALUES

-- COOKIES
('Cookie Tradicional', '20', '25.00'),
('Cookie Tradicional com amendoim', '20', '25.00'),
('Cookie Chocolate com amendoim', '20', '25.00'),
('Cookie Chocolate com confete', '20', '25.00'),
('Cookie Chocolate com gotas pretas', '20', '25.00'),
('Cookie Chocolate com gotas brancas', '20', '25.00'),
('Cookie Nutella', '20', '25.00'),
('Cookie Ninho', '20', '25.00'),
('Cookie Ferrero Rocher', '20', '25.00'),
('Cookie Red Valvet', '20', '25.00'),

-- ÁGUAS
('Água sem gás 500ml', '100', '3.00'),
('Água com gás 500ml', '100', '3.00'),

-- CAFÉS
('Café expresso 300ml', '70', '5.00'),
('Café expresso 200ml', '70', '3.75'),
('Café expresso 100ml', '70', '2.50'),
('Café com latte 300ml', '70', '6.00'),
('Café com latte 200ml', '70', '4.75'),
('Café com latte 100ml', '70', '3.50'),
('Cappuccino 200ml', '70', '7.50'),
('Cappuccino 300ml', '70', '9.00'),

-- SUCOS
('Suco de Laranja 200ml', '50', '4.00'),
('Suco de Uva 200ml', '50', '4.00'),
('Suco de Abacaxi 200ml', '50', '4.00'),
('Suco de Maçã 200ml', '50', '4.00'),

-- REFRIGERANTES
('Coca-Cola Lata 350ml', '50', '6.00'),
('Coca-Cola Zero Lata 350ml', '50', '6.00'),
('Guaraná Lata 350ml', '50', '6.00'),
('Guaraná Zero Lata 350ml', '50', '6.00'),
('Sprite 350ml', '50', '6.00'),
('Sprite Zero Lata 350ml', '50', '6.00');