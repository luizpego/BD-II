INSERT INTO cliente (nome, idade, data_cadastro) VALUES
('João Silva', 15, '2025-01-10'),
('Maria Souza', 18, '2025-01-15'),
('Carlos Oliveira', 25, '2025-02-05'),
('Ana Santos', 35, '2025-02-20'),
('Pedro Costa', 59, '2025-03-01'),
('Juliana Alves', 60, '2025-03-10'),
('Roberto Lima', 72, '2025-03-15'),
('Fernanda Rocha', 45, '2025-04-02'),
('Lucas Martins', 17, '2025-04-10'),
('Patrícia Gomes', 65, '2025-04-20');

INSERT INTO produtos (nome_produto, categoria, preco) VALUES
('Notebook', 'Eletronico', 3500.00),
('Mouse', 'Periferico', 80.00),
('Teclado', 'Periferico', 150.00),
('Monitor', 'Eletronico', 1200.00),
('Celular', 'Eletronico', 2500.00),
('Fone de ouvido', 'Acessorio', 200.00),
('Cadeira', 'Moveis', 900.00),
('Webcam', 'Periferico', 300.00);

INSERT INTO vendas 
(id_cliente, id_produto, data_venda, quantidade) VALUES
(1, 2, '2025-05-01', 2),
(2, 1, '2025-05-02', 1),
(3, 3, '2025-05-03', 1),
(4, 4, '2025-05-05', 2),
(5, 5, '2025-05-08', 1),
(6, 6, '2025-05-10', 3),
(7, 7, '2025-05-12', 1),
(8, 8, '2025-05-15', 2),
(9, 2, '2025-05-18', 1),
(10, 5, '2025-05-20', 1),
(3, 2, '2025-05-22', 3),
(4, 6, '2025-05-25', 1);



