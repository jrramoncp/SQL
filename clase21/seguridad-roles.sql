-- == ROLES == -- 
/*
	- Crear el rol
    - Dar permisos al rol
    - Asignar el rol a los usuarios
*/

CREATE ROLE DEVELOPMENT; -- CREAR EL ROL
GRANT SELECT ON ACADEMIA.NOTAS_ALUMNOS TO DEVELOPMENT;  -- ASIGNAR PERMISOS AL ROL
GRANT DEVELOPMENT TO 'desa1'@'%', 'desa2'@'%'; -- ASIGNAR EL ROL A LOS USUARIOS

-- La diferencia entre dar permisos directamente a los usuarios es que el cambio no es inmediato. El usuario tiene que salir y volver a logearse para 
-- tener el rol operativo. 

-- No hay una manera para ver directamente los permisos de un rol. Hay que ejecutar el comando SELECT * FROM MYSQUL.USER; y analizar la tabla resultante


/*DESASIGNAR Y BORRAR ROLES*/

REVOKE SELECT ON ACADEMIA.NOTAS_ALUMNOS FROM DEVELOPMENT; -- quitamos permisos a un rol
REVOKE DEVELOPMENT FROM 'desa1'@'%'; -- quitamos el rol a un usuario

DROP ROLE DEVELOPMENT; -- para eliminar un rol 
