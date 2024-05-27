#-- crear database VUELOS

DROP DATABASE IF EXISTS VUELOS;

CREATE DATABASE VUELOS;

USE VUELOS;

CREATE TABLE COMPANIAS(
	id_compania VARCHAR(2) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	nacionalidad VARCHAR(20) NOT NULL
	);
	

load data infile 'C:/Datos_Companias.txt' into TABLE COMPANIAS;

CREATE TABLE CLIENTES (
	nif VARCHAR(9) PRIMARY KEY,
	apellido1 VARCHAR(20) NOT NULL,
	apellido2 VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	poblacion VARCHAR(20) NOT NULL
	);
	
	
load data infile 'C:/Datos_Clientes.txt' into TABLE CLIENTES;


CREATE TABLE VUELOS (
	vuelo INTEGER(4),
	id_compania VARCHAR(2) NOT NULL,
	fecha DATE NOT NULL,
	origen VARCHAR(20) NOT NULL,
	destino VARCHAR(20) NOT NULL,
	plazas INTEGER(5) NOT NULL,
	PRIMARY KEY(vuelo),
	UNIQUE (origen,destino,fecha),
	UNIQUE (vuelo,id_compania,fecha),
	FOREIGN KEY(id_compania) REFERENCES COMPANIAS(id_compania)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	);


load data infile 'C:/Datos_Vuelos.txt' into TABLE VUELOS;


CREATE TABLE OCUPACION_VUELOS (
	vuelo INTEGER(4),
	pasajero VARCHAR(9),
	asiento VARCHAR(3),
	observaciones VARCHAR(40),
	PRIMARY KEY(vuelo,pasajero),
	UNIQUE(vuelo,asiento),
	FOREIGN KEY(vuelo) REFERENCES VUELOS(vuelo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY(pasajero) REFERENCES CLIENTES(nif)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	);
	
CREATE TABLE RESERVAS (
	vuelo INTEGER(4),
	pasajero VARCHAR(9),
	fecha_reserva DATE,
	PRIMARY KEY (vuelo,pasajero,fecha_reserva),
	FOREIGN KEY (vuelo) REFERENCES VUELOS(vuelo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY(pasajero) REFERENCES CLIENTES(nif)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	);
	


CREATE TRIGGER insertar_reserva
AFTER INSERT ON OCUPACION_VUELOS
FOR EACH ROW

	INSERT INTO RESERVAS (vuelo, pasajero, fecha_reserva) VALUES (NEW.vuelo, NEW.pasajero, CURRENT_DATE);

	
INSERT INTO OCUPACION_VUELOS VALUES
(1005,'70589658A','1A',NULL),
(1005,'52587412D','3G',NULL),
(1005,'47852358S','4F','Bebe < 1 año'),
(7458,'74125896Q','2G','Silla de ruedas'),
(7458,'12547854F','3F',NULL),
(4712,'52587412D','1A',NULL),
(4712,'12547854F','5H',NULL),
(7525,'70589658A','2F',NULL);




UPDATE OCUPACION_VUELOS
SET ASIENTO = '2C'
WHERE vuelo = 4712 AND pasajero = '47852358S';



INSERT INTO OCUPACION_VUELOS(vuelo,pasajero)
SELECT v.vuelo,'12547854F'
FROM VUELOS V
WHERE V.origen='BERLIN' AND V.destino='DUBLIN';




