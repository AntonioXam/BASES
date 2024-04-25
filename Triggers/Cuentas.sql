
DROP DATABASE IF EXISTS Banco;

CREATE DATABASE Banco;

USE Banco;


CREATE TABLE Cuentas (

	NCuenta 	INT, 
	Saldo 	INT NOT NULL,
	PRIMARY KEY(NCuenta)
);



SET @SALDO=0;



CREATE TRIGGER ingreso
AFTER INSERT ON Cuentas
FOR EACH ROW
SET @SALDO=@SALDO+NEW.Saldo;


CREATE TRIGGER actualizar
BEFORE UPDATE ON Cuentas
FOR EACH ROW
SET @SALDO=@SALDO-OLD.Saldo+NEW.Saldo;

CREATE TRIGGER sacar
BEFORE DELETE ON Cuentas
FOR EACH ROW
SET @SALDO=@SALDO-OLD.Saldo;

INSERT INTO Cuentas VALUES(101,40);
INSERT INTO Cuentas VALUES(102,50);
INSERT INTO Cuentas VALUES(103,60);
INSERT INTO Cuentas VALUES(104,70);


SELECT @SALDO;


UPDATE Cuentas
SET Saldo=100
WHERE NCuenta=101;

SELECT * FROM Cuentas;

SELECT @SALDO;

DELETE FROM Cuentas
WHERE NCuenta=104;

SELECT * FROM Cuentas;

SELECT @SALDO;


Crear una base de datos llamada ‘Banco’ con una tabla llamada ‘Cuentas’ con dos campos: número
de cuenta (entero y clave primaria) y saldo (entero, no acepta nulos). Crear una variable ‘saldo’ y
tres triggers: uno que guarde en la variable el acumulativo de los valores insertados en cada una
de las tuplas, otro que guarde las modificaciones de los saldos, y otro que reste cuando
eliminamos una tupla. Insertar valores, modificarlos y eliminarlos para comprobar el total de saldo
insertado.

CREATE DATABASE Banco;

USE Banco;

CREATE TABLE Cuentas (
    numero_cuenta INT PRIMARY KEY,
    saldo INT NOT NULL
);

DELIMITER //
CREATE TRIGGER insertar_saldo
AFTER INSERT ON Cuentas
FOR EACH ROW
BEGIN
    SET @saldo = @saldo + NEW.saldo;
END;
//

DELIMITER //
CREATE TRIGGER modificar_saldo
AFTER UPDATE ON Cuentas
FOR EACH ROW
BEGIN
    SET @saldo = @saldo + (NEW.saldo - OLD.saldo);
END;
//

DELIMITER //
CREATE TRIGGER restar_saldo
AFTER DELETE ON Cuentas
FOR EACH ROW
BEGIN
    SET @saldo = @saldo - OLD.saldo;
END;
//

SET @saldo = 0;

INSERT INTO Cuentas (numero_cuenta, saldo) VALUES (1, 100);
INSERT INTO Cuentas (numero_cuenta, saldo) VALUES (2, 200);

UPDATE Cuentas SET saldo = 150 WHERE numero_cuenta = 1;

DELETE FROM Cuentas WHERE numero_cuenta = 2;

SELECT @saldo;