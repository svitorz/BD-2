select a.nome, l.titulo from autor a
inner join livro_autor la on a.codAutor = la.codAutor
inner join livro l on l.codLivro = la.codLivro
where l.genero in ('Fantasia', 'Terror'); 

select l.genero, count(e.idEmprestimo) from livro l 
inner join exemplarEmprestimo e on e.codLivro = l.codLivro
group by l.genero;

select a.nome from aluno a 
inner join emprestimo e on e.prontuario = a.prontuario
inner join exemplarEmprestimo ee on ee.idEmprestimo = e.idEmprestimo
inner join livro l on ee.codLivro = l.codLivro
where l.genero = 'Romance' or l.titulo like '%Dados%'
order by genero;

select a.nome, l.titulo, al.nome from autor a
inner join livro_autor la on a.codAutor = la.codAutor
inner join livro l on l.codLivro = la.codLivro
inner join exemplarEmprestimo ee on ee.codLivro = l.codLivro
inner join emprestimo e on ee.idEmprestimo = e.idEmprestimo
inner join aluno al on al.prontuario = e.prontuario
where extract(year from e.dtaEmpr) = '2026'
order by a.nome asc;

select l.titulo, extract(year from e.dtaEmpr) as "ano", count(e.idEmprestimo) from livro l
inner join exemplarEmprestimo ee on ee.codLivro = l.codLivro
inner join emprestimo e on ee.idEmprestimo = e.idEmprestimo
group by l.titulo, "ano"
having count(e.idEmprestimo) >= 10
order by l.titulo asc;


