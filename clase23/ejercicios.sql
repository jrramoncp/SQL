
/*1. Crea una función que divida los números de las tarjetas en grupos de 4
dígitos. Para las que son tipo VISA, separaremos estos grupos con ‘-’. Y para
las que son tipo MASTERCARD, separaremos con ‘/’. Si el número no tiene 16
dígitos escribe: ‘Número incorrecto’*/
DELIMITER // 
DROP FUNCTION IF EXISTS DIVIDIR_TARJETAS// 
CREATE FUNCTION DIVIDIR_TARJETAS(num_tarjeta varchar(16), tipo varchar(10)) 
	returns varchar(50) NO SQL
	BEGIN
		DECLARE BLOQUE1 VARCHAR(4);
        DECLARE BLOQUE2 VARCHAR(4);
        DECLARE BLOQUE3 VARCHAR(4);
        DECLARE BLOQUE4 VARCHAR(4);
        
        SET BLOQUE1 = "";
        SET BLOQUE2 = "";
        SET BLOQUE3 = "";
        SET BLOQUE4 = "";
        
        IF(length(NUM_TARJETA)<>16) THEN
			RETURN 'Numero Incorrecto';
        END IF;
        
        IF tipo = 'visa' THEN 
			SET BLOQUE1 = substring(NUM_TARJETA, 1, 4);
            SET BLOQUE2 = substring(NUM_TARJETA, 5, 4);
            SET BLOQUE3 = substring(NUM_TARJETA, 9, 4);
            SET BLOQUE4 = substring(NUM_TARJETA, 13, 4);
            
            RETURN CONCAT(BLOQUE1, "-", BLOQUE2, "-", BLOQUE3, "-", BLOQUE4);
        END IF;
        
       IF tipo = 'mastercard' THEN 
			SET BLOQUE1 = substring(NUM_TARJETA, 1, 4);
            SET BLOQUE2 = substring(NUM_TARJETA, 5, 4);
            SET BLOQUE3 = substring(NUM_TARJETA, 9, 4);
            SET BLOQUE4 = substring(NUM_TARJETA, 13, 4);
            
            RETURN CONCAT(BLOQUE1, "/", BLOQUE2, "/", BLOQUE3, "/", BLOQUE4);
        END IF;
           
    END//
    DELIMITER ;
    
SELECT NUM_TARJETA, TIPO, DIVIDIR_TARJETAS(NUM_TARJETA, TIPO) FROM TARJETAS;

/*2. Crea una función llamada “datos alumno” que devuelva en un solo valor el
nombre, apellidos y correo del alumno. Debe recibir como argumentos los 3
datos del alumno. Lo probamos en una SELECT.*/

DROP FUNCTION IF EXISTS datos_alumno; 
DELIMITER // 
CREATE FUNCTION datos_alumno(nombre varchar(50), apellidos varchar(50), correo varchar(50))
RETURNS varchar(200) NO SQL
BEGIN
	RETURN CONCAT(NOMBRE, "|", APELLIDOS, "|", CORREO);
END//
DELIMITER ;

SELECT NOMBRE, APELLIDOS, CORREO, datos_alumno(NOMBRE, APELLIDOS, CORREO) FROM ALUMNOS; 

/*3. Crear una función llamada “cursos_num_alumnos” que devuelva el número de
alumnos de un curso que se pasa como argumento Lo probamos con una
SELECT.*/
DROP FUNCTION IF EXISTS cursos_num_alumnos; 
DELIMITER // 

CREATE FUNCTION cursos_num_alumnos(p_cod_curso INT) 
RETURNS INT READS SQL DATA
BEGIN
	DECLARE num_alumnos INT;
    SET num_alumnos = 0; 
    
    SELECT COUNT(*) INTO num_alumnos FROM ALUMNOS WHERE COD_CURSO = p_cod_curso; 
    
    RETURN num_alumnos;
    
END //
DELIMITER ;

SELECT NOMBRE, cursos_num_alumnos(cod_curso) FROM CURSOS;

/*4. Crear una función llamada “nota_media” que pasándole el código del alumno
nos indique la nota media de dicho alumno*/
DROP FUNCTION IF EXISTS nota_media; 
DELIMITER // 
CREATE FUNCTION nota_media(p_cod_alumno int) 
	RETURNS DECIMAL READS SQL DATA
    BEGIN
		DECLARE nota_alumno DECIMAL;
        SET nota_alumno = 0; 
        
        SELECT AVG(NOTA) INTO nota_alumno FROM NOTAS_ALUMNOS WHERE cod_alumno = p_cod_alumno; 
        RETURN nota_alumno;
    END//
