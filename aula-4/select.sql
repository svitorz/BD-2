select * from empregado;

select cargo, pnome from empregado group by cargo, pnome order by cargo;

-- buscando a quantidade de funcionarios em cada cargo
select count(cargo) as quantidade_funcionarios, cargo from empregado group by cargo;


select pnome, idade, cargo from empregado where idade = 32;

-- buscando funcionários com idade diferente de 29 anos
select pnome, idade from empregado where idade != 29;

-- select * from empregado where length(pnome) > 5;

-- buscando os funcionario com nome após o carlos na ordem alfabética
select pnome, idade from empregado 
	where pnome > 'Carlos'
	-- group by pnome
	order by pnome;


-- buscando os cargos distintos
select distinct (cargo) from empregado order by cargo;

-- buscando os nomes distintos
select distinct (pnome) from empregado order by pnome;

-- buscando nome completo e idade dos empregados com mais de 30 anos
select pnome, snome, idade from empregado where idade > 30;

-- Buscando nome, cargo e salario dos vendedores
select pnome, cargo, salario from empregado where cargo = 'Vendedor';

-- Buscando o maior salário de cada cargo
select cargo, max(salario) from empregado group by cargo;

select pnome, cargo from empregado 
	where cargo = 'Secretária' or cargo = 'Gerente' 
	order by cargo;

select pnome, cargo, salario from empregado 
	where cargo = 'vendedor' or salario > 3000 
	order by cargo, pnome;


select pnome, cargo from empregado 
	where cargo in ('Analista de Sistemas', 'Técnico em Segurança') 
	and salario > 2000
	order by cargo;

select pnome, salario, cargo from empregado 
	where salario between 2500 and 4000 
	order by salario desc, cargo asc;



-- TABELA FARMACIA

-- selecionar todos os remédios
select * from remedio;

-- selecionar o nome e o preço de todos os remédios
select nomeremedio, preco from remedio;

-- selecionar o nome, o preço e o laboratório de todos os remédios
-- mais caros que 10 reais.

select nomeremedio, laboratorio, preco from remedio where preco > 10;

-- Selecionar todos os remédios que sejam do laboratório ‘ACHE’ ou FARMASA ou NOVARTIS, 
-- utilizando o comando OR e depois o comando IN.

select * from remedio where laboratorio = 'ACHE' or laboratorio = 'FARMASA' or laboratorio = 'NOVARTIS';

select * from remedio where laboratorio in ('ACHE', 'FARMASA', 'NOVARTIS');

-- Selecione o nome, o laboratório e o preço dos remédios em ordem crescente 
-- dos preços.

select nomeremedio, laboratorio, preco from remedio order by preco asc;

-- Selecione o nome dos remédios, suas descrições e preço dos remédios em 
-- ordem decrescente de preço. Renomeie a coluna nomeRemedio para 
-- “Nome do Remédio” e preco para “preço”

select nomeremedio as "Nome do Remédio", descricao, preco as "preço" from remedio 
	order by preco desc;

