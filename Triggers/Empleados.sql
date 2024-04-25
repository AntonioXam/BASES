Realiza los siguientes ejercicios:
1. Crea la base de datos Empleados y empieza a usarla como base de datos por defecto.
2. Crea las tablas Empleado y Baja_Empleado.
3. Inserta datos en la tabla Empleado. Puedes inventarlos.
4. Crea un trigger que inserte una fila en la tabla Baja_Empleado cuando se borre una fila
en la tabla Empleado. Los datos que se insertan son los correspondientes al empleado que
se da de baja en la tabla empleados. En la columna fecha se grabará el valor que devuelve
la función NOW (fecha actual).
5. Para probarlo, borra registros de la tabla Empleado y comprueba que han sido insertados
en la tabla Baja_Empleado.

DROP DATABASE IF EXISTS Empleados;

CREATE DATABASE Empleados;

USE Empleados;

CREATE TABLE Empleado (
dni VARCHAR(10),
nomemp VARCHAR(45) NOT NULL,
salario FLOAT NOT NULL,
codjefe VARCHAR(10),
PRIMARY KEY(dni),
FOREIGN KEY (codjefe) REFERENCES Empleado(dni)
ON DELETE SET NULL
ON UPDATE CASCADE
);


CREATE TABLE Baja_Empleado (
dni VARCHAR(10),
nomemp VARCHAR(45) NOT NULL,
salario FLOAT NOT NULL,
codjefe VARCHAR(10),
fecha DATE NOT NULL,
PRIMARY KEY(dni)
);


INSERT INTO Empleado VALUES ('52893997M', 'Mariano Gil' , 4500.0, NULL);
INSERT INTO Empleado VALUES ('48893397T', 'Roberto Andrade' , 2500.0, '52893997M');
INSERT INTO Empleado VALUES ('22893778G', 'Marta Benavide' , 2750.75, '52893997M');
INSERT INTO Empleado VALUES ('43425395H', 'Jacinto Conesa' , 1500.45, '22893778G ');
INSERT INTO Empleado VALUES ('42895597M', 'Antonio Diallo' , 1675.0, '22893778G ');
INSERT INTO Empleado VALUES ('48397454B', 'Isabel Canillejas' , 3550.45, '52893997M');



CREATE TRIGGER baja
AFTER DELETE ON Empleado
FOR EACH ROW
INSERT INTO Baja_Empleado VALUES(OLD.dni, OLD.nomemp, OLD.salario, OLD.codjefe, NOW());



DELETE FROM Empleado WHERE dni='43425395H';

SELECT * FROM Empleado;
SELECT * FROM Baja_Empleado;

DELETE FROM Empleado WHERE dni LIKE '48%';

SELECT * FROM Empleado;
SELECT * FROM Baja_Empleado;

DELETE FROM Empleado WHERE salario BETWEEN 2500.0 AND 4000.0;

SELECT * FROM Empleado;
SELECT * FROM Baja_Empleado;



