-- 1.Faça uma consulta que retorne o nome dos inquilinos que já alugaram algum imóvel, o nome do corretor
-- e o tipo de imóvel alugado ordenado em ordem crescente da data de início da locação. Usar JOIN

select i.nome, c.nome, im.tipoImovel from inquilino i
	inner join aluguel a
		on a.cpfInquilino = i.cpf
	inner join corretor c
		on c.creci = a.creciCorretor
	inner join imovel im
		on im.idImovel = a.idImovel
	order by a.dataIniLocacao asc;

-- 2. Utilizando sub consultas, faça uma consulta que retorne o nome do inquilino que fez o último aluguel
-- de imóvel (usar max(dataIniLocacao)).
select nome from inquilino i
inner join aluguel a on a.cpfInquilino = i.cpf
where dataIniLocacao in (select max(dataIniLocacao) from aluguel);

-- 3. Faça uma consulta que verifique se existem inquilinos que alugaram algum imóvel e que tenham o
--mesmo nome de corretores que também já alugaram. (Usar operadores de conjunto)
select i.nome from inquilino i where cpf in (select a.cpfInquilino from aluguel a)
intersect
select c.nome from corretor c where creci in (select a.creciCorretor from aluguel a);

-- 5. Faça uma consulta que retorne o nome dos atores que não fizeram nenhum filme. Deve aparecer o nome
-- dos atores o nome dos filmes e o gênero. Deve ser retornado apenas os clientes que NÃO fez filme. Os
-- valores do nome do filme e do gênero devem ser nulos.
select a.nome,f.nome, f.genero from ator a 
	left join ator_filme af on af.codAtor = a.codAtor
	left join filme f on af.codFilme = f.codFilme
	where af.codFilme is null;

-- 6. Faça uma consulta que retorne o nome dos filmes e os diretores que fizeram cada filme. Deve ser
-- retornado apenas as duas colunas.
select f.nome as "Nome filme", d.nome as "Nome do diretor" from filme f 
	inner join diretor d on f.codDiretor = d.codDiretor;
	
-- 7. Utilizando sub consultas, selecione o nome dos atores que fizeram algum filme de Ação E de Drama
-- (Dica: Duas subconsultas internas separadas por AND. Ver exemplo da prática com o arquivo
-- barcos.sql.)
select a.nome from ator a 
	where codAtor in (
		select codAtor from ator_filme 
			where codFilme in (
				select codFilme from filme 
					where genero = 'Ação'
				)
	and codAtor in(
		select codAtor from ator_filme 
			where codFilme in (
				select codFilme from filme 
					where genero = 'Drama'
)));