USE DB_T05072C_Joao_Pedro;
SELECT * FROM Contatos;

SELECT * FROM Contatos WHERE Nome_Contato = 'Maria';

SELECT Nome_Contato FROM Contatos ORDER BY Nome_Contato DESC;

SELECT Telefone_Contato FROM Contatos WHERE Telefone_Contato LIKE '(11%';

UPDATE Contatos SET Telefone_Contato = '(21)90000-0000' WHERE Nome_Contato = 'Joao';
SELECT * From Contatos;