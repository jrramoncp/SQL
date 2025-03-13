-- == EJERCICIOS CONSTRAINTS == -- 
-- DENTRO DE LA BASE DE DATOS RESTRICCIONES.
USE RESTRICCIONES;
-- 1. Crear una tabla llamada fabricantes que tenga la siguiente estructura
CREATE TABLE FABRICANTES(
CODIGO INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDOS VARCHAR(50),
EDAD INT,
FECHA_ALTA DATE);

-- 2. Hacer un desc de la tabla para ver sus propiedade y comprobamos dque tenemos la PRIMARY KEY y el AUTO_INCREMENT
DESC FABRICANTES;

-- 3. Insertar un par de filas en la tabla para ver el auto increment
INSERT INTO FABRICANTES (NOMBRE, APELLIDOS, EDAD, FECHA_ALTA) VALUES ('PEDRO', 'PEREZ', 18, '2025-01-01');
INSERT INTO FABRICANTES (NOMBRE, APELLIDOS, EDAD, FECHA_ALTA) VALUES ('MARIA', 'ARTES', 20, '2025-02-15');
SELECT * FROM FABRICANTES;

-- 4. Modificar el campo auto incremente para que comience ahora desde 1000. 
ALTER TABLE FABRICANTES AUTO_INCREMENT = 1000;

-- 5. Insertar otro par de filas para comprobar el resultado
INSERT INTO FABRICANTES (NOMBRE, APELLIDOS, EDAD, FECHA_ALTA) VALUES ('JUAN', 'JIMENEZ', 25, '2025-03-01');
INSERT INTO FABRICANTES (NOMBRE, APELLIDOS, EDAD, FECHA_ALTA) VALUES ('MARTA', 'MARTIN', 22, '2025-04-18');
SELECT * FROM FABRICANTES;

-- 6. Crear una clave unica a nivel de tabla para las columnas nombre y apellidos, la llamamos nombre_completo.
ALTER TABLE FABRICANTES ADD CONSTRAINT NOMBRE_COMPLETO UNIQUE (NOMBRE, APELLIDOS);

-- 7. Hacer un desc para comprobar, debe poner MUL para indicar que es una clave multiple
DESC FABRICANTES;

-- 8. Comprobar las constraints de la tabla con information_schema.table_constraints
SELECT * FROM information_schema.table_constraints WHERE table_schema = "RESTRICCIONES" and table_name = "FABRICANTES";

-- 9. Crear una tabla TANQUES con la siguiente estructura y despues comprobar con DESC
CREATE TABLE TANQUES(
 CODIGO INT PRIMARY KEY AUTO_INCREMENT,
 NOMBRE VARCHAR(50) NOT NULL,
 PAIS VARCHAR(50) NOT NULL DEFAULT("DESCONOCIDO"),
 LONGITUD INT NOT NULL DEFAULT(0),
 PESO INT DEFAULT(5600),
 PESO_ARMADO INT);
 
 DROP TABLE TANQUES;
 
-- 10. Añadir las siguientes filas y comprobar que se han insertado
insert into TANQUES (nombre,pais,longitud,peso,peso_armado) values
('Lepoard A','Alemania',9.67,62000,65000);
insert into TANQUES (nombre,pais,longitud,peso,peso_armado) values
('Lepoard E','España',9.67,62000,65000);
insert into TANQUES (nombre,pais,longitud,peso,peso_armado) values
('T-90M','Rusia',9.63,46000,48000);
insert into TANQUES (nombre,pais,longitud,peso,peso_armado) values
('Leclerc','Francia',10.6,56000,73000);
insert into TANQUES (nombre,pais,longitud,peso,peso_armado) values
('Merkava Mk.4','Israel',9.04,65000,73000);

SELECT * FROM TANQUES;

-- 11 Añadir una constraint UNIQUE en la columna nombre_tanque
ALTER TABLE TANQUES ADD CONSTRAINT NOMBRE_TANQUE UNIQUE (NOMBRE);

-- 12. Comprobar que se ha creado la restriccion
DESC TANQUES;

-- 13. Itenta añadir alguna de las filas anteriores, Debe generar un error por que aunque genera una nueva key con el incremente, la clave unica debe fallar
insert into TANQUES (nombre,pais,longitud,peso,peso_armado) values
('Merkava Mk.4','Israel',9.04,65000,73000);

-- 14. Inserta una nueva fila dejando los default por defecto
INSERT INTO TANQUES (nombre, peso_armado) values ('Leopard F', 75000);
SELECT * FROM TANQUES;

-- 15. Cambiar default value de longitud a 0 e insertar otra fila para comprobarlo
ALTER TABLE TANQUES MODIFY LONGITUD INT DEFAULT(1);
INSERT INTO TANQUES (nombre, peso_armado) values ('Leopard G', 75000);

-- 16. Crear una constraint de tipo CHECK donde el peso armado no puede ser inferior al peso  lo llamos control peso
ALTER TABLE TANQUES ADD CONSTRAINT CONTROL_PESO CHECK (PESO_ARMADO > PESO);

-- 17. Comprobar las constraints
SELECT * FROM information_schema.table_constraints WHERE table_schema = "RESTRICCIONES" and table_name = "TANQUES";

-- 18. Insertar una fila para comprobar que funciona y no deja insertarlo
insert into TANQUES (nombre,pais,longitud,peso,peso_armado) values
('Merkava Mk.5','Israel',9.04,65000,7300);

-- 19. Crea la siguiente tabla
CREATE TABLE PAISES(
NOMBRE_PAIS VARCHAR(50) PRIMARY KEY,
DESCRIPCION VARCHAR(150));

-- 20. Intenta crear una clave ajena entre tanques y países de forma que el país de Tanques sea foreing key de la columna nombre_pais de las tablas paises
-- ¿Funciona?

ALTER TABLE TANQUES ADD CONSTRAINT CLAVE_AJENA FOREIGN KEY (PAIS) REFERENCES PAISES(NOMBRE_PAIS);

-- 21. INSERTA LOS VALORES NECESARIOS
INSERT INTO PAISES (NOMBRE_PAIS) VALUES ("Alemania");
INSERT INTO PAISES (NOMBRE_PAIS) VALUES ("España");
INSERT INTO PAISES (NOMBRE_PAIS) VALUES ("Rusia");
INSERT INTO PAISES (NOMBRE_PAIS) VALUES ("Francia");
INSERT INTO PAISES (NOMBRE_PAIS) VALUES ("Israel");
INSERT INTO PAISES (NOMBRE_PAIS) VALUES ("DESCONOCIDO");

-- 22. Intentar de nuevo crear la foreign key, ahora deberia funcionar
ALTER TABLE TANQUES ADD CONSTRAINT CLAVE_AJENA FOREIGN KEY (PAIS) REFERENCES PAISES(NOMBRE_PAIS);

-- 23. Insertar una fila con un pais que no exista para que genere error
insert into TANQUES (nombre,pais,longitud,peso,peso_armado) values
('Merkava Mk.4','Peru',9.04,65000,73000);

-- 24. Borrar la restriccion de tipo check que creamos antes denominada control peso
ALTER TABLE TANQUES DROP CONSTRAINT CONTROL_PESO;
SELECT * FROM information_schema.table_constraints WHERE table_schema = "RESTRICCIONES" and table_name = "TANQUES";

-- 25. Borrar el default de la columna longitud y comprobar que ha desaparecido
ALTER TABLE TANQUES MODIFY LONGITUD INT;
DESC TANQUES;
