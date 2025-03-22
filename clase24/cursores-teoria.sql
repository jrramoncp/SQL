-- == CURSORES Y TRIGGERS == --
/*
		CURSORES
	Son estructuras de datos que almacenan el resultado de una SELECT y que se pueden recorrer de forma secuencial. 
    
    Propiedades básicas: 
		-ASENSITIVE / INSENSITIVE -> El servidor puede hacer o no una copia de los datos resultantes. En 'asensitive' se apunta a los datos reales 
        y en 'insesitive' se usa una copia temporal del dato. 
        -READ-ONLY -> No se pueden modificar las tablas asociadas a través del cursos
		-NON-SCROLLABLE -> Solo pueden recorrerse de forma secuencial
        
	Comandos:
		DECLARE -> Se declara el cursor con la SELECT asociada
		OPEN -> Para abrir el cursor
		FETCH -> Se recuperan las filas una a una de forma secuencial
		CLOSE -> Para cerrar el cursor
    
    Los cursores de declaran SIEMPRE DESPUES DE LA DECLARACION DE VARIABLES LOCALES Y ANTES QUE LA DECLARACION DE HANDLERS. 
    
    Ejemplo:
	DECLARE nombre_curso VARCHAR(50)
    DECLARE cursor_cursos CURSOR FOR select nombre from cursos;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND terminado = true;
    OPEN cursor_cursos;
    bucle:LOOP
		FETCH cursor_cursos into nombre_cursos;
        IF terminado THEN 
        leave bucle;
        END IF;
			-- instruciones para el nombre
            
	END LOOP
    CLOSE cursor_cursos;

*/









