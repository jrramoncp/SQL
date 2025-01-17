/*==== FUNCIONES NUMERICAS ====*/
-- NOS PERMITEN HACER OPERACIONES PARA TRABAJAR CON NÚMEROS
/*
FUNCION			DESCRIPCION
----------------------------------
ABS 			Devuelve el valor absoluto de un numero
CEIL			Devuelve el valor entero que es igual o superior a un número (Redondear decimales hacia arriba)
FLOOR			Devuelve el valor entero que es más cercano que sea inferior (Redondear decirmales hacia abajo)
DIV				Division entera (No devuelve decimales)
MOD (%)         Devuelve el resto de una división
PI				Devuelve el valor de PI
POW O POWER 	Devuelve un número elevado a la potencia de otro
SQRT			Devuelve la raiz cuadrada
RAND			Devuelve un número aleatorio entre 0 y 1
ROUND			Devuelve un número N redondeado
SING			Devuelve el signo de un número
TRUNCATE		Trunca un número a partir de n decimales
*/

-- ABS
select abs(70);
select abs(-70);

-- CEIL
select ceil(10.5);

-- FLOOR
select floor(10.5);

-- DIV y MOD

select 8 div 2; 
select mod(9, 2);

select name, indepyear from world.country where mod(indepyear, 2) = 0;

-- PI
select PI(); 

-- POWER
select pow(4,2);
select power(4,2);

-- SQRT
select sqrt(4);

-- RAND
select rand();
select rand() * 1000; 

-- SING
-- Devuelve 1 si como parametro metemos un número positivo
-- Devuelve -1 si metemos un número negativo
-- Devuelve 0 si metemos 0

select sign(20);
select sign(-20);
select sign(0);


-- ROUND, TRUNCATE
select round(10.6);
select round (10.1);

select round(10.45, 1); -- se le pueden indicar para que redondee en decimales

select truncate(10.51, 1);
select truncate(10.59, 1);

select truncate(10.674893, 4);