DROP DATABASE IF EXISTS Notas;

CREATE DATABASE Notas;

USE Notas;

CREATE TABLE ASIGNATURA (
	codAsig VARCHAR(4),
	nomAsig VARCHAR(50) NOT NULL,
	curso VARCHAR(50) NOT NULL,
	horas INTEGER,
	PRIMARY KEY(codAsig)
	);


CREATE TABLE ALUMNO (
	codAlum INTEGER AUTO_INCREMENT,
	nomAlum VARCHAR(50) NOT NULL,
	fechanac DATE,
	PRIMARY KEY(codAlum)
	);
	
CREATE TABLE NOTA (
	codAlum INTEGER,
	codAsig VARCHAR(4),
	nota INTEGER,
	PRIMARY KEY(codAlum,codAsig)
	);
	
ALTER TABLE NOTA
ADD FOREIGN KEY(codAlum) REFERENCES ALUMNO(codAlum)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
ALTER TABLE NOTA
ADD FOREIGN KEY(codAsig) REFERENCES ASIGNATURA(codAsig)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
INSERT INTO ASIGNATURA VALUES
('BD','Bases de datos','1º DAW',5),
('SI','Sistemas Informaticos','1º DAW',8),
('ED','Entornos de Desarrollo','2º DAW',3),
('DIW','Diseño de Interfaces Web','2º DAW',6);

INSERT INTO ALUMNO VALUES 
(0,'Mariano',2024-04-11),
(0,'Luis',2024-04-12),
(0,'Antonio',2024-04-13),
(0,'Jorge',2024-04-14);


--------------------------


DROP DATABASE IF EXISTS Notas;
CREATE DATABASE Notas;
USE Notas;
CREATE TABLE Asignatura (
codAsig VARCHAR(4),
nomAsig VARCHAR(50) NOT NULL,
curso VARCHAR(15) NOT NULL,
horas INTEGER,
PRIMARY KEY(codAsig)
);
INSERT INTO Asignatura VALUES ('BD', 'Bases de Datos', '1o DAW', 5);
INSERT INTO Asignatura VALUES ('SI','Sistemas Informaticos', '1o DAW', 8);
INSERT INTO Asignatura VALUES ('ED','Entornos de Desarrollo', '2o DAW', 3);
INSERT INTO Asignatura VALUES ('DIW','Diseño de Interfaces Web', '2o DAW', 6);
CREATE TABLE Alumno (
codAlum INTEGER AUTO_INCREMENT,
nomAlum VARCHAR(40) NOT NULL,
fechanac DATE,
PRIMARY KEY(codAlum)
);
INSERT INTO Alumno VALUES (0,'Pedro Martinez','1998/02/17');
INSERT INTO Alumno VALUES (0,'Ana Fuentes', '1997-04-21');
INSERT INTO Alumno VALUES (0,'Juan Salas','1998-11-12');
INSERT INTO Alumno VALUES (0,'Carmen Pedroso', '1997-03-25');
INSERT INTO Alumno VALUES (0,'Javier Buendia','1998-12-11');
INSERT INTO Alumno VALUES (0,'Antonio Calvo','1998-02-22');

Triggers: Notas.

2

CREATE TABLE Nota (
codAlum INT(4),
codAsig VARCHAR(4),
nota INT(2),
PRIMARY KEY (codAlum, codAsig),
FOREIGN KEY (codAlum) REFERENCES Alumno(codAlum)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (codAsig) REFERENCES Asignatura(codAsig)
ON DELETE CASCADE
ON UPDATE CASCADE
);




#-------- Triggers -----------
SET @aprobados=0;
SET @suspensos=0;
DELIMITER $$
CREATE TRIGGER evaluar_insertar
AFTER INSERT ON Nota
FOR EACH ROW
BEGIN
IF NEW.nota >= 5 THEN
SET @aprobados=@aprobados+1;
ELSE
SET @suspensos=@suspensos+1;
END IF;
END
$$
DELIMITER ;
INSERT INTO Nota VALUES (1,'BD',5);
INSERT INTO Nota VALUES (2,'BD',8);
INSERT INTO Nota VALUES (3,'BD',10);
INSERT INTO Nota VALUES (4,'BD',3);
INSERT INTO Nota VALUES (5,'BD',7);
INSERT INTO Nota VALUES (6,'BD',6);
INSERT INTO Nota VALUES (1,'SI',5);
INSERT INTO Nota VALUES (2,'SI',8);
INSERT INTO Nota VALUES (3,’SI’,10);
INSERT INTO Nota VALUES (4,’SI’,3);
INSERT INTO Nota VALUES (5,’SI’,7);
INSERT INTO Nota VALUES (6,’SI’,6);
SELECT @aprobados;
SELECT @suspensos;

Triggers: Notas.

3

DELIMITER $$
CREATE TRIGGER evaluar_modificar
BEFORE UPDATE ON Nota
FOR EACH ROW
BEGIN
IF OLD.nota >= 5 THEN
IF NEW.nota < 5 THEN
SET @aprobados=@aprobados-1;
SET @suspensos=@suspensos+1;
END IF;
ELSE
IF NEW.nota >= 5 THEN
SET @aprobados=@aprobados+1;
SET @suspensos=@suspensos-1;
END IF;
END IF;
END
$$
DELIMITER ;

UPDATE Nota
SET nota=4
WHERE codAlum=1;
SELECT @aprobados;
SELECT @suspensos;
UPDATE Nota
SET nota=nota+1
WHERE codAlum=2;
SELECT @aprobados;
SELECT @suspensos;

Triggers: Notas.

4

DELIMITER $$
CREATE TRIGGER evaluar_borrar
BEFORE DELETE ON Nota
FOR EACH ROW
BEGIN
IF OLD.nota>=5 THEN
SET @aprobados=@aprobados-1;
ELSE
SET @suspensos=@suspensos-1;
END IF;
END
$$
DELIMITER ;

SELECT * FROM Nota;
SELECT @aprobados;
SELECT @suspensos;
DELETE FROM Nota WHERE codAsig LIKE ‘SI’;

SELECT * FROM Nota;
SELECT @aprobados;
SELECT @suspensos;