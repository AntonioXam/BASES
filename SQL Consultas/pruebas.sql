/*Nombre , apellidos y puesto de los jugadroes*/

SELECT nombre, apellido,altura
FROM JUGADORES
ORDER BY altura DESC;

/* distinguir y limitar las columnas*/

SELECT DISTINCT puesto
FROM JUGADORES;

SELECT DISTINCT equipo 
FROM JUGADORES;

/*mostrar todo*/

SELECT *
FROM EQUIPOS;
 
SELECT *
FROM JUGADORES;

SELECT *
FROM PARTIDOS;

 /*limitar*/
 
SELECT nombre, apellido,altura
FROM JUGADORES
ORDER BY altura DESC 
LIMIT 5;

#--nombre apellido y sueldo del jugador que mas cobra.

SELECT nombre,apellido,salario
FROM JUGADORES
ORDER BY salario DESC
LIMIT 1;



#-- aplicando vaciaciones:

SELECT nombre,apellido,salario*0.82 AS "Sueldo neto"
FROM JUGADORES
ORDER BY salario;

#-- concatenando columnas.

SELECT CONCAT(nombre," ",apellido) AS judador, salario AS sueldo
FROM JUGADORES
ORDER BY nombre;

#-- mostrar fecha.

SELECT CURRENT_DATE();

#-- mostrar fecha y hora.

SELECT NOW();

#-- condiciones:

SELECT CONCAT(nombre," ",apellido) AS "Judadores Pivot"
FROM JUGADORES
WHERE puesto= "pivot";


#-- Mostrar los datos de los jugadores que no pertenezcan al equipo 3.

#-- Nombre ,apellido y altura de los jugadores que superan los : 2.05.


SELECT *
FROM JUGADORES
WHERE equipo !=3;  #-- Tambien valdrá : " <> "

SELECT nombre,apellido,altura
FROM JUGADORES
WHERE altura>2.05;

SELECT *
FROM JUGADORES
WHERE puesto="pivot" AND salario>100000;

#-- Fechas.

YEAR() 
MONTH()
DAY()

#-- Now para el dia de hoy.

SELECT YEAR(NOW());

#-- La fecha es nombre de columna.

SELECT CONCAT(puntosL," - ",puntosV) AS "Resultado"
FROM PARTIDOS
WHERE year(fecha)=2018;

SELECT puntosL, fecha
FROM PARTIDOS
WHERE YEAR(fecha)=2018 AND MONTH(fecha)=1;

SELECT*
FROM JUGADORES
WHERE salario> 100000
ORDER BY salario DESC
LIMIT 5;