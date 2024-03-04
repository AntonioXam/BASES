DELIMITER $$

DROP PROCEDURE IF EXISTS diaSiguiente $$

CREATE PROCEDURE diaSiguiente(d INT, m INT, a INT)
BEGIN
    DECLARE diasmes INT;
    SET diasmes = 31;

    IF fechaCorrectaBis(d, m, a) = 0 THEN
        SELECT CONCAT("La fecha ", d, "/", m, "/", a, " es incorrecta") AS Fecha;
    ELSE
        IF m IN (4, 6, 9, 11) THEN
            SET diasmes = 30;
            IF m = 2 THEN
                IF esBisiesto(a) = 1 THEN
                    SET diasmes = 29;
                ELSE 
                    SET diasmes = 28;
                END IF;
            END IF;
        END IF;

        SET d = d + 1;

        IF d > diasmes THEN
            SET d = 1;
            SET m = m + 1;
        END IF;

        IF m > 12 THEN
            SET m = 1;
            SET a = a + 1;
        END IF;

        SELECT CONCAT(d, "/", m, "/", a) AS "Dia siguiente";
    END IF;
END $$

DELIMITER ;
