------------------------------------------------------------
-- CONSULTAS SQL (SELECT)
------------------------------------------------------------

-- Lista todos os pacientes em ordem alfabética
SELECT 
    paciente_id, 
    nome, 
    cpf
FROM paciente
ORDER BY nome;

------------------------------------------------------------

-- Lista sessões com nome do paciente e fisioterapeuta
SELECT 
    s.sessao_id, 
    s.data_agendada, 
    p.nome AS paciente, 
    f.nome AS fisioterapeuta
FROM sessao s
JOIN paciente p ON s.paciente_id = p.paciente_id
JOIN fisioterapeuta f ON s.fisioterapeuta_id = f.fisioterapeuta_id
ORDER BY s.data_agendada;

------------------------------------------------------------

-- Lista os pagamentos com nomes dos pacientes
SELECT 
    pg.pagamento_id, 
    pg.valor_total, 
    p.nome AS paciente
FROM pagamento pg
JOIN paciente p ON pg.paciente_id = p.paciente_id;

------------------------------------------------------------

-- Seleciona apenas sessões que já foram realizadas
SELECT 
    sessao_id, 
    data_agendada, 
    status
FROM sessao
WHERE status = 'Realizada';

------------------------------------------------------------

-- Seleciona as últimas duas sessões cadastradas
SELECT 
    sessao_id, 
    data_agendada
FROM sessao
ORDER BY sessao_id DESC
LIMIT 2;
