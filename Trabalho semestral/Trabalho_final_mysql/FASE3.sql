
USE biblioteca_lafp;

INSERT INTO LAFP_EDITORA (nome) VALUES
('Companhia das Letras'),
('Rocco'),
('Intrinseca'),
('Record'),
('Aleph'),
('HarperCollins'),
('DarkSide'),
('Arqueiro'),
('Planeta'),
('Seguinte');

INSERT INTO LAFP_AUTOR (nome, nacionalidade) VALUES
('J. R. R. Tolkien', 'Britanica'),
('J. K. Rowling', 'Britanica'),
('George R. R. Martin', 'Estadunidense'),
('Machado de Assis', 'Brasileira'),
('Clarice Lispector', 'Brasileira'),
('Isaac Asimov', 'Estadunidense'),
('Agatha Christie', 'Britanica'),
('Ursula K. Le Guin', 'Estadunidense'),
('Stephen King', 'Estadunidense'),
('Neil Gaiman', 'Britanica');

INSERT INTO LAFP_CATEGORIA (nome, descricao) VALUES
('Fantasia', 'Livros de fantasia'),
('Ficcao cientifica', 'Livros de ficcao cientifica'),
('Romance', 'Livros de romance'),
('Misterio', 'Livros de misterio'),
('Terror', 'Livros de terror'),
('Classico', 'Obras classicas'),
('Aventura', 'Livros de aventura'),
('Distopia', 'Livros sobre sociedades distopicas'),
('Conto', 'Coletaneas de contos'),
('Mitologia', 'Historias mitologicas');

INSERT INTO LAFP_LIVRO
(titulo, isbn, ano_publicacao, edicao, id_editora) VALUES
('O Senhor dos Aneis', '9780000000001', 1954, '1', 1),
('Harry Potter e a Pedra Filosofal', '9780000000002', 1997, '1', 2),
('A Guerra dos Tronos', '9780000000003', 1996, '1', 3),
('Dom Casmurro', '9780000000004', 1899, '2', 4),
('A Hora da Estrela', '9780000000005', 1977, '1', 1),
('Fundacao', '9780000000006', 1951, '1', 5),
('Assassinato no Expresso do Oriente', '9780000000007', 1934, '1', 6),
('A Mao Esquerda da Escuridao', '9780000000008', 1969, '1', 5),
('O Iluminado', '9780000000009', 1977, '1', 7),
('Deuses Americanos', '9780000000010', 2001, '1', 8),
('O Hobbit', '9780000000011', 1937, '1', 1),
('Harry Potter e a Camara Secreta', '9780000000012', 1998, '1', 2),
('A Furia dos Reis', '9780000000013', 1998, '1', 3),
('Memorias Postumas de Bras Cubas', '9780000000014', 1881, '1', 4),
('Perto do Coracao Selvagem', '9780000000015', 1943, '1', 1),
('Eu, Robo', '9780000000016', 1950, '1', 5),
('Morte no Nilo', '9780000000017', 1937, '1', 6),
('O Feiticeiro de Terramar', '9780000000018', 1968, '1', 8),
('It A Coisa', '9780000000019', 1986, '1', 7),
('Coraline', '9780000000020', 2002, '1', 9);

INSERT INTO LAFP_USUARIO
(nome, cpf, email, telefone, endereco) VALUES
('Ana Souza', '10000000001', 'ana@email.com', '31990000001', 'Rua A'),
('Bruno Lima', '10000000002', 'bruno@email.com', '31990000002', 'Rua B'),
('Carla Mendes', '10000000003', 'carla@email.com', '31990000003', 'Rua C'),
('Diego Alves', '10000000004', 'diego@email.com', '31990000004', 'Rua D'),
('Elisa Rocha', '10000000005', 'elisa@email.com', '31990000005', 'Rua E'),
('Felipe Costa', '10000000006', 'felipe@email.com', '31990000006', 'Rua F'),
('Giovana Reis', '10000000007', 'giovana@email.com', '31990000007', 'Rua G'),
('Heitor Nunes', '10000000008', 'heitor@email.com', '31990000008', 'Rua H'),
('Isabela Melo', '10000000009', 'isabela@email.com', '31990000009', 'Rua I'),
('Joao Prado', '10000000010', 'joao@email.com', '31990000010', 'Rua J');

INSERT INTO LAFP_FUNCIONARIO
(nome, cpf, email, cargo) VALUES
('Marina Lopes', '20000000001', 'marina@email.com', 'Bibliotecaria'),
('Paulo Reis', '20000000002', 'paulo@email.com', 'Atendente'),
('Sofia Dias', '20000000003', 'sofia@email.com', 'Auxiliar'),
('Rafael Melo', '20000000004', 'rafael@email.com', 'Bibliotecario'),
('Luana Castro', '20000000005', 'luana@email.com', 'Atendente'),
('Pedro Neri', '20000000006', 'pedro@email.com', 'Auxiliar'),
('Bia Ramos', '20000000007', 'bia@email.com', 'Bibliotecaria'),
('Caio Freitas', '20000000008', 'caio@email.com', 'Atendente'),
('Lara Pires', '20000000009', 'lara@email.com', 'Auxiliar'),
('Vitor Maia', '20000000010', 'vitor@email.com', 'Bibliotecario');

