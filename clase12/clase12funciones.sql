/*==== FUNCIONES DE TIPO STRING ==== */
/*ESTAS FUNCIONES NOS PERMITEN HACER OPERACIONES CON CADENAS DE CARACTERES

FUNCION								DESCRIPCION
------------------------------------------------
UPPER								CONVIERTE UN STRING A MAYÚSCULAS
LOWER								CONVIERTE UN STRING A MINÚSCULAS
LENGTH								DEVUELVE LA LONGITUD DE UN STRING EN BYTES
CONCAT								NOS PERMITE UNIR CADENAS DE CARACTERES
LTRIM								ELIMINA LOS ESPACIOS EN BLANCO A LA IZQUIERDA
RTRIM								ELIMINA LOS ESPACIOS EN BLANCO A LA DERECHA
LOCATE								DEVUELVE LA POSICION DE UNA CADENA DENTRO DE OTRA CADENA
SUBSTR								EXTRAE UN STRING DE OTRO STRING
REPEAT								REPITE UNA CADENA DE CARACTERES UN NUMERO INDICADO DE VECES
------------------------------------------------
*/
-- UPPER Y LOWER
SELECT UPPER(NAME) as Nombre, CONTINENT, REGION FROM world.country; 

-- LENGTH
select upper(name) as Nombre, lower(continent) as Continente, length(region) as "Longitud en bytes" from world.country;

-- CONCAT
select actor_id,concat(first_name,' ',last_name) as 'Nombre completo' from sakila.actor;
select actor_id,lower(concat(first_name,' ',last_name)) as 'Nombre completo' from sakila.actor;

-- LTRIM Y RTRIM
select ltrim("           conquer blocks");
select rtrim("conquer blocks				");

-- LOCATE
select locate("blocks", "conquer blocks");
select name from world.country where locate('H', NAME) != 0;

-- SUBSTR
select name, substr(name, 1, 1) as 'Primera letra' from world.country;

-- REPEAT

select repeat("Hola", 4);