------------------------------------------------------------
-- CRIAÇÃO DAS TABELAS DO PROJETO
-- Banco: Clínica de Fisioterapia Movimento & Vida
------------------------------------------------------------

CREATE TABLE paciente (
    paciente_id SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(20) UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(30),
    email VARCHAR(150),
    sexo CHAR(1),
    endereco TEXT,
    contato_emergencia VARCHAR(200),
    historico_medico_resumido TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fisioterapeuta (
    fisioterapeuta_id SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    registro_profissional VARCHAR(50) UNIQUE,
    formacao VARCHAR(200),
    telefone VARCHAR(30),
    email VARCHAR(150),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE especialidade (
    especialidade_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE fisioterapeuta_especialidade (
    fisioterapeuta_id INT REFERENCES fisioterapeuta(fisioterapeuta_id) ON DELETE CASCADE,
    especialidade_id INT REFERENCES especialidade(especialidade_id) ON DELETE CASCADE,
    PRIMARY KEY (fisioterapeuta_id, especialidade_id)
);

CREATE TABLE treatment_plan (
    plano_id SERIAL PRIMARY KEY,
    paciente_id INT NOT NULL REFERENCES paciente(paciente_id) ON DELETE RESTRICT,
    fisioterapeuta_id INT REFERENCES fisioterapeuta(fisioterapeuta_id) ON DELETE SET NULL,
    data_inicio DATE,
    objetivo_tratamento TEXT,
    qtd_sessoes_previstas INT,
    status VARCHAR(30)
);

CREATE TABLE sessao (
    sessao_id SERIAL PRIMARY KEY,
    paciente_id INT NOT NULL REFERENCES paciente(paciente_id) ON DELETE RESTRICT,
    fisioterapeuta_id INT NOT NULL REFERENCES fisioterapeuta(fisioterapeuta_id) ON DELETE RESTRICT,
    plano_id INT REFERENCES treatment_plan(plano_id) ON DELETE SET NULL,
    data_agendada DATE NOT NULL,
    horario_inicio TIME,
    horario_fim TIME,
    tipo_sessao VARCHAR(50),
    status VARCHAR(30),
    observacao TEXT,
    sala VARCHAR(50),
    CHECK (horario_fim IS NULL OR horario_fim > horario_inicio)
);

CREATE TABLE clinical_note (
    nota_id SERIAL PRIMARY KEY,
    sessao_id INT REFERENCES sessao(sessao_id) ON DELETE CASCADE,
    fisioterapeuta_id INT REFERENCES fisioterapeuta(fisioterapeuta_id) ON DELETE SET NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    texto_nota TEXT,
    recomendado_exercicios TEXT
);

CREATE TABLE media (
    media_id SERIAL PRIMARY KEY,
    nota_id INT REFERENCES clinical_note(nota_id) ON DELETE SET NULL,
    sessao_id INT REFERENCES sessao(sessao_id) ON DELETE SET NULL,
    paciente_id INT NOT NULL REFERENCES paciente(paciente_id) ON DELETE CASCADE,
    tipo VARCHAR(20),
    caminho_arquivo TEXT NOT NULL,
    data_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao TEXT
);

CREATE TABLE pagamento (
    pagamento_id SERIAL PRIMARY KEY,
    paciente_id INT NOT NULL REFERENCES paciente(paciente_id) ON DELETE RESTRICT,
    data_pagamento DATE,
    valor_total DECIMAL(10,2),
    forma_pagamento VARCHAR(50),
    observacao TEXT,
    status_pagamento VARCHAR(30)
);

CREATE TABLE sessao_pagamento (
    sessao_id INT REFERENCES sessao(sessao_id) ON DELETE CASCADE,
    pagamento_id INT REFERENCES pagamento(pagamento_id) ON DELETE CASCADE,
    valor_pago DECIMAL(10,2),
    data_vinculo DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (sessao_id, pagamento_id)
);

CREATE TABLE system_user (
    usuario_id SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    login VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    perfil VARCHAR(50) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);
