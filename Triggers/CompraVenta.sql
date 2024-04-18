DROP DATABASE IF EXISTS CompraVenta;

CREATE DATABASE CompraVenta;

use CompraVenta;


CREATE TABLE PRODUCTO (
	codPro VARCHAR(4),
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(50),
	PRIMARY KEY(codPro)
	);

CREATE TABLE COMPRA (
	codPro VARCHAR(4),
	fecha DATE,
	cant INTEGER NOT NULL,
	coste FLOAT NOT NULL,
	PRIMARY KEY(codPro,fecha)
	);
	
CREATE TABLE VENTA (
	codPro VARCHAR(4),
	fecha DATE,
	cant INTEGER NOT NULL,
	pvp FLOAT NOT NULL,
	PRIMARY KEY(codPro,fecha)
	);
	
ALTER TABLE COMPRA 
ADD FOREIGN KEY(codPro) REFERENCES PRODUCTO(codPro)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
		
		ALTER TABLE VENTA
ADD FOREIGN KEY(codPro) REFERENCES PRODUCTO(codPro)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
		
		
/* Insercion de productos*/
INSERT INTO PRODUCTO VALUES
('M01','Mesa ARCADE','Mesa de madera rectangular'),
('M02','Mesa CIRCLE','Mesa de madera circular'),
('S01','Silla HIGH','Silla de respaldo alto'),
('S02','Silla LOW','Silla de respaldo bajo');


SELECT * FROM PRODUCTO;

/*Definicion de variable
Stock */

SET @stock=0;

SET @maxVenta=0;


/* Triggers*/ 

CREATE TRIGGER realizar_compra
AFTER INSERT ON COMPRA
FOR EACH ROW
SET @stock=@stock+NEW.cant;


DELIMITER $$

CREATE TRIGGER realizar_venta
AFTER INSERT ON VENTA
FOR EACH ROW
BEGIN
SET @stock=@stock-NEW.cant;
IF @maxVenta<NEW.cant*NEW.pvp THEN
	SET @maxVenta=NEW.cant*NEW.pvp;
END IF;
END $$

DELIMITER ;

INSERT INTO COMPRA VALUES
('M01','2024-04-15',10,120.5),
('M01','2024-04-16',15,122.5);

SELECT @stock


INSERT INTO VENTA VALUES
('M01','2024-04-17',5,170.3),
('M01','2024-04-18',8,180.2);

SELECT @stock;
SELECT @maxVenta;

INSERT INTO VENTA VALUES
('M01','2024-04-19',12,190);

SELECT @stock;
SELECT @maxVenta;