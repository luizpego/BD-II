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
group by cliente.primeiro_nome, cliente.ultimo_nome;

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
where aluguel.aluguel_id is null
group by cliente.primeiro_nome, cliente.ultimo_nome;


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
group by categoria.nome;

select * from receita_total;
