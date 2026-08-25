select pnome from empregado where pnome like 'A%';

select pnome from empregado where pnome like '%a%';


-- Selecionar o primeiro nome dos empregados
-- que possuem a segunda letra 'e' ou a penultima letra 'i' no nome.
select pnome from empregado where 
pnome like '_e%' or 
pnome like '%i_'; 


-- Selecionar o primeiro nome dos empregados
-- que possuem a segunda letra 'a' e depois a letra 's' no nome.
select pnome from empregado where 
pnome like '%a%s%';


select pnome from empregado where 
pnome ilike '_a%' or 
pnome ilike '%i_';


select pnome from empregado where 
pnome ilike '%a%s%';

-- Funções agregadas

-- Selecione o cargo e a média (AVG) salarial de cada cargo.
select cargo, avg(salario) as "Média salarial" from empregado 
	group by cargo order by "Média salarial" desc;

select max(salario) as maior_salario, min(salario) as menor_salario from empregado;

select cargo, sum(salario) as soma_salario from empregado 
group by cargo order by soma_salario desc;


-- quantidade de empregados de cada cargo
select cargo, count(*) as quantidade_cargo from empregado 
	group by cargo 
	order by quantidade_cargo desc;

-- Selecione os cargos da empresas e a folha salarial de cada cargo, desde que esses gastos sejam superiores a 10000
select cargo, sum(salario) as soma_salario from empregado
 group by cargo
 having sum(salario) > 10000
 order by soma_salario desc;

-- Selecione o maior e o menor salário de cada cargo,
-- desde que o cargo não seja o de Gerente, 
-- e o salário maior seja maior que 2000 e o menor seja menor que 2500
select cargo, max(salario) as maior_salario, min(salario) as menor_salario from empregado
where cargo <> 'Gerente'
group by cargo
having max(salario) > 2000 and min(salario) < 2500
order by cargo asc;

-- Buscar o funcionário com o maior salário
select pnome, salario from empregado
where salario in (
	select max(salario) from empregado
	);
