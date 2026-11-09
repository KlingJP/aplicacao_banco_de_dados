USE DB_T05072C_Joao_Pedro;

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Automovel (
    ID_Automovel INT PRIMARY KEY AUTO_INCREMENT,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Tipo VARCHAR(50) NOT NULL
);

CREATE TABLE DataLocacao (
    ID_DataLocacao INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT,
    ID_Automovel INT,
    DataInicioLocacao DATE,
    DataFinalLocacao DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente),
    FOREIGN KEY (ID_Automovel) REFERENCES Automovel (ID_Automovel)
);

INSERT INTO Cliente (Nome, Sobrenome, Telefone, Email)
VALUES
('Carlos', 'Ferreira', '(11) 98765-4321', 'carlos@email.com'),
('Mariana', 'Costa', '(11) 97654-3210', 'mariana@email.com'),
('Lucas', 'Gomes', '(11) 96543-2109', 'lucas@email.com'),
('Beatriz', 'Rocha', '(11) 95432-1098', 'beatriz@email.com');

INSERT INTO Automovel (Marca, Modelo, Tipo)
VALUES
('Toyota', 'Corolla', 'Sedan'),
('Chevrolet', 'Onix', 'Hatch'),
('Jeep', 'Renegade', 'SUV'),
('Fiat', 'Strada', 'Picape');

INSERT INTO DataLocacao (ID_Cliente, ID_Automovel, DataInicioLocacao, DataFinalLocacao)
VALUES
(1, 1, '2026-10-01', '2026-10-05'),
(2, 3, '2026-10-10', '2026-10-15'),
(3, 2, '2026-10-20', '2026-10-25');

SELECT * FROM Cliente;

SELECT * FROM Automovel;

SELECT Cliente.Nome, Cliente.Sobrenome, Automovel.Marca, Automovel.Modelo, DataLocacao.DataInicioLocacao, DataLocacao.DataFinalLocacao
FROM DataLocacao
JOIN Cliente ON DataLocacao.ID_Cliente = Cliente.ID_Cliente
JOIN Automovel ON DataLocacao.ID_Automovel = Automovel.ID_Automovel;

SELECT Automovel.Marca, Automovel.Modelo, DataLocacao.DataInicioLocacao, DataLocacao.DataFinalLocacao
FROM DataLocacao
JOIN Automovel ON DataLocacao.ID_Automovel = Automovel.ID_Automovel
WHERE '2026-10-10';

