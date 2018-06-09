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
INSERT INTO `act_ge_bytearray` VALUES ('2',3,'source',NULL,'{\"resourceId\":\"1\",\"properties\":{\"process_id\":\"WF-00001\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\",\"properties\":{\"overrideid\":\"\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\"}],\"bounds\":{\"lowerRight\":{\"x\":110,\"y\":73},\"upperLeft\":{\"x\":80,\"y\":43}},\"dockers\":[]},{\"resourceId\":\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\",\"properties\":{\"overrideid\":\"\",\"name\":\"请假申请\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\"}],\"bounds\":{\"lowerRight\":{\"x\":250,\"y\":98},\"upperLeft\":{\"x\":150,\"y\":18}},\"dockers\":[]},{\"resourceId\":\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"}],\"bounds\":{\"lowerRight\":{\"x\":149.78125,\"y\":58},\"upperLeft\":{\"x\":110.765625,\"y\":58}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"}},{\"resourceId\":\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\",\"properties\":{\"overrideid\":\"\",\"name\":\"审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\"}],\"bounds\":{\"lowerRight\":{\"x\":417,\"y\":92},\"upperLeft\":{\"x\":317,\"y\":12}},\"dockers\":[]},{\"resourceId\":\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"}],\"bounds\":{\"lowerRight\":{\"x\":316.4225197915845,\"y\":56.182845022452135},\"upperLeft\":{\"x\":250.57748020841555,\"y\":53.817154977547865}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"}},{\"resourceId\":\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":553,\"y\":66},\"upperLeft\":{\"x\":525,\"y\":38}},\"dockers\":[]},{\"resourceId\":\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"showdiamondmarker\":false},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"}],\"bounds\":{\"lowerRight\":{\"x\":533.5667987840079,\"y\":68},\"upperLeft\":{\"x\":417.5625,\"y\":52}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":471,\"y\":52},{\"x\":471,\"y\":68},{\"x\":8.566798784007915,\"y\":30}],\"target\":{\"resourceId\":\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('3',1,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0[\0\0\0�\0\0\0�\�\�9\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0�\�\0\0u0\0\0\�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0�\�\�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\�\0\0\��+\0\0�IDATx\�\�\�	|Tա\��$$�l\�\" \n�� \�CEei��hشϥRk]�U\�\�Z�\�\�\�}�(��\nP�Pd�R\�!�H��[HB�\0I\��\�\�0�B2�L&�\�\�s>sg2�$g\�\��\�ٮ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�A\0�\�^o܎;~���1�ĉM�?���CŔ�\0ፍ�=�\�3g��o\��+j�-\0�`l\��\�\�ÇGdff^V�N���`�U�f\"##��R`�֤���\�s:;;{\�ɓ\'v\�\�%�\�a\0*�]�v\�ܾ}{�\r\Z����Z-1TJ\�۷\�$\'\'��z��\�\�Y\�*�(�\0@E\rZ�t�\�L͚5	Z�@-�իW�t�\����i���?P+ l@R\�arr�`�����~*\��l�\�x�\�2�w|eN\�ab�\�2ѱ�T^	\�\�\�(p\�z<��0w\�ĉ��;%\0�P4^c�\�uXX\�ڽ�c�qx�\�\�>m�9Y\�Dʏfך1&3}/\0U�T1\r6̉��z�\�@EM�4r\��\n<f|]\Z\�\Z�1ZI\���\�:}��\��\�Xb\�@%@�z��\�޽���\�کS�\�[@\�p�]�zuތ/f|�\r�6�\�HOO�\�\��t�\�?�Ɍ�P\�\��W\���h�R��V�Z��{�����-�5�t:\rD޹s\�+���m\�\Zu\�hz=A+@b[�\��W��iӦML���[��k�\�\�ݩ��UU�_a�\�g\n�f/-��T�F����5\�P �_͛77u\�\�e\�W)P�X˖-+\�6aѢE]��s��Z��({�}�\�޴�&@\��I]�ZèiӦ�D޳~��\�W\�\�ů�]k?a\0r�h\0�\�7\�\\͆\�	�\�Ͽ�\Z9K\�iU\r�P\���p��\�`\�Wh.f|]�J��(�kѱ�� l!D�t\�C3�����_\�F\�Top����r\�\�Q�*�\�״��\0�\Z��:4\�\�\���&��j\�L�\ZM|�Z�\�T\0\�B3�B3�.]���\�=�u\����\����\�����;}��3n0\�Ж��\�#\�̮\�:\�\0\�\�3�B\�CΌ�\"I۷\����\� \�D\�N��\�(st\�r\�@�eB3�\�d��S2\��H-U~��\�rU��\�\�\��\�bj]��s\Z\�\'�T\�3�*\�RUԠ\�O-`;W}@ l!41\��B-Uť�\�\0\�b\�FD�a\�BA��è\0AE\�J3�\0\0�- H��\0�h\�FD�`\�\0���e��_\0����-�\nf|@\�0`��zYYY=\"\"\"\�2�W��cKU[2m�x�\���k�����2iҤ=�- @��\0\�_�~=\�\�999w\�0S�S\�lih�\�\�\��\�\�\����}�.��\�L�<y\"a\0\0�\060)@�\��z�\�\�;\�\�\�`_c�\r_M�6\�߄-\0\0\0�\�\�ľ���\�\�\�\�\\\�>en�\�&Ӯ];ӤIs�嗛jժ�\'N�\�\�T���l���[�v\�Zs\�\��\�\�\�\�[ׯ_�\�ñ���\0\0���ڠ5\��(7d��\�?7�;w65k\�<\���]v�S���js�\�;�k\�ܹf޼y&;;[O�\��z\'\��g\�G\�TW\�F\0\0�\Z�Ԣ5ӆ#\'h)@���\�\Z_`\�*�Z��|}_��������\r\\é�h\�*vǉ۴iӯ׭[\������\�\�wYzzztff�����V�V\�L�\�\��\�\�\�/�O�\�/l�\�\0\0�Hc�|]�N\�jڴ�<x�\�UX\nZ���9r��\�J��9\��Փ\'O�������\�>�l��a\��9r$��n0:tpv,�L\\\\���+\�رc1�w\�n���\�h\�ڵ��}�\�]Ǐ6z�菨E\0@(�A\�#w��Z�J�\\\�^|\�g�\�e��zH]�\�\�;[(Ԋ+~\�\�\�KKK��g�e˖Nv~\n\\*jv�\�O~b|���\r6\\3eʔ�\r\Z48%%\�\�:;\0P�hy�\�ն�i\nH%\rZ��\�\�\'�4C�q\�p�Wwb8�g\�V�\�$=k֬\�cǎcV����\n\nZ�Q0�\�ճg\�fv\'\��\�c�=J\�\0B�\�\����\n�^׮]����¡\�[ZK�.]�hѢ��{\�9g�����_�.]\�\�/�\\922�\�G}�	j\0PV�2���[\�\�\�\�`�\�\�~f*U�\�\�m�1b�-\�={��3f��ӟ�d���\�5\�\\c^}�U�7\�mvP�\�K��\�ӧO\�p�[G�m<x�\�<�\�#ΚE�p�����\�\�[�\�\�;o]�ǝ}��=\�RT���\�\�\�� \Z�5v\�X�E��\�^�J��\�?��\�\�/��\�4;(���3\�,�\�\�͹�,���[a?��\��\�L�;v\�\�\�\�\�1\��\�9��7�^�zM����s\�-��ӧO�{\�G3���o�\�@ ��u\�\�>Lz��+W�w�s��*8\�::t\��\�?`-Z���+111�\�O?�\�޽�Z��_m|\�ϙ���dd��<Ώ��\\�o߾�%K�����E��g�}6\�Z�\�\�\�Mǎ��j�RK���V\�޵k��\Z�fpi�=d�܍ƍ�5lذ��Kت�fΜ9F\�7h�U0\�w\�}�\�Ν\�(\\fg\0��\�J%\�\"T�N���,Q����Z4iҤ=��\�+8\�ϸskw\��\�Ԯ]\�i���\�ݻ;\�j\�R�?����>��y��~ݷ�\�\�|�\��Yϡ\��\�\�Nh\�۷\�+a�O��2eJr�=u\�\ru�S�ׯAت\�Ԫ5lذ_iy�}A3hР+\�z\�-\r�j\�Ҹ��������\�)o��>�:0\�\�g_\�ΚFn�\�Sv{�H(jР��4\��1\�&))\�\�ݻ7/l}��\��ǲ\�Q��x<�u\�\�N�=4۷owZ\���P��\�_�u\�\�i�\�a�/�S�\�\'�\�\n�e �ĕ��#l��V�?x�`����o�9&66��fg��i�=P\����Y�l��0++kٴi\�2\�\�{�Ldd\�%�$��\�7}���g��8��\��\�\�}�m[bݯ�Ψ/\�nD�\�\�#���N�B��\"�o\�\�\�>t萹ꪫ̭�\�\�\���\��n\�ի��\\�0��S�:M�u��\�+�\�\�Uw\�q�ٹs�\��\�n�\�1\�\r\\\n��\\�h��\��^q��\�%x\n[�4XZ�h\�Y�r�fg}��=\�U�7���_ڿQcb\�\�\��%�2Y\�Xt��s��\�M���\�]w\�\�tͨ\���\�O(�:���j\�2K�.5ݺusZ*W�lf͚\�t�4o�\�\�fժU\�\�^\�\�ʡȷ\�\�\�&&�9�j��d\�vÐ\�sU\��\�������@?�n\���P��={���\�\�;\�\n\"\Z�\�v8p \�y�F�r�#���y�_\�I�\Z5���^x!�Z\�0��\�cKm\�\"\��[z}?�	[��u�K�v\�\�]n\�VY\�\�И%�>6P���\�s�=���\Zu j֬��6m����\�\�\\jAҁ(--͌7\�l޼ټ�\�y\�S�n]g@qFF�����K\'�t\�\rZ�!���\�*���+��\�,^�ع�\�Q\�V3Ċ��yu\�\�\��\�u����\�\�8��\0UXRA�\�? ]\��\�\���\�<��2��O龶���K��U��gߗ):Ax\�G����D��gΜ\�NZ�AŽ���-�Z�A3\�/\�ȑ#NKPB\�ݰ�\�@/h\�O?��\\\�VE��Jk�`ijܸ�:�\�zvF�;�N�:j�R�UV-^-Z�0͛7wB\���s�\�Z�l\�9�L[�n5\�^{m�_[��)�\�Y��\�.\Z\rHvWq~�`[�b�;.\�\�b�ź\��g�\�03�CQ�\�\�0�\��\�Y�\�Y�\�{|\�\���݀\��glo\�L�:5���?9y��\�}K!_מ�\�\��Z�\\\nZ��q\�9�׬Yc:w\�\�?l���L-��kg\�+͔�?A\r4������\n.===:س2�g�5\�N�B3x\�\�\�\�\�vS���vh�I)�]\�C���>��3%^]*2o\�<�\�JeΜ9N+VժU�pt��qg�����\�\�lٲ\�i���\�`\�\�\Z�\�܃���~�{_\�			\��}�M\�}t�^�v\���\�������g#�\��q��Mo\��\�\�\�\�\�\��B�ZL�C�º�(��\�C=��5�xi\�s�kf\����=��\�\Z�\�\�q�B\0%\�\�3\�g\���a\������MՅhO\�\�~���*8��ҞR��\n{l\�{�c\Z)p�\�j����=z����\�Y\�\�]{H)]JB\�N�:\�$�cж�Gk\�\�	?���{�	ĪT���s\�Ν�\�:���m�%\�\�tg�]\�\�S\ZaKA\�7.\�p�\�\�B���fo\�	���\n���e\�}H\�z�\�\�j:h\� 3a\�g_f*-�\�[N��f�\�r���9_|�Nܠ�,�\� l�Pll�\��#J3p\�r\�-��O�~�=��\�S� �3�VG\�;�moӦM\�x?*\�י\�\�Z�z���\��\�\n?ZM\�\�\�$ZLR\'�\�R���طj\�\�	O�k����յ(ju(lp�\�~�\�\�\�kc\�?\�)\��(\�}� \�\�Ԃ\�߿{Z+p{�oTH�\�YeWa\�\�;\�\�حݻwk�Q^�����F\�*����3���1\�\"���R�J)v̴i��`���}�\Z�\�YM���Q�C���j\�/�e�\r�_�\�\�.�A\�jq�Ϣ3{�*�\n?n���-[*\�]�8�p��Ԃ\��=\ZW�\�tS+م�t�\�\�\��\��\�O?]OM\0�˞<δǇ%v��Z�F�\�,����Z\�\�w\�ɶ�s\��e��\�B؂V�ݵs\�\�&��6m\����\�.ͿS��\�\�LC%�/l�Z�r\�E6`���{\�S�\�U\�]Z�0\nN\nCcƌq\�Xi,׌3\�����\�Gףs�3�m\�6�\�\�m\�\�\�S��D ~\rA(S\Z<�Y�54NuĈf�\��%\n\\\nZ6�y�\�\�\��{��M�,�M\�*�����IIIM\�BRZ�/_�V�R��\�Z\nX\Z�8\��9�4�Z\�\r|�\�\'NHR��\�F�\�mWXw���Ɨi���!ɿ�*�,.w`����vq\0(k���\�P%&&>i�3A9B3�պ�\�3\��KQ=\nj\��Z:\�<Nc0	[%�����Ν;\�\�Ύ,��M3m@hfo�(���%6|��-\�\Z�\�Ψ�z\�)g[�\�\�-\�\�\�\�\�VQ��Z�\�\�A�\ZL~\�����~\�2\�\�b�u����\0@�p� r\��96�|��\n\"S�N�b��\���%\�¥����1�E���Y����1Z~]�:\���.���K\�*�aÆ��\�s\�\�ذaõ�]�,�,X0\�\�ה\�\�?\�Xr\\\\\�����j\�\�Tdu��Ui��\�Z\�3\�\�j�R�a||�s�-���go�m۶yK=h\�S�p��\�\�f^\�\�\0�\���\�l���\�\n\"s\�}�\�[\�\�&&&\��0\�>�r�\�Ҳ6\Z8�\�ؚ�Ѹqc\'x\�T]�\nXZ�Tk�ْs\�\�)u#�3枴Anl�\�%a+\0\�\�҆|jٝ+:ȭ[�\�ƍ�\�\�\�o�o��a\���Ps�K3�tY\nX�>�\�9�����]\��R�_\���r������ ҷo\��X4m���\�\�I�f�%!�D�.\��V���E\�4F+ܖo)\�E1�3fZFF\���`\Z>|�Z���\�\�\0@��1��m���v\�ښ��NG\�\����nr�6QT\�ly\�\��\��AKh\�\n����n���\�M�V.\�\�\�%�iӦ\�k֬�\�\�\�w�\�\�\0s.¥�\�5{L�fCW�\�\��\��\�\�\�^\�\�ٍ\�\��a\�1g���.G]�B��5\�kz8,XJ\�*E\�a��#F�:t\�eZ�9P�\�\���7\�x��ݩ�+��?\0�c\�`o㬬�\�\�1��\�\�\�O\�\n��\'N\Z0`@\�K/��\��\�?_5-\\j\�Rвg	��N�:�Z��7�\��כ\�t\\]A\�޼\�.@\�\n�I�&}���x\�\�W_��w\�\�Q]�v�R\�A�o���\�U�Vi\���p��\0\�\�\�5�Jy��/r�,_������偾����\�^A\��Զ&w\�\�Q7�zk��p\�|돬�\�\��6f޼y\�\r\Zߺu\�\�E��̅\�?~|����&\Z�E\�!\0���\�\�D��_AD\�g\��>6]-\���EW�\���-k[�\�3�{m\�\�=|��\�cbbZ4k\�\�P��\�6j\�(�z�\�ut���\'OHMMMۼy�e˖Em۶�ivvv=���x<\0(C���\�m&�\�\Z[tA\�\�\���\�V[޵e�-�\�_:\�����\��\�\�\0a�\Z��sN0`@�\r6�^�~�;;C;�fg$آ%\�u	�/my��\�\�\0\0��\"^ADǱ���E-\\\��ך[3͹-^�\��K\��\���}�}\�Z\��}[��c]�JɤI��\�G\Zfg\0\0B[Q� �V�����e�-�l�\�\�^�\�\��\�U��_��1�톶�÷}}�-\�\0\08\�%\\AD�Xlia\��\�\��\�\�@���\�a\ny�\�\\��-\0\0P\Z�5Ė\�&�;Q�>\�\�jl\�_�\�\�2�c���\�\�/1���e���L\�\n\r�mٝon�o�\0 ��k�\�mՊ�%\�\�v\r�{\�_�}ϋ&��Q��4\�V[�m\�\�pO��ξ��5���+���9w��h�&~��\�wv��\0eѾ\�\�f�\��j\�R�\����j\rӚ\\=½�x|���\�S�\�Ԅ�E\�\��\�}?[�1�Sh�S�\0��F�_�\�Y�\�\�z��ھ��$sv|�۠��\ZX?ٖ\�m\�H\�B�\�_M�\�\�\�K��L\�L�Ӿ��[�3\0\0\0B�Bӛ�o\�]\�!\�\���|\�M�\�^\�+a{�G\�s[�~mr\�Q�u[\�\�Ӗc&w%]M�=nr[�X2\0\���پ\�C<wNE�\�V\�\��%\�,�\�T�~[f�\���L\�\0C\�\��Ȗ\�\��M�?�Z\0 l!\�nsvf�����SZQ\���\�N\�\�e���e\�\nFdd�7\'\'\'\�\�Re̾Zy�.5\�J\�\"<G]�\�۲\�wO\�\0U	F\\\\\��cǎ\�NHH�2\�\�ѣG5X�5��?ɣ\n�F!iZ���-�ȧ.yC��U�R�eiiiTD�x<Z*`	5�pG\�Vp\�4�W@_T�\��\�\�^SJW;o\�+�\�\Z�^��? \0233\�ڿ���\�W����B\�NrJJ��߽KU \�Ѳx\Z�1Wc\n�ڪ|�o�e�/Hm�}�_\�\�.�n- p\��\�o�^\�\�}��Qe())i�}�u\�\�i�\�.��tXY\�\�\�廯Y�G�=6�*�+33s`rr���t*����\�JII�ENNγ\�[@qw�\�_TD�\��ʢ&\�\�ҥ\���^��\�wi�\�Z�6mj��>$Q# l\�\��EE�\0ߌ��\�Ĺ:v\�(++���\r\�w\�ڕ\��z��\�JNJJ�p\�ƍ\�\��Ӷ�\�P% l%���\�����\�\�\�v\�\�ɫ��\�C۶m[gé�V\��P�\�#G\�~�\�w����\�)))�\�c�Z�h����`\�W\�&0\�\�\�ԥ�����l/[:\���\�G픘&i�\�\��GE\�QA�t\�\�\�6l��n]�.+\�Qk�=\�u�6\0�lЍ��a\�W\�b\�\0��(�\0�2q\�\�\�<���G�鞐�K��b\��\���]\�Ν�Q#\0@\�B�\Z?~����>p\�@{\�?_�1\\A�_Ӓ��\�Q\�b 2\0�=�z(�\�\�o�Nttt\�5k\�Q�\�U			u\�cTN	iƗ�wЬC\r�ת\�\�:d\r#\0 l�Ҍ����^v��-m3�A�j�%�\�`\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0a\��\'0_\�ˬ�\0\0\0\0IEND�B`�',NULL),('5',1,'菜单发布申请.bpmn20.xml','4','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"WF-00001\" isExecutable=\"true\">\n    <startEvent id=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" name=\"开始\"/>\n    <userTask id=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" name=\"请假申请\"/>\n    <sequenceFlow id=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" sourceRef=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" targetRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\"/>\n    <userTask id=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" name=\"审批\"/>\n    <sequenceFlow id=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" sourceRef=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" targetRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\"/>\n    <endEvent id=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" name=\"结束\"/>\n    <sequenceFlow id=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" sourceRef=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" targetRef=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_WF-00001\">\n    <bpmndi:BPMNPlane bpmnElement=\"WF-00001\" id=\"BPMNPlane_WF-00001\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\" id=\"BPMNShape_sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"80.0\" y=\"43.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\" id=\"BPMNShape_sid-088B9AF3-BC81-44A6-9050-2D3BD7624260\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"150.0\" y=\"18.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\" id=\"BPMNShape_sid-3DEE6090-EA44-4985-8E55-7F54DE52F177\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"317.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\" id=\"BPMNShape_sid-49B0731A-F3CD-4457-9A4F-B2406D65A025\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"525.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\" id=\"BPMNEdge_sid-00217348-05F4-43E6-BE5E-256B2D27F2A4\">\n        <omgdi:waypoint x=\"417.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"471.0\" y=\"68.0\"/>\n        <omgdi:waypoint x=\"525.0\" y=\"68.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\" id=\"BPMNEdge_sid-91246399-4B2E-4EC7-81B0-AE2426CC04B9\">\n        <omgdi:waypoint x=\"110.0\" y=\"58.0\"/>\n        <omgdi:waypoint x=\"150.0\" y=\"58.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\" id=\"BPMNEdge_sid-DE97870E-F7E2-494B-ACC1-BDA2C74C38F9\">\n        <omgdi:waypoint x=\"250.0\" y=\"56.20359281437126\"/>\n        <omgdi:waypoint x=\"317.0\" y=\"53.79640718562874\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('6',1,'菜单发布申请.WF-00001.png','4','�PNG\r\n\Z\n\0\0\0\rIHDR\0\03\0\0\0l\0\0\0�3\�\0\0VIDATx\�\�	l\�ǭ64H$\"iP۔��6�	BUJ�\�*E��h�*���\0\� oB��\�B����\r�(\"D��\�\�����\��+8\�;v�\�\���ь5�\�\�\�cvf��IO�yg\�Ͼ�����\��\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ��q\�ɓ\'\�\�ٳ\�\�\�\�\\#;;�\�rrr�\�۷.��G\0\0D�\n�\�\�B���¨��âd���FAA�%6��J\0\0�ЌB\�7��.;;�(^	\0\0ڵ��������W\0\0D�\�l \"|%f�\0\0�\�\�W_�\'��cΙc���5b\0:�a\�H�\�LuU�qh\�,\�`\�\�[L_\�}�\�\0t\01� ��s��\�@\�\�v��F|1\0F�0b$\�b\�\���݇_!f\0���F�Y\�\�\�hT\�\�>|\n1\0������M\0�\r1È�}S}�11���)|\0�!`�\�7Kv�٨�\�}��	\0F�0|\�K��C[\�\nmyM�\�S�&\001B��o��ڿ��_\�k��	\0�,	�3��Fɮ�\Zv1\�k��\�7����!`�\�7�^\��ο5꛺��.|\0�!`�\�7kk���<\�\�\�/7ꗶ\�1z,Y\Z|\0:��a\�\�/�y�lY\Z|\0�!`�\�7���i*K��\�\0\�A\�#F~�͖\n\��1|\0:��a\�\�\�B\�7����b\�7 #F�\���F�03�	\0��!` f0|3�ILL���!C\�:t�X�X��!vU\�\�˔\�=����!` f0|3v6l\�3b\�bu�xi�m�㓸z@���&�	QCIO$�#0\�0>>�!�&00��o��2dhBB\�Na���h��\�F^^�q�\�Y\��\�ˆr\�\����\�عs��x�b#99\�-h�\�\�\0#`\���&x)d��q\�)bV�\\iTTT͡��\�<^\�\�5�;Gqu���0�M|\�=#\�2�&M2�0-A\�7u\�T��!C\�7\�\�\\\\\\z\��\n\�ϟiܸq\�SRR\�,))\�\�/�P7cƌ�,X)�SF��7�M�+Z#\�\�ZJOO�\�Jj)\�5o\�<w�\�\�\\m���u\�֭�;w\��	&˖-3�\�\�c�^�z\��\0u�)��>�\��c�?�\�ĉO����\"``|\��!B&Ǚ�i��q\n\ZW����eD����\�+����P�q\�F�?\�ӦM�\n������A��71|3�\�\�\�\�\Z��v-5\�\�䬡��)z٘;6lؐ���\�7n�Hĸټy����Z\�,\r���ob�fL��l[hh�n{�z�j�3\�2���{ǎk?~�M>\�ӧO\"�jF�\Z�\"#`\���&D��\�.�\�\�\�ŋ\�E\�\�(\'װ\�\\}ь�\n�\�Kk.��\�\�\�5���A��71|3���(0\�k��f�\':�C\�L\�\�{�\�\�h\�R[ed\�eh�^�\�n\�K\�\�\�\'7����\�\�7�}�\�Z2F~~~���X\�!f6r��\�^\�<gΜ:��iO���jw#f0F��lO�\�ɓc�\�4�\��M|\��{Vb��.�u��~b\�W\�233\�\�QK׮]3ڛѣG�����A��83s�kZt]�w��>�&�	m&f\�կ\�l8vSô�\�g��Y�GF�_{���낐�!`0�p�\r�����\�NQ�o�\�Z�8��-(\�k6߇#��yA�e`љ}�\�5C�#%55�<Z\�\�\��\�F\� f�\"f�Inڿ�o\�3Ӓ%Kn{̔)S\�\�\�\�m��\�݋oF\��r�*�\�nZ\�n��j\�\�%3\�\�˗/7�d�\�\��U\�\�x\�\�\����A\�D\�HNN\�2|���\�\�\�\'$$�H��ŧ~.>��\�{\�7\�M�\�iq�XH\�\�e�G\��I����I�\�\�^.\�\��W3\�\�\r9��\�}����ذa���\�\�ݻ�=��\�V[�n��\��63z�۫V�j\�\�73Mef\Z�\�hw\�n��\����f&Fѵ�t�/ٵk\�\�hUw�{\�\r��A\��˶n\�j<�\�Sw�p\�*�\�we�C�����\�d\�O>\��\���\�\�MK\�d;R\�Eym�l_�#\��]\"�L\�]�\�֫\��u\�+;\"vB�T\�\�W*&Į[\�ϭ}\'\�o�޳K\�yV%\�zZ|W\�K��W�۲��\�\�$\�\�z�\�N���1���{�\�g\�\�k\�w\�t�;\�Ӑ�L�ϝ:u2�O�n�O�8a\n}�Ec͚5f�ȑ#�����\�ؿ?b1\�Թ�lN��|׮0�)F\�E#\�\�\�<3\�\�\�\�R�M\�%\�\�����\�\�\�ڟS�ؗb\�MyF\���b{Ŷ[3{n\�ᗚ\�Ь�؛��\�<�Y�Qa ��Y\�\�,�fS�=@�+�e��\�#�u���E8}[�1��f;�f�\�ƫS�JII\�$�}\�\�%���ȸp\�iv\�E\�ǎ3\����ș���\�{\���7m\�dn�g\�b���-kB\�\�[e=\�0\�L,��_ۋFz���h�!\�j]\�L1<N9R\��ݼ\'�]�*>V�XaTWW�\�kךm��\�ҥK\�\�{�\�ef`��{�\��\�}�Q|1\�dVF\�\�\�Ŏ4rO��K\nt`+�\�\�3\0\'%%\�d`�6\Z���1C��\�w�\�t75\�L�\�\�\�?^߅���j�5+3hР�\�\n�������ŏ\�֮\'|1㨏yD\�\�\��\�;+vAl����[\�\�\�k3\�(#F��\�uf����܇��}Zo��^�Е\�\����{�>��\�\�\�8p���\�ׯ��\�\���??�����\�\�̰��֜�M���4縠�� Q!�m�ͮ]�\��#>�\�8\�U�\�|�\�\�\�=\n1\��Čv\�\�=\�r.\�>��b��\��T\���C\��q\�\�7�{0�b\�l9盬�\�1cǎ��f\����f\���g\rA\�\�ʪ�����\���\�\�\���xݞ:u�>h`p�������\�=z\��t\�\��!`xGP\�\�O<\� 3ӭ[7c	���Q\�\�Jm�9s\�\�:t1\�bFܵv\�*�\�l\�\�},���#{�\�\�ugo�\�\��m�&M�\�fôU�O�<��3+\�\�y@2k֬�G3mٲ\�>ʹ[zc�\�u��ņ>��\�\�\��.#g����\\u�\�~�\�}��5�|\�f�\�3\�����Gz>\�LS\�\�\�̸����^���VӶ��^\�8\�9\�A\�Ď�љ�E��V�\�\\�X��\�\��\"6H�\�#\�����	\��\�z:\�\�\�\�[-hT\�̛7\�Y\'S��c��.�z�q��(\�36����\�\n\�\�\"I\�\�\\E���T{t��\�\�ҥK͢\�s\�\�\��4\�(v\�;3\�\�ג�!` fn\'f\�I�\�s�:��\�ӮTyb7Ο?��	��\���T�X#�Y\�%\�3��\�\�m�j;G |�\�\��v���]N�>WF�\�%��9s\�ǌ�3\0_MHH8\��\�n��]�7s�S\�n�����\�ݪX\�c_�u�x���S�j�P\�4=�w\�\�\rJS��m۶��|��\��8\�\�O\�h���a\�M$v\�\�6ҹ��kw�v+E�Lq\n\Z��Ѭ�\�[�;jI�}�52V\��4\�TQ@\�^�ʹe˖�A�\�F͌�\�QgLu֪\�]Fڥ�\�Lg7ӓO>i�+�5Qa�Ʀ9��Hχ���a�b\�F��O�0ך��\�)��v�H�\�\�\�s5�\�\�X\� NQ��\�\�\�z�u����ޫ3�j=\�o�a�1\�kW\r�f�R�KE��#G\�O�<��ٙ*q�\"V\�/fT�茨\�ִ�S<��t㬂H;3�sqh��]lgZ\"\�̴�|�\�L\�3߰f\�c\r�\�I\�\�ZV�\�\�\0��=�C�[h�\�\���P(T��\�\�\�\���;\ZbF�}���\�\�\�\�3����گ\�}�\�a\�\�il4S�Z�Hχ���A\�Ķ�IKK뤓ωM�f\��B��1-��v�<�����y�%j�G\"b4è%)\�\�\�Ԛ\�Ǐ������\r�܃�\\�!ft��휺=\�5\�ڙ9q\�ӟ_z\�%�5[܄3��i��!` f3�\'ft\�T٦�\�Ƚ��NB�K\�Zb\�\�\�߉\�\�\��]c�4�53�U\�\�\�\�,17��}}JRRRb(�RQQѦBF��wH`<�\�n�����]k�\�\�ٳ͟���11�]D:�\�\�ѣ\�}v\�ƹ��\�T���[{>\�b&v������w�͗��\�u�W�}$E����V\�V\Z\�Ȩ�	Zu�\���03�\�^h�\�64Zݝ��ti���_��(�jѢE\�XEa)���o\�\0\�)\�����\n�ʋ��j\"�Gf\�֭�E\�ru7���ob�&@숚�*jRRR*\�ϟxǎgJKK\�\�\�)u\�H]k)\'\'\�?�O\�Bu7���ob�&@�\�Ѫ�	|\�7���0�M|\0���0�M|\0��A��71|\0\�\��M\0 ``|\�\0 `0�M|\�\0 `0�M\�\0F��71|\0\�\�7\0|\�7\0|\�7���0�M|\0���0�M|\0��A��71|\0ܨ	�&�o\0#`�5�����\��\�u�\03b&�o\�^VQQ�_��JKK?\�<�W\0bC\�D@^^ޠ���/?�\�\Z|#z2999g\�\�\0���3\"�i�&���C�\r\�\�u?��\0\���\0\0@\� f\0\0\0 �a\�\0\0@�a\�#F\0\0\0\r#F1\0\0x1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\��hu\�\�m\�2\0\0\0\0IEND�B`�',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10002','WF-00001:1:7','10001','10001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:32:10.665','2018-06-09 23:32:10.692',27,''),('10003','WF-00001:1:7','10001','10001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10004',NULL,'请假申请','userTask',NULL,'2018-06-09 23:32:10.694',NULL,NULL,''),('10006','WF-00001:1:7','10005','10005','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:32:52.369','2018-06-09 23:32:52.369',0,''),('10007','WF-00001:1:7','10005','10005','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10008',NULL,'请假申请','userTask',NULL,'2018-06-09 23:32:52.369',NULL,NULL,''),('12503','WF-00001:1:7','12502','12502','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:34:01.400','2018-06-09 23:34:01.704',304,''),('12504','WF-00001:1:7','12501','12501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:34:01.400','2018-06-09 23:34:01.708',308,''),('12505','WF-00001:1:7','12502','12502','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12506',NULL,'请假申请','userTask',NULL,'2018-06-09 23:34:01.707',NULL,NULL,''),('12507','WF-00001:1:7','12501','12501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12508',NULL,'请假申请','userTask',NULL,'2018-06-09 23:34:01.711',NULL,NULL,''),('12510','WF-00001:1:7','12509','12509','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:35:29.994','2018-06-09 23:35:29.997',3,''),('12511','WF-00001:1:7','12509','12509','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12512',NULL,'请假申请','userTask',NULL,'2018-06-09 23:35:29.998',NULL,NULL,''),('15002','WF-00001:1:7','15001','15001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:37:28.899','2018-06-09 23:37:29.155',256,''),('15003','WF-00001:1:7','15001','15001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','15004',NULL,'请假申请','userTask',NULL,'2018-06-09 23:37:29.160',NULL,NULL,''),('17502','WF-00001:1:7','17501','17501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:38:32.816','2018-06-09 23:38:32.837',21,''),('17503','WF-00001:1:7','17501','17501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17504',NULL,'请假申请','userTask',NULL,'2018-06-09 23:38:32.838',NULL,NULL,''),('17506','WF-00001:1:7','17505','17505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:39:14.755','2018-06-09 23:39:14.772',17,''),('17507','WF-00001:1:7','17505','17505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17508',NULL,'请假申请','userTask',NULL,'2018-06-09 23:39:14.776',NULL,NULL,''),('17510','WF-00001:1:7','17509','17509','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:39:44.170','2018-06-09 23:39:44.172',2,''),('17511','WF-00001:1:7','17509','17509','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17512',NULL,'请假申请','userTask',NULL,'2018-06-09 23:39:44.173',NULL,NULL,''),('2502','WF-00001:1:7','2501','2501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:04:24.760','2018-06-09 23:04:24.769',9,''),('2503','WF-00001:1:7','2501','2501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2504',NULL,'请假申请','userTask',NULL,'2018-06-09 23:04:24.769',NULL,NULL,''),('2506','WF-00001:1:7','2505','2505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:06:25.753','2018-06-09 23:06:25.762',9,''),('2507','WF-00001:1:7','2505','2505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2508',NULL,'请假申请','userTask',NULL,'2018-06-09 23:06:25.763',NULL,NULL,''),('5002','WF-00001:1:7','5001','5001','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:26:52.279','2018-06-09 23:26:52.303',24,''),('5003','WF-00001:1:7','5001','5001','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','5004',NULL,'请假申请','userTask',NULL,'2018-06-09 23:26:52.304',NULL,NULL,''),('7502','WF-00001:1:7','7501','7501','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:29:13.575','2018-06-09 23:29:13.687',112,''),('7503','WF-00001:1:7','7501','7501','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7504',NULL,'请假申请','userTask',NULL,'2018-06-09 23:29:13.690',NULL,NULL,''),('7506','WF-00001:1:7','7505','7505','sid-C8F64A3F-D2FF-4A69-AFC7-83A0CD665C2F',NULL,NULL,'开始','startEvent',NULL,'2018-06-09 23:30:48.589','2018-06-09 23:30:48.595',6,''),('7507','WF-00001:1:7','7505','7505','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7508',NULL,'请假申请','userTask',NULL,'2018-06-09 23:30:48.596',NULL,NULL,'');
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
INSERT INTO `act_hi_taskinst` VALUES ('10004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10001','10001','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:32:10.702',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('10008','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','10005','10005','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:32:52.369',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12506','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12502','12502','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:34:01.719',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12501','12501','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:34:01.719',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12512','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','12509','12509','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:35:30.003',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('15004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','15001','15001','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:37:29.180',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17501','17501','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:38:32.939',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17505','17505','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:39:14.789',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17512','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','17509','17509','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:39:44.175',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('2504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2501','2501','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:04:24.808',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('2508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','2505','2505','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:06:25.770',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('5004','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','5001','5001','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:26:52.310',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7504','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7501','7501','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:29:13.718',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7508','WF-00001:1:7','sid-088B9AF3-BC81-44A6-9050-2D3BD7624260','7505','7505','请假申请',NULL,NULL,NULL,NULL,'2018-06-09 23:30:48.603',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_re_deployment` VALUES ('4','菜单发布申请',NULL,'','2018-06-09 14:47:54.024');
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
INSERT INTO `act_re_model` VALUES ('1',5,'菜单发布申请','菜单发布申请',NULL,'2018-06-09 14:45:58.640','2018-06-09 14:47:31.591',1,'{\"name\":\"菜单发布申请\",\"revision\":1,\"description\":\"菜单发布申请\"}',NULL,'2','3','');
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
INSERT INTO `act_re_procdef` VALUES ('WF-00001:1:7',1,'http://www.activiti.org/processdef',NULL,'WF-00001',1,'4','菜单发布申请.bpmn20.xml','菜单发布申请.WF-00001.png',NULL,0,1,1,'');
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
INSERT INTO `act_ru_task` VALUES ('10004',1,'10001','10001','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:32:10.694',NULL,NULL,1,'',NULL),('10008',1,'10005','10005','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:32:52.369',NULL,NULL,1,'',NULL),('12506',1,'12502','12502','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:34:01.709',NULL,NULL,1,'',NULL),('12508',1,'12501','12501','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:34:01.712',NULL,NULL,1,'',NULL),('12512',1,'12509','12509','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:35:29.999',NULL,NULL,1,'',NULL),('15004',1,'15001','15001','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:37:29.162',NULL,NULL,1,'',NULL),('17504',1,'17501','17501','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:38:32.838',NULL,NULL,1,'',NULL),('17508',1,'17505','17505','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:39:14.777',NULL,NULL,1,'',NULL),('17512',1,'17509','17509','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:39:44.173',NULL,NULL,1,'',NULL),('2504',1,'2501','2501','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:04:24.769',NULL,NULL,1,'',NULL),('2508',1,'2505','2505','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:06:25.763',NULL,NULL,1,'',NULL),('5004',1,'5001','5001','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:26:52.304',NULL,NULL,1,'',NULL),('7504',1,'7501','7501','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:29:13.691',NULL,NULL,1,'',NULL),('7508',1,'7505','7505','WF-00001:1:7','请假申请',NULL,NULL,'sid-088B9AF3-BC81-44A6-9050-2D3BD7624260',NULL,NULL,NULL,50,'2018-06-09 15:30:48.597',NULL,NULL,1,'',NULL);
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
