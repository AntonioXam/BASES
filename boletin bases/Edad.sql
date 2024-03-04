DELIMITER $$

DROP PROCEDURE IF EXISTS Edad $$

CREATE PROCEDURE Edad(d INT,m INT,a INT)
BEGIN
	
	DECLARE fecha VARCHAR(20);
	SET fecha="";
	IF (d<10) THEN
		SET fecha=CONCAT("0",d,"/");
	ELSE
		SET fecha=CONCAT(d,"/");
	END IF;	
	IF(m<10) THEN
		SET fecha=CONCAT(fecha,"0",m,"/",a);
	ELSE
		SET fecha=CONCAT(fecha,m,"/",a);
	END IF;
	

	IF(fechaCorrecta(d,m,a))=1 THEN
		IF(MayorEdad(d,m,a))=1 THEN	
			SELECT fecha AS "Mayor de Edad";
		ELSE
			SELECT fecha AS "Menor de Edad";
		END IF;
	ELSE
		SELECT fecha AS "Fecha incorrecta";			
	END IF;
END $$

DELIMITER ;