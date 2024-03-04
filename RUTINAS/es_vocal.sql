DELIMITER $$

DROP PROCEDURE IF EXISTS es_vocal $$

CREATE PROCEDURE es_vocal(letra CHAR)
BEGIN 
	IF letra IN ('a','e','i','o','u','A','E','I','O','U') THEN
		SELECT CONCAT(letra," es vocal") as "es_vocal";
	ELSE
		SELECT CONCAT(letra," NO es vocal") as "es_vocal";
	END IF;
END $$

DELIMITER ;

