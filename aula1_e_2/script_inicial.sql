drop table aluno, livro;
	
-- CRIANDO TABELAS
begin;

create table if not exists livro(
	ISBN integer,
	titulo varchar(50),
	constraint pk_livro primary key (ISBN)
);

create table if not exists  aluno(
	prontuario varchar(15),
	nomeAluno varchar(40) not null,
	idade integer,
	constraint pk_aluno primary key (prontuario)	
);


-- inserindo valores

insert into aluno(prontuario, nomeAluno, idade) values 
												('vp01','Vitor Fábio',19), 
												('vp02','Mariana Pires', 20), 
												('vp03','Cauã Santana', 18), 
												('vp04','Diego',21);
commit;

select * from aluno;
-- atualizando valores
update aluno set nomeAluno = 'Mariana' where prontuario = 'vp02';

-- excluindo valores
delete from aluno where idade > 20;


-- transações begin;	select * from aluno; select pg_sleep(5); update aluno set nomeAluno = 'Nomes Iguais'; select * from aluno; rollback;
