/*== RIGHT JOIN & LEFT JOIN*/
-- ESTE TIPO DE UNIONES LO QUE HACE ES AYUDAR A EXTRAER LA INFORMACIÓN QUE NO EXISTE EN ALGUNA DE LAS TABLAS. 

/*AL HACER UNA INNER JOIN, HAY DATOS QUE NOS ESTAMOS DEJANDO, (2 DEPARTAMENTOS SIN EMPLEADOS, Y 3 EMPLEADOS CON DEPARTAMENTO 0)
  QUE PODREMOS OBTENER CON UNA LEFT JOIN PARA LOS EMPLEADOS Y UNA RIGHT JOIN PARA LOS EMPLEADOS*/
  
SELECT DEPARTAMENTOS.nombre, EMPLEADOS.nombre, EMPLEADOS.APELLIDO 
FROM DEPARTAMENTOS INNER JOIN EMPLEADOS
ON DEPARTAMENTOS.codigo = EMPLEADOS.departamento;

-- PARA DEPARTAMENTOS NULL
SELECT DEPARTAMENTOS.nombre, EMPLEADOS.nombre, EMPLEADOS.APELLIDO 
FROM DEPARTAMENTOS LEFT JOIN EMPLEADOS
ON DEPARTAMENTOS.codigo = EMPLEADOS.departamento;

-- PARA EMPLEADOS NULL
SELECT DEPARTAMENTOS.nombre, EMPLEADOS.nombre, EMPLEADOS.APELLIDO 
FROM DEPARTAMENTOS RIGHT JOIN EMPLEADOS
ON DEPARTAMENTOS.codigo = EMPLEADOS.departamento;

