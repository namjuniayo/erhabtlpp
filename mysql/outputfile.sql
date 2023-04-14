-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: erha_db
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id_art` int NOT NULL AUTO_INCREMENT,
  `main_inv_id` int NOT NULL,
  `sub_id` int NOT NULL,
  `type_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `model_id` int NOT NULL,
  PRIMARY KEY (`id_art`),
  UNIQUE KEY `id_art` (`id_art`,`main_inv_id`,`sub_id`,`type_id`,`vendor_id`,`model_id`),
  KEY `articles_ibfk_1` (`main_inv_id`),
  KEY `articles_ibfk_2` (`sub_id`),
  KEY `articles_ibfk_3` (`type_id`),
  KEY `articles_ibfk_4` (`vendor_id`),
  KEY `articles_ibfk_5` (`model_id`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`main_inv_id`) REFERENCES `main_inv_cat` (`id_main`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `inv_subcat` (`id_sub`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `articles_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `types_cat` (`id_type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `articles_ibfk_4` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id_vendor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `articles_ibfk_5` FOREIGN KEY (`model_id`) REFERENCES `vendor_models` (`id_model`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,1,1,3,2,1);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `cdesc` varchar(8) NOT NULL,
  PRIMARY KEY (`cdesc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES ('Доллар'),('Рубль'),('Юань');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_units`
--

DROP TABLE IF EXISTS `global_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_units` (
  `unit` varchar(16) NOT NULL,
  PRIMARY KEY (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_units`
--

LOCK TABLES `global_units` WRITE;
/*!40000 ALTER TABLE `global_units` DISABLE KEYS */;
INSERT INTO `global_units` VALUES ('кг.'),('См.'),('шт.');
/*!40000 ALTER TABLE `global_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_subcat`
--

DROP TABLE IF EXISTS `inv_subcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inv_subcat` (
  `id_sub` int NOT NULL AUTO_INCREMENT,
  `id_main_cat` int NOT NULL,
  `subcat_desc` varchar(128) NOT NULL COMMENT 'PCs, Phones, Nets',
  PRIMARY KEY (`id_sub`),
  UNIQUE KEY `id_main_cat` (`id_main_cat`,`subcat_desc`),
  CONSTRAINT `inv_subcat_ibfk_1` FOREIGN KEY (`id_main_cat`) REFERENCES `main_inv_cat` (`id_main`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_subcat`
--

LOCK TABLES `inv_subcat` WRITE;
/*!40000 ALTER TABLE `inv_subcat` DISABLE KEYS */;
INSERT INTO `inv_subcat` VALUES (1,1,'ПК'),(2,1,'Сервер'),(3,2,'Для тел.'),(4,3,'Услуги ЦОД');
/*!40000 ALTER TABLE `inv_subcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_inv_cat`
--

DROP TABLE IF EXISTS `main_inv_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_inv_cat` (
  `id_main` int NOT NULL AUTO_INCREMENT,
  `main_desc` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'devs, components, services',
  PRIMARY KEY (`id_main`),
  UNIQUE KEY `main_desc_UNIQUE` (`main_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_inv_cat`
--

LOCK TABLES `main_inv_cat` WRITE;
/*!40000 ALTER TABLE `main_inv_cat` DISABLE KEYS */;
INSERT INTO `main_inv_cat` VALUES (2,'Комплектующие'),(1,'Оборудование'),(3,'Услуги');
/*!40000 ALTER TABLE `main_inv_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_clients`
--

DROP TABLE IF EXISTS `org_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `client_desc` varchar(256) NOT NULL,
  `client_address` varchar(512) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `client_address` (`client_desc`,`client_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_clients`
--

LOCK TABLES `org_clients` WRITE;
/*!40000 ALTER TABLE `org_clients` DISABLE KEYS */;
INSERT INTO `org_clients` VALUES (1,'ООО Агроторг','Ул. Нарлуна, д. 2/1');
/*!40000 ALTER TABLE `org_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_staff`
--

DROP TABLE IF EXISTS `org_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_staff` (
  `id_emp` int NOT NULL AUTO_INCREMENT,
  `fio` varchar(512) NOT NULL,
  `login` varchar(128) NOT NULL,
  `password` varchar(512) NOT NULL,
  `birthdate` date NOT NULL,
  `mail` varchar(128) NOT NULL,
  `phone` varchar(64) NOT NULL,
  PRIMARY KEY (`id_emp`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `mail_UNIQUE` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_staff`
--

LOCK TABLES `org_staff` WRITE;
/*!40000 ALTER TABLE `org_staff` DISABLE KEYS */;
INSERT INTO `org_staff` VALUES (1,'Бабушкина Галина Ивановна','PapushKo','54Gfdo39','1999-09-23','logikrt@yandex.ru','+78463775940'),(2,'Егоров Павел Олегович','PaLko','54GLLkd','1980-11-15','ssdrt@yandex.ru','+7843214940');
/*!40000 ALTER TABLE `org_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id_srv` int NOT NULL AUTO_INCREMENT,
  `main_id` int NOT NULL,
  `sub_id` int NOT NULL,
  `type_id` int NOT NULL,
  `prov_id` int NOT NULL,
  `cost` int NOT NULL,
  `cdesc` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `valid_to` date NOT NULL,
  `comments` varchar(512) NOT NULL,
  PRIMARY KEY (`id_srv`),
  KEY `main_id` (`main_id`),
  KEY `sub_id` (`sub_id`),
  KEY `type_id` (`type_id`),
  KEY `prov_id` (`prov_id`),
  KEY `cdesc` (`cdesc`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`main_id`) REFERENCES `main_inv_cat` (`id_main`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `services_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `inv_subcat` (`id_sub`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `services_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `types_cat` (`id_type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `services_ibfk_4` FOREIGN KEY (`prov_id`) REFERENCES `srv_providers` (`id_prov`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `services_ibfk_5` FOREIGN KEY (`cdesc`) REFERENCES `currencies` (`cdesc`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,3,4,5,1,76000,'Рубль','2024-12-01','Комментарий');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `srv_providers`
--

DROP TABLE IF EXISTS `srv_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `srv_providers` (
  `id_prov` int NOT NULL AUTO_INCREMENT,
  `prov_desc` varchar(128) NOT NULL,
  PRIMARY KEY (`id_prov`),
  UNIQUE KEY `prov_desc_UNIQUE` (`prov_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `srv_providers`
--

LOCK TABLES `srv_providers` WRITE;
/*!40000 ALTER TABLE `srv_providers` DISABLE KEYS */;
INSERT INTO `srv_providers` VALUES (1,'Назвение 1'),(2,'Назвение 2');
/*!40000 ALTER TABLE `srv_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id_supp` int NOT NULL AUTO_INCREMENT,
  `supp_address` varchar(256) NOT NULL,
  `supp_desc` varchar(512) NOT NULL,
  `comments` varchar(512) NOT NULL,
  PRIMARY KEY (`id_supp`),
  UNIQUE KEY `supp_address` (`supp_address`,`supp_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Ул. Великогорская, д.30','МариОт','Комментарии 1'),(2,'Ул. Норильская, д.19','Форс','Комментарии 2');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transact_in`
--

DROP TABLE IF EXISTS `transact_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transact_in` (
  `id_in` int NOT NULL AUTO_INCREMENT,
  `supp_desc` varchar(256) NOT NULL,
  `wrh_address` varchar(512) NOT NULL,
  `date_time` timestamp NOT NULL,
  `main_inv_desc` varchar(256) NOT NULL,
  `sub_desc` varchar(256) NOT NULL,
  `type_desc` varchar(256) NOT NULL,
  `vendor_desc` varchar(256) NOT NULL,
  `vendor_model` varchar(256) NOT NULL,
  `counts` int NOT NULL,
  `glob_unit` varchar(16) NOT NULL,
  `empl_fio` varchar(256) NOT NULL,
  `comments` varchar(512) NOT NULL,
  PRIMARY KEY (`id_in`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transact_in`
--

LOCK TABLES `transact_in` WRITE;
/*!40000 ALTER TABLE `transact_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `transact_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transact_mv`
--

DROP TABLE IF EXISTS `transact_mv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transact_mv` (
  `id_mv` int NOT NULL AUTO_INCREMENT,
  `src_wrh` varchar(256) NOT NULL,
  `dst_wrh` varchar(256) NOT NULL,
  `date_time` timestamp NOT NULL,
  `main_inv_desc` varchar(256) NOT NULL,
  `sub_inv_desc` varchar(256) NOT NULL,
  `type_desc` varchar(256) NOT NULL,
  `vendor_desc` varchar(256) NOT NULL,
  `vendor_model` varchar(256) NOT NULL,
  `counts` int NOT NULL,
  `glob_units` varchar(256) NOT NULL,
  `empl_fio` varchar(256) NOT NULL,
  `comments` varchar(512) NOT NULL,
  PRIMARY KEY (`id_mv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transact_mv`
--

LOCK TABLES `transact_mv` WRITE;
/*!40000 ALTER TABLE `transact_mv` DISABLE KEYS */;
/*!40000 ALTER TABLE `transact_mv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transact_out`
--

DROP TABLE IF EXISTS `transact_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transact_out` (
  `id_out` int NOT NULL AUTO_INCREMENT,
  `wrh_address` varchar(512) NOT NULL,
  `client_desc` varchar(512) NOT NULL,
  `date_time` timestamp NOT NULL,
  `main_inv_desc` varchar(256) NOT NULL,
  `sub_desc` varchar(256) NOT NULL,
  `type_desc` varchar(256) NOT NULL,
  `vendor_desc` varchar(256) NOT NULL,
  `vendor_model` varchar(256) NOT NULL,
  `counts` int NOT NULL,
  `glob_unit` varchar(16) NOT NULL,
  `empl_fio` varchar(256) NOT NULL,
  `comments` varchar(512) NOT NULL,
  PRIMARY KEY (`id_out`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transact_out`
--

LOCK TABLES `transact_out` WRITE;
/*!40000 ALTER TABLE `transact_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `transact_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transact_wroff`
--

DROP TABLE IF EXISTS `transact_wroff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transact_wroff` (
  `id_wroff` int NOT NULL AUTO_INCREMENT,
  `wrh_address` varchar(512) NOT NULL,
  `reason` varchar(512) NOT NULL,
  `date_time` timestamp NOT NULL,
  `main_inv_desc` varchar(256) NOT NULL,
  `sub_inv_desc` varchar(256) NOT NULL,
  `type_desc` varchar(256) NOT NULL,
  `vendor_desc` varchar(256) NOT NULL,
  `vendor_model` varchar(256) NOT NULL,
  `counts` int NOT NULL,
  `glob_unit` varchar(16) NOT NULL,
  `empl_fio` varchar(256) NOT NULL,
  `comments` varchar(512) NOT NULL,
  PRIMARY KEY (`id_wroff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transact_wroff`
--

LOCK TABLES `transact_wroff` WRITE;
/*!40000 ALTER TABLE `transact_wroff` DISABLE KEYS */;
/*!40000 ALTER TABLE `transact_wroff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_cat`
--

DROP TABLE IF EXISTS `types_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_cat` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `id_inv_sub` int NOT NULL,
  `type_desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'dev types, components types, services types',
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `id_inv_sub` (`id_inv_sub`,`type_desc`),
  CONSTRAINT `types_cat_ibfk_1` FOREIGN KEY (`id_inv_sub`) REFERENCES `inv_subcat` (`id_sub`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_cat`
--

LOCK TABLES `types_cat` WRITE;
/*!40000 ALTER TABLE `types_cat` DISABLE KEYS */;
INSERT INTO `types_cat` VALUES (3,1,'Патчкорды оптические'),(1,2,'Микросборки'),(2,2,'Сервер'),(4,3,'VoIP транки'),(5,4,'Услуга 1');
/*!40000 ALTER TABLE `types_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_models`
--

DROP TABLE IF EXISTS `vendor_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_models` (
  `id_model` int NOT NULL AUTO_INCREMENT,
  `id_vendor` int NOT NULL,
  `model_desc` varchar(128) NOT NULL,
  PRIMARY KEY (`id_model`),
  UNIQUE KEY `id_main_cat` (`id_vendor`,`model_desc`),
  CONSTRAINT `vendor_models_ibfk_1` FOREIGN KEY (`id_vendor`) REFERENCES `vendors` (`id_vendor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_models`
--

LOCK TABLES `vendor_models` WRITE;
/*!40000 ALTER TABLE `vendor_models` DISABLE KEYS */;
INSERT INTO `vendor_models` VALUES (2,2,'Fl321'),(1,2,'Fl322'),(3,3,'S12');
/*!40000 ALTER TABLE `vendor_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id_vendor` int NOT NULL AUTO_INCREMENT,
  `vendor_desc` varchar(128) NOT NULL,
  PRIMARY KEY (`id_vendor`),
  UNIQUE KEY `vendor_desc_UNIQUE` (`vendor_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (2,'FYHXele'),(1,'HP'),(3,'LG');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wrhouses`
--

DROP TABLE IF EXISTS `wrhouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wrhouses` (
  `id_wrh` int NOT NULL AUTO_INCREMENT,
  `address` varchar(512) NOT NULL,
  `comments` varchar(512) NOT NULL,
  PRIMARY KEY (`id_wrh`),
  UNIQUE KEY `address_UNIQUE` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wrhouses`
--

LOCK TABLES `wrhouses` WRITE;
/*!40000 ALTER TABLE `wrhouses` DISABLE KEYS */;
INSERT INTO `wrhouses` VALUES (1,'Частный сектор ,Улица Новгородская, дом 20','Злая собака в частном секторе'),(2,'Улица Анны-Корененной, дом 139/2','Комментарий 2');
/*!40000 ALTER TABLE `wrhouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wrhouses_balance`
--

DROP TABLE IF EXISTS `wrhouses_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wrhouses_balance` (
  `wrh_id` int NOT NULL,
  `art_id` int NOT NULL,
  `units_bal` int NOT NULL,
  `global_unit` varchar(16) NOT NULL,
  UNIQUE KEY `wrh_id` (`wrh_id`,`art_id`),
  KEY `whouses_balance_ibfk_1` (`art_id`),
  KEY `global_unit` (`global_unit`),
  CONSTRAINT `wrhouses_balance_ibfk_1` FOREIGN KEY (`art_id`) REFERENCES `articles` (`id_art`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `wrhouses_balance_ibfk_2` FOREIGN KEY (`wrh_id`) REFERENCES `wrhouses` (`id_wrh`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `wrhouses_balance_ibfk_3` FOREIGN KEY (`global_unit`) REFERENCES `global_units` (`unit`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wrhouses_balance`
--

LOCK TABLES `wrhouses_balance` WRITE;
/*!40000 ALTER TABLE `wrhouses_balance` DISABLE KEYS */;
INSERT INTO `wrhouses_balance` VALUES (1,1,66,'шт.');
/*!40000 ALTER TABLE `wrhouses_balance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 15:39:56
