/* ==== CASE ==== */
-- Case nos permite pasarle un valor y poner diferentes condiciones, esto se pone en el SELECT. Es parecido a como se haria en otros lenguajes. 
/* -- SINTAXIS --
CASE case_valor
	WHEN when_valor THEN x
    WHEN when_valor2 THEN y
    
    ELSE z
END CASE
*/

-- EJEMPLO -- 

select Continent,
	case continent
		when 'Asia' then 'Continente Asiatico'
        when 'Europe' then 'Continente Europeo'
        when 'South America' then 'America'
        else 'Continente desconocido'
	End AS 'Continente en español'
from world.country;

-- Esto es más útil de lo que parece. Por que hay otro tipo de CASE con expresiones. 
/*
CASE
	WHEN condicion THEN comandos
    WHEN condicion THEN comandos
    ELSE comandos
END CASE  
*/

select name, region, population,
	case 
		when population > 2000000 then 'Grande'
        when population between 1000000 and 2000000 then 'Mediana'
        when population > 500000 then 'Pequeña'
        else 'Muy pequeña'
	end as 'Tamaño poblacion'
from world.country;

		