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
INSERT INTO `act_ge_bytearray` VALUES ('2',3,'source',NULL,'{\"resourceId\":\"1\",\"properties\":{\"process_id\":\"WF-00001\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¼€å§‹\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\"}],\"bounds\":{\"lowerRight\":{\"x\":110,\"y\":73},\"upperLeft\":{\"x\":80,\"y\":43}},\"dockers\":[]},{\"resourceId\":\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\",\"properties\":{\"overrideid\":\"\",\"name\":\"è¯·å‡ç”³è¯·\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\"}],\"bounds\":{\"lowerRight\":{\"x\":250,\"y\":98},\"upperLeft\":{\"x\":150,\"y\":18}},\"dockers\":[]},{\"resourceId\":\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"}],\"bounds\":{\"lowerRight\":{\"x\":149.78125,\"y\":58},\"upperLeft\":{\"x\":110.765625,\"y\":58}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"}},{\"resourceId\":\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\",\"properties\":{\"overrideid\":\"\",\"name\":\"å®¡æ‰¹\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\"}],\"bounds\":{\"lowerRight\":{\"x\":417,\"y\":92},\"upperLeft\":{\"x\":317,\"y\":12}},\"dockers\":[]},{\"resourceId\":\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"}],\"bounds\":{\"lowerRight\":{\"x\":316.4225197915845,\"y\":56.182845022452135},\"upperLeft\":{\"x\":250.57748020841555,\"y\":53.817154977547865}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"}},{\"resourceId\":\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\",\"properties\":{\"overrideid\":\"\",\"name\":\"ç»“æŸ\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":553,\"y\":66},\"upperLeft\":{\"x\":525,\"y\":38}},\"dockers\":[]},{\"resourceId\":\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"showdiamondmarker\":false},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"}],\"bounds\":{\"lowerRight\":{\"x\":533.5667987840079,\"y\":68},\"upperLeft\":{\"x\":417.5625,\"y\":52}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":471,\"y\":52},{\"x\":471,\"y\":68},{\"x\":8.566798784007915,\"y\":30}],\"target\":{\"resourceId\":\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('3',1,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0[\0\0\0”\0\0\0¤\ä\ì9\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€\è\0\0u0\0\0\ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±|ûQ“\0\0\0sRGB\0®\Î\é\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\Ä\0\0\Ä•+\0\0¯IDATx\Ú\í\İ	|TÕ¡\Çñ“…$$Šl\Ê\" \nŠ´ \êCEei•²hØ´Ï¥Rk]ñU\é\ÇZŸ\à\Ç\å}­(Š²\nP Pd¡R\Ù!‚H…°[HB€\0I\æÿ\Í\Ü0„B2“L&¿\ï\çs>sg2™$g\î\äş\ïÙ®1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ÅA\0¨\è¼^oÜ;~Ÿ‘‘1ğÄ‰M?—““CÅ”ô\0á=ó\í™3g†·o\ßş+j„-\0¨`l\Èú\í\áÃ‡Gdff^V§N“`ªU«f\"##©œR`µÖ¤§§\Çs:;;{\ËÉ“\'v\é\Ò%‰\Úa\0*€]»v\ÍÜ¾}{÷\r\Z˜«¯¾Z-1TJ\íÛ·\Ï$\'\'Ÿôz½ı\î¹\çY\Ô*Š(ª\0@E\rZ¶t¿\á†LÍš5	Z¥@-†Õ«W¯tğ\àÁû¸iüøñ?P+ l@R\×arrò`­øøøó¾~*\ã€ñlş\Üx¶\Ì2‡w|eN\İab«\Ô2Ñ±ñT^	\Å\Ä\Ä(p\Åz<û0w\âÄ‰©„;%\0¨P4^c´\ÔuXX\ĞÚ½öc“qx«\É\É>m¼9Y\æDÊf×š1&3}/\0UªT1\r6Ì‰ŠŠz—\Ú@EM 4r\Ìø\n<f|]\Z\íƒ\Z¯1ZI\Ùùµ\É:}ü¼\Ç¼\ïXb\êµ@%@½zõª\ïŞ½ûº…\ŞÚ©S§\Ô[@\Ép¿]½zuŞŒ/f|†\r¬6À\ÖHOO¿\Ï\ãñtü\ç?ÿÉŒ¯P\Ø\×şW\Ø­“h½R«§V­Z½{÷ö²›„-„5t:\rDŞ¹s\ç¨+¯¼ò²¶m\Û\Zu\ßhz=A+@b[\ê«W¯iÓ¦MLıúõ[ª•kñ\â\Åİ©ó©UUû_a¼\Ùg\nÿf/-±T£Fºö¦5\ÂPÂ ¥_Í›77u\ë\Öe\ÆW)P÷XË–-+\Û6aÑ¢E]©‘s©ûZ­ª({ö}¸\ÊŞ´¢&@\ØŠI]‡ZÃ¨iÓ¦…DŞ³~‚ù\á«W\Í\ÖÅ¯˜]k?a\0r€h\0ò\Í7\ß\\Í†\Û	ó\çÏ¿‰\Z9K\ãiU\r‘P\îûÀp¶€\â`\ÆWh.f|]ºJ•¯(ôkÑ±´ˆ l!D”t\ÆC3¾¢££_\ÔF\ÑTop»‰©r\Ş\ãQ•*›\ê×´§‚\0¶\Z˜ñ:4\ã\Ë\Şô¢&Š¦j\ÍL•\ZM|¼Z­\æT\0\ÂB3¾B3¾.]ö™“\ç=–u\ê€°…\ĞÁŒ¯\ĞÁŒ¯¢;}ü3n0\ãĞ–ó÷\é#\ÛÌ®\Õ:\Ï\0\Â\Ê3¾B\èCÎŒ¯\"IÛ·\Ö­œ\ë \æD\êN“ü\í(st\×r\ã¥@ñeB3¾\Îd¦¼S2\ã¥H-U~ø‡\ÓrU¤‰\ì\Ó\Îó\Úbj]Ÿ‰s\Z\à\'½T\Ê3¾*\ÔRUÔ \åO-`;W}@ l!41\ã¡B-UÅ¥õ\á\0\àb\èFD™a\ÆBA³Ã¨\0AE\ËJ3¾\0\0„- H˜ñ\0¨h\èFD©`\Æ\0 ¢¢e¥‚_\0€ŠŠ–-”\nf|@\Å0`À€zYYY=\"\"\"\î2¹W¯¨cKU[2mñx½\ŞõökÿŠŠŠš2iÒ¤=„- @˜ñ\0\á­_¿~=\ì\Í999w\Ú0SÀS\âlih¿\Ö\Ğ\Şö\È\Î\ÎşŸ¾}û.±÷\ÇL<y\"a\0\0 \060)@½\ïõz»\ã\Û;\Ø\ï\ë`_c\r_M›6\íß„-\0\0\0Ÿ\Ä\ÄÄ¾‘‘‘\ï\å\ä\ä\\\á>enº\é&Ó®];Ó¤Isùå—›jÕª™\'N˜\Ô\ÔT“œœl¾ıö[³v\íZs\æ\Ì÷\Û\Ú\Û\ï[×¯_¿\ÇÃ±•‹°\0\0Š´ºÚ 5\Ñ­(7dıü\ç?7;w65k\Ö<\ïù—]v™S®¾újsû\í·;Ák\îÜ¹fŞ¼y&;;[O©\êõz\'\ØÀg\×G\áTW\ÌF\0\0—\Z´Ô¢5Ó†#\'h)@½şú\ë\Z_`\Ğ*ˆZ¼ô|}_ıúõó·¯ù¡\r\\Ã©¾h\Ù*vÇ‰Û´iÓ¯×­[\×ÿşı­ö\í\ÛwYzzztff¦‰öV«V\íLõ\ê\Õ÷\Æ\Ç\Ç/·Oú\Â/l¥\Ö\0\0¡Hc´|]‡N\ĞjÚ´©<x°\ÓUX\nZ¯¼òŠ9r¤±\ÇJ÷¸9\Ê®Õ“\'Oş°…‹†¬\Ï>ûlô°a\Ãú9r$ú†n0:tpv,®L\\\\œ±+\âØ±c1»w\ïn”””\Ôh\íÚµıŸ}ö\Ù]Ç6zôè¨E\0@(±A\ë#wŒ–Z´J´\\\ê^|\æ™gœ\Ğe‡zH]Š\Ú\Û;[(ÔŠ+~\íµ\×\ŞKKK‹µg¦eË–Nv~\n\\*jvı\ÉO~b|ğÁˆ\r6\\3eÊ”÷\r\Z48%%\å\á:;\0P¾hy´\îÕ¶i\nH%\rZş\ë\É\'Ÿ4C†q\ÇpµWwb8˜g\ÌV€\Ù$=kÖ¬\ÅcÇcV¬ú¢¢\n\nZ…Q0³\ßÕ³g\Ïfv\'\Şø\Øc=J\Í\0BÀ\î†\Ãûµ\n½^×®]ı©ƒÂ¡\Ò[ZK—.]¾hÑ¢»Ÿ{\î9g‡¹”•_—.]\Ì\Ë/¿\\922ò\İG}ô	j\0PV´2¼½¹[\Û\î\Ì\Ã`ø\Ù\Ï~f*Uª\ä\Şm¯1b„-\ä™={ö‚3f´ıÓŸşd®»îº€¼\æ5\×\\c^}õU®7\ÂmvPö\ïK¶ô\îÓ§O\Õpÿ[Gm<xÁ\ç<ò\È#ÎšEšpóÀ˜¬¬\Ü\Ë[õ\î\İ;o]‚Ç}¨=\ÍRTŸ\Ş\å½\î³ \Z£5v\ìX§E«¨\Ó^‹J¯÷\Ç?ş±\ê\Ë/¿ü\á4;(¦¡¾3\ë,º\Ö\ÛÍ¹¶,‰‹‹[a?ƒ™\åù\ÓL¬;v\ä\İ\Ï\É\É1\ï½÷\Ş97š^½zM¸‘˜˜s\Ë-·˜Ó§O›{\î¹G3œóşo¸\Û@ ø®u\è\Ğ>Lzı•+Wºwõs‡¶*8\Í::t\è¨û\ï¿?`-Zù©…+111ö\ÓO?ı\ÄŞ½Zœÿ_m|\åÏ™™™ödd…ı<ÎŒŒ\\´oß¾¤%K–”«¦E‹™gŸ}6\ï¾Z¬\Ò\Ó\ÓMÇûj½RK—‚–V\ßŞµk—³\Z·fpiú=d­ÜÆõ5lØ°ÀŸKØªÀfÎœ9F\Ë7hŒU0\İw\ß}•\çÎ\Û(\\fg\0¦©\âJ%\Õ\"T§Nı¬,QøŠŠŠZ4iÒ¤=¡ü\Ë+8\ÙÏ¸skw\ç±ü\ÑÔ®]\Ûiµ’˜\îİ»;\Ûj\íR™?¾¶ôœ>øÀyş~İ·\Ó\éŠ|ñ\ÅYÏ¡\æğ\á\ÃNh\ìÛ·\ï+aºO2eJrı=u\Ü\ruõS¾×¯AØª\àÔª5lØ°_iy¿}A3hĞ +\Şz\ë-\r–j\ØÒ¸˜ˆˆˆ¤ıû÷\Ï)o­€>š:0\Ø\Ïg_\íÎšFn÷\éSv{«H(jĞ 4\æóî»1\È&))\É\ìİ»7/l}üñ\ÇùÇ²\äQÀòx<¦u\ë\ÖN¢=4Û·owZ\ÅôµPôõ\×_›u\ë\Öió\Ïa¼/†S\Ì\'¨\å\n£e üÄ•÷Š#l•V†?xğ`´–†›o¾9&66¶‘fgùŒi¨=P\é¬ú¤ıYólğú0++kÙ´i\Ó2\Ê\Ë{£Ldd\ä%­$¯Œ\ï7}úô©g÷©8»\Õñ´\Ô\Ñ}ÿm[bİ¯ûÎ¨/\ånD\Å\ê#¤ƒ»NB•†\"´o\ß\Ş\Ù>tè¹êª«Ì­·\Ş\ê\Üÿû\ßÿn\êÕ«—÷\\…0ª©S§:Mıu¿÷\Ê+¯\Ì\ÛUw\Üq‡Ù¹s§\×‡\Ùn®\á1\Ã\r\\\nóÁ\\ºhµŸ\Ìò^q„­\Ò%x\n[°4XZ´h\áY¹r¥fg}À =\àU¶7¿´½_Ú¿Qcb\æ\é\Û¾%¡2Y\ãXt²ñsüñ\ÇMÿşı\Í]w\İ\åtÍ¨\åÀõ\ÄO(¸:­‘µj\Õ2K—.5İºusZ*W®lfÍš\åt½4oö\ì\ÙfÕªU\æµ\×^\Ø\ïÊ¡È·\Ô\Ó\Ò&&·9¿jş€d\ÕvÃ\ßsU\ê–\æıö³ó¶ı¿@?´n\İúúP®÷={ö˜õ\ë\×;\Û\n\"\Z³\åv8p \ïy£Frö#í¯‰‰‰y­_\åI\Z5œ–º^x!œZ\Ü0\ËcKm\è\"\ÒÁ[z}?‡	[œ®u¨Kğ”¦v\í\Ú]n\ÃVY\Ì\ÎĞ˜%ˆ>6Pœ²Á\ës»=µ¬»\Zu jÖ¬™™6mš¹şú\ë\Ù\\jAÒ(--ÍŒ7\ÎlŞ¼Ù¼ù\æ›y\ßS·n]g@qFF†²¾üòK\'¹t\ß\rZš!¦ƒœ\Û*¥®+®¸\Â,^¼Ø¹ô\èQ\çV3ÄŠûûyu\Æ\Å\Ø÷\ëu¿–¢ª\æ\ì8ˆ¼\0UXRAÁ\Ç? ]\ì¹ü\Ã\Îô\ïµ<öû2ı¶Oé¾¶ùú–K¨‚U¶¼gß—):Ax\ä‘G¼¡úÿD­ŸgÎœ\ÉNZºAÅ½¯¯»-¤ZòA3\â/\æÈ‘#NKPB\ëİ°¥\Õ@/h\êO?òı\\\ÂVE¦‹Jk¦`ijÜ¸±:³\ËzvF¬;¦N:jñRòUV-^-Z´0Í›7wB\ßÿ½s¶\ïZ¶l\Ù9­L[·n5\×^{m‘_[¯§)õ\îYœÂ•¶\İ.\Z\rHvWq~Ÿ`[±b…;.\æ\ÅbœÅº\ï¥—gù\Î03üCQş\ç\Ú0°\Çş\İYö\ëYö\ë{|\Ô\Èı¢İ€\éöglo\ÇL:5©¼ü?9yò¤ú\İ}K!_×»\í¶\ÛòZº\\\nZ…¾q\Ï9÷×¬Yc:w\î\Ì?l”ˆıL-µŸkg\Í+Í”õ?A\r4½¾Ÿ¥„­\n.===:Ø³2ò³g¾5\íNŸB3x\Ô\â\Õ\Í\ŞvSšı½vh¬I)…]\çC©¶>ø 3%^]*2o\Ş<§\ÕJeÎœ9N+VÕªUptüøqg–—»‹\Æ\ÅlÙ²\Åiµ²\Ñ`\ì\ß\Z \ÇÜƒ›ºµ~‘{_\Û			\Åş}‚M\ã}t^»v\í·¥\È˜ûş¶g#•\ÒÀq¶™Mo\èû\Ù\Ù\Ù\Ó\Ë\ÓøB—ZLıC‘Âº†(¸û\ÚC=”÷5µxi\ßs¿kf\ßÂ…õ=ö˜\Ó\Z¦\ç\èqµB\0%\Ñ\Ñ3\íg\ëµ¹a\Ã“’’”…MÕ…hO\Ô\í~®§¶*8…‹ÒR­–\n{l\Ñ{ªc\Z)p¸\İjÁ¤³ş=z˜¯¾ú\ÊY\Ñ\Ø]{H)]JB\ã«N:\å$ıcĞ¶¾Gï›´k\×\Î	?º´’Â•{ù	ÄªT©’÷s\æÎ›\×:¥€¦m…%\Ñ\Ïtgˆ]\ê\ïS\ZaKA\Ò7.\æpü\Ú\ÏBŠ½™fo\ß	·úÀ\n¢¥e\Ü}H\ãŸzö\ì™\×j:h\Ğ 3a\Âg_f*-Ÿ\â[N¥£fø\êrÀ€ÿ9_|ñ…NÜ µ,–\Ï l•Pll¬\×¸#J3p\İr\Ë-‡§OŸ~¹=¸¼\ÄS” §3VG\å;ømoÓ¦M\ã²x?*\ì×™\å\äZ½zµ¹ñ\Æ\é\n?ZM\à\İ\à$ZLR\'\ÃR÷Ÿ¦Ø·j\Õ\Ê	O¢kıƒ‘¶Õµ(ju(lpò\Å~”\ì¼\Ã\îkc\ì?\å)\å±«(\Ü}¬ \Ú\ïÔ‚\åß¿{Z+p{•oTHµ\ÅYeWa\ë\Î;\ï\èØ­İ»wk‚Q^«–ıŒ•F\Ø*¡øøø3©©©1\î\"„¥¡R¥J)vÌ´iÿ•`ıŒ¾}û\Z¶\ìYM¶ıùQ¾C”½Ÿj\ï/²e’\rŸ_¨\ê\á‡.³A\ÈjqòÏ¢3{÷*ò\n?n‹”¸-[*\î]ÿ8´p¤´Ô‚\àÿ=\ZW£\×tS+Ù…–t¸\Ğ\ïƒ\â±õ\İú\ÓO?]OM\0¥Ë<Î´Ç‡%v³ƒZ·F\é,ªˆ™‰Z\î\áw\ŞÉ¶ÿs\İøeû÷\ïŸBØ‚V¹İµs\ç\Î&¥¶6m\Úô£½\É.Í¿S¡µ\î‘\ïLC%/l™Z¹r\åE6`¥–õ{\áS°\ÑU\ã]Z¦0\nN\nCcÆŒq\ÆXi,×Œ3\Ìşğ‡¼\ç¨G×£s¯3·m\Û6§\ë\Øm\Í\Ô\åS´ŒD ~\rA(S\Z<¨Y¾54NuÄˆfğ\àÁ%\n\\\nZ6¸y÷\î\İ\ë­{¬ùM¸,ªM\Ø*¡øøø¥IIIM\ÔBRZ–/_®V£R\áZ\nX\Z¨8\×9¡4Z\Ë\r|ò\É\'NHR—\ÆF¹\ÔmWXwŒ‚“Æ—iö »!É¿¥*ÿ,.w`»ûš½vq\0(k»‚ˆ\ÆP%&&>iŸ3A9B3¼Õºõ\Ì3\Ï«KQ=\nj\ÑòZ:\æ<Nc0	[%”––öúÎ;\Ê\ÎÎ,¥…M3m@hfoŸ(¥£«%6|Œó-\ë\ZŠ\ïƒÎ¨z\ê)g[ƒ\Ï\Õ-\è\Î\Ä\Ò\ÚVQ÷ Z¤\Ü\à£A™\ZL~\ï½÷š§Ÿ~\Ú2\Ä\Ôb©u‚ñû\0@ˆp¯ r\Â¯96ø|’ÿ\n\"S§Nb¿¦\æı•%\ÔÂ¥ÿ™š¤1®E™¥¯Y‡ú¿«1Z~]‡:\î±.¬®ÿK\Ø*¡aÃ†ıø\Üs\Ï\íØ°aÃµ…]³,,X0\Ã\î”×”\Â\ìŒ?\ÙXr\\\\\Üôò°€ÿj\î\îTduû©Uiùò\åZ\Ğ3\ï\ëjµR÷a||¼sı-¹²go¦mÛ¶yK=h\ÑSµp¶´\Ä\Åf^\Ê\ï\0¡\È´¦\ã¯løù•\ï\n\"s\ì}÷\Ä[\ã†\Ç&&&\êø0\Ê>÷r\áÒ²6\Z8¯\ÙØš Ñ¸qc\'x\éT]…\nXZ°Tk¿Ù’s\ê\Ô)u#¸3æ´Anl¸\Õ%a+\0\Ò\ÒÒ†|jÙ+:È­[©\ãÆ»\Ñ\î\Ôoûo²¢a\åõıPs¶K3ştY\nX>ú\è9ù©’]\ëòR·_\ì÷€r ª»µ® Ò·o\ßöX4mÿşı\Ó\íI©f¨%!ôD….\ÍüV¹ÿ™E\Ë4F+Ü–o)\èE13fZFF\Æ¥ù`\Z>|¸Zµ‡\Ë\ì\0@¹¤1¼ım¸ú¼v\íÚš¯…NG\Ø\Ûşš™nr¯6QT\Ëly\È\ãñ\Ü®AKh\Ù\n´´´nŸşù\æ¦M›V.\è\â\Å%µiÓ¦\ÙkÖ¬¹\ß\î\Èw‡\Ë\ì\0s.Â¥¥\Ê5{LªfCW»\Ù\Ã÷\Ğö\è\è\è^\Ù\ÙÙ\í\ãÿa\ï·1g¯¹ª.G]¹B³‰5\Ékz8,XJ\Ø*E\Úaø›#FŒ:t\èeZù9Pö\î\İû¯7\Şx£•İ©ÿ+œ“?\0„c\àª`oã¬¬¬\ç\ì1±ƒ\İ\É\ÛO\Ø\n¸‰\'N\Z0`@\ìK/½ô\Îó\Ï?_5-\\j\ÑRĞ²g	£¦N:‘Z€7¶\Ä¯×›\ã»t\\]A\ÄŞ¼\Ä.@\Ø\nªI“&}œ˜˜x\â\ÕW_ı w\ï\ŞQ]»v­R\ÌAó©o¿ıö\ÌU«Vi\äöpœ\0\á\È\×5öJyıı/r‘,_ÀŠ´·‘¾å¾ŒŒŒœ\è^A\Ä÷Ô¶&w\á\ÓQ7£zk¶p\É|ë¬ø\Û\ßş6fŞ¼y\Í\r\Zßºu\ë\ÊEüöÌ…\Î?~|“¬¬¬&\Z£E\×!\0 Œ¨\ëŒ\ßD”ò_AD\äg\æû>6]-\ç¯­EWú\İÿ©-k[¸\Ô3›{m\è\ê=|øğ\ÇcbbZ4k\Ö\ìPûö\í«6j\Ô(¦zõ\êut¹—“\'OHMMMÛ¼yó¶eË–EmÛ¶­ivvv=û½õx<\0(C‘¹‚\Èm&·\ï\Z[tA\Ù\Ú\î÷ù\ÂV[ŞµeŸ-÷\å_:\Öù¯¥£\ëı\ì±\å\0a—\Zº´sN0`@½\r6ô^¿~½;;C;ªfg$Ø¢%\Éu	/my¼¢\Ì\Î\0\0„®\"^ADÇ±¶·E-\\\ßø×š[3Í¹-^Ÿ\ÙòK\ßñ\Ïø}§}\ÛZ\Üğ}[†c]¶JÉ¤I“”\ÖG\Zfg\0\0B[Q¯ ¢V­ş¶´·e´-‡l¹\Ë\ä¶^©\Õ\ê“\ÛUø¦_ÀºÂ–1¾í†¶üÃ·}}¸-\Â\0\08\Ç%\\AD­Xlia\Ë¾\Ç\Öù\Â\Ö@¿ûş\Ãa\ny­\á\\§„-\0\0P\Z—5Ä–\Í&·;Q•>\æ»\ïjl\Ë_ü\î\×2¹c·ú˜\Ü\Ö/1õüöe’°§L\Ø\n\rõmÙon–o‡\0 ”¨k‚\ÉmÕŠ±%\Ş\äv\r÷{\Î_ò}Ï‹&·ûQ³µ4\ÄV[şm\Ë\ŞpO¥¼Î¾°¤5²®÷+ºÿ”9wö…h¸&~÷ÿ\ÃwvÀû\0eÑ¾\ã•\Æf¥\áùj\ÕR‹\Öû¾ûj\rÓš\\=Â½’x|·¿÷\×Sù\î»Ô„ªE\İ\êú\Ò}?[1¹Sh÷S\0€¤F„_˜\ÜYˆ\î¬\Âz…§Ú¾†„$sv|—Û  ‹\ZX?Ù–\×m\ÙH\ØB \ë_M¯\ê£\î\ãK÷³L\îLÓ¾ õ[¿3\0\0\0B…BÓ›ùo\Î]\î!\Ç\ïö³|\ÏMö\Û^\ê+a{°G\és[°~mr\×Q¿u[\Û\ÒÓ–c&w%]Mƒ=nr[¹X2\0\êòªÙ¾\ÛC<wNE©\ÂV\à\Õ÷%\Ñ,ÿ\æT÷~[f˜\Ü¬‡L\î\0C\Í\èøÈ–\ï\ÌùM¨?¥Z\0 l!\×nsvf¡ú®ı›SZQ\×ÿœ\êN\ì\ée®ÿ´e\Õ\nFdd¤7\'\'\'\Â\ŞReÌ¾Zy¼.5\ÂJ\âª\"<G]†\ÏÛ²\ÂwO\í\0U	F\\\\\ÜÁcÇ\ÕNHH 2\Ê\ØÑ£G5Xú5°?É£\n‚F!iZ÷•-ºÈ§.yCµÁU©R¥eiiiTDğx<Z*`	5pG\ËVp\Ô4¹W@_T„\çş\Î\ä^SJW;o\é+ş\ã¼\Zø^³? \0233\ßÚ¿·úõ\ëWŠˆˆ B\ÊNrJJŠşß½KU \ÜÑ²x\Z 1Wc\nøÚª|÷o¶eª/Hm÷}ı_\æ\ì¸.•n- p\î¼ó\Îo½^\ï\Æ}ûöQe())i¡}öu\ê\Ôiµ\Â.•–tXY\È\×\Æå»¯Y‡Gò=6•*‚+33s`rrò‰ôôt*£¤¦¦\ÎJIIùENNÎ³\Ô[@qw¬\Ü_TDğ\ÍøÊ¢&\Î\êÒ¥\Ë÷¶^º÷\İwi®\ÒZ›6mjñû>$Q# l\Å\ä›ñEE„\0ßŒ¯õ\ÔÄ¹:v\ì¸(++«÷†\r\Òw\íÚ•\âõz©”\àJNJJúp\ãÆ\í\ìöÓ¶ş\çP% l%ÀŒ¯\ĞÁŒ¯®\ì\ì\ìv\É\ÉÉ«¿ù\æ›CÛ¶m[gÃ©‡V\ÙÀP«\ê‘#G\æ~÷\İw“¿şú\ë)))\ìcZ¨h˜ˆ `\ÆW\è´&0\ã\ë\ÂÔ¥¨›´²ûl/[:\Øû—\ÛGí”˜&i‚\Ï\íƒ†GE\ÅQA³t\é\Ò\Õ6lı´n]ˆ.+\ê¶Qk‚=\Èu¢6\0 lĞˆ a\ÆW\Ùb\Æ\0„†(ª\0Á2q\â\Ä\Ã<ğÀ·GéK¥”b\Ğò\Íøú]\çÎ—Q#\0@\ØB˜\Z?~üö®>p\à@{\à?_™1\\A¥_Ó’““\ïQ\Ğb 2\0”=z(ó\ç\ÏoùNttt\ëš5k\î©Q£\ÆU			u\ìcTN	iÆ—–wĞ¬C\r†×ª\Ü\ê:d\r#\0 l¡ÒŒ¯ˆˆˆ^v³ƒ-m3¾A–j­%¶\Ì`\Æ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0a\êÿ\'0_\ìË¬¶\0\0\0\0IEND®B`‚',NULL),('5',1,'èœå•å‘å¸ƒç”³è¯·.bpmn20.xml','4','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"WF-00001\" isExecutable=\"true\">\n    <startEvent id=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" name=\"è¯·å‡ç”³è¯·\"/>\n    <sequenceFlow id=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" sourceRef=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" targetRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"/>\n    <userTask id=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" name=\"å®¡æ‰¹\"/>\n    <sequenceFlow id=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" sourceRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" targetRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"/>\n    <endEvent id=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" sourceRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" targetRef=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_WF-00001\">\n    <bpmndi:BPMNPlane bpmnElement=\"WF-00001\" id=\"BPMNPlane_WF-00001\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" id=\"BPMNShape_sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"80.0\" y=\"43.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" id=\"BPMNShape_sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"150.0\" y=\"18.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" id=\"BPMNShape_sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"317.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" id=\"BPMNShape_sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"525.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" id=\"BPMNEdge_sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\">\n        <omgdi:waypoint x=\"417.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"68.0\"/>\n        <omgdi:waypoint x=\"525.0\" y=\"68.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" id=\"BPMNEdge_sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\">\n        <omgdi:waypoint x=\"110.0\" y=\"58.0\"/>\n        <omgdi:waypoint x=\"150.0\" y=\"58.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" id=\"BPMNEdge_sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\">\n        <omgdi:waypoint x=\"250.0\" y=\"56.20359281437126\"/>\n        <omgdi:waypoint x=\"317.0\" y=\"53.79640718562874\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('6',1,'èœå•å‘å¸ƒç”³è¯·.WF-00001.png','4','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\03\0\0\0l\0\0\0Ÿ3\É\0\0VIDATx\Ú\í	l\çÇ­64H$\"iPÛ”¦6¥	BUJ…\Ò*E¢‘hš*‰Šø\0\Ë oB¸\ÔB¡„’¦\r¨(\"D‰¡\Ô\åğ¹\Ä‡+8\Ü;vˆ\Æ\Âô½ÑŒ5Œ\×\Æ\ëcvfıûIOóyg\ÖÏ¾÷Ÿ÷½\ïû\â\â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 †q\ÇÉ“\'\×\îÙ³\ç\ë\Ü\Ü\\#;;ó\ØrrrŒ\íÛ·.–„G\0\0Dˆ\n™\Â\ÂB£¢¢Â¨««Ã¢d•••FAAÁ%6ƒñJ\0\0€ĞŒB\Æ7‚¦.;;û(^	\0\0Úµ„ğ‰˜¹W\0\0D€\Öl \"|%f¼\0\0 \Ä\ÌW_–\'÷½cÎ™cš¶õ5b\0:Œa\ÄH\ÅLuU©qh\Ë,\ã`\Ö\Ô[L_\Ó}ˆ\Ä\0t\01Âˆ‘ ‹™s‡ÿ\İ@\È\ØvşğF|1\0FŒ0b$\Èb\æ\è¶Šİ‡_!f\0 ÀˆFŒY\Ì\Ê\ÎhT\Ì\è>|\n1\0Œ€˜ÁğM\0ˆ\r1Ãˆ†}S}±11£ûğ)|\0Œ!`ø\Ú7Kv¾Ù¨˜\Ñ}ø¾	\0FŒ0|\í›K‹C[\Ó\nmyM÷\áSø&\001BÀğµoªÚ¿¢_\êkø¾	\0Š,	ş3µµFÉ®·\Zv1\ÉkºŸ\Â7€€˜!`ø\Ö7µ^\ëøÎ¿5ê›ºš.|\0Œ!`ø\Ï7kk²’<\ã\ã\Í/7ê—¶\é1z,Y\Z|\0:¸˜a\Ä\Ã/¾y»lY\Z|\0Œ!`ø\Ú7›“i*Kƒ\á›\0\ĞA\Å#F~ñÍ–\n\Ûğ1|\0:ª˜a\Ä\Ã\ÇB\Ã7€€Áˆb\Ã7 #Fˆ\ß€ FŒ03¾	\0Œ!` f0|3öILLüÁ!C\Æ:t­X‰Xµ˜!vU\ì”\ìË”\í=«Œ!` f0|3v6l\Ø3b\Ùbu–xim“ã“¸z@ÀÀø&¾	QCIO$›#0\á¬0>>ş!®&00¾‰o‚§2dhBB\ÂNa’˜˜h¼ú\ê«F^^qö\ìY\ãò\åË†r\å\Ê£´´\ÔØ¹s§±xñb#99\Ù-hª\É\Ò\0#`\à›ø&x)dñq\Ã)bV®\\iTTTÍ¡ªª\Ê<^\ß\ç5ò;Gqu€0ğM|\Ú=#\ã2“&M2³0-A\ß7u\êT· !C\ã7\ä³\ê\\\\\\z\ï½÷\n\æÏŸiÜ¸q\×SRR\Ì,))\é\æ/¼P7cÆŒ“,X)öSFÀÀ7ñMğ+Z#\ã\ìZJOO¯\ïJj)\Ú5o\Ş<w—\Ó\Ã\\mŸˆ˜u\ëÖ­˜;w\îõ	&Ë–-3ö\ì\Ùcö^½z\Õü\0u«)¹>ú\È±cŒ?ş\æÄ‰O§¥¥\"``|\ß¿!B&Ç™‘i­q\n\ZW†¦«eD´¤¾ò\Ê+µúÁ¨P¹q\ãF³?\ĞÓ¦M»\n…µº›€AÀÀ71|3ö\Ğ\á\×\Î\Z™–v-5\Õ\åä¬¡¡»)zÙ˜;6lØ÷üó\Ï7nŒHÄ¸Ù¼y³‘ššZ\Ä,\rƒ€obøfLŠ™l[hhñn{°zõj²3\Ñ2ùùù{Çk?~¼M>\ÔÓ§O\"ŒjF\Zõ\"#`\à›ø&D±\×.ú\Õ\ì\ÉÅ‹\ÛE\Ì\è(\'×°\í\\}ÑŒŒ\n™\æKk.úû\Ò\Ò\Ò5ş€AÀÀ71|3¶°–(0\Æk¯½f´\':C\ÌL\á\ê{„\Ö\Èh\×R[ed\Âeh†^”\ên\ÃK\â\ã\ã¿\'7¼™²½\ß\Ä7¡}°\ÖZ2F~~~»ŠX\Ï!f6rõ½\é^\ê<gÎœ:­‘iO²²²jw#f0Fƒ›lO½\éÉ“c•\Ø4ı\İğM|\Úü{VbŒ¶.üu££~b\æW\ß233\ß\×QK×®]3Ú›Ñ£G—¡»‰€AÀğ83s—kZt]w¡›>ø&¾	m&f\ìÕ¯\Ûl8vSÃ´\ßg®¾YGF‡_{ÁÁƒë‚!`0¢p£\r»€ˆÿ\ÕNQƒoú\ËZ¹8¡¯-(\ßk6ß‡#ùyA¯e`Ñ™}µ\è·5C°#%55µ<Z\Õ\İ\Öò\î¿F\Ì f‚\"f¶InÚ¿šo\ê3Ó’%Kn{Ì”)S\ê\Û\Ú\åm·÷\îİ‹oF\Éƒr®*ø\ínZ\Ùn³ºj\ç\î®%3\Ã\èË—/7¼dñ\â\Å¢U\İ\íx\Ú\Í\ÖÀ€˜A\ÌDÂ€\îHNN\î2|øğû\â\ã\ã»\'$$üH¶½Å§~.>õ«\ç{\î7\ÖMô\ëiq„XH\Ú\ãeûG\ÙşIı³´Iû\ï\Ò^.\í•\ÒşW3\Ä\Ì\r9öš\ß}³  ÀØ°aƒü›\Û\îİ»=ö˜\ÙV[·nñ\àƒ63z²Û«V­j\Ğ\Æ73Mef\Zù\Îhw\ín±·\Ä‹¢f&FÑµ–t‰/Ùµk\×\éhUw‡{\Ú\r—©A\ÌøË¶n\İj<õ\ÔSwŠp\è*Ÿ\×weûC¹õ’ö\Ïd\ÛO>\Çş\Ò¨«\à\êMK\ë²d;R\ìEym’l_›#\í²]\"¶L\ì]±\ÄÖ«\èu\ã+;\"vB¬T\ì¢\ØW*&Ä®[\íÏ­}\'\äo¶Ş³K\ÚyV%\ÓzZ|W\ÚK¥ıWıÛ²­\ç¢\ç$\í\Ñz\ÒN”öš1ŸŠ{ö\Ùg\ï\Ók\àw\ßt;\ï¼ÓûLıÏ:u2¦OŸn¶Oœ8a\n}EcÍš5fûÈ‘#õ¿«¸¸\ØØ¿?b1\ÓÔ¹ölN·™|×®0š)F\ÑE#\Ë\Ê\Ê<3\å\å\å\ÑRªM\Ô%\Ü\Òı„˜ñ\Õ\Ö\ÖÚŸS­Ø—b\ÚMyF\ì±ƒb{Å¶[3{n\Ôá—š\íĞ¬‡Ø›š‘\í<±YšQa –¦Y\Ù\Ñ,ŠfS¤=@³+še‘›\Ş#šu‘ö÷E8}[³1²ıf;ûf¥\ëÆ«SŒJII\é$¡}\é\Ò%£¨¨È¸p\á‚iv\ÖE\ÛÇ3\î¿ÿş°È™™¹÷\Ş{\Í¶7m\Údnõg\Äb¦‰ó-kB\È\Ü[e=\È0\ÏL,¢«_Û‹Fz…ş½hõ!\Æj]\İL1<N9R\ãòİ¼\'¨] *>V¬XaTWW›\íµk×šm­…\éÒ¥K\Ø\ã{õ\êef`´½{÷\îú\×}ôQ|1\ÓdVF\î\Ù\ÃÅ4rO¯´K\nt`+»\Ú\î3\0\'%%\İd`6\Zø½Š1CÀˆ\Âwñ¨\Üt75\ÇL\Ä\Ì\ã?^ß…”ššj¶5+3hĞ ú\ã\n„„óûÿ²Å\İÖ®\'|1ã¨yD\ë\Ğ\äü\Ş;+vAlõ³»[\é\î\ïk3\Å(#FŒ¸\éuf¦¦¦¦Ü‡™™}Zo¡^­Ğ•\Æ\Ãı²…{>Áö\ï\ß\ß8p ™†\ï×¯Ÿ™\Ú\×À ??ğÀş½\Ì\ÌÌ°©şÖœ£M²¤÷4ç¸ ˆ§ Q!£mõÍ®]»\Ö§#>ô\é8\ÎUô\ë|¯\Ö\Ì\è=\n1\ÓñÄŒv\í\Ê=\ír.\Å>´ºbµ–\í±T\ÙÿC\äôq\İ\Ó7†{0ğb\Õl9ç›¬š\í1cÇ­óºf\æÂ…Ÿø¨f\æ­€g\rA\Í\ÊÊª¢¯½ıö\Ûõµ\å\å\å·¯©xİ:uª>h`pµ’’’ú¶ş\î=z\Üòt\Ü\Úó!`xGP\Ä\ÌO<\Ñ 3Ó­[7cÂ„	·­™Q\ß\ÓJmŸ9s\Æ\Ü:t1\ãbFÜµv\Ñ*’\ßl\Õ\È},ö±¤#{¯\Ş\Ãugo¹\ï\é®ÿm›&Mš\ÔfÃ´UœO<ù†3+\Ó\Ôy@2kÖ¬¯G3mÙ²\å¿>Í´[zc\æuÀ°Å†>ö\é\Ó\çñ.#gø°Ÿ\\u«\ç~÷\Ï}ûö5¯|\æf\åŒ3\êÿû÷Gz>\ÄLS\Â\Æ\ÎÌ¸­²²²^¬¨øVÓ¶šı^\Í8\Æ9\æ¡A\ÌÄ˜Ñ™¯E¤üVş\Ö\\¹XóÀ\ì•\×ş\"6H‹\ï#\ì‚ú§ü	\Íø\ßz:\î\Ó\Ó\Ó[-hT\ÈÌ›7\ÏY\'S”µc‚….÷zqœ¬(\Î36­€¡‚\Ä\n\Ú\Ö\"I\Û\â\\E”öğT{t‡\Ñ\íÒ¥KÍ¢\Ês\ç\Î\İò4\ì(v\í;3\ã\Ü×’ó!` fn\'f\ìIğÂ™\î‹sı:…\îÓ®Tyb7ÎŸ?˜	¸˜\Ñù™T¤X#÷Y\â%\ß3›³\Ğ\êmºj;G |†\Ú\ÅÀv†¦¥]Nú>WF†\î%¯™9s\æÇŒóµ‡3\0_MHH8\á÷\ên¯†] 7s­S\Ñn¹¹¹õ¦\ÙİªX\Ñc_ıuóx­˜·Sòj¡P\È4=¶w\ï\Ş\rJS™™mÛ¶µø|ˆ™\æø8\Å\éO\Ìh·õa\ÚM$v\È\ê6Ò¹½¦kw’v+EùLq\n\Z­¡Ñ¬³\Ş[›;jI‹}52V\áñ4\îTQ@\é§^­Í´eË–•A¨\îFÍŒ³\èQgLuÖª\Ø]FÚ¥¤\éLg7Ó“O>iŠ+š5Qa¦Æ¦9™™HÏ‡€˜a¤b\ÆF‚úO´0×šò¤˜\Î)ö¡vıH€\ï\Û\Şs5µ\Í\ĞX\Ë NQ£ó\Ğ\è\Äzšu±» ôŞ«3ûj=\×o¼aŒ1\âkW\r¦fšR¸KE‰‘#G\ÆO<ùºÙ™*qö\"V\Í/fT¨èŒ¨\ÚÖ´ºS<¸‹tã¬‚H;3£sqh·“]lgZ\"\ÍÌ´ô|ˆ\ÄL\Ç3ß°f\àc\r\ÖI\ë\ÎZV¦\é\ê\0ı¯=C¶[h…\Ô\Èø€P(T¬ı\Ó\í‰\Ö\ç¥º;\ZbF§}·‡©\ê\Ô\î\Í3ú¡³«Ú¯\ß}÷\İa\×\Ëil4S¸Z„HÏ‡€˜A\ÌÄ¶˜IKKë¤“Ï‰Mµf\ÚşB‚÷1-º•v²<¨öˆÿy°%j®G\"b4Ã¨%)\Ó\Ô\ÔÔš\ãÇ·‹‘§ü\rªÜƒ¢\\£!ft»íœº=\Î5\ÌÚ™9q\îÓŸ_z\é%ó5[Ü„3·˜i‹ó!` f3±\'ft\áTÙ¦‹\åÈ½û²NB§K\èZb\É\É\Éß‰\Õ\ï˜\Î¬]cº4Š53÷U\Ç\ì\Ü\ç,17…™}}JRRRb(ºRQQÑ¦BFüwH`<¤\ên¯†’¹‡]k\í\ìÙ³ÍŸµ»§11£]D:«\ê\èÑ£\Í}v\ÆÆ¹¸Ÿ\ÓT˜¸„[{>\Äb&vˆÿ–¼wŠÍ—û÷\ïu‘W¾}$Ešš––V\İV\Z\ÍÈ¨	Zu·\ß†¢03¾\Ù^h·\ß64Zİ””tiıúõ_µ¢(¸jÑ¢E\ïXEa)Œ€o\â›\0\à)\Ú˜\n…Ê‹ŠŠj\"™Gf\ëÖ­«E\íru7ƒ€obø&@ìˆšÁ*jRRR*\æÏŸxÇgJKK\Ë\ì\Å)u\ÑH]k)\'\'\ç?›O\ÆBu7ƒ€obø&@Œ\ÑÑª»	|\Ã7€€0ğM|\0€€0ğM|\0€€AÀÀ71|\0\ß\ÄğM\0 ``|\ß\0 `0ğM|\ß\0 `0ğM\ß\0FÀÀ71|\0\ß\Ä7\0|\Ã7\0|\Ã7€€0ğM|\0€€0ğM|\0€€AÀÀ71|\0Ü¨	ø&†o\0#`´5¹¹¹ø„\ìªø\æu¼\03b&¶o\ß^VQQ_øÀJKK?\ß<ŠW\0bC\ÌD@^^Ş üüü/?û\ì³\Z|#z2999g\Ä\ã•\0€˜Á3\"ôi¹&û´‹C¯\r\æ¹\éu?Š\0\Ä†˜\0\0@\Ì f\0\0\0 Œa\Ä\0\0@ a\Ä#F\0\0\0\r#F1\0\0x1Âˆ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€\Íÿhu\Ï\ëm\í2\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_ge_property` VALUES ('next.dbid','20001',9),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10002','WF-00001:1:7','10001','10001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:32:10.665','2018-06-09 23:32:10.692',27,''),('10003','WF-00001:1:7','10001','10001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10004',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:32:10.694',NULL,NULL,''),('10006','WF-00001:1:7','10005','10005','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:32:52.369','2018-06-09 23:32:52.369',0,''),('10007','WF-00001:1:7','10005','10005','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10008',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:32:52.369',NULL,NULL,''),('12503','WF-00001:1:7','12502','12502','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:34:01.400','2018-06-09 23:34:01.704',304,''),('12504','WF-00001:1:7','12501','12501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:34:01.400','2018-06-09 23:34:01.708',308,''),('12505','WF-00001:1:7','12502','12502','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12506',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:34:01.707',NULL,NULL,''),('12507','WF-00001:1:7','12501','12501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12508',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:34:01.711',NULL,NULL,''),('12510','WF-00001:1:7','12509','12509','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:35:29.994','2018-06-09 23:35:29.997',3,''),('12511','WF-00001:1:7','12509','12509','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12512',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:35:29.998',NULL,NULL,''),('15002','WF-00001:1:7','15001','15001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:37:28.899','2018-06-09 23:37:29.155',256,''),('15003','WF-00001:1:7','15001','15001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','15004',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:37:29.160',NULL,NULL,''),('17502','WF-00001:1:7','17501','17501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:38:32.816','2018-06-09 23:38:32.837',21,''),('17503','WF-00001:1:7','17501','17501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17504',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:38:32.838',NULL,NULL,''),('17506','WF-00001:1:7','17505','17505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:39:14.755','2018-06-09 23:39:14.772',17,''),('17507','WF-00001:1:7','17505','17505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17508',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:39:14.776',NULL,NULL,''),('17510','WF-00001:1:7','17509','17509','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:39:44.170','2018-06-09 23:39:44.172',2,''),('17511','WF-00001:1:7','17509','17509','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17512',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:39:44.173',NULL,NULL,''),('2502','WF-00001:1:7','2501','2501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:04:24.760','2018-06-09 23:04:24.769',9,''),('2503','WF-00001:1:7','2501','2501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2504',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:04:24.769',NULL,NULL,''),('2506','WF-00001:1:7','2505','2505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:06:25.753','2018-06-09 23:06:25.762',9,''),('2507','WF-00001:1:7','2505','2505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2508',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:06:25.763',NULL,NULL,''),('5002','WF-00001:1:7','5001','5001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:26:52.279','2018-06-09 23:26:52.303',24,''),('5003','WF-00001:1:7','5001','5001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','5004',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:26:52.304',NULL,NULL,''),('7502','WF-00001:1:7','7501','7501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:29:13.575','2018-06-09 23:29:13.687',112,''),('7503','WF-00001:1:7','7501','7501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7504',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:29:13.690',NULL,NULL,''),('7506','WF-00001:1:7','7505','7505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:30:48.589','2018-06-09 23:30:48.595',6,''),('7507','WF-00001:1:7','7505','7505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7508',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:30:48.596',NULL,NULL,'');
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
INSERT INTO `act_hi_procinst` VALUES ('10001','10001',NULL,'WF-00001:1:7','2018-06-09 23:32:10.665',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('10005','10005',NULL,'WF-00001:1:7','2018-06-09 23:32:52.369',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('12501','12501',NULL,'WF-00001:1:7','2018-06-09 23:34:01.399',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('12502','12502',NULL,'WF-00001:1:7','2018-06-09 23:34:01.400',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('12509','12509',NULL,'WF-00001:1:7','2018-06-09 23:35:29.994',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('15001','15001',NULL,'WF-00001:1:7','2018-06-09 23:37:28.898',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('17501','17501',NULL,'WF-00001:1:7','2018-06-09 23:38:32.815',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('17505','17505',NULL,'WF-00001:1:7','2018-06-09 23:39:14.754',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('17509','17509',NULL,'WF-00001:1:7','2018-06-09 23:39:44.170',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('2501','2501',NULL,'WF-00001:1:7','2018-06-09 23:04:24.760',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('2505','2505',NULL,'WF-00001:1:7','2018-06-09 23:06:25.753',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('5001','5001',NULL,'WF-00001:1:7','2018-06-09 23:26:52.279',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('7501','7501',NULL,'WF-00001:1:7','2018-06-09 23:29:13.574',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('7505','7505',NULL,'WF-00001:1:7','2018-06-09 23:30:48.589',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('10004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10001','10001','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:32:10.702',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('10008','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10005','10005','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:32:52.369',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12506','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12502','12502','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:34:01.719',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12501','12501','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:34:01.719',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12512','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12509','12509','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:35:30.003',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('15004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','15001','15001','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:37:29.180',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17501','17501','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:38:32.939',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17505','17505','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:39:14.789',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17512','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17509','17509','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:39:44.175',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('2504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2501','2501','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:04:24.808',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('2508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2505','2505','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:06:25.770',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('5004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','5001','5001','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:26:52.310',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7501','7501','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:29:13.718',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7505','7505','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:30:48.603',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_re_deployment` VALUES ('4','èœå•å‘å¸ƒç”³è¯·',NULL,'','2018-06-09 14:47:54.024');
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
INSERT INTO `act_re_model` VALUES ('1',5,'èœå•å‘å¸ƒç”³è¯·','èœå•å‘å¸ƒç”³è¯·',NULL,'2018-06-09 14:45:58.640','2018-06-09 14:47:31.591',1,'{\"name\":\"èœå•å‘å¸ƒç”³è¯·\",\"revision\":1,\"description\":\"èœå•å‘å¸ƒç”³è¯·\"}',NULL,'2','3','');
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
INSERT INTO `act_re_procdef` VALUES ('WF-00001:1:7',1,'http://www.activiti.org/processdef',NULL,'WF-00001',1,'4','èœå•å‘å¸ƒç”³è¯·.bpmn20.xml','èœå•å‘å¸ƒç”³è¯·.WF-00001.png',NULL,0,1,1,'');
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
INSERT INTO `act_ru_execution` VALUES ('10001',1,'10001',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('10005',1,'10005',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('12501',1,'12501',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('12502',1,'12502',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('12509',1,'12509',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('15001',1,'15001',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('17501',1,'17501',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('17505',1,'17505',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('17509',1,'17509',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('2501',1,'2501',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('2505',1,'2505',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('5001',1,'5001',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('7501',1,'7501',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('7505',1,'7505',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL);
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
INSERT INTO `act_ru_task` VALUES ('10004',1,'10001','10001','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:32:10.694',NULL,NULL,1,'',NULL),('10008',1,'10005','10005','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:32:52.369',NULL,NULL,1,'',NULL),('12506',1,'12502','12502','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:34:01.709',NULL,NULL,1,'',NULL),('12508',1,'12501','12501','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:34:01.712',NULL,NULL,1,'',NULL),('12512',1,'12509','12509','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:35:29.999',NULL,NULL,1,'',NULL),('15004',1,'15001','15001','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:37:29.162',NULL,NULL,1,'',NULL),('17504',1,'17501','17501','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:38:32.838',NULL,NULL,1,'',NULL),('17508',1,'17505','17505','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:39:14.777',NULL,NULL,1,'',NULL),('17512',1,'17509','17509','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:39:44.173',NULL,NULL,1,'',NULL),('2504',1,'2501','2501','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:04:24.769',NULL,NULL,1,'',NULL),('2508',1,'2505','2505','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:06:25.763',NULL,NULL,1,'',NULL),('5004',1,'5001','5001','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:26:52.304',NULL,NULL,1,'',NULL),('7504',1,'7501','7501','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:29:13.691',NULL,NULL,1,'',NULL),('7508',1,'7505','7505','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:30:48.597',NULL,NULL,1,'',NULL);
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

-- Dump completed on 2018-06-09 23:49:14
