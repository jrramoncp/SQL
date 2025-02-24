/*==== SUBCONSULTAS ====*/
-- Son sentencias SELECT que están contenidas dentro de otra SELECT
-- La primera consulta se suele denominar query principal y la segunda subquery
-- El formato de una subquery es el mismo que el de una consulta normal, aunque aparecen con parentesis
-- Pueden aparecer en diferentes lugares dentro de la query principal
-- ## Si aparece dentro de 'SELECT', lo que hace es poner el valor que devuelve esta subquery como una columna
-- EJEMPLO: En la base de datos sakila,usando las tablas customer y payment extraer como columna los pedidos que ha hecho cada cliente
SELECT first_name, last_name, email, (SELECT COUNT(*) FROM payment
		WHERE customer.customer_id = payment.customer_id) AS num_payments
FROM customer
ORDER BY num_payments DESC;

-- ## Si aparece dentro de FROM, se usarán los datos obtenidos de la subquery como si fueran una nueva tabla, para este caso es necesario darle un nombre a la subquery
-- EJEMPLO: Usando la base de datos sakila, extrae el nombre, apellido y el email de todos los clientes de la tabla customer, usando una subconsulta
SELECT * FROM (SELECT first_name, last_name, email FROM customer) as T;

-- ## Las subconsultas en la cláusula WHERE son las má habituales, sirven para hacer comparaciones con el resultado de la subconsulta
-- EJEMPLO: En la base de datos sakila extrae todos los datos de la tabla film donde el identificador de categoría pertenezca a la categoría de Comedia
SELECT * FROM film WHERE film_id IN(
	SELECT film_id FROM film_category
    WHERE category_id = (SELECT category_id FROM category WHERE name = "Comedy"));
-- ## Las subconsultaas en HAVING también sirven para hacer comparaciones pero en este caso se compara con agrupaciones
-- EJEMPLO: De la base de datos sakila, extrae el identificador de cada actor junto con el numero de peliculas que ha rodado, para los actores que hayan rodado las 
-- mismas o más peliculas que el actor con id = 1
SELECT actor_id, COUNT(*) as num_films FROM film_actor GROUP BY actor_id
HAVING num_films >= (
	SELECT
		COUNT(*)
	FROM
		film_actor
	WHERE
		actor_id = 1
);
