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

#-- cambiar formato fecha

SELECT CONCAT(day(NOW()),"/",month(NOW()),"/",year(NOW())) AS fecha;

#-- buscar NULL : IS NULL , lo contrario IS NOT NULL
SELECT *
FROM EQUIPOS
WHERE pabellon IS NULL;

SELECT *
FROM EQUIPOS
WHERE pabellon IS NOT NULL;

#-- bucar valores quitando con( != o NOT ) NOT se pone al principio.

SELECT nombre, puesto
FROM JUGADORES
WHERE puesto!="base";

SELECT nombre, puesto
FROM JUGADORES
WHERE NOT puesto="base";

#-- buscar los valores con OR = si el OR con NOT va entre ().

SELECT nombre, puesto
FROM JUGADORES
WHERE puesto="base" OR puesto="escolta";

SELECT nombre, puesto
FROM JUGADORES
WHERE NOT (puesto="base" OR puesto="escolta");

#-- buscar valores con IN

SELECT nombre, puesto
FROM JUGADORES
WHERE puesto IN ("base", "escolta");

SELECT nombre, puesto
FROM JUGADORES
WHERE puesto NOT IN ("base", "escolta");


SELECT CONCAT(nombre," ", apellido) AS "nombre y apellidos", puesto
FROM JUGADORES
WHERE puesto IN ("base", "escolta");

#-- Mas ejemplos con IN , OR y NOT IN

SELECT *
FROM EQUIPOS
WHERE ciudad NOT IN ("Valencia", "Madrid");


SELECT Nombre
FROM JUGADORES
WHERE puesto="pivot" AND (equipo=1 OR equipo=2);

SELECT Nombre
FROM JUGADORES
WHERE puesto="pivot" AND equipo IN (1,2);

#-- Intervalos BETWEEN

#-- Trimestre
SELECT *
FROM PARTIDOS
WHERE YEAR(fecha) =2018 AND MONTH(fecha) IN(1,2,3);

#-- Trimestre
SELECT *
FROM PARTIDOS
WHERE MONTH(fecha) BETWEEN 1 AND 3 AND YEAR(fecha)=2018;

SELECT *
FROM PARTIDOS
WHERE DAY(fecha) BETWEEN 1 AND 15 AND YEAR(fecha)=2018;

SELECT *
FROM PARTIDOS
WHERE DAY(fecha) BETWEEN 16 AND 31 AND YEAR(fecha)=2018;

SELECT *
FROM PARTIDOS
WHERE DAY(fecha)>15 AND YEAR(fecha)=2018;


/* LIKE se una para "caracteres" 
empieza por letra y %*/

SELECT nombre
FROM JUGADORES
WHERE nombre LIKE "J%";

#-- ultima
SELECT nombre
FROM JUGADORES
WHERE nombre LIKE "%e";


SELECT nombre
FROM JUGADORES
WHERE nombre LIKE "%i%";

SELECT nombre
FROM JUGADORES
WHERE nombre LIKE "__a%";


SELECT nombre
FROM JUGADORES
WHERE nombre LIKE "V%i%";

#p-- penultima
SELECT nombre
FROM JUGADORES
WHERE nombre LIKE "%i_";

#-- contenga 5 letras
SELECT nombre
FROM JUGADORES
WHERE nombre LIKE "____";

SELECT nombre
FROM JUGADORES
WHERE nombre LIKE "% %";

#-- contador : COUNT() 

SELECT COUNT(*) AS "Nº jugadores registrados"
FROM JUGADORES;

SELECT COUNT(*) AS "Nº jugadores de mas de 2 metros"
FROM JUGADORES
WHERE altura > 2.00;

SELECT COUNT(id_jugador) AS "Nº de pivots"
FROM JUGADORES
WHERE puesto="pivot";

#-- COUNT con DISTINCT
SELECT COUNT(DISTINCT ciudad) AS "Nº ciudades" 
FROM EQUIPOS;


#-- La media : AVG

SELECT AVG(salario) AS "Salario medio"
FROM JUGADORES;


