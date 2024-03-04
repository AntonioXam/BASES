/**
Procedimiento que muestra por pantalla la cuenta descendente
desde un numero pasado como parametro hasta el 1**/

DELIMITER $$

DROP PROCEDURE IF EXISTS desnum $$

CREATE PROCEDURE desnum(num INT)
BEGIN 
	IF(num<0) THEN
	SELECT "No puede ser menor que 0" as "Aviso";
	END IF;
	WHILE num>0 DO
	SELECT num as "Cuenta descendiente";
	SET num=num-1;
	END WHILE;
END $$

DELIMITER ;