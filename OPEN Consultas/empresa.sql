#--1

SELECT apellido,salario+(salario*0.1) as "Salario Incrementado"
FROM EMPLEADOS
WHERE oficio like 'VENDEDOR'

#--2  utilizar la funcion NVL para convertir nulos a un valor

SELECT apellido,salario,comision,salario+NVL(comision,0)  as "Importe Total"
FROM EMPLEADOS


#--3

SELECT *
FROM EMPLEADOS
WHERE comision is NULL

#--4

SELECT *
FROM EMPLEADOS
WHERE oficio like 'VENDEDOR' AND salario BETWEEN 1750 AND 2000

#--5

SELECT *
FROM EMPLEADOS
WHERE oficio not like 'VENDEDOR' and apellido like 'G*' and salario>2500

#--6

SELECT emp_no as "Nº Empleado",apellido,dep_no as "Departamento"
FROM EMPLEADOS
WHERE Departamento IN (10,30)

#--7

SELECT dep_no as "dpto",apellido,salario
FROM EMPLEADOS
ORDER BY dpto ASC,salario DESC

#--8

SELECT MAX(salario) as "máximo",MIN(salario) as "minimo",MAX(salario)-MIN(salario) as "Diferencia"
FROM EMPLEADOS

#--9

 SELECT AVG(salario) as "Salario Medio"
 FROM EMPLEADOS
 
 #--10
 
 SELECT dep_no as "dpto",AVG(salario) as "Salario Medio"
 FROM EMPLEADOS
 group BY dpto
 ORDER BY dpto
 
 #--11
 
  SELECT dep_no as "dpto",COUNT(*) as "Empleados"
 FROM EMPLEADOS
 group BY dpto
 
 
 #--12
 
 SELECT oficio,MAX(salario) as "Mayor Salario Oficio"
 FROM EMPLEADOS
 WHERE oficio not like 'PRESIDENTE'
 group BY oficio
 
 
 #--13
 
 SELECT oficio,COUNT(*) as "empleados"
 FROM EMPLEADOS
 group BY oficio
 HAVING count(*)>=2
 
 
 #--14
 
SELECT oficio,COUNT(*) as "empleados"
FROM EMPLEADOS
WHERE salario>1400
group by oficio
HAVING count(*)>=2
 
#--15

SELECT emp_no,apellido,dnombre,localidad
FROM EMPLEADOS as Em,DEPARTAMENTOS as De
WHERE Em.dep_no=De.dep_no

#--16

SELECT E1.emp_no as "NºEmpleado",E1.apellido,E1.director as "Nº director",E2.apellido
FROM EMPLEADOS E1,EMPLEADOS E2
WHERE E1.director=E2.emp_no

#--17


SELECT E1.emp_no as "NºEmpleado",E1.apellido,E1.director as "Nº director",E2.apellido
FROM EMPLEADOS E1,EMPLEADOS E2
WHERE E1.director=E2.emp_no and oficio like 'VENDEDOR'

#--18

SELECT emp_no as "NºEmpleado",apellido
FROM EMPLEADOS
WHERE dep_no not IN (SELECT dep_no FROM DEPARTAMENTOS WHERE dnombre like 'VENTAS')


#--19

SELECT dep_no as "Nºdpto",apellido,salario
FROM EMPLEADOS
WHERE salario > (SELECT AVG(salario) FROM EMPLEADOS)

#--20

SELECT emp_no as "NºEmpleado",apellido,oficio
FROM EMPLEADOS
WHERE oficio IN (SELECT oficio FROM EMPLEADOS WHERE apellido like 'ALONSO')

#--21

SELECT emp_no as "NºEmpleado",apellido,oficio,salario
FROM EMPLEADOS
WHERE salario > (SELECT salario FROM EMPLEADOS WHERE dep_no IN (SELECT dep_no FROM EMPLEADOS WHERE dep_no=30))