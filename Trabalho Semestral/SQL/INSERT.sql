#FASE 3
#INSERÇÂO DE DADOS(DML)



USE biblioteca_lafp;

INSERT INTO LAFP_EDITORA (id_editora, nome) VALUES
(1, 'Companhia das Letras'),
(2, 'Rocco'),
(3, 'Record'),
(4, 'Intrinseca'),
(5, 'Sextante'),
(6, 'Arqueiro'),
(7, 'Martins Fontes'),
(8, 'HarperCollins'),
(9, 'Aleph'),
(10, 'DarkSide Books');

INSERT INTO LAFP_AUTOR (id_autor, nome, nacionalidade) VALUES
(1, 'J. K. Rowling', 'Britanica'),
(2, 'J. R. R. Tolkien', 'Britanica'),
(3, 'George R. R. Martin', 'Americana'),
(4, 'Machado de Assis', 'Brasileira'),
(5, 'Clarice Lispector', 'Brasileira'),
(6, 'Stephen King', 'Americana'),
(7, 'George Orwell', 'Britanica'),
(8, 'Agatha Christie', 'Britanica'),
(9, 'Isaac Asimov', 'Americana'),
(10, 'Frank Herbert', 'Americana');

INSERT INTO LAFP_CATEGORIA (id_categoria, nome, descricao) VALUES
(1, 'Fantasia', 'Livros de fantasia'),
(2, 'Ficcao Cientifica', 'Historias sobre ciencia e futuro'),
(3, 'Terror', 'Livros de suspense e medo'),
(4, 'Romance', 'Historias de ficcao'),
(5, 'Classicos', 'Obras classicas da literatura'),
(6, 'Misterio', 'Historias de investigacao'),
(7, 'Aventura', 'Historias de aventura'),
(8, 'Drama', 'Historias dramaticas'),
(9, 'Distopia', 'Sociedades ficticias e autoritarias'),
(10, 'Literatura Brasileira', 'Obras da literatura brasileira');

INSERT INTO LAFP_USUARIO
(id_usuario, nome, cpf, email, telefone, endereco) VALUES
(1, 'Ana Souza', '11111111111', 'ana@email.com', '31999990001', 'Rua A, 10'),
(2, 'Bruno Lima', '22222222222', 'bruno@email.com', '31999990002', 'Rua B, 20'),
(3, 'Carla Mendes', '33333333333', 'carla@email.com', '31999990003', 'Rua C, 30'),
(4, 'Daniel Rocha', '44444444444', 'daniel@email.com', '31999990004', 'Rua D, 40'),
(5, 'Eduarda Alves', '55555555555', 'eduarda@email.com', '31999990005', 'Rua E, 50'),
(6, 'Felipe Costa', '66666666666', 'felipe@email.com', '31999990006', 'Rua F, 60'),
(7, 'Gabriela Silva', '77777777777', 'gabriela@email.com', '31999990007', 'Rua G, 70'),
(8, 'Henrique Dias', '88888888888', 'henrique@email.com', '31999990008', 'Rua H, 80'),
(9, 'Isabela Martins', '99999999999', 'isabela@email.com', '31999990009', 'Rua I, 90'),
(10, 'Joao Pereira', '10101010101', 'joao@email.com', '31999990010', 'Rua J, 100');

INSERT INTO LAFP_FUNCIONARIO
(id_funcionario, nome, cpf, email, cargo) VALUES
(1, 'Marcos Oliveira', '12345678901', 'marcos@biblioteca.com', 'Bibliotecario'),
(2, 'Patricia Gomes', '12345678902', 'patricia@biblioteca.com', 'Atendente'),
(3, 'Ricardo Ferreira', '12345678903', 'ricardo@biblioteca.com', 'Bibliotecario'),
(4, 'Luciana Ribeiro', '12345678904', 'luciana@biblioteca.com', 'Atendente'),
(5, 'Pedro Santos', '12345678905', 'pedro@biblioteca.com', 'Gerente'),
(6, 'Fernanda Castro', '12345678906', 'fernanda@biblioteca.com', 'Auxiliar'),
(7, 'Rafael Barbosa', '12345678907', 'rafael@biblioteca.com', 'Atendente'),
(8, 'Camila Teixeira', '12345678908', 'camila@biblioteca.com', 'Auxiliar'),
(9, 'Lucas Almeida', '12345678909', 'lucas@biblioteca.com', 'Bibliotecario'),
(10, 'Juliana Nunes', '12345678910', 'juliana@biblioteca.com', 'Atendente');

