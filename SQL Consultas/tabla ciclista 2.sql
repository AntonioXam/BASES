





#--13
SELECT salida,llegada
FROM Etapa E,Puerto P
WHERE E.numetapa=P.numetapa AND P.pendiente =
(SELECT MAX(pendiente)
FROM Puerto);

#--14
SELECT dorsal,nombre
FROM Ciclista C,Puerto P
WHERE C.dorsal=P.dorsal AND P.altura =
(SELECT MAX(altura)
FROM Puerto);

#--15
SELECT DISTINCT E.*
FROM Etapa E,Puerto P
WHERE E.numetapa=P.numetapa AND P.altura > 1300 AND E.numetapa NOT IN
(SELECT numetapa FROM Puerto WHERE altura<=1300)

#--16
SELECT MIN(edad) AS "menor_edad",MAX(edad) as "mayor_edad",AVG(edad*1.00) as "media_edad"
FROM Ciclista

#--17
SELECT E.director,E.nomequipo
FROM Equipo E,Ciclista C,Etapa ET
WHERE E.nomequipo=C.nomequipo AND C.dorsal=ET.dorsal AND kms =
(SELECT MAX(kms)
FROM Etapa)

#--18
SELECT C.dorsal,C.nombre,COUNT(E.dorsal) as "estapas"
FROM Ciclista C,Etapa E
WHERE C.dorsal=E.dorsal
group BY C.dorsal,C.nombre

#--19



#--20
SELECT C.nombre,C.nomequipo,COUNT(*) as "Num_veces"
FROM Ciclista C,Lleva L,Maillot M
WHERE C.dorsal=L.dorsal AND L.código=M.código AND color='amarillo'
group by C.nombre,C.nomequipo

#--21