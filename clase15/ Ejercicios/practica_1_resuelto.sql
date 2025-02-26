/*CLASE 15 Ejercicios 1*/
-- 1. Averigua el DNI de todos los clientes
SELECT DNI, nombre FROM cliente;
-- 2.Consulta todos los datos de todos los programas
SELECT * FROM programa;
-- 3.Obten un listado con los nombres de todos los programas
SELECT nombre FROM programa;
-- 4.Genera una lista con todos los comercios
SELECT nombre, ciudad FROM comercio;
-- 5. Genera una lista de las ciudades con establecimientos donde se venden programas, sin que aparezcan valores duplicados (USA Distinct)
SELECT DISTINCT(ciudad) FROM comercio;
-- 6. Obtén una lista de los nombres de programas, sin que aparezcan valores duplicados (Usa distinct)
SELECT DISTINCT(nombre) FROM programa;
-- 7. Obtén el DNI màs 4 de todos los clientes
SELECT DNI + 4 FROM cliente;
-- 8. Haz un listado con los códigos de los programas multiplicados por 7
SELECT codigo * 7 from programa;
-- 9. ¿Cuáles son los programas cuyo código es inferior o igual a 10?
SELECT * FROM programa WHERE codigo <= 10;
-- 10. ¿Cuál es el programa cuyo código es 11?
SELECT * FROM programa WHERE codigo = 11; 
-- 11. ¿Qué fabricantes son de Estados Unidos?
SELECT * FROM fabricante WHERE pais = 'Estados Unidos';
-- 12. ¿Cuáles son los fabricantes no españoles? Utilizar operador in
SELECT * FROM fabricante WHERE pais NOT IN ('España');
-- 13. Obtén un listado con los códigos de las distintas versiones de Windows;
SELECT * FROM programa WHERE nombre IN ('Windows');
-- 14. ¿En qué ciudades comercializa programas El Corte Inglés? 
SELECT ciudad FROM comercio WHERE nombre IN ('El Corte Ingles'); 
-- 15. ¿Qué otros comercios hay, además de El Corte Inglés? Utilizar el operador IN. 
SELECT * FROM comercio WHERE nombre NOT IN ('El Corte Ingles'); 
-- 16. Genera una lista con los códigos de las distintas versiones de Windows y Access. Utilizar el operador IN
SELECT codigo, nombre FROM programa WHERE nombre IN ('Windows', 'Access');
-- 17. Obtén un listado que incluya los nombres de los clientes de edades comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución con BETWEEN
--     y otra sin BETWEEN
SELECT * from cliente WHERE edad > 50 OR edad BETWEEN 10 AND 25;
SELECT * FROM cliente WHERE edad > 50 OR edad >= 10 AND edad <= 25;
-- 18. Saca un listado con los comercios de Sevilla y Madrid. No se admiten valores duplicados
SELECT DISTINCT nombre FROM comercio WHERE ciudad IN('Sevilla', 'Madrid');
-- 19. ¿Qué clientes terminan su nombre con la letra "o"?
SELECT * FROM cliente WHERE nombre like "%o";
-- 20 ¿Qué clientes terminan su nombre en la letra "o" y además son mayores de 30 años?
SELECT * FROM cliente WHERE nombre like "%o" and edad > 50;
-- 21. Obtén un listado en el que aparezcan los programas cuaya version finalice por una letra i, o cuyo nombre comience por una A o una W 
SELECT * FROM programa WHERE version like "%i" OR nombre like "A%" OR nombre like "W%";
-- 22. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra o cuyo nombre comience por una A y termine con una S
SELECT * FROM programa WHERE version like "%i" OR nombre like "A%s";
SELECT * FROM programa WHERE version like "%i" OR (nombre LIKE "A%" AND nombre LIKE "%s");
-- 23. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i y cuyo nombre no comience con una letra A
SELECT * FROM programa WHERE version like "%i" AND nombre not like "A%";
-- 24. Obtén una lista de empresas por orden alfabético ascendente
SELECT * FROM fabricante ORDER BY nombre ASC;
-- 25. Genera un listado de empresas por orden alfabético descendente;
SELECT * FROM fabricante ORDER BY nombre DESC;
-- 26. Genera un listado de programas por orden de Version
SELECT * FROM programa ORDER BY nombre, version ASC; 
-- 27. Genera un listado de los programas que desarrolla Oracle
SELECT * FROM fabricante, programa, desarrolla
WHERE fabricante.id_fab = desarrolla.id_fab AND programa.codigo = desarrolla.codigo AND fabricante.nombre = "Oracle";

