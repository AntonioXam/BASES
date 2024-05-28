--1

DROP DATABASE IF EXISTS ligabasket;

CREATE DATABASE ligabasket;

USE ligabasket;


SOURCE C:/ligabasket.sql
--2

describe equipos;
describe jugadores;
describe partidos;

SELECT * FROM equipos;
SELECT * FROM jugadores;
SELECT * FROM partidos;



+-----------+-----------+------+-----+---------+----------------+
| Field     | Type      | Null | Key | Default | Extra          |
+-----------+-----------+------+-----+---------+----------------+
| id_equipo | int(11)   | NO   | PRI | NULL    | auto_increment |
| nombre    | char(50)  | NO   |     | NULL    |                |
| ciudad    | char(50)  | NO   |     | NULL    |                |
| pabellon  | char(100) | YES  |     | NULL    |                |
+-----------+-----------+------+-----+---------+----------------+

+------------+----------+------+-----+---------+----------------+
| Field      | Type     | Null | Key | Default | Extra          |
+------------+----------+------+-----+---------+----------------+
| id_jugador | int(11)  | NO   | PRI | NULL    | auto_increment |
| nombre     | char(30) | NO   |     | NULL    |                |
| apellido   | char(30) | NO   |     | NULL    |                |
| puesto     | char(20) | NO   |     | NULL    |                |
| salario    | int(11)  | NO   |     | NULL    |                |
| altura     | float    | YES  |     | NULL    |                |
| id_capitan | int(11)  | YES  | MUL | NULL    |                |
| equipo     | int(11)  | NO   | MUL | NULL    |                |
+------------+----------+------+-----+---------+----------------+

+------------+---------+------+-----+---------+----------------+
| Field      | Type    | Null | Key | Default | Extra          |
+------------+---------+------+-----+---------+----------------+
| id_partido | int(11) | NO   | PRI | NULL    | auto_increment |
| elocal     | int(11) | NO   | MUL | NULL    |                |
| evisit     | int(11) | NO   | MUL | NULL    |                |
| puntosL    | int(11) | NO   |     | NULL    |                |
| puntosV    | int(11) | NO   |     | NULL    |                |
| fecha      | date    | YES  |     | NULL    |                |
+------------+---------+------+-----+---------+----------------+




#--Crea un procedimiento que muestre el nombre del equipo ganador de un partido. El procedimiento
#--recibirá como parámetro el identificador del partido sin inner join 



DELIMITER $$
DROP PROCEDURE IF EXISTS ganador $$
CREATE PROCEDURE ganador (IN p INT)
BEGIN
DECLARE resLocal, resVisit, vencedor INT;
SET resLocal=(SELECT puntosL FROM Partidos WHERE id_partido=p);
SET resVisit=(SELECT puntosV FROM Partidos WHERE id_partido=p);
IF (resLocal>resVisit) THEN
SET vencedor=(SELECT elocal FROM Partidos WHERE id_partido=p);
ELSE
SET vencedor=(SELECT evisit FROM Partidos WHERE id_partido=p);
END IF;
SELECT nombre AS Ganador
FROM Equipos
WHERE id_equipo=vencedor;
END $$
DELIMITER ;


/*Crea una función que indique el número de partidos que ha ganado un equipo. La función recibirá
como parámetro el identificador del equipo.*/

DELIMITER $$
DROP FUNCTION IF EXISTS partidos_ganados $$
CREATE FUNCTION partidos_ganados (id_equipo INT) RETURNS INT
BEGIN
DECLARE num_ganados INT;
SELECT COUNT(*)
INTO num_ganados
FROM Partidos
WHERE (elocal = id_equipo AND puntosL > puntosV) OR (evisit = id_equipo AND puntosV > puntosL);
RETURN num_ganados;
END $$
DELIMITER ;


/*Crea una función que indique el total de puntos a favor (o anotados) de un equipo. La función recibirá
como parámetro el identificador del equipo.sin usar case ni el into*/


DELIMITER $$
DROP FUNCTION IF EXISTS puntos_favor $$
CREATE FUNCTION puntos_favor (e INT) RETURNS INT
BEGIN
DECLARE sumaL, sumaV INT;
SET sumaL=(SELECT SUM(puntosL) FROM Partidos WHERE elocal=e);
SET sumaV=(SELECT SUM(puntosV) FROM Partidos WHERE evisit=e);
RETURN IFNULL(sumaL,0)+IFNULL(sumaV,0);
END $$
DELIMITER ;






/*Crea una función que indique el total de puntos en contra (o recibidos) de un equipo. La función
recibirá como parámetro el identificador del equipo.sin usar case ni el into*/



DELIMITER $$
DROP FUNCTION IF EXISTS puntos_contra $$
CREATE FUNCTION puntos_contra (e INT) RETURNS INT
BEGIN
DECLARE recibidosL, recibidosV INT;
SET recibidosL=(SELECT SUM(puntosV) FROM Partidos WHERE elocal=e);
SET recibidosV=(SELECT SUM(puntosL) FROM Partidos WHERE evisit=e);
RETURN IFNULL(recibidosL,0)+IFNULL(recibidosV,0);
END $$
DELIMITER ;

/*Crea un procedimiento que reciba como parámetro el identificador de un equipo y muestre en una misma tabla la siguiente
información: nombre del equipo, número de partidos ganados, número de partidos perdidos, total de
puntos a favor y total de puntos en contra.*/






DELIMITER $$
DROP PROCEDURE IF EXISTS mostrar_informacion_equipo $$
CREATE PROCEDURE mostrar_informacion_equipo (e INT)
BEGIN
SELECT nombre AS 'Nombre del Equipo',
(SELECT COUNT(*) FROM Partidos WHERE elocal=e AND puntosL>puntosV) AS 'Partidos Ganados',
(SELECT COUNT(*) FROM Partidos WHERE elocal=e AND puntosL<puntosV) AS 'Partidos Perdidos',
puntos_favor(e) AS 'Total de Puntos a Favor',
puntos_contra(e) AS 'Total de Puntos en Contra'
FROM Equipos
WHERE id_equipo=e;
END $$
DELIMITER ;