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



