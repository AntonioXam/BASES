DROP DATABASE IF EXISTS Alumnos;

CREATE DATABASE Alumnos;

USE Alumnos;

#-- TABLA

CREATE TABLE Alumno (
	id INTEGER AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	nota FLOAT,
	PRIMARY KEY(id)
	);
	
INSERT INTO Alumno VALUES
(0,'Joaquin Lorca',8.0),
(0,'Esteban Martinez',7.25);


SELECT * FROM Alumno;


#--TRIGGER

DROP TRIGGER IF EXISTS comprobar_insertar_nota;

DELIMITER $$

CREATE TRIGGER comprobar_insertar_nota
BEFORE INSERT ON Alumno
FOR EACH ROW
BEGIN 
	IF NEW.nota<0 THEN
		SET NEW.nota=0;
	
	ELSEIF NEW.nota>10 THEN
		SET NEW.nota=10;
	END IF;
END $$

DELIMITER ;



INSERT INTO Alumno VALUES
(0,'Tony Montana',11.0),
(0,'John Mclain',-7.25);

SELECT * FROM Alumno;

DROP TRIGGER IF EXISTS comprobar_cambiar_nota;

DELIMITER $$

CREATE TRIGGER comprobar_cambiar_nota
BEFORE UPDATE ON Alumno
FOR EACH ROW
BEGIN
	IF NEW.nota<0 THEN
		SET NEW.nota=0;
	
	ELSEIF NEW.nota>10 THEN
		SET NEW.nota=10;
	END IF;
END $$

DELIMITER ;


UPDATE Alumno
SET nota=11 
WHERE id=1;

UPDATE Alumno
SET nota=-3
WHERE id=2;


SELECT * FROM Alumno;


DROP DATABASE IF EXISTS Alumnos;
CREATE DATABASE Alumnos;
USE Alumnos;
#----- Tabla ------
CREATE TABLE Alumno (
id INTEGER AUTO_INCREMENT,
nombre VARCHAR(40) NOT NULL,
nota FLOAT,
PRIMARY KEY(id)
);
#----- Trigger 1 ------
DELIMITER $$
DROP TRIGGER IF EXISTS comprobar_insertar_nota $$
CREATE TRIGGER comprobar_insertar_nota
BEFORE INSERT ON Alumno
FOR EACH ROW
BEGIN
IF NEW.nota<0 THEN
SET NEW.nota=0;
ELSEIF NEW.nota>10 THEN

Triggers: Alumnos.

2

SET NEW.nota=10;
END IF;
END
$$
DELIMITER ;
INSERT INTO Alumno VALUES (0,'John McClane', 5.25);
INSERT INTO Alumno VALUES (0,'Tony Montana', 11.0);
INSERT INTO Alumno VALUES (0,'Norman Bates', -2.75);
INSERT INTO Alumno VALUES (0,'Vivian Ward', 10.5);
INSERT INTO Alumno VALUES (0,'Regan MacNeil', 8.0);
INSERT INTO Alumno VALUES (0,'Clarice Starling', -5.5);
SELECT * FROM Alumno;
#----- Trigger 2 ------
DELIMITER $$
DROP TRIGGER IF EXISTS comprobar_cambiar_nota $$
CREATE TRIGGER comprobar_cambiar_nota
BEFORE UPDATE ON Alumno
FOR EACH ROW
BEGIN
IF NEW.nota<0 THEN
SET NEW.nota=0;
ELSEIF NEW.nota>10 THEN
SET NEW.nota=10;
END IF;
END
$$
DELIMITER ;
UPDATE Alumno SET nota=11.5 WHERE id=1;
UPDATE Alumno SET nota=-1.25 WHERE id=2;
UPDATE Alumno SET nota=9 WHERE id=3;
SELECT * FROM Alumno;