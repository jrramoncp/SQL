-- == EJERCICIOS MOTORES ALMACENAMIENTO == --
-- Dentro de la base de datos academia
USE academia;
-- 1. Comprobar los motores de almacenamiento que tenemos disponbles
SHOW ENGINES;
-- 2. Comprobar el motor que esta usando la tabla CURSOS. Debe ser InnoD. 
SHOW TABLE STATUS WHERE NAME = "CURSOS";
SHOW CREATE TABLE CURSOS;

-- 3. Averiguar en que directorio tenemos los datos de las BD y nos posicionamos en ese directorio
SHOW VARIABLES LIKE "%datadir%";

-- 4. Ir al directorio y comprobar que tenemos un directorio academia para nuestra bd
-- 5. Comprobar que las tablas que existen. Deben tener la extension "ibd" ya que todas las que hemos creado son InnoDB
-- 6. Crear una tabla llamada "isam1" de tipo MYISAM con la siguiente estructura
CREATE TABLE isam1 (
CODIGO INT, 
NOMBRE VARCHAR(50),
APELLIDO1 VARCHAR(50), 
APELLIDO2 VARCHAR(50))
engine = myisam;

-- 7. Comprobar que se ha creado en el directorio. Deben existir 3 ficheros
-- 8. Crear otra tabla igual que la anterior denominada csv1  con el motor csv
CREATE TABLE csv1 (
CODIGO INT NOT NULL, 
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO1 VARCHAR(50) NOT NULL, 
APELLIDO2 VARCHAR(50) NOT NULL)
engine = csv;
-- 9. Vemos como aparece en el directorio
-- 10. Insertamos un par de filas a la tablas
INSERT INTO csv1 VALUES (1, 'PEDRO', 'PEREZ', 'PALOMO'),
						(2, 'MARIA', 'MARTINEZ', 'MEDIAVILLA');
-- 11. Abrimos el fichero csv1.csv con algún editor, por ejemplo bloc de notas
-- 12. Si intentamos añadir algun algo o modificar algún valor. ¿Nos deja? NO, a pesar de ser un csv, está protegido, de lo contrario
-- podríamos tener problemas de corrupcion
-- 13. Cambiar el motor de la tabla a InnoDB. Comprobamos que se ha modificado 
alter table csv1 engine = InnoDB;
-- 14. Comprobamos que el resultado es el mismo. Comprobar si tambíen ha cambiado en el directorio de datos
-- 15. Convertirlo a un motor de tipo ARCHIVE y comprobar el resultado
alter table csv1 engine = ARCHIVE;
-- 16. Probar el motor BLACKHOLE, que es para poder comprobar cosas. Permite comandos de tipo INSERT pero realmente no almacenada nada. 
alter table csv1 engine = BLACKHOLE; 
-- 17. Comprobamos que en el directorio de datos no aparece nada
-- 18. Si hacemos una SELECT vemos que no sale nada
SELECT * FROM csv1;
-- 19. Prueba algun insert y comprueba si en realidad los almacena
INSERT INTO csv1 VALUES (1, 'PEDRO', 'PEREZ', 'PALOMO'); -- NO