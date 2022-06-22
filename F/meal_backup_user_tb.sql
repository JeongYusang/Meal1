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
-- Table structure for table `backup_user_tb`
--

DROP TABLE IF EXISTS `backup_user_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_user_tb` (
  `u_id` varchar(100) NOT NULL,
  `u_pw` varchar(100) NOT NULL,
  `u_name` varchar(100) NOT NULL,
  `u_hp1` varchar(100) NOT NULL,
  `u_hp2` varchar(100) DEFAULT NULL,
  `u_email1` varchar(100) NOT NULL,
  `u_email2` varchar(100) NOT NULL,
  `u_addr1` varchar(100) DEFAULT NULL,
  `u_addr2` varchar(100) DEFAULT NULL,
  `u_addr3` varchar(100) DEFAULT NULL,
  `u_sex` varchar(3) NOT NULL,
  `u_birth` timestamp NOT NULL,
  `u_creDate` datetime DEFAULT NULL,
  `u_mile` int DEFAULT '0',
  `u_del` varchar(3) DEFAULT 'Y',
  `u_rank` varchar(100) DEFAULT 'bronze',
  `u_count` int DEFAULT '0',
  `u_delDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_user_tb`
--

LOCK TABLES `backup_user_tb` WRITE;
/*!40000 ALTER TABLE `backup_user_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_user_tb` ENABLE KEYS */;
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
