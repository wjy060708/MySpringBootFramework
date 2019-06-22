CREATE TABLE `epm_project_type` (
  `TypeID` char(32) NOT NULL,
  
  `TypeName` varchar(64) NOT NULL DEFAULT '',
  `TypeRemark` varchar(256) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;