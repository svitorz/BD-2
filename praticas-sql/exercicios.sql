-- Exercício 1

create table pessoa(
	id_pessoa int,
	nomePessoa varchar(50) not null,
	rua varchar(50) not null,
	nro int not null,
	bairro varchar(50) not null,
	cidade varchar(70) not null,
	cep varchar(10) not null,
	telContato varchar(15) not null,
	constraint pk_pessoa primary key(id_pessoa)
	);

create table veterinario(
	id_vet int,
	nome varchar(50),
	telContato varchar(14),
	constraint pk_vet primary key (id_vet)
);

create table animal (
	id_animal int,
	id_pessoa int,
	nomeAnimal varchar(50) not null,
	dtaNasc date not null,
	tipoAnimal varchar(50) not null,
	constraint pk_animal primary key (id_animal),
	constraint fk_animal_pessoa foreign key(id_pessoa)
		references pessoa
	
);

create table veterinarioAtendeAnimal(
	id_animal int,
	id_vet int,
	dtaConsulta date not null,
	relatorio varchar(200),
	constraint pk_vet_atende_animal primary key (id_animal, id_vet),
	constraint fk_vet foreign key (id_vet)
		references veterinario,
	constraint fk_animal foreign key (id_animal)
		references animal
);

-- Fim Ex 1


-- Exercício 2
create table livro(
	id_livro int,
	titulo varchar(100) not null,
	generoPrincipal varchar(50) not null,
	ano_publicacao int not null,
	constraint pk_livro primary key (id_livro)
);

create table exemplar (
	nro_exemplar int,
	id_livro int,
	constraint pk_exemplar primary key (nro_exemplar, id_livro),
	constraint fk_exemplar_livro foreign key (id_livro)
		references livro
);

create table autor(
	id_autor int,
	nome varchar(50) not null,
	dtaNasc date not null,
	constraint pk_autor primary key (id_autor)
);

create table autor_livro(
	id_autor int, 
	id_livro int,
	constraint pk_autor_livro primary key (id_autor, id_livro),
	constraint fk_autor foreign key (id_autor)	
		references autor,
	constraint fk_livro foreign key (id_livro)	
		references livro	
);

create table aluno(
	prontuario varchar(10),
	nome_aluno varchar(50) not null,
	dtaNasc date not null,
	cidade varchar(100) not null,
	constraint pk_aluno primary key (prontuario)
);

create table telefone_aluno(
	nroTel integer, -- nro_tel
	prontuario varchar(10),
	constraint pk_telefone_aluno primary key (nroTel, prontuario),
	constraint fk_aluno foreign key (prontuario)
		references aluno
);

-- alter table telefone_aluno rename nroTel to nro_tel;

create table emprestimo (
	prontuario varchar(10),
	nro_exemplar int,
	id_livro int,
	dta_emp date  not null,
	dta_dev date not null,
	constraint pk_emprestimo 
		primary key (prontuario, id_livro, nro_exemplar),
	constraint fk_emp_aluno 
		foreign key (prontuario)
			references aluno,
	constraint fk_emp_exemplar 
		foreign key (nro_exemplar, id_livro)
			references exemplar (nro_exemplar, id_livro)
);

-- Fim Ex 2