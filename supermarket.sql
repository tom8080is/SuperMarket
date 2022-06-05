-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: supermarket
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_products` (
  `cart_product_id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `amount` bigint NOT NULL,
  `total_price` bigint NOT NULL,
  `cart_id` bigint NOT NULL,
  PRIMARY KEY (`cart_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_products`
--

LOCK TABLES `cart_products` WRITE;
/*!40000 ALTER TABLE `cart_products` DISABLE KEYS */;
INSERT INTO `cart_products` VALUES (83,6,1,12,19),(84,4,2,10,19),(85,4,1,5,20),(86,6,1,12,20),(87,5,1,5,21),(88,4,1,5,22),(89,6,1,12,23),(91,5,1,5,24),(92,4,1,5,24),(93,6,1,12,24),(94,6,2,24,25),(95,6,1,12,0),(96,6,1,12,26),(97,5,1,5,27),(98,5,1,5,28),(99,7,1,15,29),(100,5,5,25,30),(101,2,1,70,30),(102,4,1,5,31),(103,4,1,5,32),(104,4,1,5,33),(105,4,1,5,34),(106,2,1,70,35),(107,2,1,70,36),(108,6,1,12,38),(109,5,1,5,40),(110,4,1,5,41),(111,2,1,70,42),(112,2,1,70,43),(113,5,1,5,44),(114,5,3,15,45),(115,5,1,5,46),(116,6,1,12,47),(117,4,1,5,48),(118,6,1,12,49),(119,6,1,12,50),(120,5,1,5,51),(121,6,1,12,52),(122,6,1,12,53),(123,5,1,5,54),(124,6,1,12,55),(125,5,1,5,56),(126,6,3,36,57),(127,7,1,15,58),(128,6,2,24,59),(129,6,1,12,60),(130,4,1,5,61),(131,6,1,12,62),(132,6,1,12,63),(133,6,3,36,64),(134,5,1,5,65),(135,6,1,12,66),(136,6,3,36,67),(137,4,1,5,68),(138,4,1,5,69),(139,5,4,20,69),(140,7,2,30,69),(141,6,1,12,70),(142,4,5,25,71),(143,6,1,12,72),(144,5,1,5,72),(145,4,1,5,72),(146,5,1,5,73),(147,4,1,5,73),(148,7,2,30,74),(149,5,1,5,74),(150,4,1,5,75),(151,4,1,5,75),(152,5,1,5,75),(153,5,1,5,76),(154,5,1,5,76),(155,6,1,12,77),(156,4,3,15,77),(157,5,1,5,77),(158,6,9,108,78),(159,6,9,108,78),(160,7,1,15,78),(161,6,1,12,79),(162,7,6,90,79),(163,2,1,70,0),(164,6,1,12,80),(165,4,1,5,80),(166,2,1,70,81),(167,5,1,5,81),(168,7,1,15,82),(169,5,1,5,82),(170,5,1,5,83),(171,2,1,70,83),(172,4,1,5,84),(173,5,1,5,84),(174,5,1,5,85),(175,4,1,5,85),(176,5,1,5,86),(177,4,1,5,87),(178,4,1,5,88),(179,4,3,15,89),(180,5,1,5,89),(181,4,3,15,90),(182,5,2,12,92),(186,1,1,20,93);
/*!40000 ALTER TABLE `cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `cart_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `created_date` varchar(40) NOT NULL,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `cart_id_UNIQUE` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (19,2,'2021-11-10 19:15'),(20,2,'2021-11-10 19:55'),(21,2,'2021-11-10 19:58'),(22,2,'2021-11-10 20:03'),(23,2,'2021-11-10 20:07'),(24,2,'2021-11-10 20:21'),(25,2,'2021-11-10 20:31'),(26,2,'2021-11-10 20:52'),(27,2,'2021-11-10 20:53'),(28,2,'2021-11-10 20:54'),(29,2,'2021-11-10 20:55'),(30,2,'2021-11-10 20:57'),(31,2,'2021-11-12 17:30'),(32,2,'2021-11-12 18:15'),(33,2,'2021-11-12 18:18'),(34,2,'2021-11-12 18:19'),(35,2,'2021-11-12 18:20'),(36,2,'2021-11-12 18:24'),(37,2,'2021-11-12 18:25'),(38,2,'2021-11-12 18:25'),(39,2,'2021-11-12 18:26'),(40,2,'2021-11-12 18:26'),(41,2,'2021-11-12 18:28'),(42,2,'2021-11-12 18:28'),(43,2,'2021-11-12 18:29'),(44,2,'2021-11-12 18:36'),(45,2,'2021-11-12 18:37'),(46,2,'2021-11-12 18:52'),(47,2,'2021-11-12 18:52'),(48,2,'2021-11-12 18:54'),(49,2,'2021-11-12 18:55'),(50,2,'2021-11-12 18:56'),(51,2,'2021-11-12 18:58'),(52,2,'2021-11-12 19:07'),(53,2,'2021-11-12 19:08'),(54,2,'2021-11-12 19:09'),(55,2,'2021-11-12 20:01'),(56,2,'2021-11-12 20:05'),(57,2,'2021-11-12 20:07'),(58,2,'2021-11-12 20:07'),(59,2,'2021-11-12 20:08'),(60,2,'2021-11-12 20:11'),(61,2,'2021-11-12 20:12'),(62,2,'2021-11-12 20:14'),(63,2,'2021-11-12 20:15'),(64,2,'2021-11-12 20:16'),(65,2,'2021-11-12 20:17'),(66,2,'2021-11-12 20:18'),(67,2,'2021-11-12 20:18'),(68,2,'2021-11-12 20:20'),(69,2,'2021-11-12 20:22'),(70,2,'2021-11-12 20:26'),(71,2,'2021-11-12 20:27'),(72,2,'2021-11-12 20:28'),(73,2,'2021-11-12 20:35'),(74,2,'2021-11-12 20:44'),(75,2,'2021-11-13 00:20'),(76,2,'2021-11-13 00:21'),(77,2,'2021-11-13 00:24'),(78,2,'2021-11-13 00:26'),(79,2,'2021-11-13 00:29'),(80,2,'2021-11-13 00:32'),(81,2,'2021-11-13 00:38'),(82,2,'2021-11-13 00:56'),(83,2,'2021-11-13 00:59'),(84,2,'2021-11-13 01:02'),(85,2,'2021-11-13 01:07'),(86,2,'2021-11-13 01:19'),(87,2,'2021-11-13 01:19'),(88,2,'2021-11-13 01:19'),(89,2,'2021-11-13 01:20'),(90,2,'2021-11-13 15:06'),(91,1,'2021-11-13 15:07'),(92,2,'2021-11-13 21:40'),(93,2,'2021-11-13 22:03'),(94,2,'2021-11-13 22:23');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Dairy'),(2,'Cookies, Snacks & Candy'),(3,'Meat & Fish'),(4,'Bread & Bakery'),(5,'Baby');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `cart_id` bigint NOT NULL,
  `total_price` bigint NOT NULL,
  `ship_city` varchar(200) NOT NULL,
  `ship_address` varchar(200) NOT NULL,
  `shipped_date` date NOT NULL,
  `order_date` date NOT NULL,
  `last_4_digit` bigint NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (9,2,19,22,'Haifa','a zit','2021-12-12','2021-11-10',6546),(10,2,20,17,'Haifa','הזית','2021-12-12','2021-11-10',1515),(11,2,21,5,'Be\'er Sheva','a zit','2021-12-12','2021-11-10',6515),(12,2,22,5,'Haifa','הזית','2021-11-11','2021-11-10',5645),(13,2,23,12,'Haifa','הזית','2021-11-11','2021-11-10',6546),(14,2,24,22,'Be\'er Sheva','הזית','2021-11-11','2021-11-10',5465),(15,2,25,24,'Haifa','הזית','2021-11-23','2021-11-10',1321),(16,2,26,12,'Be\'er Sheva','הזית','2021-12-02','2021-11-10',1651),(17,2,27,5,'Haifa','הזית','2021-12-09','2021-11-10',2342),(18,2,28,5,'Be\'er Sheva','a zit','2021-12-01','2021-11-10',5646),(19,2,29,15,'Haifa','הזית','2021-12-07','2021-11-10',5456),(20,2,30,95,'Haifa','הזית','2021-11-25','2021-11-12',4564),(21,2,31,5,'Haifa','הזית','2021-12-02','2021-11-12',5465),(22,2,32,5,'Be\'er Sheva','הזית','2021-12-02','2021-11-12',4654),(23,2,33,5,'Be\'er Sheva','a zit','2021-12-09','2021-11-12',2342),(24,2,34,5,'Be\'er Sheva','הזית','2021-11-25','2021-11-12',2342),(25,2,35,70,'Haifa','הזית','2021-11-25','2021-11-12',2342),(26,2,36,70,'Haifa','הזית','2021-12-01','2021-11-12',5456),(27,2,37,70,'Haifa','הזית','2021-12-08','2021-11-12',5456),(28,2,38,12,'Be\'er Sheva','הזית','2021-12-09','2021-11-12',6546),(29,2,38,12,'Be\'er Sheva','הזית','2021-12-02','2021-11-12',6546),(30,2,39,12,'Be\'er Sheva','הזית','2021-12-07','2021-11-12',6546),(31,2,40,5,'Netanya','a zit','2021-12-09','2021-11-12',3453),(32,2,41,5,'Haifa','הזית','2021-12-01','2021-11-12',1231),(33,2,42,70,'Jerusalem','הזית','2021-12-11','2021-11-12',1231),(34,2,43,70,'Haifa','הזית','2021-12-03','2021-11-12',1231),(35,2,44,5,'Be\'er Sheva','a zit','2021-12-09','2021-11-12',2342),(36,2,45,15,'Jerusalem','הזית','2021-12-09','2021-11-12',1231),(37,2,46,5,'Jerusalem','הזית','2021-12-11','2021-11-12',1231),(38,2,47,12,'Haifa','הזית','2021-12-10','2021-11-12',2342),(39,2,48,5,'Be\'er Sheva','הזית','2021-12-09','2021-11-12',2342),(40,2,49,12,'Haifa','הזית','2021-12-10','2021-11-12',2342),(41,2,50,12,'Haifa','הזית','2021-12-01','2021-11-12',1231),(42,2,51,5,'Be\'er Sheva','הזית','2021-12-09','2021-11-12',2141),(43,2,52,12,'Be\'er Sheva','הזית','2021-12-11','2021-11-12',1231),(44,2,53,12,'Haifa','a zit','2021-12-08','2021-11-12',1231),(45,2,54,5,'Jerusalem','הזית','2021-12-08','2021-11-12',1231),(46,2,55,12,'Jerusalem','הזית','2021-12-02','2021-11-12',1231),(47,2,56,5,'Be\'er Sheva','a zit','2021-12-03','2021-11-12',2342),(48,2,57,36,'Jerusalem','הזית','2021-12-09','2021-11-12',2342),(49,2,58,15,'Haifa','הזית','2021-12-01','2021-11-12',2342),(50,2,59,24,'Haifa','הזית','2021-12-09','2021-11-12',1231),(51,2,60,12,'Jerusalem','הזית','2021-12-09','2021-11-12',2342),(52,2,61,5,'Haifa','הזית','2021-12-10','2021-11-12',2342),(53,2,62,12,'Haifa','הזית','2024-11-22','2021-11-12',1231),(54,2,63,12,'Herzelia','a zit','2021-11-16','2021-11-12',1231),(55,2,64,36,'Haifa','a zit','2025-11-13','2021-11-12',2342),(56,2,65,5,'Haifa','הזית','2029-11-23','2021-11-12',1231),(57,2,66,12,'Jerusalem','הזית','2021-12-08','2021-11-12',1231),(58,2,67,36,'Haifa','הזית','2031-11-20','2021-11-12',1231),(59,2,68,5,'Haifa','הזית','2021-12-09','2021-11-12',2342),(60,2,69,55,'Haifa','הזית','2021-12-01','2021-11-12',1231),(61,2,70,12,'Haifa','הזית','2023-11-23','2021-11-12',1231),(62,2,71,25,'Jerusalem','הזית','2021-12-09','2021-11-12',1231),(63,2,72,17,'Haifa','הזית','2026-11-19','2021-11-12',2342),(64,2,73,5,'Haifa','הזית','2021-12-08','2021-11-12',6545),(65,2,74,35,'Haifa','הזית','2027-11-30','2021-11-13',2342),(66,2,75,5,'Haifa','הזית','2021-12-09','2021-11-13',2342),(67,2,76,5,'Haifa','הזית','2030-11-22','2021-11-13',3453),(68,2,77,12,'Haifa','הזית','2021-12-30','2021-11-13',2342),(69,2,78,12,'Haifa','הזית','2021-12-23','2021-11-13',2342),(70,2,79,12,'Haifa','הזית','2028-11-23','2021-11-13',6546),(71,2,80,12,'Be\'er Sheva','הזית','2021-12-08','2021-11-13',5165),(72,2,81,70,'Jerusalem','הזית','2021-12-07','2021-11-13',2121),(73,2,82,15,'Be\'er Sheva','הזית','2021-12-08','2021-11-13',2312),(74,2,83,5,'Jerusalem','הזית','2021-12-04','2021-11-13',3453),(75,2,84,5,'Jerusalem','הזית','2021-12-09','2021-11-13',1231),(76,2,85,10,'Haifa','הזית','2021-12-03','2021-11-13',1231),(77,2,86,5,'Be\'er Sheva','הזית','2021-12-07','2021-11-13',1515),(78,2,87,5,'Haifa','הזית','2021-12-07','2021-11-13',1515),(79,2,88,5,'Haifa','הזית','2021-11-30','2021-11-13',1212),(80,2,89,20,'Be\'er Sheva','הזית','2028-11-24','2021-11-13',5462),(81,2,90,15,'Haifa','הזית','2021-11-27','2021-11-13',2313),(82,2,92,12,'Be\'er Sheva','הזית','2021-12-07','2021-11-13',3453),(83,2,93,20,'Haifa','הזית','2021-11-30','2021-11-13',8787);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `category_id` bigint NOT NULL,
  `product_price` bigint NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Diapers',5,20,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/INU52_L_P_7296073444213_1.png'),(2,'Baby Food',5,70,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/FMN46_L_P_7290015733144_1.png'),(4,'Choco',1,5,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/XLC24_L_P_174723_1.png'),(5,'Milk 3%',1,6,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/CAZ50_L_P_7290102398072_1.png'),(6,'Pringels',2,12,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_zoom/IEQ30_Z_P_38000232183_2.png'),(7,'Popcorn',2,15,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/WTI16_L_P_420325_1.png'),(8,'Cookies',2,134,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/QTZ48_L_P_7290015670470_1.png'),(9,'Crackers',2,12,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_zoom/FYU62_Z_P_7290112963895_1.png'),(10,'White Bread',4,6,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_zoom/GIR24_Z_P_497112_1.png'),(11,'Pita',4,10,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/GBK58_L_P_7290010777099_1.png'),(12,'Bagels',2,12,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/SXE64_L_P_7290106574977_1.png'),(13,'Mafines Cake',4,16,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/YPA56_L_P_7290106578821_1.png'),(14,'Beef',3,34,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/IKX46_L_P_9391978_1.png'),(15,'Saucage',3,25,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/SGX46_L_P_7290109580050_1.png'),(16,'Chicken',3,20,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/MOZ48_L_P_9394788_1.png'),(17,'Mozzarella ',1,13,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/JOQ68_L_P_7640166793991_1.png'),(18,'cheese',1,22,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/WSE50_L_P_7290102394463_1.png'),(19,'bamba',2,12,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/TBR24_L_P_66318_1.png'),(20,'candy',2,2,'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_large/JAF44_L_P_4009900465304_1.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(500) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `user_type` varchar(45) NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','01963a652a30d6e53b6ce14000d9c648','Bar','Jamse','bar@gmail.com','natania','123','ADMIN'),(2,'user555','bed4844dd35362b23473cfbb40448861','user','cohen','user@gmail.com','TLV','asf','USER'),(3,'tom','766342084f4872910acc23a16dcf14c1','wer','wer','123@gmail.com','awe','awe','USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-13 22:36:55
