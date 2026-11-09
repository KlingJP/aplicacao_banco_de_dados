USE DB_T05072C_Joao_Pedro;

SELECT Produtos_Padaria.Nome_Produto AS P,
       Fornecedores_Padaria.Nome_Fornecedor AS F
FROM Produtos_Padaria
INNER JOIN Fornecedores_Padaria ON Produtos_Padaria.ID = Fornecedores_Padaria.ID;

SELECT Produtos_Padaria.Nome_Produto AS P,
       Vendas_Padaria.Data_Venda AS Data,
       Vendas_Padaria.Quantidade AS Quantidade
FROM Produtos_Padaria
INNER JOIN Vendas_Padaria ON Produtos_Padaria.ID = Vendas_Padaria.ID;

SELECT Produtos_Padaria.Nome_Produto AS Nome,
       Produtos_Padaria.Preco_Produto * Vendas_Padaria.Quantidade AS ValorTotal,
       Fornecedores_Padaria.Nome_Fornecedor AS Fornecedores
FROM Vendas_Padaria
INNER JOIN Produtos_Padaria ON Vendas_Padaria.ID = Produtos_Padaria.ID
INNER JOIN Fornecedores_Padaria ON Produtos_Padaria.ID = Fornecedores_Padaria.ID;

SELECT Produtos_Padaria.Nome_Produto,
       Produtos_Padaria.Estoque_Produto,
       Fornecedores_Padaria.Nome_Fornecedor AS Fornecedores
FROM Produtos_Padaria
INNER JOIN Fornecedores_Padaria ON Produtos_Padaria.ID = Fornecedores_Padaria.ID
WHERE Produtos_Padaria.Estoque_Produto < 30;
       