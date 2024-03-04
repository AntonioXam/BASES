/* METODOS EN BASE DE DATOS*/

--Procedimientos
--a) Rutinas
--b) Disparadores


DROP DATABASE IF EXISTS Ejemplos;
CREATE DATABASE Ejemplos;
USE Ejemplos;

CREATE PROCEDURE hola_mundo()
SELECT 'Hola, mundo!' AS 'Mi primera rutina';

CALL hola_mundo;


/*CREATE PROCEDURE adios()
SELECT 'Hasta la vista baby' as 'Adios!',
SELECT 'See you soon' as 'Bye'; asi no se combina */


DROP PROCEDURE IF EXISTS hola_mundo();

DELIMITER $$

CREATE PROCEDURE hola_mundo()

BEGIN 
SELECT ' hola mundo!!' as ' Mi primera rutina';
SELECT ' Que pasa pipol' as 'Segunda rutina';
SELECT ' Venga hasta luego' as 'Adios rutina';
end $$

DELIMITER ;
