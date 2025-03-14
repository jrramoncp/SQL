-- == UPDATABLE VIEWS == --
/*
   - Permiten insertar, actualizar y borrar datos en las tablas que hay bajo la vista. Es decir que podemos modificar la tabla sobre la que hemos creado la vista.
   
   - Existen una serie de condiciones / restricciones: 
			- No podemos tener funciones de agregacion (min, max, etc)
            - No podemos tener GROUP BY
            - No podemos tener DISTINC
            - No podemos tener uniones de tabla 
            - No podemos tener subconsultas

*/

CREATE SCHEMA VISTAS;
USE VISTAS;

CREATE TABLE TABLA_VISTA(
CODIGO INT PRIMARY KEY, 
NOMBRE VARCHAR(100) NOT NULL);

CREATE OR REPLACE VIEW VISTA AS 
SELECT * FROM TABLA_VISTA;

SELECT * FROM VISTA; 
-- Inserción a través de la tabla
INSERT INTO TABLA_VISTA VALUES (1, 'PACO');
INSERT INTO TABLA_VISTA VALUES (2, 'MARIA');

-- Inserción a través de la vista
INSERT INTO VISTA VALUES (3, 'LAURA');

-- Borrar a través de la vista
DELETE FROM VISTA WHERE CODIGO = 3;

-- Modificar a través de la vista
UPDATE VISTA SET NOMBRE = "CONQUER" WHERE CODIGO = 1;

-- VISTAS NO UPDATABLES
-- Cuando no tenemos suficientes columnas definidas. 
CREATE OR REPLACE VIEW VISTA1 AS
SELECT NOMBRE FROM TABLA_VISTA;

SELECT * FROM VISTA1;

INSERT INTO VISTA1 VALUES ("PEDRO"); -- AL NO TENER TODAS LAS COLUMNAS, NO NOS DEJA INSERTAR DESDE LA VISTA. 

-- Cuando no cumplimos con las restricciones que pusimos al principio
CREATE OR REPLACE VIEW VISTA2 AS
SELECT NOMBRE, COUNT(*) FROM TABLA_VISTA
GROUP BY NOMBRE;

SELECT * FROM VISTA2;

INSERT INTO VISTA2 VALUES ('RAUL', 20);

