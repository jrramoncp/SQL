-- Lenguaje Oficial de cada pais
SELECT country.name, countrylanguage.language
FROM world.country, world.countrylanguage
where country.code = countrylanguage.countrycode AND countrylanguage.isOfficial = 'T';

SELECT country.name, countrylanguage.language
FROM world.country INNER JOIN world.countrylanguage
ON country.code = countrylanguage.countrycode
WHERE countrylanguage.isOfficial = 'T';

-- Extrae todos los titulos de cada pelicula y el identificador asociado del actor que actúa en esa pelicula
SELECT film.title, film_actor.actor_id
FROM sakila.film INNER JOIN sakila.film_actor
ON film.film_id = film_actor.film_id;

-- Extrae el titulo de cada pelicula, el identificador del actor y el nombre y apellido del actor que actúa en esa pelicula
SELECT film.title, film_actor.actor_id, actor.first_name, actor.last_name
FROM sakila.film inner join sakila.film_actor 
ON film.film_id = film_actor.film_id
INNER JOIN sakila.actor
ON actor.actor_id = film_actor.actor_id;