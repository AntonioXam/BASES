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

