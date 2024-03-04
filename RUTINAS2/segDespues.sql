DELIMITER $$

DROP PROCEDURE IF EXISTS segDespues $$

CREATE PROCEDURE segDespues(h INT,m INT,s INT)
BEGIN
	DECLARE horabien VARCHAR(10);
	SET horabien="";
	
	IF(horaOk(h,m,s))=1 THEN
		SET s=s+1;
			IF s>59 THEN
				SET s=0;
				SET m=m+1;
			END IF;
				IF m>59 THEN
					SET m=0;
					SET h=h+1;
				END IF;
					IF h>23 THEN
						SET h=0;
					END IF;
		
	IF h<10 THEN
		SET horabien=CONCAT("0",h,":");
	ELSE
		SET horabien=CONCAT(h,":");
	END IF;
	IF m<10 THEN
		SET horabien=CONCAT(horabien,"0",m,":");
	ELSE
		SET horabien=CONCAT(horabien,m,":");
	END IF;
	IF s<10 THEN
		SET horabien=CONCAT(horabien,"0",s);
	ELSE
		SET horabien=CONCAT(horabien,s);
	END IF;
	
	SELECT horabien AS "Segundo despues";
	
	ELSE
	
	SELECT CONCAT(h,":",m,":",s) AS "Hora incorrecta";
	
	END IF;
	
END $$

DELIMITER ;
	
	
		
			