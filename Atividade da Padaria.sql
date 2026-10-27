USE DB_T05072C_Joao_Pedro;

CREATE TABLE Produtos_Padaria (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Produto VARCHAR(100) NOT NULL,
    Preco_Produto DECIMAL(10,2) NOT NULL,
    Estoque_Produto INT NOT NULL,
    ID_Fornecedor INT,
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedores_Padaria (ID)
);

CREATE TABLE Vendas_Padaria (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Quantidade INT NOT NULL,
    Data_Venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    ID_Produto INT NOT NULL,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos_Padaria (ID)
);

CREATE TABLE Fornecedores_Padaria (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Fornecedor VARCHAR(100) NOT NULL,
    Telefone_Fornecedor VARCHAR(20)
);

INSERT INTO Fornecedores_Padaria (Nome_Fornecedor, Telefone_Fornecedor)
VALUES
('Fornecedor1', '(11)97894-5612'),
('Fornecedor2', '(11)96325-4521'),
('Fornecedor3', '(11)98563-7458'),
('Fornecedor4', '(11)98888-7777'),
('Fornecedor5', '(11)97777-4758');

INSERT INTO Produtos_Padaria (Nome_Produto, Preco_Produto, Estoque_Produto, ID_Fornecedor)
VALUES
('Bolo de Chocolate', '50.00', '3', '1'),
('Pão Francês', '1.50', '45', '3'),
('Café', '3.50', '15', '2'),
('Bolo de Cenoura', '45.00', '2', '1'),
('Sonho de Creme', '4.50', '10', '4');

INSERT INTO Vendas_Padaria (ID_Produto, Quantidade)
VALUES
('1', '1'),
('2', '5'),
('4', '1'),
('5', '5'),
('3', '1');

SELECT * FROM Produtos_Padaria;

SELECT * FROM Vendas_Padaria;

SELECT * FROM Fornecedores_Padaria