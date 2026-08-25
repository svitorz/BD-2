-- Faça uma consulta que retorne o nome e o idh dos países que tem uma letra ‘e’
-- no nome ou que tenham idh maior que 0.7. Ordene em ordem decrescente do
-- idh
select nome, idh from pais where nome like '%e%' and idh > 0.7 order by idh desc;

-- Faça uma consulta que tenha no nome do país a segunda letra ‘a’ e após o a
-- tenha a letra ‘e’ em algum momento. Também deve possuir a população menor
-- que 15.

select nome from pais where nome like '_a%e%' and populacao < 15;

-- Faça uma consulta que retorne o nome dos países que tenham uma letra ‘r’ no
-- nome ou que tenham a penúltima letra sendo a letra ‘l’.

select nome from pais where nome like '%r%' or nome like '%l_';


-- Faça uma consulta que retorne o continente e a média de população de cada
-- continente.

select continente, avg(populacao) from pais group by continente;

-- Faça uma consulta que retorne os continentes e a quantidade de países de cada continente.

select continente, count(continente) from pais group by continente;

--  Faça uma consulta que retorne os continentes e a média do idh desses continentes desde que a média seja maior que 0.65

select continente, avg(idh) media_idh from pais 
group by continente 
having avg(idh) > 0.65;

--  Faça uma consulta que retorne o total de população de cada continente, desde
-- que o continente não seja da Oceania ou da Europa. Ordene em ordem
-- decrescente do idh.

select continente, sum(populacao) as total_populacao from pais 
	where continente not in ('Oceania', 'Europa', 'Europa e Ásia') 
	group by continente
	order by total_populacao desc;
