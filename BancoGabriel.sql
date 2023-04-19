drop schema if exists loja2022;

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
foreign key (id_categoria) references categorias(id_categoria));

rename table produto to produtos;

show tables
