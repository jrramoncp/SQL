drop procedure if exists leer_cursos;
delimiter // 
CREATE PROCEDURE LEER_CURSOS()
BEGIN
	-- Variables
    DECLARE fin BOOL;
    DECLARE resultado TEXT;
    DECLARE COD_CURSO int;
    DECLARE nombre_curso VARCHAR(50);
    DECLARE precio_curso DECIMAL;
    
    -- Cursor y Handler
    DECLARE CURSOR_CURSOS CURSOR FOR SELECT * FROM CURSOS; 
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		set fin = true;
        
	SET resultado = " ";
    
    OPEN CURSOR_CURSOS; 
    
    bucle:LOOP
		FETCH CURSOR_CURSOS INTO COD_CURSO, nombre_curso, precio_curso;
        IF fin THEN 
			leave bucle;
        END IF;
        
        SET resultado = CONCAT(resultado, " - ", nombre_curso);
	END LOOP;
    
    SELECT resultado; 
    
    
END//
DELIMITER ;

call leer_cursos();