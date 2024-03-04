1º
SELECT nombre
FROM Ciclista
WHERE edad > 30

2º
SELECT COUNT(*) AS "Treitañeros"
FROM Ciclista
WHERE edad > 30

3º
SELECT nomequipo, COUNT(*) AS "Nº Ciclistas"
FROM Ciclista
GROUP BY nomequipo

4º
SELECT COUNT(*) AS "Nº equipos"
FROM Equipo.

5º
SELECT salida, llegada
FROM Etapa
WHERE numetapa = 2

6º
SELECT COUNT(*) AS "Nº Etapas"
FROM Etapa

7º
SELECT COUNT(*) AS "Salidas desde Valladolid"
FROM Etapa
WHERE salida IN ('Valladolid')

8º
SELECT COUNT(*) AS "Cantidad Ganado por jugador 1" 
FROM Etapa
WHERE dorsal = 1

9º
SELECT nompuerto, altura
FROM Puerto
WHERE altura > 1500

10º
SELECT COUNT(*) AS "Puertos altura superior a 1500m"
FROM Puerto
WHERE altura > 1500

11º
SELECT numetapa, COUNT(*) AS "Nº Puertos"
FROM Puerto
GROUP BY numetapa

12º
SELECT numetapa, COUNT(*) AS "Nº Puertos"
FROM Puerto
GROUP BY numetapa
HAVING COUNT(*) > 2

13º
SELECT dorsal, COUNT(*) AS "Etapas ganadas"
FROM Puerto
GROUP BY dorsal

14º
SELECT dorsal, COUNT(*) AS "Etapas ganadas"
FROM Puerto
GROUP BY dorsal
HAVING COUNT(*) > 1

15º
SELECT dorsal, COUNT(*) AS "Etapas ganadas"
FROM Puerto
GROUP BY dorsal
ORDER BY COUNT(*) DESC
LIMIT 1

16º
SELECT SUM(kms) AS "Total Kilometros recorridos"
FROM Etapa

17º
SELECT AVG(altura) AS "Media de la altura de los puertos"
FROM Puerto

18º
SELECT *
FROM Puerto
WHERE numetapa=10

19º
SELECT MAX(kms) AS "Kilómetros de la etapa más larga"
FROM Etapa

20º
SELECT MAX(altura) AS "Altura del puerto mas alto etapa 10"
FROM Puerto
WHERE numetapa=10