INSERT INTO LAFP_LIVRO
(id_livro, titulo, isbn, ano_publicacao, edicao, id_editora) VALUES
(1, 'Harry Potter e a Pedra Filosofal', '9788532511010', 1997, '1', 2),
(2, 'Harry Potter e a Camara Secreta', '9788532511669', 1998, '1', 2),
(3, 'O Senhor dos Aneis', '9788595084759', 1954, '1', 8),
(4, 'O Hobbit', '9788595084742', 1937, '1', 8),
(5, 'A Guerra dos Tronos', '9788556510785', 1996, '1', 3),
(6, 'A Furia dos Reis', '9788556510792', 1998, '1', 3),
(7, 'Dom Casmurro', '9788535914849', 1899, '1', 1),
(8, 'Memorias Postumas de Bras Cubas', '9788535914856', 1881, '1', 1),
(9, 'A Hora da Estrela', '9788532529626', 1977, '1', 2),
(10, 'Perto do Coracao Selvagem', '9788532529633', 1943, '1', 2),
(11, 'O Iluminado', '9788581050485', 1977, '1', 5),
(12, 'It A Coisa', '9788560280940', 1986, '1', 5),
(13, '1984', '9788535914842', 1949, '1', 1),
(14, 'A Revolucao dos Bichos', '9788535909555', 1945, '1', 1),
(15, 'Assassinato no Expresso do Oriente', '9788525057013', 1934, '1', 3),
(16, 'E Nao Sobrou Nenhum', '9788525057020', 1939, '1', 3),
(17, 'Fundacao', '9788576572001', 1951, '1', 9),
(18, 'Eu Robo', '9788576572002', 1950, '1', 9),
(19, 'Duna', '9788576572003', 1965, '1', 9),
(20, 'Messias de Duna', '9788576572004', 1969, '1', 9);

INSERT INTO LAFP_LIVRO_AUTOR (id_livro, id_autor) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 6),
(12, 6),
(13, 7),
(14, 7),
(15, 8),
(16, 8),
(17, 9),
(18, 9),
(19, 10),
(20, 10);

INSERT INTO LAFP_LIVRO_CATEGORIA (id_livro, id_categoria) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 7),
(5, 1),
(6, 1),
(7, 5),
(8, 10),
(9, 8),
(10, 4),
(11, 3),
(12, 3),
(13, 9),
(14, 9),
(15, 6),
(16, 6),
(17, 2),
(18, 2),
(19, 2),
(20, 2);

INSERT INTO LAFP_EXEMPLAR
(id_exemplar, codigo_tombo, status, data_aquisicao, id_livro) VALUES
(1, 'T001', 'emprestado', '2025-01-10', 1),
(2, 'T002', 'emprestado', '2025-01-11', 2),
(3, 'T003', 'emprestado', '2025-01-12', 3),
(4, 'T004', 'emprestado', '2025-01-13', 4),
(5, 'T005', 'emprestado', '2025-01-14', 5),
(6, 'T006', 'emprestado', '2025-01-15', 6),
(7, 'T007', 'emprestado', '2025-01-16', 7),
(8, 'T008', 'emprestado', '2025-01-17', 8),
(9, 'T009', 'emprestado', '2025-01-18', 9),
(10, 'T010', 'emprestado', '2025-01-19', 10),
(11, 'T011', 'emprestado', '2025-01-20', 11),
(12, 'T012', 'emprestado', '2025-01-21', 12),
(13, 'T013', 'emprestado', '2025-01-22', 13),
(14, 'T014', 'emprestado', '2025-01-23', 14),
(15, 'T015', 'emprestado', '2025-01-24', 15),
(16, 'T016', 'emprestado', '2025-01-25', 16),
(17, 'T017', 'emprestado', '2025-01-26', 17),
(18, 'T018', 'emprestado', '2025-01-27', 18),
(19, 'T019', 'emprestado', '2025-01-28', 19),
(20, 'T020', 'emprestado', '2025-01-29', 20);

