-- 1. De las tablas FABRICANTES y ARTÍCULOS:
-- a. Obtener los nombres de los productos de la tienda.
SELECT Nombre FROM ARTICULOS;
-- b. Obtener nombres y precios de los artículos.
SELECT NOMBRE, PRECIO FROM ARTICULOS;
-- c. Obtener el nombre de los artículos cuyo precio sea menor o igual a 20 €.
SELECT NOMBRE, PRECIO FROM ARTICULOS
WHERE PRECIO <= 20;
-- d. Obtener todos los datos de los artículos cuyo precio esté entre los 60€ y los 120€.
SELECT NOMBRE, PRECIO FROM ARTICULOS
WHERE PRECIO >= 60 AND PRECIO <= 120;
-- e. Calcular el precio medio de todos los productos
SELECT AVG(PRECIO) AS 'Precio_medio'
FROM ARTICULOS;
-- f. Calcular el precio medio de los productos del fabricante 3
SELECT AVG(PRECIO) AS 'Precio_medio', FABRICANTES.Nombre
FROM ARTICULOS LEFT JOIN FABRICANTES
ON FABRICANTES.Codigo = ARTICULOS.FABRICANTE
GROUP BY FABRICANTES.Codigo
HAVING Nombre = 'Fabricante 3';
-- g. Calcular el número de artículos cuyo precio sea menor o igual a 160€
select count(precio) as "TotalPrecios"
from ARTICULOS
where precio <= 160;
-- h. Obtener un listado completo de artículos en el que aparezca el nombre del artículo y el nombre del fabricante
select ARTICULOS.Nombre, FABRICANTES.Nombre
FROM ARTICULOS RIGHT JOIN FABRICANTES
ON ARTICULOS.FABRICANTE = FABRICANTES.Codigo
order by FABRICANTES.nombre ASC;
-- i. Obtener el precio medio de los productos de cada fabricante
select FABRICANTES.Nombre, avg(ARTICULOS.Precio) as 'Precio_Medio'
FROM FABRICANTES RIGHT JOIN ARTICULOS
ON ARTICULOS.FABRICANTE = FABRICANTES.Codigo
GROUP BY FABRICANTES.Nombre
order by FABRICANTES.nombre ASC;
-- j. Obtener el precio medio de los productos de cada fabricante mostrando además el nombre del fabricante
select FABRICANTES.Nombre, avg(ARTICULOS.Precio) as 'Precio_Medio'
FROM FABRICANTES RIGHT JOIN ARTICULOS
ON ARTICULOS.FABRICANTE = FABRICANTES.Codigo
GROUP BY FABRICANTES.Nombre
order by FABRICANTES.nombre ASC;
-- k. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 100€
SELECT f.nombre, AVG(Precio) as 'Precio_Medio'
FROM empresa.ARTICULOS as a INNER JOIN empresa.FABRICANTES as f
ON a.Fabricante = f.codigo
Group BY f.nombre
HAVING Precio_Medio >= 100;
-- l. Obtener el nombre y el precio del artículo más barato
select Nombre, Precio
From empresa.ARTICULOS
Order By Precio ASC
Limit 1;