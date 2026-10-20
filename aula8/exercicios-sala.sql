-- selecionar o nome de todos os vendedores que tem um pedido
select v.codigo_vendedor, v.nome_vendedor from vendedor v 
	where v.codigo_vendedor in (
		select codigo_vendedor from pedido p
	)
order by v.codigo_vendedor;

-- selecionar o nome de todos os vendedores que tem um pedido com prazo de entrega maior que 3 dias
select v.nome_vendedor from vendedor v 
	where v.codigo_vendedor in (
		select codigo_vendedor from pedido p
			where p.prazo_entrega > 3
	)
order by v.codigo_vendedor;


-- selecionar o nome dos vendedores que venderam algum pedido para Clientes de São Paulo
select v.nome_vendedor from vendedor v 
	where v.codigo_vendedor in (
		select p.codigo_vendedor from pedido p
			where p.codigo_cliente in 
			(
				select c.codigo_cliente from cliente c 
					where c.uf = 'SP' 
			)
	)
order by v.codigo_vendedor;

-- selecionar o vendedor com o maior salario
select v.nome_vendedor from vendedor v 
	where v.salario_fixo = (
		select max(v.salario_fixo) from vendedor v
	);


select v.nome_vendedor from vendedor v 
	where exists (
		select * from pedido p where p.prazo_entrega > 3
	);

-- duas queries diferentes com o mesmo efeito
select c.nome_cliente from cliente c where exists (select 1 from pedido p where p.codigo_cliente = c.codigo_cliente);

select c.nome_cliente from cliente c 
where c.codigo_cliente in 
	(
		select p.codigo_cliente from pedido p
	);

	