DELIMITER $$

DROP FUNCTION IF EXISTS mayorDivisor $$

CREATE FUNCTION mayorDivisor(num INT) RETURNS INT
BEGIN
    DECLARE conta, divisor INT;
    SET divisor=1;
	SET conta=2;

    WHILE (conta<=num/2) DO
        IF num % conta = 0 THEN
            SET divisor=conta;
        END IF;
        SET conta=conta+1;
    END WHILE;

    RETURN divisor;
END $$

DELIMITER ;
