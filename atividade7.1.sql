create database carros;

use carros;

-- cria a tabela de marcas
create table cor (
  id_cor int not null,	
  cor varchar(20),
  primary key(id_cor)
);

insert into cor values(1,"Branco");
insert into cor values(2,"Preto");
insert into cor values(3,"Vermelho");
insert into cor values(4,"Azul");
insert into cor values(5,"Cinza");

-- cria a tabela de marcas
create table marca (
  id_marca int not null,
  marca varchar(20),
  primary key(id_marca)
);
insert into marca values(1,"Volkswagen");
insert into marca values(2,"Toyota");
insert into marca values(3,"Chevrolet");
insert into marca values(4,"Fiat");
insert into marca values(5,"Ford");

-- cria a tabela de modelos
create table modelo (
  id_modelo int not null,
  modelo varchar(30),
  id_marca int not null,
  primary key(id_modelo),
  foreign key(id_marca) references marca(id_marca)
);
insert into modelo values(1,"Hilux",2);
insert into modelo values(2,"Siena",4);
insert into modelo values(3,"Fiesta",5);
insert into modelo values(4,"Fusca",1);
insert into modelo values(5,"Corsa",3);

-- cria a tabela de veiculo
create table veiculo(
  placa varchar(8) not null,
  cor int not null,
  modelo int not null,	
  ano int,
  valor numeric(9,2),
  primary key(placa),
  foreign key(cor) references cor(id_cor),
  foreign key(modelo) references modelo(id_modelo)
);
insert into veiculo values("LVW1518",1,5,2010,100000.00);
insert into veiculo values("XXX1017",5,3,2009,20000.00);
insert into veiculo values("YYY0516",2,2,2013,35000.00);
insert into veiculo values("TTT2518",3,4,1960,2000.00);
insert into veiculo values("AAA2512",1,3,2010,18000.00);


-- Questão a
select * from cor;

-- Questão b
select cor from cor;

-- Questão c
select * from marca;

-- Questão d
select marca from marca;

-- Questão e
select * from modelo;

-- Questão f
select modelo from modelo;

-- Questão g
select * from modelo where modelo.id_marca = 4;

-- Questão i
select * from veiculo;

-- Questão j
select placa, cor from veiculo;

-- Questão k
select modelo, cor from veiculo;

-- Questão l
select placa, ano from veiculo;

-- Questão m
select * from veiculo where placa = "AAA2512";

-- Questão n
select * from veiculo where valor > 20000;

-- Questão o
select * from veiculo where valor >= 1000 and valor <= 20000;

-- Questão p
select * from veiculo where ano = 2010;

-- Questão q
select * from veiculo where cor = (select id_cor from cor where  cor = "BRANCO");

-- Questão r
select * from veiculo where modelo = 3;





describe modelo;
