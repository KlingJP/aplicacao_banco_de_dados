USE DB_T05072C_Joao_Pedro;

CREATE TABLE Fornecedores (
    ID_Fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Fornecedor VARCHAR (100),
    Telefone_Fornecedor VARCHAR(20)
);

CREATE TABLE Produtos2 (
    ID_Produto INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Produtos VARCHAR(100),
    Preco_Produto DECIMAL(10,2),
    ID_Fornecedor INT,
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedores (ID_Fornecedor)
);

CREATE TABLE Vendas (
    ID_Venda INT PRIMARY KEY AUTO_INCREMENT,
    Data_Venda DATE NOT NULL
);

CREATE TABLE Itens_Venda (
    ID_Item INT PRIMARY KEY AUTO_INCREMENT,
    ID_Venda INT,
    ID_Produto INT,
    Quantidade INT,
    Preco_Unitario DECIMAL (8,2),
    FOREIGN KEY (ID_Venda) REFERENCES Vendas(ID_Venda),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos2(ID_Produto)
)

