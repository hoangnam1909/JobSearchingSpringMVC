CREATE DATABASE  IF NOT EXISTS `jobsearchingdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jobsearchingdb`;
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
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `years_experience` int DEFAULT NULL,
  `strengths` longtext COLLATE utf8mb4_unicode_520_ci,
  `weaknesses` longtext COLLATE utf8mb4_unicode_520_ci,
  `majoring` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `language_certificate` longtext COLLATE utf8mb4_unicode_520_ci,
  `informatics_certificate` longtext COLLATE utf8mb4_unicode_520_ci,
  `cv` varchar(300) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_candidate_idx` (`user_id`),
  CONSTRAINT `fk_user_candidate` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (1,7,'Ngu','Ngáo','Công nghệ thông tin','TOEIC 750','lmao',NULL,32),(6,10,'ngáo','ngu','Công nghệ thông tin','TOEIC 750','',NULL,41),(7,10,'ngáo + ngu','','Ngôn ngữ Anh','','',NULL,42),(8,100,'','già','','','',NULL,43),(10,NULL,'hài hước bro','ngu','','','',NULL,45),(12,18,'ngu','ko thông minh','Ăn chơi nhảy múa','','','',47),(13,46,'test update redirect to add','','','','',NULL,46),(14,12,'','','','','','https://res.cloudinary.com/dxorabap0/image/upload/v1651720441/bcbmad4jcuxgrarmsbmp.jpg',48),(15,19,'ngu','ko thông minh','','','','',52),(16,NULL,'','','','','','',57),(17,NULL,'','','','','','',60),(18,8,'Ngu','Khôn','Dược phẩm','IELTS 8.5','Không có','https://res.cloudinary.com/dxorabap0/image/upload/v1651817887/faldsrp4ofhonfeiygkn.jpg',63);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `majoring` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_company_idx` (`user_id`),
  CONSTRAINT `fk_user_company` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (10,'Microsoft','Microsoft là một tập đoàn đa quốc gia của Hoa Kỳ','Redmond, Washington, Hoa Kỳ','support.microsoft.com/contactus','www.microsoft.com','software operating system',51),(14,'Công ty cổ phần Hạ tầng Viễn thông CMC Telecom','CMC Telecom là một trong 8 công ty thành viên của Tập đoàn Công nghệ CMC. Với gần 9 năm xây dựng, phát triển, CMC Telecom là công ty hạ tầng viễn thông nằm trong TOP 4 các công ty viễn thông hàng đầu Việt Nam. CMC Telecom là nhà cung cấp đầu tiên áp dụng công nghệ GPON và sở hữu hạ tầng truyền dẫn 100% cáp quang.','Tầng 11 tòa nhà CMC, Đường Duy Tân, Q. Cầu Giấy, TP. Hà Nội','Tầng 11 tòa nhà CMC, Đường Duy Tân, Q. Cầu Giấy, TP. Hà Nội','https://cmctelecom.vn/','telecom',34),(15,'Công ty TNHH Phương Nam Vina','Công ty Phương Nam Vina là doanh nghiệp uy tín với hơn 10 năm kinh nghiệm hoạt động trong lĩnh vực phần mềm website, thiết kế đồ họa, quảng cáo trực tuyến, thương mại điện tử. Đến với công ty chúng tôi, bạn sẽ được làm việc trong môi trường chuyên nghiệp, năng động, công việc ổn định, thu nhập cao và có cơ hội thăng tiến.','190 Bạch Đằng, Phường 24, Quận Bình Thạnh, TPHCM','190 Bạch Đằng, Phường 24, Quận Bình Thạnh, TPHCM','https://phuongnamvina.com','cntt it',49),(16,'GrabDelivery','Grab là một công ty công nghệ có trụ sở tại Singapore cung cấp các dịch vụ vận chuyển và đi lại bằng xe hơi tại Singapore và các quốc gia Đông Nam Á khác như Malaysia, Indonesia, Philippines, Việt Nam, Thái Lan, Myanmar và Campuchia. Wikipedia','Tòa nhà Mapletree Business Center, Số 1060 Đại lộ Nguyễn Văn Linh, Phường Tân Phong, Quận 7, Thành phố Hồ Chí Minh, Việt Nam','https://www.grab.com/vn/','https://www.grab.com/vn/','GrabTaxi; GrabCar; GrabBike; GrabHitch; Grab Food; GrabExpress; GrabPay;',16),(21,'Samsung Việt Nam','Samsung đi theo triết lý kinh doanh đơn giản: cống hiến tài năng và công nghệ của mình để tạo ra các sản phẩm và dịch vụ vượt trội đóng góp cho một xã hội toàn cầu tốt đẹp hơn. Để đạt được điều này, Samsung hết sức coi trọng con người và công nghệ của mình.','Số 2, đường Hải Triều, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh','+84-2839157310','https://www.samsung.com/vn/','phone tablet laptop cntt it',62);
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_post`
--

DROP TABLE IF EXISTS `job_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `beginningSalary` decimal(10,0) NOT NULL,
  `endingSalary` decimal(10,0) NOT NULL,
  `location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  `posted_by_user` int NOT NULL,
  `job_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jpost_user_idx` (`posted_by_user`),
  KEY `fk_jpost_jtype_idx` (`job_type_id`),
  CONSTRAINT `fk_jpost_jtype` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jpost_user` FOREIGN KEY (`posted_by_user`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_post`
--

LOCK TABLES `job_post` WRITE;
/*!40000 ALTER TABLE `job_post` DISABLE KEYS */;
INSERT INTO `job_post` VALUES (25,'Pháp chế cho công ty luật','làm việc ko nghỉ',15000000,30000000,'Hà Nội','2022-05-05 00:00:00','2022-05-19 00:00:00',16,3),(30,'nhatuyendungtest','nhatuyendungtest',123,1234,'nhatuyendungtest','2022-05-06 00:00:00','2022-05-27 00:00:00',51,13),(31,'sao ntn','sao ntn',123,1234,'sao ntn','2022-05-06 00:00:00','2022-05-31 00:00:00',51,15),(33,'nhatuyendung post','nhatuyendung post',12345,123456,'nhatuyendung post','2022-05-06 00:00:00',NULL,62,9),(34,'Bán hàng tại hiệu thuốc','8h/ngày',5000000,8000000,'Phú Nhuận, HCM','2022-05-06 00:00:00',NULL,49,9);
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
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_type`
--

LOCK TABLES `job_type` WRITE;
/*!40000 ALTER TABLE `job_type` DISABLE KEYS */;
INSERT INTO `job_type` VALUES (1,'IT - Phần mềm'),(2,'Kế toán - Kiểm toán'),(3,'Luật'),(4,'Bảo hiểm'),(8,'Bất động sản'),(9,'Dược phẩm - Y tế - Công nghệ sinh học'),(10,'Internet - Online'),(11,'Marketing - Truyền thông - Quảng cáo'),(12,'Nhà hàng - Khách sạn'),(13,'In ấn - Xuất bản'),(14,'Bán lẻ - Hàng tiêu dùng'),(15,'Sản xuất'),(16,'Chứng khoán'),(17,'Xây dựng'),(18,'Logistics');
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
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Thanh Thuỳ','$2a$10$nvWvGaxa8BRy6IGWAkPmeuDkLZIkp/fivpHRMB9pbkkOK9GAEh42G',NULL,'ROLE_UV',0,NULL,'Thanh Thuỳ','Thanh Thuỳ',NULL,0,NULL),(3,'Hoàng Nam','$2a$10$BFk/pDHLL07taPcNuUqu8uzVsiuV1aokToQo/.labW/XELakrngKq',NULL,'ROLE_UV',0,NULL,'nam@gmail.com','0314534534',NULL,0,NULL),(4,'admin','$2a$10$yobGID0c.PI/lVnHglCncey0TsjKUa/WMiUhImftHQCsPCEjCfGeC','','ROLE_ADMIN',0,NULL,'admin@gmail.com','014324325',NULL,0,NULL),(5,'qmin1012','$2a$10$KFxH3fIeo0vH43c57G7RT.J9CfdT.oReeHx56vYQahTEQqLE6apSe',NULL,'ROLE_UV',0,NULL,'qmin1012@gmail.com','1012',NULL,0,NULL),(9,'user1','$2a$10$PoUjWZspQc/v6i3pyQjnPOQ7FNjYeHVaMSh4zvjA5wrXA5c9EeTlO',NULL,'ROLE_UV',0,NULL,'user1','user1','2020-05-30',0,NULL),(13,'date','$2a$10$lQgI9vT7i7OTpg0vRKghD.shVCQZwIHhGMfUYuMQvr.PCr7kf2LrS',NULL,'ROLE_UV',1,'date','date','date','2002-11-30',0,''),(16,'tle115','$2a$10$k3w6Q.X4xt/Xqvn930rxreUSvV5wwhDK8pZVpZ9f4RgWJxymvqJqy','https://res.cloudinary.com/dxorabap0/image/upload/v1651080613/nyg63eb0hgml3dxzmfgc.jpg','ROLE_NTD',1,'Lê Thị Thanh Thuỳ','lethuy01091997@gmail.com','0123456789','2000-05-11',1,'Bắc Kạn'),(17,'usertest9succAva','$2a$10$/PL28CaBcCo0ZEKatFx.X.l4ToKVlH6wWHP/EKl3PP3HXHy5B/4Fa',NULL,'ROLE_UV',1,'usertest9','usertest9','usertest9','2001-10-17',0,'HCM'),(19,'testfilepicker','$2a$10$arZn3WwASMPuCoD3ODh58.2kO1NcymbBedp2Ig6m8INcJvi76oT/G','https://res.cloudinary.com/dxorabap0/image/upload/v1651133332/utoiwv8cxue63w0ag3vt.webp','ROLE_ADMIN',1,'testfilepicker','testfilepicker','testfilepicker','2001-08-17',1,'Ea Súp'),(32,'ungvien1','$2a$10$16G2pK4Aq3BNFZMgfdfOAuXnPP6GoqSq6QENs/obTydBhj7/9BAv.','https://res.cloudinary.com/dxorabap0/image/upload/v1651647840/sabfg0rm32rm2voxgigm.jpg','ROLE_UV',1,'Ứng Viên 1','ungvien1@gmail.com','0123463573','1999-06-17',0,'Đà Nẵng'),(33,'ungvien2','$2a$10$PgY5PGTpSXtAKiwi.3mEn.CyISWPMhoHOYvLqprN/zaQgEeAuvMv2','https://res.cloudinary.com/dxorabap0/image/upload/v1651647876/k6per2vpnokzszvrdn7u.jpg','ROLE_UV',1,'Ứng Viên 2','ungvien2@gmail.com','086748375','2003-08-05',1,'Vũng Tàu'),(34,'nhatuyendung1','$2a$10$4f4pIi3uPFerqJxTXXGGSOCKl47cKYeuleLzsT73HRoVmTF2eYAjW','https://res.cloudinary.com/dxorabap0/image/upload/v1651651727/bvrnqaydrvw7vjdduxxa.jpg','ROLE_NTD',1,'Nhà Tuyển Dụng 1','nhatuyendung1@gmail.com','0543753475','1995-08-06',0,'Hưng Yên'),(41,'ungvientest1','$2a$10$53W/I2w6jEcmXijXRh.FhO29Hpz1ainG.Y9e7yKwV0uOz.0FsXe/y','https://res.cloudinary.com/dxorabap0/image/upload/v1651682182/vz1smubi4kvint0qznn2.jpg','ROLE_UV',1,'Ungvientest1','ungvientest1@gmail.com','053536546','2005-05-09',0,'ungvientest1'),(42,'ungvientest2','$2a$10$TWt2D3GovLXXvmmCNXfPZe2yip/B/cyrx.0ruKPs0/YrzqLCPtISe','https://res.cloudinary.com/dxorabap0/image/upload/v1651682408/tiyhyvj8ibp8z8gm0bxu.jpg','ROLE_UV',1,'Ungvientest2','ungvientest2@gmil.com','042352541','2002-08-19',0,'ungvientest2'),(43,'ungvientest3','$2a$10$lkN8q1upSPznhDM6d7n2WuG/kkTQksnXa61hoMgyodiB6dzPE2Z7q','https://res.cloudinary.com/dxorabap0/image/upload/v1651682671/t7uiktmeolsvy8o0iutj.jpg','ROLE_UV',1,'Ungvientest3','ungvientest3@gmail.com','0534587346','2000-03-04',1,'ungvientest3'),(45,'ungvientest4','$2a$10$lV/Qkf3e455XMeOavIlfR.B5ygX1s6vDZ6PdCcDjF3WWHrvbuV72S','https://res.cloudinary.com/dxorabap0/image/upload/v1651684357/jtf3cm9urse044selfrm.jpg','ROLE_UV',1,'Ungvientest4','ungvientest4@gmail.com','0583457834','2004-08-06',0,'ungvientest4'),(46,'ungvientest5','$2a$10$LzOPkaHFX73wbYwPga8J0uu58R/f0XUOdJHjELZ44TXbwDXEnCeRe','https://res.cloudinary.com/dxorabap0/image/upload/v1651684725/d51vstyy0mneok1kmd5b.jpg','ROLE_UV',1,'Ungvientest5','ungvientest5@gmail.com','0534543','2004-05-06',0,'ungvientest5'),(47,'ungvientest6','$2a$10$szCkJUO37e688rL0Sx1Ife9T.5PzDrVZ3M/JQ9Sz/DpGBA1q52M9q','https://res.cloudinary.com/dxorabap0/image/upload/v1651684859/ftkbetrrlbm7xpmefowu.jpg','ROLE_UV',1,'Ungvientest6','ungvientest6@gmail.com','0435374','2004-06-08',1,'ungvientest6'),(48,'ungvien3','$2a$10$Y2uDXiQOHZ.npmobtI4hb.bR3OMoNOfEEwamTZlfQ/iOIDsXqQQh6','https://res.cloudinary.com/dxorabap0/image/upload/v1651719597/vvzpzlyo2tb9axbxgxli.jpg','ROLE_UV',1,'Nguyễn Hoàng Nam','ungvien@gmail.com','053976549','2001-09-19',0,'Bình Thạnh, Tp. Hồ Chí Minh'),(49,'nhatuyendung2','$2a$10$sQkuLTZsjHGNYeIU3Mp4SuaYysp0vGMO.rIdnJFHkbvT3LWfZi31e','https://res.cloudinary.com/dxorabap0/image/upload/v1651764394/hj8x048uysqlhrwjo7yl.webp','ROLE_NTD',1,'Nhatuyendung2','nhatuyendung2@gmail.com','075438534','1998-05-07',1,'nhatuyendung2'),(51,'nhatuyendungtest','$2a$10$6.hdJmJR5YtbGYPnzgH1ru8ihI2LDPTLBg/d8M3J02LllMrCE4Aqy','https://res.cloudinary.com/dxorabap0/image/upload/v1651770568/nyjz1zlh2pkqdub7lgap.jpg','ROLE_NTD',1,'Nhatuyendungtest','nhatuyendungtest@gmail.com','053874543','1995-09-08',0,'nhatuyendungtest'),(52,'ungviencapnhat','$2a$10$Bbtnk/PlkaQmWux0ctppde29ciZ3EHwjBCCgZX5BtitMXzFyq2c5q','https://res.cloudinary.com/dxorabap0/image/upload/v1651773071/zelvv30vv4zigurrufxk.jpg','ROLE_UV',1,'Ungviencapnhat','ungviencapnhat@gmail.com','0435345435','2004-09-07',0,'ungviencapnhat'),(53,'uvdangky','$2a$10$74VhSy1Xcl9QQlHs.OkK2eFQeASAE8vufkMu.I/diechhupELUb5i','https://res.cloudinary.com/dxorabap0/image/upload/v1651773972/a5atj0e2dpdoja2mut7i.jpg','ROLE_UV',1,'Uvdangky','uvdangky@gmail.com','034534895','2004-05-12',1,'uvdangky'),(55,'ungvientestreg','$2a$10$h8qcEWS9pVqh6tFh1/belOWVQYLUN0bQeoGT/G4QGQWW2XNXA9jc.','https://res.cloudinary.com/dxorabap0/image/upload/v1651810657/iv3cq7vehyhgxwktxpvk.jpg','ROLE_UV',1,'Ungvientestreg','ungvientestreg@gmail.com','05348737','2004-05-07',1,'ungvientestreg'),(56,'ungvientestreg1','$2a$10$Nt3GT8iF5obHh954i.JlN.XtK9bkXhlBVgDGTUBp4L.qglsCuhwWm','https://res.cloudinary.com/dxorabap0/image/upload/v1651810836/ywqxgj4eeuoobl54ai1y.jpg','ROLE_UV',1,'Ungvientestreg','ungvientestreg1@gmail.com','0456783534','1978-03-05',0,'ungvientestreg1'),(57,'ungvienresss','$2a$10$71WpOu/N/8D8tdsgWep.CeLOCOSKJi5ZLIgtq/D7eF6d/zJqkKkhW','https://res.cloudinary.com/dxorabap0/image/upload/v1651814778/uvn41eskld6pu5r3r7ic.jpg','ROLE_UV',1,'Ungvienresss','ungvienresss@gmail.com','0543785654','2004-07-08',0,'ungvienresss'),(58,'ungvienres11','$2a$10$lWazcyjrAM0Y9D.M8DJx8uHTgsaUjZRB4c5nlAksIy2ZluNbXrdnW','https://res.cloudinary.com/dxorabap0/image/upload/v1651815216/hl5892sq72jvlninivlg.jpg','ROLE_UV',1,'Ungvienres11','ungvienres11@gmail.com','05835834','2000-05-11',0,'ungvienres11'),(59,'testungvienres11a','$2a$10$okmH6zsIFAvCpJM1ENnRIOWVaPJOfyIYmxTYquG5CEAvPDrDtQtsG','https://res.cloudinary.com/dxorabap0/image/upload/v1651815339/syjylrfpx544bjvfltsa.jpg','ROLE_UV',1,'Testungvienres11a','testungvienres11a@gmail.com','057938457','2001-05-07',0,'testungvienres11a'),(60,'test1xiu','$2a$10$WZ1O4DQnps9mZFNVlLwrxudFEytuDaI7m5Ox20RQHoIj/nV4TKsGy','https://res.cloudinary.com/dxorabap0/image/upload/v1651815645/gplxl4otworkicyczsgk.jpg','ROLE_UV',1,'Test1xiu','test1xiu@gmail.com','0654645442','1986-10-01',0,'test1xiu'),(62,'nhatuyendung','$2a$10$l0linObTue5vfrrLeH0H.eEn2hb9759WGZmQpAXllVAiVpyF8.kyi','https://res.cloudinary.com/dxorabap0/image/upload/v1651817741/lbjsyjvvlnoosyqfqouv.jpg','ROLE_NTD',1,'Nhatuyendung','nhatuyendung@gmail.com','057834785','2005-07-08',0,'nhatuyendung'),(63,'ungvien11','$2a$10$2kDLVu9ES9o6wJhqq/CcsuGGRDOXqs6pvMGXp0DKdsERsJ9scW52K','https://res.cloudinary.com/dxorabap0/image/upload/v1651817853/jhbkgthrzsstknrkqhgv.jpg','ROLE_UV',1,'Ungvien11','ungvien11@gmail.com','05347867','1986-06-18',1,'ungvien11');
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

-- Dump completed on 2022-05-06 16:28:22
