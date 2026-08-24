#1
create view filme_em_estoque as
select filme.titulo, loja.loja_id
from filme 
join inventario
on filme.filme_id = inventario.filme_id
join loja
on loja.loja_id = inventario.loja_id
where inventario.filme_id is not null;

DROP VIEW filme_em_estoque;
select * from filme_em_estoque;

#2

create view clientes_vips as
select cliente.primeiro_nome, cliente.ultimo_nome, count(aluguel.aluguel_id), cidade.cidade
from cliente
join pagamento
on pagamento.cliente_id = cliente.cliente_id
join aluguel
on pagamento.aluguel_id = aluguel.aluguel_id
join endereco 
on cliente.endereco_id = endereco.endereco_id
join cidade
on endereco.cidade_id = cidade.cidade_id
group by cliente.primeiro_nome, cliente.ultimo_nome
having count( aluguel.aluguel_id)>30;

select * from clientes_vips;


#3

create view receita_categoria as
select c.nome as nome_cat, sum(p.valor) as receita_total from categoria c
join filme_categoria fc on c.categoria_id=fc.categoria_id
join filme f on fc.filme_id=f.filme_id
join inventario i on f.filme_id=i.filme_id
join aluguel a on a.inventario_id=i.inventario_id
join pagamento p on p.aluguel_id = a.aluguel_id
group by c.nome;

select * from receita_categoria;

#4

create view cliente_zero as
select cliente.primeiro_nome, cliente.ultimo_nome, cliente.cliente_id, count(aluguel.aluguel_id), cidade.cidade
from cliente
join pagamento
on pagamento.cliente_id = cliente.cliente_id
left join aluguel
on pagamento.aluguel_id = aluguel.aluguel_id
join endereco 
on cliente.endereco_id = endereco.endereco_id
join cidade
on endereco.cidade_id = cidade.cidade_id
group by cliente.primeiro_nome, cliente.ultimo_nome
having max(aluguel.data_de_aluguel) < date_sub(curdate(), interval 6 month);


drop view cliente_zero;
select * from cliente_zero;

#5

create view receita_total as
select categoria.nome, sum(pagamento.valor), count(filme.filme_id)
from filme 
join filme_categoria
on filme.filme_id = filme_categoria.filme_id
join categoria
on filme_categoria.categoria_id = categoria.categoria_id
join inventario
on filme.filme_id = inventario.filme_id
join aluguel
on inventario.inventario_id = aluguel.inventario_id
join pagamento
on pagamento.aluguel_id = aluguel.aluguel_id
where aluguel.data_de_aluguel >= date_sub(current_date, interval 12 month)
group by categoria.nome;

drop view receita_total;
select * from receita_total;

#6 

create view taxa_alocacao as
select filme.titulo, categoria.nome, count(aluguel.aluguel_id) as aluguel, sum(pagamento.valor) as receita
from filme
join filme_categoria
on filme.filme_id = filme_categoria.filme_id
join categoria
on filme_categoria.categoria_id = categoria.categoria_id
join inventario
on filme.filme_id = inventario.filme_id
join aluguel
on inventario.inventario_id = aluguel.inventario_id
join pagamento
on pagamento.aluguel_id = aluguel.aluguel_id
group by filme.filme_id, filme.titulo, categoria.nome;

drop view taxa_alocacao;

select * from taxa_alocacao t1
where aluguel = (
    select max(t2.aluguel)
    from taxa_alocacao t2
    where t2.nome = t1.nome
);

#7

create view analise as
select categoria.nome, sum(pagamento.valor), count(distinct filme.filme_id), sum(pagamento.valor) / count(distinct filme.filme_id)
from filme
join filme_categoria
on filme.filme_id = filme_categoria.filme_id
join categoria
on filme_categoria.categoria_id = categoria.categoria_id
join inventario
on filme.filme_id = inventario.filme_id
join aluguel
on inventario.inventario_id = aluguel.inventario_id
join pagamento
on pagamento.aluguel_id = aluguel.aluguel_id
group by categoria.nome;

select * from analise;

#8
create view receita_funcionario as
select funcionario.primeiro_nome,funcionario.ultimo_nome, loja.loja_id, count(aluguel.aluguel_id), sum(pagamento.valor)
from funcionario
join loja
on funcionario.loja_id = loja.loja_id
join pagamento
on funcionario.funcionario_id = pagamento.funcionario_id
join aluguel
on pagamento.aluguel_id = aluguel.aluguel_id
group by funcionario.primeiro_nome,funcionario.ultimo_nome, loja.loja_id;

select * from receita_funcionario;

#9

create view analise_popularidade as
select cidade.cidade, pais.pais, categoria.nome, count(aluguel.aluguel_id) as aluguel
from cidade
join endereco
on cidade.cidade_id = endereco.cidade_id
join cliente
on endereco.endereco_id = cliente.endereco_id
join aluguel
on cliente.cliente_id = aluguel.cliente_id
join inventario
on aluguel.inventario_id = inventario.inventario_id
join filme
on inventario.filme_id = filme.filme_id
join filme_categoria
on filme.filme_id = filme_categoria.filme_id
join categoria
on filme_categoria.categoria_id = categoria.categoria_id
join pais
on cidade.pais_id = pais.pais_id
group by cidade.cidade, pais.pais, categoria.nome;

select *
from analise_popularidade t1
where aluguel = (
    select max(t2.aluguel)
    from analise_popularidade t2
    where t2.cidade = t1.cidade
);