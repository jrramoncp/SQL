-- == CONTROL DE FLUJO == -- 
-- CONDICIONES CON IF
/*
	IF condicion
		THEN instrucciones
	END IF;
    
    IF condicion
		THEN instrucciones
	ELSEIF condicion
		THE instrucciones
	ELSE instrucciones
    END IF;
*/
DROP PROCEDURE insert_curso; 
DELIMITER // 
CREATE PROCEDURE insert_curso(p_codigo INT, p_nombre VARCHAR(50), p_precio DECIMAL)
BEGIN
	IF p_precio < 50 
		THEN INSERT INTO CURSOS VALUES(p_codigo, p_nombre, 100);
	ELSE 
		INSERT INTO CURSOS VALUES(p_codigo, p_nombre, p_precio);
	END IF;
END//
DELIMITER ;
CALL insert_curso(1000, "CURSO1000", 9);
CALL insert_curso(2000, "CURSO2000", 900);
-- CONDICIONES CON CASE
/*
	CASE expresion
		WHEN valor1 THEN instrucciones;
        WHEN valor2 THEN instrucciones;
        WHEN valor3 THEN instrucciones;
	END; 
    
	CASE 
		WHEN valor1 THEN instrucciones;
        WHEN valor2 THEN instrucciones;
        ELSE instrucciones
	END CASE
*/
DROP PROCEDURE insert_curso; 
DELIMITER // 
CREATE PROCEDURE insert_curso(p_codigo INT, p_nombre VARCHAR(50), p_precio DECIMAL)
BEGIN
	CASE
		WHEN p_precio < 100 THEN
			select "El precio no puede ser menor que 100";
		WHEN p_precio > 300 THEN
			select "El precio no puede ser mayor que 300";
		ELSE 
			insert into CURSOS VALUES (p_codigo, p_nombre, p_precio);
	END CASE;
END//
DELIMITER ;
CALL insert_curso(1001, "CURSO1001", 9);
CALL insert_curso(2002, "CURSO2002", 900);
CALL insert_curso(3003, "CURSO3003", 200);
-- BUCLES - LOOP
/*
	etiqueta: LOOP
		instrucciones;
        LEAVE etiqueta; -- para salir del bucle
        ITERATE etiqueta; -- para volver al principio del bucle
	END LOOP;
*/
DROP PROCEDURE IF EXISTS BUCLE;
DELIMITER // 
CREATE PROCEDURE BUCLE()
BEGIN
	DECLARE CONTADOR INT;
    SET CONTADOR = 1;
    
    bucle1:LOOP
		SELECT CONTADOR;
        SET CONTADOR = CONTADOR +1;
        
        IF CONTADOR > 10 THEN
			LEAVE bucle1;
        END IF;
	END LOOP;
END// 
DELIMITER ;

CALL BUCLE;
-- BUCLE - WHILE
/*
	WHILE condition DO
		INSTRUCCIONES; 
    END WHILE;
*/
DROP PROCEDURE BUCLE_WHILE; 
DELIMITER // 
CREATE PROCEDURE BUCLE_WHILE()
BEGIN
	DECLARE COUNTER INT;
    DECLARE RESULTADO VARCHAR(50);
    
    SET COUNTER = 0;
    SET RESULTADO = "";
    
    WHILE COUNTER <= 10 DO
		SET RESULTADO = CONCAT(RESULTADO,'-',COUNTER);
        SET COUNTER = COUNTER + 1;
	END WHILE;
    SELECT RESULTADO;
END//
DELIMITER ;
CALL BUCLE_WHILE;

-- BUCLE - REPEAT
/*	
	REPEAT 
		instrucciones;
	UNTIL condicion;
    END REPEAT;
*/
DROP PROCEDURE IF EXISTS BUCLE_REPEAT;
DELIMITER //

CREATE PROCEDURE BUCLE_REPEAT()
BEGIN
	DECLARE COUNTER INT;
    DECLARE RESULTADO VARCHAR(50);
    
    SET COUNTER = 0;
    SET RESULTADO = "";
    
    REPEAT 
		SET RESULTADO = CONCAT(RESULTADO,'-',COUNTER);
        SET COUNTER = COUNTER + 1;
        
	UNTIL COUNTER = 11
	END REPEAT;
    
    SELECT RESULTADO;
END//
DELIMITER ;

CALL BUCLE_REPEAT();