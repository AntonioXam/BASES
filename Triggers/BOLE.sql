DROP DATABASE IF EXISTS TIENDA;

CREATE DATABASE TIENDA;

USE TIENDA;

CREATE TABLE ARTICULO (
	codArt VARCHAR(5) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	lineArt VARCHAR(15),
	precio INTEGER NOT NULL,
	unidades INTEGER NOT NULL
	);
	
#-- crear variable @TOTAL

SET @TOTAL=0;

#--crear un trigger contar_articulos que vaya actualizando el valor @TOTAL cada vez que se introduzca un nuevo articulo en la tienda

CREATE TRIGGER contar_articulos
AFTER INSERT ON ARTICULO
FOR EACH ROW

	SET @TOTAL = @TOTAL + NEW.unidades;



INSERT INTO ARTICULO VALUES 
('DD01','disco duro ssd 1TB','DDuro',225,10),
('DD02','disco duro ssd 500TB','DDuro',130,5),
('PB01','Placa base amd asus',NULL,95,8),
('MR01','Memoria DDR4 8GB','NRAM',80,7),
('MR02','Memoria DDR4 4GB','NRAM',45,10);


INSERT INTO ARTICULO VALUES 
('PB02','Placa base amd gigabyte','PlacaBase',95,5);


#--crear un trigger actualizar_unidades que vaya actualizando el valor @TOTAL cuando se modifique el numero de unidades de un articulo en la tienda 

CREATE TRIGGER actualizar_unidades
AFTER UPDATE ON ARTICULO
FOR EACH ROW
	SET @TOTAL = @TOTAL - OLD.unidades + NEW.unidades;

UPDATE ARTICULO
SET precio =precio+5
WHERE precio < 100;


UPDATE ARTICULO
SET unidades=unidades*2
WHERE codArt='DD02';
UPDATE ARTICULO
SET unidades=unidades+1;


#--crear un trigger eliminar_articulo que vaya actualizando el valor @TOTAL cuando se elimine un articulo de la tienda

CREATE TRIGGER eliminar_articulo
AFTER DELETE ON ARTICULO
FOR EACH ROW

	SET @TOTAL = @TOTAL - OLD.unidades;


#--consultar el total de unidades de articulos en la tienda
SELECT @TOTAL;

DELETE FROM ARTICULO
WHERE precio < 60;

CREATE TABLE VENTA (
	codVenta VARCHAR(6) PRIMARY KEY,
	codArt VARCHAR(5) NOT NULL,
	fechaVenta DATE,
	cantidad INTEGER NOT NULL,
	FOREIGN KEY(codArt) REFERENCES ARTICULO(codArt)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	);
	
#-- trigger vender_articulo que por cada venta realizada de un articulo, actualize el numero de unidades del articulo en la tienda


CREATE TRIGGER vender_articulo
AFTER INSERT ON VENTA
FOR EACH ROW
UPDATE ARTICULO
SET unidades = unidades - NEW.cantidad
WHERE codArt = NEW.codArt;

INSERT INTO VENTA VALUES
('V01','DD01',CURRENT_DATE(),5),
('V02','DD02',CURRENT_DATE(),5);


#-- elimina el articlo del que se hayan vendido menor numero de unidades


DELETE FROM ARTICULO
WHERE codArt = (
	SELECT codArt
	FROM (
		SELECT codArt, SUM(cantidad) as total_vendido
		FROM VENTA
		GROUP BY codArt
		ORDER BY total_vendido ASC
		LIMIT 1
	) as articulo_vendido
);


