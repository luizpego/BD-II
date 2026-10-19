#FASE 4
#Consultas select

USE biblioteca_lafp;


#Select 1 
#Mostra nome, email e telefone de usuarios com id maior que 5

select LAFP_USUARIO.nome,LAFP_USUARIO.email,LAFP_USUARIO.telefone
from LAFP_USUARIO
where LAFP_USUARIO.id_usuario >5;

#Select 2
#Mostra titulo, ano de publicação e livros publicados depois de 1950

select LAFP_LIVRO.titulo,  LAFP_LIVRO.ano_publicacao
from  LAFP_LIVRO
where  LAFP_LIVRO.ano_publicacao > 1950;

#Select 3
#Mostra o titulo de cada livro, nome do autor e sua nacionalidade

select  LAFP_LIVRO.titulo, LAFP_AUTOR.nome, LAFP_AUTOR.nacionalidade
from  LAFP_LIVRO
join  LAFP_LIVRO_AUTOR
on LAFP_LIVRO.id_livro = LAFP_LIVRO_AUTOR.id_livro
join LAFP_AUTOR
on  LAFP_LIVRO_AUTOR.id_autor =  LAFP_AUTOR.id_autor;

#Select 4
#Mostra o nome de cada usuario, a data que alugou e o nome do funcionarior responsavel

select  LAFP_USUARIO.nome,  LAFP_EMPRESTIMO.data_emprestimo,  LAFP_FUNCIONARIO.nome
from  LAFP_USUARIO
join  LAFP_EMPRESTIMO
on LAFP_USUARIO.id_usuario =  LAFP_EMPRESTIMO.id_usuario
join LAFP_FUNCIONARIO
on LAFP_EMPRESTIMO.id_funcionario = LAFP_FUNCIONARIO.id_funcionario;

#Select 5
#Mostra o titulo, a categoria e a editora de cada livro

select  LAFP_LIVRO.titulo,  LAFP_CATEGORIA.nome,  LAFP_EDITORA.nome
from  LAFP_LIVRO
join LAFP_LIVRO_CATEGORIA
on  LAFP_LIVRO.id_livro = LAFP_LIVRO_CATEGORIA.id_livro
join LAFP_CATEGORIA
on LAFP_LIVRO_CATEGORIA.id_categoria = LAFP_CATEGORIA.id_categoria
join LAFP_EDITORA
on LAFP_EDITORA.id_editora = LAFP_LIVRO.id_editora;

#Select 6
#Mostra o nome de cada usuario e quantidade de emprestimos que ele realizou

select LAFP_USUARIO.nome, count(LAFP_EMPRESTIMO.id_emprestimo)
from LAFP_USUARIO
join LAFP_EMPRESTIMO
on LAFP_USUARIO.id_usuario = LAFP_EMPRESTIMO.id_usuario
group by LAFP_USUARIO.nome;

#Select 7
#Mostra o nome de cada usuário e o valor total das multas associadas aos seus empréstimos

select LAFP_USUARIO.nome, sum(LAFP_MULTA.valor) as valor_total_multa
from LAFP_USUARIO
join LAFP_EMPRESTIMO
on LAFP_USUARIO.id_usuario = LAFP_EMPRESTIMO.id_usuario
join LAFP_MULTA
on LAFP_MULTA.id_emprestimo = LAFP_EMPRESTIMO.id_emprestimo
group by LAFP_USUARIO.nome;

#Select 8
#Mostra o nome dos autores que mais de um livro cadastrado na biblioteca e a quantidade de livros de cada um

select LAFP_AUTOR.nome, count(LAFP_LIVRO.id_livro) as total_livros_publicados
from LAFP_AUTOR
join LAFP_LIVRO_AUTOR
on LAFP_LIVRO_AUTOR.id_autor = LAFP_AUTOR.id_autor
join LAFP_LIVRO
on LAFP_LIVRO.id_livro = LAFP_LIVRO_AUTOR.id_livro
group by LAFP_AUTOR.nome
having count(LAFP_LIVRO.id_livro) > 1;

#Select 9
#Mostre o título e o ano de publicação dos livros publicados depois da média dos anos de publicação de todos os livros cadastrados
select LAFP_LIVRO.titulo, LAFP_LIVRO.ano_publicacao
from LAFP_LIVRO
where ano_publicacao > (select avg(LAFP_LIVRO.ano_publicacao) from LAFP_LIVRO);

#Select 10

#Mostra o nome do usuário, o título do livro que ele pegou emprestado e a data do empréstimo.
#E organiza em ordem do emprestimo da mais recente para a mais antiga
SELECT LAFP_USUARIO.nome, LAFP_LIVRO.titulo, LAFP_EMPRESTIMO.data_emprestimo
FROM LAFP_USUARIO
JOIN LAFP_EMPRESTIMO
ON LAFP_USUARIO.id_usuario = LAFP_EMPRESTIMO.id_usuario
JOIN LAFP_EMPRESTIMO_EXEMPLAR
ON LAFP_EMPRESTIMO.id_emprestimo = LAFP_EMPRESTIMO_EXEMPLAR.id_emprestimo
JOIN LAFP_EXEMPLAR
ON LAFP_EMPRESTIMO_EXEMPLAR.id_exemplar = LAFP_EXEMPLAR.id_exemplar
JOIN LAFP_LIVRO
ON LAFP_EXEMPLAR.id_livro = LAFP_LIVRO.id_livro
ORDER BY LAFP_EMPRESTIMO.data_emprestimo DESC;
