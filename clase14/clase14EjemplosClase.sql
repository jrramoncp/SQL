USE sakila; 

-- Extrae y calcula la cantidad de actores que hay por cada película

SELECT title, f.film_id, count(factor.film_id) AS 'numero_actores'
FROM film as f LEFT JOIN film_actor as factor
ON f.film_id = factor.film_id
GROUP BY f.film_id;

-- 

SELECT title, count(*) as 'cantidad'
FROM inventory RIGHT JOIN film
ON inventory.film_id = film.film_id
GROUP BY title
HAVING title = 'Academy Dinosaur';

SELECT FILM_ID, STORE_ID, COUNT(*) AS CANTIDAD
FROM inventory
GROUP BY FILM_ID, STORE_IDd
ORDER BY store_id;