/*EJERCICIOS IN, LIKE, BETWEEN */
-- 1. EJERCICIOS CON BETWEEN
-- a. Extrae el nombre y la duración de las peliculas que duran entre 120 y 130 minutos. Utiliza la tabla film
SELECT * FROM sakila.film WHERE length BETWEEN '120' AND '130';

-- b. Extrae de la tabla rent, el 'rental_id' y el 'rental_date' de los alquileres de febrero de 2006;
SELECT rental_id, rental_date FROM sakila.rental WHERE rental_date BETWEEN '2006-02-01 00:00:00' AND '2006-02-28 23:59:59';

-- c. Extrae de la tabla actor el 'first_name' de los actores cuyo primer nombre comience entre B y C
SELECT first_name FROM sakila.actor WHERE first_name BETWEEN 'B' AND 'C';
-- 2. EJERCICIOS CON LIKE
-- a. Averigua los actores cuyo nombre comience con B y termine en A
SELECT * FROM sakila.actor WHERE first_name LIKE 'B%A';
-- b. Extrae los apellidos de los clientes cuyo apellido empiece por MA
SELECT * FROM sakila.customer WHERE last_name LIKE 'MA%';
-- c. Extrae los nombres y apellidos de los clientes cuyos apellidos tengan TH en cualquier parte
SELECT first_name, last_name FROM sakila.customer WHERE last_name LIKE '%TH%';
-- d. Extrae los apellidos que tengan una A como segunda letra y una E como cuarta letra
SELECT last_name from sakila.customer WHERE last_name LIKE '_A_E%';
-- EJERCICIOS CON IN
-- a. Extrae el nombre y los apellidos de los actores cuyo nombre sea 'sara', 'fred', 'ed', 'helen'
SELECT first_name, last_name FROM sakila.actor WHERE first_name IN ('sara', 'fred', 'ed', 'helen');
-- b. Extrae el 'title' y el 'rental_date' de la tabla film, cuyo 'rental_rate' sea 2.99 o 4.99 
SELECT title, rental_date FROM sakila.film WHERE rental_rate IN (2.99, 4.99);
-- c. Extrae el titulo y las características especiales de las peliculas que sean 'Deleted scenes' o 'Comedy'
SELECT title, special_features FROM sakila.film WHERE special_features IN ('Deleted Scenes', 'Comedy');
-- d. Extrae el nombre de la ciudad cucyo pais es el 87 o el 60
SELECT city FROM sakila.city WHERE country_id IN (87, 60);