-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: Summer20
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.16.04.1

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
-- Table structure for table `Course_org`
--

DROP TABLE IF EXISTS `Course_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course_org` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Type` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Common_Info` longtext COLLATE utf8mb4_unicode_ci,
  `Result` longtext COLLATE utf8mb4_unicode_ci,
  `Escort` longtext COLLATE utf8mb4_unicode_ci,
  `For_Parents` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courses` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Name` tinytext COLLATE utf8mb4_unicode_ci,
  `Descr` mediumtext COLLATE utf8mb4_unicode_ci,
  `LongDescr` longtext COLLATE utf8mb4_unicode_ci,
  `Teacher` smallint(6) NOT NULL,
  `Pic_URL` mediumtext COLLATE utf8mb4_unicode_ci,
  `Requirements` longtext COLLATE utf8mb4_unicode_ci,
  `Best_fit` longtext COLLATE utf8mb4_unicode_ci,
  `Skills` mediumtext COLLATE utf8mb4_unicode_ci,
  `Result` mediumtext COLLATE utf8mb4_unicode_ci,
  `Age_Min` int(11) DEFAULT NULL,
  `Age_Max` int(11) DEFAULT NULL,
  `Tags` tinytext COLLATE utf8mb4_unicode_ci,
  `Course_org` smallint(6) DEFAULT '1',
  `YouTube_hash` tinytext COLLATE utf8mb4_unicode_ci,
  `Cost` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `Teacher` (`Teacher`),
  CONSTRAINT `Courses_ibfk_1` FOREIGN KEY (`Teacher`) REFERENCES `Teachers` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` mediumtext COLLATE utf8mb4_unicode_ci,
  `Text` longtext COLLATE utf8mb4_unicode_ci,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `priority` smallint(6) DEFAULT NULL,
  `visibility` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Teachers`
--

DROP TABLE IF EXISTS `Teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teachers` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `About` mediumtext COLLATE utf8mb4_unicode_ci,
  `Photo_URL` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-30 20:02:30
