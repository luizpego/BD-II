create database trabalho_luiz_andre;
use trabalho_luiz_andre;

create table livro(
id_livro int primary key,
edicao varchar(20),
titulo varchar(20),
ano_publicacao date,
isbn int
);

create table autor(
id_autor int primary key,
nome varchar(50),
nacionalidade varchar(20)
);

create table exemplar(
id_exemplar int primary key,
codigo_tombo int,
status varchar(20),
data_aquisicao date
);

create table categoria(
id_categoria int primary key,
nome varchar(20),
descricao varchar(20)
);

create table editora(
id_editora int primary key,
nome varchar(20)
);

create table funcionario(
id_funcionario int primary key,
nome varchar(50),
cpf int,
email varchar(50),
cargo varchar(20)
);

create table emprestimo(
id_emprestimo int primary key,
data_emprestimo date,
data_prevista_devolucao date,
data_devolucao date,
status varchar(20)
);

create table usuario(
id_usuario int primary key,
nome varchar(50),
cpf int,
email varchar(50),
telefone int,
endereco varchar(50)
);

create table multa(
id_multa int primary key,
valor decimal(10,2),
motivo varchar(30),
data_multa date,
status_pagamento varchar(20)
);

create table reserva(
id_reserva int primary key,
data_reserva date,
status varchar(20)
);


