-- 2. De las tablas ALMACENES y CAJAS:
-- a. Obtener todos los almacenes
SELECT * FROM empresa.ALMACENES;
-- b. Obtener todas las cajas con valor superior a 250
SELECT * FROM empresa.CAJAS
WHERE VALOR > 250;
-- c. Obtener los distintos tipos de contenidos de las cajas
SELECT distinct CONTENIDO 
FROM empresa.CAJAS;
-- d. Obtener el valor medio de las cajas
SELECT AVG(VALOR) as 'Valor_Medio'
FROM empresa.CAJAS;
-- e. Obtener el valor medio de las cajas de cada almacén
SELECT ALMACEN, AVG(VALOR) as 'Valor_Medio'
FROM empresa.CAJAS
GROUP BY ALMACEN;
-- f. Obtener el número de referencia de la caja junto con el lugar en el que se encuentra
select c.NumReferencia, a.Lugar FROM empresa.CAJAS as c INNER JOIN empresa.ALMACENES as a 
ON a.codigo = c.almacen;
-- g. Obtener el número de cajas que hay en cada almacén
SELECT a.Codigo, COUNT(NumReferencia)
FROM empresa.ALMACENES as a Left join empresa.CAJAS as c
on a.Codigo = c.Almacen
GROUp BY (a.Codigo);
-- h. Obtener los números de referencia de las cajas que están en el Almacén N
select NumReferencia
FROM ALMACENES LEFT JOIN CAJAS
ON Codigo = Almacen
Where Lugar = 'Almacen N';

-- 3. De las tablas DIRECTORES y DESPACHOS:
select * FROM DIRECTORES;
select * FROM DESPACHOS;
-- a. Mostrar el DNI, el nombre y los apellidos de todos los directores:
SELECT DNI, NombreCompleto FROM empresa.DIRECTORES;
-- b. Mostrar los datos de los directores que no tienen jefes
Select NombreCompleto, DNI FROM empresa.DIRECTORES 
WHERE DNIJefe is null;
-- c. Mostrar el nombre y apellidos de cada director, junto con la capacidad del despacho en el que se encuentra
SELECT dir.NombreCompleto, des.Capacidad
FROM DIRECTORES as dir INNER JOIN DESPACHOS as des
ON dir.Despacho = des.Codigo;
-- d. Mostrar el número de directores en cada despacho
SELECT Codigo, COUNT(DNI) FROM empresa.DESPACHOS left join empresa.DIRECTORES
on Codigo = Despacho
GROUP BY codigo;
-- e. Mostrar los nombres y apellidos de los directores junto con los de su jefe

-- 4. De las tablas CIENTIFICOS, ASIGNADO_A y PROYECTO:
-- a. Saca una relación completa de los científicos asignados a cada proyecto. Muestra el DNI, 
SELECT Nombre, NombreApellidos, DNI 
FROM PROYECTO INNER JOIN ASIGNADO_A
ON PROYECTO.ID = ASIGNADO_A.Proyecto
INNER JOIN CIENTIFICOS
ON CIENTIFICOS.DNI = ASIGNADO_A.Cientifico
ORDER BY Nombre;
-- el nombre del científico, el identificador del proyecto y el nombre del proyecto
SELECT Nombre, ID ,NombreApellidos
FROM PROYECTO INNER JOIN ASIGNADO_A
ON PROYECTO.ID = ASIGNADO_A.Proyecto
INNER JOIN CIENTIFICOS
ON CIENTIFICOS.DNI = ASIGNADO_A.Cientifico
ORDER BY ID;
-- b. Obtener el número de proyectos al que está asignado cada científico. Mostrar el nombre y el DNI
SELECT NombreApellidos, DNI, Count(Nombre) as "Proyectos_Totales"
FROM PROYECTO INNER JOIN ASIGNADO_A
ON PROYECTO.ID = ASIGNADO_A.Proyecto
INNER JOIN CIENTIFICOS
ON CIENTIFICOS.DNI = ASIGNADO_A.Cientifico
group by DNI;
-- c. Obtener el número de científicos asignados a cada proyecto. Mostrar el identificador del proyecto y el nombre del proyecto
SELECT Nombre, ID, Count(DNI) as "Cientificos_totales"
FROM PROYECTO INNER JOIN ASIGNADO_A
ON PROYECTO.ID = ASIGNADO_A.Proyecto
INNER JOIN CIENTIFICOS
ON CIENTIFICOS.DNI = ASIGNADO_A.Cientifico
group by ID
ORDER BY ID;
-- d. Mostrar el número de horas de dedicación de cada científico
SELECT NombreApellidos, SUM(Horas) as "Horas_Totales"
FROM PROYECTO INNER JOIN ASIGNADO_A
ON PROYECTO.ID = ASIGNADO_A.Proyecto
INNER JOIN CIENTIFICOS
ON CIENTIFICOS.DNI = ASIGNADO_A.Cientifico
GROUP BY NombreApellidos;


