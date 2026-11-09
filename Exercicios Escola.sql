USE DB_T05072C_Joao_Pedro;

CREATE TABLE Aluno (
    ID_Aluno INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Curso_Aluno VARCHAR(100) NOT NULL
);

CREATE TABLE Professor (
    ID_Professor INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Professor VARCHAR(100) NOT NULL,
    Curso_Professor VARCHAR(100) NOT NULL
);

CREATE TABLE Comentario (
    ID_Comentario INT PRIMARY KEY AUTO_INCREMENT,
    ID_Aluno INT,
    ID_Professor INT,
    Comentario TEXT,
    NotaDoProfessor DECIMAL(3,1),
    FOREIGN KEY (ID_Aluno) REFERENCES Aluno (ID_Aluno),
    FOREIGN KEY (ID_Professor) REFERENCES Professor (ID_Professor)
);

INSERT INTO Aluno (Nome, Sobrenome, Curso_Aluno)
VALUES
('Ana', 'Silva', 'Matemática'),
('Carlos', 'Oliveira', 'História'),
('Mariana', 'Santos', 'Geografia'),
('Lucas', 'Ribeiro', 'Português'),
('Beatriz', 'Costa', 'Sociologia');

INSERT INTO Professor (Nome_Professor, Curso_Professor)
VALUES
('Ricardo Almeida', 'Matemática'),
('Fernanda Lima', 'Geografia'),
('Roberto Souza', 'Sociologia'),
('Patricia Mendes', 'Português'),
('Letícia Santos', 'História');

INSERT INTO Comentario (ID_Aluno, ID_Professor, Comentario, NotaDoProfessor)
VALUES
('1', '2', 'Muito Bem!!', '9.5'),
('2', '2', 'Estude um pouco mais! :(', '5.5'),
('3', '3', 'Parabéns!!', '10.0'),
('4', '4', 'Estude mais e preste atenção nas aulas!', '1.0'),
('5', '5', 'Muito Bem!!', '8.0');

SELECT Nome, Sobrenome, Curso_Aluno FROM Aluno;

SELECT Nome_Professor, Curso_Professor FROM Professor;

SELECT Professor.Nome_Professor, Comentario.Comentario, Comentario.NotaDoProfessor
FROM Comentario
JOIN Professor ON Comentario.ID_Professor = Professor.ID_Professor;

SELECT Comentario, NotaDoProfessor
FROM Comentario
WHERE NotaDoProfessor < 6.0;

SELECT Comentario, NotaDoProfessor
FROM Comentario
WHERE NotaDoProfessor > 6.0;