-- == CONSTRAINTS == --
/*
- Son restricciones que sirven para poner una regla dentro de los datos que vamos a almacenar en una tabla
- Esto permite guardar la integridad de la información por que impide que se graben datos erróneos, que no cumplen ciertas condiciones
- Estas restricciones pueden ser a nivel de tabla y a nivel de columna. Y puede ser lo que queramos. 

TIPOS MÁS HABITUALES
-----------------------
- NOT NULL: impide tener un valor nulo en un campo
- UNIQUE: impide que haya valores duplicados en un campo
- PRIMARY-KEY: impide que haya valores duplicados y tampoco soporta valores nulos
- FOREIGN-KEY: relaciona unas tablas con otras, impidiendo que se rompa la integridad referencial
- CHECK: permite poner una condición dentro de una columna
- DEFAULT: introduce valores por defecto
*/