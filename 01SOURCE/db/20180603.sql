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
INSERT INTO `sys_code` VALUES (1,'YesOrNo','1','是',NULL,1,'2018-05-27 22:22:08','','','',''),(2,'YesOrNo','0','否',NULL,2,'2018-05-27 22:22:08','','','','');
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
INSERT INTO `sys_extend_property` VALUES (1,'YesOrNo',NULL,'2018-05-27 22:04:27','是否标志','SELECT code ,CODE_NAME,\'\' as filter FROM test.sys_code order by display_sn'),(3,'Role','2018-05-27 16:34:49','2018-05-27 22:04:27','角色','SELECT id,NAME,\'\' as filter FROM sys_role');
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
INSERT INTO `sys_menu` VALUES (1,'2018-05-14 18:26:02',1,'',NULL,'映射管理',0,1,NULL),(2,'2018-04-05 20:08:18',2,'',NULL,'仓库映射',1,3,NULL),(3,'2018-04-05 20:08:40',2,'',NULL,'组合映射',1,4,NULL),(4,'2018-04-05 20:09:04',1,'',NULL,'工作流管理',0,2,NULL),(5,'2018-04-05 20:09:24',2,'',NULL,'变量管理',4,1,NULL),(6,'2018-04-05 20:09:35',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/process-list','2018-06-03 01:21:13','流程管理',4,3,'true'),(7,'2018-04-05 20:09:44',2,'',NULL,'节点管理',4,2,NULL),(8,'2018-04-27 15:33:08',2,'/template/sys/assistant/generateEntity',NULL,'实体映射（数据库）',1,1,NULL),(9,'2018-04-09 23:19:03',2,'/template/sys/menu/menu',NULL,'菜单管理',15,1,NULL),(11,'2018-04-09 23:47:46',2,'/template/sys/role/role',NULL,'角色管理',15,2,NULL),(12,'2018-04-09 23:48:22',2,'',NULL,'权限管理',15,3,NULL),(13,'2018-04-09 23:50:10',2,'/template/sys/admin/admin','2018-05-22 14:30:15','操作员管理',15,4,NULL),(14,'2018-04-09 23:50:19',2,'',NULL,'组织管理',15,5,NULL),(15,'2018-04-23 17:34:11',1,'',NULL,'系统维护',0,0,NULL),(16,'2018-04-23 17:36:34',2,'/template/sys/config/entityFilterParamConfig',NULL,'实体过滤字',1,5,NULL),(17,'2018-04-27 15:43:48',2,'/template/sys/assistant/generateEntityOom',NULL,'实体映射（oom）',1,0,NULL),(393,'2018-05-26 21:45:15',2,'/template/sys/extendproperty/extendproperty','2018-05-26 21:56:22','扩展属性',15,10,NULL),(394,'2018-05-26 21:45:43',2,'/template/sys/code/code','2018-05-27 22:13:24','系统代码',15,15,NULL),(395,'2018-06-03 17:04:19',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/model-list','2018-06-03 17:04:19','模块管理',4,NULL,'true');
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
INSERT INTO `sys_role` VALUES (2,'2018-05-21 17:42:54','2018-05-27 21:14:30','系统维护管理员'),(3,'2018-05-21 17:45:12','2018-05-27 21:14:30','映射管理员'),(4,'2018-05-21 17:45:35','2018-05-27 21:14:30','工作流管理员');
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
INSERT INTO `act_ge_bytearray` VALUES ('2',3,'source',NULL,'{\"resourceId\":\"1\",\"properties\":{\"process_id\":\"CDQXKF\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\"}],\"bounds\":{\"lowerRight\":{\"x\":90,\"y\":108},\"upperLeft\":{\"x\":60,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\",\"properties\":{\"overrideid\":\"\",\"name\":\"菜单权限申请\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\"}],\"bounds\":{\"lowerRight\":{\"x\":265,\"y\":133},\"upperLeft\":{\"x\":165,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":512,\"y\":107},\"upperLeft\":{\"x\":484,\"y\":79}},\"dockers\":[]},{\"resourceId\":\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\"}],\"bounds\":{\"lowerRight\":{\"x\":164.78125,\"y\":93},\"upperLeft\":{\"x\":90.21875,\"y\":93}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\"}},{\"resourceId\":\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\",\"properties\":{\"overrideid\":\"\",\"name\":\"菜单权限审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\"}],\"bounds\":{\"lowerRight\":{\"x\":416,\"y\":133},\"upperLeft\":{\"x\":316,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"}],\"bounds\":{\"lowerRight\":{\"x\":483.59375,\"y\":93},\"upperLeft\":{\"x\":416.5,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"}},{\"resourceId\":\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\"}],\"bounds\":{\"lowerRight\":{\"x\":315.453125,\"y\":93},\"upperLeft\":{\"x\":265.546875,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('2502',1,'CDQXKF.bpmn20.xml','2501','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"process\" isExecutable=\"true\">\n    <startEvent id=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\"/>\n    <userTask id=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" name=\"菜单权限申请\"/>\n    <endEvent id=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"/>\n    <sequenceFlow id=\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\" sourceRef=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\" targetRef=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\"/>\n    <userTask id=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" name=\"菜单权限审批\"/>\n    <sequenceFlow id=\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\" sourceRef=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" targetRef=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"/>\n    <sequenceFlow id=\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\" sourceRef=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" targetRef=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"process\" id=\"BPMNPlane_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\" id=\"BPMNShape_sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"60.0\" y=\"78.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" id=\"BPMNShape_sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\" id=\"BPMNShape_sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"484.0\" y=\"79.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" id=\"BPMNShape_sid-03169B91-F44C-43EB-9B70-2637D7224D4C\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"316.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\" id=\"BPMNEdge_sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\">\n        <omgdi:waypoint x=\"265.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"316.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\" id=\"BPMNEdge_sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\">\n        <omgdi:waypoint x=\"90.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"165.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\" id=\"BPMNEdge_sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\">\n        <omgdi:waypoint x=\"416.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"484.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2503',1,'CDQXKF.process.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\n\0\0\0�\0\0\0�#�\0\0\n�IDATx\�\�\��o\��p�����dK柰���\����\�;�����$dJJP\"h�[���\rK�A\�1)�b�*�@\'!+�R[���Hk-�\��\�q\�q���厃{<�W\�^���W��׽?�{\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��dYv\�s\�\�9v\�\����Yoo��s���e�w��\�Rzh(\�ʊ\�b655�nS]�x1;p\��\�)\�\�[Jo\r#\�\�	�	���.��\�Rzh�$,H�R�O\�-����\�1�hC�y���\�\�0���\�\�\��7�\�}�g*�;�&���\�\�[@�\n�\�G��{6f�����\�k�\�zKoM<(|~�O7y�.�\�\�\�\\o\�-���3l�e�\�cBX�\�-�4��q\�[�y<&���\�\�[�AA�s���\0�\�\�W�\�*\�\�1!,\���\��xP8{\�w��xLs����&.�e\�\�yi8}-\�\�\\o\�-����O���Ma_�\�\\o\�-�\��\�\�\���\�K\�\�k�\�zKoM:(\�\�x\�G~{\��\���\�\�[@�\r\n\�\�\�\�ف\�\��~s\� /U|O|�w�\�\\o\�-�	��\�\�y(\���\��xP�\�\�\\\�\0��0\�[z��\�|�A^*�,\���\�\�\�0W\�\\o\�-\0a.\���\�\�\�\\o)� ̅�\�R\�FY��hhh��\�[oغu\�\�O=�\�t[[[�r\�\�,�\�_{\�\'����s۶mۙ\�g�1a.\���2(\�C.��qKK˚t<z\'\�\�T�\�ؔj2\�\'\�\�\�\�\�\��<[5\Z\�}�ݷ_|�\�\�u\�\�eo��Fv\�رldd$���\�B�Z,��>�(K�D��\�O_{\�g\�wtt��\nsa���A�~�\�_�\�M5u}0��>Hߟ�\�-�4���\�K߭_�~f�z�jV��\'Of6l�Z(άX�⧞Ma.\���2(,�t��/\��-`8��96-m\�\�={�<��\�Yww���J��\�\�\�\�\�\'�.sa���Aa�ZZZV��������\�岗_~9\�>�\�\�o��9�\\�ref��ȑ#\��\�۳Gy�rX�lua�C\�\�\�\�_׮]�\rg\�\����Y\Z:&V�^�kϰ0\�zK9$<�\�W\���;wΜ��\����\��\�\�+ҟ\�\�B\�JB	\�>�Պ?���\��&̅�\�R�E�$�	���3���/N�W�MՈk\�t\�r�$̶��裏��\�~϶0\�zK�\�$��n\�\�\���\�Ŋ\�[�l�<\r\�\�4\�)�m޼y*�I���{�N\�r�=\�\�\\�\�-eP�F\Z�\�W�:$�+�<\�sؽ{�\�	���\�Z{�\�\'\�,�sa���Aa>�\��k{�a�\�\�\�,86ͱ��$\�G \�\�ԩSSV��0\�[ʠPŠ\�[:�ǅ���k\�.�\n�\�ƥ|r�\�\�\�\�⼓��\�B~!̅�\�R\�4(Tӟ��b\�\�x\�\�ҥ��\�\���\�dP!�eޱcGVO۷o?[j6�s_�\�\�\�\�\��sa.\���ޒ}�s}[\�\�{\�Wj}L*�3T�{7Ķ\��t�\�\��\�\�\�6(ܴ[\���M\�\�\\�\�-�\�l\�w�\�\r3�\����2��[�M\�O���u\�\�Ɗ\�\��ܠ0����\�r\�\\�\�-�\�l\�w�O3__\�+\��e��\�M\�.��<\�K�}qg/�¼���\�r\�\\�\�-�\�lٗj���\���ȹ>*Y�wO�fy�n�%\�У�J�7V\�-��\�[�>&�*�Z�\�Z�W&&&\�LmsN\�\�c_�x\�^\�\�\��\�-�Ռ\��%ZQhk׮���5\n_|�\�?����\��]\�\�_9k\�)�s���\���t�Bٸq\�\�zꡧ�\�/�,�\�\�\�؁�2\�og�\���F\\�\�-�u\���O=4�W_}uG��Q\�\�\�\�볪3?��\�\�\�\\o\�f\�>�(4�^x\�\'k֬���;3N����\�\�W\�\�\�\\o\�f;3�\�\�t=vf\�\��\�\�\�8�\�\�\�\�\�^===;\�-̅�\�\�[���\�Cy\�\�V<�\�\�uXUomm=\�]\�\\�\�-�eP�bP��\�#\�1隻GV�P(uww\�tJ�\�!bb�\�)\�\\�\�-�EHǌJ�\�\�\�e��d|$2�A�Z��\�\�4��q_{{�\���pM�����=\�\�M\���\�\��{|�͠���V��R],л���<,Đ�e˖�\�.;6U)�\�\�\n�b���C���~jY\�\�sePPz������,]\�XZYX\�i��}+	N9,T.�k\�\�踼\\+��CBz�7xv��0\�[ʠ�ȕ���a!�Y�\�S\�~�!.\\,�&!ʱi	\�[>�����\��v	8���\�ko\�\�x�=�\�\\�\�-ePX\�)\�x��>�\�g!6e�Ղ\�i�8�;.\�fJ���z�jժ*v��\�ش\�\�\�\�_(\�N�81��}�\�߿+\r\Z\�\�\�\�}��0\�[ʠ��Ǧ�M.����Ey(����\�֭[O>|�\�4���n$7x�{7����yӦM\�\�\�\\�1���T�s��\n�:6]�2 86\�P쒕^�u\��\��$\�U�\�V\�D#�ǎ�/\�j%̅�\�Rz˱	��0\�[Jo\�\\�\���2((�s%\���\�\nJ�\�-��0\�[z0(sa����0\�zKoI<@�s��\n�0\�zK\0a.\���\�[�0W��\0a�\nJo\�\\	s���\0a���\�\�[�AA	s���\0��\�zKosa����0\�zK\0a.\���2(\0\�\\�\�-���ۡ��_�6NM�0�\�[Jo\r\�\����\�bQ�6@����1�����\�0~988�՗_~9!Po߻�򾾾OS=���\�\ZJ\n�ӻ�\�4\�1U\�+��3wc�\�-�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07�/\����%\�a\0\0\0\0IEND�B`�',1),('3',1,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\02\0\0\0�\0\0\0.�\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0�\�\0\0u0\0\0\�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0�\�\�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\�\0\0\��+\0\0\�IDATx\�\�\�	tUս\��$����PQ��.����J+\�S\�\�\�Ym\�>��R\\�\�T[QE�2+�80X�\"� �d��Ȑ��Hr\��w\�IOB�!7�~?k\�u\�M�9��\�g\�}�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0D�6j�P(��m۶_fee\r=r\�ȥ\�\�\�Il�\�\0bbB���V?~|\\׮]?$��-b2@�$�\���\�&77��\�͛��\r�\r\Z�\�\�X6N%)a[w���.--\�X~~������}��I!�@l�B��;v\�ߺu\�M-[�t\�w�Zyl�j�{�n����\n��\�\��\��-��86\�9\�\�\�v\�ڹ�M��hj�z#\Z7n\\g߾}\�:t\�ԩS�Ml�\��p�\�\�o����h���O��Ѭ�.m\�[.m\�_\��m�#���\�z\�\\|b2���p\�\�\��2\�iӦ\�#��-b\��;\Z|�q\��/+\�\�\\�\�\���+\�?\�By\�\��-n\�\�\�.7s�\nԫWϵjժ ..\�\��El�B8��/5�R\�Jsp�G.\�X�I?W\�ٿm)���hѢq||�ŋ/��\�\"��-P\�\0\�i��ARָ��S��բF\�i֬Y�]\�Ll[\�(d�r\�Z�[�P��b���ԤI��\�;�El[W�l�-H�8�\��p�]5%�@l!\\\�#�����X�,L\'��\��-P\�\0U�Nݳ\��]|\"�m[\0�\�\Z�\�\�\�\���:u]\����@l2@��ߴ��\�\�\�Rޠ\�el [\0�\��\������\�0 �\0\n |\��\�[e5\�M\'�.��f�\�Ӊ\�c\0b��\�J\�\�5�h&y\�}S�#\�\�]\�\��\�Ў.ĺ ���\�\�7Ԋ��\��뵊\�C\�\�\��e\�쒾.\�[� ��HD�Z�\�M4\�Z\�ֺ޾\�6 �-�B8s\�\n�(}{1@l��SK{m{�a#�\�P*zd\0\0\0�\0\0\0�\0\0\0�\0\0�t�-E(Jڰa\��]��\�={�tؽ{�Y���񹹹.>>>ԠA�\�7ޕ���\���x\��\Z\0��\r2�E^^^����\�\�\�vin��vɵK�\�u���\�\�\�fN�>�K\n�(,`\�|�\�	cƌ|\����v\�ڹ\�ݻ�.��Y\�⒒��31�Nعsg디�\�k֬�u\�ȑ;���\�L�0a[\0P\�\�߮\�*((\�f�JB)I�K+�]+�����A��\��\�3f̘F!>�\�;��222\�﮸\�\ng\�ɑbŌ.M�6u\��\�w\�O�Ә�\�\�_8s\�̗�~\���o�3g\���E\0�e�H\�\�\�\�\�\�S��w�\�u�\�n�\�푚�����r�\�o��hʔ)=���z�\���\�\�TT�\�%n\�mgϞ�ٝw\�y�3\0�\�8p\�\�\�ؗ\n\n\n\�����\�o\�u\�\�ٵi\�\�5j\�\�5h\��9rĥ���\�\�T�r\�J�f\�\Zw��q�i]\�yk<\"{g���Q�lٲK�,�\�\�{\�u_|q�^�O�>�m۶uǎ�ǟ��牓&M�3�\"\0�EL?+b�Y\�0jh_{\�\���\�:\�,\�r\�y\�.]�xE\�;\�\�\�{\�=�����Է���3IV\�DTC;�g-�\'f޼yW=��Õ.b|^x�=zt]��0C\�\0�YĨ\'f�^�\�\�\'�\�@\�R��Ҩ�F�\��4\�3Ѐ�i�)j���J�\�\�w\�]\��(/�\�o�\��u\�\�y\��-�%\0�<4&&..\�%����\�Kݣ�>Z�9z��߾}�`13>�rST2���hѢ�\ZSU=1%�gƪ\�D��_c\�\0�+)\�\�N�\�Ĩ\'\��\��\��T�N9��׿C:\�4�B��?�dM�֘�\�Էoߺ\r6l\�)&\0�\�\�k+b~�\�\Z�⣲EL��\���d��������QoLJJ\�O4źN�:\��~Ç?\�*컢i۶��{�\�L\��\���r��V�tRY�z���\�\�ᑰݣ\�`�{�\�\��)\�5\��\�/OHLLl��3g\�L��\��\�A\�9眓c�{111���ϙ3\'��>��c\�\\BB�5����n\�*y}�{�\�s���\�U���il8p\�\��7�Nl!\�ӎ}\�\��Zy\�S+�Z�\�m�Ru�\�\�ܻ\�\�O\�\�\Z	�)\�zd��e-vW]ڷo�fW�m[\�N\\׮~l;�{���XKe�]��\�ے�\�������.��կT��+V���,�|�r7v\�X\�wvPq(�\�\�_\�}�\�WŒ�Z.V���>����C�����\�SO=�\�q\�s\�ׯw/���w߿L�0����\�e���\���\�\�\�\�\�)iĈnٲe\�\�;vDbl�e�A���\�\�Ӊ�Ӌ-���\�����\�[�D�kذa^�%(��\�\�Ӯ~8�\����\�\��|����|u\�l&-\�\ZP\�sSԕ��\�$}\�@M\�ܹs��\�_�^�qQ�okp\�-v}��\�N��ݞe��K�.��#�\�M�\�\�NT\�\�:޹s��_��\�\�\��\�Shݺ���\��\�s>x��\�7�Q�\\�<^���\�O{�\'N�\�^}�U׬Y���{m|\�_|\�-<U�^=\�Z9�&M�\�nHLLt\����\�ݖ-[�������\�\�Kl>%Ƚ{��\�SRR\�\�g�\�}n9t\�w}�\�7{\�Ze�m۶^�\�Kܶmۼ\�x\�\�\��\�ƍݓO>ɱ�l�[-�n�\�ʵ�f�%�7���cK�,�^z\�bIM�bK_\�\"\�y\�ԩ��:={�,\�)\�\�Lz�N\�\�7Ȯ\�\�g�9\�\�sN\��,�\�$��yu\�\�[N�\�\��\�u��/�Ԍ���\�o~S\�y�\�\"���ݼy�,;\�+K����\�)S�\�V�E5\�_\�l4%�8u�W�z�\�\�^2�뮻���y\��\�\�~\�}\�{\�s\�Ǐ�z\�\�si��W �=\�{-�@��C?��꫽��E��\�S�E��\�k��n�[�\�k-��ق�\��\�?��?�O��nw\�\�ջ�hѢ�b&\�\�\�.�\�2/	\��u\�\�-��zn�\�h�-�x�Y|\r;\�s[\�X�S�ĖsK�,q#G�,���b�z�*\�\r\�ߤ\"F\�\�kk�XM\�\�`Tͱ\�/��v\�����\�\�!�3��C�j\�*x�\�禨+d�-\�\�Z�Iv�kj��g\�GُKm��y������\�+B\��\�7m\�\�6o\�\��u^X?S2��\�/]�-����%�D����	�\���D\�\�,\�\�۷����D�\�\�\��|��E����T�ϣV�����աC�b�f�x��f\�Hg�m��\�}���ݰaC�(��\�G}�\���\����ߩծ�\�E�O�@�w�����{I�6Ʈ0�uj�ǅ��%ZcKE�^_\�*�D=9z=�1*�o�\�&\�\n ].\\\�2z\�+��\�=F=9���\�\�|\�\���ت���\�\�A�W|��\��]u\��߄B��Q�Td����,h���n�Z����S\'����\�$4v@]�\Z��$���],єl\�\�\�\�P\��E�\�\�\�>콦���?@sժU\�\�+��~����\�+��\�,:U\�����<�ǫ����\�\�?,:���]�Q�>G���!�\�H!�\"i\�ڵ.Bb��h���-[zŇV1\�ѣGQ\�Ϯ]��\n�\�*�>/iii�cǎ\�\�\�gܺu�כ\�ۉ�ت\nEcV�j\�uY4�D/&�L�\�\�KLY1S�\�L�N��ϝ;��3�G\�f.ρ)T\��+\�J\�j\�J�������\�K6\�\��[\�:\��\��\�\�k��\�J\�\�\��\"ݺu�\�E\Z�\�\Z۠��Q��V�\�j��5��Pr\�?k\�,/\���f%D%���\\��Pc�\��\�K\���)	͘1\�;�\�S��ַ�\�WE赶o߮��X-��k\�6��\0��OS곟{\�\�),�\�\��V�\���X\�\��\��\�\�)/�vE�al�\��\�ϽbF�bu3��`��B��INN>����\�w�\�k� ͝9s\�Ѱ�\r\ZT\�\�l;j�m/1*b\�~�\�_b�\�Vd��qw\�qG�\"\�V�+�e��\��7LE�?�@\��ӟ�\�:h\�q�\�E|�.\�\��B�\�x�y�\�y3�\��\�\���Od���Iio\Zl\�\�8��?��O\�=u\�Z=,j\��-v?�)y�?\���j���\Z�\�׍8]M�4�\n�x\�\�0�-\��f<-k�\�Xb�xl��znD��12�\�\� s�N�� R�NW�U<WF�\�V\r��\n��R\�\��\��\'�\�c5��:�~�~\n�Z�Q�F;lnS���d�d��\�GmgM,lu��QV\�\��(�X�I���\��:آ\��|%u��\�\�w�kL�h́P\�y~��\��/��Z\�\�=��ץ~\�E`�A�r\�UWy\��%[\�:`h6\�o�\�\� R�\�T��쪅��J�\�~˻d�\�`\�\�/����\�\�P\��}~\�.�i�\�b\�8��b��\�R��^$�(\�)+]�������]+�TX}M\�\�B���\�c_��\�ӊ�u~!����^/H��\�Q\�Ծ�e)))m:w\�\\c\�b\�\n��E\�\�\\�#k�k�w,)/�\���{*tp\��\�\�n�\�;5�\�\�1c\�\r7\�\��\����i�A�S9\��\�A^pi�S�\�W�S��\�\�4\�SEJ�\�D�\�:&H�J�q�\��\\�Bѽ�\�k\���\��>[p���[iωq�b���BJ��SB\�Q��YU~��\�A\Z+�[%\�\'\�\�t�}�/�\�{k��\�\�]J�r���)\�\n����\'l��=???��\�˵V��e��h\�\�\�:���Z}�p�kzu����Z\�Z?\�G?���4��ޥKo�\��\�\�\�k]�\���\nW�<e2.���>}�7\�C�i��\\p��(�\�J.j-\�4�Z\�\�\�\�\�f�\�{o�\�r�\���Ԋ�\�{�\�\Zث�\�gԬmb�\�Rl�\�	zO��ş)\�=\�ȫXZ�x�78�\�;\��\n.?\�\�{�\�ǧm\�����\�M\r$\�\0�\�XO=yV|�qS���2�����؎�\�墲F\�W%;�ͳ���Q���,R��1�:Z\�e\�tPu\��Z�֪\�Z\�#�\�GI��\\�\�=�\r���z<�R���N�\��D�.�`K^�u:�\�u\�k}\�`)\�\�\��y�?c\�������V�Ղl\��U�Ng{rJn�Z\�^�gQ矪\�j\�\�\���Ξ�h�O+Z��}u�A����P\����i,��~�<rSL4F�\�\�\�A\�/O>�d|5�ʤ[ n��|vƌ\�\�\�\�\�Z~!f\�<\�\�\�ݻw�b�z\�\'-_h\�s��L=|U9VF+R?�\��!+T�mnEװH\�M�\�,�\'O�����Iou\Z7n�zc��\�\�3�]\0p*VT̷����^�\��\�\�k\��/��\�1fy�\�\�h\r����\�z\�\�\n�6lx{�\�\�\�[\������\0@\�\�`%oJ�Ni>�\�3�.fT\�XQڵk�\n\"+�rS\�2:/x\�ر_X��\�\�%Y�|<v\�\�(�k�\�\�\0��\�P(t�\��M\�\�\�D\�PE\�y���\��q]t\n\�rӈH\�M�\�0ӦM����u��Q����gF=1�\�����\�\08]�f\�\�)�_�Ōzfz\�!o[�\�\�ʤ\�YQ䍉	�\�hF\�C�����{\�-0^8p\��ѣG�2`���~��ի\�\0\��g�}v��U��\"\�C�S\�\0aE\�\�M��4>&&��\�\�\�KD5�S\�u\�\�\���l͞\�:}�\�E�\�im�=zT�~O�ֳ�;sS<\�r��4h\�\'�gϞlAr\��\�Ó;v\�X��O\�]�x���S��\�\�\�kc׃\�I\0��\�M�W&jZ�~��F_�\�\��qY�11���(d�S��\�\�,h�7nDBBB��m\�~յk\���[�Nhܸqs-����תތ�7n^�|y\�\�͛/��\��NKK�\��^\0@\�\�\�MV�����i\�\�\�v�鹉B\�\�\�*�s�\�b���֭[w�ݿҝ��P}�KCw\��]�2\�ve�\�\0\�`n*((`����\�&\�(\�v\�w\'\�k\�FKn��)�VY��\�/\0\0��\�P,�\0\0\0P\�\0\0\0P\�\0\0\0P\�\0\0\0\n\0\0\0\n\0\0\0\n\0\0\0\n\0\0@!\0\0@!\0\0@!\0\0(d\0\0\0(d\0\0\0(d\0\0\0(d\�A*((`C��?l��<b\�(d�rJJJ\�w��a6D8t\�P�]�#�@l�B(�:u\�,\�\�\�`C�����L�ZJl�\��PN���O\�ٳ\�x(bc�Y��®\�[ �@!�S�n\�VZ��l�\�\�l�3(%%e��v�\�\��b\�(d�\�k9MMM=���\�\�8\�\�\��j-\�\n\n\nF[ �\�\�\�GӦM\�?lذ���aÆI���l�\ZL46lh�?\�^{\�rb\�(d�\n�:u\�֡C�~�w\�\��v\�\�NNN�k\�l�ꓚ��2\'55��M�^�[ �\�\�s�.\\\�666������M�6��I�&\�ZK�����SIZ\�C\�`5�D�/5nA]�}��I!�@l�B�B�-\�`���\�fw�\\i�$�J�iA2�\�\�.�u�%�El\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@D�yv5*#9\0\0\0\0IEND�B`�',NULL),('5002',1,'CDQXKF.bpmn20.xml','5001','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"CDQXKF\" isExecutable=\"true\">\n    <startEvent id=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\"/>\n    <userTask id=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" name=\"菜单权限申请\"/>\n    <endEvent id=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"/>\n    <sequenceFlow id=\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\" sourceRef=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\" targetRef=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\"/>\n    <userTask id=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" name=\"菜单权限审批\"/>\n    <sequenceFlow id=\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\" sourceRef=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" targetRef=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\"/>\n    <sequenceFlow id=\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\" sourceRef=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" targetRef=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_CDQXKF\">\n    <bpmndi:BPMNPlane bpmnElement=\"CDQXKF\" id=\"BPMNPlane_CDQXKF\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\" id=\"BPMNShape_sid-DD6F6EA0-F192-4B9B-90B5-E66A9AA00AF4\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"60.0\" y=\"78.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\" id=\"BPMNShape_sid-29306664-D2B3-4FE9-84B0-87488FC85B5B\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\" id=\"BPMNShape_sid-EB3BF318-A4E3-40A5-9746-DD84E8472671\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"484.0\" y=\"79.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-03169B91-F44C-43EB-9B70-2637D7224D4C\" id=\"BPMNShape_sid-03169B91-F44C-43EB-9B70-2637D7224D4C\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"316.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\" id=\"BPMNEdge_sid-FE84D26A-E90A-4D89-8AA2-E4BEEA9A8A63\">\n        <omgdi:waypoint x=\"265.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"316.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\" id=\"BPMNEdge_sid-8FDA2DE1-7C19-47A0-9ED8-3177686CA2AE\">\n        <omgdi:waypoint x=\"90.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"165.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\" id=\"BPMNEdge_sid-3425BE6E-6DF4-41EF-958A-5AAD93D65F90\">\n        <omgdi:waypoint x=\"416.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"484.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5003',1,'CDQXKF.CDQXKF.png','5001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\n\0\0\0�\0\0\0�#�\0\0\n�IDATx\�\�\��o\��p�����dK柰���\����\�;�����$dJJP\"h�[���\rK�A\�1)�b�*�@\'!+�R[���Hk-�\��\�q\�q���厃{<�W\�^���W��׽?�{\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��dYv\�s\�\�9v\�\����Yoo��s���e�w��\�Rzh(\�ʊ\�b655�nS]�x1;p\��\�)\�\�[Jo\r#\�\�	�	���.��\�Rzh�$,H�R�O\�-����\�1�hC�y���\�\�0���\�\�\��7�\�}�g*�;�&���\�\�[@�\n�\�G��{6f�����\�k�\�zKoM<(|~�O7y�.�\�\�\�\\o\�-���3l�e�\�cBX�\�-�4��q\�[�y<&���\�\�[�AA�s���\0�\�\�W�\�*\�\�1!,\���\��xP8{\�w��xLs����&.�e\�\�yi8}-\�\�\\o\�-����O���Ma_�\�\\o\�-�\��\�\�\���\�K\�\�k�\�zKoM:(\�\�x\�G~{\��\���\�\�[@�\r\n\�\�\�\�ف\�\��~s\� /U|O|�w�\�\\o\�-�	��\�\�y(\���\��xP�\�\�\\\�\0��0\�[z��\�|�A^*�,\���\�\�\�0W\�\\o\�-\0a.\���\�\�\�\\o)� ̅�\�R\�FY��hhh��\�[oغu\�\�O=�\�t[[[�r\�\�,�\�_{\�\'����s۶mۙ\�g�1a.\���2(\�C.��qKK˚t<z\'\�\�T�\�ؔj2\�\'\�\�\�\�\�\��<[5\Z\�}�ݷ_|�\�\�u\�\�eo��Fv\�رldd$���\�B�Z,��>�(K�D��\�O_{\�g\�wtt��\nsa���A�~�\�_�\�M5u}0��>Hߟ�\�-�4���\�K߭_�~f�z�jV��\'Of6l�Z(άX�⧞Ma.\���2(,�t��/\��-`8��96-m\�\�={�<��\�Yww���J��\�\�\�\�\�\'�.sa���Aa�ZZZV��������\�岗_~9\�>�\�\�o��9�\\�ref��ȑ#\��\�۳Gy�rX�lua�C\�\�\�\�_׮]�\rg\�\����Y\Z:&V�^�kϰ0\�zK9$<�\�W\���;wΜ��\����\��\�\�+ҟ\�\�B\�JB	\�>�Պ?���\��&̅�\�R�E�$�	���3���/N�W�MՈk\�t\�r�$̶��裏��\�~϶0\�zK�\�$��n\�\�\���\�Ŋ\�[�l�<\r\�\�4\�)�m޼y*�I���{�N\�r�=\�\�\\�\�-eP�F\Z�\�W�:$�+�<\�sؽ{�\�	���\�Z{�\�\'\�,�sa���Aa>�\��k{�a�\�\�\�,86ͱ��$\�G \�\�ԩSSV��0\�[ʠPŠ\�[:�ǅ���k\�.�\n�\�ƥ|r�\�\�\�\�⼓��\�B~!̅�\�R\�4(Tӟ��b\�\�x\�\�ҥ��\�\���\�dP!�eޱcGVO۷o?[j6�s_�\�\�\�\�\��sa.\���ޒ}�s}[\�\�{\�Wj}L*�3T�{7Ķ\��t�\�\��\�\�\�6(ܴ[\���M\�\�\\�\�-�\�l\�w�\�\r3�\����2��[�M\�O���u\�\�Ɗ\�\��ܠ0����\�r\�\\�\�-�\�l\�w�O3__\�+\��e��\�M\�.��<\�K�}qg/�¼���\�r\�\\�\�-�\�lٗj���\���ȹ>*Y�wO�fy�n�%\�У�J�7V\�-��\�[�>&�*�Z�\�Z�W&&&\�LmsN\�\�c_�x\�^\�\�\��\�-�Ռ\��%ZQhk׮���5\n_|�\�?����\��]\�\�_9k\�)�s���\���t�Bٸq\�\�zꡧ�\�/�,�\�\�\�؁�2\�og�\���F\\�\�-�u\���O=4�W_}uG��Q\�\�\�\�볪3?��\�\�\�\\o\�f\�>�(4�^x\�\'k֬���;3N����\�\�W\�\�\�\\o\�f;3�\�\�t=vf\�\��\�\�\�8�\�\�\�\�\�^===;\�-̅�\�\�[���\�Cy\�\�V<�\�\�uXUomm=\�]\�\\�\�-�eP�bP��\�#\�1隻GV�P(uww\�tJ�\�!bb�\�)\�\\�\�-�EHǌJ�\�\�\�e��d|$2�A�Z��\�\�4��q_{{�\���pM�����=\�\�M\���\�\��{|�͠���V��R],л���<,Đ�e˖�\�.;6U)�\�\�\n�b���C���~jY\�\�sePPz������,]\�XZYX\�i��}+	N9,T.�k\�\�踼\\+��CBz�7xv��0\�[ʠ�ȕ���a!�Y�\�S\�~�!.\\,�&!ʱi	\�[>�����\��v	8���\�ko\�\�x�=�\�\\�\�-ePX\�)\�x��>�\�g!6e�Ղ\�i�8�;.\�fJ���z�jժ*v��\�ش\�\�\�\�_(\�N�81��}�\�߿+\r\Z\�\�\�\�}��0\�[ʠ��Ǧ�M.����Ey(����\�֭[O>|�\�4���n$7x�{7����yӦM\�\�\�\\�1���T�s��\n�:6]�2 86\�P쒕^�u\��\��$\�U�\�V\�D#�ǎ�/\�j%̅�\�Rz˱	��0\�[Jo\�\\�\���2((�s%\���\�\nJ�\�-��0\�[z0(sa����0\�zKoI<@�s��\n�0\�zK\0a.\���\�[�0W��\0a�\nJo\�\\	s���\0a���\�\�[�AA	s���\0��\�zKosa����0\�zK\0a.\���2(\0\�\\�\�-���ۡ��_�6NM�0�\�[Jo\r\�\����\�bQ�6@����1�����\�0~988�՗_~9!Po߻�򾾾OS=���\�\ZJ\n�ӻ�\�4\�1U\�+��3wc�\�-�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07�/\����%\�a\0\0\0\0IEND�B`�',1);
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
INSERT INTO `act_re_model` VALUES ('1',5,'CDQXKF','菜单权限开放',NULL,'2018-06-03 09:08:45.834','2018-06-03 10:37:22.218',1,'{\"name\":\"CDQXKF\",\"revision\":1,\"description\":\"菜单权限的开放\"}',NULL,'2','3','');
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
