DELIMITER $$

DROP FUNCTION IF EXISTS dia_semana $$
CREATE FUNCTION dia_semana(numero INT)
RETURNS VARCHAR(20)
BEGIN
    RETURN CASE numero
        WHEN 1 THEN 'Lunes'
        WHEN 2 THEN 'Martes'
        WHEN 3 THEN 'Miércoles'
        WHEN 4 THEN 'Jueves'
        WHEN 5 THEN 'Viernes'
        WHEN 6 THEN 'Sábado'
        WHEN 7 THEN 'Domingo'
        ELSE 'Número inválido'
    END;
END $$

DELIMITER ;
