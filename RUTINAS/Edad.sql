DELIMITER $$

DROP PROCEDURE IF EXISTS Edad $$

CREATE PROCEDURE Edad(d INT,m INT,a INT)
BEGIN
	IF(fechaCorrecta(d,m,a))=1 THEN
		IF(MayorEdad(d,m,a))=1 THEN
			SELECT CONCAT(d,"/",m,"/",a) AS "Mayor de edad";
		ELSE
			SELECT CONCAT(d,"/",m,"/",a) AS "Menor de edad";
		END IF;
	ELSE
		SELECT CONCAT(d,"/",m,"/",a) AS "Fecha incorrecta";
	END IF;
END $$

DELIMITER ;