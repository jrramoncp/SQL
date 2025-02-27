/*== OPERACIONES DE CONJUNTOS (SET) ==*/
-- Son operaciones que permiten combinar múltiples selects (consultas) para devolver un solo resultado
-- Cada bloque de consultas tiene que tener el mismo número de columnas, pero no tienen por que llamarse de la misma manera
-- Actualmente existen tres tipos de operaciones de conjunto
-- 1. UNION, UNION ALL
-- 2. INTERSECT (desde la version 8.0.31)
-- 3. EXCEPT (desde la version 8.0.31)

/*== UNION ==*/
-- Es una sentencia que combina los resultados de las SELECT y devuelve un unico resultado eliminando duplicados
-- Si utilizamos UNION ALL no se elimina duplicados
SELECT * FROM T1
UNION
SELECT * FROM T2;

SELECT * FROM T1
UNION ALL
SELECT * FROM T2;

/*== INTERSECT ==*/
-- Combina los resultados de las consultas y devuelve un unico resultado con las filas existentes en ambas tablas
SELECT * FROM T1
INTERSECT
SELECT * FROM T2;

/*== EXCEPT ==*/
-- Combina los resultados de las consultas y devuelve un único resultado con las filas que estan existen en la primera tabla pero que no están 
-- en la segunda
SELECT * FROM T1
EXCEPT
SELECT * FROM T2;

SELECT * FROM T1
EXCEPT ALL
SELECT * FROM T2;
