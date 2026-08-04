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
	cod_curso int unique,
	nome varchar(50),
	constraint pk_coord primary key (cod_coord),
	constraint fk_coord_curso foreign key (cod_curso) references curso
);