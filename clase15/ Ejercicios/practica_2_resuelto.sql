-- PRACTICA 2 --
-- 1.Visualizar el número de empleados de cada departamento. Utilizar group by para agrupar por departamento
SELECT dnombre, count(*) FROM depart INNER JOIN emple 
ON depart.dept_no = emple.dept_no
group by dnombre;

-- 2. Visualizar los departamentos con más de 5 empleados. Utilizar group by para agrupar por departamento y having para establecer la condición sobre los 
-- 	  grupos.
SELECT dnombre, count(*) as numero_empleados FROM depart INNER JOIN emple 
ON depart.dept_no = emple.dept_no
group by dnombre 
having numero_empleados > 5;

-- 3. Hallar la media de los salarios de cada departamento (utilizar la funcion avg y group by)
SELECT dnombre, avg(salario) as salario_medio FROM depart INNER JOIN emple 
ON depart.dept_no = emple.dept_no
group by dnombre;

-- 4. Visualizar el nombre de los empleados vendedores del departamento 'Ventas' (nombre del departamento = ventas, oficio = vendedor)
SELECT apellido, dnombre, oficio from depart inner join emple
on depart.dept_no = emple.dept_no
where dnombre = 'Ventas' and oficio = 'vendedor';

-- 5. Visualizar el número de vendedores del departamento 'ventas' (funcion count sobre la consulta anterior)
SELECT count(apellido) as numero_empleados, dnombre, oficio from depart inner join emple
on depart.dept_no = emple.dept_no
where dnombre = 'Ventas' and oficio = 'vendedor';

-- 6. Visualizar los oficios de los empleados del departamento ventas
SELECT apellido, oficio FROM emple inner join depart
on depart.dept_no = emple.dept_no
where dnombre = 'ventas';

-- 7.A partir de la tabla emple, visualizar el número de empleados de cada departamento cuyo oficio sea 'empleado' (utilizar group by para agrupar por departamento
-- en la clausula where habra que indicar que el oficio es empleado)
SELECT count(apellido) as numero_empleados, dnombre FROM emple inner join depart
on depart.dept_no = emple.dept_no
where oficio = 'empleado'
group by dnombre;

-- 8. Visualizar el departamento con más empleados
SELECT dnombre, count(*) as empleados FROM depart INNER JOIN emple 
ON depart.dept_no = emple.dept_no
group by dnombre 
order by empleados desc 
limit 1;

-- 9. Mostrar todos los departamentos cuya suma de salarios sea mayor que la media de salarios de todos los empleados
SELECT dnombre, avg(salario) as media_salario FROM depart INNER JOIN emple 
ON depart.dept_no = emple.dept_no
group by dnombre
having media_salario > (select avg(salario) from emple);

-- 10. Para cada oficio obtener la suma de salarios
select oficio, avg(salario) as media_salario from emple
group by oficio;

-- 11. visualizar la suma de salarios de cada oficio del departamento 'ventas'
select oficio, sum(salario) as suma_salario from depart inner join emple
on depart.dept_no = emple.dept_no
where dnombre = 'ventas'
group by oficio;

-- 12. Visualizar el número de departamento que tena más empleados cuyo oficio sea empleado
select dnombre, numero_empleados from (
SELECT count(apellido) as numero_empleados, dnombre FROM emple inner join depart
on depart.dept_no = emple.dept_no
where oficio = 'empleado'
group by dnombre) as t 
order by numero_empleados DESC 
limit 1;

-- 13. Mostrar el numero de oficios distintos de cada departamento
select distinct count(distinct oficio) as numero_oficios, dnombre from emple inner join depart
on depart.dept_no = emple.dept_no
group by dnombre; 

-- 14. Mostrar los departamentos que tengan más de dos personas trabajando en la misma profesion
select dnombre, oficio, count(oficio) from (SELECT dnombre, oficio FROM emple, depart
where depart.dept_no = emple.dept_no) as T
group by dnombre, oficio
order by dnombre;

-- 15. Dada la tabla herramientas, visualizar por cada estanteria la suma de las unidades
select estanteria, sum(unidades) as total_unidades from herramientas
group by estanteria;

