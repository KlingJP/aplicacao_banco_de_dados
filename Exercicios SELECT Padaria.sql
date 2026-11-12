USE DB_T05072C_Joao_Pedro;

SELECT UPPER(Nome_Produto) AS Nome_Maiusculas,
	   LOWER(Nome_Produto) AS Nome_Minusculas
FROM Padaria_Produtos;

SELECT CHAR_LENGTH(Nome_Produto) AS Quantidade_Letras,
LEFT(Nome_Produto, 3) AS Tres_Primeiras
FROM Padaria_Produtos;

SELECT Preco_Produto AS Preco_Padrao, 
ROUND(Preco_Produto) AS Preco_Arredondado,
CURDATE() AS Data_Atual
FROM Padaria_Produtos;
