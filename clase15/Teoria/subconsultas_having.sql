-- SUBCONSULTAS EN HAVING
-- Son muy parecidas a las que se hacen en WHERE, tecnicamente es lo mismo solo que para grupos
-- EJEMPLOS
-- Regiones que tengan más población que todo el continente de Africa
SELECT sum(Population) FROM country WHERE Continent = "Africa"; -- Poblacion total Africa

SELECT Region, sum(Population) FROM country
GROUP BY Region
Having sum(Population) > (SELECT sum(Population) FROM country WHERE Continent = "Africa");

-- Extraer los continentes que tengan una esperanza de vida media mayor que la de China
SELECT LifeExpectancy FROM country WHERE Name = 'China';

SELECT Continent, AVG(LifeExpectancy) FROM country 
GROUP BY continent 
HAVING AVG(LifeExpectancy) > (SELECT LifeExpectancy FROM country WHERE Name = 'China');