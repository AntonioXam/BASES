1º

SELECT snombre
FROM S

2º

SELECT *
FROM P

3º

SELECT pnombre, color
FROM P
WHERE peso > 15

4º

SELECT pnombre, ciudad
FROM P
WHERE color = 'azul'

5º

SELECT pnombre, color
FROM P
WHERE peso BETWEEN 15 AND 20

6º

SELECT pnombre, color
FROM P
WHERE peso NOT BETWEEN 15 AND 20

7º

SELECT pnombre
FROM P
WHERE pnombre LIKE '%a'

8º

SELECT snombre
FROM S
WHERE snombre NOT LIKE  'B%' 

9º

SELECT  DISTINCT ciudad
FROM P

10º

SELECT sn AS "Proveedor", snombre
FROM S
WHERE ciudad ='Londres'

11º

SELECT pnombre, peso
FROM P
ORDER BY "ciudad", "peso" DESC

12º

SELECT *
FROM S
WHERE estado IS NULL

13º

SELECT *
FROM S
WHERE estado IS NOT NULL

14º

SELECT pnombre
FROM P
WHERE ciudad = 'Londres' OR ciudad ='Roma'

15º

SELECT pn
FROM P
WHERE color NOT IN  ('rojo','verde')

16º

SELECT COUNT(*) AS "Proveedores"
FROM S

17º

SELECT MIN(peso) AS "Peso mínimo"
FROM P

18º

SELECT sn AS "Proveedores",SUM(cant) AS "Cantidad"
FROM SP
GROUP BY sn

19º

SELECT color,COUNT(color) AS "Cantidad piezas"
FROM P
GROUP BY color

20º

SELECT sn AS "Proveedores",SUM(cant) AS "Cantidad"
FROM SP
GROUP BY sn
HAVING SUM(cant) >= 1000