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
  `id` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `loginAccountNo` varchar(255) DEFAULT NULL,
  `loginPassword` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin`
--

LOCK TABLES `sys_admin` WRITE;
/*!40000 ALTER TABLE `sys_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_admin_login_log`
--

DROP TABLE IF EXISTS `sys_admin_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_admin_login_log` (
  `id` varchar(255) NOT NULL,
  `adminId` varchar(255) DEFAULT NULL,
  `isPasswordError` varchar(255) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` varchar(255) NOT NULL,
  `classify` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `codeName` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `displaySn` int(11) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  `scene1` varchar(255) DEFAULT NULL,
  `scene2` varchar(255) DEFAULT NULL,
  `scene3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  `sn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('431540126246502400','2018-04-05 19:46:24',1,'',NULL,'系统管理',NULL,NULL),('431545532150710272','2018-04-05 20:07:53',1,'',NULL,'辅助功能','',NULL),('431545639839465472','2018-04-05 20:08:18',2,'',NULL,'仓库映射','431545532150710272',NULL),('431545730499346432','2018-04-05 20:08:40',2,'',NULL,'组合映射','431545532150710272',NULL),('431545833578561536','2018-04-05 20:09:04',1,'',NULL,'工作流管理','',NULL),('431545914318913536','2018-04-05 20:09:24',2,'',NULL,'变量管理','431545833578561536',NULL),('431545959629979648','2018-04-05 20:09:35',2,'',NULL,'工作流管理','431545833578561536',NULL),('431546000000155648','2018-04-05 20:09:44',2,'',NULL,'节点管理','431545833578561536',NULL),('433042443374428160','2018-04-09 23:16:04',2,'/template/sys/assistant/generateEntity',NULL,'实体映射','431545532150710272',0),('433043194893041664','2018-04-09 23:19:03',2,'/template/sys/menu/menu',NULL,'菜单管理','431540126246502400',1),('433050421729165312','2018-04-09 23:47:46',2,'/template/sys/role/role',NULL,'角色管理','431540126246502400',2),('433050571990106112','2018-04-09 23:48:22',2,'',NULL,'权限管理','431540126246502400',3),('433051026442944512','2018-04-09 23:50:10',2,'',NULL,'操作员管理','431540126246502400',4),('433051064296538112','2018-04-09 23:50:19',2,'',NULL,'组织管理','431540126246502400',5),('438029833595781120','2018-04-23 17:34:11',1,'',NULL,'系统维护','',0),('438030433704214528','2018-04-23 17:36:34',2,'/template/sys/config/entityFilterParamConfig',NULL,'实体过滤字','438029833595781120',1);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_visit_log`
--

DROP TABLE IF EXISTS `sys_menu_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_visit_log` (
  `id` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `menuId` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `visitTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_visit_log`
--

LOCK TABLES `sys_menu_visit_log` WRITE;
/*!40000 ALTER TABLE `sys_menu_visit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_menu_visit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `id` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `loginAccountNo` int(11) DEFAULT NULL,
  `loginPassword` int(11) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
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

-- Dump completed on 2018-04-23 18:07:37