-- 16. Visualizar la estanteria con mas unidades de la tabla herramientas
select estanteria, sum(unidades) as total_unidades from herramientas
group by estanteria
order by total_unidades DESC
limit 1;

-- 17. Mostrar el número de medicos que pertenecen a cada hospital, ordenando por número descendente de hospital
select hospitales.cod_hospital, nombre as hospital, count(dni) as medicos 
from hospitales inner join medicos
on hospitales.cod_hospital = medicos.cod_hospital
group by cod_hospital, nombre
order by hospitales.cod_hospital desc;

-- 18. Realizar una consulta en la que se muestre por cada hospital el nombre de las especialidades que tiene. 
select hospitales.nombre, especialidad
from hospitales inner join medicos on hospitales.cod_hospital = medicos.cod_hospital
order by nombre;

-- 19. Realizar una consulta en la que aparezca por cada hospital y en cada especialidad el numero de medicos (tendras que partir de la consulta anterior
-- y utilizar group by) 
select hospitales.nombre, especialidad, count(dni) as numero_medicos
from hospitales inner join medicos on hospitales.cod_hospital = medicos.cod_hospital
group by nombre, especialidad
order by nombre;

-- 20. Obtener por cada hospital el numero de empleados
select nombre, count(dni) as empleados from hospitales inner join personas
on hospitales.cod_hospital = personas.cod_hospital
group by nombre;

-- 21.Obtener por cada especialidad del numero de trabajadores
select especialidad, count(especialidad) numero_trabajadores from medicos
group by especialidad; 

select funcion, count(funcion) as numero_trabajadores from personas
group by funcion;

-- 22. Visualizar la especialidad que tenga mas medicos
select especialidad, count(especialidad) numero_trabajadores from medicos
group by especialidad
order by numero_trabajadores desc
limit 1; 

-- 23.¿Cual es el nombre del hospital que tiene mayor número de plazas?
SELECT nombre, num_plazas from hospitales
where num_plazas = (select max(num_plazas) from hospitales);

-- 24. Visualizar las diferentes estanterias de la tabla herramientas ordenados descendentemente por estanteria
select distinct estanteria from herramientas
order by estanteria desc;

-- 25. Averiguar cuantas unidades tiene cada estanteria
select estanteria, sum(unidades) as total_unidades from herramientas
group by estanteria;

-- 26.Visualizar las estanterias que tengan más de 15 unidades
select estanteria, sum(unidades) as total_unidades from herramientas
group by estanteria
having total_unidades > 15;

-- 27. ¿Cúal es la estanteria que tiene más unidades?
select estanteria, sum(unidades) as total_unidades from herramientas
group by estanteria
order by total_unidades desc
limit 1;

-- 28. A partir de las emple y depart mostrar los datos del departamento que no tiene ningun empleado
select depart.dept_no, dnombre, loc from depart left join emple 
on depart.dept_no = emple.dept_no 
where emp_no is null;


-- 29. Mostrar el número de empleados de cada departamento. En la salida debe mostrar tambien los departamentos que no tienen nigun empleado
select dnombre, count(apellido) from depart left join emple 
on depart.dept_no = emple.dept_no
group by dnombre;

-- 30.Obtener la suma de los salarios de cada departamento, mostrando las columnas dept_no, suma de salarios y dnombre. En el resultado tambien se deben mostrar los 
-- departamentos que no tienen asignados empleados
select depart.dept_no, sum(salario) as suma_salario, dnombre from depart left join emple
on depart.dept_no = emple.dept_no
group by dept_no, dnombre;

-- 31.Utiliar la funcion IFNULL en la consulta anterior para que en el caso de que un departamento no tenga empleados, aparezca como suma de salarios el valor 0
select depart.dept_no, ifnull(sum(salario), 0) as suma_salario, dnombre from depart left join emple
on depart.dept_no = emple.dept_no
group by dept_no, dnombre;

-- 32. Obtener el número de médicos que pertenecen a cada hospital, mostrando las columnas cod_hospital, nombre y numero de medicos. En el resultado deben aparecer tambien
-- los hospitales que no tienen medicos
select hospitales.cod_hospital, nombre, count(dni) as numero_de_medicos from hospitales left join medicos
on hospitales.cod_hospital = medicos.cod_hospital
group by hospitales.cod_hospital, nombre;

