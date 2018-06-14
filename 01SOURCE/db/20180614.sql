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
INSERT INTO `act_ge_bytearray` VALUES ('20005',1,'测试模型2.bpmn20.xml','20004','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"测试模型2\" name=\"测试模型2\" isExecutable=\"true\">\n    <startEvent id=\"sid-F70CF072-3C4D-43EF-B70F-6A5588AE313F\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_测试模型2\">\n    <bpmndi:BPMNPlane bpmnElement=\"测试模型2\" id=\"BPMNPlane_测试模型2\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-F70CF072-3C4D-43EF-B70F-6A5588AE313F\" id=\"BPMNShape_sid-F70CF072-3C4D-43EF-B70F-6A5588AE313F\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"147.0\" y=\"34.0\"/>\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('20006',1,'测试模型2.测试模型2.png','20004','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0J\0\0\0\�^%\�\0\0YIDATx\�\�\�\�KSq�q|\�\�!(�?\�?�\�tC\�N\�\�Ԅ���>LD|a=�\�X+�aR8\� \"+�\�\�؋H�55�N\�K%n������\�\�\�\�ù\�_M\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\��RW�ɤwvv�E0<\�\�\�:q�\\\�n�+�\�y\�\�\�^ؙ���\�\�M\"��L�����ccc\'~�_\�\�̨��\r�N�U�PPB~s��\�\�\�T�aP\�\�\�g===�\�\�VDU\�I\��\�\�\��+�OOO\��J$*�z�\�w6�\�\�D�V�\�p8����ME\"�%������\�\�\�S\�Q������\�\��\�\�mU\n�TJ\�\'\��x\�aT�\�\�҃�����\�_\Z\Z\Z�DѣK\�R����\n\�\�\�t��ц�S�\�\�Ѣ�\�\��F��\��e\�\�\���X�[GGG�v�Uu��\�xф���\"\���/��Rz�\�E�\�\�\�n�F�a��\0�B!e\���tB\'�]��d\�EV\0LZ__O\�d�}%K]�L\�h�g�ٜN�=��d{�|�\���N�чQ��k�/чQ\�\�\�g�+{>�\�R\�a�\�\�+�\�\�\�ӳø�����1\�\�\�O�\���\�\�ɐ\�9���p�9;��\�\�\��\�\�\�Bcc\�\'��\����M\�\�\�fN\'�K�K���\����NT�C]\�\�l=\�R^�7Y\�}vy?��^WWWK\�a\�\�pt�N*%�ɰ�G��J�N�ӡ+��R�A\�\�ߏ\��e��\�\�p�\�pt�*�TtI����\0\�E\�щi\�U�hqq�\�%^Z���\�I\�/QEE��\"?\�mM6�\�/2G_YYy��7�2J��jJ�ے�.�+\�\�b�\�t:�9_��.\�uY]]}<22�T�A;�\�R͙��Z{���J�u?\�\�g\�Z�5\�߿{�\�\"+\0|\0\0\0\0\0\0\0\0�q?r]P��\�\�n\0\0\0\0IEND�B`�',1),('20021',1,'菜单发布申请.bpmn20.xml','20020','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"WF-00001\" isExecutable=\"true\">\n    <startEvent id=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" name=\"开始\"/>\n    <userTask id=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" name=\"请假申请\"/>\n    <sequenceFlow id=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" sourceRef=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" targetRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"/>\n    <userTask id=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" name=\"审批\"/>\n    <sequenceFlow id=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" sourceRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" targetRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"/>\n    <endEvent id=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" name=\"结束\"/>\n    <sequenceFlow id=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" sourceRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" targetRef=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_WF-00001\">\n    <bpmndi:BPMNPlane bpmnElement=\"WF-00001\" id=\"BPMNPlane_WF-00001\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" id=\"BPMNShape_sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"80.0\" y=\"43.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" id=\"BPMNShape_sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"150.0\" y=\"18.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" id=\"BPMNShape_sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"317.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" id=\"BPMNShape_sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"525.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" id=\"BPMNEdge_sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\">\n        <omgdi:waypoint x=\"417.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"68.0\"/>\n        <omgdi:waypoint x=\"525.0\" y=\"68.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" id=\"BPMNEdge_sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\">\n        <omgdi:waypoint x=\"110.0\" y=\"58.0\"/>\n        <omgdi:waypoint x=\"150.0\" y=\"58.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" id=\"BPMNEdge_sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\">\n        <omgdi:waypoint x=\"250.0\" y=\"56.20359281437126\"/>\n        <omgdi:waypoint x=\"317.0\" y=\"53.79640718562874\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('20022',1,'菜单发布申请.WF-00001.png','20020','�PNG\r\n\Z\n\0\0\0\rIHDR\0\03\0\0\0l\0\0\0�3\�\0\0VIDATx\�\�	l\�ǭ64H$\"iP۔��6�	BUJ�\�*E��h�*���\0\� oB��\�B����\r�(\"D��\�\�����\��+8\�;v�\�\���ь5�\�\�\�cvf��IO�yg\�Ͼ�����\��\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ��q\�ɓ\'\�\�ٳ\�\�\�\�\\#;;�\�rrr�\�۷.��G\0\0D�\n�\�\�B���¨��âd���FAA�%6��J\0\0�ЌB\�7��.;;�(^	\0\0ڵ��������W\0\0D�\�l \"|%f�\0\0�\�\�W_�\'��cΙc���5b\0:�a\�H�\�LuU�qh\�,\�`\�\�[L_\�}�\�\0t\01� ��s��\�@\�\�v��F|1\0F�0b$\�b\�\���݇_!f\0���F�Y\�\�\�hT\�\�>|\n1\0������M\0�\r1È�}S}�11���)|\0�!`�\�7Kv�٨�\�}��	\0F�0|\�K��C[\�\nmyM�\�S�&\001B��o��ڿ��_\�k��	\0�,	�3��Fɮ�\Zv1\�k��\�7����!`�\�7�^\��ο5꛺��.|\0�!`�\�7kk���<\�\�\�/7ꗶ\�1z,Y\Z|\0:��a\�\�/�y�lY\Z|\0�!`�\�7���i*K��\�\0\�A\�#F~�͖\n\��1|\0:��a\�\�\�B\�7����b\�7 #F�\���F�03�	\0��!` f0|3�ILL���!C\�:t�X�X��!vU\�\�˔\�=����!` f0|3v6l\�3b\�bu�xi�m�㓸z@���&�	QCIO$�#0\�0>>�!�&00��o��2dhBB\�Na���h��\�F^^�q�\�Y\��\�ˆr\�\����\�عs��x�b#99\�-h�\�\�\0#`\���&x)d��q\�)bV�\\iTTT͡��\�<^\�\�5�;Gqu���0�M|\�=#\�2�&M2�0-A\�7u\�T��!C\�7\�\�\\\\\\z\��\n\�ϟiܸq\�SRR\�,))\�\�/�P7cƌ�,X)�SF��7�M�+Z#\�\�ZJOO�\�Jj)\�5o\�<w�\�\�\\m���u\�֭�;w\��	&˖-3�\�\�c�^�z\��\0u�)��>�\��c�?�\�ĉO����\"``|\��!B&Ǚ�i��q\n\ZW����eD����\�+����P�q\�F�?\�ӦM�\n������A��71|3�\�\�\�\�\Z��v-5\�\�䬡��)z٘;6lؐ���\�7n�Hĸټy����Z\�,\r���ob�fL��l[hh�n{�z�j�3\�2���{ǎk?~�M>\�ӧO\"�jF�\Z�\"#`\���&D��\�.�\�\�\�ŋ\�E\�\�(\'װ\�\\}ь�\n�\�Kk.��\�\�\�5���A��71|3���(0\�k��f�\':�C\�L\�\�{�\�\�h\�R[ed\�eh�^�\�n\�K\�\�\�\'7����\�\�7�}�\�Z2F~~~���X\�!f6r��\�^\�<gΜ:��iO���jw#f0F��lO�\�ɓc�\�4�\��M|\��{Vb��.�u��~b\�W\�233\�\�QK׮]3ڛѣG�����A��83s�kZt]�w��>�&�	m&f\�կ\�l8vSô�\�g��Y�GF�_{���낐�!`0�p�\r�����\�NQ�o�\�Z�8��-(\�k6߇#��yA�e`љ}�\�5C�#%55�<Z\�\�\��\�F\� f�\"f�Inڿ�o\�3Ӓ%Kn{̔)S\�\�\�\�m��\�݋oF\��r�*�\�nZ\�n��j\�\�%3\�\�˗/7�d�\�\��U\�\�x\�\�\����A\�D\�HNN\�2|���\�\�\�\'$$�H��ŧ~.>��\�{\�7\�M�\�iq�XH\�\�e�G\��I����I�\�\�^.\�\��W3\�\�\r9��\�}����ذa���\�\�ݻ�=��\�V[�n��\��63z�۫V�j\�\�73Mef\Z�\�hw\�n��\����f&Fѵ�t�/ٵk\�\�hUw�{\�\r��A\��˶n\�j<�\�Sw�p\�*�\�we�C�����\�d\�O>\��\���\�\�MK\�d;R\�Eym�l_�#\��]\"�L\�]�\�֫\��u\�+;\"vB�T\�\�W*&Į[\�ϭ}\'\�o�޳K\�yV%\�zZ|W\�K��W�۲��\�\�$\�\�z�\�N���1���{�\�g\�\�k\�w\�t�;\�Ӑ�L�ϝ:u2�O�n�O�8a\n}�Ec͚5f�ȑ#�����\�ؿ?b1\�Թ�lN��|׮0�)F\�E#\�\�\�<3\�\�\�\�R�M\�%\�\�����\�\�\�ڟS�ؗb\�MyF\���b{Ŷ[3{n\�ᗚ\�Ь�؛��\�<�Y�Qa ��Y\�\�,�fS�=@�+�e��\�#�u���E8}[�1��f;�f�\�ƫS�JII\�$�}\�\�%���ȸp\�iv\�E\�ǎ3\����ș���\�{\���7m\�dn�g\�b���-kB\�\�[e=\�0\�L,��_ۋFz���h�!\�j]\�L1<N9R\��ݼ\'�]�*>V�XaTWW�\�kךm��\�ҥK\�\�{�\�ef`��{�\��\�}�Q|1\�dVF\�\�\�Ŏ4rO��K\nt`+�\�\�3\0\'%%\�d`�6\Z���1C��\�w�\�t75\�L�\�\�\�?^߅���j�5+3hР�\�\n�������ŏ\�֮\'|1㨏yD\�\�\��\�;+vAl����[\�\�\�k3\�(#F��\�uf����܇��}Zo��^�Е\�\����{�>��\�\�\�8p���\�ׯ��\�\���??�����\�\�̰��֜�M���4縠�� Q!�m�ͮ]�\��#>�\�8\�U�\�|�\�\�\�=\n1\��Čv\�\�=\�r.\�>��b��\��T\���C\��q\�\�7�{0�b\�l9盬�\�1cǎ��f\����f\���g\rA\�\�ʪ�����\���\�\�\���xݞ:u�>h`p�������\�=z\��t\�\��!`xGP\�\�O<\� 3ӭ[7c	���Q\�\�Jm�9s\�\�:t1\�bFܵv\�*�\�l\�\�},���#{�\�\�ugo�\�\��m�&M�\�fôU�O�<��3+\�\�y@2k֬�G3mٲ\�>ʹ[zc�\�u��ņ>��\�\�\��.#g����\\u�\�~�\�}��5�|\�f�\�3\�����Gz>\�LS\�\�\�̸����^���VӶ��^\�8\�9\�A\�Ď�љ�E��V�\�\\�X��\�\��\"6H�\�#\�����	\��\�z:\�\�\�\�[-hT\�̛7\�Y\'S��c��.�z�q��(\�36����\�\n\�\�\"I\�\�\\E���T{t��\�\�ҥK͢\�s\�\�\��4\�(v\�;3\�\�ג�!` fn\'f\�I�\�s�:��\�ӮTyb7Ο?��	��\���T�X#�Y\�%\�3��\�\�m�j;G |�\�\��v���]N�>WF�\�%��9s\�ǌ�3\0_MHH8\��\�n��]�7s�S\�n�����\�ݪX\�c_�u�x���S�j�P\�4=�w\�\�\rJS��m۶��|��\��8\�\�O\�h���a\�M$v\�\�6ҹ��kw�v+E�Lq\n\Z��Ѭ�\�[�;jI�}�52V\��4\�TQ@\�^�ʹe˖�A�\�F͌�\�QgLu֪\�]Fڥ�\�Lg7ӓO>i�+�5Qa�Ʀ9��Hχ���a�b\�F��O�0ך��\�)��v�H�\�\�\�s5�\�\�X\� NQ��\�\�\�z�u����ޫ3�j=\�o�a�1\�kW\r�f�R�KE��#G\�O�<��ٙ*q�\"V\�/fT�茨\�ִ�S<��t㬂H;3�sqh��]lgZ\"\�̴�|�\�L\�3߰f\�c\r�\�I\�\�ZV�\�\�\0��=�C�[h�\�\���P(T��\�\�\�\���;\ZbF�}���\�\�\�\�3����گ\�}�\�a\�\�il4S�Z�Hχ���A\�Ķ�IKK뤓ωM�f\��B��1-��v�<�����y�%j�G\"b4è%)\�\�\�Ԛ\�Ǐ������\r�܃�\\�!ft��휺=\�5\�ڙ9q\�ӟ_z\�%�5[܄3��i��!` f3�\'ft\�T٦�\�Ƚ��NB�K\�Zb\�\�\�߉\�\�\��]c�4�53�U\�\�\�\�,17��}}JRRRb(�RQQѦBF��wH`<�\�n�����]k�\�\�ٳ͟���11�]D:�\�\�ѣ\�}v\�ƹ��\�T���[{>\�b&v������w�͗��\�u�W�}$E����V\�V\Z\�Ȩ�	Zu�\���03�\�^h�\�64Zݝ��ti���_��(�jѢE\�XEa)���o\�\0\�)\�����\n�ʋ��j\"�Gf\�֭�E\�ru7���ob�&@숚�*jRRR*\�ϟxǎgJKK\�\�\�)u\�H]k)\'\'\�?�O\�Bu7���ob�&@�\�Ѫ�	|\�7���0�M|\0���0�M|\0��A��71|\0\�\��M\0 ``|\�\0 `0�M|\�\0 `0�M\�\0F��71|\0\�\�7\0|\�7\0|\�7���0�M|\0���0�M|\0��A��71|\0ܨ	�&�o\0#`�5�����\��\�u�\03b&�o\�^VQQ�_��JKK?\�<�W\0bC\�D@^^ޠ���/?�\�\Z|#z2999g\�\�\0���3\"�i�&���C�\r\�\�u?��\0\���\0\0@\� f\0\0\0 �a\�\0\0@�a\�#F\0\0\0\r#F1\0\0x1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\��hu\�\�m\�2\0\0\0\0IEND�B`�',1),('5',1,'菜单发布申请.bpmn20.xml','4','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"WF-00001\" isExecutable=\"true\">\n    <startEvent id=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" name=\"开始\"/>\n    <userTask id=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" name=\"请假申请\"/>\n    <sequenceFlow id=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" sourceRef=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" targetRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"/>\n    <userTask id=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" name=\"审批\"/>\n    <sequenceFlow id=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" sourceRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" targetRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"/>\n    <endEvent id=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" name=\"结束\"/>\n    <sequenceFlow id=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" sourceRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" targetRef=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_WF-00001\">\n    <bpmndi:BPMNPlane bpmnElement=\"WF-00001\" id=\"BPMNPlane_WF-00001\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" id=\"BPMNShape_sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"80.0\" y=\"43.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" id=\"BPMNShape_sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"150.0\" y=\"18.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" id=\"BPMNShape_sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"317.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" id=\"BPMNShape_sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"525.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" id=\"BPMNEdge_sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\">\n        <omgdi:waypoint x=\"417.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"68.0\"/>\n        <omgdi:waypoint x=\"525.0\" y=\"68.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" id=\"BPMNEdge_sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\">\n        <omgdi:waypoint x=\"110.0\" y=\"58.0\"/>\n        <omgdi:waypoint x=\"150.0\" y=\"58.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" id=\"BPMNEdge_sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\">\n        <omgdi:waypoint x=\"250.0\" y=\"56.20359281437126\"/>\n        <omgdi:waypoint x=\"317.0\" y=\"53.79640718562874\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('6',1,'菜单发布申请.WF-00001.png','4','�PNG\r\n\Z\n\0\0\0\rIHDR\0\03\0\0\0l\0\0\0�3\�\0\0VIDATx\�\�	l\�ǭ64H$\"iP۔��6�	BUJ�\�*E��h�*���\0\� oB��\�B����\r�(\"D��\�\�����\��+8\�;v�\�\���ь5�\�\�\�cvf��IO�yg\�Ͼ�����\��\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ��q\�ɓ\'\�\�ٳ\�\�\�\�\\#;;�\�rrr�\�۷.��G\0\0D�\n�\�\�B���¨��âd���FAA�%6��J\0\0�ЌB\�7��.;;�(^	\0\0ڵ��������W\0\0D�\�l \"|%f�\0\0�\�\�W_�\'��cΙc���5b\0:�a\�H�\�LuU�qh\�,\�`\�\�[L_\�}�\�\0t\01� ��s��\�@\�\�v��F|1\0F�0b$\�b\�\���݇_!f\0���F�Y\�\�\�hT\�\�>|\n1\0������M\0�\r1È�}S}�11���)|\0�!`�\�7Kv�٨�\�}��	\0F�0|\�K��C[\�\nmyM�\�S�&\001B��o��ڿ��_\�k��	\0�,	�3��Fɮ�\Zv1\�k��\�7����!`�\�7�^\��ο5꛺��.|\0�!`�\�7kk���<\�\�\�/7ꗶ\�1z,Y\Z|\0:��a\�\�/�y�lY\Z|\0�!`�\�7���i*K��\�\0\�A\�#F~�͖\n\��1|\0:��a\�\�\�B\�7����b\�7 #F�\���F�03�	\0��!` f0|3�ILL���!C\�:t�X�X��!vU\�\�˔\�=����!` f0|3v6l\�3b\�bu�xi�m�㓸z@���&�	QCIO$�#0\�0>>�!�&00��o��2dhBB\�Na���h��\�F^^�q�\�Y\��\�ˆr\�\����\�عs��x�b#99\�-h�\�\�\0#`\���&x)d��q\�)bV�\\iTTT͡��\�<^\�\�5�;Gqu���0�M|\�=#\�2�&M2�0-A\�7u\�T��!C\�7\�\�\\\\\\z\��\n\�ϟiܸq\�SRR\�,))\�\�/�P7cƌ�,X)�SF��7�M�+Z#\�\�ZJOO�\�Jj)\�5o\�<w�\�\�\\m���u\�֭�;w\��	&˖-3�\�\�c�^�z\��\0u�)��>�\��c�?�\�ĉO����\"``|\��!B&Ǚ�i��q\n\ZW����eD����\�+����P�q\�F�?\�ӦM�\n������A��71|3�\�\�\�\�\Z��v-5\�\�䬡��)z٘;6lؐ���\�7n�Hĸټy����Z\�,\r���ob�fL��l[hh�n{�z�j�3\�2���{ǎk?~�M>\�ӧO\"�jF�\Z�\"#`\���&D��\�.�\�\�\�ŋ\�E\�\�(\'װ\�\\}ь�\n�\�Kk.��\�\�\�5���A��71|3���(0\�k��f�\':�C\�L\�\�{�\�\�h\�R[ed\�eh�^�\�n\�K\�\�\�\'7����\�\�7�}�\�Z2F~~~���X\�!f6r��\�^\�<gΜ:��iO���jw#f0F��lO�\�ɓc�\�4�\��M|\��{Vb��.�u��~b\�W\�233\�\�QK׮]3ڛѣG�����A��83s�kZt]�w��>�&�	m&f\�կ\�l8vSô�\�g��Y�GF�_{���낐�!`0�p�\r�����\�NQ�o�\�Z�8��-(\�k6߇#��yA�e`љ}�\�5C�#%55�<Z\�\�\��\�F\� f�\"f�Inڿ�o\�3Ӓ%Kn{̔)S\�\�\�\�m��\�݋oF\��r�*�\�nZ\�n��j\�\�%3\�\�˗/7�d�\�\��U\�\�x\�\�\����A\�D\�HNN\�2|���\�\�\�\'$$�H��ŧ~.>��\�{\�7\�M�\�iq�XH\�\�e�G\��I����I�\�\�^.\�\��W3\�\�\r9��\�}����ذa���\�\�ݻ�=��\�V[�n��\��63z�۫V�j\�\�73Mef\Z�\�hw\�n��\����f&Fѵ�t�/ٵk\�\�hUw�{\�\r��A\��˶n\�j<�\�Sw�p\�*�\�we�C�����\�d\�O>\��\���\�\�MK\�d;R\�Eym�l_�#\��]\"�L\�]�\�֫\��u\�+;\"vB�T\�\�W*&Į[\�ϭ}\'\�o�޳K\�yV%\�zZ|W\�K��W�۲��\�\�$\�\�z�\�N���1���{�\�g\�\�k\�w\�t�;\�Ӑ�L�ϝ:u2�O�n�O�8a\n}�Ec͚5f�ȑ#�����\�ؿ?b1\�Թ�lN��|׮0�)F\�E#\�\�\�<3\�\�\�\�R�M\�%\�\�����\�\�\�ڟS�ؗb\�MyF\���b{Ŷ[3{n\�ᗚ\�Ь�؛��\�<�Y�Qa ��Y\�\�,�fS�=@�+�e��\�#�u���E8}[�1��f;�f�\�ƫS�JII\�$�}\�\�%���ȸp\�iv\�E\�ǎ3\����ș���\�{\���7m\�dn�g\�b���-kB\�\�[e=\�0\�L,��_ۋFz���h�!\�j]\�L1<N9R\��ݼ\'�]�*>V�XaTWW�\�kךm��\�ҥK\�\�{�\�ef`��{�\��\�}�Q|1\�dVF\�\�\�Ŏ4rO��K\nt`+�\�\�3\0\'%%\�d`�6\Z���1C��\�w�\�t75\�L�\�\�\�?^߅���j�5+3hР�\�\n�������ŏ\�֮\'|1㨏yD\�\�\��\�;+vAl����[\�\�\�k3\�(#F��\�uf����܇��}Zo��^�Е\�\����{�>��\�\�\�8p���\�ׯ��\�\���??�����\�\�̰��֜�M���4縠�� Q!�m�ͮ]�\��#>�\�8\�U�\�|�\�\�\�=\n1\��Čv\�\�=\�r.\�>��b��\��T\���C\��q\�\�7�{0�b\�l9盬�\�1cǎ��f\����f\���g\rA\�\�ʪ�����\���\�\�\���xݞ:u�>h`p�������\�=z\��t\�\��!`xGP\�\�O<\� 3ӭ[7c	���Q\�\�Jm�9s\�\�:t1\�bFܵv\�*�\�l\�\�},���#{�\�\�ugo�\�\��m�&M�\�fôU�O�<��3+\�\�y@2k֬�G3mٲ\�>ʹ[zc�\�u��ņ>��\�\�\��.#g����\\u�\�~�\�}��5�|\�f�\�3\�����Gz>\�LS\�\�\�̸����^���VӶ��^\�8\�9\�A\�Ď�љ�E��V�\�\\�X��\�\��\"6H�\�#\�����	\��\�z:\�\�\�\�[-hT\�̛7\�Y\'S��c��.�z�q��(\�36����\�\n\�\�\"I\�\�\\E���T{t��\�\�ҥK͢\�s\�\�\��4\�(v\�;3\�\�ג�!` fn\'f\�I�\�s�:��\�ӮTyb7Ο?��	��\���T�X#�Y\�%\�3��\�\�m�j;G |�\�\��v���]N�>WF�\�%��9s\�ǌ�3\0_MHH8\��\�n��]�7s�S\�n�����\�ݪX\�c_�u�x���S�j�P\�4=�w\�\�\rJS��m۶��|��\��8\�\�O\�h���a\�M$v\�\�6ҹ��kw�v+E�Lq\n\Z��Ѭ�\�[�;jI�}�52V\��4\�TQ@\�^�ʹe˖�A�\�F͌�\�QgLu֪\�]Fڥ�\�Lg7ӓO>i�+�5Qa�Ʀ9��Hχ���a�b\�F��O�0ך��\�)��v�H�\�\�\�s5�\�\�X\� NQ��\�\�\�z�u����ޫ3�j=\�o�a�1\�kW\r�f�R�KE��#G\�O�<��ٙ*q�\"V\�/fT�茨\�ִ�S<��t㬂H;3�sqh��]lgZ\"\�̴�|�\�L\�3߰f\�c\r�\�I\�\�ZV�\�\�\0��=�C�[h�\�\���P(T��\�\�\�\���;\ZbF�}���\�\�\�\�3����گ\�}�\�a\�\�il4S�Z�Hχ���A\�Ķ�IKK뤓ωM�f\��B��1-��v�<�����y�%j�G\"b4è%)\�\�\�Ԛ\�Ǐ������\r�܃�\\�!ft��휺=\�5\�ڙ9q\�ӟ_z\�%�5[܄3��i��!` f3�\'ft\�T٦�\�Ƚ��NB�K\�Zb\�\�\�߉\�\�\��]c�4�53�U\�\�\�\�,17��}}JRRRb(�RQQѦBF��wH`<�\�n�����]k�\�\�ٳ͟���11�]D:�\�\�ѣ\�}v\�ƹ��\�T���[{>\�b&v������w�͗��\�u�W�}$E����V\�V\Z\�Ȩ�	Zu�\���03�\�^h�\�64Zݝ��ti���_��(�jѢE\�XEa)���o\�\0\�)\�����\n�ʋ��j\"�Gf\�֭�E\�ru7���ob�&@숚�*jRRR*\�ϟxǎgJKK\�\�\�)u\�H]k)\'\'\�?�O\�Bu7���ob�&@�\�Ѫ�	|\�7���0�M|\0���0�M|\0��A��71|\0\�\��M\0 ``|\�\0 `0�M|\�\0 `0�M\�\0F��71|\0\�\�7\0|\�7\0|\�7���0�M|\0���0�M|\0��A��71|\0ܨ	�&�o\0#`�5�����\��\�u�\03b&�o\�^VQQ�_��JKK?\�<�W\0bC\�D@^^ޠ���/?�\�\Z|#z2999g\�\�\0���3\"�i�&���C�\r\�\�u?��\0\���\0\0@\� f\0\0\0 �a\�\0\0@�a\�#F\0\0\0\r#F1\0\0x1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\��hu\�\�m\�2\0\0\0\0IEND�B`�',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10002','WF-00001:1:7','10001','10001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:32:10.665','2018-06-09 23:32:10.692',27,''),('10003','WF-00001:1:7','10001','10001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10004',NULL,'请假申请','userTask',NULL,'2018-06-09 23:32:10.694',NULL,NULL,''),('10006','WF-00001:1:7','10005','10005','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:32:52.369','2018-06-09 23:32:52.369',0,''),('10007','WF-00001:1:7','10005','10005','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10008',NULL,'请假申请','userTask',NULL,'2018-06-09 23:32:52.369',NULL,NULL,''),('12503','WF-00001:1:7','12502','12502','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:34:01.400','2018-06-09 23:34:01.704',304,''),('12504','WF-00001:1:7','12501','12501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:34:01.400','2018-06-09 23:34:01.708',308,''),('12505','WF-00001:1:7','12502','12502','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12506',NULL,'请假申请','userTask',NULL,'2018-06-09 23:34:01.707',NULL,NULL,''),('12507','WF-00001:1:7','12501','12501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12508',NULL,'请假申请','userTask',NULL,'2018-06-09 23:34:01.711',NULL,NULL,''),('12510','WF-00001:1:7','12509','12509','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:35:29.994','2018-06-09 23:35:29.997',3,''),('12511','WF-00001:1:7','12509','12509','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12512',NULL,'请假申请','userTask',NULL,'2018-06-09 23:35:29.998',NULL,NULL,''),('15002','WF-00001:1:7','15001','15001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:37:28.899','2018-06-09 23:37:29.155',256,''),('15003','WF-00001:1:7','15001','15001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','15004',NULL,'请假申请','userTask',NULL,'2018-06-09 23:37:29.160',NULL,NULL,''),('17502','WF-00001:1:7','17501','17501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:38:32.816','2018-06-09 23:38:32.837',21,''),('17503','WF-00001:1:7','17501','17501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17504',NULL,'请假申请','userTask',NULL,'2018-06-09 23:38:32.838',NULL,NULL,''),('17506','WF-00001:1:7','17505','17505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:39:14.755','2018-06-09 23:39:14.772',17,''),('17507','WF-00001:1:7','17505','17505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17508',NULL,'请假申请','userTask',NULL,'2018-06-09 23:39:14.776',NULL,NULL,''),('17510','WF-00001:1:7','17509','17509','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:39:44.170','2018-06-09 23:39:44.172',2,''),('17511','WF-00001:1:7','17509','17509','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17512',NULL,'请假申请','userTask',NULL,'2018-06-09 23:39:44.173',NULL,NULL,''),('20009','WF-00001:1:7','20008','20008','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-11 22:54:55.232','2018-06-11 22:54:55.259',27,''),('20010','WF-00001:1:7','20008','20008','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20011',NULL,'请假申请','userTask',NULL,'2018-06-11 22:54:55.260',NULL,NULL,''),('20013','WF-00001:1:7','20012','20012','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-11 22:54:59.318','2018-06-11 22:54:59.321',3,''),('20014','WF-00001:1:7','20012','20012','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20015',NULL,'请假申请','userTask',NULL,'2018-06-11 22:54:59.322',NULL,NULL,''),('20017','WF-00001:1:7','20016','20016','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-11 22:55:01.448','2018-06-11 22:55:01.455',7,''),('20018','WF-00001:1:7','20016','20016','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20019',NULL,'请假申请','userTask',NULL,'2018-06-11 22:55:01.456',NULL,NULL,''),('2502','WF-00001:1:7','2501','2501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:04:24.760','2018-06-09 23:04:24.769',9,''),('2503','WF-00001:1:7','2501','2501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2504',NULL,'请假申请','userTask',NULL,'2018-06-09 23:04:24.769',NULL,NULL,''),('2506','WF-00001:1:7','2505','2505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:06:25.753','2018-06-09 23:06:25.762',9,''),('2507','WF-00001:1:7','2505','2505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2508',NULL,'请假申请','userTask',NULL,'2018-06-09 23:06:25.763',NULL,NULL,''),('5002','WF-00001:1:7','5001','5001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:26:52.279','2018-06-09 23:26:52.303',24,''),('5003','WF-00001:1:7','5001','5001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','5004',NULL,'请假申请','userTask',NULL,'2018-06-09 23:26:52.304',NULL,NULL,''),('7502','WF-00001:1:7','7501','7501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:29:13.575','2018-06-09 23:29:13.687',112,''),('7503','WF-00001:1:7','7501','7501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7504',NULL,'请假申请','userTask',NULL,'2018-06-09 23:29:13.690',NULL,NULL,''),('7506','WF-00001:1:7','7505','7505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:30:48.589','2018-06-09 23:30:48.595',6,''),('7507','WF-00001:1:7','7505','7505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7508',NULL,'请假申请','userTask',NULL,'2018-06-09 23:30:48.596',NULL,NULL,'');
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
INSERT INTO `act_hi_taskinst` VALUES ('10004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10001','10001','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:32:10.702',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('10008','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10005','10005','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:32:52.369',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12506','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12502','12502','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:34:01.719',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12501','12501','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:34:01.719',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12512','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12509','12509','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:35:30.003',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('15004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','15001','15001','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:37:29.180',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17501','17501','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:38:32.939',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17505','17505','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:39:14.789',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17512','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17509','17509','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:39:44.175',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('20011','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20008','20008','请假申请',NULL,NULL,NULL,NULL,'2018-06-11 22:54:55.267',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('20015','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20012','20012','请假申请',NULL,NULL,NULL,NULL,'2018-06-11 22:54:59.325',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('20019','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','20016','20016','请假申请',NULL,NULL,NULL,NULL,'2018-06-11 22:55:01.463',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('2504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2501','2501','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:04:24.808',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('2508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2505','2505','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:06:25.770',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('5004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','5001','5001','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:26:52.310',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7501','7501','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:29:13.718',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7505','7505','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:30:48.603',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_re_deployment` VALUES ('20004','测试模型2',NULL,'','2018-06-11 14:53:23.334'),('20020','菜单发布申请',NULL,'','2018-06-11 14:56:12.772'),('4','菜单发布申请',NULL,'','2018-06-09 14:47:54.024');
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
INSERT INTO `act_re_procdef` VALUES ('WF-00001:1:7',1,'http://www.activiti.org/processdef','测试1','WF-00001',1,'4','菜单发布申请.bpmn20.xml','菜单发布申请.WF-00001.png',NULL,0,1,1,''),('WF-00001:2:20023',1,'http://www.activiti.org/processdef',NULL,'WF-00001',2,'20020','菜单发布申请.bpmn20.xml','菜单发布申请.WF-00001.png',NULL,0,1,1,''),('测试模型2:1:20007',1,'http://www.activiti.org/processdef','测试模型2','测试模型2',1,'20004','测试模型2.bpmn20.xml','测试模型2.测试模型2.png',NULL,0,1,1,'');
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
INSERT INTO `act_ru_task` VALUES ('10004',1,'10001','10001','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:32:10.694',NULL,NULL,1,'',NULL),('10008',1,'10005','10005','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:32:52.369',NULL,NULL,1,'',NULL),('12506',1,'12502','12502','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:34:01.709',NULL,NULL,1,'',NULL),('12508',1,'12501','12501','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:34:01.712',NULL,NULL,1,'',NULL),('12512',1,'12509','12509','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:35:29.999',NULL,NULL,1,'',NULL),('15004',1,'15001','15001','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:37:29.162',NULL,NULL,1,'',NULL),('17504',1,'17501','17501','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:38:32.838',NULL,NULL,1,'',NULL),('17508',1,'17505','17505','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:39:14.777',NULL,NULL,1,'',NULL),('17512',1,'17509','17509','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:39:44.173',NULL,NULL,1,'',NULL),('20011',1,'20008','20008','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-11 14:54:55.260',NULL,NULL,1,'',NULL),('20015',1,'20012','20012','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-11 14:54:59.322',NULL,NULL,1,'',NULL),('20019',1,'20016','20016','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-11 14:55:01.456',NULL,NULL,1,'',NULL),('2504',1,'2501','2501','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:04:24.769',NULL,NULL,1,'',NULL),('2508',1,'2505','2505','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:06:25.763',NULL,NULL,1,'',NULL),('5004',1,'5001','5001','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:26:52.304',NULL,NULL,1,'',NULL),('7504',1,'7501','7501','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:29:13.691',NULL,NULL,1,'',NULL),('7508',1,'7505','7505','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:30:48.597',NULL,NULL,1,'',NULL);
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
INSERT INTO `sys_announcement_changed` VALUES ('1',NULL,NULL,'2018-06-09 23:06:54',1,'2018-06-09 23:06:54',NULL,NULL),('10','测试内容',NULL,'2018-06-09 23:39:15',9,'2018-06-09 23:39:15',NULL,'201806091126'),('11','测试内容',NULL,'2018-06-09 23:39:44',10,'2018-06-09 23:39:44',NULL,'201806091126'),('12','2',NULL,'2018-06-11 22:54:56',11,'2018-06-11 22:54:56',NULL,'测试1'),('13','2',NULL,'2018-06-11 22:55:00',12,'2018-06-11 22:55:00',NULL,'测试1'),('14','2',NULL,'2018-06-11 22:55:02',13,'2018-06-11 22:55:02',NULL,'测试1'),('3','测试内容',NULL,'2018-06-09 23:29:22',2,'2018-06-09 23:29:22',NULL,'201806091126'),('4','测试内容',NULL,'2018-06-09 23:30:55',3,'2018-06-09 23:30:55',NULL,'201806091126'),('5','测试内容',NULL,'2018-06-09 23:32:53',4,'2018-06-09 23:32:53',NULL,'201806091126'),('6','测试内容',NULL,'2018-06-09 23:34:02',5,'2018-06-09 23:34:02',NULL,'201806091126'),('7','测试内容',NULL,'2018-06-09 23:35:30',6,'2018-06-09 23:35:30',NULL,'201806091126'),('8','测试内容',NULL,'2018-06-09 23:37:31',7,'2018-06-09 23:37:31',NULL,'201806091126'),('9','测试内容',NULL,'2018-06-09 23:38:34',8,'2018-06-09 23:38:34',NULL,'201806091126');
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
  `ENABLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_code`
--

LOCK TABLES `sys_code` WRITE;
/*!40000 ALTER TABLE `sys_code` DISABLE KEYS */;
INSERT INTO `sys_code` VALUES (1,'YesOrNo','1','是','2018-06-07 19:24:52',1,'2018-06-14 23:13:44','','','','',''),(2,'YesOrNo','0','否','2018-06-07 19:24:52',2,'2018-06-14 23:13:44','','','','',''),(4,'WorksheetState','0','作废','2018-06-14 22:56:24',4,'2018-06-14 23:13:44','','','','',''),(5,'WorksheetState','2','完成','2018-06-14 22:56:24',2,'2018-06-14 23:13:44','','','','',''),(6,'WorksheetState','3','暂停','2018-06-14 22:56:24',3,'2018-06-14 23:13:44','','','','',''),(7,'WorksheetState','1','运行中','2018-06-14 22:56:24',1,'2018-06-14 23:13:44','','','','',''),(8,'Gender','1','男','2018-06-14 23:08:34',2,'2018-06-14 23:13:44','','','','',''),(9,'Gender','0','女','2018-06-14 23:08:34',1,'2018-06-14 23:13:44','','','','',''),(10,'Gender','2','其他','2018-06-14 23:08:34',0,'2018-06-14 23:13:44','','','','',''),(11,'OpenOrClose','1','开启','2018-06-14 23:08:34',0,'2018-06-14 23:13:44','','','','',''),(12,'OpenOrClose','0','关闭','2018-06-14 23:08:34',0,'2018-06-14 23:13:44','','','','','');
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
INSERT INTO `sys_extend_property` VALUES (1,'YesOrNo','2018-06-07 19:24:18','2018-06-14 23:40:09','是否','SELECT CODE,CODE_NAME,\'\' FILETER FROM SYS_CODE  WHERE CLASSIFY=\'YesOrNo\' ORDER BY DISPLAY_SN'),(2,'WorksheetState','2018-06-14 22:55:07','2018-06-14 23:40:09','工作单状态','SELECT CODE,CODE_NAME,\'\' FILETER FROM SYS_CODE WHERE CLASSIFY=\'WorksheetState\' ORDER BY DISPLAY_SN');
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
INSERT INTO `sys_menu` VALUES (1,'2018-06-07 19:09:29',1,'/template/sys/code/code','2018-06-07 19:21:48','映射',0,3,''),(4,'2018-06-09 22:45:08',1,'','2018-06-09 22:45:08','工作流管理',0,NULL,NULL),(6,'2018-04-05 20:09:35',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/process-list','2018-05-30 17:29:31','工作流管理',4,3,'true'),(7,'2018-04-05 20:09:44',2,'',NULL,'节点管理',4,2,NULL),(8,'2018-04-27 15:33:08',2,'/template/sys/assistant/generateEntity',NULL,'实体映射（数据库）',1,1,NULL),(9,'2018-04-09 23:19:03',2,'/template/sys/menu/menu',NULL,'菜单管理',15,1,NULL),(11,'2018-04-09 23:47:46',2,'/template/sys/role/role',NULL,'角色管理',15,2,NULL),(12,'2018-04-09 23:48:22',2,'',NULL,'权限管理',15,3,NULL),(13,'2018-04-09 23:50:10',2,'/template/sys/admin/admin','2018-05-22 14:30:15','操作员管理',15,4,NULL),(14,'2018-04-09 23:50:19',2,'',NULL,'组织管理',15,5,NULL),(15,'2018-04-23 17:34:11',1,'','2018-06-07 19:21:57','系统维护',0,1,''),(16,'2018-04-23 17:36:34',2,'/template/sys/config/entityFilterParamConfig',NULL,'实体过滤字',1,5,NULL),(17,'2018-04-27 15:43:48',2,'/template/sys/assistant/generateEntityOom',NULL,'实体映射（oom）',1,0,NULL),(395,'2018-05-30 18:14:11',2,'http://localhost:8080/base-workflow-test/template/sys/workflow/model-list','2018-05-30 18:14:35','模型列表',4,4,'true'),(396,'2018-05-31 18:24:45',1,'','2018-06-07 19:21:51','个人设置',0,4,''),(397,'2018-05-31 18:24:55',2,'','2018-05-31 18:25:14','密码修改',396,2,''),(398,'2018-05-31 18:25:06',2,'','2018-05-31 18:25:06','基本信息',396,1,NULL),(401,'2018-06-06 17:25:24',1,'','2018-06-06 17:25:24','工作流测试',0,NULL,NULL),(402,'2018-06-06 17:26:00',2,'/template/sys/workflow/announcement/apply','2018-06-06 18:01:15','公告申请流程',401,1,''),(406,'2018-06-07 19:20:54',2,'/template/sys/code/code','2018-06-07 19:20:54','代码管理',15,1,NULL),(407,'2018-06-07 19:22:52',2,'/template/sys/extendproperty/extendproperty','2018-06-07 19:22:52','扩展属性',15,6,NULL),(409,'2018-06-12 22:49:20',2,'/template/sys/worksheet/query','2018-06-12 22:49:20','工作单查询',4,NULL,NULL);
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
INSERT INTO `sys_menu_visit_log` VALUES (1,'2018-06-07 13:59:29',402,'2018-06-07 13:59:29','2018-06-07 13:59:28'),(2,'2018-06-07 17:39:01',402,'2018-06-07 17:39:01','2018-06-07 17:39:01'),(3,'2018-06-07 17:39:03',11,'2018-06-07 17:39:03','2018-06-07 17:39:03'),(4,'2018-06-07 17:39:03',9,'2018-06-07 17:39:03','2018-06-07 17:39:03'),(5,'2018-06-07 17:39:07',11,'2018-06-07 17:39:07','2018-06-07 17:39:07'),(6,'2018-06-07 18:00:55',9,'2018-06-07 18:00:55','2018-06-07 18:00:54'),(7,'2018-06-07 18:00:59',9,'2018-06-07 18:00:59','2018-06-07 18:00:59'),(8,'2018-06-07 18:01:01',9,'2018-06-07 18:01:01','2018-06-07 18:01:01'),(9,'2018-06-07 18:01:04',9,'2018-06-07 18:01:04','2018-06-07 18:01:04'),(10,'2018-06-07 18:01:07',9,'2018-06-07 18:01:07','2018-06-07 18:01:07'),(11,'2018-06-07 18:01:09',9,'2018-06-07 18:01:09','2018-06-07 18:01:09'),(12,'2018-06-07 18:01:11',11,'2018-06-07 18:01:11','2018-06-07 18:01:11'),(13,'2018-06-07 18:01:13',11,'2018-06-07 18:01:13','2018-06-07 18:01:13'),(14,'2018-06-07 18:01:14',13,'2018-06-07 18:01:14','2018-06-07 18:01:14'),(15,'2018-06-07 18:01:18',11,'2018-06-07 18:01:18','2018-06-07 18:01:18'),(16,'2018-06-07 18:01:24',13,'2018-06-07 18:01:24','2018-06-07 18:01:24'),(17,'2018-06-07 18:01:27',17,'2018-06-07 18:01:27','2018-06-07 18:01:27'),(18,'2018-06-07 18:01:33',9,'2018-06-07 18:01:33','2018-06-07 18:01:33'),(19,'2018-06-07 18:01:34',11,'2018-06-07 18:01:34','2018-06-07 18:01:34'),(20,'2018-06-07 18:01:37',13,'2018-06-07 18:01:37','2018-06-07 18:01:37'),(21,'2018-06-07 18:01:40',17,'2018-06-07 18:01:40','2018-06-07 18:01:40'),(22,'2018-06-07 18:01:42',8,'2018-06-07 18:01:42','2018-06-07 18:01:42'),(23,'2018-06-07 18:01:44',16,'2018-06-07 18:01:44','2018-06-07 18:01:44'),(24,'2018-06-07 18:01:51',5,'2018-06-07 18:01:51','2018-06-07 18:01:51'),(25,'2018-06-07 18:01:54',6,'2018-06-07 18:01:54','2018-06-07 18:01:54'),(26,'2018-06-07 18:01:55',395,'2018-06-07 18:01:55','2018-06-07 18:01:55'),(27,'2018-06-07 18:01:59',6,'2018-06-07 18:01:59','2018-06-07 18:01:59'),(28,'2018-06-07 18:02:09',402,'2018-06-07 18:02:09','2018-06-07 18:02:09'),(29,'2018-06-07 18:02:28',402,'2018-06-07 18:02:28','2018-06-07 18:02:27'),(30,'2018-06-07 18:03:16',9,'2018-06-07 18:03:16','2018-06-07 18:03:16'),(31,'2018-06-07 18:03:21',13,'2018-06-07 18:03:21','2018-06-07 18:03:21'),(32,'2018-06-07 18:03:37',13,'2018-06-07 18:03:37','2018-06-07 18:03:37'),(33,'2018-06-07 18:03:40',11,'2018-06-07 18:03:40','2018-06-07 18:03:40'),(34,'2018-06-07 18:04:12',402,'2018-06-07 18:04:12','2018-06-07 18:04:11'),(35,'2018-06-07 18:04:21',9,'2018-06-07 18:04:21','2018-06-07 18:04:21'),(36,'2018-06-07 18:04:35',17,'2018-06-07 18:04:35','2018-06-07 18:04:35'),(37,'2018-06-07 18:05:23',17,'2018-06-07 18:05:23','2018-06-07 18:05:23'),(38,'2018-06-07 18:13:39',5,'2018-06-07 18:13:39','2018-06-07 18:13:39'),(39,'2018-06-07 18:13:41',6,'2018-06-07 18:13:41','2018-06-07 18:13:41'),(40,'2018-06-07 18:13:42',395,'2018-06-07 18:13:42','2018-06-07 18:13:42'),(41,'2018-06-07 19:03:35',5,'2018-06-07 19:03:35','2018-06-07 19:03:35'),(42,'2018-06-07 19:03:37',6,'2018-06-07 19:03:37','2018-06-07 19:03:37'),(43,'2018-06-07 19:08:48',9,'2018-06-07 19:08:48','2018-06-07 19:08:48'),(44,'2018-06-07 19:12:40',9,'2018-06-07 19:12:40','2018-06-07 19:12:40'),(45,'2018-06-07 19:17:56',9,'2018-06-07 19:17:56','2018-06-07 19:17:56'),(46,'2018-06-07 19:20:05',9,'2018-06-07 19:20:05','2018-06-07 19:20:05'),(47,'2018-06-07 19:20:18',1,'2018-06-07 19:20:18','2018-06-07 19:20:18'),(48,'2018-06-07 19:20:24',1,'2018-06-07 19:20:24','2018-06-07 19:20:24'),(49,'2018-06-07 19:20:26',1,'2018-06-07 19:20:26','2018-06-07 19:20:26'),(50,'2018-06-07 19:20:28',9,'2018-06-07 19:20:28','2018-06-07 19:20:28'),(51,'2018-06-07 19:21:26',1,'2018-06-07 19:21:26','2018-06-07 19:21:26'),(52,'2018-06-07 19:21:28',1,'2018-06-07 19:21:28','2018-06-07 19:21:28'),(53,'2018-06-07 19:21:37',1,'2018-06-07 19:21:37','2018-06-07 19:21:37'),(54,'2018-06-07 19:21:39',9,'2018-06-07 19:21:39','2018-06-07 19:21:39'),(55,'2018-06-07 19:22:05',9,'2018-06-07 19:22:05','2018-06-07 19:22:05'),(56,'2018-06-07 19:22:59',406,'2018-06-07 19:22:59','2018-06-07 19:22:59'),(57,'2018-06-07 19:23:02',407,'2018-06-07 19:23:02','2018-06-07 19:23:02'),(58,'2018-06-07 19:25:06',407,'2018-06-07 19:25:06','2018-06-07 19:25:06'),(59,'2018-06-07 19:25:10',406,'2018-06-07 19:25:10','2018-06-07 19:25:10'),(60,'2018-06-07 22:45:33',406,'2018-06-07 22:45:33','2018-06-07 22:45:32'),(61,'2018-06-07 22:45:34',9,'2018-06-07 22:45:34','2018-06-07 22:45:34'),(62,'2018-06-07 22:45:36',406,'2018-06-07 22:45:36','2018-06-07 22:45:36'),(63,'2018-06-07 22:45:37',11,'2018-06-07 22:45:37','2018-06-07 22:45:37'),(64,'2018-06-07 22:52:00',11,'2018-06-07 22:52:00','2018-06-07 22:52:00'),(65,'2018-06-07 22:52:03',11,'2018-06-07 22:52:03','2018-06-07 22:52:03'),(66,'2018-06-07 22:53:51',11,'2018-06-07 22:53:51','2018-06-07 22:53:51'),(67,'2018-06-07 22:53:54',11,'2018-06-07 22:53:54','2018-06-07 22:53:54'),(68,'2018-06-07 22:53:58',11,'2018-06-07 22:53:58','2018-06-07 22:53:58'),(69,'2018-06-07 22:55:26',11,'2018-06-07 22:55:26','2018-06-07 22:55:26'),(70,'2018-06-07 22:56:53',9,'2018-06-07 22:56:53','2018-06-07 22:56:53'),(71,'2018-06-07 23:03:10',9,'2018-06-07 23:03:10','2018-06-07 23:03:10'),(72,'2018-06-07 23:03:11',9,'2018-06-07 23:03:11','2018-06-07 23:03:11'),(73,'2018-06-07 23:03:12',9,'2018-06-07 23:03:12','2018-06-07 23:03:12'),(74,'2018-06-07 23:03:14',9,'2018-06-07 23:03:14','2018-06-07 23:03:14'),(75,'2018-06-07 23:03:26',9,'2018-06-07 23:03:26','2018-06-07 23:03:26'),(76,'2018-06-07 23:03:29',9,'2018-06-07 23:03:29','2018-06-07 23:03:29'),(77,'2018-06-07 23:03:32',9,'2018-06-07 23:03:32','2018-06-07 23:03:32'),(78,'2018-06-07 23:15:13',9,'2018-06-07 23:15:13','2018-06-07 23:15:13'),(79,'2018-06-07 23:15:15',406,'2018-06-07 23:15:15','2018-06-07 23:15:15'),(80,'2018-06-07 23:15:17',11,'2018-06-07 23:15:17','2018-06-07 23:15:17'),(81,'2018-06-07 23:15:19',406,'2018-06-07 23:15:19','2018-06-07 23:15:19'),(82,'2018-06-07 23:15:22',11,'2018-06-07 23:15:22','2018-06-07 23:15:22'),(83,'2018-06-07 23:15:24',9,'2018-06-07 23:15:24','2018-06-07 23:15:24'),(84,'2018-06-07 23:15:26',9,'2018-06-07 23:15:26','2018-06-07 23:15:26'),(85,'2018-06-07 23:15:29',9,'2018-06-07 23:15:29','2018-06-07 23:15:29'),(86,'2018-06-07 23:15:31',9,'2018-06-07 23:15:31','2018-06-07 23:15:31'),(87,'2018-06-07 23:15:34',9,'2018-06-07 23:15:34','2018-06-07 23:15:34'),(88,'2018-06-07 23:15:36',9,'2018-06-07 23:15:36','2018-06-07 23:15:36'),(89,'2018-06-07 23:16:09',11,'2018-06-07 23:16:09','2018-06-07 23:16:09'),(90,'2018-06-07 23:16:10',406,'2018-06-07 23:16:10','2018-06-07 23:16:10'),(91,'2018-06-07 23:16:29',407,'2018-06-07 23:16:29','2018-06-07 23:16:29'),(92,'2018-06-07 23:16:43',402,'2018-06-07 23:16:43','2018-06-07 23:16:43'),(93,'2018-06-09 22:43:21',1,'2018-06-09 22:43:21','2018-06-09 22:43:20'),(94,'2018-06-09 22:43:32',9,'2018-06-09 22:43:32','2018-06-09 22:43:32'),(95,'2018-06-09 22:45:37',395,'2018-06-09 22:45:37','2018-06-09 22:45:37'),(96,'2018-06-09 22:48:34',402,'2018-06-09 22:48:34','2018-06-09 22:48:34'),(97,'2018-06-09 22:59:11',402,'2018-06-09 22:59:11','2018-06-09 22:59:11'),(98,'2018-06-09 23:26:10',402,'2018-06-09 23:26:10','2018-06-09 23:26:10'),(99,'2018-06-10 21:18:22',6,'2018-06-10 21:18:22','2018-06-10 21:18:21'),(100,'2018-06-10 21:19:02',395,'2018-06-10 21:19:02','2018-06-10 21:19:02'),(101,'2018-06-10 21:20:32',6,'2018-06-10 21:20:32','2018-06-10 21:20:32'),(102,'2018-06-10 21:23:59',395,'2018-06-10 21:23:59','2018-06-10 21:23:59'),(103,'2018-06-10 21:24:10',6,'2018-06-10 21:24:10','2018-06-10 21:24:10'),(104,'2018-06-11 22:52:16',395,'2018-06-11 22:52:16','2018-06-11 22:52:16'),(105,'2018-06-11 22:53:47',6,'2018-06-11 22:53:47','2018-06-11 22:53:47'),(106,'2018-06-11 22:54:21',402,'2018-06-11 22:54:21','2018-06-11 22:54:21'),(107,'2018-06-11 23:00:19',9,'2018-06-11 23:00:19','2018-06-11 23:00:18'),(108,'2018-06-11 23:02:35',395,'2018-06-11 23:02:35','2018-06-11 23:02:35'),(109,'2018-06-11 23:17:18',395,'2018-06-11 23:17:18','2018-06-11 23:17:18'),(110,'2018-06-11 23:29:09',402,'2018-06-11 23:29:09','2018-06-11 23:29:05'),(111,'2018-06-11 23:34:08',395,'2018-06-11 23:34:08','2018-06-11 23:34:08'),(112,'2018-06-11 23:36:30',395,'2018-06-11 23:36:30','2018-06-11 23:36:27'),(113,'2018-06-12 22:46:12',395,'2018-06-12 22:46:12','2018-06-12 22:46:11'),(114,'2018-06-12 22:46:28',6,'2018-06-12 22:46:28','2018-06-12 22:46:28'),(115,'2018-06-12 22:46:44',395,'2018-06-12 22:46:44','2018-06-12 22:46:44'),(116,'2018-06-12 22:48:58',9,'2018-06-12 22:48:58','2018-06-12 22:48:58'),(117,'2018-06-12 23:11:58',409,'2018-06-12 23:11:58','2018-06-12 23:11:58'),(118,'2018-06-13 22:55:52',409,'2018-06-13 22:55:52','2018-06-13 22:55:52'),(119,'2018-06-13 22:56:31',409,'2018-06-13 22:56:31','2018-06-13 22:56:31'),(120,'2018-06-13 23:00:46',409,'2018-06-13 23:00:46','2018-06-13 23:00:45'),(121,'2018-06-13 23:10:10',409,'2018-06-13 23:10:10','2018-06-13 23:10:07'),(122,'2018-06-13 23:17:16',409,'2018-06-13 23:17:16','2018-06-13 23:17:16'),(123,'2018-06-14 22:47:41',409,'2018-06-14 22:47:41','2018-06-14 22:47:40'),(124,'2018-06-14 22:49:08',409,'2018-06-14 22:49:08','2018-06-14 22:49:08'),(125,'2018-06-14 22:49:23',409,'2018-06-14 22:49:23','2018-06-14 22:49:23'),(126,'2018-06-14 22:50:24',409,'2018-06-14 22:50:24','2018-06-14 22:50:24'),(127,'2018-06-14 22:51:00',409,'2018-06-14 22:51:00','2018-06-14 22:51:00'),(128,'2018-06-14 22:51:14',407,'2018-06-14 22:51:14','2018-06-14 22:51:14'),(129,'2018-06-14 22:55:10',406,'2018-06-14 22:55:10','2018-06-14 22:55:10'),(130,'2018-06-14 23:17:03',9,'2018-06-14 23:17:03','2018-06-14 23:17:03'),(131,'2018-06-14 23:17:17',406,'2018-06-14 23:17:17','2018-06-14 23:17:17'),(132,'2018-06-14 23:17:18',11,'2018-06-14 23:17:18','2018-06-14 23:17:18'),(133,'2018-06-14 23:17:22',13,'2018-06-14 23:17:22','2018-06-14 23:17:22'),(134,'2018-06-14 23:17:26',1,'2018-06-14 23:17:26','2018-06-14 23:17:26'),(135,'2018-06-14 23:17:30',17,'2018-06-14 23:17:30','2018-06-14 23:17:30'),(136,'2018-06-14 23:26:53',1,'2018-06-14 23:26:53','2018-06-14 23:26:53'),(137,'2018-06-14 23:30:39',1,'2018-06-14 23:30:39','2018-06-14 23:30:39'),(138,'2018-06-14 23:30:43',16,'2018-06-14 23:30:43','2018-06-14 23:30:43'),(139,'2018-06-14 23:30:46',17,'2018-06-14 23:30:46','2018-06-14 23:30:46'),(140,'2018-06-14 23:30:57',13,'2018-06-14 23:30:57','2018-06-14 23:30:57'),(141,'2018-06-14 23:31:04',13,'2018-06-14 23:31:04','2018-06-14 23:31:04'),(142,'2018-06-14 23:31:08',407,'2018-06-14 23:31:08','2018-06-14 23:31:08'),(143,'2018-06-14 23:31:16',409,'2018-06-14 23:31:16','2018-06-14 23:31:16'),(144,'2018-06-14 23:31:34',402,'2018-06-14 23:31:34','2018-06-14 23:31:34'),(145,'2018-06-14 23:36:58',9,'2018-06-14 23:36:58','2018-06-14 23:36:58'),(146,'2018-06-14 23:38:38',9,'2018-06-14 23:38:38','2018-06-14 23:38:38'),(147,'2018-06-14 23:38:44',407,'2018-06-14 23:38:44','2018-06-14 23:38:44'),(148,'2018-05-23 17:53:26',17,'2018-05-23 17:53:26','2018-05-23 17:53:26'),(149,'2018-05-23 17:54:23',9,'2018-05-23 17:54:23','2018-05-23 17:54:23'),(150,'2018-05-23 17:54:27',9,'2018-05-23 17:54:27','2018-05-23 17:54:27'),(151,'2018-05-23 17:54:57',17,'2018-05-23 17:54:57','2018-05-23 17:54:57'),(152,'2018-05-23 17:54:58',8,'2018-05-23 17:54:58','2018-05-23 17:54:58'),(153,'2018-05-23 17:55:01',17,'2018-05-23 17:55:01','2018-05-23 17:55:01'),(154,'2018-05-23 17:55:14',17,'2018-05-23 17:55:14','2018-05-23 17:55:14'),(155,'2018-05-25 15:00:47',9,'2018-05-25 15:00:47','2018-05-25 15:00:47'),(156,'2018-05-25 15:00:52',9,'2018-05-25 15:00:52','2018-05-25 15:00:52'),(157,'2018-05-25 15:01:09',9,'2018-05-25 15:01:09','2018-05-25 15:01:09'),(158,'2018-05-25 15:01:11',13,'2018-05-25 15:01:11','2018-05-25 15:01:11'),(159,'2018-05-30 17:29:17',9,'2018-05-30 17:29:17','2018-05-30 17:29:17'),(160,'2018-05-30 17:29:18',9,'2018-05-30 17:29:18','2018-05-30 17:29:18'),(161,'2018-05-30 17:29:41',6,'2018-05-30 17:29:41','2018-05-30 17:29:41'),(162,'2018-05-30 17:47:33',6,'2018-05-30 17:47:33','2018-05-30 17:47:33'),(163,'2018-05-30 17:50:57',6,'2018-05-30 17:50:57','2018-05-30 17:50:57'),(164,'2018-05-30 17:51:09',6,'2018-05-30 17:51:09','2018-05-30 17:51:09'),(165,'2018-05-30 17:51:44',9,'2018-05-30 17:51:44','2018-05-30 17:51:44'),(166,'2018-05-30 17:52:18',5,'2018-05-30 17:52:18','2018-05-30 17:52:17'),(167,'2018-05-30 18:03:03',6,'2018-05-30 18:03:03','2018-05-30 18:03:03'),(168,'2018-05-30 18:03:09',5,'2018-05-30 18:03:09','2018-05-30 18:03:09'),(169,'2018-05-30 18:14:52',395,'2018-05-30 18:14:52','2018-05-30 18:14:52'),(170,'2018-05-30 18:15:12',395,'2018-05-30 18:15:12','2018-05-30 18:15:12'),(171,'2018-05-30 18:16:41',9,'2018-05-30 18:16:41','2018-05-30 18:16:41'),(172,'2018-05-30 18:16:46',5,'2018-05-30 18:16:46','2018-05-30 18:16:46'),(173,'2018-05-30 18:16:49',6,'2018-05-30 18:16:49','2018-05-30 18:16:49'),(174,'2018-05-30 18:16:50',395,'2018-05-30 18:16:50','2018-05-30 18:16:50'),(175,'2018-05-30 18:16:52',5,'2018-05-30 18:16:52','2018-05-30 18:16:52'),(176,'2018-05-30 18:17:27',5,'2018-05-30 18:17:27','2018-05-30 18:17:27'),(177,'2018-05-30 18:17:28',6,'2018-05-30 18:17:28','2018-05-30 18:17:28'),(178,'2018-05-30 18:17:29',395,'2018-05-30 18:17:29','2018-05-30 18:17:29'),(179,'2018-05-30 18:17:30',6,'2018-05-30 18:17:30','2018-05-30 18:17:30'),(180,'2018-05-30 18:17:31',395,'2018-05-30 18:17:31','2018-05-30 18:17:31'),(181,'2018-05-30 18:19:49',395,'2018-05-30 18:19:49','2018-05-30 18:19:48'),(182,'2018-05-30 18:36:38',395,'2018-05-30 18:36:38','2018-05-30 18:36:37'),(183,'2018-05-30 18:59:23',395,'2018-05-30 18:59:23','2018-05-30 18:59:23'),(184,'2018-05-30 19:04:46',395,'2018-05-30 19:04:46','2018-05-30 19:04:46'),(185,'2018-05-30 19:06:20',395,'2018-05-30 19:06:20','2018-05-30 19:06:20'),(186,'2018-05-30 19:07:15',9,'2018-05-30 19:07:15','2018-05-30 19:07:15'),(187,'2018-05-30 19:07:28',395,'2018-05-30 19:07:28','2018-05-30 19:07:28'),(188,'2018-05-30 19:10:30',9,'2018-05-30 19:10:30','2018-05-30 19:10:30'),(189,'2018-05-30 19:10:32',395,'2018-05-30 19:10:32','2018-05-30 19:10:32'),(190,'2018-05-30 19:15:59',5,'2018-05-30 19:15:59','2018-05-30 19:15:59'),(191,'2018-05-30 19:15:59',395,'2018-05-30 19:15:59','2018-05-30 19:15:59'),(192,'2018-05-30 19:16:08',395,'2018-05-30 19:16:08','2018-05-30 19:16:08'),(193,'2018-05-31 11:14:20',17,'2018-05-31 11:14:20','2018-05-31 11:14:20'),(194,'2018-05-31 15:28:19',9,'2018-05-31 15:28:19','2018-05-31 15:28:18'),(195,'2018-05-31 15:46:07',9,'2018-05-31 15:46:07','2018-05-31 15:46:06'),(196,'2018-05-31 15:46:47',9,'2018-05-31 15:46:47','2018-05-31 15:46:47'),(197,'2018-05-31 15:50:33',11,'2018-05-31 15:50:33','2018-05-31 15:50:33'),(198,'2018-05-31 15:50:34',13,'2018-05-31 15:50:34','2018-05-31 15:50:34'),(199,'2018-05-31 15:51:36',5,'2018-05-31 15:51:36','2018-05-31 15:51:36'),(200,'2018-05-31 15:51:56',6,'2018-05-31 15:51:56','2018-05-31 15:51:56'),(201,'2018-05-31 15:51:59',395,'2018-05-31 15:51:59','2018-05-31 15:51:59'),(202,'2018-05-31 18:01:21',9,'2018-05-31 18:01:21','2018-05-31 18:01:20'),(203,'2018-05-31 18:01:21',11,'2018-05-31 18:01:21','2018-05-31 18:01:21'),(204,'2018-05-31 18:01:23',13,'2018-05-31 18:01:23','2018-05-31 18:01:23'),(205,'2018-05-31 18:01:25',17,'2018-05-31 18:01:25','2018-05-31 18:01:25'),(206,'2018-05-31 18:01:27',5,'2018-05-31 18:01:27','2018-05-31 18:01:27'),(207,'2018-05-31 18:01:30',6,'2018-05-31 18:01:30','2018-05-31 18:01:30'),(208,'2018-05-31 18:01:32',395,'2018-05-31 18:01:32','2018-05-31 18:01:32'),(209,'2018-05-31 18:22:21',17,'2018-05-31 18:22:21','2018-05-31 18:22:21'),(210,'2018-05-31 18:22:26',9,'2018-05-31 18:22:26','2018-05-31 18:22:26'),(211,'2018-05-31 18:24:23',13,'2018-05-31 18:24:23','2018-05-31 18:24:23'),(212,'2018-05-31 18:24:27',9,'2018-05-31 18:24:27','2018-05-31 18:24:27'),(213,'2018-05-31 18:25:54',9,'2018-05-31 18:25:54','2018-05-31 18:25:54'),(214,'2018-05-31 18:26:07',11,'2018-05-31 18:26:07','2018-05-31 18:26:07'),(215,'2018-05-31 18:26:39',6,'2018-05-31 18:26:39','2018-05-31 18:26:39'),(216,'2018-05-31 18:39:07',395,'2018-05-31 18:39:07','2018-05-31 18:39:06'),(217,'2018-05-31 18:55:54',395,'2018-05-31 18:55:54','2018-05-31 18:55:54'),(218,'2018-06-02 17:17:14',9,'2018-06-02 17:17:14','2018-06-02 17:17:14'),(219,'2018-06-04 18:28:20',395,'2018-06-04 18:28:20','2018-06-04 18:28:19'),(220,'2018-06-04 18:28:50',395,'2018-06-04 18:28:50','2018-06-04 18:28:50'),(221,'2018-06-04 18:29:10',5,'2018-06-04 18:29:10','2018-06-04 18:29:10'),(222,'2018-06-04 18:29:13',6,'2018-06-04 18:29:13','2018-06-04 18:29:13'),(223,'2018-06-04 18:39:19',9,'2018-06-04 18:39:19','2018-06-04 18:39:18'),(224,'2018-06-04 18:39:20',11,'2018-06-04 18:39:20','2018-06-04 18:39:20'),(225,'2018-06-04 18:39:24',13,'2018-06-04 18:39:24','2018-06-04 18:39:24'),(226,'2018-06-04 18:39:27',17,'2018-06-04 18:39:27','2018-06-04 18:39:27'),(227,'2018-06-04 18:39:29',5,'2018-06-04 18:39:29','2018-06-04 18:39:29'),(228,'2018-06-04 18:39:32',6,'2018-06-04 18:39:32','2018-06-04 18:39:32'),(229,'2018-06-04 18:39:36',395,'2018-06-04 18:39:36','2018-06-04 18:39:36'),(230,'2018-06-04 18:39:54',395,'2018-06-04 18:39:54','2018-06-04 18:39:54'),(231,'2018-06-04 18:41:04',395,'2018-06-04 18:41:04','2018-06-04 18:41:04'),(232,'2018-06-04 18:42:53',395,'2018-06-04 18:42:53','2018-06-04 18:42:53'),(233,'2018-06-04 18:43:46',395,'2018-06-04 18:43:46','2018-06-04 18:43:46'),(234,'2018-06-04 19:13:46',395,'2018-06-04 19:13:46','2018-06-04 19:13:45'),(235,'2018-06-04 19:17:51',395,'2018-06-04 19:17:51','2018-06-04 19:17:50'),(236,'2018-06-04 19:25:09',395,'2018-06-04 19:25:09','2018-06-04 19:25:09'),(237,'2018-06-04 19:52:23',395,'2018-06-04 19:52:23','2018-06-04 19:52:22'),(238,'2018-06-04 19:56:40',6,'2018-06-04 19:56:40','2018-06-04 19:56:40'),(239,'2018-06-04 19:56:41',395,'2018-06-04 19:56:41','2018-06-04 19:56:41'),(240,'2018-06-05 17:52:29',395,'2018-06-05 17:52:29','2018-06-05 17:52:29'),(241,'2018-06-05 17:52:53',5,'2018-06-05 17:52:53','2018-06-05 17:52:53'),(242,'2018-06-05 17:53:03',395,'2018-06-05 17:53:03','2018-06-05 17:53:03'),(243,'2018-06-05 17:53:28',395,'2018-06-05 17:53:28','2018-06-05 17:53:28'),(244,'2018-06-05 17:54:49',6,'2018-06-05 17:54:49','2018-06-05 17:54:48'),(245,'2018-06-05 17:54:50',5,'2018-06-05 17:54:50','2018-06-05 17:54:50'),(246,'2018-06-05 17:54:52',6,'2018-06-05 17:54:52','2018-06-05 17:54:52'),(247,'2018-06-05 17:54:52',395,'2018-06-05 17:54:52','2018-06-05 17:54:52'),(248,'2018-06-06 09:25:37',9,'2018-06-06 09:25:37','2018-06-06 09:25:36'),(249,'2018-06-06 09:25:44',11,'2018-06-06 09:25:44','2018-06-06 09:25:44'),(250,'2018-06-06 09:25:46',13,'2018-06-06 09:25:46','2018-06-06 09:25:46'),(251,'2018-06-06 09:25:48',17,'2018-06-06 09:25:48','2018-06-06 09:25:48'),(252,'2018-06-06 17:17:14',9,'2018-06-06 17:17:14','2018-06-06 17:17:14'),(253,'2018-06-06 17:26:12',402,'2018-06-06 17:26:12','2018-06-06 17:26:12'),(254,'2018-06-06 17:48:46',402,'2018-06-06 17:48:46','2018-06-06 17:48:46'),(255,'2018-06-06 17:49:22',402,'2018-06-06 17:49:22','2018-06-06 17:49:22'),(256,'2018-06-06 17:50:07',402,'2018-06-06 17:50:07','2018-06-06 17:50:07'),(257,'2018-06-06 18:01:01',9,'2018-06-06 18:01:01','2018-06-06 18:01:01'),(258,'2018-06-06 18:01:21',402,'2018-06-06 18:01:21','2018-06-06 18:01:21'),(259,'2018-06-06 18:23:56',402,'2018-06-06 18:23:56','2018-06-06 18:23:56'),(260,'2018-06-06 18:24:35',402,'2018-06-06 18:24:35','2018-06-06 18:24:35'),(261,'2018-06-06 18:29:05',9,'2018-06-06 18:29:05','2018-06-06 18:29:05'),(262,'2018-06-06 18:52:08',17,'2018-06-06 18:52:08','2018-06-06 18:52:07');
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
INSERT INTO `sys_sequence` VALUES ('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.AnnouncementChanged',13),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Code',12),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.ExtendProperty',2),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Menu',409),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.MenuVisitLog',147),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet',12),('ll.workflow.worksheetNo',14);
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

-- Dump completed on 2018-06-14 23:40:31