INSERT INTO LAFP_LIVRO_AUTOR
(id_livro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10);

INSERT INTO LAFP_LIVRO_CATEGORIA
(id_livro, id_categoria) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 6),
(5, 3),
(6, 2),
(7, 4),
(8, 2),
(9, 5),
(10, 1),
(11, 7),
(12, 1),
(13, 1),
(14, 6),
(15, 3),
(16, 2),
(17, 4),
(18, 1),
(19, 5),
(20, 1);

INSERT INTO LAFP_EXEMPLAR
(codigo_tombo, status, data_aquisicao, id_livro) VALUES
('TOMBO001', 'disponivel', '2024-01-01', 1),
('TOMBO002', 'disponivel', '2024-01-02', 2),
('TOMBO003', 'disponivel', '2024-01-03', 3),
('TOMBO004', 'disponivel', '2024-01-04', 4),
('TOMBO005', 'disponivel', '2024-01-05', 5),
('TOMBO006', 'disponivel', '2024-01-06', 6),
('TOMBO007', 'disponivel', '2024-01-07', 7),
('TOMBO008', 'disponivel', '2024-01-08', 8),
('TOMBO009', 'disponivel', '2024-01-09', 9),
('TOMBO010', 'disponivel', '2024-01-10', 10),
('TOMBO011', 'disponivel', '2024-01-11', 11),
('TOMBO012', 'disponivel', '2024-01-12', 12),
('TOMBO013', 'disponivel', '2024-01-13', 13),
('TOMBO014', 'disponivel', '2024-01-14', 14),
('TOMBO015', 'disponivel', '2024-01-15', 15),
('TOMBO016', 'disponivel', '2024-01-16', 16),
('TOMBO017', 'disponivel', '2024-01-17', 17),
('TOMBO018', 'disponivel', '2024-01-18', 18),
('TOMBO019', 'disponivel', '2024-01-19', 19),
('TOMBO020', 'disponivel', '2024-01-20', 20);

INSERT INTO LAFP_EMPRESTIMO
(data_emprestimo, data_prevista_devolucao,
data_devolucao, status, id_usuario, id_funcionario) VALUES
('2026-01-01', '2026-01-15', '2026-01-14', 'devolvido', 1, 1),
('2026-01-02', '2026-01-16', '2026-01-16', 'devolvido', 2, 2),
('2026-01-03', '2026-01-17', '2026-01-17', 'devolvido', 3, 3),
('2026-01-04', '2026-01-18', '2026-01-20', 'devolvido', 4, 4),
('2026-01-05', '2026-01-19', '2026-01-19', 'devolvido', 5, 5),
('2026-01-06', '2026-01-20', '2026-01-19', 'devolvido', 6, 6),
('2026-01-07', '2026-01-21', '2026-01-21', 'devolvido', 7, 7),
('2026-01-08', '2026-01-22', '2026-01-22', 'devolvido', 8, 8),
('2026-01-09', '2026-01-23', '2026-01-25', 'devolvido', 9, 9),
('2026-01-10', '2026-01-24', '2026-01-23', 'devolvido', 10, 10);

INSERT INTO LAFP_EMPRESTIMO_EXEMPLAR
(id_emprestimo, id_exemplar) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20);

INSERT INTO LAFP_RESERVA
(data_reserva, status, id_usuario, id_livro) VALUES
('2026-02-01', 'ativa', 1, 1),
('2026-02-02', 'atendida', 2, 2),
('2026-02-03', 'cancelada', 3, 3),
('2026-02-04', 'ativa', 4, 4),
('2026-02-05', 'ativa', 5, 5),
('2026-02-06', 'expirada', 6, 6),
('2026-02-07', 'atendida', 7, 7),
('2026-02-08', 'ativa', 8, 8),
('2026-02-09', 'cancelada', 9, 9),
('2026-02-10', 'ativa', 10, 10);

INSERT INTO LAFP_MULTA
(valor, motivo, data_multa, status_pagamento, id_emprestimo) VALUES
(15.00, 'Devolucao em atraso', '2026-01-20', 'pendente', 4),
(12.00, 'Devolucao em atraso', '2026-01-25', 'pendente', 9),
(5.00, 'Registro duplicado', '2026-01-26', 'cancelada', 9);

-- Atualiza o telefone de uma usuaria.
UPDATE LAFP_USUARIO
SET telefone = '31998887777'
WHERE id_usuario = 1;

-- Corrige a edicao de um livro.
UPDATE LAFP_LIVRO
SET edicao = '3'
WHERE id_livro = 4;

-- Registra o pagamento de uma multa.
UPDATE LAFP_MULTA
SET status_pagamento = 'paga'
WHERE id_multa = 1;

-- Exclui uma reserva cancelada que nao sera mais utilizada.
DELETE FROM LAFP_RESERVA
WHERE id_reserva = 3;

-- Exclui uma multa cancelada por erro de cadastro.
DELETE FROM LAFP_MULTA
WHERE id_multa = 3;
