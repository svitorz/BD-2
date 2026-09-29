update cidadesBrasil set idhm = 0.52 where nomeCidade = 'Florianópolis';

update cidadesBrasil set populacao = 900000 where nomeCidade = 'Teresina';

delete from cidadesBrasil where idhm < 0.5;

select * from cidadesBrasil where regiao = 'Sul' or idhm < 0.7 order by idhm asc;

select * from cidadesBrasil where regiao = 'Nordeste' 
and idhm between 0.5 and 0.8 
and populacao > 20000 
order by populacao desc;

select count(*), regiao from cidadesBrasil
group by regiao
order by regiao;

select sum(populacao) as "População total", regiao from cidadesBrasil
group by regiao
having sum(populacao) > 100000;

select * from cidadesBrasil 
where nomeCidade like '%a%' 
 or nomeCidade like '%e%'
or nomeCidade like '%i_';

