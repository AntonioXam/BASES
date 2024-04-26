DROP DATABASE IF EXISTS Correos;

CREATE DATABASE Correos;

USE Correos;

CREATE TABLE usuario (
id INTEGER AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50) NOT NULL,
email VARCHAR(50),
PRIMARY KEY(id)
);


DROP FUNCTION IF EXISTS crear_email;

DELIMITER $$

CREATE FUNCTION crear_email(a VARCHAR(50),b VARCHAR(50),c VARCHAR(50))
RETURNS VARCHAR(100)
BEGIN

DECLARE CORREO VARCHAR(100);
SET CORREO=CONCAT(a,".",b,".",c,"@vegammedia.es");

RETURN CORREO;

END $$

DELIMITER ;




DROP TRIGGER IF EXISTS email_null;

DELIMITER $$

CREATE TRIGGER email_null
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
	IF (NEW.email IS NULL) THEN
		SET NEW.email=crear_email(NEW.nombre,NEW.apellido1,NEW.apellido2);
	END IF;
END $$

DELIMITER ;


INSERT INTO usuario VALUES(0,'Federico','Garcia','Lorca','poeta@spain.es');
INSERT INTO usuario VALUES(0,'Emilia','Pardo','Bazan',NULL);

select * from usuario;