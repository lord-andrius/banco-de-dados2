create database faceIfpi;

use faceIfpi;

create table usuario(
	idUsuario int not null,
	nome varchar(50),
	cidade varchar(35),
	idade int,
	primary key(idUsuario)
);

insert into usuario values(1,'Rebeca','Parnaiba', 18);
insert into usuario values(2,'Maria','Parnaiba', 15);
insert into usuario values(3,'Denival','Murici dos Portelas', 40);
insert into usuario values(4,'Gerson','Piracuruca', 50);
insert into usuario values(5,'Vitoria','Parnaiba', 17);
insert into usuario values(6,'Clodoaldo','Campina Grande', 32);

create table grupo(
	idGrupo int not null,
	nomeGrupo varchar(40),
	primary key(idGrupo)
);

insert into grupo values(1,'Alunos');
insert into grupo values(2,'Professores');
insert into grupo values(3,'Ifpi');

create table usuarioGrupo(
	idGrupo int not null,
	idUsuario int not null,
	primary key(idGrupo, idUsuario),
	foreign key(idGrupo) references grupo(idGrupo),
	foreign key(idUsuario) references usuario(idUsuario)
);

insert into usuarioGrupo values(1,1);
insert into usuarioGrupo values(1,2);
insert into usuarioGrupo values(1,5);
insert into usuarioGrupo values(2,3);
insert into usuarioGrupo values(2,4);
insert into usuarioGrupo values(2,6);
insert into usuarioGrupo values(3,1);
insert into usuarioGrupo values(3,2);
insert into usuarioGrupo values(3,3);
insert into usuarioGrupo values(3,4);
insert into usuarioGrupo values(3,5);
insert into usuarioGrupo values(3,6);

create table mensagem(
	idMensagem int not null,
	userOrigem int not null,
	userDestino int not null,
	data date,
	conteudo varchar(150),
	primary key(idMensagem),
	foreign key(userOrigem) references usuario(idUsuario),
	foreign key(userDestino) references usuario(idUsuario)
);

insert into mensagem values(1,1,5,'2017-04-06','Vamos estudar');
insert into mensagem values(2,2,5,'2017-04-06','Anota o assunto para mim');
insert into mensagem values(3,3,4,'2017-04-07','Trabalha piraca');

-- a
select * from usuario;

-- b
select * from grupo;

-- c
select * from mensagem;

-- d
select * from mensagem where conteudo like '%estudar%';

-- e
SELECT  * from usuario where idUsuario in (SELECT idUsuario from usuarioGrupo where idGrupo in (select idGrupo from grupo where nomeGrupo = 'Ifpi'));


-- f
select * from usuario where idUsuario in (select idUsuario from usuarioGrupo where idGrupo in (SELECT idGrupo from grupo where nomeGrupo in ('Professores', 'Alunos')))


-- g
select * from usuario where idUsuario not in (select userOrigem from mensagem);

-- h
select nome from usuario where idUsuario in (select 1 userOrigem from mensagem order by idMensagem asc);

-- i
select (select nome from usuario u WHERE u.idUsuario = msg.userOrigem) as Remetente, (select nome from usuario u WHERE u.idUsuario = msg.userDestino) as Destinatario, idMensagem from mensagem as msg order by idMensagem asc limit 1;

SELECT nomeUsuario from men 
