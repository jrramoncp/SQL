-- 1. Descargar la base de datos ‘sakila’ e instalarla en MySQL Workbench.
/*DESCARGAR E INSTALAR 'sakila'*/
-- 2. Seleccionar los campos ‘address’ y ‘district’ de la tabla ‘address’ donde el
-- distrito sea Texas.
SELECT address, district FROM sakila.address WHERE district = 'Texas';
-- 3. Seleccionar todas las columnas de la tabla ‘payment’ cuyo campo ‘amount’
-- sea mayor que 11.
SELECT * FROM sakila.payment WHERE amount < 11;
-- 4. Visualizar todos los actores de la tabla ‘actor’ cuyo ‘first_name’ sea Penelope.
-- Probar varias formas de escribir el nombre para comprobar si obtenemos
-- resultados diferentes.
SELECT * FROM sakila.actor WHERE first_name = 'Penelope';
SELECT * FROM sakila.actor WHERE first_name = 'PenElope';
SELECT * FROM sakila.actor WHERE first_name = 'PENELOPE';
-- 5. Repite el proceso anterior utilizando BINARY.
SELECT * FROM sakila.actor WHERE BINARY first_name = 'Penelope';
SELECT * FROM sakila.actor WHERE BINARY first_name = 'PenElope';
SELECT * FROM sakila.actor WHERE BINARY first_name = 'PENELOPE';
-- 6. Visualizar las columnas ‘first_name’ y ‘last_name’ de la tabla ‘customer’ de
-- aquellos clientes que estén inactivos (En otras palabras, que el campo ‘active’
-- sea igual a 0)
SELECT first_name, last_name FROM sakila.customer WHERE active = 0;
-- 7. Probar la consulta anterior cambiando el 0 por False. ¿Funciona?
SELECT first_name, last_name FROM sakila.customer WHERE active = False; -- FUNCIONA IGUAL
-- 8. Piensa qué resultado deberían dar las siguientes querys:
	select first_name,last_name,active from sakila.customer where
	active;
-- Nombre y apellido de los clientes que esten activos
	select first_name,last_name,active from sakila.customer where
	!active; 
-- MISMO RESULTADO EJERCICIO 6