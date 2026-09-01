-- 1. Faça uma consulta que selecione o nome de todos os barcos que foram alugados 
-- e a data da reserva, ordenados pela data crescentemente.
select nome_barco, data_res from barcos b 
	inner join reservas r on r.id_barco = b.id_barco
	order by data_res asc;

-- 2. Faça uma consulta que retorne o nome dos marinheiros que possuem uma letra i 
-- no nome que alugaram um barco depois de 05/05/2013.
select nome_marin from marinheiros m inner join reservas r on r.id_marin = m.id_marin where nome_marin like '%i%' and data_res > '05/05/2013';

-- 3. Faça uma consulta que retorne a quantidade de barcos que cada marinheiro 
-- já fez reserva. Deve ser retornado o nome dos marinheiros e a quantidade.

select nome_marin as "Nome marinheiro", count(m.id_marin) from marinheiros m 
inner join reservas r on r.id_marin = m.id_marin
group by nome_marin;

-- 4. Modifique o exercício 3 para que sejam somente os marinheiros que alugaram 
-- uma quantidade maior que um barco.

select nome_marin as "Nome marinheiro", count(m.id_marin) from marinheiros m 
inner join reservas r on r.id_marin = m.id_marin
group by nome_marin
having count(m.id_marin) > 1;


-- 5. Selecione o nome dos marinheiros e dos barcos que alugaram em ordem alfabética 
-- do marinheiro.
select m.nome_marin as "Nome marinheiro", b.nome_barco as "Nome barco" from marinheiros m 
	inner join reservas r 
		on r.id_marin = m.id_marin
	inner join barcos b 
		on b.id_barco = r.id_barco
	order by nome_marin, nome_barco;