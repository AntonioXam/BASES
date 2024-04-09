DELIMITER $$

DROP FUNCTION IF EXISTS victorias $$

CREATE FUNCTION victorias(e INT)
RETURNS INT
BEGIN
	DECLARE contaL,contaV INT;
	SET contaL=(SELECT COUNT(*) FROM Partidos WHERE puntosL>puntosV and elocal=e);
	SET contaV=(SELECT COUNT(*) FROM Partidos WHERE puntosL<puntosV and evisit=e);

	RETURN contaL+contaV;
END $$

DELIMITER ;