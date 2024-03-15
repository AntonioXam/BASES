--1

DROP DATABASE IF EXISTS ligabasket;

CREATE DATABASE ligabasket;

USE ligabasket;


SOURCE C:\ligabasket.sql;

--2

describe equipos;
describe jugadores;
describe partidos;

SELECT * FROM equipos;
SELECT * FROM jugadores;
SELECT * FROM partidos;


--3

DELIMITER $$

DROP PROCEDURE IF EXISTS ganador $$

CREATE PROCEDURE ganador(IN partido INT)
BEGIN 
	DECLARE PL INT;
	DECLARE PV INT;
	DECLARE equi VARCHAR(50);
	SET PL=(SELECT puntosL FROM partidos WHERE id_partido=partido);
	SET PV=(SELECT puntosV FROM partidos WHERE id_partido=partido);
	
	IF (PL > PV) THEN
	SET equi=(SELECT nombre FROM equipos WHERE id_equipo=(SELECT elocal FROM partidos WHERE id_partido=partido));
	ELSE
	SET equi=(SELECT nombre FROM equipos WHERE id_equipo=(SELECT evisit FROM partidos WHERE id_partido=partido));
	END IF;	
	
	SELECT equi AS "Ganador";

END $$

DELIMITER ;