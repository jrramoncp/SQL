/*EJERCICIOS DML 1*/
-- 1. Lanzar el siguiente CREATE.
CREATE TABLE `DML`.`coches` ( `matricula` VARCHAR(8) NOT NULL,
`modelo` VARCHAR(45) NOT NULL, `marca` VARCHAR(45) NOT NULL,
`precio` DECIMAL NULL, `fecha_compra` DATE NULL, PRIMARY KEY
(`matricula`));

-- 2.Inserta un par de filas usando las columnas completas
SELECT * FROM coches;
INSERT INTO coches (matricula, modelo, marca, precio, fecha_compra) VALUES ('7723DLR', 'FABIA', 'SCODA', '300', '2024-01-25');

-- 3. Inserta una fila sin usar columnas, solo values
INSERT INTO coches VALUES ('0098FZT', 'POLO', 'VOLSKWAGEN', '900', '2010-04-25');

-- 4. Inserta una fila sin poner los campos null
INSERT INTO coches (matricula, modelo, marca, fecha_compra) VALUES ('6673JTP', 'AURIS', 'TOYOTA', '2010-04-25');

-- 5. Inserta una fila sin una columna NOT NULL, debe generar un error
INSERT INTO coches (matricula, marca, precio, fecha_compra) VALUES ('6673JTP', 'TOYOTA', '200', '2010-04-25');

-- 6. Inserta 2 filas al mismo tiempo
INSERT INTO coches VALUES
('9983MTP', 'IBIZA', 'SEAT', '90000', '2010-04-25'),
('2338LPZ', 'KANGOO', 'RENAULT', '8000', '2010-04-25');

-- 7. Crea una tabla llamada coches2 que sea una copia de coches
CREATE TABLE `DML`.`coches2` ( `matricula` VARCHAR(8) NOT NULL,
`modelo` VARCHAR(45) NOT NULL, `marca` VARCHAR(45) NOT NULL,
`precio` DECIMAL NULL, `fecha_compra` DATE NULL, PRIMARY KEY
(`matricula`));

-- 8. Inserta todas las filas de coches en coches2.
INSERT INTO coches2 SELECT * FROm coches;

-- 9. Modificar todos los coches qwue valgan más de un precio. Aumentamos 1000.
UPDATE coches
	SET Precio = Precio + 1000 where precio > 800;
SELECT * FROM coches;

-- 10. Cambiar el nombre de la marca para que aparezca en mayusculas
-- Mis marcas ya están en mayusculas, lo hago para que aparezcan minusculas
UPDATE coches
	SET marca = LOWER(marca);
    
-- 11. Borrar los coches BMW (No tengo bmw, lo hago con scoda)
DELETE FROM coches WHERE marca = "scoda";

-- 12. Vamos a hacer un replace de la primera fila por otra cualquiera
REPLACE INTO coches (matricula, modelo, marca, precio, fecha_compra)
	VALUES ("0098FZT", "A4", "audi", 2000, "2012-04-28");
	

