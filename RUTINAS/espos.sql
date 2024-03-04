DELIMITER $$

DROP PROCEDURE IF EXISTS espos $$

CREATE PROCEDURE espos(num INT)
BEGIN 
	IF(num>0) THEN
	SELECT CONCAT(num," Es positivo") AS "Positivo";
	ELSEIF(num<0) THEN 
	SELECT CONCAT(num," Es negativo") AS "Negativo";
	ELSE
	SELECT CONCAT(num," Es cero") AS "Cero";
	END IF;
END $$

DELIMITER ;