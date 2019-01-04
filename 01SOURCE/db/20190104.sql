-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: bootweb
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
INSERT INTO `act_ge_bytearray` VALUES ('10',1,'AnnouncementApply.WF-00001.png','8','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�1R\0\0�IDATx\�\�\�}��u�p�(Z\���zb��\�\�6\� ��\����\Zs��p�M3-�\�bz���\�؂\�)qkC\�\\\�U�_3�1ײG7\�Ԝ\�m}̧�L�\��:x�̜\�q�\���9�3cu\�\�u_\�w��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PK�$9c۶ms׭[�[ggg\�\�ޮ*\\ɪU��7�&�P��9�3���a�^�:\�\�\�N<�NS\�ݻ7Y�r\����\�*�V�!grP|\�װ��qloo\�,�V�!grP\�\"\�0��Ҧ}H>T�\�C\�\�(�8\�E�����ȇ��|ș��\�!\�ٓl��Oɗϔ*\�s\Z�\�Q>l\�\�L\�\0\�c�:�ow�i\�\��\�W�\\��\�{x�u9�3��دv~��\ZvV��\\�\�|x�u9�3��د6/aȦ�i�\�\�\�F]\�\�0<��M\�O\rٴ\�5Ͷ\�ã|ب˙��GM[Ӗ��39Yӎ�\Z�j\��f[\�\�Q>l\�\�L\�\0\�c�ں\�_�l\��f[\�\�Q>l\�\�L\�\0\�c��q�\�dӇm�w�\�\�k�m��G��Q�39��\�\�\�fj\��Fkx�u9�3��ؿ~�%\���\�U�>�i�\�\�F]\�\�0<\�\�\�e\�?y�Q�\�\�\�\�\�F]\�\�0<�}\�߳uY�\�K�8d\�\�*�\'�ק�\r��!r&g�\�q���}�/��(�!gr�\�p>\�\�ӿ\�[\�ã|ȇ�\�`x\�W#m\�Yi��=<ʇ|ș��G�iˇ|ș2<���-�)94mM[>\�CRrh\�\���J\�`�$���7���\�;+gΜ��\�ɇ����q\�\�%MMMG\�ﾃӧO\��\�/\�I\�\�c���-�)9�5���\�\�\��@:\�\�MkkZb\�I�7�o\�\�\�_�\��nch�7o\�\�g�}�Д)S�7\�x#Y�n]�{��7	񵻻;���ϓt�L|��#=�\���\'\�\�Դ5m��}H\�Y��\�;��V{Z��é\�\��7y�r\�!�\�\��\�G)\r��N�kÆ\r\�c�=v���u�m�\�v�wS\�ִ\�C>�!%g\�&\0��KN``,W�?뤳\�,Xv\��&.<��q�%K�$---=V!5mM[>\�CRrVM\Z\Z\Zƍ?���`ccc���\�\'˖-K��\�䧟~*\�3?��si�\�5k�Y�f%w\�y\���@aW!cp\\�b\�\'�&MJ�lْ��\�۷\'\� \�s\�=����jښ�|ȇ>�\�\n\�ߧ\�\�\��\�8gΜ\�axño߾\��\�\�\�\��\�,\�bY�8\�\�8\�7o�\�\�8q\�\�hښ�|ȇ>�\�\�t�8\�ǩS��VG\"~.\�0@g։ccW�h�8�[��뮻��o\�X\�մ5m��}H+-�q\�\�nkk\�\�5=R�K{ƌwa\���gU?�\�3\�\�SiѢE=���k\�W\�ִ\�C>�!ex��tp\�ȯ8�\�\�� �@���7s�����ѿ��kr�\���]v_kښ�|ȇ>����\�\�\�8\�]\�\�څ�?��g�Xu�\�8\�\�x*\�/�8h�Q\�ִ\�C>�!ex���؞\rvq�˩�\�{\�c�1\�\'ɜ\�%yNTKKKWwP�Ц�����-�)\�cesw�\�N��\����\�7q��\��\�\��|�\�7�J�5kֆ��O�[\�nohh�M[Ӗ�Ї�\�2�>z\��\����⋧z\�\���9\�Ľ�㖃���\�oO\�ЅEw�����i{x���3ex�\\�Wu\��+V�\�\'.$��w�\�Yg�\�ɇ�\�\�S\�ᱫ��;}Cw<\�}���!״\r��!r����\��\�[�\�G�D��\�N4����u����\�\�ފ��\�K\�\�^\�\��I)�\�5mã|ȇ�)\�\�\�\�:��\�ϣuy�c]�\'�\�\�\�7�t8ɛ�\�mi\�\�U�j)r&g\��U\��.�\�	&��\�cOOO��Ǿ�4\�y\�uםQ���\�ϟ�\\p�C��\�W_%6l�|��Z�T�O�����=��\�+\����~�\�qܬ {�\�\'�ȇ�\rY�\�\��r�裏z.\��w\�\�)gu�}���XyE�&M:X\�c����?;\����c��n\�\��x��\�E]\��\�իW�m\�1,Z�(nQY��x\�J\�͛Wz\�\�\�ex��|�\\����\�~\�^xar\�UW�G\�\��\�/���\�C��\�w\��\�F]\���$�w�\�Ǘ*\�c���o����u\�ƍ\�\�_o���ʵcGٓO>��\�g[/]���\n|��ڸ\���f]K\�c4\�+���Ԡ\��$\�{n2}����=pE1kȱ\�}�\���}�4�5���\�Yg��̜9�\�\�g�yf��㏗\�\�;\�B\��~\�q�VgWl\�?�\�3ã���\�\��\�?䇌��_6<Ɗb��\�^{-�\�KJY�˵\�s\��V��\��\�s\�l\�Q�\�K/�Y\�\�<���-*\�u\�~¯\�\�1�o��\��k1dM;8p��\�ٳg�=�\���\�c]\�c���\���\�c\�B��՞x��\�_�=\�a\��P|\�V�/^\\�\Z�Q��r{<\"s\�\�rx,wE\�V��\�s���z�w\�޲�\�\�Y�\�\�uG\�O<�w<��o�\�L\���\�)\�f��V�/_޷Ҙ}4\�\�m�eggg_\�\�c|�\�\�ܞpd�\�0�\r{<�\�\�\�>�\�\�饗�>@\�\�k\��=\�W\�m-ge�\�\�L|X\�V\r�\�\��#�\�\��Y���zv(EV�\�%g�\'\�0�\��*q�����#u��0u\�\���Խ��.]:��\��X�\�`8+��粕�x\��\�K�Fn8��|\\s\�5}�ߖ��\�\�Xu��\����.ÁY�%����\�\\}�եA0r+\�1H����c�{=ԐXnS\�\�{[���\���iӦ��\�\�tc�>�6�q��<\�?�]\�P�馛�\r�\�N�Ѵk;�0~\��8V�\�9\�~g\�f��I2���\�d+\��!g��<D���\�\�Ґ#?��:\�S<?��ؕ\�E\�\�rV�\�\���.VG�ę��\�\�H\�\"\��?봶�n�\�J�R_���1<V�pg\�u���]�\�q\�D\�\�\�\�\�c}�\�_���\��\�;/�2e\�q�y�ա8\�<\�ر��uӦM�!g}D�l�\��\�1\�\�>o����>�\�Y�Jg�\�\�p7u\�\�Q�lOdlڴi�󫎅�ub�|\�\�{�l\�rJ\��\�\�?cO:��\�\��:p�XM9vOf��+\�ܰ\r��3Hf+�+NR\��\�@��9z\\Z��\�I\r\�u \�Cβ\Z;vlr\�-��vY_{\�ɍ7\�\���4;s`#O�\�7\��[y,\������fhkk;\�2\�3f\�s<P�Y��������\�\�\�\�Qw\�\��Q:<찻����/�\�c~O@�o\�q�R� ��\�O�]o\��X�\�\�.\���ɝ$�4\�n���{�܊�|7g�u\����_nx��lcC?TV�u/�\�qt544�\�N�\�V G�;~n��cR\�Y����e\�ĉFk2VcpLY��l�\r\�)+Ǫj>^\�F�X}���hx<%+�\��2����hb�c�gU\�\�1�c�\n=\�\�T\�\�Դ��>�\�I�D�\�\�_�S쪎_��\Z5m��}H\�Y5\�:i\�\�1D\�\nu\\H<V�]ڱbw��\�_}�\�d	�\r��\��\�\�\�҉�����k���=\'r\�?��t��4u����iˇ|\�CJΪu\�\�_\�g�e\�)�\�\�\ZCdsss�̙3��裏v�\���\�zzz�\�^\���\�SO-N��m�F\�\�jM[Ӗ�Ї��\�¬st�<t\"C�Y\�8\�\�\�\�;\�\��!�M��\�_w\��\�6<\��ik\��!���3�hښ�|(ã�3@\�V�Ge�.grh\�\��l\�\�L\�\0ã2<��ȇ�\����iˇ|ș2<���-�)94mM[>�\�Q\��i+ã�Q�394mexT6\�r&g�\�Q�|ș��G\�RӖ��3ex4mM[>\�CRrhښ�|ȇ>�\�д�\�Q����2<*u9�3@\�V�G%r&g�\�Qi\��!r&g�G@\�ִ\�C>�!ex4mM[>\�CRrhښ�|(ã�3@\�V�Ge�.grԶ\�\�NͲz�7mڇ\�C\�J>\�L΀Z�j՞\�\�n\r�\nj�\�\���6\�\��j%r&g@-[�\�\�+V�\�~\�\�8O\�\'�h\�;ҺU>T�\�C\�\�(��Q�>���i쪈c]T\�+\��\�\�ڰ\�C>\�L\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��F\�qn1\\R�\0\0\0\0IEND�B`�',1),('2',3,'source',NULL,'{\"resourceId\":\"1\",\"properties\":{\"process_id\":\"WF-00001\",\"name\":\"公告申请流程\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\",\"properties\":{\"overrideid\":\"\",\"name\":\"开始\\n\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\"}],\"bounds\":{\"lowerRight\":{\"x\":75,\"y\":108},\"upperLeft\":{\"x\":45,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\",\"properties\":{\"overrideid\":\"\",\"name\":\"申请\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"/template/sys/workflow/announcement/apply\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\"}],\"bounds\":{\"lowerRight\":{\"x\":245,\"y\":133},\"upperLeft\":{\"x\":145,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":645,\"y\":107},\"upperLeft\":{\"x\":617,\"y\":79}},\"dockers\":[]},{\"resourceId\":\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\"}],\"bounds\":{\"lowerRight\":{\"x\":144.4296875,\"y\":93},\"upperLeft\":{\"x\":75.765625,\"y\":93}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\"}},{\"resourceId\":\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\",\"properties\":{\"overrideid\":\"\",\"name\":\"审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"/template/sys/workflow/announcement/aduit\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\"}],\"bounds\":{\"lowerRight\":{\"x\":381,\"y\":133},\"upperLeft\":{\"x\":281,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\",\"properties\":{\"overrideid\":\"\",\"name\":\"归档\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"/template/sys/workflow/announcement/complete\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\"}],\"bounds\":{\"lowerRight\":{\"x\":535,\"y\":133},\"upperLeft\":{\"x\":435,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\"}],\"bounds\":{\"lowerRight\":{\"x\":280.0625,\"y\":93},\"upperLeft\":{\"x\":245.9375,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\"}},{\"resourceId\":\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\"}],\"bounds\":{\"lowerRight\":{\"x\":434.671875,\"y\":93},\"upperLeft\":{\"x\":381.328125,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\"}},{\"resourceId\":\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\"}],\"bounds\":{\"lowerRight\":{\"x\":616.3125,\"y\":93},\"upperLeft\":{\"x\":535.046875,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('3',1,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0v^\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0�\�\0\0u0\0\0\�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0�\�\�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\�\0\0\��+\0\0IDATx\�\�\�	|U՝��\�eaK\0\�Dd+jв�V\�AEd�HG��j[(u��3��ŏ8G:��°k@T��RD�5�����$y��߼!�@�{o~\�\�\�|ޒ���\���s\�9\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�&�M��\�����\�\��oYYY����o:s\�LT~~>��lH�?22�dDD\�\�.L\�ҥ\�g\��\�q�\�\�Q�2���\'&\�\�\�\�lҤ����1u\�\�1���l�2ҊY*j���iRSS\�\�\�\�\�<{�\�\�^�z%�B|g\�@rG9p\�@\�޽{j޼�iڴ���\�((%%\�$\'\'�����u붌���\�8#΀�\�&@yV(Rj۶�iذ!J%О���\�;v\���\'Ι3\�\�\�\�q�\�\�Q���ܟ\�\n%::����\�:jRw�oRw.3\'�}f�O\�3��\Z_d4��\"\"\"�b�LMM\�=hР\�Ν{����\�8#΀�\�\�#��N\�бmz	��\n\�\�\�M։]&?\��\�\�\�=\����&\'�0�ԪU˴l\�2?,,\�/\�\�\�q�\�\�qt6�N\�бm\�I\���\�=\����9�/�\rXN�5kV\�\��ݰz�\�ۉ�%>�3\� ��\�\�2;:���mg/\�+��)(?�\Z5J��G��%>�3\� ��\�\����\�NI�yJ���5\'\�S�\r����\�\�\�q�7�\0e��\�lYT=\�\�\�CC\�n�\�8\�=�(3]Л�\�r@\���\�qF�$�p��\Z�J��/��\��\0q�\�.R���\�Q\��\�\�k��-����\�\�\0�[�G\�mM�7�~�F����\�\�\0�[�Kޅ����{\�4\��3\0$�p��g�[w\0\�:�󒟝9�\���-\�3 >�g\0Hn\�h)��B�aݿ�$\�\��M�Ʃ\�ԁ�\�\�Z�\��\�@�Tʝ���\�GV�Hi\�\�/��\�4�n\�m��%A| \�\0\\9znQ\���J0\�Y\��\�46 �A|�8@r\�\���\�\�\�e\��3\0W�a	(w�\�\'�@|�8P%\�\0\0\0\�-\0\0\0@r\0\0\0�\�\0\0\0�\�\�	e~�?*11�\�[�ly�ȑ#SRRjfff�rrr�\�\��שS\�B���GGG����\�^\�E8\0\0\074hP�\�\�ܾ!!!�\�ˎR�H�-%GJ�\�C[\�g�[0o޼C$�.Mj\�{\�\�&Lx�\�I_۶mM׮]\��\�_o$�5QQQFܐӧOG<x�URRR�͛7?>r\�\�gΜ�0}��*\0\0�\�\�W�\�\�Ͽ[�׈b>%�����<�\�\�\���\��\���\�\�%�u�\r6<��\�/����);\�t\�\��HK\�ҽ-	���\r��\�Gf\�С!۶mk�`��7��|ZZ\�\�/^�:\0\0�I$�ф�M�\�\�\�*�\�U�\�U~\�pIv��j�\�\�Vv�o��\��fͺ��0?�\�O�Mj/Ga)a�V��]�h\��aÆ=K/.\0\0p����\r\r}#??����\�;?�\�M\�ΝM�6mLݺuM�:uLvv�IOO7\�\�\�f\�ƍf�\�\�\��׺\���8p�{q]�\�jb�v\�\��k֬�ɨQ�\�\r7\�P�\�׫W/[c\�ĉ�\�/9cƌ�q8\0�*Nl�Hb;W\�0;�\�μ�={ZW���Y��U�6mj\��N+\���\�\�\�l����#�%�zW\�(Ip=ՙ\��\��\�v\�ҥ?y饗ʜ\�\�Z�haƏ_C�h�\���R\0\0�\n[��d\�Jl5a}\�Wt2Y��mq�GW?�\�\�yH6��oy-\�qur�cl�r\�3\�<S\�[Z��~��\�\��\�\�Z\0\0��\�۰��7\�\����n2\�ƍ�(A��=�~�v\�ܩ^\�u\\�\�\����Su�my�\��=�\�Z��\�\�;^\0\0�\��\�\��[\�}��\�1�e�\��{\�\�Y�(�Er[\�\�\�\�f\�r^:F�\"�\�ݻFLLL+�\'\0\0�ʤ\�}Ib{�>\�1����5�\rNp�\�w\��.^\�u\\�\�j�mRR\�c�\�Wxxx��{Ç�\'-���z�\�v|Q��]��8���\0q8&�s�<v�CJ���O�>��\�p/lwW�D�\�cǎ�\��]��}������t\�˂�=x��I\�4i\�\�L���\�t6fnn\�ŋgy\���^⩴\�y)>\Z7n�%\�@\\HH\�<�\�g\�g+$\�ީ\�qv��yATT\��U\�<&uϽ�\�^�\"\���棏>��	\�\�\\Ǖ��\�R��4T�v\�ڥ\�C?����B$\�ǲmK�ϑ\��O<�D�W��\�˗�\����%�\\o\�,\'�K\�1b�Y�v�����\��-���s��!\'\���ӧO7\�p�\�g~�_XkFj�2\�HEe�߯_�\�\�(S�Ք�\�\�#c�gK�.5\�S�\�O?��Y�n\�E\�\�}�\�&%%\�?~�{\�\�_����$2\�y�.�AWQ\�Zq}�\�ʞ\�#G�t\�[\�V�Ν;\���\�/��͓�Ɂ-e�XC�ϑ�p��~_�����\�\�\����\�\�ѣ���III�^�z\�\�O?�^�:u\�z|\�G�G�s]ll��\�\�x\�f߾}\�w5�\�\�\�0�g\�6;v\�0���juO@\�Jl��C%<\�ʉz���̍��ئ=�o��\�E\'�\�۷[��Vڛv\�m�Y=kݺu3>_�iTWX���\�\�$��8@\�\�\�\�R��\�n�3��1:Iy\�Νf׮]�\\	\�\��\�ɓ���%��t\�b���l\�b\�\�-�\�bM(�1c�\�˦�nx�~�X�\�~�眊��_r��\�sW���\�ZSO��u\�\�ڛб��Qv\"ӤI�L�`\��\�ԑ��	�f\�\�q��\�o��*{\0�V�\\+\r_�\�\�ty�D��\�\�רQ��gړ�裏rj��n�\'$F���Ȑ�X)�1\�\r�f\�\Z3r\�\�\�\�\�#���i�w\�n�\�\�Y\�!\�\�V\��ۏ.��\��REJy\\\�\��ƍ���\�y=\�\�q�\�7\�X\�;�\�X�J�>�\�\�Q\�\�믿64o���u�9{����\�?�q8~�x\"\�\����:\� ��hٲe�K\�\�:�Ln���i7ze�VrC	�\\	�q�8M?\���\�\�G/�9�F��,���G\�~�\�cbb\�F��\�|��\�f\�СVԿ\�gzG�|\�*+V�0YYY�v\�ڎ�[O�8a%aU��1�K|�\���\�\�\��\��w\�\�֣T*\�{{�\�\�1�V��\��y衇�\�ڛ�eժUVr���6m��\��\�\�\ZC:�a̘1\�U\0\�bH\�_Gb��<\�8\�uj�iC������\��J��F�\ZYc ��\�\Z���j�\�\�k=׫\r:\�\�\��\0�gU]��|�����\rHn��\��ʮ86lؠ\'T\�^\���\�4!�/\�;�\�n\�\�}\�\�.�\\�S�\'`��^\�\�۷��\�Ϭ�MvO�V :�_\�\�;w\�J�\�\�\��\�jb��0��r\�86>�7on%�zw\�{\�\�lX\�V>\\�ܾ��\�EǢ\�\�B��N�:YCN�>m% \�\�?s\"�\�G9j\�\��Э�\�j��\�ӣG�R}^X5e\��A�m\�6\�<�	��\���\�[\r+\'��p�U�\�\�Ky-�U],�\�\�Q�2�����K�R�	\�m�\�vbɒ%u��~كPiN@yҚ��\�\�e���[;��\�}\'��\\�*(\�����4��?��뮻\n\�\�˅zyP#\'\��\�����b�\�J�{#F�->�&0�0\����\�k\�\�\�n��\��L�f;�#%V4�]�p���iӦ�\�\\sM\�s�����\�8˗\�P�\�\�C:�PcF�Sm0oݺ���OHH�\Z\�:�H\�h�[i�kӫIN\�\��8sS���n%�\�x�\�7;;;�e�\�7�+�\�\�\�\�\�\�\���\�\��&���`��q^;�P\���\�0�2��[�0y\��\�\�q�.%���:\����;�o\�4��V\�\�5�\���*�\�.\�\�炗\�\�\��	\�4\r\Z4���^xa\\EǇnN=�J,D\�I�\�\�C:t�0\�\�\nY\�\�\�\rgM,lS�N�\��\�\�*%5���\"\�\�\�:*~��P7ƙ^��ᇭ�Iq�c{\�m���\Z\��\�<E�y�~���]�m���Thr��?8\\In���~H%Ԧ2�\�\�\�\�=ں�\�\���\�Y#���\�J)�b_#I�[�]Ag�\�=�w\�;y\�\�\�۷�\�{��=��t��M[\�՜\�B��Z�qu|h\�Gg�ۉ�.\�\�~�?�\�6\�`\Z���~�\�I�\'W�k���h8\�C\�\\g�9�4\�\�\�\�!^�\�,l��\�/\�\�\�\���~�\�x��\�\���C0�(d+\�m�V\�ڤ��6�;w��s���\�+��\Z|A\�)J\"�\�\�\�Kҳgϋ3��D0{X��X�Em�G9z�h�ѱ��OqߩFj{)>�\'��{\�)N�=�:���;\�^kOn\�q�\�D\�\�۴i\�%��+b_�D�\�yG\�v\�G\'��D\�\�~\�yL-[��(�x�*u\�Z9�5g���窊ܘ�B�\�\�\�6##\��t�\�\�\���9\�\�޽;\�\�ϋ���<$���\�,��1p�\�\�K?\�>���\\\'�\�87\�\�\�ˊ�\�mu\�\��Є#8q\�Z=�؉\�O>Y�3��`��i<�^�ښ�6l\�0�!dǉ=�ęz�\�w�6\�\�s���Ċ�\�\���Nf\�u��K�\�\�\�\�r���<\���ƌNd��9\�i�k^H\�%$�U`	{F�\Z�Ov�J�\�\\�\�\�\�J�\�£�\�U/I\�0YZ�K\�\�3RZ\�c�}����ws\��&5���_�\�8�����M|\�v[Q�\�\�2_v�\�BCi�{�ɋ&1\Z+\�\�B����\�~\�\�\n�B\�-E�\"�\�n�Nn�\'8������q=o޼CR\�$Hb\�]�\\k\�A�\��?�r\�Jm�ۉ\�:/\�:�����Z\���\�С���{o\�gϞ}�\�k^=�$�\'T��̕N\��Lm:	D\'U7\�)>.7\�D{s��6�u�\r=�?}!\�\�}�W۸\�w\�\�\n�t\\�M�uWMn�\�\�9�Vo���\�J�3\�\�=ԭ��3g.\�\�\�ک;�\"M�4I{m\�9rd�)\0\0�,�\�Ϗ��}�����qyMl\�忦L��\'9Na��Wr�P7�\�322|���\�\�������|ӦMHK\�Wn��9\0\0���\�һ N�<�\�	�&��(�>l_�\��R�\�\�\�Vǅ�?�W���\��֋�\��1q\�Ď���CZN\�rl\0��\�u�~�3�\�J<w\�\�e\r�\�!WC���?�!/11\�\�\�\�#��넺��;w��g^|�Ŭ�\��\�\�ѣG_���7Uv�\\-\0\0PU.\\�\�~e\'�ڃ;v\�X�tV�%\�\�I�lƌ\�c�+9��Z�\��\�!;�\����g�?~Z�~�\���\�S\�*\'����\�kq_}���\�?V�i�\0\0�j��Β\\GW\\�\ZRW\�\�X�h֡CkBk\�֭�\�<뒖:�@Z�A���-%�ܹsکi�\�\�z�\�x1\��y\�\�V̀6,Z�h�\�\�[�ݩS�\Z��z\�\�ի\�\�̙\�&77��ͽE\0\0\0N\�u$OyK�\��4\�ݼy�U�G�\��u:\�֫��\�KL`m��d\���4i҈���v���ǻt\�R�U�V�\�\�o�k\r�={���f2v\�ر{ݺua�w\�I�C\�k�[jj\�\\&�\0\0\�:=4בu�$�]� �[\'e�\�s�Gw�\�]cɠA��m۶�\�֭[�E^\�=\r�;_WҎ����ҵ\�>�2\�\�7h\0\0\0\�u����I�k\�:M��\�<�\�\�VSpK\�%\�%\��y��ӻ{\�\�\�\0\0@�\�q�l\0\0\0�\�\0\0�	�\�OJ�=�p\rɭ�]_̶��c\0\08\�\�b\��c)r�nR2�^�ث\�Kcn{J9 ����A﷖rc\�A\�(\�\�R�/�E�QR�9v\0\0�\�\�!e��R�Jix_\��t��))Rz\�gtU�>A�\�H\��G����\�s/\�\����gP\�\�\�+�|^w\�I)\�^�2:(P\0\0\0�DWA\�/Eoǫzq��7��\\๮��^ \�;(���\r\�EG���|\�00�o�0��{\��SYf\n��u���k)or\0\0�\�^\�ǥt�2]\�q)���\�Y핽\�=x5�ܪz\�a-�|x�W�Oy9ѫ.������K\� \�+)��|*\�a)�M��\�\�g��\�\0\0\0N���mRڙ�+\�jK ��:�\�1%��l/o(�$�כ\�F\�۾A?�_w��4ЂyRʻR\�J�!\�)ۋ�\�s\0\0�\r\�-;L���1ð�\�\��\�A�����z��Y �\�a�\'9�\'\�R\�\��`���΋�Yw�ݘ\�ɠ\�c�\�	)\�9�\0\0�Ch�v\�i����6C\r&}\�E�3\�g�\�\\�\�e\n&\��z+�k�-\�gt¿K\�x}((�3�=\0\0\\M;%��V\�\�f�\��\�k��~�<\"\�\�չF}In\�C{i�\�s�I�4�#8V\0\0�\�\�$��I�%ee\�f�D�o��UW~�WS\�K��HΧ�x:�h���^mxECS�\�ۚR|�7�`����\�!P���y\��\�X\0\0�\�^-�\�s�\���\���|69\��\�@�$�$�\�Z/\�ݵ\�\"����\���\�\�U׃k]$8\�8�\0\0�\�M`��\�[Q]6�W�\�æ\��ѳ��\�^\�gr|\0\0\0�_(�\0e�\�P~>w,v\�z\�\\\�n�\�8Hn\�8QQQ\�N�>͆p�S�N%\�\�V\�n�\�8Hn\�8\�\�\�\�222\�����K\�$pK|g\�@r\�\�\�\���#G�\\���l�������+,%>\��� Έ3�\��s�\�wo�\ne{JJ\n�\n%%%����ңG�\r\�\�\�q�\�rrr\'\'\'ggff�1�@zz������\�\�\�$>\�� Έ3�<��	P\�Ν{bȐ!O�<�PLLLTdd$�+�\�\�\�v!!!�\�ٳ\�:\�n�\�8Hn\�Hs\�\�\�;x�௏=\�WNpg���k\�#�\�$\'%%-NNN\�J�\�\�Wpk|g\�P^8\�Q\�V�Z\Z\Z:\�\��ujذ\�\r\Z\\\�D\�c㔑��\�\�\�ld���c\��`�^���x!>�3\� ��c\�\�\�w���#򴫔[�D�U\�LF\��#�,u�\r\�� Έ3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\��?l�\�D56�\�\0\0\0\0IEND�B`�',NULL),('5',1,'AnnouncementApply.bpmn20.xml','4','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"未定义\" isExecutable=\"true\">\n    <startEvent id=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" name=\"开始&#xa;\"/>\n    <userTask id=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" name=\"申请\" activiti:formKey=\"/template/sys/workflow/announcement/apply\"/>\n    <endEvent id=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\" name=\"结束\"/>\n    <sequenceFlow id=\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\" sourceRef=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" targetRef=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\"/>\n    <userTask id=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" name=\"审批\" activiti:formKey=\"/template/sys/workflow/announcement/aduit\"/>\n    <userTask id=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" name=\"归档\" activiti:formKey=\"/template/sys/workflow/announcement/complete\"/>\n    <sequenceFlow id=\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\" sourceRef=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" targetRef=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\"/>\n    <sequenceFlow id=\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\" sourceRef=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" targetRef=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\"/>\n    <sequenceFlow id=\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\" sourceRef=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" targetRef=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_未定义\">\n    <bpmndi:BPMNPlane bpmnElement=\"未定义\" id=\"BPMNPlane_未定义\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" id=\"BPMNShape_sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"78.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" id=\"BPMNShape_sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\" id=\"BPMNShape_sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"617.0\" y=\"79.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" id=\"BPMNShape_sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"281.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" id=\"BPMNShape_sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"435.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\" id=\"BPMNEdge_sid-7694345E-2826-41A3-AD23-456716E9AC4C\">\n        <omgdi:waypoint x=\"75.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"145.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\" id=\"BPMNEdge_sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\">\n        <omgdi:waypoint x=\"381.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"435.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\" id=\"BPMNEdge_sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\">\n        <omgdi:waypoint x=\"535.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"617.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\" id=\"BPMNEdge_sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\">\n        <omgdi:waypoint x=\"245.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"281.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('6',1,'AnnouncementApply.未定义.png','4','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�1R\0\0�IDATx\�\�\�}��u�p�(Z\���zb��\�\�6\� ��\����\Zs��p�M3-�\�bz���\�؂\�)qkC\�\\\�U�_3�1ײG7\�Ԝ\�m}̧�L�\��:x�̜\�q�\���9�3cu\�\�u_\�w��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PK�$9c۶ms׭[�[ggg\�\�ޮ*\\ɪU��7�&�P��9�3���a�^�:\�\�\�N<�NS\�ݻ7Y�r\����\�*�V�!grP|\�װ��qloo\�,�V�!grP\�\"\�0��Ҧ}H>T�\�C\�\�(�8\�E�����ȇ��|ș��\�!\�ٓl��Oɗϔ*\�s\Z�\�Q>l\�\�L\�\0\�c�:�ow�i\�\��\�W�\\��\�{x�u9�3��دv~��\ZvV��\\�\�|x�u9�3��د6/aȦ�i�\�\�\�F]\�\�0<��M\�O\rٴ\�5Ͷ\�ã|ب˙��GM[Ӗ��39Yӎ�\Z�j\��f[\�\�Q>l\�\�L\�\0\�c�ں\�_�l\��f[\�\�Q>l\�\�L\�\0\�c��q�\�dӇm�w�\�\�k�m��G��Q�39��\�\�\�fj\��Fkx�u9�3��ؿ~�%\���\�U�>�i�\�\�F]\�\�0<\�\�\�e\�?y�Q�\�\�\�\�\�F]\�\�0<�}\�߳uY�\�K�8d\�\�*�\'�ק�\r��!r&g�\�q���}�/��(�!gr�\�p>\�\�ӿ\�[\�ã|ȇ�\�`x\�W#m\�Yi��=<ʇ|ș��G�iˇ|ș2<���-�)94mM[>\�CRrh\�\���J\�`�$���7���\�;+gΜ��\�ɇ����q\�\�%MMMG\�ﾃӧO\��\�/\�I\�\�c���-�)9�5���\�\�\��@:\�\�MkkZb\�I�7�o\�\�\�_�\��nch�7o\�\�g�}�Д)S�7\�x#Y�n]�{��7	񵻻;���ϓt�L|��#=�\���\'\�\�Դ5m��}H\�Y��\�;��V{Z��é\�\��7y�r\�!�\�\��\�G)\r��N�kÆ\r\�c�=v���u�m�\�v�wS\�ִ\�C>�!%g\�&\0��KN``,W�?뤳\�,Xv\��&.<��q�%K�$---=V!5mM[>\�CRrVM\Z\Z\Zƍ?���`ccc���\�\'˖-K��\�䧟~*\�3?��si�\�5k�Y�f%w\�y\���@aW!cp\\�b\�\'�&MJ�lْ��\�۷\'\� \�s\�=����jښ�|ȇ>�\�\n\�ߧ\�\�\��\�8gΜ\�axño߾\��\�\�\�\��\�,\�bY�8\�\�8\�7o�\�\�8q\�\�hښ�|ȇ>�\�\�t�8\�ǩS��VG\"~.\�0@g։ccW�h�8�[��뮻��o\�X\�մ5m��}H+-�q\�\�nkk\�\�5=R�K{ƌwa\���gU?�\�3\�\�SiѢE=���k\�W\�ִ\�C>�!ex��tp\�ȯ8�\�\�� �@���7s�����ѿ��kr�\���]v_kښ�|ȇ>����\�\�\�8\�]\�\�څ�?��g�Xu�\�8\�\�x*\�/�8h�Q\�ִ\�C>�!ex���؞\rvq�˩�\�{\�c�1\�\'ɜ\�%yNTKKKWwP�Ц�����-�)\�cesw�\�N��\����\�7q��\��\�\��|�\�7�J�5kֆ��O�[\�nohh�M[Ӗ�Ї�\�2�>z\��\����⋧z\�\���9\�Ľ�㖃���\�oO\�ЅEw�����i{x���3ex�\\�Wu\��+V�\�\'.$��w�\�Yg�\�ɇ�\�\�S\�ᱫ��;}Cw<\�}���!״\r��!r����\��\�[�\�G�D��\�N4����u����\�\�ފ��\�K\�\�^\�\��I)�\�5mã|ȇ�)\�\�\�\�:��\�ϣuy�c]�\'�\�\�\�7�t8ɛ�\�mi\�\�U�j)r&g\��U\��.�\�	&��\�cOOO��Ǿ�4\�y\�uםQ���\�ϟ�\\p�C��\�W_%6l�|��Z�T�O�����=��\�+\����~�\�qܬ {�\�\'�ȇ�\rY�\�\��r�裏z.\��w\�\�)gu�}���XyE�&M:X\�c����?;\����c��n\�\��x��\�E]\��\�իW�m\�1,Z�(nQY��x\�J\�͛Wz\�\�\�ex��|�\\����\�~\�^xar\�UW�G\�\��\�/���\�C��\�w\��\�F]\���$�w�\�Ǘ*\�c���o����u\�ƍ\�\�_o���ʵcGٓO>��\�g[/]���\n|��ڸ\���f]K\�c4\�+���Ԡ\��$\�{n2}����=pE1kȱ\�}�\���}�4�5���\�Yg��̜9�\�\�g�yf��㏗\�\�;\�B\��~\�q�VgWl\�?�\�3ã���\�\��\�?䇌��_6<Ɗb��\�^{-�\�KJY�˵\�s\��V��\��\�s\�l\�Q�\�K/�Y\�\�<���-*\�u\�~¯\�\�1�o��\��k1dM;8p��\�ٳg�=�\���\�c]\�c���\���\�c\�B��՞x��\�_�=\�a\��P|\�V�/^\\�\Z�Q��r{<\"s\�\�rx,wE\�V��\�s���z�w\�޲�\�\�Y�\�\�uG\�O<�w<��o�\�L\���\�)\�f��V�/_޷Ҙ}4\�\�m�eggg_\�\�c|�\�\�ܞpd�\�0�\r{<�\�\�\�>�\�\�饗�>@\�\�k\��=\�W\�m-ge�\�\�L|X\�V\r�\�\��#�\�\��Y���zv(EV�\�%g�\'\�0�\��*q�����#u��0u\�\���Խ��.]:��\��X�\�`8+��粕�x\��\�K�Fn8��|\\s\�5}�ߖ��\�\�Xu��\����.ÁY�%����\�\\}�եA0r+\�1H����c�{=ԐXnS\�\�{[���\���iӦ��\�\�tc�>�6�q��<\�?�]\�P�馛�\r�\�N�Ѵk;�0~\��8V�\�9\�~g\�f��I2���\�d+\��!g��<D���\�\�Ґ#?��:\�S<?��ؕ\�E\�\�rV�\�\���.VG�ę��\�\�H\�\"\��?봶�n�\�J�R_���1<V�pg\�u���]�\�q\�D\�\�\�\�\�c}�\�_���\��\�;/�2e\�q�y�ա8\�<\�ر��uӦM�!g}D�l�\��\�1\�\�>o����>�\�Y�Jg�\�\�p7u\�\�Q�lOdlڴi�󫎅�ub�|\�\�{�l\�rJ\��\�\�?cO:��\�\��:p�XM9vOf��+\�ܰ\r��3Hf+�+NR\��\�@��9z\\Z��\�I\r\�u \�Cβ\Z;vlr\�-��vY_{\�ɍ7\�\���4;s`#O�\�7\��[y,\������fhkk;\�2\�3f\�s<P�Y��������\�\�\�\�Qw\�\��Q:<찻����/�\�c~O@�o\�q�R� ��\�O�]o\��X�\�\�.\���ɝ$�4\�n���{�܊�|7g�u\����_nx��lcC?TV�u/�\�qt544�\�N�\�V G�;~n��cR\�Y����e\�ĉFk2VcpLY��l�\r\�)+Ǫj>^\�F�X}���hx<%+�\��2����hb�c�gU\�\�1�c�\n=\�\�T\�\�Դ��>�\�I�D�\�\�_�S쪎_��\Z5m��}H\�Y5\�:i\�\�1D\�\nu\\H<V�]ڱbw��\�_}�\�d	�\r��\��\�\�\�҉�����k���=\'r\�?��t��4u����iˇ|\�CJΪu\�\�_\�g�e\�)�\�\�\ZCdsss�̙3��裏v�\���\�zzz�\�^\���\�SO-N��m�F\�\�jM[Ӗ�Ї��\�¬st�<t\"C�Y\�8\�\�\�\�;\�\��!�M��\�_w\��\�6<\��ik\��!���3�hښ�|(ã�3@\�V�Ge�.grh\�\��l\�\�L\�\0ã2<��ȇ�\����iˇ|ș2<���-�)94mM[>�\�Q\��i+ã�Q�394mexT6\�r&g�\�Q�|ș��G\�RӖ��3ex4mM[>\�CRrhښ�|ȇ>�\�д�\�Q����2<*u9�3@\�V�G%r&g�\�Qi\��!r&g�G@\�ִ\�C>�!ex4mM[>\�CRrhښ�|(ã�3@\�V�Ge�.grԶ\�\�NͲz�7mڇ\�C\�J>\�L΀Z�j՞\�\�n\r�\nj�\�\���6\�\��j%r&g@-[�\�\�+V�\�~\�\�8O\�\'�h\�;ҺU>T�\�C\�\�(��Q�>���i쪈c]T\�+\��\�\�ڰ\�C>\�L\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��F\�qn1\\R�\0\0\0\0IEND�B`�',1),('9',1,'AnnouncementApply.bpmn20.xml','8','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"WF-00001\" name=\"公告申请流程\" isExecutable=\"true\">\n    <startEvent id=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" name=\"开始&#xa;\"/>\n    <userTask id=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" name=\"申请\" activiti:formKey=\"/template/sys/workflow/announcement/apply\"/>\n    <endEvent id=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\" name=\"结束\"/>\n    <sequenceFlow id=\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\" sourceRef=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" targetRef=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\"/>\n    <userTask id=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" name=\"审批\" activiti:formKey=\"/template/sys/workflow/announcement/aduit\"/>\n    <userTask id=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" name=\"归档\" activiti:formKey=\"/template/sys/workflow/announcement/complete\"/>\n    <sequenceFlow id=\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\" sourceRef=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" targetRef=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\"/>\n    <sequenceFlow id=\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\" sourceRef=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" targetRef=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\"/>\n    <sequenceFlow id=\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\" sourceRef=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" targetRef=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_WF-00001\">\n    <bpmndi:BPMNPlane bpmnElement=\"WF-00001\" id=\"BPMNPlane_WF-00001\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" id=\"BPMNShape_sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"78.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" id=\"BPMNShape_sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\" id=\"BPMNShape_sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"617.0\" y=\"79.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" id=\"BPMNShape_sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"281.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" id=\"BPMNShape_sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"435.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\" id=\"BPMNEdge_sid-7694345E-2826-41A3-AD23-456716E9AC4C\">\n        <omgdi:waypoint x=\"75.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"145.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\" id=\"BPMNEdge_sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\">\n        <omgdi:waypoint x=\"381.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"435.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\" id=\"BPMNEdge_sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\">\n        <omgdi:waypoint x=\"535.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"617.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\" id=\"BPMNEdge_sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\">\n        <omgdi:waypoint x=\"245.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"281.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
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
INSERT INTO `act_ge_property` VALUES ('next.dbid','42501',18),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10002','WF-00001:1:11','10001','10001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-13 22:50:00.859','2018-10-13 22:50:00.880',21,''),('10003','WF-00001:1:11','10001','10001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','10004',NULL,'申请','userTask',NULL,'2018-10-13 22:50:00.881','2018-10-13 22:50:34.096',33215,''),('10005','WF-00001:1:11','10001','10001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','10006',NULL,'申请','userTask',NULL,'2018-10-13 22:50:34.104','2018-10-13 23:02:11.789',697685,''),('12501','WF-00001:1:11','10001','10001','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12502',NULL,'审批','userTask',NULL,'2018-10-13 23:02:12.173','2018-10-13 23:02:28.761',16588,''),('12503','WF-00001:1:11','10001','10001','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12504',NULL,'归档','userTask',NULL,'2018-10-13 23:02:28.762','2018-10-13 23:03:13.929',45167,''),('12505','WF-00001:1:11','10001','10001','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12506',NULL,'审批','userTask',NULL,'2018-10-13 23:03:13.930','2018-10-13 23:03:52.495',38565,''),('12509','WF-00001:1:11','10001','12507','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12510',NULL,'申请','userTask',NULL,'2018-10-13 23:03:52.487',NULL,NULL,''),('12511','WF-00001:1:11','10001','12508','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12512',NULL,'归档','userTask',NULL,'2018-10-13 23:03:52.496',NULL,NULL,''),('12514','WF-00001:1:11','12513','12513','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-13 23:05:22.368','2018-10-13 23:05:22.371',3,''),('12515','WF-00001:1:11','12513','12513','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12516',NULL,'申请','userTask',NULL,'2018-10-13 23:05:22.372','2018-10-13 23:06:02.549',40177,''),('12517','WF-00001:1:11','12513','12513','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12518',NULL,'审批','userTask',NULL,'2018-10-13 23:06:02.550','2018-10-13 23:06:18.315',15765,''),('12519','WF-00001:1:11','12513','12513','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12520',NULL,'归档','userTask',NULL,'2018-10-13 23:06:18.316','2018-10-13 23:06:35.512',17196,''),('12521','WF-00001:1:11','12513','12513','sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B',NULL,NULL,'结束','endEvent',NULL,'2018-10-13 23:06:35.512','2018-10-13 23:06:35.513',1,''),('13','WF-00001:1:11','12','12','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-12 22:30:07.884','2018-10-12 22:30:07.915',31,''),('14','WF-00001:1:11','12','12','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15',NULL,'申请','userTask',NULL,'2018-10-12 22:30:07.916','2018-10-12 23:20:44.359',3036443,''),('15002','WF-00001:1:11','15001','15001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 11:18:20.199','2018-10-14 11:18:20.232',33,''),('15003','WF-00001:1:11','15001','15001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15004',NULL,'申请','userTask',NULL,'2018-10-14 11:18:20.233','2018-10-14 11:21:03.788',163555,''),('15005','WF-00001:1:11','15001','15001','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','15006',NULL,'审批','userTask',NULL,'2018-10-14 11:21:03.793','2018-10-14 11:22:03.702',59909,''),('15007','WF-00001:1:11','15001','15001','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','15008',NULL,'归档','userTask',NULL,'2018-10-14 11:22:03.705','2018-10-14 11:22:42.075',38370,''),('15009','WF-00001:1:11','15001','15001','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','15010',NULL,'审批','userTask',NULL,'2018-10-14 11:22:42.075','2018-10-14 11:23:47.459',65384,''),('15013','WF-00001:1:11','15001','15011','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15014',NULL,'申请','userTask',NULL,'2018-10-14 11:23:47.452',NULL,NULL,''),('15015','WF-00001:1:11','15001','15012','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','15016',NULL,'归档','userTask',NULL,'2018-10-14 11:23:47.459',NULL,NULL,''),('17502','WF-00001:1:11','17501','17501','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 11:31:33.910','2018-10-14 11:31:33.945',35,''),('17503','WF-00001:1:11','17501','17501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17504',NULL,'申请','userTask',NULL,'2018-10-14 11:31:33.946','2018-10-14 11:31:59.468',25522,''),('17505','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17506',NULL,'审批','userTask',NULL,'2018-10-14 11:31:59.469','2018-10-14 11:34:55.899',176430,''),('17507','WF-00001:1:11','17501','17501','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','17508',NULL,'归档','userTask',NULL,'2018-10-14 11:34:55.900','2018-10-14 11:35:37.829',41929,''),('17509','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17510',NULL,'审批','userTask',NULL,'2018-10-14 11:35:37.829','2018-10-14 11:42:23.164',405335,''),('20001','WF-00001:1:11','17501','17501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20002',NULL,'申请','userTask',NULL,'2018-10-14 11:42:23.243','2018-10-14 11:42:51.048',27805,''),('20003','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','20004',NULL,'审批','userTask',NULL,'2018-10-14 11:42:51.049','2018-10-14 11:42:53.704',2655,''),('20005','WF-00001:1:11','17501','17501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20006',NULL,'申请','userTask',NULL,'2018-10-14 11:42:53.707','2018-10-14 11:42:55.803',2096,''),('20007','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','20008',NULL,'审批','userTask',NULL,'2018-10-14 11:42:55.804','2018-10-14 11:42:56.627',823,''),('20009','WF-00001:1:11','17501','17501','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','20010',NULL,'归档','userTask',NULL,'2018-10-14 11:42:56.628','2018-10-14 11:42:58.174',1546,''),('20011','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','20012',NULL,'审批','userTask',NULL,'2018-10-14 11:42:58.176','2018-10-14 11:43:01.964',3788,''),('20015','WF-00001:1:11','17501','20013','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20016',NULL,'申请','userTask',NULL,'2018-10-14 11:43:01.957',NULL,NULL,''),('20017','WF-00001:1:11','17501','20014','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','20018',NULL,'归档','userTask',NULL,'2018-10-14 11:43:01.964',NULL,NULL,''),('20020','WF-00001:1:11','20019','20019','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 11:43:41.673','2018-10-14 11:43:41.679',6,''),('20021','WF-00001:1:11','20019','20019','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20022',NULL,'申请','userTask',NULL,'2018-10-14 11:43:41.680',NULL,NULL,''),('20024','WF-00001:1:11','20023','20023','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 11:44:02.268','2018-10-14 11:44:02.271',3,''),('20025','WF-00001:1:11','20023','20023','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20026',NULL,'申请','userTask',NULL,'2018-10-14 11:44:02.271',NULL,NULL,''),('20028','WF-00001:1:11','20027','20027','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 11:44:45.591','2018-10-14 11:44:45.593',2,''),('20029','WF-00001:1:11','20027','20027','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20030',NULL,'申请','userTask',NULL,'2018-10-14 11:44:45.594',NULL,NULL,''),('22502','WF-00001:1:11','22501','22501','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 11:51:10.002','2018-10-14 11:51:10.022',20,''),('22503','WF-00001:1:11','22501','22501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','22504',NULL,'申请','userTask',NULL,'2018-10-14 11:51:10.023','2018-10-14 11:53:13.156',123133,''),('22505','WF-00001:1:11','22501','22501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','22506',NULL,'审批','userTask',NULL,'2018-10-14 11:53:13.157','2018-10-14 11:53:13.998',841,''),('22507','WF-00001:1:11','22501','22501','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','22508',NULL,'归档','userTask',NULL,'2018-10-14 11:53:13.999','2018-10-14 11:53:16.566',2567,''),('22509','WF-00001:1:11','22501','22501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','22510',NULL,'审批','userTask',NULL,'2018-10-14 11:53:16.568','2018-10-14 11:53:18.375',1807,''),('22513','WF-00001:1:11','22501','22511','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','22514',NULL,'申请','userTask',NULL,'2018-10-14 11:53:18.367',NULL,NULL,''),('22515','WF-00001:1:11','22501','22512','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','22516',NULL,'归档','userTask',NULL,'2018-10-14 11:53:18.375',NULL,NULL,''),('25002','WF-00001:1:11','25001','25001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:00:07.225','2018-10-14 12:00:07.250',25,''),('25003','WF-00001:1:11','25001','25001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25004',NULL,'申请','userTask',NULL,'2018-10-14 12:00:07.251',NULL,NULL,''),('25006','WF-00001:1:11','25005','25005','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:00:25.506','2018-10-14 12:00:25.511',5,''),('25007','WF-00001:1:11','25005','25005','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25008',NULL,'申请','userTask',NULL,'2018-10-14 12:00:25.512','2018-10-14 12:07:27.778',422266,''),('2501','WF-00001:1:11','12','12','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','2502',NULL,'审批','userTask',NULL,'2018-10-12 23:20:44.381','2018-10-12 23:24:19.525',215144,''),('27501','WF-00001:1:11','25005','25005','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','27502',NULL,'审批','userTask',NULL,'2018-10-14 12:07:27.816','2018-10-14 17:23:04.880',18937064,''),('30002','WF-00001:1:11','30001','30001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:10:05.286','2018-10-14 12:10:05.459',173,''),('30003','WF-00001:1:11','30001','30001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30004',NULL,'申请','userTask',NULL,'2018-10-14 12:10:05.465',NULL,NULL,''),('30006','WF-00001:1:11','30005','30005','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:10:30.696','2018-10-14 12:10:30.700',4,''),('30007','WF-00001:1:11','30005','30005','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30008',NULL,'申请','userTask',NULL,'2018-10-14 12:10:30.701',NULL,NULL,''),('30010','WF-00001:1:11','30009','30009','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:12:39.461','2018-10-14 12:12:39.465',4,''),('30011','WF-00001:1:11','30009','30009','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30012',NULL,'申请','userTask',NULL,'2018-10-14 12:12:39.465',NULL,NULL,''),('30014','WF-00001:1:11','30013','30013','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:20:00.042','2018-10-14 12:20:00.045',3,''),('30015','WF-00001:1:11','30013','30013','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30016',NULL,'申请','userTask',NULL,'2018-10-14 12:20:00.045',NULL,NULL,''),('32504','WF-00001:1:11','32501','32501','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:21:48.615','2018-10-14 12:21:48.646',31,''),('32505','WF-00001:1:11','32502','32502','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:21:48.615','2018-10-14 12:21:48.646',31,''),('32506','WF-00001:1:11','32503','32503','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:21:48.615','2018-10-14 12:21:48.646',31,''),('32507','WF-00001:1:11','32503','32503','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32508',NULL,'申请','userTask',NULL,'2018-10-14 12:21:48.646',NULL,NULL,''),('32509','WF-00001:1:11','32501','32501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32510',NULL,'申请','userTask',NULL,'2018-10-14 12:21:48.646',NULL,NULL,''),('32511','WF-00001:1:11','32502','32502','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32512',NULL,'申请','userTask',NULL,'2018-10-14 12:21:48.646',NULL,NULL,''),('32514','WF-00001:1:11','32513','32513','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 12:21:59.055','2018-10-14 12:21:59.058',3,''),('32515','WF-00001:1:11','32513','32513','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32516',NULL,'申请','userTask',NULL,'2018-10-14 12:21:59.058',NULL,NULL,''),('32517','WF-00001:1:11','25005','25005','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32518',NULL,'归档','userTask',NULL,'2018-10-14 17:23:04.880','2018-10-14 17:23:07.848',2968,''),('32519','WF-00001:1:11','25005','25005','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32520',NULL,'审批','userTask',NULL,'2018-10-14 17:23:07.848','2018-10-14 17:23:13.094',5246,''),('32523','WF-00001:1:11','25005','32521','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32524',NULL,'申请','userTask',NULL,'2018-10-14 17:23:12.905',NULL,NULL,''),('32525','WF-00001:1:11','25005','32522','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32526',NULL,'归档','userTask',NULL,'2018-10-14 17:23:13.095',NULL,NULL,''),('32528','WF-00001:1:11','32527','32527','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 17:32:56.169','2018-10-14 17:32:56.173',4,''),('32529','WF-00001:1:11','32527','32527','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32530',NULL,'申请','userTask',NULL,'2018-10-14 17:32:56.174',NULL,NULL,''),('32532','WF-00001:1:11','32531','32531','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 17:33:14.961','2018-10-14 17:33:14.964',3,''),('32533','WF-00001:1:11','32531','32531','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32534',NULL,'申请','userTask',NULL,'2018-10-14 17:33:14.965','2018-10-14 18:37:22.833',3847868,''),('32536','WF-00001:1:11','32535','32535','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 17:33:44.768','2018-10-14 17:33:44.772',4,''),('32537','WF-00001:1:11','32535','32535','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32538',NULL,'申请','userTask',NULL,'2018-10-14 17:33:44.773','2018-10-14 18:33:30.363',3585590,''),('32540','WF-00001:1:11','32539','32539','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 17:33:47.233','2018-10-14 17:33:47.237',4,''),('32541','WF-00001:1:11','32539','32539','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32542',NULL,'申请','userTask',NULL,'2018-10-14 17:33:47.237','2018-10-14 18:22:00.918',2893681,''),('32544','WF-00001:1:11','32543','32543','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 17:33:48.965','2018-10-14 17:33:48.992',27,''),('32545','WF-00001:1:11','32543','32543','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32546',NULL,'申请','userTask',NULL,'2018-10-14 17:33:48.993','2018-10-14 18:21:28.694',2859701,''),('32548','WF-00001:1:11','32547','32547','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 17:33:51.315','2018-10-14 17:33:51.318',3,''),('32549','WF-00001:1:11','32547','32547','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32550',NULL,'申请','userTask',NULL,'2018-10-14 17:33:51.318','2018-10-14 17:59:06.154',1514836,''),('35001','WF-00001:1:11','32547','32547','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35002',NULL,'审批','userTask',NULL,'2018-10-14 17:59:06.174','2018-10-14 18:00:46.480',100306,''),('35003','WF-00001:1:11','32547','32547','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35004',NULL,'归档','userTask',NULL,'2018-10-14 18:00:46.481','2018-10-14 18:01:16.449',29968,''),('35005','WF-00001:1:11','32547','32547','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35006',NULL,'审批','userTask',NULL,'2018-10-14 18:01:16.450','2018-10-14 18:15:27.195',850745,''),('35009','WF-00001:1:11','32547','35007','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35010',NULL,'申请','userTask',NULL,'2018-10-14 18:15:27.178',NULL,NULL,''),('35011','WF-00001:1:11','32547','35008','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35012',NULL,'归档','userTask',NULL,'2018-10-14 18:15:27.196',NULL,NULL,''),('35013','WF-00001:1:11','32543','32543','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35014',NULL,'审批','userTask',NULL,'2018-10-14 18:21:28.695','2018-10-14 18:21:36.411',7716,''),('35017','WF-00001:1:11','32543','35015','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35018',NULL,'申请','userTask',NULL,'2018-10-14 18:21:36.371',NULL,NULL,''),('35019','WF-00001:1:11','32543','35016','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35020',NULL,'归档','userTask',NULL,'2018-10-14 18:21:36.414',NULL,NULL,''),('35021','WF-00001:1:11','32539','32539','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35022',NULL,'审批','userTask',NULL,'2018-10-14 18:22:00.919','2018-10-14 18:22:05.259',4340,''),('35025','WF-00001:1:11','32539','35023','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35026',NULL,'申请','userTask',NULL,'2018-10-14 18:22:05.250',NULL,NULL,''),('35027','WF-00001:1:11','32539','35024','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35028',NULL,'归档','userTask',NULL,'2018-10-14 18:22:05.259',NULL,NULL,''),('35029','WF-00001:1:11','32535','32535','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35030',NULL,'审批','userTask',NULL,'2018-10-14 18:33:30.363','2018-10-14 18:33:40.726',10363,''),('35033','WF-00001:1:11','32535','35031','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35034',NULL,'申请','userTask',NULL,'2018-10-14 18:33:40.695',NULL,NULL,''),('35035','WF-00001:1:11','32535','35032','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35036',NULL,'归档','userTask',NULL,'2018-10-14 18:33:40.729',NULL,NULL,''),('35037','WF-00001:1:11','32531','32531','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35038',NULL,'审批','userTask',NULL,'2018-10-14 18:37:22.833','2018-10-14 18:37:31.646',8813,''),('35041','WF-00001:1:11','32531','35039','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35042',NULL,'申请','userTask',NULL,'2018-10-14 18:37:31.641',NULL,NULL,''),('35043','WF-00001:1:11','32531','35040','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35044',NULL,'归档','userTask',NULL,'2018-10-14 18:37:31.646',NULL,NULL,''),('35046','WF-00001:1:11','35045','35045','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 21:47:55.898','2018-10-14 21:47:55.900',2,''),('35047','WF-00001:1:11','35045','35045','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35048',NULL,'申请','userTask',NULL,'2018-10-14 21:47:55.901','2018-10-14 21:48:21.713',25812,''),('35049','WF-00001:1:11','35045','35045','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35050',NULL,'审批','userTask',NULL,'2018-10-14 21:48:21.713','2018-10-14 21:48:22.810',1097,''),('35051','WF-00001:1:11','35045','35045','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35052',NULL,'归档','userTask',NULL,'2018-10-14 21:48:22.811','2018-10-14 21:48:30.122',7311,''),('35059','WF-00001:1:11','35045','35053','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35060',NULL,'审批','userTask',NULL,'2018-10-14 21:48:30.083',NULL,NULL,''),('35061','WF-00001:1:11','35045','35054','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35062',NULL,'审批','userTask',NULL,'2018-10-14 21:48:30.090',NULL,NULL,''),('35063','WF-00001:1:11','35045','35055','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35064',NULL,'审批','userTask',NULL,'2018-10-14 21:48:30.098',NULL,NULL,''),('35065','WF-00001:1:11','35045','35056','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35066',NULL,'审批','userTask',NULL,'2018-10-14 21:48:30.106',NULL,NULL,''),('35067','WF-00001:1:11','35045','35057','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35068',NULL,'审批','userTask',NULL,'2018-10-14 21:48:30.113',NULL,NULL,''),('35069','WF-00001:1:11','35045','35058','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35070',NULL,'审批','userTask',NULL,'2018-10-14 21:48:30.123',NULL,NULL,''),('35072','WF-00001:1:11','35071','35071','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:02:58.254','2018-10-14 22:02:58.258',4,''),('35073','WF-00001:1:11','35071','35071','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35074',NULL,'申请','userTask',NULL,'2018-10-14 22:02:58.259','2018-10-14 22:03:23.058',24799,''),('35075','WF-00001:1:11','35071','35071','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35076',NULL,'审批','userTask',NULL,'2018-10-14 22:03:23.059','2018-10-14 22:03:25.334',2275,''),('35077','WF-00001:1:11','35071','35071','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35078',NULL,'归档','userTask',NULL,'2018-10-14 22:03:25.334','2018-10-14 22:03:36.537',11203,''),('35085','WF-00001:1:11','35071','35079','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35086',NULL,'审批','userTask',NULL,'2018-10-14 22:03:36.500',NULL,NULL,''),('35087','WF-00001:1:11','35071','35080','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35088',NULL,'审批','userTask',NULL,'2018-10-14 22:03:36.508',NULL,NULL,''),('35089','WF-00001:1:11','35071','35081','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35090',NULL,'审批','userTask',NULL,'2018-10-14 22:03:36.515',NULL,NULL,''),('35091','WF-00001:1:11','35071','35082','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35092',NULL,'审批','userTask',NULL,'2018-10-14 22:03:36.523',NULL,NULL,''),('35093','WF-00001:1:11','35071','35083','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35094',NULL,'审批','userTask',NULL,'2018-10-14 22:03:36.530',NULL,NULL,''),('35095','WF-00001:1:11','35071','35084','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35096',NULL,'审批','userTask',NULL,'2018-10-14 22:03:36.538',NULL,NULL,''),('35098','WF-00001:1:11','35097','35097','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:04:01.401','2018-10-14 22:04:01.404',3,''),('35099','WF-00001:1:11','35097','35097','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35100',NULL,'申请','userTask',NULL,'2018-10-14 22:04:01.404','2018-10-14 22:04:08.924',7520,''),('35101','WF-00001:1:11','35097','35097','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35102',NULL,'审批','userTask',NULL,'2018-10-14 22:04:08.925','2018-10-14 22:04:09.899',974,''),('35103','WF-00001:1:11','35097','35097','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35104',NULL,'归档','userTask',NULL,'2018-10-14 22:04:09.900','2018-10-14 22:04:10.693',793,''),('35105','WF-00001:1:11','35097','35097','sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B',NULL,NULL,'结束','endEvent',NULL,'2018-10-14 22:04:10.694','2018-10-14 22:04:10.695',1,''),('35107','WF-00001:1:11','35106','35106','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:04:33.167','2018-10-14 22:04:33.170',3,''),('35108','WF-00001:1:11','35106','35106','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35109',NULL,'申请','userTask',NULL,'2018-10-14 22:04:33.171','2018-10-14 22:04:40.877',7706,''),('35110','WF-00001:1:11','35106','35106','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35111',NULL,'审批','userTask',NULL,'2018-10-14 22:04:40.878','2018-10-14 22:04:41.401',523,''),('35112','WF-00001:1:11','35106','35106','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35113',NULL,'归档','userTask',NULL,'2018-10-14 22:04:41.401','2018-10-14 22:04:47.333',5932,''),('35120','WF-00001:1:11','35106','35114','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35121',NULL,'审批','userTask',NULL,'2018-10-14 22:04:47.295',NULL,NULL,''),('35122','WF-00001:1:11','35106','35115','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35123',NULL,'审批','userTask',NULL,'2018-10-14 22:04:47.303',NULL,NULL,''),('35124','WF-00001:1:11','35106','35116','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35125',NULL,'审批','userTask',NULL,'2018-10-14 22:04:47.311',NULL,NULL,''),('35126','WF-00001:1:11','35106','35117','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35127',NULL,'审批','userTask',NULL,'2018-10-14 22:04:47.319',NULL,NULL,''),('35128','WF-00001:1:11','35106','35118','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35129',NULL,'审批','userTask',NULL,'2018-10-14 22:04:47.326',NULL,NULL,''),('35130','WF-00001:1:11','35106','35119','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35131',NULL,'审批','userTask',NULL,'2018-10-14 22:04:47.333',NULL,NULL,''),('35133','WF-00001:1:11','35132','35132','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:05:02.417','2018-10-14 22:05:02.420',3,''),('35134','WF-00001:1:11','35132','35132','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35135',NULL,'申请','userTask',NULL,'2018-10-14 22:05:02.420','2018-10-14 22:05:12.231',9811,''),('35136','WF-00001:1:11','35132','35132','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35137',NULL,'审批','userTask',NULL,'2018-10-14 22:05:12.232','2018-10-14 22:05:15.318',3086,''),('35138','WF-00001:1:11','35132','35132','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35139',NULL,'归档','userTask',NULL,'2018-10-14 22:05:15.319','2018-10-14 22:05:20.258',4939,''),('35146','WF-00001:1:11','35132','35140','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35147',NULL,'审批','userTask',NULL,'2018-10-14 22:05:20.213',NULL,NULL,''),('35148','WF-00001:1:11','35132','35141','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35149',NULL,'审批','userTask',NULL,'2018-10-14 22:05:20.225',NULL,NULL,''),('35150','WF-00001:1:11','35132','35142','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35151',NULL,'审批','userTask',NULL,'2018-10-14 22:05:20.235',NULL,NULL,''),('35152','WF-00001:1:11','35132','35143','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35153',NULL,'审批','userTask',NULL,'2018-10-14 22:05:20.242',NULL,NULL,''),('35154','WF-00001:1:11','35132','35144','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35155',NULL,'审批','userTask',NULL,'2018-10-14 22:05:20.251',NULL,NULL,''),('35156','WF-00001:1:11','35132','35145','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35157',NULL,'审批','userTask',NULL,'2018-10-14 22:05:20.258',NULL,NULL,''),('35159','WF-00001:1:11','35158','35158','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:14:42.913','2018-10-14 22:14:42.917',4,''),('35160','WF-00001:1:11','35158','35158','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35161',NULL,'申请','userTask',NULL,'2018-10-14 22:14:42.917','2018-10-14 22:14:58.214',15297,''),('35162','WF-00001:1:11','35158','35158','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35163',NULL,'审批','userTask',NULL,'2018-10-14 22:14:58.215','2018-10-14 22:15:01.110',2895,''),('35164','WF-00001:1:11','35158','35158','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35165',NULL,'归档','userTask',NULL,'2018-10-14 22:15:01.111',NULL,NULL,''),('37502','WF-00001:1:11','37501','37501','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:21:34.264','2018-10-14 22:21:35.191',927,''),('37503','WF-00001:1:11','37501','37501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37504',NULL,'申请','userTask',NULL,'2018-10-14 22:21:35.191',NULL,NULL,''),('37506','WF-00001:1:11','37505','37505','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:21:50.924','2018-10-14 22:21:51.703',779,''),('37507','WF-00001:1:11','37505','37505','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37508',NULL,'申请','userTask',NULL,'2018-10-14 22:21:51.704',NULL,NULL,''),('37510','WF-00001:1:11','37509','37509','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:22:07.162','2018-10-14 22:22:07.167',5,''),('37511','WF-00001:1:11','37509','37509','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37512',NULL,'申请','userTask',NULL,'2018-10-14 22:22:07.168','2018-10-14 22:22:17.980',10812,''),('37513','WF-00001:1:11','37509','37509','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37514',NULL,'审批','userTask',NULL,'2018-10-14 22:22:17.980','2018-10-14 22:22:19.309',1329,''),('37515','WF-00001:1:11','37509','37509','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37516',NULL,'归档','userTask',NULL,'2018-10-14 22:22:19.310','2018-10-14 22:22:20.306',996,''),('37517','WF-00001:1:11','37509','37509','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37518',NULL,'审批','userTask',NULL,'2018-10-14 22:22:20.307','2018-10-14 22:22:22.149',1842,''),('37521','WF-00001:1:11','37509','37519','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37522',NULL,'申请','userTask',NULL,'2018-10-14 22:22:22.142',NULL,NULL,''),('37523','WF-00001:1:11','37509','37520','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37524',NULL,'归档','userTask',NULL,'2018-10-14 22:22:22.150',NULL,NULL,''),('37526','WF-00001:1:11','37525','37525','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:22:35.961','2018-10-14 22:22:38.115',2154,''),('37527','WF-00001:1:11','37525','37525','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37528',NULL,'申请','userTask',NULL,'2018-10-14 22:22:38.116','2018-10-14 22:22:58.838',20722,''),('37529','WF-00001:1:11','37525','37525','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37530',NULL,'审批','userTask',NULL,'2018-10-14 22:22:58.839','2018-10-14 22:23:03.540',4701,''),('37531','WF-00001:1:11','37525','37525','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37532',NULL,'归档','userTask',NULL,'2018-10-14 22:23:03.540','2018-10-14 22:23:30.447',26907,''),('37535','WF-00001:1:11','37525','37533','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37536',NULL,'审批','userTask',NULL,'2018-10-14 22:23:30.436',NULL,NULL,''),('37537','WF-00001:1:11','37525','37534','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37538',NULL,'审批','userTask',NULL,'2018-10-14 22:23:30.448',NULL,NULL,''),('37540','WF-00001:1:11','37539','37539','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:23:54.391','2018-10-14 22:23:54.398',7,''),('37541','WF-00001:1:11','37539','37539','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37542',NULL,'申请','userTask',NULL,'2018-10-14 22:23:54.398','2018-10-14 22:24:21.952',27554,''),('37543','WF-00001:1:11','37539','37539','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37544',NULL,'审批','userTask',NULL,'2018-10-14 22:24:21.953','2018-10-14 22:24:23.228',1275,''),('37545','WF-00001:1:11','37539','37539','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37546',NULL,'归档','userTask',NULL,'2018-10-14 22:24:23.228','2018-10-14 22:24:41.284',18056,''),('37549','WF-00001:1:11','37539','37547','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37550',NULL,'审批','userTask',NULL,'2018-10-14 22:24:41.272',NULL,NULL,''),('37551','WF-00001:1:11','37539','37548','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37552',NULL,'审批','userTask',NULL,'2018-10-14 22:24:41.285',NULL,NULL,''),('37554','WF-00001:1:11','37553','37553','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-10-14 22:24:49.467','2018-10-14 22:24:49.479',12,''),('37555','WF-00001:1:11','37553','37553','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37556',NULL,'申请','userTask',NULL,'2018-10-14 22:24:49.482','2018-10-14 22:24:57.522',8040,''),('37557','WF-00001:1:11','37553','37553','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37558',NULL,'审批','userTask',NULL,'2018-10-14 22:24:57.523','2018-10-14 22:24:58.363',840,''),('37559','WF-00001:1:11','37553','37553','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37560',NULL,'归档','userTask',NULL,'2018-10-14 22:24:58.364','2018-10-14 22:25:05.435',7071,''),('37563','WF-00001:1:11','37553','37561','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37564',NULL,'审批','userTask',NULL,'2018-10-14 22:25:05.398',NULL,NULL,''),('37565','WF-00001:1:11','37553','37562','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37566',NULL,'审批','userTask',NULL,'2018-10-14 22:25:05.438',NULL,NULL,''),('40002','WF-00001:1:11','40001','40001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'开始\n','startEvent',NULL,'2018-11-08 21:20:18.220','2018-11-08 21:20:18.247',27,''),('40003','WF-00001:1:11','40001','40001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','40004',NULL,'申请','userTask',NULL,'2018-11-08 21:20:18.247',NULL,NULL,''),('5001','WF-00001:1:11','12','12','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','5002',NULL,'归档','userTask',NULL,'2018-10-12 23:24:19.625','2018-10-13 22:23:49.466',82769841,''),('7501','WF-00001:1:11','12','12','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','7502',NULL,'审批','userTask',NULL,'2018-10-13 22:23:49.590','2018-10-13 22:24:06.601',17011,''),('7505','WF-00001:1:11','12','7503','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','7506',NULL,'申请','userTask',NULL,'2018-10-13 22:24:06.591',NULL,NULL,''),('7507','WF-00001:1:11','12','7504','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','7508',NULL,'归档','userTask',NULL,'2018-10-13 22:24:06.602',NULL,NULL,'');
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
INSERT INTO `act_hi_procinst` VALUES ('10001','10001',NULL,'WF-00001:1:11','2018-10-13 22:50:00.858',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('12','12',NULL,'WF-00001:1:11','2018-10-12 22:30:07.884',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('12513','12513',NULL,'WF-00001:1:11','2018-10-13 23:05:22.368','2018-10-13 23:06:35.804',73436,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E','sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B',NULL,NULL,'',NULL),('15001','15001',NULL,'WF-00001:1:11','2018-10-14 11:18:20.199',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('17501','17501',NULL,'WF-00001:1:11','2018-10-14 11:31:33.910',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('20019','20019',NULL,'WF-00001:1:11','2018-10-14 11:43:41.672',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('20023','20023',NULL,'WF-00001:1:11','2018-10-14 11:44:02.268',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('20027','20027',NULL,'WF-00001:1:11','2018-10-14 11:44:45.591',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('22501','22501',NULL,'WF-00001:1:11','2018-10-14 11:51:10.002',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('25001','25001',NULL,'WF-00001:1:11','2018-10-14 12:00:07.225',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('25005','25005',NULL,'WF-00001:1:11','2018-10-14 12:00:25.506',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('30001','30001',NULL,'WF-00001:1:11','2018-10-14 12:10:05.286',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('30005','30005',NULL,'WF-00001:1:11','2018-10-14 12:10:30.694',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('30009','30009',NULL,'WF-00001:1:11','2018-10-14 12:12:39.461',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('30013','30013',NULL,'WF-00001:1:11','2018-10-14 12:20:00.042',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32501','32501',NULL,'WF-00001:1:11','2018-10-14 12:21:48.615',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32502','32502',NULL,'WF-00001:1:11','2018-10-14 12:21:48.615',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32503','32503',NULL,'WF-00001:1:11','2018-10-14 12:21:48.615',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32513','32513',NULL,'WF-00001:1:11','2018-10-14 12:21:59.055',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32527','32527',NULL,'WF-00001:1:11','2018-10-14 17:32:56.169',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32531','32531',NULL,'WF-00001:1:11','2018-10-14 17:33:14.961',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32535','32535',NULL,'WF-00001:1:11','2018-10-14 17:33:44.768',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32539','32539',NULL,'WF-00001:1:11','2018-10-14 17:33:47.233',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32543','32543',NULL,'WF-00001:1:11','2018-10-14 17:33:48.965',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('32547','32547',NULL,'WF-00001:1:11','2018-10-14 17:33:51.315',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('35045','35045',NULL,'WF-00001:1:11','2018-10-14 21:47:55.897',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('35071','35071',NULL,'WF-00001:1:11','2018-10-14 22:02:58.254',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('35097','35097',NULL,'WF-00001:1:11','2018-10-14 22:04:01.401','2018-10-14 22:04:10.912',9511,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E','sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B',NULL,NULL,'',NULL),('35106','35106',NULL,'WF-00001:1:11','2018-10-14 22:04:33.167',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('35132','35132',NULL,'WF-00001:1:11','2018-10-14 22:05:02.417',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('35158','35158',NULL,'WF-00001:1:11','2018-10-14 22:14:42.913',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('37501','37501',NULL,'WF-00001:1:11','2018-10-14 22:21:34.248',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('37505','37505',NULL,'WF-00001:1:11','2018-10-14 22:21:50.923',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('37509','37509',NULL,'WF-00001:1:11','2018-10-14 22:22:07.162',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('37525','37525',NULL,'WF-00001:1:11','2018-10-14 22:22:35.961',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('37539','37539',NULL,'WF-00001:1:11','2018-10-14 22:23:54.391',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('37553','37553',NULL,'WF-00001:1:11','2018-10-14 22:24:49.467',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL),('40001','40001',NULL,'WF-00001:1:11','2018-11-08 21:20:18.219',NULL,NULL,NULL,'sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('10006','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','10001','10001','申请',NULL,NULL,NULL,NULL,'2018-10-13 22:50:34.107',NULL,'2018-10-13 23:02:11.663',697556,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('12502','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','10001','10001','审批',NULL,NULL,NULL,NULL,'2018-10-13 23:02:12.176',NULL,'2018-10-13 23:02:28.747',16571,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('12510','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','10001','12507','申请',NULL,NULL,NULL,NULL,'2018-10-13 23:03:52.490',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('12512','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','10001','12508','归档',NULL,NULL,NULL,NULL,'2018-10-13 23:03:52.500',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('12516','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12513','12513','申请',NULL,NULL,NULL,NULL,'2018-10-13 23:05:22.374',NULL,'2018-10-13 23:06:02.538',40164,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('12518','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12513','12513','审批',NULL,NULL,NULL,NULL,'2018-10-13 23:06:02.551',NULL,'2018-10-13 23:06:17.248',14697,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('12520','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12513','12513','归档',NULL,NULL,NULL,NULL,'2018-10-13 23:06:18.316',NULL,'2018-10-13 23:06:35.504',17188,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('15','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12','12','申请',NULL,NULL,NULL,NULL,'2018-10-12 22:30:07.936',NULL,'2018-10-12 23:20:44.286',3036350,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('15004','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15001','15001','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:18:20.419',NULL,'2018-10-14 11:21:03.636',163217,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('15006','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','15001','15001','审批',NULL,NULL,NULL,NULL,'2018-10-14 11:21:03.796',NULL,'2018-10-14 11:22:03.517',59721,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('15008','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','15001','15001','归档',NULL,NULL,NULL,NULL,'2018-10-14 11:22:03.707',NULL,'2018-10-14 11:22:42.067',38360,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('15010','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','15001','15001','审批',NULL,NULL,NULL,NULL,'2018-10-14 11:22:42.076',NULL,'2018-10-14 11:23:47.434',65358,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('15014','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15001','15011','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:23:47.454',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('15016','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','15001','15012','归档',NULL,NULL,NULL,NULL,'2018-10-14 11:23:47.462',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('17504','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17501','17501','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:31:33.952',NULL,'2018-10-14 11:31:59.451',25499,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('17506','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','审批',NULL,NULL,NULL,NULL,'2018-10-14 11:31:59.469',NULL,'2018-10-14 11:34:55.889',176420,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('17508','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','17501','17501','归档',NULL,NULL,NULL,NULL,'2018-10-14 11:34:55.900',NULL,'2018-10-14 11:35:37.823',41923,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('17510','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','审批',NULL,NULL,NULL,NULL,'2018-10-14 11:35:37.830',NULL,'2018-10-14 11:42:23.135',405305,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('20002','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17501','17501','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:42:23.245',NULL,'2018-10-14 11:42:51.011',27766,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20004','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','审批',NULL,NULL,NULL,NULL,'2018-10-14 11:42:51.050',NULL,'2018-10-14 11:42:53.650',2600,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('20006','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17501','17501','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:42:53.710',NULL,'2018-10-14 11:42:55.790',2080,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20008','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','审批',NULL,NULL,NULL,NULL,'2018-10-14 11:42:55.804',NULL,'2018-10-14 11:42:56.604',800,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('20010','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','17501','17501','归档',NULL,NULL,NULL,NULL,'2018-10-14 11:42:56.629',NULL,'2018-10-14 11:42:58.145',1516,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('20012','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','审批',NULL,NULL,NULL,NULL,'2018-10-14 11:42:58.179',NULL,'2018-10-14 11:43:01.917',3738,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('20016','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17501','20013','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:43:01.959',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20018','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','17501','20014','归档',NULL,NULL,NULL,NULL,'2018-10-14 11:43:01.968',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('20022','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20019','20019','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:43:41.683',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20026','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20023','20023','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:44:02.273',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20030','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20027','20027','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:44:45.596',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('22504','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','22501','22501','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:51:10.029',NULL,'2018-10-14 11:53:13.142',123113,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('22506','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','22501','22501','审批',NULL,NULL,NULL,NULL,'2018-10-14 11:53:13.158',NULL,'2018-10-14 11:53:13.966',808,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('22508','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','22501','22501','归档',NULL,NULL,NULL,NULL,'2018-10-14 11:53:14.000',NULL,'2018-10-14 11:53:16.536',2536,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('22510','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','22501','22501','审批',NULL,NULL,NULL,NULL,'2018-10-14 11:53:16.572',NULL,'2018-10-14 11:53:18.349',1777,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('22514','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','22501','22511','申请',NULL,NULL,NULL,NULL,'2018-10-14 11:53:18.370',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('22516','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','22501','22512','归档',NULL,NULL,NULL,NULL,'2018-10-14 11:53:18.378',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('25004','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25001','25001','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:00:07.259',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('25008','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25005','25005','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:00:25.517',NULL,'2018-10-14 12:07:27.737',422220,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('2502','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12','12','审批',NULL,NULL,NULL,NULL,'2018-10-12 23:20:44.382',NULL,'2018-10-12 23:24:19.384',215002,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('27502','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','25005','25005','审批',NULL,NULL,NULL,NULL,'2018-10-14 12:07:27.817',NULL,'2018-10-14 17:23:04.839',18937022,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('30004','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30001','30001','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:10:05.483',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('30008','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30005','30005','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:10:30.705',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('30012','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30009','30009','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:12:39.469',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('30016','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30013','30013','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:20:00.048',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32508','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32503','32503','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:21:48.662',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32510','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32501','32501','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:21:48.662',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32512','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32502','32502','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:21:48.662',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32516','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32513','32513','申请',NULL,NULL,NULL,NULL,'2018-10-14 12:21:59.061',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32518','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','25005','25005','归档',NULL,NULL,NULL,NULL,'2018-10-14 17:23:04.881',NULL,'2018-10-14 17:23:07.841',2960,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('32520','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','25005','25005','审批',NULL,NULL,NULL,NULL,'2018-10-14 17:23:07.849',NULL,'2018-10-14 17:23:12.652',4803,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('32524','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25005','32521','申请',NULL,NULL,NULL,NULL,'2018-10-14 17:23:12.908',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32526','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','25005','32522','归档',NULL,NULL,NULL,NULL,'2018-10-14 17:23:13.098',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('32530','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32527','32527','申请',NULL,NULL,NULL,NULL,'2018-10-14 17:32:56.179',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32534','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32531','32531','申请',NULL,NULL,NULL,NULL,'2018-10-14 17:33:14.969',NULL,'2018-10-14 18:37:22.141',3847172,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32538','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32535','32535','申请',NULL,NULL,NULL,NULL,'2018-10-14 17:33:44.776',NULL,'2018-10-14 18:33:30.356',3585580,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32542','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32539','32539','申请',NULL,NULL,NULL,NULL,'2018-10-14 17:33:47.240',NULL,'2018-10-14 18:22:00.905',2893665,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32546','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32543','32543','申请',NULL,NULL,NULL,NULL,'2018-10-14 17:33:48.996',NULL,'2018-10-14 18:21:28.682',2859686,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32550','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32547','32547','申请',NULL,NULL,NULL,NULL,'2018-10-14 17:33:51.323',NULL,'2018-10-14 17:59:06.079',1514756,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35002','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32547','32547','审批',NULL,NULL,NULL,NULL,'2018-10-14 17:59:06.175',NULL,'2018-10-14 18:00:46.467',100292,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35004','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32547','32547','归档',NULL,NULL,NULL,NULL,'2018-10-14 18:00:46.482',NULL,'2018-10-14 18:01:16.416',29934,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35006','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32547','32547','审批',NULL,NULL,NULL,NULL,'2018-10-14 18:01:16.450',NULL,'2018-10-14 18:15:27.157',850707,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35010','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32547','35007','申请',NULL,NULL,NULL,NULL,'2018-10-14 18:15:27.186',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35012','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32547','35008','归档',NULL,NULL,NULL,NULL,'2018-10-14 18:15:27.198',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35014','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32543','32543','审批',NULL,NULL,NULL,NULL,'2018-10-14 18:21:28.696',NULL,'2018-10-14 18:21:36.304',7608,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35018','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32543','35015','申请',NULL,NULL,NULL,NULL,'2018-10-14 18:21:36.386',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35020','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32543','35016','归档',NULL,NULL,NULL,NULL,'2018-10-14 18:21:36.428',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35022','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32539','32539','审批',NULL,NULL,NULL,NULL,'2018-10-14 18:22:00.919',NULL,'2018-10-14 18:22:05.238',4319,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35026','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32539','35023','申请',NULL,NULL,NULL,NULL,'2018-10-14 18:22:05.252',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35028','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32539','35024','归档',NULL,NULL,NULL,NULL,'2018-10-14 18:22:05.263',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35030','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32535','32535','审批',NULL,NULL,NULL,NULL,'2018-10-14 18:33:30.364',NULL,'2018-10-14 18:33:40.629',10265,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35034','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32535','35031','申请',NULL,NULL,NULL,NULL,'2018-10-14 18:33:40.706',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35036','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32535','35032','归档',NULL,NULL,NULL,NULL,'2018-10-14 18:33:40.735',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35038','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32531','32531','审批',NULL,NULL,NULL,NULL,'2018-10-14 18:37:22.834',NULL,'2018-10-14 18:37:31.629',8795,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35042','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32531','35039','申请',NULL,NULL,NULL,NULL,'2018-10-14 18:37:31.643',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35044','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32531','35040','归档',NULL,NULL,NULL,NULL,'2018-10-14 18:37:31.648',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35048','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35045','35045','申请',NULL,NULL,NULL,NULL,'2018-10-14 21:47:55.904',NULL,'2018-10-14 21:48:21.703',25799,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35050','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35045','审批',NULL,NULL,NULL,NULL,'2018-10-14 21:48:21.714',NULL,'2018-10-14 21:48:22.802',1088,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35052','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35045','35045','归档',NULL,NULL,NULL,NULL,'2018-10-14 21:48:22.811',NULL,'2018-10-14 21:48:30.063',7252,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35060','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35053','审批',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.086',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35062','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35054','审批',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.093',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35064','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35055','审批',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.101',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35066','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35056','审批',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.108',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35068','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35057','审批',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.118',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35070','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35058','审批',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.125',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35074','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35071','35071','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:02:58.263',NULL,'2018-10-14 22:03:23.037',24774,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35076','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35071','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:03:23.060',NULL,'2018-10-14 22:03:25.326',2266,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35078','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35071','35071','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:03:25.335',NULL,'2018-10-14 22:03:36.488',11153,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35086','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35079','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.503',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35088','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35080','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.510',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35090','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35081','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.518',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35092','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35082','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.525',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35094','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35083','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.533',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35096','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35084','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.541',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35100','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35097','35097','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:04:01.406',NULL,'2018-10-14 22:04:08.916',7510,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35102','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35097','35097','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:04:08.925',NULL,'2018-10-14 22:04:09.884',959,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35104','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35097','35097','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:04:09.900',NULL,'2018-10-14 22:04:10.683',783,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35109','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35106','35106','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:04:33.174',NULL,'2018-10-14 22:04:40.870',7696,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35111','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35106','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:04:40.878',NULL,'2018-10-14 22:04:41.376',498,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35113','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35106','35106','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:04:41.402',NULL,'2018-10-14 22:04:47.281',5879,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35121','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35114','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.298',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35123','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35115','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.307',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35125','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35116','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.314',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35127','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35117','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.322',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35129','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35118','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.329',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35131','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35119','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.336',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35135','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35132','35132','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:05:02.423',NULL,'2018-10-14 22:05:12.220',9797,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35137','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35132','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:05:12.232',NULL,'2018-10-14 22:05:15.311',3079,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35139','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35132','35132','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:05:15.319',NULL,'2018-10-14 22:05:20.191',4872,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35147','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35140','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.218',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35149','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35141','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.229',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35151','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35142','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.237',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35153','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35143','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.245',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35155','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35144','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.253',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35157','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35145','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.262',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35161','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35158','35158','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:14:42.920',NULL,'2018-10-14 22:14:58.140',15220,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35163','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35158','35158','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:14:58.215',NULL,'2018-10-14 22:15:01.095',2880,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35165','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35158','35158','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:15:01.112',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37504','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37501','37501','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:21:35.223',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37508','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37505','37505','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:21:51.711',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37512','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37509','37509','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:22:07.173',NULL,'2018-10-14 22:22:17.967',10794,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37514','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37509','37509','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:22:17.981',NULL,'2018-10-14 22:22:19.302',1321,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37516','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37509','37509','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:22:19.310',NULL,'2018-10-14 22:22:20.294',984,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37518','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37509','37509','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:22:20.307',NULL,'2018-10-14 22:22:22.128',1821,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37522','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37509','37519','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:22:22.144',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37524','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37509','37520','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:22:22.153',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37528','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37525','37525','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:22:38.123',NULL,'2018-10-14 22:22:57.732',19609,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37530','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37525','37525','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:22:58.842',NULL,'2018-10-14 22:23:03.023',4181,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37532','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37525','37525','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:23:03.541',NULL,'2018-10-14 22:23:23.714',20173,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37536','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37525','37533','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:23:30.441',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37538','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37525','37534','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:23:30.455',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37542','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37539','37539','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:23:54.401',NULL,'2018-10-14 22:24:21.933',27532,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37544','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37539','37539','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:24:21.954',NULL,'2018-10-14 22:24:23.220',1266,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37546','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37539','37539','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:24:23.229',NULL,'2018-10-14 22:24:41.201',17972,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37550','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37539','37547','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:24:41.276',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37552','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37539','37548','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:24:41.289',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37556','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37553','37553','申请',NULL,NULL,NULL,NULL,'2018-10-14 22:24:49.491',NULL,'2018-10-14 22:24:57.514',8023,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37558','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37553','37553','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:24:57.524',NULL,'2018-10-14 22:24:58.350',826,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37560','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37553','37553','归档',NULL,NULL,NULL,NULL,'2018-10-14 22:24:58.364',NULL,'2018-10-14 22:25:05.303',6939,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37564','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37553','37561','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:25:05.410',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37566','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37553','37562','审批',NULL,NULL,NULL,NULL,'2018-10-14 22:25:05.451',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('40004','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','40001','40001','申请',NULL,NULL,NULL,NULL,'2018-11-08 21:20:18.309',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('7506','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12','7503','申请',NULL,NULL,NULL,NULL,'2018-10-13 22:24:06.595',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('7508','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12','7504','归档',NULL,NULL,NULL,NULL,'2018-10-13 22:24:06.608',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,'');
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
INSERT INTO `act_re_deployment` VALUES ('4','AnnouncementApply',NULL,'','2018-10-12 14:25:15.985'),('8','AnnouncementApply',NULL,'','2018-10-12 14:29:21.814');
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
INSERT INTO `act_re_model` VALUES ('1',6,'AnnouncementApply','公告申请流程',NULL,'2018-10-12 14:18:22.776','2018-10-12 14:29:08.615',1,'{\"name\":\"AnnouncementApply\",\"revision\":1,\"description\":\"公告申请的相关流程\"}',NULL,'2','3','');
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
INSERT INTO `act_re_procdef` VALUES ('WF-00001:1:11',1,'http://www.activiti.org/processdef','公告申请流程','WF-00001',1,'8','AnnouncementApply.bpmn20.xml','AnnouncementApply.WF-00001.png',NULL,0,1,1,''),('未定义:1:7',1,'http://www.activiti.org/processdef',NULL,'未定义',1,'4','AnnouncementApply.bpmn20.xml','AnnouncementApply.未定义.png',NULL,0,1,1,'');
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
INSERT INTO `act_ru_execution` VALUES ('10001',5,'10001',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('12',5,'12',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('12507',1,'10001',NULL,'10001','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('12508',1,'10001',NULL,'10001','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('15001',5,'15001',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('15011',1,'15001',NULL,'15001','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('15012',1,'15001',NULL,'15001','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('17501',11,'17501',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('20013',1,'17501',NULL,'17501','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('20014',1,'17501',NULL,'17501','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('20019',1,'20019',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('20023',1,'20023',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('20027',1,'20027',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('22501',5,'22501',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('22511',1,'22501',NULL,'22501','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('22512',1,'22501',NULL,'22501','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('25001',1,'25001',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('25005',5,'25005',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('30001',1,'30001',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('30005',1,'30005',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('30009',1,'30009',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('30013',1,'30013',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('32501',1,'32501',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('32502',1,'32502',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('32503',1,'32503',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('32513',1,'32513',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('32521',1,'25005',NULL,'25005','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('32522',1,'25005',NULL,'25005','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('32527',1,'32527',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('32531',3,'32531',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('32535',3,'32535',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('32539',3,'32539',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('32543',3,'32543',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('32547',5,'32547',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('35007',1,'32547',NULL,'32547','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('35008',1,'32547',NULL,'32547','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('35015',1,'32543',NULL,'32543','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('35016',1,'32543',NULL,'32543','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('35023',1,'32539',NULL,'32539','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('35024',1,'32539',NULL,'32539','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('35031',1,'32535',NULL,'32535','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('35032',1,'32535',NULL,'32535','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('35039',1,'32531',NULL,'32531','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('35040',1,'32531',NULL,'32531','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('35045',4,'35045',NULL,NULL,'WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',0,0,1,0,1,0,'',NULL,NULL),('35053',1,'35045',NULL,'35045','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35054',1,'35045',NULL,'35045','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35055',1,'35045',NULL,'35045','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35056',1,'35045',NULL,'35045','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35057',1,'35045',NULL,'35045','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35058',1,'35045',NULL,'35045','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35071',4,'35071',NULL,NULL,'WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',0,0,1,0,1,0,'',NULL,NULL),('35079',1,'35071',NULL,'35071','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35080',1,'35071',NULL,'35071','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35081',1,'35071',NULL,'35071','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35082',1,'35071',NULL,'35071','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35083',1,'35071',NULL,'35071','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35084',1,'35071',NULL,'35071','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35106',4,'35106',NULL,NULL,'WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',0,0,1,0,1,0,'',NULL,NULL),('35114',1,'35106',NULL,'35106','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35115',1,'35106',NULL,'35106','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35116',1,'35106',NULL,'35106','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35117',1,'35106',NULL,'35106','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35118',1,'35106',NULL,'35106','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35119',1,'35106',NULL,'35106','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35132',4,'35132',NULL,NULL,'WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',0,0,1,0,1,0,'',NULL,NULL),('35140',1,'35132',NULL,'35132','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35141',1,'35132',NULL,'35132','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35142',1,'35132',NULL,'35132','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35143',1,'35132',NULL,'35132','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35144',1,'35132',NULL,'35132','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35145',1,'35132',NULL,'35132','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('35158',3,'35158',NULL,NULL,'WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,0,1,0,1,2,'',NULL,NULL),('37501',1,'37501',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('37505',1,'37505',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('37509',5,'37509',NULL,NULL,'WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',0,0,1,0,1,0,'',NULL,NULL),('37519',1,'37509',NULL,'37509','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('37520',1,'37509',NULL,'37509','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL),('37525',4,'37525',NULL,NULL,'WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',0,0,1,0,1,0,'',NULL,NULL),('37533',1,'37525',NULL,'37525','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('37534',1,'37525',NULL,'37525','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('37539',4,'37539',NULL,NULL,'WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',0,0,1,0,1,0,'',NULL,NULL),('37547',1,'37539',NULL,'37539','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('37548',1,'37539',NULL,'37539','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('37553',4,'37553',NULL,NULL,'WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',0,0,1,0,1,0,'',NULL,NULL),('37561',1,'37553',NULL,'37553','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('37562',1,'37553',NULL,'37553','WF-00001:1:11',NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',1,1,0,0,1,7,'',NULL,NULL),('40001',1,'40001',NULL,NULL,'WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,0,1,0,1,2,'',NULL,NULL),('7503',1,'12',NULL,'12','WF-00001:1:11',NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',1,1,0,0,1,7,'',NULL,NULL),('7504',1,'12',NULL,'12','WF-00001:1:11',NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',1,1,0,0,1,7,'',NULL,NULL);
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
INSERT INTO `act_ru_task` VALUES ('12510',1,'12507','10001','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-13 15:03:52.487',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('12512',1,'12508','10001','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-13 15:03:52.497',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('15014',1,'15011','15001','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:23:47.452',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('15016',1,'15012','15001','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 03:23:47.460',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('20016',1,'20013','17501','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:43:01.957',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('20018',1,'20014','17501','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 03:43:01.965',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('20022',1,'20019','20019','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:43:41.680',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('20026',1,'20023','20023','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:44:02.271',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('20030',1,'20027','20027','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:44:45.594',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('22514',1,'22511','22501','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:53:18.367',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('22516',1,'22512','22501','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 03:53:18.376',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('25004',1,'25001','25001','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:00:07.251',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('30004',1,'30001','30001','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:10:05.467',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('30008',1,'30005','30005','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:10:30.701',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('30012',1,'30009','30009','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:12:39.466',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('30016',1,'30013','30013','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:20:00.045',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32508',1,'32503','32503','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:21:48.646',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32510',1,'32501','32501','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:21:48.646',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32512',1,'32502','32502','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:21:48.646',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32516',1,'32513','32513','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:21:59.059',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32524',1,'32521','25005','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 09:23:12.905',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32526',1,'32522','25005','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 09:23:13.095',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('32530',1,'32527','32527','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 09:32:56.175',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35010',1,'35007','32547','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:15:27.178',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35012',1,'35008','32547','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:15:27.196',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35018',1,'35015','32543','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:21:36.373',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35020',1,'35016','32543','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:21:36.415',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35026',1,'35023','32539','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:22:05.250',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35028',1,'35024','32539','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:22:05.260',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35034',1,'35031','32535','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:33:40.696',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35036',1,'35032','32535','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:33:40.730',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35042',1,'35039','32531','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:37:31.641',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35044',1,'35040','32531','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:37:31.647',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35060',1,'35053','35045','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.084',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35062',1,'35054','35045','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.091',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35064',1,'35055','35045','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.098',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35066',1,'35056','35045','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.106',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35068',1,'35057','35045','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.114',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35070',1,'35058','35045','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.123',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35086',1,'35079','35071','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.501',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35088',1,'35080','35071','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.508',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35090',1,'35081','35071','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.515',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35092',1,'35082','35071','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.523',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35094',1,'35083','35071','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.531',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35096',1,'35084','35071','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.538',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35121',1,'35114','35106','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.296',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35123',1,'35115','35106','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.304',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35125',1,'35116','35106','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.311',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35127',1,'35117','35106','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.319',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35129',1,'35118','35106','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.326',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35131',1,'35119','35106','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.333',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35147',1,'35140','35132','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.214',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35149',1,'35141','35132','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.225',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35151',1,'35142','35132','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.235',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35153',1,'35143','35132','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.242',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35155',1,'35144','35132','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.251',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35157',1,'35145','35132','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.259',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35165',1,'35158','35158','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 14:15:01.112',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('37504',1,'37501','37501','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 14:21:35.191',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('37508',1,'37505','37505','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 14:21:51.705',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('37522',1,'37519','37509','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 14:22:22.142',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('37524',1,'37520','37509','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 14:22:22.150',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('37536',1,'37533','37525','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:23:30.437',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37538',1,'37534','37525','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:23:30.448',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37550',1,'37547','37539','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:24:41.273',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37552',1,'37548','37539','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:24:41.286',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37564',1,'37561','37553','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:25:05.399',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37566',1,'37562','37553','WF-00001:1:11','审批',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:25:05.440',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('40004',1,'40001','40001','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-11-08 13:20:18.247',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('7506',1,'7503','12','WF-00001:1:11','申请',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-13 14:24:06.591',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('7508',1,'7504','12','WF-00001:1:11','归档',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-13 14:24:06.602',NULL,NULL,1,'','/template/sys/workflow/announcement/complete');
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
  `ID` int(11) NOT NULL COMMENT '标识',
  `NAME` varchar(64) DEFAULT NULL,
  `GENDER` varchar(8) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `LOGIN_ACCOUNT_NO` varchar(255) DEFAULT NULL COMMENT '登陆账号',
  `LOGIN_PASSWORD` varchar(255) DEFAULT NULL COMMENT '登陆密码',
  `DEPARTMENT_ID` int(11) DEFAULT NULL COMMENT '部门标识',
  `ENABLE` varchar(2) DEFAULT NULL COMMENT '是否启用',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NOT NULL COMMENT '修改时间',
  `REMARK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin`
--

LOCK TABLES `sys_admin` WRITE;
/*!40000 ALTER TABLE `sys_admin` DISABLE KEYS */;
INSERT INTO `sys_admin` VALUES (1,NULL,NULL,NULL,'admin','admin',2,'0','2018-05-22 17:26:06','2019-01-02 11:23:26',NULL),(2,NULL,NULL,NULL,'liulei','liulei2',1,'1','2018-05-22 17:27:27','2019-01-02 11:23:05',NULL),(3,NULL,NULL,NULL,'super','super3',1,'1','2018-05-22 17:28:17','2019-01-02 11:23:06',NULL);
/*!40000 ALTER TABLE `sys_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_admin_login_log`
--

DROP TABLE IF EXISTS `sys_admin_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_admin_login_log` (
  `ID` int(11) NOT NULL COMMENT '标识',
  `ADMIN_ID` int(11) DEFAULT NULL COMMENT '管理员标识',
  `IS_PASSWORD_ERROR` varchar(8) DEFAULT NULL COMMENT '登录是是否出现密码错误',
  `LOGIN_TIME` datetime DEFAULT NULL COMMENT '登录日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin_login_log`
--

LOCK TABLES `sys_admin_login_log` WRITE;
/*!40000 ALTER TABLE `sys_admin_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_admin_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_admin_role`
--

DROP TABLE IF EXISTS `sys_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_admin_role` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin_role`
--

LOCK TABLES `sys_admin_role` WRITE;
/*!40000 ALTER TABLE `sys_admin_role` DISABLE KEYS */;
INSERT INTO `sys_admin_role` VALUES (14,1,'2019-01-02 15:38:15','2019-01-02 15:38:15',1),(15,1,'2019-01-02 15:38:15','2019-01-02 15:38:15',2),(16,1,'2019-01-02 15:38:15','2019-01-02 15:38:15',3),(17,1,'2019-01-02 15:38:15','2019-01-02 15:38:15',4),(18,2,'2019-01-02 15:38:22','2019-01-02 15:38:22',1),(19,2,'2019-01-02 15:38:22','2019-01-02 15:38:22',2),(20,3,'2019-01-02 15:38:30','2019-01-02 15:38:30',3);
/*!40000 ALTER TABLE `sys_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_announcement`
--

DROP TABLE IF EXISTS `sys_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_announcement` (
  `ID` int(11) NOT NULL COMMENT '标识',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(8) DEFAULT NULL COMMENT '通知类型',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NOT NULL COMMENT '修改时间',
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
  `ID` int(11) DEFAULT NULL COMMENT '标识',
  `WORKSHEET_NO` varchar(16) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CREATE_ADMIN_ID` int(11) DEFAULT NULL,
  `TYPE` varchar(8) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
  PRIMARY KEY (`WORKSHEET_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_announcement_changed`
--

LOCK TABLES `sys_announcement_changed` WRITE;
/*!40000 ALTER TABLE `sys_announcement_changed` DISABLE KEYS */;
INSERT INTO `sys_announcement_changed` VALUES (1,'1',NULL,NULL,NULL,NULL,'2018-06-09 23:06:54','2018-06-09 23:06:54'),(9,'10','测试内容',NULL,NULL,'201806091126','2018-06-09 23:39:15','2018-06-09 23:39:15'),(10,'11','测试内容',NULL,NULL,'201806091126','2018-06-09 23:39:44','2018-06-09 23:39:44'),(11,'12','2',NULL,NULL,'测试1','2018-06-11 22:54:56','2018-06-11 22:54:56'),(12,'13','2',NULL,NULL,'测试1','2018-06-11 22:55:00','2018-06-11 22:55:00'),(13,'14','2',NULL,NULL,'测试1','2018-06-11 22:55:02','2018-06-11 22:55:02'),(14,'15','',NULL,NULL,'','2018-10-09 22:01:12','2018-10-09 22:01:12'),(15,'16','',NULL,NULL,'','2018-10-12 22:30:09','2018-10-12 22:30:09'),(16,'17','',NULL,NULL,'','2018-10-13 22:50:01','2018-10-13 22:50:01'),(17,'18','',NULL,NULL,'','2018-10-13 23:05:23','2018-10-13 23:05:23'),(18,'19','',NULL,NULL,'','2018-10-14 11:18:21','2018-10-14 11:18:21'),(19,'20','',NULL,NULL,'','2018-10-14 11:31:35','2018-10-14 11:31:35'),(20,'21','',NULL,NULL,'','2018-10-14 11:43:42','2018-10-14 11:43:42'),(21,'22','',NULL,NULL,'','2018-10-14 11:51:20','2018-10-14 11:51:20'),(22,'23','',NULL,NULL,'','2018-10-14 12:00:37','2018-10-14 12:00:37'),(23,'24','',NULL,NULL,'','2018-10-14 12:10:34','2018-10-14 12:10:34'),(24,'25','',NULL,NULL,'','2018-10-14 12:12:40','2018-10-14 12:12:40'),(25,'26','',NULL,NULL,'','2018-10-14 12:20:00','2018-10-14 12:20:00'),(26,'27','',NULL,NULL,'','2018-10-14 12:22:00','2018-10-14 12:22:00'),(27,'28','',NULL,NULL,'','2018-10-14 17:32:57','2018-10-14 17:32:57'),(28,'29','',NULL,NULL,'','2018-10-14 17:33:16','2018-10-14 17:33:16'),(2,'3','测试内容',NULL,NULL,'201806091126','2018-06-09 23:29:22','2018-06-09 23:29:22'),(29,'30','',NULL,NULL,'','2018-10-14 17:33:45','2018-10-14 17:33:45'),(30,'31','',NULL,NULL,'','2018-10-14 17:33:47','2018-10-14 17:33:47'),(31,'32','',NULL,NULL,'','2018-10-14 17:33:49','2018-10-14 17:33:49'),(32,'33','',NULL,NULL,'','2018-10-14 17:33:51','2018-10-14 17:33:51'),(33,'34','',NULL,NULL,'','2018-10-14 21:47:58','2018-10-14 21:47:58'),(34,'35','',NULL,NULL,'','2018-10-14 22:02:59','2018-10-14 22:02:59'),(35,'36','',NULL,NULL,'','2018-10-14 22:04:02','2018-10-14 22:04:02'),(36,'37','',NULL,NULL,'','2018-10-14 22:04:33','2018-10-14 22:04:33'),(37,'38','',NULL,NULL,'','2018-10-14 22:05:03','2018-10-14 22:05:03'),(38,'39','',NULL,NULL,'','2018-10-14 22:14:43','2018-10-14 22:14:43'),(3,'4','测试内容',NULL,NULL,'201806091126','2018-06-09 23:30:55','2018-06-09 23:30:55'),(39,'40','',NULL,NULL,'','2018-10-14 22:22:08','2018-10-14 22:22:08'),(40,'41','',NULL,NULL,'','2018-10-14 22:22:38','2018-10-14 22:22:38'),(41,'42','',NULL,NULL,'','2018-10-14 22:23:55','2018-10-14 22:23:55'),(42,'43','',NULL,NULL,'','2018-10-14 22:24:50','2018-10-14 22:24:50'),(43,'44','',NULL,NULL,'','2018-11-08 21:20:19','2018-11-08 21:20:19'),(4,'5','测试内容',NULL,NULL,'201806091126','2018-06-09 23:32:53','2018-06-09 23:32:53'),(5,'6','测试内容',NULL,NULL,'201806091126','2018-06-09 23:34:02','2018-06-09 23:34:02'),(6,'7','测试内容',NULL,NULL,'201806091126','2018-06-09 23:35:30','2018-06-09 23:35:30'),(7,'8','测试内容',NULL,NULL,'201806091126','2018-06-09 23:37:31','2018-06-09 23:37:31'),(8,'9','测试内容',NULL,NULL,'201806091126','2018-06-09 23:38:34','2018-06-09 23:38:34');
/*!40000 ALTER TABLE `sys_announcement_changed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_code`
--

DROP TABLE IF EXISTS `sys_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_code` (
  `ID` int(11) NOT NULL,
  `CLASSIFY` varchar(64) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `CODE_NAME` varchar(32) DEFAULT NULL,
  `DISPLAY_SN` int(11) DEFAULT NULL,
  `PARENT_ID` varchar(255) DEFAULT NULL,
  `SCENE1` varchar(255) DEFAULT NULL,
  `SCENE2` varchar(255) DEFAULT NULL,
  `SCENE3` varchar(255) DEFAULT NULL,
  `ENABLE` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_code`
--

LOCK TABLES `sys_code` WRITE;
/*!40000 ALTER TABLE `sys_code` DISABLE KEYS */;
INSERT INTO `sys_code` VALUES (2,'YesOrNo','0','否',2,'','','','','','2018-06-07 19:24:52','2018-11-06 21:54:07'),(4,'WorksheetState','0','作废',4,'','','','','','2018-06-14 22:56:24','2018-11-06 21:54:07'),(5,'WorksheetState','2','完成',2,'','','','','','2018-06-14 22:56:24','2018-11-06 21:54:07'),(6,'WorksheetState','3','暂停',3,'','','','','','2018-06-14 22:56:24','2018-11-06 21:54:07'),(7,'WorksheetState','1','运行中',1,'','','','','','2018-06-14 22:56:24','2018-11-06 21:54:07'),(8,'Gender','1','男',2,'','','','','','2018-06-14 23:08:34','2018-11-06 21:54:07'),(9,'Gender','0','女',4,'','','','','','2018-06-14 23:08:34','2018-12-28 23:12:03'),(10,'Gender','2','其他',3,'','','','','','2018-06-14 23:08:34','2018-12-25 20:50:20'),(11,'OpenOrClose','1','开启',2,'','','','','','2018-06-14 23:08:34','2018-12-25 20:50:33'),(12,'OpenOrClose','0','关闭',1,'','','','','','2018-06-14 23:08:34','2018-12-25 20:50:33'),(31,'YesOrNo','1','是',1,NULL,NULL,NULL,NULL,NULL,'2018-12-25 20:50:07','2018-12-25 20:50:07');
/*!40000 ALTER TABLE `sys_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_department`
--

DROP TABLE IF EXISTS `sys_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_department` (
  `ID` int(11) NOT NULL COMMENT '标识',
  `NAME` varchar(64) NOT NULL COMMENT '部门名称',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '上级组织标识',
  `LEVEL` int(11) DEFAULT NULL COMMENT '级别，后续可控制启用',
  `CREA` varchar(45) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NOT NULL COMMENT '修改时间',
  `sn` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_department`
--

LOCK TABLES `sys_department` WRITE;
/*!40000 ALTER TABLE `sys_department` DISABLE KEYS */;
INSERT INTO `sys_department` VALUES (1,'山东',0,1,NULL,'2019-01-02 10:51:26','2019-01-02 10:51:26',1),(2,'济南',1,2,NULL,'2019-01-02 10:51:48','2019-01-02 10:51:48',1),(3,'烟台',1,2,NULL,'2019-01-02 10:51:48','2019-01-02 10:51:48',2);
/*!40000 ALTER TABLE `sys_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_entity_filter`
--

DROP TABLE IF EXISTS `sys_entity_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_entity_filter` (
  `ID` int(11) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `FILTER` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
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
  `ID` int(11) NOT NULL COMMENT '标识',
  `CODE` varchar(32) DEFAULT NULL COMMENT '扩展属性编码',
  `NAME` varchar(32) DEFAULT NULL COMMENT '扩展属性名称',
  `QUERY` varchar(255) DEFAULT NULL COMMENT '查询语句',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_extend_property`
--

LOCK TABLES `sys_extend_property` WRITE;
/*!40000 ALTER TABLE `sys_extend_property` DISABLE KEYS */;
INSERT INTO `sys_extend_property` VALUES (1,'YesOrNo','是否','SELECT CODE,CODE_NAME,\'\' FILETER FROM SYS_CODE  WHERE CLASSIFY=\'YesOrNo\' ORDER BY DISPLAY_SN','2018-06-07 19:24:18','2018-11-06 21:55:47'),(2,'WorksheetState','工作单状态','SELECT CODE,CODE_NAME,\'\' FILETER FROM SYS_CODE WHERE CLASSIFY=\'WorksheetState\' ORDER BY DISPLAY_SN','2018-06-14 22:55:07','2018-11-06 21:55:47');
/*!40000 ALTER TABLE `sys_extend_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `ID` int(11) NOT NULL COMMENT '菜单标识',
  `LEVEL` int(11) DEFAULT NULL COMMENT '菜单层级',
  `LINK` varchar(64) DEFAULT NULL COMMENT '链接',
  `NAME` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '父菜单标识',
  `SN` int(11) DEFAULT NULL COMMENT '带单序号',
  `IS_CROSS_DOMAIN` varchar(8) DEFAULT NULL COMMENT '是否跨域',
  `ICON` varchar(64) DEFAULT NULL COMMENT '图标',
  `ENABLE` varchar(8) DEFAULT NULL COMMENT '是否可用',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,1,'sys/code/code','映射',0,3,'','fa fa-camera-retro','1','2018-06-07 19:09:29','2018-12-20 21:42:11'),(4,1,'','工作流管理',0,NULL,NULL,'fa fa-telegram','0','2018-06-09 22:45:08','2019-01-03 17:05:05'),(6,2,'http://localhost:8081/bootworkflow/oll/instance/process-list','工作流管理',4,3,'true',NULL,'1','2018-04-05 20:09:35','2018-12-20 21:42:11'),(7,2,'','节点管理',4,2,NULL,NULL,'1','2018-04-05 20:09:44','2019-01-02 15:48:55'),(8,2,'sys/assistant/generateEntity','实体映射（数据库）',1,1,NULL,NULL,'1','2018-04-27 15:33:08','2019-01-02 15:48:55'),(9,2,'sys/menu/','菜单管理',15,1,NULL,NULL,'1','2018-04-09 23:19:03','2019-01-02 15:48:49'),(11,2,'sys/role/','角色管理',15,2,NULL,NULL,'1','2018-04-09 23:47:46','2018-12-20 21:42:11'),(13,2,'sys/admin/','操作员管理',15,4,NULL,NULL,'1','2018-04-09 23:50:10','2018-12-20 21:42:11'),(14,2,'sys/department/','组织管理',15,5,NULL,NULL,'1','2018-04-09 23:50:19','2019-01-02 10:39:39'),(15,1,'','系统维护',0,1,'','fa fa-cloud-upload','1','2018-04-23 17:34:11','2018-12-20 23:19:41'),(16,2,'sys/config/entityFilterParamConfig','实体过滤字',1,5,NULL,NULL,'1','2018-04-23 17:36:34','2018-12-20 21:42:11'),(17,2,'sys/assistant/generateEntityOom','实体映射（oom）',1,0,NULL,NULL,'1','2018-04-27 15:43:48','2019-01-02 15:48:55'),(395,2,'http://localhost:8081/bootworkflow/oll/model/model-list','模型列表',4,4,'true',NULL,'1','2018-05-30 18:14:11','2018-12-20 21:42:11'),(396,1,'','个人设置',0,4,'','fa fa-user-circle-o','1','2018-05-31 18:24:45','2018-12-20 23:19:41'),(397,2,'','密码修改',396,2,'',NULL,'1','2018-05-31 18:24:55','2018-12-20 23:19:41'),(398,2,'','基本信息',396,1,NULL,NULL,'1','2018-05-31 18:25:06','2018-12-25 20:52:20'),(401,1,'','工作流测试',0,NULL,NULL,'fa fa-adjust','1','2018-06-06 17:25:24','2019-01-02 15:48:55'),(402,2,'sys/workflow/announcement/apply','公告申请流程',401,1,'',NULL,'1','2018-06-06 17:26:00','2018-12-20 23:19:41'),(406,2,'sys/code/','代码管理',15,1,NULL,NULL,'1','2018-06-07 19:20:54','2018-12-20 23:19:41'),(407,2,'sys/extendproperty/','扩展属性',15,6,NULL,NULL,'1','2018-06-07 19:22:52','2018-12-20 23:19:41'),(409,2,'/sys/worksheet/query','工作单查询',4,5,NULL,NULL,'1','2018-06-12 22:49:20','2018-12-20 23:19:41');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_role`
--

DROP TABLE IF EXISTS `sys_menu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_role` (
  `ID` int(11) NOT NULL COMMENT '标识',
  `MENU_ID` int(11) DEFAULT NULL COMMENT '菜单标识',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色标识',
  `PERMISSION` tinyint(4) DEFAULT NULL COMMENT '权限数，例如1+2+4+8的结果',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单角色关联表，用来保存菜单和角色的多对多关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_role`
--

LOCK TABLES `sys_menu_role` WRITE;
/*!40000 ALTER TABLE `sys_menu_role` DISABLE KEYS */;
INSERT INTO `sys_menu_role` VALUES (1,402,1,3,'2018-12-28 23:12:22','2018-12-28 23:12:22'),(2,6,1,3,'2019-01-02 10:38:40','2019-01-02 10:38:40'),(25,4,1,1,'2018-12-28 00:08:23','2018-12-28 00:08:23'),(26,4,1,3,'2018-12-28 00:08:37','2018-12-28 00:08:37'),(27,7,1,1,'2018-12-28 00:10:39','2018-12-28 00:10:39');
/*!40000 ALTER TABLE `sys_menu_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_visit_log`
--

DROP TABLE IF EXISTS `sys_menu_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_visit_log` (
  `ID` int(11) NOT NULL,
  `MENU_ID` int(11) DEFAULT NULL,
  `VISIT_TIME` datetime DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_visit_log`
--

LOCK TABLES `sys_menu_visit_log` WRITE;
/*!40000 ALTER TABLE `sys_menu_visit_log` DISABLE KEYS */;
INSERT INTO `sys_menu_visit_log` VALUES (1,1,'2018-11-12 22:21:05','2018-11-12 22:21:05','2018-11-12 22:21:05'),(2,1,'2018-11-12 22:21:08','2018-11-12 22:21:08','2018-11-12 22:21:08'),(3,1,'2018-11-12 22:21:09','2018-11-12 22:21:09','2018-11-12 22:21:09'),(4,17,'2018-11-12 22:21:10','2018-11-12 22:21:10','2018-11-12 22:21:10'),(5,1,'2018-11-12 22:21:37','2018-11-12 22:21:37','2018-11-12 22:21:37'),(6,1,'2018-11-12 22:21:38','2018-11-12 22:21:38','2018-11-12 22:21:38'),(7,409,'2018-11-12 22:21:41','2018-11-12 22:21:41','2018-11-12 22:21:41'),(8,9,'2018-06-07 18:01:01','2018-06-07 18:01:01','2018-06-07 18:01:01'),(9,9,'2018-06-07 18:01:04','2018-06-07 18:01:04','2018-06-07 18:01:04'),(10,9,'2018-06-07 18:01:07','2018-06-07 18:01:07','2018-06-07 18:01:07'),(11,9,'2018-06-07 18:01:09','2018-06-07 18:01:09','2018-06-07 18:01:09'),(12,11,'2018-06-07 18:01:11','2018-06-07 18:01:11','2018-06-07 18:01:11'),(13,11,'2018-06-07 18:01:13','2018-06-07 18:01:13','2018-06-07 18:01:13'),(14,13,'2018-06-07 18:01:14','2018-06-07 18:01:14','2018-06-07 18:01:14'),(15,11,'2018-06-07 18:01:18','2018-06-07 18:01:18','2018-06-07 18:01:18'),(16,13,'2018-06-07 18:01:24','2018-06-07 18:01:24','2018-06-07 18:01:24'),(17,17,'2018-06-07 18:01:27','2018-06-07 18:01:27','2018-06-07 18:01:27'),(18,9,'2018-06-07 18:01:33','2018-06-07 18:01:33','2018-06-07 18:01:33'),(19,11,'2018-06-07 18:01:34','2018-06-07 18:01:34','2018-06-07 18:01:34'),(20,13,'2018-06-07 18:01:37','2018-06-07 18:01:37','2018-06-07 18:01:37'),(21,17,'2018-06-07 18:01:40','2018-06-07 18:01:40','2018-06-07 18:01:40'),(22,8,'2018-06-07 18:01:42','2018-06-07 18:01:42','2018-06-07 18:01:42'),(23,16,'2018-06-07 18:01:44','2018-06-07 18:01:44','2018-06-07 18:01:44'),(24,5,'2018-06-07 18:01:51','2018-06-07 18:01:51','2018-06-07 18:01:51'),(25,6,'2018-06-07 18:01:54','2018-06-07 18:01:54','2018-06-07 18:01:54'),(26,395,'2018-06-07 18:01:55','2018-06-07 18:01:55','2018-06-07 18:01:55'),(27,6,'2018-06-07 18:01:59','2018-06-07 18:01:59','2018-06-07 18:01:59'),(28,402,'2018-06-07 18:02:09','2018-06-07 18:02:09','2018-06-07 18:02:09'),(29,402,'2018-06-07 18:02:27','2018-06-07 18:02:28','2018-06-07 18:02:28'),(30,9,'2018-06-07 18:03:16','2018-06-07 18:03:16','2018-06-07 18:03:16'),(31,13,'2018-06-07 18:03:21','2018-06-07 18:03:21','2018-06-07 18:03:21'),(32,13,'2018-06-07 18:03:37','2018-06-07 18:03:37','2018-06-07 18:03:37'),(33,11,'2018-06-07 18:03:40','2018-06-07 18:03:40','2018-06-07 18:03:40'),(34,402,'2018-06-07 18:04:11','2018-06-07 18:04:12','2018-06-07 18:04:12'),(35,9,'2018-06-07 18:04:21','2018-06-07 18:04:21','2018-06-07 18:04:21'),(36,17,'2018-06-07 18:04:35','2018-06-07 18:04:35','2018-06-07 18:04:35'),(37,17,'2018-06-07 18:05:23','2018-06-07 18:05:23','2018-06-07 18:05:23'),(38,5,'2018-06-07 18:13:39','2018-06-07 18:13:39','2018-06-07 18:13:39'),(39,6,'2018-06-07 18:13:41','2018-06-07 18:13:41','2018-06-07 18:13:41'),(40,395,'2018-06-07 18:13:42','2018-06-07 18:13:42','2018-06-07 18:13:42'),(41,5,'2018-06-07 19:03:35','2018-06-07 19:03:35','2018-06-07 19:03:35'),(42,6,'2018-06-07 19:03:37','2018-06-07 19:03:37','2018-06-07 19:03:37'),(43,9,'2018-06-07 19:08:48','2018-06-07 19:08:48','2018-06-07 19:08:48'),(44,9,'2018-06-07 19:12:40','2018-06-07 19:12:40','2018-06-07 19:12:40'),(45,9,'2018-06-07 19:17:56','2018-06-07 19:17:56','2018-06-07 19:17:56'),(46,9,'2018-06-07 19:20:05','2018-06-07 19:20:05','2018-06-07 19:20:05'),(47,1,'2018-06-07 19:20:18','2018-06-07 19:20:18','2018-06-07 19:20:18'),(48,1,'2018-06-07 19:20:24','2018-06-07 19:20:24','2018-06-07 19:20:24'),(49,1,'2018-06-07 19:20:26','2018-06-07 19:20:26','2018-06-07 19:20:26'),(50,9,'2018-06-07 19:20:28','2018-06-07 19:20:28','2018-06-07 19:20:28'),(51,1,'2018-06-07 19:21:26','2018-06-07 19:21:26','2018-06-07 19:21:26'),(52,1,'2018-06-07 19:21:28','2018-06-07 19:21:28','2018-06-07 19:21:28'),(53,1,'2018-06-07 19:21:37','2018-06-07 19:21:37','2018-06-07 19:21:37'),(54,9,'2018-06-07 19:21:39','2018-06-07 19:21:39','2018-06-07 19:21:39'),(55,9,'2018-06-07 19:22:05','2018-06-07 19:22:05','2018-06-07 19:22:05'),(56,406,'2018-06-07 19:22:59','2018-06-07 19:22:59','2018-06-07 19:22:59'),(57,407,'2018-06-07 19:23:02','2018-06-07 19:23:02','2018-06-07 19:23:02'),(58,407,'2018-06-07 19:25:06','2018-06-07 19:25:06','2018-06-07 19:25:06'),(59,406,'2018-06-07 19:25:10','2018-06-07 19:25:10','2018-06-07 19:25:10'),(60,406,'2018-06-07 22:45:32','2018-06-07 22:45:33','2018-06-07 22:45:33'),(61,9,'2018-06-07 22:45:34','2018-06-07 22:45:34','2018-06-07 22:45:34'),(62,406,'2018-06-07 22:45:36','2018-06-07 22:45:36','2018-06-07 22:45:36'),(63,11,'2018-06-07 22:45:37','2018-06-07 22:45:37','2018-06-07 22:45:37'),(64,11,'2018-06-07 22:52:00','2018-06-07 22:52:00','2018-06-07 22:52:00'),(65,11,'2018-06-07 22:52:03','2018-06-07 22:52:03','2018-06-07 22:52:03'),(66,11,'2018-06-07 22:53:51','2018-06-07 22:53:51','2018-06-07 22:53:51'),(67,11,'2018-06-07 22:53:54','2018-06-07 22:53:54','2018-06-07 22:53:54'),(68,11,'2018-06-07 22:53:58','2018-06-07 22:53:58','2018-06-07 22:53:58'),(69,11,'2018-06-07 22:55:26','2018-06-07 22:55:26','2018-06-07 22:55:26'),(70,9,'2018-06-07 22:56:53','2018-06-07 22:56:53','2018-06-07 22:56:53'),(71,9,'2018-06-07 23:03:10','2018-06-07 23:03:10','2018-06-07 23:03:10'),(72,9,'2018-06-07 23:03:11','2018-06-07 23:03:11','2018-06-07 23:03:11'),(73,9,'2018-06-07 23:03:12','2018-06-07 23:03:12','2018-06-07 23:03:12'),(74,9,'2018-06-07 23:03:14','2018-06-07 23:03:14','2018-06-07 23:03:14'),(75,9,'2018-06-07 23:03:26','2018-06-07 23:03:26','2018-06-07 23:03:26'),(76,9,'2018-06-07 23:03:29','2018-06-07 23:03:29','2018-06-07 23:03:29'),(77,9,'2018-06-07 23:03:32','2018-06-07 23:03:32','2018-06-07 23:03:32'),(78,9,'2018-06-07 23:15:13','2018-06-07 23:15:13','2018-06-07 23:15:13'),(79,406,'2018-06-07 23:15:15','2018-06-07 23:15:15','2018-06-07 23:15:15'),(80,11,'2018-06-07 23:15:17','2018-06-07 23:15:17','2018-06-07 23:15:17'),(81,406,'2018-06-07 23:15:19','2018-06-07 23:15:19','2018-06-07 23:15:19'),(82,11,'2018-06-07 23:15:22','2018-06-07 23:15:22','2018-06-07 23:15:22'),(83,9,'2018-06-07 23:15:24','2018-06-07 23:15:24','2018-06-07 23:15:24'),(84,9,'2018-06-07 23:15:26','2018-06-07 23:15:26','2018-06-07 23:15:26'),(85,9,'2018-06-07 23:15:29','2018-06-07 23:15:29','2018-06-07 23:15:29'),(86,9,'2018-06-07 23:15:31','2018-06-07 23:15:31','2018-06-07 23:15:31'),(87,9,'2018-06-07 23:15:34','2018-06-07 23:15:34','2018-06-07 23:15:34'),(88,9,'2018-06-07 23:15:36','2018-06-07 23:15:36','2018-06-07 23:15:36'),(89,11,'2018-06-07 23:16:09','2018-06-07 23:16:09','2018-06-07 23:16:09'),(90,406,'2018-06-07 23:16:10','2018-06-07 23:16:10','2018-06-07 23:16:10'),(91,407,'2018-06-07 23:16:29','2018-06-07 23:16:29','2018-06-07 23:16:29'),(92,402,'2018-06-07 23:16:43','2018-06-07 23:16:43','2018-06-07 23:16:43'),(93,1,'2018-06-09 22:43:20','2018-06-09 22:43:21','2018-06-09 22:43:21'),(94,9,'2018-06-09 22:43:32','2018-06-09 22:43:32','2018-06-09 22:43:32'),(95,395,'2018-06-09 22:45:37','2018-06-09 22:45:37','2018-06-09 22:45:37'),(96,402,'2018-06-09 22:48:34','2018-06-09 22:48:34','2018-06-09 22:48:34'),(97,402,'2018-06-09 22:59:11','2018-06-09 22:59:11','2018-06-09 22:59:11'),(98,402,'2018-06-09 23:26:10','2018-06-09 23:26:10','2018-06-09 23:26:10'),(99,6,'2018-06-10 21:18:21','2018-06-10 21:18:22','2018-06-10 21:18:22'),(100,395,'2018-06-10 21:19:02','2018-06-10 21:19:02','2018-06-10 21:19:02'),(101,6,'2018-06-10 21:20:32','2018-06-10 21:20:32','2018-06-10 21:20:32'),(102,395,'2018-06-10 21:23:59','2018-06-10 21:23:59','2018-06-10 21:23:59'),(103,6,'2018-06-10 21:24:10','2018-06-10 21:24:10','2018-06-10 21:24:10'),(104,395,'2018-06-11 22:52:16','2018-06-11 22:52:16','2018-06-11 22:52:16'),(105,6,'2018-06-11 22:53:47','2018-06-11 22:53:47','2018-06-11 22:53:47'),(106,402,'2018-06-11 22:54:21','2018-06-11 22:54:21','2018-06-11 22:54:21'),(107,9,'2018-06-11 23:00:18','2018-06-11 23:00:19','2018-06-11 23:00:19'),(108,395,'2018-06-11 23:02:35','2018-06-11 23:02:35','2018-06-11 23:02:35'),(109,395,'2018-06-11 23:17:18','2018-06-11 23:17:18','2018-06-11 23:17:18'),(110,402,'2018-06-11 23:29:05','2018-06-11 23:29:09','2018-06-11 23:29:09'),(111,395,'2018-06-11 23:34:08','2018-06-11 23:34:08','2018-06-11 23:34:08'),(112,395,'2018-06-11 23:36:27','2018-06-11 23:36:30','2018-06-11 23:36:30'),(113,395,'2018-06-12 22:46:11','2018-06-12 22:46:12','2018-06-12 22:46:12'),(114,6,'2018-06-12 22:46:28','2018-06-12 22:46:28','2018-06-12 22:46:28'),(115,395,'2018-06-12 22:46:44','2018-06-12 22:46:44','2018-06-12 22:46:44'),(116,9,'2018-06-12 22:48:58','2018-06-12 22:48:58','2018-06-12 22:48:58'),(117,409,'2018-06-12 23:11:58','2018-06-12 23:11:58','2018-06-12 23:11:58'),(118,409,'2018-06-13 22:55:52','2018-06-13 22:55:52','2018-06-13 22:55:52'),(119,409,'2018-06-13 22:56:31','2018-06-13 22:56:31','2018-06-13 22:56:31'),(120,409,'2018-06-13 23:00:45','2018-06-13 23:00:46','2018-06-13 23:00:46'),(121,409,'2018-06-13 23:10:07','2018-06-13 23:10:10','2018-06-13 23:10:10'),(122,409,'2018-06-13 23:17:16','2018-06-13 23:17:16','2018-06-13 23:17:16'),(123,409,'2018-06-14 22:47:40','2018-06-14 22:47:41','2018-06-14 22:47:41'),(124,409,'2018-06-14 22:49:08','2018-06-14 22:49:08','2018-06-14 22:49:08'),(125,409,'2018-06-14 22:49:23','2018-06-14 22:49:23','2018-06-14 22:49:23'),(126,409,'2018-06-14 22:50:24','2018-06-14 22:50:24','2018-06-14 22:50:24'),(127,409,'2018-06-14 22:51:00','2018-06-14 22:51:00','2018-06-14 22:51:00'),(128,407,'2018-06-14 22:51:14','2018-06-14 22:51:14','2018-06-14 22:51:14'),(129,406,'2018-06-14 22:55:10','2018-06-14 22:55:10','2018-06-14 22:55:10'),(130,9,'2018-06-14 23:17:03','2018-06-14 23:17:03','2018-06-14 23:17:03'),(131,406,'2018-06-14 23:17:17','2018-06-14 23:17:17','2018-06-14 23:17:17'),(132,11,'2018-06-14 23:17:18','2018-06-14 23:17:18','2018-06-14 23:17:18'),(133,13,'2018-06-14 23:17:22','2018-06-14 23:17:22','2018-06-14 23:17:22'),(134,1,'2018-06-14 23:17:26','2018-06-14 23:17:26','2018-06-14 23:17:26'),(135,17,'2018-06-14 23:17:30','2018-06-14 23:17:30','2018-06-14 23:17:30'),(136,1,'2018-06-14 23:26:53','2018-06-14 23:26:53','2018-06-14 23:26:53'),(137,1,'2018-06-14 23:30:39','2018-06-14 23:30:39','2018-06-14 23:30:39'),(138,16,'2018-06-14 23:30:43','2018-06-14 23:30:43','2018-06-14 23:30:43'),(139,17,'2018-06-14 23:30:46','2018-06-14 23:30:46','2018-06-14 23:30:46'),(140,13,'2018-06-14 23:30:57','2018-06-14 23:30:57','2018-06-14 23:30:57'),(141,13,'2018-06-14 23:31:04','2018-06-14 23:31:04','2018-06-14 23:31:04'),(142,407,'2018-06-14 23:31:08','2018-06-14 23:31:08','2018-06-14 23:31:08'),(143,409,'2018-06-14 23:31:16','2018-06-14 23:31:16','2018-06-14 23:31:16'),(144,402,'2018-06-14 23:31:34','2018-06-14 23:31:34','2018-06-14 23:31:34'),(145,9,'2018-06-14 23:36:58','2018-06-14 23:36:58','2018-06-14 23:36:58'),(146,9,'2018-06-14 23:38:38','2018-06-14 23:38:38','2018-06-14 23:38:38'),(147,407,'2018-06-14 23:38:44','2018-06-14 23:38:44','2018-06-14 23:38:44'),(148,9,'2018-09-29 22:13:13','2018-09-29 22:13:19','2018-09-29 22:13:19'),(149,406,'2018-09-29 22:13:33','2018-09-29 22:13:33','2018-09-29 22:13:33'),(150,406,'2018-09-29 22:13:37','2018-09-29 22:13:37','2018-09-29 22:13:37'),(151,11,'2018-09-29 22:13:38','2018-09-29 22:13:38','2018-09-29 22:13:38'),(152,1,'2018-09-29 22:14:03','2018-09-29 22:14:04','2018-09-29 22:14:04'),(153,402,'2018-09-29 22:14:08','2018-09-29 22:14:08','2018-09-29 22:14:08'),(154,409,'2018-09-29 22:14:11','2018-09-29 22:14:11','2018-09-29 22:14:11'),(155,6,'2018-09-29 22:14:17','2018-09-29 22:14:17','2018-09-29 22:14:17'),(156,395,'2018-09-29 22:14:18','2018-09-29 22:14:18','2018-09-29 22:14:18'),(157,409,'2018-10-02 23:24:21','2018-10-02 23:24:22','2018-10-02 23:24:22'),(158,6,'2018-10-02 23:24:25','2018-10-02 23:24:25','2018-10-02 23:24:25'),(159,402,'2018-10-02 23:24:30','2018-10-02 23:24:30','2018-10-02 23:24:30'),(160,402,'2018-10-02 23:24:58','2018-10-02 23:24:58','2018-10-02 23:24:58'),(161,9,'2018-10-02 23:25:00','2018-10-02 23:25:00','2018-10-02 23:25:00'),(162,406,'2018-10-02 23:25:01','2018-10-02 23:25:02','2018-10-02 23:25:02'),(163,11,'2018-10-02 23:25:03','2018-10-02 23:25:03','2018-10-02 23:25:03'),(164,13,'2018-10-02 23:25:10','2018-10-02 23:25:10','2018-10-02 23:25:10'),(165,407,'2018-10-02 23:25:12','2018-10-02 23:25:12','2018-10-02 23:25:12'),(166,1,'2018-10-02 23:25:15','2018-10-02 23:25:15','2018-10-02 23:25:15'),(167,17,'2018-10-02 23:25:16','2018-10-02 23:25:16','2018-10-02 23:25:16'),(168,8,'2018-10-02 23:25:17','2018-10-02 23:25:17','2018-10-02 23:25:17'),(169,1,'2018-10-02 23:25:28','2018-10-02 23:25:28','2018-10-02 23:25:28'),(170,407,'2018-10-02 23:25:35','2018-10-02 23:25:35','2018-10-02 23:25:35'),(171,409,'2018-10-08 22:24:17','2018-10-08 22:24:18','2018-10-08 22:24:18'),(172,6,'2018-10-08 22:24:20','2018-10-08 22:24:20','2018-10-08 22:24:20'),(173,402,'2018-10-08 22:24:26','2018-10-08 22:24:26','2018-10-08 22:24:26'),(174,395,'2018-10-08 22:24:32','2018-10-08 22:24:32','2018-10-08 22:24:32'),(175,9,'2018-10-08 22:37:44','2018-10-08 22:37:44','2018-10-08 22:37:44'),(176,409,'2018-10-09 21:56:47','2018-10-09 21:56:47','2018-10-09 21:56:47'),(177,6,'2018-10-09 21:57:30','2018-10-09 21:57:31','2018-10-09 21:57:31'),(178,395,'2018-10-09 22:00:51','2018-10-09 22:00:51','2018-10-09 22:00:51'),(179,409,'2018-10-09 22:00:58','2018-10-09 22:00:58','2018-10-09 22:00:58'),(180,6,'2018-10-09 22:00:59','2018-10-09 22:00:59','2018-10-09 22:00:59'),(181,395,'2018-10-09 22:01:00','2018-10-09 22:01:00','2018-10-09 22:01:00'),(182,402,'2018-10-09 22:01:04','2018-10-09 22:01:04','2018-10-09 22:01:04'),(183,6,'2018-10-09 22:01:43','2018-10-09 22:01:43','2018-10-09 22:01:43'),(184,402,'2018-10-09 22:02:03','2018-10-09 22:02:04','2018-10-09 22:02:04'),(185,409,'2018-10-10 21:10:57','2018-10-10 21:10:58','2018-10-10 21:10:58'),(186,6,'2018-10-10 21:11:00','2018-10-10 21:11:00','2018-10-10 21:11:00'),(187,395,'2018-10-12 22:17:47','2018-10-12 22:17:48','2018-10-12 22:17:48'),(188,6,'2018-10-12 22:25:23','2018-10-12 22:25:23','2018-10-12 22:25:23'),(189,402,'2018-10-12 22:26:10','2018-10-12 22:26:10','2018-10-12 22:26:10'),(190,6,'2018-10-12 22:26:46','2018-10-12 22:26:46','2018-10-12 22:26:46'),(191,409,'2018-10-12 22:28:24','2018-10-12 22:28:24','2018-10-12 22:28:24'),(192,6,'2018-10-12 22:29:28','2018-10-12 22:29:28','2018-10-12 22:29:28'),(193,6,'2018-10-12 22:29:40','2018-10-12 22:29:40','2018-10-12 22:29:40'),(194,402,'2018-10-12 22:30:02','2018-10-12 22:30:02','2018-10-12 22:30:02'),(195,409,'2018-10-13 19:23:00','2018-10-13 19:23:00','2018-10-13 19:23:00'),(196,6,'2018-10-13 19:23:03','2018-10-13 19:23:03','2018-10-13 19:23:03'),(197,402,'2018-10-13 22:49:53','2018-10-13 22:49:53','2018-10-13 22:49:53'),(198,402,'2018-10-14 11:18:16','2018-10-14 11:18:17','2018-10-14 11:18:17'),(199,6,'2018-10-14 11:30:23','2018-10-14 11:30:24','2018-10-14 11:30:24'),(200,409,'2018-10-14 11:30:28','2018-10-14 11:30:28','2018-10-14 11:30:28'),(201,402,'2018-10-14 11:31:27','2018-10-14 11:31:27','2018-10-14 11:31:27'),(202,9,'2018-10-14 17:28:43','2018-10-14 17:28:43','2018-10-14 17:28:43'),(203,1,'2018-10-14 18:03:15','2018-10-14 18:03:15','2018-10-14 18:03:15'),(204,6,'2018-10-14 18:15:44','2018-10-14 18:15:44','2018-10-14 18:15:44'),(205,409,'2018-10-14 22:04:31','2018-10-14 22:04:31','2018-10-14 22:04:31'),(206,6,'2018-10-14 22:13:50','2018-10-14 22:13:50','2018-10-14 22:13:50'),(207,9,'2018-10-16 21:26:43','2018-10-16 21:26:43','2018-10-16 21:26:43'),(208,402,'2018-10-16 22:01:00','2018-10-16 22:01:00','2018-10-16 22:01:00'),(209,409,'2018-10-16 22:02:43','2018-10-16 22:02:43','2018-10-16 22:02:43'),(210,9,'2018-10-16 22:02:48','2018-10-16 22:02:48','2018-10-16 22:02:48'),(211,9,'2018-10-16 22:03:12','2018-10-16 22:03:12','2018-10-16 22:03:12'),(212,409,'2018-10-17 20:45:57','2018-10-17 20:45:57','2018-10-17 20:45:57'),(213,9,'2018-10-17 20:46:05','2018-10-17 20:46:05','2018-10-17 20:46:05'),(214,409,'2018-10-17 22:42:13','2018-10-17 22:42:13','2018-10-17 22:42:13'),(215,6,'2018-10-17 22:42:15','2018-10-17 22:42:15','2018-10-17 22:42:15'),(216,395,'2018-10-17 22:42:15','2018-10-17 22:42:16','2018-10-17 22:42:16'),(217,402,'2018-10-17 22:42:19','2018-10-17 22:42:19','2018-10-17 22:42:19'),(218,406,'2018-10-17 22:42:21','2018-10-17 22:42:21','2018-10-17 22:42:21'),(219,9,'2018-10-17 22:42:49','2018-10-17 22:42:49','2018-10-17 22:42:49'),(220,409,'2018-10-17 22:44:48','2018-10-17 22:44:49','2018-10-17 22:44:49'),(221,6,'2018-10-17 22:58:10','2018-10-17 22:58:10','2018-10-17 22:58:10'),(222,395,'2018-10-17 22:58:15','2018-10-17 22:58:15','2018-10-17 22:58:15'),(223,406,'2018-10-17 22:58:20','2018-10-17 22:58:20','2018-10-17 22:58:20'),(224,9,'2018-10-17 22:58:30','2018-10-17 22:58:30','2018-10-17 22:58:30'),(225,409,'2018-10-17 23:04:02','2018-10-17 23:04:02','2018-10-17 23:04:02'),(226,402,'2018-10-17 23:04:04','2018-10-17 23:04:04','2018-10-17 23:04:04'),(227,406,'2018-10-17 23:08:05','2018-10-17 23:08:05','2018-10-17 23:08:05'),(228,11,'2018-10-17 23:08:06','2018-10-17 23:08:06','2018-10-17 23:08:06'),(229,13,'2018-10-17 23:15:16','2018-10-17 23:15:16','2018-10-17 23:15:16'),(230,407,'2018-10-17 23:15:22','2018-10-17 23:15:22','2018-10-17 23:15:22'),(231,9,'2018-10-17 23:15:30','2018-10-17 23:15:30','2018-10-17 23:15:30'),(232,406,'2018-10-17 23:15:31','2018-10-17 23:15:31','2018-10-17 23:15:31'),(233,11,'2018-10-17 23:15:33','2018-10-17 23:15:33','2018-10-17 23:15:33'),(234,406,'2018-10-17 23:15:34','2018-10-17 23:15:34','2018-10-17 23:15:34'),(235,11,'2018-10-17 23:15:36','2018-10-17 23:15:36','2018-10-17 23:15:36'),(236,406,'2018-10-17 23:15:37','2018-10-17 23:15:37','2018-10-17 23:15:37'),(237,9,'2018-10-17 23:15:43','2018-10-17 23:15:43','2018-10-17 23:15:43'),(238,409,'2018-10-17 23:15:46','2018-10-17 23:15:46','2018-10-17 23:15:46'),(239,402,'2018-10-17 23:15:48','2018-10-17 23:15:48','2018-10-17 23:15:48'),(240,1,'2018-10-17 23:15:49','2018-10-17 23:15:49','2018-10-17 23:15:49'),(241,17,'2018-10-17 23:15:52','2018-10-17 23:15:52','2018-10-17 23:15:52'),(242,409,'2018-11-05 22:38:39','2018-11-05 22:38:39','2018-11-05 22:38:39'),(243,402,'2018-11-05 22:39:26','2018-11-05 22:39:26','2018-11-05 22:39:26'),(244,9,'2018-11-05 22:39:31','2018-11-05 22:39:31','2018-11-05 22:39:31'),(245,9,'2018-11-06 21:20:50','2018-11-06 21:20:51','2018-11-06 21:20:51'),(246,9,'2018-11-06 21:49:42','2018-11-06 21:49:43','2018-11-06 21:49:43'),(247,1,'2018-11-06 21:51:41','2018-11-06 21:51:42','2018-11-06 21:51:42'),(248,17,'2018-11-06 21:51:42','2018-11-06 21:51:42','2018-11-06 21:51:42'),(249,406,'2018-11-06 21:53:14','2018-11-06 21:53:14','2018-11-06 21:53:14'),(250,11,'2018-11-06 21:54:23','2018-11-06 21:54:23','2018-11-06 21:54:23'),(251,13,'2018-11-06 21:55:21','2018-11-06 21:55:21','2018-11-06 21:55:21'),(252,407,'2018-11-06 21:55:25','2018-11-06 21:55:25','2018-11-06 21:55:25'),(253,402,'2018-11-06 21:56:10','2018-11-06 21:56:10','2018-11-06 21:56:10'),(254,409,'2018-11-06 21:56:33','2018-11-06 21:56:34','2018-11-06 21:56:34'),(255,1,'2018-11-06 22:03:01','2018-11-06 22:03:01','2018-11-06 22:03:01'),(256,1,'2018-11-06 22:03:02','2018-11-06 22:03:02','2018-11-06 22:03:02'),(257,1,'2018-11-06 22:03:03','2018-11-06 22:03:03','2018-11-06 22:03:03'),(258,17,'2018-11-06 22:03:04','2018-11-06 22:03:04','2018-11-06 22:03:04'),(259,8,'2018-11-06 22:03:06','2018-11-06 22:03:06','2018-11-06 22:03:06'),(260,16,'2018-11-06 22:03:08','2018-11-06 22:03:08','2018-11-06 22:03:08'),(261,402,'2018-11-08 21:11:24','2018-11-08 21:11:24','2018-11-08 21:11:24'),(262,409,'2018-11-08 21:11:27','2018-11-08 21:11:27','2018-11-08 21:11:27'),(263,395,'2018-11-08 21:20:43','2018-11-08 21:20:44','2018-11-08 21:20:44'),(264,9,'2018-11-08 21:50:57','2018-11-08 21:50:57','2018-11-08 21:50:57'),(265,395,'2018-11-08 22:02:06','2018-11-08 22:02:06','2018-11-08 22:02:06'),(266,9,'2018-11-08 22:02:53','2018-11-08 22:02:53','2018-11-08 22:02:53'),(267,395,'2018-11-08 22:03:15','2018-11-08 22:03:15','2018-11-08 22:03:15'),(268,9,'2018-11-08 22:39:08','2018-11-08 22:39:08','2018-11-08 22:39:08'),(269,9,'2018-11-08 22:43:03','2018-11-08 22:43:05','2018-11-08 22:43:05'),(270,395,'2018-11-08 22:46:57','2018-11-08 22:46:57','2018-11-08 22:46:57'),(271,9,'2018-11-08 22:48:23','2018-11-08 22:48:23','2018-11-08 22:48:23'),(272,6,'2018-11-08 22:48:46','2018-11-08 22:48:46','2018-11-08 22:48:46'),(273,395,'2018-11-08 22:48:48','2018-11-08 22:48:48','2018-11-08 22:48:48'),(274,409,'2018-11-08 22:51:35','2018-11-08 22:51:37','2018-11-08 22:51:37'),(275,6,'2018-11-08 22:51:40','2018-11-08 22:51:40','2018-11-08 22:51:40');
/*!40000 ALTER TABLE `sys_menu_visit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(8) DEFAULT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
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
  `ID` int(11) NOT NULL COMMENT '标识',
  `NAME` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'测试1','2018-09-29 22:13:50','2018-12-28 23:12:36'),(2,'测试2','2018-09-29 22:13:50','2018-12-28 23:12:36'),(3,'映射管理员','2018-05-21 17:45:12','2018-11-06 21:55:14'),(4,'工作流管理员','2018-05-21 17:45:35','2018-11-06 21:55:14');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `ENTITY_CODE` varchar(255) NOT NULL COMMENT '主键标识代码',
  `SEQUENCE_NO` int(11) NOT NULL COMMENT '标识',
  PRIMARY KEY (`ENTITY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统序列表，生成主键都应该通过该表获取';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
INSERT INTO `sys_sequence` VALUES ('cn.doublepoint.dto.domain.model.entity.sys.Code',31),('cn.doublepoint.dto.domain.model.entity.sys.ExtendProperty',6),('cn.doublepoint.dto.domain.model.entity.sys.MenuRole',27),('cn.doublepoint.dto.domain.model.entity.sys.MenuVisitLog',7),('cn.doublepoint.dto.domain.model.entity.sys.SysAdminRole',20),('cn.doublepoint.dto.domain.model.entity.sys.SysDepartment',3),('cn.doublepoint.dto.domain.model.entity.sys.SysMenuRole',2),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.AnnouncementChanged',43),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Code',12),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.ExtendProperty',2),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Menu',409),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.MenuVisitLog',275),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Role',2),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet',42),('ll.workflow.worksheetNo',44);
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `ID` int(11) NOT NULL COMMENT '标识',
  `NAME` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `LOGIN_ACCOUNT_NO` varchar(255) DEFAULT NULL COMMENT '登录账号',
  `LOGIN_PASSWORD` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`)
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
-- Table structure for table `sys_worksheet`
--

DROP TABLE IF EXISTS `sys_worksheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_worksheet` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `CLASSIFICATION` varchar(64) DEFAULT NULL COMMENT '工作单类别',
  `CREATE_USER_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `INSTANCE_ID` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `WORKSHEET_NO` varchar(255) DEFAULT NULL,
  `CREATE_USER_NAME` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_worksheet`
--

LOCK TABLES `sys_worksheet` WRITE;
/*!40000 ALTER TABLE `sys_worksheet` DISABLE KEYS */;
INSERT INTO `sys_worksheet` VALUES (1,NULL,NULL,NULL,NULL,'\"\"','1','3','liulei','2018-06-09 23:29:20','2018-06-09 23:29:20'),(2,NULL,NULL,NULL,NULL,'\"\"','1','4','liulei','2018-06-09 23:30:54','2018-06-09 23:30:54'),(3,NULL,NULL,NULL,NULL,'\"\"','1','5','liulei','2018-06-09 23:32:53','2018-06-09 23:32:53'),(4,NULL,NULL,NULL,NULL,'\"\"','1','6','liulei','2018-06-09 23:34:02','2018-06-09 23:34:02'),(5,NULL,NULL,NULL,NULL,'\"\"','1','7','liulei','2018-06-09 23:35:30','2018-06-09 23:35:30'),(6,NULL,NULL,NULL,NULL,'\"\"','1','8','liulei','2018-06-09 23:37:31','2018-06-09 23:37:31'),(7,NULL,NULL,NULL,NULL,'\"\"','1','9','liulei','2018-06-09 23:38:34','2018-06-09 23:38:34'),(8,NULL,NULL,NULL,NULL,'\"\"','1','10','liulei','2018-06-09 23:39:15','2018-06-09 23:39:15'),(9,NULL,NULL,NULL,NULL,'\"\"','1','11','liulei','2018-06-09 23:39:44','2018-06-09 23:39:44'),(10,NULL,NULL,NULL,NULL,'\"\"','1','12','liulei','2018-06-11 22:54:56','2018-06-11 22:54:56'),(11,NULL,NULL,NULL,NULL,'\"\"','1','13','liulei','2018-06-11 22:54:59','2018-06-11 22:54:59'),(18,NULL,NULL,NULL,NULL,'\"17501\"','1','20','liulei','2018-10-14 11:31:34','2018-10-14 11:31:34'),(19,NULL,NULL,NULL,NULL,'\"20019\"','1','21','liulei','2018-10-14 11:43:42','2018-10-14 11:43:42'),(20,NULL,NULL,NULL,NULL,'22501','1','22','liulei','2018-10-14 11:51:20','2018-10-14 11:51:20'),(21,NULL,NULL,NULL,NULL,'25005','1','23','liulei','2018-10-14 12:00:37','2018-10-14 12:00:37'),(22,NULL,NULL,NULL,NULL,'30005','1','24','liulei','2018-10-14 12:10:34','2018-10-14 12:10:34'),(23,NULL,NULL,NULL,NULL,'30009','1','25','liulei','2018-10-14 12:12:40','2018-10-14 12:12:40'),(24,NULL,NULL,NULL,NULL,'30013','1','26','liulei','2018-10-14 12:20:00','2018-10-14 12:20:00'),(25,NULL,NULL,NULL,NULL,'32513','1','27','liulei','2018-10-14 12:22:00','2018-10-14 12:22:00'),(26,NULL,NULL,NULL,NULL,'32527','1','28','liulei','2018-10-14 17:32:57','2018-10-14 17:32:57'),(27,NULL,NULL,NULL,NULL,'32531','1','29','liulei','2018-10-14 17:33:16','2018-10-14 17:33:16'),(28,NULL,NULL,NULL,NULL,'32535','1','30','liulei','2018-10-14 17:33:45','2018-10-14 17:33:45'),(29,NULL,NULL,NULL,NULL,'32539','1','31','liulei','2018-10-14 17:33:47','2018-10-14 17:33:47'),(30,NULL,NULL,NULL,NULL,'32543','1','32','liulei','2018-10-14 17:33:49','2018-10-14 17:33:49'),(31,NULL,NULL,NULL,NULL,'32547','1','33','liulei','2018-10-14 17:33:51','2018-10-14 17:33:51'),(32,NULL,NULL,NULL,NULL,'35045','1','34','liulei','2018-10-14 21:47:56','2018-10-14 21:47:56'),(33,NULL,NULL,NULL,NULL,'35071','1','35','liulei','2018-10-14 22:02:59','2018-10-14 22:02:59'),(34,NULL,NULL,NULL,NULL,'35097','1','36','liulei','2018-10-14 22:04:02','2018-10-14 22:04:02'),(35,NULL,NULL,NULL,NULL,'35106','1','37','liulei','2018-10-14 22:04:33','2018-10-14 22:04:33'),(36,NULL,NULL,NULL,NULL,'35132','1','38','liulei','2018-10-14 22:05:03','2018-10-14 22:05:03'),(37,NULL,NULL,NULL,NULL,'35158','1','39','liulei','2018-10-14 22:14:43','2018-10-14 22:14:43'),(38,NULL,NULL,NULL,NULL,'37509','1','40','liulei','2018-10-14 22:22:08','2018-10-14 22:22:08'),(39,NULL,NULL,NULL,NULL,'37525','1','41','liulei','2018-10-14 22:22:38','2018-10-14 22:22:38'),(40,NULL,NULL,NULL,NULL,'37539','1','42','liulei','2018-10-14 22:23:55','2018-10-14 22:23:55'),(41,NULL,NULL,NULL,NULL,'37553','1','43','liulei','2018-10-14 22:24:50','2018-10-14 22:24:50'),(42,NULL,'WF-00001',NULL,NULL,'40001','1','44','liulei','2018-11-08 21:20:19','2018-11-08 21:20:19');
/*!40000 ALTER TABLE `sys_worksheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_worksheet_aduit`
--

DROP TABLE IF EXISTS `sys_worksheet_aduit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_worksheet_aduit` (
  `ID` int(11) NOT NULL,
  `WORKSHEET_NO` varchar(255) DEFAULT NULL,
  `TASK_ID` int(11) DEFAULT NULL COMMENT '任务ID',
  `ADUIT_RESULT` varchar(8) DEFAULT NULL,
  `PEACH_NO` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-04 17:19:41
