-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS AcademiaDesenvolve;

-- Selecionar o banco de dados
USE AcademiaDesenvolve;

-- Tabela de Planos
CREATE TABLE Plano (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(100) NOT NULL,
    valor DECIMAL(8,2) NOT NULL,
    descricao TEXT
);

-- Tabela de Alunos
CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    peso DECIMAL(5,2),
    altura DECIMAL(4,2),
    id_plano INT,
    FOREIGN KEY (id_plano) REFERENCES Plano(id_plano)
);

-- Tabela de Professores
CREATE TABLE Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela de Categorias de Treino
CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Tabela de Treinos
CREATE TABLE Treino (
    id_treino INT PRIMARY KEY AUTO_INCREMENT,
    nome_treino VARCHAR(100) NOT NULL,
    descricao TEXT,
    id_categoria INT,
    id_professor INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

-- Tabela de Treinos atribuídos aos Alunos
CREATE TABLE Aluno_Treino (
    id_aluno INT,
    id_treino INT,
    data_atribuicao DATE,
    PRIMARY KEY (id_aluno, id_treino),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_treino) REFERENCES Treino(id_treino)
);
