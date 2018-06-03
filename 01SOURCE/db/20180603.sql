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
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin`
--

LOCK TABLES `sys_admin` WRITE;
/*!40000 ALTER TABLE `sys_admin` DISABLE KEYS */;
INSERT INTO `sys_admin` VALUES (1,'2018-05-22 17:26:06','admin','c9130efba1317c16406d67270f657af3','2018-05-27 22:00:04','1',3),(2,'2018-05-22 17:27:27','liulei','acecf2a66d8bb46d6a9bfaae192b3438','2018-05-27 22:02:48','0',4),(3,'2018-05-22 17:28:17','super','ed2b5c0139cec8ad2873829dc1117d50','2018-05-27 16:52:13','1',4);
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
INSERT INTO `sys_code` VALUES (1,'YesOrNo','1','ÊòØ',NULL,1,'2018-05-27 22:22:08','','','',''),(2,'YesOrNo','0','Âê¶',NULL,2,'2018-05-27 22:22:08','','','','');
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
-- Table structure for table `sys_extend_property`
--

DROP TABLE IF EXISTS `sys_extend_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_extend_property` (
  `ID` bigint(20) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `QUERY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_extend_property`
--

LOCK TABLES `sys_extend_property` WRITE;
/*!40000 ALTER TABLE `sys_extend_property` DISABLE KEYS */;
INSERT INTO `sys_extend_property` VALUES (1,'YesOrNo',NULL,'2018-05-27 22:04:27','ÊòØÂê¶Ê†áÂøó','SELECT code ,CODE_NAME,\'\' as filter FROM test.sys_code order by display_sn'),(3,'Role','2018-05-27 16:34:49','2018-05-27 22:04:27','ËßíËâ≤','SELECT id,NAME,\'\' as filter FROM sys_role');
/*!40000 ALTER TABLE `sys_extend_property` ENABLE KEYS */;
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
  `IS_CROSS_DOMAIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'2018-05-14 18:26:02',1,'',NULL,'Êò†Â∞ÑÁÆ°ÁêÜ',0,1,NULL),(2,'2018-04-05 20:08:18',2,'',NULL,'‰ªìÂ∫ìÊò†Â∞Ñ',1,3,NULL),(3,'2018-04-05 20:08:40',2,'',NULL,'ÁªÑÂêàÊò†Â∞Ñ',1,4,NULL),(4,'2018-04-05 20:09:04',1,'',NULL,'Â∑•‰ΩúÊµÅÁÆ°ÁêÜ',0,2,NULL),(5,'2018-04-05 20:09:24',2,'',NULL,'ÂèòÈáèÁÆ°ÁêÜ',4,1,NULL),(6,'2018-04-05 20:09:35',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/process-list','2018-06-03 01:21:13','ÊµÅÁ®ãÁÆ°ÁêÜ',4,3,'true'),(7,'2018-04-05 20:09:44',2,'',NULL,'ËäÇÁÇπÁÆ°ÁêÜ',4,2,NULL),(8,'2018-04-27 15:33:08',2,'/template/sys/assistant/generateEntity',NULL,'ÂÆû‰ΩìÊò†Â∞ÑÔºàÊï∞ÊçÆÂ∫ìÔºâ',1,1,NULL),(9,'2018-04-09 23:19:03',2,'/template/sys/menu/menu',NULL,'ËèúÂçïÁÆ°ÁêÜ',15,1,NULL),(11,'2018-04-09 23:47:46',2,'/template/sys/role/role',NULL,'ËßíËâ≤ÁÆ°ÁêÜ',15,2,NULL),(12,'2018-04-09 23:48:22',2,'',NULL,'ÊùÉÈôêÁÆ°ÁêÜ',15,3,NULL),(13,'2018-04-09 23:50:10',2,'/template/sys/admin/admin','2018-05-22 14:30:15','Êìç‰ΩúÂëòÁÆ°ÁêÜ',15,4,NULL),(14,'2018-04-09 23:50:19',2,'',NULL,'ÁªÑÁªáÁÆ°ÁêÜ',15,5,NULL),(15,'2018-04-23 17:34:11',1,'',NULL,'Á≥ªÁªüÁª¥Êä§',0,0,NULL),(16,'2018-04-23 17:36:34',2,'/template/sys/config/entityFilterParamConfig',NULL,'ÂÆû‰ΩìËøáÊª§Â≠ó',1,5,NULL),(17,'2018-04-27 15:43:48',2,'/template/sys/assistant/generateEntityOom',NULL,'ÂÆû‰ΩìÊò†Â∞ÑÔºàoomÔºâ',1,0,NULL),(393,'2018-05-26 21:45:15',2,'/template/sys/extendproperty/extendproperty','2018-05-26 21:56:22','Êâ©Â±ïÂ±ûÊÄß',15,10,NULL),(394,'2018-05-26 21:45:43',2,'/template/sys/code/code','2018-05-27 22:13:24','Á≥ªÁªü‰ª£Á†Å',15,15,NULL),(395,'2018-06-03 17:04:19',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/model-list','2018-06-03 17:04:19','Ê®°ÂùóÁÆ°ÁêÜ',4,NULL,'true');
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
INSERT INTO `sys_menu_role` VALUES (40,'2018-05-22 11:08:38',0,'2018-05-22 11:08:38',1),(41,'2018-05-22 11:08:38',1,'2018-05-22 11:08:38',1),(42,'2018-05-22 11:08:38',17,'2018-05-22 11:08:38',1),(43,'2018-05-22 11:08:38',8,'2018-05-22 11:08:38',1),(44,'2018-05-22 11:08:38',2,'2018-05-22 11:08:38',1),(45,'2018-05-22 11:08:38',3,'2018-05-22 11:08:38',1),(46,'2018-05-22 11:08:38',16,'2018-05-22 11:08:38',1),(47,'2018-05-22 11:08:38',4,'2018-05-22 11:08:38',1),(48,'2018-05-22 11:08:38',5,'2018-05-22 11:08:38',1),(49,'2018-05-22 11:08:38',7,'2018-05-22 11:08:38',1),(50,'2018-05-22 11:08:38',6,'2018-05-22 11:08:38',1),(51,'2018-05-22 11:08:50',0,'2018-05-22 11:08:50',3),(52,'2018-05-22 11:08:50',15,'2018-05-22 11:08:50',3),(53,'2018-05-22 11:08:50',9,'2018-05-22 11:08:50',3),(54,'2018-05-27 21:14:18',0,'2018-05-27 21:14:18',2),(55,'2018-05-27 21:14:18',15,'2018-05-27 21:14:18',2),(56,'2018-05-27 21:14:18',1,'2018-05-27 21:14:18',2),(57,'2018-05-27 21:14:18',4,'2018-05-27 21:14:18',2);
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
INSERT INTO `sys_menu_visit_log` VALUES (1,'2018-05-21 11:08:36',9,'2018-05-21 11:08:36','2018-05-21 11:08:36'),(2,'2018-05-21 11:20:30',11,'2018-05-21 11:20:30','2018-05-21 11:20:30'),(3,'2018-05-21 14:04:46',9,'2018-05-21 14:04:46','2018-05-21 14:04:46'),(4,'2018-05-21 14:20:39',9,'2018-05-21 14:20:39','2018-05-21 14:20:39'),(5,'2018-05-21 14:24:15',9,'2018-05-21 14:24:15','2018-05-21 14:24:15'),(6,'2018-05-21 14:50:51',11,'2018-05-21 14:50:51','2018-05-21 14:50:51'),(7,'2018-05-21 15:16:56',9,'2018-05-21 15:16:56','2018-05-21 15:16:56'),(8,'2018-05-21 15:17:02',9,'2018-05-21 15:17:02','2018-05-21 15:17:02'),(9,'2018-05-21 15:17:30',9,'2018-05-21 15:17:30','2018-05-21 15:17:30'),(10,'2018-05-21 15:25:22',9,'2018-05-21 15:25:22','2018-05-21 15:25:22'),(11,'2018-05-21 15:30:41',9,'2018-05-21 15:30:41','2018-05-21 15:30:41'),(12,'2018-05-21 15:33:06',9,'2018-05-21 15:33:06','2018-05-21 15:33:06'),(13,'2018-05-21 15:55:24',9,'2018-05-21 15:55:24','2018-05-21 15:55:24'),(14,'2018-05-21 15:55:59',9,'2018-05-21 15:55:59','2018-05-21 15:55:59'),(15,'2018-05-21 15:56:25',9,'2018-05-21 15:56:25','2018-05-21 15:56:25'),(16,'2018-05-21 16:00:48',9,'2018-05-21 16:00:48','2018-05-21 16:00:48'),(17,'2018-05-21 16:08:05',9,'2018-05-21 16:08:05','2018-05-21 16:08:05'),(18,'2018-05-21 16:08:56',11,'2018-05-21 16:08:56','2018-05-21 16:08:56'),(19,'2018-05-21 16:17:59',9,'2018-05-21 16:17:59','2018-05-21 16:17:59'),(20,'2018-05-21 16:18:34',9,'2018-05-21 16:18:34','2018-05-21 16:18:34'),(21,'2018-05-21 16:22:08',9,'2018-05-21 16:22:08','2018-05-21 16:22:08'),(22,'2018-05-21 16:23:23',11,'2018-05-21 16:23:23','2018-05-21 16:23:23'),(23,'2018-05-21 16:36:04',9,'2018-05-21 16:36:04','2018-05-21 16:36:04'),(24,'2018-05-21 16:36:05',11,'2018-05-21 16:36:05','2018-05-21 16:36:05'),(25,'2018-05-21 17:17:27',9,'2018-05-21 17:17:27','2018-05-21 17:17:27'),(26,'2018-05-21 17:17:31',17,'2018-05-21 17:17:31','2018-05-21 17:17:30'),(27,'2018-05-21 17:19:32',17,'2018-05-21 17:19:32','2018-05-21 17:19:32'),(28,'2018-05-21 17:24:14',17,'2018-05-21 17:24:14','2018-05-21 17:24:14'),(29,'2018-05-21 17:38:28',11,'2018-05-21 17:38:28','2018-05-21 17:38:28'),(30,'2018-05-21 17:38:39',17,'2018-05-21 17:38:39','2018-05-21 17:38:39'),(31,'2018-05-21 18:19:32',9,'2018-05-21 18:19:32','2018-05-21 18:19:32'),(32,'2018-05-21 18:27:07',9,'2018-05-21 18:27:07','2018-05-21 18:27:07'),(33,'2018-05-21 18:31:37',11,'2018-05-21 18:31:37','2018-05-21 18:31:37'),(34,'2018-05-21 18:39:53',11,'2018-05-21 18:39:53','2018-05-21 18:39:53'),(35,'2018-05-21 18:40:00',9,'2018-05-21 18:40:00','2018-05-21 18:40:00'),(36,'2018-05-21 18:41:22',9,'2018-05-21 18:41:22','2018-05-21 18:41:22'),(37,'2018-05-21 18:41:29',11,'2018-05-21 18:41:29','2018-05-21 18:41:29'),(38,'2018-05-22 09:14:17',9,'2018-05-22 09:14:17','2018-05-22 09:14:17'),(39,'2018-05-22 09:14:28',11,'2018-05-22 09:14:28','2018-05-22 09:14:28'),(40,'2018-05-22 10:07:33',11,'2018-05-22 10:07:33','2018-05-22 10:07:33'),(41,'2018-05-22 10:13:21',11,'2018-05-22 10:13:21','2018-05-22 10:13:21'),(42,'2018-05-22 10:23:30',9,'2018-05-22 10:23:30','2018-05-22 10:23:30'),(43,'2018-05-22 10:23:31',11,'2018-05-22 10:23:31','2018-05-22 10:23:31'),(44,'2018-05-22 10:31:30',11,'2018-05-22 10:31:30','2018-05-22 10:31:30'),(45,'2018-05-22 10:31:42',11,'2018-05-22 10:31:42','2018-05-22 10:31:42'),(46,'2018-05-22 10:43:35',11,'2018-05-22 10:43:35','2018-05-22 10:43:35'),(47,'2018-05-22 11:08:01',9,'2018-05-22 11:08:01','2018-05-22 11:08:01'),(48,'2018-05-22 11:08:08',11,'2018-05-22 11:08:08','2018-05-22 11:08:08'),(49,'2018-05-22 11:11:13',9,'2018-05-22 11:11:13','2018-05-22 11:11:13'),(50,'2018-05-22 11:11:17',17,'2018-05-22 11:11:17','2018-05-22 11:11:17'),(51,'2018-05-22 11:14:38',9,'2018-05-22 11:14:38','2018-05-22 11:14:38'),(52,'2018-05-22 11:14:42',11,'2018-05-22 11:14:42','2018-05-22 11:14:42'),(53,'2018-05-22 11:14:47',17,'2018-05-22 11:14:47','2018-05-22 11:14:47'),(54,'2018-05-22 11:24:52',8,'2018-05-22 11:24:52','2018-05-22 11:24:52'),(55,'2018-05-22 11:24:53',17,'2018-05-22 11:24:53','2018-05-22 11:24:53'),(56,'2018-05-22 11:25:56',17,'2018-05-22 11:25:56','2018-05-22 11:25:55'),(57,'2018-05-22 11:52:08',11,'2018-05-22 11:52:08','2018-05-22 11:52:08'),(58,'2018-05-22 13:50:29',9,'2018-05-22 13:50:29','2018-05-22 13:50:29'),(59,'2018-05-22 14:02:25',9,'2018-05-22 14:02:25','2018-05-22 14:02:25'),(60,'2018-05-22 14:13:55',9,'2018-05-22 14:13:55','2018-05-22 14:13:54'),(61,'2018-05-22 14:23:36',9,'2018-05-22 14:23:36','2018-05-22 14:23:36'),(62,'2018-05-22 14:29:27',11,'2018-05-22 14:29:27','2018-05-22 14:29:27'),(63,'2018-05-22 14:36:38',9,'2018-05-22 14:36:38','2018-05-22 14:36:37'),(64,'2018-05-22 14:36:42',11,'2018-05-22 14:36:42','2018-05-22 14:36:42'),(65,'2018-05-22 14:36:45',17,'2018-05-22 14:36:45','2018-05-22 14:36:45'),(66,'2018-05-22 14:36:52',16,'2018-05-22 14:36:52','2018-05-22 14:36:52'),(67,'2018-05-22 14:36:56',9,'2018-05-22 14:36:56','2018-05-22 14:36:56'),(68,'2018-05-22 14:36:59',11,'2018-05-22 14:36:59','2018-05-22 14:36:59'),(69,'2018-05-22 14:37:01',9,'2018-05-22 14:37:01','2018-05-22 14:37:01'),(70,'2018-05-22 14:37:03',11,'2018-05-22 14:37:03','2018-05-22 14:37:03'),(71,'2018-05-22 14:37:14',11,'2018-05-22 14:37:14','2018-05-22 14:37:14'),(72,'2018-05-22 14:41:52',13,'2018-05-22 14:41:52','2018-05-22 14:41:52'),(73,'2018-05-22 16:18:54',9,'2018-05-22 16:18:54','2018-05-22 16:18:54'),(74,'2018-05-22 16:19:07',9,'2018-05-22 16:19:07','2018-05-22 16:19:07'),(75,'2018-05-22 16:19:12',17,'2018-05-22 16:19:12','2018-05-22 16:19:12'),(76,'2018-05-22 16:19:20',13,'2018-05-22 16:19:20','2018-05-22 16:19:20'),(77,'2018-05-22 16:33:35',13,'2018-05-22 16:33:35','2018-05-22 16:33:35'),(78,'2018-05-22 16:38:33',9,'2018-05-22 16:38:33','2018-05-22 16:38:33'),(79,'2018-05-22 16:38:35',11,'2018-05-22 16:38:35','2018-05-22 16:38:35'),(80,'2018-05-22 16:38:36',13,'2018-05-22 16:38:36','2018-05-22 16:38:36'),(81,'2018-05-22 16:40:43',13,'2018-05-22 16:40:43','2018-05-22 16:40:43'),(82,'2018-05-22 16:42:33',13,'2018-05-22 16:42:33','2018-05-22 16:42:33'),(83,'2018-05-22 16:42:35',13,'2018-05-22 16:42:35','2018-05-22 16:42:35'),(84,'2018-05-22 17:14:58',13,'2018-05-22 17:14:58','2018-05-22 17:14:58'),(85,'2018-05-22 17:17:12',9,'2018-05-22 17:17:12','2018-05-22 17:17:12'),(86,'2018-05-22 17:17:14',11,'2018-05-22 17:17:14','2018-05-22 17:17:14'),(87,'2018-05-22 17:17:17',13,'2018-05-22 17:17:17','2018-05-22 17:17:17'),(88,'2018-05-22 17:17:18',11,'2018-05-22 17:17:18','2018-05-22 17:17:18'),(89,'2018-05-22 17:17:19',13,'2018-05-22 17:17:19','2018-05-22 17:17:19'),(90,'2018-05-22 17:17:20',11,'2018-05-22 17:17:20','2018-05-22 17:17:20'),(91,'2018-05-22 17:17:22',13,'2018-05-22 17:17:22','2018-05-22 17:17:22'),(92,'2018-05-22 17:17:23',11,'2018-05-22 17:17:23','2018-05-22 17:17:23'),(93,'2018-05-22 17:17:24',13,'2018-05-22 17:17:24','2018-05-22 17:17:24'),(94,'2018-05-22 17:17:28',13,'2018-05-22 17:17:28','2018-05-22 17:17:28'),(95,'2018-05-22 17:17:30',17,'2018-05-22 17:17:30','2018-05-22 17:17:30'),(96,'2018-05-22 17:17:32',9,'2018-05-22 17:17:32','2018-05-22 17:17:32'),(97,'2018-05-22 17:17:33',11,'2018-05-22 17:17:33','2018-05-22 17:17:33'),(98,'2018-05-22 17:17:34',13,'2018-05-22 17:17:34','2018-05-22 17:17:34'),(99,'2018-05-22 17:17:38',17,'2018-05-22 17:17:38','2018-05-22 17:17:38'),(100,'2018-05-22 17:25:40',13,'2018-05-22 17:25:40','2018-05-22 17:25:40'),(101,'2018-05-22 22:20:40',13,'2018-05-22 22:20:40','2018-05-22 22:20:39'),(102,'2018-05-22 22:29:36',17,'2018-05-22 22:29:36','2018-05-22 22:29:36'),(103,'2018-05-22 23:10:53',9,'2018-05-22 23:10:53','2018-05-22 23:10:50'),(104,'2018-05-22 23:10:59',11,'2018-05-22 23:10:59','2018-05-22 23:10:59'),(105,'2018-05-22 23:11:20',11,'2018-05-22 23:11:20','2018-05-22 23:11:20'),(106,'2018-05-22 23:11:21',9,'2018-05-22 23:11:21','2018-05-22 23:11:21'),(107,'2018-05-23 23:08:05',9,'2018-05-23 23:08:05','2018-05-23 23:08:05'),(108,'2018-05-23 23:08:12',11,'2018-05-23 23:08:12','2018-05-23 23:08:12'),(109,'2018-05-23 23:08:13',13,'2018-05-23 23:08:13','2018-05-23 23:08:13'),(110,'2018-05-24 23:11:34',13,'2018-05-24 23:11:34','2018-05-24 23:11:33'),(111,'2018-05-26 19:50:38',13,'2018-05-26 19:50:38','2018-05-26 19:50:37'),(112,'2018-05-26 19:50:52',13,'2018-05-26 19:50:52','2018-05-26 19:50:52'),(113,'2018-05-26 19:59:42',17,'2018-05-26 19:59:42','2018-05-26 19:59:42'),(114,'2018-05-26 21:13:38',13,'2018-05-26 21:13:38','2018-05-26 21:13:38'),(115,'2018-05-26 21:40:54',13,'2018-05-26 21:40:54','2018-05-26 21:40:54'),(116,'2018-05-26 21:44:32',9,'2018-05-26 21:44:32','2018-05-26 21:44:32'),(117,'2018-05-26 21:45:48',393,'2018-05-26 21:45:48','2018-05-26 21:45:48'),(118,'2018-05-26 21:45:49',394,'2018-05-26 21:45:49','2018-05-26 21:45:49'),(119,'2018-05-26 21:45:50',393,'2018-05-26 21:45:50','2018-05-26 21:45:50'),(120,'2018-05-26 21:46:14',13,'2018-05-26 21:46:14','2018-05-26 21:46:14'),(121,'2018-05-26 21:46:18',11,'2018-05-26 21:46:18','2018-05-26 21:46:18'),(122,'2018-05-26 21:50:56',9,'2018-05-26 21:50:56','2018-05-26 21:50:56'),(123,'2018-05-26 21:56:40',393,'2018-05-26 21:56:40','2018-05-26 21:56:40'),(124,'2018-05-26 21:57:19',393,'2018-05-26 21:57:19','2018-05-26 21:57:19'),(125,'2018-05-26 21:58:26',394,'2018-05-26 21:58:26','2018-05-26 21:58:25'),(126,'2018-05-26 21:59:11',393,'2018-05-26 21:59:11','2018-05-26 21:59:11'),(127,'2018-05-26 22:04:03',11,'2018-05-26 22:04:03','2018-05-26 22:04:03'),(128,'2018-05-26 22:04:17',393,'2018-05-26 22:04:17','2018-05-26 22:04:17'),(129,'2018-05-26 22:04:20',394,'2018-05-26 22:04:20','2018-05-26 22:04:20'),(130,'2018-05-27 16:22:18',13,'2018-05-27 16:22:18','2018-05-27 16:22:18'),(131,'2018-05-27 16:45:01',13,'2018-05-27 16:45:01','2018-05-27 16:45:01'),(132,'2018-05-27 16:51:19',13,'2018-05-27 16:51:19','2018-05-27 16:51:19'),(133,'2018-05-27 16:57:23',13,'2018-05-27 16:57:23','2018-05-27 16:57:23'),(134,'2018-05-27 21:13:32',394,'2018-05-27 21:13:32','2018-05-27 21:13:32'),(135,'2018-05-27 21:13:33',9,'2018-05-27 21:13:33','2018-05-27 21:13:33'),(136,'2018-05-27 21:13:34',11,'2018-05-27 21:13:34','2018-05-27 21:13:34'),(137,'2018-05-27 21:13:36',13,'2018-05-27 21:13:36','2018-05-27 21:13:36'),(138,'2018-05-27 21:13:42',393,'2018-05-27 21:13:42','2018-05-27 21:13:42'),(139,'2018-05-27 21:13:43',394,'2018-05-27 21:13:43','2018-05-27 21:13:43'),(140,'2018-05-27 21:14:55',13,'2018-05-27 21:14:55','2018-05-27 21:14:55'),(141,'2018-05-27 21:32:33',13,'2018-05-27 21:32:33','2018-05-27 21:32:33'),(142,'2018-05-27 21:37:43',13,'2018-05-27 21:37:43','2018-05-27 21:37:43'),(143,'2018-05-27 21:41:03',13,'2018-05-27 21:41:03','2018-05-27 21:41:03'),(144,'2018-05-27 22:02:51',11,'2018-05-27 22:02:51','2018-05-27 22:02:51'),(145,'2018-05-27 22:03:02',13,'2018-05-27 22:03:02','2018-05-27 22:03:02'),(146,'2018-05-27 22:03:07',9,'2018-05-27 22:03:07','2018-05-27 22:03:07'),(147,'2018-05-27 22:03:26',11,'2018-05-27 22:03:26','2018-05-27 22:03:26'),(148,'2018-05-27 22:03:28',13,'2018-05-27 22:03:28','2018-05-27 22:03:28'),(149,'2018-05-27 22:03:30',393,'2018-05-27 22:03:30','2018-05-27 22:03:30'),(150,'2018-05-27 22:04:43',394,'2018-05-27 22:04:43','2018-05-27 22:04:43'),(151,'2018-05-27 22:04:49',17,'2018-05-27 22:04:49','2018-05-27 22:04:48'),(152,'2018-05-27 22:13:10',9,'2018-05-27 22:13:10','2018-05-27 22:13:09'),(153,'2018-05-27 22:13:30',394,'2018-05-27 22:13:30','2018-05-27 22:13:30'),(154,'2018-05-27 22:14:05',394,'2018-05-27 22:14:05','2018-05-27 22:14:05'),(155,'2018-05-27 22:19:41',13,'2018-05-27 22:19:41','2018-05-27 22:19:41'),(156,'2018-05-27 22:23:12',9,'2018-05-27 22:23:12','2018-05-27 22:23:12'),(157,'2018-05-27 22:23:16',11,'2018-05-27 22:23:16','2018-05-27 22:23:16'),(158,'2018-05-27 22:23:21',13,'2018-05-27 22:23:21','2018-05-27 22:23:21'),(159,'2018-05-27 22:23:24',393,'2018-05-27 22:23:24','2018-05-27 22:23:24'),(160,'2018-05-27 22:23:26',394,'2018-05-27 22:23:26','2018-05-27 22:23:26'),(161,'2018-05-27 22:23:30',394,'2018-05-27 22:23:30','2018-05-27 22:23:30'),(162,'2018-05-27 22:25:02',13,'2018-05-27 22:25:02','2018-05-27 22:25:02'),(163,'2018-05-27 22:25:18',17,'2018-05-27 22:25:18','2018-05-27 22:25:18'),(164,'2018-05-27 22:25:20',8,'2018-05-27 22:25:20','2018-05-27 22:25:20'),(165,'2018-05-27 22:25:26',16,'2018-05-27 22:25:26','2018-05-27 22:25:26'),(166,'2018-06-03 01:14:18',9,'2018-06-03 01:14:18','2018-06-03 01:14:18'),(167,'2018-06-03 01:16:35',6,'2018-06-03 01:16:35','2018-06-03 01:16:35'),(168,'2018-06-03 01:16:54',6,'2018-06-03 01:16:54','2018-06-03 01:16:54'),(169,'2018-06-03 01:17:17',6,'2018-06-03 01:17:17','2018-06-03 01:17:17'),(170,'2018-06-03 01:17:39',9,'2018-06-03 01:17:39','2018-06-03 01:17:39'),(171,'2018-06-03 01:18:27',6,'2018-06-03 01:18:27','2018-06-03 01:18:27'),(172,'2018-06-03 01:18:38',6,'2018-06-03 01:18:38','2018-06-03 01:18:38'),(173,'2018-06-03 01:18:40',9,'2018-06-03 01:18:40','2018-06-03 01:18:40'),(174,'2018-06-03 01:20:18',6,'2018-06-03 01:20:18','2018-06-03 01:20:18'),(175,'2018-06-03 01:20:29',6,'2018-06-03 01:20:29','2018-06-03 01:20:29'),(176,'2018-06-03 01:20:58',9,'2018-06-03 01:20:58','2018-06-03 01:20:58'),(177,'2018-06-03 01:21:26',6,'2018-06-03 01:21:26','2018-06-03 01:21:26'),(178,'2018-06-03 16:58:48',6,'2018-06-03 16:58:48','2018-06-03 16:58:48'),(179,'2018-06-03 17:00:26',6,'2018-06-03 17:00:26','2018-06-03 17:00:26'),(180,'2018-06-03 17:03:44',9,'2018-06-03 17:03:44','2018-06-03 17:03:44'),(181,'2018-06-03 17:04:01',9,'2018-06-03 17:04:01','2018-06-03 17:04:01'),(182,'2018-06-03 17:04:32',395,'2018-06-03 17:04:32','2018-06-03 17:04:32'),(183,'2018-06-03 17:05:58',395,'2018-06-03 17:05:58','2018-06-03 17:05:58'),(184,'2018-06-03 17:50:28',395,'2018-06-03 17:50:28','2018-06-03 17:50:28'),(185,'2018-06-03 17:52:33',6,'2018-06-03 17:52:33','2018-06-03 17:52:33'),(186,'2018-06-03 17:54:42',395,'2018-06-03 17:54:42','2018-06-03 17:54:41'),(187,'2018-06-03 18:18:41',395,'2018-06-03 18:18:41','2018-06-03 18:18:40'),(188,'2018-06-03 18:21:50',395,'2018-06-03 18:21:50','2018-06-03 18:21:50'),(189,'2018-06-03 18:26:20',6,'2018-06-03 18:26:20','2018-06-03 18:26:00'),(190,'2018-06-03 18:26:21',6,'2018-06-03 18:26:21','2018-06-03 18:26:21'),(191,'2018-06-03 18:26:23',6,'2018-06-03 18:26:23','2018-06-03 18:26:23'),(192,'2018-06-03 18:26:24',6,'2018-06-03 18:26:24','2018-06-03 18:26:24'),(193,'2018-06-03 18:32:25',395,'2018-06-03 18:32:25','2018-06-03 18:32:25'),(194,'2018-06-03 18:32:27',395,'2018-06-03 18:32:27','2018-06-03 18:32:27'),(195,'2018-06-03 18:32:34',395,'2018-06-03 18:32:34','2018-06-03 18:32:34'),(196,'2018-06-03 18:33:16',6,'2018-06-03 18:33:16','2018-06-03 18:33:16'),(197,'2018-06-03 18:33:16',6,'2018-06-03 18:33:16','2018-06-03 18:33:16'),(198,'2018-06-03 18:33:42',395,'2018-06-03 18:33:42','2018-06-03 18:33:39'),(199,'2018-06-03 18:33:43',6,'2018-06-03 18:33:43','2018-06-03 18:33:43'),(200,'2018-06-03 18:33:48',395,'2018-06-03 18:33:48','2018-06-03 18:33:48'),(201,'2018-06-03 18:38:22',6,'2018-06-03 18:38:22','2018-06-03 18:38:22'),(202,'2018-06-03 18:59:18',6,'2018-06-03 18:59:18','2018-06-03 18:59:16'),(203,'2018-06-03 18:59:23',395,'2018-06-03 18:59:23','2018-06-03 18:59:23'),(204,'2018-06-03 19:01:15',395,'2018-06-03 19:01:15','2018-06-03 19:01:14'),(205,'2018-06-03 19:01:26',6,'2018-06-03 19:01:26','2018-06-03 19:01:26'),(206,'2018-06-03 19:02:33',395,'2018-06-03 19:02:33','2018-06-03 19:02:33'),(207,'2018-06-03 19:08:59',6,'2018-06-03 19:08:59','2018-06-03 19:08:56'),(208,'2018-06-03 19:13:59',9,'2018-06-03 19:13:59','2018-06-03 19:13:58');
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
INSERT INTO `sys_role` VALUES (2,'2018-05-21 17:42:54','2018-05-27 21:14:30','Á≥ªÁªüÁª¥Êä§ÁÆ°ÁêÜÂëò'),(3,'2018-05-21 17:45:12','2018-05-27 21:14:30','Êò†Â∞ÑÁÆ°ÁêÜÂëò'),(4,'2018-05-21 17:45:35','2018-05-27 21:14:30','Â∑•‰ΩúÊµÅÁÆ°ÁêÜÂëò');
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
INSERT INTO `sys_sequence` VALUES ('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.Admin',12),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.ExtendProperty',4),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.Menu',395),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.MenuRole',57),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.MenuVisitLog',208),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.Role',6);
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
  `ÊòØÂê¶Ê†áÂøóY` int(11) NOT NULL,
  `ÊòØÂê¶Ê†áÂøóX` int(11) DEFAULT NULL,
  PRIMARY KEY (`ÊòØÂê¶Ê†áÂøóY`)
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

