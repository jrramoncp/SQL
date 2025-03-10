/*=== TRANSACCIONES ===*/

-- Una transacción es una unidad lógica de trabajo que esta formada por uno o varios comandos SQL. 
-- Estos comandos van a alterar la base de datos (INSERT, UPDATE...) 
-- Las transacciones son atómicas. Esto quiere decir que, o se graban todas las sentencias SQL o se desacen todas
-- Existen mecanismos automaticos para grabar cada sentencia que se realiza (autocommit)+
-- También existen mecanismos manuales que permiten mayor flexibilidad
-- Comando para confirmar una transacción: COMMIT
-- Comando para deshacer una transacción: ROLLBACK
-- Existen algunos comandos de SQL que llevan implícito siemre un COMMIT, por lo tanto, no pueden deshacerse con un ROLLBACK. 
-- Para comenzar una transacción se suelen utilizar los siguientes comandos, aunque no sea necesario: 
-- SET TRASACTION
-- BEGIN
-- Para terminar, se utiliza: 
-- COMMIT
-- ROLLBACK
-- En glaunas ocasiones, tambíen se  soportan comandos como:
-- SAVEPOINT
-- ROLLBACK TO SAVEPOINT
-- RELEASE SAVEPOINT

SHOW VARIABLES LIKE 'autocommit'; -- Comando para ver si tenemos activado el autocommit
SET AUTOCOMMIT = 0; -- Comando para desactivar el autocommit
SHOW ENGINES; -- Para ver los motores de almacenamiento

