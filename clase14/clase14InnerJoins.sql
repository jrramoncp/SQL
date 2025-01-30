/*== INNER JON ==*/
SELECT * FROM world.country; -- Tabla Padre
SELECT * FROM world.city; -- Tabla hija
-- Ambas tablas están relacionadas por la columna CountryCode

-- JOIN CON WHERE
SELECT city.name, country.name
FROM world.city, world.country
WHERE city.CountryCode = country.Code;

-- JOIN CON INNER JOIN
SELECT city.name, country.name
FROM world.city INNER JOIN world.country
ON city.CountryCode = country.Code;

-- SINTAXIS MÁS LARGA, DIVIDIENDO TODOS LOS CAMPOS
SELECT nombre_ciudad, nombre_pais
FROM
(SELECT name as nombre_ciudad, CountryCode from world.city) city
INNER JOIN
(SELECT name as nombre_pais, Code from world.country) country
ON city.CountryCode = country.Code