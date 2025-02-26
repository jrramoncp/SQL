-- EJERCICIOS RESUELTOS 2 -- 
-- 1. Usar una subconsulta en el FROM para devolver los cursos entre 1 y 5. Visualizar el número de alumnos de cada uno de ellos
SELECT CURSOS.nombre AS NOMBRE_CURSO, count(ALUMNOS.nombre) AS ALUMNOS_POR_CURSO FROM (SELECT * FROM CURSOS WHERE cod_curso <= 5) AS CURSOS , ALUMNOS
WHERE CURSOS.cod_curso = ALUMNOS.cod_curso
GROUP BY CURSOS.NOMBRE;

-- 2. Usar una subconsulta en el FROM para devolver los profesores y el número de asignaturas que imparten. Luego visualiza solo los que tengan más de 3 
--    asignaturas
SELECT PROFESORES.NOMBRE, COUNT(ASIGNATURAS.cod_profesor) AS ASIGNATURAS_POR_PROFESOR FROM PROFESORES, (SELECT cod_profesor FROM ASIGNATURAS) as ASIGNATURAS 
WHERE PROFESORES.cod_profesor = ASIGNATURAS.cod_profesor
GROUP BY PROFESORES.nombre 
HAVING ASIGNATURAS_POR_PROFESOR > 3;

SELECT * FROM 
	(SELECT PROFESORES.nombre, count(ASIGNATURAS.cod_asignatura) AS NUMERO_ASIGNATURAS
	 FROM ASIGNATURAS INNER JOIN PROFESORES ON ASIGNATURAS.cod_profesor = PROFESORES.cod_profesor GROUP BY PROFESORES.nombre) AS T WHERE NUMERO_ASIGNATURAS > 3;

-- 3. Indicar el curso más caro
SELECT * FROM CURSOS WHERE PRECIO = (SELECT max(precio) FROM CURSOS);

-- 4. Indicar la asignatura o asignaturas que menos duración tienen
SELECT * FROM ASIGNATURAS WHERE duracion = (SELECT min(duracion) FROM ASIGNATURAS);

-- 5. Indicar las que más y menos duración tienen
SELECT * FROM ASIGNATURAS WHERE duracion = (SELECT min(duracion) FROM ASIGNATURAS) OR duracion = (SELECT max(duracion) FROM ASIGNATURAS);

-- 6. Alumnos de informática que tengan una nota mayor que la media de la asignatura (todos los que tengan más de 5.9 que es la nota media)
SELECT * FROM ALUMNOS INNER JOIN NOTAS_ALUMNOS INNER JOIN ASIGNATURAS
ON ALUMNOS.cod_alumno = NOTAS_ALUMNOS.cod_alumno AND NOTAS_ALUMNOS.cod_asignatura = ASIGNATURAS.cod_asignatura
WHERE ASIGNATURAS.nombre = "informatica" 
AND NOTAS_ALUMNOS.nota > (SELECT AVG(nota) FROM ASIGNATURAS INNER JOIN NOTAS_ALUMNOS ON NOTAS_ALUMNOS.cod_asignatura = ASIGNATURAS.cod_asignatura
WHERE ASIGNATURAS.nombre = "informatica");

-- 7. Utilizando una subconsulta visualizar los nombre de los alumnos que estan en el curso 'CURSO1'
SELECT NOMBRE FROM ALUMNOS WHERE cod_curso = (SELECT cod_curso FROM CURSOS where nombre = 'CURSO1');

-- 8. Visualiza los curso que cuestan más que el CURSO9
SELECT nombre FROM CURSOS WHERE precio > (SELECT precio FROM CURSOS where nombre = 'CURSO9');

-- 9. Extrae el nombre de los alumnos que esten en el CURSO1 O EN EL CURSO2
SELECT nombre FROM ALUMNOS WHERE cod_curso IN (SELECT cod_curso FROM CURSOS WHERE nombre IN ('CURSO1', 'CURSO2'));

