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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Siêu công ty','công ty pro víp','Hà Nội','không kó','hihi.com'),(5,'Pasal','Tổ chức giáo dục Pasal là nơi hội tụ của những người trẻ chứa đựng khát khao thay đổi tiếng Anh và tư duy của thế hệ trẻ Việt Nam để thành công trên con đường sự nghiệp đầy năng động và thách thức sau này. Họ đã tìm ra “Đam mê” đích thực của mình với sự nghiệp đào tạo tiếng Anh và sẻ chia giá trị cho các bạn Sinh viên Việt Nam với khát vọng to lớn về tương lai của đất nước và hình ảnh con người Việt Nam khắp bốn bể năm châu.','Head Office Số 2, Ngõ 54 Phỗ Vũ Trọng Phụng, Thanh Xuân, Hà Nội.','http://pasal.edu.vn','http://pasal.edu.vn'),(8,'FPT Sofware','Công ty công nghệ','Khu công nghệ cao, TP. Thủ Đức, TP. Hồ Chí Minh','recruitment@fsoft.com.vn','www.fpt-software.com'),(9,'Google','Google LLC là một công ty công nghệ đa quốc gia của Mỹ','Mountain View, California, Hoa Kỳ','1600 Amphitheatre Parkway Mountain View, CA 94043, USA (650) 253-0000','www.google.com.vn'),(10,'Microsoft','Microsoft là một tập đoàn đa quốc gia của Hoa Kỳ','Redmond, Washington, Hoa Kỳ','support.microsoft.com/contactus','www.microsoft.com'),(14,'Công ty cổ phần Hạ tầng Viễn thông CMC Telecom','CMC Telecom là một trong 8 công ty thành viên của Tập đoàn Công nghệ CMC. Với gần 9 năm xây dựng, phát triển, CMC Telecom là công ty hạ tầng viễn thông nằm trong TOP 4 các công ty viễn thông hàng đầu Việt Nam. CMC Telecom là nhà cung cấp đầu tiên áp dụng công nghệ GPON và sở hữu hạ tầng truyền dẫn 100% cáp quang.','Tầng 11 tòa nhà CMC, Đường Duy Tân, Q. Cầu Giấy, TP. Hà Nội','Tầng 11 tòa nhà CMC, Đường Duy Tân, Q. Cầu Giấy, TP. Hà Nội','https://cmctelecom.vn/'),(15,'Công ty TNHH Phương Nam Vina','Công ty Phương Nam Vina là doanh nghiệp uy tín với hơn 10 năm kinh nghiệm hoạt động trong lĩnh vực phần mềm website, thiết kế đồ họa, quảng cáo trực tuyến, thương mại điện tử. Đến với công ty chúng tôi, bạn sẽ được làm việc trong môi trường chuyên nghiệp, năng động, công việc ổn định, thu nhập cao và có cơ hội thăng tiến.','190 Bạch Đằng, Phường 24, Quận Bình Thạnh, TPHCM','190 Bạch Đằng, Phường 24, Quận Bình Thạnh, TPHCM','https://phuongnamvina.com');
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
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `beginningSalary` decimal(10,0) NOT NULL,
  `endingSalary` decimal(10,0) NOT NULL,
  `location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  `posted_by_user` int NOT NULL,
  `job_type_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jpost_user_idx` (`posted_by_user`),
  KEY `fk_jpost_jtype_idx` (`job_type_id`),
  KEY `fk_jpost_com_idx` (`company_id`),
  CONSTRAINT `fk_jpost_com` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jpost_jtype` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jpost_user` FOREIGN KEY (`posted_by_user`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_post`
--

