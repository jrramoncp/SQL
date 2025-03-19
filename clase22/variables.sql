-- == VARIABLES == --
/*
	Las variables solo sirven para almacenar datos, no columnas, ni nombres de bd ni nada, solo datos
    SITAXIS: 
    
	set @nombreVariable = valor;  

*/

SET @V1 = 10; 

SELECT @V1;

SELECT * FROM academia.CURSOS WHERE cod_curso = @V1;

SET @COLUMNA = NOMBRE; 

SELECT @COLUMNA FROM academia.CURSOS; -- Error por que las viarables solo sirven para almacenar datos

DELIMITER // 
CREATE PROCEDURE proced1()
BEGIN
SELECT * FROM CURSOS WHERE COD_CURSO = @V1; 
END // 
DELIMITER ;
CALL proced1();

SET @V1 = 12;
CALL proced1();

-- == VARIABLES LOCALES == -- 
/*
 SON VARIABLES QUE SE CREAN DENTRO DE UN PROCEDIMIENTO, FUNCION O TRIGGER Y QUE SOLO SE PUEDEN USAR DENTRO DEL MISMO. 
 
	SINTAXIS-> 
    DECLARE nombre TIPO;
    SET VARIABLE = VALOR; 
    
*/

DELIMITER // 
CREATE PROCEDURE calcular_beneficio(p_codigo INT) 
BEGIN
	DECLARE num_alumnos INT; 
    DECLARE precio_curso decimal; 
    DECLARE beneficio decimal; 
    
    SELECT COUNT(*) INTO num_alumnos FROM ALUMNOS WHERE COD_CURSO = p_codigo; 
    SELECT precio INTO precio_curso FROM CURSOS WHERE COD_CURSO = p_codigo;
    
    SET BENEFICIO = num_alumnos * precio_curso; 
    
    SELECT CONCAT("La ganancia del curso ", p_codigo, "es ", beneficio);
    
END// 
DELIMITER ; 

call calcular_beneficio(10);

-- -- -- -- -- -- 
-- == PARAMETROS DE SALIDA == --

SET @RESULTADO = 0; 

DELIMITER // 
CREATE PROCEDURE CALCULAR_ALUMNOS(IN p_codigo INT, OUT res DECIMAL)
BEGIN
	SELECT COUNT(*) INTO RES FROM ALUMNOS WHERE COD_CURSO = p_codigo;
END //
DELIMITER ;


call CALCULAR_ALUMNOS(10, @RESULTADO);

SELECT @RESULTADO;

-- == SELECT INTO == -- 
/*
	SELECT INTO:
				variable
                fichero
                dumpfile
			
*/

SET @VAR = 10; 
SET @VAR2 = " ";

SELECT @VAR;
SELECT 23 INTO @VAR;
SELECT @VAR;

SELECT 45, 'CONQUER' INTO @VAR1, @VAR2;
SELECT @VAR, @VAR2;

-- == PARAMETROS DE ENTRADA/SALIDA -> INOUT == --

SET @VAR3 = 10; 
DELIMITER //
CREATE PROCEDURE calcula_asignaturas(INOUT par DECIMAL)
BEGIN
	select count(*)  INTO par from ASIGNATURAS where cod_curso = par;
END // 
DELIMITER ;

call calcula_asignaturas(@var3 );

select @VAR3;

SHOW PROCEDURE STATUS WHERE db = 'academia'; -- CONSULTAR LOS PROCEDIMIENTOS DENTRO DE UNA BD

SELECT * FROM information_schema.routines where ROUTINE_SCHEMA = "academia"; -- USANDO INFORMATION_SCHEMA

SHOW CREATE PROCEDURE calcula_asignaturas; -- VER COMO SE CREO UN PROCEDIMIENTO