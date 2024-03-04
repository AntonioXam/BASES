source C:\liga_baloncesto.sql


--1

SELECT *
FROM EQUIPOS
WHERE ciudad not like 'M%';

--2

SELECT *
FROM JUGADORES
WHERE salario IN (SELECT MaX(salario) FROM JUGADORES);

--3

SELECT equipo,SUM(altura)
FROM JUGADORES
group BY equipo;

--4
SELECT equipo,SUM(salario) 
FROM JUGADORES
Group by equipo;

--5
SELECT SUM(salario) AS "Mayor salario total"
FROM jugadores
GROUP BY equipo
ORDER BY SUM(salario) DESC
LIMIT 1;

--6

SELECT COUNT(*) AS "Partidos como local del equipo 3"
FROM partidos
WHERE elocal=3;

--7

SELECT COUNT(*) AS "Partidos como local del Valencia"
FROM partidos
WHERE elocal=(SELECT id_equipo
FROM equipos
WHERE nombre LIKE "%Valencia%");

--8

SELECT nombre,apellido
FROM JUGADORES
WHERE equipo IN ( SELECT id_equipo FROM EQUIPOS WHERE nombre like '%MADRID%');

--9

SELECT nombre,apellido
FROM JUGADORES
WHERE id_jugador IN (SELECT id_capitan FROM JUGADORES);

--10

SELECT equipo 
FROM JUGADORES
group by equipo
having count(*) >3;
