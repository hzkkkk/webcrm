-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: webcrm
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `dictionarytype_info`
--

DROP TABLE IF EXISTS `dictionarytype_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dictionarytype_info` (
  `dataId` int(11) NOT NULL AUTO_INCREMENT,
  `dataTypeId` int(11) DEFAULT NULL,
  `dataInformationName` varchar(255) DEFAULT NULL,
  `dataEnable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dataId`),
  KEY `dataTypeId` (`dataTypeId`),
  CONSTRAINT `dataTypeId` FOREIGN KEY (`dataTypeId`) REFERENCES `dictionarytype` (`dataTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='字典类别信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionarytype_info`
--

LOCK TABLES `dictionarytype_info` WRITE;
/*!40000 ALTER TABLE `dictionarytype_info` DISABLE KEYS */;
INSERT INTO `dictionarytype_info` (`dataId`, `dataTypeId`, `dataInformationName`, `dataEnable`) VALUES (1,1,NULL,NULL),(2,1,NULL,NULL),(3,1,NULL,NULL),(4,1,'服务业',NULL),(5,1,'制造业',NULL),(6,1,NULL,NULL),(7,1,NULL,NULL),(8,1,NULL,NULL),(9,1,'其他',NULL),(10,2,'国有企业',NULL),(11,2,'私营企业',NULL),(12,2,'外资企业',NULL),(13,2,'合资企业',NULL),(14,2,NULL,NULL),(15,2,NULL,NULL),(16,2,NULL,NULL),(17,2,NULL,NULL),(18,2,NULL,NULL),(19,2,NULL,NULL),(20,2,'其他',NULL),(21,3,'中国银行',NULL),(22,3,'工商银行',NULL),(23,3,'农业银行',NULL),(24,3,'中国银行',NULL),(25,3,'建设银行',NULL),(26,3,'招商银行',NULL),(27,3,NULL,NULL),(28,3,NULL,NULL),(29,3,NULL,NULL),(30,3,'其他 展销会',NULL),(31,4,'网络',NULL),(32,4,'商业活动',NULL),(33,4,NULL,NULL),(34,4,NULL,NULL),(35,4,NULL,NULL),(36,4,NULL,NULL),(37,4,NULL,NULL),(38,4,NULL,NULL),(39,4,NULL,NULL),(40,4,NULL,NULL),(41,5,'其他',NULL),(42,5,'非常满意',NULL),(43,5,'满意',NULL),(44,5,'不满意',NULL),(45,5,'非常不满意',NULL),(46,5,NULL,NULL),(47,5,NULL,NULL),(48,5,NULL,NULL),(49,5,NULL,NULL),(50,5,'其他',NULL);
/*!40000 ALTER TABLE `dictionarytype_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-12 23:00:19
