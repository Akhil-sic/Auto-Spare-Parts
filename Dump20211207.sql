-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autopartsdb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `Bid` int NOT NULL AUTO_INCREMENT,
  `Bname` varchar(45) DEFAULT NULL,
  `Btype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Bid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Susuki','OEM'),(2,'Toyota','OEM'),(3,'Bosch','Aftermarket'),(4,'Mahindra','OEM'),(5,'Maruti','OEM');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_tbl`
--

DROP TABLE IF EXISTS `cart_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_tbl` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `p_name` varchar(45) DEFAULT NULL,
  `p_brand` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `tot_price` double GENERATED ALWAYS AS ((`price` * `qty`)) STORED,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_tbl`
--

LOCK TABLES `cart_tbl` WRITE;
/*!40000 ALTER TABLE `cart_tbl` DISABLE KEYS */;
INSERT INTO `cart_tbl` (`cid`, `pid`, `uid`, `p_name`, `p_brand`, `price`, `qty`) VALUES (14,6,7,'Side Mirror','Maruti',600,1),(15,4,7,'Brake Pad Innova Crysta','Toyota',1380,2),(20,7,17,'Head light','Toyota',1200,2),(21,6,17,'Side Mirror','Maruti',600,1);
/*!40000 ALTER TABLE `cart_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `catid` int NOT NULL,
  `catname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tbl`
--

DROP TABLE IF EXISTS `order_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tbl` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) DEFAULT NULL,
  `u_name` varchar(45) DEFAULT NULL,
  `u_email` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `p_name` varchar(45) DEFAULT NULL,
  `b_name` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pay_status` varchar(45) DEFAULT NULL,
  `pay_type` varchar(45) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `tot_price` double GENERATED ALWAYS AS ((`price` * `qty`)) STORED,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tbl`
--

