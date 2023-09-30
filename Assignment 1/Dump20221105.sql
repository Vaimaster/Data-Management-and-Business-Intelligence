CREATE DATABASE  IF NOT EXISTS `medical_prescriptions` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `medical_prescriptions`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: medical_prescriptions
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `idArea` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `mean_income` float DEFAULT NULL,
  PRIMARY KEY (`idArea`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Marousi',25000),(2,'Glyfada',30000),(3,'Kypseli',18000);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `idDoctor` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `specialization` varchar(45) DEFAULT NULL,
  `idArea` int DEFAULT NULL,
  PRIMARY KEY (`idDoctor`),
  KEY `idArea` (`idArea`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `area` (`idArea`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Filipou','pathologist',1),(2,'Dimitriou','cardiologist',1),(3,'Georgiou','Ogologist',2),(4,'Mitropoulou','orthopedist',2),(5,'Politis','pediatrician',3),(6,'Vaidomarkakis','pathologist',3);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug` (
  `iddrug` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`iddrug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (1,'Apixaban','Decreases the clotting (coagulating) ability of the blood',50.25),(2,'Coplidogrel','Keeps blood clots from forming by preventing blood platelets from sticking together',92.3),(3,'Lynparza','medication for the maintenance treatment of BRCA-mutated advanced ovarian cancer in adults',102.36),(4,'Lupron','Is used for the management of endometriosis, including pain relief and reduction of endometriotic lesions.',85.32),(5,'Toradol','Is used for the short-term treatment of moderate to severe pain in adults.',7.25),(6,'Zilretta','Is an extended-release corticosteroid approved to manage osteoarthritis knee pain',23.57),(7,'Amoxicillin','Is a penicillin antibiotic that fights bacteria',50.32),(8,'Albuterol','Is used to prevent and treat wheezing and shortness of breath caused by breathing problems',62.6),(9,'Levoxyl','is a thyroid medicine that replaces a hormone normally produced by your thyroid gland to regulate the body\'s energy and metabolism',10.6),(10,'Cyanocobalamin','It\'s used to treat and prevent vitamin B12 deficiency anaemia',12.72);
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `SSN` int NOT NULL,
  `name` text,
  `phone_number` bigint DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` text,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (106983756,'Lemoni',6943710545,'1955-08-01','F'),(133756874,'Zagorakis',6970967731,'1950-01-22','M'),(139576264,'Diakou',6922523633,'1964-08-30','F'),(162952946,'Panagiotopoulos',6936282638,'1980-02-27','M'),(162952947,'Panagopoulou',6936282738,'1995-03-29','F'),(163952947,'Bezos',6936282739,'1990-04-17','M'),(165626790,'Papanastasiou',6987686117,'1957-08-19','M'),(800294876,'Grammenos',6912210665,'1977-09-06','M'),(800725683,'Paluca',6926344898,'1994-10-04','F'),(800928456,'Antonopoulou',6903896858,'1978-04-20','F'),(800928475,'Diamantidis',6950723981,'1951-02-10','M'),(801309744,'Mitropoulos',6992800249,'1978-01-30','M'),(801924673,'Antoniou',6990673412,'1953-07-06','F'),(802956921,'Kondylis',6911700322,'1965-04-06','M'),(805612509,'Prosmitrelis',6984865389,'1988-03-20','M'),(807344366,'Kardara',6992888276,'1968-05-21','F'),(809359375,'Kontogoni',6936893552,'1955-10-02','F'),(809578928,'Karderemidis',6955824252,'1996-09-25','M'),(817654790,'Papadopoulou',6976202717,'1990-08-22','F'),(825670123,'Papaloukas',6908646863,'1962-05-04','M'),(873529057,'Politi',6926958027,'1978-12-27','F'),(994958674,'Skorda',6949834353,'1982-11-06','F'),(999124567,'Basinas',6901701378,'1982-07-19','M');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `idPrescription` int NOT NULL AUTO_INCREMENT,
  `Date` datetime DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `idDoctor` int DEFAULT NULL,
  `iddrug` int DEFAULT NULL,
  `idpatient` int DEFAULT NULL,
  PRIMARY KEY (`idPrescription`),
  KEY `idDoctor` (`idDoctor`),
  KEY `iddrug` (`iddrug`),
  KEY `idpatient` (`idpatient`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`idDoctor`) REFERENCES `doctor` (`idDoctor`),
  CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`iddrug`) REFERENCES `drug` (`iddrug`),
  CONSTRAINT `prescription_ibfk_4` FOREIGN KEY (`idpatient`) REFERENCES `patient` (`SSN`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'2020-01-13 00:00:00',20,3,2,817654790),(2,'2020-01-12 00:00:00',25,4,5,809359375),(3,'2020-02-01 00:00:00',30,5,7,801309744),(4,'2020-03-01 00:00:00',15,2,2,999124567),(5,'2020-04-01 00:00:00',18,4,6,807344366),(6,'2020-05-01 00:00:00',22,2,2,801309744),(7,'2020-06-01 00:00:00',12,4,6,133756874),(8,'2020-07-01 00:00:00',18,2,2,807344366),(9,'2020-08-01 00:00:00',20,3,3,800725683),(10,'2020-09-01 00:00:00',25,3,4,800725683),(11,'2020-10-01 00:00:00',23,4,6,999124567),(12,'2020-11-01 00:00:00',17,4,5,873529057),(13,'2020-12-01 00:00:00',13,4,5,873529057),(14,'2020-01-05 00:00:00',20,5,7,807344366),(15,'2020-02-05 00:00:00',15,5,8,873529057),(16,'2020-03-04 00:00:00',20,3,3,139576264),(17,'2020-04-02 00:00:00',23,1,8,106983756),(18,'2020-05-01 00:00:00',18,4,6,139576264),(19,'2020-06-01 00:00:00',19,2,1,165626790),(20,'2020-07-01 00:00:00',20,4,6,802956921),(21,'2021-01-13 00:00:00',24,5,7,802956921),(22,'2021-01-12 00:00:00',24,6,8,805612509),(23,'2021-02-01 00:00:00',12,5,7,805612509),(24,'2021-03-01 00:00:00',14,5,8,805612509),(25,'2021-04-01 00:00:00',19,5,8,801924673),(26,'2021-05-01 00:00:00',5,4,6,165626790),(27,'2021-06-01 00:00:00',2,1,7,801924673),(28,'2021-07-01 00:00:00',6,4,6,825670123),(29,'2021-08-01 00:00:00',8,1,7,809578928),(30,'2021-09-01 00:00:00',6,2,1,825670123),(31,'2021-10-01 00:00:00',3,1,7,809578928),(32,'2021-11-01 00:00:00',17,5,7,825670123),(33,'2021-12-01 00:00:00',5,6,7,994958674),(34,'2021-01-05 00:00:00',20,2,2,994958674),(35,'2021-02-05 00:00:00',23,3,3,800294876),(36,'2021-03-04 00:00:00',13,5,8,800928475),(37,'2021-04-02 00:00:00',16,6,8,800928475),(38,'2021-05-01 00:00:00',20,5,8,800928456),(39,'2021-06-01 00:00:00',2,6,7,809359375),(40,'2021-07-01 00:00:00',10,5,7,800928475);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-05 14:56:37