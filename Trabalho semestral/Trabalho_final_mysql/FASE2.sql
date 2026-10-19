
CREATE DATABASE biblioteca_lafp;

USE biblioteca_lafp;

CREATE TABLE LAFP_EDITORA (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE LAFP_AUTOR (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    nacionalidade VARCHAR(80)
);

CREATE TABLE LAFP_CATEGORIA (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE LAFP_USUARIO (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE LAFP_FUNCIONARIO (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    cargo VARCHAR(80) NOT NULL
);

CREATE TABLE LAFP_LIVRO (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    ano_publicacao INT,
    edicao VARCHAR(30),
    id_editora INT NOT NULL,
    FOREIGN KEY (id_editora)
        REFERENCES LAFP_EDITORA(id_editora)
);

CREATE TABLE LAFP_LIVRO_AUTOR (
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro)
        REFERENCES LAFP_LIVRO(id_livro),
    FOREIGN KEY (id_autor)
        REFERENCES LAFP_AUTOR(id_autor)
);

CREATE TABLE LAFP_LIVRO_CATEGORIA (
    id_livro INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_livro, id_categoria),
    FOREIGN KEY (id_livro)
        REFERENCES LAFP_LIVRO(id_livro),
    FOREIGN KEY (id_categoria)
        REFERENCES LAFP_CATEGORIA(id_categoria)
);

CREATE TABLE LAFP_EXEMPLAR (
    id_exemplar INT AUTO_INCREMENT PRIMARY KEY,
    codigo_tombo VARCHAR(30) NOT NULL UNIQUE,
    status VARCHAR(30) NOT NULL DEFAULT 'disponivel',
    data_aquisicao DATE NOT NULL,
    id_livro INT NOT NULL,
    CHECK (status IN (
        'disponivel',
        'emprestado',
        'reservado',
        'danificado',
        'perdido'
    )),
    FOREIGN KEY (id_livro)
        REFERENCES LAFP_LIVRO(id_livro)
);

CREATE TABLE LAFP_EMPRESTIMO (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(30) NOT NULL DEFAULT 'ativo',
    id_usuario INT NOT NULL,
    id_funcionario INT NOT NULL,
    CHECK (status IN (
        'ativo',
        'devolvido',
        'atrasado',
        'cancelado'
    )),
    CHECK (data_prevista_devolucao >= data_emprestimo),
    FOREIGN KEY (id_usuario)
        REFERENCES LAFP_USUARIO(id_usuario),
    FOREIGN KEY (id_funcionario)
        REFERENCES LAFP_FUNCIONARIO(id_funcionario)
);

CREATE TABLE LAFP_EMPRESTIMO_EXEMPLAR (
    id_emprestimo INT NOT NULL,
    id_exemplar INT NOT NULL,
    PRIMARY KEY (id_emprestimo, id_exemplar),
    FOREIGN KEY (id_emprestimo)
        REFERENCES LAFP_EMPRESTIMO(id_emprestimo),
    FOREIGN KEY (id_exemplar)
        REFERENCES LAFP_EXEMPLAR(id_exemplar)
);

CREATE TABLE LAFP_RESERVA (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    data_reserva DATE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'ativa',
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    CHECK (status IN (
        'ativa',
        'atendida',
        'cancelada',
        'expirada'
    )),
    FOREIGN KEY (id_usuario)
        REFERENCES LAFP_USUARIO(id_usuario),
    FOREIGN KEY (id_livro)
        REFERENCES LAFP_LIVRO(id_livro)
);

CREATE TABLE LAFP_MULTA (
    id_multa INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(8,2) NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    data_multa DATE NOT NULL,
    status_pagamento VARCHAR(30) NOT NULL DEFAULT 'pendente',
    id_emprestimo INT NOT NULL,
    CHECK (valor >= 0),
    CHECK (status_pagamento IN (
        'pendente',
        'paga',
        'cancelada'
    )),
    FOREIGN KEY (id_emprestimo)
        REFERENCES LAFP_EMPRESTIMO(id_emprestimo)
);
