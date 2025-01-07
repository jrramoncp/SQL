/*EJERCICIOS NULL Y CASE*/
-- 1. Extrae la direccion (address) y direccion2 (address2) donde la direccion2 sea nula en la tabla es address
select address, address2 from sakila.address where address2 is null;

-- 2. Extrae el rental_id, rental_date y return_date para auqellos alquileres que ya tienen fecha de devolucion de la tabla rental
select rental_id, rental_date, return_date from sakila.rental where return_date is not null;

-- 3. Vamos a usar la tabla "category". Con un case vamos a traducir alguna de las categorias, no hace falta todas
select * from sakila.category;
select name,
	case name
		when 'Action' then 'Accion'
		when 'Animation' then 'Animacion'
        when 'Children' then 'Niños'
        when 'Classics' then 'Clasicos'
        when 'Comedy' then 'Comedia'
        when 'Documentary' then 'Documentales'
        when 'Drama' then 'Dramaticas'
        when 'Family' then 'Familiar'
        when 'Foreign' then 'Extrangeras' 
		when 'Games' then 'Videojuegos'
        when 'Horror' then 'Terror'
        when 'Music' then 'Musica'
        when 'New' then 'Nuevas'
        when 'Sci-Fi' then 'Ciencia ficcion'
        when 'Sports' then 'Deportes'
        when 'Travel' then 'Viajes'
	end as 'Categorias traducidas'
from sakila.category;

-- 4. Vamos a usar la tabla payment y la columna amount según las siguientes condiciones:
	-- a) amount <= 0.99 'Barato'
	-- b) amount entre 1 y 4.99 'Medio'
	-- c) amount >= 4.99 'Caro'
    -- d) Para cual otra cosa ponemos Otros valores
    
select amount,
	case 
		when amount <= 0.99 then 'Barato'
        when amount between 1 and 4.99 then 'Medio'
        when amount > 4.99 then 'Caro'
        else 'Otros valores'
	end as Precios
from sakila.payment;

