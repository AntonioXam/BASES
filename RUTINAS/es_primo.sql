DELIMITER $$

DROP FUNCTION IF EXISTS es_primo $$
 
CREATE FUNCTION es_primo(numero INT) 
RETURNS INT
BEGIN 
	DECLARE num INT;
	SET num=2;
	IF numero<=1 THEN
		RETURN 0;
	END IF;
	
	WHILE num * num <= numero DO
        IF numero % num = 0 THEN 
            RETURN 0;
        END IF;
        SET num = num + 1;
    END WHILE;
    
    RETURN 1;
END$$

DELIMITER ;