CREATE DATABASE CICLISTAS2;

USE CICLISTAS2;

CREATE TABLE CICLISTA (
	dni VARCHAR(10),
	alias VARCHAR(30) NOT NULL,
	direccion VARCHAR(30) NOT NULL,
	tlf INTEGER NOT NULL,
	PRIMARY KEY(dni)
);

CREATE TABLE CARRERA (
	idcarrera INTEGER,
	nombre VARCHAR(30) NOT NULL,
	fechacreac DATE NOT NULL,
	pais VARCHAR(30) NOT NULL,
	num_ediciones INTEGER NOT NULL,
	max_ganador VARCHAR(10),
	amateur BOOLEAN,
	PRIMARY KEY(idcarrera)
);

CREATE TABLE EDICION (
	idcarrera INTEGER,
	fechacreac DATE,
	nombre VARCHAR(30) NOT NULL,
	ganador VARCHAR(10),
	prim_equipo VARCHAR(30),
	pos_pri_equi INTEGER NOT NULL,
	PRIMARY KEY(idcarrera, fechacreac)
);

CREATE TABLE CICLISTA_EDICION (
	dni VARCHAR(10),
	idcarrera INTEGER,
	fechaedic DATE,
	cuota DOUBLE,
	dorsal INTEGER NOT NULL,
	PRIMARY KEY(dni,idcarrera,fechaedic)
);


CREATE TABLE ETAPA (
	idetapa INTEGER,
	idcarrera INTEGER,
	fechaedic DATE,
	origen VARCHAR(30) NOT NULL,
	destino VARCHAR(30) NOT NULL,
	fecha DATE NOT NULL,
	ganador VARCHAR(10),
	detall VARCHAR(50) NOT NULL,
	PRIMARY KEY(idetapa, idcarrera, fechaedic)
);

CREATE TABLE METAVOLANTE (
	codmeta INTEGER,
	idetapa INTEGER NOT NULL,
	idcarrera INTEGER NOT NULL,
	fechaedic DATE NOT NULL,
	ganador VARCHAR(10),
	PRIMARY KEY(codmeta)
);

ALTER TABLE CARRERA
ADD FOREIGN KEY (max_ganador) REFERENCES CICLISTA(idcarrera)
	ON DELETE SET NULL
	ON UPDATE CASCADE;
	
ALTER TABLE EDICION
ADD FOREIGN KEY (idcarrera) REFERENCES CARRERA(idcarrera)
	ON UPDATE CASCADE;

ALTER TABLE EDICION
ADD FOREIGN KEY (ganador) REFERENCES CICLISTA(dni)
		ON DELETE SET NULL
		ON UPDATE CASCADE;
		
ALTER TABLE EDICION
ADD FOREIGN KEY (prim_equipo) REFERENCES CICLISTA(dni)
	ON DELETE SET NULL
	ON UPDATE CASCADE;
	
ALTER TABLE CICLISTA_EDICION
ADD FOREIGN KEY (dni) REFERENCES CICLISTA (dni)
	ON UPDATE CASCADE;

ALTER TABLE CICLISTA_EDICION
ADD FOREIGN KEY (idcarrera,fechaedic) REFERENCES EDICION(idcarrera,fechaedic)
	ON UPDATE CASCADE;
	
ALTER TABLE ETAPA
ADD FOREIGN KEY (idcarrera,fechaedic)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
		
ALTER TABLE ETAPA
ADD FOREIGN KEY ( ganador) REFERENCES CICLISTA(dni)
	ON DELETE SET NULL
	ON UPDATE CASCADE;
	
ALTER TABLE METAVOLANTE
ADD FOREIGN KEY (idetapa,idcarrera,fechaedic) REFERENCES ETAPA(idetapa,idcarrera,fechaedic)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
ALTER TABLE METAVOLANTE
ADD FOREIGN KEY (ganador) REFERENCES CICLISTA(dni)
	ON DELETE SET NULL
	ON UPDATE CASCADE;