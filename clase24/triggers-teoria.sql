-- == TRIGGERS == -- 
/*
	-> Son procedimientos almacenados que se ejecutan de forma automatica cuando ocurre algún evento específico dentro de una base de datos.
    
    -> Estos eventos se corresponden con instrucciones DML: INSERT, UPDATE, DELTE
    
    -> Se utilizan con motivos de seguridad, para salvaguardar la integridad de los datos y para configurar valores por defecto o hacer cálculos predefinidos
	
    Por ejemplo: Cuando hagamos un insert en una tabla con notas de alumnos, que haga la nota media automaticamente. 
    
    Momentos en el que se puede lanzar un trigger: 
		-> BEFORE: Antes de hacer la operación
        -> AFTER: Despues de hacer la operación
        
	Evento que lo dispara: 
		-> INSERT
        -> UPDATE
        -> DELETE
        
	Activar el TRIGGER para cada fila: 
		-> For each row
*/

CREATE TABLE AUDIT(
	CODIGO INT AUTO_INCREMENT PRIMARY KEY, 
	TABLA VARCHAR(50), 
    OPERACION VARCHAR(50), 
    USUARIO VARCHAR(50)
); 

DELIMITER //
DROP TRIGGER IF EXISTS audit_cursos// 

CREATE TRIGGER  audit_cursos BEFORE INSERT ON CURSOS FOR EACH ROW
BEGIN 
	INSERT INTO AUDIT(TABLA, OPERACION, USUARIO) VALUES ('CURSOS', 'INSERT', current_user());
END// 

INSERT INTO CURSOS VALUES(23333, 'CURSO-23333', 100)//
INSERT INTO CURSOS VALUES(23343, 'CURSO-28333', 100)//
INSERT INTO CURSOS VALUES(23383, 'CURSO-29333', 100)//

SELECT * FROM AUDIT//