
DELIMITER $$

DROP PROCEDURE IF EXISTS clasificacion $$

CREATE PROCEDURE clasificacion(IN e INT)
BEGIN 

	SELECT nombre
	FROM Equipos
	WHERE codEquipo=e;
	
	

END $$

DELIMITER ;