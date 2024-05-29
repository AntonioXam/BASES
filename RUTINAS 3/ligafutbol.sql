

DROP DATABASE IF EXISTS ligafutbol;

CREATE DATABASE ligafutbol;

USE ligafutbol;


SOURCE C:\ligafutbol.sql;


select * FROM Equipos;
select * FROM Jugadores;
select * FROM Partidos;
select * FROM Goles;



DELIMITER $$

DROP FUNCTION IF EXISTS victorias $$

CREATE FUNCTION victorias(e INT)
RETURNS INT
BEGIN
	DECLARE contaL,contaV INT;
	SET contaL=(SELECT COUNT(*) FROM Partidos WHERE golesL>golesV and eqlocal=e);
	SET contaV=(SELECT COUNT(*) FROM Partidos WHERE golesL<golesV and eqvisit=e);

	RETURN contaL+contaV;
END $$

DELIMITER ;



select victorias (1);


DELIMITER $$

DROP FUNCTION IF EXISTS puntos_favor $$

CREATE FUNCTION puntos_favor(e INT)
RETURNS INT
BEGIN

	DECLARE PL,PV, total INT;
	SET PL=0;
	SET PV=0;
	
	SET PL=(SELECT SUM(golesL) FROM Partidos WHERE eqlocal=e);
	SET PV=(SELECT SUM(golesV) FROM Partidos WHERE eqvisit=e);
	
	SET total=IFNULL(PL,0)+IFNULL(PV,0);
	RETURN total;
END $$

DELIMITER ;


select puntos_favor(1);



DELIMITER $$

DROP FUNCTION IF EXISTS puntos_contra $$

CREATE FUNCTION puntos_contra(e INT)
RETURNS INT
BEGIN

	DECLARE PL,PV, total INT;
	SET PL=0;
	SET PV=0;
	
	SET PL=(SELECT SUM(golesV) FROM Partidos WHERE eqlocal=e);
	SET PV=(SELECT SUM(golesL) FROM Partidos WHERE eqvisit=e);
	
	SET total=IFNULL(PL,0)+IFNULL(PV,0);
	RETURN total;
END $$

DELIMITER ;



select puntos_contra(1);

DELIMITER $$

DROP PROCEDURE IF EXISTS informacion $$

CREATE PROCEDURE informacion(IN e INT)
BEGIN 
	DECLARE total,ganados INT;
	SET total=(SELECT COUNT(*) FROM partidos where eqlocal=e OR eqvisit=e);
	SET ganados=victorias(e);
	SELECT nombre,victorias(e) AS "PG",total-ganados as "PP",puntos_favor(e) as "PF",puntos_contra(e) as "PC"
	FROM equipos 
	WHERE CodEquipo=e;
	
	

END $$

DELIMITER ;



call informacion(1);