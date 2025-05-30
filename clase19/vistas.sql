-- == VISTAS == -- 
/*
   - Una vista es una SELECT que funciona como una tabla virutal
   
   - Esta SELECT se ejecuta cada vez que invocamos la vista,  por lo tanto las filas y columnas de esta tabla virtual, realmente no están guardadas en 
	  ningún sitio, solo se generan en el momento de hacer la consulta
      
   - Podríamos verlo como guardar una query con un nombre
   
   - En algunas ocasiones hacemos la misma consulta muchas veces, con una vista nos ahorramos el tener que estar reescribiendo. 
   
   SINTAXIS
   --------------
   
   CREATE VIEW NOMBRE AS SELECT ........ 
   
*/

CREATE VIEW VISTA1 AS SELECT * FROM country;

SELECT * FROM VISTA1;

SELECT name, continent FROM VISTA1;

SELECT CONTINENT, COUNT(*) FROM VISTA1 GROUP BY CONTINENT;

SHOW TABLES; -- Se comportan como una tabla, hasta el punto de que aparece como si fuera una tabla, y tambien está en information_schema. 

-- IMAGINEMOS QUE TENEMOS QUE HACER UN ESTUDIOS CON LAS POBLACIONES QUE TIENEN UNA ESPERANZA DE VIDA MAYOR DE 60 AÑOS. PODEMOS CREAR UNA VISTA PARA NO TENER QUE ESTAR
-- FILTRANDO LA ESPERANZA DE VIDA EN CADA QUERY

CREATE VIEW VIDA60 AS SELECT * FROM country WHERE LifeExpectancy >= 60; 
SELECT * FROM VIDA60;

SELECT city.NAME FROM city JOIN VIDA60 
ON COUNTRYCODE = CODE WHERE CONTINENT = 'EUROPE';     -- PODEMOS HACER JOINS CON LA VISTA. 

-- OTRO EJEMPLO, CIUDAD Y PAIS AL QUE PERTENECE, COLUMNAS REPETIDAS (ESTO FORZADAMENTE DARÁ UN ERROR)
CREATE VIEW CIUDAD_PAIS AS
SELECT country.name, city.name
FROM city JOIN country ON COUNTRYCODE = CODE;

-- AUNQUE HAYAMOS DIFERENCIADO LAS DOS COLUMNAS QUE TIENEN EL MISMO NOMBRE, A NIVEL DE VISTA, SIGUEN TENIENDO EL MISMO NOMBRE. PARA SOLUCIONAR ESTO, TENEMOS 
-- DOS OPCIONES. UTILIZAR UN ALIAS: 

CREATE VIEW CIUDAD_PAIS AS
SELECT country.NAME AS COUNTRY_NAME, city.NAME AS CITY_NAME
FROM city JOIN country ON COUNTRYCODE = CODE;

SELECT * FROM CIUDAD_PAIS;

-- NO ES MALA FORMA DE HACERLO, PERO TAMPOCO LO MEJOR, CUANDO HABLAMOS DE VISTA LA MEJOR MANERA DE SOLUCIONAR ESTE PROBLEMA ES ESTA: 

CREATE VIEW CIUDAD_PAIS(PAIS, CIUDAD) AS
SELECT country.name, city.name FROM city JOIN country
ON COUNTRYCODE = CODE;

-- AÑADIENDO REPLACE, PODEMOS CREAR UNA VISTA SI NO EXISTE, O REEMPLAZAR UNA YA EXISTENTE QUE TENGA EL MISMO NOMBRE

CREATE OR REPLACE VIEW CIUDAD_PAIS(PAIS, CIUDAD) AS
SELECT country.name, city.name FROM city JOIN country
ON COUNTRYCODE = CODE;

-- PARA BORRAR UNA VISTA LO HACEMOS ASÍ
DROP VIEW CIUDAD_PAIS; 

-- OTRA UTILIDAD DE LAS VISTAS ES PARA HACER TABLAS DE GROUP BY

CREATE OR REPLACE VIEW  MAX_MIN_POPULATION AS
SELECT CONTINENT, MAX(POPULATION), MIN(POPULATION)
FROM country
GROUP BY CONTINENT;

SELECT * FROM MAX_MIN_POPULATION;