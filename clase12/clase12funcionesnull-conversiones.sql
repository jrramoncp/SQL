/*=== FUNCIONES DE CONVERSION ===*/
-- Cambia el tipo de dato de cierto dato. Por ejemplo fechas a string Hay muchisimas, mirar documentación para verlas todas. 

SELECT CONVERT(1000, CHAR);
SELECT CONVERT(69.02, DECIMAL);

SELECT str_to_date("01-12-2023", "%d-%m-%Y"); 

SELECT CAST(100 AS char);

/* === FUNCIONES PARA TRABAJAR CON NULOS ===*/
-- Son funciones que nos permiten trabajar con nulos. 
-- IFNULL() -> Cambiar el nulo por lo que le indiquemos, es un IF
SELECT name, continent, IFNULL(IndepYear, 0) FROM world.country;

