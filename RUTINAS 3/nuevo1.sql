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
	DECLARE ganador INT;
	IF 
	


END $$

DELIMITER ;