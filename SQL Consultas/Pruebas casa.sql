#--1
SELECT *
FROM equipos;
#--2
SELECT nombre AS "Nombre equipos"
FROM equipos;
#--3
SELECT nombre,apellido
FROM jugadores;
#--4
SELECT puntosL AS "Local"," - ",puntosV AS "Visitante"
FROM partidos;
#--5
SELECT nombre,apellido,puesto
FROM jugadores
ORDER BY puesto;
#--6
SELECT nombre,equipo,puesto
FROM jugadores
ORDER BY equipo,puesto DESC;
#--7
SELECT DISTINCT equipo
FROM jugadores;
#--8
SELECT DISTINCT puesto
FROM jugadores;
#--9
SELECT *
FROM jugadores
LIMIT 5;
#--10
SELECT nombre,apellido,salario
FROM jugadores
ORDER BY salario DESC
limit 5;
#--11
SELECT nombre,apellido,0.82 * salario
FROM jugadores;
#--12
SELECT CURRENT_DATE();
#--13
SELECT CONCAT(nombre," ",apellido) AS "Jugador"
FROM jugadores;
#--14
SELECT nombre,apellido
FROM jugadores
WHERE puesto = "pivot";
#--15
SELECT *
FROM jugadores
WHERE puesto = "pivot" AND salario > 100000;
#--16
SELECT *
FROM jugadores
WHERE equipo !=3;

SELECT *
FROM jugadores
WHERE equipo NOT IN (3);
#--17
SELECT nombre,apellido,altura
FROM jugadores
WHERE altura > 2.05;
#--18
SELECT CONCAT(puntosL," - ",puntosV) AS "Resultado"
FROM partidos
WHERE year(fecha)=2018;
#--19
SELECT puntosL AS "Puntos equipo local"
FROM partidos
WHERE year(fecha)=2018 AND MONTH(fecha)=1;
#--20
SELECT *
FROM jugadores
WHERE salario > 100000
ORDER BY salario DESC;
#--21
SELECT Nombre
FROM equipos
WHERE pabellon is NULL;
#--22
SELECT nombre,altura
FROM jugadores
WHERE altura is NOT NULL;
#--23
SELECT nombre,puesto
FROM jugadores
WHERE puesto !="base";

SELECT nombre, puesto
FROM jugadores
WHERE NOT puesto="base";
#--24
SELECT nombre,puesto
FROM jugadores
WHERE puesto ="escolta" OR puesto="base";
#--25
SELECT nombre,puesto
FROM jugadores
WHERE puesto not IN ("escolta","base");
#--26
SELECT *
FROM equipos
WHERE ciudad not IN ("Madrid","Valencia");
#--27
SELECT nombre
FROM jugadores
WHERE equipo IN (1,2) AND puesto ="pivot";
#--28
SELECT nombre,salario
FROM jugadores
WHERE salario BETWEEN 60000 AND 100000;
#--29
SELECT nombre,salario
FROM jugadores
WHERE salario not BETWEEN 50000 AND 60000;
#--30
SELECT *
FROM partidos
WHERE MONTH(fecha) =1;

SELECT *
FROM partidos
WHERE fecha BETWEEN '2018-01-01' AND '2018-01-31';

SELECT *
FROM partidos
WHERE DAY(fecha) BETWEEN 1 AND 31 AND MONTH(fecha) =1;
#--31
SELECT Nombre
FROM jugadores
WHERE Nombre LIKE "J%";
#--32
SELECT Nombre
FROM jugadores
WHERE Nombre LIKE "%e";
#--33
SELECT Nombre
FROM jugadores
WHERE Nombre LIKE "%i%";
#--34
SELECT Nombre
FROM jugadores
WHERE Nombre LIKE "_a%";
#--35
SELECT Nombre
FROM jugadores
WHERE Nombre LIKE "%i_";
#--36
SELECT Nombre
FROM jugadores
WHERE Nombre LIKE "_____";
#--37
SELECT COUNT(*) AS "Nº Jugadores"
FROM jugadores;
#--38
SELECT COUNT(*) AS "Nº Jugadores mas de 2 metros"
FROM jugadores
WHERE altura >2;
#--39
SELECT COUNT(*) AS "Nº Jugadores"
FROM jugadores
WHERE puesto="pivot";
#--40
SELECT COUNT(DISTINCT ciudad) AS "Ciudades con equipos"
FROM equipos;
#--41
SELECT AVG(salario) AS "salario medio"
FROM Jugadores;
#--42
SELECT AVG(altura) AS "Altura media del E1"
FROM jugadores
WHERE equipo=1;
#--43
SELECT MAX(salario) AS "salario maximo",
MIN(salario) AS "minimo",MAX(salario) - MIN(salario) AS "diferencia"
FROM jugadores;
#--44
SELECT SUM(salario) AS "Total salario E1"
FROM jugadores
WHERE equipo=1;
#--45
SELECT SUM(salario) * 0.82/12 AS "Salario mensual"
FROM jugadores;
#--46
SELECT equipo,COUNT(*) AS "Nº jugadores por equipo"
from jugadores
GROUP BY equipo;
#--47
SELECT puesto,AVG(altura) AS "Altura media"
from jugadores
group BY puesto;
#--48
SELECT MIN(salario) AS "salario minimo",MAX(salario) AS "Maximo salario"
from Jugadores
group by equipo;
#--49
SELECT equipo,AVG(salario) AS "salario medio"
from jugadores
group by equipo
HAVING AVG(salario) >80000;
#--50
SELECT equipo,SUM(salario) AS "salario total"
from jugadores
group by equipo
HAVING COUNT(*) < 4;
#--51
SELECT puesto, AVG(salario) AS “Salario Medio”
FROM jugadores
GROUP BY puesto
HAVING AVG(salario) > 95000;
#--52
SELECT puesto,MAX(altura)
from jugadores
group by puesto
having AVG(altura) > 2.00;
#--53
SELECT *
from jugadores
WHERE salario >
(SELECT salario
from jugadores
WHERE apellido ='Llull');
#--54

SELECT nombre,apellido,altura
FROM Jugadores
WHERE altura =
(SELECT altura
from jugadores
WHERE nombre="Alberto" AND apellido="Diaz");

SELECT nombre,apellido,altura
FROM Jugadores
WHERE altura =
(SELECT altura
from jugadores
WHERE nombre LIKE "%Alberto%" AND apellido LIKE "%Diaz%");
#--55
SELECT nombre,apellido
from jugadores
WHERE puesto =
(SELECT puesto
from jugadores
WHERE nombre LIKE "%Sergio%" AND apellido LIKE "%Llull%");
#--56
SELECT nombre,apellido
from jugadores
where equipo = 
(SELECT equipo
from jugadores
where nombre="Rudy" AND apellido="Fernandez")
ANd not (nombre="Rudy" AND apellido="Fernandez");