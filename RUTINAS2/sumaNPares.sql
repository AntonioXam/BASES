DELIMITER $$

DROP PROCEDURE IF EXISTS sumaNPares $$

CREATE PROCEDURE sumaNPares(N INT)
BEGIN
	DECLARE total INT;
	DECLARE num INT;
	DECLARE conta INT;
	SET total=0;
	SET num=2;
	SET conta=0;
	
	WHILE conta < N DO
		SET total=total+num;
		SET num=num+2;
		SET conta=conta+1;
	END WHILE;
	
	SELECT total as "Suma Numeros pares";
END $$

DELIMITER ;