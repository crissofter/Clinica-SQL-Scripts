# Banco de Dados — Clínica de Fisioterapia Movimento & Vida

Este repositório contém todos os scripts SQL utilizados na criação, povoamento e manipulação do banco de dados desenvolvido para o projeto acadêmico da Clínica de Fisioterapia Movimento & Vida.

---

## 📌 Objetivo do Projeto

O objetivo deste projeto é:

- Criar um banco de dados relacional normalizado (1FN, 2FN e 3FN);
- Criar tabelas com integridade referencial (PK, FK, CHECK, NOT NULL);
- Povoar o banco com dados reais utilizando comandos INSERT;
- Realizar consultas SQL (SELECT), atualizações (UPDATE) e exclusões (DELETE);
- Consolidar o modelo lógico criado anteriormente no curso.

---

## 📁 Arquivos neste repositório

| Arquivo | Descrição |
|--------|-----------|
| **01_create_tables.sql** | Criação de todas as tabelas e relacionamentos |
| **02_insert_data.sql** | Inserção de dados de exemplo no banco |
| **03_select_queries.sql** | Consultas SQL com JOIN, filtros e ordenações |
| **04_updates.sql** | Atualizações de registros usando UPDATE |
| **05_deletes.sql** | Exclusões de registros usando DELETE |
| **README.md** | Documento explicativo do projeto |

---

## 🛠️ Tecnologias utilizadas

- **PostgreSQL**
- **PGAdmin 4**
- **SQL padrão**
- **GitHub** (para versionamento e entrega)

---

## 🚀 Como executar o projeto

1. **Criar o banco:**
```sql
CREATE DATABASE clinica;
01_create_tables.sql
02_insert_data.sql
03_select_queries.sql
04_updates.sql
05_deletes.sql
DELETE FROM paciente WHERE paciente_id = 1;
SELECT 
    s.sessao_id,
    s.data_agendada,
    p.nome AS paciente,
    f.nome AS fisioterapeuta
FROM sessao s
JOIN paciente p ON p.paciente_id = s.paciente_id
JOIN fisioterapeuta f ON f.fisioterapeuta_id = s.fisioterapeuta_id;

Normalização aplicada

O banco foi projetado seguindo as seguintes formas normais:

1FN: Todos os atributos são atômicos (sem multivalorados).

2FN: Não há dependências parciais (PK composta resolvida nas tabelas associativas).

3FN: Não existem dependências transitivas entre atributos não-chave.

👨‍⚕️ Contexto do minimundo

O sistema foi baseado na rotina de uma clínica de fisioterapia que gerencia:

Pacientes

Fisioterapeutas

Especialidades

Planos de tratamento

Sessões

Notas clínicas

Pagamentos

📬 Autor
Cristiano Pinto da Silva

Projeto desenvolvido para fins acadêmicos.
