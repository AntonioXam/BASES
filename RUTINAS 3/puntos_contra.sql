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