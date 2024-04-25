TRIGGERS. Ejemplo tablas S-P-SP

# Mostramos las bases de datos del sistema
SHOW DATABASES;
# Creamos la base de datos
DROP DATABASE IF EXISTS SPSP;
CREATE DATABASE SPSP;
# Empezamos a usar la base de datos
USE SPSP;
# Creamos las tablas S, P y SP
CREATE TABLE S (
sn VARCHAR(4),
snombre VARCHAR(20) NOT NULL,
estado INTEGER,
ciudad VARCHAR(20) NOT NULL,
PRIMARY KEY(sn)
);
CREATE TABLE P (
pn VARCHAR(4),
pnombre VARCHAR(20) NOT NULL,
color VARCHAR(20) NOT NULL,
peso INTEGER NOT NULL,
ciudad VARCHAR(20) NOT NULL,
PRIMARY KEY(pn)
);
CREATE TABLE SP (
sn VARCHAR(4),
pn VARCHAR(4),
cant INTEGER NOT NULL,
PRIMARY KEY(sn, pn),
FOREIGN KEY(sn) REFERENCES S(sn)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(pn) REFERENCES P(pn)
ON DELETE CASCADE
ON UPDATE CASCADE
);
# Mostramos las tablas de la base de datos actual
SHOW TABLES;
# Mostramos la descripción de las tablas de la base de datos
DESCRIBE S;
DESCRIBE P;
DESCRIBE SP;
# Insertar valores en la tabla S
INSERT INTO S VALUES ('S1', 'Salazar', 20, 'Londres');
INSERT INTO S VALUES ('S2', 'Jaimes', 10, 'Paris');

Triggers: S-P-SP.

2

INSERT INTO S VALUES ('S3', 'Bernal', 30, 'Paris');
INSERT INTO S VALUES ('S4', 'Corona', 20, 'Londres');
INSERT INTO S VALUES ('S5', 'Aldana', NULL, 'Atenas');
# Insertar valores en la tabla P
INSERT INTO P VALUES ('P1', 'tuerca', 'verde', 12, 'Paris');
INSERT INTO P VALUES ('P2', 'perno', 'rojo', 17, 'Londres');
INSERT INTO P VALUES ('P3', 'birlo', 'azul', 17, 'Roma');
INSERT INTO P VALUES ('P4', 'birlo', 'rojo', 14, 'Londres');
INSERT INTO P VALUES ('P5', 'leva', 'azul', 12, 'Paris');
INSERT INTO P VALUES ('P6', 'engrane', 'rojo', 19, 'Paris');
# Visualizamos las tablas S y P completas
SELECT * FROM S;
SELECT * FROM P;
# Creamos la variable @TOTAL y le asignamos el valor 0
SET @TOTAL=0;
# Visualizamos el valor de la variable @TOTAL
SELECT @TOTAL;
# Creación de un trigger o disparador
# TRIGGER: Objeto que se asocia a una tabla y se activa cuando ocurre en ésta un evento particular.
# Ejemplo de uso: sumar los valores insertados en una de las columnas de la tabla.
# En nuestro caso, vamos a llevar la suma de todas las cantidades de productos enviadas.
CREATE TRIGGER sumar
AFTER INSERT ON SP
FOR EACH ROW
SET @TOTAL=@TOTAL+NEW.cant;
# Insertamos valores en la tabla SP
INSERT INTO SP VALUES ('S1', 'P1', 300);
INSERT INTO SP VALUES ('S1', 'P2', 200);
INSERT INTO SP VALUES ('S1', 'P3', 400);
SELECT @TOTAL;
INSERT INTO SP VALUES ('S1', 'P4', 200);
INSERT INTO SP VALUES ('S1', 'P5', 100);
INSERT INTO SP VALUES ('S1', 'P6', 100);
INSERT INTO SP VALUES ('S2', 'P1', 300);
INSERT INTO SP VALUES ('S2', 'P2', 400);
INSERT INTO SP VALUES ('S3', 'P2', 200);
INSERT INTO SP VALUES ('S4', 'P2', 200);
INSERT INTO SP VALUES ('S4', 'P3', 100);
INSERT INTO SP VALUES ('S4', 'P4', 300);
INSERT INTO SP VALUES ('S4', 'P5', 400);
SELECT @TOTAL;
# Trigger restar (borrado)
CREATE TRIGGER restar
BEFORE DELETE ON SP
FOR EACH ROW
SET @TOTAL=@TOTAL-OLD.cant;

Triggers: S-P-SP.

3

# Borramos el último registro introducido
DELETE FROM SP
WHERE sn='S4' AND pn='P5';
# Comprobamos la variable total
SELECT @TOTAL;
# Volvemos a insertar el último registro
INSERT INTO SP VALUES ('S4', 'P5', 400);
SELECT @TOTAL;
# Creamos un nuevo trigger
# Trigger cambiar (update)
CREATE TRIGGER cambiar
BEFORE UPDATE ON SP
FOR EACH ROW
SET @TOTAL=@TOTAL-OLD.cant+NEW.cant;
UPDATE SP
SET cant=cant+100
WHERE sn='S4' AND pn='P5';
SELECT @TOTAL;
# Mostramos los triggers
SHOW TRIGGERS;