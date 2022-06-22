-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: meal
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `board_1`
--

DROP TABLE IF EXISTS `board_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_1` (
  `b_1_id` int NOT NULL AUTO_INCREMENT,
  `reg_id` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `creDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `parentNo` int DEFAULT NULL,
  `u_id` varchar(100) DEFAULT NULL,
  `s_id` varchar(100) DEFAULT NULL,
  `a_id` varchar(100) DEFAULT NULL,
  `secret` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`b_1_id`),
  KEY `u_id` (`u_id`),
  KEY `s_id` (`s_id`),
  KEY `a_id` (`a_id`),
  CONSTRAINT `board_1_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user_tb` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `board_1_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `seller_tb` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `board_1_ibfk_3` FOREIGN KEY (`a_id`) REFERENCES `admin_tb` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_1`
--

LOCK TABLES `board_1` WRITE;
/*!40000 ALTER TABLE `board_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22 13:52:12
