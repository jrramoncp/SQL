-- == MOTORES DE ALMACENAMIENTO == -- 
/*
- Son los encargados de guardar, gestionar y mantener (en algunos casos) los datos de las tablas que utilizamos.

- Cada motor tiene unas características diferentes que se adaptan a determinadas operaciones

- En el caso de MySQL, disponemos de varios motores que se pueden usar a nivel de base de datos y tambien a nivel de tabla

- En otras bases de datos esto no pasa, solo hay un motor

- Por defecto se usa InnoDB. Soporta transaccionalidad completa, control de concurrencia, etc...  

*/

SHOW ENGINES; -- Para ver los motores de almacenamiento disponibles. 

USE world;
SHOW CREATE TABLE city; -- para ver la creacion de la tabla con todos los datos, incluyendo el motor
SHOW TABLE STATUS WHERE NAME = "city"; -- con este comando tambien vemos info de la tabla, incluyendo el motor

CREATE SCHEMA MOTORES;
USE MOTORES;
CREATE TABLE T1 (ID INT, NOMBRE VARCHAR(100));
SHOW TABLE STATUS WHERE NAME = "T1";
CREATE TABLE T2
(ID INT NOT NULL, 
NOMBRE VARCHAR(100)NOT NULL)
ENGINE = CSV;
SHOW TABLE STATUS WHERE NAME = 'T2';

SHOW VARIABLES LIKE "%datadir%"; -- PARA VER DONDE ESTAN ALMACENADOS LOS DATOS EN EL SISTEMA
ALTER TABLE T2 engine=csv; -- PARA CAMBIAR EL MOTOR DE UNA TABLA, OJO, NO HACER A LA LIGERA, INUTILIZA LA TABLA MIENTRAS DURA EL PROCESO Y SI SON TABLAS GRANDES
						   -- TARDARA UN BUEN RATO. 

-- == TABLAS TEMPORALES == -- 
-- Son tablas que solo existen mientras dura una sesion y solamente puede verlas el usuario que las crea
-- Puede tener el mismo nombre que una tabla permanente que ya exista. Ojo esto puede crear conflicto por que si tenemos dos tablas con el mismo 
-- nombre, cuando intentemos a acceder vamos a acceder a la temporal. 
-- Esto se usa para consultas muy pesadas y complejas que hagamos de forma frecuente. Por ejemplo tipo subconsultas, group by, que requieren mucho 
-- 		tiempo de ejecucion. En tablas pequeñas no lo notamos, pero en tablas con miles de datos, los tiempos de ejecución serán mayores. 

-- Se crean igual que una tabla pero tenemos que utilizar la palabra TEMPORARY


CREATE TEMPORARY TABLE TEMPORAL1(ID INT, CODIGO VARCHAR(100)); 
DESC TEMPORAL1;
INSERT INTO TEMPORAL1 VALUES (1, 'NOMBRE');
SELECT * FROM TEMPORAL1;