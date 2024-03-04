DELIMITER $$

DROP PROCEDURE IF EXISTS sumPrimos $$

CREATE PROCEDURE sumPrimos(IN m INT)
BEGIN
	DECLARE total INT DEFAULT 0;
	DECLARE num INT DEFAULT 2;
	DECLARE conta INT DEFAULT 0;
	WHILE conta<=m DO
	IF es_primo(num)=1 THEN
	SET total=total+num;
	SET conta=conta+1;
	END IF;
	SET num=num+1;
	END WHILE;
	
	SELECT total AS "Suma de los primeros primos";
END $$

DELIMITER ;