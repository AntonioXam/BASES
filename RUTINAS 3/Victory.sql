DELIMITER $$

DROP FUNCTION IF EXISTS victory $$

CREATE FUNCTION victory(e INT)
RETURNS INT
BEGIN

DECLARE EL ,EV INT;
SET EL=0;
SET EV=0;


SET EL=(SELECT COUNT(*) FROM Partidos WHERE golesL>golesV and eqlocal=e );
SET EV=(SELECT COUNT(*) FROM Partidos WHERE golesL<golesV and eqvisit=e);

RETURN EL+EV;


END $$

DELIMITER ;