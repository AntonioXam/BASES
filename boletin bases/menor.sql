DELIMITER $$

DROP FUNCTION IF EXISTS menor $$

CREATE FUNCTION menor(a INT,b INT,c INT)
RETURNS INT
BEGIN
	IF a<b AND a<c THEN
		RETURN a;
	ELSEIF b<c  THEN
		RETURN b;
	ELSE
		RETURN c;
	END IF;
	
END $$

DELIMITER ;



SELECT menor(3,4,5);
SELECT menor(4,3,5);
SELECT menor(4,5,3);
SELECT menor(5,3,4);
