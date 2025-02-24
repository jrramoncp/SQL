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