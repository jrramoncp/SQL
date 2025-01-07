/*EJERCICIOS NULL Y CASE*/
-- 1. Extrae la direccion (address) y direccion2 (address2) donde la direccion2 sea nula en la tabla es address
select address, address2 from sakila.address where address2 is null;

-- 2. Extrae el rental_id, rental_date y return_date para auqellos alquileres que ya tienen fecha de devolucion de la tabla rental
select rental_id, rental_date, return_date from sakila.rental where return_date is not null;

-- 3. Vamos a usar la tabla "category". Con un case vamos a traducir alguna de las categorias, no hace falta todas
select * from sakila.category;
select name,
	case 
		when 'Action' then 'Accion'
		when 'Animation' then 'Animacion'
        when 'Children' then 'Niños'
        when 'Classics' then 'Clasicos'
        when 'Comedy' then 'Comedia'
        when 'Documentary' then 'Documentales'
        when 'Drama' then 'Dramaticas'
        when 'Family' then 'Familiar'
        when 'Foreign' then 'Extrangeras' 
		