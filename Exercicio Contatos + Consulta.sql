USE DB_T05072C_Joao_Pedro;

CREATE TABLE Grupo_Contatos (
    ID_Grupo INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Grupo VARCHAR(100) NOT NULL
);

CREATE TABLE Contatos2 (
    ID_Contatos INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Contato VARCHAR(100) NOT NULL,
    Telefone_Contato VARCHAR(20) NOT NULL,
    Email_Contato VARCHAR(100) NOT NULL,
    ID_Grupo INT,
    FOREIGN KEY (ID_Grupo) REFERENCES Grupo_Contatos(ID_Grupo)
);

CREATE TABLE Telefones (
    ID_Telefone INT PRIMARY KEY AUTO_INCREMENT,
    Numero_Telefone VARCHAR(20) NOT NULL,
    Tipo VARCHAR(20),
    ID_Contatos INT NOT NULL,
    FOREIGN KEY (ID_Contatos) REFERENCES Contatos2(ID_Contatos)
);

INSERT INTO Grupo_Contatos (Nome_Grupo)
VALUES 
('Trabalho'),
('Faculdade'),
('Amigos'),
('Família');

INSERT INTO Contatos2 (Nome_Contato, Telefone_Contato, Email_Contato, ID_Grupo)
VALUES 
('Pedro', '(11)98657-8563', 'pedro@gmail.com', '2'),
('Maria', '(11)97458-6523', 'maria@gmail.com', '1'),
('João', '(11)96541-2587', 'joao@gmail.com', '3');

INSERT INTO Telefones (Numero_Telefone, Tipo, ID_Contatos)
VALUES
('(11)98657-8563', 'Celular', '1'),
('(11)96541-2587', 'Trabalho', '3'),
('(11)97458-6523', 'Casa', '2');

SELECT * FROM Grupo_Contatos;
SELECT * FROM Contatos2;
SELECT * FROM Telefones;

SELECT Nome_Contato FROM Contatos2;

SELECT * FROM Contatos2
WHERE Nome_Contato = 'Pedro';

