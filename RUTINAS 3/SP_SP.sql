DROP DATABASE IF EXISTS Envios;

CREATE DATABASE Envios;

USE Envios;

source C:/envios.sql

SELECT * FROM S;
SELECT * FROM P;
SELECT * FROM SP;

mysql> SELECT * FROM S;
+----+---------+--------+---------+
| sn | snombre | estado | ciudad  |
+----+---------+--------+---------+
| S1 | Salazar |     20 | Londres |
| S2 | Jaimes  |     10 | Paris   |
| S3 | Bernal  |     30 | Paris   |
| S4 | Corona  |     20 | Londres |
| S5 | Aldana  |   NULL | Atenas  |
+----+---------+--------+---------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM P;
+----+---------+-------+------+---------+
| pn | pnombre | color | peso | ciudad  |
+----+---------+-------+------+---------+
| P1 | tuerca  | verde |   12 | Paris   |
| P2 | perno   | rojo  |   17 | Londres |
| P3 | birlo   | azul  |   17 | Roma    |
| P4 | birlo   | rojo  |   14 | Londres |
| P5 | leva    | azul  |   12 | Paris   |
| P6 | engrane | rojo  |   19 | Paris   |
+----+---------+-------+------+---------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM SP;
+----+----+------+
| sn | pn | cant |
+----+----+------+
| S1 | P1 |  300 |
| S1 | P2 |  200 |
| S1 | P3 |  400 |
| S1 | P4 |  200 |
| S1 | P5 |  100 |
| S1 | P6 |  100 |
| S2 | P1 |  300 |
| S2 | P2 |  400 |
| S3 | P2 |  200 |
| S4 | P2 |  200 |
| S4 | P3 |  100 |
| S4 | P4 |  300 |
| S4 | P5 |  400 |
+----+----+------+

#--procedimiento que muestre el nombre de las piezas que ha enviado un proveedor 'sn'
#-- el procedimiento recibirá como parámetro el codigo del proveedor 'sn' sin inner join con 

DELIMITER $$

DROP PROCEDURE IF EXISTS PiezasEnviadas $$

CREATE PROCEDURE PiezasEnviadas(IN proveedor VARCHAR(4))
BEGIN
    SELECT P.pnombre
    FROM P
    WHERE P.pn IN (SELECT SP.pn FROM SP WHERE SP.sn = proveedor);
END$$

DELIMITER ;

#-- Llamar al procedimiento con el código del proveedor 'S1'
CALL PiezasEnviadas('S1');


#--Funcion que determine el peso total de un Envio
#--la funcion recibira como parametro el codigo del proveedor 'sn' y el codigo de la pieza 'pn' de la que hace el envio sin inner join

DELIMITER $$


DROP FUNCTION IF EXISTS PesoTotalEnvio $$

CREATE FUNCTION PesoTotalEnvio(proveedor VARCHAR(4), pieza VARCHAR(4))
RETURNS INT
BEGIN
    DECLARE peso_total INT;
    
    SELECT SUM(P.peso)
    INTO peso_total
    FROM P
    WHERE P.pn = pieza AND P.pn IN (SELECT SP.pn FROM SP WHERE SP.sn = proveedor);
    
    RETURN peso_total;
END$$

DELIMITER ;

#-- Llamar a la función con el código del proveedor 'S1' y el código de la pieza 'P1'
SELECT PesoTotalEnvio('S1', 'P1');

La función `PesoTotalEnvio` calcula el peso total de un envío realizado por un proveedor específico y de una pieza específica. En este caso, se llama a la función con el código del proveedor 'S1' y el código de la pieza 'P1'. La función sumará los pesos de todas las piezas de ese proveedor que coincidan con el código de la pieza 'P1' y devolverá el peso total del envío.

Por favor, ten en cuenta que esta función asume la existencia de las tablas `P` y `SP`, así como sus respectivas columnas. Asegúrate de que las tablas y columnas existen y contienen los datos necesarios para que la función funcione correctamente.