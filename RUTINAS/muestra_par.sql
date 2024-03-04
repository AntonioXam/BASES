DELIMITER $$

DROP PROCEDURE IF EXISTS muestra_par $$

CREATE PROCEDURE muestra_par(IN numero INT)
BEGIN
	IF (es_impar(numero)) THEN 
		SELECT CONCAT(numero," es impar") AS "PAR/IMPAR";
	ELSE 
		SELECT CONCAT(numero," es par") AS "PAR/IMPAR";
	END IF;
END $$

DELIMITER ;