DELIMITER $$

DROP PROCEDURE IF EXISTS fechaIntroMes $$

CREATE PROCEDURE fechaIntroMes(d INT, m INT, a INT)
BEGIN
    DECLARE mesNombre VARCHAR(20);

    -- Convertir el número de mes a nombre
    SET mesNombre = CASE
        WHEN m = 1 THEN 'Enero'
        WHEN m = 2 THEN 'Febrero'
        WHEN m = 3 THEN 'Marzo'
        WHEN m = 4 THEN 'Abril'
        WHEN m = 5 THEN 'Mayo'
        WHEN m = 6 THEN 'Junio'
        WHEN m = 7 THEN 'Julio'
        WHEN m = 8 THEN 'Agosto'
        WHEN m = 9 THEN 'Septiembre'
        WHEN m = 10 THEN 'Octubre'
        WHEN m = 11 THEN 'Noviembre'
        WHEN m = 12 THEN 'Diciembre'
        ELSE 'Mes inválido'
    END;

    IF(fechaCorrectaBis(d,m,a)) = 1 THEN
        SELECT CONCAT("La fecha ", d, " de ", mesNombre, " de ", a, " es correcta") as Fecha;
    ELSE
        SELECT CONCAT("La fecha ", d, " de ", mesNombre, " de ", a, " es incorrecta") as Fecha;
    END IF;
END $$

DELIMITER ;
