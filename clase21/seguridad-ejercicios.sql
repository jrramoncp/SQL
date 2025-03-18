-- == EJERCICIOS == --
-- A. USUARIOS
-- 1. Conectarse desde el usuario root desde el terminal. Crear un usuario llamado “usu1” que pueda conectarse desde cualquier host. Comprobar después que
-- el usuario se ha creado correctamente.
CREATE USER 'Usu1'@'%' IDENTIFIED BY 'Prueba123@';
-- 2. Abrir una segunda sesión de mysql y conectarnos con el usuario recién creado.
/*mysql -u usu1 -p*/
-- 3. Crear un usuario llamado “usu2” sin ningún host asociado. Comprobar que se ha creado correctamente. ¿Qué host le ha puesto por defecto?
CREATE USER 'usu2' IDENTIFIED BY 'Prueba123@';
SELECT * FROM mysql.user;  
/*Host como si lo crearamos por defecto*/
-- 4. Cambiar la password al usu1.
SET PASSWORD FOR 'usu1'@'%' = 'Password123@';
-- 5. Cambia de diferente forma la password al usu2.
ALTER USER 'usu2'@'%' IDENTIFIED BY 'Password123@';
-- 6. Borra el usu2.
DROP USER 'usu2'@'%';

-- B. PERMISOS
-- 1. Trabajamos con el usuario “usu1” que hemos creado en el apartado anterior y vamos a tener 2 sesiones abiertas, una como usuario de tipo root y el otro con
-- el usuario “usu1”. Desde “usu1”, intentar leer la tabla cursos de la base de datos “academia”.
/*  NO SE PUEDE POR QUE NO TENEMOS PERMISOS*/
-- 2. Dar permisos de SELECT sobre la tabla al usu1. Comprobar que ahora puede hacer una SELECT.
GRANT SELECT ON academia.CURSOS TO 'usu1'@'%';
-- 3. Intentar hacer un delete del curso12.
/*NO SE PUEDE PORQUE NO TENEMOS PERMISOS*/
-- 4. Dar permisos para que lo pueda hacer.
GRANT DELETE ON academia.CURSOS TO 'usu1'@'%';
-- 5. Dar permisos de SELECT sobre las columnas nombre y apellidos de la tabla ALUMNOS al usuario “usu1” . Comprobar que solo puede leer esas columnas.
GRANT SELECT(NOMBRE, APELLIDOS) ON academia.ALUMNOS TO 'usu1'@'%';
-- 6. Comprobar los permisos que tiene usu1.
SHOW GRANTS FOR 'usu1'@'%';
-- 7. Dar todos los permisos sobre la base de datos academia a “usu1”. Comprobar Los permisos.
GRANT ALL ON academia.* to 'usu1'@'%';
-- 8. Ahora, quitar solo el permiso de SELECT sobre la columna nombre de la tabla ALUMNOS. ¿Qué ocurre?
REVOKE SELECT(NOMBRE) ON academia.alumnos from 'usu1'@'%'; 

-- C. ROLES
-- 1. Crear dos usuarios (‘Test1’@’%’, ‘Test2’@’%’)con la password de vuestra preferencia y comprobar que se han creado.
create user 'Test1'@'%' identified by 'Prueba123@';
create user 'Test2'@'%' identified by 'Prueba123@';

-- 2. Abrir una sesión en el terminal con el usuario Test1 e intentar entrar en la base de datos academia.
/* ERROR 1044 (42000): Access denied for user 'Test1'@'%' to database 'academia' */
-- 3. Crear un rol llamado: testing
CREATE ROLE testing;
-- 4. Crear el privilegio para hacer SELECT sobre la tabla CURSOS y asignarlo al rol. Visualizar estos permisos.
GRANT SELECT ON academia.CURSOS TO testing;
SHOW GRANTS FOR testing;
-- 5. Asignar el rol a los usuarios creados.
GRANT testing TO 'Test1'@'%';
GRANT testing TO 'Test2'@'%';
-- 6. Activar los roles y comprobar si se puede acceder a la tabla cursos.
SET DEFAULT ROLE ALL TO 'Test1'@'%';
-- 7. Ver los roles existentes.
SELECT * FROM mysql.user;
