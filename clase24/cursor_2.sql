drop procedure if exists backup_cursos; 

CREATE TABLE CURSOS_BACKUP(
codigo INT,
nombre VARCHAR(50),
precio decimal 
); 

DELIMITER // 
Create procedure backup_cursos()
BEGIN
	-- variables
    DECLARE fin BOOL;
    DECLARE cod_curso INT;
    DECLARE nombre_curso VARCHAR(50);
    DECLARE precio_curso DECIMAL;
    
    -- cursor y handler
    DECLARE cursor_cursos CURSOR FOR SELECT * FROM CURSOS;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET fin = true; 
	
    -- instrucciones
    truncate table CURSOS_BACKUP; 
    OPEN cursor_cursos; 
    
    bucle: LOOP
		FETCH cursor_cursos into cod_curso, nombre_curso, precio_curso;
        
        IF fin THEN
			leave bucle;
		END IF; 
        
        INSERT INTO CURSOS_BACKUP VALUES (cod_curso, nombre_curso, precio_curso);
	END LOOP; 
    COMMIT;
END//
DELIMITER ; 

CALL backup_cursos();
SELECT * FROM CURSOS_BACKUP;