SELECT AVG(altura) AS "Media altura equipo 1"
FROM JUGADORES
WHERE equipo=1;


SELECT MAX(salario) AS "Salario máximo",
MIN(salario) AS "Salario mínimo", 
MAX(salario) - MIN(salario) AS "Diferencia"
FROM JUGADORES;

SELECT SUM(salario) AS "Total Salarios"
FROM JUGADORES
WHERE equipo=1;

SELECT SUM(salario)*0.82/12 AS "Salario Mensual"
FROM JUGADORES;
	  
#-- Agrupar filas con el comando GROUP BY	  
	  
	SELECT equipo, COUNT(*) AS "Nº Judadores"
    FROM JUGADORES
	GROUP BY equipo;	
	
	SELECT puesto, COUNT(*) AS "Nº Judadores"
    FROM JUGADORES
	GROUP BY puesto;	
	
	SELECT equipo, COUNT(*) AS "Nº Judadores"
    FROM JUGADORES
	WHERE equipo=2
	GROUP BY equipo;	
	
	SELECT COUNT(*) AS "Nº Judadores"
    FROM JUGADORES
	WHERE equipo=2
	
	
	SELECT COUNT(*) AS "Partidos visitante"
	FROM PARTIDOS
	WHERE evisit=6;
	
	
	SELECT equipo, MIN(salario) "Min", MAX(salario) "Max"
	FROM JUGADORES
	GROUP BY equipo;
	
	
	SELECT equipo, MIN(salario)AS "Min", MAX(salario)AS "Max"
	FROM JUGADORES
	GROUP BY equipo;
	
	SELECT equipo, AVG(salario) AS " salario medio"
	FROM JUGADORES
	GROUP BY equipo
	HAVING AVG(salario) > 80000;
	
	SELECT equipo, SUM(salario) AS " Salario Total"
	FROM JUGADORES
	GROUP BY equipo
	HAVING COUNT(*) < 4;
	
	SELECT puesto, Max(altura) AS "Altura máxima"
	FROM JUGADORES
	GROUP BY puesto
	HAVING AVG(altura) > 2;
	
	SELECT puesto, AVG(salario) AS "Salario Medio"
	FROM JUGADORES
	GROUP BY puesto
	HAVING AVG(salario) > 95000;
	
	
	#-- sub consultas
	
	
SELECT *
FROM JUGADORES
WHERE salario > 
(SELECT salario 
FROM JUGADORES 
WHERE apellido = "Llull");

	
SELECT nombre, apellido, altura
FROM JUGADORES
WHERE altura = ( SELECT altura 
				 FROM JUGADORES 
				 WHERE nombre="Alberto" AND apellido="Diaz");

#--Mostrar el nombre y aplledio de los jugadoes
#-- que jueguen en la misma posicion que Sergio Llull

