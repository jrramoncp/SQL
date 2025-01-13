/*EJERCICIOS*/
/*1. En la tabla country de la bases de datos world, extraer los siguientes datos:*/
-- a. Países cuyo continente es Asia y la poblacion supera los 20.000.000
select name, continent, population from world.country
	where (continent = 'Asia' and population > 20000000);

-- b. Países que pertenecen a Asia o a África
select name, continent from world.country
	where (continent = 'Asia' or continent = 'Africa');
    
-- c. Países que empiecen por B y que pertenezcan a África
select name from world.country 
	where (name like 'B%' and continent = 'Africa');
    
-- d. Países que pertenezcan a Europa y cuya expectativa de vida esté entre 75 y 85 años
select name, continent, LifeExpectancy from world.country 
	where (continent = 'Europe' and LifeExpectancy between 75 and 85);
    
-- e. Países cuyo gobierno sea República o Monarquía
select name, GovernmentForm from world.country 
	where (GovernmentForm = "Republic" or GovernmentForm = "Monarchy");
    
-- f. Países de África que se independizaron despué de los 50 y cuyo gobierno sea república
select name, IndepYear, GovernmentForm from world.country 
	where (IndepYear >= 1950 and GovernmentForm = "Republic");

/*2. En la base de datos sakila, buscar dónde se encuentran (en qué tabla) y extraer los
siguientes datos:*/
-- a. Todos los actores cuyo nombre no es ‘Tom’ o ‘John’
select first_name from sakila.actor
	where NOT(first_name = "John" and first_name = "Tom");
-- b. Películas que no están en inglés y que tienen una clasificación ‘PG’
select * from sakila.film;
select title from sakila.film 
	where NOT(language_id = 1) and (rating = "PG");
-- c. Películas que son clasificadas como ‘PG’ o ‘G’
select title from sakila.film 
	where (rating = "PG" or rating = "G");
-- d. Alquileres que ocurrieron antes de ‘2005-05-15’ o después de ‘2006-01-01’
select * from sakila.rental
	where (rental_date >= '2005-05-15' or rental_date < 2006-01-01);
-- e. Clientes que tienen un nombre que comienza con ‘A’
select * from sakila.customer were first_name Like 'A%';