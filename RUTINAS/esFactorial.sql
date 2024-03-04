DELIMITER $$

DROP FUNCTION IF EXISTS esFactorial $$

CREATE FUNCTION esFactorial(N LONG)
RETURNS LONG
BEGIN
	DECLARE fact_total LONG;
	SET fact_total=1;
	
	WHILE N > 1 DO
		SET fact_total=fact_total*N;
		SET N=N-1;
	END WHILE;
	
	RETURN fact_total;
	
END $$

DELIMITER ;