-- == CONTROL DE ERRORES == --
/*
	SINTAXIS
    -----------------------
	DECLARE 
		OPCION (CONTINUE/EXIT/UNDO)
        
		HANDLER FOR 
			CONDICION (Codigo SQL STATE / Codigo error MySQL / SQL WARNING / NOT FOUND/ EXCEPTION)
            Instrucciones
	
	-----------------------
    CONDICIONES
		ERROR MYSQUL -> Codigo Numerico (int) que es un error de MySQL (1051 -> tabla no existente)
		SQLSTATE -> Codigo de 5 caracteres que indica un error del servidor
			SQL WARNING -> Son todos los SQLSTATE que empiezan por 01
			NOT FOUND -> SQLSTATE que empiezan por 02
			SLQ EXCEPTION -> Son los SQLSTATE que no empiezan ni por 00, 01, 02
        Condicion -> Expresion asociada a un error de MySQL
*/

 Delimiter // 
 DROP PROCEDURE IF EXISTS ERRORES1//
 CREATE PROCEDURE ERRORES1(p_codigo int, p_nombre varchar(50), p_precio DECIMAL)
 BEGIN
	DECLARE CONTINUE HANDLER FOR 1062
    SELECT CONCAT('EL CODIGO ', p_codigo, ' ya existe.');
    
    DECLARE CONTINUE HANDLER FOR 1048
    SELECT 'La columna nombre, no puede ser null';
    
	INSERT INTO CURSOS VALUES (p_codigo, p_nombre, p_precio);
    
    SELECT 'He pasado por aqui';
 END//
 DELIMITER ;
 
 CALL ERRORES1(1,'CURSO', 9999);
 CALL ERRORES1(30003, NULL, 200);
 
  Delimiter // 
 DROP PROCEDURE IF EXISTS ERRORES2//
 CREATE PROCEDURE ERRORES2(p_codigo int, p_nombre varchar(50), p_precio DECIMAL)
 BEGIN
	DECLARE NOMBRE_NULO BOOL;
    
	DECLARE CONTINUE HANDLER FOR 1062
    SELECT CONCAT('EL CODIGO ', p_codigo, ' ya existe.');
    
    DECLARE CONTINUE HANDLER FOR 1048
    SET NOMBRE_NULO = TRUE;
    
	INSERT INTO CURSOS VALUES (p_codigo, p_nombre, p_precio);
		
    IF NOMBRE_NULO = TRUE THEN 
		INSERT INTO CURSOS VALUES (p_codigo, 'DESCONOCIDO', p_precio);
	END IF;
    
    SELECT 'He pasado por aqui';
 END//
 DELIMITER ;
 
  CALL ERRORES2(30003, NULL, 200);
  SELECT * FROM CURSOS;
  -- --------------------------------------------------
  
  -- CONTROLANDO TODOS LOS ERRORES A LA VEZ -- 
  /*NO ES MUY EFICIENTE MANEJAR TODOS LOS ERRORES A LA VEZ POR QUE AL FINAL NO SABEMOS DONDE ESTA EL FALLO*/
  
    Delimiter // 
 DROP PROCEDURE IF EXISTS ERRORES3//
 CREATE PROCEDURE ERRORES3(p_codigo int, p_nombre varchar(50), p_precio DECIMAL)
 BEGIN
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SELECT 'CUIDADO!, SE HA PRODUCIDO UN ERROR';
    
	INSERT INTO CURSOS VALUES (p_codigo, p_nombre, p_precio);
    
    SELECT 'LA EJECUCION HA CONTINUADO';
		
 END//
 DELIMITER ;
 
  CALL ERRORES3(30003, NULL, 200);
  
 -- --------------------------------------------------
 -- AREA DE DIAGNOSTICO
 /*
  GET DIAGNOSTICS CONDITION1;
 
  ESTE COMANDO NOS PUEDE DEVOLVER TRES COSAS
	- RETURNED_SQLSTATE -> Indica el estado de la condicion
    - MESSAGE_TEXT
    - MYSQL_ERRNO -> ERROR CODE
 */
 
     Delimiter // 
 DROP PROCEDURE IF EXISTS ERRORES4//
 CREATE PROCEDURE ERRORES4(p_codigo int, p_nombre varchar(50), p_precio DECIMAL)
 BEGIN
	DECLARE MENSAJE TEXT; 
    DECLARE CODIGO INT; 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN 
		GET DIAGNOSTICS CONDITION 1
        CODIGO = MYSQL_ERRNO, MENSAJE = MESSAGE_TEXT; 
        
        SELECT 'SE HA PRODUCIDO EL ERROR ', CODIGO, ' CON EL MENSAJE ', MENSAJE;
    END; 
    
	INSERT INTO CURSOS VALUES (p_codigo, p_nombre, p_precio);
    
    SELECT 'LA EJECUCION HA CONTINUADO';
		
 END//
 DELIMITER ;
 
 CALL ERRORES4(30004, NULL, 200);