CREATE TABLE psicologo (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE paciente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    psicologo_id INT NOT NULL REFERENCES psicologo(id) ON DELETE CASCADE
);

CREATE TABLE agendamento (
    id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL,
    psicologo_id INT NOT NULL REFERENCES psicologo(id) ON DELETE CASCADE,
    paciente_id INT NOT NULL REFERENCES paciente(id) ON DELETE CASCADE
);

INSERT INTO psicologo (nome, cpf, senha) VALUES
('Carlos Silva', '111.222.333-44', 'senha123'),
('Ana Souza', '222.333.444-55', 'senha456'),
('Marcos Oliveira', '333.444.555-66', 'senha789');
			
INSERT INTO paciente (nome, cpf, psicologo_id) VALUES
('Pedro Santos', '444.555.766-77', 3),
('Juliana Costa', '555.676.777-88', 2),
('Rafael Lima', '667.777.888-99', 1);

INSERT INTO agendamento (data_hora, psicologo_id, paciente_id) VALUES
('2026-11-20 14:00:00', 1, 1),
('2026-11-18 10:30:00', 2, 2),
('2026-11-19 16:00:00', 3, 3);

SELECT * FROM psicologo