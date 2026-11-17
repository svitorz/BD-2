--1) Faça uma consulta que selecione o nome dos juízes 
-- e a quantidade de partidas que já apitaram.
select j.nome, count(p.*) from juizes j
	inner join partidas_juizes pj 
		on pj.idjuiz = j.idjuiz 
	inner join partidas p 
		on p.idpartida = pj.idpartida
group by j.nome;
--2) Faça uma consulta que retorne o nome dos atletas e dos times que jogam, 
-- desde que seja na posição de atacante.
-- Ordene em ordem alfabética do nome dos times.
select a.nome, t.nome from atletas a 
	inner join atua at 
		on at.idatleta = a.idatleta 
	inner join times t 
		on t.idtime = a.idtime 
where at.posicao = 'Atacante'
order by t.nome asc;
--3) Faça uma consulta que retorne o dos times que jogaram 
-- a partida mais recente. 
-- Deve ser retornado o nome do time e a data da partida. 
-- Dica: Deve ser feito um join e, na condição do JOIN, uma subconsulta para a data mais recente (max).
select t.nome, p.data_hora from times t 
inner join partidas p on p.data_hora = (select max(data_hora) from partidas p);


--4) Faça uma consulta que retorne os juízes que ainda não apitaram. Pode ser usado subconsultas ou outer joins.
select j.nome, j.funcao from juizes j left join  partidas_juizes p on  p.idJuiz = j.idJuiz where p.idJuiz is null;

--5) Retorne os jogadores tenham uma letra e no nome e a última letra o OU que tenham uma letra r no nome.
select a.*
from atletas a
where (a.nome ilike '%e%' and a.nome ilike '%o')
   or a.nome ilike '%r%';

--6) Faça uma consulta que retorne o nome dos juízes, a data da partida em que apitaram e se deu cartão vermelho e o nome do jogador para quem deu o cartão vermelho.
select j.nome, a.nome from juizes j 
inner join partidas_juizes jp on jp.idJuiz = j.idjuiz 
inner join atua at on at.idPartida = jp.idPartida
inner join atletas a on at.idAtleta = a.idAtleta 
where cartao_vermelho != 0;

