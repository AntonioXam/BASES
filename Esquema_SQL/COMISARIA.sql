DROP DATABASE IF EXISTS COMISARIA;

CREATE DATABASE COMISARIA;

USE COMISARIA;

CREATE DOMAIN nombre_valido VARCHAR(40);
CREATE DOMAIN	tipo_codigo	VARCHAR(5);
CREATE DOMAIN	tipo_dni	VARCHAR(10);
CREATE DOMAIN	otros	VARCHAR(30);


CREATE TABLE ARMA(
	cod_arm tipo_codigo PRIMARY KEY,
	clase otros NOT NULL,
	nombre nombre_valido NOT NULL,
	policia tipo_dni NOT NULL
	);
	
CREATE TABLE POLICIA(
	dni_pol tipo_dni PRIMARY KEY,
	nombre nombre_valido NOT NULL,
	categoria otros NOT NULL,
	funcion otros NOT NULL
	);
	
CREATE TABLE CALABOZO(
	cod_cal tipo_codigo PRIMARY KEY,
	ubicacion otros NOT NULL
	);
	
CREATE TABLE CASO(
	cod_caso tipo_codigo PRIMARY KEY,
	juzgado nombre_valido NOT NULL
	);

CREATE TABLE DELINCUENTE(
	dniDelin tipo_dni PRIMARY KEY,
	nomDelin nombre_valido NOT NULL,
	direccion otros NOT NULL,
	telefono INTEGER NOT NULL,
	codCalab tipo_codigo NOT NULL
	);
	
CREATE TABLE ARRESTA(
	dni_pol tipo_dni,
	dniDelin tipo_dni,
	fecha DATE,
	PRIMARY KEY(dni_pol,dniDelin,fecha)
	);

CREATE TABLE INVOLUCRADO(
	dniDelin tipo_dni,
	cod_caso tipo_codigo,
	cargo otros NOT NULL,
	PRIMARY KEY(dniDelin,cod_caso)
	);
	

ALTER TABLE ARMA
ADD FOREIGN KEY(policia) REFERENCES POLICIA(dni_pol)
	ON UPDATE CASCADE;