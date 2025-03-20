-- == FUNCIONES == --
/*
	-- SON COMO LOS PROCEDIMIENTOS PERO SIEMPRE DEVUELVEN UN VALOR
    -- PODEMOS UTILIZARLAS EN CUALQUIER COMANDO SELECT
    
    CREATE FUNCTION nombre_funcion()
		RETURNS tip_de_dato
			CARACTERISTICAS
            BEGIN
				instrucciones
                RETURN valor
			END
            
	CREATE FUNCTION suma(num1 int, num2 int)
    RETURN INT
    BEGIN
		RETURN num1 + num2
    END
*/

/*
	**CARACTERISTICAS**
    -DETERMINISCTIC: devuelve mismo resultado con mismos parametros de entrada
    -NOT DETERMINISTIC: no devuelve mismo resultado aunque mismos parametros de entrada
    -CONTAINS SQL: Indica que la función tiene sentencias SQL, pero no sentencias de manipulacion de datos
    -NO SQL: No tiene sentencias SQL
    -READS SQL DATA: sentencias SQL de lectura
    -MODIFIES SQL DATA: insert, update o delete
    
*/

DROP FUNCTION IF EXISTS calcula_iva; 
DELIMITER //
CREATE FUNCTION calcula_iva(p_codigo INT)
    RETURNS DECIMAL READS SQL DATA
    BEGIN
		DECLARE precio_total DECIMAL; 
		SELECT PRECIO + (PRECIO * 0.21) INTO precio_total FROM CURSOS WHERE cod_curso = p_codigo; 
	
        RETURN precio_total;
    END//
DELIMITER ; 

SELECT calcula_iva(1);
SELECT *, calcula_iva(cod_curso) as PRECIO_FINAL FROM CURSOS;