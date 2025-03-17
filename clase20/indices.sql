-- == INDICES == --
/*
 - Funcionalidad que nos permite buscar filas de una manera mucho más rapidoa
 - Los indices permiten organizar los datos de forma que podamos buscarlos por la clave del índice
 - Similar a un diccionario. Guardamos la clave y la posición de la fila que posee esa clave o valor
 - Hay que actualizarlos cada vez que modificamos la tabla
 - Tipos de índice: 
	*Primary
    *Unique
    *Index Normal
    *Fulltext
    
- El tipo de almacenamiento depende del tipo de índice:
	* B-TREE es el más habitual. Se suele usar para indices Primary, Unique, Fulltext....
    * R-TREE se utiliza para datos especiales
    * HASH para índices de tablas en memoria

*/

CREATE SCHEMA INDICES;
USE INDICES;

CREATE TABLE DATOS_ALUMNO(
CODIGO INT, 
NOMBRE VARCHAR(50),
APELLIDOS VARCHAR (100),
FECHA DATE);

CREATE INDEX i_apellido ON  DATOS_ALUMNO(APELLIDOS); -- PARA CREAR INDICES

SHOW INDEXES FROM DATOS_ALUMNO; -- PARA VER LOS INDICES EN UNA TABLA

CREATE INDEX i_nombre_completo ON DATOS_ALUMNO(APELLIDOS, NOMBRE); -- Podemos crear indices por multiples filas

EXPLAIN SELECT * FROM DATOS_ALUMNO; -- PARA VER LA EXPLICACION DE UNA CONSULTA
EXPLAIN SELECT * FROM DATOS_ALUMNO WHERE APELLIDOS = "GOMEZ"; 

CREATE TABLE DATOS_ALUMNOS2(
CODIGO INT, 
NOMBRE VARCHAR(50),
DNI VARCHAR(50),
constraint PRIMARY KEY (CODIGO),
constraint UNIQUE (DNI),
INDEX i_nombre (NOMBRE) -- CREANDO UN INDEX EN LA CREACION DE LA TABLA
);

SHOW INDEXES FROM DATOS_ALUMNOS2;

-- CREACION DE INDICES UNIQUE --
CREATE TABLE DATOS3(
CODIGO INT, 
NOMBRE VARCHAR(50), 
DNI VARCHAR(50));

CREATE UNIQUE INDEX i_dni ON DATOS3 (DNI);
SHOW INDEXES FROM DATOS3;

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = "DATOS3";
-- NO PODEMOS CREAR INDICES DE TIPO PRIMARY, YA QUE ESO TIENE QUE VER CON LA CREACIÓN DE LA PROPIA TABLA. 

-- INDICES CON PREFIJO -- 

CREATE TABLE DATOS4(
CODIGO INT, 
NOMBRE VARCHAR(50), 
DNI VARCHAR(50)
);

CREATE INDEX i_nombre ON DATOS4(NOMBRE(15)); -- PARA QUE AFECTE SOLO A LOS PRIMEROS 15 CARACTERES DE LA COLUMNA
EXPLAIN SELECT * FROM DATOS4 WHERE NOMBRE="NOMBRE";

-- ELIMINAR INDICES
SHOW INDEXES FROM DATOS_ALUMNOS2;
DROP INDEX i_nombre ON DATOS_ALUMNOS2;