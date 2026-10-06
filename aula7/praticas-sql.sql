select  from marinheiros m 
left join reservas r on r.id_marin = m.id_marin
where r.data_res is null;

select  from barcos b
left join reservas r on r.id_barco = b.id_barco
where r.data_res is null;

CREATE TABLE departamento ( 
  id_departamento INTEGER, 
  nome_departamento VARCHAR (255) NOT NULL, 
  CONSTRAINT PK_DEP  PRIMARY  KEY  (id_departamento)); 
 CREATE TABLE empregado ( 
  id_empregado INTEGER, 
  nome_empregado VARCHAR (255), 
  id_departamento INTEGER, 
                             CONSTRAINT PK_EMP  PRIMARY  KEY  (id_empregado), 
                             CONSTRAINT FK_EMP_DEP FOREIGN KEY (ID_DEPARTAMENTO)  
                             references departamento 
 );

insert into departamento (id_departamento, nome_departamento) values (1, 'Sales'), (2, 'Marketing'), (3, 'HR'), (4, 'IT'), (5, 'Production');

insert into empregado (id_empregado, nome_empregado, id_departamento) values 
(1, 'Bette Nicholson', 1), 
(2, 'Christian Gable', 1),
(3, 'Joe Swank', 2),
(4, 'Fred Costner', 3),
(5, 'Sanda Kilmer', 4),
(6, 'Julia Mcqueen', null);

select  from departamento d left join empregado e 
on e.id_departamento = d.id_departamento 
where e.id_departamento is null;

select e.nome_empregado, d.nome_departamento from empregado e  
left join departamento d on d.id_departamento = e.id_departamento
where e.id_departamento is null;


select e.nome_empregado, d.nome_departamento from empregado e  
full join departamento d on d.id_departamento = e.id_departamento
where e.id_departamento is null;