-- === DDL ===

-- /// CREATE TABLE ///

-- Criar tabela das categorias

create table categorias (
	id integer primary key autoincrement,
	nome text not null,
	descricao text
);

-- Criar tabela dos endereços

create table enderecos (
	id integer primary key autoincrement,
	logradouro text not null,
	cep varchar(8) not null,
	bairro text not null,
	cidade text not null,
	estado text not null,
	pais text not null
);

-- Criar tabela dos usuários

create table usuarios (
	id integer primary key autoincrement,
	nome varchar(30) not null,
	telefone varchar(12),
	celular varchar(13) not null,
	username varchar(20) not null,
	email text not null,
	cpf varchar(11) not null,
	data_nasc date not null,
	id_endereco integer not null,
	numero varchar(6),
	complemento text,
	foreign key(id_endereco) references enderecos(id)
);

-- Criar tabela dos pedidos de compra

create table compras (
	id integer primary key autoincrement,
	data_compra date not null,
	id_usuario integer not null,
	foreign key(id_usuario) references usuarios(id)
);

-- Criar tabela dos produtos

create table produtos (
	id integer primary key autoincrement,
	nome text not null,
	descricao text,
	qtd_estoque integer check (qtd_estoque >= 0) not null,
	data_fabr date not null,
	valor_unit decimal(7,2) check (valor_unit > 0) not null,
	id_usuario integer not null,
	id_categoria integer not null,
	foreign key(id_usuario) references usuarios(id),
	foreign key(id_categoria) references categorias(id)
);

-- Criar tabela associativa entre os pedidos de compras e os produtos

create table compras_produtos (
	id integer primary key autoincrement,
	qtd_itens integer check (qtd_itens > 0) not null,
	id_compra integer not null,
	id_produto integer not null,
	foreign key(id_compra) references compras(id),
	foreign key(id_produto) references produtos(id)
);

-- === DML ===

-- /// INSERT INTO ///

-- Iserir dados na tabela das categorias

insert into categorias (nome, descricao)
values ('Smart TVs', 'Televisões com funcionalidade smart das marcas mais procuradas como Samsung e LG.'),
	   ('Periféricos', 'Headseats, mouses, teclados, microfones, webcams e outros acessórios para auxiliar sua experiência e melhorar seu setup.'),
	   ('Smartphones', 'Aparelhos smartphone com as mais modernas funcionalidades das marcas mais procuradas como Samsung, Apple e Xiaomi.'),
	   ('Jogos', 'Uma enorme variedade de jogos para os consoles mais famosos como Nintendo, Playstation e XBOX.'),
	   ('Notebooks', 'Notebooks com as mais avançadas especificações das marcas mais procuradas como Dell, Lenovo, Samsung, Acer, Asus e HP.'),
	   ('Perfumes', 'Diferentes tipos de aromas e sensações, femininos e masculinos.'),
	   ('Livros', 'Todas as diferentes formas e tipos para você se entreter da melhor forma: Romances, Ficções, Fantasias, Aventuras, etc. '),
	   ('Eletrodomésticos', 'Geladeiras, Máquinas de lavar, Lava Louças, Adegas, etc.'),
	   ('Vestuário', 'Setor de vestuário'),
	   ('Esportes', 'Setor de esportes'),
	   ('Alimentos', 'Setor de alimentos');
	   
-- Inserir dados na tabela dos endereços
	  
insert into enderecos (logradouro, cep, bairro, cidade, estado, pais)
values ('Rua Afrânio Melo Franco', '25651000', 'Quitandinha', 'Petrópolis', 'Rio de Janeiro', 'Brasil'),
	   ('Rue des Asters', '58300987', 'Cran-Gevrier', 'Annecy', 'Genebra', 'França'),
	   ('Riley St', '9834557', 'Surry Hills', 'Sydeney', 'Nova Gales do Sul', 'Autrália'),
	   ('Camminare', '78592350', 'Manarola', 'Cinque Terre', 'Riomaggiore', 'Itália'),
	   ('Rua São Sebastião', '25651234', 'Indaiá', 'Petrópolis', 'Rio de Janeiro', 'Brasil');	  
	  
-- Inserir dados na tabela dos usuários
	  
