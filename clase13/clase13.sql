/*
== AGRUPACIONES Y FUNCIONES DE GRUPO ==
La clausula GROUP BY se utiliza para agrupar filas con valores iguales en una columna y aplicar funciones de agregación a cada grupo

--  FUNCIONES DE AGREGACION --
-----------------------------------
-- sum()
-- count()
-- min()
-- max()
-- avg() -> Valor promedio de lo que se especifique
*/
-- EJERCICIOS PRACTICOS DE CLASE
-- numero de alumnos por cada formación
select formacion, sum(alumnos) from conquerblocks.conquerblocks group by formacion;

-- poblacion  de cada continente y region
select continent, region, sum(population) from world.country group by continent, region
order by continent, region;

-- poblacion de cada continente
select continent, sum(population) from world.country group by continent;

-- maximo y minimo de la esperanza de vida por continente y region
select continent, region, max(LifeExpectancy), min(LifeExpectancy)
from world.country
group by region, continent 
order by continent, region;

/*Utilizando la clausula HAVING podemos poner condiciones a las agrupaciones con GROUP BY (es como si fuera un where)*/
-- ejemplo utilizando la ultima query del ejercicio anterior
select continent, region, max(LifeExpectancy), min(LifeExpectancy)
from world.country
group by region, continent HAVING min(LifeExpectancy) > 55
order by continent, region;

