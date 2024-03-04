DELIMITER $$

DROP PROCEDURE IF EXISTS sumahastaN $$

CREATE PROCEDURE sumahastaN(IN n INT)
BEGIN
	DECLARE total INT DEFAULT 0;
	DECLARE num INT DEFAULT 1;
	WHILE num<=n DO
	SET total=total+num;
	SET num=num+1;
	END WHILE;
	
	SELECT total AS "Suma de los primeros numeros";
END $$

DELIMITER ;