DELIMITER $$

DROP FUNCTION IF EXISTS MayorEdad $$

CREATE FUNCTION MayorEdad(d INT, m INT, a INT) RETURNS BOOLEAN
BEGIN
    DECLARE aActual INT;
    DECLARE edad INT;

    SET aActual = YEAR(CURRENT_DATE());
    SET edad = aActual - a;

    IF m > MONTH(CURRENT_DATE()) OR (m = MONTH(CURRENT_DATE()) AND d > DAY(CURRENT_DATE())) THEN
        SET edad = edad - 1;
    END IF;
	IF edad>=18 THEN
		RETURN TRUE;
	ELSE 
		RETURN FALSE;
	END IF;
END$$

DELIMITER ;
