DELIMITER $$

DROP FUNCTION IF EXISTS divi $$

CREATE FUNCTION divi(numerador INT,denominador INT) 
RETURNS INT
BEGIN
	IF denominador = 0 THEN
		RETURN 0;
	ELSEIF numerador MOD denominador =0 THEN
		RETURN 1;
	ELSE
		RETURN 0;
	END IF;
END $$

DELIMITER ;