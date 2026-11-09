USE DB_T05072C_Joao_Pedro;

SELECT * FROM Produtos_Padaria
WHERE Preco_Produto BETWEEN 3.00 AND 10.00;

SELECT * FROM Produtos_Padaria
WHERE Nome_Produto LIKE 'Pão%';

SELECT * FROM Produtos_Padaria
WHERE Nome_Produto LIKE 'Pão%' AND Estoque_Produto > 30;