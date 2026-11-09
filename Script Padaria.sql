CREATE DATABASE DB_T05072C_Joao_Pedro;
use DB_T05072C_Joao_Pedro;

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Cliente VARCHAR(100) not null,
    Telefone_Cliente VARCHAR(20) not null,
    Email_Cliente VARCHAR(100)
);

CREATE TABLE Produto (
    ID_Produto INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Produto VARCHAR(100) not null,
    Tipo_Produto VARCHAR(100) not null,
    Preco_Produto DECIMAL (10,2) not null,
    Estoque_Produto INT not null
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    Valor_Total DECIMAL(6,2) not null,
    Quantidade DECIMAL(5,2) not null,
    ID_Cliente INT, 
    ID_Produto INT,
    Forma_Pagamento VARCHAR(15) not null,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY(ID_Produto) REFERENCES Produto(ID_Produto)
);

SHOW tables;