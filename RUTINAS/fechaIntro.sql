DELIMITER $$

DROP PROCEDURE IF EXISTS fechaIntro $$

CREATE PROCEDURE fechaIntro(d INT,m INT,a INT)
BEGIN

	IF(fechaCorrectaBis(d,m,a))=1 THEN
	  SELECT CONCAT("La fecha ", d, "/", m, "/", a, " es correcta") as Fecha;
    ELSE
        SELECT CONCAT("La fecha ", d, "/", m, "/", a, " es incorrecta") as Fecha;
	END IF;
END $$

DELIMITER ;
