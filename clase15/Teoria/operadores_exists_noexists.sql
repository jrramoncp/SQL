-- EXISTS Y NOT EXISTS
/*
	EXISTS: Comprueba la existencia de alguna fila en la subconsulta y devuelve true si la subconsulta devuelve al menos una fila
*/

-- EJEMPLOS: 
-- Ciudades de paises con esperanza de vida mayor a 80 años
SELECT Name FROM city AS ciudades
WHERE EXISTS (SELECT * FROM country WHERE LifeExpectancy > 80 AND Code = ciudades.CountryCode);

-- Paises que tengan alguna ciudad, que supere los 6.000.00 de habitantes
SELECT Name FROM country AS paises 
WHERE EXISTS (SELECT * FROM city WHERE population > 6000000 AND CountryCode = paises.Code);