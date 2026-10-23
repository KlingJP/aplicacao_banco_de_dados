use DB_T05072C_Joao_Pedro;

SELECT * FROM Contatos;

INSERT INTO Contatos (Nome_Contato, Telefone_Contato)
VALUES
('João Pedro', '(11)98327-3333');

INSERT INTO Mensagens (Texto_Mensagem, ID_Contato)
VALUES 
('Oi, meu nome é João', '7');

SELECT Contatos.Nome_Contato, Mensagens.Texto_Mensagem
FROM Mensagens
JOIN Contatos ON Mensagens.ID_Contato = Contatos.ID;