DELIMITER $$

DROP PROCEDURE IF EXISTS tabla $$

CREATE PROCEDURE tabla(IN n INT)
BEGIN
	DECLARE num INT DEFAULT 1;
	
	WHILE num<= 10 DO
	SELECT CONCAT(n,' x ',num,' = ',n*num) as Resultado;
	SET num=num+1;
	END WHILE;
END $$

DELIMITER ;