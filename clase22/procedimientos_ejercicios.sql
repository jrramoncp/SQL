
/*1. Crea un procedimiento llamado “cursos_asignaturas”para visualizar los cursos y sus
asignaturas respectivamente. Ordénalo por cursos.*/
DROP PROCEDURE IF EXISTS cursos_asignaturas;
DELIMITER //
CREATE PROCEDURE cursos_asignaturas()
BEGIN
	SELECT CURSOS.NOMBRE, ASIGNATURAS.NOMBRE FROM CURSOS INNER JOIN ASIGNATURAS ON
    CURSOS.COD_CURSO = ASIGNATURAS.COD_CURSO
    ORDER BY CURSOS.COD_CURSO;
END//
DELIMITER ;

call cursos_asignaturas();
/*2. Crea un procedimiento llamado “actualizar_precio”, que reciba como parámetro el
código del curso y el precio que se le va a asignar a ese curso. Se debe controlar
que el precio sea mayor que 100. Si no se cumple, se fija el precio a 100.*/
DELIMITER // 
CREATE PROCEDURE actualizar_precio(IN p_precio DECIMAL)
BEGIN
	
END
DELIMITER ;

/*3. Crea un procedimiento llamado “profesores_cursos” para visualizar los cursos de
cada profesor. Debe recibir un parámetro que sea el nombre del profesor para ver
las asignaturas.*/
/*4. Crea un procedimiento llamado “nombre_completo” que devuelva una SELECT con
el nombre y el apellido de un alumno. Debe recibir el parámetro de entrada del
código del alumno.*/
/*5. Modificar el procedimiento anterior (crea uno nuevo con otro nombre) para que el
resultado se almacene en una variable de tipo OUT. Para ver que ha funcionado,
visualiza la variable.*/
/*6. Crea un procedimiento llamado “devolver_mayus” con un argumento de tipo INOUT.
El parámetro debe ser una cadena de texto que se devuelva en mayúsculas.*/
/*7. Crea un procedimiento llamado “devolver_datos” que reciba como parámetro de
entrada el código del curso, y que devuelva en dos variables de tipo OUT el */