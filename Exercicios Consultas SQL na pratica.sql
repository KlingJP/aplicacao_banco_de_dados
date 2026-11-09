USE DB_T05072C_Joao_Pedro;

SELECT * FROM Fornecedores_Padaria;

SELECT * FROM Vendas_Padaria;

SELECT * FROM Produtos_Padaria;

INSERT INTO Produtos_Padaria (Nome_Produto, Preco_Produto, Estoque_Produto, ID_Fornecedor)
VALUES
    ('Pão de Queijo', 3.00, 30, 2),
    ('Croissant', 6.50, 12, 3),
    ('Sonho de Doce de Leite', 5.00, 15, 4),
    ('Baguete', 7.00, 20, 2),
    ('Torta de Limão', 8.50, 8, 1),
    ('Brigadeiro', 2.50, 40, 4),
    ('Pão Integral', 9.00, 18, 3),
    ('Broa de Milho', 4.00, 25, 2);

INSERT INTO Vendas_Padaria (Quantidade, ID_Produto)
VALUES
    (3, 6),
    (2, 7),
    (5, 8),
    (4, 9),
    (1, 10),
    (10, 11),
    (2, 12),
    (6, 13);

SELECT * FROM Produtos_Padaria;

SELECT P.Nome_Produto, SUM(V.Quantidade) AS Total_Unidades_Vendidas
FROM Produtos_Padaria P
INNER JOIN Vendas_Padaria V
ON P.ID = V.ID_Produto
GROUP BY P.ID, P.Nome_Produto;

SELECT P.Nome_Produto, SUM(V.Quantidade) AS Total_Unidades_Vendidas
FROM Produtos_Padaria P
INNER JOIN Vendas_Padaria V
ON P.ID = V.ID_Produto
WHERE P.Nome_Produto = 'Bolo de Cenoura'
GROUP BY P.ID, P.Nome_Produto;

SELECT P.Nome_Produto, SUM(V.Quantidade) AS Total_Unidades_Vendidas
FROM Produtos_Padaria P
INNER JOIN Vendas_Padaria V
ON P.ID = V.ID_Produto
WHERE P.Nome_Produto = 'Bolo de Cenoura'
GROUP BY P.ID, P.Nome_Produto;

SELECT P.Nome_Produto, SUM(V.Quantidade) AS Total_Unidades_Vendidas
FROM Produtos_Padaria P
INNER JOIN Vendas_Padaria V
ON P.ID = V.ID_Produto
WHERE P.Nome_Produto = 'Bolo de Chocolate'
GROUP BY P.ID, P.Nome_Produto;

SELECT P.Nome_Produto, V.Quantidade, V.Data_Venda
FROM Vendas_Padaria V
INNER JOIN Produtos_Padaria P
ON V.ID_Produto = P.ID
WHERE V.Data_Venda = '2026-10-27';