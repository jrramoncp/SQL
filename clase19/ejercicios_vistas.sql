-- == EJERCICIOS VISTA ==-- 
use academia;
-- 1. Crea una vista llamada ‘cursos_precio_alto’ con los cursos cuyo precio sea superior a 150
CREATE OR REPLACE VIEW cursos_precio_alto AS
SELECT * FROM CURSOS WHERE PRECIO > 150;

SELECT * FROM cursos_precio_alto;


-- 2. Crea una vista llamada ‘cursos_alumno’ que tengan las columnas nombre del curso y nombre del alumno. Tiene que aparecer el alumno y sus cursos
CREATE OR REPLACE VIEW cursos_alumno (ALUMNOS, ASIGNATURAS) AS 
SELECT ALUMNOS.NOMBRE, ASIGNATURAS.NOMBRE FROM ALUMNOS JOIN ASIGNATURAS ON
ALUMNOS.COD_CURSO = ASIGNATURAS.COD_CURSO; 

SELECT * FROM cursos_alumno;

-- 3. Crea una vista llamada ‘asignaturas_curso’ en la que aparezcan los cursos con las asignaturas que tienen. En este caso las columnas se llamarán
-- “Asignatura” y “curso”. Los nombres de las columnas deben ser creadas en la declaración de la vista. También debe estar ordenado por el nombre del curso.

CREATE OR REPLACE VIEW asignaturas_curso AS
SELECT ASIGNATURAS.NOMBRE AS Asignatura, CURSOS.NOMBRE AS curso FROM
ASIGNATURAS JOIN CURSOS ON 
ASIGNATURAS.COD_CURSO = CURSOS.COD_CURSO
ORDER BY CURSOS.NOMBRE;

SELECT * FROM asignaturas_curso;
-- 4. Intenta insertar un nuevo curso a través de la vista ‘cursos_precio_alto’
INSERT INTO cursos_precio_alto VALUES (11, 'CURSO11', 180);

-- 5. Intenta hacer lo mismo con ‘asignaturas_curso’
INSERT INTO asignaturas_curso VALUES ("matematica", "curso10");

-- 6. ¿Y si le ponemos todas las columnas de las tablas asignaturas y cursos?
-- ** NO SE PUEDE POR QUE NO TENEMOS LAS COLUMNAS NECESARIAS EN NUESTRA VISTA.** 

-- 7. Vamos ahora a probar el Check Option. Vamos a insertar una fila en la vista “cursos_precio_alto” que sea de un curso que no cumpla la condición (precio
-- > 150) ¿funciona?
INSERT INTO cursos_precio_alto values (12, 'CURSO12', 130);
-- 8. Introduce un check option ahora
CREATE OR REPLACE VIEW cursos_precio_alto AS
SELECT * FROM CURSOS WHERE PRECIO > 150
WITH CHECK OPTION;
-- 9. Intenta insertar una fila que no cumpla las condiciones
INSERT INTO cursos_precio_alto values (13, 'CURSO13', 130);