INSERT INTO LAFP_EMPRESTIMO
(id_emprestimo, data_emprestimo, data_prevista_devolucao,
data_devolucao, status, id_usuario, id_funcionario) VALUES
(1, '2026-10-01', '2026-10-15', NULL, 'ativo', 1, 1),
(2, '2026-10-02', '2026-10-16', NULL, 'ativo', 2, 2),
(3, '2026-10-03', '2026-10-17', NULL, 'atrasado', 3, 3),
(4, '2026-10-04', '2026-10-18', NULL, 'atrasado', 4, 4),
(5, '2026-10-05', '2026-10-19', NULL, 'ativo', 5, 5),
(6, '2026-10-06', '2026-10-20', NULL, 'ativo', 6, 6),
(7, '2026-10-07', '2026-10-21', NULL, 'ativo', 7, 7),
(8, '2026-10-08', '2026-10-22', NULL, 'ativo', 8, 8),
(9, '2026-10-09', '2026-10-23', NULL, 'ativo', 9, 9),
(10, '2026-10-10', '2026-10-24', NULL, 'ativo', 10, 10);

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
(id_reserva, data_reserva, status, id_usuario, id_livro) VALUES
(1, '2026-10-01', 'ativa', 1, 3),
(2, '2026-10-02', 'ativa', 2, 4),
(3, '2026-10-03', 'atendida', 3, 5),
(4, '2026-10-04', 'ativa', 4, 6),
(5, '2026-10-05', 'cancelada', 5, 7),
(6, '2026-10-06', 'ativa', 6, 8),
(7, '2026-10-07', 'atendida', 7, 9),
(8, '2026-10-08', 'ativa', 8, 10),
(9, '2026-10-09', 'expirada', 9, 11),
(10, '2026-10-10', 'ativa', 10, 12);

INSERT INTO LAFP_MULTA
(id_multa, valor, motivo, data_multa,
status_pagamento, id_emprestimo) VALUES
(1, 10.00, 'Atraso na devolucao', '2026-10-18', 'pendente', 1),
(2, 5.00, 'Atraso na devolucao', '2026-10-18', 'paga', 2),
(3, 15.00, 'Atraso na devolucao', '2026-10-18', 'pendente', 3),
(4, 20.00, 'Livro danificado', '2026-10-18', 'pendente', 4),
(5, 8.00, 'Atraso na devolucao', '2026-10-18', 'paga', 5),
(6, 12.00, 'Atraso na devolucao', '2026-10-18', 'pendente', 6),
(7, 6.00, 'Atraso na devolucao', '2026-10-18', 'paga', 7),
(8, 18.00, 'Livro danificado', '2026-10-18', 'pendente', 8),
(9, 9.00, 'Atraso na devolucao', '2026-10-18', 'paga', 9),
(10, 25.00, 'Livro danificado', '2026-10-18', 'cancelada', 10);


#Updates

#O update altera o nome da usuario com o ID igual a 1
update LAFP_USUARIO
set LAFP_USUARIO.nome = "Ana Beatriz"
where LAFP_USUARIO.id_usuario = 1;

#Atualiza o status de pagamento do primeira multa para "paga"
update LAFP_MULTA
set LAFP_MULTA.status_pagamento = "paga"
where LAFP_MULTA.id_multa = 1;

#Altera o valor da multa de id igual a 2
update LAFP_MULTA
set LAFP_MULTA.valor = 25.00
where LAFP_MULTA.id_multa = 2; 

#Deletes


#A reserva de id igual a 5 foi deletada porque foi cancelada

delete from LAFP_RESERVA
where LAFP_RESERVA.id_reserva = 5;

#A multa de id 10 foi deletada pois foi cancelada

delete from LAFP_MULTA
where LAFP_MULTA.id_multa = 10;





