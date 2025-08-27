create database PDV;
use PDV;

CREATE TABLE produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(45),
    cod_barras VARCHAR(13),
    preco DOUBLE,
    categoria VARCHAR(20)
);

create table caixa(
	id_caixa int primary key,
    localizacao varchar(20)
);

create table operador(
	id_Operador int primary key,
    nome_operador varchar(45),
    login varchar(10),
    senha varchar(10)
);

create table venda(
	id_venda INT primary key,
    data_hora datetime,
    valor_total double,
    Operador_idOperador int,
    caixa_idCaixa int,
    foreign key(operador_idOperador) references operador(idOperador),
    foreign key(caixa_idCaixa) references caixa(idCaixa)
);

create table item_venda(
	produto_idProduto int,
    venda_idVenda int,
    idItem varchar(45),
    quantidade int,
    precoUnit double,
    desconto double,
    primary key(Produto_idProduto, Venda_idVenda, idItem),
    foreign key(Produto_idProduto) references produto(idProduto),
    foreign key(Venda_idVenda) references venda(idVenda)
);

create table formaPagamento(
	id_formaPagamento int primary key,
    descricao varchar(45)
);

create table pagamento(
	id_pagamento int primary key,
    valor double,
    troco double,
    venda_idVenda int,
    formaPagamento_id_formaPagamento int,
    foreign key(Venda_idVenda) references venda(idVenda),
    foreign key(formaPagamento_id_formaPagamento) references formaPagamento(id_formaPagamento)
);

/*Inicio insert da mercearia*/
INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (1, 'Farinha Sananduva Tipo 1 5kg', '7896659600011', 14.99, 'Cereais');

INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (2, 'Molho de Tomate Stella DOrro', '7898930142179', 2.99, 'Molhos');

INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (3, 'Oleo de Soja Vilaliv 500mL', '7898247780297', 5.99, 'Cereais');

INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (4, 'Leite Integral 1L', '7891001000045', 3.20, 'Bebidas');

INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (5, 'Coca-Cola Original 2L', '7894900027013', 9.99, 'Bebidas');

INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (6, 'Coca-Cola 2L', '7891001000067', 8.00, 'Bebidas');

INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (7, 'Sabão em Pó 1kg', '7891001000078', 5.99, 'Limpeza');

INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (8, 'Detergente 500ml', '7891001000089', 2.50, 'Limpeza');

INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (9, 'Desinfetante 1L', '7891001000090', 4.80, 'Limpeza');

INSERT INTO produto (id_produto, nome, cod_barras, preco, categoria)
VALUES (10, 'Café Torrado 500g', '7891001000101', 12.90, 'Alimentos');
/*Fim dos insert de produto da mercearia*/

/*Inicio dos insert dos pdv, localização*/
INSERT INTO caixa (id_caixa, localizacao) VALUES 
(1, 'Caixa 1 - Atendimento Normal'),
(2, 'Caixa 2 - Atendimento Normal'),
(3, 'Caixa 3 - Atendimento Normal'),
(4, 'Caixa 4 - Atendimento Normal'),
(5, 'Caixa 5 - Atendimento Normal'),
(6, 'Caixa 6 - Atendimento Normal'),
(7, 'Caixa 7 - Atendimento Normal'),
(8, 'Caixa 8 - Atendimento Normal'),
(9, 'Caixa 9 - Atendimento Normal'),
(10, 'Caixa 10 - Atendimento Normal'),
(11, 'Caixa 11 - Atendimento Normal'),
(12, 'Caixa 12 - Atendimento Normal'),
(13, 'Caixa 13 - Atendimento Normal'),
(14, 'Caixa 14 - Atendimento Normal'),
(15, 'Caixa 15 - Atendimento Normal'),
(16, 'Caixa 16 - Até 15 itens'),
(17, 'Caixa 17 - Até 15 itens'),
(18, 'Caixa 18 - Preferencial'),
(19, 'Caixa 19 - Preferencial'),
(20, 'Caixa 20 - Self Service'),
(21, 'Caixa 21 - Self Service'),
(22, 'Caixa 22 - Self Service'),
(23, 'Caixa 23 - Self Service');
/*Fim dos insert dos pdv, localização*/

/*Inicio operador*/
INSERT INTO operador (id_Operador, nome_operador, login, senha) VALUES
(1, 'Artur Bothfanbos', 'artur.both', 'senha123'),
(2, 'Bernaboth', 'bernaboth', 'senha123'),
(3, 'Follawg', 'follawg', 'senha123'),
(4, 'Gabriel de Camawg', 'gabriel.camawg', 'senha123'),
(5, 'NathanBoth', 'nathan.both', 'senha123');
/*Fim operador*/


/*inicio forma de pagamento*/
INSERT INTO formaPagamento (id_formaPagamento, descricao)VALUES 
(1, 'Dinheiro'),	
(2, 'Cartão de Crédito'),
(3, 'Cartão de Débito'),
(4, 'Vale Alimentação'),
(5, 'Adiantamento Cliente'),
(6, 'Cheque'),
(7, 'Pós'),
(8, 'Pix');
/*Fim forma de Pagamentp*/

/*Inicio*/
INSERT INTO pagamento (id_pagamento, valor, troco, venda_idVenda, formaPagamento_id_formaPagamento) VALUES
(1, 34.40, 0.00, 1, 1), /*dinheiro*/
(2, 6.90, 0.00, 2, 8);  /*pix*/
/*fim*/

/*inicio venda */
INSERT INTO venda (id_venda, data_hora, valor_total, Operador_idOperador, caixa_idCaixa) VALUES
(1, '2025-08-27 09:00:00', 34.40, 1, 1),
(2, '2025-08-27 09:30:00', 6.90, 2, 2),
(3, '2025-08-27 10:15:00', 15.90, 3, 16),
(4, '2025-08-27 11:00:00', 20.80, 4, 18);
/*Fim Venda */

INSERT INTO item_venda (produto_idProduto, venda_idVenda, idItem, quantidade, precoUnit, desconto) VALUES
(1, 1, 'A1', 1, 14.99, 0.00), 
(2, 1, 'A2', 2, 2.99, 0.00),  
(5, 1, 'A3', 1, 9.99, 0.00);

INSERT INTO item_venda (produto_idProduto, venda_idVenda, idItem, quantidade, precoUnit, desconto) VALUES
(4, 27, 'B1', 27, 3.20, 0.00),   
(3, 2, 'B2', 1, 5.99, 0.29),

(7, 3, 'C1', 2, 5.99, 0.00),   
(8, 3, 'C2', 2, 2.50, 0.00),

(9, 4, 'D1', 2, 4.80, 0.00),   
(10, 4, 'D2', 1, 12.90, 0.00); 
/* Fim Item da Venda */

select * from pagamento;

update produto set categoria = 'Alimentos';
update produto set preco = 25.99 ;
update operador set senha = '123456';
