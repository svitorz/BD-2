-- 1. Selecione o nome dos autores que já escreveram livros
select distinct(a.nome) from autor a 
	inner join livro_autor la 
		on a.codAutor=la.codAutor
	order by a.nome;

-- 2. Selecione o nome dos alunos e seus telefones.
select a.nome, ta.telefone from aluno a
	inner join telefone_aluno ta
		on ta.prontuario=a.prontuario;

-- 3. Selecione o nome dos livros e a 
-- quantidade de atores de cada livro, 
-- desde que a quantidade seja maior que 2.
select l.titulo, count(la.codAutor) as "Quantidade de autores" from livro l
	inner join livro_autor la 
		on la.codLivro=l.codLivro
	group by l.titulo
	having count(la.codAutor) > 2;

-- 4. Selecione o nome de todos os alunos e a 
-- quantidade de livros que já fizeram empréstimo em 2026.
select a.nome, count(e.prontuario), extract(year from e.dtaEmpr)  from aluno a 
	inner join emprestimo e  
		on e.prontuario=a.prontuario
	-- where e.dtaEmpr between '2025-12-31' and '2027-01-01'
	where extract(year from e.dtaEmpr) = '2026'
	group by a.nome, extract(year from e.dtaEmpr)
	order by count(e.prontuario) desc;


-- 5 – Selecione o nome dos autores e dos livros que escreveram.
select a.nome, l.titulo from autor a 
	inner join livro_autor la 
		on la.codAutor=a.codAutor
	inner join livro l 
		on l.codLivro = la.codLivro;

-- 6 – Selecione o nome dos autores e dos livros que escreveram dos livros de Romance.
select a.nome, l.titulo from autor a 
	inner join livro_autor la 
		on la.codAutor=a.codAutor
	inner join livro l 
		on l.codLivro = la.codLivro
	where l.genero = 'Romance';

-- 7 – Selecione o nome dos alunos que fizeram algum empréstimo de livro, 
-- os títulos dos livros e os telefones dos alunos. 
-- Dica: não usar a tabela exemplar – realizar junção direta do codLivro de empréstimo com Livro.

select a.nome, l.titulo, ta.telefone from aluno a 
	inner join emprestimo e 
		on e.prontuario=a.prontuario
	inner join livro l 
		on l.codLivro=e.codLivro
	inner join telefone_aluno ta
	 	on ta.prontuario = a.prontuario;

-- 8 – Selecione o nome dos autores e dos livros que escreveram 
-- desde que tenham sido realizados empréstimos em 2025. Ordene pela data.
select distinct a.nome, l.titulo, l.anoPublicacao  from autor a 
	inner join livro_autor la 
		on la.codAutor = a.codAutor
	inner join livro l 
	 	on l.codLivro = la.codLivro
	inner join emprestimo e 
		on e.codLivro = l.codLivro
	-- where e.dtaEmpr between  '2024-12-31' and '2026-01-01'
	where extract(year from e.dtaEmpr) = '2025'
	order by l.anoPublicacao desc;

-- 9 – Selecione o nome dos alunos que fizeram algum empréstimo de livros do Machado de Assis. 
-- Também deve ser retornado o título.
select a.nome, l.titulo from aluno a
	inner join emprestimo e 
		on e.prontuario = a.prontuario 
	inner join livro l  
		on l.codLivro = e.codLivro
	inner join livro_autor la 
		on la.codLivro = l.codLivro 
	inner join autor au
		on au.codAutor = la.codAutor
	where au.nome = 'Machado de Assis'; 

-- 10 – Selecione o nome dos autores e dos livros que escreveram desde que tenham sido realizados empréstimos 
-- de livros de Romance ou Drama. 
-- Também deve ser selecionado o nome do aluno que realizou o empréstimo. 
-- Ordene pela data.
select au.nome as "Nome autor", l.titulo, a.nome as "Nome aluno" from autor au 
	inner join livro_autor la 
		on la.codAutor = au.codAutor 
	inner join livro l 
		on l.codLivro = la.codLivro
	inner join emprestimo e 
	 	on e.codLivro = l.codLivro
	 inner join aluno a 
	 	on a.prontuario = e.prontuario
	where l.genero in ('Romance', 'Drama')
	order by e.dtaEmpr;