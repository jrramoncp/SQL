
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
DROP PROCEDURE IF EXISTS actualizar_precio;
DELIMITER // 
CREATE PROCEDURE actualizar_precio(IN p_codigo_curso DECIMAL, IN p_precio DECIMAL)
BEGIN
	IF p_precio < 100 then
		set p_precio = 100;
	END IF;
	
    UPDATE CURSOS SET PRECIO = p_precio WHERE cod_curso = p_codigo_curso;
END// 
DELIMITER ;

CALL actualizar_precio(4, 50);
CALL actualizar_precio(5, 200);
SELECT * FROM CURSOS;

/*3. Crea un procedimiento llamado “profesores_cursos” para visualizar los cursos de
cada profesor. Debe recibir un parámetro que sea el nombre del profesor para ver
las asignaturas.*/
DROP PROCEDURE IF EXISTS profesores_cursos;
DELIMITER //
CREATE PROCEDURE profesores_cursos (IN p_nombre VARCHAR(50))
BEGIN
	SELECT PROFESORES.nombre, CURSOS.nombre FROM CURSOS INNER JOIN ASIGNATURAS on CURSOS.cod_curso = ASIGNATURAS.cod_curso
    INNER JOIN PROFESORES on ASIGNATURAS.cod_profesor = PROFESORES.cod_profesor
    WHERE PROFESORES.nombre = p_nombre;
END//
DELIMITER ;
CALL profesores_cursos('Dreddy');
/*4. Crea un procedimiento llamado “nombre_completo” que devuelva una SELECT con
el nombre y el apellido de un alumno. Debe recibir el parámetro de entrada del
código del alumno.*/
DROP PROCEDURE IF EXISTS nombre_completo; 
DELIMITER //
CREATE PROCEDURE nombre_completo(IN p_cod_alumno INT)
BEGIN
	SELECT nombre, apellidos FROM ALUMNOS WHERE cod_alumno = p_cod_alumno;
END//
DELIMITER ;
CALL nombre_completo(1);
/*5. Modificar el procedimiento anterior (crea uno nuevo con otro nombre) para que el
resultado se almacene en una variable de tipo OUT. Para ver que ha funcionado,
visualiza la variable.*/
SET @RESULTADO = "";
DELIMITER //
DROP PROCEDURE IF EXISTS NOMBRE_COMPLETOVAR;
CREATE PROCEDURE NOMBRE_COMPLETOVAR(IN p_codigo INT, OUT salida VARCHAR(100))
BEGIN
	SELECT concat(nombre, " ",apellidos) into salida
    from ALUMNOS
    WHERE cod_alumno = p_codigo;
END //
DELIMITER ;
call nombre_completovar(1, @RESULTADO); 
SELECT @RESULTADO;
/*6. Crea un procedimiento llamado “devolver_mayus” con un argumento de tipo INOUT.
El parámetro debe ser una cadena de texto que se devuelva en mayúsculas.*/
DROP PROCEDURE IF EXISTS devolver_mayus;
SET @mayus = "soy alumno de conquer blocks"; 
DELIMITER //
CREATE PROCEDURE DEVOLVER_MAYOS(INOUT p_texto varchar(150))
BEGIN
	SELECT CONCAT('El texto ', p_texto, 'en mayusculas es:', upper(p_texto)) into p_texto;
END // 
DELIMITER ;

call DEVOLVER_MAYOS(@mayus);

select @mayus;

/*7. Crea un procedimiento llamado “devolver_datos” que reciba como parámetro de
entrada el código del curso, y que devuelva en dos variables de tipo OUT el */
DROP PROCEDURE IF EXISTS devolver_datos;
SET @nombre_curso = "";
SET @precio_curso = 0;

DELIMITER // 

CREATE PROCEDURE devolver_datos(p_codigo INT, OUT p_nombre VARCHAR(50), OUT p_precio DECIMAL)
BEGIN
	SELECT NOMBRE, PRECIO INTO p_nombre, p_precio
    FROM CURSOS
    WHERE cod_curso = p_codigo;
END // 

DELIMITER ;

CALL devolver_datos(8, @nombre_curso, @precio_curso);
SELECT @nombre_curso, @precio_curso;

