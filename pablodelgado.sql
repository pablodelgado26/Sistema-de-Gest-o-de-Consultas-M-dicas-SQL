CREATE DATABASE sistema_consulta;

CREATE TABLE pacientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE
);

CREATE TABLE medicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    especialidades VARCHAR(100)
);

CREATE TABLE consultas (
    id SERIAL PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data_consulta DATE,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES medicos(id)
);

INSERT INTO pacientes (nome, data_nascimento) VALUES
('João Silva', '26-05-2001'),
('Felipe Santos', '13-03-1992'),
('Thiago Ferreira', '25-12-1998');

INSERT INTO medicos (nome, especialidades) VALUES
('Dr. Carlos', 'Ortopedista'),
('Dr. Ana', 'Cardiologista'),
('Dr. Gustavo', 'Podólogo');

INSERT INTO consultas (paciente_id, medico_id, data_consulta) VALUES
(1, 1, '2021-10-10'),
(2, 2, '2021-10-21'),
(3, 3, '2021-11-09');

SELECT
    p.nome AS nome_paciente,
    m.nome AS nome_medico,
    c.data_consulta,
    m.especialidades
FROM
    consultas c
JOIN
    pacientes p ON c.paciente_id = p.id
JOIN
    medicos m ON c.medico_id = m.id;

SELECT
    p.nome AS nome_paciente,
    c.data_consulta,
    m.nome AS nome_medico,
    m.especialidades
FROM
    pacientes p
LEFT JOIN
    consultas c ON p.id = c.paciente_id
LEFT JOIN
    medicos m ON c.medico_id = m.id;

SELECT
    M.nome AS nome_medico,
    m.especialidades
FROM
    medicos m
LEFT JOIN
    consultas c ON m.id = c.medico_id
WHERE
    c.id IS NULL;

