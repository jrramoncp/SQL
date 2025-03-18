-- == PRIVILEGIOS Y PERMISOS == --
/*
	Un privilegio es un permiso que se puede asignar a un rol o usuario para llevar a cabo algunas operaciones. 
    Tipos de permisos: 
			- GLOBALES -> Tienen permiso sobre todas las bases de datos
            - BASE DE DATOS -> Se puede asignar un permiso sobre una base de datos en concreto
            - TABLA -> Se puede asignar un permiso sobre una tabla concreta de una base de datos
            - COLUMNA -> Se puede asignar un permiso para una columna en concreto
            - PROCEDIMIENTOS Y FUNCIONES ALMACENADAS -> El menos habitual. 
            
	Comandos básicos para asignación de permisos: 
			-GRANT -> Otorga permisos a usuarios y roles
            -REVOKE -> Elimina permisos a usuarios y roles
            
	
    ROLES
    Son un conjunto de permisos, y optimizan la asignación de permisos a ciertos conjuntos de usuarios. 
    Facilita la asignacion de permisos. 
			 
*/

/*-- Privilegios a nivel de tabla -- */
GRANT SELECT ON ACADEMIA.CURSOS TO 'usuario1'@'%';  -- Otorga permiso para hacer querys 
GRANT UPDATE, INSERT ON ACADEMIA.CURSOS TO 'usuario1'@'%'; -- Otorga permisos de update y insert

/*PRIVILEGIOS A NIVEL GLOBAL Y DE BASE DE DATOS*/
GRANT ALL ON *.* TO 'usuario1'@'%'; -- Otorga todos los permisos en todas las bases de datos
GRANT ALL ON academia.* TO 'usuario1'@'%'; -- Otorga todos los permisos en una bd en concreto

/*PRIVILEGIOS A NIVEL DE COLUMNA*/
-- GRANT PRIVILEGIO(COL1), PRIVILEGIO(COL2, COL1) ON TABLA TO USUARIO;
GRANT SELECT(NOMBRE, DURACION) ON ACADEMIA.ASIGNATURAS TO 'usuario1'@'%';

SHOW GRANTS FOR 'usuario1'@'%'; -- Nos permite ver los permisos que tiene un usuario

SELECT * FROM information_schema.table_privileges WHERE TABLE_NAME = 'CURSOS'; -- Para ver los permisos que hay sobre una tabla

/*Eliminar privilegios*/
-- REVOKE PRIVILEGIO ON OBJETO FROM USUARIO
-- REVOKE ALL, GRANT OPTION FROM USUARIO  -> PARA QUITAR TODOS LOS PRIVILEGIOS DE UNA VEZ
REVOKE SELECT ON ACADEMIA.CURSOS FROM 'usuario1'@'%'; 
REVOKE SELECT(DURACION) ON ACADEMIA.ASIGNATURAS FROM 'usuario2'@'%'; 



