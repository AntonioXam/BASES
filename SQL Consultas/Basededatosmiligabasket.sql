drop database if exists miligabasket;

create database miligabasket;

use miligabasket;

create table Equipos(
id_equipo 	INTEGER 	AUTO_INCREMENT,
nombre 		VARCHAR(50) not null,
ciudad 		VARCHAR(50) not null,
pabellon 	VARCHAR(100),
PRIMARY KEY(id_equipo)
);

create table Jugadores(
id_jugador 	INTEGER  	AUTO_INCREMENT,
nombre 		VARCHAR(50) not null,
apellido 	VARCHAR(50) not null,
puesto 		VARCHAR(50) not null,
salario 	INTEGER 	not null,
altura 		FLOAT,
id_capitan 	INTEGER,
equipo 		INTEGER 	not null,
PRIMARY KEY(id_jugador),
FOREIGN KEY(id_capitan) REFERENCES Jugadores(id_jugador)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
FOREIGN KEY(equipo) REFERENCES Equipos(id_equipo)
	ON UPDATE CASCADE
);

create table Partidos(
id_partido 	INTEGER AUTO_INCREMENT,
elocal 		INTEGER not null,
evisit 		INTEGER not null,
puntosL 	INTEGER not null,
puntosV 	INTEGER not null,
fecha 		DATE,
PRIMARY KEY(id_partido),
FOREIGN KEY(elocal) REFERENCES Equipos(id_equipo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(evisit) REFERENCES Equipos(id_equipo)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

#-- Insercion de registros uno a uno
INSERT INTO Equipos(id_equipo, nombre, ciudad, pabellon) VALUES(0, 'Real Madrid', 'Madrid', 'Wizink Center');
INSERT INTO Equipos VALUES(0, 'FC Barcelona', 'Barcelona', 'Palau Blaugrana');
#-- insercion de varios registros
INSERT INTO Equipos VALUES(0, 'UCAM Murcia', 'Murcia', 'Palacio Municipal de deportes'), (0,'Valencia Basket', 'Valencia', 'Fonteta');
#--Insercion de un registro que contiene uncampo nulo
INSERT INTO Equipos(id_equipo, nombre, ciudad) VALUES(0,'Unicaja', 'Malaga');
#--Seria equivalente
#--INSERT INTO Equipos VALUES(0,'Unicaja','Malaga',NULL);

#--Insercion de un registro especificando el nombre y valor de las columnas 
INSERT INTO Equipos SET nombre='Baskonia', ciudad='Vitoria';

#--insercion de un registro con los valores procedentes de una consulta SELECT
INSERT INTO Equipos(id_equipo, nombre, ciudad, pabellon)
select 0, 'Estudiantes', ciudad, pabellon
from Equipos
where nombre like 'Real Madrid';

#--Insertamos registros en la tabla Partidos
INSERT INTO Partidos VALUES(0,1,2,70,75,'2024-01-17');
INSERT INTO Partidos VALUES(0,3,4,82,85,'2024-01-17');
INSERT INTO Partidos VALUES(0,5,6,91,92,'2024-01-18');
INSERT INTO Partidos VALUES(0,1,6,80,75,CURRENT_DATE());

#--insertar el partido jugado Hoy entre Real Madrid y Unicaja con resultado 75-74
INSERT INTO Partidos VALUES(0,1,5,75,74,CURRENT_DATE());

#--Un ejemplo mas con producto cartesiano
INSERT INTO Partidos(id_partido, elocal, evisit, puntosL, puntosV, fecha)
select 0, E1.id_equipo, E2.id_equipo,75,74, CURRENT_DATE()
from Equipos E1, Equipos E2
where E1.nombre like 'Real Madrid' and E2.nombre like 'Unicaja';

#--Insertar el partido jugado hoy entre los equipos 1 y 4
#--con el mismo resutlado que el paritdo jugado entre ucam murcia y valencia

INSERT INTO Partidos
select 0,1,4,puntosL, puntosV, CURRENT_DATE()
from Partidos
where elocal=(select id_equipo from Equipos where nombre like 'UCAM Murcia')
AND evisit=(select id_equipo from Equipos where nombre like 'Valencia Basket');

#--Ejemplo de REPLACE
REPLACE INTO Partidos VALUES(1,1,2,79,78,'2024-01-17'); --sirve para reemplazar datos, en caso de no existir dichos datos los insertara como si fuera un INSERT

#--Exportamos los datos de los quipos al fichero Equipos.txt
select * INTO OUTFILE 'D:\\bd\\Equipos.txt' from equipos;

#--Importamos los datos de los jugadores desde el archivo jugaodres.txt
#-- Carga masiva
load data infile 'D:\\BD\\Jugadores.txt' into table Jugadores;

#--Modificaciones: UPDATE
update table 
set campo1=valor1, campo2=valor2
where condicion;

#--Establecer como pabellon del Baskonia el "Buesa Arena"
update equipos
set pabellon='Buesa Arena'
where nombre like 'Baskonia';

#--Cambiar el resultado del partido jugado entre los equipos 3 y 4 
#-- con el resultado final de 83-86

update Partidos
set puntosL=83, puntosV=86
where id_partido=2;

#--subir el salario de todos los jugadores 1000 euros
update Jugadores
set salario=salario+1000;

#--Bajar el salario de los jugadores del madrid 
update Jugadores
set salario=salario-1000
where equipo=(select id_equipo from equipos where nombre like'Real Madrid'); 


LOCK TABLES equipos READ; #-- Bloquea la tabla solo permite leer
LOCK TABLES equipos WRITE; #-- Bloquea la tabla, solo el que la bloquea puede escribir o leer

UNLOCK TABLES; #-- Desbloquea las tablas

#-- Utilizamos los comandos de transacciones 

BEGIN  -- para empezar la transaccion

ROLLBACK -- revertir todo lo anterior

COMMIT  -- confirmar la transaccion



#--Integridad referencial
DELETE from equipos
where nombre like 'Baskonia'; /* error por borrado restringido*/

#-- Para borrarlo ,antes necesitamos borrar todos los jugadores del Baskonia
DELETE FROM Jugadores
where equipo IN (select id_equipo FROM equipos where nombre like 'Baskonia')

DELETE FROM Jugadores
where equipo IN (select id_equipo FROM equipos where nombre like 'Real Madrid');

DELETE from Jugadores
where nombre like 'Felipe' and apellido like 'Reyes';

DELETE from partidos
where evisit in (select id_equipo FROM equipos where nombre like 'UCAM Murcia')d
OR elocal in (select id_equipo FROM equipos where nombre like 'UCAM Murcia');