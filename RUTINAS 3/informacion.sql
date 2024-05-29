
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