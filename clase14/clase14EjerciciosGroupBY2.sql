-- 9. Encuentra la cantidad de países en cada continente
select * from world.country;
select continent, count(name) as número_paises
from world.country 
group by continent;
-- 10. Encuentra el número total de ciudades en cada país
select city.CountryCode as Codigo_pais, count(city.name) as total_ciudades, country.name as Nombre_Pais
from world.city inner join world.country
on city.CountryCode = country.Code
group by CountryCode;
-- 11. Encuentra los continentes cuya población total es superior a 100 millones
select Continent, SUM(Population) as Poblacion
from world.country
Group By Continent
having Poblacion > 100000000;
-- 12. Encuentra la cantidad de idiomas oficiales en cada país
select * from world.countrylanguage;
select countrylanguage.CountryCode, country.Name, count(countrylanguage.Language) as lenguas_oficiales
from world.countrylanguage inner join world.country
on country.Code = countrylanguage.CountryCode
where countrylanguage.isOfficial = 'T'
group by countrylanguage.CountryCode;
-- 13. Encuentra los continentes donde la expectativa de vida promedio es inferior a 70 años
select * from world.country;
Select Continent, AVG(LifeExpectancy) as Esperanza_vida
from world.country 
group by Continent
having Esperanza_vida < 70;
-- 14. Encuentra el número total de hablantes de cada idioma en todo el mundo
select * from world.countrylanguage;
select* from world.country;

select countrylanguage.language, sum((countrylanguage.percentage / 100)* country.population) as Hablantes_Totales
from world.countrylanguage inner join world.country
on countrylanguage.CountryCode = country.Code
group by countrylanguage.language;
-- 15. Encuentra los continentes donde ningún país tiene una población superior a 200 millones
select Continent, max(Population) as Poblacion_total from world.country
group by Continent
having Poblacion_total < 200000000;
-- 16. Encuentra los continentes donde la cantidad de países con una expectativa de vida superior a 80 años sea igual o mayor a 3
select * from world.country;
select continent, count(LifeExpectancy) as Esperanza_Vida
from world.country
where LifeExpectancy > 80
group by continent
having Esperanza_Vida >= 3;
-- 17. Encuentra el promedio de la expectativa de vida en cada continente, excluyendo aquellos donde el promedio sea inferior a 70 años
select * from world.country;
Select Continent, AVG(LifeExpectancy) as Esperanza_vida
from world.country 
group by Continent
having Esperanza_vida > 70;