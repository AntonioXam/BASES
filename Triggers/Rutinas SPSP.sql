--1

DROP DATABASE IF EXISTS SPSP;

CREATE DATABASE SPSP;

USE SPSP;


CREATE TABLE S (

	sn VARCHAR(4),
	snombre VARCHAR(20)	NOT NULL,
	estado INT,
	ciudad VARCHAR(20)	NOT NULL,
	PRIMARY KEY(sn)
);

CREATE TABLE P (
	pn VARCHAR(4),
	pnombre VARCHAR(20) NOT NULL,
	color VARCHAR(20) NOT NULL,
	peso INT NOT NULL,
	ciudad VARCHAR(20) NOT NULL,
	PRIMARY KEY(pn)
	);

CREATE TABLE SP (
	sn VARCHAR(4),
	pn VARCHAR(4),
	cant INT NOT NULL,
	PRIMARY KEY(sn,pn)
	);
	
	
ALTER TABLE SP
ADD FOREIGN KEY(sn) REFERENCES S(sn)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
ALTER TABLE SP
ADD FOREIGN KEY(pn) REFERENCES P(pn)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
	
INSERT INTO S VALUES
('S1','Salazar',20,'Londres'),
('S2','Jaimes',10,'Paris'),
('S3','Bernal',30,'Paris'),
('S4','Corona',20,'Londres'),
('S5','Aldana',30,'Atenas');


LOAD DATA INFILE 'C:\\P.txt' INTO TABLE P;


SELECT * FROM S;
SELECT * FROM P;

/* Creamos una variable @TOTAL y le asignamos el valor 0*/

SET @TOTAL=0;

/* Visualizamos el valor de la variable @TOTAL*/

SELECT @TOTAL;

/* Creamos un trigger o Disparador
 TRIGGER: Objeto que se asocia a una tabla y se activa cuando ocurre en ésta 
 un evento particular.
 
 EJemplo:Total piezas enviadas en una de las columnas de las tablas
 en nuestro caso vamos a llevar la suma de todas las cantidades de todos los
 productos enviados*/
 
 CREATE TRIGGER sumar
 AFTER INSERT ON SP
 FOR EACH ROW
 SET @TOTAL=@TOTAL+NEW.cant; /* Nuevo registro*/
 
 INSERT INTO SP VALUES('S1','P1',300);
 INSERT INTO SP VALUES('S1','P2',200);
 INSERT INTO SP VALUES('S1','P3',400);
   
   
 /*Trigger para el borrado*/
 CREATE TRIGGER restar
 BEFORE DELETE ON SP
 FOR EACH ROW
 SET @TOTAL=@TOTAL-OLD.cant; /*Viejo registro*/
 
 DELETE FROM SP
 WHERE sn='S1' and pn='P3';
 

SELECT @TOTAL;


/* Trigger para las modificaciones */

CREATE TRIGGER cambiar
BEFORE UPDATE ON SP
FOR EACH ROW
SET @TOTAL=@TOTAL-OLD.cant+NEW.cant;

SELECT @TOTAL;

UPDATE SP
SET cant=800
WHERE sn='S1' AND pn='P1';

SELECT @TOTAL;

SELECT * FROM SP;