-- == CONSTRAINTS PARTE 2== --
-- ** FOREIGN KEY ** -- 
-- Permite enlazar dos tablas, de manera que se guarda la integridad entre las dos tablas
-- Una clave ajena es uno o varios campos que se relacionan con la clave primaria (PRIMARY KEY) de otra tabla
-- Relaciones maestro-detalle -> la tabla hija depende de la tabla padre

USE RESTRICCIONES;

CREATE TABLE CLIENTES(
CODIGO INT PRIMARY KEY,
NOMBRE VARCHAR(100));

CREATE TABLE PEDIDOS(
COD_PEDIDO INT PRIMARY KEY, 
PRECIO DECIMAL, 
FECHA DATE, 
COD_CLIENTE INT,
FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTES(CODIGO) -- AQUI CREAMOS Y RELACIAMOS LAS DOS TABLAS
);

INSERT INTO CLIENTES VALUES (1, "JUAN");
INSERT INTO CLIENTES VALUES (2, "PEPE");
INSERT INTO CLIENTES VALUES (3, "PACO");
INSERT INTO CLIENTES VALUES (4, "JOSE");

INSERT INTO PEDIDOS VALUES(1, 3, "2024-02-02",7); -- NO PUEDO CREAR UN INSERT DE UN CLIENTE QUE NO EXISTA EN LA TABLA PADRE
INSERT INTO PEDIDOS VALUES(1, 3, "2024-02-02",1);
INSERT INTO PEDIDOS VALUES(2, 20, "2024-02-28",1);	

DELETE FROM CLIENTES WHERE CODIGO = 1; -- NO PODRIAMOS BORRAR UNA FILA, SI TIENE FILAS HIJAS EN OTRA TABLA
DROP TABLE CLIENTES; -- TAMPOCO PODRIAMOS BORRAR LA TABLA ENTERA CUANDO ESTA ASOCIADA A OTRA TABLA









								