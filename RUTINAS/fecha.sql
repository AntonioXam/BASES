DELIMITER $$

DROP PROCEDURE IF EXISTS fecha $$

CREATE PROCEDURE fecha(IN f DATE)
BEGIN
	DECLARE d, m, a INT;
	SET d=day(f);
	SET m=MONTH(f);
	SET a=YEAR(f);
	SELECT CONCAT("Dia: ",d) as Fecha;
	SELECT CONCAT("Mes: ",m) as Fecha;
	SELECT CONCAT("Año: ",a) AS Fecha;
END $$


DELIMITER ;