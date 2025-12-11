CREATE DATABASE  IF NOT EXISTS `adega` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adega`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: adega
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `garrafa`
--

DROP TABLE IF EXISTS `garrafa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garrafa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `safra` int NOT NULL,
  `preco_compra` decimal(10,2) NOT NULL,
  `data_aquisicao` date NOT NULL,
  `consumida` tinyint(1) DEFAULT '0',
  `data_consumo` date DEFAULT NULL,
  `avaliacao` int DEFAULT NULL,
  `id_vinho` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_vinho` (`id_vinho`),
  CONSTRAINT `garrafa_ibfk_1` FOREIGN KEY (`id_vinho`) REFERENCES `vinho` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garrafa`
--

LOCK TABLES `garrafa` WRITE;
/*!40000 ALTER TABLE `garrafa` DISABLE KEYS */;
INSERT INTO `garrafa` VALUES (1,2021,800.00,'2025-03-08',0,NULL,NULL,NULL,'2025-12-06 20:52:55','2025-12-06 20:52:55'),(2,2021,800.00,'2025-03-08',0,NULL,NULL,NULL,'2025-12-06 20:53:20','2025-12-06 20:53:20'),(3,2021,800.00,'2025-03-08',0,NULL,NULL,NULL,'2025-12-06 20:53:21','2025-12-06 20:53:21'),(4,2022,180.00,'2025-03-30',0,NULL,NULL,NULL,'2025-12-06 20:54:07','2025-12-06 20:54:07'),(5,2022,180.00,'2025-03-30',0,NULL,NULL,NULL,'2025-12-06 20:54:08','2025-12-06 20:54:08'),(6,2022,180.00,'2025-03-30',0,'2025-12-07',8,NULL,'2025-12-06 21:09:17','2025-12-07 01:02:25'),(7,2021,1200.00,'2025-03-08',0,NULL,NULL,1,'2025-12-06 21:10:37','2025-12-06 21:10:37'),(8,2021,1200.00,'2025-03-08',0,NULL,NULL,1,'2025-12-06 21:10:46','2025-12-06 21:10:46'),(11,2021,800.00,'2025-03-08',0,NULL,NULL,4,'2025-12-06 21:14:21','2025-12-06 21:14:21'),(12,2021,910.40,'2025-03-08',0,NULL,NULL,4,'2025-12-06 21:14:47','2025-12-06 21:14:47'),(13,2021,910.40,'2025-03-08',0,NULL,NULL,1,'2025-12-07 00:55:44','2025-12-07 00:55:44'),(14,2021,910.40,'2025-03-08',0,NULL,NULL,NULL,'2025-12-07 00:55:58','2025-12-07 00:55:58'),(17,2022,180.00,'2025-03-30',1,'2025-12-07',8,NULL,'2025-12-07 01:03:15','2025-12-07 01:05:23'),(18,2023,2200.00,'2025-03-30',1,'2025-12-31',100,NULL,'2025-12-07 15:43:52','2025-12-07 15:50:31');
/*!40000 ALTER TABLE `garrafa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `senha` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Cristo','cristo@teste.pt','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','2025-12-05 01:43:17','2025-12-05 01:43:17'),(2,'Cristo','cristo@teste.com','289160db0d9f39f9ae1754c4ec9c16f90b50e32e09c5fb5481ae642b3d3d1a36','2025-12-10 00:09:00','2025-12-10 00:09:00'),(3,'Cristo','cristo2@teste.com','289160db0d9f39f9ae1754c4ec9c16f90b50e32e09c5fb5481ae642b3d3d1a36','2025-12-10 18:14:36','2025-12-10 18:14:36');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vinho`
--

DROP TABLE IF EXISTS `vinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vinho` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `produtor` varchar(50) NOT NULL,
  `pais_origem` varchar(25) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `uva_casta` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinho`
--

LOCK TABLES `vinho` WRITE;
/*!40000 ALTER TABLE `vinho` DISABLE KEYS */;
INSERT INTO `vinho` VALUES (1,'Vik','Viña Vik','Chile','Tinto','Blend','2025-12-06 19:52:31','2025-12-06 19:52:31'),(4,'Alpha M','Viña Montes','Chile','Tinto','Cabernet Sauvignon','2025-12-06 20:31:50','2025-12-06 20:33:35'),(5,'Viu 1','Viña Viu Manent','Chile','Tinto','Cabernet Sauvignon','2025-12-06 20:35:22','2025-12-06 20:35:22'),(8,'Pêra Manca','Cartuxa','Portugal','Tinto','Blend (Aragonez e Trincadeira)','2025-12-10 18:38:23','2025-12-10 18:38:23');
/*!40000 ALTER TABLE `vinho` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-10 22:00:43
