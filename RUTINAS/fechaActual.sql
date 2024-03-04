DELIMITER $$

DROP PROCEDURE IF EXISTS fechaActual $$

CREATE PROCEDURE fechaActual()
BEGIN
	DECLARE d INT;
	DECLARE m INT;
	DECLARE a INT;
	DECLARE mes VARCHAR(20);
	SET d=DAY(CURRENT_DATE());
	SET m=MONTH(CURRENT_DATE());
	SET a=YEAR(CURRENT_DATE());
	
	CASE m
	WHEN 1 THEN SET mes="Enero"; 
	WHEN 2 THEN SET mes="Febrero"; 
	WHEN 3 THEN SET mes="Marzo";
	WHEN 4 THEN SET mes="Abril";
	WHEN 5 THEN SET mes="Mayo";
	WHEN 6 THEN SET mes="Junio"; 
	WHEN 7 THEN SET mes="Julio";
	WHEN 8 THEN SET mes="Agosto"; 
	WHEN 9 THEN SET mes="Septiembre";
	WHEN 10 THEN SET mes="Octubre";
	WHEN 11 THEN SET mes="Noviembre";
	WHEN 12 THEN SET mes="Diciembre";
	END CASE;
	SELECT CONCAT(d," de ",mes," de ",a) AS "Fecha Actual";
	
END $$

DELIMITER ;