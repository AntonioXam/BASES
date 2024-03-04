DELIMITER $$

DROP PROCEDURE IF EXISTS notas $$

CREATE PROCEDURE notas(num FLOAT)
BEGIN
	CASE 
	WHEN num<5 THEN SELECT "Insuficiente" AS "NOTA";
	WHEN num<6 THEN SELECT "Aprobado" AS "NOTA";
	WHEN num<7 THEN SELECT "Bien" AS "NOTA";
	WHEN num<9 THEN SELECT "Notable" AS "NOTA";
	WHEN num<=10 THEN SELECT "Sobresaliente" AS "NOTA";
	ELSE SELECT "No es valida" AS "AVISO";
	END CASE;
END $$

DELIMITER ;
	