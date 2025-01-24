/*
=== FUNCIONES DE FECHA Y DE TIEMPO ===
Son las funciones que nos van a permitir trabajar con fechas y tiempos.  			
*/

-- CURRENT_DATE / CURDATE -> Devolver la fecha actual
SELECT CURDATE();

-- CURRENT_TIME / CURTIME -> Devolver la hora actual
SELECT CURTIME();

-- NOW -> Devuelve fecha y hora actuales
SELECT NOW();

-- DATE() -> Devolver una fecha dado un parámetro de entrada de tipo string
SELECT DATE('2023-11-01');

-- ADDDATE -> Añade un intervalo de fecha/hora a otra fecha
SELECT ADDDATE('2023-04-01', interval 31 day);
SELECT ADDDATE('2023-04-01', interval 1 year);
SELECT ADDDATE('2023-04-01', interval 3 month);
-- ADDTIME -> Añade un intervalo de hora a una fecha o una hora
SELECT ADDTIME(now(), '1:00:00');

-- DAY -> Día del mes, MOTH -> Mes del año, YEAR -> Año
SELECT DAY(now());
SELECT MONTH(now());
SELECT YEAR(now());

-- DAYNAME -> Nombre del dia, MONTHNAME -> Nombre del mes
SELECT DAYNAME(now());
SELECT MONTHNAME(now());

-- WEEK() -> El número de semana
SELECT WEEK(NOW());

-- MINUTE -> Los minutos exactos, HOUR -> La hora exacta
SELECT MINUTE(NOW());
SELECT HOUR(NOW());

-- DATEDIFF -> Calula la diferencia de fechas en dias
SELECT DATEDIFF('2025-12-31', now());

/*
=== FORMATEADO DE FECHAS ===
*/

-- DATE_FORMAT -> Formatea las fechas, ver documentacion, hay muchisimas formas de formatear fechas
select DATE_FORMAT(NOW(), "%d/ %m / %y");
select DATE_FORMAT(NOW(), "%D/ %M / %y");
select DATE_FORMAT(NOW(), "%a/ %M / %y");
select DATE_FORMAT(NOW(), "%W/ %m / %Y");

-- TIME_FORMAT -> Funciona igual que date_format
SELECT TIME_FORMAT(CURTIME(), "%h : %i : %s - %p");