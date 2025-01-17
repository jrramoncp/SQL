
-- 1. En la tabla empleados, visualizar los siguientes datos:
-- a. Visualizar los nombres de los empleados que tengan más de 10 letras
select first_name, last_name from sakila.staff where length(first_name) > 10;
-- b. Visualizar el nombre y apellido1 de los empleados que tengan la misma longitud
select first_name, last_name from sakila.staff where length(first_name) = length(last_name);
-- c. Visualizar el nombre y los apellidos en un único campo
select concat(first_name, " ", last_name) as "Nombre completo!" from sakila.staff;
-- d. Visualizar las iniciales del nombre y los apellidos. Por ejemplo: Yolanda López Guillén debe aparecer como Y.L.G
select concat(substr(first_name, 1, 1),".",substr(last_name, 1, 1)) from sakila.staff;
-- e. Visualizar el nombre de los empleados que tengan una ‘a’ sin usar LIKE. Utiliza la función LOCATE.
select first_name, last_name from sakila.staff where locate('a', first_name) != 0;
-- f. Visualiza el nombre y la última letra del nombre
select first_name, substr(first_name, length(first_name)) as 'Ultima letra' from sakila.staff;
-- g. Visualiza el nombre y la última letra del nombre, pero sólo si esta última letra es una vocal
select first_name, substr(first_name, length(first_name)) as 'Ultima letra' from sakila.staff where substr(first_name, length(first_name)) 'e';
-- h. Extraer del correo del empleado solo una parte del nombre. Elimina lo que hay desde el ‘@’ hasta el final.

select substr(email,1, length(concat(first_name, ".", last_name))) from sakila.staff;
