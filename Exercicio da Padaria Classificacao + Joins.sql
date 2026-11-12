USE DB_T05072C_Joao_Pedro;

SELECT * FROM Padaria_Item_Venda;

SELECT * FROM Padaria_Vendas;

SELECT * FROM Padaria_Produtos;

SELECT P.Nome_Produto, V.ID_Venda, V.ID_Produto, V.Quantidade
FROM Padaria_Produtos P
JOIN Padaria_Item_Venda V ON V.ID_Produto = P.ID;

CREATE TABLE Padaria_Faixa_Preco (
ID INT PRIMARY KEY AUTO_INCREMENT,
Classificacao VARCHAR(50) NOT NULL,
Preco_Min DECIMAL(10,2) NOT NULL,
Preco_Max DECIMAL (10,2) NOT NULL
);

INSERT INTO Padaria_Faixa_Preco (Classificacao, Preco_Min, Preco_Max)
VALUES
('Muito Barato', '0.00', '5.00'),
('Barato', '5.01', '40.00'),
('Caro', '40.01', '999.99');

SELECT P.Nome_Produto, P.Preco_Produto, F.Classificacao
FROM Padaria_Produtos P 
JOIN Padaria_Faixa_Preco F ON P.Preco_Produto BETWEEN F.Preco_Min AND F.Preco_Max;

