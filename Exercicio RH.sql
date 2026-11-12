USE DB_T05072C_Joao_Pedro;

SELECT * FROM Locadora_Funcionario;

SELECT * FROM Locadora_Departamentos;

CREATE TABLE Locadora_Departamentos (
ID_Departamento INT PRIMARY KEY AUTO_INCREMENT,
Nome_Departamento VARCHAR(100) NOT NULL
);

CREATE TABLE Locadora_NivelSalarial (
ID_Salario INT PRIMARY KEY AUTO_INCREMENT,
Nivel VARCHAR(50) NOT NULL,
Salario_Min DECIMAL (10,2) NOT NULL,
Salario_Max DECIMAL (10,2) NOT NULL
);

ALTER TABLE Locadora_Funcionario
ADD COLUMN Salario DECIMAL(10,2) NOT NULL,
ADD COLUMN ID_Departamento INT,
ADD CONSTRAINT Locadora_Funcionario_ibfk_1
FOREIGN KEY (ID_Departamento) REFERENCES Locadora_Departamentos(ID_Departamento);

INSERT INTO Locadora_Departamentos (Nome_Departamento)
VALUES
('Vendas'),
('Atendimento'),
('Gerente'),
('Inovação');

INSERT INTO Locadora_NivelSalarial (Nivel, Salario_Min, Salario_Max)
VALUES
('Junior', 2000.00, 3500.00),
('Pleno', 3500.01, 6000.00),
('Senior', 6000.01, 12000.00);

INSERT INTO Locadora_Funcionario (Nome, CPF, Telefone, Email, Endereco, Cargo, Salario, ID_Departamento) 
VALUES 
('Carlos Andrade', '12345678901', '11999990001', 'carlos@email.com', 'Rua A', 'Vendedor Junior', 3000.00, 1),
('Mariana Lima', '12345678902', '11999990002', 'mariana@email.com', 'Rua B', 'Vendedora Pleno', 4500.00, 1),
('Roberto Souza', '12345678903', '11999990003', 'roberto@email.com', 'Rua C', 'Atendente Senior', 7000.00, 2);

SELECT D.Nome_Departamento, F.Nome AS Nome_Funcionario
FROM Locadora_Departamentos D
LEFT JOIN Locadora_Funcionario F ON D.ID_Departamento = F.ID_Departamento;

SELECT F.Nome, N.Nivel
FROM Locadora_Funcionario F 
LEFT JOIN Locadora_NivelSalarial N ON F.Salario BETWEEN N.Salario_Min AND N.Salario_Max;

SELECT F.Nome, N.Nivel, D.Nome_Departamento
FROM Locadora_Funcionario F 
JOIN Locadora_Departamentos D ON F.ID_Departamento = D.ID_Departamento
JOIN Locadora_NivelSalarial N ON F.Salario BETWEEN N.Salario_Min AND N.Salario_Max
WHERE N.Nivel = 'Pleno'AND D.Nome_Departamento = 'Vendas';
