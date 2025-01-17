/*=== ORDER BY ===*/
/*
1- Sintaxis: 
ORDER BY siempre se encuentra al final de la query. Por ejemplo: 
select first_name, last_name from sakila.actor where last_update > '2006-02-02' order by first_name;

2- Añadiendo las palabras reservadas asc y desc, podemos ordenar por orden ascendente y descendente. 
Ojo si hacemos una consulta con multiples condiciones de ordenzación, tenemos que poner la palabra reservada a la columna sobre la que queramos 
que se ordene. Es decir, si tenemos order by firs_name, last_name, y queremos que se ordene de forma descendente por el first_name, la palabra reservada desc 
iria detras de first_name. Quedaría asi
select * from sakila.actor order by first_name desc, last_name; 

3- Cuando una columna es te tipo enum, el order by ordena los elementos por el orden en el que aparecen y no por orden alfabético. Para saber el ordén en el que 
apareceran los resultados haciendo un table inspector. Una forma de saltarse esta 'restriccion' es usar la funcion cast(columna as char). Una consulta real 
se vería asi: 
select name, continent, region, surface area from world country order by cast(continent as char)

4- Por último, otra de las pecularidades de order by, es que podemos pedirle que ordene por alias de la columna (si se lo damos) y por el número en el que 
aparece la columna en la consulta. Por ejemplo: 

=> Ordenado por alias <=
select name as nombre, continent, region, surfacearea from world.country order by nombre; 

=> Ordenado por numero de aparicion <=
select name, continent, region, surfacearea from world.country order by 4;    --Esto ordenara por surfacearea que es la posicion 4

*/