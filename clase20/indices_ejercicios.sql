-- == EJERCICIOS INDICES == -- 
-- Dentro de la base de datos academia
USE academia;
-- 1. Crear un índice llamado i_nombre en la tabla cursos y columna nombre
CREATE INDEX i_nombre ON  CURSOS(NOMBRE);

-- 2. Mostrar los índices de la tabla "cursos"
SHOW INDEXES FROM CURSOS;

-- 3. ¿Por que aparecen dos?
/*POR QUE UNO DE ELLOS ES PRIMARY QUE SE CREA AL CREAR LA TABLA CON LA CONSTRAINT PRIMARY KEY*/

-- 4. Comprobar que el indice se usa al consultar por "nombre"
EXPLAIN SELECT * FROM CURSOS WHERE NOMBRE="CURSO10";

-- 5. Borrar el indice
DROP INDEX i_nombre ON CURSOS;

-- 6. Volver a crearlo pero de tipo único y comprobar que se ha creado. La columna unique debe ser de tipo 0 (unico)
CREATE UNIQUE INDEX i_nombre ON CURSOS(NOMBRE);
SHOW INDEXES FROM CURSOS;

-- 7. Crear la siguiente tabla. Debemos crear los índices en el momento de creación de la tabla. Después.- comprobar la creación de estos indices
CREATE TABLE DATOS(
CODIGO INT PRIMARY KEY,
NOMBRE VARCHAR(50) UNIQUE,
APELLIDOS VARCHAR(50),
INDEX i_nombre_completo (NOMBRE, APELLIDOS));

SHOW INDEXES FROM DATOS;
