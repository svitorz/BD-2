-- exercicios 1 a 8
create table if not exists curso(
	id_curso serial,
	nomeCurso varchar(30) not null,
	nroSemestres int not null,
	dtaFundacao date not null, 
	constraint pk_curso primary key (id_curso)
);

create table if not exists aluno(
	prontuario varchar(30),
	nome varchar(30) not null,
	dtaNasc date not null, 
	sexo char(1),
	id_curso int,
	constraint pk_aluno primary key (prontuario),
	constraint fk_aluno_curso foreign key (id_curso) references curso
);


-- select * from aluno a 
--	inner join curso c 
-- 	on a.id_curso = c.id_curso;
 insert into curso(nomeCurso, nroSemestres, dtaFundacao) values 
 ('Ciência da computação', 8, '1986-03-01'),
 ('Direito', 8, '1975-12-14'),
 ('Medicina', 12, '200-07-05'),
 ('Engenharia Elétrica', 10, '1996-12-10'),
 ('Biologia', 8, '1993-06-06'),
 ('Matemática', 8, '1968-07-01');

insert into aluno(prontuario, nome, dtaNasc, sexo, id_curso) values 
('llaa', 'Paulo',	'1986-07-01','M',1),
('llbb', 'Ana',		'1990-07-08','F',5),
('llcc', 'Júlio',	'1980-05-08','M',3),
('lldd', 'Carlos',	'1983-11-10','M',2),
('llee', 'Gabriele','1990-05-08','F',3),
('llff', 'Antônio',	'1955-06-15','M',4),
('llgg', 'Ana',		'1975-12-08','F',5),
('llhh', 'Mara',	'1970-07-07','F',1),
('llii', 'Roberto',	'1956-07-01','M',3),
('lljj', 'Carlos',	'1950-02-03','F',2);

insert into aluno(prontuario, nome, dtaNasc, sexo, id_curso) values 
('llkk', 'Pedro Roberto',	'1986-07-01','M', 3);

delete from curso c where c.id_curso = 2; -- erro de chave estrangeira

delete from aluno a where a.id_curso = 2;

delete from curso c where c.id_curso = 2;

update curso set id_curso = 10 where nomeCurso = "Medicina";

update aluno set nome = 'Ana Paula' where prontuario = '11gg';

-- exercicios 9 a 14

CREATE TABLE cidadesBrasil
	(nomeCidade VARCHAR (70),
	 siglaEstado VARCHAR (4),
	 populacao REAL,
	 regiao VARCHAR (30),
	 idhm real,
	 escolarizacao REAL,
	 CONSTRAINT pk_cidadesBrasil PRIMARY KEY (nomeCidade)
	);


update cidadesBrasil set populacao = 900000 where nomeCidade = 'Campo Grande';

update cidadesBrasil set idhm = 0.81 where nomeCidade = 'Palmas';

update cidadesBrasil set idhm = 0.77, escolarizacao = 0.96 where nomeCidade = 'Salvador';

delete from cidadesBrasil where idhm < 0.6;

delete from cidadesBrasil where populacao < 20000;

delete from cidadesBrasil where idhm < 0.7 and regiao = 'Sudeste';


