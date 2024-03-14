/* Procedimiento que muestre el nombre de las piezas que ha enviado un proovedor
el procedimiento recibira como parametro el codigo del prooveedor*/


DELIMITER $$

DROP PROCEDURE IF EXISTS piezasEnvio $$

CREATE PROCEDURE piezasEnvio(IN proveedor VARCHAR(4))
BEGIN
	SELECT DISTINCT pnombre AS "Pieza", cant AS "Unidades"
	FROM P,SP
	WHERE P.pn=SP.pn AND proveedor=sn;
END $$

DELIMITER ;



/*Funcion que determine el peso total de un envio*/


DELIMITER $$

DROP FUNCTION IF EXISTS pesoTotal $$

CREATE FUNCTION pesoTotal(proveedor VARCHAR(4),pieza VARCHAR(4))
RETURNS INT
BEGIN
	DECLARE pesoP, cantidad INT;
	
	SET pesoP=(SELECT peso FROM P WHERE pn=pieza);
	SET cantidad=(SELECT cant FROM SP WHERE sn=proveedor AND pn=pieza);
	
	RETURN pesoP*IFNULL(cantidad,0);
	
	
END $$

DELIMITER ;


/* PRocedimiento que muestre las siguiente informacion sobre un envio:
	El nombre del proveeder
	El nombre de la pieza 
	El peso total del envio
El procedimiento recibirá como parametros el codigo del proveedor:
	El codigo del proovedor
	El codigo de la pieza de la que hace el envio*/
	
	
DELIMITER $$

DROP PROCEDURE IF EXISTS pesoTotal2 $$ 

CREATE PROCEDURE pesoTotal2(IN proveedor VARCHAR(4),pieza VARCHAR(4))
BEGIN
	
	SELECT snombre as "proveedor",pnombre as "Pieza",pesoTotal(proveedor,pieza) as "Peso Total de los envios"
	FROM S,P,SP
	WHERE P.pn=SP.pn AND S.sn=SP.sn AND SP.sn=proveedor AND SP.pn=pieza;

END $$

DELIMITER ;
	