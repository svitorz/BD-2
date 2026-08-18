CREATE TABLE EMPREGADO
	(idEmp integer, 
	 pNome VARCHAR (20) NOT NULL, 
	 sNome VARCHAR(20) NOT NULL, 
	 idade integer, 
	 salario real NOT NULL, 
	 cargo VARCHAR (30) NOT NULL,
	 CONSTRAINT pk_empregado PRIMARY KEY (idEmp));

--drop table empregado

INSERT INTO empregado VALUES (1,'Carlos','Alberto',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (2,'Pedro','Augusto',32,3500,'Analista de Sistemas');
INSERT INTO empregado VALUES (3,'Mara','Antonia',27,1200,'Secretária');
INSERT INTO empregado VALUES (4,'Derci','Gonçalves',56,6500,'Gerente');
INSERT INTO empregado VALUES (5,'Pedro','Bueno',28,1500,'Estagiário');
INSERT INTO empregado VALUES (6,'Edson','Arantes',60,7500,'Gerente');
INSERT INTO empregado VALUES (7,'Odete','Roitman',54,2000,'Técnico em Segurança');
INSERT INTO empregado VALUES (8,'Antonio','Da Lua',38,2500,'Analista de Sistemas');
INSERT INTO empregado VALUES (9,'Sassa','Mutema',55,3000,'Vendedor');
INSERT INTO empregado VALUES (10,'José','Silvério',42,2800,'Vendedor');
INSERT INTO empregado VALUES (11,'Gabriel','Oliveira',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (12,'Flávia','Camargo',29,4200,'Analista de Sistemas');
INSERT INTO empregado VALUES (13,'Marina','Delbonis',20,1000,'Secretária');
INSERT INTO empregado VALUES (14,'Paulo','Roberto',33,1500,'Vendedor');
INSERT INTO empregado VALUES (15,'José','Carlos da Silva',27,2900,'Analista de Sistemas');
INSERT INTO empregado VALUES (16,'Rúbia','Miranda',29,3500,'Administrador');
INSERT INTO empregado VALUES (17,'Roberto','Andrade Silva',35,3300,'Vendedor');
INSERT INTO empregado VALUES (18,'Ana','Julia',31,2900,'Secretária');
INSERT INTO empregado VALUES (19,'Pedro','Antonio',41,3500,'Administrador');
INSERT INTO empregado VALUES (20,'Ana','Mara',22,2200,'Psicólogo (a)');
INSERT INTO empregado VALUES (21,'João','Augusto',44,5500,'Gerente');
INSERT INTO empregado VALUES (22, 'Lucas', 'Ferreira', 27, 7200.00, 'Analista de Sistemas');
INSERT INTO empregado VALUES (23, 'Amanda', 'Souza', 31, 8900.00, 'Analista de RH');
INSERT INTO empregado VALUES (24, 'Bruno', 'Oliveira', 24, 2400.00, 'Secretária');
INSERT INTO empregado VALUES (25, 'Fernanda', 'Lima', 22, 1800.00, 'Estagiário');
INSERT INTO empregado VALUES (26, 'Ricardo', 'Almeida', 45, 18500.00, 'Gerente');
INSERT INTO empregado VALUES (27, 'Patrícia', 'Santos', 34, 4700.00, 'Psicólogo');
INSERT INTO empregado VALUES (28, 'Diego', 'Costa', 29, 6400.00, 'Analista de Sistemas');
INSERT INTO empregado VALUES (29, 'Camila', 'Martins', 38, 9800.00, 'Analista de RH');
INSERT INTO empregado VALUES (30, 'Rafael', 'Rocha', 23, 3200.00, 'Estagiário');
INSERT INTO empregado VALUES (31, 'Juliana', 'Barbosa', 41, 15500.00, 'Gerente');
INSERT INTO empregado VALUES (32, 'Gustavo', 'Mendes', 33, 11400.00, 'Analista de Sistemas');
INSERT INTO empregado VALUES (33, 'Mariana', 'Silva', 26, 3500.00, 'Secretária');
INSERT INTO empregado VALUES (34, 'Carlos', 'Pereira', 36, 5200.00, 'Analista de RH');
INSERT INTO empregado VALUES (35, 'Beatriz', 'Ribeiro', 28, 4200.00, 'Psicólogo (a)');
INSERT INTO empregado VALUES (36, 'Eduardo', 'Gomes', 21, 1500.00, 'Estagiário');
INSERT INTO empregado VALUES (37, 'Tatiane', 'Dias', 39, 7800.00, 'Analista de Sistemas');
INSERT INTO empregado VALUES (38, 'Vinícius', 'Castro', 47, 19800.00, 'Gerente');
INSERT INTO empregado VALUES (39, 'Larissa', 'Moreira', 30, 6100.00, 'Analista de RH');
INSERT INTO empregado VALUES (40, 'Fábio', 'Teixeira', 25, 2800.00, 'Secretária');
INSERT INTO empregado VALUES (41, 'Aline', 'Moraes', 32, 3600.00, 'Psicólogo (a)');
INSERT INTO empregado VALUES (42, 'Henrique', 'Araújo', 24, 3300.00, 'Estagiário');
INSERT INTO empregado VALUES (43, 'Priscila', 'Cardoso', 35, 9500.00, 'Analista de Sistemas');
INSERT INTO empregado VALUES (44, 'Leonardo', 'Freitas', 43, 13200.00, 'Gerente');
INSERT INTO empregado VALUES (45, 'Vanessa', 'Campos', 29, 8700.00, 'Analista de RH');
INSERT INTO empregado VALUES (46, 'Rodrigo', 'Nogueira', 27, 5100.00, 'Analista de Sistemas');
INSERT INTO empregado VALUES (47, 'Carolina', 'Monteiro', 40, 3900.00, 'Secretária');
INSERT INTO empregado VALUES (48, 'Thiago', 'Rezende', 31, 4900.00, 'Psicólogo (a)');
INSERT INTO empregado VALUES (49, 'Isabela', 'Batista', 20, 1200.00, 'Estagiário');
INSERT INTO empregado VALUES (50, 'Marcelo', 'Correia', 46, 17200.00, 'Gerente');
INSERT INTO empregado VALUES (51, 'Natália', 'Vieira', 28, 7600.00, 'Analista de Sistemas');
INSERT INTO empregado VALUES (52, 'Felipe', 'Machado', 34, 6900.00, 'Analista de RH');
INSERT INTO empregado VALUES (53, 'Elaine', 'Farias', 37, 3100.00, 'Secretária');
INSERT INTO empregado VALUES (54, 'André', 'Duarte', 26, 4300.00, 'Psicólogo (a)');
INSERT INTO empregado VALUES (55, 'Paula', 'Azevedo', 23, 2600.00, 'Estagiário');
INSERT INTO empregado VALUES (56, 'Roberto', 'Cunha', 50, 9200.00, 'Gerente');
INSERT INTO empregado VALUES (57, 'Cristiane', 'Peixoto', 33, 10800.00, 'Analista de Sistemas');
INSERT INTO empregado VALUES (58, 'Márcio', 'Pinto', 42, 8300.00, 'Analista de RH');
INSERT INTO empregado VALUES (59, 'Daniela', 'Leite', 27, 2900.00, 'Secretária');
INSERT INTO empregado VALUES (60, 'Igor', 'Fernandes', 22, 2100.00, 'Estagiário');

-- drop table EMPREGADO;