/*CLASE 08 INTRODUCCION A LA CLAUSULA WHERE*/

/*--------------------------------------------
==OPERADORES RELACIONALES==
OPERADOR		NOMBRE
	>			MAYOR QUE
    >			MENOR QUE
    =			IGUALDAD (SOLO CON UN =)
    !=			DISTINTO DE
    <>			DISTINTO DE
    >=			MAYOR O IGUAL
    <= 			MENOR O IGUAL
--------------------------------------------*/

-- Consulta normal sin WHERE
SELECT * FROM world.country limit 10; 
-- Filtrando con la cláusula WHERE podemos obtener, por ejemplo, los paises del continente asiático
-- Aplicando condiciones con los operadores relacionales 
SELECT * FROM world.country WHERE Continent = "Asia";
SELECT * FROM world.country WHERE IndepYear > 1919;
SELECT * FROM world.country WHERE IndepYear < 1919;
-- También se pueden comprar letras. 
SELECT 'a'>'b';
SELECT 'b'>'a';

SELECT @@character_set_database, @@collation_database; -- La forma de ordenar y tener encuenta los carácteres
SELECT * FROM world.country WHERE Continent = "Asia"; -- 'Asia' es exactamente como viene escrito
SELECT * FROM world.country WHERE Continent = "asia";
SELECT * FROM world.country WHERE Continent = "ASIA";
SELECT * FROM world.country WHERE Continent = "AsIa";

SELECT * FROM world.country WHERE BINARY Continent = "Asia"; -- BINARY distingue entre mayúsculas y minúsculas que es lo más normal en las tablas.
SELECT * FROM world.country WHERE BINARY Continent = "AsIa";

