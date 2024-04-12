use carros;

-- c)
select mo.modelo, ma.marca from modelo mo, marca ma
	where mo.id_marca = ma.id_marca
	order by mo.modelo;

-- d)
select mo.modelo, ma.marca from modelo mo 
	join marca ma on mo.id_marca = ma.id_marca
	order by mo.modelo;
	
-- e)
select mo.modelo, ma.marca from modelo mo 
	left join marca ma on mo.id_marca = ma.id_marca
	order by mo.modelo;
	
-- f)
select mo.modelo, ma.marca from modelo mo 
	right join marca ma on mo.id_marca = ma.id_marca
	order by mo.modelo;
	
-- g)
select v.placa, c.cor from veiculo v
	join cor c on v.cor = c.id_cor;
	
-- h)
select v.placa, c.cor from veiculo v
	join cor c on v.cor = c.id_cor
	order by v.placa, c.cor;
	
-- i)
select mo.modelo from modelo mo 
	join marca ma on mo.id_marca = ma.id_marca
	where ma.marca = 'fiat'
	order by mo.modelo;
	
-- j)
select v.placa, c.cor, m.modelo, v.ano, v.valor from veiculo v
	join cor c on v.cor = c.id_cor
	join modelo m on v.modelo = m.id_modelo 
	where c.cor = 'Branco';
	

-- k)

select v.placa, c.cor, m.modelo, v.ano, v.valor from veiculo v, cor c, modelo m
	where v.cor = c.id_cor and
	v.modelo = m.id_modelo
	order by m.modelo ;
	
-- l)
select v.placa, c.cor, m.modelo, v.ano, v.valor from veiculo v
	join cor c on v.cor = c.id_cor
	join modelo m on v.modelo = m.id_modelo 
	order by m.modelo ;
	
-- m)
select c.cor from veiculo v
	right join cor c on v.cor = c.id_cor
	where v.placa is null;
