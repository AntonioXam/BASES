-- MySQL dump 10.13  Distrib 5.5.23, for Win32 (x86)
--
-- Host: localhost    Database: ligabasket
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  `ciudad` char(50) NOT NULL,
  `pabellon` char(100) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Real Madrid','Madrid','WiZink Center'),(2,'FC Barcelona Lassa','Barcelona','Palau Blaugrana'),(3,'UCAM Murcia','Murcia','Palacio Municipal de Deportes'),(4,'Valencia Basket','Valencia','Fonteta'),(5,'Unicaja','Malaga',NULL),(6,'Baskonia','Vitoria',NULL),(7,'Estudiantes','Madrid','WiZink Center');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugadores` (
  `id_jugador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(30) NOT NULL,
  `apellido` char(30) NOT NULL,
  `puesto` char(20) NOT NULL,
  `salario` int(11) NOT NULL,
  `altura` float DEFAULT NULL,
  `id_capitan` int(11) DEFAULT NULL,
  `equipo` int(11) NOT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `id_capitan` (`id_capitan`),
  KEY `equipo` (`equipo`),
  CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`id_capitan`) REFERENCES `jugadores` (`id_jugador`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`equipo`) REFERENCES `equipos` (`id_equipo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Felipe','Reyes','pivot',120000,2.04,1,1),(2,'Sergio','Llull','base',100000,1.9,1,1),(3,'Rudy','Fernandez','alero',130000,1.96,1,1),(4,'Jaycee','Carroll','escolta',90000,1.88,1,1),(5,'Juan Carlos','Navarro','escolta',120000,1.92,5,2),(6,'Pau','Ribas','escolta',80000,1.94,5,2),(7,'Ante','Tomic','pivot',105000,2.17,5,2),(8,'Victor','Claver','ala-pivot',80000,2.07,5,2),(9,'Vitor','Benite','escolta',75000,1.94,9,3),(10,'Sadiel','Rojas','alero',68000,1.98,9,3),(11,'Marcos','Delia','pivot',85000,2.11,9,3),(12,'Rafa','Mart¡nez','escolta',95000,1.9,12,4),(13,'Fernando','San Emeterio','alero',98000,1.99,12,4),(14,'Bojan','Dubljevic','pivot',115000,2.05,12,4),(15,'Carlos','Suarez','ala-pivot',96000,2.03,15,5),(16,'Alberto','Diaz','base',56000,1.88,15,5),(17,'Daniel','Diaz','alero',78000,2.01,15,5),(18,'Jayson','Granger','base',96000,1.88,18,6),(19,'Tornike','Shengelia','ala-pivot',118000,2.06,18,6),(20,'Janis','Timma','alero',98000,2.01,18,6);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partidos` (
  `id_partido` int(11) NOT NULL AUTO_INCREMENT,
  `elocal` int(11) NOT NULL,
  `evisit` int(11) NOT NULL,
  `puntosL` int(11) NOT NULL,
  `puntosV` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_partido`),
  KEY `elocal` (`elocal`),
  KEY `evisit` (`evisit`),
  CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`elocal`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`evisit`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidos`
--

LOCK TABLES `partidos` WRITE;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
INSERT INTO `partidos` VALUES (1,1,2,78,75,'2018-01-28'),(2,3,4,82,85,'2018-01-29'),(3,5,6,91,92,'2018-01-30'),(4,1,6,80,72,'2018-05-01'),(5,1,5,75,74,'2018-05-01'),(6,1,4,82,85,'2018-05-01');
/*!40000 ALTER TABLE `partidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-01 19:26:44