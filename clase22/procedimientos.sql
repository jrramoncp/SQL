 /*
	- SQL no es un lenguaje procedural, por lo tanto tiene limitaciones para hacer algunas operaciones
    
    - Los procedimientos solucionan este problema ya que son objetos que contiene condigo SQL, se almacenan dentro de la base de datos y 
	  permiten el uso de comando procedurales: 
		* Condicionales
        * Bucles
        * Variables
        
	Exiten tres tipos de programas: 
    -- Procedimientos: 
    -> Es un fragmento de código que realiza una tarea concreta
    -> Es posible recibir parámetros (de entrada) y también devolver parámetros (de retorno)
    -> Pueden manejar tablas ejecuando operaciones e iteraciones de lectura y escritura
    -> Se almacenan en la base de datos en la que se crean
    -> Aceptan recursividad
    
    -- Funciones: 
    -> Similares a los procedimientos, pero pueden devolver valores así que podemos utilizarlas en sentencias SQL
    -> Como las funciones en un lenguaje de programación
    -> UPPER(), LENGTH() son ejemplos de funciones que he usado durante el curso
    -> También podemos crear nuestras propias funciones
    
    -- Triggers: 
    -> Son programas que se activan ante un suceso determinado
    -> Este suceso se suele corresponder con alguna instrucción de tipo DML (update, insert, delete)
    -> Permiten salvaguardar la seguridad y la integridad de los datos de las tablas
    
*/

-- // DELIMITADORES // --
/*
	Los delimitadores nos permiten definir un carácter para decirle a SQL que ha acabado el procedimiento. Por defecto es el caracter ; que utilizamos al final de 
    las querys. Pero para los procedimientos hay que usar uno distino, asi diferenciamos . Para ello usamos el comando DELIMITER seguido de lo que queramos que actue
    como delimitador del procedimiento, normalmente //

*/

-- == PROCEDIMIENTOS == --
/*
SINTAXIS ->

DELIMITER //
	CREATE PROCEDURE NOMBRE(PARAMETROS ENTRADA)
		BEGIN
			**LINEAS DE CODIGO;**
        END//
*/
DELIMITER // 
	CREATE PROCEDURE VER_CURSOS()
    BEGIN
		SELECT * FROM academia.CURSOS;
    END //

DELIMITER ;
CALL VER_CURSOS;

DELIMITER // 
	CREATE PROCEDURE INSERTA_CURSO()
    BEGIN
		INSERT INTO academia.CURSOS VALUES(9999, "CURSO9999", 200);
    END//

DELIMITER ;
CALL INSERTA_CURSO;

/*
 PARAMETROS: 
	IN -> DE ENTRADA
    OUT -> DE SALIDA
    INOUT -> AMBOS
*/

DELIMITER // 
	CREATE PROCEDURE CONSULTA_CURSO_PRECIO(IN p_precio DECIMAL)
    BEGIN
		SELECT * FROM CURSOS WHERE precio <= p_precio;
    END//
    
DELIMITER ; 
CALL CONSULTA_CURSO_PRECIO(220); 

DROP PROCEDURE INSERTA_CURSO; -- ELIMINANDO PROCEDIMIENTOS

DROP PROCEDURE IF EXISTS INSERTA_CURSO ; 
DELIMITER // 
	CREATE PROCEDURE INSERTA_CURSO(IN p_codigo INT, IN p_nombre VARCHAR(50), IN p_precio DECIMAL)
	BEGIN
		INSERT INTO academia.CURSOS VALUES(p_codigo, p_nombre, p_precio);
	END//
DELIMITER ;

CALL INSERTA_CURSO(8888, 'CURSO8888', 800);
CALL VER_CURSOS();