SELECT nombre, apellido
FROM JUGADORES
WHERE puesto = (SELECT puesto
				FROM JUGADORES
				WHERE nombre="Sergio" AND apellido="Llull"
AND NOT(nombre="Sergio" AND apellido="Llull")
AND salario > 80000;

/* Mostrar nombre y aplledio de los compañeros de equipo de Rudy Fernandez
*/


SELECT nombre, apellido
FROM JUGADORES
WHERE equipo = ( SELECT equipo
				 FROM JUGADORES
				 WHERE nombre="Rudy" AND apellido="Fernandez")
AND NOT (nombre="Rudy" AND apellido="Fernandez");

/*Obtener el nombre , apellido, salario de los JUGADORES
que cobren mens del salario media de la liga*/

SELECT nombre, apellido, salario
FROM JUGADORES
WHERE salario < (SELECT AVG(salario)
				 FROM JUGADORES);
				 
/* obtener el nombre, apellido, salario del jugador que mas cobra*/

SELECT nombre, apellido, salario
FROM JUGADORES
ORDER BY salario DESC
LIMIT 1;


SELECT nombre, apellido, salario
FROM JUGADORES
WHERE salario = (SELECT Max(salario)
				 FROM JUGADORES);
				 

#-- ALL y ANY

SELECT nombre
FROM JUGADORES
WHERE salario > ALL (SELECT salario
FROM JUGADORES
WHERE equipo=3);

SELECT nombre
FROM JUGADORES
WHERE salario > (SELECT Max(salario)
FROM JUGADORES
WHERE equipo=3);

SELECT nombre
FROM JUGADORES
WHERE salario > ANY (SELECT salario
FROM JUGADORES
WHERE equipo=3);


SELECT nombre, apellido,salario
FROM JUGADORES
WHERE salario > ANY (SELECT salario
FROM JUGADORES
WHERE equipo=2);
 
 
 SELECT *
 FROM JUGADORES
 WHERE equipo IN (SELECT id_equipo
 FROM equipos
 WHERE ciudad = "Madrid");
 
 
 
 SELECT *
 FROM jugadores,equipos;
 
 SELECT *
 FROM JUGADORES as J,EQUIPOS as E
 WHERE J.equipo=E.id_equipo;
 
  SELECT J.nombre,apellido,puesto,E.nombre
 FROM JUGADORES as J,EQUIPOS as E
 WHERE J.equipo=E.id_equipo;

 SELECT E.nombre, COUNT(*) As "Nº Jugadores"
 FROM JUGADORES as J,EQUIPOS as E
 WHERE J.equipo=E.id_equipo
 GROUP BY E.nombre;
 
  SELECT COUNT(*) As "Nº Jugadores"
 FROM JUGADORES as J,EQUIPOS as E
 WHERE J.equipo=E.id_equipo AND ciudad LIKE "M%";

#--nombre y apellido de cada jugador junto al nombre equipo
 SELECT CONCAT(J.nombre," ",apellido) As "Nombre y apellidos",E.nombre As "Equipos"
 FROM JUGADORES as J,EQUIPOS as E
 WHERE J.equipo=E.id_equipo;
  
SELECT CONCAT(J.nombre," ",apellido) As "Nombre y apellidos",E.nombre As "Equipos"
FROM JUGADORES J INNER JOIN EQUIPOS E
ON equipo = id_equipo;
#--nombre de cada equipo y numero de partidos que han jugado como locales

SELECT E.Nombre As "Equipo",COUNT(*) As "Nº Partidos"
FROM PARTIDOS as P,EQUIPOS as E
WHERE P.elocal = E.id_equipo
GROUP BY P.elocal;

SELECT E.Nombre As "Equipo",COUNT(*) As "Nº Partidos"
FROM PARTIDOS as P INNER JOIN EQUIPOS as E
ON P.elocal = E.id_equipo
GROUP BY P.elocal;

#--nombre de equipo y salario maximo de entre todos sus JUGADORES
SELECT E.nombre,Max(salario) As "Salario entre todos"
FROM JUGADORES as J,EQUIPOS as E
WHERE J.equipo=E.id_equipo
GROUP BY E.nombre;

#-- Numero de jugadores de Equipos de Madrid
SELECT COUNT(*) As "Nº Jugadores de Equipos de Madrid"
FROM JUGADORES as J,EQUIPOS as E
WHERE J.equipo=E.id_equipo AND ciudad LIKE "%Madrid%";
 
SELECT COUNT(*) As "Nº Jugadores de Equipos de Madrid"
FROM JUGADORES as J INNER JOIN EQUIPOS as E
ON J.equipo=E.id_equipo 
WHERE ciudad LIKE "%Madrid%";



(SELECT nombre from jugadores where equipo=1)
UNION
(SELECT nombre from jugadores where equipo=2)
ORDER BY nombre;

SELECT DISTINCT elocal As "Equipo que han jugado como Local y Visitane"
FROM PARTIDOS
where elocal in (SELECT evisit from partidos);

SELECT DISTINCT elocal As "Equipo que han jugado como Local y no como Visitane"
FROM PARTIDOS
where elocal not in (SELECT evisit from partidos);

