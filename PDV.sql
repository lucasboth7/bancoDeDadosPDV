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
insert into produto (id_produto, nome, cod_barras, preco, categoria)values 
(1, 'Farinha Sananduva Tipo 1 5kg', '7896659600011', 14.99, 'Cereais'),
(2, 'Molho de Tomate Stella DOrro', '7898930142179', 2.99, 'Molhos'),
(3, 'Oleo de Soja Vilaliv 500mL', '7898247780297', 5.99, 'Cereais'),
(4, 'Leite Integral 1L', '7891001000045', 3.20, 'Bebidas'),
(5, 'Coca-Cola Original 2L', '7894900027013', 9.99, 'Bebidas'),
(6, 'Coca-Cola 2L', '7891001000067', 8.00, 'Bebidas'),
(7, 'Sabão em Pó 1kg', '7891001000078', 5.99, 'Limpeza'),
(8, 'Detergente 500ml', '7891001000089', 2.50, 'Limpeza'),
(9, 'Desinfetante 1L', '7891001000090', 4.80, 'Limpeza'),
(10, 'Café Torrado 500g', '7891001000101', 12.90, 'Alimentos');
/*Fim dos insert de produto da mercearia*/

/*Inicio dos insert dos pdv, localização*/
insert into caixa (id_caixa, localizacao) values 
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
insert into operador (id_Operador, nome_operador, login, senha) values
(1, 'Artur Bothfanbos', 'artur.both', 'senha123'),
(2, 'Bernaboth', 'bernaboth', 'senha123'),
(3, 'Follawg', 'follawg', 'senha123'),
(4, 'Gabriel de Camawg', 'gabriel.camawg', 'senha123'),
(5, 'NathanBoth', 'nathan.both', 'senha123');
/*Fim operador*/


/*inicio forma de pagamento*/
insert into formaPagamento (id_formaPagamento, descricao)values
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
insert into pagamento (id_pagamento, valor, troco, venda_idVenda, formaPagamento_id_formaPagamento) values
(1, 34.40, 0.00, 1, 1), /*dinheiro*/
(2, 6.90, 0.00, 2, 8);  /*pix*/
/*fim*/

/*inicio venda */
insert into venda (id_venda, data_hora, valor_total, Operador_idOperador, caixa_idCaixa) values
(1, '2025-08-27 09:00:00', 34.40, 1, 1),
(2, '2025-08-27 09:30:00', 6.90, 2, 2),
(3, '2025-08-27 10:15:00', 15.90, 3, 16),
(4, '2025-08-27 11:00:00', 20.80, 4, 18);
/*Fim Venda */

insert into item_venda (produto_idProduto, venda_idVenda, idItem, quantidade, precoUnit, desconto) VALUES
(1, 1, 'A1', 1, 14.99, 0.00), 
(2, 1, 'A2', 2, 2.99, 0.00),  
(5, 1, 'A3', 1, 9.99, 0.00);

insert into item_venda (produto_idProduto, venda_idVenda, idItem, quantidade, precoUnit, desconto) VALUES
(4, 2, 'B1', 27, 3.20, 0.00),   
(3, 2, 'B2', 1, 5.99, 0.29),

(7, 3, 'C1', 2, 5.99, 0.00),   
(8, 3, 'C2', 2, 2.50, 0.00),

(9, 4, 'D1', 2, 4.80, 0.00),   
(10, 4, 'D2', 1, 12.90, 0.00); 
/* Fim Item da Venda */

/*Quest1*/
update operador set senha = '123456';
update pagamento set troco = 0.0;
update produto set preco = preco* 1.05; /*aumenta 5% tudo*/;

/*quest2*/
update produto set preco = 10.59 where nome = 'Coca-Cola Original 2L';
update produto set preco = 7.99 where nome = 'Desinfetante 1L';
update produto set preco = 1.99 where nome = 'Detergente 500ml';

/*quest3*/
alter table produto add estoque double default 0;
alter table operador change senha senha_operador varchar(10);
alter table operador change login login_operador varchar(10);

/*questão 4*/
select * from produto where categoria = 'Bebidas'; 
select * from operador where nome_operador like 'A%';
select * from produto where preco between 5 and 10;
select * from venda where Operador_idOperador IN (1, 2);
select * from caixa where localizacao like '%Self%';
select * from pagamento where formaPagamento_id_formaPagamento = 1;
select * from produto where categoria <> 'Limpeza'; /*exceto limpeza*/
select * from item_venda where quantidade > 2;
select * from produto where nome like '%Coca%';
select * from venda where data_hora > '2025-08-27 10:00:00'; /*venda dps das 10h do dia 27/08*/

/*questao 5*/
select * from produto order by preco ASC; /*preco ordem crescente*/
select * from operador order by nome_operador; 
select * from venda order by data_hora DESC; /*ordem decrescente das venda*/
select * from pagamento order by valor DESC; 
select * from caixa order by id_caixa ASC;
