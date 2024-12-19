-- 1. Entrar en la base de datos world.
USE world;
-- 2. Estudiar la estructura de la tabla country.
-- => Click derecho country => Table Inspector
-- 3. Escribir una query para recuperar todas las columnas y filas de la de la tabla.
SELECT * FROM country;
-- 4. Escribir una query para visualizar sólo los nombres de los países.
SELECT name FROM country;
-- 5. Escribir una Query para visualizar el nombre, el continente y la población de cada
-- país.
SELECT Name, Continent, Population FROM country;
-- 6. Cambiar la cabecera de cada columna de la consulta anterior traduciendo el nombre
-- al español.
SELECT Name AS Nombre, Continent AS Continente, Population AS Poblacion FROM country;
-- 7. Utilizando la columna IndepYear (Año de la independencia), averiguar cuántos años
-- lleva un país siendo independiente.
-- a. En esta consulta debemos visualizar: el nombre del país, el año de la
-- independencia y el número de años transcurridos.
-- b. El nombre de la columna en la que hagamos el cálculo deberá llamarse
-- “Años_Transcurridos”
SELECT Name, IndepYear, (2024 - IndepYear) AS "Años_Transcurridos" FROM country;
-- 8. Visualizar los continentes sin que aparezcan repetidos.
SELECT DISTINCT Continent FROM country;
-- 9. Visualizar los 5 primeros países.
SELECT * FROM country
LIMIT 5;