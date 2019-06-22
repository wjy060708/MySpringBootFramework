# MySQL-Front 5.1  (Build 2.7)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: bug
# ------------------------------------------------------
# Server version 5.0.22-community

#
# Source for table epm_bom_entry
#

DROP TABLE IF EXISTS `epm_bom_entry`;
CREATE TABLE `epm_bom_entry` (
  `EntryID` char(32) NOT NULL default '',
  `TemplateID` char(32) default NULL,
  `ParentID` char(32) default NULL,
  `EntryName` varchar(255) default NULL,
  `EntryRemark` varchar(255) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`EntryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table epm_bom_template
#

DROP TABLE IF EXISTS `epm_bom_template`;
CREATE TABLE `epm_bom_template` (
  `TemplateID` char(32) NOT NULL default '',
  `TemplateName` varchar(255) default NULL,
  `TemplateRemark` varchar(255) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`TemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table epm_project_document
#

DROP TABLE IF EXISTS `epm_project_document`;
CREATE TABLE `epm_project_document` (
  `DocumentID` char(32) NOT NULL default '',
  `ProjectID` char(32) default NULL,
  `DocumentName` varchar(255) default NULL,
  `DocumentRemark` varchar(255) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`DocumentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table epm_project_group
#

DROP TABLE IF EXISTS `epm_project_group`;
CREATE TABLE `epm_project_group` (
  `GroupID` char(32) NOT NULL,
  `GroupName` varchar(64) NOT NULL default '',
  `GroupRemark` varchar(256) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  `GroupIcon` varchar(64) default NULL,
  `GroupOrder` int(11) default NULL,
  PRIMARY KEY  (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table epm_project_info
#

DROP TABLE IF EXISTS `epm_project_info`;
CREATE TABLE `epm_project_info` (
  `ProjectID` char(32) NOT NULL,
  `GroupID` char(32) default NULL,
  `ProjectName` varchar(64) NOT NULL default '',
  `ProjectRemark` varchar(256) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  `ProjectIcon` varchar(64) default NULL,
  `ProjectOrder` int(11) default NULL,
  `TypeID` char(32) default NULL,
  PRIMARY KEY  (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table epm_project_type
#

DROP TABLE IF EXISTS `epm_project_type`;
CREATE TABLE `epm_project_type` (
  `TypeID` char(32) NOT NULL,
  `TypeName` varchar(64) NOT NULL default '',
  `TypeRemark` varchar(256) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  `TypeOrder` int(11) default NULL,
  PRIMARY KEY  (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table epm_project_type
#

DROP TABLE IF EXISTS `epm_project_type`;
CREATE TABLE `epm_project_type` (
  `TypeID` char(32) NOT NULL,
  `TypeName` varchar(64) NOT NULL default '',
  `TypeRemark` varchar(256) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  `TypeIcon` varchar(64) default NULL,
  `TypeOrder` int(11) default NULL,
  PRIMARY KEY  (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table epm_task_info
#

DROP TABLE IF EXISTS `epm_task_info`;
CREATE TABLE `epm_task_info` (
  `TaskID` char(32) NOT NULL default '',
  `ProjectID` char(32) default NULL,
  `TaskName` varchar(255) default NULL,
  `TaskRemark` varchar(255) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  `ParentID` char(32) default NULL,
  PRIMARY KEY  (`TaskID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table pbm_bug_category
#

DROP TABLE IF EXISTS `pbm_bug_category`;
CREATE TABLE `pbm_bug_category` (
  `CategoryID` char(32) NOT NULL default '',
  `CategoryName` varchar(255) default NULL,
  `CategoryRemark` varchar(255) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table pbm_bug_info
#

DROP TABLE IF EXISTS `pbm_bug_info`;
CREATE TABLE `pbm_bug_info` (
  `BugID` char(32) NOT NULL default '',
  `BugName` varchar(255) default NULL,
  `BugRemark` varchar(255) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`BugID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_dict_category
#

DROP TABLE IF EXISTS `sys_dict_category`;
CREATE TABLE `sys_dict_category` (
  `CategoryID` char(32) NOT NULL,
  `ParentID` char(32) default NULL,
  `CategoryName` varchar(128) NOT NULL default '',
  `CategoryCode` varchar(16) default '',
  `CategoryOrder` int(11) default '0',
  `CategoryRemark` varchar(256) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_dict_entry
#

DROP TABLE IF EXISTS `sys_dict_entry`;
CREATE TABLE `sys_dict_entry` (
  `EntryID` char(32) NOT NULL,
  `CategoryID` char(32) NOT NULL default '',
  `EntryName` varchar(64) NOT NULL default '',
  `EntryOrder` int(11) default '0',
  `EntryState` char(1) default '0',
  `EntryRemark` varchar(256) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`EntryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_file_resource
#

DROP TABLE IF EXISTS `sys_file_resource`;
CREATE TABLE `sys_file_resource` (
  `FileID` char(32) NOT NULL,
  `UserID` char(32) NOT NULL default '',
  `FileTitle` varchar(512) NOT NULL,
  `FileDirectory` varchar(512) NOT NULL,
  `FilePath` varchar(512) NOT NULL,
  `FileName` varchar(512) NOT NULL,
  `FileName2` varchar(512) default NULL,
  `FileExtension` varchar(128) NOT NULL,
  `FileStatus` char(1) NOT NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_log
#

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `ID` char(32) NOT NULL,
  `Type` varchar(10) default NULL COMMENT '请求类型',
  `Title` varchar(255) default NULL COMMENT '日志标题',
  `RemoteAddr` varchar(32) default NULL COMMENT '操作IP地址',
  `UserName` varchar(64) NOT NULL default '' COMMENT '操作用户名',
  `UserKind` char(1) NOT NULL default '' COMMENT '用户类型',
  `TrueName` varchar(32) NOT NULL default '' COMMENT '操作用户姓名',
  `RequestUri` varchar(255) default NULL COMMENT '请求URI',
  `HttpMethod` varchar(10) default NULL COMMENT '操作方式',
  `ClassMethod` varchar(255) default NULL COMMENT '请求类型.方法',
  `Params` text COMMENT '操作提交的数据',
  `Response` longtext COMMENT '返回内容',
  `UseTime` bigint(20) default NULL COMMENT '方法执行时间',
  `Exception` text COMMENT '异常信息',
  `CreateBy` varchar(64) default NULL COMMENT '创建者',
  `CreateDate` datetime default NULL COMMENT '创建时间',
  `Remarks` varchar(255) default NULL COMMENT '备注信息',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_module
#

DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `ModuleID` char(32) NOT NULL,
  `ModuleName` varchar(64) NOT NULL default '',
  `ModuleIcon` varchar(64) NOT NULL default '',
  `ModuleOrder` int(11) default '0',
  `ModuleFlag` char(1) default '0',
  `ModuleRemark` varchar(128) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`ModuleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_module_page
#

DROP TABLE IF EXISTS `sys_module_page`;
CREATE TABLE `sys_module_page` (
  `PageID` char(32) NOT NULL,
  `ParentID` char(32) default NULL,
  `ModuleID` char(32) NOT NULL default '',
  `PageName` varchar(64) NOT NULL default '',
  `PageIcon` varchar(64) default NULL,
  `PageURL` varchar(128) default NULL,
  `PageOrder` int(11) default '0',
  `PageFlag` char(1) default '0',
  `PageToken` varchar(128) default 'N',
  `PageRemark` varchar(128) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`PageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_organization
#

DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `DepartmentID` char(32) NOT NULL default '',
  `ParentID` char(32) default NULL,
  `DepartmentName` varchar(64) NOT NULL default '',
  `DepartmentCode` char(10) default NULL,
  `DepartmentKind` char(3) NOT NULL default '',
  `DepartmentOrder` int(11) default '0',
  `DepartmentRemark` varchar(128) default NULL,
  `DepartmentVisibility` char(1) default '0',
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`DepartmentID`),
  KEY `ParentID` (`ParentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_organization_relationship
#

DROP TABLE IF EXISTS `sys_organization_relationship`;
CREATE TABLE `sys_organization_relationship` (
  `ID` char(32) NOT NULL,
  `DepartmentID` char(32) NOT NULL,
  `ParentID` char(32) NOT NULL default '',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_position
#

DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position` (
  `PositionID` char(32) NOT NULL,
  `DepartmentID` char(32) default NULL,
  `PositionName` varchar(64) NOT NULL default '',
  `PositionRemark` varchar(128) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_position_member
#

DROP TABLE IF EXISTS `sys_position_member`;
CREATE TABLE `sys_position_member` (
  `ID` char(32) NOT NULL,
  `PositionID` char(32) NOT NULL default '',
  `UserID` char(32) NOT NULL,
  `CreateTime` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_position_scope
#

DROP TABLE IF EXISTS `sys_position_scope`;
CREATE TABLE `sys_position_scope` (
  `ID` char(32) NOT NULL,
  `PositionID` char(32) NOT NULL default '',
  `DepartmentID` char(32) NOT NULL,
  `CreateTime` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_role
#

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `RoleID` char(32) NOT NULL,
  `RoleName` varchar(64) NOT NULL default '',
  `RoleCode` char(16) NOT NULL default '',
  `RoleKind` char(1) default '0',
  `RoleRemark` varchar(128) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_role_member
#

DROP TABLE IF EXISTS `sys_role_member`;
CREATE TABLE `sys_role_member` (
  `ID` char(32) NOT NULL,
  `RoleID` char(32) NOT NULL default '',
  `UserID` char(32) NOT NULL,
  `CreateTime` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_role_page
#

DROP TABLE IF EXISTS `sys_role_page`;
CREATE TABLE `sys_role_page` (
  `ID` char(32) NOT NULL,
  `RoleID` char(32) NOT NULL,
  `PageID` char(32) NOT NULL,
  `Flag` char(1) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_serial_number
#

DROP TABLE IF EXISTS `sys_serial_number`;
CREATE TABLE `sys_serial_number` (
  `TableKey` char(32) NOT NULL,
  `KeyNumber` bigint(20) NOT NULL default '1',
  PRIMARY KEY  (`TableKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table sys_user
#

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `UserID` char(32) NOT NULL,
  `UserName` varchar(32) NOT NULL default '',
  `UserCard` varchar(32) NOT NULL default '',
  `UserIcon` varchar(128) default NULL,
  `Password` varchar(32) NOT NULL default '',
  `UserKind` char(1) NOT NULL default '0',
  `UserState` char(1) NOT NULL default '0',
  `TrueName` varchar(32) NOT NULL default '',
  `DepartmentID` char(32) default NULL,
  `UserRemark` varchar(128) default NULL,
  `CreateTime` datetime default NULL,
  `UpdateTime` datetime default NULL,
  PRIMARY KEY  (`UserID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
