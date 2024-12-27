/*TIPOS DE DATOS MySQL*/
-- 1.Tipos de Cadena
/*
TIPO 				DESCRIPCION																				TAMAÑO
CHAR(size)			Cadenas de longitud FIJA.(Se especifica el tamaño)										0 a 255
VARCHAR(size)		Cadenas de longitud Variable.(Se especifica el máximo)									0 a 65535
BINARY(size)		Cadena de longituda FIJA. Almacena cadenas de bytes binarios							0 a 255
VARBINARY(size)		Igual que VARCHAR. Almacena cadenas de bytes binarios									0 a 65535
TYNYBLOB			Binary Large Objects																	255
TINITEXT			Contiene una cadena con longitud máxima de 255 caracteres								255
Text(size)			Contiene una cadena con una longitud máxima de 65525 caracteres							0 a 65535
BLOB(size)			Binary Large Objects																	0 a 65535
MEDIUMTEXT			Contiene una cadena con una longitud máxima de 167772125 caracteres						0 a 167772125
MEDIUMBLOB			Contiene un Binary Large Object con una longitud máxima de 167772125					0 a 167772125
LONGTEXT			Contiene una cadena con una longitud máxima de 4294967295 caracteres					0 a 4294967295
LONGBLOB			Contiene un Binary Large Object con una longituda máxima de 4294967295					0 a 4294967295
ENUM(val1, val2..)	Objeto cadena que solo puede tener un valor elegido de la lista de valores posibles
SET(val1, val2..)  	Un objeto de cadena que puede tener 0 o más valores, de una lista de valores posibles
*/
-- 2.Tipos Numéricos
/*
TIPO 				DESCRIPCION																				
BIT(size)			Valor de bits. El número de bits se especifica en 'size', que puede contener un valor de 1 a 64
TINYINT(size)		Para números enteros muy pequeños. El rango con sigo es de -128 a 127. El intervalo sin signo es de 0 a 255
BOOL				Cero se considera falso, los valores distintos de 0 se consideran verdaderos
BOOLEAN				Igual que BOOL
SMALLINT(size)		Para enteros pequeños. El rango con signo es de -32768 a 32767 y sin signo es de 0 a 65525
MEDIUMINT(size)		Para enteros medianos. El rango con signo va de -8388608 a 8388607, y sin signo de 0 a 167772125
INT(size)			Para números desde -2147483648 hasta 2147483647. Si se define UNSIGNED (sin signo) permite numeros de 0 a 4294967295
INTEGER(size) 		Igual que int
BIGINT(size)		Permite numeros desde -9223372036854775808 hasta 9223372036854775807. Si se define como UNSIGNED permite numeros de 0 hasta 18446744073709551615
FLOAT(size,d) 		Un número de coma flotante. El número total de dígitos se espeficia en 'size'. Esta sintaxis se eliminara  en versiones futuras de MySQL
FLOAT(p)			Un número de coma flotante. MySQL utiliza el valor p para determinar si debe usar FLOAT o DOUBLE.
DOUBLE(size,d) 		Un número de coma flotante de tamaño normal. 
DECIMAL(sice,d)		Un número exacto de punto fijo
DEC(size,d)			Igual a DECIMAL(tamaño,d)
*/
-- 3.Tipos de Fecha y hora
/*
TIPO 				DESCRIPCION	
DATE				Una fecha. Formato AAAA-MM-DD. Rango admitido desde 1000-01-01 a 9999-12-31
DATETIME(fsp)		Una combinación de fecha y hora. Agregar DEFAULT y ON UPDATE en la definicion de la columna para obtener inicialización automática 
					y la actualización a la fecha y hora actuales. Formato AAAA-MM-DD hh:mm:ss
TIMESTAMP(fsp)		Una marca de tiempo. Los valores TIMESTAMP se almacenan como el número de segundos desde la epoca de Unix. Mismo formato que el anterior
					La inicialización y actualización se pueden especificar mediante CURRENT_TIMESTAMP_DEFAULT, CURRENT_TIMESTAMP y ON UPDATE
TIME(fsp)			Valor de tiempo. Formato hh:mm:ss. 
YEAR				Un año en formato de cuatro dígitos. Valores permitados de 1901 a 2155 y 0000. MySQL 8.0 no soporta año en formato de dos dígitos
*/
-- 4.Tipos Espaciales
/*
TIPO 						DESCRIPCION	
GEOMETRY					Contiene valores de geometría simples
POINT						Contiene valores de geometría simples
LINESTRING					Contiene valores de geometría simples
POLYGON						Contiene valores de geometría simples
MULTIPOINT					Contiene colecciones de valores de geometría
MULTIESTRING				Contiene colecciones de valores de geometría
MULTIPOLYGON				Contiene colecciones de valores de geometría
GEOMETRYCOLLECTION			Contiene colecciones de valores de geometría
-- 5. JSON
/* JAVASCRIPT OBJECT NOTATION.
Son documentos que contienen propiedades y valores. MySQL los almacena en un formato optimizado para mejorar busquedas.*/
