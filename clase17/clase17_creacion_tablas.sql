-- == CREAR TABLAS == --

USE DML;

CREATE TABLE PROVEEDORES(
COD_PROV INT,
NOMBRE VARCHAR(45),
DIRECCION VARCHAR(100),
FECHA_ALTA DATE);

DESC PROVEEDORES; -- PARA VER INFORMACIÓN DE LA TABLA 

CREATE TABLE IF NOT EXISTS PROVEEDORES(  -- con if not exists nos aseguramos de que si la tabla existe, no se pare la ejecuçion
COD_PROV INT,
NOMBRE VARCHAR(45),
DIRECCION VARCHAR(100),
FECHA_ALTA DATE);

/* MODIFICAR TABLAS -> añadir columnas, modificar columnas y renombrar columnas
-- 	ALTER TABLE -> Permite añadir columnas, borrarlas, modificar las existentes y añadir restricciones(constrains) 
		SINTAXIS: 
        -- añadir columna:
        ALTER TABLE tabla ADD columna tipo
        ALTER TABLE tabla ADD columna tipo AFTER columna; -> CREA UNA COLUMNA DETRAS DE OTRA
        ALTER TABLE tabla ADD columna tipo FIRST -> CREA UNA COLUMNA EN PRIMERA POSICION
        
        -- borrar columna:
        ALTER TABLE tabla DROP columna
        
        -- modificar columna existente
        ALTER TABLE tabla MODIFY columna tipo
        ALTER TABLE tabla CHANGE COLUMN nombre_antiguo nombre_nuevo tipo;
        
*/
DESC PROVEEDORES;

ALTER TABLE PROVEEDORES ADD FECHA_MODIFICACION DATE; -- añadiendo una columna
ALTER TABLE PROVEEDORES ADD COD_PRODUCTO INT AFTER COD_PROV; -- añadiendo columna despues de otra
ALTER TABLE PROVEEDORES ADD FECHA_COMPRA DATE FIRST; -- añadiendo una columna en primera posicion
ALTER TABLE PROVEEDORES ADD TELEFONO INT; 

ALTER TABLE PROVEEDORES DROP FECHA_MODIFICACION; -- borrando una columna, si fuera clave primaria no podriamos borrarla

ALTER TABLE PROVEEDORES MODIFY FECHA_ALTA TIMESTAMP; -- modificando una columna (tipo de dato)
ALTER TABLE PROVEEDORES MODIFY TELEFONO DECIMAL AFTER DIRECCION; -- modificando una columna (posicion), siempre hay que incluir el tipo

ALTER TABLE PROVEEDORES MODIFY TELEFONO INT AFTER DIRECCION, 
						MODIFY FECHA_COMPRA DATE AFTER FECHA_ALTA; -- modificanto varias columnas a la vez

INSERT INTO PROVEEDORES VALUES('2024-01-01', 1, 1, 'Proveedor1', 'Direccion1', now()); -- insertando datos

ALTER TABLE PROVEEDORES MODIFY DIRECCION DECIMAL; -- Da error por que ya tiene información que no es compatible con lo que tenemos que introducir

ALTER TABLE PROVEEDORES CHANGE COLUMN COD_PROV COD_PROVEEDOR INT FIRST; -- Cambiando el nombre a una columna, funciona igual que modify en el sentido de posicionamiento

-- == COLUMNAS AUTOGENERADAS == -- 
/*Las columnas nos permiten crear una columna cuyo valor se genere automaticamente en cada inserción
Se crean añadiendo ALWAYS GENERATED AS en la creación de la tabla, y las instrucciones 
*/

CREATE TABLE CLIENTES(
COD_CLIENTE INT,
NOMBRE VARCHAR(30) ,
APELLIDO1 VARCHAR(30),
APELLIDO2 VARCHAR(30),
NOMBRE_COMPLETO VARCHAR(100) GENERATED ALWAYS AS (CONCAT(NOMBRE, " ", APELLIDO1, " ", APELLIDO2, "  ")));

DESC CLIENTES;

INSERT INTO CLIENTES (COD_CLIENTE, NOMBRE, APELLIDO1, APELLIDO2) VALUES (1, 'Juan', 'Lopez', 'Garcia');

SELECT * FROM CLIENTES;

-- == RENOMBRAR Y MOVER TABLAS == -- 
/*
Puede ser que a la hora de haber creado la tabla queramos cambiar el nombre, para esto tenemos el comando RENAME TABLE
SINTAXIS: 
RENAME TABLE nombre TO nombre_nuevo

Tambien es posible trasladar una tabla de una base de datos a otra:

RENAME TABLE nombre TO nombre_bd.nombre_nuevo

Esta operación es útil, pero es costosa a nivel de rendimiento, si la tabla tiene mucha información tendria que mover muchismos datos

*/

RENAME TABLE PROVEEDORES TO PROVEEDOR;
RENAME TABLE CLIENTES TO CLIENTE; 
RENAME TABLE PROVEEDOR TO OP_CONJUNTOS.PROVEEDOR;

-- == BORRAR TABLAS == --
/*Nuevamente hay que tener muchisima precaución con esto, ya que es una operación muy facil, y podemos borrar cosas importantes y generar problemas
-- DROP TABLE tabla
-- DROP TABLE IF EXISTS tabla
-- DROP TABLE IF EXISTS tabla CASCADE --> EN SQL NO FUNCIONA, pero en otros sistemas borra tabla y descendientes, no hace falta decir lo peligroso que es esto

*/
DROP TABLE CLIENTE;
DESC CLIENTE;