SELECT * FROM fabricante INNER JOIN desarrolla INNER JOIN programa
ON fabricante.id_fab = desarrolla.id_fab AND programa.codigo = desarrolla.codigo
WHERE fabricante.nombre = "Oracle";
-- 28. ¿Qué comercios distribuyen Windows?
SELECT * FROM comercio, programa, distribuye 
WHERE comercio.cif = distribuye.cif AND programa.codigo = distribuye.codigo AND programa.nombre = "Windows";

SELECT * FROM comercio INNER JOIN distribuye INNER JOIN programa
ON comercio.cif = distribuye.cif AND programa.codigo = distribuye.codigo
AND programa.nombre = "Windows";
-- 29. Genera un listado de los programas y cantidades que se han distribuido a el corte ingles de madrid
SELECT programa.nombre, distribuye.cantidad
FROM comercio INNER JOIN distribuye INNER JOIN programa
ON comercio.cif = distribuye.cif AND distribuye.codigo = programa.codigo
WHERE comercio.ciudad = "Madrid";
-- 30. ¿Qué fabricante ha desarrollado Freddy Hardest?
SELECT fabricante.nombre 
FROM fabricante INNER JOIN desarrolla INNER JOIN programa
ON fabricante.id_fab = desarrolla.id_fab AND programa.codigo = desarrolla.codigo AND programa.nombre = "Freddy Hardest";
-- 31 Selecciona el nombre de los programas que se registran por internet
SELECT nombre FROM programa, registra
WHERE registra.codigo = programa.codigo AND medio = "Internet";
-- 32. Selecciona el nombre de las personas que se registran por internet
SELECT cliente.nombre 
FROM cliente, registra 
WHERE cliente.dni = registra.dni AND medio = "internet";
-- 33.¿Qué medios ha utilizado para registrarse Pepe Perez
SELECT cliente.nombre, registra.medio 
FROM cliente, registra
WHERE cliente.dni = registra.dni AND cliente.nombre = "Pepe Perez";

