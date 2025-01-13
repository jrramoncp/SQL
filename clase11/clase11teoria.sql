/* ==== OPERADORES LOGICOS ==== 
AND ---> Combina dos o más condiciones y devuelve True si todas se cumplen, si no, devuelve False
OR ---> Combina dos o más condiciones y devuelve True si se cumple al menos una de ella, si no devuelve False
NOT ---> Niega la operación lógica a la que precede

**CONSEJO**
Utilizar paréntesis siempre con los operadores lógicos y las condicones compuestas
*/
-- EJEMPLO DE AND
-- Que la población sea mas de 1millon de habitantes y que la esperanza de vida supere los 75 años
select Name, Continent, Region, Population, LifeExpectancy from world.country 
	where (population >= 10000000 and LifeExpectancy >= 75);

-- EJEMPLO DE OR
-- Paises con un area mayor a 30000 y con un area de mas de 5 millones
select Name, Continent, Region, Population, SurfaceArea from world.country
	where (SurfaceArea > 30000 or Population > 5000000);

-- EJEMPLO DE NOT
-- Paises con una esperanza de vida mayor de 80 años
select Name, Continent, Region, Population, LifeExpectancy from world.country 
	where NOT (LifeExpectancy < 80);