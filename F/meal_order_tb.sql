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
-- Table structure for table `order_tb`
--

DROP TABLE IF EXISTS `order_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tb` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(100) DEFAULT NULL,
  `g_name` varchar(100) DEFAULT NULL,
  `ig_id` varchar(100) DEFAULT NULL,
  `o_goods_qty` int DEFAULT NULL,
  `o_goods_price` int DEFAULT NULL,
  `receiver_name` varchar(100) DEFAULT NULL,
  `receiver_hp` varchar(100) NOT NULL,
  `receiver_addr1` varchar(100) NOT NULL,
  `receiver_addr2` varchar(100) NOT NULL,
  `receiver_addr3` varchar(100) NOT NULL,
  `deliver_method` varchar(100) DEFAULT NULL,
  `deliver_message` varchar(200) DEFAULT NULL,
  `delivery_state` varchar(100) DEFAULT '결제완료',
  `pay_method` varchar(100) DEFAULT NULL,
  `card_com_name` varchar(100) DEFAULT NULL,
  `card_pay_month` varchar(100) DEFAULT NULL,
  `good_cancel` varchar(100) DEFAULT 'N',
  `pay_order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `g_id` int DEFAULT NULL,
  `u_id` varchar(100) DEFAULT NULL,
  `s_id` varchar(100) DEFAULT NULL,
  `n_id` int DEFAULT NULL,
  `o_useMile` int DEFAULT NULL,
  `parentNo` int DEFAULT NULL,
  `o_goods_saleprice` int DEFAULT '0',
  `d_price` int DEFAULT '0',
  PRIMARY KEY (`o_id`),
  KEY `s_id` (`s_id`),
  KEY `u_id` (`u_id`),
  KEY `g_id` (`g_id`),
  KEY `n_id` (`n_id`),
  CONSTRAINT `order_tb_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `seller_tb` (`s_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_tb_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user_tb` (`u_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_tb_ibfk_3` FOREIGN KEY (`g_id`) REFERENCES `goods_tb` (`g_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_tb_ibfk_4` FOREIGN KEY (`n_id`) REFERENCES `non_tb` (`n_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tb`
--

LOCK TABLES `order_tb` WRITE;
/*!40000 ALTER TABLE `order_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_tb` ENABLE KEYS */;
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
