-- Utilizando sub consultas, retorne o nome dos vendedores que venderam 
-- pedidos com prazo de entrega igual a 3 ou 5.
select  v.nome_vendedor from vendedor v 
	where v.codigo_vendedor in (
		select codigo_vendedor from pedido p 
			where p.prazo_entrega = 3 or p.prazo_entrega = 5
	);

-- Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram 
-- algum barco
select nome_marin from marinheiros m 
	where id_marin in (
		select id_marin from reservas r
	);

-- Retorne o nome de todos os barcos que já foram reservados utilizando sub 
-- consultas.
select nome_barco from barcos where id_barco in (select id_barco from reservas);
-- Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram 
-- algum barco Marrom. 
select nome_marin from marinheiros m 
	where id_marin in (
		select id_marin from reservas r 
			where id_barco in (
				select id_barco from barcos where cor = 'Marrom'
			)
	);
-- Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram 
-- algum barco Marrom ou Azul. 
select nome_marin from marinheiros m 
	where id_marin in (
		select id_marin from reservas r 
			where id_barco in (
				select id_barco from barcos where cor = 'Marrom' or cor = 'Azul'
			)
	);
-- Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram 
-- algum barco Marrom E Azul. DICA: dois selects INTERNOS comparando id_marin, 
--separados por AND 
select nome_marin from marinheiros m 
	where id_marin in (
		select id_marin from reservas r 
			where id_barco in (
				select id_barco from barcos where cor = 'Marrom'
			)
		and id_marin in (
			select id_marin from reservas r 
				where id_barco in (
					select id_barco from barcos where cor = 'Azul'
				)
			)
	);

-- Faça uma consulta que retorno o nome do funcionário com o maior salário. 
select e.pNome from empregado e where e.salario = (select max(salario) from empregado);
-- Faça uma consulta que retorno o nome do funcionário com o menor salário.
select e.pNome from empregado e where e.salario = (select min(salario) from empregado);