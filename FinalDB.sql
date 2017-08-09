CREATE DATABASE  IF NOT EXISTS `inventory` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `inventory`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	5.5.24

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
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `ques` varchar(150) NOT NULL,
  `ans` varchar(45) NOT NULL,
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (10,'Shubham','$#ub#@m','shubh.spidy@gmail.com','What was your first mobile number?','9616963293'),(11,'varun@gmail.com','varun','123456789','whats your pet name?','pepsi'),(12,'vanshika','987987987','vanshu@gmail.co','what your brother name?','varun'),(13,'Naman','default','naman.jain@gmail.com','what is your name?','naman');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockdata`
--

DROP TABLE IF EXISTS `stockdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockdata` (
  `stkid` int(11) NOT NULL AUTO_INCREMENT,
  `articleno` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `discount` decimal(4,2) DEFAULT NULL,
  `trantype` varchar(45) NOT NULL,
  `bill` bigint(20) DEFAULT NULL,
  `net` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`stkid`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockdata`
--

LOCK TABLES `stockdata` WRITE;
/*!40000 ALTER TABLE `stockdata` DISABLE KEYS */;
INSERT INTO `stockdata` VALUES (146,100,50,999.00,'2013-07-01','Robin','Jeans',NULL,'Entry',NULL,NULL),(147,101,75,499.00,'2013-07-02','Saurabh','Shirt',NULL,'Entry',NULL,NULL),(148,102,100,299.00,'2013-07-02','Satyam','T-Shirt',NULL,'Entry',NULL,NULL),(149,103,20,1299.00,'2013-07-03','Satyendra','Mobile',NULL,'Entry',NULL,NULL),(150,104,100,169.00,'2013-07-04','Vanshika','Deodrants',NULL,'Entry',NULL,NULL),(151,100,2,999.00,'2013-07-03','Shubham','Jeans',10.00,'Sold',1000000,1798.20),(152,103,1,1299.00,'2013-07-03','Shubham','Mobile',0.00,'Sold',1000000,1299.00),(153,102,1,299.00,'2013-07-03','Shubham','T-Shirt',25.00,'Sold',1000000,224.25),(154,103,1,1299.00,'2013-07-04','Naman','Mobile',10.00,'Sold',1000001,1169.10),(155,101,75,599.00,'2013-07-05','Saurabh','Shirt',NULL,'Update',NULL,NULL),(156,103,23,1199.00,'2013-07-05','Satyendra','Mobile',NULL,'Update',NULL,NULL),(157,102,50,299.00,'2013-07-06','Satyam','T-Shirt',NULL,'Return',NULL,NULL),(158,100,30,999.00,'2013-07-06','Robin','Jeans',NULL,'Return',NULL,NULL),(159,103,2,1299.00,'2013-07-08',NULL,'Mobile',10.00,'Sale Return',1000001,2338.20),(160,103,1,1299.00,'2013-07-08',NULL,'Mobile',10.00,'Sale Return',1000001,1169.10),(161,101,3,599.00,'2013-07-08','Naman','Shirt',10.00,'Sold',1000002,1617.30),(162,103,22,999.00,'2013-07-10','Satyendra','Mobile',NULL,'Update',NULL,NULL),(163,102,40,299.00,'2013-07-11','Satyam','T-Shirt',NULL,'Return',NULL,NULL),(164,102,2,299.00,'2013-07-15','Satyendra','T-Shirt',10.00,'Sold',1000003,538.20),(165,100,1,999.00,'2013-07-15','Satyendra','Jeans',5.00,'Sold',1000003,949.05),(166,100,1,999.00,'2013-07-15',NULL,'Jeans',5.00,'Sale Return',1000003,949.05),(167,102,3,299.00,'2013-07-15','Satyendra','T-Shirt',5.00,'Sold',1000004,852.15),(168,100,1,999.00,'2013-07-15','Satyendra','Jeans',0.00,'Sold',1000004,999.00),(169,108,45,599.00,'2013-07-15','Rajesh','Shorts',NULL,'Entry',NULL,NULL),(170,108,30,599.00,'2013-07-15','Rajesh','Shorts',NULL,'Return',NULL,NULL),(171,108,1,599.00,'2013-07-15','Deepak','Shorts',10.00,'Sold',1000005,539.10),(172,104,10,169.00,'2013-07-15','Deepak','Deodrants',5.00,'Sold',1000005,1605.50),(173,103,22,900.00,'2013-07-15','Satyendra','Mobile',NULL,'Update',NULL,NULL);
/*!40000 ALTER TABLE `stockdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `articleno` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` decimal(4,2) NOT NULL,
  `net` decimal(10,2) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `articleno` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`articleno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (100,27,999.00,'2013-07-06','Robin','Jeans'),(101,72,599.00,'2013-07-05','Saurabh','Shirt'),(102,35,299.00,'2013-07-11','Satyam','T-Shirt'),(103,22,900.00,'2013-07-15','Satyendra','Mobile'),(104,90,169.00,'2013-07-04','Vanshika','Deodrants'),(108,29,599.00,'2013-07-15','Rajesh','Shorts');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-15 12:10:06
