-- == CHECK OPTION == -- 
/* VAMOS A CREAR UNA VISTA CON UNA CONDICIÓN, Y VAMOS A INGRESAR DATOS A TRAVÉS DE LA VISTA QUE NO ESTAN CONTEMPLADOS EN LA MISMA, LO CUAL ES UNA 
INCONGRUENCIA.  */

SELECT * FROM VISTA; 
INSERT INTO VISTA VALUES (23, 'XXXXX');
INSERT INTO VISTA VALUES (43, 'YYYYY');

CREATE OR REPLACE VIEW VISTA_CHECK AS 
SELECT * FROM TABLA_VISTA WHERE CODIGO > 4;

SELECT * FROM VISTA_CHECK;
SELECT * FROM TABLA_VISTA;

INSERT INTO VISTA_CHECK VALUES (3, 'VISTA');

/*
PARA EVITAR ESTO TENEMOS CHECK OPTION. 

CHECK OPTION TIENE EN CUENTA LOS FILTROS QUE LE TENEMOS A LA VISTA, DE MANERA QUE SI LO QUE INTENTAMOS INSERTAR NO CUMPLE CON LOS REQUISITOS DE LA VISTA
NO SE INSERTA
*/

CREATE OR REPLACE VIEW VISTA_CHECK AS 
SELECT * FROM TABLA_VISTA WHERE CODIGO > 4
WITH CHECK OPTION;

INSERT INTO VISTA_CHECK VALUES (4, 'VISTA2'); 

