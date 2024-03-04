#--1
SELECT codfac,fecha,dto*2 as "Descuento"
FROM FACTURAS
WHERE iva=0

#--2
SELECT codfac,fecha
FROM FACTURAS
WHERE iva IS NULL

#--3
SELECT codfac,fecha
FROM FACTURAS
WHERE iva IS NULL or iva=0

#--4
SELECT codfac,codart
FROM LINEAS_FAC L
WHERE cant<5 AND dto<=25%

#--5
SELECT descrip,stock_min
FROM ARTICULOS
WHERE stock < stock_min

#--6
SELECT DISTINCT iva as "IVA Distintos"
FROM FACTURAS
WHERE iva IS NOT NULL

#--7
SELECT codart,descrip,stock_min
FROM ARTICULOS
WHERE stock is NULL

#--8
SELECT DISTINCT descrip
FROM ARTICULOS
WHERE stock=stock_min*3 AND precio>6

#--9
SELECT DISTINCT codart
FROM ARTICULOS A,LINEAS_FAC L
WHERE A.codart = L.codart and codfac BETWEEN 8 and 10

#--10
SELECT nombre
FROM PROVINCIAS
WHERE nombre like '?O*'

#--11
SELECT codfac,fecha
FROM FACTURAS
WHERE YEAR(fecha)=2008

#--12
SELECT codfac,fecha
FROM FACTURAS
WHERE codcli BETWEEN 50 and 100 and YEAR(fecha)<> 2009

#--13
select codfac,fecha
FROM FACTURAS
WHERE MONTH(fecha)=3 and YEAR(fecha) IN (2007,2008,2009)

#--14
select codfac,fecha
FROM FACTURAS
WHERE DAY(fecha)<=20 and YEAR(fecha)=2009 and codcli BETWEEN 100 and 250

#--15
select nombre 
FROM PROVINCIAS
WHERE nombre like UPPER '*s'

#--16
select nombre
FROM CLIENTES
WHERE codpostal like '02*' or codpostal like '11*' or codpostal like '21*'

#--17
select *
FROM ARTICULOS
WHERE stock not BETWEEN  stock_min -500 and stock_min +500

#--18
select nombre
FROM PROVINCIAS
WHERE nombre like upper('*ma') or nombre like upper('ma*')

#--19
select DISTINCT nombre
from PROVINCIAS P,PUEBLOS PU,CLIENTES C
WHERE codpostal like '33*' and P.codpro=PU.codpro and PU.codpue=C.codpue

#--20
select PU.nombre
from PROVINCIAS P,PUEBLOS PU,CLIENTES C
WHERE P.codpro=PU.codpro and PU.codpue=C.codpue and nombre='LEON'

#--21
select SUM(precio*stock)
from ARTICULOS

#--22
select AVG(precio) as "Precio medio"
from ARTICULOS
WHERE stock >10

#--23
select COUNT(*) as "Numero de pueblos"
from PUEBLOS 
WHERE codpue IN 
(select codpue
from CLIENTES
WHERE codpostal like '12*')

#--24
select codcli,count(codfac) "Nº Facturas"
FROM FACTURAS
WHERE iva=16
group by codcli

#--25
select codart,descrip,precio,precio*0.85 as "Precio descuento 15%"
from ARTICULOS
WHERE  (precio >30 and (stock*precio>300)) or (precio <=30 and stock*precio>150)

