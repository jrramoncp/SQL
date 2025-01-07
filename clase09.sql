SELECT * FROM FECHAS;

-- ==== BETWEEN, LIKE, insert ====
/* BETWEEN NOS DEVUELVE LOS DATOS DENTRO DE UN CAMPO ENTRE OTROS DOS DATOS, POR EJEMPLO ENTRE DOS AÑOS. HAY QUE TENER QUE EN CUENTA QUE LOS VALORES CUENTAN
DENTRO DE LA CONSULTA */

SELECT * FROM FECHAS WHERE anio BETWEEN '2000' AND '2005';
SELECT * FROM world.country WHERE INDEPYEAR BETWEEN 1930 AND 2000;

-- TAMBIEN SE PUEDE APLICAR A CADENAS DE CARACTERES, POR QUE SQL ASOCIA CADA CARACTER A UN NÚMERO. 

SELECT * FROM world.country WHERE NAME BETWEEN 'a' AND 'be'; 

/* LIKE NOS PERMITE BUSCAR PATRONES*/
/*
select * from tabla where columna like 'patron'
						  columna like 'a%'; -> Todo lo que empiece con a, da igual el final
                          columna like 'a_'; -> Todo lo que empiece con a, y tenga 2 caracteres
                          columna like '%a'; -> Todo lo que termina por a, da igual el principio
                          columna like 'a_t%'; -> Los datos que empiezan por a, tienen algo en medio, continua con t y da igual el final
                          columna like '%as%; -> Los datos que tengan la combinacion as, en algun lugar en el medio
*/

SELECT * FROM world.country WHERE NAME LIKE 'A_u%';

/*IN ES UNA BUSQUEDA SOBRE UN VECTOR PREDEFINIDO POR NOSOTROS*/

SELECT * FROM world.country WHERE INDEPYEAR IN (1941, 1965, 1956); -- SE HACE ENTRE PARENTESIS Y SE METEN DENTRO LOS DATOS QUE QUERAMOS. 
SELECT * FROM world.country WHERE CONTINENT IN ('Asia'); -- TAMBIEN ES APLICABLE A CADENAS DE CARACTERES

