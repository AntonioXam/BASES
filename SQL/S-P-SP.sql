#-- crear la base de datos
CREATE DATABASE envios;

#-- borrar la base de datos
DROP DATABASE IF EXISTS nombre;

#--Empezar a utilizar la base de datos
USE envios;


#-- Mostrar las bases de datos
SHOW TABLES;

#-- Creamos la tabla de los proovedores
CREATE TABLE S (
	sn 		VARCHAR(3),
	snombre VARCHAR(20)	NOT NULL,
	estado  INTEGER 	NOT NULL,
	ciudad  VARCHAR(20)	NOT NULL,
	PRIMARY KEY(sn)
);

#-- Consultar la descripcion de una tabla
DESCRIBE s;

CREATE TABLE P (
	pn 		VARCHAR(3),
	pnombre VARCHAR(20) 	NOT NULL,
	color 	VARCHAR(20) 	NOT NULL,
	peso 	INTEGER 		NOT NULL,
	ciudad 	VARCHAR(20) 	NOT NULL,
	PRIMARY KEY(pn)
);

#-- Creamos la tabla de los envios
CREATE TABLE SP (
	sn 		VARCHAR(3),
	pn 		VARCHAR(3),
	cant 	INTEGER 	NOT NULL,
	PRIMARY KEY(sn,pn),
	FOREIGN KEY(sn) REFERENCES S(sn)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(pn) REFERENCES P(pn)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);sho