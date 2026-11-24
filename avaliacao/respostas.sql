-- 4
select f.nome from funcionario f where f.idFunc in (
	select fp.idFunc from func_proj fp where idProj in (
		select p.idProj	from projetos p where p.nomeProj = 'Portal do Colaborador'
	)
);

-- 5 
select f.nome from funcionario f 
left join func_proj pj on pj.idFunc = f.idFunc
where pj.idFunc is null;

-- 6 
select d.nomeDep, count(f.idFunc) from departamento d 
inner join funcionario f on f.idDep = d.idDep
group by d.nomeDep;

-- 7 
select l.titulo from livro l where codLivro in 
(
	select la.codLivro from livro_autor la where codAutor in (
		select a.codAutor from autor a where nome = 'José de Alencar'
	)
);

-- 8
select a.nome, e.dtaEmpr from aluno a 
	inner join emprestimo e 
		on e.prontuario = a.prontuario
where extract(year from e.dtaEmpr) != '2025';

-- 9
select a.nome from aluno a 
	inner join emprestimo e 
		on a.prontuario = e.prontuario 
			where extract(year from e.dtaEmpr) = '2025'
intersect
select a.nome from aluno a 
	inner join emprestimo e 
		on a.prontuario = e.prontuario 
			where extract(year from e.dtaEmpr) = '2026';

-- trans a

begin;

update aluno set cidade = 'Votuporanga' where prontuario = 'VP1009';

commit;

-- trans b

begin;

select * from aluno where prontuario = 'vp1009';

update aluno set nome = 'teste' where prontuario = 'VP1009';


