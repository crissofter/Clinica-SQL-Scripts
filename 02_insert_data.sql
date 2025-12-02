------------------------------------------------------------
-- POPULAÇÃO DAS TABELAS PRINCIPAIS
------------------------------------------------------------

INSERT INTO paciente (nome, cpf, data_nascimento, telefone, email, sexo, endereco, contato_emergencia, historico_medico_resumido)
VALUES
('Ana Souza', '123.456.789-00', '1990-05-12', '(11)99999-1111', 'ana@exemplo.com', 'F', 'Rua A, 123', 'Maria - irmã', 'Dor lombar'),
('Carlos Pereira', '987.654.321-00', '1985-11-20', '(11)98888-2222', 'carlos@exemplo.com', 'M', 'Rua B, 456', 'João - pai', 'Tendinite no ombro');

INSERT INTO fisioterapeuta (nome, registro_profissional, formacao, telefone, email)
VALUES
('Dr. Lucas Almeida', 'CREFITO-12345', 'Ortopedia', '(11)97777-3333', 'lucas@clinica.com'),
('Dra. Marina Oliveira', 'CREFITO-98765', 'Respiratória', '(11)96666-4444', 'marina@clinica.com');

INSERT INTO especialidade (nome, descricao)
VALUES
('Ortopedia', 'Problemas musculoesqueléticos'),
('Respiratória', 'Função pulmonar');

INSERT INTO fisioterapeuta_especialidade VALUES 
(1,1), 
(2,2);

INSERT INTO treatment_plan (paciente_id, fisioterapeuta_id, data_inicio, objetivo_tratamento, qtd_sessoes_previstas, status)
VALUES
(1,1,'2025-01-10','Reabilitação lombar',10,'Ativo'),
(2,2,'2025-01-12','Melhora respiratória',8,'Ativo');

INSERT INTO sessao (paciente_id, fisioterapeuta_id, plano_id, data_agendada, horario_inicio, horario_fim, tipo_sessao, status)
VALUES
(1,1,1,'2025-01-15','09:00','10:00','Avaliação','Realizada'),
(1,1,1,'2025-01-18','09:00','10:00','Sessão Ortopédica','Agendada'),
(2,2,2,'2025-01-16','14:00','15:00','Sessão Respiratória','Realizada');

INSERT INTO pagamento (paciente_id, data_pagamento, valor_total, forma_pagamento, status_pagamento)
VALUES
(1,'2025-01-15',120.00,'PIX','Pago'),
(2,'2025-01-16',100.00,'Débito','Pago');

INSERT INTO sessao_pagamento VALUES
(1,1,120.00),
(3,2,100.00);

INSERT INTO clinical_note (sessao_id, fisioterapeuta_id, texto_nota, recomendado_exercicios)
VALUES
(1,1,'Dor lombar moderada.','Alongamento de posterior'),
(3,2,'Melhora respiratória significativa.','Exercícios diafragmáticos');
