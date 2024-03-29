DELIMITER $$

DROP FUNCTION IF EXISTS horaOK $$
CREATE FUNCTION horaOK(h INT, m INT, s INT)
RETURNS BOOLEAN
BEGIN
    IF h < 0 OR h > 23 THEN
        RETURN FALSE;
    END IF;
    
    IF m < 0 OR m > 59 THEN
        RETURN FALSE;
    END IF;
    
    IF s < 0 OR s > 59 THEN
        RETURN FALSE;
    END IF;
    
    RETURN TRUE;
END $$

DELIMITER ;
