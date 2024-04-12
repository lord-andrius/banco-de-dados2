-- a
create database PM;
use  PM;

-- b
create table Delito(
	id_delito int primary key auto_increment,
	nome varchar(20)
);

create table Localidade(
	id_localidade int primary key auto_increment,
	nome varchar(20)
);

create table tese(
	nome varchar(10) primary key,
	teste int
);

create table Ocorrencia(
	num_ocorrencia int primary key auto_increment,
	delito int not null,
	localidade int not null, 
	`data` date,
	hora time,
	foreign key(delito) references delito(id_delito) ,
	foreign key(localidade) references localidade(id_localidade) 
);



insert into delito(nome) values ('roubo'), ('latrocinio'), ('furto');

insert into localidade(nome) values('planalto'), ('catavento'),('catanduvas');


insert into ocorrencia(delito, localidade, `data`,hora) values (1,1,'2016-02-29','12:00');
insert into ocorrencia(delito, localidade, `data`,hora) values (2,2,'2016-02-29','13:00');
insert into ocorrencia(delito, localidade, `data`,hora) values (3,3,'2016-02-29','14:00');
insert into ocorrencia(delito, localidade, `data`,hora) values (1,3,'2016-03-29','14:00');
insert into ocorrencia(delito, localidade, `data`,hora) values (1,1,'2016-03-01','12:00');
insert into ocorrencia(delito, localidade, `data`,hora) values (1,1,'2016-03-01','14:00');
insert into ocorrencia(delito, localidade, `data`,hora) values (2,2,'2016-03-01','16:00');
insert into ocorrencia(delito, localidade, `data`,hora) values (1,1,'2016-03-01','12:00');





delete from ocorrencia  where num_ocorrencia = 0;

select (nome) from delito;

select distinct * from localidade where id_localidade in (select (localidade) from ocorrencia);
select distinct * from localidade where id_localidade in (select (localidade) from ocorrencia where `data` between '2016-03-1' and '2016-03-31' and delito in (select id_delito from delito where nome = 'furto'));

select * from ocorrencia where `data` between '2016-02-01' and '2016-02-29';

select * from ocorrencia where `data` in ('2016-02-03','2016-02-29');

delete from ocorrencia where `data` = '2016-03-10' and localidade = (select (id_localidade) from localidade where nome='catavento');
select * from ocorrencia where localidade in (select (id_localidade) from localidade where nome in ('catavento', 'catanduvas'));


select * from localidade where id_localidade not in (select (localidade) from ocorrencia where `data` between '2016-03-1' and '2016-03-31' );

select nome from delito where id_delito in (select MAX(delito) from ocorrencia);










