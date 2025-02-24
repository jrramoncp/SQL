-- SUBCONSULTAS EN WHERE
/*Al igual que en las uniones de tabla podiamos tener varias sin problema, también podemos tener varias subconsultas dentro de una subconsulta*/
-- Dos subconsultas. 
-- Extrae el pais con mayor población y el pais con menor población
use world;

SELECT Name, Population FROM country 
WHERE Population = (SELECT max(Population) FROM country) 
OR 
Population = (SELECT min(Population) FROM country WHERE Population > 0)
ORDER BY Population DESC;

-- Subconsultas con columnas referenciadas
-- Extraer el pais que tiene la mayor población dentro de su continente
SELECT Name, Continent, Population 
FROM country as paises
WHERE Population = (Select max(Population) FROM country WHERE Continent = paises.Continent AND population > 0);

-- Subconsultas con otras tablas. Extraer todas las ciudades que pertenecen a un país. 
SELECT Name FROM city 
WHERE CountryCode = (SELECT Code FROM country WHERE NAME ="United States");