insert into usuarios (nome, telefone, celular, username, email, cpf, data_nasc, id_endereco, numero, complemento)
values ('Fábio Freitas', '552422345432', '5524994235543', 'fabio_freitas', 'fabio_freitas@gmail.com', '12434522105', '1994-12-11', 1, '12', ''),
	   ('Francarlo Fogaça', '', '5524981260423', 'francarlofc', 'francarlo_fogaca@gmail.com', '58843450031', '1970-09-04', 2, '123', 'apt 5'),
	   ('Gabriel Bassan', '', '5524998854432', 'gabriel_bassan', 'gabriel_bassan@gmail.com', '19023511049', '2003-01-29', 3, '23', 'blc 4'),
	   ('Larissa Araújo', '', '5524992335554', 'lari_araujo', 'larissa_araujo@gmail.com', '18543255612', '2003-07-15', 4, '33', 'blc 7'),
	   ('Pedro Rodrigues', '552422215650', '5524999999999', 'pedromlsr', 'pedro_rodrigues@gmail.com', '11278423442', '1993-11-07', 5, '1001', 'apt 505');

-- Inserir dados na tabela dos pedidos de compras
	  
insert into compras (data_compra, id_usuario)
values ('2022-03-20', 1),
	   ('2022-04-03', 1),
       ('2022-03-20', 1),
       ('2022-04-01', 2),
       ('2022-03-01', 3),
       ('2022-03-30', 3),
       ('2022-03-14', 4),
       ('2022-03-14', 4),
       ('2022-03-04', 5),
       ('2022-03-15', 5);

-- Inserir dados na tabela dos produtos
      
insert into produtos (nome, descricao, qtd_estoque, data_fabr, valor_unit, id_usuario, id_categoria)
values ('Smart TV Samsung 55" 4K', 'Televisão Samsung com função smart de 55 polegadas e definição 4k.', 15, '2021-07-21', 2999.99, 1, 1),
	   ('Headset HyperX Cloud Stinger', 'Headset HyperX modelo Cloud Stinger. Ajustável, espuma memory foam e drivers de 50mm. Compatível com múltiplas plataformas.', 30, '2021-02-02', 299.99, 2, 2),
	   ('Apple IPhone 12 64GB', 'Smartphone Apple modelo IPhone 12 com memória de 64GB.', 20, '2021-03-01', 4999.99, 3, 3),
	   ('Horizon Forbidden West PS5', 'Jogo lançamento Horizon Forbidden West para Playstation 5.', 50, '2022-02-18', 249.99, 4, 4),
	   ('Notebook Dell Inspiron 15 Intel Core i7 8GB RAM 256GB SSD', 'Notebook Dell modelo Inspiron 15. Processador Intel Core i7, 8GB de memória RAM e memória interna de 256GB SSD.', 10, '2021-07-21', 3999.99, 5, 5),
	   ('Teclado mecânico Razer BlackWidow', 'Teclado mecânico Razer modelo BlackWidow com iluminação RGB, Switch Laranja hotswap e função macro.', 25, '2021-04-10', 799.99, 5, 2),
	   ('Camisa Nike', 'Camisa DryFit', 30, '2021-08-13', 119.90, 1, 9),
	   ('Bola Al Rihla', 'Bola da Copa do mundo 2022', 15,'2022-01-04', 259.90, 2, 10),
	   ('TV Samsung 60 polegadas', 'TV Ultra HD', 8, '2021-05-20', 3500.00, 3, 1),
	   ('Cenoura', 'Preço por kg', 100, '2022-03-30', 10.00, 4, 11),
	   ('Notebook Dell Vostro', 'Memória de 4GB, DDR4, Expansível até 64GB', 7, '2021-06-02', 2890.90, 5, 5),
	   ('Box Pocket Luxo De O Senhor Dos Anéis + O Hobbit - 1ª Ed.', 'Assunto: Ficção Fantástica. Idioma: Português', 305, '2019-05-02', 129.90, 2, 7),
	   ('Coleção Harry Potter - 7 Volumes', '1ª Ed. Assunto: Ficção Fantástica. Idioma: Português. Acompanhe as aventuras mágicas de Harry, Hermione e Rony Wesley.', 890, '2020-05-08', 149.90, 2, 7),
	   ('Perfume Versace Eros Masculino Eau de Toilette', 'A Fragrância que exala beleza, paixão e desejo. 100ml', 205, '2022-01-04', 413.99, 1, 6),
	   ('Good Girl de Carolina Herrera Eau de Parfum Feminino', 'Facetas luminosas da Tuberosa e do Jasmim Árabe, com notas de Amêndoa e Café. 30ml', 600, '2022-03-15', 369.00, 1, 6),
	   ('Máquina de Lavar Consul 9Kg CWB09 Branca com Ciclo Edredom Dual Dispenser Dosagem Extra Econômica - 110v', 'Capacidade total: 9kg, Voltagem: 110V ou 220V (não é bivolt)', 435, '2021-05-05', 1559.99, 3, 8),
	   ('Geladeira / Refrigerador Brastemp Duplex', 'BRM44 Frost Free 375 Litros - Branco - 110V', 321, '2021-11-19', 2879.99, 3, 8);
	  
