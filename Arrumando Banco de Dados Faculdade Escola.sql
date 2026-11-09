USE DB_T05072C_Joao_Pedro;

SELECT * FROM Faculdade_Aluno;
SELECT * FROM Faculdade_Professor;
SELECT * FROM Faculdade_Cursos;
SELECT * FROM Faculdade_Comentarios;
SELECT * FROM Faculdade_Boletim;
SELECT * FROM Faculdade_Disciplina;
SELECT * FROM Faculdade_Turma;

RENAME TABLE Aluno TO Faculdade_Aluno;
RENAME TABLE Professor TO Faculdade_Professor;
RENAME TABLE Cursos TO Faculdade_Cursos;
RENAME TABLE Comentario TO Faculdade_Comentarios;

CREATE TABLE Faculdade_Boletim (
ID_Boletim INT PRIMARY KEY AUTO_INCREMENT,
ID_Aluno INT NOT NULL,
ID_Curso INT NOT NULL,
Nota_1 DECIMAL (4,2) NOT NULL DEFAULT 0.00,
Nota_2 DECIMAL (4,2) NOT NULL DEFAULT 0.00,
Media_Final DECIMAL (4,2) GENERATED ALWAYS AS ((Nota_1 + Nota_2) / 2) STORED,
Faltas INT NOT NULL DEFAULT 0,
FOREIGN KEY (ID_ALuno) REFERENCES Faculdade_Aluno (ID_Aluno),
FOREIGN KEY (ID_Curso) REFERENCES Faculdade_Cursos (ID_Curso)
);

INSERT INTO Faculdade_Boletim (ID_Aluno, ID_Curso, Nota_1, Nota_2, Faltas)
VALUES
(1, 1, '9.5', '9.5', 2),
(2, 2, '5.0', '6.0', 8),
(3, 3, 10.0, 10.0, 0),
(4, 4, 2.0, 0.0, 14),
(5, 5, 8.0, 8.0, 4);

CREATE TABLE Faculdade_Disciplina (
ID_Disciplina INT PRIMARY KEY AUTO_INCREMENT,
Nome_Disciplina VARCHAR(100) NOT NULL,
CargaHoraria INT NOT NULL,
ID_Curso INT NOT NULL,
FOREIGN KEY (ID_Curso) REFERENCES Faculdade_Cursos (ID_Curso)
);

CREATE TABLE Faculdade_Turma (
ID_Turma INT PRIMARY KEY AUTO_INCREMENT,
Ano INT NOT NULL,
Semestre INT NOT NULL,
ID_Disciplina INT NOT NULL,
ID_Professor INT NOT NULL,
FOREIGN KEY (ID_Disciplina) REFERENCES Faculdade_Disciplina (ID_Disciplina),
FOREIGN KEY (ID_Professor) REFERENCES Faculdade_Professor (ID_Professor)
);

