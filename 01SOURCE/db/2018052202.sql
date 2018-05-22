-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `sys_admin`
--

DROP TABLE IF EXISTS `sys_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_admin` (
  `ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LOGIN_ACCOUNT_NO` varchar(255) DEFAULT NULL,
  `LOGIN_PASSWORD` varchar(255) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `ENABLE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin`
--

LOCK TABLES `sys_admin` WRITE;
/*!40000 ALTER TABLE `sys_admin` DISABLE KEYS */;
INSERT INTO `sys_admin` VALUES (1,'2018-05-22 17:26:06','admin','d41d8cd98f00b204e9800998ecf8427e','2018-05-22 17:26:06','0'),(2,'2018-05-22 17:27:27','liulei','c81e728d9d4c2f636f067f89cc14862c','2018-05-22 17:27:27','1'),(3,'2018-05-22 17:28:17','super','c81e728d9d4c2f636f067f89cc14862c','2018-05-22 17:28:17','1');
/*!40000 ALTER TABLE `sys_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_admin_login_log`
--

DROP TABLE IF EXISTS `sys_admin_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_admin_login_log` (
  `ID` bigint(20) NOT NULL,
  `ADMIN_ID` bigint(20) DEFAULT NULL,
  `IS_PASSWORD_ERROR` varchar(255) DEFAULT NULL,
  `LOGIN_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin_login_log`
--

LOCK TABLES `sys_admin_login_log` WRITE;
/*!40000 ALTER TABLE `sys_admin_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_admin_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_announcement`
--

DROP TABLE IF EXISTS `sys_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_announcement` (
  `ID` bigint(20) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_announcement`
--

LOCK TABLES `sys_announcement` WRITE;
/*!40000 ALTER TABLE `sys_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_code`
--

DROP TABLE IF EXISTS `sys_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_code` (
  `ID` bigint(20) NOT NULL,
  `CLASSIFY` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `CODE_NAME` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `DISPLAY_SN` int(11) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `PARENT_ID` varchar(255) DEFAULT NULL,
  `SCENE1` varchar(255) DEFAULT NULL,
  `SCENE2` varchar(255) DEFAULT NULL,
  `SCENE3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_code`
--

LOCK TABLES `sys_code` WRITE;
/*!40000 ALTER TABLE `sys_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_entity_filter`
--

DROP TABLE IF EXISTS `sys_entity_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_entity_filter` (
  `ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `FILTER` varchar(255) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_entity_filter`
--

LOCK TABLES `sys_entity_filter` WRITE;
/*!40000 ALTER TABLE `sys_entity_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_entity_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LEVEL` int(11) DEFAULT NULL,
  `LINK` varchar(255) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `SN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'2018-05-14 18:26:02',1,'',NULL,'映射管理',0,1),(2,'2018-04-05 20:08:18',2,'',NULL,'仓库映射',1,3),(3,'2018-04-05 20:08:40',2,'',NULL,'组合映射',1,4),(4,'2018-04-05 20:09:04',1,'',NULL,'工作流管理',0,2),(5,'2018-04-05 20:09:24',2,'',NULL,'变量管理',4,1),(6,'2018-04-05 20:09:35',2,'',NULL,'工作流管理',4,3),(7,'2018-04-05 20:09:44',2,'',NULL,'节点管理',4,2),(8,'2018-04-27 15:33:08',2,'/template/sys/assistant/generateEntity',NULL,'实体映射（数据库）',1,1),(9,'2018-04-09 23:19:03',2,'/template/sys/menu/menu',NULL,'菜单管理',15,1),(11,'2018-04-09 23:47:46',2,'/template/sys/role/role',NULL,'角色管理',15,2),(12,'2018-04-09 23:48:22',2,'',NULL,'权限管理',15,3),(13,'2018-04-09 23:50:10',2,'/template/sys/admin/admin','2018-05-22 14:30:15','操作员管理',15,4),(14,'2018-04-09 23:50:19',2,'',NULL,'组织管理',15,5),(15,'2018-04-23 17:34:11',1,'',NULL,'系统维护',0,0),(16,'2018-04-23 17:36:34',2,'/template/sys/config/entityFilterParamConfig',NULL,'实体过滤字',1,5),(17,'2018-04-27 15:43:48',2,'/template/sys/assistant/generateEntityOom',NULL,'实体映射（oom）',1,0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_role`
--

DROP TABLE IF EXISTS `sys_menu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_role` (
  `ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MENU_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_role`
--

LOCK TABLES `sys_menu_role` WRITE;
/*!40000 ALTER TABLE `sys_menu_role` DISABLE KEYS */;
INSERT INTO `sys_menu_role` VALUES (40,'2018-05-22 11:08:38',0,'2018-05-22 11:08:38',1),(41,'2018-05-22 11:08:38',1,'2018-05-22 11:08:38',1),(42,'2018-05-22 11:08:38',17,'2018-05-22 11:08:38',1),(43,'2018-05-22 11:08:38',8,'2018-05-22 11:08:38',1),(44,'2018-05-22 11:08:38',2,'2018-05-22 11:08:38',1),(45,'2018-05-22 11:08:38',3,'2018-05-22 11:08:38',1),(46,'2018-05-22 11:08:38',16,'2018-05-22 11:08:38',1),(47,'2018-05-22 11:08:38',4,'2018-05-22 11:08:38',1),(48,'2018-05-22 11:08:38',5,'2018-05-22 11:08:38',1),(49,'2018-05-22 11:08:38',7,'2018-05-22 11:08:38',1),(50,'2018-05-22 11:08:38',6,'2018-05-22 11:08:38',1),(51,'2018-05-22 11:08:50',0,'2018-05-22 11:08:50',3),(52,'2018-05-22 11:08:50',15,'2018-05-22 11:08:50',3),(53,'2018-05-22 11:08:50',9,'2018-05-22 11:08:50',3);
/*!40000 ALTER TABLE `sys_menu_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_visit_log`
--

DROP TABLE IF EXISTS `sys_menu_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_visit_log` (
  `ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MENU_ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `VISIT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_visit_log`
--

LOCK TABLES `sys_menu_visit_log` WRITE;
/*!40000 ALTER TABLE `sys_menu_visit_log` DISABLE KEYS */;
INSERT INTO `sys_menu_visit_log` VALUES (1,'2018-05-21 11:08:36',9,'2018-05-21 11:08:36','2018-05-21 11:08:36'),(2,'2018-05-21 11:20:30',11,'2018-05-21 11:20:30','2018-05-21 11:20:30'),(3,'2018-05-21 14:04:46',9,'2018-05-21 14:04:46','2018-05-21 14:04:46'),(4,'2018-05-21 14:20:39',9,'2018-05-21 14:20:39','2018-05-21 14:20:39'),(5,'2018-05-21 14:24:15',9,'2018-05-21 14:24:15','2018-05-21 14:24:15'),(6,'2018-05-21 14:50:51',11,'2018-05-21 14:50:51','2018-05-21 14:50:51'),(7,'2018-05-21 15:16:56',9,'2018-05-21 15:16:56','2018-05-21 15:16:56'),(8,'2018-05-21 15:17:02',9,'2018-05-21 15:17:02','2018-05-21 15:17:02'),(9,'2018-05-21 15:17:30',9,'2018-05-21 15:17:30','2018-05-21 15:17:30'),(10,'2018-05-21 15:25:22',9,'2018-05-21 15:25:22','2018-05-21 15:25:22'),(11,'2018-05-21 15:30:41',9,'2018-05-21 15:30:41','2018-05-21 15:30:41'),(12,'2018-05-21 15:33:06',9,'2018-05-21 15:33:06','2018-05-21 15:33:06'),(13,'2018-05-21 15:55:24',9,'2018-05-21 15:55:24','2018-05-21 15:55:24'),(14,'2018-05-21 15:55:59',9,'2018-05-21 15:55:59','2018-05-21 15:55:59'),(15,'2018-05-21 15:56:25',9,'2018-05-21 15:56:25','2018-05-21 15:56:25'),(16,'2018-05-21 16:00:48',9,'2018-05-21 16:00:48','2018-05-21 16:00:48'),(17,'2018-05-21 16:08:05',9,'2018-05-21 16:08:05','2018-05-21 16:08:05'),(18,'2018-05-21 16:08:56',11,'2018-05-21 16:08:56','2018-05-21 16:08:56'),(19,'2018-05-21 16:17:59',9,'2018-05-21 16:17:59','2018-05-21 16:17:59'),(20,'2018-05-21 16:18:34',9,'2018-05-21 16:18:34','2018-05-21 16:18:34'),(21,'2018-05-21 16:22:08',9,'2018-05-21 16:22:08','2018-05-21 16:22:08'),(22,'2018-05-21 16:23:23',11,'2018-05-21 16:23:23','2018-05-21 16:23:23'),(23,'2018-05-21 16:36:04',9,'2018-05-21 16:36:04','2018-05-21 16:36:04'),(24,'2018-05-21 16:36:05',11,'2018-05-21 16:36:05','2018-05-21 16:36:05'),(25,'2018-05-21 17:17:27',9,'2018-05-21 17:17:27','2018-05-21 17:17:27'),(26,'2018-05-21 17:17:31',17,'2018-05-21 17:17:31','2018-05-21 17:17:30'),(27,'2018-05-21 17:19:32',17,'2018-05-21 17:19:32','2018-05-21 17:19:32'),(28,'2018-05-21 17:24:14',17,'2018-05-21 17:24:14','2018-05-21 17:24:14'),(29,'2018-05-21 17:38:28',11,'2018-05-21 17:38:28','2018-05-21 17:38:28'),(30,'2018-05-21 17:38:39',17,'2018-05-21 17:38:39','2018-05-21 17:38:39'),(31,'2018-05-21 18:19:32',9,'2018-05-21 18:19:32','2018-05-21 18:19:32'),(32,'2018-05-21 18:27:07',9,'2018-05-21 18:27:07','2018-05-21 18:27:07'),(33,'2018-05-21 18:31:37',11,'2018-05-21 18:31:37','2018-05-21 18:31:37'),(34,'2018-05-21 18:39:53',11,'2018-05-21 18:39:53','2018-05-21 18:39:53'),(35,'2018-05-21 18:40:00',9,'2018-05-21 18:40:00','2018-05-21 18:40:00'),(36,'2018-05-21 18:41:22',9,'2018-05-21 18:41:22','2018-05-21 18:41:22'),(37,'2018-05-21 18:41:29',11,'2018-05-21 18:41:29','2018-05-21 18:41:29'),(38,'2018-05-22 09:14:17',9,'2018-05-22 09:14:17','2018-05-22 09:14:17'),(39,'2018-05-22 09:14:28',11,'2018-05-22 09:14:28','2018-05-22 09:14:28'),(40,'2018-05-22 10:07:33',11,'2018-05-22 10:07:33','2018-05-22 10:07:33'),(41,'2018-05-22 10:13:21',11,'2018-05-22 10:13:21','2018-05-22 10:13:21'),(42,'2018-05-22 10:23:30',9,'2018-05-22 10:23:30','2018-05-22 10:23:30'),(43,'2018-05-22 10:23:31',11,'2018-05-22 10:23:31','2018-05-22 10:23:31'),(44,'2018-05-22 10:31:30',11,'2018-05-22 10:31:30','2018-05-22 10:31:30'),(45,'2018-05-22 10:31:42',11,'2018-05-22 10:31:42','2018-05-22 10:31:42'),(46,'2018-05-22 10:43:35',11,'2018-05-22 10:43:35','2018-05-22 10:43:35'),(47,'2018-05-22 11:08:01',9,'2018-05-22 11:08:01','2018-05-22 11:08:01'),(48,'2018-05-22 11:08:08',11,'2018-05-22 11:08:08','2018-05-22 11:08:08'),(49,'2018-05-22 11:11:13',9,'2018-05-22 11:11:13','2018-05-22 11:11:13'),(50,'2018-05-22 11:11:17',17,'2018-05-22 11:11:17','2018-05-22 11:11:17'),(51,'2018-05-22 11:14:38',9,'2018-05-22 11:14:38','2018-05-22 11:14:38'),(52,'2018-05-22 11:14:42',11,'2018-05-22 11:14:42','2018-05-22 11:14:42'),(53,'2018-05-22 11:14:47',17,'2018-05-22 11:14:47','2018-05-22 11:14:47'),(54,'2018-05-22 11:24:52',8,'2018-05-22 11:24:52','2018-05-22 11:24:52'),(55,'2018-05-22 11:24:53',17,'2018-05-22 11:24:53','2018-05-22 11:24:53'),(56,'2018-05-22 11:25:56',17,'2018-05-22 11:25:56','2018-05-22 11:25:55'),(57,'2018-05-22 11:52:08',11,'2018-05-22 11:52:08','2018-05-22 11:52:08'),(58,'2018-05-22 13:50:29',9,'2018-05-22 13:50:29','2018-05-22 13:50:29'),(59,'2018-05-22 14:02:25',9,'2018-05-22 14:02:25','2018-05-22 14:02:25'),(60,'2018-05-22 14:13:55',9,'2018-05-22 14:13:55','2018-05-22 14:13:54'),(61,'2018-05-22 14:23:36',9,'2018-05-22 14:23:36','2018-05-22 14:23:36'),(62,'2018-05-22 14:29:27',11,'2018-05-22 14:29:27','2018-05-22 14:29:27'),(63,'2018-05-22 14:36:38',9,'2018-05-22 14:36:38','2018-05-22 14:36:37'),(64,'2018-05-22 14:36:42',11,'2018-05-22 14:36:42','2018-05-22 14:36:42'),(65,'2018-05-22 14:36:45',17,'2018-05-22 14:36:45','2018-05-22 14:36:45'),(66,'2018-05-22 14:36:52',16,'2018-05-22 14:36:52','2018-05-22 14:36:52'),(67,'2018-05-22 14:36:56',9,'2018-05-22 14:36:56','2018-05-22 14:36:56'),(68,'2018-05-22 14:36:59',11,'2018-05-22 14:36:59','2018-05-22 14:36:59'),(69,'2018-05-22 14:37:01',9,'2018-05-22 14:37:01','2018-05-22 14:37:01'),(70,'2018-05-22 14:37:03',11,'2018-05-22 14:37:03','2018-05-22 14:37:03'),(71,'2018-05-22 14:37:14',11,'2018-05-22 14:37:14','2018-05-22 14:37:14'),(72,'2018-05-22 14:41:52',13,'2018-05-22 14:41:52','2018-05-22 14:41:52'),(73,'2018-05-22 16:18:54',9,'2018-05-22 16:18:54','2018-05-22 16:18:54'),(74,'2018-05-22 16:19:07',9,'2018-05-22 16:19:07','2018-05-22 16:19:07'),(75,'2018-05-22 16:19:12',17,'2018-05-22 16:19:12','2018-05-22 16:19:12'),(76,'2018-05-22 16:19:20',13,'2018-05-22 16:19:20','2018-05-22 16:19:20'),(77,'2018-05-22 16:33:35',13,'2018-05-22 16:33:35','2018-05-22 16:33:35'),(78,'2018-05-22 16:38:33',9,'2018-05-22 16:38:33','2018-05-22 16:38:33'),(79,'2018-05-22 16:38:35',11,'2018-05-22 16:38:35','2018-05-22 16:38:35'),(80,'2018-05-22 16:38:36',13,'2018-05-22 16:38:36','2018-05-22 16:38:36'),(81,'2018-05-22 16:40:43',13,'2018-05-22 16:40:43','2018-05-22 16:40:43'),(82,'2018-05-22 16:42:33',13,'2018-05-22 16:42:33','2018-05-22 16:42:33'),(83,'2018-05-22 16:42:35',13,'2018-05-22 16:42:35','2018-05-22 16:42:35'),(84,'2018-05-22 17:14:58',13,'2018-05-22 17:14:58','2018-05-22 17:14:58'),(85,'2018-05-22 17:17:12',9,'2018-05-22 17:17:12','2018-05-22 17:17:12'),(86,'2018-05-22 17:17:14',11,'2018-05-22 17:17:14','2018-05-22 17:17:14'),(87,'2018-05-22 17:17:17',13,'2018-05-22 17:17:17','2018-05-22 17:17:17'),(88,'2018-05-22 17:17:18',11,'2018-05-22 17:17:18','2018-05-22 17:17:18'),(89,'2018-05-22 17:17:19',13,'2018-05-22 17:17:19','2018-05-22 17:17:19'),(90,'2018-05-22 17:17:20',11,'2018-05-22 17:17:20','2018-05-22 17:17:20'),(91,'2018-05-22 17:17:22',13,'2018-05-22 17:17:22','2018-05-22 17:17:22'),(92,'2018-05-22 17:17:23',11,'2018-05-22 17:17:23','2018-05-22 17:17:23'),(93,'2018-05-22 17:17:24',13,'2018-05-22 17:17:24','2018-05-22 17:17:24'),(94,'2018-05-22 17:17:28',13,'2018-05-22 17:17:28','2018-05-22 17:17:28'),(95,'2018-05-22 17:17:30',17,'2018-05-22 17:17:30','2018-05-22 17:17:30'),(96,'2018-05-22 17:17:32',9,'2018-05-22 17:17:32','2018-05-22 17:17:32'),(97,'2018-05-22 17:17:33',11,'2018-05-22 17:17:33','2018-05-22 17:17:33'),(98,'2018-05-22 17:17:34',13,'2018-05-22 17:17:34','2018-05-22 17:17:34'),(99,'2018-05-22 17:17:38',17,'2018-05-22 17:17:38','2018-05-22 17:17:38'),(100,'2018-05-22 17:25:40',13,'2018-05-22 17:25:40','2018-05-22 17:25:40'),(101,'2018-05-22 22:20:40',13,'2018-05-22 22:20:40','2018-05-22 22:20:39'),(102,'2018-05-22 22:29:36',17,'2018-05-22 22:29:36','2018-05-22 22:29:36'),(103,'2018-05-22 23:10:53',9,'2018-05-22 23:10:53','2018-05-22 23:10:50'),(104,'2018-05-22 23:10:59',11,'2018-05-22 23:10:59','2018-05-22 23:10:59'),(105,'2018-05-22 23:11:20',11,'2018-05-22 23:11:20','2018-05-22 23:11:20'),(106,'2018-05-22 23:11:21',9,'2018-05-22 23:11:21','2018-05-22 23:11:21');
/*!40000 ALTER TABLE `sys_menu_visit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'2018-05-21 17:42:41','2018-05-22 13:50:16','超级管理员'),(2,'2018-05-21 17:42:54','2018-05-22 13:50:16','系统维护管理员'),(3,'2018-05-21 17:45:12','2018-05-22 13:50:16','映射管理员'),(4,'2018-05-21 17:45:35','2018-05-22 13:50:16','工作流管理员'),(5,'2018-05-22 23:11:13','2018-05-22 23:11:13','');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `ENTITY_CODE` varchar(255) NOT NULL,
  `SEQUENCE_NO` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ENTITY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
INSERT INTO `sys_sequence` VALUES ('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.Admin',12),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.Menu',392),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.MenuRole',53),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.MenuVisitLog',106),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.Role',5);
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LOGIN_ACCOUNT_NO` int(11) DEFAULT NULL,
  `LOGIN_PASSWORD` int(11) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xtconstant`
--

DROP TABLE IF EXISTS `xtconstant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xtconstant` (
  `是否标志Y` int(11) NOT NULL,
  `是否标志X` int(11) DEFAULT NULL,
  PRIMARY KEY (`是否标志Y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xtconstant`
--

LOCK TABLES `xtconstant` WRITE;
/*!40000 ALTER TABLE `xtconstant` DISABLE KEYS */;
/*!40000 ALTER TABLE `xtconstant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-22 23:39:43
