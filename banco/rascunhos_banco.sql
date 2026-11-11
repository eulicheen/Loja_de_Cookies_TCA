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










