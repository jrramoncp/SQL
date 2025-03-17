-- == SEGURIDAD == -- 
/*
	Los usuarios estan formados por dos partes, el usuario y el host (usuario@host). Host es la dirección ip de la maquina desde la que se esta conectando. 

De esta manera podremos tener: 

‘usuario1’@’190.168.10.1’ 

Si ‘usuario1’ intentase entrar desde la base de datos con otro host, posiblemente se le denegaría el acceso, de hecho, otro usuario con otro host serian dos usuarios diferentes. Por ejemplo 

‘usuario1’@’190.168.10.1’ 

‘usuario1’@’190.168.10.12’

Esto serían dos usuarios diferentes, ya que todo forma parte del usuario.  

Hay formas en las que podemos evitar esto. Por ejemplo usando metacaracteres como el siguiente ejemplo: 

‘usuario’@’%’

Este usuario podría conectarse desde cualquier host (maquina), da igual el host que dentra detras. 

Para otra cosa que utilizamos el % es para definir un rango de direcciones IP. 

‘usuario1’@’190.168.10.%’
	
    PARA CREAR UN USUARIO USAMOS EL SIGUIENTE COMANDO -> CREATE USER USUARIO@HOST BY 'PASSWORD';
*/

CREATE USER 'USER1'@'192.168.12.1' IDENTIFIED BY 'Prueba1234@';

SELECT * FROM mysql.user; -- Ver los usuarios

SET PASSWORD FOR 'USER1'@'192.168.12.1' = 'NuevaPass12@'; -- Cambiar la contraseña de un usuario
ALTER USER ‘USER1’@’%’ IDENTIFIED BY ‘prueba2’;
