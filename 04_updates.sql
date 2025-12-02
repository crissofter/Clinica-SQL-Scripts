------------------------------------------------------------
-- UPDATES (ATUALIZAÇÕES DE DADOS)
------------------------------------------------------------

-- Atualiza o telefone do paciente 1
UPDATE paciente
SET telefone = '(11)90000-0000'
WHERE paciente_id = 1;

------------------------------------------------------------

-- Marca a sessão 2 como realizada
UPDATE sessao
SET status = 'Realizada'
WHERE sessao_id = 2;

------------------------------------------------------------

-- Atualiza o valor total do pagamento 1
UPDATE pagamento
SET valor_total = 130.00
WHERE pagamento_id = 1;
