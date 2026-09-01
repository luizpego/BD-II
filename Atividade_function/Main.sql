create database if not exists atividade_function;
use atividade_function;

create table cliente(
id_cliente int primary key auto_increment,
nome varchar(100) not null,
idade int not null,
data_cadastro date
);

create table produtos(
id_produto int primary key auto_increment,
nome_produto varchar(30) not null,
categoria varchar(20) not null,
preco decimal(10,2)
);

create table vendas(
id_venda int primary key auto_increment,
id_cliente int,
foreign key(id_cliente) references cliente(id_cliente),
id_produto int,
foreign key(id_produto) references produtos(id_produto),
data_venda date,
quantidade int
);

#1
select cliente.nome, cliente.idade,
case
when idade <18 then 'Menor'
when idade <= 59 then 'Adulto'
else 'Idoso'
end as faixa_etaria
from cliente;

#2
select cliente.nome, cliente.data_cadastro, 
case
when datediff(curdate(), cliente.data_cadastro) <= 180 then 'Novo'
else 'Antigo'
end as status_cliente
from cliente;

#3
select vendas.id_venda, cliente.id_cliente, produtos.id_produto, produtos.preco,
case 
when produtos.categoria = 'Eletronico' then produtos.preco * 0.90
when produtos.categoria = 'Vestuario' then produtos.preco * 0.85
when produtos.categoria = 'Livros' then produtos.preco * 1
else produtos.preco * 0.95
end as valor_total_com_desconto
from cliente
join vendas
on cliente.id_cliente = vendas.id_cliente
join produtos
on vendas.id_produto = produtos.id_produto;

#4
select produtos.categoria, sum(vendas.quantidade) as total_vendas,
sum(case
when produtos.categoria = 'Eletronico' then produtos.preco * vendas.quantidade * 0.90
when produtos.categoria = 'Vestuario' then produtos.preco * vendas.quantidade * 0.85
when produtos.categoria = 'Livros' then produtos.preco * vendas.quantidade
else produtos.preco * vendas.quantidade * 0.95
end) as valor_total_vendas,

case
when sum(case
when produtos.categoria = 'Eletronico' then produtos.preco * vendas.quantidade * 0.90
when produtos.categoria = 'Vestuario' then produtos.preco * vendas.quantidade * 0.85
when produtos.categoria = 'Livros' then produtos.preco * vendas.quantidade
else produtos.preco * vendas.quantidade * 0.95
end) > 10000 then 'Alta'

when sum(case
when produtos.categoria = 'Eletronico' then produtos.preco * vendas.quantidade * 0.90
when produtos.categoria = 'Vestuario' then produtos.preco * vendas.quantidade * 0.85
when produtos.categoria = 'Livros' then produtos.preco * vendas.quantidade
else produtos.preco * vendas.quantidade * 0.95
end) >= 5000 then 'Média'

else 'Baixa'
end as classificacao_vendas

from cliente
join vendas
on cliente.id_cliente = vendas.id_cliente
join produtos
on vendas.id_produto = produtos.id_produto
group by produtos.categoria;

#5
select cliente.nome, count(vendas.id_cliente), 
case 
when count(vendas.id_cliente) > 5 then 'Frequente'
else 'Infrequente'
end as classificao
from cliente
join vendas
on cliente.id_cliente = vendas.id_cliente
group by cliente.nome;

#6
DELIMITER //

create function calcular_total_compras(p_id_cliente int)
returns decimal(10,2)
deterministic
begin

declare total decimal(10,2);

select sum(produtos.preco * vendas.quantidade)
into total
from vendas
join produtos
on vendas.id_produto = produtos.id_produto
where vendas.id_cliente = p_id_cliente;

return total;

end //

DELIMITER ;
select calcular_total_compras(1);

#7
DELIMITER //
create function if not exists idade_media_por_categoria(categoria varchar(50))
returns decimal(10,2)
deterministic
begin

declare media decimal(10,2);

select avg(cliente.idade)
into media
from cliente
join vendas
on cliente.id_cliente = vendas.id_cliente
join produtos
on vendas.id_produto = produtos.id_produto
where produtos.categoria = categoria;
return media;
end //
DELIMITER ;
select idade_media_por_categoria('eletronico');

#8
DELIMITER //

create function calcular_quantidade_vendida_cliente(id_cliente int)
returns int
deterministic
begin

declare total int;

select sum(vendas.quantidade)
into total
from vendas
where vendas.id_cliente = id_cliente;

return total;

end //

DELIMITER ;

select calcular_quantidade_vendida_cliente(1);

#9
DELIMITER //

create function tempo_cadastro_cliente(id_cliente int)
returns int
deterministic
begin

declare tempo int;

select timestampdiff(year, cliente.data_cadastro, current_date)
into tempo
from cliente
where cliente.id_cliente = id_cliente;

return tempo;

end //

DELIMITER ;

select tempo_cadastro_cliente(1);

#10
DELIMITER //

create function verificar_cliente_vip(id_cliente int)
returns varchar(20)
deterministic
begin

declare total_gasto decimal(10,2);
declare total_compras int;

select sum(produtos.preco * vendas.quantidade), count(vendas.id_venda)
into total_gasto, total_compras
from vendas
join produtos
on vendas.id_produto = produtos.id_produto
where vendas.id_cliente = id_cliente;

if total_gasto > 5000 and total_compras >= 5 then
return 'Cliente VIP';
else
return 'Cliente regular';
end if;

end //

DELIMITER ;

select verificar_cliente_vip(1);