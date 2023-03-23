CREATE DATABASE sigab IF NOT EXISTS;
USE DATABASE sigab;

CREATE TABLE pessoa (
    nome varchar(60),
    data_nasc date,
    cpf varchar(15) PRIMARY KEY,
    rg varchar(14),
    cor varchar(20),
    sexo enum('masculino','feminino','outro','não')
    nivel enum('aluno','professor')
    senha varchar(60),
    turnos enum('manha', 'tarde', 'noite')
);

CREATE TABLE aluno (
    matricula varchar(20),
    turma_nome varchar(40),
    fk_pessoa_cpf varchar(15),
    PRIMARY KEY (matricula, fk_pessoa_cpf)
);

CREATE TABLE professor (
    matricula_professor varchar(15),
    disciplina varchar(40),
    fk_pessoa_cpf varchar(15),
    PRIMARY KEY (matricula_professor, fk_pessoa_cpf)
);

CREATE TABLE turma (
    sala varchar(40),
    num_de_alunos int,
    cod_turma varchar(10) PRIMARY KEY,
    fk_professor_matricula_professor varchar(15),
    fk_professor_fk_pessoa_cpf varchar(15),
    fk_aluno_matricula varchar(20),
    fk_aluno_fk_pessoa_cpf varchar(15)
);
 
ALTER TABLE aluno ADD CONSTRAINT FK_aluno_2
    FOREIGN KEY (fk_pessoa_cpf)
    REFERENCES pessoa (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE professor ADD CONSTRAINT FK_professor_2
    FOREIGN KEY (fk_pessoa_cpf)
    REFERENCES pessoa (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE turma ADD CONSTRAINT FK_turma_2
    FOREIGN KEY (fk_professor_matricula_professor, fk_professor_fk_pessoa_cpf)
    REFERENCES professor (matricula_professor, fk_pessoa_cpf)
    ON DELETE CASCADE;
 
ALTER TABLE turma ADD CONSTRAINT FK_turma_3
    FOREIGN KEY (fk_aluno_matricula, fk_aluno_fk_pessoa_cpf)
    REFERENCES aluno (matricula, fk_pessoa_cpf)
    ON DELETE CASCADE;