LOCK TABLES `order_tbl` WRITE;
/*!40000 ALTER TABLE `order_tbl` DISABLE KEYS */;
INSERT INTO `order_tbl` (`o_id`, `order_id`, `u_name`, `u_email`, `address`, `phno`, `p_name`, `b_name`, `price`, `pay_status`, `pay_type`, `qty`) VALUES (16,'PART-ORD-785','abdul','abdul@gmail.com','@210, 18th cross, malleswarum, Bangalore-560027','9834628134','Side Mirror','Maruti',600,'Not-Paid','COD',1),(17,'PART-ORD-687','abdul','abdul@gmail.com','@210, 18th cross, malleswarum, Bangalore-560027','9834628134','Brake Pad Innova Crysta','Toyota',1380,'Not-Paid','COD',2),(22,'PART-ORD-778','Rahul','rahul@gmail.com','ugiifyiof','2647384532','Head light','Toyota',1200,'Not-Paid','COD',1),(23,'PART-ORD-775','Rahul','rahul@gmail.com','ugiifyiof','2647384532','Side Mirror','Maruti',600,'Not-Paid','COD',1),(25,'PART-ORD-469','Rahul','rahul@gmail.com','gutdjy','2647384532','Brake Pad Innova Crysta','Toyota',1380,'Not-Paid','COD',1),(27,'PART-ORD-645','1232131','ram@gmail.com','Jahalahalli','2956784896','Head light','Toyota',1200,'Not-Paid','COD',1);
/*!40000 ALTER TABLE `order_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(100) DEFAULT NULL,
  `manuf_no` varchar(50) DEFAULT NULL,
  `b_id` int DEFAULT NULL,
  `vmid` int DEFAULT NULL,
  `cprice` double DEFAULT NULL,
  `sprice` double DEFAULT NULL,
  `Pdescription` varchar(500) DEFAULT NULL,
  `Pdetail` varchar(500) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `Pimg1` varchar(45) DEFAULT NULL,
  `Pimg2` varchar(45) DEFAULT NULL,
  `Pimg3` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `brand_FK_idx` (`b_id`),
  KEY `vmodel-FK_idx` (`vmid`),
  CONSTRAINT `brand_FK` FOREIGN KEY (`b_id`) REFERENCES `brand` (`Bid`),
  CONSTRAINT `vmodel-FK` FOREIGN KEY (`vmid`) REFERENCES `vmodel` (`vmid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (4,'Brake Pad Innova Crysta',NULL,2,1,1453,1380,'Advanced semi-metallic and ceramic copper free friction technology makes Bosch brake pad the best in class providing end user with high braking performance and safety with long operational life.','Asbestos free Bosch brake Pads ensure all- weather driving comfort with excellent stopping distance from the very first stop.\r\nBetter NHV(noise,vibration and harshness characteristics).\r\nOptimum co-efficient of friction.',10,'bp4.jpg','bp3.jpg','bp2.jpg','Available'),(6,'Side Mirror',NULL,5,2,800,600,'This car mirror is suitable to view passenger in left side wing. It not only provides a better look to your car but also saves your car in traffic.','',20,'p1-1.jpg','p1-2.jpg','p1-3.jpg','Available'),(7,'Head light',NULL,2,1,1300,1200,'A headlamp is a lamp attached to the front of a vehicle to illuminate the road ahead. Headlamps are also often called headlights','',20,'p2-1.jpg','p2-2.jpg','p2-3.jpg','Available'),(14,'gcjgc','jfhjh6775',4,3,2000,1999,'jgcgcug','gccyt',5,'Annotation 2020-09-28 200216.png','Annotation 2020-09-28 200411.png','Annotation 2020-09-28 200443.png','Not Available');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_products`
--

DROP TABLE IF EXISTS `req_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `req_products` (
  `req_id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `p_name` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `pro_desc` varchar(200) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`req_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_products`
--

LOCK TABLES `req_products` WRITE;
/*!40000 ALTER TABLE `req_products` DISABLE KEYS */;
INSERT INTO `req_products` VALUES (1,7,'Spark plug','Susuki','Access','2017','','NO ACTION',1),(2,7,'Spark plug','Honda','Activa','2018','','NO ACTION',1);
/*!40000 ALTER TABLE `req_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(45) DEFAULT NULL,
  `regdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phno_UNIQUE` (`phno`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'akhil','akil.varghese@gmail.com','9739187403','Male','Akhil@1234','Admin','2021-10-20 10:20:12'),(7,'abdul','abdul@gmail.com','9834628134','Male','Abdul@123','User','2021-10-20 11:49:43'),(8,'Rani','rani@gmail.com','4464446','Female','rani','User','2021-10-23 07:23:15'),(9,'Sreetu','sreetu@gmail.com','3456749201','Female','Sreetu@123','User','2021-11-13 16:47:39'),(17,'Rahul','rahul@gmail.com','2647384532','Male','Rahul@123','User','2021-11-22 07:17:38'),(23,'Shashi','Shashi@yahoo.com','9739187875','Male','Shashi@123','User','2021-12-05 18:53:01'),(25,'anto','anto@gmail.com','8759376946','Male','Anto@123','User','2021-12-05 19:01:49'),(26,'1232131','ram@gmail.com','2956784896','Male','Ram@123','User','2021-12-06 04:33:59');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmodel`
--

DROP TABLE IF EXISTS `vmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vmodel` (
  `vmid` int NOT NULL AUTO_INCREMENT,
  `b_id` int DEFAULT NULL,
  `vmname` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vmid`),
  KEY `FK_modelBrand` (`b_id`),
  CONSTRAINT `FK_modelBrand` FOREIGN KEY (`b_id`) REFERENCES `brand` (`Bid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmodel`
--

LOCK TABLES `vmodel` WRITE;
/*!40000 ALTER TABLE `vmodel` DISABLE KEYS */;
INSERT INTO `vmodel` VALUES (1,2,'Inova','2016'),(2,5,'Swift','2017'),(3,4,'XUV300','2019');
/*!40000 ALTER TABLE `vmodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 13:37:53
