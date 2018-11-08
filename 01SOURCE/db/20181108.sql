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
INSERT INTO `act_ge_bytearray` VALUES ('10',1,'AnnouncementApply.WF-00001.png','8','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0è\0\0\0è\0\0\0õ1R\0\0∑IDATx\⁄\Ì\›}àïuõpˇ(Z\ËèÇàzb£ï\Ëè\Ëü6\⁄ Çà\‡Åû†\Zs¶¶p™M3-™\«bzì¨©\›ÿÇ\Ë)qkC\ƒ\\\◊Uõ_3•1◊≤G7\”‘ú\∆m}ÃßôLÛ\ﬁ˚:x˜Ãú\—qè\Áú˚ÛÅã9û3cu\Ê\€u_\Áwøç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PKí$9c€∂ms◊≠[˜[ggg\“\ﬁﬁÆ*\\…™U´˛7≠&˘Pµî9ì3†Ä¢aØ^Ω:\È\Ó\ÓN<®NS\Ì›ª7Yπr\Â˛¥Å\ﬂ*™VÚ!grP|\“◊∞´¶qloo\ﬂ,™VÚ!grP\Ï\"\“0´ß“¶}H>T≠\‰C\Œ\‰(†8\÷E≥¨™¶ù»á™ï|»ôúÜ\«!\ÎØŸìl˚ÙO…óœî*\«s\Z≠\·Q>l\‘\ÂL\Œ\0\√cø:∞ow≤i\Èì\…ã\ÈWÒ\\º¶\Ÿ{xîu9ì3¿ÿØv~˘É\ZvVªæ\\®\Ÿ|xîu9ì3¿ÿØ6/a»¶Øi∂\≈\Â\√F]\Œ\‰0<ˆ´M\ÌO\rŸ¥\„5Õ∂\ÿ√£|ÿ®ÀôúÜGM[”ñ˘ê39Y”é≥\Záj\⁄Òöf[\Ï\·Q>l\‘\ÂL\Œ\0\√cø⁄∫\Ê_Ül\⁄Òöf[\Ï\·Q>l\‘\ÂL\Œ\0\√cø˙q˜\∆d”ámÉw•\œ\≈köm±áG˘∞Qó39èÉ\Í\€\œfj\⁄ÒúFkxîu9ì3¿ÿø~˘%\Ÿ˙Òø\ﬁUî>Øi∂\Â\√F]\Œ\‰0<\Ê\Ô\Í∞e\Õ?y¨Qº\Ê\Ó\≈\Â\√F]\Œ\‰0<ˆ}\ ﬂ≥uYÚ\ﬂK˛8d\√\Œ*æ\'æ◊ßˇ\rèÚ!r&gÄ\·q∏üÚ}˙/ˆ(Ú!gr˚\’p>\Â\Î”ø\Ê[\ﬂ√£|»áú\…`x\ÏW#m\ÿYiæı=< á|»ôúÜG•iÀá|»ô2<ö∂¶-Ú°)94mM[>\‰CRrh\⁄\ ®èJ\Œ`í$˘õç7∂æÛ\Œ;+gŒúπÚ\‰…áöõõìq\„\∆%MMMG\ÓªÔæÉ”ßO\ﬂˆ\¬/\ÃI\Î\ÔΩcö∂¶-Ú°)9´5ççç\€\–\–@:\ﬂ\ÃMkkZb\÷I´7≠o\”\◊\Êß_é\ÔÛnchú7o\ﬁ\Ïgü}ˆ–î)Sí7\ﬁx#Y∑n]≤{˜Ó§∑∑7	Òµªª;˘¸Ûœìt∏L|¡#=Ù\–ˆâ\'\ﬁ\„‘¥5m˘ê}H\…Yµª\„é;˛êV{Zèã√©\Â\È˜7y˜r\“!±\Âπ\Áû˚\ÂëG)\rÜáNÜk√Ü\r\…cè=v∏µµuÛm∑\›vâwS\”÷¥\ÂC>Ù!%g\’&\0óÄKN``,W´?Î§≥\ﬂ,Xv\ÔΩ˜&.<°°q†%Kñ$---=V!5mM[>\‰CRrVM\Z\Z\Z∆ç?˛ˇÚÉ`cccÚ¸Û\œ\'Àñ-Kæ˚\Óª‰ßü~*\Õ3?ˇ¸siØ\Îö5kíY≥f%w\ﬁy\Á¿Ú@aW!cp\\±b\≈\'ì&MJ∂lŸíåÜ\Ì€∑\'\È \⁄s\œ=˜¸ì®j⁄ö∂|»á>§\‰¨\n\«ﬂß\√\ﬁ\·¸\–8gŒú\“ax√±oﬂæ\“˜\«\œ\Âá\»Ù\Ô,\ﬁbY¨8\∆\‡8\‹7o∏\‚\Ôõ8q\‚\«h⁄ö∂|»á>§\‰\ÏtØ8\Ê«©SßñVG\"~.\Ô0@g÷âccWıh≠8ñ[ÅºÎÆªˆ•o\ÍX\—’¥5m˘ê}H+-éq\Ã\Ô™nkk\Î\€5=R±K{∆åwa\◊ˇ¨gU?Û\Ã3\„\«Si—¢E=çççk\≈W\”÷¥\ÂC>Ù!ex¨¥tp\Ï»Ø8û\Ï\‡ò ¨@ÆÆ˚7s˛¸˘ˇˇ—ø˛˙kr™\›ˇ˝]v_k⁄ö∂|»á>§èïó\„\…\„8\“]\’\«⁄Öù?≤ÆgùXuå\Î8\∆\Âx*\·ã/æ8hıQ\”÷¥\ÂC>Ù!ex¨ÿû\rvq≤À©\ﬁ{\Ôcı1\Ó\'…ú\Ã%yNTKKKWwP¥–¶ıèö∂¶-Ú°)\√ceswÑ\…Níâ\’¡¸Òî\Ã7qˆÄ\À¯\‘\Á¨∑|Û\Õ7ìJö5k÷Ü∏ΩOë¬ù[\∆nohh¯M[”ñ˘–áî\·±2π>z\À¡\“˜Ω¯‚ãßz\∆\…èı9\ÎƒΩ™„ñÉïÙÒ\«oO\ﬂ–ÖEwÆó˚§§i{xî˘ê3ex˝\\ΩWu\Èı+Vú\“\'.$û˚w©\œYgÚ\‰…áˆ\Ï\ŸS\—·±´´´;}Cw<\‹}üîÚ!◊¥\rèÚ!r¶è£õ\ÎÙ\œ[≥\ÁG˚DôÅ\‚N4πè˙úuöõõì\ﬁ\ﬁﬁäèÒ\œK\ﬂ\–^\·\ÓˇI)ñ\€5m√£|»áú)\√\„\Ë\Ê:≠û\Ïœ£uyûc]∂\'˜\œ\Ó≠\€7˝t8…õê\◊mi\⁄\’UÚ°j)r&g\Í¯U\Èß.á\«	&©Ù\ cOOOóï«æ˙4\Ó±y\›u◊ùQãªã\Êœüü\\p¡Cæ˛\’W_%6lÙ|˙üZ∫TÇO¸ıùè¯=øÚ\ +\«˝ûá~∏\Ôq‹¨ {¸\…\'ü»áú\rY±¬ì\œ\ÃÒrˆË£èz.\Óèw\Ó\‹)guº}çªæXyEì&M:X\Ècøˇ˛˚?;\Ê±≥Æ•cç∂n\›\⁄˜x¡Ç\…E]\‘˜\Á’´Wóm\⁄1,Z¥(nQY˙ôxÓ≠∑\ﬁJ\ÊÕõWz\‹\’\’ex¨É|¨\\π≤Ù˚\Õ~\œ^xar\’UWïG\≈\Ô˚\‚ã/îè∏\‚Cˆ¯\›w\ﬂÙ\ÿF]\ŒÚ˝$˝wÓóìÒ\„«ó*\ﬂcéï≥oæ˘¶Ùu\„∆ç\Ÿ\Ô±_oì≥˙ µcGŸìO>πµ\“g[/]∫Ùø\n|∂ı⁄∏\ ˝¿f]K\√c4\Ÿ+Øº≤‘†\”¸$\Áû{n2}˙ÙæÜ=pE1k»±\¬}˘\Âó˜´}Ú4è5ùèÅ\ﬂYgùïÃú9≥\Ô\œgûyfÚ¯„èó\«\∆;\ÀB\Ôøˇ~\Èq¨VgWl\ÿ?˚\Ï3√£úı´\»\Õ˘\Áü?‰áå∏Ü_6<∆äbñ≥\◊^{-π\‰íKJYãÀµ\ƒs\Ÿ˜VÛ≥\·Ò\‰s\Ìl\ÎQˆ\“K/ΩY\È\Î<∂µµ-*\‡u\À~¬Ø\’\·1öoπï\«¸k1dM;8p†Ø\‚πŸ≥g˜=Æ\÷°Ç\√c]\‰cˇ˛˝\…˙ı\Îc\ÔB©≤’ûx¸ı\◊_ó=\ƒa\‡äP|\…V§/^\\˙\Z∂Qó≥r{<\"s\Á\Œrx,wE\ÏVåú\∆sØø˛z≤w\Ôﬁ≤á\◊\»Y˝\‰\⁄uG\ŸO<Òw<¿oº\√L\Ô¯Ò\„ø)\⁄fÜ´Vó/_ﬁ∑“ò}4\Ê\ÿmÉeggg_\≈\Íc|≠\÷\„ç‹ûpd˘\»0à\r{<é\„\“\Œ>˚\Ï≤\ﬂÈ•óñ>@\ƒ\„µk\◊ˆ=\≈W\ÿm-geá\«\»L|X\…V\r≥\›\÷ÒÅ#é\≈\ŒèY≥≤Òzv(EV˘\ﬁ%gı\'\Ó0ì\Œá*qáô¶¶¶#uáô0u\Í\‘ˇ©‘Ω≠ó.]:ßÆ\Ô˜Xê\·`8+è˘Á≤ïÅx\«¿\ÂèKäFn8®Ø|\\s\Õ5}øﬂñññ\“\„Xuº˘\Êõ˚˚¸.√ÅYò%˘ê≥¨\Ô\\}ı’•A0r+\€1HµÚ´ãcé{=‘êXnS\Œ\Íã{[è≤ª\Ôæ˚∂i”¶™¿\Í\„ætc±>˝6âq˝Ø<\Êø?é]\ÀPøÈ¶õ˙\rè\ÂN≤—¥k;˘0~\œÒ8VÑ\Œ9\Áú~g\ f˘¸I2˘üç\‹d+\ÿÚ!g˘´<Dπ˝ˆ\€\À“ê#?±ª:\ÀS<?ìùÿï\ÔE\Ÿ\ÎrV∑\√\„≤¡.VG˚ƒô¯˚\“\ÁH\Ó\"\Âı?Î¥∂∂nå\›JßR_ì¯Òé∑1<V˜pg\‘u∂ıÆ]ª\ q\‚D\÷\–\„\‰\√c}è\◊_˝†ï\«Û\Œ;/ô2e\ qèyå’°8\‡<\Ôÿ±£Ùu”¶MÚ!g}D≥lî\Î˘\·1\¬\Ïí>oø˝ˆ∞>Ù\»Y˝Jgê\Â\Ÿp7u\Í\‘QªlOdl⁄¥iáÛ´éÖòubø|\⁄\‰{∂l\ŸrJ\«Ù\‡\È?cO:âè\ﬂ\⁄Ü:p˝XM9vOfèÛ+\’‹∞\rè£3Hf+è+NR\»Ä\»@¨ç9z\\Zˆ≥\ŸI\r\Ÿu \ÂCŒ≤\Z;vlr\À-∑îvY_{\Ìµ…ç7\ﬁ\ÿ˜°4;s`#OÒ\·7\€¿[y,\‰¯ª¥ˆfhkk;\È2\«3f\‰ès<P®Yß©©©±µµı\Á\Ó\Ó\ÓQw\Ì\⁄ıQ:<Ï∞ª∫˛ÜÉ/ª\Ï≤c~O@úo\‡qúRú ÛÙ\”O˜]o\ÕXø\√\„±.\‡Øç…ù$ì4\„µn∏°¥{≤‹ä∂|7gÒÅu\‡øûı_nxå≥lcC?TV´u/à\·qt544å\ÀNû\…V G∫;~n¿äcR\»Yß±±±e\‚ƒâFk2VcpLYèâl˝\r\Ó)+«™j>^\—FΩX}®ñ≥hx<%+ê\Õ˘2éÅåìhb±c∏gU\«\…1˘c£\n=\Î\ƒT\ﬁ\‘‘¥ˇÉ>¯\ÎIúD≥\Ô\Âó_˛SÏ™é_í®\Z5m˘ê}H\…Y5\Õ:i\Ì\À1D\∆\nu\\H<V≥]⁄±bwéâ\„±_}ı\’d¬Ñ	ø\r∏´\Õ≥\Œ\—\„“â∫≥µµµk˝˙ı=\'r\«?¸Ωt¯¸4uå£¶≠iÀá|\ËCJŒ™u\÷\…_\¬gÑe\÷)Û\∆\ﬁ\ZCdsss˜Ãô3ø¸Ë£èv§\”˜û\ÿzzz∫\‚^\’ˇ˘\‘SO-NßˆmÒF\∆\Ó¨jM[”ñ˘–áîú\’¬¨stà<t\"C£Y\Á8\‚\Í\Ï\È;\Â\Ë˝!øM´˜\Ëõ_w\∆˝\„6<\Ó£ik\⁄Ú!˙êí3≥h⁄ö∂|(√£í3@\”VÜGe£.grh\⁄\ ®l\‘\ÂL\Œ\0√£2<˙Ω»áú\…Ä¶≠iÀá|»ô2<ö∂¶-Ú°)94mM[>î\·Q\…†i+√£≤Qó394mexT6\Ír&gÄ\·Qï|»ôúÜG\ÕR”ñ˘ê3ex4mM[>\‰CRrh⁄ö∂|»á>§\‰–¥ï\·Qïúö∂2<*u9ì3@\”VÜG%r&gÄ\·Qi\⁄Ú!r&gÜG@\”÷¥\ÂC>Ù!ex4mM[>\‰CRrh⁄ö∂|(√£í3@\”VÜGe£.gr‘∂\Œ\ŒNÕ≤z™7m⁄á\‰C\’J>\‰LŒÄZµj’û\Ó\Ón\r≥\nj˜\Ó\›ˇû6\Ì\ÕÚ°j%r&g@-[∂\Ï\Ê+V¸\Âá~\Ë\—8O\ﬂ\'˝h\ÿ;“∫U>T≠\‰C\Œ\‰(®¥Q¸>˝§˘iÏ™àc]T\≈+\ﬁ˜\Õ\’⁄∞\ÂC>\‰L\Œ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0°ˇF\÷qn1\\Rı\0\0\0\0IENDÆB`Ç',1),('2',3,'source',NULL,'{\"resourceId\":\"1\",\"properties\":{\"process_id\":\"WF-00001\",\"name\":\"ÂÖ¨ÂëäÁî≥ËØ∑ÊµÅÁ®ã\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\",\"properties\":{\"overrideid\":\"\",\"name\":\"ÂºÄÂßã\\n\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\"}],\"bounds\":{\"lowerRight\":{\"x\":75,\"y\":108},\"upperLeft\":{\"x\":45,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\",\"properties\":{\"overrideid\":\"\",\"name\":\"Áî≥ËØ∑\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"/template/sys/workflow/announcement/apply\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\"}],\"bounds\":{\"lowerRight\":{\"x\":245,\"y\":133},\"upperLeft\":{\"x\":145,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\",\"properties\":{\"overrideid\":\"\",\"name\":\"ÁªìÊùü\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":645,\"y\":107},\"upperLeft\":{\"x\":617,\"y\":79}},\"dockers\":[]},{\"resourceId\":\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\"}],\"bounds\":{\"lowerRight\":{\"x\":144.4296875,\"y\":93},\"upperLeft\":{\"x\":75.765625,\"y\":93}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\"}},{\"resourceId\":\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\",\"properties\":{\"overrideid\":\"\",\"name\":\"ÂÆ°Êâπ\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"/template/sys/workflow/announcement/aduit\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\"}],\"bounds\":{\"lowerRight\":{\"x\":381,\"y\":133},\"upperLeft\":{\"x\":281,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\",\"properties\":{\"overrideid\":\"\",\"name\":\"ÂΩíÊ°£\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"/template/sys/workflow/announcement/complete\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\"}],\"bounds\":{\"lowerRight\":{\"x\":535,\"y\":133},\"upperLeft\":{\"x\":435,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\"}],\"bounds\":{\"lowerRight\":{\"x\":280.0625,\"y\":93},\"upperLeft\":{\"x\":245.9375,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\"}},{\"resourceId\":\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\"}],\"bounds\":{\"lowerRight\":{\"x\":434.671875,\"y\":93},\"upperLeft\":{\"x\":381.328125,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\"}},{\"resourceId\":\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\"}],\"bounds\":{\"lowerRight\":{\"x\":616.3125,\"y\":93},\"upperLeft\":{\"x\":535.046875,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('3',1,'source-extra',NULL,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0∑\0\0\0∑\0\0\0v^\0\0\0 cHRM\0\0z&\0\0ÄÑ\0\0˙\0\0\0Ä\Ë\0\0u0\0\0\Í`\0\0:ò\0\0pú∫Q<\0\0\0gAMA\0\0±é|˚Qì\0\0\0sRGB\0Æ\Œ\È\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0\ƒ\0\0\ƒï+\0\0IDATx\⁄\Ì\›	|U’ù¿Òì\‰eaK\0\ŸDd+j–≤µV\‘AEd±HGê•j[(u¥Ç3≠∂≈è8G:≠Ç¬∞k@T®°RDî5§∂∂êÑ$yÛˇﬂº!¡@∂{o~\ﬂ\œ\Á|ﬁí˜π˜\Ô˘üs\œ9\◊\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Â&ÑMÄä\‡˜˚£ˆ\Ì\€˜oYYYÉ≥≥≥o:s\ÊLT~~>¶¨lHà?22ÚdDD\ƒ\∆.L\Í“•\Àg\ƒº\ƒqê\‹\¬Q§2˘ıâ\'&\Á\‰\‰\‘l“§ââââ1u\Í\‘1°°°lú2“äY*jìôôiRSS\œ\Á\Â\Â\Ì<{ˆ\Ï\‡^Ωz%B|g\ƒ@rG9p\‡@\‹ﬁΩ{jﬁºπi⁄¥©∂\Ÿ((%%\≈$\'\'üı˚˝ªuÎ∂å¯Äõ\„É8#ŒÄÚ\∆&@yV(Rj€∂≠iÿ∞!J%–û®˙ı\Îá;v\ÏÅ¡É\'Œô3\Áü\ƒ\‹\ƒqê\‹\¬QÙ†¥‹ü\◊\n%::˙íüü\À:jRwºoRw.3\'ˆ}f≤O\Ì3ëµ\Z_d4Øå\"\"\"¥bâLMM\Ì=h–†\ÁŒù{å¯Äõ\‚É8#ŒÄÚ\ƒ\‡#îôN\⁄–±mz	∞§\n\Â\‡\Ê∑M÷â]&?\ÔºÒ\Á\Áö\Ï¥=\Ê¿¶ô&\'Û0∞‘™UÀ¥l\Ÿ2?,,\Ï/\ƒ\‹\ƒqê\‹\¬qt6≤N\⁄–±m\≈I\€ˇπ\…=\Êí˜µÇ9±/Å\rXNö5kV\ﬂ\ÁÛ›∞zı\Í€â∏%>à3\‚ πÖ\„\Ë2;:π§±mg/\”+¢Ω)(?ç\Z5JïáGà∏%>à3\‚ πÖ\„\Ë˙ë∫\ÃNI¸yJ˛≤ü5\'\ÀSÉ\rÆìáÆ\ƒ\‹\ƒqî7õ\0e•£\ÎlYT=\Ÿ\◊\ CC\‚nâ\‚å8\ =∑(3]–õÖ\—r@\ÏÒ∑\ƒqFú$∑pù\ZıJ¸ô/íû\‚É¯\0qÄ\‰.Rø˘ù\∆Q\Îí˜\√\¬kò˙-∫∞Åà\‚\ƒ\0í[∏G\ÌÜmM≠7˚~ùF∑∞Åà\‚\ƒ\0í[∏KﬁÖ≥óºó{\Ó4\ƒà3\0$∑pèÛgé[w\0\ :æÛíüù9π\€¯˙-\Î3 >àg\0Hn\·h)õ•Bôa›øΩ$\Ÿ\È˚MÚ∆©\Ê‘Åı\∆\œZì\ƒÒ\‚@±T ùˆÄ˝\ÁGVèHi\Ë\Ì/ıÛßè\Ô4çn\Ïm¢¨%A| \Œ\0\\9znQ\Ó¥§¥J0\ÌY\Ÿˇ\’46 ÒA|Ä8@r\Á\–ê´\Â\œ\œe\ƒà3\0Wça	(w±\›\'∞@|Ä8P%\Ëπ\0\0\0\…-\0\0\0@r\0\0\0ê\‹\0\0\0ó\Á\Ÿ	e~ø?*11Ò\Á[∂ly¸»ë#SRRjfff˙rrrå\œ\ÁÛ◊©S\ÁB˝˙ıGGGØóèˇ\ÈÖ^\ÿE8\0\0\074hP≥\‹\‹‹æ!!!˜\»ÀéRöH©-%GJ™\‰C[\Âgˇ[0oﬁºC$∑.Mj\ﬂ{\ÔΩ\È&LxÚ\‰I_€∂mM◊Æ]\Õı\◊_o$ô5QQQF‹ê”ßOG<x∞URRR´Õõ7?>r\‰\»gŒúô0}˙Ù*\0\0¿\…\ÿWû\Œ\œœø[í◊àb>%••¸¨•<ˆ\Õ\À\À˚ÛÄ\‰ı\Ã˘Û\Á\œ%πuâ\r6<ıÚ\À/øëëë);\–t\Ë\–¡HK\Â“Ω-	ÆñÜ\rö˝\ËGf\Ë–°!€∂mk±`¡Ç7á˛|ZZ\⁄\œ/^¸:\0\0¿I$ø—ÑıMø\ﬂ\ﬂ\Î*æ\ﬁUæ\◊U~\«pIvüÙjÆ\„â\‰Vvîo˘Ú\ÂÒ≥fÕ∫˜Å0?˝\ÈOãMj/Ga)a´V≠ä]¥h\—ˆa√Ü=K/.\0\0pä˛˝˚\r\r}#??øû˝û\Ê;?¸\·M\ÁŒùMõ6mL›∫uMù:uLvv∂IOO7\…\…\…f\„∆çfÛ\Ê\Õ\Ê¬Öˆ◊∫\»˜∂8pÑ{q]ü\‹jbªv\Ì\⁄ık÷¨˘…®Q£\Ã\r7\‹P¶\ﬂ◊´W/[c\‚ƒâ˘\Â/9c∆åøq8\0Ä*Nl˚Hb;W\€0;©\’Œºû={ZW¢ã™Y≥¶Uö6mj\ÓºÛN+\—˝\√\Õ\«lÚÚÚÙ#µ%ázW\‹(Ip=’ô\Á˙\’¥\«v\È“•?yÈ•ó ú\ÿ\⁄Z¥ha∆è_CÇh¢\ÏÙ¡R\0\0†\n[Ì±çìd\‘Jl5a}\ÂïWt2Y±âmq¥GW?Ø\ﬂ\”yH6˘ùoy-\◊qur´cl•r\Ô3\œ<S\Íù[Z˙˚~˜ª\ﬂ\’ˇ\Ÿ\È±Z\0\0†≤\È€∞∞∞7\Ï\ƒˆ¶õn2\„∆çª(AΩ˙=˝~ªv\ÌÇ‹©^\ u\\õ\‹\Í™ÒÒÒSuåmyı\ÿ•=∏\“Zäî\÷\“;^\0\0†\“µ\–\–ˆ[\Ì±}˛˘\Á≠1µe°\√û{\Óπ\‡Yá(ºEr[\≈\‚\‚\‚f\Ír^:F∂\"ı\Ó›ªFLLL+Ü\'\0\0Ä §\À}Ib{ü>\◊1∂öêñ5±\rNpı\ w\–¸.^\…u\\ô\‹jØmRR\“c∫\‹WxxxÖˇ{√áØ\'-ßßΩz\»v|Q†Æ]ª˙8ïÄ¯\0q8&Æsù<vµCJ¢øØOü>¡˘\’p/lwWûDÙ\Œc«éÛ\ÈÚ]ï°}˚ˆëëë≠t\‹ÀÇí=x¸˝I\⁄4i\“\‰Lˇ˛˝\„t6fnn\Ó∫≈ãgy\Ìï∞^‚©¥\Ôy)>\Z7nú%\«@\\HH\»<Ø\∆g\Ÿg+$\Œﬁ©\Œqv˛¸yATT\„˙U\Ô<&uœΩ˙\‹^°\"\‹ˇ˝Ê£è>≤ó	\Î\‚Ö\\«ïµµ\ﬁR∑§4Tîv\Ì⁄•\ C?èÑµ§B$\‚«≤mKÄœë\Á˝O<ÒDîW˛¿\ÂÀóõ\ﬂˇ˛˜%˛\\o\œ,\'ùK\ﬁ1bÑYªv≠ı¸¿Å\’Ú-±°∑s¨Ò!\'\ËÉ≥Ω”ßO7\“pæ\Ïg~Òã_XkFj¨2\ƒHEeΩﬂØ_ø\¬\Á(Sú’îá\«\Á°#cÛΩgKó.5\ÔºS˙\ÈO?˝¥Y∑n\›E\Ô\›}˜\›&%%\≈?~¸{\„\ÓØ_ıñ∫ˆ$2\ÕyÙ.´AWQ\–Zq}Æ\„ û\€#Gét\‘[\ÍV¶Œù;\◊˝Ú\À/ıæÕì™…Å-eàXC§œëÉpëº~_∂˝äÑÑ\◊\‘\‡âââ\Ê\Ë—£ÖΩÆIII¶^Ωz\Ê\”O?µ^ü:u\ z|\‰ëG¨GΩs]ll¨ï\‡\ﬁx\„çfﬂæ}\÷w5°\Õ\»\»0≥g\œ6;v\Ï0Øæ˙juO@\ÍJlïßC%<\Œ âz°º∑ÃçÒ°˚ÿ¶=ÙoºÒ\∆E\'˙\Ì€∑[Ò°∑ÚV⁄õv\€m∑Y=k›∫u3>_¡iTWX±ü£\‹\Ë$óÚ8@\‚\Ïú\ƒ\ŸRâ≥\≈nã3•ù1:Iy\ÁŒùf◊Æ]ó\\	\“\∆Û\‰…ìø´ú%ñ∫t\Èbù£∂l\Ÿb\≈\⁄-∑\‹bM(ö1cÜ\’À¶çnx∑~ïXø\«~ÆÁúä§ø_r˚•\ÎsWûâ•\ÂZSOï©u\Î\÷⁄õ–±öàQv\"”§IìL©`\‚ı\ﬁ‘ëëë	≥f\Õ\ qÚ¸\€oøµ*{\0æV˙\\+\r_ò\‡\⁄ty≠D¥Ú\—\Ô◊®Q£g⁄ìÚË£èrjæòn†\'$Fûê¯»ê¯X)Ò1\À\rÒ±f\Õ\Z3r\‰\»\¬\◊\⁄#õôôi∫w\ÔnΩ\÷\ﬁY\Ì!\”\ƒV\ÔÓ£çΩ€è.££\ÀÒ†REJy\\\‚\ÏÒ∆çüñÑ\‡y=\Õ\Èqˆ\Õ7\ﬂX\Á;ô\’X≤J¡>˘\‰\ÎQ\„\ÌÎØø64oæ˘¶u˛9{ˆ¨π˘\Êõ?´q8~¸x\"\¬\„ı´ú:\Â ˙ühŸ≤eK\◊\Á:ÆLn•ÚÒi7zeíVrC	¿\\	ºq¥8M?\Ÿ˝¥\‚ó\Ì±G/ë9∫Fåå,ª¶µG\ƒ~≠\œcbb\ÏFìï\‹|˛˘\Áf\Ë–°V‘ø\ÎgzGó|\–*+V¨0YYY¶v\Ì⁄é˚[Oú8a%aUß∫1˚K|Ù\◊¯ê\Ì\Á\ÿ¯\–°w\Ô\ﬁ÷£T*\÷{{ˆ\Ï\—1üVØ¨\›¯yË°á¨\Á⁄õ´e’™UVr´üô6möı\ÌÒ\’\◊\ZC:¥aÃò1\÷U\0\‚£bH\Â_Gb¨Ø<\Ì8\ÌujúiC˘∑ø˝≠π\Ôæ˚Jı˘Fç\ZYc ı§\Á\Zïööjˆ\Ó\›k=◊´\r:\√\›\…Û\0ºgU]øä|˚ùÛ˘˝\rHn´Ä\ÓÙ Æ86lÿ†\'T\›^\‰¯ª\»4!¥/\Î;ë\ﬁn\–\Ó}\’\À.˙\\ìS•\'`˚¥^\Ó\Î€∑Ø˘\Ï≥œ¨ÒMvOùV :ê_\«\Îû;w\ŒJê\”\“\“ô\‹jbÆó0ùßr\Ã86>ö7on%§zw\√{\Ôµ\ÊlX\√V>\\ò‹æ˝ˆ\€E«¢\“\‰BìéNù:YCNü>m% \⁄\Î´?s\"ß\≈G9j\Ì\‰Û–≠∑\ﬁjæ¯\‚”£GèR}^X5e\ ´AΩm\€6\Î<§	à£\—Ú˙\ÎØ[\r+\'ÖÒpúU∂\¬\÷Ky-ˇU],à\Î\ÁQ∏2πçååÙKÇRô	\Óm∑\›vb…í%u•≤~ŸÉPiN@y“öÙ¸\‡\‰eØú∏[;˘è\”}\'¢˙\\á*(\Ì¡µô¢4©ô?æπÎÆª\n\ﬂ\”ÀÖzyP#\'\“ˇ\Î˛˝˚µb˘\œJé{#F∏->Ù&0ˆ0\Ì˝ªˆ\⁄k\Õ\Ì∑\ﬂnΩ˛\‡ÉL≥fÕæ˚#%V4Å]∏p°ï∑i”¶ª\◊\\sM\·sß™†¯®\Ã8Àó\”Pæ\€\ŒC:ÒPcFìSm0o›∫ı≤üOHH∞\Z\‘:ÅH\Áh£[i¢k”´IN\„\Ì8sS˝™Òn%∏\⁄xÆ\»7;;;¯eé\€7∫+ì\€\Ë\Ë\Ë\È\È\Èˆ•\ƒ\ û&Åñ≥`¡Çq^;ÚP\Ï¡ß\√0¥2ëø[ñ0y\‘˜\“\Âqç.%çåï:\÷Ì©ßûÚ;ıo\”4ªóV\È\ÿ5≠\Ï˜Ù*¿\Â.\Ì\ÈÁÇó\„\—\ÔØ	\Ë4\r\Z4∞íÚ^xa\\E«ánN=ÒJ,D\⁄I≠\€\‚C:t®0\Ÿ\–\nY\«\‹\⁄\rgM,lSßNµ\Ì˘\◊\·*%5äú¨\"\‚£\‚\Ã:*~ç∑P7∆ô^™¯·á≠ÛIqçc{\Ãm†é≥\Z\·öó\Ê<Eúy≥~ï˝Æ]¯mÙÛíÛThr´ø?8\\In´Ä¥~H%‘¶2ì\€\ƒ\ƒ\ƒ=⁄∫™\«\‚˘¿\ﬂY#®©ô\‡J)•b_#I∫[˛]Agª\€=ªw\Ô∂;y\—\…\Ì€∑ø\‰{ˆ¯=≠àt¸õM[\œ’ú\∆BàîZÅqu|h\„Ggù€â™.\Â•\≈~≠?∑\«6\Í`\Z•ô°~Ú\‰I´\'Wøk§¢øh8\ŸC\¬\\gˆ9•4\Î\÷\Í\’!^°\√,lˇ˚\ﬂ/\Í\‚\∆\∆Æ¨~ï\ƒx´ù\‹\Í£ÚæÅC0ù(d+\…mêV\Ì⁄§§§6ù;wÆ¥s˝˙ı\⁄+∞∂\Z|A\‹)J\"∏\¬\È≥\ﬁK“≥gœã3≥¿D0{XÇ˝X§Em≠G9zÙh´—±∂¡Oqﬂ©Fj{)>¥\'ˇû{\Ó)N†=µ:ˆ˙é;\Ó∞^kOn\·Åqô\ƒD\«\ﬁ€¥i\”%±á+b_Dú\ÈyG\⁄v\√G\'πñD\«\Á~\ﬂyL-[∂å(Òx˝*u\—Z9¨5gµ±£Á™ä‹òÚBÆ\„\ \‰6##\„©tû\Ã\À\À≠§9\‰\ÏﬁΩ;\÷\›œãÙíà<$ÑÜÜ\Œ,ØìÓµø1pñ\À\“K?\œ>˚¨ı\\\'è\È87\Ì\Õ\”Àä∫\÷mu\Â\≈¯–Ñ#8q\–Z=ßÿâ\ÏìO>Y¯3çΩ`˜†i<¨^Ω⁄öÄ6l\ÿ0´!d«â=≥ƒôz˜\›wı6\Ó\÷sùî™ƒä∫\Ó∫\Îä˝ÆNf\÷uπãK®\Œ\Á¢\Í\◊ræâì<\Áøı©∆åNdÆà9\Ëêiêk^H\‡≠%$∑U`¬Ñ	{Fç\ZµOvˆJö\…\\û\‚\„\„óJÖ\÷¬£∑\ﬁU/I\Î0YZêK\‹\⁄3RZ\⁄cÚ}´º¸Úws\Ìâ&5öº¨_ø\ﬁ8∞∫ùó´M|\Ë™v[Qö\‘\Í2_v¸\Ë∏BCiØ{¨…ã&1\Z+\Ÿ\√Búπãé\È~\Ï±\«\náB\Èï-EΩ\"§\„nïNn¥\'8ªíªù¡ùq=oﬁºCR\ﬂ$Hb\‹]í\\k\·†AÉ\ ˝?∏r\ÂJmò€â\Ì:/\‰:ÆΩùé¥Z\«˛Ø\Ë–°ÉØÇ{o\”gœû}≥\Ák^=Ú$ê\'Tó≥ÃïN\”ıLm:	D\'U7\’)>.7\‰D{sµá6¯u\r=Ù?}!\‚\Ã}ÇW€∏\ﬂw\ƒ\‡´\nt\\ˇMäuWMnı\Ã\Â9ˆVoÚ¡ˆ\⁄JÆ3\Õ\€=‘≠ˇÒô3g.\Œ\ \ ⁄©;ª\"Mö4I{m\œ9rdá)\0\0®,Û\Áœèìá}ÆΩ∑∫æqyMl\÷Âø¶Lôí\'9NaØ≠WrùP7ˇ\Á322|ˇ˝˜\œ\Í¯äêòò∏|”¶MHK\ÊWnªè9\0\0Ì¶∑ñ\Á“ª Nû<π\Ã	Æ&∂í(˚>l_˙\ŒÚRÆ\„\Í\‰V«Öú?˛W≤£≥\À˚÷ã≤\√ˇ1q\‚ƒé≤≥ˇCZN\ﬂrl\0Ä™\»u¸~ˇ3Ú\‘J<w\Ì\⁄e\rô\”!WCø˜á?¸!/11\—\Ó±\’\·#ºîÎÑ∫˝ò;wÓº¨¨¨g^|Ò≈¨Ú\Í¡\’\€—£G_üóó7Uvˆ\\-\0\0PU.\\®\√~e\'∏⁄É;v\ÏXùtVÙ%\“\œI¢l∆å\‹c´+9åıZÆ\„Û\¬!;˜\Ì˛˝˚gè?~Zø~˝\¬˙Ù\ÈS\Î*\'ô•øˆ\⁄kq_}ıïÆ\⁄?VÇiá\0\0®jíòŒí\\GW\\ò\ZRW\«\‡ÆX±¬öh÷°CkBk\Î÷≠≠\€<Îíñ:Ù@ZΩAÉÆΩ-%ˇ‹πs⁄©i˜\ÿ\Ízª\œx1\◊Òy\Â\—VÕÄ6,Z¥h¶\Ï\Ë[Ü›©Sß\Z•¸z\Œ\Í’´\„\ÊÃô\”&77∑çÕΩE\0\0\0N\Ãu$OyKó\”˜4\…›ºy≥UæG\’˙u:\∆÷´πé\œKL`m∂˚d\«˜õ4i“ààààv±±±«ªt\ÈRªU´Vı\Î\◊o¢k\rû={ˆ®¥f2v\Ïÿ±{›∫uaªw\ÔæIÇC\◊k˘[jj\Í\\&è\0\0\Á:=4◊ëu∏$π]Ø ü[\'e¶\◊süGwº\ﬁ]c…†AÉöm€∂≠\ﬂ÷≠[ˇE^\Î=\rµ;_W“éë¢∑™“µ\›>ë2\¬\√7h\0\0\0\ŒuÚÛÛ˚Iík\Á:Mπé\Ê<∫\ \¬VSpK\›%\’%\◊Òy˘è”ª{\»\√\ÎÅ\0\0@Æ\„q°l\0\0\0ê\‹\0\0¿	π\€OJÒ=∂p\r…≠∑]_Ã∂∏ôc\0\08\ÿ\Ãb\ﬁ˚c)r∫nR2Ç^ˇÿ´\»Kcn{J9 ••îΩAÔ∑ñrc\‡ΩA\Ôø(\Â\œR˛/®EÛàîQRÚ9v\0\0Ä\√\‹!eúîRöJix_\€•tïÚ))Rz\…gtU®>AØ\ÎH\—Ò∫GΩ∂ëº\‘s/\Â\€¿é˚gP\È\ÿ\—+ä|^w\ËI)\◊^î2:(P\0\0\0úDWA\ÿ/Eo«´zqÅ≤7¯\\‡πÆî^ \œ;(Çû∑\r\‰EGΩ∏ë|\’00Ùoé0∑∞{\‘åSYf\n∫˘uáëÚk)or\0\0á\–^\€«•të2]\ q)˜òÇ\ﬁYÌïΩ\À=x5ê‹™z\Êªa-•|xÆW¥Oy9—´.¥áˆ∞îüK\È \Â+)µ§|*\Âa)ßM¡¯\›\Ÿg≠ñ\’\0\0\0NÖîmR⁄ôÇ+\”jK πÙ:¯\Ê1%¸Æl/o(Ø$∑◊õ\ÔF\Î€æA?≥_wï≤4–ÇyR ªR\∆Jô!\Â)€ã¸\Œs\0\0á\r\‰-;L¡Ω1√∞¿\Î\‡ú\ÁØAØôÇ±∑z•∫Y Ò\’aô\'9†\'\ÔR\Êï\‰ˆ`†ò¿Œã˙YwÛ›ò\€…†\Á∫cÑ\Ì	)\√9é\0\0ÄCh≠v\ÃiØ≠Øå6C\r&}\ÊØEæ3\∆g¯\“\\±\ﬁe\n&\“ˆz+¿kÆ-\≈gt¬øK\Ÿx}((é3ù=\0\0\\M;%µ∑V\«\÷fñ\‚Û\⁄k´ù~ˆ<\"\Ì\Ì’πF}In\›C{ió\‚süIâ4≥#8V\0\0Ä\√\È$∞üIô%ee\‡ΩfÅDµoëÑUW~˙WS\–Kª∏HŒßùx:øhæîˆ^mxECS∞\Ó€öR|ˆ7¶`¶°ÆÒ\÷!PÇÉ¢y\‡˜\ÁX\0\0†\√^-Ú\ﬁsÒ∞\À¸†\«˜ä|69\Ë˘\⁄@Ò$Ø$∑\◊Z/\≈›µ\„´\"Øµï≤\–åª\’\‰U◊Ék]$8\‚8Ü\0\0Ä\√M`óã\Îú[Q]6äWí\€√¶\‰¡—≥ãº\ﬁ^\Ãgr|\0\0\0∏_(õ\0e¢\–P~>w,v\Ÿz\Áö\\\‚nâ\‚å8Hn\·8QQQ\«Nü>ÕÜpÄSßN%\…\√V\‚nâ\‚å8Hn\·8\·\·\·\Î222\ÿêöö™K\√$pK|g\ƒ@r\«\…\…\…˘Ø#Gé\\˚˝lå™ïúññ¶+,%>\‡ñ¯ Œà3Ä\‰és˜\›woî\ne{JJ\n£\n%%%≠ñ˝ê“£Gè\r\ƒ\‹\ƒqê\‹¬ërrr\'\'\'ggff≤1™@zz˙≤¥¥¥ü\Â\Á\Áè$>\‡∂¯ Œà3†<Ö±	P\ÊŒù{b»ê!Oû<˘PLLLTdd$•+î\ƒ\ƒ\ƒv!!!ø\ÈŸ≥\Á:\‚nã\‚å8Hn\·Hs\Ê\Ã\Ÿ;x‡Øè=\⁄WNpg¢££k\»#¶\‚$\'%%-NNN\Ó¶J˜\Ó\›Wpk|g\ƒP^8\‚Q\ÓV≠Z\Z\Z:\≈\ÁÛujÿ∞\·°\r\Z\\\”D\ﬁc„îëÆ©\À\Ï\Ëldù¥°c\€Ù`Ø^Ωíàx!>à3\‚ πÖc\≈\«\«wîñ¸#Ú¥´î[•D±U\ LF\◊ı#§,uÛ§\r\‚É¯ Œà3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†\ ˝?l∂\—D56æ\—\0\0\0\0IENDÆB`Ç',NULL),('5',1,'AnnouncementApply.bpmn20.xml','4','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"Êú™ÂÆö‰πâ\" isExecutable=\"true\">\n    <startEvent id=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" name=\"ÂºÄÂßã&#xa;\"/>\n    <userTask id=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" name=\"Áî≥ËØ∑\" activiti:formKey=\"/template/sys/workflow/announcement/apply\"/>\n    <endEvent id=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\" name=\"ÁªìÊùü\"/>\n    <sequenceFlow id=\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\" sourceRef=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" targetRef=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\"/>\n    <userTask id=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" name=\"ÂÆ°Êâπ\" activiti:formKey=\"/template/sys/workflow/announcement/aduit\"/>\n    <userTask id=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" name=\"ÂΩíÊ°£\" activiti:formKey=\"/template/sys/workflow/announcement/complete\"/>\n    <sequenceFlow id=\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\" sourceRef=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" targetRef=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\"/>\n    <sequenceFlow id=\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\" sourceRef=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" targetRef=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\"/>\n    <sequenceFlow id=\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\" sourceRef=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" targetRef=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Êú™ÂÆö‰πâ\">\n    <bpmndi:BPMNPlane bpmnElement=\"Êú™ÂÆö‰πâ\" id=\"BPMNPlane_Êú™ÂÆö‰πâ\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" id=\"BPMNShape_sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"78.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" id=\"BPMNShape_sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\" id=\"BPMNShape_sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"617.0\" y=\"79.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" id=\"BPMNShape_sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"281.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" id=\"BPMNShape_sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"435.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\" id=\"BPMNEdge_sid-7694345E-2826-41A3-AD23-456716E9AC4C\">\n        <omgdi:waypoint x=\"75.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"145.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\" id=\"BPMNEdge_sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\">\n        <omgdi:waypoint x=\"381.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"435.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\" id=\"BPMNEdge_sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\">\n        <omgdi:waypoint x=\"535.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"617.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\" id=\"BPMNEdge_sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\">\n        <omgdi:waypoint x=\"245.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"281.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('6',1,'AnnouncementApply.Êú™ÂÆö‰πâ.png','4','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0è\0\0\0è\0\0\0õ1R\0\0∑IDATx\⁄\Ì\›}àïuõpˇ(Z\ËèÇàzb£ï\Ëè\Ëü6\⁄ Çà\‡Åû†\Zs¶¶p™M3-™\«bzì¨©\›ÿÇ\Ë)qkC\ƒ\\\◊Uõ_3•1◊≤G7\”‘ú\∆m}ÃßôLÛ\ﬁ˚:x˜Ãú\—qè\Áú˚ÛÅã9û3cu\Ê\€u_\Áwøç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PKí$9c€∂ms◊≠[˜[ggg\“\ﬁﬁÆ*\\…™U´˛7≠&˘Pµî9ì3†Ä¢aØ^Ω:\È\Ó\ÓN<®NS\Ì›ª7Yπr\Â˛¥Å\ﬂ*™VÚ!grP|\“◊∞´¶qloo\ﬂ,™VÚ!grP\Ï\"\“0´ß“¶}H>T≠\‰C\Œ\‰(†8\÷E≥¨™¶ù»á™ï|»ôúÜ\«!\ÎØŸìl˚ÙO…óœî*\«s\Z≠\·Q>l\‘\ÂL\Œ\0\√cø:∞ow≤i\Èì\…ã\ÈWÒ\\º¶\Ÿ{xîu9ì3¿ÿØv~˘É\ZvVªæ\\®\Ÿ|xîu9ì3¿ÿØ6/a»¶Øi∂\≈\Â\√F]\Œ\‰0<ˆ´M\ÌO\rŸ¥\„5Õ∂\ÿ√£|ÿ®ÀôúÜGM[”ñ˘ê39Y”é≥\Záj\⁄Òöf[\Ï\·Q>l\‘\ÂL\Œ\0\√cø⁄∫\Ê_Ül\⁄Òöf[\Ï\·Q>l\‘\ÂL\Œ\0\√cø˙q˜\∆d”ámÉw•\œ\≈köm±áG˘∞Qó39èÉ\Í\€\œfj\⁄ÒúFkxîu9ì3¿ÿø~˘%\Ÿ˙Òø\ﬁUî>Øi∂\Â\√F]\Œ\‰0<\Ê\Ô\Í∞e\Õ?y¨Qº\Ê\Ó\≈\Â\√F]\Œ\‰0<ˆ}\ ﬂ≥uYÚ\ﬂK˛8d\√\Œ*æ\'æ◊ßˇ\rèÚ!r&gÄ\·q∏üÚ}˙/ˆ(Ú!gr˚\’p>\Â\Î”ø\Ê[\ﬂ√£|»áú\…`x\ÏW#m\ÿYiæı=< á|»ôúÜG•iÀá|»ô2<ö∂¶-Ú°)94mM[>\‰CRrh\⁄\ ®èJ\Œ`í$˘õç7∂æÛ\Œ;+gŒúπÚ\‰…áöõõìq\„\∆%MMMG\ÓªÔæÉ”ßO\ﬂˆ\¬/\ÃI\Î\ÔΩcö∂¶-Ú°)9´5ççç\€\–\–@:\ﬂ\ÃMkkZb\÷I´7≠o\”\◊\Êß_é\ÔÛnchú7o\ﬁ\Ïgü}ˆ–î)Sí7\ﬁx#Y∑n]≤{˜Ó§∑∑7	Òµªª;˘¸Ûœìt∏L|¡#=Ù\–ˆâ\'\ﬁ\„‘¥5m˘ê}H\…Yµª\„é;˛êV{Zèã√©\Â\È˜7y˜r\“!±\Âπ\Áû˚\ÂëG)\rÜáNÜk√Ü\r\…cè=v∏µµuÛm∑\›vâwS\”÷¥\ÂC>Ù!%g\’&\0óÄKN``,W´?Î§≥\ﬂ,Xv\ÔΩ˜&.<°°q†%Kñ$---=V!5mM[>\‰CRrVM\Z\Z\Z∆ç?˛ˇÚÉ`cccÚ¸Û\œ\'Àñ-Kæ˚\Óª‰ßü~*\Õ3?ˇ¸siØ\Îö5kíY≥f%w\ﬁy\Á¿Ú@aW!cp\\±b\≈\'ì&MJ∂lŸíåÜ\Ì€∑\'\È \⁄s\œ=˜¸ì®j⁄ö∂|»á>§\‰¨\n\«ﬂß\√\ﬁ\·¸\–8gŒú\“ax√±oﬂæ\“˜\«\œ\Âá\»Ù\Ô,\ﬁbY¨8\∆\‡8\‹7o∏\‚\Ôõ8q\‚\«h⁄ö∂|»á>§\‰\ÏtØ8\Ê«©SßñVG\"~.\Ô0@g÷âccWıh≠8ñ[ÅºÎÆªˆ•o\ÍX\—’¥5m˘ê}H+-éq\Ã\Ô™nkk\Î\€5=R±K{∆åwa\◊ˇ¨gU?Û\Ã3\„\«Si—¢E=çççk\≈W\”÷¥\ÂC>Ù!ex¨¥tp\Ï»Ø8û\Ï\‡ò ¨@ÆÆ˚7s˛¸˘ˇˇ—ø˛˙kr™\›ˇ˝]v_k⁄ö∂|»á>§èïó\„\…\„8\“]\’\«⁄Öù?≤ÆgùXuå\Î8\∆\Âx*\·ã/æ8hıQ\”÷¥\ÂC>Ù!ex¨ÿû\rvq≤À©\ﬁ{\Ôcı1\Ó\'…ú\Ã%yNTKKKWwP¥–¶ıèö∂¶-Ú°)\√ceswÑ\…Níâ\’¡¸Òî\Ã7qˆÄ\À¯\‘\Á¨∑|Û\Õ7ìJö5k÷Ü∏ΩOë¬ù[\∆nohh¯M[”ñ˘–áî\·±2π>z\À¡\“˜Ω¯‚ãßz\∆\…èı9\ÎƒΩ™„ñÉïÙÒ\«oO\ﬂ–ÖEwÆó˚§§i{xî˘ê3ex˝\\ΩWu\Èı+Vú\“\'.$û˚w©\œYgÚ\‰…áˆ\Ï\ŸS\—·±´´´;}Cw<\‹}üîÚ!◊¥\rèÚ!r¶è£õ\ÎÙ\œ[≥\ÁG˚DôÅ\‚N4πè˙úuöõõì\ﬁ\ﬁﬁäèÒ\œK\ﬂ\–^\·\ÓˇI)ñ\€5m√£|»áú)\√\„\Ë\Ê:≠û\Ïœ£uyûc]∂\'˜\œ\Ó≠\€7˝t8…õê\◊mi\⁄\’UÚ°j)r&g\Í¯U\Èß.á\«	&©Ù\ cOOOóï«æ˙4\Ó±y\›u◊ùQãªã\Êœüü\\p¡Cæ˛\’W_%6lÙ|˙üZ∫TÇO¸ıùè¯=øÚ\ +\«˝ûá~∏\Ôq‹¨ {¸\…\'ü»áú\rY±¬ì\œ\ÃÒrˆË£èz.\Óèw\Ó\‹)guº}çªæXyEì&M:X\Ècøˇ˛˚?;\Ê±≥Æ•cç∂n\›\⁄˜x¡Ç\…E]\‘˜\Á’´Wóm\⁄1,Z¥(nQY˙ôxÓ≠∑\ﬁJ\ÊÕõWz\‹\’\’ex¨É|¨\\π≤Ù˚\Õ~\œ^xar\’UWïG\≈\Ô˚\‚ã/îè∏\‚Cˆ¯\›w\ﬂÙ\ÿF]\ŒÚ˝$˝wÓóìÒ\„«ó*\ﬂcéï≥oæ˘¶Ùu\„∆ç\Ÿ\Ô±_oì≥˙ µcGŸìO>πµ\“g[/]∫Ùø\n|∂ı⁄∏\ ˝¿f]K\√c4\Ÿ+Øº≤‘†\”¸$\Áû{n2}˙ÙæÜ=pE1k»±\¬}˘\Âó˜´}Ú4è5ùèÅ\ﬂYgùïÃú9≥\Ô\œgûyfÚ¯„èó\«\∆;\ÀB\Ôøˇ~\Èq¨VgWl\ÿ?˚\Ï3√£úı´\»\Õ˘\Áü?‰áå∏Ü_6<∆äbñ≥\◊^{-π\‰íKJYãÀµ\ƒs\Ÿ˜VÛ≥\·Ò\‰s\Ìl\ÎQˆ\“K/ΩY\È\Î<∂µµ-*\‡u\À~¬Ø\’\·1öoπï\«¸k1dM;8p†Ø\‚πŸ≥g˜=Æ\÷°Ç\√c]\‰cˇ˛˝\…˙ı\Îc\ÔB©≤’ûx¸ı\◊_ó=\ƒa\‡äP|\…V§/^\\˙\Z∂Qó≥r{<\"s\Á\Œrx,wE\ÏVåú\∆sØø˛z≤w\Ôﬁ≤á\◊\»Y˝\‰\⁄uG\ŸO<Òw<¿oº\√L\Ô¯Ò\„ø)\⁄fÜ´Vó/_ﬁ∑“ò}4\Ê\ÿmÉeggg_\≈\Íc|≠\÷\„ç‹ûpd˘\»0à\r{<é\„\“\Œ>˚\Ï≤\ﬂÈ•óñ>@\ƒ\„µk\◊ˆ=\≈W\ÿm-geá\«\»L|X\…V\r≥\›\÷ÒÅ#é\≈\ŒèY≥≤Òzv(EV˘\ﬁ%gı\'\Ó0ì\Œá*qáô¶¶¶#uáô0u\Í\‘ˇ©‘Ω≠ó.]:ßÆ\Ô˜Xê\·`8+è˘Á≤ïÅx\«¿\ÂèKäFn8®Ø|\\s\Õ5}øﬂñññ\“\„Xuº˘\Êõ˚˚¸.√ÅYò%˘ê≥¨\Ô\\}ı’•A0r+\€1HµÚ´ãcé{=‘êXnS\Œ\Íã{[è≤ª\Ôæ˚∂i”¶™¿\Í\„ætc±>˝6âq˝Ø<\Êø?é]\ÀPøÈ¶õ˙\rè\ÂN≤—¥k;˘0~\œÒ8VÑ\Œ9\Áú~g\ f˘¸I2˘üç\‹d+\ÿÚ!g˘´<Dπ˝ˆ\€\À“ê#?±ª:\ÀS<?ìùÿï\ÔE\Ÿ\ÎrV∑\√\„≤¡.VG˚ƒô¯˚\“\ÁH\Ó\"\Âı?Î¥∂∂nå\›JßR_ì¯Òé∑1<V˜pg\‘u∂ıÆ]ª\ q\‚D\÷\–\„\‰\√c}è\◊_˝†ï\«Û\Œ;/ô2e\ qèyå’°8\‡<\Ôÿ±£Ùu”¶MÚ!g}D≥lî\Î˘\·1\¬\Ïí>oø˝ˆ∞>Ù\»Y˝Jgê\Â\Ÿp7u\Í\‘QªlOdl⁄¥iáÛ´éÖòubø|\⁄\‰{∂l\ŸrJ\«Ù\‡\È?cO:âè\ﬂ\⁄Ü:p˝XM9vOfèÛ+\’‹∞\rè£3Hf+è+NR\»Ä\»@¨ç9z\\Zˆ≥\ŸI\r\Ÿu \ÂCŒ≤\Z;vlr\À-∑îvY_{\Ìµ…ç7\ﬁ\ÿ˜°4;s`#OÒ\·7\€¿[y,\‰¯ª¥ˆfhkk;\È2\«3f\‰ès<P®Yß©©©±µµı\Á\Ó\Ó\ÓQw\Ì\⁄ıQ:<Ï∞ª∫˛ÜÉ/ª\Ï≤c~O@úo\‡qúRú ÛÙ\”O˜]o\ÕXø\√\„±.\‡Øç…ù$ì4\„µn∏°¥{≤‹ä∂|7gÒÅu\‡øûı_nxå≥lcC?TV´u/à\·qt544å\ÀNû\…V G∫;~n¿äcR\»Yß±±±e\‚ƒâFk2VcpLYèâl˝\r\Ó)+«™j>^\—FΩX}®ñ≥hx<%+ê\Õ˘2éÅåìhb±c∏gU\«\…1˘c£\n=\Î\ƒT\ﬁ\‘‘¥ˇÉ>¯\ÎIúD≥\Ô\Âó_˛SÏ™é_í®\Z5m˘ê}H\…Y5\Õ:i\Ì\À1D\∆\nu\\H<V≥]⁄±bwéâ\„±_}ı\’d¬Ñ	ø\r∏´\Õ≥\Œ\—\„“â∫≥µµµk˝˙ı=\'r\«?¸Ωt¯¸4uå£¶≠iÀá|\ËCJŒ™u\÷\…_\¬gÑe\÷)Û\∆\ﬁ\ZCdsss˜Ãô3ø¸Ë£èv§\”˜û\ÿzzz∫\‚^\’ˇ˘\‘SO-NßˆmÒF\∆\Ó¨jM[”ñ˘–áîú\’¬¨stà<t\"C£Y\Á8\‚\Í\Ï\È;\Â\Ë˝!øM´˜\Ëõ_w\∆˝\„6<\Ó£ik\⁄Ú!˙êí3≥h⁄ö∂|(√£í3@\”VÜGe£.grh\⁄\ ®l\‘\ÂL\Œ\0√£2<˙Ω»áú\…Ä¶≠iÀá|»ô2<ö∂¶-Ú°)94mM[>î\·Q\…†i+√£≤Qó394mexT6\Ír&gÄ\·Qï|»ôúÜG\ÕR”ñ˘ê3ex4mM[>\‰CRrh⁄ö∂|»á>§\‰–¥ï\·Qïúö∂2<*u9ì3@\”VÜG%r&gÄ\·Qi\⁄Ú!r&gÜG@\”÷¥\ÂC>Ù!ex4mM[>\‰CRrh⁄ö∂|(√£í3@\”VÜGe£.gr‘∂\Œ\ŒNÕ≤z™7m⁄á\‰C\’J>\‰LŒÄZµj’û\Ó\Ón\r≥\nj˜\Ó\›ˇû6\Ì\ÕÚ°j%r&g@-[∂\Ï\Ê+V¸\Âá~\Ë\—8O\ﬂ\'˝h\ÿ;“∫U>T≠\‰C\Œ\‰(®¥Q¸>˝§˘iÏ™àc]T\≈+\ﬁ˜\Õ\’⁄∞\ÂC>\‰L\Œ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0°ˇF\÷qn1\\Rı\0\0\0\0IENDÆB`Ç',1),('9',1,'AnnouncementApply.bpmn20.xml','8','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"WF-00001\" name=\"ÂÖ¨ÂëäÁî≥ËØ∑ÊµÅÁ®ã\" isExecutable=\"true\">\n    <startEvent id=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" name=\"ÂºÄÂßã&#xa;\"/>\n    <userTask id=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" name=\"Áî≥ËØ∑\" activiti:formKey=\"/template/sys/workflow/announcement/apply\"/>\n    <endEvent id=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\" name=\"ÁªìÊùü\"/>\n    <sequenceFlow id=\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\" sourceRef=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" targetRef=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\"/>\n    <userTask id=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" name=\"ÂÆ°Êâπ\" activiti:formKey=\"/template/sys/workflow/announcement/aduit\"/>\n    <userTask id=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" name=\"ÂΩíÊ°£\" activiti:formKey=\"/template/sys/workflow/announcement/complete\"/>\n    <sequenceFlow id=\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\" sourceRef=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" targetRef=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\"/>\n    <sequenceFlow id=\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\" sourceRef=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" targetRef=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\"/>\n    <sequenceFlow id=\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\" sourceRef=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" targetRef=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_WF-00001\">\n    <bpmndi:BPMNPlane bpmnElement=\"WF-00001\" id=\"BPMNPlane_WF-00001\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\" id=\"BPMNShape_sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"78.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\" id=\"BPMNShape_sid-952D80A5-691E-40D9-A17E-2ED958A17C7A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\" id=\"BPMNShape_sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"617.0\" y=\"79.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\" id=\"BPMNShape_sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"281.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\" id=\"BPMNShape_sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"435.0\" y=\"53.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7694345E-2826-41A3-AD23-456716E9AC4C\" id=\"BPMNEdge_sid-7694345E-2826-41A3-AD23-456716E9AC4C\">\n        <omgdi:waypoint x=\"75.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"145.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\" id=\"BPMNEdge_sid-F5BAABFD-84DA-4029-A9E6-F33A4AF5C64E\">\n        <omgdi:waypoint x=\"381.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"435.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\" id=\"BPMNEdge_sid-A996185F-A315-45A2-9F8B-0EAE6272A47A\">\n        <omgdi:waypoint x=\"535.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"617.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\" id=\"BPMNEdge_sid-C1BC0781-B057-4C49-B666-DDC1B6FBB815\">\n        <omgdi:waypoint x=\"245.0\" y=\"93.0\"/>\n        <omgdi:waypoint x=\"281.0\" y=\"93.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
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
INSERT INTO `act_hi_actinst` VALUES ('10002','WF-00001:1:11','10001','10001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-13 22:50:00.859','2018-10-13 22:50:00.880',21,''),('10003','WF-00001:1:11','10001','10001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','10004',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-13 22:50:00.881','2018-10-13 22:50:34.096',33215,''),('10005','WF-00001:1:11','10001','10001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','10006',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-13 22:50:34.104','2018-10-13 23:02:11.789',697685,''),('12501','WF-00001:1:11','10001','10001','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12502',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-13 23:02:12.173','2018-10-13 23:02:28.761',16588,''),('12503','WF-00001:1:11','10001','10001','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12504',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-13 23:02:28.762','2018-10-13 23:03:13.929',45167,''),('12505','WF-00001:1:11','10001','10001','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12506',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-13 23:03:13.930','2018-10-13 23:03:52.495',38565,''),('12509','WF-00001:1:11','10001','12507','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12510',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-13 23:03:52.487',NULL,NULL,''),('12511','WF-00001:1:11','10001','12508','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12512',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-13 23:03:52.496',NULL,NULL,''),('12514','WF-00001:1:11','12513','12513','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-13 23:05:22.368','2018-10-13 23:05:22.371',3,''),('12515','WF-00001:1:11','12513','12513','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12516',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-13 23:05:22.372','2018-10-13 23:06:02.549',40177,''),('12517','WF-00001:1:11','12513','12513','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12518',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-13 23:06:02.550','2018-10-13 23:06:18.315',15765,''),('12519','WF-00001:1:11','12513','12513','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12520',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-13 23:06:18.316','2018-10-13 23:06:35.512',17196,''),('12521','WF-00001:1:11','12513','12513','sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B',NULL,NULL,'ÁªìÊùü','endEvent',NULL,'2018-10-13 23:06:35.512','2018-10-13 23:06:35.513',1,''),('13','WF-00001:1:11','12','12','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-12 22:30:07.884','2018-10-12 22:30:07.915',31,''),('14','WF-00001:1:11','12','12','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-12 22:30:07.916','2018-10-12 23:20:44.359',3036443,''),('15002','WF-00001:1:11','15001','15001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 11:18:20.199','2018-10-14 11:18:20.232',33,''),('15003','WF-00001:1:11','15001','15001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15004',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:18:20.233','2018-10-14 11:21:03.788',163555,''),('15005','WF-00001:1:11','15001','15001','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','15006',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 11:21:03.793','2018-10-14 11:22:03.702',59909,''),('15007','WF-00001:1:11','15001','15001','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','15008',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 11:22:03.705','2018-10-14 11:22:42.075',38370,''),('15009','WF-00001:1:11','15001','15001','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','15010',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 11:22:42.075','2018-10-14 11:23:47.459',65384,''),('15013','WF-00001:1:11','15001','15011','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15014',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:23:47.452',NULL,NULL,''),('15015','WF-00001:1:11','15001','15012','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','15016',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 11:23:47.459',NULL,NULL,''),('17502','WF-00001:1:11','17501','17501','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 11:31:33.910','2018-10-14 11:31:33.945',35,''),('17503','WF-00001:1:11','17501','17501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17504',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:31:33.946','2018-10-14 11:31:59.468',25522,''),('17505','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17506',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 11:31:59.469','2018-10-14 11:34:55.899',176430,''),('17507','WF-00001:1:11','17501','17501','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','17508',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 11:34:55.900','2018-10-14 11:35:37.829',41929,''),('17509','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17510',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 11:35:37.829','2018-10-14 11:42:23.164',405335,''),('20001','WF-00001:1:11','17501','17501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20002',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:42:23.243','2018-10-14 11:42:51.048',27805,''),('20003','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','20004',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 11:42:51.049','2018-10-14 11:42:53.704',2655,''),('20005','WF-00001:1:11','17501','17501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20006',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:42:53.707','2018-10-14 11:42:55.803',2096,''),('20007','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','20008',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 11:42:55.804','2018-10-14 11:42:56.627',823,''),('20009','WF-00001:1:11','17501','17501','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','20010',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 11:42:56.628','2018-10-14 11:42:58.174',1546,''),('20011','WF-00001:1:11','17501','17501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','20012',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 11:42:58.176','2018-10-14 11:43:01.964',3788,''),('20015','WF-00001:1:11','17501','20013','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20016',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:43:01.957',NULL,NULL,''),('20017','WF-00001:1:11','17501','20014','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','20018',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 11:43:01.964',NULL,NULL,''),('20020','WF-00001:1:11','20019','20019','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 11:43:41.673','2018-10-14 11:43:41.679',6,''),('20021','WF-00001:1:11','20019','20019','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20022',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:43:41.680',NULL,NULL,''),('20024','WF-00001:1:11','20023','20023','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 11:44:02.268','2018-10-14 11:44:02.271',3,''),('20025','WF-00001:1:11','20023','20023','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20026',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:44:02.271',NULL,NULL,''),('20028','WF-00001:1:11','20027','20027','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 11:44:45.591','2018-10-14 11:44:45.593',2,''),('20029','WF-00001:1:11','20027','20027','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20030',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:44:45.594',NULL,NULL,''),('22502','WF-00001:1:11','22501','22501','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 11:51:10.002','2018-10-14 11:51:10.022',20,''),('22503','WF-00001:1:11','22501','22501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','22504',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:51:10.023','2018-10-14 11:53:13.156',123133,''),('22505','WF-00001:1:11','22501','22501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','22506',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 11:53:13.157','2018-10-14 11:53:13.998',841,''),('22507','WF-00001:1:11','22501','22501','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','22508',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 11:53:13.999','2018-10-14 11:53:16.566',2567,''),('22509','WF-00001:1:11','22501','22501','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','22510',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 11:53:16.568','2018-10-14 11:53:18.375',1807,''),('22513','WF-00001:1:11','22501','22511','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','22514',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 11:53:18.367',NULL,NULL,''),('22515','WF-00001:1:11','22501','22512','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','22516',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 11:53:18.375',NULL,NULL,''),('25002','WF-00001:1:11','25001','25001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:00:07.225','2018-10-14 12:00:07.250',25,''),('25003','WF-00001:1:11','25001','25001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25004',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:00:07.251',NULL,NULL,''),('25006','WF-00001:1:11','25005','25005','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:00:25.506','2018-10-14 12:00:25.511',5,''),('25007','WF-00001:1:11','25005','25005','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25008',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:00:25.512','2018-10-14 12:07:27.778',422266,''),('2501','WF-00001:1:11','12','12','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','2502',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-12 23:20:44.381','2018-10-12 23:24:19.525',215144,''),('27501','WF-00001:1:11','25005','25005','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','27502',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 12:07:27.816','2018-10-14 17:23:04.880',18937064,''),('30002','WF-00001:1:11','30001','30001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:10:05.286','2018-10-14 12:10:05.459',173,''),('30003','WF-00001:1:11','30001','30001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30004',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:10:05.465',NULL,NULL,''),('30006','WF-00001:1:11','30005','30005','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:10:30.696','2018-10-14 12:10:30.700',4,''),('30007','WF-00001:1:11','30005','30005','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30008',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:10:30.701',NULL,NULL,''),('30010','WF-00001:1:11','30009','30009','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:12:39.461','2018-10-14 12:12:39.465',4,''),('30011','WF-00001:1:11','30009','30009','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30012',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:12:39.465',NULL,NULL,''),('30014','WF-00001:1:11','30013','30013','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:20:00.042','2018-10-14 12:20:00.045',3,''),('30015','WF-00001:1:11','30013','30013','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30016',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:20:00.045',NULL,NULL,''),('32504','WF-00001:1:11','32501','32501','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:21:48.615','2018-10-14 12:21:48.646',31,''),('32505','WF-00001:1:11','32502','32502','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:21:48.615','2018-10-14 12:21:48.646',31,''),('32506','WF-00001:1:11','32503','32503','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:21:48.615','2018-10-14 12:21:48.646',31,''),('32507','WF-00001:1:11','32503','32503','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32508',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:21:48.646',NULL,NULL,''),('32509','WF-00001:1:11','32501','32501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32510',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:21:48.646',NULL,NULL,''),('32511','WF-00001:1:11','32502','32502','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32512',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:21:48.646',NULL,NULL,''),('32514','WF-00001:1:11','32513','32513','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 12:21:59.055','2018-10-14 12:21:59.058',3,''),('32515','WF-00001:1:11','32513','32513','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32516',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 12:21:59.058',NULL,NULL,''),('32517','WF-00001:1:11','25005','25005','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32518',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 17:23:04.880','2018-10-14 17:23:07.848',2968,''),('32519','WF-00001:1:11','25005','25005','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32520',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 17:23:07.848','2018-10-14 17:23:13.094',5246,''),('32523','WF-00001:1:11','25005','32521','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32524',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 17:23:12.905',NULL,NULL,''),('32525','WF-00001:1:11','25005','32522','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32526',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 17:23:13.095',NULL,NULL,''),('32528','WF-00001:1:11','32527','32527','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 17:32:56.169','2018-10-14 17:32:56.173',4,''),('32529','WF-00001:1:11','32527','32527','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32530',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 17:32:56.174',NULL,NULL,''),('32532','WF-00001:1:11','32531','32531','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 17:33:14.961','2018-10-14 17:33:14.964',3,''),('32533','WF-00001:1:11','32531','32531','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32534',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 17:33:14.965','2018-10-14 18:37:22.833',3847868,''),('32536','WF-00001:1:11','32535','32535','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 17:33:44.768','2018-10-14 17:33:44.772',4,''),('32537','WF-00001:1:11','32535','32535','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32538',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 17:33:44.773','2018-10-14 18:33:30.363',3585590,''),('32540','WF-00001:1:11','32539','32539','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 17:33:47.233','2018-10-14 17:33:47.237',4,''),('32541','WF-00001:1:11','32539','32539','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32542',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 17:33:47.237','2018-10-14 18:22:00.918',2893681,''),('32544','WF-00001:1:11','32543','32543','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 17:33:48.965','2018-10-14 17:33:48.992',27,''),('32545','WF-00001:1:11','32543','32543','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32546',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 17:33:48.993','2018-10-14 18:21:28.694',2859701,''),('32548','WF-00001:1:11','32547','32547','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 17:33:51.315','2018-10-14 17:33:51.318',3,''),('32549','WF-00001:1:11','32547','32547','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32550',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 17:33:51.318','2018-10-14 17:59:06.154',1514836,''),('35001','WF-00001:1:11','32547','32547','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35002',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 17:59:06.174','2018-10-14 18:00:46.480',100306,''),('35003','WF-00001:1:11','32547','32547','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35004',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 18:00:46.481','2018-10-14 18:01:16.449',29968,''),('35005','WF-00001:1:11','32547','32547','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35006',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 18:01:16.450','2018-10-14 18:15:27.195',850745,''),('35009','WF-00001:1:11','32547','35007','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35010',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 18:15:27.178',NULL,NULL,''),('35011','WF-00001:1:11','32547','35008','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35012',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 18:15:27.196',NULL,NULL,''),('35013','WF-00001:1:11','32543','32543','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35014',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 18:21:28.695','2018-10-14 18:21:36.411',7716,''),('35017','WF-00001:1:11','32543','35015','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35018',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 18:21:36.371',NULL,NULL,''),('35019','WF-00001:1:11','32543','35016','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35020',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 18:21:36.414',NULL,NULL,''),('35021','WF-00001:1:11','32539','32539','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35022',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 18:22:00.919','2018-10-14 18:22:05.259',4340,''),('35025','WF-00001:1:11','32539','35023','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35026',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 18:22:05.250',NULL,NULL,''),('35027','WF-00001:1:11','32539','35024','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35028',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 18:22:05.259',NULL,NULL,''),('35029','WF-00001:1:11','32535','32535','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35030',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 18:33:30.363','2018-10-14 18:33:40.726',10363,''),('35033','WF-00001:1:11','32535','35031','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35034',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 18:33:40.695',NULL,NULL,''),('35035','WF-00001:1:11','32535','35032','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35036',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 18:33:40.729',NULL,NULL,''),('35037','WF-00001:1:11','32531','32531','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35038',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 18:37:22.833','2018-10-14 18:37:31.646',8813,''),('35041','WF-00001:1:11','32531','35039','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35042',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 18:37:31.641',NULL,NULL,''),('35043','WF-00001:1:11','32531','35040','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35044',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 18:37:31.646',NULL,NULL,''),('35046','WF-00001:1:11','35045','35045','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 21:47:55.898','2018-10-14 21:47:55.900',2,''),('35047','WF-00001:1:11','35045','35045','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35048',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 21:47:55.901','2018-10-14 21:48:21.713',25812,''),('35049','WF-00001:1:11','35045','35045','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35050',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 21:48:21.713','2018-10-14 21:48:22.810',1097,''),('35051','WF-00001:1:11','35045','35045','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35052',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 21:48:22.811','2018-10-14 21:48:30.122',7311,''),('35059','WF-00001:1:11','35045','35053','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35060',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 21:48:30.083',NULL,NULL,''),('35061','WF-00001:1:11','35045','35054','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35062',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 21:48:30.090',NULL,NULL,''),('35063','WF-00001:1:11','35045','35055','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35064',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 21:48:30.098',NULL,NULL,''),('35065','WF-00001:1:11','35045','35056','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35066',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 21:48:30.106',NULL,NULL,''),('35067','WF-00001:1:11','35045','35057','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35068',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 21:48:30.113',NULL,NULL,''),('35069','WF-00001:1:11','35045','35058','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35070',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 21:48:30.123',NULL,NULL,''),('35072','WF-00001:1:11','35071','35071','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:02:58.254','2018-10-14 22:02:58.258',4,''),('35073','WF-00001:1:11','35071','35071','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35074',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:02:58.259','2018-10-14 22:03:23.058',24799,''),('35075','WF-00001:1:11','35071','35071','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35076',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:03:23.059','2018-10-14 22:03:25.334',2275,''),('35077','WF-00001:1:11','35071','35071','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35078',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:03:25.334','2018-10-14 22:03:36.537',11203,''),('35085','WF-00001:1:11','35071','35079','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35086',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:03:36.500',NULL,NULL,''),('35087','WF-00001:1:11','35071','35080','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35088',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:03:36.508',NULL,NULL,''),('35089','WF-00001:1:11','35071','35081','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35090',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:03:36.515',NULL,NULL,''),('35091','WF-00001:1:11','35071','35082','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35092',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:03:36.523',NULL,NULL,''),('35093','WF-00001:1:11','35071','35083','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35094',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:03:36.530',NULL,NULL,''),('35095','WF-00001:1:11','35071','35084','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35096',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:03:36.538',NULL,NULL,''),('35098','WF-00001:1:11','35097','35097','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:04:01.401','2018-10-14 22:04:01.404',3,''),('35099','WF-00001:1:11','35097','35097','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35100',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:04:01.404','2018-10-14 22:04:08.924',7520,''),('35101','WF-00001:1:11','35097','35097','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35102',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:04:08.925','2018-10-14 22:04:09.899',974,''),('35103','WF-00001:1:11','35097','35097','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35104',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:04:09.900','2018-10-14 22:04:10.693',793,''),('35105','WF-00001:1:11','35097','35097','sid-842477BD-46AD-4A70-9BC2-E4FB4E03443B',NULL,NULL,'ÁªìÊùü','endEvent',NULL,'2018-10-14 22:04:10.694','2018-10-14 22:04:10.695',1,''),('35107','WF-00001:1:11','35106','35106','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:04:33.167','2018-10-14 22:04:33.170',3,''),('35108','WF-00001:1:11','35106','35106','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35109',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:04:33.171','2018-10-14 22:04:40.877',7706,''),('35110','WF-00001:1:11','35106','35106','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35111',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:04:40.878','2018-10-14 22:04:41.401',523,''),('35112','WF-00001:1:11','35106','35106','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35113',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:04:41.401','2018-10-14 22:04:47.333',5932,''),('35120','WF-00001:1:11','35106','35114','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35121',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:04:47.295',NULL,NULL,''),('35122','WF-00001:1:11','35106','35115','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35123',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:04:47.303',NULL,NULL,''),('35124','WF-00001:1:11','35106','35116','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35125',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:04:47.311',NULL,NULL,''),('35126','WF-00001:1:11','35106','35117','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35127',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:04:47.319',NULL,NULL,''),('35128','WF-00001:1:11','35106','35118','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35129',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:04:47.326',NULL,NULL,''),('35130','WF-00001:1:11','35106','35119','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35131',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:04:47.333',NULL,NULL,''),('35133','WF-00001:1:11','35132','35132','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:05:02.417','2018-10-14 22:05:02.420',3,''),('35134','WF-00001:1:11','35132','35132','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35135',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:05:02.420','2018-10-14 22:05:12.231',9811,''),('35136','WF-00001:1:11','35132','35132','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35137',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:05:12.232','2018-10-14 22:05:15.318',3086,''),('35138','WF-00001:1:11','35132','35132','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35139',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:05:15.319','2018-10-14 22:05:20.258',4939,''),('35146','WF-00001:1:11','35132','35140','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35147',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:05:20.213',NULL,NULL,''),('35148','WF-00001:1:11','35132','35141','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35149',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:05:20.225',NULL,NULL,''),('35150','WF-00001:1:11','35132','35142','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35151',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:05:20.235',NULL,NULL,''),('35152','WF-00001:1:11','35132','35143','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35153',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:05:20.242',NULL,NULL,''),('35154','WF-00001:1:11','35132','35144','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35155',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:05:20.251',NULL,NULL,''),('35156','WF-00001:1:11','35132','35145','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35157',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:05:20.258',NULL,NULL,''),('35159','WF-00001:1:11','35158','35158','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:14:42.913','2018-10-14 22:14:42.917',4,''),('35160','WF-00001:1:11','35158','35158','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35161',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:14:42.917','2018-10-14 22:14:58.214',15297,''),('35162','WF-00001:1:11','35158','35158','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35163',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:14:58.215','2018-10-14 22:15:01.110',2895,''),('35164','WF-00001:1:11','35158','35158','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35165',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:15:01.111',NULL,NULL,''),('37502','WF-00001:1:11','37501','37501','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:21:34.264','2018-10-14 22:21:35.191',927,''),('37503','WF-00001:1:11','37501','37501','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37504',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:21:35.191',NULL,NULL,''),('37506','WF-00001:1:11','37505','37505','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:21:50.924','2018-10-14 22:21:51.703',779,''),('37507','WF-00001:1:11','37505','37505','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37508',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:21:51.704',NULL,NULL,''),('37510','WF-00001:1:11','37509','37509','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:22:07.162','2018-10-14 22:22:07.167',5,''),('37511','WF-00001:1:11','37509','37509','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37512',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:22:07.168','2018-10-14 22:22:17.980',10812,''),('37513','WF-00001:1:11','37509','37509','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37514',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:22:17.980','2018-10-14 22:22:19.309',1329,''),('37515','WF-00001:1:11','37509','37509','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37516',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:22:19.310','2018-10-14 22:22:20.306',996,''),('37517','WF-00001:1:11','37509','37509','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37518',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:22:20.307','2018-10-14 22:22:22.149',1842,''),('37521','WF-00001:1:11','37509','37519','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37522',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:22:22.142',NULL,NULL,''),('37523','WF-00001:1:11','37509','37520','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37524',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:22:22.150',NULL,NULL,''),('37526','WF-00001:1:11','37525','37525','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:22:35.961','2018-10-14 22:22:38.115',2154,''),('37527','WF-00001:1:11','37525','37525','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37528',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:22:38.116','2018-10-14 22:22:58.838',20722,''),('37529','WF-00001:1:11','37525','37525','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37530',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:22:58.839','2018-10-14 22:23:03.540',4701,''),('37531','WF-00001:1:11','37525','37525','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37532',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:23:03.540','2018-10-14 22:23:30.447',26907,''),('37535','WF-00001:1:11','37525','37533','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37536',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:23:30.436',NULL,NULL,''),('37537','WF-00001:1:11','37525','37534','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37538',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:23:30.448',NULL,NULL,''),('37540','WF-00001:1:11','37539','37539','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:23:54.391','2018-10-14 22:23:54.398',7,''),('37541','WF-00001:1:11','37539','37539','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37542',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:23:54.398','2018-10-14 22:24:21.952',27554,''),('37543','WF-00001:1:11','37539','37539','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37544',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:24:21.953','2018-10-14 22:24:23.228',1275,''),('37545','WF-00001:1:11','37539','37539','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37546',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:24:23.228','2018-10-14 22:24:41.284',18056,''),('37549','WF-00001:1:11','37539','37547','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37550',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:24:41.272',NULL,NULL,''),('37551','WF-00001:1:11','37539','37548','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37552',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:24:41.285',NULL,NULL,''),('37554','WF-00001:1:11','37553','37553','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-10-14 22:24:49.467','2018-10-14 22:24:49.479',12,''),('37555','WF-00001:1:11','37553','37553','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37556',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-14 22:24:49.482','2018-10-14 22:24:57.522',8040,''),('37557','WF-00001:1:11','37553','37553','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37558',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:24:57.523','2018-10-14 22:24:58.363',840,''),('37559','WF-00001:1:11','37553','37553','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37560',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-14 22:24:58.364','2018-10-14 22:25:05.435',7071,''),('37563','WF-00001:1:11','37553','37561','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37564',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:25:05.398',NULL,NULL,''),('37565','WF-00001:1:11','37553','37562','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37566',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-14 22:25:05.438',NULL,NULL,''),('40002','WF-00001:1:11','40001','40001','sid-2CD0609E-8C9D-4487-B4BD-BF5448ACED0E',NULL,NULL,'ÂºÄÂßã\n','startEvent',NULL,'2018-11-08 21:20:18.220','2018-11-08 21:20:18.247',27,''),('40003','WF-00001:1:11','40001','40001','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','40004',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-11-08 21:20:18.247',NULL,NULL,''),('5001','WF-00001:1:11','12','12','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','5002',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-12 23:24:19.625','2018-10-13 22:23:49.466',82769841,''),('7501','WF-00001:1:11','12','12','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','7502',NULL,'ÂÆ°Êâπ','userTask',NULL,'2018-10-13 22:23:49.590','2018-10-13 22:24:06.601',17011,''),('7505','WF-00001:1:11','12','7503','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','7506',NULL,'Áî≥ËØ∑','userTask',NULL,'2018-10-13 22:24:06.591',NULL,NULL,''),('7507','WF-00001:1:11','12','7504','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','7508',NULL,'ÂΩíÊ°£','userTask',NULL,'2018-10-13 22:24:06.602',NULL,NULL,'');
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
INSERT INTO `act_hi_taskinst` VALUES ('10006','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','10001','10001','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-13 22:50:34.107',NULL,'2018-10-13 23:02:11.663',697556,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('12502','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','10001','10001','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-13 23:02:12.176',NULL,'2018-10-13 23:02:28.747',16571,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('12510','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','10001','12507','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-13 23:03:52.490',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('12512','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','10001','12508','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-13 23:03:52.500',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('12516','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12513','12513','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-13 23:05:22.374',NULL,'2018-10-13 23:06:02.538',40164,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('12518','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12513','12513','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-13 23:06:02.551',NULL,'2018-10-13 23:06:17.248',14697,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('12520','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12513','12513','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-13 23:06:18.316',NULL,'2018-10-13 23:06:35.504',17188,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('15','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12','12','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-12 22:30:07.936',NULL,'2018-10-12 23:20:44.286',3036350,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('15004','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15001','15001','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:18:20.419',NULL,'2018-10-14 11:21:03.636',163217,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('15006','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','15001','15001','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 11:21:03.796',NULL,'2018-10-14 11:22:03.517',59721,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('15008','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','15001','15001','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 11:22:03.707',NULL,'2018-10-14 11:22:42.067',38360,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('15010','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','15001','15001','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 11:22:42.076',NULL,'2018-10-14 11:23:47.434',65358,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('15014','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','15001','15011','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:23:47.454',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('15016','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','15001','15012','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 11:23:47.462',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('17504','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17501','17501','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:31:33.952',NULL,'2018-10-14 11:31:59.451',25499,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('17506','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 11:31:59.469',NULL,'2018-10-14 11:34:55.889',176420,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('17508','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','17501','17501','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 11:34:55.900',NULL,'2018-10-14 11:35:37.823',41923,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('17510','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 11:35:37.830',NULL,'2018-10-14 11:42:23.135',405305,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('20002','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17501','17501','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:42:23.245',NULL,'2018-10-14 11:42:51.011',27766,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20004','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 11:42:51.050',NULL,'2018-10-14 11:42:53.650',2600,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('20006','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17501','17501','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:42:53.710',NULL,'2018-10-14 11:42:55.790',2080,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20008','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 11:42:55.804',NULL,'2018-10-14 11:42:56.604',800,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('20010','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','17501','17501','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 11:42:56.629',NULL,'2018-10-14 11:42:58.145',1516,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('20012','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','17501','17501','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 11:42:58.179',NULL,'2018-10-14 11:43:01.917',3738,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('20016','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','17501','20013','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:43:01.959',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20018','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','17501','20014','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 11:43:01.968',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('20022','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20019','20019','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:43:41.683',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20026','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20023','20023','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:44:02.273',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('20030','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','20027','20027','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:44:45.596',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('22504','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','22501','22501','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:51:10.029',NULL,'2018-10-14 11:53:13.142',123113,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('22506','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','22501','22501','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 11:53:13.158',NULL,'2018-10-14 11:53:13.966',808,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('22508','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','22501','22501','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 11:53:14.000',NULL,'2018-10-14 11:53:16.536',2536,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('22510','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','22501','22501','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 11:53:16.572',NULL,'2018-10-14 11:53:18.349',1777,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('22514','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','22501','22511','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 11:53:18.370',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('22516','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','22501','22512','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 11:53:18.378',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('25004','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25001','25001','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:00:07.259',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('25008','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25005','25005','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:00:25.517',NULL,'2018-10-14 12:07:27.737',422220,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('2502','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','12','12','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-12 23:20:44.382',NULL,'2018-10-12 23:24:19.384',215002,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('27502','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','25005','25005','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 12:07:27.817',NULL,'2018-10-14 17:23:04.839',18937022,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('30004','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30001','30001','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:10:05.483',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('30008','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30005','30005','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:10:30.705',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('30012','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30009','30009','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:12:39.469',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('30016','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','30013','30013','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:20:00.048',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32508','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32503','32503','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:21:48.662',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32510','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32501','32501','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:21:48.662',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32512','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32502','32502','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:21:48.662',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32516','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32513','32513','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 12:21:59.061',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32518','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','25005','25005','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 17:23:04.881',NULL,'2018-10-14 17:23:07.841',2960,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('32520','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','25005','25005','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 17:23:07.849',NULL,'2018-10-14 17:23:12.652',4803,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('32524','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','25005','32521','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 17:23:12.908',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32526','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','25005','32522','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 17:23:13.098',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('32530','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32527','32527','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 17:32:56.179',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32534','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32531','32531','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 17:33:14.969',NULL,'2018-10-14 18:37:22.141',3847172,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32538','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32535','32535','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 17:33:44.776',NULL,'2018-10-14 18:33:30.356',3585580,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32542','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32539','32539','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 17:33:47.240',NULL,'2018-10-14 18:22:00.905',2893665,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32546','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32543','32543','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 17:33:48.996',NULL,'2018-10-14 18:21:28.682',2859686,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('32550','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32547','32547','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 17:33:51.323',NULL,'2018-10-14 17:59:06.079',1514756,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35002','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32547','32547','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 17:59:06.175',NULL,'2018-10-14 18:00:46.467',100292,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35004','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32547','32547','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 18:00:46.482',NULL,'2018-10-14 18:01:16.416',29934,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35006','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32547','32547','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 18:01:16.450',NULL,'2018-10-14 18:15:27.157',850707,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35010','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32547','35007','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 18:15:27.186',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35012','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32547','35008','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 18:15:27.198',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35014','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32543','32543','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 18:21:28.696',NULL,'2018-10-14 18:21:36.304',7608,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35018','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32543','35015','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 18:21:36.386',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35020','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32543','35016','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 18:21:36.428',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35022','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32539','32539','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 18:22:00.919',NULL,'2018-10-14 18:22:05.238',4319,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35026','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32539','35023','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 18:22:05.252',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35028','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32539','35024','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 18:22:05.263',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35030','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32535','32535','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 18:33:30.364',NULL,'2018-10-14 18:33:40.629',10265,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35034','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32535','35031','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 18:33:40.706',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35036','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32535','35032','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 18:33:40.735',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35038','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','32531','32531','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 18:37:22.834',NULL,'2018-10-14 18:37:31.629',8795,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35042','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','32531','35039','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 18:37:31.643',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35044','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','32531','35040','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 18:37:31.648',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35048','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35045','35045','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 21:47:55.904',NULL,'2018-10-14 21:48:21.703',25799,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35050','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35045','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 21:48:21.714',NULL,'2018-10-14 21:48:22.802',1088,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35052','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35045','35045','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 21:48:22.811',NULL,'2018-10-14 21:48:30.063',7252,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35060','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35053','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.086',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35062','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35054','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.093',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35064','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35055','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.101',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35066','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35056','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.108',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35068','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35057','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.118',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35070','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35045','35058','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 21:48:30.125',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35074','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35071','35071','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:02:58.263',NULL,'2018-10-14 22:03:23.037',24774,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35076','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35071','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:03:23.060',NULL,'2018-10-14 22:03:25.326',2266,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35078','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35071','35071','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:03:25.335',NULL,'2018-10-14 22:03:36.488',11153,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35086','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35079','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.503',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35088','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35080','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.510',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35090','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35081','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.518',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35092','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35082','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.525',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35094','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35083','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.533',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35096','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35071','35084','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:03:36.541',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35100','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35097','35097','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:04:01.406',NULL,'2018-10-14 22:04:08.916',7510,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35102','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35097','35097','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:04:08.925',NULL,'2018-10-14 22:04:09.884',959,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35104','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35097','35097','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:04:09.900',NULL,'2018-10-14 22:04:10.683',783,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35109','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35106','35106','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:04:33.174',NULL,'2018-10-14 22:04:40.870',7696,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35111','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35106','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:04:40.878',NULL,'2018-10-14 22:04:41.376',498,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35113','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35106','35106','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:04:41.402',NULL,'2018-10-14 22:04:47.281',5879,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35121','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35114','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.298',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35123','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35115','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.307',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35125','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35116','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.314',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35127','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35117','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.322',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35129','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35118','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.329',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35131','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35106','35119','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:04:47.336',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35135','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35132','35132','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:05:02.423',NULL,'2018-10-14 22:05:12.220',9797,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35137','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35132','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:05:12.232',NULL,'2018-10-14 22:05:15.311',3079,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35139','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35132','35132','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:05:15.319',NULL,'2018-10-14 22:05:20.191',4872,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('35147','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35140','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.218',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35149','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35141','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.229',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35151','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35142','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.237',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35153','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35143','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.245',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35155','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35144','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.253',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35157','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35132','35145','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:05:20.262',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35161','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','35158','35158','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:14:42.920',NULL,'2018-10-14 22:14:58.140',15220,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('35163','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','35158','35158','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:14:58.215',NULL,'2018-10-14 22:15:01.095',2880,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('35165','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','35158','35158','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:15:01.112',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37504','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37501','37501','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:21:35.223',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37508','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37505','37505','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:21:51.711',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37512','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37509','37509','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:22:07.173',NULL,'2018-10-14 22:22:17.967',10794,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37514','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37509','37509','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:22:17.981',NULL,'2018-10-14 22:22:19.302',1321,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37516','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37509','37509','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:22:19.310',NULL,'2018-10-14 22:22:20.294',984,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37518','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37509','37509','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:22:20.307',NULL,'2018-10-14 22:22:22.128',1821,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37522','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37509','37519','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:22:22.144',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37524','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37509','37520','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:22:22.153',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37528','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37525','37525','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:22:38.123',NULL,'2018-10-14 22:22:57.732',19609,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37530','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37525','37525','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:22:58.842',NULL,'2018-10-14 22:23:03.023',4181,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37532','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37525','37525','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:23:03.541',NULL,'2018-10-14 22:23:23.714',20173,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37536','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37525','37533','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:23:30.441',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37538','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37525','37534','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:23:30.455',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37542','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37539','37539','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:23:54.401',NULL,'2018-10-14 22:24:21.933',27532,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37544','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37539','37539','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:24:21.954',NULL,'2018-10-14 22:24:23.220',1266,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37546','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37539','37539','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:24:23.229',NULL,'2018-10-14 22:24:41.201',17972,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37550','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37539','37547','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:24:41.276',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37552','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37539','37548','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:24:41.289',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37556','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','37553','37553','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-14 22:24:49.491',NULL,'2018-10-14 22:24:57.514',8023,'completed',50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('37558','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37553','37553','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:24:57.524',NULL,'2018-10-14 22:24:58.350',826,'completed',50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37560','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','37553','37553','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-14 22:24:58.364',NULL,'2018-10-14 22:25:05.303',6939,'completed',50,NULL,'/template/sys/workflow/announcement/complete',NULL,''),('37564','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37553','37561','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:25:05.410',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('37566','WF-00001:1:11','sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8','37553','37562','ÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-10-14 22:25:05.451',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/aduit',NULL,''),('40004','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','40001','40001','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-11-08 21:20:18.309',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('7506','WF-00001:1:11','sid-952D80A5-691E-40D9-A17E-2ED958A17C7A','12','7503','Áî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-10-13 22:24:06.595',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/apply',NULL,''),('7508','WF-00001:1:11','sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E','12','7504','ÂΩíÊ°£',NULL,NULL,NULL,NULL,'2018-10-13 22:24:06.608',NULL,NULL,NULL,NULL,50,NULL,'/template/sys/workflow/announcement/complete',NULL,'');
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
INSERT INTO `act_re_model` VALUES ('1',6,'AnnouncementApply','ÂÖ¨ÂëäÁî≥ËØ∑ÊµÅÁ®ã',NULL,'2018-10-12 14:18:22.776','2018-10-12 14:29:08.615',1,'{\"name\":\"AnnouncementApply\",\"revision\":1,\"description\":\"ÂÖ¨ÂëäÁî≥ËØ∑ÁöÑÁõ∏ÂÖ≥ÊµÅÁ®ã\"}',NULL,'2','3','');
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
INSERT INTO `act_re_procdef` VALUES ('WF-00001:1:11',1,'http://www.activiti.org/processdef','ÂÖ¨ÂëäÁî≥ËØ∑ÊµÅÁ®ã','WF-00001',1,'8','AnnouncementApply.bpmn20.xml','AnnouncementApply.WF-00001.png',NULL,0,1,1,''),('Êú™ÂÆö‰πâ:1:7',1,'http://www.activiti.org/processdef',NULL,'Êú™ÂÆö‰πâ',1,'4','AnnouncementApply.bpmn20.xml','AnnouncementApply.Êú™ÂÆö‰πâ.png',NULL,0,1,1,'');
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
INSERT INTO `act_ru_task` VALUES ('12510',1,'12507','10001','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-13 15:03:52.487',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('12512',1,'12508','10001','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-13 15:03:52.497',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('15014',1,'15011','15001','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:23:47.452',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('15016',1,'15012','15001','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 03:23:47.460',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('20016',1,'20013','17501','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:43:01.957',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('20018',1,'20014','17501','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 03:43:01.965',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('20022',1,'20019','20019','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:43:41.680',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('20026',1,'20023','20023','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:44:02.271',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('20030',1,'20027','20027','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:44:45.594',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('22514',1,'22511','22501','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 03:53:18.367',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('22516',1,'22512','22501','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 03:53:18.376',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('25004',1,'25001','25001','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:00:07.251',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('30004',1,'30001','30001','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:10:05.467',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('30008',1,'30005','30005','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:10:30.701',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('30012',1,'30009','30009','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:12:39.466',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('30016',1,'30013','30013','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:20:00.045',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32508',1,'32503','32503','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:21:48.646',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32510',1,'32501','32501','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:21:48.646',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32512',1,'32502','32502','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:21:48.646',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32516',1,'32513','32513','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 04:21:59.059',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32524',1,'32521','25005','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 09:23:12.905',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('32526',1,'32522','25005','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 09:23:13.095',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('32530',1,'32527','32527','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 09:32:56.175',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35010',1,'35007','32547','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:15:27.178',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35012',1,'35008','32547','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:15:27.196',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35018',1,'35015','32543','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:21:36.373',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35020',1,'35016','32543','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:21:36.415',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35026',1,'35023','32539','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:22:05.250',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35028',1,'35024','32539','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:22:05.260',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35034',1,'35031','32535','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:33:40.696',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35036',1,'35032','32535','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:33:40.730',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35042',1,'35039','32531','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 10:37:31.641',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('35044',1,'35040','32531','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 10:37:31.647',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('35060',1,'35053','35045','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.084',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35062',1,'35054','35045','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.091',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35064',1,'35055','35045','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.098',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35066',1,'35056','35045','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.106',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35068',1,'35057','35045','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.114',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35070',1,'35058','35045','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 13:48:30.123',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35086',1,'35079','35071','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.501',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35088',1,'35080','35071','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.508',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35090',1,'35081','35071','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.515',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35092',1,'35082','35071','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.523',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35094',1,'35083','35071','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.531',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35096',1,'35084','35071','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:03:36.538',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35121',1,'35114','35106','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.296',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35123',1,'35115','35106','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.304',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35125',1,'35116','35106','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.311',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35127',1,'35117','35106','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.319',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35129',1,'35118','35106','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.326',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35131',1,'35119','35106','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:04:47.333',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35147',1,'35140','35132','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.214',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35149',1,'35141','35132','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.225',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35151',1,'35142','35132','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.235',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35153',1,'35143','35132','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.242',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35155',1,'35144','35132','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.251',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35157',1,'35145','35132','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:05:20.259',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('35165',1,'35158','35158','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 14:15:01.112',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('37504',1,'37501','37501','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 14:21:35.191',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('37508',1,'37505','37505','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 14:21:51.705',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('37522',1,'37519','37509','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-14 14:22:22.142',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('37524',1,'37520','37509','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-14 14:22:22.150',NULL,NULL,1,'','/template/sys/workflow/announcement/complete'),('37536',1,'37533','37525','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:23:30.437',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37538',1,'37534','37525','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:23:30.448',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37550',1,'37547','37539','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:24:41.273',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37552',1,'37548','37539','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:24:41.286',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37564',1,'37561','37553','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:25:05.399',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('37566',1,'37562','37553','WF-00001:1:11','ÂÆ°Êâπ',NULL,NULL,'sid-17FA9E7A-D7F7-4E4E-8D13-A57846E035B8',NULL,NULL,NULL,50,'2018-10-14 14:25:05.440',NULL,NULL,1,'','/template/sys/workflow/announcement/aduit'),('40004',1,'40001','40001','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-11-08 13:20:18.247',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('7506',1,'7503','12','WF-00001:1:11','Áî≥ËØ∑',NULL,NULL,'sid-952D80A5-691E-40D9-A17E-2ED958A17C7A',NULL,NULL,NULL,50,'2018-10-13 14:24:06.591',NULL,NULL,1,'','/template/sys/workflow/announcement/apply'),('7508',1,'7504','12','WF-00001:1:11','ÂΩíÊ°£',NULL,NULL,'sid-2E8308D6-4EA5-4953-ABD7-78C722B8141E',NULL,NULL,NULL,50,'2018-10-13 14:24:06.602',NULL,NULL,1,'','/template/sys/workflow/announcement/complete');
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
INSERT INTO `sys_announcement_changed` VALUES ('1',NULL,NULL,'2018-06-09 23:06:54',1,'2018-06-09 23:06:54',NULL,NULL),('10','ÊµãËØïÂÜÖÂÆπ',NULL,'2018-06-09 23:39:15',9,'2018-06-09 23:39:15',NULL,'201806091126'),('11','ÊµãËØïÂÜÖÂÆπ',NULL,'2018-06-09 23:39:44',10,'2018-06-09 23:39:44',NULL,'201806091126'),('12','2',NULL,'2018-06-11 22:54:56',11,'2018-06-11 22:54:56',NULL,'ÊµãËØï1'),('13','2',NULL,'2018-06-11 22:55:00',12,'2018-06-11 22:55:00',NULL,'ÊµãËØï1'),('14','2',NULL,'2018-06-11 22:55:02',13,'2018-06-11 22:55:02',NULL,'ÊµãËØï1'),('15','',NULL,'2018-10-09 22:01:12',14,'2018-10-09 22:01:12',NULL,''),('16','',NULL,'2018-10-12 22:30:09',15,'2018-10-12 22:30:09',NULL,''),('17','',NULL,'2018-10-13 22:50:01',16,'2018-10-13 22:50:01',NULL,''),('18','',NULL,'2018-10-13 23:05:23',17,'2018-10-13 23:05:23',NULL,''),('19','',NULL,'2018-10-14 11:18:21',18,'2018-10-14 11:18:21',NULL,''),('20','',NULL,'2018-10-14 11:31:35',19,'2018-10-14 11:31:35',NULL,''),('21','',NULL,'2018-10-14 11:43:42',20,'2018-10-14 11:43:42',NULL,''),('22','',NULL,'2018-10-14 11:51:20',21,'2018-10-14 11:51:20',NULL,''),('23','',NULL,'2018-10-14 12:00:37',22,'2018-10-14 12:00:37',NULL,''),('24','',NULL,'2018-10-14 12:10:34',23,'2018-10-14 12:10:34',NULL,''),('25','',NULL,'2018-10-14 12:12:40',24,'2018-10-14 12:12:40',NULL,''),('26','',NULL,'2018-10-14 12:20:00',25,'2018-10-14 12:20:00',NULL,''),('27','',NULL,'2018-10-14 12:22:00',26,'2018-10-14 12:22:00',NULL,''),('28','',NULL,'2018-10-14 17:32:57',27,'2018-10-14 17:32:57',NULL,''),('29','',NULL,'2018-10-14 17:33:16',28,'2018-10-14 17:33:16',NULL,''),('3','ÊµãËØïÂÜÖÂÆπ',NULL,'2018-06-09 23:29:22',2,'2018-06-09 23:29:22',NULL,'201806091126'),('30','',NULL,'2018-10-14 17:33:45',29,'2018-10-14 17:33:45',NULL,''),('31','',NULL,'2018-10-14 17:33:47',30,'2018-10-14 17:33:47',NULL,''),('32','',NULL,'2018-10-14 17:33:49',31,'2018-10-14 17:33:49',NULL,''),('33','',NULL,'2018-10-14 17:33:51',32,'2018-10-14 17:33:51',NULL,''),('34','',NULL,'2018-10-14 21:47:58',33,'2018-10-14 21:47:58',NULL,''),('35','',NULL,'2018-10-14 22:02:59',34,'2018-10-14 22:02:59',NULL,''),('36','',NULL,'2018-10-14 22:04:02',35,'2018-10-14 22:04:02',NULL,''),('37','',NULL,'2018-10-14 22:04:33',36,'2018-10-14 22:04:33',NULL,''),('38','',NULL,'2018-10-14 22:05:03',37,'2018-10-14 22:05:03',NULL,''),('39','',NULL,'2018-10-14 22:14:43',38,'2018-10-14 22:14:43',NULL,''),('4','ÊµãËØïÂÜÖÂÆπ',NULL,'2018-06-09 23:30:55',3,'2018-06-09 23:30:55',NULL,'201806091126'),('40','',NULL,'2018-10-14 22:22:08',39,'2018-10-14 22:22:08',NULL,''),('41','',NULL,'2018-10-14 22:22:38',40,'2018-10-14 22:22:38',NULL,''),('42','',NULL,'2018-10-14 22:23:55',41,'2018-10-14 22:23:55',NULL,''),('43','',NULL,'2018-10-14 22:24:50',42,'2018-10-14 22:24:50',NULL,''),('44','',NULL,'2018-11-08 21:20:19',43,'2018-11-08 21:20:19',NULL,''),('5','ÊµãËØïÂÜÖÂÆπ',NULL,'2018-06-09 23:32:53',4,'2018-06-09 23:32:53',NULL,'201806091126'),('6','ÊµãËØïÂÜÖÂÆπ',NULL,'2018-06-09 23:34:02',5,'2018-06-09 23:34:02',NULL,'201806091126'),('7','ÊµãËØïÂÜÖÂÆπ',NULL,'2018-06-09 23:35:30',6,'2018-06-09 23:35:30',NULL,'201806091126'),('8','ÊµãËØïÂÜÖÂÆπ',NULL,'2018-06-09 23:37:31',7,'2018-06-09 23:37:31',NULL,'201806091126'),('9','ÊµãËØïÂÜÖÂÆπ',NULL,'2018-06-09 23:38:34',8,'2018-06-09 23:38:34',NULL,'201806091126');
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
INSERT INTO `sys_code` VALUES (1,'YesOrNo','1','ÊòØ','2018-06-07 19:24:52',0,'2018-11-06 21:54:07','','','','',''),(2,'YesOrNo','0','Âê¶','2018-06-07 19:24:52',2,'2018-11-06 21:54:07','','','','',''),(4,'WorksheetState','0','‰ΩúÂ∫ü','2018-06-14 22:56:24',4,'2018-11-06 21:54:07','','','','',''),(5,'WorksheetState','2','ÂÆåÊàê','2018-06-14 22:56:24',2,'2018-11-06 21:54:07','','','','',''),(6,'WorksheetState','3','ÊöÇÂÅú','2018-06-14 22:56:24',3,'2018-11-06 21:54:07','','','','',''),(7,'WorksheetState','1','ËøêË°å‰∏≠','2018-06-14 22:56:24',1,'2018-11-06 21:54:07','','','','',''),(8,'Gender','1','Áî∑','2018-06-14 23:08:34',2,'2018-11-06 21:54:07','','','','',''),(9,'Gender','0','Â•≥','2018-06-14 23:08:34',1,'2018-11-06 21:54:07','','','','',''),(10,'Gender','2','ÂÖ∂‰ªñ','2018-06-14 23:08:34',0,'2018-11-06 21:54:07','','','','',''),(11,'OpenOrClose','1','ÂºÄÂêØ','2018-06-14 23:08:34',0,'2018-11-06 21:54:07','','','','',''),(12,'OpenOrClose','0','ÂÖ≥Èó≠','2018-06-14 23:08:34',0,'2018-11-06 21:54:07','','','','','');
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
INSERT INTO `sys_extend_property` VALUES (1,'YesOrNo','2018-06-07 19:24:18','2018-11-06 21:55:47','ÊòØÂê¶','SELECT CODE,CODE_NAME,\'\' FILETER FROM SYS_CODE  WHERE CLASSIFY=\'YesOrNo\' ORDER BY DISPLAY_SN'),(2,'WorksheetState','2018-06-14 22:55:07','2018-11-06 21:55:47','Â∑•‰ΩúÂçïÁä∂ÊÄÅ','SELECT CODE,CODE_NAME,\'\' FILETER FROM SYS_CODE WHERE CLASSIFY=\'WorksheetState\' ORDER BY DISPLAY_SN');
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
INSERT INTO `sys_menu` VALUES (1,'2018-06-07 19:09:29',1,'sys/code/code','2018-10-16 21:46:12','Êò†Â∞Ñ',0,3,''),(4,'2018-06-09 22:45:08',1,'','2018-06-09 22:45:08','Â∑•‰ΩúÊµÅÁÆ°ÁêÜ',0,NULL,NULL),(6,'2018-04-05 20:09:35',2,'http://localhost:8081/bootworkflow/oll/instance/process-list','2018-11-08 22:48:34','Â∑•‰ΩúÊµÅÁÆ°ÁêÜ',4,3,'true'),(7,'2018-04-05 20:09:44',2,'',NULL,'ËäÇÁÇπÁÆ°ÁêÜ',4,2,NULL),(8,'2018-04-27 15:33:08',2,'sys/assistant/generateEntity','2018-10-16 21:47:05','ÂÆû‰ΩìÊò†Â∞ÑÔºàÊï∞ÊçÆÂ∫ìÔºâ',1,1,NULL),(9,'2018-04-09 23:19:03',2,'sys/menu/','2018-10-16 22:03:08','ËèúÂçïÁÆ°ÁêÜ',15,1,NULL),(11,'2018-04-09 23:47:46',2,'sys/role/','2018-10-17 22:58:44','ËßíËâ≤ÁÆ°ÁêÜ',15,2,NULL),(12,'2018-04-09 23:48:22',2,'',NULL,'ÊùÉÈôêÁÆ°ÁêÜ',15,3,NULL),(13,'2018-04-09 23:50:10',2,'sys/admin/','2018-10-17 22:58:54','Êìç‰ΩúÂëòÁÆ°ÁêÜ',15,4,NULL),(14,'2018-04-09 23:50:19',2,'',NULL,'ÁªÑÁªáÁÆ°ÁêÜ',15,5,NULL),(15,'2018-04-23 17:34:11',1,'','2018-06-07 19:21:57','Á≥ªÁªüÁª¥Êä§',0,1,''),(16,'2018-04-23 17:36:34',2,'sys/config/entityFilterParamConfig','2018-10-16 22:00:39','ÂÆû‰ΩìËøáÊª§Â≠ó',1,5,NULL),(17,'2018-04-27 15:43:48',2,'sys/assistant/generateEntityOom','2018-10-16 21:47:12','ÂÆû‰ΩìÊò†Â∞ÑÔºàoomÔºâ',1,0,NULL),(395,'2018-05-30 18:14:11',2,'http://localhost:8081/bootworkflow/oll/model/model-list','2018-11-08 22:48:39','Ê®°ÂûãÂàóË°®',4,4,'true'),(396,'2018-05-31 18:24:45',1,'','2018-06-07 19:21:51','‰∏™‰∫∫ËÆæÁΩÆ',0,4,''),(397,'2018-05-31 18:24:55',2,'','2018-05-31 18:25:14','ÂØÜÁ†Å‰øÆÊîπ',396,2,''),(398,'2018-05-31 18:25:06',2,'','2018-05-31 18:25:06','Âü∫Êú¨‰ø°ÊÅØ',396,1,NULL),(401,'2018-06-06 17:25:24',1,'','2018-06-06 17:25:24','Â∑•‰ΩúÊµÅÊµãËØï',0,NULL,NULL),(402,'2018-06-06 17:26:00',2,'sys/workflow/announcement/apply','2018-10-16 21:46:23','ÂÖ¨ÂëäÁî≥ËØ∑ÊµÅÁ®ã',401,1,''),(406,'2018-06-07 19:20:54',2,'sys/code/','2018-10-17 22:58:39','‰ª£Á†ÅÁÆ°ÁêÜ',15,1,NULL),(407,'2018-06-07 19:22:52',2,'sys/extendproperty/','2018-10-17 22:59:05','Êâ©Â±ïÂ±ûÊÄß',15,6,NULL),(409,'2018-06-12 22:49:20',2,'/sys/worksheet/query','2018-11-06 21:24:39','Â∑•‰ΩúÂçïÊü•ËØ¢',4,1,NULL);
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
INSERT INTO `sys_menu_visit_log` VALUES (1,'2018-06-07 13:59:29',402,'2018-06-07 13:59:29','2018-06-07 13:59:28'),(2,'2018-06-07 17:39:01',402,'2018-06-07 17:39:01','2018-06-07 17:39:01'),(3,'2018-06-07 17:39:03',11,'2018-06-07 17:39:03','2018-06-07 17:39:03'),(4,'2018-06-07 17:39:03',9,'2018-06-07 17:39:03','2018-06-07 17:39:03'),(5,'2018-06-07 17:39:07',11,'2018-06-07 17:39:07','2018-06-07 17:39:07'),(6,'2018-06-07 18:00:55',9,'2018-06-07 18:00:55','2018-06-07 18:00:54'),(7,'2018-06-07 18:00:59',9,'2018-06-07 18:00:59','2018-06-07 18:00:59'),(8,'2018-06-07 18:01:01',9,'2018-06-07 18:01:01','2018-06-07 18:01:01'),(9,'2018-06-07 18:01:04',9,'2018-06-07 18:01:04','2018-06-07 18:01:04'),(10,'2018-06-07 18:01:07',9,'2018-06-07 18:01:07','2018-06-07 18:01:07'),(11,'2018-06-07 18:01:09',9,'2018-06-07 18:01:09','2018-06-07 18:01:09'),(12,'2018-06-07 18:01:11',11,'2018-06-07 18:01:11','2018-06-07 18:01:11'),(13,'2018-06-07 18:01:13',11,'2018-06-07 18:01:13','2018-06-07 18:01:13'),(14,'2018-06-07 18:01:14',13,'2018-06-07 18:01:14','2018-06-07 18:01:14'),(15,'2018-06-07 18:01:18',11,'2018-06-07 18:01:18','2018-06-07 18:01:18'),(16,'2018-06-07 18:01:24',13,'2018-06-07 18:01:24','2018-06-07 18:01:24'),(17,'2018-06-07 18:01:27',17,'2018-06-07 18:01:27','2018-06-07 18:01:27'),(18,'2018-06-07 18:01:33',9,'2018-06-07 18:01:33','2018-06-07 18:01:33'),(19,'2018-06-07 18:01:34',11,'2018-06-07 18:01:34','2018-06-07 18:01:34'),(20,'2018-06-07 18:01:37',13,'2018-06-07 18:01:37','2018-06-07 18:01:37'),(21,'2018-06-07 18:01:40',17,'2018-06-07 18:01:40','2018-06-07 18:01:40'),(22,'2018-06-07 18:01:42',8,'2018-06-07 18:01:42','2018-06-07 18:01:42'),(23,'2018-06-07 18:01:44',16,'2018-06-07 18:01:44','2018-06-07 18:01:44'),(24,'2018-06-07 18:01:51',5,'2018-06-07 18:01:51','2018-06-07 18:01:51'),(25,'2018-06-07 18:01:54',6,'2018-06-07 18:01:54','2018-06-07 18:01:54'),(26,'2018-06-07 18:01:55',395,'2018-06-07 18:01:55','2018-06-07 18:01:55'),(27,'2018-06-07 18:01:59',6,'2018-06-07 18:01:59','2018-06-07 18:01:59'),(28,'2018-06-07 18:02:09',402,'2018-06-07 18:02:09','2018-06-07 18:02:09'),(29,'2018-06-07 18:02:28',402,'2018-06-07 18:02:28','2018-06-07 18:02:27'),(30,'2018-06-07 18:03:16',9,'2018-06-07 18:03:16','2018-06-07 18:03:16'),(31,'2018-06-07 18:03:21',13,'2018-06-07 18:03:21','2018-06-07 18:03:21'),(32,'2018-06-07 18:03:37',13,'2018-06-07 18:03:37','2018-06-07 18:03:37'),(33,'2018-06-07 18:03:40',11,'2018-06-07 18:03:40','2018-06-07 18:03:40'),(34,'2018-06-07 18:04:12',402,'2018-06-07 18:04:12','2018-06-07 18:04:11'),(35,'2018-06-07 18:04:21',9,'2018-06-07 18:04:21','2018-06-07 18:04:21'),(36,'2018-06-07 18:04:35',17,'2018-06-07 18:04:35','2018-06-07 18:04:35'),(37,'2018-06-07 18:05:23',17,'2018-06-07 18:05:23','2018-06-07 18:05:23'),(38,'2018-06-07 18:13:39',5,'2018-06-07 18:13:39','2018-06-07 18:13:39'),(39,'2018-06-07 18:13:41',6,'2018-06-07 18:13:41','2018-06-07 18:13:41'),(40,'2018-06-07 18:13:42',395,'2018-06-07 18:13:42','2018-06-07 18:13:42'),(41,'2018-06-07 19:03:35',5,'2018-06-07 19:03:35','2018-06-07 19:03:35'),(42,'2018-06-07 19:03:37',6,'2018-06-07 19:03:37','2018-06-07 19:03:37'),(43,'2018-06-07 19:08:48',9,'2018-06-07 19:08:48','2018-06-07 19:08:48'),(44,'2018-06-07 19:12:40',9,'2018-06-07 19:12:40','2018-06-07 19:12:40'),(45,'2018-06-07 19:17:56',9,'2018-06-07 19:17:56','2018-06-07 19:17:56'),(46,'2018-06-07 19:20:05',9,'2018-06-07 19:20:05','2018-06-07 19:20:05'),(47,'2018-06-07 19:20:18',1,'2018-06-07 19:20:18','2018-06-07 19:20:18'),(48,'2018-06-07 19:20:24',1,'2018-06-07 19:20:24','2018-06-07 19:20:24'),(49,'2018-06-07 19:20:26',1,'2018-06-07 19:20:26','2018-06-07 19:20:26'),(50,'2018-06-07 19:20:28',9,'2018-06-07 19:20:28','2018-06-07 19:20:28'),(51,'2018-06-07 19:21:26',1,'2018-06-07 19:21:26','2018-06-07 19:21:26'),(52,'2018-06-07 19:21:28',1,'2018-06-07 19:21:28','2018-06-07 19:21:28'),(53,'2018-06-07 19:21:37',1,'2018-06-07 19:21:37','2018-06-07 19:21:37'),(54,'2018-06-07 19:21:39',9,'2018-06-07 19:21:39','2018-06-07 19:21:39'),(55,'2018-06-07 19:22:05',9,'2018-06-07 19:22:05','2018-06-07 19:22:05'),(56,'2018-06-07 19:22:59',406,'2018-06-07 19:22:59','2018-06-07 19:22:59'),(57,'2018-06-07 19:23:02',407,'2018-06-07 19:23:02','2018-06-07 19:23:02'),(58,'2018-06-07 19:25:06',407,'2018-06-07 19:25:06','2018-06-07 19:25:06'),(59,'2018-06-07 19:25:10',406,'2018-06-07 19:25:10','2018-06-07 19:25:10'),(60,'2018-06-07 22:45:33',406,'2018-06-07 22:45:33','2018-06-07 22:45:32'),(61,'2018-06-07 22:45:34',9,'2018-06-07 22:45:34','2018-06-07 22:45:34'),(62,'2018-06-07 22:45:36',406,'2018-06-07 22:45:36','2018-06-07 22:45:36'),(63,'2018-06-07 22:45:37',11,'2018-06-07 22:45:37','2018-06-07 22:45:37'),(64,'2018-06-07 22:52:00',11,'2018-06-07 22:52:00','2018-06-07 22:52:00'),(65,'2018-06-07 22:52:03',11,'2018-06-07 22:52:03','2018-06-07 22:52:03'),(66,'2018-06-07 22:53:51',11,'2018-06-07 22:53:51','2018-06-07 22:53:51'),(67,'2018-06-07 22:53:54',11,'2018-06-07 22:53:54','2018-06-07 22:53:54'),(68,'2018-06-07 22:53:58',11,'2018-06-07 22:53:58','2018-06-07 22:53:58'),(69,'2018-06-07 22:55:26',11,'2018-06-07 22:55:26','2018-06-07 22:55:26'),(70,'2018-06-07 22:56:53',9,'2018-06-07 22:56:53','2018-06-07 22:56:53'),(71,'2018-06-07 23:03:10',9,'2018-06-07 23:03:10','2018-06-07 23:03:10'),(72,'2018-06-07 23:03:11',9,'2018-06-07 23:03:11','2018-06-07 23:03:11'),(73,'2018-06-07 23:03:12',9,'2018-06-07 23:03:12','2018-06-07 23:03:12'),(74,'2018-06-07 23:03:14',9,'2018-06-07 23:03:14','2018-06-07 23:03:14'),(75,'2018-06-07 23:03:26',9,'2018-06-07 23:03:26','2018-06-07 23:03:26'),(76,'2018-06-07 23:03:29',9,'2018-06-07 23:03:29','2018-06-07 23:03:29'),(77,'2018-06-07 23:03:32',9,'2018-06-07 23:03:32','2018-06-07 23:03:32'),(78,'2018-06-07 23:15:13',9,'2018-06-07 23:15:13','2018-06-07 23:15:13'),(79,'2018-06-07 23:15:15',406,'2018-06-07 23:15:15','2018-06-07 23:15:15'),(80,'2018-06-07 23:15:17',11,'2018-06-07 23:15:17','2018-06-07 23:15:17'),(81,'2018-06-07 23:15:19',406,'2018-06-07 23:15:19','2018-06-07 23:15:19'),(82,'2018-06-07 23:15:22',11,'2018-06-07 23:15:22','2018-06-07 23:15:22'),(83,'2018-06-07 23:15:24',9,'2018-06-07 23:15:24','2018-06-07 23:15:24'),(84,'2018-06-07 23:15:26',9,'2018-06-07 23:15:26','2018-06-07 23:15:26'),(85,'2018-06-07 23:15:29',9,'2018-06-07 23:15:29','2018-06-07 23:15:29'),(86,'2018-06-07 23:15:31',9,'2018-06-07 23:15:31','2018-06-07 23:15:31'),(87,'2018-06-07 23:15:34',9,'2018-06-07 23:15:34','2018-06-07 23:15:34'),(88,'2018-06-07 23:15:36',9,'2018-06-07 23:15:36','2018-06-07 23:15:36'),(89,'2018-06-07 23:16:09',11,'2018-06-07 23:16:09','2018-06-07 23:16:09'),(90,'2018-06-07 23:16:10',406,'2018-06-07 23:16:10','2018-06-07 23:16:10'),(91,'2018-06-07 23:16:29',407,'2018-06-07 23:16:29','2018-06-07 23:16:29'),(92,'2018-06-07 23:16:43',402,'2018-06-07 23:16:43','2018-06-07 23:16:43'),(93,'2018-06-09 22:43:21',1,'2018-06-09 22:43:21','2018-06-09 22:43:20'),(94,'2018-06-09 22:43:32',9,'2018-06-09 22:43:32','2018-06-09 22:43:32'),(95,'2018-06-09 22:45:37',395,'2018-06-09 22:45:37','2018-06-09 22:45:37'),(96,'2018-06-09 22:48:34',402,'2018-06-09 22:48:34','2018-06-09 22:48:34'),(97,'2018-06-09 22:59:11',402,'2018-06-09 22:59:11','2018-06-09 22:59:11'),(98,'2018-06-09 23:26:10',402,'2018-06-09 23:26:10','2018-06-09 23:26:10'),(99,'2018-06-10 21:18:22',6,'2018-06-10 21:18:22','2018-06-10 21:18:21'),(100,'2018-06-10 21:19:02',395,'2018-06-10 21:19:02','2018-06-10 21:19:02'),(101,'2018-06-10 21:20:32',6,'2018-06-10 21:20:32','2018-06-10 21:20:32'),(102,'2018-06-10 21:23:59',395,'2018-06-10 21:23:59','2018-06-10 21:23:59'),(103,'2018-06-10 21:24:10',6,'2018-06-10 21:24:10','2018-06-10 21:24:10'),(104,'2018-06-11 22:52:16',395,'2018-06-11 22:52:16','2018-06-11 22:52:16'),(105,'2018-06-11 22:53:47',6,'2018-06-11 22:53:47','2018-06-11 22:53:47'),(106,'2018-06-11 22:54:21',402,'2018-06-11 22:54:21','2018-06-11 22:54:21'),(107,'2018-06-11 23:00:19',9,'2018-06-11 23:00:19','2018-06-11 23:00:18'),(108,'2018-06-11 23:02:35',395,'2018-06-11 23:02:35','2018-06-11 23:02:35'),(109,'2018-06-11 23:17:18',395,'2018-06-11 23:17:18','2018-06-11 23:17:18'),(110,'2018-06-11 23:29:09',402,'2018-06-11 23:29:09','2018-06-11 23:29:05'),(111,'2018-06-11 23:34:08',395,'2018-06-11 23:34:08','2018-06-11 23:34:08'),(112,'2018-06-11 23:36:30',395,'2018-06-11 23:36:30','2018-06-11 23:36:27'),(113,'2018-06-12 22:46:12',395,'2018-06-12 22:46:12','2018-06-12 22:46:11'),(114,'2018-06-12 22:46:28',6,'2018-06-12 22:46:28','2018-06-12 22:46:28'),(115,'2018-06-12 22:46:44',395,'2018-06-12 22:46:44','2018-06-12 22:46:44'),(116,'2018-06-12 22:48:58',9,'2018-06-12 22:48:58','2018-06-12 22:48:58'),(117,'2018-06-12 23:11:58',409,'2018-06-12 23:11:58','2018-06-12 23:11:58'),(118,'2018-06-13 22:55:52',409,'2018-06-13 22:55:52','2018-06-13 22:55:52'),(119,'2018-06-13 22:56:31',409,'2018-06-13 22:56:31','2018-06-13 22:56:31'),(120,'2018-06-13 23:00:46',409,'2018-06-13 23:00:46','2018-06-13 23:00:45'),(121,'2018-06-13 23:10:10',409,'2018-06-13 23:10:10','2018-06-13 23:10:07'),(122,'2018-06-13 23:17:16',409,'2018-06-13 23:17:16','2018-06-13 23:17:16'),(123,'2018-06-14 22:47:41',409,'2018-06-14 22:47:41','2018-06-14 22:47:40'),(124,'2018-06-14 22:49:08',409,'2018-06-14 22:49:08','2018-06-14 22:49:08'),(125,'2018-06-14 22:49:23',409,'2018-06-14 22:49:23','2018-06-14 22:49:23'),(126,'2018-06-14 22:50:24',409,'2018-06-14 22:50:24','2018-06-14 22:50:24'),(127,'2018-06-14 22:51:00',409,'2018-06-14 22:51:00','2018-06-14 22:51:00'),(128,'2018-06-14 22:51:14',407,'2018-06-14 22:51:14','2018-06-14 22:51:14'),(129,'2018-06-14 22:55:10',406,'2018-06-14 22:55:10','2018-06-14 22:55:10'),(130,'2018-06-14 23:17:03',9,'2018-06-14 23:17:03','2018-06-14 23:17:03'),(131,'2018-06-14 23:17:17',406,'2018-06-14 23:17:17','2018-06-14 23:17:17'),(132,'2018-06-14 23:17:18',11,'2018-06-14 23:17:18','2018-06-14 23:17:18'),(133,'2018-06-14 23:17:22',13,'2018-06-14 23:17:22','2018-06-14 23:17:22'),(134,'2018-06-14 23:17:26',1,'2018-06-14 23:17:26','2018-06-14 23:17:26'),(135,'2018-06-14 23:17:30',17,'2018-06-14 23:17:30','2018-06-14 23:17:30'),(136,'2018-06-14 23:26:53',1,'2018-06-14 23:26:53','2018-06-14 23:26:53'),(137,'2018-06-14 23:30:39',1,'2018-06-14 23:30:39','2018-06-14 23:30:39'),(138,'2018-06-14 23:30:43',16,'2018-06-14 23:30:43','2018-06-14 23:30:43'),(139,'2018-06-14 23:30:46',17,'2018-06-14 23:30:46','2018-06-14 23:30:46'),(140,'2018-06-14 23:30:57',13,'2018-06-14 23:30:57','2018-06-14 23:30:57'),(141,'2018-06-14 23:31:04',13,'2018-06-14 23:31:04','2018-06-14 23:31:04'),(142,'2018-06-14 23:31:08',407,'2018-06-14 23:31:08','2018-06-14 23:31:08'),(143,'2018-06-14 23:31:16',409,'2018-06-14 23:31:16','2018-06-14 23:31:16'),(144,'2018-06-14 23:31:34',402,'2018-06-14 23:31:34','2018-06-14 23:31:34'),(145,'2018-06-14 23:36:58',9,'2018-06-14 23:36:58','2018-06-14 23:36:58'),(146,'2018-06-14 23:38:38',9,'2018-06-14 23:38:38','2018-06-14 23:38:38'),(147,'2018-06-14 23:38:44',407,'2018-06-14 23:38:44','2018-06-14 23:38:44'),(148,'2018-09-29 22:13:19',9,'2018-09-29 22:13:19','2018-09-29 22:13:13'),(149,'2018-09-29 22:13:33',406,'2018-09-29 22:13:33','2018-09-29 22:13:33'),(150,'2018-09-29 22:13:37',406,'2018-09-29 22:13:37','2018-09-29 22:13:37'),(151,'2018-09-29 22:13:38',11,'2018-09-29 22:13:38','2018-09-29 22:13:38'),(152,'2018-09-29 22:14:04',1,'2018-09-29 22:14:04','2018-09-29 22:14:03'),(153,'2018-09-29 22:14:08',402,'2018-09-29 22:14:08','2018-09-29 22:14:08'),(154,'2018-09-29 22:14:11',409,'2018-09-29 22:14:11','2018-09-29 22:14:11'),(155,'2018-09-29 22:14:17',6,'2018-09-29 22:14:17','2018-09-29 22:14:17'),(156,'2018-09-29 22:14:18',395,'2018-09-29 22:14:18','2018-09-29 22:14:18'),(157,'2018-10-02 23:24:22',409,'2018-10-02 23:24:22','2018-10-02 23:24:21'),(158,'2018-10-02 23:24:25',6,'2018-10-02 23:24:25','2018-10-02 23:24:25'),(159,'2018-10-02 23:24:30',402,'2018-10-02 23:24:30','2018-10-02 23:24:30'),(160,'2018-10-02 23:24:58',402,'2018-10-02 23:24:58','2018-10-02 23:24:58'),(161,'2018-10-02 23:25:00',9,'2018-10-02 23:25:00','2018-10-02 23:25:00'),(162,'2018-10-02 23:25:02',406,'2018-10-02 23:25:02','2018-10-02 23:25:01'),(163,'2018-10-02 23:25:03',11,'2018-10-02 23:25:03','2018-10-02 23:25:03'),(164,'2018-10-02 23:25:10',13,'2018-10-02 23:25:10','2018-10-02 23:25:10'),(165,'2018-10-02 23:25:12',407,'2018-10-02 23:25:12','2018-10-02 23:25:12'),(166,'2018-10-02 23:25:15',1,'2018-10-02 23:25:15','2018-10-02 23:25:15'),(167,'2018-10-02 23:25:16',17,'2018-10-02 23:25:16','2018-10-02 23:25:16'),(168,'2018-10-02 23:25:17',8,'2018-10-02 23:25:17','2018-10-02 23:25:17'),(169,'2018-10-02 23:25:28',1,'2018-10-02 23:25:28','2018-10-02 23:25:28'),(170,'2018-10-02 23:25:35',407,'2018-10-02 23:25:35','2018-10-02 23:25:35'),(171,'2018-10-08 22:24:18',409,'2018-10-08 22:24:18','2018-10-08 22:24:17'),(172,'2018-10-08 22:24:20',6,'2018-10-08 22:24:20','2018-10-08 22:24:20'),(173,'2018-10-08 22:24:26',402,'2018-10-08 22:24:26','2018-10-08 22:24:26'),(174,'2018-10-08 22:24:32',395,'2018-10-08 22:24:32','2018-10-08 22:24:32'),(175,'2018-10-08 22:37:44',9,'2018-10-08 22:37:44','2018-10-08 22:37:44'),(176,'2018-10-09 21:56:47',409,'2018-10-09 21:56:47','2018-10-09 21:56:47'),(177,'2018-10-09 21:57:31',6,'2018-10-09 21:57:31','2018-10-09 21:57:30'),(178,'2018-10-09 22:00:51',395,'2018-10-09 22:00:51','2018-10-09 22:00:51'),(179,'2018-10-09 22:00:58',409,'2018-10-09 22:00:58','2018-10-09 22:00:58'),(180,'2018-10-09 22:00:59',6,'2018-10-09 22:00:59','2018-10-09 22:00:59'),(181,'2018-10-09 22:01:00',395,'2018-10-09 22:01:00','2018-10-09 22:01:00'),(182,'2018-10-09 22:01:04',402,'2018-10-09 22:01:04','2018-10-09 22:01:04'),(183,'2018-10-09 22:01:43',6,'2018-10-09 22:01:43','2018-10-09 22:01:43'),(184,'2018-10-09 22:02:04',402,'2018-10-09 22:02:04','2018-10-09 22:02:03'),(185,'2018-10-10 21:10:58',409,'2018-10-10 21:10:58','2018-10-10 21:10:57'),(186,'2018-10-10 21:11:00',6,'2018-10-10 21:11:00','2018-10-10 21:11:00'),(187,'2018-10-12 22:17:48',395,'2018-10-12 22:17:48','2018-10-12 22:17:47'),(188,'2018-10-12 22:25:23',6,'2018-10-12 22:25:23','2018-10-12 22:25:23'),(189,'2018-10-12 22:26:10',402,'2018-10-12 22:26:10','2018-10-12 22:26:10'),(190,'2018-10-12 22:26:46',6,'2018-10-12 22:26:46','2018-10-12 22:26:46'),(191,'2018-10-12 22:28:24',409,'2018-10-12 22:28:24','2018-10-12 22:28:24'),(192,'2018-10-12 22:29:28',6,'2018-10-12 22:29:28','2018-10-12 22:29:28'),(193,'2018-10-12 22:29:40',6,'2018-10-12 22:29:40','2018-10-12 22:29:40'),(194,'2018-10-12 22:30:02',402,'2018-10-12 22:30:02','2018-10-12 22:30:02'),(195,'2018-10-13 19:23:00',409,'2018-10-13 19:23:00','2018-10-13 19:23:00'),(196,'2018-10-13 19:23:03',6,'2018-10-13 19:23:03','2018-10-13 19:23:03'),(197,'2018-10-13 22:49:53',402,'2018-10-13 22:49:53','2018-10-13 22:49:53'),(198,'2018-10-14 11:18:17',402,'2018-10-14 11:18:17','2018-10-14 11:18:16'),(199,'2018-10-14 11:30:24',6,'2018-10-14 11:30:24','2018-10-14 11:30:23'),(200,'2018-10-14 11:30:28',409,'2018-10-14 11:30:28','2018-10-14 11:30:28'),(201,'2018-10-14 11:31:27',402,'2018-10-14 11:31:27','2018-10-14 11:31:27'),(202,'2018-10-14 17:28:43',9,'2018-10-14 17:28:43','2018-10-14 17:28:43'),(203,'2018-10-14 18:03:15',1,'2018-10-14 18:03:15','2018-10-14 18:03:15'),(204,'2018-10-14 18:15:44',6,'2018-10-14 18:15:44','2018-10-14 18:15:44'),(205,'2018-10-14 22:04:31',409,'2018-10-14 22:04:31','2018-10-14 22:04:31'),(206,'2018-10-14 22:13:50',6,'2018-10-14 22:13:50','2018-10-14 22:13:50'),(207,'2018-10-16 21:26:43',9,'2018-10-16 21:26:43','2018-10-16 21:26:43'),(208,'2018-10-16 22:01:00',402,'2018-10-16 22:01:00','2018-10-16 22:01:00'),(209,'2018-10-16 22:02:43',409,'2018-10-16 22:02:43','2018-10-16 22:02:43'),(210,'2018-10-16 22:02:48',9,'2018-10-16 22:02:48','2018-10-16 22:02:48'),(211,'2018-10-16 22:03:12',9,'2018-10-16 22:03:12','2018-10-16 22:03:12'),(212,'2018-10-17 20:45:57',409,'2018-10-17 20:45:57','2018-10-17 20:45:57'),(213,'2018-10-17 20:46:05',9,'2018-10-17 20:46:05','2018-10-17 20:46:05'),(214,'2018-10-17 22:42:13',409,'2018-10-17 22:42:13','2018-10-17 22:42:13'),(215,'2018-10-17 22:42:15',6,'2018-10-17 22:42:15','2018-10-17 22:42:15'),(216,'2018-10-17 22:42:16',395,'2018-10-17 22:42:16','2018-10-17 22:42:15'),(217,'2018-10-17 22:42:19',402,'2018-10-17 22:42:19','2018-10-17 22:42:19'),(218,'2018-10-17 22:42:21',406,'2018-10-17 22:42:21','2018-10-17 22:42:21'),(219,'2018-10-17 22:42:49',9,'2018-10-17 22:42:49','2018-10-17 22:42:49'),(220,'2018-10-17 22:44:49',409,'2018-10-17 22:44:49','2018-10-17 22:44:48'),(221,'2018-10-17 22:58:10',6,'2018-10-17 22:58:10','2018-10-17 22:58:10'),(222,'2018-10-17 22:58:15',395,'2018-10-17 22:58:15','2018-10-17 22:58:15'),(223,'2018-10-17 22:58:20',406,'2018-10-17 22:58:20','2018-10-17 22:58:20'),(224,'2018-10-17 22:58:30',9,'2018-10-17 22:58:30','2018-10-17 22:58:30'),(225,'2018-10-17 23:04:02',409,'2018-10-17 23:04:02','2018-10-17 23:04:02'),(226,'2018-10-17 23:04:04',402,'2018-10-17 23:04:04','2018-10-17 23:04:04'),(227,'2018-10-17 23:08:05',406,'2018-10-17 23:08:05','2018-10-17 23:08:05'),(228,'2018-10-17 23:08:06',11,'2018-10-17 23:08:06','2018-10-17 23:08:06'),(229,'2018-10-17 23:15:16',13,'2018-10-17 23:15:16','2018-10-17 23:15:16'),(230,'2018-10-17 23:15:22',407,'2018-10-17 23:15:22','2018-10-17 23:15:22'),(231,'2018-10-17 23:15:30',9,'2018-10-17 23:15:30','2018-10-17 23:15:30'),(232,'2018-10-17 23:15:31',406,'2018-10-17 23:15:31','2018-10-17 23:15:31'),(233,'2018-10-17 23:15:33',11,'2018-10-17 23:15:33','2018-10-17 23:15:33'),(234,'2018-10-17 23:15:34',406,'2018-10-17 23:15:34','2018-10-17 23:15:34'),(235,'2018-10-17 23:15:36',11,'2018-10-17 23:15:36','2018-10-17 23:15:36'),(236,'2018-10-17 23:15:37',406,'2018-10-17 23:15:37','2018-10-17 23:15:37'),(237,'2018-10-17 23:15:43',9,'2018-10-17 23:15:43','2018-10-17 23:15:43'),(238,'2018-10-17 23:15:46',409,'2018-10-17 23:15:46','2018-10-17 23:15:46'),(239,'2018-10-17 23:15:48',402,'2018-10-17 23:15:48','2018-10-17 23:15:48'),(240,'2018-10-17 23:15:49',1,'2018-10-17 23:15:49','2018-10-17 23:15:49'),(241,'2018-10-17 23:15:52',17,'2018-10-17 23:15:52','2018-10-17 23:15:52'),(242,'2018-11-05 22:38:39',409,'2018-11-05 22:38:39','2018-11-05 22:38:39'),(243,'2018-11-05 22:39:26',402,'2018-11-05 22:39:26','2018-11-05 22:39:26'),(244,'2018-11-05 22:39:31',9,'2018-11-05 22:39:31','2018-11-05 22:39:31'),(245,'2018-11-06 21:20:51',9,'2018-11-06 21:20:51','2018-11-06 21:20:50'),(246,'2018-11-06 21:49:43',9,'2018-11-06 21:49:43','2018-11-06 21:49:42'),(247,'2018-11-06 21:51:42',1,'2018-11-06 21:51:42','2018-11-06 21:51:41'),(248,'2018-11-06 21:51:42',17,'2018-11-06 21:51:42','2018-11-06 21:51:42'),(249,'2018-11-06 21:53:14',406,'2018-11-06 21:53:14','2018-11-06 21:53:14'),(250,'2018-11-06 21:54:23',11,'2018-11-06 21:54:23','2018-11-06 21:54:23'),(251,'2018-11-06 21:55:21',13,'2018-11-06 21:55:21','2018-11-06 21:55:21'),(252,'2018-11-06 21:55:25',407,'2018-11-06 21:55:25','2018-11-06 21:55:25'),(253,'2018-11-06 21:56:10',402,'2018-11-06 21:56:10','2018-11-06 21:56:10'),(254,'2018-11-06 21:56:34',409,'2018-11-06 21:56:34','2018-11-06 21:56:33'),(255,'2018-11-06 22:03:01',1,'2018-11-06 22:03:01','2018-11-06 22:03:01'),(256,'2018-11-06 22:03:02',1,'2018-11-06 22:03:02','2018-11-06 22:03:02'),(257,'2018-11-06 22:03:03',1,'2018-11-06 22:03:03','2018-11-06 22:03:03'),(258,'2018-11-06 22:03:04',17,'2018-11-06 22:03:04','2018-11-06 22:03:04'),(259,'2018-11-06 22:03:06',8,'2018-11-06 22:03:06','2018-11-06 22:03:06'),(260,'2018-11-06 22:03:08',16,'2018-11-06 22:03:08','2018-11-06 22:03:08'),(261,'2018-11-08 21:11:24',402,'2018-11-08 21:11:24','2018-11-08 21:11:24'),(262,'2018-11-08 21:11:27',409,'2018-11-08 21:11:27','2018-11-08 21:11:27'),(263,'2018-11-08 21:20:44',395,'2018-11-08 21:20:44','2018-11-08 21:20:43'),(264,'2018-11-08 21:50:57',9,'2018-11-08 21:50:57','2018-11-08 21:50:57'),(265,'2018-11-08 22:02:06',395,'2018-11-08 22:02:06','2018-11-08 22:02:06'),(266,'2018-11-08 22:02:53',9,'2018-11-08 22:02:53','2018-11-08 22:02:53'),(267,'2018-11-08 22:03:15',395,'2018-11-08 22:03:15','2018-11-08 22:03:15'),(268,'2018-11-08 22:39:08',9,'2018-11-08 22:39:08','2018-11-08 22:39:08'),(269,'2018-11-08 22:43:05',9,'2018-11-08 22:43:05','2018-11-08 22:43:03'),(270,'2018-11-08 22:46:57',395,'2018-11-08 22:46:57','2018-11-08 22:46:57'),(271,'2018-11-08 22:48:23',9,'2018-11-08 22:48:23','2018-11-08 22:48:23'),(272,'2018-11-08 22:48:46',6,'2018-11-08 22:48:46','2018-11-08 22:48:46'),(273,'2018-11-08 22:48:48',395,'2018-11-08 22:48:48','2018-11-08 22:48:48'),(274,'2018-11-08 22:51:37',409,'2018-11-08 22:51:37','2018-11-08 22:51:35'),(275,'2018-11-08 22:51:40',6,'2018-11-08 22:51:40','2018-11-08 22:51:40');
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
INSERT INTO `sys_role` VALUES (1,'2018-09-29 22:13:50','2018-11-06 21:55:14',''),(2,'2018-09-29 22:13:50','2018-11-06 21:55:14',''),(3,'2018-05-21 17:45:12','2018-11-06 21:55:14','Êò†Â∞ÑÁÆ°ÁêÜÂëò'),(4,'2018-05-21 17:45:35','2018-11-06 21:55:14','Â∑•‰ΩúÊµÅÁÆ°ÁêÜÂëò');
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
INSERT INTO `sys_sequence` VALUES ('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.AnnouncementChanged',43),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Code',12),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.ExtendProperty',2),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Menu',409),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.MenuVisitLog',275),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Role',2),('cn.doublepoint.template.dto.domain.model.entity.sys.cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet',42),('ll.workflow.worksheetNo',44);
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
INSERT INTO `sys_worksheet` VALUES (1,NULL,'2018-06-09 23:29:20',NULL,NULL,'\"\"','2018-06-09 23:29:20',NULL,'1','3','liulei'),(2,NULL,'2018-06-09 23:30:54',NULL,NULL,'\"\"','2018-06-09 23:30:54',NULL,'1','4','liulei'),(3,NULL,'2018-06-09 23:32:53',NULL,NULL,'\"\"','2018-06-09 23:32:53',NULL,'1','5','liulei'),(4,NULL,'2018-06-09 23:34:02',NULL,NULL,'\"\"','2018-06-09 23:34:02',NULL,'1','6','liulei'),(5,NULL,'2018-06-09 23:35:30',NULL,NULL,'\"\"','2018-06-09 23:35:30',NULL,'1','7','liulei'),(6,NULL,'2018-06-09 23:37:31',NULL,NULL,'\"\"','2018-06-09 23:37:31',NULL,'1','8','liulei'),(7,NULL,'2018-06-09 23:38:34',NULL,NULL,'\"\"','2018-06-09 23:38:34',NULL,'1','9','liulei'),(8,NULL,'2018-06-09 23:39:15',NULL,NULL,'\"\"','2018-06-09 23:39:15',NULL,'1','10','liulei'),(9,NULL,'2018-06-09 23:39:44',NULL,NULL,'\"\"','2018-06-09 23:39:44',NULL,'1','11','liulei'),(10,NULL,'2018-06-11 22:54:56',NULL,NULL,'\"\"','2018-06-11 22:54:56',NULL,'1','12','liulei'),(11,NULL,'2018-06-11 22:54:59',NULL,NULL,'\"\"','2018-06-11 22:54:59',NULL,'1','13','liulei'),(18,NULL,'2018-10-14 11:31:34',NULL,NULL,'\"17501\"','2018-10-14 11:31:34',NULL,'1','20','liulei'),(19,NULL,'2018-10-14 11:43:42',NULL,NULL,'\"20019\"','2018-10-14 11:43:42',NULL,'1','21','liulei'),(20,NULL,'2018-10-14 11:51:20',NULL,NULL,'22501','2018-10-14 11:51:20',NULL,'1','22','liulei'),(21,NULL,'2018-10-14 12:00:37',NULL,NULL,'25005','2018-10-14 12:00:37',NULL,'1','23','liulei'),(22,NULL,'2018-10-14 12:10:34',NULL,NULL,'30005','2018-10-14 12:10:34',NULL,'1','24','liulei'),(23,NULL,'2018-10-14 12:12:40',NULL,NULL,'30009','2018-10-14 12:12:40',NULL,'1','25','liulei'),(24,NULL,'2018-10-14 12:20:00',NULL,NULL,'30013','2018-10-14 12:20:00',NULL,'1','26','liulei'),(25,NULL,'2018-10-14 12:22:00',NULL,NULL,'32513','2018-10-14 12:22:00',NULL,'1','27','liulei'),(26,NULL,'2018-10-14 17:32:57',NULL,NULL,'32527','2018-10-14 17:32:57',NULL,'1','28','liulei'),(27,NULL,'2018-10-14 17:33:16',NULL,NULL,'32531','2018-10-14 17:33:16',NULL,'1','29','liulei'),(28,NULL,'2018-10-14 17:33:45',NULL,NULL,'32535','2018-10-14 17:33:45',NULL,'1','30','liulei'),(29,NULL,'2018-10-14 17:33:47',NULL,NULL,'32539','2018-10-14 17:33:47',NULL,'1','31','liulei'),(30,NULL,'2018-10-14 17:33:49',NULL,NULL,'32543','2018-10-14 17:33:49',NULL,'1','32','liulei'),(31,NULL,'2018-10-14 17:33:51',NULL,NULL,'32547','2018-10-14 17:33:51',NULL,'1','33','liulei'),(32,NULL,'2018-10-14 21:47:56',NULL,NULL,'35045','2018-10-14 21:47:56',NULL,'1','34','liulei'),(33,NULL,'2018-10-14 22:02:59',NULL,NULL,'35071','2018-10-14 22:02:59',NULL,'1','35','liulei'),(34,NULL,'2018-10-14 22:04:02',NULL,NULL,'35097','2018-10-14 22:04:02',NULL,'1','36','liulei'),(35,NULL,'2018-10-14 22:04:33',NULL,NULL,'35106','2018-10-14 22:04:33',NULL,'1','37','liulei'),(36,NULL,'2018-10-14 22:05:03',NULL,NULL,'35132','2018-10-14 22:05:03',NULL,'1','38','liulei'),(37,NULL,'2018-10-14 22:14:43',NULL,NULL,'35158','2018-10-14 22:14:43',NULL,'1','39','liulei'),(38,NULL,'2018-10-14 22:22:08',NULL,NULL,'37509','2018-10-14 22:22:08',NULL,'1','40','liulei'),(39,NULL,'2018-10-14 22:22:38',NULL,NULL,'37525','2018-10-14 22:22:38',NULL,'1','41','liulei'),(40,NULL,'2018-10-14 22:23:55',NULL,NULL,'37539','2018-10-14 22:23:55',NULL,'1','42','liulei'),(41,NULL,'2018-10-14 22:24:50',NULL,NULL,'37553','2018-10-14 22:24:50',NULL,'1','43','liulei'),(42,'WF-00001','2018-11-08 21:20:19',NULL,NULL,'40001','2018-11-08 21:20:19',NULL,'1','44','liulei');
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

-- Dump completed on 2018-11-08 22:54:32
