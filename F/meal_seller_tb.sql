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
-- Table structure for table `seller_tb`
--

DROP TABLE IF EXISTS `seller_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_tb` (
  `s_id` varchar(100) NOT NULL,
  `s_pw` varchar(100) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_hp1` varchar(100) NOT NULL,
  `s_hp2` varchar(100) DEFAULT NULL,
  `s_email1` varchar(100) NOT NULL,
  `s_email2` varchar(100) NOT NULL,
  `s_BL_Num` varchar(100) NOT NULL,
  `s_GR_Num` varchar(100) DEFAULT 'NULL',
  `s_HACCP_Num` varchar(100) DEFAULT NULL,
  `s_Waddr1` varchar(100) NOT NULL,
  `s_Waddr2` varchar(100) NOT NULL,
  `s_Waddr3` varchar(100) NOT NULL,
  `s_Wname` varchar(100) NOT NULL,
  `creDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `s_del` varchar(3) DEFAULT 'N',
  `delDate` datetime DEFAULT NULL,
  `s_cate` varchar(100) DEFAULT NULL,
  `s_lastLog` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_tb`
--

LOCK TABLES `seller_tb` WRITE;
/*!40000 ALTER TABLE `seller_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller_tb` ENABLE KEYS */;
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
