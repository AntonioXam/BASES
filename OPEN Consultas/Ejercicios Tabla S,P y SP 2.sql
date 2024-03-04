#--1
SELECT *
FROM P
WHERE color = 'rojo' AND peso > 15

#--2
SELECT DISTINCT ciudad
FROM S
WHERE ciudad IN (SELECT ciudad
FROM P)

#--3
SELECT DISTINCT ciudad
FROM S
WHERE ciudad NOT IN (SELECT ciudad
FROM P)

#--4
SELECT DISTINCT pnombre
FROM P
WHERE LOWER(pnombre) LIKE 'p%'

#--5
SELECT pnombre AS "Nombre",color, peso
FROM P
WHERE peso > 12 AND (pnombre LIKE '%o' OR pnombre LIKE '%a')
ORDER BY color, peso DESC

#--6
SELECT COUNT(pn) AS "NºPiezas"
FROM SP
WHERE sn ='S2'

#--7
SELECT COUNT(DISTINCT ciudad) AS "Ciudades donde se almacenan piezas"
FROM P

#--8
SELECT COUNT(color) AS "Piezas rojas"
FROM P
WHERE color = 'rojo'

#--9
SELECT pnombre AS "Pieza mas pesada"
FROM P
WHERE peso = (SELECT MAX(peso)
FROM P)

#--10
SELECT *
FROM SP
WHERE cant = (SELECT MIN(cant)
FROM SP)

#--11
SELECT AVG(cant) AS "Media de los pedidos S1"
FROM SP
WHERE sn IN 'S1' AND pn NOT IN ('P1','p2')

#--12
SELECT snombre
FROM S
WHERE estado > (SELECT AVG(estado)
FROM S)

#--13
SELECT sn AS "Proveedor",AVG(cant) AS "Media de las cantidad"
FROM SP
GROUP BY sn

#--14
SELECT sn AS "Proveedor",AVG(cant) AS "Media de las cantidad"
FROM SP
GROUP BY sn
HAVING COUNT(sn) >2