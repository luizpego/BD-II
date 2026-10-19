
USE biblioteca_lafp;

-- 1. Busca livros publicados a partir do ano 2000.
SELECT *
FROM LAFP_LIVRO
WHERE ano_publicacao >= 2000;


-- 2. Busca usuarios cujo nome comeca com a letra A.
SELECT *
FROM LAFP_USUARIO
WHERE nome LIKE 'A%';


-- 3. Mostra os livros, suas editoras e os exemplares.
SELECT
    LAFP_LIVRO.titulo,
    LAFP_EDITORA.nome,
    LAFP_EXEMPLAR.codigo_tombo
FROM LAFP_LIVRO
INNER JOIN LAFP_EDITORA
ON LAFP_LIVRO.id_editora = LAFP_EDITORA.id_editora
INNER JOIN LAFP_EXEMPLAR
ON LAFP_LIVRO.id_livro = LAFP_EXEMPLAR.id_livro;


-- 4. Mostra o nome dos livros e de seus autores.
SELECT
    LAFP_LIVRO.titulo,
    LAFP_AUTOR.nome,
    LAFP_AUTOR.nacionalidade
FROM LAFP_LIVRO
INNER JOIN LAFP_LIVRO_AUTOR
ON LAFP_LIVRO.id_livro = LAFP_LIVRO_AUTOR.id_livro
INNER JOIN LAFP_AUTOR
ON LAFP_LIVRO_AUTOR.id_autor = LAFP_AUTOR.id_autor;


-- 5. Mostra os emprestimos, usuarios e funcionarios.
SELECT
    LAFP_EMPRESTIMO.id_emprestimo,
    LAFP_USUARIO.nome,
    LAFP_FUNCIONARIO.nome,
    LAFP_EMPRESTIMO.status
FROM LAFP_EMPRESTIMO
INNER JOIN LAFP_USUARIO
ON LAFP_EMPRESTIMO.id_usuario = LAFP_USUARIO.id_usuario
INNER JOIN LAFP_FUNCIONARIO
ON LAFP_EMPRESTIMO.id_funcionario = LAFP_FUNCIONARIO.id_funcionario;


-- 6. Conta a quantidade de livros de cada editora.
SELECT
    LAFP_EDITORA.nome,
    COUNT(LAFP_LIVRO.id_livro) AS quantidade_livros
FROM LAFP_EDITORA
INNER JOIN LAFP_LIVRO
ON LAFP_EDITORA.id_editora = LAFP_LIVRO.id_editora
GROUP BY LAFP_EDITORA.id_editora, LAFP_EDITORA.nome;


-- 7. Calcula o valor total das multas de cada usuario.
SELECT
    LAFP_USUARIO.nome,
    SUM(LAFP_MULTA.valor) AS total_multas
FROM LAFP_USUARIO
INNER JOIN LAFP_EMPRESTIMO
ON LAFP_USUARIO.id_usuario = LAFP_EMPRESTIMO.id_usuario
INNER JOIN LAFP_MULTA
ON LAFP_EMPRESTIMO.id_emprestimo = LAFP_MULTA.id_emprestimo
WHERE LAFP_MULTA.status_pagamento <> 'cancelada'
GROUP BY LAFP_USUARIO.id_usuario, LAFP_USUARIO.nome;


-- 8. Mostra categorias que possuem pelo menos 2 livros.
SELECT
    LAFP_CATEGORIA.nome,
    COUNT(LAFP_LIVRO_CATEGORIA.id_livro) AS quantidade_livros
FROM LAFP_CATEGORIA
INNER JOIN LAFP_LIVRO_CATEGORIA
ON LAFP_CATEGORIA.id_categoria = LAFP_LIVRO_CATEGORIA.id_categoria
GROUP BY LAFP_CATEGORIA.id_categoria, LAFP_CATEGORIA.nome
HAVING COUNT(LAFP_LIVRO_CATEGORIA.id_livro) >= 2;


-- 9. Busca livros publicados antes da media dos anos de publicacao.
SELECT
    titulo,
    ano_publicacao
FROM LAFP_LIVRO
WHERE ano_publicacao < (
    SELECT AVG(ano_publicacao)
    FROM LAFP_LIVRO
);


-- 10. Mostra os emprestimos com usuarios e livros,
-- ordenados pela data do emprestimo.
SELECT
    LAFP_USUARIO.nome,
    LAFP_LIVRO.titulo,
    LAFP_EMPRESTIMO.data_emprestimo,
    LAFP_EMPRESTIMO.status
FROM LAFP_USUARIO
INNER JOIN LAFP_EMPRESTIMO
ON LAFP_USUARIO.id_usuario = LAFP_EMPRESTIMO.id_usuario
INNER JOIN LAFP_EMPRESTIMO_EXEMPLAR
ON LAFP_EMPRESTIMO.id_emprestimo = LAFP_EMPRESTIMO_EXEMPLAR.id_emprestimo
INNER JOIN LAFP_EXEMPLAR
ON LAFP_EMPRESTIMO_EXEMPLAR.id_exemplar = LAFP_EXEMPLAR.id_exemplar
INNER JOIN LAFP_LIVRO
ON LAFP_EXEMPLAR.id_livro = LAFP_LIVRO.id_livro
ORDER BY LAFP_EMPRESTIMO.data_emprestimo DESC;
