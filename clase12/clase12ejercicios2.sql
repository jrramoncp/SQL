-- 1. Visualizar la fecha y hora actual, con 2 funciones diferentes
SELECT CURDATE();
SELECT CURTIME();
-- 2. Visualizar la fecha y hora con una sola función.
SELECT NOW();
-- 3. Añade 25 minutos a la hora actual.
SELECT ADDTIME(CURTIME(), "00:25:00");
-- 4. Añade 24 horas a la fecha actual.
SELECT ADDDATE(NOW(), interval 24 hour);

-- 5. Vamos ahora a usar la tabla “rental”.
-- a. Visualizar rental_date, pero solo la parte de la fecha, quitando la hora
select DATE(rental_date) from sakila.rental;
-- b. Hacer la misma operación pero visualizando el nombre del mes, pero solo para Enero y Mayo de 2005
SELECT monthname(rental_date) from sakila.rental 
	where month(rental_date) = 5 or month(rental_date) = 1 and year(rental_date) = 2005;
SELECT rental_date, monthname(rental_date) from sakila.rental 
	where monthname(rental_date) in("January", "May") and year(rental_date) = 2005; -- corrección 
-- c. Visualizar el nombre del mes, pero traducido al español, usando CASE.
select distinct monthname(rental_date), 
	case monthname(rental_date)
		when "January" then "Enero"
        when "February" then "Febrero"
        when "March" then "Marzo"
        when "April" then "Abril"
        when "May" then "Mayo"
        when "June" then "Junio"
        when "July" then "Julio"
        when "August" then "Agosto"
        when "September" then "Septiembre"
        when "October" then "Octuber"
        when "November" then "Noviembre"
        when "December" then "Diciembre"
	end as "mes_español"
from sakila.rental;
-- d. Visualizar los alquileres que se hayan hecho los sábados y domingos del mes de mayo de 2005
select * from sakila.rental where dayname(rental_date) in ("Saturday", "Sunday") and monthname(rental_date) = "May" and year(rental_date) = 2005;
-- e. Averiguar cuantos días llevas viviendo 
SELECT datediff(NOW(), "1995-09-28");
-- e-2 Si la devolución de una película, tiene que hacerse en 48 horas, calcula cual sería la fecha de
-- devolución prevista de los alquileres
SELECT rental_date, addtime(rental_date, "48:00:00") as fecha_devolucion_prevista from sakila.rental;
-- f. Poner el siguiente formato a la fecha y hora actual. Esto es un ejemplo, debe salir la fecha real o Fecha de factura: Friday, dia 06 del mes de
-- January del año 2023
select date_format(curdate(), "Fecha de factura: %W dia %d del mes de %M del año %Y");
