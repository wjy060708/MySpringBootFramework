# Host: 127.0.0.1  (Version 5.5.62)
# Date: 2019-06-22 15:29:43
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "epm_bom_entry"
#

DROP TABLE IF EXISTS `epm_bom_entry`;
CREATE TABLE `epm_bom_entry` (
  `EntryID` char(32) NOT NULL DEFAULT '',
  `TemplateID` char(32) DEFAULT NULL,
  `ParentID` char(32) DEFAULT NULL,
  `EntryName` varchar(255) DEFAULT NULL,
  `EntryRemark` varchar(255) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`EntryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "epm_bom_entry"
#

INSERT INTO `epm_bom_entry` VALUES ('00316c52c4ea404e9e6c4094b79489bf','39f3ff742735468597604cf878f55f86','d643782169534304bd4be179f9f592be','1','1','2018-11-16 16:19:51','2018-11-16 16:19:51'),('0196f51eab3648fb8dbf1dcd0090d457','c14a14247159406bb990b2b89e9ed5c4','','应用软件','应用软件','2018-11-13 09:22:11','2018-11-13 09:22:11'),('05f8079a0efc4471bc04d18d99ddc34a','5a7d62d5ddeb47e28d5848bfc18e98bb','','项目论文','项目论文','2018-11-13 09:20:06','2018-11-13 09:20:06'),('0d572535fa9949abbc510db1ac7d527a','5a7d62d5ddeb47e28d5848bfc18e98bb','05f8079a0efc4471bc04d18d99ddc34a','硕士论文','硕士论文','2018-11-13 09:21:09','2018-11-29 13:48:44'),('105ac8a53696446087aea89fdae78928','5023f296a68a4226bf607b2fac3098ab','a7c2ea0f356d4fff920a20469b4fbce8','44','44','2018-11-15 11:16:24','2018-11-15 11:16:24'),('1407a67b918f4daf996af9b3548ae0f0','5a7d62d5ddeb47e28d5848bfc18e98bb','','项目软件','项目软件','2018-11-13 09:16:00','2018-11-13 09:16:00'),('26fda207c7a54be086cd7c44f692eec9','5a7d62d5ddeb47e28d5848bfc18e98bb','','项目报告','项目报告','2018-11-12 19:22:52','2018-11-13 09:14:31'),('2773da4fdacf461e93fc4e88ddcdf24e','5023f296a68a4226bf607b2fac3098ab','105ac8a53696446087aea89fdae78928','55','55','2018-11-15 11:18:30','2018-11-15 11:18:30'),('2b96f375fcfe42148c55563688788d0e','5a7d62d5ddeb47e28d5848bfc18e98bb','05f8079a0efc4471bc04d18d99ddc34a','学术期刊','学术期刊','2018-11-13 09:20:36','2018-11-29 13:48:30'),('3627cace651c47baa6f5cbd12d098226','c14a14247159406bb990b2b89e9ed5c4','974767ff50544e64b62c2573eb608503','EI','EI','2018-11-13 09:26:44','2018-11-13 09:26:44'),('3c427c1b9f2245a78bca5d012f6abef7','c14a14247159406bb990b2b89e9ed5c4','0196f51eab3648fb8dbf1dcd0090d457','架构','架构','2018-11-13 09:22:43','2018-11-13 09:22:43'),('3d33f9e5611849839e19f94807f62725','324f571d2919469cab908d17b39f2b1f','','00','00','2018-11-20 14:05:49','2018-11-20 14:05:49'),('4157c9fc416d4471ac99e974802e0885','5a7d62d5ddeb47e28d5848bfc18e98bb','26fda207c7a54be086cd7c44f692eec9','总结报告','总结报告','2018-11-13 09:15:23','2018-11-13 09:15:23'),('444c08588b284502880905fa1db6db91','c14a14247159406bb990b2b89e9ed5c4','3627cace651c47baa6f5cbd12d098226','期刊','期刊','2018-11-15 11:18:59','2018-11-16 09:21:20'),('4893fe938bcc4765be89bf29606f184d','5023f296a68a4226bf607b2fac3098ab','c24248f80f6545b0af1d1c5fc3977acf','22','22','2018-11-14 11:11:44','2018-11-14 11:11:44'),('631e1ef02f6849e4a19999705d6c08d9','5a7d62d5ddeb47e28d5848bfc18e98bb','8b8cc911c2804558880b8dcb7c411727','国内专利','国内专利','2018-11-13 09:19:23','2018-11-29 13:49:58'),('69348d94e70946249ab4716bbf6fc862','5a7d62d5ddeb47e28d5848bfc18e98bb','1407a67b918f4daf996af9b3548ae0f0','软件架构','软件架构','2018-11-13 09:16:55','2018-11-13 09:16:55'),('8b8cc911c2804558880b8dcb7c411727','5a7d62d5ddeb47e28d5848bfc18e98bb','','项目专利','项目专利','2018-11-13 09:19:02','2018-11-13 09:19:02'),('9682c8eb7d0e4baa936a0d68ba85b362','5a7d62d5ddeb47e28d5848bfc18e98bb','26fda207c7a54be086cd7c44f692eec9','开题报告','开题报告','2018-11-13 09:14:52','2018-11-13 09:14:52'),('974767ff50544e64b62c2573eb608503','c14a14247159406bb990b2b89e9ed5c4','','论文报告','论文报告','2018-11-13 09:23:11','2018-11-16 09:21:03'),('a705b9390562407f9e7f01117ba8d957','5a7d62d5ddeb47e28d5848bfc18e98bb','05f8079a0efc4471bc04d18d99ddc34a','博士论文','博士论文','2018-11-29 13:49:06','2018-11-29 13:49:06'),('a7c2ea0f356d4fff920a20469b4fbce8','5023f296a68a4226bf607b2fac3098ab','','33','33','2018-11-14 11:11:52','2018-11-14 11:11:52'),('a8b6cfe8e4304ddfb90571d603432a79','5023f296a68a4226bf607b2fac3098ab','a7c2ea0f356d4fff920a20469b4fbce8','点对点清单','点对点清单','2018-11-16 11:34:42','2018-11-16 11:34:42'),('bb5db99c47604828bf99188074528de8','5a7d62d5ddeb47e28d5848bfc18e98bb','8b8cc911c2804558880b8dcb7c411727','国外专利','国外专利','2018-11-29 13:49:47','2018-11-29 13:49:47'),('bd756d30d0be4e8888292ec9a5e82f81','5a7d62d5ddeb47e28d5848bfc18e98bb','1407a67b918f4daf996af9b3548ae0f0','核心算法','核心算法','2018-11-13 09:17:11','2018-11-13 09:17:11'),('c24248f80f6545b0af1d1c5fc3977acf','5023f296a68a4226bf607b2fac3098ab','','11','11','2018-11-14 11:11:38','2018-11-14 11:11:38'),('c2fa5173dbd8404da98d58a369633061','c14a14247159406bb990b2b89e9ed5c4','','44','44','2018-12-05 08:43:38','2018-12-05 08:43:38'),('d643782169534304bd4be179f9f592be','39f3ff742735468597604cf878f55f86','','TCP应用清单','TCP应用清单','2018-11-16 16:19:43','2018-11-16 16:19:43'),('fa96950e0f404f02b5f37f82ec18377d','5a7d62d5ddeb47e28d5848bfc18e98bb','26fda207c7a54be086cd7c44f692eec9','中期报告','中期报告','2018-11-13 09:15:13','2018-11-13 09:15:13');

#
# Structure for table "epm_bom_template"
#

DROP TABLE IF EXISTS `epm_bom_template`;
CREATE TABLE `epm_bom_template` (
  `TemplateID` char(32) NOT NULL DEFAULT '',
  `TemplateName` varchar(255) DEFAULT NULL,
  `TemplateRemark` varchar(255) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "epm_bom_template"
#

INSERT INTO `epm_bom_template` VALUES ('324f571d2919469cab908d17b39f2b1f','模板5','模板5','2018-11-20 14:05:31','2018-11-20 14:05:31'),('39f3ff742735468597604cf878f55f86','模板4','模板4','2018-11-16 16:19:06','2018-11-16 16:19:06'),('5023f296a68a4226bf607b2fac3098ab','模板3','模板3','2018-11-12 13:20:01','2018-11-12 13:20:01'),('5a7d62d5ddeb47e28d5848bfc18e98bb','模板1','模板1','2018-11-12 13:19:48','2018-11-12 13:19:48'),('c14a14247159406bb990b2b89e9ed5c4','模板2','模板2','2018-11-12 13:19:55','2018-11-12 13:19:55');

#
# Structure for table "epm_project_achie"
#

DROP TABLE IF EXISTS `epm_project_achie`;
CREATE TABLE `epm_project_achie` (
  `AchieID` char(32) NOT NULL DEFAULT '',
  `AchieTitle` varchar(255) DEFAULT NULL,
  `AchieAthor` varchar(255) DEFAULT NULL,
  `ResourceID` char(32) DEFAULT NULL,
  `AchieRemark` varchar(255) DEFAULT NULL,
  `EntryID` char(32) DEFAULT NULL,
  `UserID` char(32) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  PRIMARY KEY (`AchieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "epm_project_achie"
#

INSERT INTO `epm_project_achie` VALUES ('44cda0c3841945478c07b6e5e3c14e0d','开题报告','高干','50cfe540cc734efe9d75fcfc63300b6f','开题报告','9682c8eb7d0e4baa936a0d68ba85b362','65ef758360604137bdccb90a1c9d9b13','2018-11-29 13:56:41','f8a488c7bf864a868d7bacde169fbdfe'),('48f4ca586a8142f7a3b714ef0d96c0f0','核心算法','张加曦','72d28f22aa9442a6b125d9db08c40616','核心算法','bd756d30d0be4e8888292ec9a5e82f81','65ef758360604137bdccb90a1c9d9b13','2018-11-29 13:58:29','f8a488c7bf864a868d7bacde169fbdfe'),('53b51c14263946d9b8e5ce73bc455cd2','硕士论文','崔旻','6ec573e1fc6c42f8b73617c1a3163070','硕士论文','0d572535fa9949abbc510db1ac7d527a','65ef758360604137bdccb90a1c9d9b13','2018-11-29 13:59:48','f8a488c7bf864a868d7bacde169fbdfe'),('58253c432b4b4fc7baf018f278485612','博士论文','杨鹏','d77352de8c164984abb9edaa942a68b1','博士论文','a705b9390562407f9e7f01117ba8d957','65ef758360604137bdccb90a1c9d9b13','2018-11-29 14:00:18','f8a488c7bf864a868d7bacde169fbdfe'),('5c2916dd02e1434f938fcc76cf051603','中期报告','汪进银','b50274cd0e514dcebbee4b8866463d3f','中期报告','fa96950e0f404f02b5f37f82ec18377d','65ef758360604137bdccb90a1c9d9b13','2018-11-29 13:57:28','f8a488c7bf864a868d7bacde169fbdfe'),('70fa7fce0b85419eb7748d0d3680ae9f','软件架构','姜利','f50b060fb8eb43efa8069f3bd734e8d3','软件架构','69348d94e70946249ab4716bbf6fc862','65ef758360604137bdccb90a1c9d9b13','2018-11-29 13:58:07','f8a488c7bf864a868d7bacde169fbdfe'),('85b04396b5ef4952a70d9e9805a6b308','总结报告','万旭东','eb9227607967498aab5d4b999b937988','总结报告','4157c9fc416d4471ac99e974802e0885','65ef758360604137bdccb90a1c9d9b13','2018-11-29 13:57:47','f8a488c7bf864a868d7bacde169fbdfe'),('87f63f52d61b4a78bde6c5e692e2e9f2','Git版本库全文检索系统的设计与实现gfj ','','4581f7a6cf824ff4ab62be1f92d57bcb','','fa96950e0f404f02b5f37f82ec18377d','65ef758360604137bdccb90a1c9d9b13','2018-11-29 18:25:13','f8a488c7bf864a868d7bacde169fbdfe'),('95252d52e3624d2dbd8bdcc3e876c903','学术期刊','张壹','04e7b4a17d3446d9ac42bb16ac1728ea','学术期刊','2b96f375fcfe42148c55563688788d0e','65ef758360604137bdccb90a1c9d9b13','2018-11-29 13:59:29','f8a488c7bf864a868d7bacde169fbdfe'),('b6ded790e28d44349c85b6fa5d3f065f','国内专利','刘悦悦','2562253c9e2a4810b0352cb735cc3b1b','国内专利','631e1ef02f6849e4a19999705d6c08d9','65ef758360604137bdccb90a1c9d9b13','2018-11-29 13:58:53','f8a488c7bf864a868d7bacde169fbdfe'),('d02beed5b1894227bc786792295d299d','国外专利','杜泽峰','b6375638e56c4130bee5dba37e35a7f2','国外专利','bb5db99c47604828bf99188074528de8','65ef758360604137bdccb90a1c9d9b13','2018-11-29 13:59:10','f8a488c7bf864a868d7bacde169fbdfe');

#
# Structure for table "epm_project_document"
#

DROP TABLE IF EXISTS `epm_project_document`;
CREATE TABLE `epm_project_document` (
  `DocumentID` char(32) NOT NULL DEFAULT '',
  `ProjectID` char(32) DEFAULT NULL,
  `DocumentName` varchar(255) DEFAULT NULL,
  `DocumentRemark` varchar(255) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`DocumentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "epm_project_document"
#

INSERT INTO `epm_project_document` VALUES ('0273ffe81bea401cb40c3945a5221e60','f8a488c7bf864a868d7bacde169fbdfe','大数据研究综述','大数据研究综述','2018-11-19 18:49:03','2018-11-20 08:51:21');

#
# Structure for table "epm_project_group"
#

DROP TABLE IF EXISTS `epm_project_group`;
CREATE TABLE `epm_project_group` (
  `GroupID` char(32) NOT NULL,
  `GroupName` varchar(64) NOT NULL DEFAULT '',
  `GroupRemark` varchar(256) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `GroupIcon` varchar(64) DEFAULT NULL,
  `GroupOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "epm_project_group"
#

INSERT INTO `epm_project_group` VALUES ('8db02bcd0cf841f18eb5736da7219d49','软件缺陷','软件缺陷','2018-11-09 11:25:22','2018-11-16 09:59:02','1',1),('d97403a0225f4e76aef422311e66716a','网络通信','网络通信','2018-11-12 13:24:52','2018-11-16 09:59:16','1',1);

#
# Structure for table "epm_project_info"
#

DROP TABLE IF EXISTS `epm_project_info`;
CREATE TABLE `epm_project_info` (
  `ProjectID` char(32) NOT NULL,
  `GroupID` char(32) DEFAULT NULL,
  `ProjectName` varchar(64) NOT NULL DEFAULT '',
  `ProjectRemark` varchar(256) DEFAULT NULL,
  `ProjectOrder` int(11) DEFAULT NULL,
  `TypeID` char(32) DEFAULT NULL,
  `TemplateID` char(32) DEFAULT NULL,
  `UserID` char(32) DEFAULT NULL,
  `DepartmentID` char(32) DEFAULT NULL,
  `ProjectGround` varchar(255) DEFAULT NULL,
  `StartTime` varchar(255) DEFAULT NULL,
  `EndTime` varchar(255) DEFAULT NULL,
  `ProjectMonney` varchar(255) DEFAULT NULL,
  `ProjectStatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "epm_project_info"
#

INSERT INTO `epm_project_info` VALUES ('4f3869a58a2f40a9a9dff4dd2092b217','8db02bcd0cf841f18eb5736da7219d49','基于缺陷模式的软件知识库研究及应用','基于缺陷模式的软件知识库研究及应用',1,'0f9cc66f9c9d4781a37554b84271b46f','5a7d62d5ddeb47e28d5848bfc18e98bb','65ef758360604137bdccb90a1c9d9b13','c6aa7b1e70d445be850b9c5509f4a3a7','基于缺陷模式的软件知识库研究及应用的相关国内外现状','2018-11-21','2018-11-21','$8000,000,000','0'),('f8a488c7bf864a868d7bacde169fbdfe','d97403a0225f4e76aef422311e66716a','基于大数据的家禽养殖技术研究','基于大数据的家禽养殖技术研究',5,'0f9cc66f9c9d4781a37554b84271b46f','5a7d62d5ddeb47e28d5848bfc18e98bb','65ef758360604137bdccb90a1c9d9b13','c6aa7b1e70d445be850b9c5509f4a3a7','基于大数据的家禽养殖技术研究的相关国内外现状','2018-11-19','2018-11-19','￥1000,000,000','3');

#
# Structure for table "epm_project_type"
#

DROP TABLE IF EXISTS `epm_project_type`;
CREATE TABLE `epm_project_type` (
  `TypeID` char(32) NOT NULL,
  `TypeName` varchar(64) NOT NULL DEFAULT '',
  `TypeRemark` varchar(256) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `TypeOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "epm_project_type"
#

INSERT INTO `epm_project_type` VALUES ('0f9cc66f9c9d4781a37554b84271b46f','科研','科研','2018-11-15 09:05:39','2018-11-15 16:46:25',1),('d26ca2fb4bb142baaf06029c9fd6df94','TCP类型','TCP类型','2018-11-16 16:20:13','2018-11-16 16:20:13',1);

#
# Structure for table "epm_task_info"
#

DROP TABLE IF EXISTS `epm_task_info`;
CREATE TABLE `epm_task_info` (
  `TaskID` char(32) NOT NULL DEFAULT '',
  `ProjectID` char(32) DEFAULT NULL,
  `TaskName` varchar(255) DEFAULT NULL,
  `TaskRemark` varchar(255) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `ParentID` char(32) DEFAULT NULL,
  PRIMARY KEY (`TaskID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "epm_task_info"
#

INSERT INTO `epm_task_info` VALUES ('3a9b38420fcd4c89b66689a6f43dc308','f8a488c7bf864a868d7bacde169fbdfe','数据预处理','数据预处理','2018-11-20 08:53:15','2018-11-20 08:53:15','a2f7ccbeff424c9dbdf10fa2ab44ef5d'),('89e7ad1acaa14ca9b73d273d1749a173','f8a488c7bf864a868d7bacde169fbdfe','11','11','2018-12-04 18:34:16','2018-12-04 18:34:16',''),('a2f7ccbeff424c9dbdf10fa2ab44ef5d','f8a488c7bf864a868d7bacde169fbdfe','获取数据源','获取数据源','2018-11-19 18:49:39','2018-11-20 08:52:04',NULL),('c4907e8ab1784ab4b188ba6235cc05d1','f8a488c7bf864a868d7bacde169fbdfe','i','i','2018-12-04 16:40:51','2018-12-04 16:40:51','3a9b38420fcd4c89b66689a6f43dc308');

#
# Structure for table "know_content"
#

DROP TABLE IF EXISTS `know_content`;
CREATE TABLE `know_content` (
  `contentID` char(32) NOT NULL DEFAULT '',
  `typeID` char(32) DEFAULT NULL,
  `parentID` char(32) DEFAULT NULL,
  `contentName` varchar(64) DEFAULT NULL,
  `contentRemark` varchar(255) DEFAULT NULL,
  `processID` char(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `contentOrder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_content"
#

INSERT INTO `know_content` VALUES ('572ccb1344d0465f8a72d85fc576ebdc','79d91358072a42a18e63d3a720b8d131',NULL,'数据需求','数据需求',NULL,'2013-01-08 20:22:15','2013-01-08 20:22:15','1'),('72d6b88f083b4b198ff3749f27566b22','79d91358072a42a18e63d3a720b8d131',NULL,'性能需求','性能需求',NULL,'2013-01-08 20:21:29','2013-01-08 20:21:29','1'),('75369e6eaea146bc95f956f56d856250','79d91358072a42a18e63d3a720b8d131',NULL,'异常需求','异常需求',NULL,'2013-01-08 20:22:50','2013-01-08 20:22:50','2'),('9e8c5c5d2d2d4655b72c3488561567cb','79d91358072a42a18e63d3a720b8d131',NULL,'功能需求','功能需求',NULL,'2013-01-12 03:04:37','2013-01-12 03:04:37','1'),('e8d7b37326cf4afcb89f2893ab70160d','79d91358072a42a18e63d3a720b8d131',NULL,'其他需求','其他需求',NULL,'2013-01-08 20:23:18','2013-01-08 20:23:18','3'),('ee4857e72f4a41e2ac8026bd23aa4e5a','79d91358072a42a18e63d3a720b8d131',NULL,'接口需求','接口需求',NULL,'2013-01-08 20:21:55','2013-01-08 20:21:55','1');

#
# Structure for table "know_mode"
#

DROP TABLE IF EXISTS `know_mode`;
CREATE TABLE `know_mode` (
  `modeID` char(32) NOT NULL DEFAULT '',
  `modeName` varchar(1024) DEFAULT NULL,
  `modeRemark` varchar(255) DEFAULT NULL,
  `isEdit` char(10) DEFAULT NULL,
  `isRead` char(10) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `typeID` char(32) NOT NULL DEFAULT '',
  `author` varchar(255) DEFAULT NULL,
  `currentUser` varchar(255) DEFAULT NULL,
  `resourceID` char(32) DEFAULT NULL,
  `imgeUrl` varchar(255) DEFAULT NULL,
  `greatNum` int(11) DEFAULT '1',
  `badNum` int(11) DEFAULT '1',
  `remarkNum` int(11) DEFAULT '1',
  `privateNum` int(1) DEFAULT '1',
  `visitNum` int(11) DEFAULT '1',
  `keyWords` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`modeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode"
#

INSERT INTO `know_mode` VALUES ('40275fe3ee6e4dfab2c6b5e9a858ddfb','软件功能处理流程不完整','软件功能处理流程不完整','0','1','2019-05-25 15:50:48','2019-05-25 15:55:45','964c1f8237f84a52ac9bd0a0ca183b2d','lisi','lisi',NULL,'uploadImages/2019052515507447.jpg',1,0,0,1,0,'处理流程'),('52cf4c5bcc5040ef82c6a3a83cf7b3a1','缺少对异常情况的判断','缺少对异常情况的判断','0','1','2019-05-25 15:49:18','2019-05-25 15:49:18','ed42812395364b09b3a7a913efe8de0d','wangwu','wangwu',NULL,'uploadImages/20190525154936317.jpg',0,0,0,0,0,'异常情况'),('553161f31b10485883da3b8823ccd76b','软件功能的输入描述部完整','软件功能的输入描述部完整','0','1','2019-05-25 15:47:51','2019-05-25 15:47:51','79d91358072a42a18e63d3a720b8d131','wangwu','wangwu',NULL,'uploadImages/2019052515475350.jpg',0,0,0,0,0,'软件功能;描述不完整'),('8f8c7c09132145d8b8968db3f82ee57e','多条语句写在同一行','多条语句写在同一行','0','1','2019-05-25 15:53:08','2019-05-25 15:55:29','53fe69c8ee83401cbc9c99125141aca9','lisi','lisi',NULL,'uploadImages/20190525155326307.jpg',2,0,0,2,0,'语句'),('b93520003d8c4e1087f357182939d90b','模块有多个出口或者多个出口','模块有多个出口或者多个出口','0','1','2019-05-25 15:51:52','2019-05-25 15:54:26','xd42812395364b09b3a7a913efe8de0d','lisi','lisi',NULL,'uploadImages/20190525155177950.jpg',1,0,0,1,0,'模块'),('ee27afe3b3e14fc5bbc9a7138b9ff1a8','缺少对软件功能输入信息的描述','缺少对软件功能输入信息的描述','0','1','2019-05-25 15:45:31','2019-05-25 15:45:31','g9d91358072a42a18e63d3a720b8d131','wangwu','wangwu',NULL,'uploadImages/20190525154562830.jpg',0,0,0,0,0,'软件功能;描述信息');

#
# Structure for table "know_mode_bad"
#

DROP TABLE IF EXISTS `know_mode_bad`;
CREATE TABLE `know_mode_bad` (
  `badID` char(32) NOT NULL DEFAULT '',
  `modeID` char(32) DEFAULT NULL,
  `userID` char(32) DEFAULT NULL,
  PRIMARY KEY (`badID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode_bad"
#

INSERT INTO `know_mode_bad` VALUES ('2884737deef44db9b5782da6c75469d5','e346e7243d49443193c24e45cbce830f','a31c9395c257411da04c30372cf682f4'),('355198717590460097f6687a533abda5','8b78ba3073f04353a714056922cdf238','a31c9395c257411da04c30372cf682f4'),('492d4ef0dfd841ee8ee7e0cb073fbfb8','8527753311d44a5c9b57aac9019e4534','a31c9395c257411da04c30372cf682f4'),('4a4b63d27732489da65e0a27f0c2f5ba','3e8e6c1d2c6d4ba2a29be4d1adec832a','a31c9395c257411da04c30372cf682f4'),('5300eec87d5f4a83869608c3256cb908','4e97adf704724a9b9a5c81e2c1cfdd09','a31c9395c257411da04c30372cf682f4'),('70eb2d9451574a43b424a0afc10a5bbf','89db2fccb3ef4d21b4059b74dee6c666','a31c9395c257411da04c30372cf682f4'),('ad64b72591154811a17d1bf8a3850311','b66b26f88c6a479aa6f65eefe616f0df','a31c9395c257411da04c30372cf682f4'),('ae6d8c9084914d71b66a9a4f3e48c126','211506ddb517463f8783a8fa5f94ce33','a31c9395c257411da04c30372cf682f4'),('b4415b4bff1f412fa3949d3c55d77b2d','1208027f677c45d8973163515e4fbac3','a31c9395c257411da04c30372cf682f4'),('e64def2ea697426fbd11b4c3f301b730','a9484a8d011c4195b60e5af0ed8e21e0','b5f57e7f737a499887b5b205fca07676'),('f3dff5282eb74c7094460659611132f2','97f9733cf81448d1bb3d2f9aa922ee6a','a31c9395c257411da04c30372cf682f4');

#
# Structure for table "know_mode_consequence"
#

DROP TABLE IF EXISTS `know_mode_consequence`;
CREATE TABLE `know_mode_consequence` (
  `consequenceID` char(32) NOT NULL DEFAULT '',
  `modeID` char(32) DEFAULT NULL,
  `consequenceContent` varchar(255) DEFAULT NULL,
  `typeID` char(32) DEFAULT NULL,
  PRIMARY KEY (`consequenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode_consequence"
#

INSERT INTO `know_mode_consequence` VALUES ('0800c3c6a8684ab7bb39892896d7543b','40275fe3ee6e4dfab2c6b5e9a858ddfb','软件功能处理流程不完整','964c1f8237f84a52ac9bd0a0ca183b2d'),('4a57872559cf41baa9419b23db2e3ee1','8f8c7c09132145d8b8968db3f82ee57e','多条语句写在同一行','53fe69c8ee83401cbc9c99125141aca9'),('98c37a3357634903a034a069b0766a6e','ee27afe3b3e14fc5bbc9a7138b9ff1a8','缺少对软件功能输入信息的描述','g9d91358072a42a18e63d3a720b8d131'),('ab1a73956dbe4ef783a0db3dbb7d880c','b93520003d8c4e1087f357182939d90b','模块有多个出口或者多个出口','xd42812395364b09b3a7a913efe8de0d'),('cf1f59cdc0f64b0087e54be824564471','ee27afe3b3e14fc5bbc9a7138b9ff1a8','缺少对软件功能输入信息','g9d91358072a42a18e63d3a720b8d131'),('d4b086ac2e9443c9a51d25a62c9e355f','553161f31b10485883da3b8823ccd76b','软件功能的输入描述部完整','79d91358072a42a18e63d3a720b8d131'),('eee63682f53646568d393bb5f685847a','52cf4c5bcc5040ef82c6a3a83cf7b3a1','缺少对异常情况的判断','ed42812395364b09b3a7a913efe8de0d');

#
# Structure for table "know_mode_content"
#

DROP TABLE IF EXISTS `know_mode_content`;
CREATE TABLE `know_mode_content` (
  `modeContentID` char(32) NOT NULL DEFAULT '',
  `modeContentName` varchar(255) DEFAULT '',
  `reason` varchar(1024) DEFAULT '',
  `consequence` varchar(1024) DEFAULT '',
  `prevention` varchar(1024) DEFAULT '',
  `ruleID` char(32) DEFAULT '',
  `modeID` char(32) DEFAULT NULL,
  `stage` char(10) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `tagKey` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `currentUser` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `publishTime` datetime DEFAULT NULL,
  `visitNum` varchar(255) DEFAULT NULL,
  `resourceID` char(32) DEFAULT NULL,
  `lastVisitTime` datetime DEFAULT NULL,
  PRIMARY KEY (`modeContentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode_content"
#

INSERT INTO `know_mode_content` VALUES ('0b36ac4451674588bea690d4e959449a','缺少对异常情况的判断','1.需求分析人员与用户沟通不充分；\r\n2.需求分析人员对“应该做什么，不能做什么”考虑不全；\r\n3.粗心导致漏掉某些需求','软件功能，无法满足用户要求，软件需求存在缺陷','与用户充分沟通，既要考虑软件要做什么，也应考虑软件不能做什么，应该明确输入，输出存在哪些异常情况，对其处理措施应详细说明',NULL,'74eea5737366428bbbc7ceb49a03f4aa',NULL,NULL,NULL,NULL,NULL,'2018-12-06 11:56:00','2018-12-06 11:56:00',NULL,'0',NULL,NULL),('2afba369c11f485bb36fc732d8d72570','00','00','00','00',NULL,'74eea5737366428bbbc7ceb49a03f4aa',NULL,NULL,NULL,NULL,NULL,'2018-12-11 17:54:45','2018-12-11 17:54:45',NULL,'0',NULL,NULL),('62a0d433bd9946b9b5aeabeb9e5bc762','00','00','00','00',NULL,'d8fc71a496914764b815211427db44c0',NULL,NULL,NULL,NULL,NULL,'2018-12-06 09:46:33','2018-12-06 09:46:33',NULL,'0',NULL,NULL),('b694467cc47c4e5785b0d5f98b836810','66','66','66','66',NULL,'74eea5737366428bbbc7ceb49a03f4aa',NULL,NULL,NULL,NULL,NULL,'2018-12-11 17:55:41','2018-12-11 17:55:41',NULL,'0',NULL,NULL),('d813faf930144212b6250d613a6274e0','11','11','11','11',NULL,'74eea5737366428bbbc7ceb49a03f4aa',NULL,NULL,NULL,NULL,NULL,'2018-12-11 17:54:27','2018-12-11 17:54:27',NULL,'0',NULL,NULL);

#
# Structure for table "know_mode_good"
#

DROP TABLE IF EXISTS `know_mode_good`;
CREATE TABLE `know_mode_good` (
  `GoodID` char(32) NOT NULL DEFAULT '',
  `UserID` char(32) DEFAULT NULL,
  `GoodStatus` char(1) DEFAULT NULL,
  `ModeID` char(32) DEFAULT NULL,
  PRIMARY KEY (`GoodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode_good"
#


#
# Structure for table "know_mode_great"
#

DROP TABLE IF EXISTS `know_mode_great`;
CREATE TABLE `know_mode_great` (
  `greatID` char(32) NOT NULL DEFAULT '',
  `ModeID` char(32) DEFAULT NULL,
  `UserID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`greatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode_great"
#

INSERT INTO `know_mode_great` VALUES ('0776dd7408eb4a6e8df44069ceec2c7d','27e428b580864f438a4e18c340d782d2','b5f57e7f737a499887b5b205fca07676'),('101dd6a75efd47d183144d96831c334d','b93520003d8c4e1087f357182939d90b','a31c9395c257411da04c30372cf682f4'),('1548ecb382c84eacbae02de85f75aaeb','f091b9bdbac44b4b84b6d885cfa0c051','a31c9395c257411da04c30372cf682f4'),('2a794662d89541378b5475deb142e7c9','4e97adf704724a9b9a5c81e2c1cfdd09','a31c9395c257411da04c30372cf682f4'),('3928aef459184357bf418d97f063cdd4','e346e7243d49443193c24e45cbce830f','a31c9395c257411da04c30372cf682f4'),('46a4d2d7c0284de8909b0034fb8d0db5','3e8e6c1d2c6d4ba2a29be4d1adec832a','a31c9395c257411da04c30372cf682f4'),('5df6dd537575408a8cb413dc865b00aa','d98ea61764d143ffba28fa8e1e8e1661','a31c9395c257411da04c30372cf682f4'),('6a90e4fd2b0d493daf4c8d1bb55887cd','a9484a8d011c4195b60e5af0ed8e21e0','b5f57e7f737a499887b5b205fca07676'),('746a042c68e84b5597f04d15997ceccf','b66b26f88c6a479aa6f65eefe616f0df','a31c9395c257411da04c30372cf682f4'),('895c5f618d9c4ac89a7836bf94e735e6','8b78ba3073f04353a714056922cdf238','a31c9395c257411da04c30372cf682f4'),('92c2b6f6ee7944b4b0a55442b56b3059','c4f551a4815440a89d1830049b37d541','a31c9395c257411da04c30372cf682f4'),('940fd8ce456c498a9fc331be144e10ab','40275fe3ee6e4dfab2c6b5e9a858ddfb','b5f57e7f737a499887b5b205fca07676'),('9567886fafa94dfebac9d99ddfa739a2','89db2fccb3ef4d21b4059b74dee6c666','a31c9395c257411da04c30372cf682f4'),('9afb500aa4e84196a4d34e69ba273523','8f8c7c09132145d8b8968db3f82ee57e','b5f57e7f737a499887b5b205fca07676'),('9b4a495eb3b14536a446c5a036a2e137','8527753311d44a5c9b57aac9019e4534','a31c9395c257411da04c30372cf682f4'),('aa1e29a5aebb4b188d1739453f351da9','0ae412b1a3f1429cb1578aaf4a716e14','a31c9395c257411da04c30372cf682f4'),('c8aa0ecb8b4d434ea1d1deec9e87d81e','1c2fb71db4b24223ab5dc47cd0b04e20','b5f57e7f737a499887b5b205fca07676'),('e403b50dba89415fb83b4cb6291b79b5','a9484a8d011c4195b60e5af0ed8e21e0','a31c9395c257411da04c30372cf682f4'),('e73389b230b14e9fa8d4ba48e5acf57c','c8ccf8c22db840a4af25d990b57d597a','a31c9395c257411da04c30372cf682f4'),('ea888e44043c439598b4460eb6e507cc','344e0c69d15147afa44f710fb292f572','a31c9395c257411da04c30372cf682f4'),('f11c71eb3bf243cf9f2f5b8260df33ae','1208027f677c45d8973163515e4fbac3','a31c9395c257411da04c30372cf682f4'),('f9afef350058400d845a642f4881dc2e','0c9247a45cde44a68611718a7036b688','b5f57e7f737a499887b5b205fca07676');

#
# Structure for table "know_mode_prevention"
#

DROP TABLE IF EXISTS `know_mode_prevention`;
CREATE TABLE `know_mode_prevention` (
  `preventionID` char(32) NOT NULL DEFAULT '',
  `modeID` char(32) DEFAULT NULL,
  `preventionContent` varchar(255) DEFAULT NULL,
  `typeID` char(32) DEFAULT NULL,
  PRIMARY KEY (`preventionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode_prevention"
#

INSERT INTO `know_mode_prevention` VALUES ('1cbcc48908404c09a93948b2fd35ad2b','8f8c7c09132145d8b8968db3f82ee57e','多条语句写在同一行','53fe69c8ee83401cbc9c99125141aca9'),('5a78036657fd4c8690719f445afba4b7','52cf4c5bcc5040ef82c6a3a83cf7b3a1','缺少对异常情况的判断','ed42812395364b09b3a7a913efe8de0d'),('aa543402b3104e22b9334d721ae399bd','553161f31b10485883da3b8823ccd76b','软件功能的输入描述部完整','79d91358072a42a18e63d3a720b8d131'),('b225e76d55c54bf9a0d48698b9cadafd','40275fe3ee6e4dfab2c6b5e9a858ddfb','软件功能处理流程不完整','964c1f8237f84a52ac9bd0a0ca183b2d'),('e730a8a94afa491eb3208253f71ae8b2','ee27afe3b3e14fc5bbc9a7138b9ff1a8','缺少对软件功能输入信息的描述','g9d91358072a42a18e63d3a720b8d131'),('e84bf93e936c4b5bad99a3538e6a0a38','b93520003d8c4e1087f357182939d90b','模块有多个出口或者多个出口','xd42812395364b09b3a7a913efe8de0d'),('f186b71565dc4d62a716c302d15dd4c0','ee27afe3b3e14fc5bbc9a7138b9ff1a8','缺少对软件功能输入信息','g9d91358072a42a18e63d3a720b8d131');

#
# Structure for table "know_mode_private"
#

DROP TABLE IF EXISTS `know_mode_private`;
CREATE TABLE `know_mode_private` (
  `privateID` char(32) NOT NULL DEFAULT '',
  `modeID` char(32) NOT NULL DEFAULT '',
  `userID` char(32) NOT NULL DEFAULT '',
  `createTime` datetime DEFAULT NULL,
  `privateRemark` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`privateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode_private"
#

INSERT INTO `know_mode_private` VALUES ('0d82f16eca1d476ab9139d32940c1e3e','ec04ab9a5d114cc7abb7cb8f47ebbb60','a31c9395c257411da04c30372cf682f4','2019-02-25 17:22:49',NULL),('0d97042082434af0bf3f9b200a968e03','ffa6eac84f464a36919d82bf3eb523b5','a31c9395c257411da04c30372cf682f4','2019-02-28 14:29:09',NULL),('117e563422b9405d94a1c5b86dad462e','02f27cda08c548f3ae649624b4d86f01','a31c9395c257411da04c30372cf682f4','2019-03-01 09:41:36',NULL),('12a4e01c897e44809056f0b9632a36ad','a9484a8d011c4195b60e5af0ed8e21e0','b5f57e7f737a499887b5b205fca07676','2019-05-22 09:16:07',NULL),('15b728c5740646109e9a18d59f3b0aa0','4e97adf704724a9b9a5c81e2c1cfdd09','a31c9395c257411da04c30372cf682f4','2019-03-06 10:12:51',NULL),('200ab427de80429c95cea1d9e69ab758','0c9247a45cde44a68611718a7036b688','b5f57e7f737a499887b5b205fca07676','2019-05-22 09:15:30',NULL),('3a44783e9a1e4a73af77e85eecaa4b9b','b93520003d8c4e1087f357182939d90b','a31c9395c257411da04c30372cf682f4','2019-05-25 15:54:26',NULL),('4bfa1c7c78a64792937766eb0d1d88da','1c2fb71db4b24223ab5dc47cd0b04e20','b5f57e7f737a499887b5b205fca07676','2019-05-22 09:15:44',NULL),('5539f4da21ee452786da7efaa06579ba','c8ccf8c22db840a4af25d990b57d597a','a31c9395c257411da04c30372cf682f4','2019-03-06 10:13:11',NULL),('6668f0aa7dfb47cc9fdc69202cab1c20','0d3f9bd7ac8745a8a84f5a74bec5a3c6','65ef758360604137bdccb90a1c9d9b13','2019-03-21 13:14:03',NULL),('6b96a4a9d8fe4b9287a6911f801644d8','8527753311d44a5c9b57aac9019e4534','a31c9395c257411da04c30372cf682f4','2019-01-25 16:14:01',NULL),('6f8dada417eb4bedb71ba63d3c22e6d0','40275fe3ee6e4dfab2c6b5e9a858ddfb','b5f57e7f737a499887b5b205fca07676','2019-05-25 15:55:45',NULL),('7c0a1264c4684bba86a747a54038cffb','27e428b580864f438a4e18c340d782d2','65ef758360604137bdccb90a1c9d9b13','2019-05-24 07:44:52',NULL),('85ce8802c68544bca793d1036912ec64','0ae412b1a3f1429cb1578aaf4a716e14','a31c9395c257411da04c30372cf682f4','2019-03-06 10:12:44',NULL),('8c7db7e31e754663b7f668eea1e6cc8a','d98ea61764d143ffba28fa8e1e8e1661','a31c9395c257411da04c30372cf682f4','2019-03-06 10:13:03',NULL),('9b5a61f2db024bd7a59b2d6e65d5c65d','c4f551a4815440a89d1830049b37d541','a31c9395c257411da04c30372cf682f4','2019-03-06 10:12:57',NULL),('bb592e7c1bac4d6bb4e3b72346314fb0','a9484a8d011c4195b60e5af0ed8e21e0','a31c9395c257411da04c30372cf682f4','2019-05-22 08:50:39',NULL),('c5e2ea7f29ba4b81b78f8a882e176583','8f8c7c09132145d8b8968db3f82ee57e','b5f57e7f737a499887b5b205fca07676','2019-05-25 15:55:29',NULL),('d13a724a5bcb4e5b8efb538b0ddfee00','8f8c7c09132145d8b8968db3f82ee57e','a31c9395c257411da04c30372cf682f4','2019-05-25 15:53:45',NULL),('d2f992795f764619b966163c32f8ce5e','8b78ba3073f04353a714056922cdf238','a31c9395c257411da04c30372cf682f4','2019-01-25 13:49:21',NULL),('d4de16ab941c4525933549149836bf31','27e428b580864f438a4e18c340d782d2','b5f57e7f737a499887b5b205fca07676','2019-05-24 15:43:09',NULL),('f29b14992d2e4a0f943456595a379237','89db2fccb3ef4d21b4059b74dee6c666','a31c9395c257411da04c30372cf682f4','2019-01-25 13:49:30',NULL);

#
# Structure for table "know_mode_reason"
#

DROP TABLE IF EXISTS `know_mode_reason`;
CREATE TABLE `know_mode_reason` (
  `reasonID` char(32) NOT NULL DEFAULT '',
  `modeID` char(32) DEFAULT NULL,
  `reasonContent` varchar(255) DEFAULT NULL,
  `typeID` char(32) DEFAULT NULL,
  PRIMARY KEY (`reasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode_reason"
#

INSERT INTO `know_mode_reason` VALUES ('645ee496a79e41d996b5c71af6cf1b5e','8f8c7c09132145d8b8968db3f82ee57e','多条语句写在同一行','53fe69c8ee83401cbc9c99125141aca9'),('753d728e56b4419c982e677a15926341','52cf4c5bcc5040ef82c6a3a83cf7b3a1','缺少对异常情况的判断','ed42812395364b09b3a7a913efe8de0d'),('79416dcdba8f49ea96e3f70f2661176a','553161f31b10485883da3b8823ccd76b','软件功能的输入描述部完整','79d91358072a42a18e63d3a720b8d131'),('850d4f7bcbb141b285098957e3943184','40275fe3ee6e4dfab2c6b5e9a858ddfb','软件功能处理流程不完整','964c1f8237f84a52ac9bd0a0ca183b2d'),('8e5b5c7278144204b7cb8392742a36db','ee27afe3b3e14fc5bbc9a7138b9ff1a8','缺少对软件功能输入信息','g9d91358072a42a18e63d3a720b8d131'),('df457add7dae4d43aeb0c9800d6d2e38','ee27afe3b3e14fc5bbc9a7138b9ff1a8','缺少对软件功能输入信息的描述','g9d91358072a42a18e63d3a720b8d131'),('f6e658f26ff3403da679513066724e7e','b93520003d8c4e1087f357182939d90b','模块有多个出口或者多个出口','xd42812395364b09b3a7a913efe8de0d');

#
# Structure for table "know_mode_rule"
#

DROP TABLE IF EXISTS `know_mode_rule`;
CREATE TABLE `know_mode_rule` (
  `ruleID` char(32) NOT NULL DEFAULT '',
  `modeID` char(32) DEFAULT NULL,
  `ruleContent` varchar(255) DEFAULT NULL,
  `resourceID` char(32) DEFAULT NULL,
  `typeID` char(32) DEFAULT NULL,
  `ruleTitle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ruleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_mode_rule"
#

INSERT INTO `know_mode_rule` VALUES ('170b1f695bcf499fab39a91e48ece8a5','b93520003d8c4e1087f357182939d90b','军用关键软件缺陷管理系统用户手册1.0.0版','9b6b6f4bfb5e4527b161137394aa94c5','b93520003d8c4e1087f357182939d90b',NULL),('1811e20f26284b3d920f04c12bfbd924','ee27afe3b3e14fc5bbc9a7138b9ff1a8','汪进银-lunwen','00e87984ecd64bc6857bbda71f4f0ce9','ee27afe3b3e14fc5bbc9a7138b9ff1a8',NULL),('29b94bd3d1cb41a5bbd22816a5ef6cb1','','军用关键软件缺陷管理系统需求规格说明书','6afc450a17814fdb8ce6c3b5d9fab724','',NULL),('3b3872a9030e44cab786e1aefe358d48','b93520003d8c4e1087f357182939d90b','高干--开题报告','1773d588551e4e508b2ac3f1d16cd304','b93520003d8c4e1087f357182939d90b',NULL),('7817bb9899ac46bd86df6057d4d031b5','b93520003d8c4e1087f357182939d90b','军用关键软件缺陷管理系统用户手册1.0.0版','8ca61e0a656c470890f5977634451292','b93520003d8c4e1087f357182939d90b',NULL),('942bdc3e062a47309f73fd5c6957a81b','553161f31b10485883da3b8823ccd76b','软件缺陷模式的研究','bcc880a49725414daf55145dfe3adea7','553161f31b10485883da3b8823ccd76b',NULL),('e286505403ad4216ba11c1b7a653af36','15d122dee14c44dbaec72e4c240d40e4','混源软件可控性评价辅助工具详细说明书','ada425abcc004451bff9cf2af24c7881','15d122dee14c44dbaec72e4c240d40e4',NULL),('ff0e222895bf4524a6d993fef1cb196b','','军用关键软件缺陷管理系统用户手册V1.0.0版','c804d5352c71414a948a06f4a7b20749','',NULL);

#
# Structure for table "know_process"
#

DROP TABLE IF EXISTS `know_process`;
CREATE TABLE `know_process` (
  `processID` char(32) NOT NULL DEFAULT '',
  `processName` varchar(64) DEFAULT NULL,
  `processRemark` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`processID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_process"
#

INSERT INTO `know_process` VALUES ('8939e025643049d594d0cdc38495a6c0','软件需求','软件需求','2013-01-08 03:20:09','2013-01-08 03:20:09'),('89fb5fccb6a14ebc9b16cf8a959e219e','编码阶段','编码阶段','2013-01-07 05:35:07','2013-01-07 05:35:07'),('ac7e22bcfd2145d3bd0a30a15adf8a09','测试阶段','测试阶段','2013-01-07 05:35:33','2013-01-07 05:35:33'),('b3aed4375a1d415bbbe31838b568aa35','设计阶段','设计阶段','2013-01-07 05:34:55','2013-01-07 05:34:55'),('d1db5d48461d4590a53566dfd405745b','维护阶段','维护阶段','2013-01-07 05:35:46','2013-01-07 05:35:46');

#
# Structure for table "know_remark"
#

DROP TABLE IF EXISTS `know_remark`;
CREATE TABLE `know_remark` (
  `remarkID` char(32) NOT NULL DEFAULT '',
  `userID` char(32) DEFAULT '',
  `content` varchar(1024) NOT NULL DEFAULT '',
  `modeID` char(32) NOT NULL DEFAULT '',
  `remarkTime` datetime DEFAULT NULL,
  `parentID` char(32) DEFAULT NULL,
  `goodNum` int(11) DEFAULT NULL,
  `badNum` int(11) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`remarkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_remark"
#

INSERT INTO `know_remark` VALUES ('0b46e2f158614049a9854630b9f29887','a31c9395c257411da04c30372cf682f4','','b93520003d8c4e1087f357182939d90b','2019-05-25 15:54:28',NULL,NULL,NULL,'李四'),('0b58a0a201294025b4fc3acd4eebdf9f','65ef758360604137bdccb90a1c9d9b13','','0d3f9bd7ac8745a8a84f5a74bec5a3c6','2019-05-21 19:51:16',NULL,NULL,NULL,'软件需求员'),('34993f68f744484db46686d96f2f77b0','65ef758360604137bdccb90a1c9d9b13','<img src=\"/uploadImages/20190321111828139.jpg\" alt=\"20190321111828139.jpg\">','c4f551a4815440a89d1830049b37d541','2019-03-21 11:18:48',NULL,NULL,NULL,'软件需求员'),('5b5c28d578c44735ac19003a900ad10a','65ef758360604137bdccb90a1c9d9b13','信息','27e428b580864f438a4e18c340d782d2','2019-05-24 08:08:11',NULL,NULL,NULL,'张三'),('81117499a1c8478a9f7ca11a1fa9b28a','65ef758360604137bdccb90a1c9d9b13','它用于研究研究具有','d98ea61764d143ffba28fa8e1e8e1661','2019-03-21 11:38:43',NULL,NULL,NULL,'软件需求员'),('d16a52d135584b53a730baa9f3d449f6','65ef758360604137bdccb90a1c9d9b13','','27e428b580864f438a4e18c340d782d2','2019-05-24 08:08:10',NULL,NULL,NULL,'张三'),('e862237137af463f830a6d6e06f58c25','a31c9395c257411da04c30372cf682f4','','b93520003d8c4e1087f357182939d90b','2019-05-25 15:54:28',NULL,NULL,NULL,'李四'),('f7209d086eaa442086d67064978b1b42','a31c9395c257411da04c30372cf682f4','规划回个话和','4e97adf704724a9b9a5c81e2c1cfdd09','2019-03-21 10:17:38',NULL,NULL,NULL,'李四');

#
# Structure for table "know_rule"
#

DROP TABLE IF EXISTS `know_rule`;
CREATE TABLE `know_rule` (
  `ruleID` char(32) NOT NULL DEFAULT '',
  `programLanguage` varchar(32) DEFAULT NULL,
  `ruleNum` varchar(32) DEFAULT NULL,
  `ruleLevel` varchar(32) DEFAULT NULL,
  `ruleSpecification` varchar(255) DEFAULT NULL,
  `ruleKeyWord` varchar(32) DEFAULT NULL,
  `ruleResource` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ruleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "know_rule"
#

/*!40000 ALTER TABLE `know_rule` DISABLE KEYS */;
INSERT INTO `know_rule` VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `know_rule` ENABLE KEYS */;

#
# Structure for table "know_type"
#

DROP TABLE IF EXISTS `know_type`;
CREATE TABLE `know_type` (
  `typeID` char(32) NOT NULL DEFAULT '',
  `parentID` char(32) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `typeRemark` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `typeOrder` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "know_type"
#

INSERT INTO `know_type` VALUES ('1f36abeac39b40f0af7758ccae90ab4d','79d91358072a42a18e63d3a720b8d131','性能需求','性能需求','2018-12-05 09:09:48','2018-12-05 09:09:48','3',NULL),('24c20dae33a14fe091c229e3c7f89f1d','b4822f5ccd484df1b39a3b7e44c7dadb','模块的接口','模块的接口','2018-12-05 09:20:26','2018-12-05 09:20:26','3',NULL),('27165ccd4e38456fad4a6c33cd1e83da','79d91358072a42a18e63d3a720b8d131','异常需求','异常需求','2018-12-05 09:10:22','2018-12-05 09:10:22','3',NULL),('2f4f0dc0d2194daaaef702965bd49f60','a442f9d8899340f0bbe815374e97a99a','顺序结构','顺序结构','2018-12-05 09:24:24','2018-12-05 09:24:24','3',NULL),('364c92230f404101a14398aef381c472','79d91358072a42a18e63d3a720b8d131','功能需求','功能需求','2018-12-05 09:09:34','2018-12-05 09:09:34','3',NULL),('42b0964e5963487b925bd38890721b4e','w48aceca7cc14437b6ac1f3764a03ecd','容错设计','容错设计','2018-12-05 09:12:34','2018-12-05 09:12:34','2',NULL),('53fe69c8ee83401cbc9c99125141aca9','','测试阶段','测试专题','2019-03-01 16:24:19','2019-03-01 16:24:19',NULL,'uploadImages/20190304152125029.png'),('5ce736c4b07c4b5096cdf717fce9603a','ecc606afc8d643c392da5e9d6c55438a','IF语句','IF语句','2018-12-05 09:24:55','2018-12-05 09:24:55','3',NULL),('654166d5e9064020a916d17270640fc9','w48aceca7cc14437b6ac1f3764a03ecd','模块设计','模块设计','2018-12-05 09:12:04','2018-12-05 09:12:04','2',NULL),('7589b3f3b47349c9973ca10d35967faf','79d91358072a42a18e63d3a720b8d131','接口需求','接口需求','2018-12-05 09:10:02','2018-12-05 09:10:02','3',NULL),('79d91358072a42a18e63d3a720b8d131','g9d91358072a42a18e63d3a720b8d131','完整性要求','完整性要求','2013-01-08 03:20:41','2013-01-08 03:20:41','2',NULL),('82d732a5cd504caf8d8d98cbc4a8d3a4','ecc606afc8d643c392da5e9d6c55438a','循环语句','循环语句','2018-12-05 09:25:29','2018-12-05 09:25:29','3',NULL),('83904a75faa048768bf3bee0bf95747f','a442f9d8899340f0bbe815374e97a99a','语句构造风格','语句构造风格','2018-12-05 09:24:04','2018-12-05 09:24:04','3',NULL),('8d9ca2c6904c4e99b093724aa75ba99e','w48aceca7cc14437b6ac1f3764a03ecd','健壮性设计','健壮性设计','2018-12-05 09:12:19','2018-12-05 09:12:19','2',NULL),('964c1f8237f84a52ac9bd0a0ca183b2d','g9d91358072a42a18e63d3a720b8d131','可验证性要求','可验证性要求','2013-01-08 03:22:11','2013-01-08 03:22:11','2',NULL),('96b0edd423bb4176a085e65f2262aa3e','b4822f5ccd484df1b39a3b7e44c7dadb','模块的规模','模块的规模','2018-12-05 09:19:02','2018-12-05 09:19:02','3',NULL),('a078317106b04465b20ce5e14081c51f','ecc606afc8d643c392da5e9d6c55438a','Switch语句','Switch语句','2018-12-05 09:25:17','2018-12-05 09:25:17','3',NULL),('a442f9d8899340f0bbe815374e97a99a','j48aceca7cc14437b6ac1f3764a03ecd','程序设计风格','程序设计风格','2018-12-05 09:22:05','2018-12-05 09:22:05','2',NULL),('a47e6ab9afb3489183ca05cd784f71ae','a442f9d8899340f0bbe815374e97a99a','源程序文档化','源程序文档化','2018-12-05 09:23:25','2018-12-05 09:23:25','3',NULL),('a5a1ade798af4179a689de34280cf266','','售后服务','售后服务专题','2019-03-04 15:37:25','2019-03-04 15:37:25',NULL,'uploadImages/20190304153792119.jpg'),('aa5a26a730c64fd5bd900cfb1e1d785d','acd93cb0ddbc476e80dff842c5208610','用于','用于','2019-03-05 11:29:35','2019-03-05 11:29:35',NULL,''),('acd93cb0ddbc476e80dff842c5208610','a5a1ade798af4179a689de34280cf266','通天塔','通天塔','2019-03-05 11:26:37','2019-03-05 11:26:37',NULL,''),('b4822f5ccd484df1b39a3b7e44c7dadb','w48aceca7cc14437b6ac1f3764a03ecd','简化设计','简化设计','2018-12-05 09:17:54','2018-12-05 09:17:54','2',NULL),('b48aceca7cc14437b6ac1f3764a03ecd','g9d91358072a42a18e63d3a720b8d131','可追踪性要求','可追踪性要求','2013-01-08 03:22:58','2013-01-08 03:22:58','2',NULL),('bb3bf42e370b4037871c01987d88b3e4','79d91358072a42a18e63d3a720b8d131','数据需求','数据需求','2018-12-05 09:10:11','2018-12-05 09:10:11','3',NULL),('d53d7bbc2e4c4107a6c8338e78d3f03b','a442f9d8899340f0bbe815374e97a99a','头文件结构','头文件结构','2018-12-05 09:24:40','2018-12-05 09:24:40','3',NULL),('e28af05d09d043cb8d9757a7284d2ad1','ecc606afc8d643c392da5e9d6c55438a','函数','函数','2018-12-05 09:25:45','2018-12-05 09:25:45','3',NULL),('e389faee191d45418e1d36069e9b18c7','a442f9d8899340f0bbe815374e97a99a','数据说明风格','数据说明风格','2018-12-05 09:23:45','2018-12-05 09:23:45','3',NULL),('ecc606afc8d643c392da5e9d6c55438a','j48aceca7cc14437b6ac1f3764a03ecd','C语言程序设计','C语言程序设计','2018-12-05 09:22:22','2018-12-05 09:22:22','2',NULL),('ed42812395364b09b3a7a913efe8de0d','g9d91358072a42a18e63d3a720b8d131','一致性要求','一致性要求','2013-01-08 03:21:18','2013-01-08 03:21:18','2',NULL),('g9d91358072a42a18e63d3a720b8d131',NULL,'软件需求','需求专题','2013-01-08 03:20:41','2013-01-08 03:20:41','1','uploadImages/2019030415204648.png'),('j48aceca7cc14437b6ac1f3764a03ecd',NULL,'编码阶段','编码专题','2013-01-08 03:22:11','2013-01-08 03:22:11','1','uploadImages/20190304152165614.png'),('w48aceca7cc14437b6ac1f3764a03ecd',NULL,'设计阶段','设计专题','2013-01-08 03:22:11','2013-01-08 03:22:11','1','uploadImages/20190304152196803.png'),('xd42812395364b09b3a7a913efe8de0d',NULL,'维护阶段','维护专题','2013-01-08 03:22:11','2013-01-08 03:22:11','1','uploadImages/20190304152114048.png');

#
# Structure for table "pbm_bug_category"
#

DROP TABLE IF EXISTS `pbm_bug_category`;
CREATE TABLE `pbm_bug_category` (
  `CategoryID` char(32) NOT NULL DEFAULT '',
  `CategoryName` varchar(255) DEFAULT NULL,
  `CategoryRemark` varchar(255) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pbm_bug_category"
#

INSERT INTO `pbm_bug_category` VALUES ('07f0f0bc859d453b905f64d718ec5894','OK','OK','2018-11-09 15:35:07','2018-11-09 15:35:07');

#
# Structure for table "pbm_bug_info"
#

DROP TABLE IF EXISTS `pbm_bug_info`;
CREATE TABLE `pbm_bug_info` (
  `BugID` char(32) NOT NULL DEFAULT '',
  `BugName` varchar(255) DEFAULT NULL,
  `BugRemark` varchar(255) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`BugID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pbm_bug_info"
#

INSERT INTO `pbm_bug_info` VALUES ('7f0e476e4c3942839ead63274362c18a','OK','OK','2018-11-09 15:35:27','2018-11-09 15:35:27');

#
# Structure for table "sys_dict_category"
#

DROP TABLE IF EXISTS `sys_dict_category`;
CREATE TABLE `sys_dict_category` (
  `CategoryID` char(32) NOT NULL,
  `ParentID` char(32) DEFAULT NULL,
  `CategoryName` varchar(128) NOT NULL DEFAULT '',
  `CategoryCode` varchar(16) DEFAULT '',
  `CategoryOrder` int(11) DEFAULT '0',
  `CategoryRemark` varchar(256) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_dict_category"
#

INSERT INTO `sys_dict_category` VALUES ('7f54a3c6c25f49e3aae2ee6051bf6dca','','模式分类','001',1,'模式分类','2019-05-24 09:09:47','2019-05-24 09:09:47');

#
# Structure for table "sys_dict_entry"
#

DROP TABLE IF EXISTS `sys_dict_entry`;
CREATE TABLE `sys_dict_entry` (
  `EntryID` char(32) NOT NULL,
  `CategoryID` char(32) NOT NULL DEFAULT '',
  `EntryName` varchar(64) NOT NULL DEFAULT '',
  `EntryOrder` int(11) DEFAULT '0',
  `EntryState` char(1) DEFAULT '0',
  `EntryRemark` varchar(256) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`EntryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_dict_entry"
#

INSERT INTO `sys_dict_entry` VALUES ('cfd3208a5d934293afc06e693adf86e2','7f54a3c6c25f49e3aae2ee6051bf6dca','编码阶段',1,'0','编码阶段','2019-05-24 15:26:42','2019-05-24 15:26:42');

#
# Structure for table "sys_file_resource"
#

DROP TABLE IF EXISTS `sys_file_resource`;
CREATE TABLE `sys_file_resource` (
  `FileID` char(32) NOT NULL,
  `UserID` char(32) NOT NULL DEFAULT '',
  `FileTitle` varchar(512) NOT NULL,
  `FileDirectory` varchar(512) NOT NULL,
  `FilePath` varchar(512) NOT NULL,
  `FileName` varchar(512) NOT NULL,
  `FileName2` varchar(512) DEFAULT NULL,
  `FileExtension` varchar(128) NOT NULL,
  `FileStatus` char(1) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_file_resource"
#

INSERT INTO `sys_file_resource` VALUES ('00e87984ecd64bc6857bbda71f4f0ce9','b5f57e7f737a499887b5b205fca07676','汪进银-lunwen','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\25\\15','6cc444618a2a44f7a5096b3344e6856b',NULL,'doc','0','2019-05-25 15:45:50','2019-05-25 15:45:50'),('01fa236493604cc9a65067c30bdc5031','65ef758360604137bdccb90a1c9d9b13','军用关键软件缺陷管理系统用户手册V1.0.0版','E:/PdmInstall/PDM/pdmRoot','2019\\2\\21\\11','09e0afc6e6674145aa4508ebe2562dc9',NULL,'doc','0','2019-03-21 11:43:37','2019-03-21 11:43:37'),('08766c01aecf4323ab3aca85ac519273','65ef758360604137bdccb90a1c9d9b13','知识库资料','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\23\\21','f068eb7e7f3c4a69a52f47d908decf44',NULL,'docx','0','2019-05-23 21:28:07','2019-05-23 21:28:07'),('11d4d45e35414f3db029abb3d2dba9d5','65ef758360604137bdccb90a1c9d9b13','pdf_reports','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\23\\21','28f81b0cf9de426bac5d7f60b811a5bd',NULL,'pdf','0','2019-05-23 21:50:25','2019-05-23 21:50:25'),('13b581a5ca1446c79aa3aaa58b55bef7','65ef758360604137bdccb90a1c9d9b13','简明打印版','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\23\\21','5c6d9b336208400ca9e0c8358a620c65',NULL,'pdf','0','2019-05-23 21:48:49','2019-05-23 21:48:49'),('1581c23369fb4f54b4500fdccf20524c','65ef758360604137bdccb90a1c9d9b13','高干--开题报告','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\24\\8','e8d8087309a74d28b2cf1cd2c031af27',NULL,'doc','0','2019-05-24 08:25:55','2019-05-24 08:25:55'),('1773d588551e4e508b2ac3f1d16cd304','a31c9395c257411da04c30372cf682f4','高干--开题报告','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\25\\15','2e0e6ad34efd4395af17f7e985203b23',NULL,'doc','0','2019-05-25 15:52:16','2019-05-25 15:52:16'),('2f9b82a18cac4634bed07945727c714f','a31c9395c257411da04c30372cf682f4','图','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\22\\9','5b590b95f87f4a25ae087794c95b0935',NULL,'docx','0','2019-05-22 09:06:44','2019-05-22 09:06:44'),('38e40fb2e98a41ed9b1b96446faa8ec2','65ef758360604137bdccb90a1c9d9b13','知识库资料','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\23\\21','c47abc152c2148e6a205c4c56db157f9',NULL,'docx','0','2019-05-23 21:40:19','2019-05-23 21:40:19'),('42a3c86f22a742a1a093f31762fb0297','a31c9395c257411da04c30372cf682f4','新建 Microsoft Office Word 文档','E:/PdmInstall/PDM/pdmRoot','2019\\2\\6\\10','a9d01599dbba4fdebf225525a8ca8e98',NULL,'docx','0','2019-03-06 10:07:05','2019-03-06 10:07:05'),('46305a994b764760a615925d2581551b','a31c9395c257411da04c30372cf682f4','混源软件可控性评价辅助工具详细说明书','E:/PdmInstall/PDM/pdmRoot','2019\\2\\6\\9','fe4d046a186a40939682386c6a38a6af',NULL,'doc','0','2019-03-06 09:59:12','2019-03-06 09:59:12'),('4c3d04c8c5a44c3b80ff769d31af94f7','a31c9395c257411da04c30372cf682f4','混源软件可控性评价辅助工具详细说明书11','E:/PdmInstall/PDM/pdmRoot','2019\\2\\6\\10','8b50ef8855ea49e79b7ff7289272ed30',NULL,'doc','0','2019-03-06 10:15:43','2019-03-06 10:15:43'),('55271e01301b4ea4a26de7afecef33db','65ef758360604137bdccb90a1c9d9b13','军用关键软件缺陷管理系统测试报告(1)','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\24\\8','9a3daa215fe24cb48573c3f906e5231e',NULL,'doc','0','2019-05-24 08:25:54','2019-05-24 08:25:54'),('553cf3f73ae64f3e81b9157054e8a690','a31c9395c257411da04c30372cf682f4','军用关键软件缺陷管理系统用户手册1.0.0版','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\22\\8','4802faf0a72f40af9eeaacb93521cae1',NULL,'docx','0','2019-05-22 08:49:25','2019-05-22 08:49:25'),('5ad5129857814a888a88c3b6c1168284','a31c9395c257411da04c30372cf682f4','混源软件可控性评价辅助工具需求规格说明书','E:/PdmInstall/PDM/pdmRoot','2019\\2\\1\\16','966fe064eb0c41e49085f198a60fca04',NULL,'doc','0','2019-03-01 16:57:29','2019-03-01 16:57:29'),('5deb6d05cf09456abc4ecb6dfa31e7e5','a31c9395c257411da04c30372cf682f4','TestNG','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\22\\8','1e864a9e26554a50aee632f0ff83fd50',NULL,'docx','0','2019-05-22 08:46:02','2019-05-22 08:46:02'),('6440186160364d0cb52ed386a4a7c05f','a31c9395c257411da04c30372cf682f4','beetl视图技术','E:/PdmInstall/PDM/pdmRoot','2019\\2\\6\\10','d8d72f1bd3fc4cada5f58261c8db30f0',NULL,'docx','0','2019-03-06 10:18:20','2019-03-06 10:18:20'),('66279df8c18f4598b3cd52d10331488c','a31c9395c257411da04c30372cf682f4','《C／C++语言编程安全子集》（送审稿）20130305（拟完善）','E:/PdmInstall/PDM/pdmRoot','2019\\2\\6\\10','f0b0a4849b2f4186add4c23786b5f098',NULL,'doc','0','2019-03-06 10:09:24','2019-03-06 10:09:24'),('6afc450a17814fdb8ce6c3b5d9fab724','b5f57e7f737a499887b5b205fca07676','军用关键软件缺陷管理系统需求规格说明书','E:/PdmInstall/PDM/pdmRoot','2019\\2\\19\\13','82d3b9fb772e428bbbef20c55452b4f8',NULL,'doc','0','2019-03-19 13:29:42','2019-03-19 13:29:42'),('6d3dd419192b42fb88e0d6dd1390c13c','a31c9395c257411da04c30372cf682f4','开题报告','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\23\\21','a7f577336ecc4610af3149b0c9561217',NULL,'doc','0','2019-05-23 21:54:54','2019-05-23 21:54:54'),('7aa6a5f1323e4654b9aca8ae9f74c007','a31c9395c257411da04c30372cf682f4','混源软件可控性评价辅助工具详细说明书11','E:/PdmInstall/PDM/pdmRoot','2019\\2\\6\\10','cc7d3b103c95460aadf87b9d7abc00b1',NULL,'doc','0','2019-03-06 10:16:44','2019-03-06 10:16:44'),('7d149bef798e4e809df2d6ea8afde72d','a31c9395c257411da04c30372cf682f4','开题报告','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\23\\21','b6d7374bea11424db50c344e6dda3ad2',NULL,'doc','0','2019-05-23 21:54:47','2019-05-23 21:54:47'),('80e573d88fd440f79d343cfbc8beeda9','a31c9395c257411da04c30372cf682f4','军用关键软件缺陷管理系统测试报告(1)','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\22\\8','591aec5f27024b4d934e3c188c2a3277',NULL,'doc','0','2019-05-22 08:49:17','2019-05-22 08:49:17'),('817b51d9a6da4488ad1dbb88636d864f','a31c9395c257411da04c30372cf682f4','新建 Microsoft Office Word 文档','E:/PdmInstall/PDM/pdmRoot','2019\\2\\6\\9','5b991d38294c4221acf27c2a81f4dbcb',NULL,'docx','0','2019-03-06 09:56:48','2019-03-06 09:56:48'),('8ca61e0a656c470890f5977634451292','a31c9395c257411da04c30372cf682f4','军用关键软件缺陷管理系统用户手册1.0.0版','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\25\\15','3d44101f2b414a829fbf43adf1b72560',NULL,'docx','0','2019-05-25 15:52:11','2019-05-25 15:52:11'),('9b6b6f4bfb5e4527b161137394aa94c5','a31c9395c257411da04c30372cf682f4','军用关键软件缺陷管理系统用户手册1.0.0版','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\25\\15','22730f7e06a44b2c9eaf51f3056891c4',NULL,'docx','0','2019-05-25 15:52:16','2019-05-25 15:52:16'),('9cf9ac88e3cf4e198531e83ef43df98c','65ef758360604137bdccb90a1c9d9b13','军用关键软件缺陷管理系统测试报告(1)','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\24\\8','15225bea76e441eab9d6f4c6d26a549f',NULL,'doc','0','2019-05-24 08:25:44','2019-05-24 08:25:44'),('a79cbd88c9ec49beb26b1a4f31a0352b','d8a70f80fe084c59bacd60902dd7c24e','混源软件可控性评价辅助工具详细说明书11','E:/PdmInstall/PDM/pdmRoot','2019\\2\\19\\13','cfd08d70385340b9870978e74a232b83',NULL,'doc','0','2019-03-19 13:25:41','2019-03-19 13:25:41'),('ada425abcc004451bff9cf2af24c7881','a31c9395c257411da04c30372cf682f4','混源软件可控性评价辅助工具详细说明书','E:/PdmInstall/PDM/pdmRoot','2019\\2\\1\\17','85f47e36c0b6404ea028e58091658368',NULL,'doc','0','2019-03-01 17:01:01','2019-03-01 17:01:01'),('b71f8669e685435cb484b1aea9090c76','d8a70f80fe084c59bacd60902dd7c24e','混源软件可控性评价辅助工具详细说明书11','E:/PdmInstall/PDM/pdmRoot','2019\\2\\19\\13','51db25f649814bbd936996bd24dbb50f',NULL,'doc','0','2019-03-19 13:29:59','2019-03-19 13:29:59'),('bcc880a49725414daf55145dfe3adea7','b5f57e7f737a499887b5b205fca07676','软件缺陷模式的研究','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\25\\15','ac03b7a59fff46dca22874895f8f1de5',NULL,'pdf','0','2019-05-25 15:48:10','2019-05-25 15:48:10'),('c804d5352c71414a948a06f4a7b20749','65ef758360604137bdccb90a1c9d9b13','军用关键软件缺陷管理系统用户手册V1.0.0版','E:/PdmInstall/PDM/pdmRoot','2019\\2\\21\\11','a05b1f7824e6452094eb909c54969d82',NULL,'doc','0','2019-03-21 11:42:11','2019-03-21 11:42:11'),('d9db05ddc63f46258e5143f4c79e50d0','a31c9395c257411da04c30372cf682f4','军用关键软件缺陷管理系统测试报告(1)','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\22\\8','0842b3da12f4481f93cc333dcf073300',NULL,'doc','0','2019-05-22 08:49:24','2019-05-22 08:49:24'),('eda1d87e3ed7437d99d7e1159187345e','a31c9395c257411da04c30372cf682f4','混源软件可控性评价辅助工具详细说明书11','E:/PdmInstall/PDM/pdmRoot','2019\\2\\6\\10','777f9ab787c44279b7ece3bb105756a1',NULL,'doc','0','2019-03-06 10:03:09','2019-03-06 10:03:09'),('f66c0cab84cc42d5ab1a7b413e9f265a','a31c9395c257411da04c30372cf682f4','知识库资料','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\23\\21','49b5615cf9434a398526ab2490f6773b',NULL,'docx','0','2019-05-23 21:54:53','2019-05-23 21:54:53'),('fb7c349d998045799c7cf8200c912976','a31c9395c257411da04c30372cf682f4','知识库资料 2','C:/SoftWares/java/OtherSettings/PdmInstall/PDM/pdmRoot','2019\\4\\22\\9','9bd04d1974af4e4db9f1ee61e1503663',NULL,'docx','0','2019-05-22 09:00:53','2019-05-22 09:00:53');

#
# Structure for table "sys_log"
#

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `ID` char(32) NOT NULL,
  `Type` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `Title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `RemoteAddr` varchar(32) DEFAULT NULL COMMENT '操作IP地址',
  `UserName` varchar(64) NOT NULL DEFAULT '' COMMENT '操作用户名',
  `UserKind` char(1) NOT NULL DEFAULT '' COMMENT '用户类型',
  `TrueName` varchar(32) NOT NULL DEFAULT '' COMMENT '操作用户姓名',
  `RequestUri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `HttpMethod` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `ClassMethod` varchar(255) DEFAULT NULL COMMENT '请求类型.方法',
  `Params` text COMMENT '操作提交的数据',
  `Response` longtext COMMENT '返回内容',
  `UseTime` bigint(20) DEFAULT NULL COMMENT '方法执行时间',
  `Exception` text COMMENT '异常信息',
  `CreateBy` varchar(64) DEFAULT NULL COMMENT '创建者',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建时间',
  `Remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_log"
#

INSERT INTO `sys_log` VALUES ('04fa0864dc69498cbab9cdf32332802e','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"11\",\"moduleIcon\":\"11\",\"moduleName\":\"11\",\"moduleOrder\":1,\"moduleRemark\":\"11\",\"text\":\"11\"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',78,NULL,NULL,NULL,NULL),('13e897e689e948558b214233d0a070f0','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"dsa \",\"moduleIcon\":\"dsa \",\"moduleName\":\"dsa \",\"moduleOrder\":1,\"moduleRemark\":\"dsa \",\"text\":\"dsa \"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',78,NULL,NULL,NULL,NULL),('17ed6855e4084e3496311c98f18d48e3','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"tyu t\",\"moduleIcon\":\"tyu t\",\"moduleName\":\"ty u\",\"moduleOrder\":1,\"moduleRemark\":\"\",\"text\":\"ty u\"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',47,NULL,NULL,NULL,NULL),('1c78267f5ad64351b6c3b72320813e65','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"f78ac0d455494626b07da3a6928c2b58\"]]','{\"message\":\"删除功能模块成功!\",\"success\":true}',94,NULL,NULL,NULL,NULL),('277d0978e94c4ac19b2c99c303c75af8','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"0d817a6d1b934059bc73564ba28d90a8\"]]','{\"message\":\"删除功能模块成功!\",\"success\":true}',47,NULL,NULL,NULL,NULL),('3df78508194c428aba71209f2a5fb7a6','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"803772ff1da14fa2b50474056181ad7c\"]]','{\"message\":\"删除功能模块成功!\",\"success\":true}',203,NULL,NULL,NULL,NULL),('47fd72514516475191973f3ae88abe43','Ajax请求','保存数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.save','[{\"categoryCode\":\"\",\"categoryName\":\"用途\",\"categoryOrder\":1,\"categoryRemark\":\"\",\"parentId\":\"\",\"text\":\"用途\"}]','{\"message\":\"保存数据字典类别成功!\",\"success\":true}',62,NULL,NULL,NULL,NULL),('4ab62b2f09124c1f80820bb03af39d52','Ajax请求','删除数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/delete.jsn','GET','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.delete','[\"36aedf96c0ca4e14b8c8fd87170b7e81\"]','{\"message\":\"删除数据字典类别成功!\",\"success\":true}',47,NULL,NULL,NULL,NULL),('5f62cb839807422f801e1d32c7cd05bc','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"1\",\"moduleIcon\":\"1\",\"moduleName\":\"缺陷管理\",\"moduleOrder\":1,\"moduleRemark\":\"缺陷管理\",\"text\":\"缺陷管理\"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',62,NULL,NULL,NULL,NULL),('6b5986b3877b451e9d9f4525d01899d1','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"a932f7235a154371957c7f301764abb7\"]]','{\"message\":\"删除功能模块成功!\",\"success\":true}',47,NULL,NULL,NULL,NULL),('6ee876aae04d470187e2cf61a9cb4bf7','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"c19c69cb59d4489296f601dd835d1126\"]]','{\"message\":\"删除功能模块成功!\",\"success\":true}',63,NULL,NULL,NULL,NULL),('773c070b4dd0475a84f25caceb29eaa9','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"DA\",\"moduleIcon\":\"DA\",\"moduleName\":\"REW B\",\"moduleOrder\":1,\"moduleRemark\":\"\",\"text\":\"REW B\"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',62,NULL,NULL,NULL,NULL),('80f9890b9e6e4b199cfd50ca6d45758a','Ajax请求','删除数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/delete.jsn','GET','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.delete','[\"2ae75c84900448ad9c49139c8508e01d\"]','{\"message\":\"删除数据字典类别成功!\",\"success\":true}',47,NULL,NULL,NULL,NULL),('8a28569ff97a489bb01d95918e6250f4','Ajax请求','更新功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.update','[{\"iconCls\":\"icon-sys-system\",\"id\":\"2b148815d9c14307b0837d4204ce2efd\",\"moduleIcon\":\"icon-sys-system\",\"moduleId\":\"2b148815d9c14307b0837d4204ce2efd\",\"moduleName\":\"测试管理\",\"moduleOrder\":1,\"moduleRemark\":\"测试管理11\",\"text\":\"测试管理\"}]','{\"success\":true,\"message\":\"更新功能模块成功!\"}',77,NULL,NULL,NULL,NULL),('8acacfcd7dda46d183a736178d0717fe','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"icon-sys-system\",\"moduleIcon\":\"icon-sys-system\",\"moduleName\":\"测试管理\",\"moduleOrder\":1,\"moduleRemark\":\"测试管理\",\"text\":\"测试管理\"}]','{\"success\":true,\"message\":\"保存功能模块成功!\"}',228,NULL,NULL,NULL,NULL),('a21dd4f826a8470da6e73d123ed683c4','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"6d068742b6ab4327bd0807c8cc24d376\"]]','{\"message\":\"删除功能模块成功!\",\"success\":true}',78,NULL,NULL,NULL,NULL),('a54a15c33357455b833fa84fccec1994','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"SA \",\"moduleIcon\":\"SA \",\"moduleName\":\"DAS \",\"moduleOrder\":1,\"moduleRemark\":\"DAS \",\"text\":\"DAS \"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',78,NULL,NULL,NULL,NULL),('b174c1d05fc24a75bbe993395aceb7e0','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"1\",\"moduleIcon\":\"1\",\"moduleName\":\"知识库管理\",\"moduleOrder\":1,\"moduleRemark\":\"知识库管理\",\"text\":\"知识库管理\"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',78,NULL,NULL,NULL,NULL),('bc2d7ea560f042bf8a3d833c623cbc60','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"2b148815d9c14307b0837d4204ce2efd\"]]','{\"success\":true,\"message\":\"删除功能模块成功!\"}',110,NULL,NULL,NULL,NULL),('c3b77ed1eea040c798402e9f32e4f6a4','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"u\",\"moduleIcon\":\"u\",\"moduleName\":\"一\",\"moduleOrder\":1,\"moduleRemark\":\"\",\"text\":\"一\"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',78,NULL,NULL,NULL,NULL),('dd71c61c4954402abc79e9f5853dd26b','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"11\",\"moduleIcon\":\"11\",\"moduleName\":\"11\",\"moduleOrder\":1,\"moduleRemark\":\"\",\"text\":\"11\"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',78,NULL,NULL,NULL,NULL),('de2d6116501b44a2b424d99a6aa05497','Ajax请求','保存数据字典条目','127.0.0.1','SysAdmin','1','系统管理员','http://localhost:8080/sys/dict/entry/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictEntryController.save','[{\"categoryId\":\"7f54a3c6c25f49e3aae2ee6051bf6dca\",\"entryName\":\"编码阶段\",\"entryOrder\":1,\"entryRemark\":\"编码阶段\",\"entryState\":\"0\"}]','{\"success\":true,\"message\":\"保存数据字典条目成功!\"}',68,NULL,NULL,NULL,NULL),('e210efd4a8af47c6a1ce29235e67d53a','Ajax请求','保存数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.save','[{\"categoryCode\":\"\",\"categoryName\":\" 他\",\"categoryOrder\":1,\"categoryRemark\":\"\",\"parentId\":\"\",\"text\":\" 他\"}]','{\"message\":\"保存数据字典类别成功!\",\"success\":true}',47,NULL,NULL,NULL,NULL),('e29dd4d654db4adc9d3aba340d3497a8','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"b700e10afd2547828f21af7f2ba70302\"]]','{\"message\":\"删除功能模块成功!\",\"success\":true}',78,NULL,NULL,NULL,NULL),('eb7a6395f4d14f3f9fed31760b10b216','Ajax请求','保存数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.save','[{\"categoryCode\":\"001\",\"categoryName\":\"模式分类\",\"categoryOrder\":1,\"categoryRemark\":\"模式分类\",\"parentId\":\"\",\"text\":\"模式分类\"}]','{\"success\":true,\"message\":\"保存数据字典类别成功!\"}',54,NULL,NULL,NULL,NULL);

#
# Structure for table "sys_module"
#

DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `ModuleID` char(32) NOT NULL,
  `ModuleName` varchar(64) NOT NULL DEFAULT '',
  `ModuleIcon` varchar(64) NOT NULL DEFAULT '',
  `ModuleOrder` int(11) DEFAULT '0',
  `ModuleFlag` char(1) DEFAULT '0',
  `ModuleRemark` varchar(128) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ModuleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_module"
#

INSERT INTO `sys_module` VALUES ('36c5c49a53c946268da65799c30febd7','知识库管理','1',1,'0','知识库管理','2018-12-04 14:05:45','2018-12-04 14:05:45'),('9fb657a612d5401885feb8389d89adde','系统管理','icon-sys-system',0,'1','系统管理','2018-07-27 16:48:25','2018-07-27 16:48:25'),('d4f0ed650a824e8aa66a4dde5947764b','缺陷管理','1',1,'0','缺陷管理','2018-11-09 13:29:46','2018-11-09 13:29:46'),('e885e1a8504d4948aa94f3321e1cb212','项目管理','icon-sys-system',1,'0','项目管理','2018-11-06 16:28:17','2018-11-06 16:28:17');

#
# Structure for table "sys_module_page"
#

DROP TABLE IF EXISTS `sys_module_page`;
CREATE TABLE `sys_module_page` (
  `PageID` char(32) NOT NULL,
  `ParentID` char(32) DEFAULT NULL,
  `ModuleID` char(32) NOT NULL DEFAULT '',
  `PageName` varchar(64) NOT NULL DEFAULT '',
  `PageIcon` varchar(64) DEFAULT NULL,
  `PageURL` varchar(128) DEFAULT NULL,
  `PageOrder` int(11) DEFAULT '0',
  `PageFlag` char(1) DEFAULT '0',
  `PageToken` varchar(128) DEFAULT 'N',
  `PageRemark` varchar(128) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`PageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_module_page"
#

INSERT INTO `sys_module_page` VALUES ('069bbc414ab8411c9a29ed0392e2b288','21f05ba9a46246159cdb70cd1aa248eb','36c5c49a53c946268da65799c30febd7','缺陷预防管理','icon-hamburg-docs','knowledge/mode/prevention/default.htm',1,'0','','缺陷预防管理','2018-12-06 15:42:03','2018-12-07 17:34:06'),('0df79332ad624a2b8fd3e7d4c2aecf86','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','产品清单管理','icon-hamburg-docs','epm/bom/entry/default.htm',1,'0','','产品清单管理','2018-11-12 15:34:18','2018-11-12 16:50:51'),('0ef8f4dd71ad42328a3013114b1b1c89','d1fdb8e9c029445f929480036641e2be','d4f0ed650a824e8aa66a4dde5947764b','缺陷类型管理','icon-hamburg-docs','pbm/bug/category/default.htm',1,'0','','缺陷类型管理','2018-11-09 13:31:23','2018-11-13 11:36:18'),('14e29d388ecb4396b466cf255a7291f5','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','项目计划管理','icon-hamburg-docs','epm/task/info/default.htm',1,'0','','项目计划管理','2018-11-12 15:35:39','2018-11-13 11:12:16'),('21f05ba9a46246159cdb70cd1aa248eb','','36c5c49a53c946268da65799c30febd7','缺陷模式管理','icon-hamburg-docs','',1,'0','','缺陷模式管理','2018-12-07 17:33:36','2018-12-07 17:40:38'),('220ba4dfa9bb4d21b37d3b21d9baa986','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','用户管理','icon-sys-users','sys/user/manage/default.htm',8,'1','sys:admin:user','用户管理(系统管理员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('254cd01a715a46d688f5986608c6c0f2','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','项目文档管理','icon-hamburg-docs','epm/project/document/default.htm',1,'0','','项目文档管理','2018-11-12 15:35:03','2018-11-13 10:18:41'),('25a4dba9b50b49d4b62595dcdbe76481','70c4720fac86438bb918196bf3cdf108','9fb657a612d5401885feb8389d89adde','文件审计','icon-sys-files','sys/file/default.htm',4,'1','sys:secrecy:file','文件审计(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('26dc6a5e6527489eb3c368a125541fba','d1fdb8e9c029445f929480036641e2be','d4f0ed650a824e8aa66a4dde5947764b','缺陷信息管理','icon-hamburg-docs','pbm/bug/info/default.htm',2,'0','','缺陷信息管理','2018-11-09 13:31:40','2018-11-13 11:36:29'),('29b20c5d26f54430a65a0d32a9553f4c','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','角色管理','icon-sys-role','sys/role/manage/default.htm',4,'1','sys:operator:role','角色管理(系统维护员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('31ca83c77dd64298a95a46a8567d1cf7','70c4720fac86438bb918196bf3cdf108','9fb657a612d5401885feb8389d89adde','日志审计','icon-sys-logs','sys/log/admin/default.htm',1,'1','sys:admin:log','日志审计(系统管理员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('3e39bc1123f1432c9e7264390a5ff921','21f05ba9a46246159cdb70cd1aa248eb','36c5c49a53c946268da65799c30febd7','缺陷规则管理','icon-hamburg-docs','knowledge/mode/rule/default.htm',1,'0','','缺陷规则管理','2018-12-07 09:34:28','2018-12-07 17:34:13'),('3f922d51b9ac4b5f9b0b2f5a49503fc1','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','岗位授权','icon-sys-position','sys/position/auth/default.htm',7,'1','sys:secrecy:position','岗位授权(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('463c790f8e1142979bea24bcc0f77071','6a1de74e722c42d68a2f98021d03823e','9fb657a612d5401885feb8389d89adde','字典条目','icon-hamburg-docs','sys/dict/entry/default.htm',2,'1','','字典条目','2018-11-06 10:42:08','2018-11-06 10:42:08'),('4eabad306e0e4a07843353c54beaabbf','','e885e1a8504d4948aa94f3321e1cb212','项目管理','icon-sys-system','',1,'0','','项目管理','2018-11-06 17:15:29','2018-11-09 16:02:54'),('581e823392cb4cebb7ae54495b190944','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','组织机构','icon-sys-organization','sys/org/default.htm',3,'1','sys:admin:org','组织机构(系统管理员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('5b62a9c77f994c388b7c00571a0fb168','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','项目类型管理','icon-hamburg-docs','epm/project/type/default.htm',1,'0','','项目类型管理','2018-11-07 17:07:35','2018-11-13 11:35:54'),('5c1f4adcbb9041cabd80a131b355660d','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','项目群管理','icon-hamburg-docs','epm/project/group/default.htm',3,'0','','项目群管理','2018-11-07 16:29:32','2018-11-07 17:07:55'),('66c399b0922942629037d0b45a2c7371','70c4720fac86438bb918196bf3cdf108','9fb657a612d5401885feb8389d89adde','日志审计','icon-sys-logs','sys/log/secrecy/default.htm',2,'1','sys:secrecy:log','日志审计(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('675d82b8c0e14a549d967d0309ba4fe0','','36c5c49a53c946268da65799c30febd7','首页','icon-hamburg-docs','knowledge/main/default.htm',1,'0','','首页','2018-12-13 11:12:04','2018-12-13 11:17:53'),('681c6483a57d465ca03309d6d680c025','','d4f0ed650a824e8aa66a4dde5947764b','布局练习','icon-hamburg-docs','epm/project/info/test.htm',1,'0','','布局练习','2018-11-30 13:40:53','2018-11-30 13:41:47'),('69678792135649e680b494efcc64ca61','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','模块管理','icon-sys-modules','sys/module/default.htm',1,'1','sys:operator:module','模块管理(系统维护员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('6a1de74e722c42d68a2f98021d03823e','d99dcce3564746e484be16c6c88600eb','9fb657a612d5401885feb8389d89adde','数据字典','icon-hamburg-docs','',2,'1','','数据字典','2018-11-06 10:40:30','2018-11-06 10:40:30'),('6f7ddef55462441fa9d762807ae18adb','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','项目管理','icon-hamburg-docs','epm/project/info/default.htm',2,'0','','项目管理','2018-11-07 16:29:19','2018-11-26 08:45:06'),('70c4720fac86438bb918196bf3cdf108','d99dcce3564746e484be16c6c88600eb','9fb657a612d5401885feb8389d89adde','系统审计','icon-sys-log-audit','',3,'1','','系统审计','2018-07-27 16:48:25','2018-11-06 10:39:59'),('72143ea610a94204abf4e3252fe598be','21f05ba9a46246159cdb70cd1aa248eb','36c5c49a53c946268da65799c30febd7','缺陷后果管理','icon-hamburg-docs','knowledge/mode/consequence/default.htm',1,'0','','缺陷后果管理','2018-12-06 15:41:45','2018-12-07 17:34:21'),('778e051e39bf44cd99b0f0cedb52228b','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','我的项目','icon-hamburg-docs','epm/my/project/default.htm',1,'0','1','我的项目','2018-11-22 10:22:10','2018-11-22 10:22:10'),('815c504199e04d3fa7fdc51945d66eac','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','岗位管理','icon-sys-position','sys/position/manage/default.htm',6,'1','sys:admin:position','岗位管理(系统管理员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('91998dea78614d1f88dc2fa5309a394d','d99dcce3564746e484be16c6c88600eb','9fb657a612d5401885feb8389d89adde','系统配置','icon-sys-system-manage','',1,'1','','系统配置','2018-07-27 16:48:25','2018-07-27 16:48:25'),('963f8969afae4ef68cd89eedcb424582','6a1de74e722c42d68a2f98021d03823e','9fb657a612d5401885feb8389d89adde','字典类别','icon-hamburg-docs','sys/dict/category/default.htm',1,'1','','字典类别','2018-11-06 10:41:22','2018-11-06 10:41:22'),('a64306d2632e4cb081c1fdc4091b7360','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','项目模板管理','icon-hamburg-docs','epm/bom/template/default.htm',1,'0','','项目模板管理','2018-11-12 11:00:29','2018-11-12 11:02:35'),('a923f079b5e847dfbc9afd0ea96586ef','21f05ba9a46246159cdb70cd1aa248eb','36c5c49a53c946268da65799c30febd7','缺陷原因管理','icon-hamburg-docs','knowledge/mode/reason/default.htm',1,'0','','缺陷原因管理','2018-12-06 15:41:19','2018-12-07 17:34:29'),('aa65756980694064ad3e54755d528b54','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','角色授权','icon-sys-role','sys/role/auth/default.htm',5,'1','sys:secrecy:role','角色授权(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('b586dfac1fe54feebaf5b3191d6a6259','','36c5c49a53c946268da65799c30febd7','缺陷模式','icon-sys-system','knowledge/mode/default.htm',1,'0','','缺陷模式','2018-12-05 10:35:19','2018-12-07 17:38:39'),('bc30619566094e8f967d053c18d36347','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','页面管理','icon-sys-module-pages','sys/page/default.htm',2,'1','sys:operator:page','页面管理(系统维护员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('c4129752379d47a9b69b6a088e8286f1','21f05ba9a46246159cdb70cd1aa248eb','36c5c49a53c946268da65799c30febd7','知识分类管理','icon-hamburg-docs','knowledge/type/default.htm',1,'0','','知识分类管理','2018-12-04 16:46:46','2018-12-07 17:33:56'),('d15cb21a57fd4f63be7a8267fc9475e2','','36c5c49a53c946268da65799c30febd7','缺陷模式知识库','icon-sys-system','knowledge/box/default.htm',1,'0','','知识库','2018-12-04 14:09:53','2018-12-07 17:38:51'),('d1fdb8e9c029445f929480036641e2be','','d4f0ed650a824e8aa66a4dde5947764b','缺陷管理','icon-hamburg-docs','',1,'0','','缺陷管理','2018-11-09 13:31:00','2018-11-09 16:02:47'),('d99dcce3564746e484be16c6c88600eb','','9fb657a612d5401885feb8389d89adde','系统管理','icon-sys-system','',1,'1','','系统管理','2018-07-27 16:48:25','2018-07-27 16:48:25'),('dff3b70d214c402db0920554faa7ca06','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','用户授权','icon-sys-users','sys/user/auth/default.htm',9,'1','sys:secrecy:user','用户授权(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('e2ae0834acdf4bc4a182aaca98008f65','70c4720fac86438bb918196bf3cdf108','9fb657a612d5401885feb8389d89adde','日志审计','icon-sys-logs','sys/log/auditor/default.htm',3,'1','sys:auditor:log','日志审计(安全审计员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('f7c8432c28c64594b98c6e6230505958','21f05ba9a46246159cdb70cd1aa248eb','36c5c49a53c946268da65799c30febd7','知识过程管理','icon-hamburg-docs','knowledge/process/default.htm',1,'0','','知识过程管理','2018-12-04 17:18:13','2018-12-07 17:34:50');

#
# Structure for table "sys_organization"
#

DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `DepartmentID` char(32) NOT NULL DEFAULT '',
  `ParentID` char(32) DEFAULT NULL,
  `DepartmentName` varchar(64) NOT NULL DEFAULT '',
  `DepartmentCode` char(10) DEFAULT NULL,
  `DepartmentKind` char(3) NOT NULL DEFAULT '',
  `DepartmentOrder` int(11) DEFAULT '0',
  `DepartmentRemark` varchar(128) DEFAULT NULL,
  `DepartmentVisibility` char(1) DEFAULT '0',
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `ParentID` (`ParentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_organization"
#

INSERT INTO `sys_organization` VALUES ('0a4ba18086f04f3aa82c359b18687aec','f7272c15c2074ccaa99399b333666ce6','系统管理部门','XTZZ-00002','dpt',0,'系统管理部门','1','2018-07-27 16:48:25','2018-07-27 16:48:25'),('726325bfc6714737afa55142deabf7c1','e5c36eb426c34e469f3ccc863fef2724','科研管理处','ZZJG-00006','dpt',1,'科研管理处','0','2018-07-30 18:13:29','2019-05-24 09:03:21'),('c6aa7b1e70d445be850b9c5509f4a3a7','e5c36eb426c34e469f3ccc863fef2724','发展计划处','ZZJG-00007','dpt',2,'发展计划处','0','2018-07-30 18:13:41',NULL),('e5c36eb426c34e469f3ccc863fef2724','','北京计算机技术及应用研究所','ZZJG-00005','ogn',1,'北京计算机技术及应用研究所','0','2018-07-30 18:13:10',NULL),('f7272c15c2074ccaa99399b333666ce6','','系统组织','XTZZ-00001','ogn',0,'系统组织(用于组织系统内置的账号)','1','2018-07-27 16:48:25','2018-07-27 16:48:25');

#
# Structure for table "sys_organization_relationship"
#

DROP TABLE IF EXISTS `sys_organization_relationship`;
CREATE TABLE `sys_organization_relationship` (
  `ID` char(32) NOT NULL,
  `DepartmentID` char(32) NOT NULL,
  `ParentID` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_organization_relationship"
#

INSERT INTO `sys_organization_relationship` VALUES ('01dd058b488e4053aac537700a54774d','c65686959f0544ff92e4c0e5a127e277','c65686959f0544ff92e4c0e5a127e277'),('0619a48b678d40b499a031b819994a36','fc3cb78110844438948df02659077db0','fc3cb78110844438948df02659077db0'),('0dbb8121eeb142c98ef90bdc85d673ab','8fbcdbcc9f6e4466bef1a9699d03ba6a','e5c36eb426c34e469f3ccc863fef2724'),('13ee12ffd36b4bce85de00117d358cac','726325bfc6714737afa55142deabf7c1','726325bfc6714737afa55142deabf7c1'),('4ff0eea6cc964f959c9ae02b22e6e247','8fbcdbcc9f6e4466bef1a9699d03ba6a','8fbcdbcc9f6e4466bef1a9699d03ba6a'),('58cea3dd8c6b4f0a929fd5a75978057c','c6aa7b1e70d445be850b9c5509f4a3a7','e5c36eb426c34e469f3ccc863fef2724'),('6f1d345ee1524983aff26137907f88b2','fc3cb78110844438948df02659077db0','e5c36eb426c34e469f3ccc863fef2724'),('71fc5dbf73bd4109bbc3a5b3933fed32','e5c36eb426c34e469f3ccc863fef2724','e5c36eb426c34e469f3ccc863fef2724'),('726b046587714eb3949bd5b3cfa892f0','726325bfc6714737afa55142deabf7c1','e5c36eb426c34e469f3ccc863fef2724'),('9181a1379cd442bf9457ab348188bbc4','c65686959f0544ff92e4c0e5a127e277','e5c36eb426c34e469f3ccc863fef2724'),('d639d30846d744a1a6e2129dbf0650b5','c6aa7b1e70d445be850b9c5509f4a3a7','c6aa7b1e70d445be850b9c5509f4a3a7');

#
# Structure for table "sys_position"
#

DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position` (
  `PositionID` char(32) NOT NULL,
  `DepartmentID` char(32) DEFAULT NULL,
  `PositionName` varchar(64) NOT NULL DEFAULT '',
  `PositionRemark` varchar(128) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_position"
#

INSERT INTO `sys_position` VALUES ('0ce49fe27ecf4a8da0d165c89c97995d','726325bfc6714737afa55142deabf7c1','测试部','测试部','2019-05-23 15:49:23','2019-05-23 15:49:23'),('1a6f63247b4344b3bedd319eafedb227','726325bfc6714737afa55142deabf7c1','研发部副主任','研发部副主任','2018-07-27 16:48:25','2018-08-02 16:34:11'),('b5ed35aceabc48f7947e9c097cf99cc4','e5c36eb426c34e469f3ccc863fef2724','测试管理处','测试管理处','2019-05-24 07:37:26','2019-05-24 07:37:26');

#
# Structure for table "sys_position_member"
#

DROP TABLE IF EXISTS `sys_position_member`;
CREATE TABLE `sys_position_member` (
  `ID` char(32) NOT NULL,
  `PositionID` char(32) NOT NULL DEFAULT '',
  `UserID` char(32) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_position_member"
#

INSERT INTO `sys_position_member` VALUES ('de096f85fc3a472db025f842c819a610','1a6f63247b4344b3bedd319eafedb227','5640800f25894940bddd887da449bcff','2018-07-28 15:11:10');

#
# Structure for table "sys_position_scope"
#

DROP TABLE IF EXISTS `sys_position_scope`;
CREATE TABLE `sys_position_scope` (
  `ID` char(32) NOT NULL,
  `PositionID` char(32) NOT NULL DEFAULT '',
  `DepartmentID` char(32) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_position_scope"
#

INSERT INTO `sys_position_scope` VALUES ('53bcf957acd3461f992feaeae2a4d8a5','1a6f63247b4344b3bedd319eafedb227','c6aa7b1e70d445be850b9c5509f4a3a7','2019-05-24 08:00:20'),('8d45c0fc77a347d4b02f8c56fad3f42b','1a6f63247b4344b3bedd319eafedb227','3ede888ea7a24bbaa693beab010896aa','2018-07-28 15:44:46'),('d6dbbbdc87984689b9094833b113fb8d','1a6f63247b4344b3bedd319eafedb227','9e050156d6b8471d82885afa3f3273d9','2018-07-28 15:44:46');

#
# Structure for table "sys_role"
#

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `RoleID` char(32) NOT NULL,
  `RoleName` varchar(64) NOT NULL DEFAULT '',
  `RoleCode` char(16) NOT NULL DEFAULT '',
  `RoleKind` char(1) DEFAULT '0',
  `RoleRemark` varchar(128) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_role"
#

INSERT INTO `sys_role` VALUES ('4a80b4f3137240268fdc47b96171b250','安全保密员','XTJS-00002','1','安全保密员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('62824bf62b2e4f86bd29ce80ba325fff','系统管理员','XTJS-00001','1','系统管理员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('65ad8b12872e4824b70c6f9bd5073a40','系统维护员','XTJS-00004','1','系统维护员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('660d128488ce40db9bb28002236ad7f3','安全审计员','XTJS-00003','1','安全审计员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('a31bf9f425e94ca79c0caaf92939772d','部门系统管理员','Admin','0','部门系统管理员','2018-07-28 16:11:06','2018-10-14 11:28:24'),('fb3ecf4b176b4cdfa28920cdd692be17','缺陷模式管理员','BugManager','0','缺陷模式知识库系统管理员','2019-03-19 10:50:53','2019-03-19 10:50:53');

#
# Structure for table "sys_role_member"
#

DROP TABLE IF EXISTS `sys_role_member`;
CREATE TABLE `sys_role_member` (
  `ID` char(32) NOT NULL,
  `RoleID` char(32) NOT NULL DEFAULT '',
  `UserID` char(32) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_role_member"
#

INSERT INTO `sys_role_member` VALUES ('1055a95c30ce482e9acd77b874357e08','4a80b4f3137240268fdc47b96171b250','89752b0582bd441081dd44ebaec9dce6','2018-05-27 13:02:42'),('383f4a15ebf2469289716584c05c7681','a31bf9f425e94ca79c0caaf92939772d','65ef758360604137bdccb90a1c9d9b13','2019-03-15 17:34:29'),('62ad312863b544838543467d9eecd001','62824bf62b2e4f86bd29ce80ba325fff','4b3f9165daas4ec4b85efdc2d6135652','2017-12-02 14:15:56'),('894740f36dae45eaba8c0e516aba3e5c','65ad8b12872e4824b70c6f9bd5073a40','e5f3439932714d7c979f15f6f05b6add','2018-05-27 13:02:28'),('a22de891277b4909be9ad0be0b248395','660d128488ce40db9bb28002236ad7f3','8aaddbaa7de24b938d8771663a313856','2017-12-02 14:15:56'),('b35a80e42c184ce399582ab628107895','fb3ecf4b176b4cdfa28920cdd692be17','d8a70f80fe084c59bacd60902dd7c24e','2019-03-19 11:08:22'),('b3f398e97af742d2809f4e31eabace8f','a31bf9f425e94ca79c0caaf92939772d','fcb9a7a7eae8448082bea33293e96271','2019-05-25 15:38:55'),('c31e66360c8845e380b61dac841eb666','a31bf9f425e94ca79c0caaf92939772d','b4d71b85ffa540e79159ffa9679fe6e3','2018-12-19 17:37:51'),('e7d36bf49d264642bdfaf8c305bd1736','fb3ecf4b176b4cdfa28920cdd692be17','b5f57e7f737a499887b5b205fca07676','2019-03-19 10:53:42'),('ffbd3df1e2fc423ea19906f5a937feb7','fb3ecf4b176b4cdfa28920cdd692be17','fcb9a7a7eae8448082bea33293e96271','2019-05-25 15:38:55');

#
# Structure for table "sys_role_page"
#

DROP TABLE IF EXISTS `sys_role_page`;
CREATE TABLE `sys_role_page` (
  `ID` char(32) NOT NULL,
  `RoleID` char(32) NOT NULL,
  `PageID` char(32) NOT NULL,
  `Flag` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_role_page"
#

INSERT INTO `sys_role_page` VALUES ('082a0f167b2b40629dbaf48a81b3874f','fb3ecf4b176b4cdfa28920cdd692be17','b586dfac1fe54feebaf5b3191d6a6259','1'),('098860793a274afa87bbcc0024c6e486','65ad8b12872e4824b70c6f9bd5073a40','6a1de74e722c42d68a2f98021d03823e','0'),('0b8ccc69ae294d7c8bd87c0561666ed3','62824bf62b2e4f86bd29ce80ba325fff','581e823392cb4cebb7ae54495b190944','1'),('19f186a1d86a4a82ac7a6e2ac00da692','a31bf9f425e94ca79c0caaf92939772d','681c6483a57d465ca03309d6d680c025','1'),('24bc9b63c2e14d268ce1181ee2a03464','65ad8b12872e4824b70c6f9bd5073a40','29b20c5d26f54430a65a0d32a9553f4c','1'),('25b910dc614a4fd9945b52e9071e5d2b','fb3ecf4b176b4cdfa28920cdd692be17','c4129752379d47a9b69b6a088e8286f1','1'),('281e2e6907c74ec687d983f892516f78','65ad8b12872e4824b70c6f9bd5073a40','963f8969afae4ef68cd89eedcb424582','1'),('29c8272074a742988a3a1016f520cdaa','a31bf9f425e94ca79c0caaf92939772d','14e29d388ecb4396b466cf255a7291f5','1'),('2a22924b2e354dc299ee70d1fc864a5d','660d128488ce40db9bb28002236ad7f3','d99dcce3564746e484be16c6c88600eb','0'),('2ac8e3a3eeac43f2866dd241f8189b74','62824bf62b2e4f86bd29ce80ba325fff','31ca83c77dd64298a95a46a8567d1cf7','1'),('2bdff4319d034a3d9528fff3a544d5cb','a31bf9f425e94ca79c0caaf92939772d','675d82b8c0e14a549d967d0309ba4fe0','1'),('399c8d5498014f3bbbe3b77b203c603e','a31bf9f425e94ca79c0caaf92939772d','b586dfac1fe54feebaf5b3191d6a6259','1'),('39aeab37281e4ad6b03cdac4ea7435a6','a31bf9f425e94ca79c0caaf92939772d','d1fdb8e9c029445f929480036641e2be','0'),('3a97864b67ab41b084c825f345611d3f','4a80b4f3137240268fdc47b96171b250','aa65756980694064ad3e54755d528b54','1'),('3d8dec93b0c34b068797e9a621f0d288','4a80b4f3137240268fdc47b96171b250','25a4dba9b50b49d4b62595dcdbe76481','1'),('3df5b9f5c92641e9b2aaefb864f931fe','4a80b4f3137240268fdc47b96171b250','91998dea78614d1f88dc2fa5309a394d','0'),('42b5711fd6d648b883653f8e072ce694','4a80b4f3137240268fdc47b96171b250','66c399b0922942629037d0b45a2c7371','1'),('4b4503f6d1c04569951df828f5bcb8d1','a31bf9f425e94ca79c0caaf92939772d','5b62a9c77f994c388b7c00571a0fb168','1'),('4dec9f6e74414c0393f0c02ae0fadc0c','a31bf9f425e94ca79c0caaf92939772d','26dc6a5e6527489eb3c368a125541fba','1'),('5262e1cba9b7492897e3abaf33251d8f','a31bf9f425e94ca79c0caaf92939772d','72143ea610a94204abf4e3252fe598be','1'),('533a0084770e441e9336168a713b6714','a31bf9f425e94ca79c0caaf92939772d','5c1f4adcbb9041cabd80a131b355660d','1'),('56cb58aa6fc14ccdb31a2ea63b5c734b','a31bf9f425e94ca79c0caaf92939772d','254cd01a715a46d688f5986608c6c0f2','1'),('5946e9be2c6e4dec858b0983aec63a31','fb3ecf4b176b4cdfa28920cdd692be17','069bbc414ab8411c9a29ed0392e2b288','1'),('686ba25bd7674a2da7c7b50ecf12f6ba','a31bf9f425e94ca79c0caaf92939772d','0df79332ad624a2b8fd3e7d4c2aecf86','1'),('6bdecc0ecedf4522a234021af3f11fc5','660d128488ce40db9bb28002236ad7f3','70c4720fac86438bb918196bf3cdf108','0'),('6fb4f6d5b8d6464bbcad6e5c7237df64','62824bf62b2e4f86bd29ce80ba325fff','6a1de74e722c42d68a2f98021d03823e','0'),('747e3849843d42e9b219560584696a9e','65ad8b12872e4824b70c6f9bd5073a40','bc30619566094e8f967d053c18d36347','1'),('77fd17b5e0d64872b9597597bb7a3aa6','a31bf9f425e94ca79c0caaf92939772d','a64306d2632e4cb081c1fdc4091b7360','1'),('79f26f947dea4b5c8c95459cfbde6a2f','660d128488ce40db9bb28002236ad7f3','e2ae0834acdf4bc4a182aaca98008f65','1'),('7ad949938bca47e7a8a6523a03463e8e','fb3ecf4b176b4cdfa28920cdd692be17','a923f079b5e847dfbc9afd0ea96586ef','1'),('7c507cb993dd411fbf6727cee43fbddd','a31bf9f425e94ca79c0caaf92939772d','3e39bc1123f1432c9e7264390a5ff921','1'),('7c7a186b43c4487d9ffa6569d2c6fa83','a31bf9f425e94ca79c0caaf92939772d','069bbc414ab8411c9a29ed0392e2b288','1'),('7ceb75756e364cb29488f4716da64383','a31bf9f425e94ca79c0caaf92939772d','6f7ddef55462441fa9d762807ae18adb','1'),('8662eedc71194b6aaf225e12b8ec390b','a31bf9f425e94ca79c0caaf92939772d','4eabad306e0e4a07843353c54beaabbf','0'),('8884de631a4c4e73bbc9c9219e16ef43','62824bf62b2e4f86bd29ce80ba325fff','70c4720fac86438bb918196bf3cdf108','0'),('89df2ed2e48f42cc952fca137917e97b','62824bf62b2e4f86bd29ce80ba325fff','d99dcce3564746e484be16c6c88600eb','0'),('8d9cfe2ff9954e1a9ab853990b3d51a8','a31bf9f425e94ca79c0caaf92939772d','778e051e39bf44cd99b0f0cedb52228b','1'),('9d666566ad0e426095ebe65a0d799d02','65ad8b12872e4824b70c6f9bd5073a40','91998dea78614d1f88dc2fa5309a394d','0'),('9fd04ffb01b24b6fb513eb7a46700413','a31bf9f425e94ca79c0caaf92939772d','c4129752379d47a9b69b6a088e8286f1','1'),('ae77555235814116819ba9b1b52fd3b5','65ad8b12872e4824b70c6f9bd5073a40','d99dcce3564746e484be16c6c88600eb','0'),('ae837f09031e4c81b49a9db3d3e912bc','4a80b4f3137240268fdc47b96171b250','3f922d51b9ac4b5f9b0b2f5a49503fc1','1'),('b1454c532aa748f9956f15d153642907','a31bf9f425e94ca79c0caaf92939772d','f7c8432c28c64594b98c6e6230505958','1'),('b1b2b82580374307870f6c99dfff8664','62824bf62b2e4f86bd29ce80ba325fff','463c790f8e1142979bea24bcc0f77071','1'),('b753a536181d467e9d3289626824cac8','fb3ecf4b176b4cdfa28920cdd692be17','d15cb21a57fd4f63be7a8267fc9475e2','1'),('b7db6ccabd594d309c23dbe61288a1f7','a31bf9f425e94ca79c0caaf92939772d','0ef8f4dd71ad42328a3013114b1b1c89','1'),('bff7494527c24eddb930c22b4f8846dc','a31bf9f425e94ca79c0caaf92939772d','a923f079b5e847dfbc9afd0ea96586ef','1'),('c63cb6b8f1a94ef986c8bef184176cf7','fb3ecf4b176b4cdfa28920cdd692be17','72143ea610a94204abf4e3252fe598be','1'),('c76b8928367348c39222e7d4a629d058','62824bf62b2e4f86bd29ce80ba325fff','815c504199e04d3fa7fdc51945d66eac','1'),('c8d776410ea64f798b3fdf7007ee4444','4a80b4f3137240268fdc47b96171b250','d99dcce3564746e484be16c6c88600eb','0'),('cf1ef41334824da79e1639a1655579c0','62824bf62b2e4f86bd29ce80ba325fff','220ba4dfa9bb4d21b37d3b21d9baa986','1'),('d548a4ae10484258a1c8ac8f35514b7b','fb3ecf4b176b4cdfa28920cdd692be17','f7c8432c28c64594b98c6e6230505958','1'),('d643e2e206ea40b4a20ef3524d80ab9f','62824bf62b2e4f86bd29ce80ba325fff','91998dea78614d1f88dc2fa5309a394d','0'),('d9f981df0c794a4f88d9d122fabb4bd3','65ad8b12872e4824b70c6f9bd5073a40','69678792135649e680b494efcc64ca61','1'),('db3b2394268e43ad82fb4868c632001e','4a80b4f3137240268fdc47b96171b250','dff3b70d214c402db0920554faa7ca06','1'),('dd52c10175434dfcb24e2163308c9cb4','a31bf9f425e94ca79c0caaf92939772d','21f05ba9a46246159cdb70cd1aa248eb','0'),('e4bef4ec5d014df98edff2c5f540037c','fb3ecf4b176b4cdfa28920cdd692be17','3e39bc1123f1432c9e7264390a5ff921','1'),('ef9a64ec29604e2aacc86396a8bdc3be','a31bf9f425e94ca79c0caaf92939772d','d15cb21a57fd4f63be7a8267fc9475e2','1'),('f6a65cb31bdf4cbea3dc3291725f6c6a','4a80b4f3137240268fdc47b96171b250','70c4720fac86438bb918196bf3cdf108','0'),('fdee5abfb61645a381d763217db67c3e','fb3ecf4b176b4cdfa28920cdd692be17','21f05ba9a46246159cdb70cd1aa248eb','0');

#
# Structure for table "sys_serial_number"
#

DROP TABLE IF EXISTS `sys_serial_number`;
CREATE TABLE `sys_serial_number` (
  `TableKey` char(32) NOT NULL,
  `KeyNumber` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TableKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_serial_number"
#

INSERT INTO `sys_serial_number` VALUES ('ZZJG',11);

#
# Structure for table "sys_user"
#

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `UserID` char(32) NOT NULL,
  `UserName` varchar(32) NOT NULL DEFAULT '',
  `UserCard` varchar(32) NOT NULL DEFAULT '',
  `UserIcon` varchar(128) DEFAULT NULL,
  `Password` varchar(32) NOT NULL DEFAULT '',
  `UserKind` char(1) NOT NULL DEFAULT '0',
  `UserState` char(1) NOT NULL DEFAULT '0',
  `TrueName` varchar(32) NOT NULL DEFAULT '',
  `DepartmentID` char(32) DEFAULT NULL,
  `UserRemark` varchar(128) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sys_user"
#

INSERT INTO `sys_user` VALUES ('4b3f9165daas4ec4b85efdc2d6135652','SysAdmin','S00000000000000009','images/default.jpg','4280d89a5a03f812751f504cc10ee8a5','1','1','系统管理员','0a4ba18086f04f3aa82c359b18687aec','系统管理员','2018-07-27 16:48:25','2018-10-16 11:33:42'),('65ef758360604137bdccb90a1c9d9b13','zhangsan','VIP1000001','images/default.jpg','4280d89a5a03f812751f504cc10ee8a5','0','1','张三','c6aa7b1e70d445be850b9c5509f4a3a7','张三','2018-10-22 14:52:46','2018-11-12 09:47:14'),('89752b0582bd441081dd44ebaec9dce6','SysSecrecy','S00000000000000002','images/default.jpg','4280d89a5a03f812751f504cc10ee8a5','2','1','安全保密员','0a4ba18086f04f3aa82c359b18687aec','安全保密员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('8aaddbaa7de24b938d8771663a313856','SysAuditor','S00000000000000003','images/default.jpg','4280d89a5a03f812751f504cc10ee8a5','3','1','安全审计员','0a4ba18086f04f3aa82c359b18687aec','安全审计员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('a31c9395c257411da04c30372cf682f4','lisi','001','uploadImages/20190523180297601.jpg','4280d89a5a03f812751f504cc10ee8a5','0','1','李四','e5c36eb426c34e469f3ccc863fef2724','北京计算机技术及应用研究所','2018-12-24 10:57:44','2019-05-23 18:02:01'),('b5f57e7f737a499887b5b205fca07676','wangwu','001','uploadImages/20190523180064646.jpg','4280d89a5a03f812751f504cc10ee8a5','0','1','汪进银','e5c36eb426c34e469f3ccc863fef2724','001','2018-12-24 11:51:54','2019-05-23 18:00:46'),('d8a70f80fe084c59bacd60902dd7c24e','lier','002',NULL,'4280d89a5a03f812751f504cc10ee8a5','5','1','李二','c6aa7b1e70d445be850b9c5509f4a3a7','缺陷知识库管理员','2019-03-19 11:06:32','2019-03-19 11:08:08'),('e5f3439932714d7c979f15f6f05b6add','SysOperator','S00000000000000004','images/default.jpg','4280d89a5a03f812751f504cc10ee8a5','4','1','系统维护员','0a4ba18086f04f3aa82c359b18687aec','系统维护员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('fcb9a7a7eae8448082bea33293e96271','xiaoming','vip002',NULL,'4280d89a5a03f812751f504cc10ee8a5','0','2','小明','726325bfc6714737afa55142deabf7c1','xiaoming','2019-05-24 07:38:38','2019-05-24 08:01:17');

#
# Trigger "TRI_KNOWMODE_DELETE_AFTER"
#

DROP TRIGGER IF EXISTS `TRI_KNOWMODE_DELETE_AFTER`;
CREATE TRIGGER `TRI_KNOWMODE_DELETE_AFTER` AFTER DELETE ON `know_mode`
  FOR EACH ROW BEGIN
delete from KNOW_MODE_RULE where ModeID = old.ModeID;
delete from KNOW_MODE_REASON where ModeID = old.ModeID;
delete from KNOW_MODE_PREVENTION where ModeID = old.ModeID;
delete from KNOW_MODE_CONSEQUENCE where ModeID = old.ModeID;
END;
