------------------------------------------------------------
-- DELETES (EXCLUSÃO DE DADOS)
------------------------------------------------------------

-- Remove uma mídia específica
DELETE FROM media 
WHERE media_id = 1;

------------------------------------------------------------

-- Remove uma sessão específica
DELETE FROM sessao 
WHERE sessao_id = 2;

------------------------------------------------------------

-- Remove uma especialidade
DELETE FROM especialidade 
WHERE especialidade_id = 2;