-- Dump completed on 2018-06-03 19:15:56
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: activiti
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
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('2',3,'source',NULL,'{\"resourceId\":\"1\",\"properties\":{\"process_id\":\"CDQXKF\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\"}],\"bounds\":{\"lowerRight\":{\"x\":90,\"y\":108},\"upperLeft\":{\"x\":60,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\",\"properties\":{\"overrideid\":\"\",\"name\":\"ËèúÂçïÊùÉÈôêÁî≥ËØ∑\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\"}],\"bounds\":{\"lowerRight\":{\"x\":265,\"y\":133},\"upperLeft\":{\"x\":165,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":512,\"y\":107},\"upperLeft\":{\"x\":484,\"y\":79}},\"dockers\":[]},{\"resourceId\":\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\"}],\"bounds\":{\"lowerRight\":{\"x\":164.78125,\"y\":93},\"upperLeft\":{\"x\":90.21875,\"y\":93}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\"}},{\"resourceId\":\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\",\"properties\":{\"overrideid\":\"\",\"name\":\"ËèúÂçïÊùÉÈôêÂÆ°Êâπ\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\"}],\"bounds\":{\"lowerRight\":{\"x\":416,\"y\":133},\"upperLeft\":{\"x\":316,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"}],\"bounds\":{\"lowerRight\":{\"x\":483.59375,\"y\":93},\"upperLeft\":{\"x\":416.5,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"}},{\"resourceId\":\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\"}],\"bounds\":{\"lowerRight\":{\"x\":315.453125,\"y\":93},\"upperLeft\":{\"x\":265.546875,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('2502',1,'CDQXKF.bpmn20.xml','2501','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"process\" isExecutable=\"true\">\n    <startEvent id=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\"/>\n    <userTask id=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" name=\"ËèúÂçïÊùÉÈôêÁî≥ËØ∑\"/>\n    <endEvent id=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"/>\n    <sequenceFlow id=\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\" sourceRef=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\" targetRef=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\"/>\n    <userTask id=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" name=\"ËèúÂçïÊùÉÈôêÂÆ°Êâπ\"/>\n    <sequenceFlow id=\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\" sourceRef=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" targetRef=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"/>\n    <sequenceFlow id=\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\" sourceRef=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" targetRef=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"process\" id=\"BPMNPlane_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\" id=\"BPMNShape_sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"60.0\" y=\"78.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" id=\"BPMNShape_sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\" id=\"BPMNShape_sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"484.0\" y=\"79.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" id=\"BPMNShape_sid-03169B91-F44C-43EB-9B70-2637D7224D4C\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"316.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\" id=\"BPMNEdge_sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\">\n        <omgdi:waypoint x=\"265.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"316.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\" id=\"BPMNEdge_sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\">\n        <omgdi:waypoint x=\"90.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"165.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\" id=\"BPMNEdge_sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\">\n        <omgdi:waypoint x=\"416.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"484.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2503',1,'CDQXKF.process.png','2501','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\n\0\0\0è\0\0\0õ#Û\0\0\n¨IDATx\⁄\Ì\›ˇo\‘ıpá˝˚¡dKÊü∞ˆÉÄ\…ˆÉ§\ÿ;•©§ß´$dJJP\"hâ[≤òê\rKåA\÷1)˝b˘*ì@\'!+¢R[è±™Hk-Ú\Ÿ˚\’q\Àqîˆ˙ÂéÉ{<íW\–^˘íªWüü◊Ω?ü{\Óπ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0∏ÛdYv\Ôπs\Á\ﬁ9v\Ï\ÿ˝˝˝YooØ™sıııe¸w™º\ﬁRzh(\‰á ä\≈b655•nS]ºx1;p\‡¿\◊)\ÿ\“[Jo\r#\ﬁ\Ì	ÚÜ	Ù©Ù.å\ﬁRzh±$,HßRòO\Î-•∑ÄÜ\Á1ÖhCÖy¶∑î\ﬁ\Ó∏0ˇˆ´\—\Ï\‹Ò7≥\”}õg*˛;æ&ÄÖπ\ﬁ\“[@ì\nó\«G≤è{6fßˆÆø°\‚kÒò\ÊzKoM<(|~˙O7y©.ú\Ó\¬\¬\\o\È-†ôÖ3lªeò\«cBXò\Î-Ω4Ò†q\Ô¶[Üy<&ÑÖπ\ﬁ\“[ÄAAòsΩ•∑\0É\¬\ÕW¢\ﬂ*\Ã\„1!,\Ãıñ\ﬁöxP8{\‰w∑ÛxLsΩ•∑Ä&.çe\Ô\Ô∫yi8}-\¬\¬\\o\È-†âÖ®O˛ˆˆMa_¿\¬\\o\È-†\ŸÖ\Ôæ\À\Œ˝˝\ÕK\√\ÈkÒò\ÊzKoM:(\ƒ\Óx\√G~{\ÀÛ\»ÒòÙÑπ\ﬁ\“[@≥\r\n\È\›\‹\ËŸÅ\Ï\Ô˚~s\À /U|O|ØwÄ\¬\\o\È-†	Ö˘\ﬁ\Èy(\Ãıñ\ﬁöxP®\Êù\ﬁ\\\Ô\0Ö≤0\◊[z∏ã\√|±A^*°,\Ãıñ\ﬁ\Ó\‚0W\¬\\o\È-\0a.\Ãıñ\ﬁ\Ê\¬\\o)É ÃÖπ\ﬁR\ÓFYñ˝hhh®\÷[oÿ∫u\Î\◊O=ı\‘t[[[∂r\Â\ ,ü\œ_{\‚â\'¶û˛˘s€∂m€ô\Ígû1a.\Ãıñ2(\‘C.ó˚qKKÀöt<z\'\’\ŸTó\„ÿîj2\’\'\È±\›\È\◊\Á\‚˚<[5\Z\ﬁ}˜›∑_|Ò\≈\Èu\Î\÷eoºÒFv\Ïÿ±ldd$õúú\ÃB¸Z,≥è>˙(KÉDˆÙ\”O_{\Êôg\Œwtt¨ˆ\nsaÆ∑îA°~¯\·_•\ÍM5u}0®¶>Hﬂü˜\Ï-ì4¥øÙ\“Kﬂ≠_ø~f∏zıjV≠ì\'Of6l∏Z(Œ¨X±‚ßûMa.\Ãıñ2(,át∞ø/\Ï˜-`8ò≠96-m\·\ﬁ={ˆ<˛¯\„Yww˜ÇÑJ˚ˆ\Ì\À\⁄\€\€\'¨.saÆ∑îAa©ZZZV∂∂∂˛ß¸†ü\ÀÂ≤ó_~9\»>˚\Ï≥\Ïõoæô9˛\\πrefı˚»ë#\Ÿˆ\Ì€≥Gy§rX∏luaëC\¬\‡\‡\‡_◊Æ]õ\rg\À\·¸˘ÛY\Z:&VØ^˝kœ∞0\ÊzK9$<ò\ÏW\ÀÑù;wŒú˙Æ\∆¯¯¯\Ã˜\«\Ô+“ü\Èç\ÏB\ƒJB	\’>Ò’ä?Ø££\√Ù&ÃÖπ\ﬁRÖE≠$î	ùùù3´ãø/N©WéM’àk\‚t\√r≠$Ã∂≤Ë£èéß\‰~œ∂0\ÊzK™\◊$îün\Ë\Í\Í˙ˇ\ÈÖ≈ä\”[∂l©<\r\·\ÿ4\œ)ámﬁºy*ÆI®•Ω{˜N\‰rπ=\„\¬\\ò\Î-eP®F\Z˙\ Wñ:$î+á<\€sÿΩ{˜\‚	˚˛˚\Ô≥Z{Ú\…\'\«,ÛsaÆ∑îAa>Ò\»Úk{∫aÆ\”\Â\◊,86Õ±ö˚$\ƒG \Î\·‘©SSVÑπ0\◊[ †P≈†\–[:à«Öàµ∞k\◊.´\nÛâ\„∆•|r°\⁄\€\€\«‚ºìÇô\ÕB~!ÃÖπ\ﬁR\Õ4(T”ü±ìb\È\∆x\◊\È“•öè\‚\”ùº\œdP!∂eﬁ±cGVO€∑o?[j6˚s_∂\‹\’\€\“\“Úsa.\Ãıñﬁí}ˇs}[\Êô\Ô{\ÂïWj}L*û3Tà{7ƒ∂\ÃıtÙ\Ë\—Û\È\≈\Ë6(‹¥[\ÿ˚≥M\Ÿ\¬\\ò\Î-Ω\’l\Ÿw˝\ﬁ\r3è\÷Ùòõ2ï˝[∫M\‚O£££u\∆\∆∆ä\È\≈¯‹†0˚ˆ¢ï\Àr\¬\\ò\Î-Ω\’l\Ÿw˝O3__\Óã+\≈éeˇé\œM\‚.ê•<\’K¸}qg/É¬º˚ëø\Àr\¬\\ò\Î-Ω\’lŸój¢Ùˇ\Àıë»π>*YˆwOöfy¡ná%\ﬁ–£©Jò7V\È-•∑\Í[ı>&ô*¨Zµ\ÍZΩW&&&\∆LmsN\’\«c_Ûx\‡^\À\√\ﬁı\È-Ω’å\Ÿª%ZQhk◊Æù™˜5\n_|Ò\≈?úöıá\ÂÜø]\Áë\”_9k\›)èsΩ•∑\Ó¸˛tçBŸ∏q\„\ŸzÍ°ßß\Á/Æ,Ω\·á\Â\√ÿÅ¨2\ƒogò\œıµF\\ò\Î-Ωu\Á˜ßO=4êW_}uGΩ˜Q\Ë\Í\Í\⁄Î≥™3?≥æ\À\Ê\¬\\o\È≠f\œ>˚(4ê^x\·\'k÷¨˘°é;3N∂∂∂˛\À\ÓW\’\Ê\¬\\o\È≠f;3¶\„\ƒt=vf\Ã\ÁÛ\◊\Ï\Ã8è\Œ\Œ\Œ\÷\Î^===;\Ìß-ÃÖπ\ﬁ\“[Ö˘∏\◊Cy\Ï±\«V<˚\Ï≥\”uXUomm=\·]\¬\\ò\Î-ΩeP®bP®˘\›#\”1ÈöªGV©P(uww\◊tJà\Î!bbõ\Ôº)\¬\\ò\Î-ΩEH«åJÚ\Œ\Œ\Œe˚®d|$2ΩAæZæö\‡\ÿ4ˇãq_{{˚\ƒpMÜÑ°°°=\È\ÔM\€˝û\Ì\∆Û{|ÑÕ††∑ÙVÉõR],–ª∫∫ñ<,ƒê∞eÀñÚ\Î.;6U)ü\œ\Á\nÖ¬ïb±∏¨C¬Ö∑∂∂~jY\Á\ŒsePPz´ë¥¥¥¨,]\ÿXZYX\Ïià¯}+	N9,T.ók\Ô\ËË∏º\\+±íCBz°7xvÖπ0\◊[ †∞»ïÖ∂Úa!ÆYà\„S\’~∫!.\\,ø&! ±i	\”[>üˇ˙Ω˜\ﬁ˚v	8éøˆ\⁄ko\∆\ÈÜxÅ=´\¬\\ò\Î-ePX\Í±)\’x˘Å>Ü\ÿg!6eä’Ç\“iâ8Ω;.\∆fJØø˛z∂j’™*vÉº\Ïÿ¥\ÁÖ\“\‰\’_(\∆Nú81±ê}ˆ\Ôﬂø+\r\Z\«\„\‚\Á}Ñπ0\◊[ †∞ú«¶ÚèM.≤õñ˘Ey(Ü∂∂∂\‚÷≠[O>|¯\”4•çñn$7xä{7Ùıı˝y”¶M\Ôß\È\Ó\\º1©πÇTòsΩ•\nµ:6]¶2 86\’PÏíï^îu\◊˜\ﬂ˛$\Ó∞U∫\”V\‹D#ˆ«é≠/\Ìj%ÃÖπ\ﬁRzÀ±	Ñπ0\◊[Jo\¬\\î\ﬁÑπ2((Ωs%\Ãıñ\ﬁ\nJò\Î-Ωî0\◊[z0(saÆ∑ÙÄ0\ÊzKoI<@òsΩ•\nÄ0\ÊzK\0a.\Ãıñ\“[Ä0W•∑\0aÆ\nJo\¬\\	sΩ•∑\0aÆÑπ\ﬁ\“[ÄAA	sΩ•∑\0ÉÇ\ÊzKosaÆ∑ÙÄ0\ÊzK\0a.\Ãıñ2(\0\¬\\ò\Î-•∑Ä€°øø_à6NM¶0ü\÷[Jo\r\„\‡¡É£\≈bQê6@çåå¸1Ö˘Ω•Ù\–0~988¯’ó_~9!PoﬂªΩÚæææOS=§∑î\ﬁ\ZJ\nê”ªç\„±4\Á1U\›+û˜3wcê\Î-Ω\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07¯/\Óå˙≤%\√a\0\0\0\0IENDÆB`Ç',1),('3',1,'source-extra',NULL,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\02\0\0\0∑\0\0\0.¥\0\0\0 cHRM\0\0z&\0\0ÄÑ\0\0˙\0\0\0Ä\Ë\0\0u0\0\0\Í`\0\0:ò\0\0pú∫Q<\0\0\0gAMA\0\0±é|˚Qì\0\0\0sRGB\0Æ\Œ\È\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0\ƒ\0\0\ƒï+\0\0\»IDATx\⁄\Ì\›	tU’Ω\«ÒùÅ$§Ä®àPQ°Ö.ãî±àJ+\ËS\€\ \„Ym\—>á´R\\¢\‚T[QEÑ2+µ80X°\"µ ìdÅñ»êÑÑHr\ﬂˇw\»IOBÇ!7˜~?k\›u\ÔMÓîìˇ9ˇˇ\ﬁg\Ô}ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0DΩ6jÉP(î¥m€∂_fee\r=r\‰»•\Ÿ\Ÿ\ŸIlò\ \0bbBâââV?~|\\◊Æ]?$∂à-b2@≤$Û\ﬂ˚˜\Ô&77˜¨\ÊÕõªÜ\r∫\r\Z∏\ÿ\ÿX6N%)a[wôôô.--\ÌX~~˛¶úúú°}˙ÙI!∂@lÅB®§;v\Ãﬂ∫u\ÎM-[∂t\ÁùwûZylîj¥{˜nóööö\nÖ˜\Ï\ŸÛØ\ƒà-Ñª86\¬9\—\ÿ\Â¶v\Ì⁄π¶MõíhjÄz#\Z7n\\gﬂæ}\◊:t\√‘©SˇMlÅ\ÿÖpö\‘\Âo≠∑˚îhíììO˙˝—¨Ω.m\„[.m\”_\›˛m∫#á∂π\ƒz\Õ\\|b2Øíîp\”\“\“˙2\‰ùi”¶\Ì#∂à-b\·ä¡;\Z|©q\ÍÚ/+\—\Ï\\Û™\À\⁄ˇÖ+\»?\ÊBy\Ó\»¡-n\«\Í\….7s∞\n‘´Wœµj’™ ..\Óè\ƒ±ElÅB8ΩÛ/5¯R\„Jsp˚G.\ÔXˆI?W\‚Ÿøm)∞ä¥h—¢q||¸≈ã/æö\ÿ\"∂à-P\»\0\Â§i∞öAR÷∏ÖúS¥å’¢F\’i÷¨Yö]\›Ll[\ƒ(dÄr\“Zö[ñP˛Ò≤üb˝è™‘§IìÛ\Ì™;±El[WÒlÑ-H¶8Û\ÏˇpÆ]5%∂@l!\\\—#É∞£Ö¥Xê,L\'˛Ò\ƒà-P\»\0U§N›≥\À¸]|\"≠m[\0Ö\∆\Z∑\Ï\‚\‚\ÍùÙÛ∏:u]\„ª≤Å@l2@¯™ﬂ¥ù´\◊\‰\“Rﬁ†\Ÿel [\0Ö\ﬁÚè\ÁúÙ≥º£á\Ÿ0 ∂\0\n |\À˛\ [e5\Î´M\'˝.˚¿f∑\„”â\ﬁc\0b†ê\¬J\∆\Ó5ñh&y\ﬂ}Sñ#\È\€]\Í\ Ò\Ó–é.ƒ∫ ∂Äà\«\‘7‘äñÚ\ﬁøÎµä\ÀC\À\…\ÎÒá≠e\›Ïíæ.\…[Æ ∂ÄHDè¬ûZ¡\ÂM4\≈Z\–÷∫ﬁæ\Í6 à-ÄB8s\‘\nÆ(}{1@lëãSK{m{ça#Ä\ÿP*zd\0\0\0Ö\0\0\0Ö\0\0\0Ö\0\0àtˆ-E(J⁄∞a\√≠]ªˆ\÷={ˆtÿΩ{˜YôôôÒπππ.>>>‘†AÉ\„ç7ﬁïúúº\¬˛áx\‡∂\Z\0†∫\r2§E^^^ˇòòò\Ô\€\›vinó˙v…µKö\ÂØuˆªè\„\‚\‚fNü>˝K\nô(,`\ﬁ|Û\Õ	c∆å|\‡¿Å¯v\Ì⁄π\Ó›ªª.∏¿Y\·‚íííú31áNÿπsgÎîîî\÷k÷¨πu\‰»ë;≤≥≥\«Lò0a[\0P\’\‹ﬂÆ\Ó*((\ËfÖJB)I≤K+˚]+ªÓüüüˇÙ†AÉñ\⁄˝\…3fÃòF!>˘\‰ì;¸Òó222\ÌüÔÆ∏\‚\ng\Ì…ëb≈å.Mõ6u\ﬂ˘\Œw\‹O˙”òı\Î\◊_8s\ÊÃóá~\ﬂ¡Éoò3g\Œˇ±E\0ïe˘H\≈\…\À\÷\–\ÓSÅßw∑\Áu∑\◊nÖ\ÕÌëöõ¢æê±r¸\€oøΩh î)=Æø˛z˜\√˛∞\‘\ÊTTÙ\ÿ%n\·¬Ömgœû˝Ÿùw\ﬁyΩ3\0Ä\ 8p\‡†\ÿ\ÿÿó\n\n\n\Œˆ¶¸Ù\Ìo\€u\Ó\‹Ÿµi\”\∆5j\‘\»5h\–¿9rƒ•ßßª\‘\‘T∑r\ÂJ∑f\Õ\Zw¸¯qˇi]\Ìyk<\"{g¢∫êQ≥lŸ≤Kñ,π\Í\ﬁ{\Ôu_|q•^ØOü>Æm€∂u«é˚«üˇ¸Áâì&M˙3ª\"\0†EL?+b¶Y\Á0jh_{\Ìµ\ﬁÅí\Œ:\Î,\Ôr\ﬁy\Áπ.]∫xE\Õ;\Ôº\„\ﬁ{\Ô=óüüØá‘∑ú˜Ü3IV\ÃDTC;™g-©\'fﬁºyW=¸√ï.b|^x°=zt]¿±0C\Ÿ\0ßYƒ®\'fæ^£\‚\‰â\'û\–@\ﬂRãò“®ßFè\◊Û4\Œ3–Äüiπ)jçâ±Jµ\«\›w\ﬂ]\Ó¿(/Ω\ﬁo˚\€˙u\Í\‘y\—¶-ª%\0†<4&&..\Ó%øàπÙ\“K›£è>Z¨9zûûﬂæ}˚`13>írST2öù¥h—¢Ò\ZSU=1%©g∆™\ÍD´™_c\◊\0î+)\«\∆NÚ\«ƒ®\'\Êæ˚\ÓÛ\∆¿TÜN9˝˙◊øC:\Õ4ëB¶õ?˛dM°÷òñ\Í‘∑oﬂ∫\r6l\Õ)&\0¿\◊\—k+b~†\€\Z£‚£≤EL∞ò\—à¿dñÆëíõ¢ÆêQoLJJ\ O4≈∫Nù:\’˛~√á?\€*Ïª¢i€∂•≤{˜\ÓL\Ô±\‚≥¸ärÖˆVÙtRYÙz˝˙ı\Ê\√·ë∞›£\Ó`†{˜\Ì\€Ø)\”5\·Ú\À/OHLLl≠Ûû3g\ŒLçí\Õ¸\€A\‹9Áúìc˜{111ÛÚÚñœô3\'´¶>¿±c\«\\BBÒ5£¨•£n\€*y}˚{¥\ sµˇ˝\ÃU˘∑Üil8p\‡\€ˆ7æNl!\„”é}\Ï\ÿ˜Zy\„S+ˆZı\–mÜRu∏\Ó∫\Î‹ª\Ôæ\ÎO\Õ\Ó\Z	π)\ÍzdÙµe-vW]⁄∑oüfW¢m[\€N\\◊Æ~l;ˆ{∂Ω˜XKe∂]Æª\Ì∂€í™\„˝¥éÇíå.ø˙’ØT¥∫+V∏¨¨,∑|˘r7v\ÏX\ÔwvPq(ˆ\‹\◊_\›}ı\’W≈íïZ.VÙûÙ>˙™ä°Cáû≤àΩ\«SO=•\Ÿq\Íôs\Î◊Øw/æ¯¢wﬂøLò0¡Ω¸Ú\ÀeæñÛª\ﬂ˝Æ\Ã\ﬂ\Î≥\Ë\Ô)iƒànŸ≤e\ﬁ\Ì;vDblùeóAÖ±µ\À\∆”â≠”ã-˝æ¥\œÙ≥ü˝\Ã[ìDükÿ∞a^ë%(∫ç\“\„”Æ~8ˆ\Õ¯∫¯\‘\◊¯|ï£¥ö|u\–l&-\Ê\ZP\ÎsS‘ï˝˙\Ó$}\Ì@M\Í‹πs£˝\Î_˙^åqQºokp\Ÿ-v}ãè\⁄N˝ñ›ûeˇèKó.≠í#¢\÷M¯\Ï≥\œNT\Ë\÷:ﬁπsß´_øæ\À\Ã\ÃÙ\÷Sh›∫µ˚˚\ﬂˇ\Óùs>x†˚\∆7æQÙ\\˚<^¡Ù\”O{˜\'Nú\Ë^}ıU◊¨Y≥ì´{m|\’_|\·-<UØ^=\ÔæZ9ì&MÚ\÷nHLLt\ÁüæªÒ\∆›ñ-[ºÉì´˚æ˜\ﬂ\ﬂKl>%»Ω{˜µ\ÓSRR\‹\Ÿgü\Ì}n9t\Ëêw}Û\Õ7{\◊Ze∫m€∂^Ω\‰íK‹∂m€º\Á™x\…\»\»í\Ë∆ç›ìO>…±ïló[-ænµ\ÿ µ¢fé%í7â≠ìcKÒ,ä^z\È•bIM£bK_\œ\"\Íy\Í‘©ì˜:={ˆ,\Í)\“\ÃLzçN\Î\ÿ7»Æ\È\ÿgÒ9\œ\‚sN\…¯,¸\Ó$è∂yu\“\Î[NÚ\Ô\÷˙\‹uë®/Ä‘å¢öÙ\Õo~S\’yˆ\Á\"â˛é›ºyÛ,;\–+Kè∑ÉÛ\“)S¶\‰VÙE5\¬_\—l4%µ8uÄWãzı\Í\’^2∏ÎÆªäµéy\‰˜\›\Ô~\◊}\Ô{\ﬂs\„«è˜z\Î\ÏsiäæW å=\⁄{-µ@ï¸C?ø˙Í´Ω§•E™¸\‰S≤E≠¢\‚ökÆÒnØ[∑\Œk-˚ÙŸÇâ\‰Û\œ?˜Ü?¿OÖãnw\Ì\⁄’ªøh—¢¢b&\–\„\Á.ª\Ï2/	\Í˘u\Î\÷-˙ùznπ\Âñhä-µxáY|\r;\Áús[\“X¨SõƒñsKñ,q#Gé,∫ØûbΩzı*\Í\r\“ﬂ§\"F\œ\’kkïXM\›\’`TÕ±\œ/∫üv\Ï˚¿Óø¢¯¥\Ì\ﬂ!ê3™ıC¥j\’*x∑\÷Á¶®+dÙ-\÷\ÍZ´IvÄkjÅõg\’GŸèKm≠®y£§∂ç∂ª\·+B\Áï\‘7m\⁄\‰6o\ﬁ\Ï¸u^X?S2˘Ú\À/]ã-äØûø%´D†ñ∂ä	˘\‡ÉºD\„\Ì,\÷\Ì€∑ØóÄ¥D¯\Ì∑\ﬂ\Ó˝|¡ÇEØ•˜¥T±œ£V˜ø¢±’°Cáb≠fµxÉ≠f\ÔHg≠mÜ§\Î}˝˚∫›∞aCø(˜í\—G}§\Ô¸Ú\–¿ÅΩﬂ©’Æ˜\—EüOß@ÙwùÆ˝˚˜{I≠6∆Æ0™ujÛ«Ö±µ%ZcKEâ^_\◊*§D=9z=ˇ1*ío∫\È&\Ô∂\n ].\\\Ë2z\Ã+Øº\‚=F=9∫Ø¯\”\È©|\–\Îå¶ÿ™™¯¥\ÿ\‘AˆW|™ì\Ãˇ]u\Á®ØﬂÑB¶ñQ¿Tdß´µæ,hµ≠°n˘Z≠ïú˝S\'°Éµ∫\Áï$4v@]®\Zì†$ìùù],—îl\…\Í±\Í\—P\‚˜Eê\÷\«\Ï>ÏΩ¶øò¢?@s’™U\Ó±\«+ˆü~˙©ªÚ\ +ø∂\’,:U\·˜™î¸<¡«´á†ˇ˛\Ó\√?,:µ†ø]üQı>Gèıä!ù\Ó®H!£\"i\Ì⁄µ.Bb˜¢hç≠ñ-[z≈áV1\Ô—£GQ\œœÆ]ªä\nù\Ó*ã>/iiiÆc«é\ﬁ\Á\“g‹∫u´◊õ\„è€âÚÿ™\nEcV´j\ uY4ªD/&ÖL≠\Í\◊KLY1Sì\≈LßNùˆœù;∑ë3èG\…f.œÅ)T\ÿâ+\—J\Ÿj\ÂJı´™ï¸è¸\√K6\Í\Ó˜[\·:\ÌÚõ\ﬂ¸\Ê§\«kåâ\ﬂJ\Œ\…\…Ò\"›∫uÛ\Ó´E\Z§\”\Z€†˙®Q£ºV™\Êj©´5¨§Pr\ÏÄ?k\÷,/\Ÿ¯≠f%D%µíï\\É¥Pc∞\Ë∂\‚K\Î¡Ò)	Õò1\√;ç\·Sí˚÷∑æ\ÂΩWEËµ∂oﬂÆÑÛX-ä≠k\È6à≠\0ùÛOSÍ≥ü{\Óπ\ﬁ),˘\€\ﬂ˛V¨\”˚©X\—\Î´¯\—˙\œ\’)/ˇvEÖalù\È¯\‘œΩbFÖbu3äµ`˚ûB¶ñINN>ûûûû\‡wØ\÷k¥ Õù9s\Ê£—∞ç\r\ZT\Ê\Œl;jæm/1*b\Ï~∫\›_bó\ÈVdæØqw\‹qG®\"\Ô´V±+™e´ã\∆®7LE´?˛@\◊˙”üº\Ÿ:h\Îqˆ\ﬁE|ù.\–\„˝B∑\‰x™yÛ\Êy3Ç\‘Ú\’\ÿøáOdΩÜíIio\Zl\È\”8Ω˜?ˇ˘O\Ô=u\ŒZ=,j\›˙-v?˘)y˘?\”˚ùjöØú\Z¨\Á◊ç8]Mö4Ò\n§x\‡\—0è-\≈˙f<-kˇ\”Xb´xl˘áznDØ´12˛\Á\— süNì© RíNWñU<WF∏\≈V\r˚Ú\nãóR\„\”˛\ﬂ˙\'∂\—c5∏º:Ω~¿~\nôZ¶Q£F;lnSìÖåd∂d£í\Ì∞GmgM,lu®àQV\÷\—ñ(óXÇIØä˜\—¡:ÿ¢\‘˘|%uø´\Â\ÍwõkLÉhÃÅP\Íy~°†\¬¡/¸µZ\≈\œ=˜ú◊•~\—E`¸Aír\’UWy\›ˆ%[\Ÿ:`h6\Àoº\·\Õ Râ\ËTê¶Ï™Öå´J˙\Ã~ÀªdÚ\”`\Ã\À/ø¸§ø\›\ÔP\„ˇ}~\À.Çiü\“b\⁄8±Öb´å\ÿRë¨^$ø(\—)+]¸˚˙Ωøé¶]+ñTX}M\Œ\“B±ûó\„Åc_¸©\‚”ä†u~!£û∞™^/HÉ∏\÷Q\»‘æôe)))m:w\Ó\\c\Ôπb\≈\nµóE\Î\ﬁ\\∏#kûków,)/®\Ãí≤{*tp\◊Ù\‘\€nª\Õ;5£\÷\Ìò1c\‹\r7\‹\‡¸\≈ïÑ¸i¶A¡S9\‚†\‘A^pi≠Sù\ÎW¢Sæ¶\’\Èµ4\ËSEJ∞\ÁDß\‘:&HÜJq¡\œ¸\\ÅB—Ωˆ\⁄k\Ó˛˚\Ô˜>[púÑí[iœâqÖb´±•BJÉ˝SB\ÍÅQ°•YU~çØ\‰ÇA\Z+§[%\„\'\¬\Êté}∂/≥\«{k∫®\Œ\ƒ]Júr¨ıπ)\Í\nôååå\'láΩ=???∂Ü\≈ÀµVµæeÙÆh\€\÷\Í:µ´•Z}µp˙kzuæüíÅZ\ Z?\ÂG?˙ëó4¸§ﬁ•KoÅ\÷\–\◊\⁄k]è\‡∑¡˙\nWª<e2.¶˜ú>}∫7\€CÜiˆê\\pˆà(°\Ë±J.j-\Î4ÅZ\Ô\Í\¬\◊\¬f˜\ﬁ{o©\Îrú\ÍÛ¯‘äø\Áû{º\€\Zÿ´˜\÷g‘¨mbã\ÿRl©\ÿ	zO˝¢≈ü)\Â=\«»´XZºx±78¯\Œ;\ÔÙ\n.?\∆\‘{Ä\ «ßm\Ô˘ñóû\”M\r$\◊\0˝\ÍXO=yV|™qS¯£π2µåµú∂ÿéΩ\ÕÂ¢≤F\ËW%;¯Õ≥É¡ÖQÙıÚ∞µ,R≠ı1∑:Z\«e\—tPu\…µZ˝÷™\ÿZ\Á#∏\÷GIö˙\\û\Ÿ=ö\r§ñ©z<ÜRîà¶Nù\Í≠¢D¶.˜`K^∑u:¡\Ô∂u\›k}\Õ`)\Ìõ\ÿ\ÀÛy¸?c\»˝ü∂ÅíçVü’Çl\ƒ±UíNg{rJnöZ\Ì^çgQÁü™\“j\¬\Íô\“ˆ®ŒûÉhäO+Zø¥}u©AΩ¨†ÒñP\–ˇø™i,ó°~≥<rSL4Fö\Ì\Ï∑\ÿA\Ë/O>˘d|5˜ §[ n≥¿|v∆å\”\ÿ\«\À\«Z~!f\Œ<\Õ\“\È›ªw±b´z\È\'-_h\’sØ∑L=|U9VF+R?¯\‡É!+TΩmnE◊∞H\»M±\—,ì\'OûìïïµIou\Z7núzc≤˜\Ï\Ÿ3ì]\0p*VTÃ∑´•∫≠^ô\Áüæ\ \Ïk\ ı/ºê\Ô1fy§\‰¶\ÿh\ròååå\ﬂz\Î≠\Õ\n©6lx{ı\Í\’\◊[\≈˚ã™˙æ\0@\ƒ\”`%oJ¥Ni>Û\Ã3ï.fT\ƒXQ⁄µkó\n\"+írS\‘2:/x\Ïÿ±_Xê©\Ï≤\Â%Y∞|<v\Ï\ÿ(ˇkˆ\Á\Ïó\0ÄÚ\Ê¶P(t∑\›ÙäM\„\◊\◊D\Ë¥PE\Ëyøˇ˝\ÔÛ≠q]t\n\œr”àH\ M±\—0”¶Mõûïïu˜®Q£≤™™gF=1˜\ﬂˇ˘˘˘\„\08]≥f\Õ\“)ü_¯≈åzfz\Ë!o[â\≈\Ï §\«YQ‰çâ	Ù\ƒhF\’Cëñõ¢˛{\ÿ-0^8p\‡ë—£Gø2`¿Ä∏~˝˙’´\‡\0\‡Ùgü}v˛™U´¥\"\÷CàS\ÿ\0aE\»\ÀMö˘4>&&¶ë\∆\Ã\ËKD5∂S\Îu\Í\‘\…˚ñlÕû\”:}§\‚Eã\›imª=zTù~Oå÷≥π;sS<\·r¢˙4h\–\'≥gœûlAr\Ÿ\·√ì;v\ÏX∑úO\œ]ºxÒ¸©Sß∂\…\À\Àkc◊É\”I\0Ä™\ MñW&jZ∂~¶ÇF_™\À\◊ûqYÆ11ëöõ(d˛S˝¶\⁄\’,hå7nDBBB˚∂m\€~’µk\◊˙≠[∑Nh‹∏qs-üìì≥◊™ﬁåç7n^æ|y\‹\ÊÕõ/µ¿\“ÚôNKKõ\∆¿^\0@\Á¶\ﬁ\ MVå∑Ç¶˚i\‰\Ó\ÂvôÈπâB\Ê\‰†\—*ásá\“b˝˙ı÷≠[wç›ø“ù¯ÜP}ßKCw\‚˚]¥2\‚veã\›\0\Œ`n*((`çüõö\Ê&\Â(\Õv\“w\'\Èk\ÊFKn¢ê)ÉVY¥´\Á/\0\0êõ\¬P,õ\0\0\0P\»\0\0\0P\»\0\0\0P\»\0\0\0\n\0\0\0\n\0\0\0\n\0\0\0\n\0\0@!\0\0@!\0\0@!\0\0(d\0\0\0(d\0\0\0(d\0\0\0(d\∆A*((`CÑ˚?l∑´<b\ƒ(dÄrJJJ\⁄w¯a6D8t\ËPä]≠#∂@lÅB(ß:u\Í,\œ\»\»`CÑÅ¥¥¥LªZJlÅ\ÿÖPNπππO\ÌŸ≥\Áx(bcúY©º¬Æ\Á[ ∂@!îS∑n\›VZ¢˘l˜\Ó\›lå3(%%e±˝v˜\Ó\›˚b\ƒ(dÄ\”k9MMM=íôô\…\∆8\“\”\”ˇj-\Ê\n\n\nF[ ∂\Œ\‚\ÿG”¶M\€?lÿ∞ï∏©a√ÜIâââlî\ZL46lhÛ?\◊^{\Ìrb\ƒ(dÄ\nò:u\Í÷°Cá~∫w\Ô\ﬁ˛v\‡\ÀNNNÆk\◊lòÍìöíí2\'55µßMØ^Ω[ ∂\Ó\ÿsˆ.\\\ÿ666ˆÖ¯¯¯éMõ6˝≤Iì&\ÁZK∫π˝åçSIZ\ÀC\”`5ÉDÉ/5nA]˛}˙ÙI!∂@lÅB®Bã-\Í`≠πõ\Ìfwª\\ió$∂J•iA2≠\Â±\‘.Û¢u%±El\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@D˚yv5*#9\0\0\0\0IENDÆB`Ç',NULL),('5002',1,'CDQXKF.bpmn20.xml','5001','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"CDQXKF\" isExecutable=\"true\">\n    <startEvent id=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\"/>\n    <userTask id=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" name=\"ËèúÂçïÊùÉÈôêÁî≥ËØ∑\"/>\n    <endEvent id=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"/>\n    <sequenceFlow id=\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\" sourceRef=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\" targetRef=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\"/>\n    <userTask id=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" name=\"ËèúÂçïÊùÉÈôêÂÆ°Êâπ\"/>\n    <sequenceFlow id=\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\" sourceRef=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" targetRef=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"/>\n    <sequenceFlow id=\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\" sourceRef=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" targetRef=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_CDQXKF\">\n    <bpmndi:BPMNPlane bpmnElement=\"CDQXKF\" id=\"BPMNPlane_CDQXKF\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\" id=\"BPMNShape_sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"60.0\" y=\"78.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" id=\"BPMNShape_sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\" id=\"BPMNShape_sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"484.0\" y=\"79.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" id=\"BPMNShape_sid-03169B91-F44C-43EB-9B70-2637D7224D4C\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"316.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\" id=\"BPMNEdge_sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\">\n        <omgdi:waypoint x=\"265.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"316.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\" id=\"BPMNEdge_sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\">\n        <omgdi:waypoint x=\"90.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"165.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\" id=\"BPMNEdge_sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\">\n        <omgdi:waypoint x=\"416.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"484.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5003',1,'CDQXKF.CDQXKF.png','5001','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\n\0\0\0è\0\0\0õ#Û\0\0\n¨IDATx\⁄\Ì\›ˇo\‘ıpá˝˚¡dKÊü∞ˆÉÄ\…ˆÉ§\ÿ;•©§ß´$dJJP\"hâ[≤òê\rKåA\÷1)˝b˘*ì@\'!+¢R[è±™Hk-Ú\Ÿ˚\’q\Àqîˆ˙ÂéÉ{<íW\–^˘íªWüü◊Ω?ü{\Óπ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0∏ÛdYv\Ôπs\Á\ﬁ9v\Ï\ÿ˝˝˝YooØ™sıııe¸w™º\ﬁRzh(\‰á ä\≈b655•nS]ºx1;p\‡¿\◊)\ÿ\“[Jo\r#\ﬁ\Ì	ÚÜ	Ù©Ù.å\ﬁRzh±$,HßRòO\Î-•∑ÄÜ\Á1ÖhCÖy¶∑î\ﬁ\Ó∏0ˇˆ´\—\Ï\‹Ò7≥\”}õg*˛;æ&ÄÖπ\ﬁ\“[@ì\nó\«G≤è{6fßˆÆø°\‚kÒò\ÊzKoM<(|~˙O7y©.ú\Ó\¬\¬\\o\È-†ôÖ3lªeò\«cBXò\Î-Ω4Ò†q\Ô¶[Üy<&ÑÖπ\ﬁ\“[ÄAAòsΩ•∑\0É\¬\ÕW¢\ﬂ*\Ã\„1!,\Ãıñ\ﬁöxP8{\‰w∑ÛxLsΩ•∑Ä&.çe\Ô\Ô∫yi8}-\¬\¬\\o\È-†âÖ®O˛ˆˆMa_¿\¬\\o\È-†\ŸÖ\Ôæ\À\Œ˝˝\ÕK\√\ÈkÒò\ÊzKoM:(\ƒ\Óx\√G~{\ÀÛ\»ÒòÙÑπ\ﬁ\“[@≥\r\n\È\›\‹\ËŸÅ\Ï\Ô˚~s\À /U|O|ØwÄ\¬\\o\È-†	Ö˘\ﬁ\Èy(\Ãıñ\ﬁöxP®\Êù\ﬁ\\\Ô\0Ö≤0\◊[z∏ã\√|±A^*°,\Ãıñ\ﬁ\Ó\‚0W\¬\\o\È-\0a.\Ãıñ\ﬁ\Ê\¬\\o)É ÃÖπ\ﬁR\ÓFYñ˝hhh®\÷[oÿ∫u\Î\◊O=ı\‘t[[[∂r\Â\ ,ü\œ_{\‚â\'¶û˛˘s€∂m€ô\Ígû1a.\Ãıñ2(\‘C.ó˚qKKÀöt<z\'\’\ŸTó\„ÿîj2\’\'\È±\›\È\◊\Á\‚˚<[5\Z\ﬁ}˜›∑_|Ò\≈\Èu\Î\÷eoºÒFv\Ïÿ±ldd$õúú\ÃB¸Z,≥è>˙(KÉDˆÙ\”O_{\Êôg\Œwtt¨ˆ\nsaÆ∑îA°~¯\·_•\ÍM5u}0®¶>Hﬂü˜\Ï-ì4¥øÙ\“Kﬂ≠_ø~f∏zıjV≠ì\'Of6l∏Z(Œ¨X±‚ßûMa.\Ãıñ2(,át∞ø/\Ï˜-`8ò≠96-m\·\ﬁ={ˆ<˛¯\„Yww˜ÇÑJ˚ˆ\Ì\À\⁄\€\€\'¨.saÆ∑îAa©ZZZV∂∂∂˛ß¸†ü\ÀÂ≤ó_~9\»>˚\Ï≥\Ïõoæô9˛\\πrefı˚»ë#\Ÿˆ\Ì€≥Gy§rX∏luaëC\¬\‡\‡\‡_◊Æ]õ\rg\À\·¸˘ÛY\Z:&VØ^˝kœ∞0\ÊzK9$<ò\ÏW\ÀÑù;wŒú˙Æ\∆¯¯¯\Ã˜\«\Ô+“ü\Èç\ÏB\ƒJB	\’>Ò’ä?Ø££\√Ù&ÃÖπ\ﬁRÖE≠$î	ùùù3´ãø/N©WéM’àk\‚t\√r≠$Ã∂≤Ë£èéß\‰~œ∂0\ÊzK™\◊$îün\Ë\Í\Í˙ˇ\ÈÖ≈ä\”[∂l©<\r\·\ÿ4\œ)ámﬁºy*ÆI®•Ω{˜N\‰rπ=\„\¬\\ò\Î-eP®F\Z˙\ Wñ:$î+á<\€sÿΩ{˜\‚	˚˛˚\Ô≥Z{Ú\…\'\«,ÛsaÆ∑îAa>Ò\»Úk{∫aÆ\”\Â\◊,86Õ±ö˚$\ƒG \Î\·‘©SSVÑπ0\◊[ †P≈†\–[:à«Öàµ∞k\◊.´\nÛâ\„∆•|r°\⁄\€\€\«‚ºìÇô\ÕB~!ÃÖπ\ﬁR\Õ4(T”ü±ìb\È\∆x\◊\È“•öè\‚\”ùº\œdP!∂eﬁ±cGVO€∑o?[j6˚s_∂\‹\’\€\“\“Úsa.\Ãıñﬁí}ˇs}[\Êô\Ô{\ÂïWj}L*û3Tà{7ƒ∂\ÃıtÙ\Ë\—Û\È\≈\Ë6(‹¥[\ÿ˚≥M\Ÿ\¬\\ò\Î-Ω\’l\Ÿw˝\ﬁ\r3è\÷Ùòõ2ï˝[∫M\‚O£££u\∆\∆∆ä\È\≈¯‹†0˚ˆ¢ï\Àr\¬\\ò\Î-Ω\’l\Ÿw˝O3__\Óã+\≈éeˇé\œM\‚.ê•<\’K¸}qg/É¬º˚ëø\Àr\¬\\ò\Î-Ω\’lŸój¢Ùˇ\Àıë»π>*YˆwOöfy¡ná%\ﬁ–£©Jò7V\È-•∑\Í[ı>&ô*¨Zµ\ÍZΩW&&&\∆LmsN\’\«c_Ûx\‡^\À\√\ﬁı\È-Ω’å\Ÿª%ZQhk◊Æù™˜5\n_|Ò\≈?úöıá\ÂÜø]\Áë\”_9k\›)èsΩ•∑\Ó¸˛tçBŸ∏q\„\ŸzÍ°ßß\Á/Æ,Ω\·á\Â\√ÿÅ¨2\ƒogò\œıµF\\ò\Î-Ωu\Á˜ßO=4êW_}uGΩ˜Q\Ë\Í\Í\⁄Î≥™3?≥æ\À\Ê\¬\\o\È≠f\œ>˚(4ê^x\·\'k÷¨˘°é;3N∂∂∂˛\À\ÓW\’\Ê\¬\\o\È≠f;3¶\„\ƒt=vf\Ã\ÁÛ\◊\Ï\Ã8è\Œ\Œ\Œ\÷\Î^===;\Ìß-ÃÖπ\ﬁ\“[Ö˘∏\◊Cy\Ï±\«V<˚\Ï≥\”uXUomm=\·]\¬\\ò\Î-ΩeP®bP®˘\›#\”1ÈöªGV©P(uww\◊tJà\Î!bbõ\Ôº)\¬\\ò\Î-ΩEH«åJÚ\Œ\Œ\Œe˚®d|$2ΩAæZæö\‡\ÿ4ˇãq_{{˚\ƒpMÜÑ°°°=\È\ÔM\€˝û\Ì\∆Û{|ÑÕ††∑ÙVÉõR],–ª∫∫ñ<,ƒê∞eÀñÚ\Î.;6U)ü\œ\Á\nÖ¬ïb±∏¨C¬Ö∑∂∂~jY\Á\ŒsePPz´ë¥¥¥¨,]\ÿXZYX\Ïià¯}+	N9,T.ók\Ô\ËË∏º\\+±íCBz°7xvÖπ0\◊[ †∞»ïÖ∂Úa!ÆYà\„S\’~∫!.\\,ø&! ±i	\”[>üˇ˙Ω˜\ﬁ˚v	8éøˆ\⁄ko\∆\ÈÜxÅ=´\¬\\ò\Î-ePX\Í±)\’x˘Å>Ü\ÿg!6eä’Ç\“iâ8Ω;.\∆fJØø˛z∂j’™*vÉº\Ïÿ¥\ÁÖ\“\‰\’_(\∆Nú81±ê}ˆ\Ôﬂø+\r\Z\«\„\‚\Á}Ñπ0\◊[ †∞ú«¶ÚèM.≤õñ˘Ey(Ü∂∂∂\‚÷≠[O>|¯\”4•çñn$7xä{7Ùıı˝y”¶M\Ôß\È\Ó\\º1©πÇTòsΩ•\nµ:6]¶2 86\’PÏíï^îu\◊˜\ﬂ˛$\Ó∞U∫\”V\‹D#ˆ«é≠/\Ìj%ÃÖπ\ﬁRzÀ±	Ñπ0\◊[Jo\¬\\î\ﬁÑπ2((Ωs%\Ãıñ\ﬁ\nJò\Î-Ωî0\◊[z0(saÆ∑ÙÄ0\ÊzKoI<@òsΩ•\nÄ0\ÊzK\0a.\Ãıñ\“[Ä0W•∑\0aÆ\nJo\¬\\	sΩ•∑\0aÆÑπ\ﬁ\“[ÄAA	sΩ•∑\0ÉÇ\ÊzKosaÆ∑ÙÄ0\ÊzK\0a.\Ãıñ2(\0\¬\\ò\Î-•∑Ä€°øø_à6NM¶0ü\÷[Jo\r\„\‡¡É£\≈bQê6@çåå¸1Ö˘Ω•Ù\–0~988¯’ó_~9!PoﬂªΩÚæææOS=§∑î\ﬁ\ZJ\nê”ªç\„±4\Á1U\›+û˜3wcê\Î-Ω\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07¯/\Óå˙≤%\√a\0\0\0\0IENDÆB`Ç',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','7501',4),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('2501','CDQXKF',NULL,'','2018-06-03 10:25:32.808'),('5001','CDQXKF',NULL,'','2018-06-03 11:14:21.553');
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
INSERT INTO `act_re_model` VALUES ('1',5,'CDQXKF','ËèúÂçïÊùÉÈôêÂºÄÊîæ',NULL,'2018-06-03 09:08:45.834','2018-06-03 10:37:22.218',1,'{\"name\":\"CDQXKF\",\"revision\":1,\"description\":\"ËèúÂçïÊùÉÈôêÁöÑÂºÄÊîæ\"}',NULL,'2','3','');
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('CDQXKF:1:5004',1,'http://www.activiti.org/processdef',NULL,'CDQXKF',1,'5001','CDQXKF.bpmn20.xml','CDQXKF.CDQXKF.png',NULL,0,1,1,''),('process:1:2504',1,'http://www.activiti.org/processdef',NULL,'process',1,'2501','CDQXKF.bpmn20.xml','CDQXKF.process.png',NULL,0,1,1,'');
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-03 19:15:58
