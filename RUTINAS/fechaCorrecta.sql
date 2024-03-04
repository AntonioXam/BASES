DELIMITER $$

DROP FUNCTION IF EXISTS fechaCorrecta $$

CREATE FUNCTION fechaCorrecta(d INT, m INT, a INT)
RETURNS BOOLEAN
BEGIN 
    DECLARE diasmes INT;
    SET diasmes = 31;

    IF a = 0 THEN
        RETURN FALSE;
    END IF;

    IF m < 1 OR m > 12 THEN
        RETURN FALSE;
    END IF;

    IF m = 2 THEN
        IF (esBisiesto(a))=1 THEN
            SET diasmes = 29;
        ELSE
            SET diasmes = 28;
        END IF;
    ELSEIF m = 4 OR m = 6 OR m = 9 OR m = 11 THEN
        SET diasmes = 30;
    END IF;

    IF d < 1 OR d > diasmes THEN
        RETURN FALSE;
    END IF;

    RETURN TRUE;
END $$

DELIMITER ;
