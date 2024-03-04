-- Essa atividade requer que a tabela da atividade5 foi criado
use db2;

insert into cliente values(default,'Andrew');
insert into cliente(nome) values('Dylan');

insert into fiador values('12345678910', 'Viana');

insert into crediario values(default, '2024-03-04', 1, 1589, 1, '12345678910');