

CREATE TABLE `dictionarytype` (
  `dataTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `dataTypeName` varchar(255) DEFAULT NULL,
  `dataEnable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dataTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典类别';



CREATE TABLE `dictionarytype_info` (
  `dataId` int(11) NOT NULL AUTO_INCREMENT,
  `dataTypeId` int(11) DEFAULT NULL,
  `dataInformationName` varchar(255) DEFAULT NULL,
  `dataEnable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dataId`),
  KEY `dataTypeId` (`dataTypeId`),
  CONSTRAINT `dataTypeId` FOREIGN KEY (`dataTypeId`) REFERENCES `dictionarytype` (`dataTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='字典类别信息';



CREATE TABLE `customerlevel` (
  `levelId` int(11) NOT NULL AUTO_INCREMENT,
  `business` double(8,2) DEFAULT NULL,
  `levelName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`levelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户级别';



CREATE TABLE `customerinfo` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(30) DEFAULT NULL,
  `customerProperties` int(11) DEFAULT NULL,
  `customerType` int(11) DEFAULT NULL,
  `customerLevel` int(11) DEFAULT NULL,
  `customerCompanyWebsize` varchar(100) DEFAULT NULL,
  `customerCompanyPhone` varchar(20) DEFAULT NULL,
  `register` varchar(20) DEFAULT NULL,
  `customerAddress` varchar(30) DEFAULT NULL,
  `customerProvinces` varchar(10) DEFAULT NULL,
  `customerCity` varchar(10) DEFAULT NULL,
  `customerCode` varchar(10) DEFAULT NULL,
  `openBank` int(11) DEFAULT NULL,
  `bankAccount` varchar(20) DEFAULT NULL,
  `customerSource` int(11) DEFAULT NULL,
  `noteInformation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息';



CREATE TABLE `contactpersoninfo` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `contactName` varchar(30) DEFAULT NULL,
  `contactSex` varchar(1) DEFAULT NULL,
  `contactBirthday` date DEFAULT NULL,
  `contactPost` varchar(30) DEFAULT NULL,
  `contactOfficePhone` varchar(30) DEFAULT NULL,
  `contactMobilePhone` varchar(30) DEFAULT NULL,
  `contactEmail` varchar(30) DEFAULT NULL,
  `contactRegistDate` date DEFAULT NULL,
  `contactQQNumber` varchar(30) DEFAULT NULL,
  `contactRemarks` text,
  PRIMARY KEY (`contactId`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `contactpersoninfo_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customerinfo` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联系人信息';




CREATE TABLE `menuinfo` (
  `menuInfoId` int(11) NOT NULL AUTO_INCREMENT,
  `menuInfoName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`menuInfoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单信息表';


CREATE TABLE `roleinfo` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';


CREATE TABLE `rolerelationship` (
  `roleRelationshipId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `menuInfoId` int(11) DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleRelationshipId`),
  KEY `roleId` (`roleId`),
  KEY `menuInfoId` (`menuInfoId`),
  CONSTRAINT `rolerelationship_ibfk_2` FOREIGN KEY (`menuInfoId`) REFERENCES `menuinfo` (`menuInfoId`),
  CONSTRAINT `rolerelationship_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色关系表';


CREATE TABLE `userinfo` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) DEFAULT NULL,
  `userLoginName` varchar(30) DEFAULT NULL,
  `userPassWord` varchar(30) DEFAULT NULL,
  `userTelphone` varchar(11) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userLeadId` int(11) DEFAULT NULL,
  `userRoleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `userLeadId` (`userLeadId`),
  KEY `userRoleId` (`userRoleId`),
  CONSTRAINT `userinfo_ibfk_2` FOREIGN KEY (`userRoleId`) REFERENCES `roleinfo` (`roleId`),
  CONSTRAINT `userinfo_ibfk_1` FOREIGN KEY (`userLeadId`) REFERENCES `userinfo` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户信息';



CREATE TABLE `complaininfo` (
  `complainId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `complainPerson` varchar(30) DEFAULT NULL,
  `complainTheme` varchar(30) DEFAULT NULL,
  `complainContent` text,
  `complainDate` date DEFAULT NULL,
  `complainHandleWay` text,
  `complainStatus` int(11) DEFAULT NULL,
  `complainRemarkInfo` text,
  `customerSatisfaction` int(11) DEFAULT NULL,
  PRIMARY KEY (`complainId`),
  KEY `userId` (`userId`),
  KEY `customerId` (`customerId`),
  KEY `complainStatus` (`complainStatus`),
  KEY `CustomerSatisfaction` (`customerSatisfaction`),
  CONSTRAINT `complaininfo_ibfk_4` FOREIGN KEY (`CustomerSatisfaction`) REFERENCES `dictionarytype_info` (`dataId`),
  CONSTRAINT `complaininfo_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`),
  CONSTRAINT `complaininfo_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customerinfo` (`customerId`),
  CONSTRAINT `complaininfo_ibfk_3` FOREIGN KEY (`complainStatus`) REFERENCES `dictionarytype_info` (`dataId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户投诉';