DELIMITER ;

SELECT NOMBRE, NOTA_MEDIA(COD_ALUMNO) FROM ALUMNOS;

/*5. Crea una tabla con únicamente dos columnas: Código y Texto. Después, crea
un procedimiento llamado “handler1” que lea la tabla. Debe tener un handler
que controle si la tabla existe. Código 1146. ¿Qué pasa si eliminamos la tabla?*/

CREATE TABLE TABLA_CE(
	CODIGO INT, 
    TEXTO TEXT);
    
INSERT INTO TABLA_CE VALUES (1, 'TEXTO1');
INSERT INTO TABLA_CE VALUES (2, 'TEXTO2');
INSERT INTO TABLA_CE VALUES (3, 'TEXTO3');
DELIMITER // 
DROP PROCEDURE IF EXISTS LEER_TABLA_CE// 

CREATE PROCEDURE LEER_TABLA_CE()
BEGIN
	DECLARE EXIT HANDLER FOR 1146
		SELECT 'esa tabla no existe';
        
        SELECT * FROM TABLA_CE; 
END//

DELIMITER ; 

CALL LEER_TABLA_CE();
DROP TABLE TABLA_CE;


/*6. Hacer un procedimiento denominado “insert_curso_error” que intente insertar
una fila en la tabla cursos. Si la clave primaria está duplicada (código 1062), en
vez de generar un error, recalculamos la clave indicando el valor más alto más
uno.*/
DELIMITER //
DROP PROCEDURE IF EXISTS insert_curso_error//
CREATE PROCEDURE insert_curso_error (p_codigo INT, p_nombre VARCHAR(50), p_precio DECIMAL)
BEGIN
	DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
		SELECT MAX(cod_curso) +1 INTO p_codigo FROM CURSOS; 
        INSERT INTO CURSOS VALUES(P_CODIGO, P_NOMBRE, P_PRECIO);
    END;
    
	INSERT INTO CURSOS VALUES(P_CODIGO, P_NOMBRE, P_PRECIO);
END //
DELIMITER ;

CALL insert_curso_error(1, 'CURSO_PRUEBA', 900);
SELECT * FROM CURSOS;
/*7. Hacer un procedimiento llamado “error_generico” que intente modificar la
columna nombre de un curso, pasando el código y el nuevo nombre. Con una
SQLEXCEPTION debemos controlar si hay algún error y luego pintar el número
de error usando DIAGNOSTIC. Luego probamos con algún error, como por
ejemplo pasándole un nulo al campo o un nombre duplicado, lo que sea.*/
DROP PROCEDURE IF EXISTS error_generico;
DELIMITER // 
CREATE PROCEDURE error_generico(p_codigo INT, p_nombre varchar(50))
BEGIN
	DECLARE MENSAJE TEXT;
    DECLARE COD_ERROR INT; 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN 
		 GET DIAGNOSTICS CONDITION 1
         COD_ERROR = MYSQL_ERRNO, MENSAJE = MESSAGE_TEXT; 
         
         SELECT CONCAT("ERROR: ", COD_ERROR, " MENSAJE: ", MENSAJE); 
    END;
    
	UPDATE CURSOS SET NOMBRE = P_NOMBRE WHERE COD_CURSO = P_CODIGO;

END // 

CALL error_generico(2, 'CURSO NUEVO')//
CALL error_generico(2, null)//

DELIMITER ;
/*8. Crear un procedimiento llamado 
“error_condition”. Usando el ejercicio
anterior, hacemos un update, aunque en este caso creamos 2 Condition, una
para el nombre duplicado y el otro para el NULL.*/
DROP PROCEDURE IF EXISTS error_condition;
DELIMITER // 
CREATE PROCEDURE error_condition(p_codigo INT, p_nombre varchar(50))
BEGIN
	DECLARE MENSAJE TEXT;
    DECLARE COD_ERROR INT; 
    
    DECLARE NOMBRE_DUPLICADO CONDITION FOR 1062; 
    DECLARE NOMBRE_NULO CONDITION FOR 1048; 
    
    DECLARE EXIT HANDLER FOR NOMBRE_DUPLICADO
		SELECT CONCAT('EL NOMBRE ', P_NOMBRE, ' YA EXISTE');
    
    DECLARE EXIT HANDLER FOR NOMBRE_NULO
		SELECT CONCAT('EL NOMBRE NO PUEDE SER NULO');
        
	UPDATE CURSOS SET NOMBRE = P_NOMBRE WHERE COD_CURSO = P_CODIGO;

END // 

CALL error_condition(2, 'CURSO NUEVO')//
CALL error_condition(2, null)//

DELIMITER ;