-- Inserir dados na tabela associativa dos pedidos de compras e produtos
	  
insert into compras_produtos (qtd_itens, id_compra, id_produto)
values (1, 1, 2),
	   (2, 1, 6),
	   (1, 1, 8),
	   (1, 2, 5),
	   (2, 2, 13),
	   (3, 2, 8),
	   (1, 2, 4),
	   (1, 2, 9),
	   (2, 3, 3),
	   (2, 3, 13),
	   (2, 3, 10),
	   (1, 3, 2),
	   (1, 3, 6),
	   (3, 4, 4),
	   (1, 4, 14),
	   (1, 4, 11),
	   (1, 5, 1),
	   (2, 5, 12),
	   (2, 5, 7),
	   (1, 6, 5),
	   (1, 6, 1),
	   (2, 6, 2),
	   (1, 7, 3),
	   (2, 7, 6),
	   (1, 8, 2),
	   (1, 8, 5),
	   (2, 9, 3),
	   (1, 9, 2),
	   (1, 10, 16),
	   (2, 10, 8);
	  
-- /// UPDATE ///

-- Atualização do estoque (trocar o id_produto e o id para atualizar o produto desejado)
	  
update produtos
set qtd_estoque = (qtd_estoque - (select sum (qtd_itens)
								  from compras_produtos
								  where id_produto == 1)
				  )
where id == 1;

-- Renovação de estoque (trocar o valor somado à qtd_estoque e o id para a renovação desejada)

update produtos
set qtd_estoque = qtd_estoque + 10
where id == 3;

-- Atualizar o celular de uma pessoa com base no seu nome
	  
update usuarios
set celular == '5524982219779'
where nome == 'Pedro Rodrigues';

-- Atualizar o endereço de uma pessoa com base no seu id no sistema

update enderecos
set logradouro == 'Rua Marcílio Dias', cep == '20847365', bairro == 'Valparaíso', cidade == 'Petrópolis', estado == 'Rio de Janeiro', pais == 'Brasil'
where id == 4;

update usuarios
set numero == '44', complemento == 'blc 5'
where id == 4;

-- Black Friday fora de época!! Oferta relâmpago, aproveite!!

-- Desconto de 50 reais em todos os produtos das categorias de Jogos e Livros

update produtos
set valor_unit == (valor_unit - 50.00)
where id_categoria in (4, 7);

-- Desconto de 25% em todos os produtos acima de 1500 reais

update produtos
set valor_unit == round((valor_unit * 0.75), 2)
where valor_unit > 1500.00;

