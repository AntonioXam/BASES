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