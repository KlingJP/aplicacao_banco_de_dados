USE DB_T05072C_Joao_Pedro;

SELECT * FROM Contatos;

CREATE TABLE Mensagens (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Texto_Mensagem TEXT Not Null,
    Data_Envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ID_Contato INT NOT NULL,
    FOREIGN KEY (ID_Contato) REFERENCES Contatos(ID)
);

INSERT INTO Mensagens (Texto_Mensagem, ID_Contato)
VALUES
('Olá, tudo bem?', 1),
('Bom dia!', 2),
('Não sei, estou testando', 3);


SELECT * FROM Mensagens;

SELECT Contatos.Nome_Contato, Mensagens.Texto_Mensagem, Mensagens.Data_Envio
FROM Mensagens
JOIN Contatos ON Mensagens.ID_Contato = Contatos.ID;