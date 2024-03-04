#--1

DROP DATABASE IF EXISTS SPS;

CREATE DATABASE SPS;

USE SPS;



CREATE TABLE S (
	sn 	VARCHAR(50),
	snombre 	VARCHAR(50) 	NOT NULL,
	estado 	INTEGER,
	ciudad 	VARCHAR(50) 	NOT NULL,
	PRIMARY KEY(sn)
	);
	
	
CREATE TABLE P (
	
	pn VARCHAR(50),
	pnombre VARCHAR(50) NOT NULL,
	color VARCHAR(50) NOT null,
	peso INTEGER NOT null,
	ciudad VARCHAR(50) NOT null,
	PRIMARY KEY(pn)
	);
	
CREATE TABLE SP (
	sn VARCHAR(50),
	pn VARCHAR(50),
	cant INTEGER NOt null,
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


#--2

INSERT INTO S VALUES
('S1','Salazar',20,'Londres'),
('S2','Jaimes',10,'Paris'),
('S3','Bernal',30,'Paris'),
('S4','Corona',20,'Londres'),
('S5','Aldana',NULL,'Atenas');


#--3

LOAD DATA INFILE 'C:\\P.txt' INTO TABLE P;

#--4

LOAD DATA INFILE 'C:\\SP.txt' INTO TABLE SP;

#--5

INSERT INTO S VALUES ('S6','Marco',20,'Londres');

#--6

INSERT INTO S VALUES ('S7','Andreu',10,'Atenas');

#--7

INSERT INTO SP
SELECT 'S6',pn,100
FROM P;

#--8

INSERT INTO SP
SELECT 'S7',pn,cant
FROM SP
WHERE sn='S2';

#--9

INSERT INTO SP
SELECT 'S7','P4',cant
FROM SP
WHERE pn='P4' AND sn='S1';

#--10

UPDATE P
SET peso=peso-1
WHERE color='azul';

#--11

UPDATE SP
SET cant=cant+300
WHERE sn='S6' and pn='P3';

#--12

UPDATE SP
SET cant=cant*2
WHERE sn='S6' and pn IN ('P1','P2');

#--13

UPDATE SP
SET cant=cant+100
WHERE sn='S7';

#--14

UPDATE SP
SET cant=cant+25
WHERE pn IN (SELECT pn FROM P WHERE peso = (SELECT MAX(peso) from P));

#--15

DELETE from SP
WHERE pn IN (SELECT pn FROM P WHERE peso = (SELECT MIN(peso) from P));

#--16

DELETE from SP
WHERE sn='S7';