-- 10. Alumnos que estan cursando informática, matemáticas o dibujo
SELECT nombre FROM ALUMNOS WHERE cod_curso IN (SELECT cod_curso FROM ASIGNATURAS WHERE nombre IN ('Informática', 'Matemáticas', 'Dibujo'));

-- 11. Nombre y precio de los cursos que valgan más que el curso6 o curso7
SELECT nombre, precio FROM CURSOS WHERE precio > ANY (SELECT precio FROM CURSOS WHERE nombre IN ('CURSO6', 'CURSO7'));

-- 12. Nombre y precio de los cursos que valgan más que el curso6 y curso7
SELECT nombre, precio FROM CURSOS WHERE precio > ALL (SELECT precio FROM CURSOS WHERE nombre IN ('CURSO6', 'CURSO7'));

-- 13. Averiguar si existe algún curso que tenga más de un 6 de nota media. Solo deberia salir CURSO3
SELECT nombre FROM CURSOS WHERE 
	EXISTS (SELECT cod_curso, AVG(nota) FROM NOTAS_ALUMNOS WHERE COD_CURSO = CURSOS.cod_curso GROUP BY cod_curso 
    HAVING AVG(nota) > 6);

-- 14. Cursos que tengan más asignaturas que CURSO9
SELECT CURSOS.nombre, COUNT(*) FROM CURSOS INNER JOIN ASIGNATURAS 
	ON CURSOS.cod_curso = ASIGNATURAS.cod_curso
    GROUP BY ASIGNATURAS.cod_curso
    HAVING COUNT(*) > (
		SELECT COUNT(*) FROM ASIGNATURAS INNER JOIN CURSOS ON CURSOS.cod_curso = ASIGNATURAS.cod_curso 
		WHERE CURSOS.nombre = 'CURSO9');
    
-- 15. Alumnos con media mayor que la del alumno llamado Gayle
SELECT nombre, AVG(NOTA) FROM ALUMNOS INNER JOIN NOTAS_ALUMNOS ON ALUMNOS.COD_CURSO = NOTAS_ALUMNOS.COD_CURSO 
GROUP BY NOMBRE
HAVING AVG(NOTA) > (SELECT AVG(NOTA) FROM ALUMNOS INNER JOIN NOTAS_ALUMNOS ON ALUMNOS.cod_curso = NOTAS_ALUMNOS.cod_curso
WHERE ALUMNOS.NOMBRE = 'GAYLE');

-- 16. Visualiza el nombre del curso o cursos que tienen más alumnos
SELECT CURSOS.NOMBRE, COUNT(*) FROM CURSOS 
	INNER JOIN ALUMNOS ON ALUMNOS.COD_CURSO = CURSOS.COD_CURSO
	GROUP BY CURSOS.NOMBRE
    HAVING COUNT(*) = (
		SELECT COUNT(*) FROM ALUMNOS GROUP BY COD_CURSO ORDER BY COUNT(*) DESC LIMIT 1);
        
-- 17. Mostrar el curso o los cursos que tegan más alumnos matriculados que matemáticas
SELECT CURSOS.NOMBRE, COUNT(*) FROM CURSOS INNER JOIN ASIGNATURAS INNER JOIN ALUMNOS
ON CURSOS.COD_CURSO = ASIGNATURAS.COD_CURSO AND ALUMNOS.COD_CURSO = CURSOS.COD_CURSO
WHERE ASIGNATURAS.NOMBRE = 'Matemáticas'
GROUP BY CURSOS.NOMBRE
HAVING COUNT(*) = (
	SELECT MAX(NUM_ALUMNOS) FROM(
					SELECT CURSOS.NOMBRE, COUNT(*) AS NUM_ALUMNOS FROM CURSOS INNER JOIN ASIGNATURAS INNER JOIN ALUMNOS
					ON CURSOS.COD_CURSO = ASIGNATURAS.COD_CURSO AND ALUMNOS.COD_CURSO = CURSOS.COD_CURSO
					WHERE ASIGNATURAS.NOMBRE = 'Matemáticas'
					GROUP BY CURSOS.NOMBRE) AS TABLA
);
