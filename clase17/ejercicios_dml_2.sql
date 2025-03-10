-- EJERCICIOS TRANSACCIONES --
-- USANDO LA BASE DE DATOS ACADEMIA
-- 1. Quitar el autocommit. Comprobar que ha funcionado
SET AUTOCOMMIT = 0;
SHOW VARIABLES LIKE 'autocommit';
-- 2. Vemos las filas existentes
SELECT * FROM ALUMNOS;
-- 3. Insertamos un par de filas usando las columnas completas
INSERT INTO ALUMNOS (CODIGO, NOMBRE, EDAD, FECHA_MATRICULA) VALUES (9999, 'BARTOLO', 40, '2024-01-25');
INSERT INTO ALUMNOS (CODIGO, NOMBRE, EDAD, FECHA_MATRICULA) VALUES (9998, 'MARIA FERNANDA', 55, '2024-01-25');
-- 4. Comprobamos que están
SELECT * FROM ALUMNOS;
-- 5. Hacemos un ROLLBACK y comprobamos de nuevo
ROLLBACK; 
SELECT * FROM ALUMNOS;
-- 6. Volvemos a insertarlas y hacemos un COMMIT
COMMIT;
-- 7. Intentar hacer un ROLLBACK. ¿funciona? -> NO
ROLLBACK;
SELECT * FROM ALUMNOS;
-- 8. Ahora vamos a hacer una transacción con START TRANSACTION.
-- a. Insertamos una fila
-- b. Borramos otra
START TRANSACTION;
	INSERT INTO ALUMNOS (CODIGO, NOMBRE, EDAD, FECHA_MATRICULA) VALUES (9997, 'LUCRECIA', 30, '2024-01-25');
    DELETE FROM ALUMNOS WHERE CODIGO = 9998;
COMMIT;
-- 9. Hacemos un Rollback y comprobamos que se ha deshecho la transacción
ROLLBACK; 
SELECT * FROM ALUMNOS;
-- 10. Volvemos a lanzar la transacción pero con COMMIT y comprobamos que ha funcionado
SELECT * FROM ALUMNOS;
-- 11. Vamos a hacer ahora un Rollback parcial
-- a. Insertamos una fila
-- b. Ponemos un SAVEPOINT
-- c. Borramos otra
-- d. Modificamos otra
START TRANSACTION;
	INSERT INTO ALUMNOS (CODIGO, NOMBRE, EDAD, FECHA_MATRICULA) VALUES (9998, 'MARIA FERNANDA', 55, '2024-01-25');
    SAVEPOINT PASO2;
    DELETE FROM ALUMNOS WHERE CODIGO = 9999;
    UPDATE ALUMNOS SET EDAD = 35 WHERE CODIGO = 9997;
    ROLLBACK TO RETORNO;
-- 12. Truncamos la tabla coches para que quede vacía
TRUNCATE TABLE coches;
-- 13. Volvemos a poner el autocommit
SET AUTOCOMMIT = 1;