SELECT cliente.nombre, registra.medio
FROM cliente INNER JOIN registra 
ON cliente.dni = registra.dni 
WHERE cliente.nombre = "Pepe Perez";
-- 34.¿Que usuarios han optado por internet como medio de registro? 
SELECT cliente.nombre 
FROM cliente INNER JOIN registra
ON cliente.dni = registra.dni 
WHERE registra.medio = "Internet";
-- 35.¿Qué programas han recibido registros por tarjeta postal?
SELECT programa.nombre, registra.medio
FROM programa INNER JOIN registra 
ON programa.codigo = registra.codigo
WHERE registra.medio = "Tarjeta Postal";
-- 36.¿En que localidades se han venido prodcutos que se han registrado por internet?
SELECT comercio.ciudad 
FROM comercio INNER JOIN registra 
ON comercio.cif = registra.cif 
WHERE registra.medio = "Internet";
-- 37. Obtén un listado de los nombres de las personas que se han registrado por Internet, junto al nombre de los programas para los que ha efectuado registro
SELECT cliente.nombre, programa.nombre
FROM cliente INNER JOIN registra INNER JOIN programa
ON cliente.dni = registra.dni AND programa.codigo = registra.codigo
WHERE registra.medio = "Internet";
-- 38. Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido
SELECT cliente.nombre, programa.nombre, registra.medio, comercio.nombre
FROM cliente INNER JOIN registra INNER JOIN programa INNER JOIN comercio
ON cliente.dni = registra.dni AND programa.codigo = registra.codigo AND comercio.cif = registra.cif;
-- 39.Genera un listado con las ciudades en las que se puede obtener los productos de Oracle
SELECT ciudad, fabricante.nombre FROM fabricante INNER JOIN desarrolla INNER JOIN programa INNER JOIN distribuye INNER JOIN comercio
ON fabricante.id_fab = desarrolla.id_fab AND programa.codigo = desarrolla.codigo AND distribuye.codigo = programa.codigo
AND comercio.cif = distribuye.cif
WHERE fabricante.nombre = "Oracle";
-- 40. Obtén el nombre de los usuarios que han registrado Access XP
SELECT cliente.nombre 
FROM programa,cliente,registra
WHERE cliente.dni = registra.dni AND programa.codigo = registra.codigo AND programa.nombre = 'Access' AND version = 'XP';
-- 41. Nombre de aquellos fabricantes cuyo pais sea el mismo que Oracle
SELECT nombre 
FROM fabricante
WHERE pais = (SELECT pais from fabricante where nombre = "Oracle");
-- 42. Nombre de aquellos clientes que tienen la misma edad que "Pepe Perez"
SELECT nombre
FROM cliente
WHERE edad = (SELECT edad from cliente where nombre = "Pepe Perez");
-- 43. Genera un listado con los comercios que tienen su sede en la misma ciudad que FNAC
select *
FROM comercio
WHERE ciudad = (SELECT ciudad FROM comercio WHERE nombre = "FNAC");
-- 44. Nombre de aquellos clientes que han registrado un producto de la misma forma que el cliente "Pepe Perez"
SELECT DISTINCT(cliente.nombre) FROM cliente INNER JOIN registra
ON cliente.dni = registra.dni
WHERE registra.medio IN 
	(SELECT medio FROM registra INNER JOIN cliente 
	ON registra.dni = cliente.dni 
	WHERE cliente.nombre = "Pepe Perez");

SELECT DISTINCT(cliente.nombre) FROM cliente, registra
WHERE cliente.dni = registra.dni AND medio IN 
(SELECT medio FROM registra, cliente WHERE registra.dni = cliente.dni AND cliente.nombre ="Pepe Perez");

-- 45.Obtener el numero de programas que hay en la tabla programas
SELECT count(nombre) as "Numero Programas" FROM programa;
-- 46. Calcula el número de clientes cuya edad es mayor de 40 años
SELECT count(nombre) as "Clientes mas 40" from cliente WHERE edad > 40;
-- 47.Calcula el número de productos que ha vendido el establecimiento cuyo CIF es 1
select sum(cantidad) 
from comercio, distribuye
where comercio.cif = distribuye.cif AND comercio.cif = 1;
-- 48. Calcula la media de programas que se venden cuyo codigo es 7
select avg(cantidad) 
from distribuye
where codigo = 7;
-- 49. Calcula la minima cantidad de programas de código 7 que se han vendido
SELECT min(cantidad) 
from distribuye
where codigo = 7;
-- 50 Calcula la maxima cantidad de programas de códito 7 que se han vendido
SELECT max(cantidad)
from distribuye
where codigo = 7;
-- 51.¿En cuantos establecimientos se vende el programa cuyo codigo es 7?
SELECT count(cif) 
from distribuye
where codigo = 7;
-- 52.Calcular el numero de registros que se ha hecho por internet
SELECT count(medio)
FROM registra
WHERE medio = "Internet";
-- 53. Obtener el número total de programas que se han vendido en "Sevilla"
SELECT sum(cantidad) 
FROM comercio, distribuye
WHERE comercio.cif = distribuye.cif and ciudad = "Sevilla";
-- 54.Calcular el númerio total de programas que han desarrollado los fabricantes cuyo pais es Estados Unidos
select count(*)
from fabricante, desarrolla
where fabricante.id_fab = desarrolla.id_fab AND pais = "Estados Unidos";
-- 55.Visualiza el nombre de todos los clientes en mayuscula. En el resultado debe aparecer tambien la longitud de la cadena nombre
SELECT UPPER(nombre) AS Nombre, LENGTH(nombre) as Longitud
from cliente;
-- 56.Con una consulta concate los campos nombre y version de la tabla PROGRAMA
SELECT CONCAT(nombre," ",version) AS "Nombre + Version" FROM programa;

