DELIMITER $$

DROP FUNCTION IF EXISTS puntos_contra $$

CREATE FUNCTION puntos_contra(e INT)
RETURNS INT
BEGIN

	DECLARE PL,PV, total INT;
	SET PL=0;
	SET PV=0;
	
	SET PL=(SELECT SUM(puntosV) FROM Partidos WHERE elocal=e);
	SET PV=(SELECT SUM(puntosL) FROM Partidos WHERE evisit=e);
	
	SET total=IFNULL(PL,0)+IFNULL(PV,0);
	RETURN total;
END $$

DELIMITER ;