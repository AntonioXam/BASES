DELIMITER $$

DROP FUNCTION IF EXISTS total_dias_bis $$

CREATE FUNCTION total_dias_bis(f DATE) RETURNS INT
BEGIN
	DECLARE total INT;
	SET total=totaldias(f);
	IF(bisiesto(YEAR(f))) =1 THEN
		IF MONTH(f) >2 THEN
			SET total=total+1;
		END IF;
	END IF;
	RETURN total;
END $$

DELIMITER ;