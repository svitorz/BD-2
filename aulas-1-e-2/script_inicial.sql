-- CRIANDO TABELAS
-- begin;

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
-- commit;

select * from aluno;
-- atualizando valores
update aluno set nomeAluno = 'Mariana' where prontuario = 'vp02';

-- excluindo valores
delete from aluno where idade > 20;


-- transações begin;	select * from aluno; select pg_sleep(5); update aluno set nomeAluno = 'Nomes Iguais'; select * from aluno; rollback;

-- Chave estrangeira

create table cliente(
	cpf varchar(13),
	nome varchar(60) not null,
	constraint pk_cliente primary key (cpf)	
);

create table pedido (
	cod_pedido int not null,
	valor numeric(9, 2) not null,
	cpf_cli varchar(13),
	constraint pk_pedido primary key (cod_pedido),
	constraint fk_pedido_cliente 
		foreign key (cpf_cli) references cliente
);

insert into cliente(cpf, nome) values ('123.456', 'Rafael'), ('123.432', 'Cristiane');


select * from pedido;


-- 1 para 1
create table gerente(
	cpf_ger varchar(13),
	nome_ger varchar(60) not null,
	constraint pk_gerente primary key (cpf_ger)	
);


create table departamento(
	cod_dep int not null,
	nome_dep varchar(50),
	cpf_ger varchar(13) unique,
	constraint pk_dep primary key (cod_dep),
	constraint fk_dep_gerente foreign key (cpf_ger) references gerente
);

ALTER TABLE departamento add constraint cpf_ger_unique unique(cpf_ger);


-- Criando tabelas a partir de um modelo pronto:
-- criando banco a partir de modelagem


create table curso(
	cod_curso int,
	nome varchar(50) not null,
	valor numeric(9, 2) not null,
	constraint pk_curso primary key (cod_curso)
);

-- 1 x N
create table aluno(
	ra varchar(15),
	nome varchar(50),
	cidade varchar(150),
	cod_curso int not null, -- sem unique 
	constraint pk_aluno primary key (ra),
	constraint fk_aluno_curso foreign key (cod_curso) references curso
);

-- 1 x 1 com curso
create table coordenador(
	cod_coord int,
	cod_curso int,
	nome varchar(50),
	constraint pk_coord primary key (cod_coord),
	constraint unique_cod_curso unique (cod_curso),
	constraint fk_coord_curso foreign key (cod_curso) references curso
);

