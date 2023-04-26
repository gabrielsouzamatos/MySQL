drop schema if exists loja2023;

create schema loja2023;

use loja2023;

create table paises(
id_pais int not null  auto_increment,
nome varchar(50) not null,
primary key (id_pais));

create table cidades(
id_cidade int not null auto_increment primary key,
nome varchar(50) not null,
UF char(2),
id_pais int not null,
foreign key (id_pais) references paises(id_pais));
   
create table categorias(
nome varchar(50) not null,
id_categoria int not null auto_increment primary key);

insert into paises values 
(1, "Brasil"), 
(2, "Argentina"),
(3, "Paraguai"), 
(4, "Uruguai"), 
(5, "Colombia");  

insert into paises(nome) values 
("Portugal"), 
("Espanha"),
("Alemanha"), 
("Estados Unidos"), 
("Canadá"),
("Australia"), 
("Belgica"),
("Uganda"), 
("Nigeria"), 
("Tokyo"),
("Porto Rico"), 
("Piru"),
("Paquistão"), 
("Mongolia"), 
("Mexico");

insert into cidades values
(1, "Londrina", "PR", 1),
(2, "Cambé", "PR", 1),
(3, "São Paulo", "SP", 1),
(4, "Campinas", "SP", 1),
(5, "Curitiba", "PR", 1);

insert into cidades(nome, UF, id_pais) values
("Maringá", "PR", 1),
("Barracão", "PR", 1),
("Dionísio Cerqueira", "SC", 1),
("Buenos Aires", NULL, 2),
("Salto", NULL, 4);

SELECT * FROM paises;
SELECT * FROM cidades;

describe cidades;

-- DDL -inserindo nomes a categorias

insert into categorias (nome) values
("Eletrônicos") ,
("Alimentos e Bebidas"),
("Cama, Mesa e banho"),
("Esporte e Lazer"),
("Embalagem"),
("Materias de Limpeza"),
("Bebes e crianças"),
("Brinquedos"),
("Games"),
("Livros");

-- DDL atualizando nomes das categorias

update categorias
set nome = "Alimentos e Bebidas"
where id_categoria = 2;

update categorias
set nome = "Embalagens"
where id_categoria = 3;

update categorias
set nome = "Jogos"
where id_categoria = 4;

-- selecionar cidades onde a uf é paraná
select cidades.nome, paises.nome from cidades,paises 
where cidades.id_pais = paises.id_pais and uf = "PR" order by cidades.nome;

-- selecionar cidades onde a uf é paraná ou são paulo
select cidades.nome, paises.nome from cidades,paises 
where cidades.id_pais = paises.id_pais and (uf = "PR" or uf = "SP") order by cidades.nome;

-- selecionar cidades onde a uf não é paraná
select cidades.nome, paises.nome from cidades,paises 
where cidades.id_pais = paises.id_pais and not uf = "PR" order by cidades.nome;

-- selecionar cidades que começam com L
select nome from cidades where nome like "L%";

-- selecionar cidades que tenham "on" em qualquer parte
select nome from cidades where nome like "%on%";

create table if not exists Produto(
id_produto int not null auto_increment primary key,
nome varchar(50) not null,
qtd int not null,
qtd_min int not null,
valor decimal(6,2) not null,
id_categoria int not null,
foreign key (id_categoria) references c));

-- alter table ou rename mudar o nome da tabela
rename table produto to produtos;

-- alter table add para adicionar um campo
alter table produtos add observacao varchar(50) not null;

-- alter table drop para remover um campo
alter table produtos drop observacao;

alter table produtos drop valor;

alter table produtos add valor decimal(10,2) not null;

desc produtos;

insert into produtos values(1, "Percy Jackson, O Ladrão de Raios", 50, 10, 10, 28.50);

insert into produtos values(2, "O estrangeiro", 40, 15, 10, 20.79);

insert into produtos values(3, "Mortal kombat", 100, 30, 9, 130.90);

insert into produtos values(4, "IPhone 14", 20, 5, 1, 6890.99);

insert into produtos values(5, "A Seleção", 40, 10, 10, 28.50);

insert into produtos values(6, "Introdução BD", 20, 5, 10, 280.69);

insert into produtos values(7, "Bola de Basquete", 100, 30, 4, 117.98);

insert into produtos values(8, "PS5", 20, 5, 1, 6658.20);

insert into produtos values(9, "Fortnite", 80, 40, 9, 249.99);

insert into produtos values(10, "Xiomi", 200, 50, 1, 3250.50);

select * from produtos;

select produtos.nome, valor, categorias.nome from produtos, categorias
where produtos.id_categoria = categorias.id_categoria and valor > 150.00 order by produtos.valor desc;

select produtos.nome, valor, categorias.nome from produtos, categorias
where produtos.id_categoria = categorias.id_categoria and valor <= 150.00 order by produtos.valor desc;

