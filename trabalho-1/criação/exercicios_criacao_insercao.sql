create table livros(
	isbn integer,
	titulo varchar(60) not null,
	nroPags integer not null,
	ano integer not null,
	edicao integer not null,
	constraint pk_livros primary key(isbn)
);

create table alunos(
	prontuario varchar(10),
	nome varchar(50) not null,
	dtaNasc date not null,
	rua varchar(30) not null,
	nro integer not null,
	bairro varchar(30) not null,
	cidade varchar(50) not null,
	cep varchar(15) not null,
	constraint pk_alunos primary key (prontuario)
); 

create table telefones(
	prontuario varchar(10),
  nroTelefone VARCHAR(15),
  constraint fk_alunos_telefones FOREIGN KEY (prontuario)
    REFERENCES alunos(prontuario)
);

CREATE TABLE reservas_livros (
	prontuario varchar(10),
	isbn integer,
  dtaRes date not null,
  dtaDev date not null,
  CONSTRAINT fk_reservas_livros FOREIGN KEY (isbn)
    REFERENCES livros(isbn),
    CONSTRAINT fk_reservas_alunos FOREIGN KEY (prontuario)
      REFERENCES aluns(prontuario)
);
