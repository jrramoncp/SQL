/*==== NULL ====*/
-- Puede venir en cualquier tipo de dato. Los nulos no son nada. El campo esta completamente vacío, ni espacios en blanco, ni 0, ni nada. 
select * from world.country; -- En esta consulta en la columna IndepYear, podemos ver algunos campos null. 

select * from world.country where IndepYear = null; -- Esta consulta no saca datos, por que no se puede igualar a nada por que no es nada. 

select * from world.country where IndepYear IS null; -- Para obtener los campos nulos de una tabla, tenemos que poner IS. 

select * from world.country where IndepYear IS NOT null; -- Poniendo IS NOT, obtenemos lo contrario. Todos los datos que no son nulos. 