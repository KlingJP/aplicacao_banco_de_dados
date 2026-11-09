USE DB_T05072C_Joao_Pedro;

SELECT * FROM Padaria_Vendas;

SELECT * FROM Padaria_Funcionarios;

SELECT * FROM Padaria_Produtos;

RENAME TABLE Vendas_Padaria TO Padaria_Vendas;

RENAME TABLE Produtos_Padaria TO Padaria_Produtos;

RENAME TABLE Fornecedores_Padaria TO Padaria_Fornecedores;

CREATE TABLE Padaria_Clientes (
ID_Cliente INT PRIMARY KEY auto_increment,
Nome_Cliente VARCHAR(100) NOT NULL,
CPF_Cliente CHAR(11) UNIQUE,
Telefone_Cliente VARCHAR(20),
Email_Cliente VARCHAR(100)
);

CREATE TABLE Padaria_Funcionarios (
ID_Funcionario INT PRIMARY KEY AUTO_INCREMENT,
Nome_Funcionario VARCHAR(100) NOT NULL,
CPF_Funcionaro CHAR(11) UNIQUE NOT NULL,
Cargo_Funcionaro VARCHAR(50) NOT NULL,
Salario_Funcionaro DECIMAL(10,2) NOT NULL
);

ALTER TABLE Padaria_Vendas
ADD COLUMN Forma_Pagamento VARCHAR(30),
ADD COLUMN Status_Compra VARCHAR(20) default 'Concluída',
ADD COLUMN Valor_Total DECIMAL(10,2),
ADD COLUMN ID_Funcionario INT NOT NULL,
ADD column ID_Cliente INT,
ADD CONSTRAINT FK_Vendas_Funcionario FOREIGN KEY (ID_Funcionario) REFERENCES Padaria_Funcionarios (ID_Funcionario),
ADD CONSTRAINT FK_Vendas_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Padaria_Clientes (ID_Cliente);

CREATE TABLE Padaria_Item_Venda (
ID INT PRIMARY KEY AUTO_INCREMENT,
ID_Venda INT NOT NULL,
ID_Produto INT NOT NULL,
Quantidade INT NOT NULL,
Preco_Unitario DECIMAL (10,2) NOT NULL,
FOREIGN KEY (ID_Venda) REFERENCES Padaria_Vendas (ID),
FOREIGN KEY (ID_Produto) REFERENCES Padaria_Produtos (ID)
);

INSERT INTO Padaria_Item_Venda (ID_Venda, ID_Produto, Quantidade, Preco_Unitario)
SELECT
V.ID,
V.ID_Produto,
V.Quantidade,
P.Preco_Produto
FROM Padaria_Vendas V
JOIN Padaria_Produtos P ON V.ID_Produto = P.ID;

SELECT * FROM Padaria_Item_Venda;

SET SQL_SAFE_UPDATES = 0;

UPDATE Padaria_Vendas V
JOIN Padaria_Produtos P ON V.ID_Produto = P.ID
SET V.Valor_Total = V.Quantidade * P.Preco_Produto
WHERE V.Valor_Total IS NULL;

UPDATE Padaria_Vendas 
SET Forma_Pagamento = 'Dinheiro'
WHERE Forma_Pagamento IS NULL;

INSERT INTO Padaria_Funcionarios (Nome_Funcionario, CPF_Funcionaro, Cargo_Funcionaro, Salario_Funcionaro)
VALUES
('José', '12345678910', 'Atendente', '1500.00');

ALTER TABLE Padaria_Funcionarios CHANGE CPF_Funcionaro CPF_Funcionario VARCHAR(11) UNIQUE NOT NULL;
ALTER TABLE Padaria_Funcionarios CHANGE Cargo_Funcionaro Cargo_Funcionario VARCHAR(50) NOT NULL;
ALTER TABLE Padaria_Funcionarios CHANGE Salario_Funcionaro Salario_Funcionario DECIMAL (10,2) NOT NULL;

UPDATE Padaria_Vendas
SET ID_Funcionario = 1
WHERE ID_Funcionario = 0 OR ID_Funcionario IS NULL;

SELECT * FROM Padaria_Vendas;

SELECT * FROM Padaria_Item_Venda;

ALTER TABLE Padaria_Vendas
DROP FOREIGN KEY Padaria_Vendas_ibfk_1;

ALTER TABLE Padaria_Vendas
DROP COLUMN Quantidade,
DROP COLUMN ID_Produto;