-- Já acabou a promoção... :( Voltar para os preços originais

update produtos 
set valor_unit == (valor_unit + 50.00)
where id_categoria in (4, 7);

update produtos
set valor_unit == 2999.99
where id == 1;

update produtos
set valor_unit == 4999.99
where id == 3;

update produtos
set valor_unit == 3999.99
where id == 5;

update produtos
set valor_unit == 3500.00
where id == 9;

update produtos
set valor_unit == 2890.90
where id == 11;

update produtos
set valor_unit == 1559.99
where id == 16;

update produtos
set valor_unit == 2879.99
where id == 17;

-- /// DELETE ///

-- Deletar uma compra cancelada

delete from compras_produtos
where id_compra == 6;

delete from compras
where id == 6;

-- Remover um produto do sistema com base no seu id

delete from produtos
where id == 17;

-- === DQL ===

-- /// JOIN ///

-- Consultar a categoria de cada produto

select p.nome as Produto,
	   ct.nome as Categoria
from produtos p
inner join categorias ct on p.id_categoria = ct.id;

-- Consultar os nomes e endereços de todos os usuários que residem em Petrópolis

select u.nome as Usuário,
	   (e.logradouro || ', ' || u.numero || ' ' || u.complemento || ', ' || e.bairro || ', ' || e.cep) as Endereço
from enderecos e, usuarios u
where e.id = u.id_endereco
and e.cidade == 'Petrópolis';

-- Consultar dados de um pedido de compra

select p.nome as Produto,
	   p.valor_unit as Valor,
	   cp.qtd_itens as Qtd_Comprada,
	   (p.valor_unit * cp.qtd_itens) as Valor_Total, 
	   c.data_compra as Data_Compra,
	   uc.nome as Comprador,
	   uv.nome as Vendedor
from compras_produtos cp, produtos p, compras c, usuarios uc, usuarios uv
where cp.id_compra = c.id
and c.id_usuario = uc.id
and cp.id_produto = p.id
and p.id_usuario = uv.id
and c.id == 2;

-- /// COUNT e GROUP BY ///

-- Consultar o número de compras realizadas por cada usuário

select u.nome as Usuário,
	   count (c.id) as Nº_Compras
from usuarios u, compras c
where u.id = c.id_usuario
group by u.nome
order by Nº_Compras desc;

-- Consultar o número de usuários em cada país

select e.pais as País,
	   count(u.nome) as Nº_Usuarios
from usuarios u
inner join enderecos e on u.id_endereco = e.id 
group by e.pais

-- Consultar o número de produtos em cada categoria

select ct.nome as Categoria,
	   count(p.id_categoria) as Nº_Produtos
from categorias ct
join produtos p on p.id_categoria = ct.id 
group by ct.nome

-- /// LIVRE ///

-- Consultar o número de itens diferentes cadastrados e o número total de itens no estoque

select count(id) as Nº_Itens,
	   sum(qtd_estoque) as Total_Estoque
from produtos

-- Consultar a quantidade vendida de cada produto e o respectivo valor total recebido pelas vendas

select p.nome as Produto,
	   sum (cp.qtd_itens) as Qtd_Vendida,
	   (p.valor_unit * sum (cp.qtd_itens)) as Valor_Total
from produtos p, compras_produtos cp
where p.id = cp.id_produto
group by p.nome
order by Qtd_Vendida desc, Valor_Total desc;

-- Consultar as informações do produto mais barato cadastrado

select nome as Produto,
	   min(valor_unit) as Valor,
	   descricao as Descrição 
from produtos

-- Consultar os produtos cujo nome começa com a letra A, B ou C

select nome as Produto
from produtos
where nome like 'A%'
or nome like 'B%'
or nome like 'C%'
order by nome;

-- /// NOTA FISCAL ///

-- Modelo 1

select c.id as ID, 
	   c.data_compra as Data_Compra, 
	   p.nome as Produto, 
	   p.valor_unit as Valor_Unidade, 
	   cp.qtd_itens as Quantidade,
	   (p.valor_unit * cp.qtd_itens) as Valor_Total, 
	   uc.nome as Comprador, 
	   (e.logradouro || ', ' || uc.numero || ' ' || uc.complemento || ', ' || e.cep || ', ' || e.bairro || ', ' || e.cidade || ', ' || e.estado || ', ' || e.pais) as Endereço_Comprador,
	   uv.nome as Vendedor, 
	   uv.cpf as CPF_Vendedor, 
	   uv.celular as Celular_Vendedor
from compras c
inner join usuarios uc on c.id_usuario = uc.id
inner join enderecos e on uc.id_endereco = e.id
inner join compras_produtos cp on c.id = cp.id_compra
inner join produtos p on cp.id_produto = p.id
inner join usuarios uv on p.id_usuario = uv.id
where c.id == 1;

-- Modelo 2

select c.id as Compra,
	   uc.nome as Comprador,
	   c.data_compra as "Data",
	   cp.qtd_itens as Qtd,
	   p.nome as Item,
	   p.valor_unit as Valor,
	   (p.valor_unit * cp.qtd_itens) as Total,
	   e.logradouro || ', ' || uc.numero || ' ' || uc.complemento || ', ' || e.bairro || ', ' || e.cidade || ', ' || e.pais as Endereço_Comprador,
	   uv.nome as Vendedor,
	   uv.cpf as CPF_Vendedor
from produtos p, compras_produtos cp , compras c , usuarios uc, enderecos e, usuarios uv 
where e.id = uc.id_endereco
and uv.id = p.id_usuario
and uc.id = c.id_usuario
and p.id = cp.id_produto
and c.id = cp.id_compra
and c.id == 1