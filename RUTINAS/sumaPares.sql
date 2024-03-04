DELIMITER $$

DROP PROCEDURE IF EXISTS sumaPares $$

CREATE PROCEDURE sumaPares(N INT)
BEGIN
	DECLARE total INT;
	DECLARE num INT;
	SET total=0;
	SET num=1;
	
	WHILE num<=N DO
		IF(num%2)=0 THEN
			SET total=total+num;
		END IF;
			SET num=num+1;
	END WHILE;
	
	SELECT total as "Suma de los pares";
END $$

DELIMITER ;