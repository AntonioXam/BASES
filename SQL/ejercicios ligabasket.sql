CREATE DATABASE ligabasket;

USE ligabasket;

SOURCE C:\Users\ibane\OneDrive\Escritorio\ligabasket.sql


#--1º
SELECT *
FROM EQUIPOS
WHERE ciudad NOT LIKE "M%";

#--2º
SELECT *
FROM JUGADORES
WHERE salario = 
(SELECT MAX(salario)
FROM JUGADORES);

#--3º
SELECT equipo, SUM(altura) AS "Suma de las alturas"
FROM JUGADORES
GROUP BY equipo;

#--4º
SELECT equipo, SUM(salario) AS "Suma de los salarios"
FROM JUGADORES
GROUP BY equipo;

#--5º
SELECT SUM(salario) AS "Mayor salario total"
FROM jugadores
GROUP BY equipo
ORDER BY SUM(salario) DESC
LIMIT 1;

#--6º
SELECT COUNT(*) AS "Partidos equipo 3 como local"
FROM PARTIDOS
WHERE elocal =3;

#--7
SELECT COUNT(*) AS "Partidos Valencia como local"
FROM PARTIDOS
WHERE elocal =
(SELECT id_equipo
FROM EQUIPOS
WHERE nombre LIKE "%Valencia%");

#--8
SELECT nombre,apellido
FROM JUGADORES
WHERE equipo IN
(SELECT id_equipo
FROM EQUIPOS
WHERE nombre LIKE "%Madrid%");

#--9
SELECT nombre,apellido
FROM JUGADORES
WHERE id_jugador = id_capitan;

#--10
SELECT equipo
FROM JUGADORES
GROUP BY equipo
HAVING COUNT(*) >3;