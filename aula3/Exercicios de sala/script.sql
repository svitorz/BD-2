-- Relacionamento 1xN - com entidade fraca:

create table funcionario (
	cod_func varchar(10),
	nome varchar(50) not null,
	constraint pk_func primary key (cod_func)
);

create table dependente (
	cod_dpt varchar(10),
	cod_func varchar(10),
	nome varchar(50) not null,
	constraint pk_dep_func 
		primary key (cod_dpt, cod_func),
	constraint fk_dep_func 
		foreign key (cod_func) 
			references funcionario on delete cascade
);

insert into funcionario values (1, 'Rafael'), (2, 'Carla');

insert into dependente values(10, 1, 'Maria Julia'), (10, 2, 'João Antonio'), (20,1, 'Bruno');

select d.nome as nome_funcionario, f.nome as nome_dependente from funcionario f inner join dependente d on f.cod_func=d.cod_func;

-- fim

-- Relacionamento NxN:

create table funcionario(
	cpf varchar(13),
	nome varchar(50) not null,
	constraint pk_func primary key(cpf)
);

create table projeto(
	id int,
	nome varchar(50),
	constraint pk_projeto primary key(id)
);

create table funcionario_projeto(
	cpf varchar(13),
	id int,
	constraint pk_func_proj primary key(cpf, id),
	constraint fk_func foreign key (cpf) 
		references funcionario,
	constraint fk_projeto foreign key (id)
		references projeto
);	

-- alterar nome da tabela resultante do relacionamento NxN para "trabalha".
alter table funcionario_projeto rename to trabalha;


insert into funcionario values('123', 'João'), ('132', 'Joana');

insert into projeto values(1, 'Modelagem de BD'), (2, 'Análise de Requisitos');

insert into trabalha values ('123',1), ('123',2), ('132', 1);

select f.nome as nome_func, p.nome as nome_proj from funcionario f
	inner join trabalha t
		on f.cpf=t.cpf
	inner join projeto p 
		on t.id=p.id
	group by nome_func, nome_proj;
-- fim




-- relacionamento ternário:

create table funcionario(
	cpf varchar(13),
	nome varchar(50) not null,
	constraint pk_func primary key(cpf)
);

create table projeto(
	id int,
	nome varchar(50),
	constraint pk_projeto primary key(id)
);

create table maquina(
	cod_maq varchar(10),
	descricao text,
	constraint pk_maquina primary key (cod_maq)
);

create table trabalha(
	cpf varchar(13),
	cod_maq varchar(10),
	id int,
	constraint pk_func_proj primary key(cpf, id, cod_maq), -- apenas adiciona um novo campo
	constraint fk_func foreign key (cpf) 
		references funcionario,
	constraint fk_projeto foreign key (id)
		references projeto,
	constraint fk_maquina foreign key (cod_maq)
		references maquina
);	

insert into maquina values ('abc1', 'Lorem ipsun'), ('def2', 'Lorem ipsun'), ('ghi3', 'Lorem ipsun');

insert into trabalha values ('123','abc1', 1), ('123','def2', 2), ('132', 'ghi3', 1);


-- fim


-- Relacionamento Multivalorado:

create table empregado(
	id_emp int,
	-- numDep 
	pnome varchar(20) not null,
	snome varchar(40) not null,
	salario real,
	sexo varchar(2),
	constraint pk_empregado primary key (id_emp)
);

create table telefone_emp(
	id_emp int,
	numero varchar(15),
	constraint pk_telefone primary key (id_emp, numero),
	constraint fk_emp_tel foreign key (id_emp)
		references empregado
);

insert into empregado values (1, 'Rafael', 'Miani', 5000, 'M'),
(2, 'Maria', 'Fernanda', 6000, 'F'),
(3, 'Ana', 'Julia', 4000, 'F');

insert into telefone_emp values (1, '1799999999'),
(2, '1799994544'),
(1, '1799996666'),
(2, '1799997777'),
(2, '1799991235');

select pnome, numero from empregado e inner join telefone_emp  te on e.id_emp=te.id_emp;

-- Generalização/Especi:

create table pessoa(
	cpf varchar(13),
	nome varchar(50),
	dta_nasc date,
	constraint pk_pessoa primary key (cpf)
);

create table aluno(
	cpf varchar(13),
	prontuario varchar(15),
	constraint pk_aluno primary key (cpf, prontuario),
	constraint fk_aluno_pessoa foreign key (cpf)
		references pessoa
);

drop table aluno;

create table engenheiro(
	cpf varchar(13),
	crea varchar(20),
	constraint pk_engenheiro primary key (cpf, crea),
	constraint fk_engenheiro_pessoa foreign key (cpf)
		references pessoa
);

-- Agregação 

create table medico (
	crea varchar(15),
	nome varchar(50) not null,
	constraint pk_medico primary key(crea)
);

create table paciente (
	id int,
	nome varchar(50) not null,
	constraint pk_paciente primary key(id)
);

create table exame (
	id int,
	nome varchar(50) not null,
	constraint pk_exame primary key (id)
);

create table consulta(
	crm varchar(15),
	id_paciente int,
	dta_hora timestamp,
	constraint pk_consulta primary key (crm, id_paciente),
	constraint fk_medico_cons foreign key (crm) references medico,
	constraint fk_paciente_cons foreign key (id_paciente) references paciente
);

create table exames_consulta(
	id_paciente int,
	crm varchar(20),
	id_exame int,
	constraint pk_exames_consulta primary key(id_paciente, crm, id_exame),
	constraint fk_exames_consutla_exame foreign key (id_exame)
		references exame,
	constraint fk_exames_consulta_consulta foreign key(crm, id_paciente)
		references consulta
);



