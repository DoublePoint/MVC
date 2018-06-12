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
INSERT INTO `act_ge_bytearray` VALUES ('20005',1,'æµ‹è¯•æ¨¡åž‹2.bpmn20.xml','20004','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"æµ‹è¯•æ¨¡åž‹2\" name=\"æµ‹è¯•æ¨¡åž‹2\" isExecutable=\"true\">\n    <startEvent id=\"sid-F70CF072-3C4D-43EF-B70F-6A5588AE313F\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_æµ‹è¯•æ¨¡åž‹2\">\n    <bpmndi:BPMNPlane bpmnElement=\"æµ‹è¯•æ¨¡åž‹2\" id=\"BPMNPlane_æµ‹è¯•æ¨¡åž‹2\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-F70CF072-3C4D-43EF-B70F-6A5588AE313F\" id=\"BPMNShape_sid-F70CF072-3C4D-43EF-B70F-6A5588AE313F\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"147.0\" y=\"34.0\"/>\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('20006',1,'æµ‹è¯•æ¨¡åž‹2.æµ‹è¯•æ¨¡åž‹2.png','20004','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0»\0\0\0J\0\0\0\ã^%\Ö\0\0YIDATx\Ú\í\Û\ÑKSqÀq|\è\è!(¨?\Ã?¢\átC\ÇN\Í\éÔ„Š¢>LD|a=„\èX+£aR8\æ \"+›\è\ÜØ‹Hµ55ýN\äK%n¿»Á÷—½\í\Â\á\ÜÃ¹\çž_M\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\à”RW’É¤wvvöE0<\ê\ê\ê:q¹\\\Ên·+§\Óy\Ö\Þ\Þ^Ø™˜˜˜\Ó\×M\"†ªLòùùùûccc\'~¿_\Í\ÌÌ¨\r•N§U¡PPB~s¹œ\Ú\Ü\ÜTúaP\Ý\Ý\Ýg===©\Ö\ÖVDU\ÐI\íÿ\Þ\ß\ßÿ+‘OOO\ÕÿJ$*œz½\Þw6›\í\ÑD¥Vó\Úp8ü¼­­ME\"‘%ùŸ–––”\Û\í\ÎS\åQ‘‰¾¶¶ö\Ú\çó©\í\ímU\n©TJ\é\'\ïñx\îaT©\è’\èÒƒ—’üŸ®\î_\Z\Z\ZœDÑ£K\ëRªŠþ·\n\ß\Ô\Ôt¨þÑ†¥S—\Ñ\ÑÑ¢ô\è\åFó‡\ã‡e\È\Ô\åøøX•[GGG–v–Uu™£\ËxÑ„­­­\"\Õ–/£òRz™\ãE¹\Ý\î¬\Ýn¿Fôa”¬\0„B!e\ÒôôtB\'û]¢£d\×EV\0LZ__O\éd}%K]™L\Æh²g³ÙœNö=¢£d{ñ|©\Ë¹ŸNöÑ‡Q²¦k¹/Ñ‡Q\Í\Í\Íg¦+{>Ÿ\ÏR\Ùaœ\Ï\ç+š\î\Ù\ÞÓ³Ã¸¡¡¡¦§1\Ë\Ë\ËO˜\ÆÀ¸\É\ÉÉ\é9ûððp”9;Œ¼\Þ\Ù\Ùù\Ã\à\ÔBcc\ã\'¾ \Â½½½M\í\Æ\èfN\'úK¢K´´´\ØúúúNT÷C]\Õ\ãl=\ÂR^¯7Y\î}vy?ª^WWWK\Äa\é¡\åpt¹N*%“É°¾G†“J¨N§Ó¡+ü·RŸA\Ý\ßß\éöe—ö\Å\áp¸\åpt©*¼TtIôúúú\0\ÑE\ÅÑ‰i\×Uþhqqñ\ë%^Z§¦¦\îI\ë¢/QEE÷ðº\"?\ÓmM6\ç/2G_YYy¨–7ò2JŽjJúÛ’ô.—+\ß\Æb±\Ýt:9_“¥.\ÙuY]]}<22òT·A;’\äRÍ™º Z{ù«ºJûu?\Ò\×g\ÙZ”5\Ýß¿{²\ë\"+\0|\0\0\0\0\0\0\0\0€q?r]P’‡\×\Õn\0\0\0\0IEND®B`‚',1),('20021',1,'èœå•å‘å¸ƒç”³è¯·.bpmn20.xml','20020','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"WF-00001\" isExecutable=\"true\">\n    <startEvent id=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" name=\"è¯·å‡ç”³è¯·\"/>\n    <sequenceFlow id=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" sourceRef=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" targetRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"/>\n    <userTask id=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" name=\"å®¡æ‰¹\"/>\n    <sequenceFlow id=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" sourceRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" targetRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"/>\n    <endEvent id=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" sourceRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" targetRef=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_WF-00001\">\n    <bpmndi:BPMNPlane bpmnElement=\"WF-00001\" id=\"BPMNPlane_WF-00001\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" id=\"BPMNShape_sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"80.0\" y=\"43.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" id=\"BPMNShape_sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"150.0\" y=\"18.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" id=\"BPMNShape_sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"317.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" id=\"BPMNShape_sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"525.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" id=\"BPMNEdge_sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\">\n        <omgdi:waypoint x=\"417.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"68.0\"/>\n        <omgdi:waypoint x=\"525.0\" y=\"68.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" id=\"BPMNEdge_sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\">\n        <omgdi:waypoint x=\"110.0\" y=\"58.0\"/>\n        <omgdi:waypoint x=\"150.0\" y=\"58.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" id=\"BPMNEdge_sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\">\n        <omgdi:waypoint x=\"250.0\" y=\"56.20359281437126\"/>\n        <omgdi:waypoint x=\"317.0\" y=\"53.79640718562874\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('20022',1,'èœå•å‘å¸ƒç”³è¯·.WF-00001.png','20020','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\03\0\0\0l\0\0\0Ÿ3\É\0\0VIDATx\Ú\í	l\çÇ­64H$\"iPÛ”¦6¥	BUJ…\Ò*E¢‘hš*‰Šø\0\Ë oB¸\ÔB¡„’¦\r¨(\"D‰¡\Ô\åð¹\Ä‡+8\Ü;vˆ\Æ\Âô½ÑŒ5Œ\×\Æ\ëcvfýûIOóyg\ÖÏ¾÷Ÿ÷½\ïû\â\â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 †q\ÇÉ“\'\×\îÙ³\ç\ë\Ü\Ü\\#;;ó\ØrrrŒ\íÛ·.–„G\0\0Dˆ\n™\Â\ÂB£¢¢Â¨««Ã¢d•••FAAÁ%6ƒñJ\0\0€ÐŒB\Æ7‚¦.;;û(^	\0\0Úµ„ð‰˜¹ŽW\0\0D€\Öl \"|%f¼\0\0 \Ä\ÌW_–\'÷½cÎ™cš¶õ5b\0:Œa\ÄH\ÅLuU©qh\Ë,\ã`\Ö\Ô[L_\Ó}ˆ\Ä\0t\01Âˆ‘ ‹™s‡ÿ\Ý@\È\ØvþðF|1\0FŒ0b$\Èb\æ\è¶ŠÝ‡_!f\0 ÀˆFŒY\Ì\Ê\ÎhT\Ì\è>|\n1\0Œ€˜ÁðM\0ˆ\r1Ãˆ†}S}±11£ûð)|\0Œ!`ø\Ú7Kv¾Ù¨˜\Ñ}ø¾	\0FŒ0|\í›K‹C[\Ó\nmyM÷\áSø&\001BÀðµoªÚ¿¢_\êkø¾	\0Š,	þ3µµFÉ®·\Zv1\ÉkºŸ\Â7€€˜!`ø\Ö7µ^\ëøÎ¿5ê›ºš.|\0Œ!`ø\Ï7kk²’<\ã\ã\Í/7ê—¶\é1z,Y\Z|\0:¸˜a\Ä\Ã/¾y»lY\Z|\0Œ!`ø\Ú7›“i*Kƒ\á›\0\ÐA\Å#F~ñÍ–\n\Ûð1|\0:ª˜a\Ä\Ã\ÇB\Ã7€€Áˆb\Ã7 #Fˆ\ß€ FŒ03¾	\0Œ!` f0|3öILLüÁ!C\Æ:t­X‰Xµ˜!vU\ì”\ìË”\í=Ž«Œ!` f0|3v6l\Ø3b\Ùbu–xiŽm“ã“¸z@ÀÀø&¾	QCIO$›#0\á¬0>>þ!®&00¾‰o‚§2dhBB\ÂNa’˜˜h¼ú\ê«F^^žqö\ìY\ãò\åË†r\å\Ê£´´\ÔØ¹s§±xñb#99\Ù-hª\É\Ò\0#`\à›ø&x)džñq\Ã)bV®\\iTTTÍ¡ªª\Ê<^\ß\ç5ò;Gqu€0ðM|\Ú=#\ã2“&M2³0-A\ß7u\êT· !C\ã7\ä³\ê\\\\\\z\ï½÷\n\æÏŸiÜ¸q\×SRR\Ì,))\é\æ/¼P7cÆŒ“,X)öSFÀÀ7ñMð+Z#\ã\ìZJOO¯\ïJj)\Ú5o\Þ<w—\Ó\Ã\\mŸˆ˜u\ëÖ­˜;w\îõ	&Ë–-3ö\ì\Ùcö^½z\Õü\0u«)¹>ú\È±cŒ?þ\æÄ‰O§¥¥\"``|\ß¿!B&Ç™‘i­q\n\ZW†¦«eD´¤¾ò\Ê+µúÁ¨P¹q\ãF³?\ÐÓ¦M»\n…Žµº›€AÀÀ71|3ö\Ð\á\×\Î\Z™–v-5\Õ\åä¬¡¡»)zÙ˜;6lØ÷üó\Ï7nŒHÄ¸Ù¼y³‘ššZ\Ä,\rƒ€obøfLŠ™l[hhñn{°zõj²3\Ñ2ùùù{ÇŽk?~¼M>\ÔÓ§O\"ŒjF\Zõ\"#`\à›ø&D±\×.ú\Õ\ì\ÉÅ‹\ÛE\Ì\è(\'×°\íž\\}ÑŒŒ\n™\æKk.úû\Ò\Ò\Ò5þž€AÀÀ71|3¶°–(0\Æk¯½f´\':C\ÌL\á\ê{„\Ö\Èh\×R[ed\Âeh†^”\ên\ÃK\â\ã\ã¿\'7¼™²½\ß\Ä7¡}°\ÖZ2F~~~»ŠX\Ï!f6rõ½\é^\ê<gÎœ:­‘iO²²²jw#f0Fƒ›lO½\éÉ“c•\Ø4ý\ÝðM|\Úü{VbŒ¶.üu££~b\æW\ß233\ß\×QK×®]3Ú›Ñ£G—¡»‰€AÀð83s—kZt]w¡›>ø&¾	m&f\ìÕ¯\Ûl8vSÃ´\ßg®¾YGF‡_{ÁÁƒë‚!`0¢p£\r»€ˆÿ\ÕNQƒoú\ËZ¹8¡¯-(\ßk6ß‡#ùŽyA¯e`Ñ™}µ\è·5C°#%55µ<Z\Õ\Ý\Öò\î¿F\Ì f‚\"f¶InÚ¿šo\ê3Ó’%Kn{Ì”)S\ê\Û\Ú\åm·÷\îÝ‹oF\Éƒr®*ø\ínZ\Ùn³ºj\ç\î®%3\Ã\èË—/7¼dñ\â\Å¢U\Ý\íx\Ú\Í\ÖÀ€˜A\ÌDÂ€\îHNN\î2|øðû\â\ã\ã»\'$$üH¶½Å§~.>õ«\çž{\î7\ÖMô\ëiq„XH\Ú\ãeûG\ÙþIŽý³´Iû\ï\Ò^.\í•\ÒþW3\Ä\Ì\r9öš\ß}³  ÀØ°aƒü›\Û\îÝ»=ö˜\ÙV[·nñ\àƒ63z²Û«V­j\Ð\Æ73Mef\Zù\Îhw\ín±·\Ä‹¢f&FÑµ–t‰/Ùµk\×\éhUw‡{\Ú\r—©A\ÌøË¶n\Ýj<õ\ÔSwŠp\è*Ÿ\×weûC¹õ’ö\Ïd\ÛO>\Çþ\Ò¨«\à\êMK\ë²d;R\ìEym’l_›#\í²]\"¶L\ì]±\ÄÖ«\èu\ã+;\"vB¬T\ì¢\ØW*&Ä®[\íÏ­}\'\äo¶Þ³K\ÚyV%\ÓzZ|W\ÚK¥ýWýÛ²­\ç¢\ç$\í\ÑzŽ\ÒN”öš1ŸŠ{ö\Ùg\ï\Ók\àw\ßt;\ï¼ÓûLýÏ:u2¦OŸn¶Oœ8a\n}EcÍš5fûÈ‘#õ¿«¸¸\ØØ¿?b1\ÓÔ¹ölN·™|×®0š)F\ÑE#\Ë\Ê\Ê<3\å\å\å\ÑRªM\Ô%\Ü\Òý„˜ñ\Õ\Ö\ÖÚŸS­Ø—b\ÚMyF\ì±ƒb{Å¶[3{n\Ôá—š\íÐ¬‡Ø›š‘\í<±YšQa –¦Y\Ù\Ñ,ŠfS¤=@³+še‘›\Þ#šu‘ö÷E8}[³1²ýf;ûf¥\ëÆ«SŒJII\é$¡}\é\Ò%£¨¨È¸p\á‚iv\ÖE\ÛÇŽ3\î¿ÿþ°È™™¹÷\Þ{\ÍŽ¶7m\Údnõg\Äb¦‰ó-kB\È\Ü[e=\È0\ÏL,¢«_Û‹Fz…þ½hõ!\Æj]\ÝL1<N9R\ãòÝ¼\'¨] *>V¬XaTWW›\íµk×šm­…\éÒ¥K\Ø\ã{õ\êef`´½{÷\îú\×}ôQ|1\ÓdVF\î\Ù\ÃÅŽ4rO¯´K\nt`+»\Ú\î3\0\'%%\Ýd`6\Zø½Š1CÀˆ\Âwñ¨\Üt75\ÇL\Ä\Ì\ã?^ß…”ššj¶5+3hÐ ú\ã\n„„óûÿ²Å\ÝÖ®\'|1ã¨yD\ë\Ð\äü\Þ;+vAlõ³»[\é\î\ïk3\Å(#FŒ¸\éuf¦¦¦¦Ü‡™™}Zo¡ž^­Ð•\Æ\Ãý²…{>Áö\ï\ß\ß8p ™†\ï×¯Ÿ™\Ú\×À ??ðÀþ½\Ì\ÌÌ°©þÖœ£M²¤÷4ç¸ ˆ§ Q!£mõÍ®]»\Ö§#>ô\é8\ÎUô\ë|¯\Ö\Ì\è=\n1\ÓñÄŒv\í\Ê=\ír.\Å>´ºbµ–\í±T\ÙÿC\äôq\Ý\Ó7†{0ðb\Õl9ç›¬š\í1cÇŽ­óºf\æÂ…Ÿø¨f\æ­€g\rA\Í\ÊÊª¢¯½ýö\Ûõµ\å\å\å·¯©xÝž:uª>h`pµ’’’ú¶þ\î=z\Üòt\Ü\Úó!`xGP\Ä\ÌO<\Ñ 3Ó­[7cÂ„	·­™Q\ß\ÓJmŸ9s\Æ\Ü:t1\ãbFÜµv\Ñ*’\ßl\Õ\È},ö±¤#{¯\Þ\Ãugo¹\ï\é®ÿm›&Mš\ÔfÃ´UœOž<ù†3+\Ó\Ôy@2kÖ¬¯G3mÙ²\å¿>Í´[zcŽ\æuÀ°Å†>ö\é\Ó\çñ.#gø°Ÿ\\u«\ç~÷\Ï}ûö5¯|\æf\åŒ3\êÿŽû÷Gz>\ÄLS\Â\Æ\ÎÌ¸­²²²^¬¨øVÓ¶šý^\Í8\Æ9\æ¡A\ÌÄŽ˜Ñ™¯E¤üVþ\Ö\\¹XóÀ\ì•\×þ\"6H‹\ï#\ì‚ú§üž	\Íø\ßz:\î\Ó\Ó\Ó[-hT\ÈÌ›7\ÏY\'S”µc‚….÷zžqœ¬(\Î36­€¡‚\Ä\n\Ú\Ö\"I\Û\â\\E”öðT{t‡Ž\Ñ\íÒ¥KÍ¢\Ês\ç\Î\Ýò4\ì(v\í;3\ã\Ü×’ó!` fn\'f\ìIðÂ™\î‹sý:…\îÓ®Tyb7ÎŸ?˜	¸˜\Ñù™T¤X#÷Y\â%\ß3›³\Ð\êmºj;G |†\Ú\ÅÀv†¦¥]Nú>WF†\î%¯™9s\æÇŒóµ‡3\0_MHH8\á÷\ên¯†] 7s­S\Ñn¹¹¹õ¦\ÙÝªX\Ñc_ýuóx­˜·Sòj¡P\È4=¶w\ï\Þ\rJS™™mÛ¶µø|ˆ™\æø8\Å\éO\Ìh·õa\ÚM$v\È\ê6Ò¹½¦kw’v+EùLq\n\Z­¡Ñ¬³\Þ[›;jI‹}52V\áñ4\îTQ@\é§^­Í´eË–•A¨\îŽFÍŒ³\èQgLuÖª\Ø]FÚ¥¤\éLg7Ó“O>iŠ+š5Qa¦Æ¦9™™HÏ‡€˜a¤b\ÆF‚úO´0×šò¤˜\Î)ö¡výH€\ï\Û\Þs5µ\Í\ÐX\Ë NQ£ó\Ð\è\Äzšu±» ôÞ«3ûj=\×o¼aŒ1\âkW\r¦fšR¸KE‰‘#G\ÆOž<ùºÙ™*qö\"V\Í/fT¨èŒ¨\ÚÖ´ºS<¸‹tã¬‚H;3£sqh·“]lgZ\"\ÍÌ´ô|ˆ\ÄL\Ç3ß°f\àc\r\ÖI\ë\ÎZV¦\é\ê\0ý¯=C¶[h…\Ô\Èø€P(T¬ý\Ó\í‰\Ö\ç¥º;\ZbF§}·‡©\ê\Ô\î\Í3ú¡³«Ú¯\ß}÷\Ýa\×\Ëil4S¸Z„HÏ‡€˜A\ÌÄ¶˜IKKë¤“Ï‰Mµf\ÚþB‚÷1-º•v²<¨öˆÿy°%j®G\"b4Ã¨%)\Ó\Ô\ÔÔš\ãÇ·‹‘§ü\rªÜƒ¢\\£!ftŽ»íœº=\Î5\ÌÚ™9q\îÓŸ_z\é%ó5[Ü„3·˜i‹ó!` f3±\'ft\áTÙ¦‹\åÈ½û²NB§K\èZb\É\É\Éß‰\Õ\ï˜\Î¬]cº4Š53÷U\Ç\ì\Ü\ç,17…™}}JRRRb(ºRQQÑ¦BFžüwH`<¤\ên¯†’¹‡]k\í\ìÙ³ÍŸµ»§11£]D:«\ê\èÑ£\Í}v\ÆÆ¹¸Ÿ\ÓT˜¸„[{>\Äb&vˆÿ–¼wŠÍ—û÷\ïu‘W¾}$Ešš––V\ÝV\Z\ÍÈ¨	Zu·\ß†¢03¾\Ù^h·\ß64ZÝ””tiýúõ_µ¢(¸jÑ¢E\ïXEa)Œ€o\â›\0\à)\Ú˜\n…Ê‹ŠŠj\"™Gf\ëÖ­«E\íru7ƒ€obø&@ìˆšÁ*jRRR*\æÏŸxÇŽgJKK\Ë\ì\Å)u\ÑH]k)\'\'\ç?›O\ÆBu7ƒ€obø&@Œ\ÑÑª»	|\Ã7€€0ðM|\0€€0ðM|\0€€AÀÀ71|\0\ß\ÄðM\0 ``|\ß\0 `0ðM|\ß\0 `0ðM\ß\0FÀÀ71|\0\ß\Ä7\0|\Ã7\0|\Ã7€€0ðM|\0€€0ðM|\0€€AÀÀ71|\0Ü¨	ø&†o\0#`´5¹¹¹ø„\ìªø\æu¼\03b&¶o\ß^VQQ_øÀJKK?\ß<ŠW\0bC\ÌD@^^Þ üüü/?û\ì³\Z|#z2999g\Ä\ã•\0€˜Á3\"ôi¹&û´‹C¯\r\æ¹\éu?Š\0\Ä†˜\0\0@\Ì f\0\0\0 Œa\Ä\0\0@ a\Ä#F\0\0\0\r#F1\0\0x1Âˆ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€\Íÿhu\Ï\ëm\í2\0\0\0\0IEND®B`‚',1),('5',1,'èœå•å‘å¸ƒç”³è¯·.bpmn20.xml','4','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"WF-00001\" isExecutable=\"true\">\n    <startEvent id=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" name=\"è¯·å‡ç”³è¯·\"/>\n    <sequenceFlow id=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" sourceRef=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" targetRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"/>\n    <userTask id=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" name=\"å®¡æ‰¹\"/>\n    <sequenceFlow id=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" sourceRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" targetRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"/>\n    <endEvent id=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" sourceRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" targetRef=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_WF-00001\">\n    <bpmndi:BPMNPlane bpmnElement=\"WF-00001\" id=\"BPMNPlane_WF-00001\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" id=\"BPMNShape_sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"80.0\" y=\"43.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" id=\"BPMNShape_sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"150.0\" y=\"18.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" id=\"BPMNShape_sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"317.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" id=\"BPMNShape_sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"525.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" id=\"BPMNEdge_sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\">\n        <omgdi:waypoint x=\"417.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"68.0\"/>\n        <omgdi:waypoint x=\"525.0\" y=\"68.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" id=\"BPMNEdge_sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\">\n        <omgdi:waypoint x=\"110.0\" y=\"58.0\"/>\n        <omgdi:waypoint x=\"150.0\" y=\"58.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" id=\"BPMNEdge_sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\">\n        <omgdi:waypoint x=\"250.0\" y=\"56.20359281437126\"/>\n        <omgdi:waypoint x=\"317.0\" y=\"53.79640718562874\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('6',1,'èœå•å‘å¸ƒç”³è¯·.WF-00001.png','4','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\03\0\0\0l\0\0\0Ÿ3\É\0\0VIDATx\Ú\í	l\çÇ­64H$\"iPÛ”¦6¥	BUJ…\Ò*E¢‘hš*‰Šø\0\Ë oB¸\ÔB¡„’¦\r¨(\"D‰¡\Ô\åð¹\Ä‡+8\Ü;vˆ\Æ\Âô½ÑŒ5Œ\×\Æ\ëcvfýûIOóyg\ÖÏ¾÷Ÿ÷½\ïû\â\â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 †q\ÇÉ“\'\×\îÙ³\ç\ë\Ü\Ü\\#;;ó\ØrrrŒ\íÛ·.–„G\0\0Dˆ\n™\Â\ÂB£¢¢Â¨««Ã¢d•••FAAÁ%6ƒñJ\0\0€ÐŒB\Æ7‚¦.;;û(^	\0\0Úµ„ð‰˜¹ŽW\0\0D€\Öl \"|%f¼\0\0 \Ä\ÌW_–\'÷½cÎ™cš¶õ5b\0:Œa\ÄH\ÅLuU©qh\Ë,\ã`\Ö\Ô[L_\Ó}ˆ\Ä\0t\01Âˆ‘ ‹™s‡ÿ\Ý@\È\ØvþðF|1\0FŒ0b$\Èb\æ\è¶ŠÝ‡_!f\0 ÀˆFŒY\Ì\Ê\ÎhT\Ì\è>|\n1\0Œ€˜ÁðM\0ˆ\r1Ãˆ†}S}±11£ûð)|\0Œ!`ø\Ú7Kv¾Ù¨˜\Ñ}ø¾	\0FŒ0|\í›K‹C[\Ó\nmyM÷\áSø&\001BÀðµoªÚ¿¢_\êkø¾	\0Š,	þ3µµFÉ®·\Zv1\ÉkºŸ\Â7€€˜!`ø\Ö7µ^\ëøÎ¿5ê›ºš.|\0Œ!`ø\Ï7kk²’<\ã\ã\Í/7ê—¶\é1z,Y\Z|\0:¸˜a\Ä\Ã/¾y»lY\Z|\0Œ!`ø\Ú7›“i*Kƒ\á›\0\ÐA\Å#F~ñÍ–\n\Ûð1|\0:ª˜a\Ä\Ã\ÇB\Ã7€€Áˆb\Ã7 #Fˆ\ß€ FŒ03¾	\0Œ!` f0|3öILLüÁ!C\Æ:t­X‰Xµ˜!vU\ì”\ìË”\í=Ž«Œ!` f0|3v6l\Ø3b\Ùbu–xiŽm“ã“¸z@ÀÀø&¾	QCIO$›#0\á¬0>>þ!®&00¾‰o‚§2dhBB\ÂNa’˜˜h¼ú\ê«F^^žqö\ìY\ãò\åË†r\å\Ê£´´\ÔØ¹s§±xñb#99\Ù-hª\É\Ò\0#`\à›ø&x)džñq\Ã)bV®\\iTTTÍ¡ªª\Ê<^\ß\ç5ò;Gqu€0ðM|\Ú=#\ã2“&M2³0-A\ß7u\êT· !C\ã7\ä³\ê\\\\\\z\ï½÷\n\æÏŸiÜ¸q\×SRR\Ì,))\é\æ/¼P7cÆŒ“,X)öSFÀÀ7ñMð+Z#\ã\ìZJOO¯\ïJj)\Ú5o\Þ<w—\Ó\Ã\\mŸˆ˜u\ëÖ­˜;w\îõ	&Ë–-3ö\ì\Ùcö^½z\Õü\0u«)¹>ú\È±cŒ?þ\æÄ‰O§¥¥\"``|\ß¿!B&Ç™‘i­q\n\ZW†¦«eD´¤¾ò\Ê+µúÁ¨P¹q\ãF³?\ÐÓ¦M»\n…Žµº›€AÀÀ71|3ö\Ð\á\×\Î\Z™–v-5\Õ\åä¬¡¡»)zÙ˜;6lØ÷üó\Ï7nŒHÄ¸Ù¼y³‘ššZ\Ä,\rƒ€obøfLŠ™l[hhñn{°zõj²3\Ñ2ùùù{ÇŽk?~¼M>\ÔÓ§O\"ŒjF\Zõ\"#`\à›ø&D±\×.ú\Õ\ì\ÉÅ‹\ÛE\Ì\è(\'×°\íž\\}ÑŒŒ\n™\æKk.úû\Ò\Ò\Ò5þž€AÀÀ71|3¶°–(0\Æk¯½f´\':C\ÌL\á\ê{„\Ö\Èh\×R[ed\Âeh†^”\ên\ÃK\â\ã\ã¿\'7¼™²½\ß\Ä7¡}°\ÖZ2F~~~»ŠX\Ï!f6rõ½\é^\ê<gÎœ:­‘iO²²²jw#f0Fƒ›lO½\éÉ“c•\Ø4ý\ÝðM|\Úü{VbŒ¶.üu££~b\æW\ß233\ß\×QK×®]3Ú›Ñ£G—¡»‰€AÀð83s—kZt]w¡›>ø&¾	m&f\ìÕ¯\Ûl8vSÃ´\ßg®¾YGF‡_{ÁÁƒë‚!`0¢p£\r»€ˆÿ\ÕNQƒoú\ËZ¹8¡¯-(\ßk6ß‡#ùŽyA¯e`Ñ™}µ\è·5C°#%55µ<Z\Õ\Ý\Öò\î¿F\Ì f‚\"f¶InÚ¿šo\ê3Ó’%Kn{Ì”)S\ê\Û\Ú\åm·÷\îÝ‹oF\Éƒr®*ø\ínZ\Ùn³ºj\ç\î®%3\Ã\èË—/7¼dñ\â\Å¢U\Ý\íx\Ú\Í\ÖÀ€˜A\ÌDÂ€\îHNN\î2|øðû\â\ã\ã»\'$$üH¶½Å§~.>õ«\çž{\î7\ÖMô\ëiq„XH\Ú\ãeûG\ÙþIŽý³´Iû\ï\Ò^.\í•\ÒþW3\Ä\Ì\r9öš\ß}³  ÀØ°aƒü›\Û\îÝ»=ö˜\ÙV[·nñ\àƒ63z²Û«V­j\Ð\Æ73Mef\Zù\Îhw\ín±·\Ä‹¢f&FÑµ–t‰/Ùµk\×\éhUw‡{\Ú\r—©A\ÌøË¶n\Ýj<õ\ÔSwŠp\è*Ÿ\×weûC¹õ’ö\Ïd\ÛO>\Çþ\Ò¨«\à\êMK\ë²d;R\ìEym’l_›#\í²]\"¶L\ì]±\ÄÖ«\èu\ã+;\"vB¬T\ì¢\ØW*&Ä®[\íÏ­}\'\äo¶Þ³K\ÚyV%\ÓzZ|W\ÚK¥ýWýÛ²­\ç¢\ç$\í\ÑzŽ\ÒN”öš1ŸŠ{ö\Ùg\ï\Ók\àw\ßt;\ï¼ÓûLýÏ:u2¦OŸn¶Oœ8a\n}EcÍš5fûÈ‘#õ¿«¸¸\ØØ¿?b1\ÓÔ¹ölN·™|×®0š)F\ÑE#\Ë\Ê\Ê<3\å\å\å\ÑRªM\Ô%\Ü\Òý„˜ñ\Õ\Ö\ÖÚŸS­Ø—b\ÚMyF\ì±ƒb{Å¶[3{n\Ôá—š\íÐ¬‡Ø›š‘\í<±YšQa –¦Y\Ù\Ñ,ŠfS¤=@³+še‘›\Þ#šu‘ö÷E8}[³1²ýf;ûf¥\ëÆ«SŒJII\é$¡}\é\Ò%£¨¨È¸p\á‚iv\ÖE\ÛÇŽ3\î¿ÿþ°È™™¹÷\Þ{\ÍŽ¶7m\Údnõg\Äb¦‰ó-kB\È\Ü[e=\È0\ÏL,¢«_Û‹Fz…þ½hõ!\Æj]\ÝL1<N9R\ãòÝ¼\'¨] *>V¬XaTWW›\íµk×šm­…\éÒ¥K\Ø\ã{õ\êef`´½{÷\îú\×}ôQ|1\ÓdVF\î\Ù\ÃÅŽ4rO¯´K\nt`+»\Ú\î3\0\'%%\Ýd`6\Zø½Š1CÀˆ\Âwñ¨\Üt75\ÇL\Ä\Ì\ã?^ß…”ššj¶5+3hÐ ú\ã\n„„óûÿ²Å\ÝÖ®\'|1ã¨yD\ë\Ð\äü\Þ;+vAlõ³»[\é\î\ïk3\Å(#FŒ¸\éuf¦¦¦¦Ü‡™™}Zo¡ž^­Ð•\Æ\Ãý²…{>Áö\ï\ß\ß8p ™†\ï×¯Ÿ™\Ú\×À ??ðÀþ½\Ì\ÌÌ°©þÖœ£M²¤÷4ç¸ ˆ§ Q!£mõÍ®]»\Ö§#>ô\é8\ÎUô\ë|¯\Ö\Ì\è=\n1\ÓñÄŒv\í\Ê=\ír.\Å>´ºbµ–\í±T\ÙÿC\äôq\Ý\Ó7†{0ðb\Õl9ç›¬š\í1cÇŽ­óºf\æÂ…Ÿø¨f\æ­€g\rA\Í\ÊÊª¢¯½ýö\Ûõµ\å\å\å·¯©xÝž:uª>h`pµ’’’ú¶þ\î=z\Üòt\Ü\Úó!`xGP\Ä\ÌO<\Ñ 3Ó­[7cÂ„	·­™Q\ß\ÓJmŸ9s\Æ\Ü:t1\ãbFÜµv\Ñ*’\ßl\Õ\È},ö±¤#{¯\Þ\Ãugo¹\ï\é®ÿm›&Mš\ÔfÃ´UœOž<ù†3+\Ó\Ôy@2kÖ¬¯G3mÙ²\å¿>Í´[zcŽ\æuÀ°Å†>ö\é\Ó\çñ.#gø°Ÿ\\u«\ç~÷\Ï}ûö5¯|\æf\åŒ3\êÿŽû÷Gz>\ÄLS\Â\Æ\ÎÌ¸­²²²^¬¨øVÓ¶šý^\Í8\Æ9\æ¡A\ÌÄŽ˜Ñ™¯E¤üVþ\Ö\\¹XóÀ\ì•\×þ\"6H‹\ï#\ì‚ú§üž	\Íø\ßz:\î\Ó\Ó\Ó[-hT\ÈÌ›7\ÏY\'S”µc‚….÷zžqœ¬(\Î36­€¡‚\Ä\n\Ú\Ö\"I\Û\â\\E”öðT{t‡Ž\Ñ\íÒ¥KÍ¢\Ês\ç\Î\Ýò4\ì(v\í;3\ã\Ü×’ó!` fn\'f\ìIðÂ™\î‹sý:…\îÓ®Tyb7ÎŸ?˜	¸˜\Ñù™T¤X#÷Y\â%\ß3›³\Ð\êmºj;G |†\Ú\ÅÀv†¦¥]Nú>WF†\î%¯™9s\æÇŒóµ‡3\0_MHH8\á÷\ên¯†] 7s­S\Ñn¹¹¹õ¦\ÙÝªX\Ñc_ýuóx­˜·Sòj¡P\È4=¶w\ï\Þ\rJS™™mÛ¶µø|ˆ™\æø8\Å\éO\Ìh·õa\ÚM$v\È\ê6Ò¹½¦kw’v+EùLq\n\Z­¡Ñ¬³\Þ[›;jI‹}52V\áñ4\îTQ@\é§^­Í´eË–•A¨\îŽFÍŒ³\èQgLuÖª\Ø]FÚ¥¤\éLg7Ó“O>iŠ+š5Qa¦Æ¦9™™HÏ‡€˜a¤b\ÆF‚úO´0×šò¤˜\Î)ö¡výH€\ï\Û\Þs5µ\Í\ÐX\Ë NQ£ó\Ð\è\Äzšu±» ôÞ«3ûj=\×o¼aŒ1\âkW\r¦fšR¸KE‰‘#G\ÆOž<ùºÙ™*qö\"V\Í/fT¨èŒ¨\ÚÖ´ºS<¸‹tã¬‚H;3£sqh·“]lgZ\"\ÍÌ´ô|ˆ\ÄL\Ç3ß°f\àc\r\ÖI\ë\ÎZV¦\é\ê\0ý¯=C¶[h…\Ô\Èø€P(T¬ý\Ó\í‰\Ö\ç¥º;\ZbF§}·‡©\ê\Ô\î\Í3ú¡³«Ú¯\ß}÷\Ýa\×\Ëil4S¸Z„HÏ‡€˜A\ÌÄ¶˜IKKë¤“Ï‰Mµf\ÚþB‚÷1-º•v²<¨öˆÿy°%j®G\"b4Ã¨%)\Ó\Ô\ÔÔš\ãÇ·‹‘§ü\rªÜƒ¢\\£!ftŽ»íœº=\Î5\ÌÚ™9q\îÓŸ_z\é%ó5[Ü„3·˜i‹ó!` f3±\'ft\áTÙ¦‹\åÈ½û²NB§K\èZb\É\É\Éß‰\Õ\ï˜\Î¬]cº4Š53÷U\Ç\ì\Ü\ç,17…™}}JRRRb(ºRQQÑ¦BFžüwH`<¤\ên¯†’¹‡]k\í\ìÙ³ÍŸµ»§11£]D:«\ê\èÑ£\Í}v\ÆÆ¹¸Ÿ\ÓT˜¸„[{>\Äb&vˆÿ–¼wŠÍ—û÷\ïu‘W¾}$Ešš––V\ÝV\Z\ÍÈ¨	Zu·\ß†¢03¾\Ù^h·\ß64ZÝ””tiýúõ_µ¢(¸jÑ¢E\ïXEa)Œ€o\â›\0\à)\Ú˜\n…Ê‹ŠŠj\"™Gf\ëÖ­«E\íru7ƒ€obø&@ìˆšÁ*jRRR*\æÏŸxÇŽgJKK\Ë\ì\Å)u\ÑH]k)\'\'\ç?›O\ÆBu7ƒ€obø&@Œ\ÑÑª»	|\Ã7€€0ðM|\0€€0ðM|\0€€AÀÀ71|\0\ß\ÄðM\0 ``|\ß\0 `0ðM|\ß\0 `0ðM\ß\0FÀÀ71|\0\ß\Ä7\0|\Ã7\0|\Ã7€€0ðM|\0€€0ðM|\0€€AÀÀ71|\0Ü¨	ø&†o\0#`´5¹¹¹ø„\ìªø\æu¼\03b&¶o\ß^VQQ_øÀJKK?\ß<ŠW\0bC\ÌD@^^Þ üüü/?û\ì³\Z|#z2999g\Ä\ã•\0€˜Á3\"ôi¹&û´‹C¯\r\æ¹\éu?Š\0\Ä†˜\0\0@\Ì f\0\0\0 Œa\Ä\0\0@ a\Ä#F\0\0\0\r#F1\0\0x1Âˆ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€\Íÿhu\Ï\ëm\í2\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_ge_property` VALUES ('next.dbid','22501',10),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10002','WF-00001:1:7','10001','10001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:32:10.665','2018-06-09 23:32:10.692',27,''),('10003','WF-00001:1:7','10001','10001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10004',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:32:10.694',NULL,NULL,''),('10006','WF-00001:1:7','10005','10005','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:32:52.369','2018-06-09 23:32:52.369',0,''),('10007','WF-00001:1:7','10005','10005','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10008',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:32:52.369',NULL,NULL,''),('12503','WF-00001:1:7','12502','12502','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:34:01.400','2018-06-09 23:34:01.704',304,''),('12504','WF-00001:1:7','12501','12501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:34:01.400','2018-06-09 23:34:01.708',308,''),('12505','WF-00001:1:7','12502','12502','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12506',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:34:01.707',NULL,NULL,''),('12507','WF-00001:1:7','12501','12501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12508',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:34:01.711',NULL,NULL,''),('12510','WF-00001:1:7','12509','12509','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:35:29.994','2018-06-09 23:35:29.997',3,''),('12511','WF-00001:1:7','12509','12509','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12512',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:35:29.998',NULL,NULL,''),('15002','WF-00001:1:7','15001','15001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:37:28.899','2018-06-09 23:37:29.155',256,''),('15003','WF-00001:1:7','15001','15001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','15004',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:37:29.160',NULL,NULL,''),('17502','WF-00001:1:7','17501','17501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:38:32.816','2018-06-09 23:38:32.837',21,''),('17503','WF-00001:1:7','17501','17501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17504',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:38:32.838',NULL,NULL,''),('17506','WF-00001:1:7','17505','17505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:39:14.755','2018-06-09 23:39:14.772',17,''),('17507','WF-00001:1:7','17505','17505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17508',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:39:14.776',NULL,NULL,''),('17510','WF-00001:1:7','17509','17509','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:39:44.170','2018-06-09 23:39:44.172',2,''),('17511','WF-00001:1:7','17509','17509','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17512',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:39:44.173',NULL,NULL,''),('20009','WF-00001:1:7','20008','20008','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-11 22:54:55.232','2018-06-11 22:54:55.259',27,''),('20010','WF-00001:1:7','20008','20008','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20011',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-11 22:54:55.260',NULL,NULL,''),('20013','WF-00001:1:7','20012','20012','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-11 22:54:59.318','2018-06-11 22:54:59.321',3,''),('20014','WF-00001:1:7','20012','20012','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20015',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-11 22:54:59.322',NULL,NULL,''),('20017','WF-00001:1:7','20016','20016','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-11 22:55:01.448','2018-06-11 22:55:01.455',7,''),('20018','WF-00001:1:7','20016','20016','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20019',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-11 22:55:01.456',NULL,NULL,''),('2502','WF-00001:1:7','2501','2501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:04:24.760','2018-06-09 23:04:24.769',9,''),('2503','WF-00001:1:7','2501','2501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2504',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:04:24.769',NULL,NULL,''),('2506','WF-00001:1:7','2505','2505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:06:25.753','2018-06-09 23:06:25.762',9,''),('2507','WF-00001:1:7','2505','2505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2508',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:06:25.763',NULL,NULL,''),('5002','WF-00001:1:7','5001','5001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:26:52.279','2018-06-09 23:26:52.303',24,''),('5003','WF-00001:1:7','5001','5001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','5004',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:26:52.304',NULL,NULL,''),('7502','WF-00001:1:7','7501','7501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:29:13.575','2018-06-09 23:29:13.687',112,''),('7503','WF-00001:1:7','7501','7501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7504',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:29:13.690',NULL,NULL,''),('7506','WF-00001:1:7','7505','7505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2018-06-09 23:30:48.589','2018-06-09 23:30:48.595',6,''),('7507','WF-00001:1:7','7505','7505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7508',NULL,'è¯·å‡ç”³è¯·','userTask',NULL,'2018-06-09 23:30:48.596',NULL,NULL,'');
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
INSERT INTO `act_hi_procinst` VALUES ('10001','10001',NULL,'WF-00001:1:7','2018-06-09 23:32:10.665',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('10005','10005',NULL,'WF-00001:1:7','2018-06-09 23:32:52.369',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('12501','12501',NULL,'WF-00001:1:7','2018-06-09 23:34:01.399',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('12502','12502',NULL,'WF-00001:1:7','2018-06-09 23:34:01.400',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('12509','12509',NULL,'WF-00001:1:7','2018-06-09 23:35:29.994',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('15001','15001',NULL,'WF-00001:1:7','2018-06-09 23:37:28.898',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('17501','17501',NULL,'WF-00001:1:7','2018-06-09 23:38:32.815',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('17505','17505',NULL,'WF-00001:1:7','2018-06-09 23:39:14.754',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('17509','17509',NULL,'WF-00001:1:7','2018-06-09 23:39:44.170',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('20008','20008',NULL,'WF-00001:1:7','2018-06-11 22:54:55.232',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('20012','20012',NULL,'WF-00001:1:7','2018-06-11 22:54:59.318',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('20016','20016',NULL,'WF-00001:1:7','2018-06-11 22:55:01.448',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('2501','2501',NULL,'WF-00001:1:7','2018-06-09 23:04:24.760',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('2505','2505',NULL,'WF-00001:1:7','2018-06-09 23:06:25.753',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('5001','5001',NULL,'WF-00001:1:7','2018-06-09 23:26:52.279',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('7501','7501',NULL,'WF-00001:1:7','2018-06-09 23:29:13.574',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL),('7505','7505',NULL,'WF-00001:1:7','2018-06-09 23:30:48.589',NULL,NULL,NULL,'sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('10004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10001','10001','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:32:10.702',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('10008','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10005','10005','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:32:52.369',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12506','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12502','12502','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:34:01.719',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12501','12501','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:34:01.719',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12512','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12509','12509','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:35:30.003',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('15004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','15001','15001','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:37:29.180',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17501','17501','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:38:32.939',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17505','17505','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:39:14.789',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17512','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17509','17509','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:39:44.175',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('20011','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20008','20008','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-11 22:54:55.267',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('20015','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20012','20012','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-11 22:54:59.325',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('20019','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20016','20016','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-11 22:55:01.463',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('2504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2501','2501','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:04:24.808',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('2508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2505','2505','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:06:25.770',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('5004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','5001','5001','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:26:52.310',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7501','7501','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:29:13.718',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7505','7505','è¯·å‡ç”³è¯·',NULL,NULL,NULL,NULL,'2018-06-09 23:30:48.603',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_re_deployment` VALUES ('20004','æµ‹è¯•æ¨¡åž‹2',NULL,'','2018-06-11 14:53:23.334'),('20020','èœå•å‘å¸ƒç”³è¯·',NULL,'','2018-06-11 14:56:12.772'),('4','èœå•å‘å¸ƒç”³è¯·',NULL,'','2018-06-09 14:47:54.024');
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
INSERT INTO `act_re_procdef` VALUES ('WF-00001:1:7',1,'http://www.activiti.org/processdef','æµ‹è¯•1','WF-00001',1,'4','èœå•å‘å¸ƒç”³è¯·.bpmn20.xml','èœå•å‘å¸ƒç”³è¯·.WF-00001.png',NULL,0,1,1,''),('WF-00001:2:20023',1,'http://www.activiti.org/processdef',NULL,'WF-00001',2,'20020','èœå•å‘å¸ƒç”³è¯·.bpmn20.xml','èœå•å‘å¸ƒç”³è¯·.WF-00001.png',NULL,0,1,1,''),('æµ‹è¯•æ¨¡åž‹2:1:20007',1,'http://www.activiti.org/processdef','æµ‹è¯•æ¨¡åž‹2','æµ‹è¯•æ¨¡åž‹2',1,'20004','æµ‹è¯•æ¨¡åž‹2.bpmn20.xml','æµ‹è¯•æ¨¡åž‹2.æµ‹è¯•æ¨¡åž‹2.png',NULL,0,1,1,'');
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
INSERT INTO `act_ru_execution` VALUES ('10001',1,'10001',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('10005',1,'10005',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('12501',1,'12501',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('12502',1,'12502',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('12509',1,'12509',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('15001',1,'15001',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('17501',1,'17501',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('17505',1,'17505',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('17509',1,'17509',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('20008',1,'20008',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('20012',1,'20012',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('20016',1,'20016',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('2501',1,'2501',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('2505',1,'2505',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('5001',1,'5001',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('7501',1,'7501',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL),('7505',1,'7505',NULL,NULL,'WF-00001:1:7',NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',1,0,1,0,1,2,'',NULL,NULL);
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
INSERT INTO `act_ru_task` VALUES ('10004',1,'10001','10001','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:32:10.694',NULL,NULL,1,'',NULL),('10008',1,'10005','10005','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:32:52.369',NULL,NULL,1,'',NULL),('12506',1,'12502','12502','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:34:01.709',NULL,NULL,1,'',NULL),('12508',1,'12501','12501','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:34:01.712',NULL,NULL,1,'',NULL),('12512',1,'12509','12509','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:35:29.999',NULL,NULL,1,'',NULL),('15004',1,'15001','15001','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:37:29.162',NULL,NULL,1,'',NULL),('17504',1,'17501','17501','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:38:32.838',NULL,NULL,1,'',NULL),('17508',1,'17505','17505','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:39:14.777',NULL,NULL,1,'',NULL),('17512',1,'17509','17509','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:39:44.173',NULL,NULL,1,'',NULL),('20011',1,'20008','20008','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-11 14:54:55.260',NULL,NULL,1,'',NULL),('20015',1,'20012','20012','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-11 14:54:59.322',NULL,NULL,1,'',NULL),('20019',1,'20016','20016','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-11 14:55:01.456',NULL,NULL,1,'',NULL),('2504',1,'2501','2501','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:04:24.769',NULL,NULL,1,'',NULL),('2508',1,'2505','2505','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:06:25.763',NULL,NULL,1,'',NULL),('5004',1,'5001','5001','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:26:52.304',NULL,NULL,1,'',NULL),('7504',1,'7501','7501','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:29:13.691',NULL,NULL,1,'',NULL),('7508',1,'7505','7505','WF-00001:1:7','è¯·å‡ç”³è¯·',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:30:48.597',NULL,NULL,1,'',NULL);
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
-- Table structure for table `sys_announcement_changed`
--

DROP TABLE IF EXISTS `sys_announcement_changed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_announcement_changed` (
  `WORKSHEET_NO` varchar(255) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CREATE_ADMIN_ID` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WORKSHEET_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_announcement_changed`
--

LOCK TABLES `sys_announcement_changed` WRITE;
/*!40000 ALTER TABLE `sys_announcement_changed` DISABLE KEYS */;
INSERT INTO `sys_announcement_changed` VALUES ('1',NULL,NULL,'2018-06-09 23:06:54',1,'2018-06-09 23:06:54',NULL,NULL),('10','æµ‹è¯•å†…å®¹',NULL,'2018-06-09 23:39:15',9,'2018-06-09 23:39:15',NULL,'201806091126'),('11','æµ‹è¯•å†…å®¹',NULL,'2018-06-09 23:39:44',10,'2018-06-09 23:39:44',NULL,'201806091126'),('12','2',NULL,'2018-06-11 22:54:56',11,'2018-06-11 22:54:56',NULL,'æµ‹è¯•1'),('13','2',NULL,'2018-06-11 22:55:00',12,'2018-06-11 22:55:00',NULL,'æµ‹è¯•1'),('14','2',NULL,'2018-06-11 22:55:02',13,'2018-06-11 22:55:02',NULL,'æµ‹è¯•1'),('3','æµ‹è¯•å†…å®¹',NULL,'2018-06-09 23:29:22',2,'2018-06-09 23:29:22',NULL,'201806091126'),('4','æµ‹è¯•å†…å®¹',NULL,'2018-06-09 23:30:55',3,'2018-06-09 23:30:55',NULL,'201806091126'),('5','æµ‹è¯•å†…å®¹',NULL,'2018-06-09 23:32:53',4,'2018-06-09 23:32:53',NULL,'201806091126'),('6','æµ‹è¯•å†…å®¹',NULL,'2018-06-09 23:34:02',5,'2018-06-09 23:34:02',NULL,'201806091126'),('7','æµ‹è¯•å†…å®¹',NULL,'2018-06-09 23:35:30',6,'2018-06-09 23:35:30',NULL,'201806091126'),('8','æµ‹è¯•å†…å®¹',NULL,'2018-06-09 23:37:31',7,'2018-06-09 23:37:31',NULL,'201806091126'),('9','æµ‹è¯•å†…å®¹',NULL,'2018-06-09 23:38:34',8,'2018-06-09 23:38:34',NULL,'201806091126');
/*!40000 ALTER TABLE `sys_announcement_changed` ENABLE KEYS */;
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
INSERT INTO `sys_code` VALUES (1,'YesOrNo','1','æ˜¯','2018-06-07 19:24:52',1,'2018-06-07 19:24:52',NULL,'','',''),(2,'YesOrNo','0','å¦','2018-06-07 19:24:52',2,'2018-06-07 19:24:52',NULL,'','','');
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
INSERT INTO `sys_extend_property` VALUES (1,'YesOrNo','2018-06-07 19:24:18','2018-06-07 19:24:58','æ˜¯å¦','SELECT CODE KEY,CODE_NAME VALUE,\'\' FILETER FROM SYS_CODE ORDER BY DISPLAY_SN');
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
INSERT INTO `sys_menu` VALUES (1,'2018-06-07 19:09:29',1,'/template/sys/code/code','2018-06-07 19:21:48','æ˜ å°„',0,3,''),(4,'2018-06-09 22:45:08',1,'','2018-06-09 22:45:08','å·¥ä½œæµç®¡ç†',0,NULL,NULL),(6,'2018-04-05 20:09:35',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/process-list','2018-05-30 17:29:31','å·¥ä½œæµç®¡ç†',4,3,'true'),(7,'2018-04-05 20:09:44',2,'',NULL,'èŠ‚ç‚¹ç®¡ç†',4,2,NULL),(8,'2018-04-27 15:33:08',2,'/template/sys/assistant/generateEntity',NULL,'å®žä½“æ˜ å°„ï¼ˆæ•°æ®åº“ï¼‰',1,1,NULL),(9,'2018-04-09 23:19:03',2,'/template/sys/menu/menu',NULL,'èœå•ç®¡ç†',15,1,NULL),(11,'2018-04-09 23:47:46',2,'/template/sys/role/role',NULL,'è§’è‰²ç®¡ç†',15,2,NULL),(12,'2018-04-09 23:48:22',2,'',NULL,'æƒé™ç®¡ç†',15,3,NULL),(13,'2018-04-09 23:50:10',2,'/template/sys/admin/admin','2018-05-22 14:30:15','æ“ä½œå‘˜ç®¡ç†',15,4,NULL),(14,'2018-04-09 23:50:19',2,'',NULL,'ç»„ç»‡ç®¡ç†',15,5,NULL),(15,'2018-04-23 17:34:11',1,'','2018-06-07 19:21:57','ç³»ç»Ÿç»´æŠ¤',0,1,''),(16,'2018-04-23 17:36:34',2,'/template/sys/config/entityFilterParamConfig',NULL,'å®žä½“è¿‡æ»¤å­—',1,5,NULL),(17,'2018-04-27 15:43:48',2,'/template/sys/assistant/generateEntityOom',NULL,'å®žä½“æ˜ å°„ï¼ˆoomï¼‰',1,0,NULL),(395,'2018-05-30 18:14:11',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/model-list','2018-05-30 18:14:35','æ¨¡åž‹åˆ—è¡¨',4,4,'true'),(396,'2018-05-31 18:24:45',1,'','2018-06-07 19:21:51','ä¸ªäººè®¾ç½®',0,4,''),(397,'2018-05-31 18:24:55',2,'','2018-05-31 18:25:14','å¯†ç ä¿®æ”¹',396,2,''),(398,'2018-05-31 18:25:06',2,'','2018-05-31 18:25:06','åŸºæœ¬ä¿¡æ¯',396,1,NULL),(401,'2018-06-06 17:25:24',1,'','2018-06-06 17:25:24','å·¥ä½œæµæµ‹è¯•',0,NULL,NULL),(402,'2018-06-06 17:26:00',2,'/template/sys/workflow/announcement/apply','2018-06-06 18:01:15','å…¬å‘Šç”³è¯·æµç¨‹',401,1,''),(406,'2018-06-07 19:20:54',2,'/template/sys/code/code','2018-06-07 19:20:54','ä»£ç ç®¡ç†',15,1,NULL),(407,'2018-06-07 19:22:52',2,'/template/sys/extendproperty/extendproperty','2018-06-07 19:22:52','æ‰©å±•å±žæ€§',15,6,NULL),(409,'2018-06-12 22:49:20',2,'/template/sys/worksheet/query','2018-06-12 22:49:20','å·¥ä½œå•æŸ¥è¯¢',4,NULL,NULL);
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
INSERT INTO `sys_menu_visit_log` VALUES (1,'2018-06-07 13:59:29',402,'2018-06-07 13:59:29','2018-06-07 13:59:28'),(2,'2018-06-07 17:39:01',402,'2018-06-07 17:39:01','2018-06-07 17:39:01'),(3,'2018-06-07 17:39:03',11,'2018-06-07 17:39:03','2018-06-07 17:39:03'),(4,'2018-06-07 17:39:03',9,'2018-06-07 17:39:03','2018-06-07 17:39:03'),(5,'2018-06-07 17:39:07',11,'2018-06-07 17:39:07','2018-06-07 17:39:07'),(6,'2018-06-07 18:00:55',9,'2018-06-07 18:00:55','2018-06-07 18:00:54'),(7,'2018-06-07 18:00:59',9,'2018-06-07 18:00:59','2018-06-07 18:00:59'),(8,'2018-06-07 18:01:01',9,'2018-06-07 18:01:01','2018-06-07 18:01:01'),(9,'2018-06-07 18:01:04',9,'2018-06-07 18:01:04','2018-06-07 18:01:04'),(10,'2018-06-07 18:01:07',9,'2018-06-07 18:01:07','2018-06-07 18:01:07'),(11,'2018-06-07 18:01:09',9,'2018-06-07 18:01:09','2018-06-07 18:01:09'),(12,'2018-06-07 18:01:11',11,'2018-06-07 18:01:11','2018-06-07 18:01:11'),(13,'2018-06-07 18:01:13',11,'2018-06-07 18:01:13','2018-06-07 18:01:13'),(14,'2018-06-07 18:01:14',13,'2018-06-07 18:01:14','2018-06-07 18:01:14'),(15,'2018-06-07 18:01:18',11,'2018-06-07 18:01:18','2018-06-07 18:01:18'),(16,'2018-06-07 18:01:24',13,'2018-06-07 18:01:24','2018-06-07 18:01:24'),(17,'2018-06-07 18:01:27',17,'2018-06-07 18:01:27','2018-06-07 18:01:27'),(18,'2018-06-07 18:01:33',9,'2018-06-07 18:01:33','2018-06-07 18:01:33'),(19,'2018-06-07 18:01:34',11,'2018-06-07 18:01:34','2018-06-07 18:01:34'),(20,'2018-06-07 18:01:37',13,'2018-06-07 18:01:37','2018-06-07 18:01:37'),(21,'2018-06-07 18:01:40',17,'2018-06-07 18:01:40','2018-06-07 18:01:40'),(22,'2018-06-07 18:01:42',8,'2018-06-07 18:01:42','2018-06-07 18:01:42'),(23,'2018-06-07 18:01:44',16,'2018-06-07 18:01:44','2018-06-07 18:01:44'),(24,'2018-06-07 18:01:51',5,'2018-06-07 18:01:51','2018-06-07 18:01:51'),(25,'2018-06-07 18:01:54',6,'2018-06-07 18:01:54','2018-06-07 18:01:54'),(26,'2018-06-07 18:01:55',395,'2018-06-07 18:01:55','2018-06-07 18:01:55'),(27,'2018-06-07 18:01:59',6,'2018-06-07 18:01:59','2018-06-07 18:01:59'),(28,'2018-06-07 18:02:09',402,'2018-06-07 18:02:09','2018-06-07 18:02:09'),(29,'2018-06-07 18:02:28',402,'2018-06-07 18:02:28','2018-06-07 18:02:27'),(30,'2018-06-07 18:03:16',9,'2018-06-07 18:03:16','2018-06-07 18:03:16'),(31,'2018-06-07 18:03:21',13,'2018-06-07 18:03:21','2018-06-07 18:03:21'),(32,'2018-06-07 18:03:37',13,'2018-06-07 18:03:37','2018-06-07 18:03:37'),(33,'2018-06-07 18:03:40',11,'2018-06-07 18:03:40','2018-06-07 18:03:40'),(34,'2018-06-07 18:04:12',402,'2018-06-07 18:04:12','2018-06-07 18:04:11'),(35,'2018-06-07 18:04:21',9,'2018-06-07 18:04:21','2018-06-07 18:04:21'),(36,'2018-06-07 18:04:35',17,'2018-06-07 18:04:35','2018-06-07 18:04:35'),(37,'2018-06-07 18:05:23',17,'2018-06-07 18:05:23','2018-06-07 18:05:23'),(38,'2018-06-07 18:13:39',5,'2018-06-07 18:13:39','2018-06-07 18:13:39'),(39,'2018-06-07 18:13:41',6,'2018-06-07 18:13:41','2018-06-07 18:13:41'),(40,'2018-06-07 18:13:42',395,'2018-06-07 18:13:42','2018-06-07 18:13:42'),(41,'2018-06-07 19:03:35',5,'2018-06-07 19:03:35','2018-06-07 19:03:35'),(42,'2018-06-07 19:03:37',6,'2018-06-07 19:03:37','2018-06-07 19:03:37'),(43,'2018-06-07 19:08:48',9,'2018-06-07 19:08:48','2018-06-07 19:08:48'),(44,'2018-06-07 19:12:40',9,'2018-06-07 19:12:40','2018-06-07 19:12:40'),(45,'2018-06-07 19:17:56',9,'2018-06-07 19:17:56','2018-06-07 19:17:56'),(46,'2018-06-07 19:20:05',9,'2018-06-07 19:20:05','2018-06-07 19:20:05'),(47,'2018-06-07 19:20:18',1,'2018-06-07 19:20:18','2018-06-07 19:20:18'),(48,'2018-06-07 19:20:24',1,'2018-06-07 19:20:24','2018-06-07 19:20:24'),(49,'2018-06-07 19:20:26',1,'2018-06-07 19:20:26','2018-06-07 19:20:26'),(50,'2018-06-07 19:20:28',9,'2018-06-07 19:20:28','2018-06-07 19:20:28'),(51,'2018-06-07 19:21:26',1,'2018-06-07 19:21:26','2018-06-07 19:21:26'),(52,'2018-06-07 19:21:28',1,'2018-06-07 19:21:28','2018-06-07 19:21:28'),(53,'2018-06-07 19:21:37',1,'2018-06-07 19:21:37','2018-06-07 19:21:37'),(54,'2018-06-07 19:21:39',9,'2018-06-07 19:21:39','2018-06-07 19:21:39'),(55,'2018-06-07 19:22:05',9,'2018-06-07 19:22:05','2018-06-07 19:22:05'),(56,'2018-06-07 19:22:59',406,'2018-06-07 19:22:59','2018-06-07 19:22:59'),(57,'2018-06-07 19:23:02',407,'2018-06-07 19:23:02','2018-06-07 19:23:02'),(58,'2018-06-07 19:25:06',407,'2018-06-07 19:25:06','2018-06-07 19:25:06'),(59,'2018-06-07 19:25:10',406,'2018-06-07 19:25:10','2018-06-07 19:25:10'),(60,'2018-06-07 22:45:33',406,'2018-06-07 22:45:33','2018-06-07 22:45:32'),(61,'2018-06-07 22:45:34',9,'2018-06-07 22:45:34','2018-06-07 22:45:34'),(62,'2018-06-07 22:45:36',406,'2018-06-07 22:45:36','2018-06-07 22:45:36'),(63,'2018-06-07 22:45:37',11,'2018-06-07 22:45:37','2018-06-07 22:45:37'),(64,'2018-06-07 22:52:00',11,'2018-06-07 22:52:00','2018-06-07 22:52:00'),(65,'2018-06-07 22:52:03',11,'2018-06-07 22:52:03','2018-06-07 22:52:03'),(66,'2018-06-07 22:53:51',11,'2018-06-07 22:53:51','2018-06-07 22:53:51'),(67,'2018-06-07 22:53:54',11,'2018-06-07 22:53:54','2018-06-07 22:53:54'),(68,'2018-06-07 22:53:58',11,'2018-06-07 22:53:58','2018-06-07 22:53:58'),(69,'2018-06-07 22:55:26',11,'2018-06-07 22:55:26','2018-06-07 22:55:26'),(70,'2018-06-07 22:56:53',9,'2018-06-07 22:56:53','2018-06-07 22:56:53'),(71,'2018-06-07 23:03:10',9,'2018-06-07 23:03:10','2018-06-07 23:03:10'),(72,'2018-06-07 23:03:11',9,'2018-06-07 23:03:11','2018-06-07 23:03:11'),(73,'2018-06-07 23:03:12',9,'2018-06-07 23:03:12','2018-06-07 23:03:12'),(74,'2018-06-07 23:03:14',9,'2018-06-07 23:03:14','2018-06-07 23:03:14'),(75,'2018-06-07 23:03:26',9,'2018-06-07 23:03:26','2018-06-07 23:03:26'),(76,'2018-06-07 23:03:29',9,'2018-06-07 23:03:29','2018-06-07 23:03:29'),(77,'2018-06-07 23:03:32',9,'2018-06-07 23:03:32','2018-06-07 23:03:32'),(78,'2018-06-07 23:15:13',9,'2018-06-07 23:15:13','2018-06-07 23:15:13'),(79,'2018-06-07 23:15:15',406,'2018-06-07 23:15:15','2018-06-07 23:15:15'),(80,'2018-06-07 23:15:17',11,'2018-06-07 23:15:17','2018-06-07 23:15:17'),(81,'2018-06-07 23:15:19',406,'2018-06-07 23:15:19','2018-06-07 23:15:19'),(82,'2018-06-07 23:15:22',11,'2018-06-07 23:15:22','2018-06-07 23:15:22'),(83,'2018-06-07 23:15:24',9,'2018-06-07 23:15:24','2018-06-07 23:15:24'),(84,'2018-06-07 23:15:26',9,'2018-06-07 23:15:26','2018-06-07 23:15:26'),(85,'2018-06-07 23:15:29',9,'2018-06-07 23:15:29','2018-06-07 23:15:29'),(86,'2018-06-07 23:15:31',9,'2018-06-07 23:15:31','2018-06-07 23:15:31'),(87,'2018-06-07 23:15:34',9,'2018-06-07 23:15:34','2018-06-07 23:15:34'),(88,'2018-06-07 23:15:36',9,'2018-06-07 23:15:36','2018-06-07 23:15:36'),(89,'2018-06-07 23:16:09',11,'2018-06-07 23:16:09','2018-06-07 23:16:09'),(90,'2018-06-07 23:16:10',406,'2018-06-07 23:16:10','2018-06-07 23:16:10'),(91,'2018-06-07 23:16:29',407,'2018-06-07 23:16:29','2018-06-07 23:16:29'),(92,'2018-06-07 23:16:43',402,'2018-06-07 23:16:43','2018-06-07 23:16:43'),(93,'2018-06-09 22:43:21',1,'2018-06-09 22:43:21','2018-06-09 22:43:20'),(94,'2018-06-09 22:43:32',9,'2018-06-09 22:43:32','2018-06-09 22:43:32'),(95,'2018-06-09 22:45:37',395,'2018-06-09 22:45:37','2018-06-09 22:45:37'),(96,'2018-06-09 22:48:34',402,'2018-06-09 22:48:34','2018-06-09 22:48:34'),(97,'2018-06-09 22:59:11',402,'2018-06-09 22:59:11','2018-06-09 22:59:11'),(98,'2018-06-09 23:26:10',402,'2018-06-09 23:26:10','2018-06-09 23:26:10'),(99,'2018-06-10 21:18:22',6,'2018-06-10 21:18:22','2018-06-10 21:18:21'),(100,'2018-06-10 21:19:02',395,'2018-06-10 21:19:02','2018-06-10 21:19:02'),(101,'2018-06-10 21:20:32',6,'2018-06-10 21:20:32','2018-06-10 21:20:32'),(102,'2018-06-10 21:23:59',395,'2018-06-10 21:23:59','2018-06-10 21:23:59'),(103,'2018-06-10 21:24:10',6,'2018-06-10 21:24:10','2018-06-10 21:24:10'),(104,'2018-06-11 22:52:16',395,'2018-06-11 22:52:16','2018-06-11 22:52:16'),(105,'2018-06-11 22:53:47',6,'2018-06-11 22:53:47','2018-06-11 22:53:47'),(106,'2018-06-11 22:54:21',402,'2018-06-11 22:54:21','2018-06-11 22:54:21'),(107,'2018-06-11 23:00:19',9,'2018-06-11 23:00:19','2018-06-11 23:00:18'),(108,'2018-06-11 23:02:35',395,'2018-06-11 23:02:35','2018-06-11 23:02:35'),(109,'2018-06-11 23:17:18',395,'2018-06-11 23:17:18','2018-06-11 23:17:18'),(110,'2018-06-11 23:29:09',402,'2018-06-11 23:29:09','2018-06-11 23:29:05'),(111,'2018-06-11 23:34:08',395,'2018-06-11 23:34:08','2018-06-11 23:34:08'),(112,'2018-06-11 23:36:30',395,'2018-06-11 23:36:30','2018-06-11 23:36:27'),(113,'2018-06-12 22:46:12',395,'2018-06-12 22:46:12','2018-06-12 22:46:11'),(114,'2018-06-12 22:46:28',6,'2018-06-12 22:46:28','2018-06-12 22:46:28'),(115,'2018-06-12 22:46:44',395,'2018-06-12 22:46:44','2018-06-12 22:46:44'),(116,'2018-06-12 22:48:58',9,'2018-06-12 22:48:58','2018-06-12 22:48:58'),(117,'2018-06-12 23:11:58',409,'2018-06-12 23:11:58','2018-06-12 23:11:58'),(118,'2018-05-23 15:27:44',13,'2018-05-23 15:27:44','2018-05-23 15:27:44'),(119,'2018-05-23 15:27:45',11,'2018-05-23 15:27:45','2018-05-23 15:27:45'),(120,'2018-05-23 15:28:06',9,'2018-05-23 15:28:06','2018-05-23 15:28:06'),(121,'2018-05-23 15:47:03',9,'2018-05-23 15:47:03','2018-05-23 15:47:03'),(122,'2018-05-23 15:51:10',9,'2018-05-23 15:51:10','2018-05-23 15:51:10'),(123,'2018-05-23 15:54:59',13,'2018-05-23 15:54:59','2018-05-23 15:54:59'),(124,'2018-05-23 15:55:08',11,'2018-05-23 15:55:08','2018-05-23 15:55:08'),(125,'2018-05-23 15:58:02',9,'2018-05-23 15:58:02','2018-05-23 15:58:02'),(126,'2018-05-23 16:21:45',9,'2018-05-23 16:21:45','2018-05-23 16:21:45'),(127,'2018-05-23 16:22:09',13,'2018-05-23 16:22:09','2018-05-23 16:22:09'),(128,'2018-05-23 16:58:13',9,'2018-05-23 16:58:13','2018-05-23 16:58:13'),(129,'2018-05-23 17:00:48',9,'2018-05-23 17:00:48','2018-05-23 17:00:48'),(130,'2018-05-23 17:00:50',11,'2018-05-23 17:00:50','2018-05-23 17:00:50'),(131,'2018-05-23 17:00:52',13,'2018-05-23 17:00:52','2018-05-23 17:00:52'),(132,'2018-05-23 17:00:54',17,'2018-05-23 17:00:54','2018-05-23 17:00:54'),(133,'2018-05-23 17:00:57',9,'2018-05-23 17:00:57','2018-05-23 17:00:57'),(134,'2018-05-23 17:04:29',9,'2018-05-23 17:04:29','2018-05-23 17:04:29'),(135,'2018-05-23 17:05:28',9,'2018-05-23 17:05:28','2018-05-23 17:05:28'),(136,'2018-05-23 17:06:09',9,'2018-05-23 17:06:09','2018-05-23 17:06:09'),(137,'2018-05-23 17:09:20',9,'2018-05-23 17:09:20','2018-05-23 17:09:20'),(138,'2018-05-23 17:24:21',9,'2018-05-23 17:24:21','2018-05-23 17:24:21'),(139,'2018-05-23 17:26:18',17,'2018-05-23 17:26:18','2018-05-23 17:26:18'),(140,'2018-05-23 17:27:06',17,'2018-05-23 17:27:06','2018-05-23 17:27:06'),(141,'2018-05-23 17:27:32',9,'2018-05-23 17:27:32','2018-05-23 17:27:32'),(142,'2018-05-23 17:27:34',17,'2018-05-23 17:27:34','2018-05-23 17:27:34'),(143,'2018-05-23 17:29:12',9,'2018-05-23 17:29:12','2018-05-23 17:29:12'),(144,'2018-05-23 17:29:31',9,'2018-05-23 17:29:31','2018-05-23 17:29:31'),(145,'2018-05-23 17:33:25',9,'2018-05-23 17:33:25','2018-05-23 17:33:25'),(146,'2018-05-23 17:53:12',9,'2018-05-23 17:53:12','2018-05-23 17:53:12'),(147,'2018-05-23 17:53:22',9,'2018-05-23 17:53:22','2018-05-23 17:53:22'),(148,'2018-05-23 17:53:26',17,'2018-05-23 17:53:26','2018-05-23 17:53:26'),(149,'2018-05-23 17:54:23',9,'2018-05-23 17:54:23','2018-05-23 17:54:23'),(150,'2018-05-23 17:54:27',9,'2018-05-23 17:54:27','2018-05-23 17:54:27'),(151,'2018-05-23 17:54:57',17,'2018-05-23 17:54:57','2018-05-23 17:54:57'),(152,'2018-05-23 17:54:58',8,'2018-05-23 17:54:58','2018-05-23 17:54:58'),(153,'2018-05-23 17:55:01',17,'2018-05-23 17:55:01','2018-05-23 17:55:01'),(154,'2018-05-23 17:55:14',17,'2018-05-23 17:55:14','2018-05-23 17:55:14'),(155,'2018-05-25 15:00:47',9,'2018-05-25 15:00:47','2018-05-25 15:00:47'),(156,'2018-05-25 15:00:52',9,'2018-05-25 15:00:52','2018-05-25 15:00:52'),(157,'2018-05-25 15:01:09',9,'2018-05-25 15:01:09','2018-05-25 15:01:09'),(158,'2018-05-25 15:01:11',13,'2018-05-25 15:01:11','2018-05-25 15:01:11'),(159,'2018-05-30 17:29:17',9,'2018-05-30 17:29:17','2018-05-30 17:29:17'),(160,'2018-05-30 17:29:18',9,'2018-05-30 17:29:18','2018-05-30 17:29:18'),(161,'2018-05-30 17:29:41',6,'2018-05-30 17:29:41','2018-05-30 17:29:41'),(162,'2018-05-30 17:47:33',6,'2018-05-30 17:47:33','2018-05-30 17:47:33'),(163,'2018-05-30 17:50:57',6,'2018-05-30 17:50:57','2018-05-30 17:50:57'),(164,'2018-05-30 17:51:09',6,'2018-05-30 17:51:09','2018-05-30 17:51:09'),(165,'2018-05-30 17:51:44',9,'2018-05-30 17:51:44','2018-05-30 17:51:44'),(166,'2018-05-30 17:52:18',5,'2018-05-30 17:52:18','2018-05-30 17:52:17'),(167,'2018-05-30 18:03:03',6,'2018-05-30 18:03:03','2018-05-30 18:03:03'),(168,'2018-05-30 18:03:09',5,'2018-05-30 18:03:09','2018-05-30 18:03:09'),(169,'2018-05-30 18:14:52',395,'2018-05-30 18:14:52','2018-05-30 18:14:52'),(170,'2018-05-30 18:15:12',395,'2018-05-30 18:15:12','2018-05-30 18:15:12'),(171,'2018-05-30 18:16:41',9,'2018-05-30 18:16:41','2018-05-30 18:16:41'),(172,'2018-05-30 18:16:46',5,'2018-05-30 18:16:46','2018-05-30 18:16:46'),(173,'2018-05-30 18:16:49',6,'2018-05-30 18:16:49','2018-05-30 18:16:49'),(174,'2018-05-30 18:16:50',395,'2018-05-30 18:16:50','2018-05-30 18:16:50'),(175,'2018-05-30 18:16:52',5,'2018-05-30 18:16:52','2018-05-30 18:16:52'),(176,'2018-05-30 18:17:27',5,'2018-05-30 18:17:27','2018-05-30 18:17:27'),(177,'2018-05-30 18:17:28',6,'2018-05-30 18:17:28','2018-05-30 18:17:28'),(178,'2018-05-30 18:17:29',395,'2018-05-30 18:17:29','2018-05-30 18:17:29'),(179,'2018-05-30 18:17:30',6,'2018-05-30 18:17:30','2018-05-30 18:17:30'),(180,'2018-05-30 18:17:31',395,'2018-05-30 18:17:31','2018-05-30 18:17:31'),(181,'2018-05-30 18:19:49',395,'2018-05-30 18:19:49','2018-05-30 18:19:48'),(182,'2018-05-30 18:36:38',395,'2018-05-30 18:36:38','2018-05-30 18:36:37'),(183,'2018-05-30 18:59:23',395,'2018-05-30 18:59:23','2018-05-30 18:59:23'),(184,'2018-05-30 19:04:46',395,'2018-05-30 19:04:46','2018-05-30 19:04:46'),(185,'2018-05-30 19:06:20',395,'2018-05-30 19:06:20','2018-05-30 19:06:20'),(186,'2018-05-30 19:07:15',9,'2018-05-30 19:07:15','2018-05-30 19:07:15'),(187,'2018-05-30 19:07:28',395,'2018-05-30 19:07:28','2018-05-30 19:07:28'),(188,'2018-05-30 19:10:30',9,'2018-05-30 19:10:30','2018-05-30 19:10:30'),(189,'2018-05-30 19:10:32',395,'2018-05-30 19:10:32','2018-05-30 19:10:32'),(190,'2018-05-30 19:15:59',5,'2018-05-30 19:15:59','2018-05-30 19:15:59'),(191,'2018-05-30 19:15:59',395,'2018-05-30 19:15:59','2018-05-30 19:15:59'),(192,'2018-05-30 19:16:08',395,'2018-05-30 19:16:08','2018-05-30 19:16:08'),(193,'2018-05-31 11:14:20',17,'2018-05-31 11:14:20','2018-05-31 11:14:20'),(194,'2018-05-31 15:28:19',9,'2018-05-31 15:28:19','2018-05-31 15:28:18'),(195,'2018-05-31 15:46:07',9,'2018-05-31 15:46:07','2018-05-31 15:46:06'),(196,'2018-05-31 15:46:47',9,'2018-05-31 15:46:47','2018-05-31 15:46:47'),(197,'2018-05-31 15:50:33',11,'2018-05-31 15:50:33','2018-05-31 15:50:33'),(198,'2018-05-31 15:50:34',13,'2018-05-31 15:50:34','2018-05-31 15:50:34'),(199,'2018-05-31 15:51:36',5,'2018-05-31 15:51:36','2018-05-31 15:51:36'),(200,'2018-05-31 15:51:56',6,'2018-05-31 15:51:56','2018-05-31 15:51:56'),(201,'2018-05-31 15:51:59',395,'2018-05-31 15:51:59','2018-05-31 15:51:59'),(202,'2018-05-31 18:01:21',9,'2018-05-31 18:01:21','2018-05-31 18:01:20'),(203,'2018-05-31 18:01:21',11,'2018-05-31 18:01:21','2018-05-31 18:01:21'),(204,'2018-05-31 18:01:23',13,'2018-05-31 18:01:23','2018-05-31 18:01:23'),(205,'2018-05-31 18:01:25',17,'2018-05-31 18:01:25','2018-05-31 18:01:25'),(206,'2018-05-31 18:01:27',5,'2018-05-31 18:01:27','2018-05-31 18:01:27'),(207,'2018-05-31 18:01:30',6,'2018-05-31 18:01:30','2018-05-31 18:01:30'),(208,'2018-05-31 18:01:32',395,'2018-05-31 18:01:32','2018-05-31 18:01:32'),(209,'2018-05-31 18:22:21',17,'2018-05-31 18:22:21','2018-05-31 18:22:21'),(210,'2018-05-31 18:22:26',9,'2018-05-31 18:22:26','2018-05-31 18:22:26'),(211,'2018-05-31 18:24:23',13,'2018-05-31 18:24:23','2018-05-31 18:24:23'),(212,'2018-05-31 18:24:27',9,'2018-05-31 18:24:27','2018-05-31 18:24:27'),(213,'2018-05-31 18:25:54',9,'2018-05-31 18:25:54','2018-05-31 18:25:54'),(214,'2018-05-31 18:26:07',11,'2018-05-31 18:26:07','2018-05-31 18:26:07'),(215,'2018-05-31 18:26:39',6,'2018-05-31 18:26:39','2018-05-31 18:26:39'),(216,'2018-05-31 18:39:07',395,'2018-05-31 18:39:07','2018-05-31 18:39:06'),(217,'2018-05-31 18:55:54',395,'2018-05-31 18:55:54','2018-05-31 18:55:54'),(218,'2018-06-02 17:17:14',9,'2018-06-02 17:17:14','2018-06-02 17:17:14'),(219,'2018-06-04 18:28:20',395,'2018-06-04 18:28:20','2018-06-04 18:28:19'),(220,'2018-06-04 18:28:50',395,'2018-06-04 18:28:50','2018-06-04 18:28:50'),(221,'2018-06-04 18:29:10',5,'2018-06-04 18:29:10','2018-06-04 18:29:10'),(222,'2018-06-04 18:29:13',6,'2018-06-04 18:29:13','2018-06-04 18:29:13'),(223,'2018-06-04 18:39:19',9,'2018-06-04 18:39:19','2018-06-04 18:39:18'),(224,'2018-06-04 18:39:20',11,'2018-06-04 18:39:20','2018-06-04 18:39:20'),(225,'2018-06-04 18:39:24',13,'2018-06-04 18:39:24','2018-06-04 18:39:24'),(226,'2018-06-04 18:39:27',17,'2018-06-04 18:39:27','2018-06-04 18:39:27'),(227,'2018-06-04 18:39:29',5,'2018-06-04 18:39:29','2018-06-04 18:39:29'),(228,'2018-06-04 18:39:32',6,'2018-06-04 18:39:32','2018-06-04 18:39:32'),(229,'2018-06-04 18:39:36',395,'2018-06-04 18:39:36','2018-06-04 18:39:36'),(230,'2018-06-04 18:39:54',395,'2018-06-04 18:39:54','2018-06-04 18:39:54'),(231,'2018-06-04 18:41:04',395,'2018-06-04 18:41:04','2018-06-04 18:41:04'),(232,'2018-06-04 18:42:53',395,'2018-06-04 18:42:53','2018-06-04 18:42:53'),(233,'2018-06-04 18:43:46',395,'2018-06-04 18:43:46','2018-06-04 18:43:46'),(234,'2018-06-04 19:13:46',395,'2018-06-04 19:13:46','2018-06-04 19:13:45'),(235,'2018-06-04 19:17:51',395,'2018-06-04 19:17:51','2018-06-04 19:17:50'),(236,'2018-06-04 19:25:09',395,'2018-06-04 19:25:09','2018-06-04 19:25:09'),(237,'2018-06-04 19:52:23',395,'2018-06-04 19:52:23','2018-06-04 19:52:22'),(238,'2018-06-04 19:56:40',6,'2018-06-04 19:56:40','2018-06-04 19:56:40'),(239,'2018-06-04 19:56:41',395,'2018-06-04 19:56:41','2018-06-04 19:56:41'),(240,'2018-06-05 17:52:29',395,'2018-06-05 17:52:29','2018-06-05 17:52:29'),(241,'2018-06-05 17:52:53',5,'2018-06-05 17:52:53','2018-06-05 17:52:53'),(242,'2018-06-05 17:53:03',395,'2018-06-05 17:53:03','2018-06-05 17:53:03'),(243,'2018-06-05 17:53:28',395,'2018-06-05 17:53:28','2018-06-05 17:53:28'),(244,'2018-06-05 17:54:49',6,'2018-06-05 17:54:49','2018-06-05 17:54:48'),(245,'2018-06-05 17:54:50',5,'2018-06-05 17:54:50','2018-06-05 17:54:50'),(246,'2018-06-05 17:54:52',6,'2018-06-05 17:54:52','2018-06-05 17:54:52'),(247,'2018-06-05 17:54:52',395,'2018-06-05 17:54:52','2018-06-05 17:54:52'),(248,'2018-06-06 09:25:37',9,'2018-06-06 09:25:37','2018-06-06 09:25:36'),(249,'2018-06-06 09:25:44',11,'2018-06-06 09:25:44','2018-06-06 09:25:44'),(250,'2018-06-06 09:25:46',13,'2018-06-06 09:25:46','2018-06-06 09:25:46'),(251,'2018-06-06 09:25:48',17,'2018-06-06 09:25:48','2018-06-06 09:25:48'),(252,'2018-06-06 17:17:14',9,'2018-06-06 17:17:14','2018-06-06 17:17:14'),(253,'2018-06-06 17:26:12',402,'2018-06-06 17:26:12','2018-06-06 17:26:12'),(254,'2018-06-06 17:48:46',402,'2018-06-06 17:48:46','2018-06-06 17:48:46'),(255,'2018-06-06 17:49:22',402,'2018-06-06 17:49:22','2018-06-06 17:49:22'),(256,'2018-06-06 17:50:07',402,'2018-06-06 17:50:07','2018-06-06 17:50:07'),(257,'2018-06-06 18:01:01',9,'2018-06-06 18:01:01','2018-06-06 18:01:01'),(258,'2018-06-06 18:01:21',402,'2018-06-06 18:01:21','2018-06-06 18:01:21'),(259,'2018-06-06 18:23:56',402,'2018-06-06 18:23:56','2018-06-06 18:23:56'),(260,'2018-06-06 18:24:35',402,'2018-06-06 18:24:35','2018-06-06 18:24:35'),(261,'2018-06-06 18:29:05',9,'2018-06-06 18:29:05','2018-06-06 18:29:05'),(262,'2018-06-06 18:52:08',17,'2018-06-06 18:52:08','2018-06-06 18:52:07');
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
INSERT INTO `sys_role` VALUES (1,'2018-05-21 17:42:41','2018-05-22 13:50:16','è¶…çº§ç®¡ç†å‘˜'),(2,'2018-05-21 17:42:54','2018-05-22 13:50:16','ç³»ç»Ÿç»´æŠ¤ç®¡ç†å‘˜'),(3,'2018-05-21 17:45:12','2018-05-22 13:50:16','æ˜ å°„ç®¡ç†å‘˜'),(4,'2018-05-21 17:45:35','2018-05-22 13:50:16','å·¥ä½œæµç®¡ç†å‘˜');
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
INSERT INTO `sys_sequence` VALUES ('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.AnnouncementChanged',13),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Code',2),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.ExtendProperty',1),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Menu',409),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.MenuVisitLog',117),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet',12),('ll.workflow.worksheetNo',14);
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_worksheet`
--

DROP TABLE IF EXISTS `sys_worksheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_worksheet` (
  `ID` bigint(20) NOT NULL,
  `CLASSIFICATION` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER_ID` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `INSTANCE_ID` varchar(255) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `WORKSHEET_NO` varchar(255) DEFAULT NULL,
  `CREATE_USER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_worksheet`
--

LOCK TABLES `sys_worksheet` WRITE;
/*!40000 ALTER TABLE `sys_worksheet` DISABLE KEYS */;
INSERT INTO `sys_worksheet` VALUES (1,NULL,'2018-06-09 23:29:20',NULL,NULL,'\"\"','2018-06-09 23:29:20',NULL,'1','3','liulei'),(2,NULL,'2018-06-09 23:30:54',NULL,NULL,'\"\"','2018-06-09 23:30:54',NULL,'1','4','liulei'),(3,NULL,'2018-06-09 23:32:53',NULL,NULL,'\"\"','2018-06-09 23:32:53',NULL,'1','5','liulei'),(4,NULL,'2018-06-09 23:34:02',NULL,NULL,'\"\"','2018-06-09 23:34:02',NULL,'1','6','liulei'),(5,NULL,'2018-06-09 23:35:30',NULL,NULL,'\"\"','2018-06-09 23:35:30',NULL,'1','7','liulei'),(6,NULL,'2018-06-09 23:37:31',NULL,NULL,'\"\"','2018-06-09 23:37:31',NULL,'1','8','liulei'),(7,NULL,'2018-06-09 23:38:34',NULL,NULL,'\"\"','2018-06-09 23:38:34',NULL,'1','9','liulei'),(8,NULL,'2018-06-09 23:39:15',NULL,NULL,'\"\"','2018-06-09 23:39:15',NULL,'1','10','liulei'),(9,NULL,'2018-06-09 23:39:44',NULL,NULL,'\"\"','2018-06-09 23:39:44',NULL,'1','11','liulei'),(10,NULL,'2018-06-11 22:54:56',NULL,NULL,'\"\"','2018-06-11 22:54:56',NULL,'1','12','liulei'),(11,NULL,'2018-06-11 22:54:59',NULL,NULL,'\"\"','2018-06-11 22:54:59',NULL,'1','13','liulei'),(12,NULL,'2018-06-11 22:55:02',NULL,NULL,'\"\"','2018-06-11 22:55:02',NULL,'1','14','liulei');
/*!40000 ALTER TABLE `sys_worksheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_worksheet_aduit`
--

DROP TABLE IF EXISTS `sys_worksheet_aduit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_worksheet_aduit` (
  `ID` bigint(20) NOT NULL,
  `ADUIT_RESULT` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `PEACH_NO` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  `WORKSHEET_NO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_worksheet_aduit`
--

LOCK TABLES `sys_worksheet_aduit` WRITE;
/*!40000 ALTER TABLE `sys_worksheet_aduit` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_worksheet_aduit` ENABLE KEYS */;
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
  `æ˜¯å¦æ ‡å¿—Y` int(11) NOT NULL,
  `æ˜¯å¦æ ‡å¿—X` int(11) DEFAULT NULL,
  PRIMARY KEY (`æ˜¯å¦æ ‡å¿—Y`)
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

-- Dump completed on 2018-06-12 23:28:53
