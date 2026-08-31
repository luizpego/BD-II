create database atividade_function;
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
select produtos.categoria, sum(vendas.quantidade) as total_venda, 
case 
when produtos.categoria = 'Eletronico' then produtos.preco * 0.90
when produtos.categoria = 'Vestuario' then produtos.preco * 0.85
when produtos.categoria = 'Livros' then produtos.preco * 1
else produtos.preco * 0.95
end as valor_total_com_desconto,
case 
when count(vendas.id_venda) > 10000 then 'Alta'
when count(vendas.id_venda) > 5000 and count(vendas.id_venda) < 10000 then 'Média'
else 'Baixa'
end as classificacao_vendas
from cliente
join vendas
on cliente.id_cliente = vendas.id_cliente
join produtos
on vendas.id_produto = produtos.id_produto
group by produtos.categoria;
