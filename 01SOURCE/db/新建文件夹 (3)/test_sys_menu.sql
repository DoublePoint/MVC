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
INSERT INTO `sys_menu` VALUES (1,'2018-06-07 19:09:29',1,'/template/sys/code/code','2018-06-07 19:21:48','映射',0,3,''),(6,'2018-04-05 20:09:35',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/process-list','2018-05-30 17:29:31','工作流管理',4,3,'true'),(7,'2018-04-05 20:09:44',2,'',NULL,'节点管理',4,2,NULL),(8,'2018-04-27 15:33:08',2,'/template/sys/assistant/generateEntity',NULL,'实体映射（数据库）',1,1,NULL),(9,'2018-04-09 23:19:03',2,'/template/sys/menu/menu',NULL,'菜单管理',15,1,NULL),(11,'2018-04-09 23:47:46',2,'/template/sys/role/role',NULL,'角色管理',15,2,NULL),(12,'2018-04-09 23:48:22',2,'',NULL,'权限管理',15,3,NULL),(13,'2018-04-09 23:50:10',2,'/template/sys/admin/admin','2018-05-22 14:30:15','操作员管理',15,4,NULL),(14,'2018-04-09 23:50:19',2,'',NULL,'组织管理',15,5,NULL),(15,'2018-04-23 17:34:11',1,'','2018-06-07 19:21:57','系统维护',0,1,''),(16,'2018-04-23 17:36:34',2,'/template/sys/config/entityFilterParamConfig',NULL,'实体过滤字',1,5,NULL),(17,'2018-04-27 15:43:48',2,'/template/sys/assistant/generateEntityOom',NULL,'实体映射（oom）',1,0,NULL),(395,'2018-05-30 18:14:11',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/model-list','2018-05-30 18:14:35','模型列表',4,4,'true'),(396,'2018-05-31 18:24:45',1,'','2018-06-07 19:21:51','个人设置',0,4,''),(397,'2018-05-31 18:24:55',2,'','2018-05-31 18:25:14','密码修改',396,2,''),(398,'2018-05-31 18:25:06',2,'','2018-05-31 18:25:06','基本信息',396,1,NULL),(401,'2018-06-06 17:25:24',1,'','2018-06-06 17:25:24','工作流测试',0,NULL,NULL),(402,'2018-06-06 17:26:00',2,'/template/sys/workflow/announcement/apply','2018-06-06 18:01:15','公告申请流程',401,1,''),(406,'2018-06-07 19:20:54',2,'/template/sys/code/code','2018-06-07 19:20:54','代码管理',15,1,NULL),(407,'2018-06-07 19:22:52',2,'/template/sys/extendproperty/extendproperty','2018-06-07 19:22:52','扩展属性',15,6,NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-07 20:01:57
