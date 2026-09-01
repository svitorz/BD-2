-- Junção de tabelas

-- Produto cartesiano, completamente errado!
select * from aluno, curso;

-- Exemplo 1: listar todos os alunos de cada curso

-- forma 1 com where, porém em máquinas antigas pode ser menos performático
select pnome, nomeCurso from aluno a, curso c 
	where c.idCurso = a.idCurso;

-- forma 2 com inner join. mais otimizado
select pnome, nomeCurso from aluno a
	inner join curso c on c.idCurso = a.idCurso;



-- Exemplo 2:  Selecionar o pnome dos professores que lecionaram alguma disciplina em 2021
select pnome from professor p
	inner join professorLecionaAluno pa
	on p.prontuario = pa.prontuarioProfessor
	where pa.ano = 2021;

-- Exemplo 3: Selecionar o nome dos alunos que tiraram mais de 7, o ano e seu curso
select pnome, nomeCurso, ano, semestre, nota from aluno a
	inner join curso c on c.idCurso = a.idCurso
	inner join professorLecionaAluno pla on pla.prontuarioAluno = a.prontuario
	where nota > 7;

-- Exemplo 4: acrescentar o nome do professor na query acima
select a.pnome as "Nome aluno", p.pnome as "Nome professor", c.nomeCurso, pla.ano, pla.semestre, pla.nota from aluno a
	inner join curso c 
		on c.idCurso = a.idCurso
	inner join professorLecionaAluno pla 
		on pla.prontuarioAluno = a.prontuario
	inner join professor p 
		on p.prontuario = pla.prontuarioProfessor
	where nota > 7;

-- Exercicios
-- 1 – Selecione o nome de todos os alunos, o sexo e o nome do curso, para as pessoas que fazem Medicina.
select a.pnome, a.sexo, c.nomeCurso from aluno a 
	inner join curso c 
		on c.idCurso = a.idCurso
	where c.nomeCurso = 'Medicina';
-- 2 – Selecione o nome do professor e a média das notas de seus alunos, ordenados pela média das notas – Coloque um alias para a Média
select p.pnome, avg(pla.nota) as "Média" from professor p
	inner join professorLecionaAluno pla
		on pla.prontuarioProfessor = p.prontuario
	group by p.pnome
	order by "Média";
-- 3 – Qual o nome dos professores e dos alunos que lecionaram e tiveram aula em 2010
select a.pnome as "Nome aluno", p.pnome as "Nome professor" from aluno a
	inner join curso c 
		on c.idCurso = a.idCurso
	inner join professorLecionaAluno pla 
		on pla.prontuarioAluno = a.prontuario
	inner join professor p 
		on p.prontuario = pla.prontuarioProfessor
	where ano = 2020;

-- 4 - Selecionar o nome do curso e a quantidade de alunos de cada curso.
select c.nomeCurso, count(a.idCurso) from aluno a
	inner join curso c 
		on c.idCurso = a.idCurso
	group by c.nomeCurso;
