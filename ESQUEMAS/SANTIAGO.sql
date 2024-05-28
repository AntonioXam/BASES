DROP DATABASE IF EXISTS SANTIAGO;

CREATE DATABASE SANTIAGO;

USE SANTIAGO;


CREATE TABLE CAMINO (
	nombreC VARCHAR(40) PRIMARY KEY,
	kmsT INTEGER NOT NULL,
	tiempoT INTEGER NOT NULL
	);
	
CREATE TABLE ETAPA (
	nombreC VARCHAR(40),
	num INTEGER,
	KmsE INTEGER NOT NULL,
	tiempoE INTEGER NOT NULL,
	localidadS VARCHAR(40) NOT NULL,
	localidadL VARCHAR(40) NOT NULL,
	PRIMARY KEY(nombreC,num)
	);
	
CREATE TABLE LOCALIDAD (
	cpostal VARCHAR(40) PRIMARY KEY,
	nombreL VARCHAR(40) NOT NULL,
	ComunidadAut VARCHAR(40) NOT NULL
	);
	
CREATE TABLE PEREGRINO (
	numP INTEGER PRIMARY KEY,
	nombreP VARCHAR(40) NOT NULL,
	direccion VARCHAR(40) NOT NULL
	);
	
CREATE TABLE ALBERGUE (
	nombreA VARCHAR(40) PRIMARY KEY,
	capacidad INTEGER NOT NULL,
	precio INTEGER,
	cpostal VARCHAR(40) NOT NULL
	);
	
CREATE TABLE CAMINO_PEREGRINO (
	numP INTEGER,
	cpostal VARCHAR(40),
	fecha DATE,
	PRIMARY KEY(numP,cpostal,fecha)
	);
	
CREATE TABLE RECORRIDO (
	nombreC VARCHAR(40),
	num INTEGER,
	cpostal VARCHAR(40),
	PRIMARY KEY(nombreC,num,cpostal)
	);
	
ALTER TABLE ETAPA
ADD FOREIGN KEY(nombreC) REFERENCES CAMINO(nombreC)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
ALTER TABLE ETAPA
ADD FOREIGN KEY(localidadS) REFERENCES LOCALIDAD(cpostal)
	ON UPDATE CASCADE;

ALTER TABLE ETAPA
ADD FOREIGN KEY(localidadL) REFERENCES LOCALIDAD(cpostal)
	ON UPDATE CASCADE;

ALTER TABLE RECORRIDO
ADD FOREIGN KEY(nombreC,num) REFERENCES ETAPA(nombreC,num)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

ALTER TABLE RECORRIDO
ADD FOREIGN KEY(cpostal) REFERENCES LOCALIDAD(cpostal)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

ALTER TABLE ALBERGUE
ADD FOREIGN KEY(cpostal) REFERENCES LOCALIDAD(cpostal)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

ALTER TABLE CAMINO_PEREGRINO
ADD FOREIGN KEY(numP) REFERENCES PEREGRINO(numP)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
ALTER TABLE CAMINO_PEREGRINO
ADD FOREIGN KEY(cpostal) REFERENCES LOCALIDAD(cpostal)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

