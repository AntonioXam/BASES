
#--1

SELECT codfac,SUM(precio*cant) as "Importe de la facturacion"
from LINEAS_FAC
where codart like '*A*'

#--2

select year(fecha),count(*) "Nº Facturas"
from FACTURAS
group by year(fecha)
order by year(fecha)

#--3

select PU.nombre
from CLIENTES C,PUEBLOS PU
where C.codpue=PU.codpue
group by PU.nombre
having count(C.codcli) >2

#--4

select DISTINCT codart as "Codigo",sum(precio*cant) as "Cantidades Totales"
from LINEAS_FAC 
where codart like 'V*'
group by codart



#--6

select codart
from LINEAS_FAC
group by codart
having sum(precio*cant) >900

#--7
select codcli as "Codigo",count(*) as "Nº Facturas"
from FACTURAS
where year(fecha)=2009 and (iva=16 or dto is null or dto=0)
group by codcli
having count(codfac) >2

#--8

select codcli as "Codigo",count(*) as "Nº Facturas"
from FACTURAS
group by codcli
having avg(dto) >15 and count(*) >1

#--9

select codart as "Codigo",descrip as "Descripcion",precio
from ARTICULOS
order by precio desc 
limit 1

#--10 

select P.nombre,count(codcli) as "Nº Cliente"
from PROVINCIAS P,PUEBLOS PU,CLIENTES C
WHERE P.codpro=PU.codpro and PU.codpue=C.codpue
group by P.nombre
having count(codcli)>5
order by Nº Cliente 

#--11

SELECT F.codfac as "Factura",C.nombre as "Cliente",PU.nombre as "Pueblo"
from CLIENTES C,FACTURAS F,PUEBLOS PU,PROVINCIAS P
WHERE C.codcli=F.codcli and PU.codpue=C.codpue and P.codpro=PU.codpro 
and month(F.fecha) in (7,8,9,10,11,12) 
and year(F.fecha)=2009 and P.nombre like 'CASTELLON'


#--12

select fecha,codfac as "Factura",codcli as " Codigo Cliente",iva,dto
from FACTURAS
where year(fecha)=2008
order by fecha