-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: artedacozinha
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Gerente'),(2,'Cozinheiro'),(3,'Atendente');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (2,'Cozinheiro','aaa','2004-05-05','2025-05-05',1),(4,'Administrador','administrar as coisas','2023-05-05','2024-05-05',1);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Sobremesa'),(2,'Entrada'),(3,'Prato Principal'),(4,'Bebida'),(5,'Salada'),(6,'Sobremesa'),(7,'Entrada'),(8,'Prato Principal'),(9,'Bebida'),(10,'Salada'),(11,'Lanche'),(12,'Sopa');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degustacao`
--

DROP TABLE IF EXISTS `degustacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degustacao` (
  `idDegustacao` int(11) NOT NULL AUTO_INCREMENT,
  `data_degustacao` date NOT NULL,
  `nota` decimal(3,1) NOT NULL,
  `degustadorFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDegustacao`),
  KEY `degustadorFK` (`degustadorFK`),
  CONSTRAINT `degustacao_ibfk_1` FOREIGN KEY (`degustadorFK`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degustacao`
--

LOCK TABLES `degustacao` WRITE;
/*!40000 ALTER TABLE `degustacao` DISABLE KEYS */;
INSERT INTO `degustacao` VALUES (1,'2024-11-01',8.5,1),(2,'2024-11-02',7.0,2),(3,'2024-11-03',9.2,3);
/*!40000 ALTER TABLE `degustacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `rg` varchar(15) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_admissao` date NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `FKcargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE KEY `rg` (`rg`),
  KEY `FKcargo` (`FKcargo`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`FKcargo`) REFERENCES `cargo` (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'','JoÃ£o da Silva','0000-00-00',NULL,NULL),(2,'123456789','Maria Silva','2022-03-15',3000.00,1),(3,'987654321','Carlos Pereira','2021-06-12',2500.00,2),(4,'456789123','Ana Costa','2023-01-20',1800.00,3),(17,'123456780','Maria Oliveira','2023-01-15',3000.00,1),(18,'123456781','JosÃ© Santos','2023-02-10',2500.00,2),(19,'123456782','Ana Beatriz','2023-03-05',2800.00,1),(20,'123456783','Carlos Alberto','2023-04-20',2700.00,2);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagens`
--

DROP TABLE IF EXISTS `imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `tamanho` int(11) NOT NULL,
  `imagem` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagens`
--

LOCK TABLES `imagens` WRITE;
/*!40000 ALTER TABLE `imagens` DISABLE KEYS */;
INSERT INTO `imagens` VALUES (1,'fatia-de-bolo-de-chocolate-em-um-prato-preto_23-2148320821.avif','image/avif',67224,_binary '\0\0\0ftypavif\0\0\0\0avifmif1miaf\0\0\0\êmeta\0\0\0\0\0\0\0!hdlr\0\0\0\0\0\0\0\0pict\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pitm\0\0\0\0\0\0\0\0\"iloc\0\0\0\0D@\0\0\0\0\0\0\0\0\0\0\0\0Š\0\0\0#iinf\0\0\0\0\0\0\0\0infe\0\0\0\0\0\0av01\0\0\0\0jiprp\0\0\0Kipco\0\0\0colrnclx\0\0\r\0€\0\0\0av1C\0\0\0\0ispe\0\0\0\0\0\0:\0\0:\0\0\0pixi\0\0\0\0\0\0\0ipma\0\0\0\0\0\0\0\0‚\0’mdat\0\n\nfsœ\ç‚\Z\r2øŠ@A@ôºÔ„šT”ƒª¬\ßdb“Xt\×\Ü_#Â”]\Ø}4{d\\3¤\åtyµœQge¾6\äŞ¾˜ZÁ’·W§\İôJ¿†°\ÕÈŸ‹€(gµ­[?f)÷/Àqb«&\éšrrÀ\ï\ãù¥CÙªó~?4]\éz\ëÀ\0¢˜D—\ç£\íT´l¥‚\ê…?8\İİœ¿\Ê{¥n$.\Şş1Ú½\İ„\ãˆõQ4>5Uµ„b»İ¶J\Ô|6^\Ü\Åp`‹şú6Ş7WŸ±\rA\â6oHV†Î€\è”&ôZ\ĞnV}ß¶\Ø~m¨©XNÀ–c\Şq\Ù4\Z4ºI\ä7úñ\Î\ÅS”Diƒ\Åòy\É2<ôüs%\ÈQ‚hmh\Z‹râ°‚³¸OH/l”²\'Ï ™3!Èš \'\à%\Ã^‚\İ4\"†Ÿ€69\èE\Ñ=È»‹9kÁ€\á\'Š*ˆ¹ğƒ¾\Îe¤1{<O\Z\ÈF\ß\"\í;óö\ÖV«h|7\â\ìÉ›FdO=tM\ê¼2¾«õ´Ëœ~«C¿\à=¥¿u(E@l\Ì\ï±ó\Z³\×É¼”ÃŒ”ti¸»A™\"ò8©‚KuûŸt„÷šÀ©ö\Õ\êºƒ«H®~5‰hy”@¾HRøË¤Ÿ÷S=†¾·/W\âOÕ¯şt\ÕÂ³\ËaòNL¶\'¤>šg»Aüvd\íô7(LAp\í÷J‚%¡+Â”œk\rôšiWƒ\ØDHqª\ã\ËÍ³ò\å={Q/S\Z\ro\ÕsOx½tH\âcÁfóô^«\0ò¬¸¼\r\ÜL¯{şa@\'\Ød_öó\n1qjX\Ó8}[v…\Ì\å\ìz\Ë\ÓfX\Â\"\ä$O\n]¯6\Û\Õ{hV™–\Ú\Ó¡q¢!\æ˜ »@r\"t=3”U¼\äÆƒú)f6¼\è\ÌZ¯e\ät\×o£¼ú­\å\ìH«Œ¤WÎ€dE®\Ô\ÌZ3Âˆ!¸ú\Ö\ã-aªZaqQ^ñ\n°\\\ë\ßAş\Ì\Ï\Ùs¾µ*Ê’3\Å;òW]M¦#§Î”	f\ru94`ñ¿\'JfpªÀ¶\Æò¼+:À\0lú\Z`\ÖÕªÁ¥E%Ü„mB.\0‰+,#ø¥¶¿÷A-‘’´4m,ğ³5\\zs\ÑVšø¾J\ìD“\è\Ñû\íÕ„ûbW4@Sü¥ûœW‰Ş¢§gñ¯+Gø\Ø\ÑX¿ÿ\î6„!¼ù\Åğ\è\Ü*\ÜuLOğrX€±}\ç\'ºbõ´°l[€<\ËR}«F‡v\İE\Íøş\ÌI\Ä]gCˆd\íşzõA¾ \íQ3®j¤	…-\×\\ƒjw\ØñÇ’,>±ĞŒÚúô>ødDœ\ì+b+•‹œ\Ô\\”\É.\Ó\Ê\Ş?le©Ûœ{\Ü[\Ã\ÆP2p¥3¶JP(Ò„òü\\k\áKz¥u$|LSjtp±ÿñ¾0;¡”®™\Æ”9œih_¥²\ß[‘{,TŠ¨\É\àµ\ês„sùÀ)efAT\Õ$?eq¤ß“•\Âe\ZZH]\Õòœ¯8Ÿ\Ü\Í14€³¦\Õ\æ\ÓûLZ\İ\à,Ce`\ìW\ßN\î$qr\Ê8CU›1\Ş\á9Àñ€j/«,N	I\Ø¾\Z\Ü\è\à¢Dzq’§-2\êZù¾òb«¦\è¢½\Ü9LA±uÛ¢8#Î§\×U\ØLoó\àa“Ú¡C®.Æ´,Ÿ\'ş÷\Â\æ\êknQŠ¼?1±Tú2šØ†\è3#Œ¶90½úx[![?\Ô\ÑzDgj\Öz–†ZP\ãoV4ÿX¬\Ë/´	ƒ\\\åh-\äE°\0û\ÛVŒüq³`—­\Å/\ÌÿŸ\Ç2/ÿ2\å,\n\0@ô¹l\éş`r¢•7x¯\Ìğ–…\êöß•$oÀ”^o\×ù©´\å‚xƒ\Ù{¹\ØX…\0\rN1IÀó	\Ü\è\Çœ^&G\éS¨q\êÉ³û¹\ë\0ST\ÅKÃ¨Äµ\\ MoXÓ\ĞWF|\Ò9Sõü{(ˆ\á\ÇR\í<\Î\ÄQ}\Û\ç\Èv\'TşqzÔ¸R\ç‡N@sGA¼“ö·?øT\ÊE\Ñeˆ¶Cñ\ÄE\Ò\ZvŸ-û\ÍJWÑ…\İ2ÿš%ø\Í`\îT¨\Å$8®÷N¿Ğ•{Ÿ{†’ ¸’\ÇøY4i‘\é(V¹Šy\Ó7û¥\×3Qğ!œ5¼ªVšÿÈ¢KÒœ\ë±=º\Å\àQ\rQ÷Oñ¿\á\èƒq¦wIÁn¡yº¨\í‘\Ç?\Íüz\r2\ÊA\r-®\ZŠ¯±±¢Ü©«À¸x@a³I):ò!cK¼úyD£ú\ë“Ô‘¸šˆ\æGw˜\Å\Ò\Ä\à\íİ‹ul¼\0]=E\İO£Š\'d\0\äÕ‡©«°6®\åZ&.²F\Ük…¬\ÎmU\ë7I\É=×¢\âsş\Ğ\ì®UI€\ïV\ä35\ÙNL³²¼<r\Û%²\\P\ä\n\æmz\æ÷9e\0 iƒ;ö\Ø¼ÑŸK\Zé‘¾“ûr\ŞR!Î¼–\ë‚i\"4YŒy:\Æ<¬v¹\ÑXJòÅ„j˜e\Ã\Şj)õ¾{\Ë\Ä\ÖnıZrI\é\0m{™\ÊS³«\è\ëQ5#\Æ*s>°\È~\Õ\n\æ$\ì&F4Oo\0Mh®\Õõ\\\Âa\ĞÃ’i\ÆOŞ°\0B‹Ë¾0QÁU/Ã¿\Ü=ïŒ‚2Ç•O c\n\n‘…\ì\Öv\0\ä4e\à\ì\ïM·wX¡\íø¶AwHt\ç\Ê\r<+4Dvğ\r´Tb®“ƒ/\Öj)ö\ÚR)†³\Ì#‰»¹õ\Ø\éö\èq?Ec\Ñ1¯ûqYÔ ½W/$[à¿°;\Òi(\Â_”’MY²}oÀm¤\ni¾\'\Ã;0x\'•Mr®­¨÷Sl\ãùb/d6 ‡ld¥üû¬„·š\Ğvo\Â8¨&\n{ÛŒ!(\Ã\æœyIŒ¼\Ób)w\èò‚º\Çñ‡Vşñƒ\Èc\àŸû·ø|¢\\#a\Z\ãŸ\Z”¾Y\Ú)‘nº)°·>˜Vé ¾›‡¿X\ëfşTˆ2ùÿ«»6şÁdƒıó\ë\"¶U=\×õù¡	\å\éFYo;š\ï]ı¼ˆ²(¬Z„U\Ïıf\ív\Ú\ÈY=Gkv\\U¢¢ş°Z\ÍyZ~\Ä\Ô$›­ÀŸ©oC‹\0\ÃzôtBl\ÂJy\'Ú¸`ƒé…©f¬ó’\Ğ	’\'Ğ®nĞ„‡œõur÷ù\ï~¦\Â\àûlFù\ËI\'\É\È\Z\"¤Æ¼x€R]\\\Ètn-»\ÏC\èœ\é#¡\'N¾¿–Tˆ<\æ¨nV\Ï\Âi;Ga\æY‘»\Ï\çÃ’!Šù}Eı`\ÃDv(ì·¤Ã³  Q\Ú\ã\ä8w~LÀY\æg©€E¤y€\×2\Z’‚{\ÃË¤†˜\0\äñµ\ĞÓ¢J)Ö‡Uóª\ÔõÑ¡\äLxt\èv1bŒ¸[;l\n÷Í¥\ãu´\nqm\æ>D\İ)Á»\æ\æ˜P\Én’N]‹FôjÂ®Â«w%›9¹\İ\îdQ…mX$-fô=\Ç3)\Ù3X\"Ãƒùgğo<1O¤\ìlb\Z•†÷1\çgYc\Í\Ìø\Ï=•\æÑ¤£HüP¾\'\Ú_\\z\ÎõK™ÉµO¢ZNıÖ´\×j\ìv»ÿCµôS8\å~\Î4jh*Oh\×\Ê\Åf=@\áÊ°vŠ[\n}nUpˆQÀ<È¤6 \æğ};æ¿——õÀœL\×KŠe×ˆ\â\çÿ{‘F\ì\Ë>\Îw¤\Ú,¿nô\Z+y#…¿œ8”\çµ\Òz\ß\î7\\\í \Ç+\ãŠğ¶\êHRe(¹\ê,pJM/\Ì\Z§Iğ‚ø€ş¦£ğ]Ñ‘¾±a‰³­§Ÿ\nù\Ê6t\ÂF\Ñ\á\ÔOgX¬i\â7\å4•\\\í»n¼t?*eA,\Ä³\Ú¥E½©\Ş\È\Å6ó¹a½\áı” ¶{/¹|1+™o5…„2\Ş÷&ù9s\ã\à?ºÃ„¥{!:¦¬tÇ—\íñ+OA\æ\Ú{w´{¦ˆúy\áz\ĞD5æ½H¿”\É5#O”øX|¡Ã±¾V~£]§Š:Ôƒ\Û[±X´µ\'%—Nvw\Æ˜-\Êuw\éL‰q\Å\Êg!\Ú\ß%€g\ni\Ãş\Ìóúø¢„±\íOE›jŒŸt)%û¬6\ÎV\Î{O\ç\Õ~p¹w{\Ç%-zr&\Õ(\ÕÿN\ä {Ø\'ó_ğ\æÃ\ãI{ST\ç2\İ5Â¬?.\Çú•K-C\äL±:\\\Ğ\î,&=]\rr\'«´iI‘\Î8 \êgI¹Ü—o«\ÙJ”\Åù¿7½ƒ<·¢ˆş¯:x\Èp4Ş±`B\ízòó\Î”O`HèŒ¬q°…\İÁŠt”pIVI\è\r\âÁ¶¯\Ö2Lp]O€¾»\â!\rï•­\ĞjÂ¾/}¡d(\ÊÍ€şÎ•ı\ç…Su\ëÌªº	t¡Ï±\çe7…¾\Û\èºi\Õjšş{\ì¬˜“J$HŸÙ¦C—#iA®˜¿s\Ùj\ê.\àİ¹¨‡\ç¤D®d\èP‡m=\'Ğ–\İEb\Ó\ç_Yf\ÈF1¤p\ÇÀ!Q¯I½mRŠùº\ëqô[\Ò\×WŸj\Üd^byºŞ®p>ó‰¾fYh(À\éˆ8Bim˜«L°\Ş\ÈjÍº€_&+6İ¾\Æ	\\g5­Jş\é\à¯(\ï¨\Øy²Fú”#ó¾\'?\ÎM\ë„_(iÖ¶Q\Ö€Ä\Å8½¦ <Õ£\Şö\è\Ó=p<ŒœK?}¢0·_\Å\Å¨\Ò\ØC8\'>‚%Ê¥§\×\\\\¹\n\â\Ù\ìzA¼h„v¿‚& \âJY\És\í\Ï$j³®˜T}ó\î0«J®\Ğ\äÈ–ü²^sù ÿ°šˆ)²¨˜£›\ïŸ­©\ì\í:[@¦\É=f‚A¼óR¯ûÅ½d$4Tb¤:\ØK&\É¤u\0\×\àgT(ŒNR\Ú:\Ñ\æ_ŸÎ¾{·µ.¬\è—Ù¨U‹e‚\Ë\Ôx	\Ğ\ØS\\“„Ñ†C\ÌuG?\ëñO¿ ¦©$\ê\Åfd{·\Çü~\âv(\Ëm\Î\ë\Â1ac «6¡ˆ]B?H¯cH¢\Z±ˆ}¨ºİ‘K\Ømø&£pµº6\Õõ¢²‘\Ó\Ô.\"¦\í†5¼L	\Ş\İSª\í‡Ø‚ğo}ô\\Àë¿‚›K\ÚDÈ¼<Gruº‘Ÿ^N½\Ñ0\0¶•\Â\Ê\rsS\Úi\Ş\Æ>:²\ë–ŠÌŸ¿‚\æ€\Ôô‚³”c ™‡¥{¡S®ÅŒ\n¿³ŸŒ—¨(ÿ\îƒH-Je<S4™\İ\Çã½Š&w‚°B\Ş\"Y\Ã\Ş¡ƒ6ş˜.şó0^tÕ‚\Ó:2™Œ MS\è\Ø\ì.\Ë÷ €ğy\ç°k)_ğ\Í\ìE{Ê—c\ãQ¥‘Ìƒÿ—-,*ø\ZJzL¶´\îù¸;ş)Ş…¨Ó’+AatA¥™fù\ÃSo«áµ¿K!¡o\ä©\Ò„2\Ó\à½W¬\Ä\ßlŸgL”qü-ñ?\0\0,«\â\r¹r·\Âo:£°d\Zeš\î•8\ŞdWñ\Ô\Õ±	\ÕòR/;¡c +@d­n7\×#V]V\Ì\Åİô$..Fıœ9º¢\Ï\Ï\ÓÇ „hŒ)2Ÿ‹¾\\œ…} \Ø\Ìg\Ö\ŞA\ß\×\å\î{\ï\Ì]Ã¡ÿ¿\Ï\ëwez×›v®\Ë\')Í\á_t€\'\n\ïP\Û½\Ø<\ÇIy\Æ9+5H\ÖRšv|Ì¡²ˆ/1³@ª&\Üd\éş)Ÿµ·ö­´t‰º\İgøHˆ¡Å¨­u·˜\ß\ß\0p\rªf?\Î&F,\Ç!;ŸM÷oür<œ€†4AGªG›@öÌ€·\ç|Me\È*•°\\\à\â7§W³\Ş#\n\Ú\ÓiÔ¯\'\Ò8ö{µ:·ƒ®‹F\Æ\îq1ø\ãZ‡@¶+®O\ÇKg-$`yi\ÑÒ¥g§±†wS œÂ«‘ ‘{«·}vGŸ¦\ï2\æ{\Ëÿ£¼’\r!LIX\Â\â`\ê­õˆ˜LÁ\äòß»¢ø›ºX=ƒ)ğ5§²ö=\Ğ7¶¼f[£À\ì,a9°RÛº§ùcÎ€?•U\Èm\Ó\æ÷+¡‡\É\ËùM\0m¢«šs\ÎW\æ©s\Ú_\är\\\Í\ëø=$ *SYtò\Z\Ğ(2\ï\Ô\éÍ¨\È7\×+\Ì-œyr\Ù\å•\Ğhõ||J‡b\ÆÀw\äé¯²T’x(¨c°,9`ò&\ÑNµj\ä-ø «~\İG­®†\Â\ìz”€””\æØ¥¶¦ ™$}»N—\İUv\"A\ÃW\ÅóQ\ëAA\ê\á\ÔF%/´5Sñµ7_I\ÃX\äZ‰ K\Ì\0óQtÿWN¿Ql ‹è‡‚Ç©†>¦\à×³MQ$	nB®yO\ìsõ	\Øl¢3:{kQ:\ŞKôO#Û„¾¬…Y§;½\Ã	\'»’\Z\Ñ;ò!­ª\æOúØœ^\íWj<©`–K³?§(t¹`¹ Uô‰\Ìò\Ğ b*\â5W\0}I¶ú\ïVhğ€Cg\ãD\íŸ+\å¢&¿\Ï\ç¯’\àQ¾\Ã\Îş­DcØ®\ßs\ï\0±\çc/m„\ê:t ˜û.\åù§v±U]ù‰GB=Ÿ\ç¥J–T\ß\ã¸\Z”˜\n¡ü¶I\ÎUK¢qck[\nª{ˆpv“”M n\Ü_0iƒZ\Ö\Ù\îúv+$k{\Ïw~A°\Ş\Ø\ÍkJ´‘\ËF\Â3Rsü\é}`V\áÿ\ÚP…\ÏÀ$bt¶‘y\İN\'KP›:S“GL-“/a8²{X>\\	\ÛøWX7L\æ CQ\äfœ\î\ÆÔ¨¼…2q\Úq•6õeT_\àu»¶Q\Úe)şIB\ÅõQ\æÁ®®³R}!\\ H\ï\ÙFCQ]İ‘\İ\ß¿¬\êRK \ÕC{Ø…Ç­ªKZ‡$€‡\å:\Ñ\ÎÂ¸\å˜Íf/ı+{ Mem\ÒaQL\Ü\ngŠ\æo*}kT÷:`ş\Ö`ùTT¹W\ÄEÒ°Ë•Á\Û\Ò\ëz­Ü¨÷\'V~Õ€ja\ÉY3ò\î7\âjÚ±tx³r\ã÷•tHø,õ\ëW õÌ¬¸#¢)w²¨i\è~_7$§¸Weñ¯\ÌıˆKh\èU\à†\à—÷˜¬Ss¥\É=5M¢¹N1@s©²¡°2±õ¬X\İ\æ\r\Õş\'\æ·\Ã<»ô(‹{Sw¼¯·ı\âˆ~\Ô1!\Ùx\Ñ\İ-H\ÃI\ÓRÿ2«»ñ½\Æ^\âñDÛ°‘\Ú\\õŒ…z£\é´z;vj±ˆ:?U\ÖŠ°D\Îñ05Œ¨YyÄ‰¸uT›\Ú;ôÁ±d\Å\×|\Å\çy‘R…¢\ØFm\Éñ%›)¥ò&û[7\á¼\Ë?,hlòJ÷Ë£1\Çpk\rC6X\Í\Ê[p`—:²´x\ßR‡\×::›\n\Ô2\ÕòtY*ğ\ÉûH#eı÷¾f¶\îE£\Şü2YÁ¤òL—\Æ\äî±ˆ\ÑT6¦~\Îû4\Å\0\á\\ˆ¢ü]&[\æoQ\Ö1\áÚˆIc,g—†ñ\']q‘\äŒğ©¤ºÄ·o/,Áûò¼6[n®ö\Z—‘ø5›\Çü“˜¦\Ëù\n\0[U©/ey×\ÄY’V\íÌ€õW‹õ\ï\Ï`\Åy‚\Ç\ê\ÊVBRf¨–\Ş\Íló÷8ºh\ä2\ä8\ÎJtŒqiòûöy·\ã·\ØD*¶?ÿÁ\á@^ÿP%·£dF:©\Ò\Ó\Ï-÷\Ò\\EC\Û0\á…ş+P;\åC„#¬a\rA\ØM°‡\Ü‚*Kœ$u™dˆ_\'\âP\Ô%\Üä”¹H\Ä\ÄS½\"\ÕO!}Š×¨\ïbÌ»\ç\"õ;CX\ÉIóõ‚I5\ëÁô\å…t…\å\çh·2\ê!Ï€\Z{\á\ÏÍ‚cSƒû7qR\nDv¼½		•¬¿\Ø(fÚ˜Ç–$¤K’c»aúj>>è£®8qqk\â\Õ6T23´U-R\çƒ\Â	2mK\ä<xÑ‡	§‚’Fî£®k£\Ì\Ó’6W\Ì\àhf¤\ÜÁc\íøh	/d³•&G‚\Zpÿ\å\æOET­	],\Ï\0[Pø±r-\Û\Ú\ã<Ÿô”eš\Ğ/\î¦)Wœy³˜]\Ù%ı\n~¬‹\Æ\í²ˆ\Ç\ÎÙ’6¼`¡*{–†m.\ÓôN\ËüA3˜+5cü|a³K¦œd\àE„¢C÷§<^7ş—n&[\İs(\Ø8ƒÂƒ\í\\¶‹\Ş\ë\Ğ#Y’…[\É¬-4€M\ìDFyMñT¸“{ü\\lÑ—w \æ«\Ñfy‚°*‰g!	Öƒ¥\ËA\æPƒ£\é3õ¾¯•*ñ\Ú7\á<\ë\ë÷t·§e¨«ªj7“p\Õ\Zÿ\Ï>õ«\×cJÃ®¼µcº w\í‚c\ÉtEg¡Q|K\é® €@\Í\å/R’\×>‚;“Ÿ—ñ#y8;¸rÁ½cº¢\è#«\é\ã«^ŠŠ³6\"±\'¸/ÓŠ¢2¬ ´W6z‹ñ8\n·®\Ò\ZBi	\ëŠr»n#¤6™·”ü¹§–µ\Ù#’\'À1m›z\ë\ãbùn«Ô¤òĞµ\Ãõ)š`£!_N  ½J§ey\á7\êlŸ—½QS\ì\ä¤G@LbŞœ\Ô\\Eı#<İ¤ÊºC\Ö¥{“iy#„7~XjğfIO¨£`0B…ß‰yh 9\\»\ßñ:‰Ø»\İùV\âS©Îœøˆ\é\r8Hh@«zW¹³m\Ã}T\ÄB95\×\Ëo[ùû¬\ï\ê*:r\ÎŠa aù\İH\ë£\ã‘^VbX ‡“£»’ò #ş$¼e‹*]A]\"KQÉX•\ë= 1Y\ê6Hi0»>3P´{]ö‹™-­)f1!zI\Â\æ\ÌöH>%—ur:ó¾†\îlk\\\ÔEt<²6\î\æZ‡c\ßhš®˜ºÓ¦ÈƒOX€Œğ\n \Ñ\Æ9¬1W&:¢ı£\á\ê~L¾y.óód	Vb±Š\Îúyˆ7\í¸NR#\ŞFñ:W¤ŠK€qø¯\ßw6¡\æØª\ä\àa(\ç>>\Ôda»s‡¿úG4#w¾ı\Ö]hİ‘\Â\İ^Lê°©\î\Ç1¸€œ¼…¼\èF÷$»t\Ğ\Äwğ’.£\×&k,\ÒĞ‚\ÄÉŒ¡\î\ßû$\nğAu\á\äıĞ§G›’gğ\ÃFğ·k·¹hZTIv`/÷\ÙA$ºlz¸#\íW\í!‡ig#qˆp¢SŸŒ\ßš§S©\Ä~¨v4\å:°\Ôø\n»Öª½\Ïó§\r÷„E¼[Bc™T?r:¦d¤%\"õ-\ÇlK´¡\ßq…7•\Ûş\ç•\ZO>n\Ï\ê9Ke°U È›\Ò A\Zœ\Å\'%x¦“t0w­ı¦H\Å\éß•=\\\"’Q;µ\å\ÕóØ¨J |\Äb\Æù\Î\ám65\İ@º$G(&»7\ì‘\'h}\Ö\Òx…\n]£°0\Ø%ö\Ê\nB®™%W?°	¾ÀùhT\ä\'Jkw\ä\Z\êTE[)ª,3_z–(5xVi\Õoœôv‡?<xô>\Å\ÇB%* Òˆ¤\ÙúU\År`\é\æ- \ß\rHQy *_N\î] b\Ï9L˜+‘zm£\"6¾bp\0g1hÛ“&³\ÑOV\åò@ˆ\Ãf\Üœk;—\"ˆ¡\n6I\Zı,\×èŸ®‰ò\ç·\é40\ç‚(1¼%\Í¼°:\Å\ájƒ[\íx\Úøy¦y\ÌL\ìGS\ÚÙŸlrL4©Ÿ9\ïSgû=I\Ü(ô=@{Ë¢=óŠ+‡ÿmh\ÉX\"\Õ\Ø\Ò.±A,¦\Ï*š€c\Ër«1²˜\à¹47\ê]\á\Ïª\éSf@{\à\ß1Oa(zz\Çzù=G“\æ|^\â^„F´¯\ÑxD‡·YĞ¿}Ş \Ø>ğ\ä.u\é!”\ã‹\áöf\ãäjü\à\Î:¯X.BWPM÷\â \0„Í¶’Õ†õX±–®Ì¹}¸q\Ï&%e\ÃEq\Ôÿ\Ø\rş\Ã\"5ğ%V^©z&\ÃAM$®3lXn0?B(R\Ùg–)oK´»\0\ä–-ƒ\Ì.\ï´rÁ\×e10vU+lñ	\Ë|A¦\è\İ\ÂÿnOI\ZƒQ™TrgVØ‡¬‹\Ò|¬Ü¯6\ä\Ì\Û>aišj_ÿ14”Q4íŠ9™Ht”!\Z„ûºEñ”PÂ”ù&_qİ¥2JÌ–;P¨#†6>G}1L·H^u\Ú\\±\Ç¼¡Cš\n£³z\"ZyÀ”,\ìSz^ó„\Ï~­s´­³\Å$c\Ûr\Ä\Îú±@\åb\î\çS‹sj¬–Å¶\è\"\ÑWt¡&E5ıÁ\å‹ı\Ê|@\ï0ÿ\"\\0ü³Ø¦ˆADTæª·•$ó\âTònYK\×e7B‚–>X#\àÔ\æ~\è!BIr\æ\Z¹°\çT°P(0®\Ï\ZUVaq\Ô\ìÁhå±»wy÷\Æ\Ö\Ò\\²\\\ä\îò\Ùyš#)`%\ËUX/?Ş©e\ÒÙ\Âb\'\É;\\ğ\ZGg3\á*ÄgÛŸm’vx\rƒ@9D¦\n\\šˆG\ÔS\ŞıµğŸ\é«\ëô¸Á\Ñ0k‡Ÿ˜¦\Éı¯gj@„sI\Ê\Ä\Å\"\á0):¶Y÷·)9xFĞ²\ÕN\æ~YX\ä¢\ÚõŒZ\ØoK.*31\â¦÷]\è£õ\n3—˜Š‹Ue(üC\ÂPòrQ+Tb*lG§/Ê½wNïº—h^£f®\Èöh#\æ²\å\ï…À\á4\Ä-\ä„\Äk\ï\n(–¤ıjQ†Sş\İ;dõ­\â•†i\î\ŞRÍ©‘ˆf»V9º&½[#C\é\Ú\Ât‰\Ğ4¦ü!ñ‘quNp B«~(e¥¿\ïµÅ²M-ûµñµÙ°ı\×x…É³r\'KHn\íh:‡‚ƒÍ°\0¼FÅ€.iZùMÖ™ı7·qš®&.h¥ó¥ªhT\è [K×š\Zc™¨3¹˜\Îrx\ÙN<¢°f\ÕR¡\\+‚1“Ş»#÷ñ‘\Ó(6C#f\ß\î\æ-¥€@0‰\Â\Øb\è\ìNÄŠUÿù\íw\æ9a:´½¬Jš\äÁ­\Ü\ÑBú?IDªúzûg©‹‹”†Pÿ8Ö¨¼$\â¯ıAŠ(\ê÷‚ğ%ge7\îo¬@—v¿IWøğ\Ä\Å,Rg¡$JVY°÷\Æ?Mó˜`OµK…1\í¤\Ùcó/§\æ‘pıöò\ë:ü\ÊEO‡N\ç›\"_6ÿ»V\Ø\ÖF9\îe\Õ F ¦Ï½óŸiM`’J$»%ù3b©ñŠƒ$f13¦ô0j¹~ö^{‡ÜÉº2\Å~=APn3€G%ûK\Ã\Â3(\Zk·µÀµºp@\Ûj•\Ñı¼”½~£W\Ûgƒñ½2—wÕ«\îDro3\ï~1ll‚¼O\"\ëœş‘„]Á	OA\ÇóNOo\ÏXz¯\Øe]fEš°±–qƒˆKµ\ç\nHÀü=öB\İ\âhZVÿ‚~TIÚ¬„~]H²:\Ú\Î\âm3\ÒUú\0\Ås\Úa\Î\Ö}Šú\îp³ª\é8º\Å\àô¦ )û\Û1¬QeÒ­AIE~9\r\Ç\ÕÍ°ÇL#\ì{²«b+ÁÔ¡Xº±d3œì‚¸y—\Ù+\Ï|ùtô\Zø¢\ß)Ê¸\ï‰\ã\"\å½û­\å…<S\ï–Q9>ªÀÁºL\r“Güø“{\×rGó\Èû\ÒĞ“ôP•ò£L¢\Ï\ë\Ñe\\6ğ\Õp§ó¢k\n&\0Ó¸Ò¯=ğ\ßmd\ëo^\Ôy7m-(.(MmtmL‚šı§*‹\İ^N\Ğ|\Å÷\ÎóDt\ì|ôWş$GPG3\Ï2°£\ÖVşÔ¶›÷ü\İı¸s^¿j*Fm\Ã\ëa‹4t—	÷\ÓØµ°Ÿª,V¶¦\Ä\á(\ä7$EE÷·c‘eaÿ-\â³\Ëó4±\Ù[\à\Õy…i!*	\Zr–pšLTª¨£-¬Uğ-\ê\é…U¾mC\é\âƒ6v*.ø¶oc «¯*ûª*³€ûN\Û\í´ğö˜t\r\Ï\Ê5b½™\È\Ûj\'?Ä±¯\Èy\ç\Âğƒ\Îfo\0óy/dzbüùtW­%ú3b\ë^°\æ^f-ÎŸ¾p¼\Ã\Ê\Îx 3\n1c\Û\ß\Í+~˜‡PûÑ\\¸ÀF4š©ƒY6eq·Œ\ÖA¶TO\ï™~Œ\åö~ø.\ßV\Ä P\ã§qk9\n\Í.»A«¢s{E\Ï\á4#	Qk•\n*¡v\î|\Ú	´8xœ\Ôó¾ƒ.W\êó\ê$#´„q\ÛI|›ôô4Ğ…ÀY¹\í\æXr\ëi\Ğ0\Ğ\Æ\Ó<,¨.òW\É@,±!‹™±bHTR²\î!\Ú`\ínUÖ¹.2~F\ÈvBnµ5‘\î\Ñ\ïI¶Õ¬q¢\Í=ü[\Ù*	öò\ÂF\\\Ç>è`RYKV8\è\Üdo‡y…ô,ü\İ\ïpH¬qÍ‚Ã®\0\ïüŠj—œ\ê=›á¬vy\ç@İ¼~)\nXGNx\Ù=\ŞrM£òØşZ:.Ë“XWŸP\Åù4òô†f»o\"\Ü+8\Ü0k¡½|U¨OFr.\ŞÕ«*\ÙA\ìÑ¨[;š	\ÅùªK7{¿.\ŞZMÁ\'|ê…5ø-C\Üà¤¯a\Ï|\Ğ\\òŒ=\ï¥À%~¶t \nŒ\\oÁÿ\Ó)³›c\ÇlV§³\ïØ™‰ –O²\Û 5©u\êû„l¹¿\à­N·B\0‘¬’ï«¹\0ˆ˜À¤„\à­^\\r[\Ò\áE´n:*‡+@\ï\Ç@\ëÜ˜Y\İSC\Ç~ˆ¥¬lBºK\"ı\ĞÍµ”‹\\n`œ4\ã0”Šbô\Ä{z³\Ó\'¸V~4E©#˜~Ê¤‹QÔ‡>\ë$4@§¨‰¹PÙ‹u”¨\ì\åÕ´ğ7\×!\0¦:\nGAu*FºP\Ç,Áe¥p»ÌŸ\ë4Æ®ˆ¼Œˆ<\"œ\Åú\ÂNpZôMp;¹@\ép\'=]’\Å\ë\ëG‘>±§#\æ/˜ ²(\è\È\×_M»xæ’›‰0\Ö\à\ÄW\Û\r‰i\Ã\×\Íg\Úûn\Ãj.A\Ø\ã\Ù3†‹\äK6\Ü\ÅS#O©°	H\æ\Zv@\ËJ\\<H\Í|\á7\Å\Ñâ‚Œ“¶ª %¤1\Ã¥2£­\ÍCkRÀö¡ña\ÏU3Sf_.^=‚\'¾\ÇcñŸ‰¨Ÿ\Ía¼0\ì\ê#\Â\Ã\ÃiF/Q\Æ\Õû¬«aw\Ñj¨#˜ô\"­\äÕ¬\Zòbr&\Ä\éµ\0\ì/\ça¥\êe†vşªa\Èj1{¾‚»Gı\İ:¤Ü\ì\êŸHE·\çØbìœŒ\ìòtû;Ü½Y[\ZùA‰ \é?Ø¨ÉŒ’uÍ€OPGG\î§_÷\ÃY–9±4\æ\Éo\Ç	¸¦i@]*E=t ›®şHô!y¾Š\ÎÉ‚õr{À\Ö\Ú4NÿŸ%\â\ë¥	`6o\îO—ƒ%R F>eı<õE™ŠNŸ\ê\êˆ\èl¦`¹ñ–\Ër™¤L0\äQ\Èñƒ\ßQ\Ã\ØÇšs‘vÈŠ²¼I\ìù%$ôÀ‡’ó\åç”H”Gñ¸X@˜0»„\í¼³ú\á1½”º÷·,lD£Œ\ÕúVEJûùH²\éO\0\ë}U+Å¯¨jŸø¬4n\Ş1“œ<ƒšP$g(ûÌƒA¿\ÃHğŒ\×j\Z‡œ¾lª\n«V—EN\àu¢MniT˜ÅÛ›b\\R-4¬\Ûòp·\æÔšASš£\ÏpY)\Åog}^#ûŠ\ä\å=’Qt\ë.£Á¿õµÀ‚¿\Ì7@\Íq´˜•_vTq/](öŒ\ê›b?¬jœ\Éò\çy•~0\ï$s\å\Ï;®v¦N†V(_Õº0‡Az¼$A?g_a\ßgõŸşj\Ômpk\ä›ñ7õI]š&ı>Op–\Ú!IùW¹Po9ş\Íg;…\Ò:Ww0\ã\Ûü\Û\Ünˆ\çJV¬\Æ˜\ÄDWü\ë:F\Öy\ï–.*§‹\ØT»:=®	/B\äÀ=Œ\\\ïÃ‰ƒw¿8\×Q	\Î^”\r\Ğú…\Z\Ç\Î\Ú\Ö\Å\átØ¢¡¤Ky£\Û]q†)IR}¸ğ«\Ã\Ó\ä‘\Õ\âº\îF H\ë^OtÓ“¨´±¯1KWHô1hjcoªO¿ å¸šŠø#\İ\è; \Z\Ì\çU–½s\Ëb!~\Ï]¤q<4;wõmºû6\Åûi¥·±C\Zus| …F\Ú>\Æ<p\ìI^>·\Îşÿ;³³H\"N\Å\ÊHÂ¯\')÷\Îoˆ³CÁWò—V\ÓÏµV*BO\Æğ\ZÇ¬†‚7º\×fI#c:N\×7z‡‰k÷\ÉC\nk?\éC\Ğöör·¾\rPWnƒ 3ºª#3´Œœ”˜–Åˆ¦\ÕU\Å\ÃG€\Ú5¤\êô{ğf¡\Ü\İôñ\Ål›ˆs˜]Ÿv7.\Ãß¸^/|º»Üñw3I\Ç\ãOgl7ö&Œs*¢š¯7G<£\ëB£b\Õğ#ö\ÏI4Å’\Ú\äI¼*bõ\Ã0Ô‰®mps\0\ÃXI_-\Ö\ãªu:øl4\å\åöm9gøÂ±¢\Öw\ŞğO\å‰\É^ˆ\ê8TK¹ÿ˜ú)5\í7\èrõ†}QB\à\İIO\Åh\çG[h(\á9e5ª6\ëH?Q|\ío\Z¤BT\äñh¦¿\Ş\ç\î§\Ë\ÙÃ±1Aj&%eX=ü¬§:Ş‘ù\éº\Ó.b\ßÎ\Ì¡\ÚS·\\&û\İp8C>o!a ŒÙ­gˆ\Ñ\0r¥5öø&M\ÇÜ,kO\"ú°÷\ZSˆ˜§sõ1.·	Ğ‚dHŸ\Ã\Ìka3qšÔ€wµ]I\ÜeŠ›¾S \åg¬\ÅdPy«İ£¬ğy\0v\ßt\ãÌ®..o	\Î&€:XeŠ Ô–hÁK\\\"u‰>ö-Á\Ø\ÈOÅ q95pBñŸ€\ËKm\é\Ù2\Ê\Ç?ºL	uK.y\ÕÌ»:øVœ´\Ã7\Ò~\î\Ø4.7N%¡\ÇBµ–\Â\Ø÷%°Ãc­”©\íAkw\ÍH\ÔÛŒ©óı“©\ÃK’©\í\Î1\ã`}\ŞğŒOs\ÆÏ ¡7XEl?¡BËŠUú:t\è\á<[²\r\èx\æ44oY\\ÿOøA{“l}=\ÂE\à:ƒ)D¦hõª)MÛµó\ä\ç×¹¾ìœ›_\Êp—ú\É)\äş¾4û#\Ï1Œh­\\ˆMT\ÓÊ¦œ\'¹°%\ËT®¾*m\ß\rgƒu¾ø\åFL\ãÀ\Î\çTX\Ã(\Ñğı\Æî¹¬w5%\Ók¬¸=h”±œ\á\ÍLz\Ü8\Ğ\çºøğìµŠT=\Ù\ìP\ã\è\ào\Æ-$.\'\æ)`V\Ú¹Fg¨M’4Jµu\é7 ÿ\Çs9\ç\ïG:®MaOWø¾\åI\Ğ0¸c—‡S¯ô‹\Æ7>©n\ìc!ı\ì½\"ı5M+m<Yhf¼˜ª \È<ı\é!A×¿NKÛ˜µ\Şñ&9W-™rM 8\Ó;\Ï\ës\ÜöH\é_r\í\îL)X7€m\Ì\é]m˜ñ­t¤\İÂ²Icš›hüK³)\Ê;TñK–óuI3<\n·(I/\0µbÛµWw\\`\Şô÷\nŸHJ’MXòğ}õ\Ûh!\n“:tx\Õû>+QX‡N\n\èÌ°Š(5”S$d\Ä\Â\Ã8º²7Dª¿‰öc\Ù_˜!¹‰;($ÌŸòVF±KD\í\Ù\Ğğ%[\çò\Ó/I\Í12\èÓ“\ÉM\0\ìX\É?¿-šr\nP	\ß|°]ˆ³r\éft&u·–Tw„•@\è»õ8\×Ò˜ı\äŠg†\ncÄ§\ÄI#\é\äÒ“÷\n·CÏ®®$—\Şp\Ö~Pë²µªƒ\Øò.alu˜¦\ë\Ç\í\ÉCƒc0ö¢\án\0y\Úrs\âº<s	\ÚQ@;\í„<´zl ¼Ñ¥ZH¦\Æ\É1«T§\Ê—\éD]<j\Ôá°¶\Ø)\nüb\0i\ÖiP7O\'\Ö})˜TH\å½m†\Şi\\“iKa2\Ï!ch\ìbk ej\ËÿEù´½1ñùÜ½0ˆÂ›\äi:ƒ:Cus\Ù\Ó\àj¶¹\ì]¤-nZ$)\ÖWc\Zd®’Œ\Ãÿm¥\Û\0A\0À¦	¨_\Ó\İ\Î`vQ¸‹\ã\ÉÖ‘C]!Y\à{–\Å\é MDqQº\êğ+—#¦õ_>8hŸwj÷7ê„›§¿›	C7iŸYWª!¾4K,ªv{ûÓ™ö\0\åÿöP[\nˆ\\—‚ÿ¯)M2AjĞ….&\Û.\nH\È\éX\ç\ÏD÷;ş¦-\ê}õ¶ÀÁgZU?‹ñS½3\Â\"sP\r\"–%¯\éÀ)\å “\åş\Â&ñzŒ(\'§\åu6F`\àvw¤^Õ—?l\î§üÎ§R0	FN5<ö#\äma…&?Ôª\Ø_\Üì¥—¶_º\ØDQDuHE\ÈIş¯³\Ç\Î!\áõ\× Ÿ\ÂSr4döŠÀ»czÙ¦\ëĞ¤7?= Ë¤B!úº\Ê\n\0ı\ÆMÁŞ¾X¨8O¼\İ7§%Dœ\ÇYÀ\Äl\éŸ\0x]œTñï‘ \æL•šÉ©®\ë}g´\ísQŒ€›Ë¯`\Ô\"\ÈG¦\'²\ÃÁ\r ‡­`h~´Ï¯9\Øøk\ßZ\ÕuC\ê6Sª;œ/U\àxdÎ”uG¡¨¾I\å6 ¨7>\á.ÿ\ï\Ìßy \'\Î\Ğ@×´Wa½¼\à\àŠC¼¾\ÆV\Ò=µ÷\\2\å,\â_\Æ»\'º’jIòÒ—,Í…(¾OŒú€™³‰Á6(\n|\ÙQ\ÒX‡Ô–Q\àYyeL\Õ\0\çIªI1§WºúJ\ç\â5³:-K‡Qş\î¿\ÒÍ«z,\Ûò	xóq\ÕøCs‘Lu\"b¸Pq|Ö’0a•\Ï.‚c\rŸ\ß\ëI nzÁ[\Ídr\r­\ì«ò£V¿+À¼IOŠm\ëÜ¾U\ÙÒƒµ\æ~f¬\Ò\nQŠL\Î\è\İ\ÖX\Ç\î÷ŠŞµm6Ö_Â¤	‰k\ÚN\ç\ì{1A\î†\ã–\â(úóeŸ¦ 0¬†\Û.°\ìc;\æ!ù\É£\è{Eò@DI\Z\"\â\ÇÍ½_#˜¨\æbƒ\åğdc(ˆûVvuc\Õ}z!°ß¾^‹+¼À\ÑUşD¥”swE—Ö‚œPÏ”\á\Êi\ÚbÎ¾\Ï.aj\0dFÿ-,õ<UÏ™†T¸\ã\ä\ÕL§\"Œuû}ô?ŸÏ˜9^­\äMª¿o\í:\'½YS§q*ñ]$Hróf©¥\å\ä\Ã@\â¦Æ¸–\Â¿s\î`–1w±Lf\nû¡¼? [zp\ÏU|?úE\Öfƒ:¡\è‚\ÏMi·\àAk[ÓR‘Ì‘r•\ãY”\Æû²P`²C»í˜‰7„dı‘/Ò¥­^\ĞG:¸‹`·\Û;¹\êMB\Û|0\Ã.\ï°wø(•\Í0«q\ìÀ+8F\ë{¦¨¢~Tjc0vZ3µ\í\'€Dy\ßøøV5o\áİ¶ó\æ‰d>\Ú%\ĞÅ‘61Ü¥R\Ñó\íLµ\í\Ìsù\Û\çh\r‹\æ\ÙwX\ï3G®ğ<rŠ\×\'¹`ß’T*Yyh¥Ø£Š\Ó\Ç¼X<2¡¾[\á£ñ\åjœ­Ã¹\'ş\ç6Á,LYœ…e‰˜gqC(7H\ë*ci\ß\à>\0\Ò$\Ò\Â–§rx\Òeh\İ\Íp@õ\ë¯\İ$…¸÷¼{^\íL}vvs\Ù\â\Ír¦Ùˆ_”¡r4J\Î™ö\í\Ó\á|v)-ş\Ï\Âr7²¤È‚?B6\Z\'7˜\Û\'wa\É\ÉÁ\Ğg…nƒxŒbÂIPZógñ\Ó!o\Ô\íšU\ç@²£©s\ÆÅ¶–I.œ](\ç@Ku·h95¹£u¥öa5Ú“ı2B–m¬\ë\ä\×F¤~N8\Û\ë\ÑôSZ\ÛD\ã/ O\ëf¡\ì·C•û\Ä\Z§[~Y$¯¿?²3…\ï¿Z\Ñ\Ø/«­¬mb0 \Ü|\n*‚\ÄhR±L}”v\Ä†\Â\Ò\ílÿ¼±Fø2x m \Şb\0nB…\nş\ãqî±¤4£şC–I(Cn{wW\ä\Õ\Ú8OC•R\ÅIÇƒŒ–€S(C\0 · \ë?\êx—¼w‹óö\å\Z\Ç3Y¥9ğĞ³\èpı\ì»\'Ã›\Â]z#\ì\ë`¿Í™P\èõŒ^!!ˆd£ø\É\é°~\Û1N¶\'E£õ˜K\Ş\"²\'ÿ½õ\Ş\×A$\É/\ìa@a\ë€X\Ïx£oš\Z÷	\ê\éş¼\0#¸__ gGI\Şı3\î\Z}ñ©!\æ¼\Û\"6¸AKû(õ… \Å\Ø`3\ÓPÄ§u\Ç?\"’ª¯a´¹%÷v:{”:›ßŠ\Úf„y\Ô.\ZHU`åƒ‹Thğü\ã	Ql\Ó \n‚‹±XU\ß<\Î\Äö\ë`Ï¨oJ:Eny•$‹«\\(SõmŠ¤1‰?\îñ\Ç@IJG\ìC~ ø—\å‘\É\ïÏºA_\İg\äR{[N°&\ë\â\Z·”¥?|Yœ1¥¡*„Ê®ny8\"w‘\ÖH‰‚•c˜0-^¦5«·JìŒ¾\Ò\Ú\É\Ï3ˆ) šÌ¸¹x|×\"\ËË’LH6òWo(ŒÁ’Dñ½ic\ë˜YBÉœÏ€O G , h~™½–¤\êkƒ,‡´DX^mx\çÛ‰\Ş\\qS¬›h•\å°8´E:pƒA÷Y\Ãà¸¯P_2™5\Ğ\îO0•orWj¶wwU\É\ér}(\È/\Å\Òr\Zt•Zº?p7ßPş%;\æ\Æ\íôË‰\Ö1\ß,—$1„ı\àA\×\î&\ÅK2:\á«	P:ow|¥l\\DO&$ÁiP½nò“šC‚\êF´Â²{®-\"\ÕK\0iÙ–\İu¼;\ÒúaƒI@7–ulX±b<‡/LA¸¶Wu\éF\ì#>\ÕoútO`\\¬ˆso\Ä\ÕúG\ã§\ìzl!]b°\ævı;V¦rpŠ\ïSy*#’\Ç\Ê!Ê²¢vWFÜ¼¦º\Ïv}´Ÿ\\,|ñÁª\ß\él\ÅüA\Z1–`uvÅ‹Š|hAv\ã\ÇZ¸±o@ÿ\ÜC“°ı:\r)­Zk\nZ\'JzŒulBAd\Ä]SM–™oƒÅ‹™‰/,{™’¸`¶O\ä\èG\Ü\ì¢I\Ğõ÷\ç\Í\Æ<Ñ›ûf\Ô\âZšeoT-‡\"ü\ÂRµ0\Ê3L6#f\ßgU}Æ¶$İ\Ğ3Ù¢\×Ø€d=\n™Iú\ÈQ7\n£\Ãt‡ŠN¤l#ø.ık }\ZINw‚U…	\ïJI™òGgC€ø\Å-f`ÚŒ›h®˜2€îôA\å\\HgÕ² ã’‹±„…’NPş9ï²¶\Éş\ç@w«D\'\ÓGT\ã	ôJõ²‡§$!z®\çÚ³$‚–õ~Q\n\Ş~\É{˜ğ´?ó\ËÕ± œ\Ä\ÉüIlK^P¬\ë¯€½¢’v\ÒD\Ö`\ëo{6­eR¯tõ\ërku»;‘2p´\æ£ú`~i\Íö«–Rv/f«0G–<)±8C\ï…PB\×xAceN±µx\ï«Z¬Ñ\Ûz\Ò	œ›Kz‘K\\b¯º(8e\Ïóú!Z‰‰Tõ»\âx¹\Æwõ–¡c\âü¡\îDª½İ¬h\æŒ57Hk•7w\çõl~\è\Ô(\Z\İ\"‰@MqX\"¦)Iñ=7™À\ë\Ü\ß\È\Õs…\âÿ–}¯\Å\Ã\á\Zˆ\ï¶k\İ#\Şa\ã¤Ú¤h\ÚuSI!|‰ó£ \î¤ùŠH$\î«¿µT\Ú„ı{Z™½	\n<»õ-‡òi¼£]Š\0\Ù\Ú\çø\Âr-…\ìyÀ6\È8{Aıórjw\ÊöC\ÑUşÀiøJ\n\é\ßØ§^\ï—#º„;/6¢$\Z\Ú?“9z{­\â$ôvxv¨(7¶h®î³˜WœA«†By\Ã8–~°F÷.\ÈúSü¸‡ü›§\Æı.…1.flœ¢n‡\æ¯z\Ğ\rq¬\ç‘›Œ\İu‹\Zğõm=9t,×´T\ç²\ØómŠ-„Fk\\Kv=HÀ\Ëq\r8x¢’8oÌš\ï¬f\ÊL\'§ˆ\n98“\ĞC\ä…!úN~v´1È¥;‘ˆg¹\'m~e¶H{s[Š/†\Ì|Šƒ\×.—\äM\"ªq¯°¸\ÑX\Ô\È\ĞD\Õ7¤b_jõ4ŸA\Ù\æ\Ğb¼5SAw]\ÈC´\r·Oer\ì™v\Ñt4ö&\æ>°œR\â‰şfD\ÏñşF\r¿\Ã}\è_‡ú6\ZƒŒ€NRû\İ\å\â©i†[I]¼”8X\Ò‘© ƒp¼h#Ë’R&¬\ZĞ…hLw±*\Î5\Í;bõŞ†¾oc?(”1\İW~ß©¾.öš/\Çh®}1Ğ£(\ægOºC|k\'³£\áÒª\ß\ëu$Ûte\Ä\ÇJx\àšL\îv\Î\Å@¨›iy\0#\ç¥\ÊG\Ü\à\ÊòV\È\Z¼ªkg\Ø\";¢²\'ˆÆ†\0=@=›r\ïHƒœ\Ã+Â HøÖ½5\ê\Æ$/€óO·b-‡Òª‹\ĞI§¼|%9Z\İ¦Yzşù4s,¶Ì“#®ÿ]\\AYy>MMõaT˜±\È\Î-\0zŠñ:Ì€Nü “<¦7£µQÈª\0]*À2ô¨­PT;\Ó\Ï.¼ık3P;„m\á	TiG²(\Îÿ.A@¨p{<ğ\ìSQ!T¢X—\0ø^\æR¼ÒœbS•\é_\Ï\á{QME¹v¡H-Y‚’`*fd\á6Î…RP±F%k1Q°òv1¢’‚tyRS³«\Æ÷1Dú\Ï:EÏ¤«\'6Û¼˜Î¢&“54^¼·\ä#q¾­cx\"(ö_‘P.S“\îoZú²\"}M¦„4±:\ÜrcÓ!H™Y\"*®–™\èf›\\N]\æ»]·ı\Çø4\ì	\ì¶N¤»}mé‘G\×]±\î¦\Ğ»>\ÌO«ô+{\ã@q|yÜ¯ƒV\nzıühC\"B%C5\æ%\ZJ¦FÇ\ãU\Ğ$;\Ô\Ï»÷\Ùê”¿ÆŠ\ÇNb?L\Õö7œKü\0+±\èş\ÄPm/¼:šÂX”\å\ïk\éú±Yf‘/¶1ğÀPkij%K,½À8\è]¯™\ì*)‘£\røc|yı5(ç§º[\Z\Ğ|)\æ\r\è\íÁÀG\Ø&$Ëƒ\Ş\ÛP\'Àÿü¬~…\re—\Â?e÷D\"l©W¾\0Akv²\Æ\ë+úr°i\Ï\ã•a!Wõ\Õ\Ò\ÜXE³\çv\Õ,\Öö…\Z#\n ?\î€Û³u\r\ï\â„õ\ç\çN\Z\âa«6¤k¸òL\ÙV‚™XKZ””…õÄ¾…¸ù5*…\â%N\ï=\ÍxeÌ­\ÔG§6#´u\Â7LFñT“ ²˜\Z\ÎõW²81J\é\Ép\ë.¼z‚aŒ7\Å.rq²°\n”¬.§f\âÑŒ\Ï\êfœ\ë\Ø»,fV™\Ñ\Ğşû¿Úµ \Ş&ğø±ñiSõ[\0;Cs¤|U4Rü¶]:—P/›\âQ¶\ãğ-5\ã\ìŒ{ER\rhù\Ş)bRÊ­H¡\r?\àU\Æ\İ\ŞI…¼\ĞNÙ>†\ïq\Ë=Æ£‹R}›,±ş\ä£V;\çúÀ\á]\ÎZ¢\ï0ÁÈµÀ>\Ô8ø­\ÂEQ\â\É\×}wòz#@GŸX\á&M³\Ätfñ+‚¼‰}:`J¡[fh¾¿³tblı\"j\"\Zr\à\ÆK¤´Q=\Ïÿ\ÓÌ´\Ó2\Ş5q;\Æ*\è(¹wg>\Z%˜/ú“µ=…Nb\ÊP\\\åz¨Z]#4\Úı=ee1\ŞÆ³\è¶.õ®\Ä,‘\\\Ék¼1\í\n‡3ş•ˆf%n\ëõ-›öû\Ú\r \Ğ\00¶‹¼©˜:\\\Êó2“¬EY\Ú\ÒÿCtA\ÕM\Ød„\á\îYc¿\\ó\Ú9\ê\æmˆ»\á”b‡—\ìY­zŒÅ¿°pŠ¸\î\'n\Û!y~hzEj\Øq…Ej\Ê\é‡\â’øòQö‹\Ê\0ˆŞ¨.ióüúÒ¬\äyw«BÚœµ\r£ÿ†qÀ<V”\Ö\'ı°jôŸ\Ê\Şø\Ú_/Nı¬@Ü–´/d\Ña_…\ê\ê¸üÜ¸\Ê-?Ó–\à¢\Ìú\î!­ŸDİ–„ô\É\r\×\Ì^Šÿús\ç2ÿ$ñ\ç¾\á\Ç<\æø%\Ì¤Ÿ\Ê^5ù,\'EAª7—xH\Øtø˜§óÿ&ùk\í\Ëù°kŸ¨:=p\"\×Ù’ş.>\n)ô\Û6\á\ë\Ú!\Û\å@\í;\İC¨\Ä\Ö`ò,/C2|T\Â7\0´5\\1\å·I\Î\'ª\ì&\ÒN\ç\Û\Ï<lx\Ñ?ı\Új–j¯À‰ŸT•Ê»AÆ•ò4ŞˆN@½‹\Ór½Æ¦dP\È	Æ¤Ú &%¤›¶dL_\á\Æ\áµìƒ›Ë~‹ğ½%w=\İF\ÊO­YGƒ{\ÉEhú°@siÙºõ+\nÚ´\ê‡]o\Åg$#2\à%\ÎIÎf¨¼\ŞP×\ßi^\èw- =R\é\Ãş¥”\Z\ç†Kú8\Z\r\'V\á‹@\İrŒh9¿9\ÛØ©\ãh\Zˆ¦LÏ…\ì\ìA@¹&pf¯\ë \Â	:zó95‹[¶ß›´¨,\Æ\Îï¨”\Ñ	¡\Ş\èûmcYal²DRªC¥xIX¯™ô\Ê,‰‡\æ\ÄÁ£^gZ–\ë9\\0\n*0\êQ\è‹Wõ:ô\Øòğm¼\"4\Ã\×5Ê…Ÿô‘óeQÍª\Z,\Ë\rn\î\Î\ã\æ­s‰XEu-À\Í\Ô\èÜ¨µ³Ys\ä; ÷(–:Ş²#2—%‰Ú¯@W\'ı\ÙÀ\çc\ëŸaU\ÜQB\\ˆœy»ÿ$¢¶%\àu—¥0\'x\ìWvO\í\áŠ\×u9i@ >3\æ|\Ï\ëy\Ôö\îbÚ ı72h€ü\Ñ\êB*¬Ï¥®‹¤¼uI \íD\Íp^>/û,¨	­,›o\'\ÛB›…ğ\Ğ|{Y\É~Nó\ã¼a«\ÏÀy/\ä†\É/?–J\ë—\å|7¡÷º°ßƒOºŸe^*cD7şc4N\îú–ğ\Ê÷A®|X+\n\á}W‹×Š¶<jšVğ\à\ê|˜\ÚB‹]¢Ì¬eQğ¬\ëõE\Æ\ŞüŸ~²GLU\á&†0\Î3&N,»˜‚‹Ä¬À;L\É}\Ú\ïQÆº¢“İ®¶Tl­Š\ÒÇ… ; \è7$\Åô\ß\Üu…¢v”«œK•X„Ÿ·\ë¯1Oc·\ÔûÁz,\ÏQ¶!WÔ \Æ]K:m›=³U¹›$˜=ô$\04^“\Ğ	‘ˆ\ß.\Ğv?d&÷¾\ìªP“9Ø†/\Ùğ¥\Îl\Ìp÷\Ër\Ùuk\ËıH/;3\é9\ÉMi•¡IUo¿So{K\à“{¦\ã7`¹h›§2[¼­ ° \ã \ê\Ü_KhB^n\Ø\Ê7\ÌKK½^35ö—oG€;œ»\ÂkÖƒÀe¹šó\çpH0¿£šœ¾z\Ä\"µ\nÆ‚«5H3*ó-Àlµ;u•\á—$–’†„l}xM\Ñ\âŒ\"(Ó‰«ò«‰–\Ê\î“¦¨Y\ìöN¡·@(\r©á¬¾¤VBfSº0?jBLü?»\è*y«‚t -÷Ag\Éü°+š\â¡{Y\ÓT>«iM\î?Rx\í&‚p†)Â‡Û­$L(\Ù&\ËH¿³\È	yKÿ\İ\Ì\à:ƒG\ç+=Š»ø\ÆøA-•1wr\×\é>‰«H\î$s;Cµ uÿ!±‘f-b\Ïh¼o^¾\èoS¹;ú\íD¶K\Î18b\Ä|1*Tw*\Ú\"÷(©™”PiºûÎ…\ÏZX2ôVL¸ciQù\ëğ=\Ì\é±Uˆ\èø9 \ÈS>Ô…Ë“„:Rf$²©\àgÍ½\Ë\Î4ŠÆ•`Ñš \ë²ufş½¥+¢ƒ=ÿ. \ä\ÊZ^=[vn€Z¿úÀ]›\Ûtu\0¢·?œ¢oÿG?œ&£·.\r\Zj*.w¼\ê	ö\Ën\Ì\Üs7\\·:¨u-Ÿ\â\Ãt¥\ÛEo+Œ‘–\ßö‰û\ÄHq\Ò3\ÆıSgI6\Ü\Ía*®k† dm²‘3H%Y(Yt±!nŒq\ä!ª\ßr7&§\Ö=!rñm\n¥Uo»R\"¬:±4\Â\ì»U‘Š$MsT¬#)iıº2m\â\'Y\Ü\×H›\çÙˆŸ\Ô\ê\ßO2_F%l¶…]\':`¹ƒV\n”&\Â+j©\Ê\ÓC¿~\Òmƒ¬-\ŞJ\ÇB_\ÛÕœø}şÆ¢u­o\ç.\åú,ó1?dNK7 *\"‚¶4\äóf¾)\0:µù¿\n·ÑšOIz›3£´8¦ƒ\"3L¥{\ZUòø \Ï]E‰\åµÆ­¨}¸ô\ä7ü\'œü\Ø\ï\Í6\r¬.R•\Îkd%PC„”÷…K	\Æ=w0\É;b\İÇ©k‰ù¥³oZ-E\Éb~=:Ê—x-º\ÔN+ö\ÎpÖ”%ù\\\ã7[Z	uc2¨b?NºR’/\Í2†\à0ğ\ËL¶\'¸³±8l\ám€m°½Çˆ3\Å[y›Õ¯<?b`|¦Á}-%µ\Ö\Ñg‹E4T2XEk³$hU,\Ï1U\nõ\0\r\\\ï„JûTq`¿h®H\"^ƒ)[ºÆi¦ˆƒ1\é+4Ñ²F´\Ïcš\×^F—Ä£ù\nG´_3#¨\'\ã\ß\ÄÊ·\è\åı\åÖ±™w\àV­}™\æ·\á­\È;ƒõ\ĞQn\ë\Ğf¾¥PF²­óô³·½\Í\ÍJŠ=9\Òb\ËÎ•\Z\Ítœ¹:…\Õ\Æ\Ï%¬1ˆHnôÃ»X\écÿ­\Ğ\Z¿t¼ \Ë\áŠc&X \Û_ÒŒø\çşğ\ÙF\Ê`@Q¿:¡˜7VFAlYñT!\0Õº\ë¢\ÎÓ€ô¶¢’›.\å\ßÀ\Õ\ìN!Ç‡§Œ\Òx]	U­0VÊ\Z\å\ïrvƒ‹¦Qh\àZˆˆ1º$qV\r}¼zÁpxõ®\äº\".zk1†\Øp\Æ\r\Æj†\äT·À\îÒ˜\Ô\'2z­\ák4>Ş¯>öCÀ/p+°\Øq2¡tJ±Á\é=„9©·vŒP¸\ÛEf\èõ!mLr÷/Ò–/´ \ÕûøüK\ÃsÕ?ñ¿ B–RB¡+\ÂO\î¦cV\Ê!©s¿[^Á£‰$F\è\çg‰xA/ƒ_s@\Ïƒƒ®ğ’6\r\ÅTÆ¿$!>’›\è@ÿñy%e0\áş„lfyn}_7U÷pøI\ç\rp6‡xõNe¦Fq)\Ë\è;?›Gº1Ò¸#&\â\ß=77vj\í—ib¨½v\ã¾Û²0-µ`CInÁ+¹¦ı{ q«?2˜W¨!œ\ïj•Å¡†r€‚…F\Æ\\6\í9„Y(?®*\ï\Ø\äRg¡¾Qƒ~\Ã#\éF‹¼à¯¨ú)±2‡¼7\Êûu=˜\Ğ\"e¾v}gboJä¥’\àz¤\ÖGrS0IˆõTf\ßM\0	™5U\êlõ¶‹\İ\Ëş1g\â\ç+”­™7k \Ğ?øk1Áüª…º6m†õ*s¯\Ïe.¿\Òzú¦8CyQ×\Î\ê\İÇ‰³ :Fûğ\ëD¬…Ÿ›õ¡Õ®ú\å­lxiû\ÏÁ\ÛpÀ\Ù?V\Ş/\Ò9\Ş4®’.ø6l\Ë´×—|LMV#Z7€ğ\ç±f,µ‹%\Ñö¢=\Ç8{\à\r.Q»\éz…\rÕ$\"l°O¶ıuû˜¿r<c;*ù\ÑT\Ü÷)üÁ\Æ\èZ²C@O=9H™`D†ó×®¼\Ì:ûod\Ô\êT!Ÿ”…\íE\åö`ª«ô8\'„°;v³\Å~u<ùg«¾V:µE\ëO2w\Ãù|U>ûz¸%.BÈ¤­\0\ÛMK­d\íh\Ö%Œ_¿d4²;šˆûg;B”ŸY^›s›¸ æ”“R³\Òyeùuö\Ìa\Âr\Ã|c7£“©‚Z©õc–LK8\Ø\ìsøV”J?ô1ä…½\ÌÿCVnS\ì>n(\ÛI«Áj+‹F\ZS·/Fzª?¥\âÇ¦÷\ÙOq\Ø[rÿ½²Ï¸B^_%m•}iY\í»öÏ¢\ÎB²¯•?˜»\Ï>T<l¡‡–ò\Í\î¶\Ó\ÇW\Ú	?Ä§“––94^`V\æ9€ş@\Ëù/\ß\Ñ;E\ZÀš²`ø1\Ô\ï\ê´ˆ2}y¸©Rm¤0ÿ;·\èG¯¿¨T+\çº[)Sõşsj\æ`UY„5=\\-\Ò\ì–Y\\r\ÒùeŸçº\Ø¯D\"^š«¡C¶¢Ä„R¼l6€A\ÃÁI\Ñ\Ë&\És¶\Ñ#\'\å\Â’†ñ\Ş\Ò\'ğ\"ğùW†¯‹Dô—\è\ZJ°Œ\Ûñ\ËeYBBWq\ê¶\ï}ó&NûS35\Õi’†aÆ7¿\í_şx‡\Ô5$?•Eß¢2N”\íPp=X¥)–]U:lABh‰×¯d¤ÈŸÑ´¾\ëbò(¸KE\ÄZ\ç±^J\Ë5\ÒJpu,P¤O’²’Lƒ\Ñø\ç7B\égôHÊŸRŒ^$\É\ÓøL8ñlø\î#v\×)#©kY—[P\Î\ß\İv½7~!:,\åğ…\átƒ­œ©ø’s\Â\ì¨¥\ê\"˜5…·“\Ë\ç¸\í\Z”X\å`	\Ör“\ïlaa\Êo‚‹MÚ­³“ö`pù^ÿJL»QşX€\É8P\Å¢={Z5N†Š(c>\Ù)Qs³‰D\â\Î\Ø7\Ó\ÆZ\ä\à\ï–`tœ¹ºµKË‡–X…)[x1tµ.uœ6¼:{#XK! ›(\ãMŠj™$r“.\ÛKE\ÊN¡\Ğ\éU\æl„\Ç(õN\×ú¦gBë‰¢‰”cñò\Í4— ‹rO \"œ\è\ëI\ÚK›‰M{½{aŸe*½H)O­jwö$Œƒh\Âd\íF}}p§EYr\\7q\Í]$·\âQ,JºR6\İ\É\\O¾\æM2ƒ\ZZGjDK¦n¢\\ˆ\î_¿\Ğ^¹c„¹Bq\×\Õ5Êº—\Õ\Î/u±Š\ÜW\çBFmø^Nú\Şºe¯\Æü\ã>Cı+\í=2óevª\Ó\n\×\n¿R\×+£!°\Ö-\Ïı¥¶\ì\Ó\Õ\ËÒ­??¡*AD¶g\â\Óô`«É­ô°\á­liöƒ“\Ä\êp`¦®¡°\Ñm\à\ß\â*Ø‘»\Øşkl\0ø‹ø[r“V\ÛR+½úbk½T\Ófh¬Ù¡•«ƒå‰”\áMf4½¥J\Ãg_6d\ÇôĞ (\ém¹&…O^\ÉË„»(y\röòL÷j@ƒƒO	Ç«Å£G\Æ\à\ÙG\Û\Ñ<Ú¾ÿVøV\ÄÜ]¼\"0ò/öa\í~\Äi¢ˆG\ä†/lˆ±÷ğm3\Â*?x\Äı$Iôw\ÍXS¿\â]w®d(÷{­‰D¾W\ÎJ0\ßij\â(ÁÀm“\ĞtË¦\Ï)\ÚAO¾1)nÁüÛ­R†üì”<a\Ï\íG>\ÚbFôK…Î¤\Å\Ïñ\Z&°\Ë18¯Xò(LÛQ² ˆûøs\ÍB)=ñ´|\0KIt\Ë\ÈQÄ‡\În,ş˜¤\Ü‚¨u\å\Äzõ\Ä0¤«‡Ÿ+e?5[·5¾R\Ì:ütk?¾«\ä;RhOµ¦:w\ÒQ‚d\İ\Æ\ä×…?˜R\r\Ò÷^Œ‚(8\ëtƒÕ®\îLŞ¦6Y!]©‰nH\áwA+%Yÿp>ÿ\ÑÙ†5+¸ˆK\Z%ı²–i\Ä1{\âBb\ë{û\'§J\Ù\ëô‰Å‚ÿ\Ùİ†ô\ÜËŠ\ê\Êï>ù\Òi9Y \èıq\äŞš»\00§%%Œ^Š`NctsHa>¿\Ï\ÅwV.N”úBøú\ÚÛ‚kŒÕ ¥XcV\àƒ¬µ„¶£(F\Z\ĞSØª\îI\í\'·;‘”ö€g\êyT\ë\\C\03/\Û\Â©(\Æ}\ÎC&AU¬ô,WSR0kõ¼Šr¶O®“Í¥2¢ı7h›¾Ñ‹\ÓWĞ¸°ğ$R°q@\Ân²ˆ¹ :\Ô.n¥¦%YT\rYĞ’mï¤ğ:¹w{€—v \Él³•-b{y|`\Ç-Šö¥/\î5A¶e:B\Ôl¸\ì\ä}ò\ÂEòŒ¸yg5\n\\	Ø­\ê\ŞA\Ìúj¤øwD\î\íà¤š4\ÊÚ…eX#\Ç=ÿ\Ïú¡¹Ü\Ì\ÃVü\äùº“´ƒÀğ¦²NV)3w\Û\\9,\Õ;\Ï\nFÔ™ŸXN«˜¤0?:\äc\ÑÊ¡x\Â7z\ÅóÿŒc\Äg[\Úm½\Ì÷^›c¿Aˆˆ\éH`h\İ)ñ=R~\ä…f\ä\Êip…\â]-r„À\ÉQ¶Áˆ#î‹„Ûƒ~’\ß\ã°\Â\0õùx>%/’w\Ì9(Oµ%µH©†b@`\Õ\\dD6rj2%|\ågò\É\ïj¥»\Ô\ã{^‰ø£ÿ¡qMTbş’\ßÛ,Ã¤G±I-s§¹n\Ó½\ìºNP…‹Uøº•›ea“…ŠG\àŠ¥!‚ñ®\Ûbz‹f¼\åöi³ b-d\Êif\Õñ¯Œ-Ğ\È\ê\Ñ+ŠTo*P\Æ,¿r¬b÷C\Ø\0\ÏU‘‚¸—Ä­@ô*\Şk|m›&\èö\éc%À&iL#´¸«Ö¬‰7\Òq@¼T\0xı}t™*z‡RÕ“\âTiP\'„-şö=Zµ8¶Ì‰ğ\àPZºù\0ª£¯E*ò\ìJuŠ–K ùß³\ß!Î¿TkQ0E„eÆš³`d,óKj\êD$:{@`ö¸PÜ³Ib¼\\@\ŞvùM\ê` ¼†‹ (\ß\å»\Ä&„eW o»\ß#\ã…÷º]ª&k€\èEp\à\î/\Ç9\éP|<\ê’{d\é\"\æ ş%r^\ì\ê¹+\Ät\ï%µ\Ú3½ˆ\â\ØM¨\Ğ%jõE\Ê\ê@´)@A¡\äiş$‘(t¨­$ŠıFq\'D-\\¾5ÍŒN“aMœ~°dSv_2¿˜7˜¿h	9ó\èÖ ]ç»‚\è=fš0ş¡9\à\Ùõrö7¾Ÿ\Û7Bó9O‰m³m{\ÑÜœ\É|qK\é\Óğ²R\ÑŞ¶\ÅtlpÀ¤\\t£\éF2\ëb9\ê^rºóôzq~\ÊÆ¥¼{óDøz†ò\Õñf¬°ø\Í3ûú\İpdZ\ï‹\Ñ\èö\í\ï3÷N\ìZf\Ú\æ0H<¸° \Î¨ğú³õÀ5ÿ\â\Æ	˜û>lÊEe|vk\ëPÿüÀ\ÍwôUl\Ét¸‘O\Îr2J§\ÃG\ß\'‡<\0\Çq3ƒX© sH½z³5%€\Û}Á\ãw\Ş- v5a]´”µ\ÒKÕ•¼®` \ÎI[\Èİ¾Z±´\Å`™»H°ÿ€]Qi5\ì•\é\ê\à@,o\ç?\ÖË¯a‰54oö\Öb\à\Í\Ïñö\"ml[	)œ«\\(d\ç˜\År§4FA}&ÿ{D\n\Ùl3\ÒH!.ºˆo\Şg\Æy$“\Ò~–y\ß\ât›\ï‹\Ñòl\ÏmÓ‹ ñ\Ä\îf362.”…öd‚\ï\Ûh\".èš™\âyœ\Ï6\İ\Ş;\ÈVJœ\ì‚\ÂõzT,r©Y\Ïr[L$\ÔZ4€\Çtk‘p\\ˆDœ\Í@\ÛU{\Õ&\ÚN\0M\Ü@úU´µT\è~Á\Ş)ŸF)¸’z\â¥À\é¨Î½¯uª¦Î¹\ÈV—S2š\Ù~)Yû?Egœ|0\Â\âî›®•\Úq\ÌK?:j=~i/1Wzº£B1K\'œ\æ>ñ–HD1M\\‚Š¤Sa•¥\İ7DW˜+\È\è\ì\Û0ñzH­eyòx0\Î],\äNY\ÎöeÀŸ\î¶T?vi›b–\Ğ5\ç‘\èÀ\0\ÆO»\Ñ\0aM\Z‚Æ°Ş©…\Û\ã\ÛŠ\å÷\Ø\îl]˜B»d„\0Ò¸3§0õD\Ö\İ/…µ-,²bÀ¡+Ÿ\æ\Î?\ì?±\ÍKOl†ˆD\İ:Kzı<\î\è\"µh9M²–L\İ\è±iJ¶µ°\"3˜õ€k\Ã\Æ\æÓ‹=§Q¥»\Ê\ìI;¸\Ö&q–¸U\ÈÁÜ“Lh\Õ[\Zx?]r\É\Ûy,õ[\æ\Ã\á\è\ÛB\ç8:ˆgg\Â\Ú~	\É\Ô9‹!\ï\É\nt\Õ3`i|j?R9\r\Î\Å2Eg±L\á\Çkuµ»f\ï¢;mC\ÂKDˆ—a°\Ã\ç\0\ÂQ5\äe\Õ,\È\Ä\"\Ú\Ìtò(\î\Ì\ã[ôUu\Ô1)ªˆXº *m\Ë9\İn\Ø5±v!¶·5¢ıùğ\Îğt]ˆ\"s“ß³}òÿ\ÖğO\É|¨\ë~\×*¼TÈŒA\ä\Ì\ï\Ò`¿\Ñ\í9M)É‰’ÿ\Ô\éÚ•£	\"Äœbüp\Ì@/	4¶m\\O\Â/½–tŒ@[‘¿”TU]\0IOˆ§½†cw_\Ø8cñ\ì…÷fGJ9›\ê™\\e\ÂSA×‘q~\îC1\nµš{–ƒj\È\ÈSÿ¥\İp\ÄOkÁ–ÁHˆ<Z©‚¥\â.šXYCIHóˆAw¿n±™$}¦,\"\å¡6ñ)8qkó\Ø\Ú\èğø÷\Ø\Ú$“£\ça{(N+‚ d†Ì­R>\Ïò#¶—¸e¸O\è¢\ãJ3\Éx®C\ÏÏª\äc¢\äb¢®Àú\reÀº\í\Öòó¶´nö\ëB.\Ù=†õG\à\Ê^<{•¶]@¬ğ(^\r\è¥Åˆ-NC\Õb\ÇT\ÙòÒµY^~b\Í@³Œş	\Ì\â¬Iƒ3\Ë4({(#’\Ù`A¯!H\Ú\'\ÉG%¿\Ø_©•7œÅª»\á\ét”ó\í\ê\Ö;?Oø\Ğ^M¨TŒß’@ÁX:bRPØ…£\ÌKc79O3Cü2-2‹Q´}}\Ùv\æŞºÅ´±\Ú\ë\Ş`œ·¥õb\ç½T{!>ò}è†–3D‚ûaˆrù\'5Šµ¼’»GM±	\Ñ\Ù\å\Ì\á6\Ş\ïÄøI˜l\Ö\Û\Ä\ÒZ\Ş9_Û¤\Â\ÇUH­øM§#.`q\âS\ã†4+\í( \Â=1²O;›LfÃ²A¢\ê—}}µö›>Êª\çK=É–ù‚U\ä\n0A$\\vœ´ÿ\×fb\ãH¹¡¾Ì®z\Ş>\æ\ç\Ê6\Õ	yYV’±\\©`ù¶Qğ\ä\ÑIø\Ö\î%>Qi°j/·\ïW\Íõy\ëvh\ãb)M¶TD‘C\ÓCpLûL\Ã0/`ƒb×½\Ù)òWE ´tOùø\ÄLú€1chdŠo\ÙP\î€h\n\Çõ–\Û\çw°‚¡}Š=\ç;\'¾x÷Ohº0‘)\áŸHiLÍ®\ËO\Ê_\îPY\ŞÀ¾¿\r7\é\ØOK\ê|y\Ã\ÏÜºˆg\î8)a_…©Võ}\Ï/1Ò˜Óƒ\Ä&\Şôù‹¿\ä\n£²q-\\ 7Eb|	¹\'‘ıN\ç\Æ\Ì+\İØ´:†RY±²N!\ÕD`<³\ë[T\Ûq=¼Bƒ¨‰€*\Ê!\å(ı\ï·|tj6ó\ÊŸÚ«;+#e\é\Ñ—f\\O™42l\Ç÷–Øœ—q\ÔTşš=!@£\ÆÅ4Ş¥h\Íp0\ÑB\Ê\Ü<Œ¬›¿ıˆˆ½ºûœcıZ*\à‰0Kh$\Äj]@”+÷W»t¬£„L›Q\ßk¤\Ó½òñ¢ A/ŒZ4¹õ\ç¿8m›x•‡™VY\ïù­\Ëww	’©<!\×\ãv÷73­…0“DTò ²ö€ƒuÁG\Ğî±›y\Æhg_\Ş0A4L}²yÿg@`+­7D}\ï«XƒnF®ŒÁü4xüÒ³o\äÂ‰v–\çı\ãC\ÑDK]šnZ´§:\ÓLGÇ“É¸\ÄZ/\É\×Æ²°\á¦F•P•\'üAh\ì¹Şµ(\çaÙ¸#¶ja~SfC_jm\Ä<\Ü|\â8YXkH¾\0+tc_xµ\îÔƒc¡\Ô(¢6`\Ëj6\ÂcØ›¢ƒ\Úı«Oñ¿2¯—\\\Æ$H`jp\"\È\Õz\æØ¡«\í*Ÿ\Ô\Ä4\â\ì\ì\çtšõv?÷s\Ï.t\n4\è¸\nY\Ñ6\î‹?¤t<{÷œ—üHE€ü)lHe.}\Ñú5mK\Övó!—†45\àû\Õf+À_Ô]† ¿\ß\Ñ\Û\\\ã*n…,\á‘û¢œ¨x5¤\ê\ÜôL\×R¾[ U\Î7f\n•a:C\ë\rË° k~\í…\æRJd´˜†¼Zv‘²«	P\Ü\'ÁH)k,n¥dz>]«‡~½”6~\nmª\Úõ\Êj0„4ƒ€¨¼\İ>Ztƒ\Ö€…boD\n9úø\nZ¿[ \é\Ú?Š— û\Ó\Û*\×Á\å\ï9¼û-{ |i¶=vdc9™œ0Ü˜üğ>W~0ó	¨‘¹•†d–\ÃD\Ú†§°y÷)ò5le\ÌMšB”\Ã\å«@X²\Å>(´N˜GQ\Ï3÷\Ø&C/wùt\ÅQ<¢¤³ŸK\Ç[_\Î9Ó¤K±Â©3ô¯\æTŸù$^LÂ†ßƒ¾€%ÅŠ–£t}–L\nº–\"lSsÁŸ\ËÛ°ú\í‘\ëH\ÒøQ¯\Ö\ÖSAj«_H-¶ÁS¤ò¹¨u-	~\ï‚õ±ÿ\×\ï‰¹H,-~ÇŸpJ\ß\ÜU„`uŠM‹¥\Õr§ Z°D/jL9U_›--›L–\İ\à©ü`\äS=?×\é$\éö.c]1\Ï\'uñş4K\0¤sù’¹üš\è}a¶\éoO1–A\\\Ü\åŸmımÿ\'V2‡VKyù\\?ƒ\á@{\Öd2¡üY—2‹à¨½s,«}ôğ×¹`¾®d\Ç¥³Û×®\ã¨{gZ¤ùx\ãN©6¾Í\î\ÆY\ÏZeü:\â(\Ëp½,{Á\n\n}€*uˆT#I/…÷ \Ğ@î˜–\È\"„S/\Ñ/\ä\ê­*\r¡\È!-ú\Ô÷ºWrñ\É‚;\Ñô5¸•\Øe7w3AJª>\äû(>™³³Ÿø„\Ê;¹\n\ÍM²‘>÷E\èò§/#W\Şo\Ç&jN\Û\ß\èª1ƒS\×q‰\×>£«Äµ\æ hSÎ¸0Km\ë\ÚW\ì3²\Ğ\ç¾òKñ€BAœ\äw©\é¶µ\ï\ã_OCÀn\ì‹A\'‘”«^\Æ\Ä,\ãmº\í4ş·_å‹wÚ‡\éÖ¿j´Ú…(\Å\'›¼\"C¨¨»uDt\\Aü¹TÑ¸~ZS­u®l1+\â9÷[\äø\0}ze_¦*!)n~üh\è\âú’aù\ÑG‡K¬’	\Ñ\ß~õ>\é\ã\àN!\ê\İe›ÿ\Ï\r¤˜±‰´tf\×7€\å¹ğ-¨?ySDl¸\ãş\äñ>º—×‚(vş\Ôÿ>¯–ø¬$p6?R‡\Ô\Ö9g\ÖG’®.§W	8\æRş*i\Ü\"¢š´­™ˆ’Ï‚\ÏÑ„ºô³´›ô~¥oÈ·5·±¥PU¿‡\İp²\ÂU8š³	˜ûÿZl\Ó%2|]Š:1˜\Ê\ß±„ıC³=\ß\ë\ê\è†¼k•\èğL-_\Ûÿ5¼$¥°e<­[d\ì!»\0&œ\Öû\Ô\Ë#Jõ01¾v­\Â–]É‰øÙ½­e\á(\ë\ã>YĞ£\\<AL‹oõœœ\éM\\¸v¼Ò¨‹ÁU‘™>_×°M\\Oo\Ï=ƒóû{83À\ê˜<škŠjø\ã{\Í,{\î z¶„Î†FùÇ£øú\Í\é2S¿\Äÿ]\ÈaõƒHÿşC\æ\Âv\áó6lY1$AõkE,…\Î\êñ5uMüDB2\à\n\îõHKt\éğd·U=[\0Ò®D\İ\0=\å.ç¾Š\r\"œ\Ö\È\àHp÷qa?Ş—uRªx\Ús0¿°C€KŠnò‰d‡\\–=œ¯zğ\İ8¥5T\ÑDFø±ö}|É“O\æ\æs¼Œ°©@‰D)™¬ğ˜.yÀÂ¾ù‡\nN\í€\"¥u\ÜUs\ÍAÿal\n*\n?üı]n\Û*\Ğ\ÄZ˜Pc>·¦z\ÙT\å\Ì	…ÿ¾Iª¿­ğ izŠ\ç/ˆ^7l^ò\ßf\0\ì`*Td¹£€Qÿş;E®I6	Gğx,«™iË—I—Ó£–U{4-R*yi\ï‚\ÊI\Å.\ê5]\ØUv.Y:r}ş½m[nŒ¦‹\Ä;`\È*\ë_u´_\r\n\ãl\äü·Wó•Ã—6 —}\Ç?\ÕN\á[\Ø}òK\äSLB\rl ;<4”¥÷ª\ZM8=	×·a(„\ì;g&\ë/£\Ğ\r\Â!¥\Ê×¼ Z?17\æm‘®\Ô~\í®\Ö\Â$ów;–OF\Z^\Ú´@RŸ6i¤Cş€­«®G¼M\Ğ\ÓYŠxö—\rføù-v\Ö*é‚œ0ƒŠ†Q\ÂC÷ô®¹¡jñ\Ö{\ákR¿\âd\ZM` •…#Nk]esÇ•\ã<\äŸnŠ\ÓsºŠ~…¸c ¶j‚Å¾BŠ@š„\Íl®F…¶ÿ|`M%ğô\ï\ç\ì_ws\'1\ç{¥2õ¦Caf5^øÁ\Ù~M¦Ü´\Én½\ÂR¤\ítb	¼¡.ÿ=\Ã\Ô4Wƒf\Û 3}B\×ø\\&=ÿNş]\ßk\'\È\ÓM•œx\Æe+k\ç\Õ ›\Ç \î\ä¹}ƒGŞ›’+£x{ş¢\Î\nK\í\Í\ÃÚ˜”[(CÂŒk \Ñˆ\Í\Ş1l\Êcœ±Àƒ@°_-\n*^B‹¹›LštƒÀ*}s\Ù\èu¦\ï@h÷i‡mğ.ô]„h‰E;ùo1‘7?ø)30õr\Éc\ã„mvü\ì(.\r$e[Œ·pøüm\nA¾§1n‡Ê‰\ÍCx>\æIfg÷ÛœœÀ24FDA\ì[\Ò4EBÛ¯À4Û‡>\Ğ\ç‚\Øf£¤\ë\×Cv\\\İ,»©—ø\Ë\Óh¯=ŒR\ívA‚“‡Soøu’«Ç•>\Ù ‡ù=Xz\Øü˜B`HÊ¢a¦vÄ• û7¶n«\ê_Ro%;óS÷D\âkM;%»‚H_¥õ°\ê\å”`\ìñ\Ûc\á¯ü8;Wqg±‰À%uo(|A¶­µğa7<M¸¡q®.ª4‘¼K™™:\Ã\Ò\î¹4ñ¹\ál¨Ê‡\ÕK\ìW….A¤—Mx\Ó\×ŸüŒ*‘¸Š>\Ædo5Š0ŒJ#*~\İ\àEyh\'B„›‘}\×K`\Ü\É\â¾ù„¨0\èŞ£ıŞ¼\ï\ãÌ\'­\ëVª>¿N\î;J\Õ=Ø®Lób\Ì\Ğ1#TU¯\ÍØ\âW6E~¢L¿#$\ç\ã\ç(\ÛY±\ä>öõ\ÎP\Í_ú³\Ü]•-Uı~QúBlC\ã\"§kO\í\áĞ»A\å\ì\Û\Ò\Ô\à\Üñ»\nSúg\èCLmö¥ıX\í¤²\Å{h\\R½hÈ•\é\ê¼Û£U?zšÀ\ì8]\ÙŠs:Æ¹\Õ\ï\\¨…\ã? œQ,\ç<@dnŠz‡¡ª\Ãû&óv‹OJü¡;`©\ï6—jÙ³#VøP/¯û¢\ë¬\Ø{«–dÖ­\ÉñGGµª/W´.´\İÆ¦m.Z\Â­´„s¦û\Ê\ÒC©h¯\Ô\ïø \ÒTX -B¥.e“\Îv‡\n%cÎ„¥qa/Ë¼G¾üX—¹«Ü…¹É·\åL\ÜxŠµ®V\ç@\Ô\Ä\ÖS\å¤ô†\Û-\ÆZ—Ìœ{ù2\Ì\Ü\ÍÛ”»£…ø·ş–°\Ó\Õÿ\É_(\ê{@\ÔY•./\rFxo6c=Ş´\Îfı\àEœ0\Ã\Û6“\çA\"*~/$~÷1ƒ4M*‚W\0¶—œQH[\Å\Ô$[e€.­lÚ¦Vhù»É‹\ìc\ËMo\ZUú\Í\çFº0ÁI*`\Çl«m0\\\Êó\Ä\r7\Äy¶˜9¯XM¹Y‘\ãô\nŒ şšj–\ß\ègˆ\â”=JH\ÍW@Pƒ‚u?…ûlƒ¸\Âò\ËÁ¼Œš·5\Ä	ÍŒyw»\í2\Ï\ë•\Ú5»gJ®\ãz\ã\ÍOøÿ¢·B…LG™ò÷7\ÒÁ6Ü°ñ\à£w~°Ôƒ“¡›\ë6\ÃkŒl ;i.\Ú\å.vƒi\ä1ş\rKcå¡Œ$…ß¹_°ö¿mÊš\ç·xş­N¯°½xŠkq$b÷\\¦q.UW<”-\ç2\íN¨\Z#j¾‡\ÂY–°u\é*\ã\rv	qBV¡øX\à9.\ÜM7\n\ç\Ê]>‡wgñ‡ŒÍ¦›\ÃE\Ü\Ğ\ëÇ°z>T–\Zhø\ß\ÆXuXş¾\Ñ3€™\0\åkÈ¿öûP\áğl3g\î\×\Í\åÒ…\é\"˜\ÛWl4+	­lF1Jd\Ô0LY)š>G1K\êQF÷ ¹nwsË”Ÿgd!!\ïs¥\å¥\Ü ªŸOU>Ç‹^z˜<¸{Whg·\êÙ<œ\Ù\Z\Îi›üe\'~\Ôxeıb\Ò4*_\â·\î\æ\Ëu›<®¥ÊƒMQ!rİ¹Hd6\Â{Ç¦”Yr¹³0¯»é­±{4q8©\ZÏ«\ne\í\ß÷‘ÿø(q1Oğİ‡\Ï)¡\Éo4\ë\Ù_şL\Ã\ĞwÚ™\ï\ï$\é\ZB7\à\ä©\'°­2*º¶L\Æ4\î8]d€KZBöš‰\ág\Ã#E…9™²©ô¹c\ã\\#R&kZ¹A\Ú9¼«õ k¾¡ˆ‰^>É‘ETŠ¿\É\à\n[¡¦Ç¦(¶ó§\Ë˜K\Í\Ùù\ÙaIFğ\Ù&«¥}\ÕLs\Ê\"³¿¬›Vyœˆ\Î^—\Óæ¬ˆ3Ó…mô:¢+·–\Åò)\êø‹~\á\Å†\ç·Rt\àER½¼\Z¥¸n_l‚Áò)¡(myŸFĞef›K\ëq«¯_2µ•G\î–@¼Y™ùD¾È›oj¿ò¢q‚\ÄW3&[˜y*\'c¹¡`$›\É}hE¼§m‚…(\r\åµ3\Î9ú2Z¡\İ/$¦õÙ¾XN\Ç\â4õ\épój]£LÔ–PÿF\ÉvI¼–\Z‘?¨_x#k4¸”	¿ûœA\ã5¹ú{ùÆŠË®,5U`£‚daNs\ï\0\ÉcJ´ÿ¶?¾”i\ÉH\ÖÒ¡½ú+¤\îxq5u—õ¦Â‚”+W\0}>\0‰\ç5`v…h\İDŠ§:ı‹ŸJ28.W«z‡,\ÂA\éÁº¬Ï¬O†\ÉD½Y˜m]=9•@[\Èi\ä„E™]\Ì\àr–\ÜH\'\Ú÷\nn‰o¤À\Ñ/ºûGTº%\ïg°@ìª·lš\Ñ{\ÚP9ÛŒ©ˆ\n¡w†ÿB6Q\×÷\'\ç\'|\Å.¾Naj\å\Í\ÉUøC\ç2^mÁ¡`£\Î\ß\Şqô\n\Â\É@9u´i\ê7Z!&S÷A\Ä+*7ş·R\é\ÇÎ„\â§kdÀM\×\Æl\ÓVr\Ë\nv#T!ğ\Üiœ\â\ÇR6¶g˜\Ë^\ê@\Z¨Å‚=Nı\Ğ\Æm$‹v\Ïk®·ğO”‘mCÕ¨ûG\îi\ë«Ù1\É\Ş¨ÿ¹\ê\"O\Û	>«\Ôõ¦›I\ÜÁ\Ñ14\ã\'…c\Ğwn.*›\ÉR\Î=^\Ø\neë¹±0\å;01s…¦¡¾¼‘\êµú€rÜŸ[U¬	B\Ót\à_	¤D#ºú[X²©\Ç\rq¿\ä$\rHÀƒK_‘\è›\Ü\0À»¡rıb\ÃV€·n»J¡Ng­m3¶	³[\Ó\à€\ä\Òd#’\Ì›¥)3¥\Ê_°4ù\"\äñ\n& ü\Èm³È¢ù<ø\Ş^\ìYÏ–Ÿó\ÔT\"\\ğ\Ğe(-n³,˜\'a`ø	0€¬\Z—ƒ\"{\Ï\0‚yd4œ³½ˆ)\Ş<K­\è€¤\Zoµn¯Á_=â…¼ Wô§Z»`«V¨”\È\ÕÁz=Ş¯›Š\ÍTmT^Û£R(•.¸À‘±Í®«‘úZ‰¥\ï\ël\èDriip\ì8\à«ú:\Õ!a`‚\Ë\Ù9ø\İUW\Şhöpİ­\ã\îıgò ¥¨S&#”©)@¤xh\æÏ®±¦ ]©wjHPÜ¦9\Ã+š\â‹Íg\Â\ç=7´=\Úı\r—>±Á%Rz×³j\àh\Øn\Ğ/j¡‚’&·§w§¾\ï\"\ÎibC9ÁQ\Şò/ş¸\0¢\Ú\ÔüEÂ±º\"U&~i¹¯Î“•ü$¨iÒ¿¶÷m\å¿Ê¢,¯\0\Ù\á­\\e•H\á:{|¿-*˜#`ˆD³ßš\İÀ§\rPc[¥\ÃL\"›iIu0‡{a%³›åœ›\ëqÃ§Yc’Ÿd\ÜW¿\ç²\è\ãú\é¸Arš‚÷±{Pƒ;ÎQşb\"Fõ\Ê|\Z¶:…	¡LÏ²­®-\ë\İV;ü\Äd9ğ\ç*N\Ïu\î(i\Şmÿp\â_DI<Ì«›òJ:\Óı÷%3+Å¦À\ÛA¥\ÍªÇ•Q½ÓŠKş\Òb\ÔüÑ÷\"R¶\ĞıI\Éğq¢\ØÛ «•ó#ó;@\Öo¤S`\åŠ\Ü!\Û\ïy\ä2!qbF¶\Ûf”R\æ\Ğ}ŒAú” V/Á¨Ö²ñ–‰‰(\ì 6K¾Ù¶\0*Rbˆ\Ñkõ$tF¹[½Ò¶ú?(_‰òˆY\äp\ÑfıL‘S\ßBù-©\â9\â*RkzdÁ[\n‡ğ®>Bô§ò\ë*©s»¼\ë\Òı\ÒDucÿ?\ÌM\ÖŠş\Å\ïf¼³\'V ÿÀ,÷oI‡K‘n@\\›\\\\üJ…\nüe.uR”t\Ù!\Úú/\á ^s‰\\L!\Ûù}×“\İ\åğM¨ÀGó\Ê9\ÅeYŒ½ş­\Ú\Ûô’”Ë\Ì\r‹Ã£e¯08°ä¢¨¦h\Â(]\È{‚W\à˜\×yD_9ş›\Ôa!_HF\r1Gı¿ùi\Ösô\åÔ¶Î‡[¿::\çV‘ M•µü\Ø\×VY[\ãn˜\ët\Æ>Ê\×sYûüu-\á\ZoxS\í\ŞNP\ÙFs3~\Ñöº—¡¯{Œ\æ…\è\ì\Í#\Ä:GP·qM\Ù\Ó	`\í¤ö\Ü«JXQ\Ús»E\å,ÚØ°òRB\"€{÷pk\ï$ƒ	\ã\ä³\éVk\Ä~$\á‚pKa€ «^¨v\\\Â\Ä4÷I”¶\×#„Ü²ü\r) \rah\È÷»¡ºZ\nÖ€Œ2ƒš\Ø5²ô½ø’\Ò^w&\Û41\ÎU\r]\Øy+Çœ\Î\ä¨Ë™Ùªmn&U²A6ûN‹\'\ì2ş‡±\Ş5÷I®xù\ÃG\é\æ¸|N\0ı3¬[?\"\Z\ÛP\Íri\0Šp\×\Ñ|_m,7/·Bœ~>^}(üf\î€|L	\Û4Ÿ\ÎEy+škS9emª.…\\\\¬·ºu™™A+u]V\Ë\ÄHH-e‘•U\éJÿªE~s+\à{¡>†,/\\^•”Š¥ŸTz#rÚ¹aj8¬/\Å¶7’-_%ü\ÙR\'©\à; xÙ¢f5<öE«\ç[ş\î¥GO(©£\ÍfI›o‡&\0’^ºUC)™Ô„r&†»\È])¹\ÃúYô¤¨.µ»œ‰¡•ºN€k|+\Ó5|\ï+¸L\Ä0İ‚\ß$«¯y™\ë¤Òš´× °iS©š­\ãO1–©V\æ×ƒ„şŒ\ØR\Ã<\áò»½°±·MO0•wÀ·*g\r	ø·øU›§Js³§B\ÇÊ¯Sı=\Ñ@ \ZaNšI\à.\Ç\ç•:\"eI3‚Q†\rı¼eº\Ì2µx£o;ıò°\Éÿ¥P|lZ~°()Ú‡IY\ÜÀwS·!m\áQ…2ö\"„*\ì\æ{FSAºBÁŸk\Ü\áş«\âñzR\ë\Å\ßE\Ùã‹r™„znJH…iÃ“GvƒŠÏ\Ö\Â\ÈNhö{˜\'A~yû@Pş4\r‚pC	3”,OG\ßóU&x–K~>&3´L‰¢\0oO#ƒ§\è \áÕ­&¦\Ù\Ì$6»\ÃÛ¬€Ji<{•BW0ŸP\Û\ÇßÑ”ºG\ê# \ï\Ğø -^G\ênÍµT\Ğ ˆyx¶\îÜ²T\Å\Ç\àV\Í5\îRè§Œ”gŠı\ë\îŸ÷«Iµúõm%\è›À\Ø&¶·;mn±&¹zøq†i\Ô=\Üë¬¯s,€©\Ö-I\Æi\Ó\èB7™>¯6ö\á¿÷Wn0€«¬zC\í\ê\ÔË’.C-Bœˆ\ê9_Elun™Š\n­v¬¾\"`e: ›j÷_$‘Šwr®Ñ»²ğkû§/š‚\Ã\ÇFœG:kF©\Õ\Õ4<Ÿ¿²˜ó\ï±På¥“SÎe\äo\Ê\Úecğ?;€eœ¢l|\Í{ õ Ìš±‚]ô\îaH%z0Jû“I>‰\'„»ó\Şğ\"j\n¾•—\r\Ö&\è’;_Oc1¨§IŠ%XŞƒ\ÅÁ#v@\×w¦¾½øô…©\íŒ¼VşRÀ­2\å6;qû§·µš\Ó\èÿ\Û¶Ä°W¶\ï\ç´oT\Ú\n¹\Çû§1„[“\Ù}¸\í\à‹İ•9‰³ IŸ¶\ëõG)§ş[÷,Îµ¾˜¿\ã²\Ûñ\Ñuúc3«5w?\åÔŸ\ØTU¨F’—yŒi\r=£¿¼E¾J\Ím\íü«„&³\Ü\æŒg$¬kGõ÷²L“/9‹™\Í\n`*\ïy‰(…ØŸö¬Àj9ez$-\Ío:–]|,›•]¾ñ\Ün]\0ÿ<™¶?Dl.t\Âc\ZSú\Ã%‰,>^\ÙF~¢¹ğù´¸:ªŸ\ÖrfÜšº\"\\r²\'\å¬)¬°ƒœ!W 6ª¬üm\äZï³’]ˆ\ê%\\\Ô0Ñ“‰=g\ÍG\È\Òu9D;Ó‡[1\\]\â\á¢K‹-e^DK8²\"ÿ\Ë+k@ QÒ¹Š\Î>1¸v\ã¶o²\0|—TùŸn\èjªl\ã1¨h°o|±f‰úwŠ\â6ú²5w‚—0\Ël\Ë\â~.]\r\Â\Öy\ÑXûı\à\0µ\ÉY¤\ç‘|¡/¢\ât‰>\ÜÀOƒ\Z°®o˜]¾\áKÅªŒŒ\ß^w¶,ü) ‘KN\ëë¯…\ÛD\ÚÅ°\ê²\×f\Ö\Ô©Áôo\ß%±i2\áy\Ö#Å¤\Ò\ÂTB~@\Õ\Ñ{»˜l…—q$=C¢p¥©šhfú$	º\ÜN–¹±+d \r\ß/\ê\ÉûŠ¹\Õ\Ím:$i¡•\êów¾\Æû’Ü³¶#!ûyŒ*÷;¡\Ò$–2˜Z1(P»êªŒ³:Ti\Ó-üS6O”o¬8wJü\ï—¦‡úø\Êk\ífZI:$e5M#,Œk2\ëh˜`ò€H¹Dş|\Zm³i‚>Bx\ï©B\Ô;ovÀu\è:ş³©D½•£\Í1³Á»´„\ïÁ/E²\×ö\Ü7<\ä¦\í\Ô\ÅT\èÁ\Ş\ß1\àI\Øú²ª\"\ï\ÏRÖ‰«\ì\Ñm·_J\âq2€\0\î@ôŞ¿dtƒW\\÷\Å	ú·RS¬\nc8\"\æ©û‚\à\É*‹­EûB›\Û!õ$Ò¹\0— ªw\âD\"‘ıô1›	B\ìkşUıoôSjòª~€\0ûtn@I\Êe]\èf‡4”Áb¡\ë]h–¢1,%Ÿ:{h#‹#÷¸\Ò\åUYÒ™\ß7l¹!tDFT´\rwŒ\"a\å\ç»u\ZZ\ëoO\à\r NvO~œ\ç ×\rRMg\Ó:è°¼\".øUu£7_\ÌĞ›À6£¦\Ìg\ßSw5¶^tµ&`‹¯F»\É\àkŠ\ÖJ\Ğ\0kÚ¾ƒ\Í<\à\Öá¦…=€«ˆ\Âõ\Ë	\Õ\ÚI\Ê\Ò?™ı+™b\îW–±jğ|WÁø£›C™fŒ¸\íl:ˆG\ÙÀ\\òo\Ù/½\å\çx’)½£\nÕ‡U4r`\Ë7q\İ&\ìW!!‹§\ß&gXA: \æ\Z\à ‘Æ³K5uØL!r\ÖPI†\Ğ0Æ¬\Ñq\ë\Î0ú–\ĞH6­‚\ÌujyŒ9û}>¡p\ì5^ñ\Ö2hA1\Ñ\à\ØÄkN¿XLNwü\Ö‚q„úºY\İB{wL\é\n9+I›\rhjÿ\İU\ä»\Şò2v}jo¸\Z‚± ùŠ#™)Ö–¬“-\ä\é„S™M“Ğš“‹ª\å\nXš¡&š9{\ÑoJn:0N¨¸ö*‘£Y›bG’ˆ\é÷**\æ¶œ\ì»ß‡—„\ÑTcI°L\Â\Îm\Ñ\î\Ø\É\ÙÿÛ¦–²\ËT\Îc\é;û\æ\Ù\ç*\Zg;[jt\âa\ÃsG;$ñ¾¦\Ì7¥\ëûG–\İV¹\ìj\Ôl­?¥\Úû\ï\Çû¸˜³“ÏªûMbğ\Õ\áUjD¼1·\Ä \äü`Q\Æ9ğª‰3\Ær‡¤†ñ|\Ø\Û_h†­¥cxt@H~\\µ1)—@\Ò|\ãfPrn+cm)š¡z%‰*W`\ég1w´€<\Ôs¦öcSs4C–\ÊCBJÚ†İŠğ5¹-»k‰‰\Ë{Š\ÍE\Ñ\Õ\Óü(<=¥N\ë·e€.<„Jv\ÇÀ\Ø<\Ëü½úm\ã\ëZ\È\ïT\Ññ¾&aP„…\Ù\ë\ìd\ç}\Ù*šS\é\äd\çl@úKU#3õ\Î\İ\Åu6¨j&4FK\Í9»\ì 1/²¶\à6ôó\ã\"¡Û‘\İ/—\å^\ÎSC\á>õ\Ûj\ï^0G:9:£\æ¨\Ï^\İH\Ç:\ÑE‰9ö?¬ƒôH®c°¶\áƒ?(g%h~×¸\à\09¿\Ô~6Ü™\\§¸z©j\Ï]Sv·2)Æ¿\íÀ\ïöÍ®Ev\Ì\æÁ+V\åb”/¢Wú)Û€÷hxºD¨S\È2#	 6ü¦û+{\ì÷BÉ…Kl¢¹¦J>5\ê¦:,ü\É\íˆ\Çğ\ÄkÅ³]÷÷½¿¹\à\ÅC\Õ[H³\ÚWğ<¡]ô(JI\"µ±\à¼|/Ÿ¹Ø¡D9\ë™s”;¹%¨M=Z™¯ŒAR™M–#\êu>\ä1‚‹Y”3aN\×E‹@\Ï\Êz\ä\àPHGõV…\ÜP³bÁ?\"Â–ğ…l\í*c\ÆMS=™‘9(ğ’\Ö,±¶r±&\\v\ì¶\ãk¬¤8x¿¶´¢9\Ãøğ­hŸ¬.”’Ì¢8U(¿i‡u­UZö\Ü3o\ÓN¯h¢L \Ã&„p\ê\Ì,\ÎVj¼iRnÃ†õ”“½õ¾ §‘\æ\Ú^8 ¬•Ó£\ÎA‰».‹¬\İ9\Û1n\èPgô™g-J\éNn¿cO\Ûk\nm¥•õ\Øt¯ü|\Ğ,O‘´ƒö\æğªÌ™ÿ\'Vı\Zš\ã<^F½;Ù‹\×q\Ş\0†”@\'²9)\í^_„nvQ\è:36»¸³cƒ°¿\âÒ“¡ğ{¨b®#çš¨}ŒN#\Æ÷¿\ã¾QKƒ7V\ãG\ê\ØV¥jš@­cPWEôcQO\ZTó\ÜD¸\Ëğù>u(#\\\íR§#\Õ\\Lˆ\ç¶3e$„«¸HŒo>*2·\Ä\ï±\î-ˆ%\Å4fÏ™\í[yUpòXCNsR¨wK_p\n\ëf\0¢\Üs‘€¯\ìs\ÑÕ·‹;»\×9\nm³™d©Ÿ\é§7…Ö¢„\àõ1±‚¥ÀG?l@¢<:\ÕW9[*ù\á·q\Ò\ÂÁÚ–È³raÜ¥«]_‡‰.j$-3\ï—C¼P6H<*—…µ \àp\Ğ ´3|,ƒ¤1©ÿƒm\Íù™- \Ï42ôü\ì™Ó¶,8\äZ\ÌCp©Jš±Hx\Ú\íX\İ;–×öl‘‹J€:I#\Ä[y\Õşƒg¥lÅ¾ş\Ğ\Ú\í’¥wã¼…@`\Â]Õ¹\É}œÁW˜¶#|\éë·³©\Æ\Æ_E s¼”‚F\ëN÷¹\Z§|;GŠ\ßz–\Ú\Ï[b¡I«—÷†\ÍQò£\ÅÒ„\n6¢‡Q‚>a\Ú/fÀ\Û\Î*Z•äµœöA\"v\Í\ä\çn\ç‘¹_JN	ÿ• \íø]¾;\à\ã\Ö\ÖU¤KSİt\ÚÀı5µÎ«CP\à\ÏFg&\Éò®5­a$«\è\ÇYs\ØFj?(/M\á \'U\İ){<J:\Ä<®7	Á:j–\Ûá£‚Ÿ0Ke…\Ì!H&\rô¶ŸF­Q²]¡œ¨îš<|&\Ål,\ä\á¯M‡ƒZ5\î˜A;¿¤*¡©U[†‘X\ï@Ÿ\å&†\0Œ$±<‘J\Õ%<úO1ˆMÖ¼j\\a\èÕ‚Ù\Û\à%úx\n\Õß•Ê)şš,z„\ÖƒU\Æ*>·\â%´\Ò/I\ÎPÿ¢!\â\ë!Ì³º~ƒ¸\0lØ…œpó\nj„\Ø\ÄJ“&\ØlQû˜Ÿv\Öğ\Ú>‘E{ƒRù®2¸Üˆ{‹UK€-\êºZ·°ı§\Ú1•şÃ›„ûq\Ò\Ï:„À£\ÛPg°\æ$#AeE”høºNJ$°\Ä<şZ\í\rHq·\Ór ‰¼\ä\Ü|H€\"\×+_¾\å´\Å%x„t²ø\âùa\ïd©U‡†lrı\îUUÀÕ¡|\ÒÅ\'\"¡À\ã„¹…V>ö¨\ÕÁ\ÓĞªa(H\"Ò›€[#Tx\ÇZÁ\ëaø·\Ü=¾s\Üeu¯0Ê’QÉ°½_‹ˆ‘\Û\á/\å‘õ^ :ü±\×\rn‹XúPõ”\Åù˜ôµ\çBœ‡®·~hSq*¹\ê\Î\ïù*zıIR;¾]˜¬\Ò)\n\à\Ãn\â\'×…Y\'H¥\Ä(\Ï\ìu\î\Ú&\Ì\'´±HƒË©&$l#\\\Ë3W,¯ór3\Æo\'a÷1ü=¯´jùV>(3\Ï;p\Ú9YZ\æÀt\è\È\Æ\ï\r¡­šİ›ù…\'—Vœu\ë€q\ã“\Ü\ìvÜº¢é‚¦\Û;\ÓZ\Î®(&½\ä&O}*OjhYkT\ÖKY<gŸ­\éô\Û-=\"LÁne•û\Ğ\\>Rëš£Ì»al\á\â­š\rŠ¤¸b\ÏV©	@Bù5kevtˆR¬µ„ür<’+2FÁ.¿Û†\Ã(œ…g03e\ÒYÁÏ”— 7¶\êw±ı\ÛkNT£:\ìpòe\ìq\Çû\ä\È\ŞÒ°E^Ñ½\Ü\Ù\Z!\Íú“ı2¸¥<h_BN&W\á\î5\\å£’g¶\Ö\n„Ä­\Å\09reôv%¡ôó,Fr\Î\èLh!Át ŠM¤À\è\Úd”æ¬ ˆM®ø\Ætò¥\ì\ßn\Ò\á§\ÑöOd÷\Ã\'ØŒv-TSùË’¶•ıc¯.Ó¤\åm\âO\Õ|Ñ•@¦\âl®ñ„4½³^;?Y5Gw\ÒM°\Ûa2ğ	\Ğc>\ÈA*\Ü<5\ç\Ù^8¨\Z\âƒ\ã¿\Ú%ö!\á;\îG’¢U\çmwš\ÌŠ¡—j,º£\îZƒ‘yM\Ì\nõüe­¦Ÿ²DŸEB%Ğ\ä…`\îD]Ó¡]‘/g¡\Åj\ï]*ºrfu¸°¢“^´\áI·¿\Â\äÁY8jª‘µ^\Ì.ùÀµB…dz\Ò½ÁDŒ¥õ¯š~-…\r\Ö\åN\ÒaÊ—\ì65MúG)\"^=^\å\"O®Q\ÊPP\rp¶”\n­EzvQº&Æ‹t\\>gºˆ-ˆ—\ÈKfLz\0 L<\âe\\§\Z&¹.\rrËabRx#ˆ~b´^\Ûù=¾Q[a!\ë“KrZ4-¢.7\àğÇœ\Õ\Ú}€ù\ì\'GN\Ô\ï£j½\ç\éPk\rG\Çr ƒVc‘$£ƒfBaI€Î‰¬#«x	­Ü·C\ÎŸÿõ>Á¥]y»+#;\0\ÆÄ„0\0mÁ<ª±¨ñ\×\ï\×5\\½¿¥Û’hº{ZºU@P\çù\ãò’ûH\àyq¸\Üñ\Ã ˜±ªhk\Ëe†Q\á\Ñdg\ã0I”\Ê\í¦uAv‚\Ê\Ë—c!ı°%w\áh s\×ÿ5Ë¶¢¥û\Ëraÿ\ÅZ/¨.ù­¸\ãº\Â(­¸\Ğ\ÙfÁ<DÆºšQœO6ŒWŠ\ëõ\Èz‡7uÁf÷^G9rÀbô\Z“<¾R{{„¸3ú`•oba\ïBx;\Æÿ)>¶+#ß£_y\×8¼\nmN! \Ë\\1³‚p4ğb\0õ\Ñ\ÓWbˆs—&\á\ãØµy©„\'#•]\r«Uş©\ï\İ¤s\Ò1öÚƒ¹ºŸ\ç9¤O\Ş3¨7ó.%/Qu\\\ê8{8û\ÅN\0hO(ñ\ÂmW‰	~\ÍY7\\9¯ğ@\Éşe\Í\Ëdß›$¿\ç\' 	Abm&o\'#:õ‘¡\Ï8\ãöĞ—­/N;û-\ËH\İQ\áIgµD†Á\ãyÂ»\æÂ¥u*\Zq±e\îZy\è~„\Zº\ëióº>‡ıŸ³l¢xšğsl\Ô¡MŸË‘Nh\r|\Ú\ÛfP\"\Ã\Zòu‚z00­}\'q¦É‚b&r(H¶\0¸\í^23\Ã\èHo\Âı\Ëş“3|c@Sÿ`ôÂŒõ÷\r\ßøûZT\Õû’\0¸[dL<„]ZS\ÊHŞ­É«.\Úıˆ\\­ªˆËŠc4\â\ëü\ï)$\á@\Æò\å½ú›^vG9 \Ò\ï˜\Êghı.¾{-/gúŒgJ\Ù»\ÌQdA\îW\Z€Y\á¿0ÿ]P9C?E¼\Üa?-JW.ù\ÖùSÀ+ ülIII¯\×J{ocTØ‚)¨@:²Â»¶C2ø€„ù¶ø\ê\ë#P™fuC·‡)p~m®Ö—ö¹u[Cuf/p`ûf¿,\Şp\åÚ³Z]_Û¹¯\ÔÎ†\ê•AP\ÊñL\Ëø\æÓ\ã¥G\Zv›X\rµAql8š,ß\Òeû›K‰Œ~¤? ÷nV\ãF¢v©6·³¬ˆ—¤±¶\ËyD}ôşZ\âz\Ø×\Ğv]¬~®„\"S\áZ\rF\ì”ø¿bµ\'û‘\à\Ğ\æ ³|\Û\r÷µj¢\"\Ã>\Ö/\']\ËsØ·_£•™a!Rf\nB²¿5X!cÙº\éj„÷\Z_­\íStd³Qœ:\ï\\e\ã\íB™\\\Ùckğ1.ud\å^¤ÀT:…Aqc\Òf§\\‰\Æ7\ì‚4W\ÃÊ†§£&lûœ‚K­u˜b\Ş¹<Mq€0\âõ\Ç]Áx¯9\ËÂ+|h\ëŒ*‚D€QE	yŞ¿Ÿı\ÚôZ¦\Ø\n\"B\Ö&—Y\Ù\Ã#¢x«!€“N?–%9/GY\íZ¾`ğ\ÓWA’G!†C\ß398X¾J\â†?42HŠ½…ˆk\Öe\Ñ^NjH§C>Rp\Ù\Ç)(\ä\Å\Şu^Y>—b¿\\6{£Zñ\Ìùs\ÖA\ÂMT \0?i&tiRŠú^\ÛI\Ù?iû$s.q_ª±2ñ$l\Â\ã07•’´ù½\Ïú\Ú÷¢=&Z-\Ñ\à<…«\ÕÁ\Äıj˜\è4[¤T\Ö6¾M.\Ù.P\'\Â\Ú~w«MAkñ)R8L\ä\ê\Ö\Õ	¤\Ñ>³ö\Ş\æ\ì°h\Óc%\ák\ÎùşU@V\É\Â:\çb,\Òe\Ñ\È9z.¹ñp§½\ÎÀ\Ér$£¬\İ\'\0v/°\ÙR1F\ÒRkªKq,$\Ü\ëj¾‡®•\Âjt\Z11\Ù\Ï\'˜ƒj†ÿ^£g\äñ­^\Çl=\ÇMpŠHwû:µ$€û\×É¥\0aaœOd\Ô`·ÿux…H9\Ùôú—P\×d\ÌJõjô\Îwòõ|Šğ\ÙuÏŸ¼e\n¢ ú<õó´‡\ëW\Øs\ëóvŸ2\æ\ÃÛˆ¡´¶‹­\0tQNl\Ğ$0±Ö¿Dgqn”\îò.D°õ®j©õ`w\Æyˆ™Á8`\æg¤\É\í]\\u‹)Ì¤V\×l.ÿ*]\Â\Ñ5>{™@CE \Ñ7‡\0›\rM¾.¢˜\ç:]´‹K\Æ(\áÍªb—ôMMƒÀ\è\Ûp\Ğ&\ÏÍ¼\ru\ïE˜oy˜GZ¿|d6‰\èúEv|;”x²)Ô©xF]\á–9&ªnœô&wp£ƒ\Å8|¡\è’KøS‡¼J„¾YÁ¤K¢0õ\Øo}»p[€\Ø\ãû˜H6ñRŞ„²ó$i’³\Ñ\Ñ\àö\n\æ;·®=ñ}2`_ƒ&—V¾r\İWYy\ÉJ\Ç\çFBÇDqjºCG‰^f\è»\rv\Â\Ê–ş>@¿\è‘^H\Çc¹uœ3\ßLŸŞµ8\åq™L¢ºá†¢Lû¶\ïş\Ö_‘`\Ê<u£\Ãş˜õŒ4ù-\"¼1P~(«&\'À¿\à* ¯ ‹V’ªá¸œ)X\Z/Ø‰\Õ\Ş\Ô=B\Ñ\Ï\ÈV„wI\\^\n\\B)ˆqOmY(H\ê_%±1\é?s\ÙxY¢<\Ü\ßÔ˜$tA¡g\ÛöeEOX“½÷°Gn>$İˆ	¹_\çk_vr\å\Ú\İK\ê\Æw\â%¸÷\Ú\èØ°o†¹\ß]Å—1)‚¾FFm¤E\æ]wj:\äŸg\íRUµ%VUG1L»\ã—G= xT\Ä\Z\ä\æV£½ø&—nı\é\×r™[\0œmt](¥—\×¦ù\çÁKºƒWDS\ï¬\ĞÁ)±ˆ˜‚\È\Ğq D7?ô«\Æj\İ\å\Ç\íÓ¥¨Áûh¸£(.ü­”¥\Ñ€CN\ĞU~\âg\îr\Ôi¥\\©Hx]ö€e;4¿Á|R\Ô=Œñ<¥yp.£\à\ĞW´\æc™\Şf\ãùú‚\á\äG@FØ¯\Å<\Ún/iEÜ·Gq¯¥6·:p†\Ğ5²\É9\Ë%.”Xdˆ\Ê\ÊU»#ó11iFy\Ü¨²-\Ã\Ö(ûw-p¾¸QˆG‹\ÌúŸ—‰œ/´W‚¾õ?Q®\àZl’§\Ø4˜\î~¸ş•b\ßt­{\á‹:ÿL¶\Ë1Á—¹:Œ°\è„\ßõ5_G\Ïyª°\Ô>]4\Ô,`€€® %HKAº\é7`·n¸Ú\Ä|z\ãœ\Ò\Õ`”×©r€µ$[¢ş§¦/\"‘\ÔF’Vû\è¬GT¨š:P-£–ù\í\É\ér’nİ±\Ú\è\îß†Óò·> Zù·‡øúRl\èû\Ô\ê“r5¶OU(fYkma·[S\ë2\Ğ6\à\Óã‡ŠbKß¯E~aŒ¿}7\nÏ6²½F\ÏÉ­¬Ö²\æÂœg0·W$!¿?€\ì\ĞS\Õ;ø’\Æ÷\Øÿ\ÙUüVr%\Ø\Û\'©\0\È\ÕWC’\ë9÷-„M½Ù¹ŠQ‡[\ä…*yRWTƒ\ê\Û7\Ê.d–¿Ÿo¯\Ğ\Å wÄ¶¡$\Ât\ÅÁyV9	\Ûd#\ÖÏ \ç:¶Û½F\İÿB´†c\é$ü-¾¤÷@\ÈúA\Ã\Ü?~$\Â ‘	`7<ƒ\ÊS\Ï\Ñ\Ù2Í·Vhö„[8,\ä\çn\â\n)\Ãù!\Æ2¿ı\Ù\ß÷co­˜`{u\ä7€\Ü~’pÚ¦%œ«\'Šm_şs7§J\Ì\Ş}ÿ;´%µ£H\ïıl\Şd“×›•°$—9…i¾6YT\å\Ôøa{q\ß	\×ğ?RdÛ‰Ã³‘œ×¤G_\ï¨[)Ã§o\ZuŠdj\Ã\ã\Î7°\ÈÈşir¶d†\É×÷õ\"m’(²hµl\àòl(:.Q–\×T¼NY©¥\ç\Ø\Ê(U$-X>iøœ\ß4\âºOf0\Ù\"†\n„¶d¤\Z~2A÷J\0C69™4X¸­†k¦\ä)B\älV\Ğû\ÌwV&ï­«\ßMXp7_R¦³D¯hªk\åR\ÚM\î+ ë“ª \ãwi	—\ÈÀ²¤\0t\ßnp\'?\ëF»‹-\n^’¹\àt`V\Õt\\\Ü™\á-º\ÅtÀË£-Qa¥±dAi ²ñÙ‹\È8\â´\Ğ\ËË½q„\á‚}v§t\Üc(~r•\Â\rj1\Â_·º¼\è?¹¶ş½\ÔxÁ9Šÿ³!¦(Œ¸ºÄ®E3id\ÙBZ­/3r9\ÉQš\ÏÁ^õ\×\î\"CU&•œ›¨\rC%ôCó\rúìƒ¨€Ç‘gaN³ \Û-ª\Út™²®\"ğBƒË§\İXAˆ\Â,óEŞ±3\í£´f\Ì\æc\Ëu¡ªDµ‚\È\èB»]`U\ÂÿG\ÍR*ŒH\Å\Â\Æk~\rµ‚o­F½\ÓÀ\×f3A\ÜùY¥°\İü	r8¯‚šm\ãx´åµ·NWè˜¹ü’›Où!ı\ïQ˜#\î\ŞµK³£<; +z<¯a¢9\í,`+?_\í+Mò\Ì\èF²µÿ#O	ö§TU¶·\Ä\Ù^ó›/¿»\Ş ›~<\à\Ú\Â\ä‰È„	„p\ï<.\Ûj\æ\Õ\0\Æ\Ò3SK·Š®\Æ\Ç\âœù\Õú=\Ö	\İ·O¸À÷\Z\'7=x\ä\Éß‘$/\è\Ó\ä£Ú µÁ\ê²\Û.:û‚¾PDˆ•–\ÕJZk`d¦Rn”\'ø÷#óf\ÙE\Ç\íı¦ˆ,\\›5…\äj\á\êE\ê€”\ÙŞ¾Bÿ‡a\Òp[>\Ì	\" İÇ·\á­x\æh–\ì\ÌR¡”ª´\ä=/È]Ÿóle³®v‘\ë¼\ÚCgÓ‡\àâ´³‘HZ\Â\n\ì™ôrŠ\ÖoWy!€Á\\¥\Åoœ£5\ÕÍ•‘\Ç5[º\0&ü³(Á¨|÷şO1u Jô\ìe\ï<O&^«H`\Â*n\íx˜…¨›‘Ÿ›\ÑõMõæ§º;2š\Çvll\ã\nšË¾ªE¦t\Æğ\äG–\ÃkH¢†vi8f\Ç#™\Û\Ô57|U¿…@ŒŠ¼\ê	ETü—Õ¡™Ï—\ÈÙ‡|{´ˆFw…x\Òú’K\Ø\ã\Äü\ß\ÈÂƒe\Í\Z\\Î’+U}”<Tm\ÊJiB—\äİ²,ÜºÀ£—˜–Ó©‡§<Du“\ÒD—\Æ\n†\ßzV²¥Fn\ÉVY\ßD\ä@ª]@ä¢lmfVtÙ£ø¹°\Ê~$\Ì\Ìl\Õ\î[rOa\Ò7İ \Ú\ŞHi5	Á¸©zv\Ì\Ï\ç²\ê_.\Z4ğ0D\Ş]Ÿfk+\Ä&w\Ô\ÊÊ¤\Í\ÂKü¬\Õqù~Z\åò&¬U\Òÿ\Ä\èsğ,fz¨m—L\ØgY„\Í0©ò\Ù¦\Ê\Û\ÒX‹Áò3~\êHu!K{M§hô£L³r\Ê\Ù\ÅF{ú1us\İË«eş\Äc¾KZ;¦\ç\Ó=§·\Î0\Ìh¸Û•Z6u\è|¸ª\Ñ\âhrRvŸ‡\æVY¤~ŠE%Ÿû^ö\Ï\Û;€¶\Å¨õ]zay\ßK«M_\É3H@\Şô=/”ª\å`©Àƒq`°J¨qšC ,œ»sô³vo\Ì\ë¥Ø­\ZñUi±3=Q\Z\æ»%X²FKm\à«ò\rk¢u\î.\Ú2XH¬İ€BWı¬…’‘\Úb\î‹A´{\ï+^5±0\åc\Z@ü+ƒ1kâ ¡bg®¤\'	¢ø}’Š•E=M\Ø\í\ásGDD\ç\ä%òC¸z…±÷mÿ—.¬\n}\èò¹\Î\ãkıU\Ë15›PS\âšn@\Ì&¿_yªz9Œ#o…,ÿÆ¨|TÁBú3qM\Í|N1\Ïô\Í4-T™™>\ë…$a\à†Dk¬E§D¤#n\È÷¼\ÜL{Áh÷¦ö\íh\Ù)«u ×±&\Õ^š51¢\Ø¹:A%\Å\Óñ©Ÿ³QU™oI”Í‹\Ğs†°‘‡\Ø\ìofpuòŠQ¨²Jµ‡\ŞÀ\Å)ş\Ç:í¯“\ãQ\èz		»^õ´\İjÏš\ÒI\à\Ç\Ç\İÀ„óƒBv.-ª\àÿEl+üS¾c\ÃL.\áR:›2H˜±gY	\ãM‹”Ï„–^=>Ü³Æ•Aa®u÷i¬P–b\Ö\n\ê\ïƒ\Èe\ÌL » S1\ØsJ„Cşna7³,Ï¥¾Eş\â\ã*\ÜZøá·”Xq¼¸g)\Üø`	9\Å^\éIºşr\ÂšY—!¢’2B\Ãú0ò‡\ç&\ÂNo\Ğ@Å–]Š“:7\è\çšSGh\Ï\ÈX\Í:+x/„³E\éÒ¡§ªssÔ ÷Iü•)w¢\Ø	À\ã+ş›y0ºğ‡²•\Ğ\nB]>\í\é³\ï\0ÿ\ÖPN›?²\í*~`e4\ÂÑ£R²—ª\ÈuEû\Ô\åey6\È__‘.p¦sø²Bü)‹®‰\Ş]x¡h5 ”¢YNÌ¥¢\åhI*ÿL\Ç\ÍeÅ£<«\í0j/\æq\Ü@\Z+p~\ÆÈ°«ş\0h!,` \éh˜k4\Ú;\".½C\És=\Z \\=÷İ»Ô¹\á¦\Ø\Ôi!ú´;›!#\ÃsÜ´®¯m©\n\ïş¤\çhS9`ë¤›|:8p/ŒInˆ‰O”e\ë¤4ÏŸyñ\áCÁ¿/kq ƒ+ù\"\0\î’7\Õ\ì/|\ÎK&¿-­Oœ\0ú+J³J:§†HMk·\Òvûßûû\íŞ†\Ô2¿\à\Ïo’™\á\è]´\ådüFy?\êßõô\Ê8ş=@:HÁ…øh†\ÖzufœÎŸt\ìÇ¼`oñT\ï’/\èº/=4|¡™dv„fê·˜uX ø\é:„fˆ(Zg\à!Q\Z\Ç\ë\Çx¶U@\Ç8‚$?ÿµ‚ã—¼‚k\Ö^—¢\Şğ¡’l4O%…b6±şRAÆ±¸‡²okŸª$^z’z!{ù¾‚0\'\ÒOwµ¯\Şõû\'\ëGnmK†›¨\Ãtó\Õ÷L+b·}ÿ\åEc§±›hŒ 0\Ï|•ù\ÊnWı\Æ>@=Rğ;%C¾®¾ôÀÑ’´>GETP9±*%\Ólp\ä\Ô\ë.\ÍZ<üh¥÷\Â\åYo\è\èµ%‡\'·	\Æm¸qV-2dKOğ‘0ñOü°¿\ÚDšÁœ\ÛQaw\çK\ê•w\Õ9U²nKµoÿ‰)\ĞQ\Ç]ló€¬—c\Õ;\ã¤5(8)b\ák\Ç\"¸”3hs\Ä_¤.l\ãA™\ä$-\ÓG0ˆ\ëZ1­³\Íp\è¹2\ÅôRÚ¢\ë	‡\ê\àö\å+ı18>h÷\ëò\ÛIR³šı¼b³”!\é7\"é—¾(©ô»sl/#Ú Tùi\Ë77vd\Ì\ÜS\Ë\îT†\æ\á{=2\ßü¬\Éõ‰»\Õ\0\"«œ3@úo(\áh\Ì \Ï*¸Îµ®\Ñ\ãr†–1Q\ä°-\"\í\Õ\Û\"w+‹;N9üò\ç~\Ô,lp‰\r\0şğl’TE{²[uX”¿ƒ³¤+\ÖE\ÓÀXoÎ…y;-„F»İ„\Ğ<\Ï\Şz\Å\0¤\ä\n¨N\ã.=V‡ÿxzHŒ\"©=\ï™@Š\Ä3•€8P|\í\å˜B“{ ¶¸aŒ\Ô}eHF…|\Ğğ\Üö:9\áE^,F\Èdh	Úœ3\'y±(mt´g£;;\èâ¬d/\Ä,³ºEŸ\îøzOWj2¯oOı\Ä\Ú\â}ûIs¾\â\Ùlª&SjBÜ¿6›¦Vjc¬rú†É¶<¢ó\ßK:4A¨z\Ç&.\Ìõ/á‹¯³¤ŠÚ¨]|»\å\ãR–Û±Â™¢n\rn\íü>]ˆuEG)Ol\ršTÀ-Ü»’¤	;|ªˆ\Ñ\Æ[\Î\Ê 1\Çú\ìò<\n…µ\ØW±®\Æ£Â™\0l«r³:jA\Ò:b/D2z4ó±A%W¿Û·\ã\Ş\×;‚!?¨‘Gø@;A\ì(Ù¸\ìš\Ü|a\Õ{-²“\"óšC R\îo\æ¬\àá£¬ˆ÷\ç¡36\"8Fd§\Ä\ã[~\Ù`ƒ\nVƒ™8ü;RZ0V\ç§ğ@vD\åy±Hø¹\È\ç$HD\Úu?–VSZ3öX.¡\'¿’y\ÒÈ„,ø,»ó<—	\Öôa™Œ‡·\ç‚f“	\â°ÀQ‘¥œ\ÊA\ßqŸ§„â°\ár?\Ú\ÍC³\ÉYTüg|dû+GW¤%$µ!TªP f\Ê]õlZQoz—{Ï¿\Í`­‹ƒ\á\Ê ;je\ëX4L¹f\Ç&ñ\Î.Ï¥\áñ\×G®´O“M3X;\Û+bTš7‰– ©´¯øV±¾rú¾¤A½\ï^\Ë\åò3‡g!¢L\ÈO®~ gO‘OnZ¢¶nˆEj\Ş\ØV	\ä5\nÆ¸$‡ı\ï“:%¨FŠ1ˆº_	x¬\ÒN¿gh¹·\ßõpÿ\r 9\Z\â\r\çp0%z(ô„d¯\í¿Ë™ûòº%\íC\Ç.\Â=?h6‰‘/Y÷j~/¹BñV¼k=\Z˜\äƒ+¯¡@\Ò-3 u¥4:!P\Ïp]\0l$Zz,¢n›Ÿ 9¤˜ Wµ¯bü\'K\'l-ò¾?\ØHo‡¡q\åi‘…;¬\ä›\ã*†½·V\ÌŞœ\ÅÔ¢\ÅySJ\Ï8T\Ó\Æõ7Hº˜5—d!»C*º0R\è\Ş5\Z;Y\æ»^ì†Œ\Ó(‘r‰\éJ=	y¹\İÁ:¥‰Y~øv¼`\îU@\ß5]¡5±İ :™\Äİ¯y€L\È†„³\0Å§jØ¥¥£\ì\Í¶\é9¿»>S\í?\ï\ÅkÎ™’»Á®¬†¹ûO>^b\Z)Àd§x²tg\Ø\æA%‰{t\'”ÁúZü?İ–RŞ´|µ0\ÉÓx \Ê`}qC\ç^£	Y\×tÊ‰IAbN0®Ä£][fˆ\å\ë\Ğv\â$\ìK\ÉÚ¾\'a\0ùWJ/O\ÉdyÚ½\Ùÿ>\Ü€ø\åØ¼\ÛNr=\î\\–gs‚+\×\ÅT\Ü7[\ê\çFÜˆ˜v]$\ä(}…É\ÙV\å¦ú\çHYyağ\Ñ\äø\Ä\Ş0©nóD\èšJ7•£€–%¦‚“ÿ­ò4\Ôhd\ÇÓIPôlšùa\Ç~;I3M¡\Ùr\r¢j;Úºt;kK\ë‡ÀhÄ›»+mú	úw\Ëj.,)1™AF\Ì\Å@Ÿ\r\Î¬®·RN^+Xql¾D‰4ˆ¹sœ4‚İ»d’I\Ìsfµ28¶’¼ı™\çe¦\ÓHÎ›ªX<mÍƒôHøV\é\áR‰¢÷p{V\n›ş\î$f,u\îZ«ª\Ã\Zvk\èôBc¡\â¶+ú\Î1\îA~š‘#¥>¼a\\“—òn\Øô\èHH\Êg\âjöhT\Óyc\ë˜1\Û\'\å@\Ä\Æ\Õ\Ó\ë4Hö·\Ûüòm;û#h2\Åd 0\Öl\n!>»‹0Ú¬´BAóAõ5\ãŞ¿\ãbR\"š\ÑE€F¦—\Ö\Å~±\ç5Ö\İ?“¿“p”ÿ–öAñ¨_»W/#[/¯%;\Í\ÔF\"\æ\ç;^\ÖËªÁğ\ä_ÀP[³K´ğ1\'%¸\Ş\Ü,b¯ynÔá•yx7…EGM¯®¤‹µe0q\nš\Èö’i\\`v½YÖd\Ô!\\°kÁ@\ãò,\r\Ø\ã%ú»C#—\"€%¤Ä»ñÜª\Ñwv7‹¶Ä°O\ÃE%h.tJ†a‰ò\é\äˆ9Iƒ\ZŸ–\\\'\Ï@iXMk\ßù_\Â8Ã­pb•\æ‡\Éo\ï\\œ;\Ë/\'®g.½‡\ÔL‰\äÃ‚ÓŸ}Àô\Æ\ã\í”|a<X\ŞTğÀ„nùvc–œIF0¶d¸x°ŸÈ§\Ïb»4À[¦0™ÿÚ¾¾ñ>R‡–Z\'\éEj3—\Òe\ã³ºCãº¡³P(\'\ç,^ƒu	İ V©’\\r\Õ¬ \Ë÷n[”~šÀLÓ§	\Ër‚\Ê\ëZ\ã³\ĞI€\ÔxŞ´Kd¦°tP²\ìm­ê¥—öf-3•M¥\Ã0ı01\ã`RF¾­\Ò\í$\íZ\İ\è+®Ÿlµf+ù˜7«Y‹\ÏHX$¾\Ïq35¦ÿp\ßUXlŞ‰AŸ\nt\è4*P\àZ\è\ëcu%¼ZmuZôZŠ}I\Èú3Rñui›G¯\ä\Ê~Ã¶Q\×\í†&\ä˜ vöS§u=©6ßµ\çÄ®ªM·LÁ\Ä$\ìÒ«/B\ÆÁ3×—ÿ£®”¯?¨\à€@I~l|‚]u‘N\ÑC4L¯‡|\ìI[\ĞÚ‡÷0À\r›„»28Ë­ßa“\"j3‚XØ«	$\ÆUf\é}t(>\Úöf½¡ƒe\ìt¡©{\ãZL.h¶û\ë\Ù\ĞEü!T0fDU™³JF\ÏX¾B³¯™8ğ\Ş,Y\ÙJZ¯á ™{M\Ê\Æ^¿Ç¼±—2Ê¼\ÚNó•\ä-»=6ZU¦ª¹?\Ëw{\è\ÒG†ó\ïÑ§k`ºoa–- \Ò\Ê)ª\å\Ã%\Ì&R\Ï•ºi›	ıK²*´·\ï\Èú\â\àYî¼¤\í\ã¥\nF¡å£½²T—\0\ë»\Z©\0«\å”ü\ŞV\Ö4ƒ(Š‚úh—^½Ş®b…`\ç`\Èk÷B\Üh\ås\ïS\Ù\é\è»‰w¦«ì ±%\Ø~\'¹‰ü\Ëˆ‘m¯—½£I\ïø\âï° \ÙV\0¤1$\"s¬ƒ§\ë«òvø^\ß×ŠZk\ï8R/÷\Z×Ši\ÈF\\‹\Ï%±$N#\×[¨\Óş\'a\Öx¤z&K\ÚGE\Öj»¾/o”L\îVyD\ÍX2\"M2ò½‹ŒQ¨¾üK´ú¡¤\É?Ş‰‡n\Ñı/?230³P\nOgcú:\ÕGGqW\Ã s&É\r\Üoce©O¹5j\ênkõ%.\è@¤\ãMRfºI\Òi‹\Ğ÷O\Ë!\0k\rNñû{—4”Ñœ3I7\æ\Ê!l\Ê\Û7*t½.üf½–!š¨‹³Ë„)\'‘¤¯¡!M¯z\Î3‘Œ©\Ã\ÈòPzy²†\Èu0(\ã\èÓ°:¤?\ÃùR¶\àğÃ§+ú8ı0ôf7ôh\á[œu‘~!9¹Á\İ\ä\Äi\ï\\¦d-&i}wşšÚ¢Ù‚ı³3¤_ùFz\Ät§¼gfwXo\ÍÎ§Ë¥o-c‡Û³¢\Ä|¸]ó-\êV·Õ:¨®¤¨\ê7T—\é4l4—¾/ \ë^.KÔ€\ìÁvº~V_\ĞU\ãuK­“ ›\Ş™}\Ğ}!I¬¿ú¼q\Å\ØDJ\â4¿~•u:\\Ó“j@‡I@°¤!;^?š\â=¨u­²œ2,¦	³\r\ÊxKn¢ÊŸ\È&ˆ\"ª]`]\à¶]Qc&\Ä\Zûû¦O0©—¾»2µË¯\Å)\ïv{3øó\'\ÑZ(ğº-¯-^\ÚT\çgû\â\Út…6\Úu ‘À£Yû	\Û\ÒV^œŠœª¨ƒkÀù\ÑÀ&-/‘‘/&w˜Rşz\é\æJA@¸*\Ì\"\ïø­Q©	¦Á	pğj5GXk\Õ¢\"± ¤\0\Û\Æfj#\Ï\åğ\ã¡zó\Ò1€l…\Ş\n(b\ĞÁk©¤?\×sª-\Ó÷Jª\Ğz\Û\æ\Ë#üY…«\Åú\rk‰dŒ`­Z«‹÷\êûğh‡U¼\ÏNq\îG9Ë†\×ıX<T%Å—M”\Ã\Å!{/1g\ÑD[V™¤&\ïW÷L.Œ\ê\Z5¹2‹—ôia¬7[\êŒyx\Î\ï-\Ü†òsL\Ìõz\Ğ\Z¡†›)@rÇ†o\Òo\Ê÷BiÙ·¥Uóµ÷˜¨\Ôğ‘n=~™¨/ø	ş•*\'=¨²+\n€l\Õ _DÁ#’€ˆL$o$úiE\ÎNa#\Ø{6\\\Äõİ^X”ë¼º´A\Ö|@ ò¡1vX\Ée]·©\È%/*~\êe‘ …\æ†IG`½»²u\Ó\Å\Ç/©i\æı¥{‡\Ï+X\äfEiYXb– ÷o\ár°ü9j(­c\ç(³¨`pgw^+\"\ë\á¢\ËAF²V\Òw¾œJ§±\ã(ô\æü§t\ÂbùP\Éó$÷\ã\Ä:’,v.qÑr\Æ-³öKÍ±_\æ\æ\é\Æ~\ØH \ÈY\Ô9Pb\ëZ±\á£\0òWô\ìg·eğùßcs@P) \Ïw8P$ùw•g\Öö\á\ß\íV§¯\â²W£[	™Z*¸@[“c²=\ÒE]ğû¤e’³\È%\éxV¡-\É6!¥#f(¶¶B?B”K\È{Jö†ôøób\ÈAº%©‰uŠ~\Ó\ê\\g\ítQ\ÅY\Ûò1õK\ìı¬\ßk\ËH=ô*\äGµ\ë¯5Ÿ\Ô\î#\Îk¡tGü¥±aVÊˆo\ëì¬„S-Š’º‡­‰À\é¨\æÑƒö\Ü \\s9)§3\ã\ã!ó·ÅI\×5£\Ãş\ëp¿AÛ¥\å¿`òP\0\×Q\íµÂ‡‘s%y\Ñ[SÎ³¹DF&\ÉDŒBp\ĞG„„€\æ—{\Ñ_Û²b\n¾¾0\\,%¤µÔ»²\r¦´,gŸõ\Ôw˜°´¸·:•¿´¶‹Ò®\ê\í\Ñ‚ş%X2MØ¼w\rh\ïö\Õ\Ñ*I¢’–\ÜÆ¥¶¨¨ƒ^û@\0\0\0\0\0˜\ì´y\Ôt2=xK\ÒE8\É\",}Èš„\àô==¦ %\è\0O÷ª¡\ÛVv\äRxN* \ÓEp\çõ\ÖA/²œ×¤À2J]n™ »¤‘\Êôx\á†õ\ßtûˆm\æS\ïw–¼\"ú&a:fºp\"¡(\Ö\Ëó\0\íŒ .7\Ó\ÑEø\ÈD§³\\0Ï—\Ú\ÃûruBPi$Ñ»\ÚPb~‰£\ĞC½¶>¿Ÿƒ|µo\éiÔœ!}}\Ïn\Ú?s2\é¦–`€¨öª\É\å\×$‡´˜”k»”Kø\ï\Â\É`8&¶\Ò)hÍ‡\ÑAóœœúŸbÃ¨%•\Ê&LC\å\ÉL<³ó›\Ù<c\ÅYU¦‰@º‡Z|j[¯Ÿ‘…¥>ói°cö1¹š\İ\İ\à\ÂO\â\æñ\æı‹Á,\áFfl¢\Êrñ\Ê\Í\İ_†\0‹Qn€“ø^\0O Nşøû¨Œ¯\ìIZ£¾y<Ûª\nË‚D\Å\ØpÛ¥ñw6qJ“%Œ¶ı§$úq‚CÁe\á<Á;°grÀ\Öe”\ì5c>\Æk¥ú,z÷£\0Şº2¶U²7\Ş\ÕxV\0~7\Ğk|£”\Z*ğ)@}\í\åg9J5\á8tS;7†\êG\ß´¦\n\è\\–– ù}.ô§m\É!\á\×R\Z1€y2\ì8™ş­XrBIQl#\Ä~v=\Õ0\Ì\Æ*\Ë\á€\ÑTWM¤-vó09ıi\Înñœ˜©Br«{\Ì=/R¼¼¶\í\Ë4)Œf½¨)T´M1_\'ƒ¶™½\n–\Êğ\Ê\rÖ€\ß\î2\ë£û§¶…9¶$—\Ô\"ü¿B±ŸR§s(\Ö\\\'yC{ğË„¾º…\Ã\ã\ã[\ÜVV\ëæ¼’\Ókñ¸C‡Ÿ9Œz\ŞLµ¶òo\ãa\0Ä„/Sq…%–PöĞ­\Ê\İ÷)c(C\ádW\å\Z>V½G…\î\\~û¶e½\â;|:Å«ö¥\Õ(Ğœü’´nXº¡õ,}\İg\Î|tğH\ë@4‡\Ì=¯÷\ã\\·˜‡œ	Ql&ô_nñ7«ğ7\è$Z4At\Í~wj³7\În‚ù‰\ì\Ë;…g<£ö\ì¬û*:ŒDÿ,¥{ğ\"%¬0 ·\rJ\à\r7+&<÷\æ/\×\Î[M¨y¢˜\Êí‰µk\èœg\ß¢ŸˆB^O#	œ…\ÒiCºÄ¾Ä¨°{t\åˆuVZ\Å¨M{ˆë“’§ş.-ô\Ãt<uÇ‰õ\Æ!g¯\Âûª,ª•¶BI}¦´›™r\\„¯€\\W\'P)¿\Í\Şmƒ.\ã\'§„=ø	E\ë$ø\Ù\Ş^‹‘>6¿j\è&jÙ„l¯Zj+Èº\ÉA\Ô-öpH@\Ü\â‚5\ÒS\Ø`\Ä\È\Õ\"KùRµ\ã\á\Ø@Îƒ\Ş}IR\Äû‚–E¹Lq}mŒk¦ü[š\rw•GÊ…ôA¦\İ4)DH\Ø\êß»\áğ\êazCc¸\\\Ç\\¬\ß+:šT ?óI™‘Yõr{·ov.\'hö3‘’\Îg®—rZR\ÆÉ™¤>»j-{cIY‹4ÿ\İQÅú@¹“\n:U(_\à‘v\ê+N]%%]Xó¼“-z”W’eGúc\ÖúFrZU.ßƒÈ†\İtEz;Fñ²Ô•Å³•it 012\Ä:X—‹\é_¥³\ÆÑ€û£øHÈ¦˜r(M½#/[E`\"ÁG\åšZğ–\ëEÁ¨\à!\ÑRò—û«\Ñ7\Ëu¥–WÜs6–X‰\ÃOT-;A<˜’=[\Ã=`hó-.a{\Ò>È­ò:>\Õ\í\ä»a*\ËQÂ‹ ÙÀNc\ÑGÔ·ú‚÷\ÅV_\Ë\Úz_Y*ƒ´«/*`k\Ä>µ\ï¦ê®¨U³±˜.`K\ß\éŸ[j¯´\ZwJ\â\Â=¡ª!wÁ\0&;6o>¹0Nü6Z÷\å\è\ëÛ¯ÿp¯3O\'{ÏŠI*–±õ\àPsø]¤×¬z°\×+\ê\Îü¤À\â9|\ã¤F\İõvh!„[`4¥ÁxL¸Ê¾\Âs\Ë\İ\')\Şùd\"°\Î:~X:®Ã ;\ä¤\ãúƒ†kaŒKuYH€°ÿôPTœA\î¤O\Û\ßòú\ÒQA_º\ëKó	¬XbÁ¸şˆ_\ß4F\"53\à\áu“\Ö4Ú¸I€u\ï\é÷’œN\Ğşg²*1Rn/gÁ\ÏÆW\å s„€Ÿ\ÏXn¢\ëv¨ô\Ş~“\á\nõ	`\Z»ı\á·eLf:f\Ôı\Ì<\Z¤1¿kö­{b\":\×\Í\ÎuÂ¼Ÿ$J$vMş,\"÷G\î†\ëz]“—¿Á‹mK¾Ruı(\íU‰\åØŸ\ã\0é´…ğeûN_T?G‚\ÌññŸ¾\ÂKw\Í\İHú3\"uW€¥\ç\n\ÚÇ£¶„\ê\nı\×B¹1\ï%_š\r‘\İ?\Â\Ş,¬@”dp\Æk„\r\\‡=«{‰ç¦c47H‰ùŸ\È\ë¹Xô¤R¹9,ø÷\İwË6¾%\Í\Ålu.\Õ~\Î`µ#\Ç1\Ì(MSñ˜Ğ«c«8‘…/Á\ßDH-ekwı…j2\Ğ\àh^°kÛ¼ŞŒj\ã¹ƒY*o\Ş\ìå±¨„\áû+\çz½ô\à‡cõÁ²*¨)m·À)b\Î!±oÎ› 8P\á)Q¤Q¤¬DE6œ\ä\ï)\ê\ÇrdÆ½ö\'…\äŠ­Î…Ât·\ÙBö¼¶G\Ê/I&[Œœ/\îh“O²\à¹&\0\Ì0¬\Í%ğ\ãK\Ó½4+€\è\è¥\05	+ş5\Õ{\Ç:<–R1Ë†±|7ôGú¸Øƒ¹M¶G‹7\Üü\Îj·Œ–>Á­zøÄ‰y“$ ™½ˆ•\çw\\¥~»tş…µ©\Ë\È,)H³S\ä†ø-mŠ\æ\æ\Ç%ª»\á\É=ú\0\à\"(‰K^y\Ú\ïU.O\éø\ÆOpœ\ê\Ş\èi#Zˆ:òg;b\âVc\ÚßW\Í\0¹0øfü«Y8Mm/‘a9\éw…ø¶8Å¡\ÓD^\"x@§yMƒ9¸\Ü\Ñ\Îğ;q‰\ÊnSs\Òÿ¬\ä ½Z%õ2\"h[–ºÜ¬sVo‚\"Üª\Ñõ\×\ä¡¦7Q®•´Û®@\Ë`òÄ€©%zša¯/‘\ã\æ\ÓÀ?„\Í\03CfQÀ¸Ä³e[“a•)AMV+©E^b2NY{\ì|ºD\ÉÖˆd;\İE©8Ê®ûñ²/$Q\ÈB‘ÍŒw.WÕµL³¦p¼\ÏşS&€\Öú\ÌjñĞ²×“ö\Ïÿ\àcwhh\Åk$Ä¹„\nu/Œo\ìze>¥ÇšôE\Ç*Õ«krB`\ÅD\Z¦p\í5\î\Ì\Ùc\ËOqi„S‘\'‹³\\R[œ=\é\ÚJ\á\ç3À\êRı\ßZ„²CvzF!\Î\'V\çD‘a ˜Ÿxñôg~nfp\è3p\çÇ«kı®s=Ä°òğm¤\Ù7!\Ù\Â*è·Ÿqbh\ï´±ó„\Õ\ï#¿\èloH@-ú€6\Õúœj)r\ß\r©|/h¨\ÊCL¯\Ø$*İ¡\çE\í.\èp¹-\ã‹0>}»¢V´\íd~¾ƒ¯7Y Ò›­T\ß$¾‡lI\áòMô!”\ßSB\î¼ú@|®ùõ·)$ñ¸)\Ë\Æ\ÏÊ€ô9mô2²„¢¦ªú6\Ç\'º]$fûµU\\/+>\Ê=\ã\×q§~}–İ¾­\êŸ*óK”S*\Ñ\åt\Ê$\æ~A™kô¦›Àœ\âÀÃ¿   ò\Êş\ëÁºL4;» Ü‘´2œ\Z\Ä\n¤9§²²=U€\àJË’[­7*=\ã\Ê\Ö\0§y õ¾\è\ä  `º\ïe#\ìñ\Ú\É\ß_v\á‘\Ê\àY\rFV—UN¶ö[¤‚>p\Ú\nùbHYÇ¶\Ğ:\Ïõ42—\ÜA2bJ€)è®¤ÿ=İ“q$”¸q\Ò7b€$\×ûb1\ŞBT‹\Í\î\ËQ€ùˆ_	YR¨˜p=\â\ZA(Œ\0cŒ\Õ`\ìy`\ãlZ9–q\\\Æ\á·&`¥±ô\Òğ³4\Ãó\ËMx4NmX¯W[œb…ô\êy\Ä4İ†¹+\Ò\Ş|]÷j\ì’Ë•ù\"€Ï…±¦ƒAr«k²\"f…(òÿ £/MZƒ\Ä	·\àsu¼©ûW1²§p÷\åõÀ\å\Z+q¶]Q(­.÷•`¥\ÛFœ-\èDq\áMo)V½u²±ş_¸ñy§^c…Íº(¾÷\É}8h\ç¡Jõr>\Ï\ÜÄ®/õkù‰\ê}\"\î$†NØ¤ğ\Æ\åû<b›´kEº»5ş\Üb.¬\ÈÅ¶*õ˜7œ6\ÈØ§\é\"L¡¤@4°²\ájò0\Ú_×¿\ÒP9„ÿ\ÇòöŠ#òb\ÊioRû}|d¯\\ƒ\æ9\Í\\€\ß\ê`vr\ÈO³,.\èv\ç¼ò4”B\êˆ#}c\'‡\ÖSK1pSµsi¹\ë›]b\Æ%¢k¿®£Á\éJö¾^·”¸¢§9A\"r)\Âb¿\Â|Ò¼\ä\ÉöúŒá•¼–¹\é\Ê!cHQU\çğ5±d‡\ÓøG\çvH\Âo\Ña ó€0›‡”…\ã÷•˜a¥Lyœ,µóµß…A\ZE\Ä\æ \Ç|<\àG«tBd»\ÑUe~•T›S\æc&€$\ã©\×Ge\Ú|‰/pc·RR·Ú’²®Šó*›æ£¿\êrFÇlÆ’6K´“¤£\ÑX~}\n\Ã‘9E¯?‰\ê+…\îõCÁx\Z¬[·\\‹É¹Î¿B\"\âtØ \árÙ°ø‘¥\ä\ÅL\äÎŠİ™RJ+†Ì _\Ş&+‘z)¶s10»öŸÀrJ‘\Ù.~3\Ğ&\îY€pJ\ãuÏŸ*NÇŒPõ>÷\Ö\Ö@˜\0•I\Ûøğ6±ª\îşV)\Úy‡%şg’.2`V¥ñ‹[\Ú\ëøğG€&\r3€ºXh£\ÊıJ¯ûõ±®\Ù²\È<D\ÙW\ÑutøĞ¸ŒÔ«’ó²\êÛ£f|}F»¸„‡w\ïõ_Ig±jN|¨\Ñ{¨—wò»Ö¢?f}.s®\'I3\Z°Nn‡+hUY\âóm˜T6Ú—\çÂŸ–ij_Jä¤–»°Nÿ–{³t•F´ \ë¡#’\È\Ó1Ô\à\În\ÏhP¦q€c/¦±kı\Å\Ú~\Ëv\ä\İ;aÓŠ\Ğc\0 o–€\0;y>$\ê\éNT—\\ÿ±n8ô·û¼I\çŸ6Œ\çAqtk«6Ÿ*K”È‰aNø‚\ÂIM€ù-\ç\Ñ\Ô%_-aºyñ\ãse.\ßúºzØ…\Ö4Uª6”\Ñ~­\ãPò{õ`©²yMŠƒ±\É\Ô$²µ¢¥4W‹W\Îj\ï‘R–q«]Æ€8Ã˜©„H€L‡]Œ\éqCu‹iÈœÊ³¦\É:w\ËC\×ÿÌ³Hç­ªgŞ£Kù‰¡=i‰˜¾mQn$›sŠ€\Ù\Ôş®w[7Çdµûq@T‰\äY4Ï—#y\ÜA¾«…º]mxÚ™¼‘{t\×Hyü\àŠ¸PV­\"Y‚\ŞÁE}y…ùYÜ®6W\å‡lyÉ¦„Àƒ=C‘+:4Ïª\Zñrn\í\'\Û^ğ\î6m\ä0m\Zk~WKŸ²g¯¢ò%p\İ\'/E_ğ\Ì$\ÂR•\Î*\â\å\Ô\ÎrC\ÎÖ³J\ŞEN×¬k\êxG†\ç \Z\Ë6¾ıi\ÍH\Øú}+6\í\'WU€…İ¯S«Ë\İp	¢‰^o—°%¦b\ÓÏƒ?2\â\Ì\ËQ7ƒ‘FüK´E\é\ä-T\ÃU‚”5¨\Âaª\ÈGn\Í-\"\ík\ÌC¹z\ß\"A\ÅÉš‹¥ˆª_;=>²)mÄ‚‘ô>§¶¡…»²«\Ñ=B\á\àx	Xb…\ìÁòÑ¶$ñ…ø\ÅÎ–C\Ğ\ÒÎ«Q~ %Kñ”R±Œpü¡y@2\æ\ÃYÌ›k\ËUÔ˜l_À¹‘±D\Ób\Ãc¸£$ñ!;\Ä:\Åz—õs\ZEº®Û¿H­l\Ú8\â\Í\ÒÓ¤\Ùó`\×ñ‘ılI\âm\"\â—Ö«\"\ã\Ü´Ÿ\ãdWk\êgfkw\\z‡\Ì\ì[}\È<¯\Ë7:_{Ô‚°ry/±¤K¯ª™¢l¶›ŠÒ¨mÁ[I\'±9A3\İlŞ‡M,K\ÍPÓ¶í–¥>¦D;b­œ¾\áPª>\"\Ìÿ\É\Ã´G¢V’µ‹\\u³9\Ù@VI\ê`!\Ã\r«†\Ë\ãt$0]ò\Ù—©•ÿ„\êıvú–©€57jN\È\Z†\Âö¿\ïÈœrs?Æ„\ïaŒ\É1\×IPx¸Ø¡Hg4óP~Ü°$\Û4*ğ\Â`³0À\ëPŸ,)]\Ã8²ô2S˜¿A­a³\Ã,\çIªXœE)©\"tó>\r…j´^\ï\é%˜4mıCTL-¼ó\â\Û`3l\Ùöfmˆñ^\ãä¸¶\'Ie¼Ÿ]˜r…L³še.{j»\ß\Ê<U­5Sl§\"P%p ù#ğpf#f›C¢Y¿Gvb…Gm\æ PG9Ó‡-:\ãö\ë\Ó*4\Ô\àgdOb\æ’J¬ûU¬TCÉ™a”rzó&TLaé¾˜™K»\Ù^k}ŒY\Åø{lIiD‹|\à${6>¡ó³/õ.¼õG¶°½ˆ\r\Ûe^89wœB&›³¾M~![b¾ñÓ¬u@’\åÃú#È•^S\Î{ªs¢V:S9f”ô~¢\Ú}¹\È®Å»d\âb#ÀšÑ‘.Ò øØ¶&¼\nó\"ú\â,\ï!ºP:vN¢B/È9-@c¯ Ÿ®O\Ö\èşŸğ·\è\'fT®­8É½kù^¨?g@‘ÿ¼v&FsT{–ñG„N8ò¬\ÕÍ‚›$]\ï,\0Pç¨­¾©\è\Ş\Ó\íP€öŸ\à\ÑUøk·\Ğ\ãı’p\çü}¸\Ôòl Á>«q${\æf»\Ô\â0ƒ\0ô2¨ŠJ\".IfXğòıGqÙª5§6t£\Éiü_¡‹vŒI4‚R°\0\áş¾${¿™¦\éö\Ó,,\Éj\Ò}+™\ï”P¹70|\ï¸\ØŒÁb†z¥h‚\ÃQ\0nK[V¹5™\ì‚#‚\Í\Èeó\ï7{J¿Öœ5„µ÷\n‹³ñ,¬\ì\Ë6;\ÎÊˆ+°gıVMYL›\n\Ğ\éxK,š9\Ú}{\ïh†\Ç\ÓüŒ‡¡\ì\ÙuvwZ²&\Úº_¯\ì\Êy§-\ËKµ’\Ö~–ğ¬M2½¶À\êT?¤^£Š\ï\Ä^ô+¤\0\Ë*´ó«]ğ*Õƒ`€aT\ê\rQ\ÍğN0\Öù2r¥$5ø\è,\"\È!jñf/È¦‰<½@ø·…#>ÑŠ5±¤¡CÀ{!Q\édt$9õG;L\ÔU\×\ê\Ô\Şe7—xõ.\Ûh\Ú\ä<‘’üIÁ\Òş`\à \r &-¦p–Kf{³!6lC}\é‡\Ã$»ªnœ\Òÿ\àg‡‚|N\ßXJrA-°AğP§]\Ì\Î\Üy«­oy4Y‡İfB]Ã®†dÛ²\âEÄ¶=#\ZÌ´7p±-ak^\Í\ÚË\ï\ØÈ®\ç\Ğt¢Š\ÕF\íƒKªZ\Ô`@\ãr‰£`ğŞ¶0	²‘–\Ğ6dı„ø$pyYÏ‰oIA ¶>Q÷=”\ë¯û”Pä²¨#=Op”\Z.ªF*\îXT©$^ÛºšX—	¯\ã\Ù%+aóyQ`%c¿÷Pƒ]\Ôt*²4H{z‘\'Ç½¶÷1¦º3nfNŠ\ïeÄ…\é2ñ%H\éH)@œÒ‰\r¤±¡°ö>Qq\èjHh\"aşš-·@Œiœ÷\Êù\ê÷ù\Æ	¢ò\ÕE€\Ş8F°’¥k˜8y¯§Ÿ“\×\êôB\ÚÁm½¢¨\Òu	=\ÍÀ~\å\ZõQ\ê”\Ç\ÑD\ë¡s»9¡,¤†-2ú\ĞJt¢2øç¼·¤Ş¥^H¯\'˜P\Ç\Õ’áµ·q!‘~CšŠ5÷P4\0?’e \ì¡Fèº§k¿t†h-%\Æ|ò¿1Z\Ú,\Â\ÅS¢›\æQ¥F\ë’\Ë\ÎafbÏ‚<\'X´ap%g¦^:œ%\ÛC:\ábÚ¼Jkªñ«;<-\Ïx.\ä¤0¹=AZ;npC‚øw“ğ©“)„\"@8¡Œ.—\Ü9Y§r¶\Ø\æ]X®0“A¤\í,\ŞZ\Å5×•\Å9:\âŠ\èô¦_úRá¤†R\È\Ñ\Ûã¡Nw?şXù#Ù¢è……ñøH)C\Çlkeh\'À:…]\Å>„ñA½£»õ\ç\ìs9_òA¶\ë\0iC\è>\ê\ÃÎ‹iı`{Czw#\Î>‚s¥\Ù\Êú’0µ)\ît–J¹äŒ\Ã\"­“`\Ş[‚2‹\ë\ZŠ\'LÍ©¯©\'³ƒ:Wÿ¶şŠ¶Àô\åj5Àfü@iŸŸS\ïu…Æ–=-\È\ÍTõPP\Ænö†Şœ\Ç\èWK1q\×Gûq8l™\Ş~µ\ån\èøË–£®L¨ò1x&¬!\ï}Ï•\ßM+\ï\nnÁ\ã¡Í«w£\ÓJó=x“f\Éz\0k“6Yº\à\ê\ÃRÀ··N«‹¼\ÒuXr!¢@ \Í\é»zl)\Z\Æx¢B+\Ùü\Íú+\Ò\Öñ\ëúf\Ç`\n€ø\ØhG\ÄV¢PSøSpĞ¼%\éû\ãB6š&„„s}©¥\âl¢GDgEŸ\ë–nH¯iK\Ú5ù\r\ç¦\\„¾[\àøV\Ù\Ó\ÍR\ÌƒM\Æü>0nB²2\ã0o\'\ç\Î\Æ\é€lkXv\"\èù\Ü\È)À±³yõ‰\Çñhp|\Û8\Ä|~Œ(6\Û2]ŒğOOW†ù!©[e	\"›\ÔÎ©8£\Şd»Â‡A-tN„w+ \Èrh}T1»İ½) gr¼\Âyğ{ÿH}˜½¬¦Í½Á‹%tJ€d²\Ìşe&=[C3ÚŸd²¸ya\Ü8ü«9,¯2U§	!¤c\ÜÇ‰QÌÅ»Ê—f´ƒƒş‰_DHyŸÖ‰¸b\ÈÔ¾=ªiwgjŸ\ÖWŠ\å$#G\ãUr\Ó\îş@rıh”ŸD“ˆÄ/]\'WÀt\åC ş\Íqù\Î*¾R \n´­ğÿ\n\Å^\Ó\Êû\çx²ÀŒ­@újñµ\ÏøOôj 	¼+£W\n&ÿ1C\rÀaX6\ê–*´»\Æ+j\â¶ š^E~=	„—«\n\"Š€K6Ôr\İ|b\È\í]n>Ë±—»oÛ–\Û\àGAz©\ŞYWôÇ™fdˆ2AZc\"n\ÜTÄ™M\ZF\Ëş\é\Ê\ìœñ¸º±!Wƒ\Ò\Ï\Ó\nwb\Ö\ÅÁ]z¦ûawIs^XR~¸S\ä¼ú`&«\ë\è\î zmY\ïŒõd§Å°+”\æ\ÃúÍ¼d\r\ê5m¨t  ¤\Ú$\éšPı@´İŠ/®³*–)AÙœ\'\êĞ³))\å\Äı¿9hk×£×“_\n\Z±.‚\ì¦e˜BA\ä~Ì¡`³‹½K‚©šÿ\äZ]¸ô\Ï\Ü	5\Ô}\åy«6’²ePxß¶¿\0ò Ğ³ÂŠp9+Wu¦\Ü\È)d˜óCüŸ\îŠ	¸\ì3@:eWrˆŠl\Ú\Ènı™ªÃ¦p\"Š^Nª\ãEZÁûn`õ)ş/\åo\ï\ç\×`Ş™\Î(xÒ±²L4—œVİ¢	uô­\Æ\Åõ_\Û\î¬‰—|²•nuH\×:zJ\Ì\àDÛ¡_O¢ıñD\ìx\\¼u\á›)O\ä€3pf\Ë<9+Ky¬#µ±ÔˆK?\0³>\è\Û\Å!|Í¸\ãp¸\×\ê)°p\Ö\å\è…C‰\Ê+ò[\Z\êvYÿjz€¡\ØR(ğ€| \ëh*\Äş©Õ£_¶P$aZ\âo]µ”€ôp—$5\àş0y\áG+\ä•\Ôøÿ°t­p\íœj\Ï<›„\Äñb¸òz\Ø\ÙÌŸÙ´0E£N©K)-D\Ü\Ğ\Òş\Ê\èm(\0XÕ …O=”\nõI]\Ü`66„™£`ª$\Ã<\ì6\Ô>\åcÀ\Ô@\åƒy^±mZöD•$“l™$1€E$Aª™•xZ4S”\í„Kü\Ô;ğ*<ÿ±GE‹ğvˆ÷Œ\Æ\ìL“†v\Î[ÁFStùú²	(X\Z%\ä\n\"”\à¶\êqE:(¿W`ó·\ë@;\Ë\"÷ad¿ó®“,E]<S¿-ˆ`_®¶¡\İx*`4\ÜN¡ğİ‡aöE>¼ıŸ )#m­† /‰,¬:{S(#\ì«w÷J¥\Ë\Û\ßá°¨öH‘n‡ß•\í±ı\Ì8\à\Ş-¡1h56ı}ûXAlVhzó6\İ\íZ\é\ß¯ \é\è-i½\ÄEˆ9±f\È&n\èhaölò»³2¢0ª¡\ìKÀÑ……eQ\åÜŠFú\ÙC­Ü§Wë‘¹Bv\Ê+\âñœÁ›ˆ¶‘\n™sA.8»2\×#E2²À_-À”\èsE_»[\Ç\ç\ßmb\Ó\\ºzø^8òğ±·k2Œ‹ÆªöK%z˜£¦¯ \'Iyİ­\ÒóÍ¼œ¡ø ^&–8…\ìE;v¢?¬ °\ã\Ô\ç&\î\\˜‚\nq˜¶z0	@#‘›\ÃlL)€ ‰\ß3Š÷”£¯¼F§ Nÿ 6\éG1)\à‚±´¡ö\ã«ñ\'{°<\×QHS1Ë”Z\Ä_³\à,¶öaÿOo7\Ó\ï´$\æç¶Û»*\'ƒ@†•…\Ø+„r-\ÊÚû²\Ğ 6°4¹\ä.\Ç\r67(ˆ\Z\\€§G\'\â|›@!¾¾RÓ¼6¬uIv\Ã>”\r»\Ğ,rl}\Ï\ß\ÇT\ä9ˆ\éŠ\Í¼„‡zJ\ï\Ï\Z…p…õ\ãÂ‰Aş›¨„Ù	\Z\ç!©yL˜z\Å(=\0	Sü@=\Ğ\ã9À+\íÜˆ\è%\Õ)ƒµ^¤G$¢)·|’§#Z¸ªrª|\Ú&\0\ÂÓ¸Î‡sı\à\\„D/U{´øªOw.A\\J¸ƒeıú´ˆB—M­ññ]¥\ç\Ûk±[\ÑIN\ï¨mÛ¼\èĞ»\ÜAû\Ì-\ß\Z\ägV¥šk\Ê\×K\à€u:“ñ‘Œ6\Åı\ãÏ”S\Ò`W\êY¾,ınŠ\\k\È\0­\î\ÔWŠ§ú	T‹¤\'\îE;§Án\Ò4\åÂu³¼H‚(\ç¿$ŞBÀ–ğ\Ö0~—ª­N\Ø\Ô8sIC\á]š™²M&ñ˜R\"ı¯\ëk—\ëy\'\ä\ìÄ¸T`(C¸±\è®!ö I“\éıY;@Št‘K\ì¹(\ŞN„F‰ªIHVm²\Ø|fK\Ú;2$/ğˆ§ÿ°¾­:“v‘\Èt¯e\Üfš¼g+X0ó\nN\\È²n\Ş7O@²L€©\ì¸òx’uwù\r½‘\êXI( ¥\Ù\â~—\ä¤\â£h#\ï¨\Õ\r3§tù·.,=$Ø³\Ñ$`·s~\Óú\ÃKOL¡‡09j”s)Eø0±K¿A\åÀ>Û©>©šA¦»sñF\'\ĞòcXó;=Ç€½†\\\ÃlR\Í,øµzNt\Èhxy\ï%7¹\éè¼¡®B³Z\ë\ÃÁUz«tü,€e\ã\Ò	ÿ(!\Û\0¬ÿ³S-£yõú\nà¢­›¯\Ùöy|S„)…õ\äó_\ç\Z\ß¦£ÿ=z”·)\Ç0¬Jg§`9µ¥KÀt‰NÈ‚¸^‚H’\äÍ— >’?2”J™´d–¤\é\ìi¸¾¾\éŸ#9AûkZf=%i©HS„m&§.\éš3Øˆe¹9\ŞöZ‚\Ú,øZ<’tdQ\Çx¹V\Êj£\ÖqÄ„Æ½\Ô\ÃÖµ¡R\í)¤IY˜j¶U.\Ø#û²3æ•\0\Ê_\àLs:l\ç\Ó61#h•^À¢Œ#ó±Yø\ÕÁ\Ì|²_qASü0\Ä#\Íİ¿uğ”˜9$\îs£û\rT!».©\å{ˆ\áÚ‚\Í\Ò\ÌwT?\ãQÌ·¦\0c.,j\Í\r,¹6wôzo£\Î\è\Í=\Öh#\Ù\Åf24jÄ´AJ¨¥û\Ø8Á>\Ã>)£»¶ú\É4c…ş\ÊğÀ*nó^/Ÿ=\ÎK´ˆÅ¬k\Z¿	\ŞwVñ\â!%zŸ\Ì\ëP-C/‰\Ûğz\r¬#Èc9Á$¹#ñ*¬\\Ü‹u-\çƒKc\ÍK\Ş¥\æ­fş—e?ğ¤\×PG\Å–„\×J\î-w)°(WºV\rˆ¡>Ü‹f\Õ2dõn§,\ÂbË¥D­&‰·yŒ\ìş\ë8VEûd\ÈJRK%\í}{ß î¾§l«‹\Ôû0¥ˆ0*\ä]€œ#‰Vn\rE\Â\ål{2Tuz\è\İüAV‚\Õ ÷ñ\ÛÆ²<\'	$‘‚‘Qi\Û;½Æ¾€\å®p\Ã*=‰[4œô8óG\nô\Ò\Ñ\íW\Ã9û]0doğû&‚lw\0IgıW-üo\Êô¦‹\ît×´Yp–\ŞiÎ¦ˆp‹A?¤WŒ·gU\ÆDc\\\r“\Ü\×5\Ë¢\ÏU3ğ4‘mM\r•Ä¶E\\?“Q ·<\ï0¾’\ãœ„d$\ŞVKµ\Ş¼Ö‡\Î\æ4w\ØSª\æÈ©ˆ„HK#mö6\è\é®\Æ&,\é\Ökñ9PÓ¤maû\Ñ(^\ç\ÃX*R\ZŸ*\Î\Æ\Å\åüV0»ñû\Ü9¿\Ó¼ø„6*:‘‡P•¸l>;–¢\ÜÁ\Ñgº\Ç_Jú\è\Ó±°ö\Ö\r\îª\×\ÑT\Z\í\îEhU“c[tk\ï8‹3>.&N\Ö2?o\ÊV]¿ğÔ¯¬Œ\ä”­mÏ•\0CÎ”ƒ]²7\ÚIª\ìwÄjbÑˆ\êlƒfrz8Â”/9wy“»7KA¾½Š¦Ì…\çg\Ã4vÀYDrÇ¸”*\ÅÍˆ|&+>°:¾ùÂ•\åjbk\æĞ€\ÉZ¢\Ğ\"}A\Ú\ÉA£¿¿‰,œ“\éa~±P\Î\Ğ	¢¬\ß/zGq¾\Ç@·‚$nA‹\Ğw¶\é\Êl\ß7¡I”[µ«¥cB9‡r¢L2\éa\Ì+u^œuƒ,SHUXJeşT\Â.TSj«µ«§ÙŸJòwğ|\×yûL\ïs—·\è.ü-_·kG*76\ï‘3+—Ô’€ZŒM‘™ø\Ñ|„/WRß1©k*)¤Í‚\éL?la?M\Æ`/ÿ\Ë\'c(\Éi\'“8\Û=%˜\â\Û8iP<Jn—P3„Ì—2c¢\ÊiÀ\"š*¡\Ï\É\Ì@T\Ğ:ŠP\î\'\Ê\Ì»¥\İ#J\Z³¬~s\ê1–\Í!©ûl\ß=i\É£\Ë<\Ê8ˆTl$\Ø_¹cLf„”O<Õª£û\Õ9ºN\Ø\à\Ì57©¬o\r§±²„\é*6\Ö\"\ïi¿®`-¯\ãyGEg¶\à†\É\Ö\\O—Ì%\éòV\ä4\äer4h	\é\\)\îşy\à·g	B&ZÔ¿w\åQj)…£„l?÷Ö—ÜºÀ´\İ0*¿^g”\ãŠ2×¢1Í¿M0ÿ\rU\r/^½Š\ç>n¯~Kˆ^õWx¢f°\Ñ\Æ\äS2—uõ$\Ò\Õh+ \ïğ@;`5PÌ‰\ÄÛ›!Š‡79Ì™\îÛ›c\è\ÂMb¿´\r\Ziù\í„ğ‹7úNÈ›š>„ö\ßPoF¸A\ã¿\Õ\äƒò\Ìò\r‚\"¾	)+”\ÚôÈ˜ö¸Ú‚Ñ¯\ÎNŒj¢¦kô\Å@C‘\ïü\ëûmÌ¼Ö‰\æ\Ù£E…šc\Ã|\Ò\Şõ\ÔI\É\â\Ò8\Ç\è”3Ä¢.ø¾mmU(\Øt+²j#1†ısyœ[\àıe™Ì‚\é\ÅN•\0\ê\ËM¹’¶¢‚©\ï\Z·§…	zT\"…º=\"\Í\Ş\\\Åt9\Ë7\ã\ÑlODùò\æ\Ôıv\ëˆ\Îõ;i(@\ÜWu|1wL\Íš—Á.û¤¯±ò‚b+=\è+‚,\Ì\Z‚§\İÉŠO{wi“ú\æ8¡Õ‡\ÚA\å\É)‚m\ïß®*#D¥òû \Ü#\é(¼†‡ª¨\Ú†I¸d°}\îõo\Øa:£ôJA\â§Ù¦Œ&³<\"h(é¹¾{µ?+ø\Æ\ÙÁ×…&mj%\×U\\ÌUTW\æ¹\ÒI\\,ƒ\î‡U²!W(…\Ú\"\È\×\'…ñ’Q.……n(c?ªƒŸ(#™µj¹RÑ¶t<Ta]Ö¦]zÇ®\é¢ú†\ÊGÃ˜?8O‡}£(©kD+¥\ØyšK\âc†÷±’D\İœƒ\rrªm±\éU9€Cğ”_mNÄŸJãœ¾”¢\ë*4Ç•:ñ\â;<—‚XHe×±\ÛQ\rs\n\Û|@®¸vú¢\Ê;ls¦\ÚöĞŸ7.•Ø–\ç=-l\\F°]\ÔW\Ş\ßì°šO—ü´¨tq\î\çò¬œ\Äş_6D……\é\Õo\ê¡µB\Ùò‘÷vl\×\Òùn•!=\Î6\è\ì\Ì\Ğ\år\ÍRHŸ\Î\é2\Æ\Ü¹K)“.dy!{÷D\Ü\ã%\Ï\ÏH;¢øMRJaf÷\æ‡`@\Úh¨\ĞD,£“‰r\ï™\åUj8†6\ê§\Ãn‰\Õù6\Ü!\İcKe “d÷S3¯r±j=KŠg_^pÚ‹dÃ²U;\nûx‹Re\Ş!r±—Ho€\Ó>?\ZOµnC	\æ°+£&Z\Ç+ƒ\Ë\0Rj\Ü<€\Õ\Ó\Ä\Òü¦€R—5&ÿ1\Í;29—6÷\ß\ë\Õ\ä3ûÇlÀ{ 0Ö•ª\îA¸%Ş“œj	\ä\Æ\ÊY˜\è\ÍIğşšF†d>™«ª§„¢+\Ç+‡ú¢³9@·µ—\î™+\Õ n\ÉW–\Ô.V±\í6hÁJ\'©§ò¨¤À*+†¶bi\Öø*\ê-,*!\á²uX\ë].c0\'<½L\0ö!Q*5!­7Ê‰‹ŸÓ“ö’Vm“ş\à03\Æ1?±ˆKb¢R*\ï\ÄÿIK\ÄaóIS¸’÷’?K°\Å	}8¤\Øt¾`©”c†z\\3—&z­Z\0òC¼T\ÒJ¤ü5’pQTMó\ß(³` \ØeW°\×\ç‚w¸{ù-zpò\ÙR<4ª2ú‚oôZ\â\Ş4i­0‘w\ÒY€°\å\İafÓ£\ÕÙ½<\æşO\å\ZV\ÜN\êp(\Üá«9\âyL–\Ò\âˆ6R‘\Î:\ïş=²¢\Ûsßƒğ;\ßÇ¤c7v\åW]w\é\ë\áIsDN.`v¸\î£\í\Æ~£öˆÀù¡ß½ÂdP`´\ê*­6„6.mOO\âØ¹¯\ì\Æùv5Jø\Âj\ë¶Øµû£“\ÍVF6¥—4®‰ª0±–¼\é\Ó‰‘›/–\ÚHP<µÏ¦¨.+Y•óò;>‹%‰Sûõ<GbİŸÜ°.ph\Z\rouX\Òt]A\Å\ç{u\Étw]\Ì7oş\á[¢L—8e,TEº^\ïmdº\ç\Ş6ğ{‡DJoÑ‘öU\ÓTı‰)0½\ã\ï\ØıXh‹\0‡¼¯i›ÿ7§•&%-õ·ú\Î¼\Ğw®w!Ÿ¼ ^la+Ã´\ç6\ÖA^\ê-õy§Õ‰\Ês‰\åbù\ÊnÃ«n¬ˆ1£*D™W±\0.f.4\Ñ\íu\'iø…ù¦\ÛHOeÖ§Ÿ´OÁªD\ÏLØ±v\æ\ßc‘§/\Ü,-zmE\á¹0\Õ}F:	Œ\ä\'okx§Ú¹:\äiE \ên\ã*Y\Ë\êIı+Ìƒ*„,ñ1(e\ç\Ç7—ee\ÏG9^²tE\Í]:0†/;Ê»U¾÷QE^“‚‡/Z\ÜD(ü1»\ík\Ñ+\ï4¸80+yœ‹gl\å\"³°püı³}‚É¬FaU„°W\ĞX®\è	]\ÙV§¼™¬R>n}\Ó~uô\×L\ã‰ÃB\İ8\ëÿ+h:¤4ö\\¸\ÂT˜\"\é?B¶\ìQ\Ìø\İHÉ£w¦3/^õi„\×\İg©\æÁ®©\ÆF¤0/ø¨‡*¹§“&Œ¤U“†U¶jŸ\Zsş‘H—0\Ğ_s\ÏhõNµ\Äo\ì\ádPüe|}ô\0Po^O0\æô\Úõ¢\âh5ROK›\É]«—\"+\n\ìBˆX\Z†x“öó;DŸ&O\Ôa BIºk!\à˜\ár>¥tı+¯ZO›/£’\Ù\éôÿ\ã6\Åiñ\ât¶Ä“VUg‚±\İd{\ä\ç0=÷ w´R‘\ëG\Ü\"t1Hö•\Õfşº`@ª\ã`\Åsğ”¤\n.øŠ:\ZKX\Ë.ˆ95$\Â!Ô’Y\í_jKD\ĞZ•¾\ëYa¼ß a\îC\ÚvjT\áq\Ø?¢ß¹|€{_\ï$‚Uòµ\Ì\ì~T\Ğ\Ô\Z×Š3„Mµª‹–VôTKh\é\Î	\İ:\0M7\én¨8Hş;W¨ \é~\"|–¯£\ïÿ\0JD1K\â™]\Ó\Â\ÕÎªw%+¿isõ­Ì½iùr\í>a\Z7fs…$ğbi«ğß“Á\n‚NÁt<K\"µ\ì‰nGI¹e[³^\é˜û¾§t)	¤ô²}ÿ<³s%O5˜\n@ò \Ş\Ù8\Ë1+|{¡™\Í~\åO·v\ÇC3/\Õ÷#E/\áOT\â3€\ãôr±³=w&Y]ªA\Ù\n3 $÷\ĞH¢\Ùw&¨)óÔ¸—dÜ¯\ÙÁ^¾úøU\á:b\â\àS¶…ôP´%ög\Ü\éQD\ÕQvª­§FZ s“\ï+²\Z5¥k¡aò¡ò¯Ù±{ŠÅ»Ø§\ÔX 9¨€’“\ê°%Œ9\åÍ¹òf\Å\Ï{\İ\â;¡\rüBµ\è…\"\íl‹>š\"M]\İ\ÓõRŠcûM~\r.yKxH\àN}L\è\Z¡\Ê¡|_‡@GúFó™ir3‹Z¿\Ó\Ú\â$@Ä¸85³\Õú–£$\ÉÓ‘²uDaAÙ¢\Ù	·´TR+)P|\Ãfuv]š\Ó\Şe\Ü0xÀZ\rT“ÓŒtS\Ì‰ÿ$”xù§øÀxNf,À}š{R‹z¡®d¿\æÎ¾Ú°\Ö\Ö9<‚•ªË™\à~(~\Ò\Ì,J?\0\èŒù–Ã…\çFvQ„¯*¸m`ÁGÙº\àW\àX0\Æ)\Ş\Ì\É\İL–ˆ>\Íë¸°‹ò,™b,\×03*%\Íıç·N_\èr33\âZA\Ô+üB$\Ö\Ô]~\Ï÷ø\ZT~²^L\Ï§³~\è\Ñ\ÌG}\é\ÌË«œWc“>­û\êıC1£JkÌ™ûl\Ãb;(^Sw#\æ\Ü«°&k\Ì#\ë0‡–\Î\Ò1!V¹SGx\îb{,`ü j<qƒXuD‰œ‡\ÄR\nµ\\¹^I°èºŒVc!´r½\ä)\Ïy¹2´d%TR–”H!³²\\[\Ä{ÿ\à“0Jù\ÚR¥ôa¿Š¥®­.W˜A±\Ö\çòÁ\ÙZRÀ¿xs\'ú«X=}\æu©d#Ã¶\Ó\çP9¦Wp	2Ì¬„FsŒ–[/\Ú\'ZXô¬Ã½†j\Ğx´ª\×É˜o‘«\ì¥‚ö[x®Ha‰ˆM}\ê3Uğ…<\ê([#ô\ë\Ô‹\Ô\Îì£³\Ø\Ã\Zt‹¥\Ãó®\Øğ.\äfhuTÿxf@Gªt\İixvófù} _\ßÌ‘‰¢‡N\Ó(¿8¦˜€º=“\ß>x4¥ ±ƒ;\î\Úû\Ø!u\ÏË««¥?\nñv}2~‘cV\Ï\nñc¸ı\nJû°¨s[/@ñ\êı†©\Ø\ì\â\ìŠ\ØlX*AN¤c\Í^ö(°·d•\ËFuÀ[k?…\Æ\r$)Ÿ	$¬\Ã\\\á»l‚#Ÿ¬ñ\ÈOy:÷Cô×›Q«_•\0—²W{•Àp\ã{A\0‘\Û\ÙP—o\\œ?\Ñe\Ùw#@nñ½ˆ+\ít›S/5S˜«Ua<\ËĞŒF\Ï(‰\â_¢ªN§¶z-VliT·\Õ|˜¾ÿ\ì#‘,O\Ø\êÀ†  €IvR\Òh\É:pj‹¿?¬\æ\Ï\ÏDå·¥¸¼ş\ÉGñ1³½gn\Ê\ÒoĞª‚½\İˆt\Z’Â›W]­‹\r<»–c\r5E°›ô\ä¯\r74Yn\ÇM/ˆ`Ksi€\ã\Æ\Ù=7¬\ÅÁ2E«šl \Å>LCš”ò[+%^Wƒ\"©\Èû‘’4Ù»[·Hº~\Ç\éÚ¯“?\n\ZFN\æ€\ØßŸ\îÔ”N=ñ®…\êƒH¨–\âÀu\ì1jóWPÌŠ\â@mf\r¸ù\Ìp\Òñ¼\ß!£f7R\ÄñÀmuR\Ø\Ë\Ü!EM¸ñ²:™i*\×2\èL(©@MxôvXJ-\Ç+\×]ã˜–\İÎ¿\ÖÁñNWLô{\'JÊ\0™\Õb«*Ñ­L{À¦u~=l\ÏGl³¶E\á\ÓmKKº»\ì\à\Ò\ÙRV,§\ç\\6­w\ã©)º†w­\Ò\äøÆ£ğ;+X	Y)“¸i}Šÿ5\Ó5	k\İ’û}\Î÷\æ¡\Ï\âIpqc^”\à¨\È7 ğ¿\á\Òt\í¼ƒB«#¥„D\æ	…Á\èÃ§Ì‡\æjgn%P´1£\Z\Üg<“	òû§¾\ËˆU\èg†l6öŒ \êq³\áZˆù~ªG~\'\Î\ã\ÔUr\ï\Â\ÈT¾C\á\ÖH£\áŠôzö–;0\'\íµ\Ó`nE²(PÑˆ¤æ‚¢÷+wZªK\Ğn‹\Í½Yÿ;÷lSw\Ö\é|©m¬\âü±5jmD\n IW>_:Hø¼ °¼><h$\Ò\'|¡a2³.ì¡¢·\æ\Éü\È\Îay_)‚h!F\ÓÊ”/	Šbó\Å2@?qp;b~\è\ë»^õ¼\Ólr(µ™<\0G¬.{\Ç\Ïn¸d”ğ~Qgÿl^{Gÿx:\è]\Şg¯\éJ«÷j\æ‰7ã§¸\Ñó\Ê\İ\ë\çu\ÜH²\ÑG\Ä\Î…\Íòòq¸&\Ä÷m\ÔtÓHµB\ê\Ën\éû1P¶]¦K\Âs“¡·\0|€+\Z¾¶›\×BõIyOøŸ,\è\0G„Y\ädI–\Ğ\ì‹Ç¾°²­$\ÔÀ>«:°P\Ğw®\ìˆQ¡˜˜’7‚¡ºe4\ï@¯º4.¾3ui\ÒI\\Š£Î€EN\É\æo¶º‡4TÀºJû\r¾\Ø\n7\Ó\é„Î›/¶\Î-&û©½\\\èe;Ø´1\à#\Æ\ï]·Ô°6\á~WŒóşRy\è4\Ğ3š•oá²ˆRu3J^p\ZşªX^\Ão{¶Q‰ˆ{rüC\ÖF{=Y¡¿?^\ÙõvZ€¾¸\0†\0:=³\rK&M)\ä`\Ây’ZX›\Íô\\¿œ\Æ\ß\äs¥\ĞW¼~MIO\Åae\ÏiÁo	oâŸ•Q¹0÷–Ya†\Æ\Z§J\×–\åau\Âò\êİœrÿIz¹ÿ\æ!\ÊÑƒ!-Ï§\Õ\â\ê¤!gñ‡KŠ©²Àğ\í9õ\Ô)\Õ]Á¶…}÷ ,\Ç\â\ìM\Ö$ pş`³\Â0RŒSCñ\\_#\â\×o÷C®º\Ñ3µ‘\Â<Ì”ƒ«o\Ù<&\ÏqH\0\Ï\éµqÁ¿+l\Ú\ÂBƒ˜\é®@¬\Ó\Ü\Ñ\ßn^@ò\Ç\É\Äù»€Án‘.\Û\Û\Õh=¨t1\0bújY42!\Õ]!\Ü~|+\×/\ïct¬Fµ©\0‹?e±\Õ\å¹Æ‚ú/\ÇmfUY¹q|®T\æs\Ô\Ö\ë7ML¨÷\Â^;§ù2l\Ìs\ØFòfA>¡³ñş0«ø¡67†\ìI\ã\é\ÕòF\ã?§óB\ÖHñÒ¤,ŸE½\ØiÍ”\"\Ï><ú¤Ez´/\ä·j©4ºè•¤A\Év·•\\Ú4Z\Ô\0,\nWş\í¾?H•\Î\Ø\Æm\Íø™\Ş\ëdQòu¿Ô¨ß¯ª\×^JG3¯1/…\Å\èš`\ÄÑº7´f—l\Óm/5w\Ô/{?I†¡ñ\ÑDW‡¸=Y‚#5\İ^\Óp¿0ü\Ú^\"ƒNø}ŸœT\nY~nmhwó\ïöx=F³\á}&,p\ÅJğ0&Bûşş\Íi\îÚ’9\ânY¦\"³Øˆ&\ê\Ñ;˜k‹\ä;A\ÆE\å¬\Ôr\Â\á€\æBY[›°6¬G8f\Ñ\ÈÖ£‰<&´â„oº\Ì\ÈŸcSÛ€csD­f5søûX\Ù(É·‡\å\ëo´_\Ì`¸$¤ÿ/·Yj\æ[\Ú\ß_¤\Æğ-ñ2ú¾\r0\Øt¡^£I<\ÌR|®\Õ~±\Ï÷\'†÷&,¢\å\ï¡\ÃN!.¦\Ğsv6.¶\Ã\Í\Åu?\Ş!‚Œò\Í~\æö?]À%ã¡¦o/†õ\ØA\Ù\Z­›2kÓ†!DY“†\ášü8R¾x\ä\Ã&ß±\ŞÄµd,ŠM\Òòk9ù\Å\'™I”\à\æeªöû¿V\åõa\Ö\íHñ³¨k§’ñD¼9Ot¡_3 \Ñ-»+­¥\ævd¤\ÙUM\ïZ2\ÒLª55\Ì\àT2\ãÜ§x\èlY9å™²egBwğwù\ÑY“Z.uV„\ÌÍº\rªF\ê”b\×&œİ¡\æ¶\ê\Ùò¡\Ze»\ÏiÏ•\âÿ5†‡H’D\Ã\"ıXÅ¡È¹¼\Òä¤›¦2\02zÀ&®C*\è±\í\Õi‚\Şù7 ¯\Æô°´\á\Ï+\n_&U§\"PıÉ¤‰!ô{¨ºn¶us¶xA\â\Õ\Ó\æº¹À’ª‡q\ÜLøÚ£PúË·,Hblè›¬™©’l(\Ä”—\ãLU\éW\ÌDC\ìóp\éJ»Õ¯¸¼\Øp‚|n†k&f\î\ØÃ˜\İ#\ä¶\Ë]‘ş‰6)\ä\Z:rO˜\è–\â«p@D\Åü\ã\à\ây\å\Âz¢úŠlN\Í\ĞD¯“ªB\Ü]FbOÁ:\ÊZ\ÔW\íU\n\à³A\Ê+z—U\Ë{… x?øöWş\î¼\'W(\Õë‹ŸLJDNdnÿYŠs·À\êÔ†²ğ\Ë\×^eS\ãj¤?õ6^/qn 4Àv\Æ\åª?9Föt”­\ä\İÜ™\ëû¶\'|\ê\Î]]/>m\ê#r\îöÀ™Cö\êx³\Çfó–\æ–ºO4¿<\×~v\É\ÃòiñÒ½Àw£A\í\ÓĞªÃ§Àu>	I¬6³“øD\Ìfñ\âaÁC\ë!@¥Š\Ñ\Ùû}‹L•ƒ÷C/°J\ì/#»e¼|\ÓO©9V‰Q\Â\ï/!lœ\Ôyg6’L\éHûÀ\Î\å\ïx6ñv¡\"`s:ü &\ÜĞh\Ç\æX½„$,[²\æ§-\ÄÂ¯\ßI»\ÔN\n7zX\ÌU0)·D.Õ™ºR¼\Õf[?€c)³./ñ\ÌbşÜ½-jô1T¶÷÷Ö¹(\Ç\Óœó\ÌÀ®\íFJ)	\r­I\ÊÈ‹~\ë\ÍV:\\\äeM[u2œ\Ò\Ì<ü•‘aöù\Å(\×a\Í\ÍÃ“pùf,\ë\Ğ\ä\ËwŠH{\ï\Èd¹o\ÈBÛ’\Õ\ä\å²,Ì‰|E¾E$m¢;s®\ÜWªß€\Ä\ÉvjE]¨›½^uÛ©\ï\Ñ\Ñß°\æ5’q*s:\Ï\Ä‰\ì|ø¬$\ÆH\ã’7™1oxu\ëÂ„ü¨œ\Ò\Â`ş\Z‚\Ï\\W‡So«<*v»d@\Ód„@#ı\ç\ì[\ÄIİ­B\ÆT\Ç\ĞÖ¸ı;tQD<*:ÿ¨„\ï\Ï\È;\ç4\á	U*ıô9Á¤b¼‰ƒxlJŸ˜a*1NoIr\Ğ|Ç›ds\ã< A¾…Z\È\Â{¾,<\È\Ó\ìÎº\"\ÑÀ\æ£hÊ†@\æ	›e\ï\ë¡(?Ÿ\n*‡³0\ç\Ğ\ÆÇ„÷*‰x¬špá“±®«…\ØAö[’ rZ\ìô\Û#P\Ù\×\'\ísjVo³2¹\êy\Ç/\ÓúU¤\ß+ö\ÊN*\æŒd\Äk‡ŒcP¥B[h`9…Tzj.–3â£¬5\É\Ææ‚4¸u\á´8ˆ’9\Ş\ØQ\ÔCf‘{\ÕQCü—\Ö\×8o\Õ\Ú\èr\'Vû%\áe\"œ€£\ÇÏ…\ÈÚ»\ëqS))d\ÊS¿\Ë\ß.\n¼\ç>¾\ïT\İİ™’ŠSXjµ·±Lf\äd\ÍE–Ø¤s\éM&\Ş÷¸UIms8„FÀøÎ´ø\"E÷\r€\ÕÕ„X\Î³ó}\ç\\ÿŸ6HŒsjP\çi‘s›@Rbº§*×”Qğe90\ïL)Æ\ß*{/a¬ğ\Örg\ÈGFş\æ<T<+&DoLJ~À3¬2ˆn¨p»Iª¬\"$­dZ–MqdB\ësQ;\nd¶A¨æ€šııÔ¼TşŸ”/™9\Şr·¹d’25•9”ƒ\Ï|!(¨õñ š†\Ü[PA\İe…OK\Ò;|{ƒ 8ñ—°\nm„Y«\ê?+\ë-µ\Í\î_œ~‘\Ğ\Ówd¯¤Ş¥i+\Ô#¯@t\ÈC\Æñ9~1?r\Înˆ\ß¼ö¤\Ï\ËwUI4\İ\Z\ç?\Ñ`\"\×ñ«ø¥›şŸæ²ƒ\nô\æv‚L•E\Ğ¡-.\ÃhÀòfô\ínm¡%…I+“É¸=‡\İp4ZÆŠV¶]°ü\Éş0\ØTÿ9öpx\Ş|7òš_\áu\äo5ü™‚ó\ëT¦ªÔ‚\ÊOËŸ{ü­\Z—Ga]we+\ï÷|g‡´¥fBn!«™(ÿ%	PS\ÈJİ¨P†}\ÊK<3\\\ä\Z\"¾G\rJ/41›`_Ú¢1š˜µoê†ƒ\í²w6^§m0p”q|pB½9Ÿõñ\Ïd\á\Äö\'oÍŸ‹DbÔ¹\à,\ï~lm´°gşe¥\Ôz\é2”jöÀiL®f\rE².¥\Ø:e7\är”ó;+ŒÀn„K¬\æ44ô7N\à\ÖO-‚^¨Xh})BÈ¤¡JÖ¦u(.1™š°+üøõ¯1Eª‘K‚aZ\"\ì+\Ñ>¨\ä2ÀŠ¢J\ìšÇ¹\í3r“5Y|ˆ\ç¹\×\Æ\Ön\ä‹¢©{õ \ÔA®bM\ÛmO‘4W\Ó\ÈT¼Á˜$^¨V\ŞI“fo[\Ùs^W\Ë:0.\".\\¤Œw¦\Ç\\S\äa—%t‘±]Y%\\7\ÍAJ(ª²bc~<ü\æn„©\ÇJŞ˜zeFŒ¶A\ÆB\Ä\ã\Ü\0»\ØT!\r)$7\Í8=4øùEüL\ÖT“Œ\"]\\™e™Ö…Y\îd…¡p	D¥¾\æÍ‚(5\Ñ\ŞÈ¼zOhºÈ‰Cş¡§b\0:8–KT‡\Ê\Ò\ÑAPJœÔ³¯ V|Ï\'\Õ\\\Êñğñ\Ş&õ\Ü:¸Œr¯\\F\î‡ÿ2jù—\ë¤\ç\Ì\Æ-»\Zv¤\r.R€DEHŸ	·>{²``JHfñ³\"U¡\èZo*¡ŠˆN_\â—\Éo›lôpH©ñ#Àøm†hY*e	¨\åAB0Õ‹\Ì\'ß‘È“ˆ©“m?iô¤6¦í…©– ğš¿Ê ¸bÒ¾s\Ô<T@q©©©qb†}iTG¯ğ\à\ÈXF¡&§„p\Ì¿\0»\à\n†¥\\\Í\Ú\Âh\Â<úb\ìtQKVnœñm¾]b\Ô!–¬T«4gd\èIÿ-5Cƒ:ñ\ÎlIoı\Ä„Ä¢üı{†\'¿øOÀ%’h‰š\'´Ÿ\×|œø=ÀğÀôB<–œs\0QQU\í\ëØi43\ä—ö7‘\åJT™=™ƒYMË¬’ªMòıY§\ï){H‰Y8AŒ9Œ÷Š\\‡Å´\É \Ú\Äu\"Õ¾\ÔÁnÄ‡ÿqI9\Û4•ˆ¨\Ë\Ä(Ÿ\Í©\\Y±8(Tu“ \Ü\Çwa 2şe¦_\Îwµ‹Ô¤e\Z\Û,~¾¼E,YJzâ…\r÷Zİ†‰­|)O×ˆù_2#sÁ7ó`Iùe¢\Ğ=1—»O\å‘\\\à\0vğ!52\Ô\ÔX\'7\Òı\ÃN\\¬¹\Ç4\ì\Ö/\ÏsO[ı8ƒY\îY\\\ì\ÖòYa\Ù\ï[; „[a\Ã\ë\Ò\Õ\rÿ‚ô1m\Ôé†ŒÍˆ9\ÛXü\é0\ëP\×\ÔRùÀX\ét\ÌJ·ŒXl¿uü\êd,;\\óº‘\ÔZp¸\0V³/m\é\ZÙŸ\ï‹u²ó9Ts¸“JOø¹}]‚pü¶Àğ£P*\ç8¼@Iûi½‰µ¡`³³ó¼	\Í\ÚØ©\ì>†*q0\Â0·©¼\îY[—CDk}Iâˆ*º‚\Î\ÖTX‡‹r˜\İ\0R<\à¶$t‡ú˜\Ò\è!½r”¦Á1NCrs\áDnŠ…To!)´d\Ï\r‘8îƒ¡!\çûü\å\Ík$\ÄÿÕ¾8ªŸZ#\çGº\Âm¢bJrıÈ“tÏ›\rÍ©\"I¦n—…<\Èc|\â}‚Eù\r\à\Ì~œ)ˆ\ÄO:qdJ\çl;\é6“!»óšô¥%a­AzŸXR\Ü\âH‹©\Ë\ì\Û^ò*c˜\ã¶knq0°d{8Vlÿ0/ı¨óñ¦–ó´±8©Zra»ğ\ëwŠ[Ö°U‘§ù—\Şi[‹ƒ]V\ï\ç\Ù)­^Á+¦X™ˆ>ƒıv±œt\Ù\ß*“ «a i9q¿´bºDUq\İS%:\ç‚\0=†\åˆC\Çrß››d,†mÙ‡\áN¨\ãN‹ùTo°û\ãºkş´’ºıOx¿Hzbƒy>Æ”*MH\Ã mZ\Ùq\Ó\èòÙ¤\\H\Û\á‰nq.	\ZH\Ş%³\Î,3\Âj\È \Ú]·?¦…B­*¢\Ó(–gøZ\Ô\â®\r\á\çn‰v}Ğ…0\î·\Ù\ZÇŒ\Õ\'pmÁD˜\0Cğ\î\rÛ\é-ÁµI@\î\×%\Û>3\ê*>lú{,qT\ë\ìy™\Ék’€‚3ª\ì\0 À$\Ó(ú_>A{\ï\âw.fqûpÒ’…6~*a\'h\İÁİ— ß’\Ñ\ÊeE\åPôU›€\rùZ)mƒµ;…C\î\"\rg26‚OP\Ú!\0§M“\áX\ÑNwf,k©¨%6±„^¦ü\0¨Œ‘\â\Ş¬~z\Û\Z\Î\ì\å8\êD> \Ú\Å\ìa‰•%\æğ÷™T ¾ı\Ü\Û3ó\èa\İ/imI\ä›\Ü\Êâ‡¸I*]öSZ\Û4j­L\äxõƒ %\Ù\í D’´\Ì\ã\çW\"\æ”òV\Âü<¹\'­\0«¨}“T\í­a\áÿb9¶3¡x	³­õb¸h\íÔ«´\âk\É\Ã(;¼vÕŒ¤UH\Õ\å\Û\Ã}$6?H0.Sr\Üe\ê¦\Î\Ø\ê¢÷ûõ}\Ã)ŠYCjXrd‡£\áÀYñ¦\ãŠ:õ„…\î†ô®š$\ã.92°\Ö)%\Ë\ì‘úy\ì\n\Æ^0ºú;t‰R\â\ÒF\îşù€s\Ö%[H=ˆ2vüûµo\Èÿ¬o\Â\İ*\á\È>Î¼\Û~DVõ\Ë\í\"A\Ë$p\Ë\ë]\0Ñ«±÷\Ò\Êt\r‰Ã®\Å2O	ƒª™“2°\Ñ]ü•Òµ^°š?T½[!w¸g…¡;\Ïôƒz\ÚXØ¸&\"3Â»\n\Ó>\ïœ\"kù-\ì\Ò\â\"\'Ál\ë+\'8w\Ãô‹R\r@:ğ\å\Ül\\B\Éã¦²Õ™ò¸,R¼¸&«\îßŸ\è„ı	\à@)}±\æˆ‰\"\Ç\ëúrì¥¿\r\Í^1?\àğF¥«!\ÎL \ç\ÔZ»%\Î!‚ 4QÀC¬ú\å€>Š¥|õ8÷•L\"G8›…Œfe2š·{)‡^GóªˆC(\\ª¥ƒÈŠ’2‰“õ×¤6fû;ÁSœºr¡1~-\ê]Šbgp\Ü\Í[ŒpW\ÖR{E¸ó@H‘|”,g¦ö(\Ü‰-º7=z A\æ\'r¥MZk¯[Lp\È=¤Hse\İ\È/ÿK\ä„q¡\ë\îr¦-\Å÷£½Ø¼3ô\ëGCj_q\Ç\Ğ;\'\ç\\L™‰­8²\Ï.B\ÂLŠ\Üz¾%1¸`.˜ˆ)\Ù.\Ôğ\Å`>m!\Î~W\Ñ\Z(w©¢«g\\\Å\îğK\ã+O(\Şy‚PµN ^k’© B·\é\Ûg}g\É7ˆa‘‰9\á\Ş\Z	q8 Šœ·öŸ`§™\ÍK*ER\Ù\ÜU\Ûü	Bl­Æ¾ô¸=\Ğõ\'ôé¦¶€~Œy°I­n…€\ÙpU7\ë\Ìø‰\èˆ S\Ü\Ô|\"Š\ß5¶[\êpC\Ğ\Ëx¥\îO\Ó™\ên£}p„Z(1ŸŒ4(H\å³\Ùp9\Ì\n±	’OP\êUQõ#PxR»š…·VY°ó\éå¿´_ı\rH%\Ò08Eg	\ÆFc\ÂÌ—²\íüøŞ®šµˆH½\0¶1°\â\Ë6mnğ\á^\Ì0\á\æ\Ú\ç£q\Ş;®\î4\Ñ¸£\'b\Ôğ\ëu0¸\ìtÓ»d\ä\Ê&9Y\İ(@Y\Úß–œ¢¹’0ôlX_¯C‡¥\0C‚\ï18\Ä\é‰Š\ç¢¦¬\í´\à\â\ã.Cg]AÂ€M_87«7BUl˜’®˜\ĞL\'\î–vºb¥j6~ø¯ñ±wı\á=ş›giô4L×„üYrµé‡ŸM\Ã\n¢¿–ÁG\ÙfNİ”g[·@\ß¯İ\Ò#ı~W÷s´\ä0@™	×Ÿ¾#¥<Ş®]ô¹”{¯$\È{•X2l\ËCV©ˆõqKH¸4¢\å\ÓğGh\ã\êk\ê¹9Ÿ\Ëş\ÆOxó\ä\Ş8‡ø¾`ò!)\Êl0\\…\ì+Qm\Ş\ê1ÀDCW\àş-1|	e\ëaU7V-{\ëÜ›…J\nz\Îp:\\~\áVbg7°ò%ó’TÁ\ä”\á\Ê\ëº5J\Ä\Æf†ôµ«\ß(f\ë\Ù}\ŞAœ\ß@d›¤a»¿x\æ\ç\è;Ay3P	c&)t\Ó\Ç[”«ü1UÀJ\Ûaaÿ\ïN9O\è\ĞÈˆœ1´G\Ú}5ûb‹	L-\r\çq\ëPMŸ§¥¢d¯•\Ì,w›ˆ¡Y_yÂmŒ¤\Ş\Úñ_t½\Ù1Øœl	\'\×I¹&œV&<œñB6do¨\röw?wu`G6Yog°óıÁ¡İ˜ª?÷LR°i¼¶¹?û[,¬P‡\nG*¬f¿À›õ„``’š$ª\ãYM\à4§m`²\Ò <\àMñ•l¡«ÿ·+¶\İRœ¤&da7„ĞˆqN BsCVg,\Òø]­\Ôd|ò®7ùÿ-–Xõ[HŞ¼ˆ(’„ñŠ\à\ë\æXs*k>…-\ÑmXxw¸\"Ü¬K\Ã†\Ş\Ü4:\ä>j­®f\åRı±½\"³Hiø\ÓL\İU=Zv¬Q\Z9µK/£Hmt‘O4\æõ¶SSî”J\ïizN\İZ\Êõ¯B„\Êû(\Ãô¤\Ãøe\Ğ\Ù[Wsô«Uõ‚8•\ç˜\ÈH…|óYAo\ë2€\\¾\Ó0ı¢,9\Ã\Û\Ñ16Yø\Ùõbû”-÷\çıq\ë#\Ô\ëh1Òµ¸Hl\ëe³\Æ\"œ¿{\0wVq†ğÊ–\æ=O‚Qƒ87œc\\\×\Ü>¬\\z?ø9\"\ï¶\èq“6z>Z¨\ä \ÉÓ³m´u\Æ;j\è‰\Ø\n:\éA\ë•\çñ\íúõó~²\æÿó/!Gÿ¦øù$VÄpEK©°\ÇÌ”.o‘f@M-1û>S\à×¨§o-ÄªŠş\Ô:\n<<%Nx\Ë=Y{q\Ûø¤‰¯—\ZLºæ££‰-\ÙpB¾–b÷D‹—·\Ù«*}¹Cƒ@‰P\Ä “\ÕüºszVn\â¹\Z\İ\'\ê¯\á\Z»rV.}\İG&~Lq\rÂ£¦Ÿc;,ÁÅ-W•µ+õY\nµp§„%\ÆqSõqŒe\ë\çjUs¨\ÕR\àjŠ­\n,±¥sq\ZBóOñ•®$\Ò1k\è\âl‰œ43\ê‰k09\ÙˆÖˆ=^ŒR‘fO£ôL‹\ßÜ‚‘Y\ĞÄ\íœ\Ó\×g©˜J\å5\ç{N\ŞJ‹\ì\ÂUú„\nT\ÉB|³ö\ã+\Û[\Å\ÈD´aºò˜À—\ï\Ë5òóŸªT³-·qñ¬ñŠ]P\Öñ®¸dP\Ãû§y+>Q@i\ÅH=z>ŒLº‰\Å\Û Î˜#øO®bYJÕ¬/<y>ü$wE\ä“uv~›R¢ƒ]úC\ãÃ±2s\0¼\áP\Ğ,­4¬×–\î‰\íw\ÇdŒú\Ñ\\Ñ²ñŒ2\rA¿÷®~&\ïO7[\ng\è©%\Ö?²¼ˆ\ìğ‚\ÔZı~ùŸB&w\'Šb¹0˜ •l\ÑQ,(iA¥ş-xŠÂ“•h\Zğ\Û\ZC5\Õü¼x\Ôüvú~;\İ1qÀ^\0º!‰vf2¬˜°?g\Ü®	V÷\Ú=l°\Î]ÁŒòNœö°wH§À\İF\àNd$\Ñ80O´B\ã·oò¥vB¾ŒS‘uKo\Ì90ß°<l‡XŒtqm›m³z<\ß\Éq¸Ò¯w=TË‚Ï«\\1Ñ»z\Î\à\Óú¿6N«¤®m·\Z¹ğ\Şy–\rú5jO¨“ˆ	dŸÎ¤\Ö`½İ§¶\Æ!DD©ı\Ì\íôº\åNÇŒ¾·{[‹t…h«Ay\Òur&Esw.ç£¤\ØU5Á¿ö?ıò_Yú\0I!”ó„+E\Ï2\\şEy\ß\\@†¼·¦*òÌµ[†…\'g‡\0\Éÿ`¦Oô\Åi¾|\Üš,­´²‹Àw\î3M-F®ú‡³5²ÛXb\ï(ptYw]ŸFA7¼¾´‡t–8Š5÷\'-\Øyšè²¦pe¼\Ù5Pùô\r+Í£¿¹(\çğñIøb\Û6\á¾I\Ù(\'´xšœe\Ä?<HdB37£\à\ÆP\ì\çË¯ù,t!ö\'’‚\êOøiSù:=`W9ı\ÃM\ÒG\à’…,\Äx\ãs2°¸Tşó©Çˆ„V\Ä}v\ê\ËE\Æ\İ\r£Hd$S\ÓI¿¦\æ\äe*°·\é\"ö¬\Ï8¢AB/»FYó»\0G\è\Ü\Ã\æ;‡)_q\è‰ş‡[:!Xld\Ø\Ïpö‚ú\í‹|\Z@¿ÿ\ç\Ûe$² 77\"mü‰ğ\É\İ\0\Ù¹g@ª&*»0+Jv­ˆˆS³ø=+C1Zo#s@\ÃGLC\æd¹\Ş*–À\ÖOõ\Ä&]\îÀ½ú~­\'U\åÀu“ø,]B¶!ˆ9\Íd\Ô \ê;$.\ã÷k÷E?ix\Ñ3óî ¬%y~-N½\ç4:\Óo>A\Îyi2¾\Û~\Ø\Ë7M.\êGtTwU˜?!™CL[»À\Äó_3Q\Â[qB&¶BÀ½HÈ²\ÍS4q\Ò!¾\Õ\Íg\ßúN\È40\Ş\×X\ëq\ç¿\Ów\Ìg>y^š¼a¶\á°™9M¨LGM§¹\Ü\ï|ò\Î½|\Òz“umYØò´\Z.M	dñ\n\Ï\É-µ[’ŸM¢wYq—?•w9P®\íZEº\\Q+»ö\à®b˜ö\ã\ÊjóùR\äaDú?\çk>c«	nI‚\ë\İXG­\Ş\×\ì…/‰\ä\ì%VtnC}`½òqpñğaô\ĞXC.ò²\ë¹pÕ€i\Æ~y¥\Ô§Q6‡\Å=×®d“3}\Z5]Bİ­¸\"\"™Zhˆ+c=‰\Ğ.Œ\Ş}»óç·¾r±.‹€ŒLÄƒ¹¡bV‹¡€\æ\å\È(›W\í\Ê\ëŒ-¦IK\Ñú05R\ç|ñ©4ğ\Ëì°œa±+‹‰:\n™„£\çQ\Z®ò©w?„1‘\ãŞ¥ş\îT<¢Lµ\î\Ï÷­\Ş|ü•\n«ŸI±À)\È\'\â8GJ©I¢gŸÄ¨tI\Ñ4¶&tr—º\Ş$ny6‹8Rq¿3K¥.\àG\Ù\Ö\ËÁ¤\0‡9-™\r\Ê{®~%Û¢I¸ˆ/\Â¡\Ø<ŠÿWƒJ\ç\ì2ƒ{}ñ\ÌZÛ«Å©–L“2(I^	4²“\ã”t9L·¹\0\×\Øw\å!õ&ÿ«\ÊU9i¦*ù@\á@>Ax±.¥J-\Ø#Àø·y½\îg[¸¡p3‚Ë,}/a\ëJ%3\î±ˆ\Ë|Kj¹É’kšòÀ­¸¾ûe\Ã\ï\ã^K#$™¦\×\ç’$cP/`ğ²¨‰\Ë\ï\0M\ë\âoš²ñ\ï›Z½òW2ö\Øs”Zƒœe€I‡ú\ë\Çj°\ÔrAš,ıóò$?t\Şx­YGN¨Ö€I^\í÷&½ª\Ë¸«\ê$J›O±%hn\ÜÎı^\ÌÖ·^·\Ø{”\nc©Ù…’ªÿ\Çe¾@\É6²\Ö\ãB~\Öm\æ?ğr´}\É\n1%u\å¸º´¶C4N}\n\ë˜„\×v8\ZË•Rs›*·˜ö¬\Ş\Ä~®?P$jJb±U‰V¾\ÌÁş ½].\r‰†nP\Ñş7Õ”ô4*İŸ\êùöVZ€}\"¶p„¿‰\çeR\Z¹©\ÎbHE\å„X©HeÈ³\Üz²#+<7\'Ò±e„	¥]3	¸”f´tP\ÏD®ş:}¸ªX€\\Áu¾¨W:\Î\Õww/ıw ig<t¦%’\æ”UGA–i¤_O)~qó¡\ŞG2Å²ó\èğ\Óclû÷õµ~	)•Ç\ã¾o]ye¿\Å\ÓS\Äã¡­a\îYz\'·4¾¶º\ã^\ä¾dQò\ã6£2g“8\Ş÷\Òu´yà¦¦û§D~ùğú;¼‚‚xg\Å£ÆˆN\Ô&\İ\Í\àM@ğLU\áô\Ò?o‹º7S±6Ì¼Â–%£P\æ\Ğ\à«\Õ	ı\ëc©¤vfüZœ\äğxo¾Hö,€o?	¶–³\0€x\Ö\â{©Hd\åöŒ\Ò\äJù˜Àÿ\0\Õ6‹’$¬\ç:°ùñOasXV’:›\Z2©A†B¤Œù\èX‹MŠ±¥6\Ê]–^n\ã,±£7{kÁ\ï\ÜÁ%;~W\á£U¹«`Q l÷Šı††@u\äÉ¤‰/\ë\ß.$\ÏY¤—»\Æõ§U¤Ä­Æ—‘\Ô?A§o¯>½\ÔıDt\å\ï¼3`fª¡–zø}ùƒ[‹P \ï\Ú/“\à³\×kA8b@Z%\àW¿\ä]€µ\ÈD÷\Ò\ĞQ˜7ğ\Ü\ì\ÅcÁZ¥#x—™ğ€\â\0\æÁ3>§\ÓóÇ©vz˜Cƒ]4Ï³»‰€\rd*T,QQfªôG]õQ\æ\Ü7\Ñ_N\Úa”¿\ã÷”ú\Z\ÇŠ\ã·š\Å÷)†©ƒıüsş±\æ\ÈV3ù&\ãs;p\Ãiˆ\Ùt´ó9_¿Šö®‹d4\æùõKã‹¸LZ\ë¹İ­õ§95<—ª¡\Ò{h‹y\Ä\"\Â\'J\Z\ÑH:O\á-öÔ‚\ë\Åó ‘\'§\íé„‚šÇ±‰#\È\'f\çT\Çt¹\Î\ÕÁOıD\ï¬Ñ–ƒM6Œ{ómK H\Ò<%\ïeÿ gW¢r{/šŠ$\É.\áÍ±Œõ„­ÿ\02‘@…Q\Í}ağd\Ã\Ø\ÕH‡”\Â1œŸBğ\"3²û’\\Y\ã@\Ö\ßY>z)9¯K‘14W\çyGn¯\ãPR³Ì®RA÷++©Í©ş™q8\nl¹µ\ê€³û[•^#¦Y½S\ÅK­\åP7C°_\Û3\é¹Fe\êvK»öº\İ\Ã Œú\î\Åş\Ê6•e§\ã{Nš\ÈğĞ 2…\Îrªƒs\É\ÉM\ìXË¶h¹’\Z~:«u˜\íŠc&\×\ĞeEdöNA–l\rIO-\0n\"\ß,{\êt\î=!\ë\Ä\Å\í®_\Úğ\ÊiO¾¬{\Ù3\Í\ë\'¦f\×ELŠ\ì¢\íù¨ü¹uHF€ı\ât£¾˜i\Ñš®\r]99\ì`7\èÇb£ºŒ(\\\Íöh\Ì1dk·°\Ñ)B8\×.¸]>	’ğó\Í\\]Ç\Ô\İ0\êt¡bXr¨y	›\'-‹ô­\í\Äf»\Ò\ä·zÂ°-zE°Â¼{\äi2øZ\ÖôÖªÂ­‰\ÍE\\Ô£¢•¼eÁ(\Ø2AÓ‘\ç\ÖÃ™\ì—l\Ï7O„ œë½—\\v„ş!¥”›|jZ|V©Àğ<™À–\ã\Ë\0®ÿhõ\æòB\ZÏŸ©Çö8–‚\Æ\ákT ¯r\Ä1[]ò¬D\é¯Ku14‚s\Ï\ì\ê\Å|„¹düO‡¦ŸyX°\Ö\'@\Ñ˜\à\éø\ÜË³¶ş=\Ì*©¸Ÿ”€¦U\Ì\ì—\Ü\Î$.S\î\à\"G6Ò­r\ØÀ´+p3kğ\Ø\Õ5\ß\è\á@H¾÷ÿCBAø‹[y\êŒ\È\Ù\ë]\áõ´i~I\\•€“+ù\àòÚ°vj!Ö\Õ8R\æó®ô?‹Nóß¤,T¨!œšiQ\Ä2\ç\ÊÈ«úŸ¢d>‡n6¢ı\Ü5h\ä#\åB2d\Z<s\æ\ÃiZ>Ã‚Tø¨ğQ­ùQ(“ñğ\à <_Šÿé¶›+…\àg§‚ôö\'\é\Ğ{‹r\Æc4¨¤$\ï.§|)Qdn\Ñ-ùEfgp+ÃBHÃ­·dDâ†¿UÍ…‡3\ïñus‹ûÇŠ³¸\ê,+!\è¼j\ìŠÅ +±ø¦\åÇ•C2\Zö3jÙ²¢¤,ƒ|&”ö¼q!/ñ(¡\È8`û^i\n49èM„÷}²q\á\åh\áÂ¤\ë\'%ª“bH Á\ÒÏ€Y¬¢˜¡fnøP\':\Ôk9~Ïƒ\Ò\ï\ÏNÍ°h€¸^¬\ä:\æ‘ñ.¼“QOAñ¤¨Zw5­`+\Ş5’\ÉT%&ºDNJrkn»–|Zyz\0’\"C]‚«Ù€‹BF\àŸG®ö\â|\ÎI\ç—\âñ\Ö14\İq\Í2\ï\Ùİ¤\ÙB5\Ò\Â>®Ó°~{\ÔP­\è\ê\îyÉ¡‚…\Î,a \ÔXõ\İ2\nP‘¡:÷­&›oË´¯ŒL)=„v\Óll¡\ÂHemP>\Õ5\Åc¿\Z[‚»K\×5Á.§k4\Æ„‰\"\Ù0©»fN­Z»6\Ö$…sM\ì \Ñ\\™j”½–\ZV‰—Èœu÷)\ÒJ\ÎP\ï<&º\ì(jiö.l\ß\èõª†ªô@}–IEF¦}\ÔyyÈ†Œ%Ç™\ØAö[\ïA·eô\'W¢Èµ-w·\èl®¹tl‰,\n©\ÂEµ<¿ó±\ã*;«§\ZR\Ôç¶°\ÇE6yÜ†‘‰%D8\Ëúrb\ÇT\ÒL#0ü‡v\ÂLµ\"\Â\'’dš¨»£ğ‡m¢8Û«\ç”MM\Ñ\Êk\Óı\ÊÀŸd\ÓS¯¤4H©²U\ËD.\Ğa‰0ş@\ép\ã¶9s3JIZ²/~º¤\Û2±ÁœB wI\ÜöWa¶•f’¨ª®\âd\è\Ô9ˆ‘¸9»›ˆ7<ø|\Ì?\Ó}\Ù\Â\âwÍ¡w˜ilT\È^güµ\Ó\ê.›Z{¯„z\Û8kgx“§\Æ\ê\îŠt¡4y,CE`\éõ#‡€\Òòo ŒO)\Z“Q\Ü?ÔŒµo‹şŠ\Øi\ì\Ø¹B™\Ì\Ò\Ã\ÌFç„06\'\Ò5ù¥?\Í	n.z\é\Ä\ßz=\nˆ•\ÅF\Â1óR\ï\ÎÂ³ôû£J\ê´õ½Ï—e\ÏNA|»\êÓ…À#\ÃD^^¾Xşp\ÕU\í¬‚\Ëlª\É\ë\êAA\Z–LÓ±Á}\Ğ\Ø\ÍBƒ~]h)@\"ÿƒ=©n\"«C°š\0;‘º&Š\è¹\â[IQ¢ùó±Á\ÔS³>€ğyL)Š\×\Ğ…\íd7µ\å •ƒ\ØKôu¹?\ç	Ö˜L÷y\r•şÁ¦21‚ÿ2³\çA\É®;\Û\à\ÚöJ{\ÉpjS©†\ï\æf\Ù\ÛeT¡8À\æ\0‚îŒ\Ïrh\ÊÜù¨Tö@\Ö{/-‹E­L(¸ ¾’\r²£.\Ï?7Äµ\0\×\Ãhô	¯N@u¸s¹ñhL\Ê\ßz–£º{­İ‹@\â\Çóõ\ÔU3ú¾!öQ\í\Ëµl¤\åYhó²¹°E\Ó\0ƒ¡\Ï@$wš—ûX\Ï\ì_t`\áü635\é?\ÄE“\æO9>Cˆ­v_\'=·Kıd\é1|Ax^}?\"\î\Ê\æo¶H\í¸ÜŒ‹Z†\éS¤	§“2ÿ\ÙC/ı¢)ö´A)¡½\ÇP¨º3\Ç?\r…\Z\ç”5R\Zd÷ø\Ã~\ÕYBYT‰\ÆQÏˆ\Ó\r”7‚Ä»—Q;õ&[\Ô\Ü\ÇXW\Ú\íZ#£&ûo›‘~\Ë\ÒúM‰Œ9ñf¡‘\rhœ¹á–B‚ö%Â¹üÏ›;ú5„\ß\Ë	\ì_iÖ®Œ˜b(y{\n¸qÎ²\Ñ0\äEßš³©m+{{aq™‡t|n \Ë\ŞL€”¥9lš\×3¾\Üwòå¨·X\Û\"\Z›\É\n\Å\Æ‹şùr¾Ÿ8ñ\Â$\Ğb;aó¬œ=µ2`\ì\Ñ À×¡€è¡±\r}?{D<\é\ì¨0\èó$\ß·=š&_:XVv÷\ÚP=‚\Â&¯D\Ğf\ä\Î\r|«o\Æ†cõø\ŞR4]+p›Lq\È¥1\Î …!‰–?\Ù\ê¢ó`¢œ#\ß|+\ÄÁ…\Ğ\ßJ1²û#\âql÷ñf´\ç_œO7\åÑ†&9W\'QoÂ¨ş\ïF	\Ûü<O©zšzœ¢ZŒñ\Ğı&rV\é¿WvsT¸\Â\Ü?U\Ï\è	\Ô\\Ü«YK,÷ŸŠ¨\É\Í$“M8q\Ò\é\Ï\é<k¶ú\\‡ö|úkÁcÁ8<\å:¸>‹Ü£©¤?Wä˜¢»\æ	ÿ†š\ru;,²´À/\Ù\ÄôbXh*Ã­–8Zú•ñŠº 5\n(F\ÒQ\×\ß-\Ã\'\Ê\Êü\Ş\Ş\â\Ækföİ‰	û™ø\ã\0-\îV‘ŠşHU\ÛY³\ï—\Ê²¹?“Ã·N«õÑ¦-‘\é\İ[0\"\Ô5([H\ÖG{¨µ²Ö ${³Œ\ZšQt–¢¥JA\Õn\ÍÜ™\ÒGı\Ññ\ØYbX¹¿\Ê\Î\Ğ{ü]POœCŸóm;\Î\êˆ¨@s9\àæ››h•—\ÉıªP\ê²{;‰\æ—Ñˆ6Ü0\é3#\ÌG[A\\ç¶¼>Ša‘\àUø\ÎüDœ\ã\0®D\É4´ø;\å½y=ûoZ®s0`t7yw[úr\Ó+£\r× (l\×\êVi\Îƒt“~§\"¯\é\é¾\ã\ŞÀ²\Z\Z\ÖÒŠ\Ò12°#U„\Ñü¼-d\Ñ\ï\ê\Ï{²šÛ“ƒ-ö\ÆÃ¯€ lOen\n\"À‰ó\n¢|{\ä\ê‘\Ë\Ì\'\Ñ\Şw\ï c-˜B°\Ù\ÍZJ*¨÷†ù^\0\Õ\Î)‰úó†÷²Q¯h“\0@\ÕM\ëb<×Ÿ8Ø£´“¶)\æ½@\Ég¥6­(r/\Ï\ÔKAş\á\çı=ó0\ÑONİ£Rbºpó¬Y\ë,«Ë»{·.\ï¯¿_j{ğ~«\ã«dô‹—¿Õ¯•p,±L]´\Ä{/_*\ãµ1·U¢¹N*€¢\rú°6\ëš3\éYa£±0±Xb[x|€qœtœ\Ï\á%Ä»j şÖ®÷‘Ä¿Z\Æp·yb\Ë\âY)0¡\ÈjŠxüİ‰\ãù’P\ZÕ‹±œq/Œ’º·\ÒW:6(ñò\ÎğöY}=q[Â“ó7M\0„\Øşõé¬£%X®0\Ô\ág%\'	UZUf\æ<‡]¸1•™K©lq\ÒJºM´c\Î\'²÷·wÔ²\é\Â\à\ÙAğÌ¹DUoß¾°”\Ú%‚\â2	‘\Ú\É]Ÿ\Ûc’HE¹™\Û|=E†Xû\ÎúA^¨S\Î1?ƒ¸,¤,ñRl+£€\Åó\È\Õ\ŞJ™\r\ÏcBMO¾}<RO ¸Tñ\í•·Š\Ò1c\ï\Ï\ÖhÈ“IÔŸK\ì¤\í‹g¸w`Ÿ¿Jşx‡;\Õô\ÒÆ¸ğ¥\ßMS0}B7D€|ü©:Ö˜+5´%«BŠ[Å°!Õ±§}\\up[,ô¾x\ê\í\Ë%J,h·›¾)\ï½b•I´‚\íU) D·Œ~¦]\í•C\æ?l`ò8\ím¨¾¹\Ü\Ê\ŞJ[\å­?³g;ù™‹®­>a×¦m¼b¿{¼µê¿»¦\â\İJ†´\r\î\ÚÍµú‡\éÒ„+%•ôò\r²–ÿShzxŠnS¦\\qh­³/\êgh­®õ\è\ç0\î¯VšuC#bì…”‰6$bú(GaÎ²*÷¹m\0\ì\n\à3 ûYC|\éR„-¨X\áNk\á\î\Ò\"M½«ù…');
/*!40000 ALTER TABLE `imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagens_receita`
--

DROP TABLE IF EXISTS `imagens_receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagens_receita` (
  `idImagem` int(11) NOT NULL AUTO_INCREMENT,
  `idReceita` int(11) NOT NULL,
  `imagem` longblob NOT NULL,
  PRIMARY KEY (`idImagem`),
  KEY `idReceita` (`idReceita`),
  CONSTRAINT `imagens_receita_ibfk_1` FOREIGN KEY (`idReceita`) REFERENCES `receita` (`idReceita`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagens_receita`
--

LOCK TABLES `imagens_receita` WRITE;
/*!40000 ALTER TABLE `imagens_receita` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagens_receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `idIngrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `idMedidaFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`idIngrediente`),
  KEY `idMedidaFK` (`idMedidaFK`),
  CONSTRAINT `ingredientes_ibfk_1` FOREIGN KEY (`idMedidaFK`) REFERENCES `medida` (`idMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'Farinha de Trigo',NULL,NULL),(2,'AÃ§Ãºcar',NULL,NULL),(3,'Ovos',NULL,NULL),(4,'Manteiga',NULL,NULL),(5,'Leite','Leite integral',1),(6,'Fermento','Fermento em pÃ³',3),(7,'Sal','Sal refinado',1),(8,'Pimenta','Pimenta do reino',1),(9,'Alho','Alho picado',1),(10,'Cebola','Cebola roxa',1),(11,'Tomate','Tomate maduro',1),(12,'Farinha de Trigo','Farinha usada para pÃ£es e bolos',1),(13,'AÃ§Ãºcar','AÃ§Ãºcar refinado',1),(14,'Ovos','Ovos de galinha',2),(15,'Manteiga','Manteiga sem sal',1),(16,'Leite','Leite integral',1),(17,'Fermento','Fermento em pÃ³',3),(18,'Sal','Sal refinado',1),(19,'Pimenta','Pimenta do reino',1),(20,'Alho','Alho picado',1),(21,'Cebola','Cebola roxa',1),(22,'Tomate','Tomate maduro',1),(23,'Queijo','Queijo mussarela',1),(24,'Frango','Peito de frango',2),(25,'Carne MoÃ­da','Carne moÃ­da de boi',2),(26,'Peixe','Peixe fresco',2),(27,'Batata','Batata inglesa',1);
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `idLivro` int(11) NOT NULL AUTO_INCREMENT,
  `cod_isbn` varchar(20) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `editorFK` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idLivro`),
  UNIQUE KEY `cod_isbn` (`cod_isbn`),
  KEY `editorFK` (`editorFK`),
  CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`editorFK`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `sinopse` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (5,'Receitas Caseiras para o Dia a Dia','JoÃ£o Pereira','Um guia completo com receitas simples e deliciosas para o dia a dia, desde pratos principais atÃ© sobremesas.','2024-11-26 16:18:02','2024-11-26 16:18:02'),(7,'Sobremesas IncrÃ­veis: Doces e Bolos','Maria Silva','Uma coleÃ§Ã£o das melhores receitas de sobremesas, incluindo bolos, tortas e doces irresistÃ­veis.','2024-11-26 16:18:02','2024-11-26 16:18:02'),(9,'teste','litlle akakkk','aaa','2024-11-26 17:18:52','2024-11-26 17:18:52'),(11,'qpp','caca','alguma coisa','2024-11-26 17:46:20','2024-11-26 17:46:20'),(12,'teste3','caua','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2024-11-26 19:45:43','2024-11-26 19:45:43');
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros_receita`
--

DROP TABLE IF EXISTS `livros_receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros_receita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `livro_id` int(11) NOT NULL,
  `receita_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `livro_id` (`livro_id`),
  KEY `receita_id` (`receita_id`),
  CONSTRAINT `livros_receita_ibfk_1` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`id`),
  CONSTRAINT `livros_receita_ibfk_2` FOREIGN KEY (`receita_id`) REFERENCES `receita` (`idReceita`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros_receita`
--

LOCK TABLES `livros_receita` WRITE;
/*!40000 ALTER TABLE `livros_receita` DISABLE KEYS */;
INSERT INTO `livros_receita` VALUES (9,9,16),(10,9,21),(11,9,20),(14,11,16),(15,11,22),(16,12,16),(17,12,23);
/*!40000 ALTER TABLE `livros_receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida`
--

DROP TABLE IF EXISTS `medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida` (
  `idMedida` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`idMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida`
--

LOCK TABLES `medida` WRITE;
/*!40000 ALTER TABLE `medida` DISABLE KEYS */;
INSERT INTO `medida` VALUES (1,'gramas'),(2,'unidades'),(3,'colheres de sopa'),(4,'gramas'),(5,'unidades'),(6,'colheres de sopa'),(7,'litros'),(8,'mililitros'),(9,'xÃ­caras');
/*!40000 ALTER TABLE `medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(50) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `meta` text NOT NULL,
  `estado` varchar(50) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metas`
--

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;
INSERT INTO `metas` VALUES (1,'Gerente','Carlos Silva','Aumentar as vendas em 20%','Em andamento','2024-11-26 16:34:15'),(2,'Assistente','Mariana Souza','Reduzir os custos em 15%','Pendente','2024-11-26 16:34:15'),(3,'Coordenador','Lucas Pereira','LanÃ§ar novo produto','ConcluÃ­da','2024-11-26 16:34:15'),(4,'Analista','Beatriz Costa','Treinar equipe de marketing','Em andamento','2024-11-26 16:34:15'),(5,'Diretor','Fernanda Oliveira','Expandir mercado internacional','Pendente','2024-11-26 16:34:15'),(6,'cozinheiro','caua','faz tudo','em andamento','2024-11-26 19:32:01');
/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametro` (
  `ano_prod` smallint(6) NOT NULL,
  `mes_prod` smallint(6) NOT NULL,
  `quant_receitas` varchar(45) NOT NULL,
  PRIMARY KEY (`ano_prod`,`mes_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita`
--

DROP TABLE IF EXISTS `receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita` (
  `idReceita` int(11) NOT NULL AUTO_INCREMENT,
  `nome_receita` varchar(100) NOT NULL,
  `FKcozinheiro` int(11) DEFAULT NULL,
  `data_criacao` date NOT NULL,
  `FKcategoria` int(11) DEFAULT NULL,
  `modo_preparo` text DEFAULT NULL,
  `num_porcao` int(11) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `ind_inedita` tinyint(1) DEFAULT 1,
  `imagem` longblob DEFAULT NULL,
  `caminho_imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idReceita`),
  KEY `FKcozinheiro` (`FKcozinheiro`),
  KEY `FKcategoria` (`FKcategoria`),
  CONSTRAINT `receita_ibfk_1` FOREIGN KEY (`FKcozinheiro`) REFERENCES `funcionario` (`idFuncionario`),
  CONSTRAINT `receita_ibfk_2` FOREIGN KEY (`FKcategoria`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita`
--

LOCK TABLES `receita` WRITE;
/*!40000 ALTER TABLE `receita` DISABLE KEYS */;
INSERT INTO `receita` VALUES (16,'Salada Caesar',2,'2024-11-12',3,'Misture alface, croutons, queijo parmesÃ£o e molho Caesar.',4,'Salada fresca e saborosa.',0,NULL,NULL),(17,'Bolo de Cenoura',1,'2024-11-12',1,'Misture todos os ingredientes e asse por 40 minutos a ',8,'Delicioso bolo de cenoura com cobertura de chocolate.',0,NULL,NULL),(20,'Bolo de Chocolate',1,'2024-11-01',1,'Misture os ingredientes e asse por 30 minutos a 180Â°C.',8,'Bolo simples de chocolate.',1,NULL,NULL),(21,'Salada Caesar',2,'2024-11-02',3,'Misture alface, croutons, queijo parmesÃ£o e molho Caesar.',4,'Salada fresca e saborosa.',0,NULL,NULL),(22,'Frango ao Curry',1,'2024-11-03',2,'Cozinhe o frango com curry e sirva com arroz.',4,'Frango temperado com curry.',1,NULL,NULL),(23,'Sopa de Legumes',2,'2000-05-05',7,'Cozinhe os legumes em Ã¡gua atÃ© ficarem macios.',6,'Sopa nutritiva de legumes.',1,NULL,NULL),(25,'2213sadaa',1,'2024-05-05',2,'dawdsdawd',4,'aaa',0,NULL,NULL),(26,'tt',4,'2024-11-22',1,'fgsgfgfds',2,'fsdadfsada',0,NULL,NULL),(27,'tt',20,'2024-05-05',5,'adicionar 4 colheres de mihlo',3,'tt',0,NULL,NULL),(28,'aaa',2,'2024-02-23',4,'asdawdsa',5,'sss',0,NULL,NULL),(29,'tewste',17,'2024-05-05',8,'o q vc quiser',4,'aaaa',0,NULL,NULL);
/*!40000 ALTER TABLE `receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita_imagem`
--

DROP TABLE IF EXISTS `receita_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita_imagem` (
  `idImagem` int(11) NOT NULL AUTO_INCREMENT,
  `FKreceita` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  PRIMARY KEY (`idImagem`),
  KEY `idx_fk_receita` (`FKreceita`),
  CONSTRAINT `receita_imagem_ibfk_1` FOREIGN KEY (`FKreceita`) REFERENCES `receita` (`idReceita`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita_imagem`
--

LOCK TABLES `receita_imagem` WRITE;
/*!40000 ALTER TABLE `receita_imagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `receita_imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita_ingrediente`
--

DROP TABLE IF EXISTS `receita_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita_ingrediente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FKreceita` int(11) NOT NULL,
  `quantidade` decimal(5,2) NOT NULL,
  `FKMedida` int(11) NOT NULL,
  `FKIngrediente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKreceita` (`FKreceita`),
  KEY `FKMedida` (`FKMedida`),
  KEY `FKIngrediente` (`FKIngrediente`),
  CONSTRAINT `receita_ingrediente_ibfk_1` FOREIGN KEY (`FKreceita`) REFERENCES `receita` (`idReceita`) ON DELETE CASCADE,
  CONSTRAINT `receita_ingrediente_ibfk_2` FOREIGN KEY (`FKMedida`) REFERENCES `medida` (`idMedida`),
  CONSTRAINT `receita_ingrediente_ibfk_3` FOREIGN KEY (`FKIngrediente`) REFERENCES `ingredientes` (`idIngrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita_ingrediente`
--

LOCK TABLES `receita_ingrediente` WRITE;
/*!40000 ALTER TABLE `receita_ingrediente` DISABLE KEYS */;
INSERT INTO `receita_ingrediente` VALUES (25,25,21.00,1,1),(26,25,21.00,1,1),(27,25,22.00,1,1),(28,25,21.00,1,1),(29,25,21.00,1,1),(30,25,22.00,1,1),(31,25,21.00,1,1),(32,25,22.00,1,1),(33,25,21.00,1,1),(34,25,21.00,1,1),(35,25,22.00,1,1),(36,25,21.00,1,1),(37,25,21.00,1,1),(38,25,22.00,1,1),(39,25,21.00,1,1),(40,25,22.00,1,1),(42,23,22.00,1,1),(43,23,22.00,1,1),(44,23,22.00,1,1),(46,23,22.00,1,1),(47,23,22.00,1,1),(48,23,22.00,1,1),(49,23,22.00,1,1),(50,23,22.00,1,1),(51,23,22.00,1,1),(52,23,22.00,1,1),(53,23,22.00,1,1),(54,23,22.00,1,1),(60,23,22.00,1,1),(61,23,22.00,1,1),(62,23,22.00,1,1),(63,23,22.00,1,1),(64,23,22.00,1,1),(65,23,22.00,1,1),(66,23,22.00,1,1),(67,23,22.00,1,1),(68,23,22.00,1,1),(69,23,22.00,1,1),(70,23,22.00,1,1),(71,23,22.00,1,1),(72,23,22.00,1,1),(73,23,22.00,1,1),(74,23,22.00,1,1),(75,23,22.00,1,1),(76,23,22.00,1,1),(78,22,22.00,1,1),(79,22,22.00,1,1),(80,22,22.00,1,1),(81,22,22.00,1,1),(82,16,22.00,1,1),(83,16,22.00,1,1),(84,16,22.00,1,1),(85,16,22.00,1,1),(86,16,22.00,1,1),(87,16,22.00,1,1),(88,26,4.00,3,2),(89,26,4.00,3,1),(90,26,4.00,1,1),(91,26,4.00,2,1),(92,26,4.00,1,1),(93,26,4.00,1,19),(94,26,4.00,1,1),(95,26,4.00,1,1),(96,26,5.00,7,13),(97,27,4.00,1,1),(98,28,4.00,3,1),(99,28,4.00,9,14),(100,16,22.00,1,1),(101,16,22.00,1,1),(102,16,22.00,1,1),(103,16,22.00,1,1),(104,16,22.00,1,1),(105,16,22.00,1,1),(106,23,22.00,1,1),(107,23,22.00,1,1),(108,23,22.00,1,1),(109,23,22.00,1,1),(110,23,22.00,1,1),(111,23,22.00,1,1),(112,23,22.00,1,1),(113,23,22.00,1,1),(114,23,22.00,1,1),(115,23,22.00,1,1),(116,23,22.00,1,1),(117,23,22.00,1,1),(118,23,22.00,1,1),(119,23,22.00,1,1),(120,23,22.00,1,1),(121,23,22.00,1,1),(122,23,22.00,1,1),(123,23,22.00,1,1),(124,23,22.00,1,1),(125,23,22.00,1,1),(126,23,22.00,1,1),(127,23,22.00,1,1),(128,23,22.00,1,1),(129,23,22.00,1,1),(130,23,22.00,1,1),(131,23,22.00,1,1),(132,23,22.00,1,1),(133,23,22.00,1,1),(134,23,22.00,1,1),(135,29,400.00,1,16),(136,29,1.00,7,14),(137,29,400.00,1,1),(138,29,1.00,1,1),(139,29,400.00,1,1),(140,29,1.00,1,1),(141,29,400.00,1,1),(142,29,1.00,1,1);
/*!40000 ALTER TABLE `receita_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencia`
--

DROP TABLE IF EXISTS `referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencia` (
  `FKCozinheiro` int(11) NOT NULL,
  `FKRestaurante` smallint(6) NOT NULL,
  PRIMARY KEY (`FKCozinheiro`,`FKRestaurante`),
  KEY `FKRestaurante` (`FKRestaurante`),
  CONSTRAINT `referencia_ibfk_1` FOREIGN KEY (`FKCozinheiro`) REFERENCES `funcionario` (`idFuncionario`),
  CONSTRAINT `referencia_ibfk_2` FOREIGN KEY (`FKRestaurante`) REFERENCES `restaurante` (`idRestaurante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencia`
--

LOCK TABLES `referencia` WRITE;
/*!40000 ALTER TABLE `referencia` DISABLE KEYS */;
INSERT INTO `referencia` VALUES (2,1);
/*!40000 ALTER TABLE `referencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurante`
--

DROP TABLE IF EXISTS `restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurante` (
  `idRestaurante` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'ContÃ©m o identificador do restaurante. Exemplo: IdRestaurante Nome 00001 CocoBambu 00002 Fiu Fiu',
  `nome` varchar(45) NOT NULL COMMENT 'ContÃ©m nome do restaurante. Exemplo: IdRestaurante Nome 00001 CocoBambu 00002 Fiu Fiu',
  PRIMARY KEY (`idRestaurante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurante`
--

LOCK TABLES `restaurante` WRITE;
/*!40000 ALTER TABLE `restaurante` DISABLE KEYS */;
INSERT INTO `restaurante` VALUES (1,'CocoBambu'),(2,'Fiu Fiu');
/*!40000 ALTER TABLE `restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_midia`
--

DROP TABLE IF EXISTS `tipo_midia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_midia` (
  `idTipo_Midia` smallint(6) NOT NULL COMMENT 'Identificador do tipo de mÃ­dia.',
  `descricao` varchar(45) NOT NULL COMMENT 'DescriÃ§Ã£o do tipo de mÃ­dia.',
  PRIMARY KEY (`idTipo_Midia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_midia`
--

LOCK TABLES `tipo_midia` WRITE;
/*!40000 ALTER TABLE `tipo_midia` DISABLE KEYS */;
INSERT INTO `tipo_midia` VALUES (1,'VÃ­deo'),(2,'Imagem');
/*!40000 ALTER TABLE `tipo_midia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rg` (`rg`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'joice','123','paulo.tok23@gmail.com','$2y$10$esrFZCn3ATS5ueJskiLCW.SqdUAMBLS6zubo0jv/1n/yn9tvhxqyG');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-26 18:23:07
