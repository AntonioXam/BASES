DELIMITER $$

DROP PROCEDURE IF EXISTS diaDespues $$

CREATE PROCEDURE diaDespues(d INT, m INT, a INT)
BEGIN
    DECLARE diasmes INT;

    IF fechaCorrectaBis(d, m, a) = 0 THEN
        SELECT CONCAT(d, "/", m, "/", a) AS "Fecha Incorrecta";
    ELSE
        SET diasmes = 31;

        IF m = 2 THEN
            IF esBisiesto(a) THEN
                SET diasmes = 29;
            ELSE
                SET diasmes = 28;
            END IF;
        ELSEIF m IN (4, 6, 9, 11) THEN
            SET diasmes = 30;
        END IF;

        SET d = d + 1;

        IF d > diasmes THEN
            SET d = 1;
            SET m = m + 1;

            IF m > 12 THEN
                SET m = 1;
                SET a = a + 1;
            END IF;
        END IF;

        IF a = 0 THEN
            SET a = a + 1;
        END IF;

        SELECT CONCAT(d, "/", m, "/", a) AS "Fecha día siguiente";
    END IF;
END $$

DELIMITER ;
