USE DB_T05072C_Joao_Pedro;

DESCRIBE Faculdade_Professor;

ALTER TABLE Faculdade_Professor
ADD COLUMN ID_Disciplina INT NOT NULL;

SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE Faculdade_Professor
ADD CONSTRAINT Professor_ibfk_2 FOREIGN KEY (ID_Disciplina) REFERENCES Faculdade_Disciplina (ID_Disciplina);

SELECT * FROM Faculdade_Professor;

DESCRIBE Faculdade_Turma;
DESCRIBE Faculdade_Disciplina;

