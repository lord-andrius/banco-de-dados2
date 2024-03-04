create database aulasql;

create table cliente(
	id int not null auto_increment primary key,
	nome varchar(50)
);

create table crediario(
	num_crediario int not null primary key,
	data date not null,
	cliente_id int not null,
	valor decimal(15,2),
	constraint fk_crediario_cliente foreign key(cliente_id) references cliente(id)
);

create table prestacoes(
	num_crediario int not null,
	num_prestacao int not null,
	primary key(num_crediario, num_prestacao),
	constraint fk_prestacoes_crediario foreign key(num_crediario) references crediario(num_crediario)
);

alter table crediario add column qtd_prestacoes int not null;

alter table cliente modify column nome varchar(100) not null; 

alter table prestacoes add column valor decimal(15,2) not null;

alter table prestacoes add column data_prevista date not null;

alter table prestacoes add column data_pagamento date;

alter table crediario add column nome_fiador varchar(100);

alter table crediario add column cpf_fiador varchar(11);

alter table crediario drop column nome_fiador;

alter table crediario drop column cpf_fiador;

create table fiador(
	cpf varchar(11) not null primary key,
	nome varchar(100) not null
);

alter table crediario modify column num_crediario int not null auto_increment;

alter table crediario add column fiador varchar(11);

alter table crediario add constraint fk_crediario_fiador foreign key(fiador) references fiador(cpf);
describe crediario;