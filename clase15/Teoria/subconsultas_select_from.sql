-- SUBCONSULTAS EN 'SELECT' 
-- EJEMPLO SIMPLE
USE world; 

SELECT name, continent, region, (SELECT NOW()) FROM country;

SELECT Name, population, (SELECT SUM(population) FROM country) AS "POBLACION_MUNDIAL_TOTAL", 
(population*100/(SELECT SUM(population) FROM country)) AS "PORCENTAJE_POBLACION" FROM country;

-- REFERENCIANDO A LA CONSULTA PRINCIPAL 
-- Cantas ciudades hay en cada pais
SELECT code, name, (select count(*) FROM city where countrycode = paises.code) from country as paises;

-- SUBCONSULTAS 'FROM'

SELECT * FROM (SELECT name, continent, population FROM country) as TABLA;

-- Agrupar población y continente
SELECT Continent, Total_Population FROM 
	(SELECT CONTINENT, SUM(population) as total_population from country group by continent) as poblacion;
    
SELECT code,  continent, SUM(POPULATION) as 'Total_Poblacion';

-- SUBONSULTA EN 'WHERE'
SELECT name, population FROM country WHERE population = (SELECT max(population) FROM country);

Select name, population from country where population > (select avg(population) from country);