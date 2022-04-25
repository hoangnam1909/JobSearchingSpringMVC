-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: jobsearchingdb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_520_ci,
  `location` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `contact` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `website` varchar(65) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Siêu công ty','công ty pro víp','Hà Nội','không kó','hihi.com'),(5,'Thuỳ Lê iu dấu','em yêu của anh Nam','Bắc Kạn','em bé','em béeee'),(6,'Hoàng Nam Co','Công ty huhu','khóc hmuu hmu','Có đâu','ko có web');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_post`
--

DROP TABLE IF EXISTS `job_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `beginningSalary` decimal(10,0) NOT NULL,
  `endingSalary` decimal(10,0) NOT NULL,
  `location` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  `posted_by_user` int NOT NULL,
  `job_type_id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jpost_user_idx` (`posted_by_user`),
  KEY `fk_jpost_jtype_idx` (`job_type_id`),
  KEY `fk_jpost_com_idx` (`company_id`),
  CONSTRAINT `fk_jpost_com` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_jpost_jtype` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`),
  CONSTRAINT `fk_jpost_user` FOREIGN KEY (`posted_by_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_post`
--

LOCK TABLES `job_post` WRITE;
/*!40000 ALTER TABLE `job_post` DISABLE KEYS */;
INSERT INTO `job_post` VALUES (1,'Bán hàng online ha','Bán quần áo',1500000,5000000,'Hà Nội','2022-04-06 00:00:00','2022-04-07 00:00:00',4,4,1),(2,'test ngay dang','ngay dang',1342342,123134,'HCM','2022-04-05 00:00:00','2022-04-06 00:00:00',2,1,6),(3,'hahaha','hahaha',3134,432432,'hahaha','2022-04-06 00:00:00',NULL,3,2,5),(5,'hehe','hehe',312312,4214,'3123123','2022-04-09 00:00:00',NULL,2,1,6),(6,'lalala','lalala',31241234,43423423,'lalala','2022-04-23 00:00:00',NULL,2,2,5),(7,'test add post','tets hihi',4234234,32423445,'HCM','2022-04-23 00:00:00',NULL,4,3,6),(8,'gggggg','fghjhgjfgj',123123,312312312,'fghjhgjfgj','2022-04-23 00:00:00',NULL,2,1,1),(10,'test pagination','pagination',1500000,3000000,'HCM','2022-04-25 00:00:00',NULL,5,3,5);
/*!40000 ALTER TABLE `job_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_type`
--

DROP TABLE IF EXISTS `job_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_type`
--

LOCK TABLES `job_type` WRITE;
/*!40000 ALTER TABLE `job_type` DISABLE KEYS */;
INSERT INTO `job_type` VALUES (1,'Công nghệ thông tin'),(2,'Phục vụ'),(3,'Thiết kế đồ hoạ'),(4,'Hoá trang');
/*!40000 ALTER TABLE `job_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(300) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `full_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Thanh Thuỳ','$2a$10$nvWvGaxa8BRy6IGWAkPmeuDkLZIkp/fivpHRMB9pbkkOK9GAEh42G',NULL,'ROLE_USER',0,NULL,'Thanh Thuỳ','Thanh Thuỳ',NULL,0,NULL),(3,'Hoàng Nam','$2a$10$BFk/pDHLL07taPcNuUqu8uzVsiuV1aokToQo/.labW/XELakrngKq',NULL,'ROLE_USER',0,NULL,'nam@gmail.com','0314534534',NULL,0,NULL),(4,'admin','$2a$10$fhPL0UnuYxlQRe5xudsxEeALyY7YUMRvgO2shA8ArRy5SduR6.9Zy',NULL,'ROLE_USER',0,NULL,'admin@gmail.com','014324325',NULL,0,NULL),(5,'qmin1012','$2a$10$KFxH3fIeo0vH43c57G7RT.J9CfdT.oReeHx56vYQahTEQqLE6apSe',NULL,'ROLE_USER',0,NULL,'qmin1012@gmail.com','1012',NULL,0,NULL),(8,'test page','$2a$10$vP93u3ZrPg3weQnvhdWo1.y/HxELhWxQGs4rrF7kLiiwOlEW.zMna',NULL,'ROLE_USER',0,NULL,'123','123',NULL,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 16:42:16
