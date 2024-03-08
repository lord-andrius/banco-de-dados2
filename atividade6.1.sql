create database federacao;
use federacao;

create table Pais(
	idPais int,
	nome varchar(45) not null
);

create table Estado(
	idEstado int,
	nome varchar(45) not null,
	Pais_idPais int
);

create table cidade(
	idCidade int,
	nome varchar(45) not null,
	Estado_idEstado int
);

alter table Pais modify idPais int not null primary key;

alter table Estado modify idEstado int not null primary key;

alter table Estado add constraint fk_estado_pais foreign key(Pais_idPais) references Pais(idPais);

alter table Cidade modify idCidade int not null primary key;

alter table Cidade add constraint fk_cidade_estado foreign key(Estado_idEstado) references Estado(idEstado) on delete cascade;

insert into Pais values
	(0, 'Brasil'),
	(1, 'França'),
	(2, 'Suiça'),
	(3, 'Japão');

insert into Pais values(5,5);

describe Pais;

select * from Pais;

insert into Estado values
	(0,'Piauí',0),
	(1,'São Paulo',0),
	(2,'Kyoto',3),
	(3,'Kanto',3),
	(4,'Valais',1);

insert into Cidade values
	(0,'Parnaíba',0),
	(1,'São Paulo',0),
	(2,'Teresina',0),
	(3,'Santos',1),
	(4,'Campo Maior',0);

delete from Pais where idPais = 2;

-- delete from Pais where idPais = 0; -- isso vai dar um erro 

update Cidade set Estado_idEstado=1 where idCidade = 1;

delete from Estado where idEstado = 0;

describe Cidade;

select * from cidade;

