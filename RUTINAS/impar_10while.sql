/**
Procedimiento que muestra por pantalla
los numeros impares desde el 0 hasta el 10
utilizando el bucle while**/

DELIMITER $$

DROP PROCEDURE IF EXISTS impar_10while $$

CREATE PROCEDURE impar_10while() 
BEGIN
	DECLARE num INT;
	SET num=0;
	WHILE num<=10 DO
	IF(num%2)=1 THEN
		SELECT num;
	END IF;
	SET num=num+1;
	END WHILE;
END $$

DELIMITER ;