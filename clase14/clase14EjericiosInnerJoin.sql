/*== EJERCICIOS JOINS == */ 
-- 1. Extrae el continente, el país y el nombre de la ciudad de las tablas correspondientes de la base de datos world.
select * from world.country;
SELECT city.name AS nombre_ciudad, country.name AS nombre_pais, country.continent AS continente
FROM world.city INNER JOIN world.country
ON city.CountryCode = country.Code;
-- 2. Extrae el identificador de cada película, el título y también el identificador de lacategoría asociado a esa película. Usa la base de datos sakila.
select * from sakila.film;
select * from sakila.film_category;

select film.film_id, film.title, film_category.category_id
FROM sakila.film INNER JOIN sakila.film_category
ON film.film_id = film_category.film_id;
-- 3. Extrae la misma información que en el ejercicio anterior, pero además, extrae el nombre de la categoría.
select film.film_id, film.title, film_category.category_id, category.name
FROM sakila.film INNER JOIN sakila.film_category
ON film.film_id = film_category.film_id
inner join sakila.category
on category.category_id = film_category.category_id;