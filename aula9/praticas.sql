-- Faça uma consulta que selecione o NOME dos inquilinos que já alugaram
-- unidos com o nome dos corretores que também já alugaram imóveis.
-- USAR UNION
select nome from corretor
union
select nome from inquilino;

-- Faça uma consulta que selecione o NOME dos inquilinos que já alugaram
-- QUE TENHAM o mesmo nome dos corretores que também já alugaram
-- imóveis. Usar INTERSECT

select nome from corretor
intersect
select nome from inquilino;

-- Selecione os nomes que aparecem nas tabelas aluno, professor e
-- funcionários.
select nomeAlu from aluno
union
select nomePro from professor
union
select nomeFunc from funcionario;
-- Selecione todos os nomes que aparecem na tabela aluno, mas não na
-- tabela funcionário.
select nomeAlu from aluno
except
select nomeFunc from funcionario;
-- Faça o contrário do 4.
select nomeAlu from aluno
intersect
select nomeFunc from funcionario;
-- Selecione os nomes que aparecem na tabela aluno, professor e funcionário.
