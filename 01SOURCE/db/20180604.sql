-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
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
INSERT INTO `sys_admin` VALUES (1,'2018-05-22 17:26:06','admin','d41d8cd98f00b204e9800998ecf8427e','2018-05-22 17:26:06','0',NULL),(2,'2018-05-22 17:27:27','liulei','c81e728d9d4c2f636f067f89cc14862c','2018-05-22 17:27:27','1',NULL),(3,'2018-05-22 17:28:17','super','c81e728d9d4c2f636f067f89cc14862c','2018-05-22 17:28:17','1',NULL);
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
INSERT INTO `sys_menu` VALUES (1,'2018-05-14 18:26:02',1,'',NULL,'映射管理',0,1,NULL),(2,'2018-04-05 20:08:18',2,'',NULL,'仓库映射',1,3,NULL),(3,'2018-04-05 20:08:40',2,'',NULL,'组合映射',1,4,NULL),(4,'2018-04-05 20:09:04',1,'',NULL,'工作流管理',0,2,NULL),(5,'2018-04-05 20:09:24',2,'http://localhost:8080/base-workflow-test/modeler.html?modelId=1','2018-05-30 17:51:51','变量管理',4,1,'true'),(6,'2018-04-05 20:09:35',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/process-list','2018-05-30 17:29:31','工作流管理',4,3,'true'),(7,'2018-04-05 20:09:44',2,'',NULL,'节点管理',4,2,NULL),(8,'2018-04-27 15:33:08',2,'/template/sys/assistant/generateEntity',NULL,'实体映射（数据库）',1,1,NULL),(9,'2018-04-09 23:19:03',2,'/template/sys/menu/menu',NULL,'菜单管理',15,1,NULL),(11,'2018-04-09 23:47:46',2,'/template/sys/role/role',NULL,'角色管理',15,2,NULL),(12,'2018-04-09 23:48:22',2,'',NULL,'权限管理',15,3,NULL),(13,'2018-04-09 23:50:10',2,'/template/sys/admin/admin','2018-05-22 14:30:15','操作员管理',15,4,NULL),(14,'2018-04-09 23:50:19',2,'',NULL,'组织管理',15,5,NULL),(15,'2018-04-23 17:34:11',1,'',NULL,'系统维护',0,0,NULL),(16,'2018-04-23 17:36:34',2,'/template/sys/config/entityFilterParamConfig',NULL,'实体过滤字',1,5,NULL),(17,'2018-04-27 15:43:48',2,'/template/sys/assistant/generateEntityOom',NULL,'实体映射（oom）',1,0,NULL),(395,'2018-05-30 18:14:11',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/model-list','2018-05-30 18:14:35','模型列表',4,4,'true'),(396,'2018-05-31 18:24:45',1,'','2018-05-31 18:26:00','个人设置',0,3,''),(397,'2018-05-31 18:24:55',2,'','2018-05-31 18:25:14','密码修改',396,2,''),(398,'2018-05-31 18:25:06',2,'','2018-05-31 18:25:06','基本信息',396,1,NULL);
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
INSERT INTO `sys_menu_visit_log` VALUES (1,'2018-05-21 11:08:36',9,'2018-05-21 11:08:36','2018-05-21 11:08:36'),(2,'2018-05-21 11:20:30',11,'2018-05-21 11:20:30','2018-05-21 11:20:30'),(3,'2018-05-21 14:04:46',9,'2018-05-21 14:04:46','2018-05-21 14:04:46'),(4,'2018-05-21 14:20:39',9,'2018-05-21 14:20:39','2018-05-21 14:20:39'),(5,'2018-05-21 14:24:15',9,'2018-05-21 14:24:15','2018-05-21 14:24:15'),(6,'2018-05-21 14:50:51',11,'2018-05-21 14:50:51','2018-05-21 14:50:51'),(7,'2018-05-21 15:16:56',9,'2018-05-21 15:16:56','2018-05-21 15:16:56'),(8,'2018-05-21 15:17:02',9,'2018-05-21 15:17:02','2018-05-21 15:17:02'),(9,'2018-05-21 15:17:30',9,'2018-05-21 15:17:30','2018-05-21 15:17:30'),(10,'2018-05-21 15:25:22',9,'2018-05-21 15:25:22','2018-05-21 15:25:22'),(11,'2018-05-21 15:30:41',9,'2018-05-21 15:30:41','2018-05-21 15:30:41'),(12,'2018-05-21 15:33:06',9,'2018-05-21 15:33:06','2018-05-21 15:33:06'),(13,'2018-05-21 15:55:24',9,'2018-05-21 15:55:24','2018-05-21 15:55:24'),(14,'2018-05-21 15:55:59',9,'2018-05-21 15:55:59','2018-05-21 15:55:59'),(15,'2018-05-21 15:56:25',9,'2018-05-21 15:56:25','2018-05-21 15:56:25'),(16,'2018-05-21 16:00:48',9,'2018-05-21 16:00:48','2018-05-21 16:00:48'),(17,'2018-05-21 16:08:05',9,'2018-05-21 16:08:05','2018-05-21 16:08:05'),(18,'2018-05-21 16:08:56',11,'2018-05-21 16:08:56','2018-05-21 16:08:56'),(19,'2018-05-21 16:17:59',9,'2018-05-21 16:17:59','2018-05-21 16:17:59'),(20,'2018-05-21 16:18:34',9,'2018-05-21 16:18:34','2018-05-21 16:18:34'),(21,'2018-05-21 16:22:08',9,'2018-05-21 16:22:08','2018-05-21 16:22:08'),(22,'2018-05-21 16:23:23',11,'2018-05-21 16:23:23','2018-05-21 16:23:23'),(23,'2018-05-21 16:36:04',9,'2018-05-21 16:36:04','2018-05-21 16:36:04'),(24,'2018-05-21 16:36:05',11,'2018-05-21 16:36:05','2018-05-21 16:36:05'),(25,'2018-05-21 17:17:27',9,'2018-05-21 17:17:27','2018-05-21 17:17:27'),(26,'2018-05-21 17:17:31',17,'2018-05-21 17:17:31','2018-05-21 17:17:30'),(27,'2018-05-21 17:19:32',17,'2018-05-21 17:19:32','2018-05-21 17:19:32'),(28,'2018-05-21 17:24:14',17,'2018-05-21 17:24:14','2018-05-21 17:24:14'),(29,'2018-05-21 17:38:28',11,'2018-05-21 17:38:28','2018-05-21 17:38:28'),(30,'2018-05-21 17:38:39',17,'2018-05-21 17:38:39','2018-05-21 17:38:39'),(31,'2018-05-21 18:19:32',9,'2018-05-21 18:19:32','2018-05-21 18:19:32'),(32,'2018-05-21 18:27:07',9,'2018-05-21 18:27:07','2018-05-21 18:27:07'),(33,'2018-05-21 18:31:37',11,'2018-05-21 18:31:37','2018-05-21 18:31:37'),(34,'2018-05-21 18:39:53',11,'2018-05-21 18:39:53','2018-05-21 18:39:53'),(35,'2018-05-21 18:40:00',9,'2018-05-21 18:40:00','2018-05-21 18:40:00'),(36,'2018-05-21 18:41:22',9,'2018-05-21 18:41:22','2018-05-21 18:41:22'),(37,'2018-05-21 18:41:29',11,'2018-05-21 18:41:29','2018-05-21 18:41:29'),(38,'2018-05-22 09:14:17',9,'2018-05-22 09:14:17','2018-05-22 09:14:17'),(39,'2018-05-22 09:14:28',11,'2018-05-22 09:14:28','2018-05-22 09:14:28'),(40,'2018-05-22 10:07:33',11,'2018-05-22 10:07:33','2018-05-22 10:07:33'),(41,'2018-05-22 10:13:21',11,'2018-05-22 10:13:21','2018-05-22 10:13:21'),(42,'2018-05-22 10:23:30',9,'2018-05-22 10:23:30','2018-05-22 10:23:30'),(43,'2018-05-22 10:23:31',11,'2018-05-22 10:23:31','2018-05-22 10:23:31'),(44,'2018-05-22 10:31:30',11,'2018-05-22 10:31:30','2018-05-22 10:31:30'),(45,'2018-05-22 10:31:42',11,'2018-05-22 10:31:42','2018-05-22 10:31:42'),(46,'2018-05-22 10:43:35',11,'2018-05-22 10:43:35','2018-05-22 10:43:35'),(47,'2018-05-22 11:08:01',9,'2018-05-22 11:08:01','2018-05-22 11:08:01'),(48,'2018-05-22 11:08:08',11,'2018-05-22 11:08:08','2018-05-22 11:08:08'),(49,'2018-05-22 11:11:13',9,'2018-05-22 11:11:13','2018-05-22 11:11:13'),(50,'2018-05-22 11:11:17',17,'2018-05-22 11:11:17','2018-05-22 11:11:17'),(51,'2018-05-22 11:14:38',9,'2018-05-22 11:14:38','2018-05-22 11:14:38'),(52,'2018-05-22 11:14:42',11,'2018-05-22 11:14:42','2018-05-22 11:14:42'),(53,'2018-05-22 11:14:47',17,'2018-05-22 11:14:47','2018-05-22 11:14:47'),(54,'2018-05-22 11:24:52',8,'2018-05-22 11:24:52','2018-05-22 11:24:52'),(55,'2018-05-22 11:24:53',17,'2018-05-22 11:24:53','2018-05-22 11:24:53'),(56,'2018-05-22 11:25:56',17,'2018-05-22 11:25:56','2018-05-22 11:25:55'),(57,'2018-05-22 11:52:08',11,'2018-05-22 11:52:08','2018-05-22 11:52:08'),(58,'2018-05-22 13:50:29',9,'2018-05-22 13:50:29','2018-05-22 13:50:29'),(59,'2018-05-22 14:02:25',9,'2018-05-22 14:02:25','2018-05-22 14:02:25'),(60,'2018-05-22 14:13:55',9,'2018-05-22 14:13:55','2018-05-22 14:13:54'),(61,'2018-05-22 14:23:36',9,'2018-05-22 14:23:36','2018-05-22 14:23:36'),(62,'2018-05-22 14:29:27',11,'2018-05-22 14:29:27','2018-05-22 14:29:27'),(63,'2018-05-22 14:36:38',9,'2018-05-22 14:36:38','2018-05-22 14:36:37'),(64,'2018-05-22 14:36:42',11,'2018-05-22 14:36:42','2018-05-22 14:36:42'),(65,'2018-05-22 14:36:45',17,'2018-05-22 14:36:45','2018-05-22 14:36:45'),(66,'2018-05-22 14:36:52',16,'2018-05-22 14:36:52','2018-05-22 14:36:52'),(67,'2018-05-22 14:36:56',9,'2018-05-22 14:36:56','2018-05-22 14:36:56'),(68,'2018-05-22 14:36:59',11,'2018-05-22 14:36:59','2018-05-22 14:36:59'),(69,'2018-05-22 14:37:01',9,'2018-05-22 14:37:01','2018-05-22 14:37:01'),(70,'2018-05-22 14:37:03',11,'2018-05-22 14:37:03','2018-05-22 14:37:03'),(71,'2018-05-22 14:37:14',11,'2018-05-22 14:37:14','2018-05-22 14:37:14'),(72,'2018-05-22 14:41:52',13,'2018-05-22 14:41:52','2018-05-22 14:41:52'),(73,'2018-05-22 16:18:54',9,'2018-05-22 16:18:54','2018-05-22 16:18:54'),(74,'2018-05-22 16:19:07',9,'2018-05-22 16:19:07','2018-05-22 16:19:07'),(75,'2018-05-22 16:19:12',17,'2018-05-22 16:19:12','2018-05-22 16:19:12'),(76,'2018-05-22 16:19:20',13,'2018-05-22 16:19:20','2018-05-22 16:19:20'),(77,'2018-05-22 16:33:35',13,'2018-05-22 16:33:35','2018-05-22 16:33:35'),(78,'2018-05-22 16:38:33',9,'2018-05-22 16:38:33','2018-05-22 16:38:33'),(79,'2018-05-22 16:38:35',11,'2018-05-22 16:38:35','2018-05-22 16:38:35'),(80,'2018-05-22 16:38:36',13,'2018-05-22 16:38:36','2018-05-22 16:38:36'),(81,'2018-05-22 16:40:43',13,'2018-05-22 16:40:43','2018-05-22 16:40:43'),(82,'2018-05-22 16:42:33',13,'2018-05-22 16:42:33','2018-05-22 16:42:33'),(83,'2018-05-22 16:42:35',13,'2018-05-22 16:42:35','2018-05-22 16:42:35'),(84,'2018-05-22 17:14:58',13,'2018-05-22 17:14:58','2018-05-22 17:14:58'),(85,'2018-05-22 17:17:12',9,'2018-05-22 17:17:12','2018-05-22 17:17:12'),(86,'2018-05-22 17:17:14',11,'2018-05-22 17:17:14','2018-05-22 17:17:14'),(87,'2018-05-22 17:17:17',13,'2018-05-22 17:17:17','2018-05-22 17:17:17'),(88,'2018-05-22 17:17:18',11,'2018-05-22 17:17:18','2018-05-22 17:17:18'),(89,'2018-05-22 17:17:19',13,'2018-05-22 17:17:19','2018-05-22 17:17:19'),(90,'2018-05-22 17:17:20',11,'2018-05-22 17:17:20','2018-05-22 17:17:20'),(91,'2018-05-22 17:17:22',13,'2018-05-22 17:17:22','2018-05-22 17:17:22'),(92,'2018-05-22 17:17:23',11,'2018-05-22 17:17:23','2018-05-22 17:17:23'),(93,'2018-05-22 17:17:24',13,'2018-05-22 17:17:24','2018-05-22 17:17:24'),(94,'2018-05-22 17:17:28',13,'2018-05-22 17:17:28','2018-05-22 17:17:28'),(95,'2018-05-22 17:17:30',17,'2018-05-22 17:17:30','2018-05-22 17:17:30'),(96,'2018-05-22 17:17:32',9,'2018-05-22 17:17:32','2018-05-22 17:17:32'),(97,'2018-05-22 17:17:33',11,'2018-05-22 17:17:33','2018-05-22 17:17:33'),(98,'2018-05-22 17:17:34',13,'2018-05-22 17:17:34','2018-05-22 17:17:34'),(99,'2018-05-22 17:17:38',17,'2018-05-22 17:17:38','2018-05-22 17:17:38'),(100,'2018-05-22 17:25:40',13,'2018-05-22 17:25:40','2018-05-22 17:25:40'),(101,'2018-05-22 22:20:40',13,'2018-05-22 22:20:40','2018-05-22 22:20:39'),(102,'2018-05-22 22:29:36',17,'2018-05-22 22:29:36','2018-05-22 22:29:36'),(103,'2018-05-22 23:10:53',9,'2018-05-22 23:10:53','2018-05-22 23:10:50'),(104,'2018-05-22 23:10:59',11,'2018-05-22 23:10:59','2018-05-22 23:10:59'),(105,'2018-05-22 23:11:20',11,'2018-05-22 23:11:20','2018-05-22 23:11:20'),(106,'2018-05-22 23:11:21',9,'2018-05-22 23:11:21','2018-05-22 23:11:21'),(107,'2018-05-23 09:39:48',9,'2018-05-23 09:39:48','2018-05-23 09:39:48'),(108,'2018-05-23 09:39:51',13,'2018-05-23 09:39:51','2018-05-23 09:39:51'),(109,'2018-05-23 09:40:14',13,'2018-05-23 09:40:14','2018-05-23 09:40:14'),(110,'2018-05-23 09:40:47',9,'2018-05-23 09:40:47','2018-05-23 09:40:47'),(111,'2018-05-23 09:40:49',11,'2018-05-23 09:40:49','2018-05-23 09:40:49'),(112,'2018-05-23 09:40:52',13,'2018-05-23 09:40:52','2018-05-23 09:40:52'),(113,'2018-05-23 09:48:53',9,'2018-05-23 09:48:53','2018-05-23 09:48:53'),(114,'2018-05-23 09:54:14',11,'2018-05-23 09:54:14','2018-05-23 09:54:14'),(115,'2018-05-23 09:54:17',13,'2018-05-23 09:54:17','2018-05-23 09:54:17'),(116,'2018-05-23 09:54:21',11,'2018-05-23 09:54:21','2018-05-23 09:54:21'),(117,'2018-05-23 09:54:22',9,'2018-05-23 09:54:22','2018-05-23 09:54:22'),(118,'2018-05-23 15:27:44',13,'2018-05-23 15:27:44','2018-05-23 15:27:44'),(119,'2018-05-23 15:27:45',11,'2018-05-23 15:27:45','2018-05-23 15:27:45'),(120,'2018-05-23 15:28:06',9,'2018-05-23 15:28:06','2018-05-23 15:28:06'),(121,'2018-05-23 15:47:03',9,'2018-05-23 15:47:03','2018-05-23 15:47:03'),(122,'2018-05-23 15:51:10',9,'2018-05-23 15:51:10','2018-05-23 15:51:10'),(123,'2018-05-23 15:54:59',13,'2018-05-23 15:54:59','2018-05-23 15:54:59'),(124,'2018-05-23 15:55:08',11,'2018-05-23 15:55:08','2018-05-23 15:55:08'),(125,'2018-05-23 15:58:02',9,'2018-05-23 15:58:02','2018-05-23 15:58:02'),(126,'2018-05-23 16:21:45',9,'2018-05-23 16:21:45','2018-05-23 16:21:45'),(127,'2018-05-23 16:22:09',13,'2018-05-23 16:22:09','2018-05-23 16:22:09'),(128,'2018-05-23 16:58:13',9,'2018-05-23 16:58:13','2018-05-23 16:58:13'),(129,'2018-05-23 17:00:48',9,'2018-05-23 17:00:48','2018-05-23 17:00:48'),(130,'2018-05-23 17:00:50',11,'2018-05-23 17:00:50','2018-05-23 17:00:50'),(131,'2018-05-23 17:00:52',13,'2018-05-23 17:00:52','2018-05-23 17:00:52'),(132,'2018-05-23 17:00:54',17,'2018-05-23 17:00:54','2018-05-23 17:00:54'),(133,'2018-05-23 17:00:57',9,'2018-05-23 17:00:57','2018-05-23 17:00:57'),(134,'2018-05-23 17:04:29',9,'2018-05-23 17:04:29','2018-05-23 17:04:29'),(135,'2018-05-23 17:05:28',9,'2018-05-23 17:05:28','2018-05-23 17:05:28'),(136,'2018-05-23 17:06:09',9,'2018-05-23 17:06:09','2018-05-23 17:06:09'),(137,'2018-05-23 17:09:20',9,'2018-05-23 17:09:20','2018-05-23 17:09:20'),(138,'2018-05-23 17:24:21',9,'2018-05-23 17:24:21','2018-05-23 17:24:21'),(139,'2018-05-23 17:26:18',17,'2018-05-23 17:26:18','2018-05-23 17:26:18'),(140,'2018-05-23 17:27:06',17,'2018-05-23 17:27:06','2018-05-23 17:27:06'),(141,'2018-05-23 17:27:32',9,'2018-05-23 17:27:32','2018-05-23 17:27:32'),(142,'2018-05-23 17:27:34',17,'2018-05-23 17:27:34','2018-05-23 17:27:34'),(143,'2018-05-23 17:29:12',9,'2018-05-23 17:29:12','2018-05-23 17:29:12'),(144,'2018-05-23 17:29:31',9,'2018-05-23 17:29:31','2018-05-23 17:29:31'),(145,'2018-05-23 17:33:25',9,'2018-05-23 17:33:25','2018-05-23 17:33:25'),(146,'2018-05-23 17:53:12',9,'2018-05-23 17:53:12','2018-05-23 17:53:12'),(147,'2018-05-23 17:53:22',9,'2018-05-23 17:53:22','2018-05-23 17:53:22'),(148,'2018-05-23 17:53:26',17,'2018-05-23 17:53:26','2018-05-23 17:53:26'),(149,'2018-05-23 17:54:23',9,'2018-05-23 17:54:23','2018-05-23 17:54:23'),(150,'2018-05-23 17:54:27',9,'2018-05-23 17:54:27','2018-05-23 17:54:27'),(151,'2018-05-23 17:54:57',17,'2018-05-23 17:54:57','2018-05-23 17:54:57'),(152,'2018-05-23 17:54:58',8,'2018-05-23 17:54:58','2018-05-23 17:54:58'),(153,'2018-05-23 17:55:01',17,'2018-05-23 17:55:01','2018-05-23 17:55:01'),(154,'2018-05-23 17:55:14',17,'2018-05-23 17:55:14','2018-05-23 17:55:14'),(155,'2018-05-25 15:00:47',9,'2018-05-25 15:00:47','2018-05-25 15:00:47'),(156,'2018-05-25 15:00:52',9,'2018-05-25 15:00:52','2018-05-25 15:00:52'),(157,'2018-05-25 15:01:09',9,'2018-05-25 15:01:09','2018-05-25 15:01:09'),(158,'2018-05-25 15:01:11',13,'2018-05-25 15:01:11','2018-05-25 15:01:11'),(159,'2018-05-30 17:29:17',9,'2018-05-30 17:29:17','2018-05-30 17:29:17'),(160,'2018-05-30 17:29:18',9,'2018-05-30 17:29:18','2018-05-30 17:29:18'),(161,'2018-05-30 17:29:41',6,'2018-05-30 17:29:41','2018-05-30 17:29:41'),(162,'2018-05-30 17:47:33',6,'2018-05-30 17:47:33','2018-05-30 17:47:33'),(163,'2018-05-30 17:50:57',6,'2018-05-30 17:50:57','2018-05-30 17:50:57'),(164,'2018-05-30 17:51:09',6,'2018-05-30 17:51:09','2018-05-30 17:51:09'),(165,'2018-05-30 17:51:44',9,'2018-05-30 17:51:44','2018-05-30 17:51:44'),(166,'2018-05-30 17:52:18',5,'2018-05-30 17:52:18','2018-05-30 17:52:17'),(167,'2018-05-30 18:03:03',6,'2018-05-30 18:03:03','2018-05-30 18:03:03'),(168,'2018-05-30 18:03:09',5,'2018-05-30 18:03:09','2018-05-30 18:03:09'),(169,'2018-05-30 18:14:52',395,'2018-05-30 18:14:52','2018-05-30 18:14:52'),(170,'2018-05-30 18:15:12',395,'2018-05-30 18:15:12','2018-05-30 18:15:12'),(171,'2018-05-30 18:16:41',9,'2018-05-30 18:16:41','2018-05-30 18:16:41'),(172,'2018-05-30 18:16:46',5,'2018-05-30 18:16:46','2018-05-30 18:16:46'),(173,'2018-05-30 18:16:49',6,'2018-05-30 18:16:49','2018-05-30 18:16:49'),(174,'2018-05-30 18:16:50',395,'2018-05-30 18:16:50','2018-05-30 18:16:50'),(175,'2018-05-30 18:16:52',5,'2018-05-30 18:16:52','2018-05-30 18:16:52'),(176,'2018-05-30 18:17:27',5,'2018-05-30 18:17:27','2018-05-30 18:17:27'),(177,'2018-05-30 18:17:28',6,'2018-05-30 18:17:28','2018-05-30 18:17:28'),(178,'2018-05-30 18:17:29',395,'2018-05-30 18:17:29','2018-05-30 18:17:29'),(179,'2018-05-30 18:17:30',6,'2018-05-30 18:17:30','2018-05-30 18:17:30'),(180,'2018-05-30 18:17:31',395,'2018-05-30 18:17:31','2018-05-30 18:17:31'),(181,'2018-05-30 18:19:49',395,'2018-05-30 18:19:49','2018-05-30 18:19:48'),(182,'2018-05-30 18:36:38',395,'2018-05-30 18:36:38','2018-05-30 18:36:37'),(183,'2018-05-30 18:59:23',395,'2018-05-30 18:59:23','2018-05-30 18:59:23'),(184,'2018-05-30 19:04:46',395,'2018-05-30 19:04:46','2018-05-30 19:04:46'),(185,'2018-05-30 19:06:20',395,'2018-05-30 19:06:20','2018-05-30 19:06:20'),(186,'2018-05-30 19:07:15',9,'2018-05-30 19:07:15','2018-05-30 19:07:15'),(187,'2018-05-30 19:07:28',395,'2018-05-30 19:07:28','2018-05-30 19:07:28'),(188,'2018-05-30 19:10:30',9,'2018-05-30 19:10:30','2018-05-30 19:10:30'),(189,'2018-05-30 19:10:32',395,'2018-05-30 19:10:32','2018-05-30 19:10:32'),(190,'2018-05-30 19:15:59',5,'2018-05-30 19:15:59','2018-05-30 19:15:59'),(191,'2018-05-30 19:15:59',395,'2018-05-30 19:15:59','2018-05-30 19:15:59'),(192,'2018-05-30 19:16:08',395,'2018-05-30 19:16:08','2018-05-30 19:16:08'),(193,'2018-05-31 11:14:20',17,'2018-05-31 11:14:20','2018-05-31 11:14:20'),(194,'2018-05-31 15:28:19',9,'2018-05-31 15:28:19','2018-05-31 15:28:18'),(195,'2018-05-31 15:46:07',9,'2018-05-31 15:46:07','2018-05-31 15:46:06'),(196,'2018-05-31 15:46:47',9,'2018-05-31 15:46:47','2018-05-31 15:46:47'),(197,'2018-05-31 15:50:33',11,'2018-05-31 15:50:33','2018-05-31 15:50:33'),(198,'2018-05-31 15:50:34',13,'2018-05-31 15:50:34','2018-05-31 15:50:34'),(199,'2018-05-31 15:51:36',5,'2018-05-31 15:51:36','2018-05-31 15:51:36'),(200,'2018-05-31 15:51:56',6,'2018-05-31 15:51:56','2018-05-31 15:51:56'),(201,'2018-05-31 15:51:59',395,'2018-05-31 15:51:59','2018-05-31 15:51:59'),(202,'2018-05-31 18:01:21',9,'2018-05-31 18:01:21','2018-05-31 18:01:20'),(203,'2018-05-31 18:01:21',11,'2018-05-31 18:01:21','2018-05-31 18:01:21'),(204,'2018-05-31 18:01:23',13,'2018-05-31 18:01:23','2018-05-31 18:01:23'),(205,'2018-05-31 18:01:25',17,'2018-05-31 18:01:25','2018-05-31 18:01:25'),(206,'2018-05-31 18:01:27',5,'2018-05-31 18:01:27','2018-05-31 18:01:27'),(207,'2018-05-31 18:01:30',6,'2018-05-31 18:01:30','2018-05-31 18:01:30'),(208,'2018-05-31 18:01:32',395,'2018-05-31 18:01:32','2018-05-31 18:01:32'),(209,'2018-05-31 18:22:21',17,'2018-05-31 18:22:21','2018-05-31 18:22:21'),(210,'2018-05-31 18:22:26',9,'2018-05-31 18:22:26','2018-05-31 18:22:26'),(211,'2018-05-31 18:24:23',13,'2018-05-31 18:24:23','2018-05-31 18:24:23'),(212,'2018-05-31 18:24:27',9,'2018-05-31 18:24:27','2018-05-31 18:24:27'),(213,'2018-05-31 18:25:54',9,'2018-05-31 18:25:54','2018-05-31 18:25:54'),(214,'2018-05-31 18:26:07',11,'2018-05-31 18:26:07','2018-05-31 18:26:07'),(215,'2018-05-31 18:26:39',6,'2018-05-31 18:26:39','2018-05-31 18:26:39'),(216,'2018-05-31 18:39:07',395,'2018-05-31 18:39:07','2018-05-31 18:39:06'),(217,'2018-05-31 18:55:54',395,'2018-05-31 18:55:54','2018-05-31 18:55:54'),(218,'2018-06-02 17:17:14',9,'2018-06-02 17:17:14','2018-06-02 17:17:14'),(219,'2018-06-04 18:28:20',395,'2018-06-04 18:28:20','2018-06-04 18:28:19'),(220,'2018-06-04 18:28:50',395,'2018-06-04 18:28:50','2018-06-04 18:28:50'),(221,'2018-06-04 18:29:10',5,'2018-06-04 18:29:10','2018-06-04 18:29:10'),(222,'2018-06-04 18:29:13',6,'2018-06-04 18:29:13','2018-06-04 18:29:13'),(223,'2018-06-04 18:39:19',9,'2018-06-04 18:39:19','2018-06-04 18:39:18'),(224,'2018-06-04 18:39:20',11,'2018-06-04 18:39:20','2018-06-04 18:39:20'),(225,'2018-06-04 18:39:24',13,'2018-06-04 18:39:24','2018-06-04 18:39:24'),(226,'2018-06-04 18:39:27',17,'2018-06-04 18:39:27','2018-06-04 18:39:27'),(227,'2018-06-04 18:39:29',5,'2018-06-04 18:39:29','2018-06-04 18:39:29'),(228,'2018-06-04 18:39:32',6,'2018-06-04 18:39:32','2018-06-04 18:39:32'),(229,'2018-06-04 18:39:36',395,'2018-06-04 18:39:36','2018-06-04 18:39:36'),(230,'2018-06-04 18:39:54',395,'2018-06-04 18:39:54','2018-06-04 18:39:54'),(231,'2018-06-04 18:41:04',395,'2018-06-04 18:41:04','2018-06-04 18:41:04'),(232,'2018-06-04 18:42:53',395,'2018-06-04 18:42:53','2018-06-04 18:42:53'),(233,'2018-06-04 18:43:46',395,'2018-06-04 18:43:46','2018-06-04 18:43:46'),(234,'2018-06-04 19:13:46',395,'2018-06-04 19:13:46','2018-06-04 19:13:45'),(235,'2018-06-04 19:17:51',395,'2018-06-04 19:17:51','2018-06-04 19:17:50'),(236,'2018-06-04 19:25:09',395,'2018-06-04 19:25:09','2018-06-04 19:25:09'),(237,'2018-06-04 19:52:23',395,'2018-06-04 19:52:23','2018-06-04 19:52:22');
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
INSERT INTO `sys_role` VALUES (1,'2018-05-21 17:42:41','2018-05-22 13:50:16','超级管理员'),(2,'2018-05-21 17:42:54','2018-05-22 13:50:16','系统维护管理员'),(3,'2018-05-21 17:45:12','2018-05-22 13:50:16','映射管理员'),(4,'2018-05-21 17:45:35','2018-05-22 13:50:16','工作流管理员');
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
INSERT INTO `sys_sequence` VALUES ('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.Admin',12),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.Menu',398),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.MenuRole',53),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.MenuVisitLog',237),('cn.doublepoint.common.domain.model.entity.sys.cn.doublepoint.common.domain.model.entity.sys.Role',5);
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

-- Dump completed on 2018-06-04 19:55:54
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
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
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'source',NULL,'{\"id\":\"canvas\",\"resourceId\":\"canvas\",\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"}}',NULL);
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
INSERT INTO `act_ge_property` VALUES ('next.dbid','2501',2),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);
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
INSERT INTO `act_re_model` VALUES ('1',2,'undefined','undefined',NULL,'2018-06-04 10:49:22.408','2018-06-04 10:49:22.520',1,'{\"name\":\"undefined\",\"revision\":1,\"description\":\"undefined\"}',NULL,'2',NULL,'');
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

-- Dump completed on 2018-06-04 19:55:55
