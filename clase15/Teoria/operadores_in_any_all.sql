-- OPERADORES IN, ANY, ALL
-- IN 
-- Recordatorio
SELECT * FROM country WHERE continent IN ('ASIA', 'AFRICA'); 

-- Subconsulta con IN. Extraer las ciudades que pertenecen a Africa
SELECT name FROM city
WHERE CountryCode IN (SELECT Code FROM country WHERE continent = 'Africa');

-- Extraer ciudades que pertenecen a España y Argentina
SELECT Name FROM city
WHERE CountryCode IN (Select Code from country Where Name IN ('Spain', 'Argentina'));

-- Extraer Ciudades que pertenezcan a Europa o Asia
SELECT Name FROM city
WHERE CountryCode IN (SELECT Code FROM country WHERE Continent IN ('Europe', 'Asia'));

-- ANY, ALL
-- Devuelven True o False dependiendo de los valores.
/*
ANY(Valor1, Valor2, Valor3) ->  Devuelve True, si cualquiera de los valores cumplen la condicion
ALL(Valor1, Valor2, Valor3) -> Devuelve True, si todos los valores cumplen la condición. 
*/
-- Paises que tienen más esperanza de vida que CUALQUIER pais de Asia
SELECT Name, Continent, LifeExpectancy FROM country
WHERE LifeExpetancy > ANY(Select LifeExpectancy FROM country WHERE continent = 'Asia')
ORDER BY LifeExpectancy;

-- Paises que tienen más esperanza de vida que todos los paises de Asia
SELECT Name, Continent, LifeExpectancy FROM country 
WHERE LifeExpectancy > ALL(SELECT LifeExpectancy FROM country Where continent = 'Asia')
ORDER BY LifeExpectancy;

-- Paises que tienen más población que cualquier pais de Africa
SELECT Name, continent, population FROM country
WHERE population > ANY(SELECT population FROM country WHERE continent = 'Africa');

-- Paises que tienen más población que todos los paises de Africa
SELECT Name, continent, population FROM country
WHERE population > ALL(SELECT population FROM country WHERE continent = 'Africa');