LOCK TABLES `job_post` WRITE;
/*!40000 ALTER TABLE `job_post` DISABLE KEYS */;
INSERT INTO `job_post` VALUES (1,'Bán hàng online ha','Bán quần áo',1500000,5000000,'Hà Nội','2022-04-06 00:00:00','2022-04-07 00:00:00',4,4,1),(6,'lalala','lalala',31241234,43423423,'lalala','2022-04-23 00:00:00',NULL,2,2,5),(8,'gggggg','fghjhgjfgj',123123,312312312,'fghjhgjfgj','2022-04-23 00:00:00',NULL,2,1,1),(10,'test pagination','pagination',1500000,3000000,'HCM','2022-04-25 00:00:00',NULL,5,3,5),(12,'Nhân viên chăm sóc khách hàng online','- Hỗ trợ các bộ phận khác khi có yêu cầu\r\n\r\n- Chi tiết công việc được trao đổi cụ thể tại buổi phỏng vấn\r\n\r\n- Chăm sóc khách hàng, hỗ trợ giải đáp thắc mắc khách hàng\r\n\r\n- Thực hiện các công ngồi nhà nghe điện thoại xử lý các tình huống khách hàng gọi điện yêu cầu.',10000000,15000000,'Miền Nam','2022-04-28 00:00:00','2022-05-18 00:00:00',16,10,1),(13,'hihi12','hihi12',5345,2424234,'hihi12','2022-04-28 00:00:00',NULL,13,1,1),(14,'reset','reset',423423,4325345435,'reset','2022-04-28 00:00:00',NULL,13,4,1),(15,'reset1','reset1',323,4234324,'reset1','2022-04-28 00:00:00',NULL,4,1,1),(16,'igdiofg','igdiofg',43234,2342,'igdiofg','2022-04-28 00:00:00',NULL,4,4,5),(17,'Nhân Viên Hành Chính Tổng Hợp','- Chăm sóc khách hàng, hỗ trợ giải đáp thắc mắc khách hàng\r\n- Hỗ trợ các bộ phận khác khi có yêu cầu\r\n- Chi tiết công việc được trao đổi cụ thể tại buổi phỏng vấn\r\n- Nhập mã có sẵn vào phần mềm công ty.\r\n- Nhập dữ liệu chính xác, phân biệt rõ chữ hoa và chữ thường\r\n- Có thể làm full time hoặc chọn làm part time\r\n- Thời gian thử việc 1 tháng',10000000,20000000,'Toàn quốc','2022-04-28 00:00:00','2022-05-15 00:00:00',16,10,8),(18,'hehehehe','hahaahah',1500000,432543645,'','2022-04-28 00:00:00',NULL,19,1,1),(19,'tieude','mota',123,1234,'','2022-04-28 00:00:00',NULL,19,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Thanh Thuỳ','$2a$10$nvWvGaxa8BRy6IGWAkPmeuDkLZIkp/fivpHRMB9pbkkOK9GAEh42G',NULL,'ROLE_USER',0,NULL,'Thanh Thuỳ','Thanh Thuỳ',NULL,0,NULL),(3,'Hoàng Nam','$2a$10$BFk/pDHLL07taPcNuUqu8uzVsiuV1aokToQo/.labW/XELakrngKq',NULL,'ROLE_USER',0,NULL,'nam@gmail.com','0314534534',NULL,0,NULL),(4,'admin','$2a$10$yobGID0c.PI/lVnHglCncey0TsjKUa/WMiUhImftHQCsPCEjCfGeC','','ROLE_ADMIN',0,NULL,'admin@gmail.com','014324325',NULL,0,NULL),(5,'qmin1012','$2a$10$KFxH3fIeo0vH43c57G7RT.J9CfdT.oReeHx56vYQahTEQqLE6apSe',NULL,'ROLE_USER',0,NULL,'qmin1012@gmail.com','1012',NULL,0,NULL),(9,'user1','$2a$10$PoUjWZspQc/v6i3pyQjnPOQ7FNjYeHVaMSh4zvjA5wrXA5c9EeTlO',NULL,'ROLE_USER',0,NULL,'user1','user1','2020-05-30',0,NULL),(13,'date','$2a$10$lQgI9vT7i7OTpg0vRKghD.shVCQZwIHhGMfUYuMQvr.PCr7kf2LrS',NULL,'ROLE_USER',0,'date','date','date','0002-11-30',0,''),(16,'tle115','$2a$10$k3w6Q.X4xt/Xqvn930rxreUSvV5wwhDK8pZVpZ9f4RgWJxymvqJqy','https://res.cloudinary.com/dxorabap0/image/upload/v1651080613/nyg63eb0hgml3dxzmfgc.jpg','ROLE_NTD',1,'Lê Thị Thanh Thuỳ','lethuy01091997@gmail.com','0123456789','2000-05-11',1,'Bắc Kạn'),(17,'usertest9succAva','$2a$10$/PL28CaBcCo0ZEKatFx.X.l4ToKVlH6wWHP/EKl3PP3HXHy5B/4Fa',NULL,'ROLE_USER',1,'usertest9','usertest9','usertest9','2001-10-17',0,'HCM'),(19,'testfilepicker','$2a$10$arZn3WwASMPuCoD3ODh58.2kO1NcymbBedp2Ig6m8INcJvi76oT/G','https://res.cloudinary.com/dxorabap0/image/upload/v1651133332/utoiwv8cxue63w0ag3vt.webp','ROLE_ADMIN',1,'testfilepicker','testfilepicker','testfilepicker','2001-08-17',1,'Ea Súp'),(32,'ungvien1','$2a$10$16G2pK4Aq3BNFZMgfdfOAuXnPP6GoqSq6QENs/obTydBhj7/9BAv.','https://res.cloudinary.com/dxorabap0/image/upload/v1651647840/sabfg0rm32rm2voxgigm.jpg','ROLE_USER',1,'Ứng Viên 1','ungvien1@gmail.com','0123463573','1999-06-17',0,'Đà Nẵng'),(33,'ungvien2','$2a$10$PgY5PGTpSXtAKiwi.3mEn.CyISWPMhoHOYvLqprN/zaQgEeAuvMv2','https://res.cloudinary.com/dxorabap0/image/upload/v1651647876/k6per2vpnokzszvrdn7u.jpg','ROLE_USER',1,'Ứng Viên 2','ungvien2@gmail.com','086748375','2003-08-05',1,'Vũng Tàu'),(34,'nhatuyendung1','$2a$10$4f4pIi3uPFerqJxTXXGGSOCKl47cKYeuleLzsT73HRoVmTF2eYAjW','https://res.cloudinary.com/dxorabap0/image/upload/v1651651727/bvrnqaydrvw7vjdduxxa.jpg','ROLE_NTD',1,'Nhà Tuyển Dụng 1','nhatuyendung1@gmail.com','0543753475','1995-08-06',0,'Hưng Yên');
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

-- Dump completed on 2022-05-04 21:22:37
