-- MySQL dump 10.13  Distrib 5.5.58, for Win64 (AMD64)
--
-- Host: localhost    Database: bug
-- ------------------------------------------------------
-- Server version	5.5.58

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
-- Table structure for table `epm_project_group`
--

DROP TABLE IF EXISTS `epm_project_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epm_project_group` (
  `GroupID` char(32) NOT NULL,
  `GroupName` varchar(64) NOT NULL DEFAULT '',
  `GroupRemark` varchar(256) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epm_project_group`
--

LOCK TABLES `epm_project_group` WRITE;
/*!40000 ALTER TABLE `epm_project_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `epm_project_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epm_project_info`
--

DROP TABLE IF EXISTS `epm_project_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epm_project_info` (
  `ProjectID` char(32) NOT NULL,
  `GroupID` char(32) DEFAULT NULL,
  `ProjectName` varchar(64) NOT NULL DEFAULT '',
  `ProjectRemark` varchar(256) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epm_project_info`
--

LOCK TABLES `epm_project_info` WRITE;
/*!40000 ALTER TABLE `epm_project_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `epm_project_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epm_project_type`
--

DROP TABLE IF EXISTS `epm_project_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epm_project_type` (
  `TypeID` char(32) NOT NULL,
  `TypeName` varchar(64) NOT NULL DEFAULT '',
  `TypeRemark` varchar(256) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epm_project_type`
--

LOCK TABLES `epm_project_type` WRITE;
/*!40000 ALTER TABLE `epm_project_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `epm_project_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_category`
--

DROP TABLE IF EXISTS `sys_dict_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_category`
--

LOCK TABLES `sys_dict_category` WRITE;
/*!40000 ALTER TABLE `sys_dict_category` DISABLE KEYS */;
INSERT INTO `sys_dict_category` VALUES ('60162ff8bdda44778d5b99f01b23f2f8','d0daa02d3232425190919f0b9b64a148','缺陷等级','QXDJ',1,'缺陷等级','2018-11-06 11:52:34','2018-11-06 14:38:17'),('d0daa02d3232425190919f0b9b64a148','','软件缺陷相关字典','',1,'软件缺陷相关字典','2018-11-06 11:51:45','2018-11-06 11:51:45');
/*!40000 ALTER TABLE `sys_dict_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_entry`
--

DROP TABLE IF EXISTS `sys_dict_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_entry`
--

LOCK TABLES `sys_dict_entry` WRITE;
/*!40000 ALTER TABLE `sys_dict_entry` DISABLE KEYS */;
INSERT INTO `sys_dict_entry` VALUES ('8cb6a02589504f9e8dbf3fcdafd2f82e','60162ff8bdda44778d5b99f01b23f2f8','严重',1,'0','严重','2018-11-06 15:31:18','2018-11-06 15:31:18');
/*!40000 ALTER TABLE `sys_dict_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_resource`
--

DROP TABLE IF EXISTS `sys_file_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_resource`
--

LOCK TABLES `sys_file_resource` WRITE;
/*!40000 ALTER TABLE `sys_file_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES ('0cf40a3a41c34771af7b514adda6d3ac','Ajax请求','更新功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.update','[{\"iconCls\":\"icon-sys-system\",\"id\":\"1b5c93bb2d734684a7e0a8a8027694ee\",\"moduleIcon\":\"icon-sys-system\",\"moduleId\":\"1b5c93bb2d734684a7e0a8a8027694ee\",\"moduleName\":\"考试管理\",\"moduleOrder\":2,\"moduleRemark\":\"考试管理\",\"text\":\"考试管理\"}]','{\"message\":\"更新功能模块成功!\",\"success\":true}',38,NULL,NULL,NULL,NULL),('2bd33ec8ec6d418db44d759a1fc65321','Ajax请求','保存数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.save','[{\"categoryCode\":\"fds\",\"categoryName\":\"fdsa\",\"categoryOrder\":1,\"categoryRemark\":\"fdsaf\",\"parentId\":\"\",\"text\":\"fdsa\"}]','{\"message\":\"保存数据字典类别成功!\",\"success\":true}',88,NULL,NULL,NULL,NULL),('4098697e1b704643abc17dbbb01255ee','Ajax请求','更新功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.update','[{\"iconCls\":\"icon-sys-system\",\"id\":\"1b5c93bb2d734684a7e0a8a8027694ee\",\"moduleIcon\":\"icon-sys-system\",\"moduleId\":\"1b5c93bb2d734684a7e0a8a8027694ee\",\"moduleName\":\"在线考试系统\",\"moduleOrder\":2,\"moduleRemark\":\"考试管理\",\"text\":\"在线考试系统\"}]','{\"message\":\"更新功能模块成功!\",\"success\":true}',75,NULL,NULL,NULL,NULL),('43b6520176c940f3ad0265bcc4172eca','Ajax请求','更新功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.update','[{\"iconCls\":\"icon-sys-system\",\"id\":\"1b5c93bb2d734684a7e0a8a8027694ee\",\"moduleIcon\":\"icon-sys-system\",\"moduleId\":\"1b5c93bb2d734684a7e0a8a8027694ee\",\"moduleName\":\"考试管理\",\"moduleOrder\":3,\"moduleRemark\":\"考试管理\",\"text\":\"考试管理\"}]','{\"message\":\"更新功能模块成功!\",\"success\":true}',104,NULL,NULL,NULL,NULL),('47523d759ea74283a155ef0badfff8cb','Ajax请求','保存数据字典条目','127.0.0.1','SysAdmin','1','系统管理员','http://localhost:8080/sys/dict/entry/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictEntryController.save','[{\"categoryId\":\"60162ff8bdda44778d5b99f01b23f2f8\",\"entryName\":\"关键\",\"entryOrder\":1,\"entryRemark\":\"关键\",\"entryState\":\"0\"}]','{\"message\":\"保存数据字典条目成功!\",\"success\":true}',81,NULL,NULL,NULL,NULL),('5bf5ebd6907c490e8e2551fcebaec389','Ajax请求','更新数据字典条目','127.0.0.1','SysAdmin','1','系统管理员','http://localhost:8080/sys/dict/entry/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictEntryController.update','[{\"entryId\":\"514ffc856d254d5a865d3926a0381bc8\",\"entryName\":\"一般\",\"entryOrder\":4,\"entryRemark\":\"一般\",\"entryState\":\"0\"}]','{\"message\":\"更新数据字典条目成功!\",\"success\":true}',84,NULL,NULL,NULL,NULL),('5c41697171c24c4c87df78f4e361956c','Ajax请求','保存数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.save','[{\"categoryCode\":\"\",\"categoryName\":\"软件缺陷相关字典\",\"categoryOrder\":1,\"categoryRemark\":\"软件缺陷相关字典\",\"parentId\":\"\",\"text\":\"软件缺陷相关字典\"}]','{\"message\":\"保存数据字典类别成功!\",\"success\":true}',51,NULL,NULL,NULL,NULL),('613ef2f9a977441495adb391911a4ae5','Ajax请求','删除数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/delete.jsn','GET','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.delete','[\"4f0b057467dc4d5c9fa58ee4365d0788\"]','{\"message\":\"删除数据字典类别成功!\",\"success\":true}',104,NULL,NULL,NULL,NULL),('66c3bfd1252a49f8a1679d65e0686bb3','Ajax请求','更新功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.update','[{\"iconCls\":\"icon-sys-system\",\"id\":\"0911076dcafc48e09ea21eb413c32419\",\"moduleIcon\":\"icon-sys-system\",\"moduleId\":\"0911076dcafc48e09ea21eb413c32419\",\"moduleName\":\"文档管理\",\"moduleOrder\":1,\"moduleRemark\":\"文档管理\",\"text\":\"文档管理\"}]','{\"message\":\"更新功能模块成功!\",\"success\":true}',98,NULL,NULL,NULL,NULL),('69aa62ce844249d38b4a5093b26e2188','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"1b5c93bb2d734684a7e0a8a8027694ee\"]]','{\"message\":\"删除功能模块成功!\",\"success\":true}',74,NULL,NULL,NULL,NULL),('7598fef79ab74fb2970fb0dd0a4898e7','Ajax请求','更新数据字典条目','127.0.0.1','SysAdmin','1','系统管理员','http://localhost:8080/sys/dict/entry/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictEntryController.update','[{\"entryId\":\"514ffc856d254d5a865d3926a0381bc8\",\"entryName\":\"一般\",\"entryOrder\":2,\"entryRemark\":\"一般\",\"entryState\":\"0\"}]','{\"message\":\"更新数据字典条目成功!\",\"success\":true}',153,NULL,NULL,NULL,NULL),('78000d1235c840e593a576828af841b8','Ajax请求','更新数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.update','[{\"categoryCode\":\"QXDJ\",\"categoryId\":\"60162ff8bdda44778d5b99f01b23f2f8\",\"categoryName\":\"缺陷等级\",\"categoryOrder\":1,\"categoryRemark\":\"缺陷等级\",\"id\":\"60162ff8bdda44778d5b99f01b23f2f8\",\"parentId\":\"\",\"text\":\"缺陷等级\"}]','{\"message\":\"更新数据字典类别成功!\",\"success\":true}',70,NULL,NULL,NULL,NULL),('88691905056849328a85bf1e0ab74c31','Ajax请求','保存数据字典条目','127.0.0.1','SysAdmin','1','系统管理员','http://localhost:8080/sys/dict/entry/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictEntryController.save','[{\"categoryId\":\"60162ff8bdda44778d5b99f01b23f2f8\",\"entryName\":\"严重\",\"entryOrder\":1,\"entryRemark\":\"严重\",\"entryState\":\"0\"}]','{\"message\":\"保存数据字典条目成功!\",\"success\":true}',87,NULL,NULL,NULL,NULL),('a46fcabb490f47b089d91aec629cde65','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"icon-sys-system\",\"moduleIcon\":\"icon-sys-system\",\"moduleName\":\"项目管理\",\"moduleOrder\":1,\"moduleRemark\":\"项目管理\",\"text\":\"项目管理\"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',32,NULL,NULL,NULL,NULL),('b6a1fbceadbb40188f7ab81944598e98','Ajax请求','保存功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.save','[{\"iconCls\":\"icon-sys-system\",\"moduleIcon\":\"icon-sys-system\",\"moduleName\":\"在线考试系统\",\"moduleOrder\":2,\"moduleRemark\":\"在线考试系统\",\"text\":\"在线考试系统\"}]','{\"message\":\"保存功能模块成功!\",\"success\":true}',88,NULL,NULL,NULL,NULL),('bc05e136e1ce445d85a2936d0c3738b1','Ajax请求','删除数据字典条目','127.0.0.1','SysAdmin','1','系统管理员','http://localhost:8080/sys/dict/entry/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictEntryController.delete','[[\"e5ca692348ec4732bbe6dbddc6bad6da\",\"514ffc856d254d5a865d3926a0381bc8\"]]','{\"message\":\"删除数据字典条目成功!\",\"success\":true}',106,NULL,NULL,NULL,NULL),('bf94c59e1aaf4bbd8d994c9120c89058','Ajax请求','更新数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.update','[{\"categoryCode\":\"QXDJ\",\"categoryId\":\"60162ff8bdda44778d5b99f01b23f2f8\",\"categoryName\":\"缺陷等级\",\"categoryOrder\":1,\"categoryRemark\":\"缺陷等级\",\"id\":\"60162ff8bdda44778d5b99f01b23f2f8\",\"parentId\":\"d0daa02d3232425190919f0b9b64a148\",\"text\":\"缺陷等级\"}]','{\"message\":\"更新数据字典类别成功!\",\"success\":true}',73,NULL,NULL,NULL,NULL),('c6f0fca70d1c43e7b836a1e62ecee947','Ajax请求','保存数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.save','[{\"categoryCode\":\"\",\"categoryName\":\"缺陷等级\",\"categoryOrder\":1,\"categoryRemark\":\"缺陷等级\",\"parentId\":\"d0daa02d3232425190919f0b9b64a148\",\"text\":\"缺陷等级\"}]','{\"message\":\"保存数据字典类别成功!\",\"success\":true}',97,NULL,NULL,NULL,NULL),('dd3500afab1543a58bfda8966f0e4f8f','Ajax请求','更新功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.update','[{\"iconCls\":\"icon-sys-system\",\"id\":\"0911076dcafc48e09ea21eb413c32419\",\"moduleIcon\":\"icon-sys-system\",\"moduleId\":\"0911076dcafc48e09ea21eb413c32419\",\"moduleName\":\"文档管理\",\"moduleOrder\":2,\"moduleRemark\":\"文档管理\",\"text\":\"文档管理\"}]','{\"message\":\"更新功能模块成功!\",\"success\":true}',85,NULL,NULL,NULL,NULL),('e9f0f76dca224b6dae9b2ba860c07e44','Ajax请求','更新数据字典类别','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/dict/category/update.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictCategoryController.update','[{\"categoryCode\":\"缺陷等级\",\"categoryId\":\"60162ff8bdda44778d5b99f01b23f2f8\",\"categoryName\":\"缺陷等级\",\"categoryOrder\":1,\"categoryRemark\":\"缺陷等级\",\"id\":\"60162ff8bdda44778d5b99f01b23f2f8\",\"parentId\":\"d0daa02d3232425190919f0b9b64a148\",\"text\":\"缺陷等级\"}]','{\"message\":\"更新数据字典类别成功!\",\"success\":true}',46,NULL,NULL,NULL,NULL),('f14fad0127494499a8f467ac166a52fe','Ajax请求','保存数据字典条目','127.0.0.1','SysAdmin','1','系统管理员','http://localhost:8080/sys/dict/entry/save.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysDictEntryController.save','[{\"categoryId\":\"60162ff8bdda44778d5b99f01b23f2f8\",\"entryName\":\"一般\",\"entryOrder\":2,\"entryRemark\":\"一般\",\"entryState\":\"0\"}]','{\"message\":\"保存数据字典条目成功!\",\"success\":true}',29,NULL,NULL,NULL,NULL),('f64d466e86d448c097791ebc5eed3907','Ajax请求','删除功能模块','127.0.0.1','SysOperator','4','系统维护员','http://localhost:8080/sys/module/delete.jsn','POST','com.jiangxinsoft.scorpio.sys.controller.SysModuleController.delete','[[\"0911076dcafc48e09ea21eb413c32419\"]]','{\"message\":\"删除功能模块成功!\",\"success\":true}',106,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_module`
--

DROP TABLE IF EXISTS `sys_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_module`
--

LOCK TABLES `sys_module` WRITE;
/*!40000 ALTER TABLE `sys_module` DISABLE KEYS */;
INSERT INTO `sys_module` VALUES ('9fb657a612d5401885feb8389d89adde','系统管理','icon-sys-system',0,'1','系统管理','2018-07-27 16:48:25','2018-07-27 16:48:25'),('e885e1a8504d4948aa94f3321e1cb212','项目管理','icon-sys-system',1,'0','项目管理','2018-11-06 16:28:17','2018-11-06 16:28:17');
/*!40000 ALTER TABLE `sys_module` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SYS_TRI_MODULE_DELETE_AFTER` AFTER DELETE ON `sys_module`
  FOR EACH ROW BEGIN
    DELETE FROM SYS_MODULE_PAGE where ModuleID = OLD.ModuleID;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_module_page`
--

DROP TABLE IF EXISTS `sys_module_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_module_page`
--

LOCK TABLES `sys_module_page` WRITE;
/*!40000 ALTER TABLE `sys_module_page` DISABLE KEYS */;
INSERT INTO `sys_module_page` VALUES ('220ba4dfa9bb4d21b37d3b21d9baa986','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','用户管理','icon-sys-users','sys/user/manage/default.htm',8,'1','sys:admin:user','用户管理(系统管理员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('25a4dba9b50b49d4b62595dcdbe76481','70c4720fac86438bb918196bf3cdf108','9fb657a612d5401885feb8389d89adde','文件审计','icon-sys-files','sys/file/default.htm',4,'1','sys:secrecy:file','文件审计(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('29b20c5d26f54430a65a0d32a9553f4c','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','角色管理','icon-sys-role','sys/role/manage/default.htm',4,'1','sys:operator:role','角色管理(系统维护员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('31ca83c77dd64298a95a46a8567d1cf7','70c4720fac86438bb918196bf3cdf108','9fb657a612d5401885feb8389d89adde','日志审计','icon-sys-logs','sys/log/admin/default.htm',1,'1','sys:admin:log','日志审计(系统管理员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('3f922d51b9ac4b5f9b0b2f5a49503fc1','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','岗位授权','icon-sys-position','sys/position/auth/default.htm',7,'1','sys:secrecy:position','岗位授权(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('463c790f8e1142979bea24bcc0f77071','6a1de74e722c42d68a2f98021d03823e','9fb657a612d5401885feb8389d89adde','字典条目','icon-hamburg-docs','sys/dict/entry/default.htm',2,'1','','字典条目','2018-11-06 10:42:08','2018-11-06 10:42:08'),('4eabad306e0e4a07843353c54beaabbf','','e885e1a8504d4948aa94f3321e1cb212','项目计划管理','icon-sys-system','',1,'0','','项目计划管理','2018-11-06 17:15:29','2018-11-07 16:29:02'),('581e823392cb4cebb7ae54495b190944','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','组织机构','icon-sys-organization','sys/org/default.htm',3,'1','sys:admin:org','组织机构(系统管理员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('5b62a9c77f994c388b7c00571a0fb168','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','项目类型','icon-hamburg-docs','epm/project/type/default.htm',1,'0','','项目类型','2018-11-07 17:07:35','2018-11-07 17:07:35'),('5c1f4adcbb9041cabd80a131b355660d','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','项目群管理','icon-hamburg-docs','epm/project/group/default.htm',3,'0','','项目群管理','2018-11-07 16:29:32','2018-11-07 17:07:55'),('66c399b0922942629037d0b45a2c7371','70c4720fac86438bb918196bf3cdf108','9fb657a612d5401885feb8389d89adde','日志审计','icon-sys-logs','sys/log/secrecy/default.htm',2,'1','sys:secrecy:log','日志审计(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('69678792135649e680b494efcc64ca61','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','模块管理','icon-sys-modules','sys/module/default.htm',1,'1','sys:operator:module','模块管理(系统维护员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('6a1de74e722c42d68a2f98021d03823e','d99dcce3564746e484be16c6c88600eb','9fb657a612d5401885feb8389d89adde','数据字典','icon-hamburg-docs','',2,'1','','数据字典','2018-11-06 10:40:30','2018-11-06 10:40:30'),('6f7ddef55462441fa9d762807ae18adb','4eabad306e0e4a07843353c54beaabbf','e885e1a8504d4948aa94f3321e1cb212','项目管理','icon-hamburg-docs','epm/project/info/default.htm',2,'0','','项目管理','2018-11-07 16:29:19','2018-11-07 17:07:45'),('70c4720fac86438bb918196bf3cdf108','d99dcce3564746e484be16c6c88600eb','9fb657a612d5401885feb8389d89adde','系统审计','icon-sys-log-audit','',3,'1','','系统审计','2018-07-27 16:48:25','2018-11-06 10:39:59'),('815c504199e04d3fa7fdc51945d66eac','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','岗位管理','icon-sys-position','sys/position/manage/default.htm',6,'1','sys:admin:position','岗位管理(系统管理员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('91998dea78614d1f88dc2fa5309a394d','d99dcce3564746e484be16c6c88600eb','9fb657a612d5401885feb8389d89adde','系统配置','icon-sys-system-manage','',1,'1','','系统配置','2018-07-27 16:48:25','2018-07-27 16:48:25'),('963f8969afae4ef68cd89eedcb424582','6a1de74e722c42d68a2f98021d03823e','9fb657a612d5401885feb8389d89adde','字典类别','icon-hamburg-docs','sys/dict/category/default.htm',1,'1','','字典类别','2018-11-06 10:41:22','2018-11-06 10:41:22'),('aa65756980694064ad3e54755d528b54','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','角色授权','icon-sys-role','sys/role/auth/default.htm',5,'1','sys:secrecy:role','角色授权(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('bc30619566094e8f967d053c18d36347','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','页面管理','icon-sys-module-pages','sys/page/default.htm',2,'1','sys:operator:page','页面管理(系统维护员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('d99dcce3564746e484be16c6c88600eb','','9fb657a612d5401885feb8389d89adde','系统管理','icon-sys-system','',1,'1','','系统管理','2018-07-27 16:48:25','2018-07-27 16:48:25'),('dff3b70d214c402db0920554faa7ca06','91998dea78614d1f88dc2fa5309a394d','9fb657a612d5401885feb8389d89adde','用户授权','icon-sys-users','sys/user/auth/default.htm',9,'1','sys:secrecy:user','用户授权(安全保密员)','2018-07-27 16:48:25','2018-07-27 16:48:25'),('e2ae0834acdf4bc4a182aaca98008f65','70c4720fac86438bb918196bf3cdf108','9fb657a612d5401885feb8389d89adde','日志审计','icon-sys-logs','sys/log/auditor/default.htm',3,'1','sys:auditor:log','日志审计(安全审计员)','2018-07-27 16:48:25','2018-07-27 16:48:25');
/*!40000 ALTER TABLE `sys_module_page` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SYS_TRI_PAGE_DELETE_AFTER` AFTER DELETE ON `sys_module_page`
  FOR EACH ROW BEGIN
	  DELETE FROM SYS_ROLE_PAGE where PageID = OLD.PageID;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_organization`
--

DROP TABLE IF EXISTS `sys_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_organization`
--

LOCK TABLES `sys_organization` WRITE;
/*!40000 ALTER TABLE `sys_organization` DISABLE KEYS */;
INSERT INTO `sys_organization` VALUES ('0a4ba18086f04f3aa82c359b18687aec','f7272c15c2074ccaa99399b333666ce6','系统管理部门','XTZZ-00002','dpt',0,'系统管理部门','1','2018-07-27 16:48:25','2018-07-27 16:48:25'),('726325bfc6714737afa55142deabf7c1','e5c36eb426c34e469f3ccc863fef2724','科研管理处','ZZJG-00006','dpt',1,'科研管理处','0','2018-07-30 18:13:29',NULL),('c6aa7b1e70d445be850b9c5509f4a3a7','e5c36eb426c34e469f3ccc863fef2724','发展计划处','ZZJG-00007','dpt',2,'发展计划处','0','2018-07-30 18:13:41',NULL),('e5c36eb426c34e469f3ccc863fef2724','','北京计算机技术及应用研究所','ZZJG-00005','ogn',1,'北京计算机技术及应用研究所','0','2018-07-30 18:13:10',NULL),('f7272c15c2074ccaa99399b333666ce6','','系统组织','XTZZ-00001','ogn',0,'系统组织(用于组织系统内置的账号)','1','2018-07-27 16:48:25','2018-07-27 16:48:25');
/*!40000 ALTER TABLE `sys_organization` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SYS_TRI_ORG_DELETE_AFTER` AFTER DELETE ON `sys_organization`
  FOR EACH ROW BEGIN
		DELETE FROM SYS_USER where DepartmentID = OLD.DepartmentID;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_organization_relationship`
--

DROP TABLE IF EXISTS `sys_organization_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_organization_relationship` (
  `ID` char(32) NOT NULL,
  `DepartmentID` char(32) NOT NULL,
  `ParentID` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_organization_relationship`
--

LOCK TABLES `sys_organization_relationship` WRITE;
/*!40000 ALTER TABLE `sys_organization_relationship` DISABLE KEYS */;
INSERT INTO `sys_organization_relationship` VALUES ('01dd058b488e4053aac537700a54774d','c65686959f0544ff92e4c0e5a127e277','c65686959f0544ff92e4c0e5a127e277'),('0619a48b678d40b499a031b819994a36','fc3cb78110844438948df02659077db0','fc3cb78110844438948df02659077db0'),('0dbb8121eeb142c98ef90bdc85d673ab','8fbcdbcc9f6e4466bef1a9699d03ba6a','e5c36eb426c34e469f3ccc863fef2724'),('13ee12ffd36b4bce85de00117d358cac','726325bfc6714737afa55142deabf7c1','726325bfc6714737afa55142deabf7c1'),('4ff0eea6cc964f959c9ae02b22e6e247','8fbcdbcc9f6e4466bef1a9699d03ba6a','8fbcdbcc9f6e4466bef1a9699d03ba6a'),('58cea3dd8c6b4f0a929fd5a75978057c','c6aa7b1e70d445be850b9c5509f4a3a7','e5c36eb426c34e469f3ccc863fef2724'),('6f1d345ee1524983aff26137907f88b2','fc3cb78110844438948df02659077db0','e5c36eb426c34e469f3ccc863fef2724'),('71fc5dbf73bd4109bbc3a5b3933fed32','e5c36eb426c34e469f3ccc863fef2724','e5c36eb426c34e469f3ccc863fef2724'),('726b046587714eb3949bd5b3cfa892f0','726325bfc6714737afa55142deabf7c1','e5c36eb426c34e469f3ccc863fef2724'),('9181a1379cd442bf9457ab348188bbc4','c65686959f0544ff92e4c0e5a127e277','e5c36eb426c34e469f3ccc863fef2724'),('d639d30846d744a1a6e2129dbf0650b5','c6aa7b1e70d445be850b9c5509f4a3a7','c6aa7b1e70d445be850b9c5509f4a3a7');
/*!40000 ALTER TABLE `sys_organization_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_position`
--

DROP TABLE IF EXISTS `sys_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_position` (
  `PositionID` char(32) NOT NULL,
  `DepartmentID` char(32) DEFAULT NULL,
  `PositionName` varchar(64) NOT NULL DEFAULT '',
  `PositionRemark` varchar(128) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_position`
--

LOCK TABLES `sys_position` WRITE;
/*!40000 ALTER TABLE `sys_position` DISABLE KEYS */;
INSERT INTO `sys_position` VALUES ('1a6f63247b4344b3bedd319eafedb227','726325bfc6714737afa55142deabf7c1','研发部副主任','研发部副主任','2018-07-27 16:48:25','2018-08-02 16:34:11');
/*!40000 ALTER TABLE `sys_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_position_member`
--

DROP TABLE IF EXISTS `sys_position_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_position_member` (
  `ID` char(32) NOT NULL,
  `PositionID` char(32) NOT NULL DEFAULT '',
  `UserID` char(32) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_position_member`
--

LOCK TABLES `sys_position_member` WRITE;
/*!40000 ALTER TABLE `sys_position_member` DISABLE KEYS */;
INSERT INTO `sys_position_member` VALUES ('de096f85fc3a472db025f842c819a610','1a6f63247b4344b3bedd319eafedb227','5640800f25894940bddd887da449bcff','2018-07-28 15:11:10');
/*!40000 ALTER TABLE `sys_position_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_position_scope`
--

DROP TABLE IF EXISTS `sys_position_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_position_scope` (
  `ID` char(32) NOT NULL,
  `PositionID` char(32) NOT NULL DEFAULT '',
  `DepartmentID` char(32) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_position_scope`
--

LOCK TABLES `sys_position_scope` WRITE;
/*!40000 ALTER TABLE `sys_position_scope` DISABLE KEYS */;
INSERT INTO `sys_position_scope` VALUES ('8d45c0fc77a347d4b02f8c56fad3f42b','1a6f63247b4344b3bedd319eafedb227','3ede888ea7a24bbaa693beab010896aa','2018-07-28 15:44:46'),('d6dbbbdc87984689b9094833b113fb8d','1a6f63247b4344b3bedd319eafedb227','9e050156d6b8471d82885afa3f3273d9','2018-07-28 15:44:46');
/*!40000 ALTER TABLE `sys_position_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('4a80b4f3137240268fdc47b96171b250','安全保密员','XTJS-00002','1','安全保密员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('62824bf62b2e4f86bd29ce80ba325fff','系统管理员','XTJS-00001','1','系统管理员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('65ad8b12872e4824b70c6f9bd5073a40','系统维护员','XTJS-00004','1','系统维护员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('660d128488ce40db9bb28002236ad7f3','安全审计员','XTJS-00003','1','安全审计员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('a31bf9f425e94ca79c0caaf92939772d','部门系统管理员','Admin','0','部门系统管理员','2018-07-28 16:11:06','2018-10-14 11:28:24');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SYS_TRI_ROLE_DELETE_AFTER` AFTER DELETE ON `sys_role`
  FOR EACH ROW BEGIN
    DELETE FROM SYS_ROLE_PAGE where ROLEID = OLD.ROLEID;

    DELETE FROM SYS_ROLE_MEMBER where ROLEID = OLD.ROLEID;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_role_member`
--

DROP TABLE IF EXISTS `sys_role_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_member` (
  `ID` char(32) NOT NULL,
  `RoleID` char(32) NOT NULL DEFAULT '',
  `UserID` char(32) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_member`
--

LOCK TABLES `sys_role_member` WRITE;
/*!40000 ALTER TABLE `sys_role_member` DISABLE KEYS */;
INSERT INTO `sys_role_member` VALUES ('1055a95c30ce482e9acd77b874357e08','4a80b4f3137240268fdc47b96171b250','89752b0582bd441081dd44ebaec9dce6','2018-05-27 13:02:42'),('62ad312863b544838543467d9eecd001','62824bf62b2e4f86bd29ce80ba325fff','4b3f9165daas4ec4b85efdc2d6135652','2017-12-02 14:15:56'),('894740f36dae45eaba8c0e516aba3e5c','65ad8b12872e4824b70c6f9bd5073a40','e5f3439932714d7c979f15f6f05b6add','2018-05-27 13:02:28'),('a22de891277b4909be9ad0be0b248395','660d128488ce40db9bb28002236ad7f3','8aaddbaa7de24b938d8771663a313856','2017-12-02 14:15:56'),('b4225712035c4a239091016f2921c2fd','a31bf9f425e94ca79c0caaf92939772d','65ef758360604137bdccb90a1c9d9b13','2018-10-22 14:53:23');
/*!40000 ALTER TABLE `sys_role_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_page`
--

DROP TABLE IF EXISTS `sys_role_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_page` (
  `ID` char(32) NOT NULL,
  `RoleID` char(32) NOT NULL,
  `PageID` char(32) NOT NULL,
  `Flag` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_page`
--

LOCK TABLES `sys_role_page` WRITE;
/*!40000 ALTER TABLE `sys_role_page` DISABLE KEYS */;
INSERT INTO `sys_role_page` VALUES ('098860793a274afa87bbcc0024c6e486','65ad8b12872e4824b70c6f9bd5073a40','6a1de74e722c42d68a2f98021d03823e','0'),('0b8ccc69ae294d7c8bd87c0561666ed3','62824bf62b2e4f86bd29ce80ba325fff','581e823392cb4cebb7ae54495b190944','1'),('15352bd1cf2244c39605ea5a771415a8','a31bf9f425e94ca79c0caaf92939772d','5b62a9c77f994c388b7c00571a0fb168','1'),('24bc9b63c2e14d268ce1181ee2a03464','65ad8b12872e4824b70c6f9bd5073a40','29b20c5d26f54430a65a0d32a9553f4c','1'),('281e2e6907c74ec687d983f892516f78','65ad8b12872e4824b70c6f9bd5073a40','963f8969afae4ef68cd89eedcb424582','1'),('2a22924b2e354dc299ee70d1fc864a5d','660d128488ce40db9bb28002236ad7f3','d99dcce3564746e484be16c6c88600eb','0'),('2ac8e3a3eeac43f2866dd241f8189b74','62824bf62b2e4f86bd29ce80ba325fff','31ca83c77dd64298a95a46a8567d1cf7','1'),('3a97864b67ab41b084c825f345611d3f','4a80b4f3137240268fdc47b96171b250','aa65756980694064ad3e54755d528b54','1'),('3d8dec93b0c34b068797e9a621f0d288','4a80b4f3137240268fdc47b96171b250','25a4dba9b50b49d4b62595dcdbe76481','1'),('3df5b9f5c92641e9b2aaefb864f931fe','4a80b4f3137240268fdc47b96171b250','91998dea78614d1f88dc2fa5309a394d','0'),('42b5711fd6d648b883653f8e072ce694','4a80b4f3137240268fdc47b96171b250','66c399b0922942629037d0b45a2c7371','1'),('5fc4eb735ce54b37a893d89317dbd7ac','a31bf9f425e94ca79c0caaf92939772d','6f7ddef55462441fa9d762807ae18adb','1'),('6bdecc0ecedf4522a234021af3f11fc5','660d128488ce40db9bb28002236ad7f3','70c4720fac86438bb918196bf3cdf108','0'),('6fb4f6d5b8d6464bbcad6e5c7237df64','62824bf62b2e4f86bd29ce80ba325fff','6a1de74e722c42d68a2f98021d03823e','0'),('747e3849843d42e9b219560584696a9e','65ad8b12872e4824b70c6f9bd5073a40','bc30619566094e8f967d053c18d36347','1'),('79f26f947dea4b5c8c95459cfbde6a2f','660d128488ce40db9bb28002236ad7f3','e2ae0834acdf4bc4a182aaca98008f65','1'),('8884de631a4c4e73bbc9c9219e16ef43','62824bf62b2e4f86bd29ce80ba325fff','70c4720fac86438bb918196bf3cdf108','0'),('89df2ed2e48f42cc952fca137917e97b','62824bf62b2e4f86bd29ce80ba325fff','d99dcce3564746e484be16c6c88600eb','0'),('9d666566ad0e426095ebe65a0d799d02','65ad8b12872e4824b70c6f9bd5073a40','91998dea78614d1f88dc2fa5309a394d','0'),('ae77555235814116819ba9b1b52fd3b5','65ad8b12872e4824b70c6f9bd5073a40','d99dcce3564746e484be16c6c88600eb','0'),('ae837f09031e4c81b49a9db3d3e912bc','4a80b4f3137240268fdc47b96171b250','3f922d51b9ac4b5f9b0b2f5a49503fc1','1'),('b1b2b82580374307870f6c99dfff8664','62824bf62b2e4f86bd29ce80ba325fff','463c790f8e1142979bea24bcc0f77071','1'),('c76b8928367348c39222e7d4a629d058','62824bf62b2e4f86bd29ce80ba325fff','815c504199e04d3fa7fdc51945d66eac','1'),('c8d776410ea64f798b3fdf7007ee4444','4a80b4f3137240268fdc47b96171b250','d99dcce3564746e484be16c6c88600eb','0'),('cf1ef41334824da79e1639a1655579c0','62824bf62b2e4f86bd29ce80ba325fff','220ba4dfa9bb4d21b37d3b21d9baa986','1'),('cfc765ebcd584a729dfebd66f5d38059','a31bf9f425e94ca79c0caaf92939772d','5c1f4adcbb9041cabd80a131b355660d','1'),('d643e2e206ea40b4a20ef3524d80ab9f','62824bf62b2e4f86bd29ce80ba325fff','91998dea78614d1f88dc2fa5309a394d','0'),('d9f981df0c794a4f88d9d122fabb4bd3','65ad8b12872e4824b70c6f9bd5073a40','69678792135649e680b494efcc64ca61','1'),('db3b2394268e43ad82fb4868c632001e','4a80b4f3137240268fdc47b96171b250','dff3b70d214c402db0920554faa7ca06','1'),('df5051bcc7a647a2acb8c429c8ee9de3','a31bf9f425e94ca79c0caaf92939772d','4eabad306e0e4a07843353c54beaabbf','0'),('f6a65cb31bdf4cbea3dc3291725f6c6a','4a80b4f3137240268fdc47b96171b250','70c4720fac86438bb918196bf3cdf108','0');
/*!40000 ALTER TABLE `sys_role_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_serial_number`
--

DROP TABLE IF EXISTS `sys_serial_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_serial_number` (
  `TableKey` char(32) NOT NULL,
  `KeyNumber` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TableKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_serial_number`
--

LOCK TABLES `sys_serial_number` WRITE;
/*!40000 ALTER TABLE `sys_serial_number` DISABLE KEYS */;
INSERT INTO `sys_serial_number` VALUES ('ZZJG',11);
/*!40000 ALTER TABLE `sys_serial_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('4b3f9165daas4ec4b85efdc2d6135652','SysAdmin','S00000000000000009','images/default.jpg','4280d89a5a03f812751f504cc10ee8a5','1','1','系统管理员','0a4ba18086f04f3aa82c359b18687aec','系统管理员','2018-07-27 16:48:25','2018-10-16 11:33:42'),('65ef758360604137bdccb90a1c9d9b13','zhangsan','VIP1000001',NULL,'4280d89a5a03f812751f504cc10ee8a5','0','1','张三','c6aa7b1e70d445be850b9c5509f4a3a7','张三','2018-10-22 14:52:46','2018-10-22 14:54:05'),('89752b0582bd441081dd44ebaec9dce6','SysSecrecy','S00000000000000002','images/default.jpg','4280d89a5a03f812751f504cc10ee8a5','2','1','安全保密员','0a4ba18086f04f3aa82c359b18687aec','安全保密员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('8aaddbaa7de24b938d8771663a313856','SysAuditor','S00000000000000003','images/default.jpg','4280d89a5a03f812751f504cc10ee8a5','3','1','安全审计员','0a4ba18086f04f3aa82c359b18687aec','安全审计员','2018-07-27 16:48:25','2018-07-27 16:48:25'),('e5f3439932714d7c979f15f6f05b6add','SysOperator','S00000000000000004','images/default.jpg','4280d89a5a03f812751f504cc10ee8a5','4','1','系统维护员','0a4ba18086f04f3aa82c359b18687aec','系统维护员','2018-07-27 16:48:25','2018-07-27 16:48:25');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SYS_TRI_USER_DELETE_AFTER` AFTER DELETE ON `sys_user`
  FOR EACH ROW BEGIN
    DELETE FROM SYS_ROLE_MEMBER where USERID = OLD.USERID;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-08 14:17:18
