#--1
SELECT COUNT(*) as "Nº Articulos"
FROM ARTICULOS
WHERE stock is NULL

#--2
SELECT codcli
FROM FACTURAS
WHERE iva=16
GROUP by codcli
having AVG(dto) >15

#--3
SELECT codcli,count(*) as "NºFacturas"
FROM FACTURAS
group by codcli
having count(*) > 5

#--4
SELECT codcli,iva,count(*) as "NºFacturas"
FROM FACTURAS
WHERE codcli BETWEEN 240 and 260
group by codcli,iva

#--5
SELECT codart,descrip,precio 
FROM ARTICULOS
order by precio DESC
limit 10

#--6
SELECT codart,SUM(cant) as "Cantidad Total"
from LINEAS_FAC
WHERE codart like '*X?'

#--7
SELECT C.nombre AS cliente, C.direccion, P.nombre AS pueblo, COUNT(F.codfac) AS nfacturas
FROM CLIENTES AS C, PUEBLOS AS P, PROVINCIAS AS V, FACTURAS AS F
WHERE P.codpro=V.codpro AND C.codpue=P.codpue AND C.codcli=F.codcli
AND V.nombre='CASTELLON' AND year(F.fecha)=2009
GROUP BY C.codcli, C.nombre, C.direccion, P.nombre
#--8
SELECT codfac,sum(cant*precio) as "Mayor Factura"
from LINEAS_FAC
group by codfac
order by sum(cant*precio) DESC
limit 1

#--9
SELECT C.codcli as "Cliente",C.nombre as "Nombre"
from CLIENTES C,FACTURAS F,LINEAS_FAC L
WHERE C.codcli=F.codcli and L.codfac=F.codfac and year(fecha)=2009 and MONTH(fecha)=12 
group by C.codcli,C.nombre
having sum(L.precio*L.cant)>60

#--10
SELECT F.codcli as "Cliente"
from FACTURAS F,LINEAS_FAC L
WHERE L.codfac=F.codfac
group by F.codcli
having AVG(dto)>15
order by count(*) DESC 
limit 1

#--11
SELECT C.codcli as "Cliente",C.nombre as "Nombre"
from CLIENTES C,FACTURAS F,LINEAS_FAC L
WHERE  C.codcli=F.codcli and L.codfac=F.codfac and L.codart IN 
(SELECT codart 
from ARTICULOS 
where precio IN (select max(precio) from ARTICULOS))

#--12
SELECT count(*) AS "Número de artículos"
FROM ARTICULOS
WHERE stock>20 AND precio>15
AND codart NOT IN ( SELECT codart FROM LINEAS_FAC L, FACTURAS F
WHERE F.codfac=L.codfac AND year(fecha)=2009
AND month(fecha) IN (10,11,12) );