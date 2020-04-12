/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17-log : Database - robowolf_material
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`robowolf_material` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `robowolf_material`;

/*Table structure for table `mcategory` */

DROP TABLE IF EXISTS `mcategory`;

CREATE TABLE `mcategory` (
  `CID` INT(11) NOT NULL AUTO_INCREMENT,
  `Cname` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CID`)
)  COMMENT '物资种类表' ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `mcategory` */

INSERT  INTO `mcategory`(`CID`,`Cname`) VALUES (1,'电脑'),(2,'内存条'),(3,'显卡');

/*Table structure for table `mrevisions` */

DROP TABLE IF EXISTS `mrevisions`;

CREATE TABLE `mrevisions`(
  `MmID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '物资修改记录id 自增长',
  `IID` INT(11) NOT NULL COMMENT'物资id',
  `UID` INT(11) NOT NULL COMMENT'用户id',
  `Mstate` VARCHAR(50) NOT NULL COMMENT'物资状态',
  `Mtime` VARCHAR(50) NOT NULL COMMENT'物资更改时间',
  `Mlog` VARCHAR(50) DEFAULT NULL COMMENT'更改解释',
  PRIMARY KEY (`MmID`)
)  COMMENT '物资修改记录' ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `mrevisions` */

/*Table structure for table `tb_materials` */

DROP TABLE IF EXISTS `tb_materials`;

CREATE TABLE `tb_materials` (
  `IID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '物资id',
  `Iname` VARCHAR(50) NOT NULL COMMENT'物资名称',
  `CID` INT(11) DEFAULT NULL COMMENT'物资种类id',
  `Inote` VARCHAR(50) DEFAULT NULL COMMENT'物资解释',
  `Istate` VARCHAR(50) DEFAULT NULL COMMENT'物资状态',
  PRIMARY KEY (`IID`),
  KEY `material_mcategory_fk` (`CID`),
  CONSTRAINT `material_mcategory_fk` FOREIGN KEY (`CID`) REFERENCES `mcategory` (`CID`) ON UPDATE CASCADE
) COMMENT'物资表' ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_materials` */

INSERT  INTO `tb_materials`(`IID`,`Iname`,`CID`,`Inote`,`Istate`) VALUES (2,'dell',1,'辣鸡dell','available'),(3,'lenovo',1,'辣鸡Lenovo','available'),(4,'惠普',1,'辣鸡惠普 ','available'),(5,'三星',2,'三星牛逼','available'),(6,'Kingston',2,'金士顿牛逼','available'),(7,'嘤伟达',3,'intel','available'),(8,'RTX2080Ti',3,'充钱','available');

/*Table structure for table `uuser` */

DROP TABLE IF EXISTS `uuser`;

CREATE TABLE `uuser` (
  `UID` INT(11) NOT NULL AUTO_INCREMENT COMMENT'用户id',
  `Uname` VARCHAR(50) NOT NULL COMMENT'名称',
  `Usex` VARCHAR(50) DEFAULT NULL COMMENT'性别',
  `Upassword` VARCHAR(50) NOT NULL COMMENT'密码',
  `Uapartment` VARCHAR(50) NOT NULL COMMENT'部门',
  `Upermission` VARCHAR(50) NOT NULL COMMENT'权限',
  `Uphone` VARCHAR(50) NOT NULL COMMENT'手机号',
  PRIMARY KEY (`UID`)
)COMMENT '用户'  ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `uuser` */

INSERT  INTO `uuser`(`UID`,`Uname`,`Usex`,`Upassword`,`Uapartment`,`Upermission`,`Uphone`) VALUES (1,'hzk','男','hzk','背锅组','admin','110'),(2,'wzx','男','wzx','丢锅组','admin','110'),(3,'jyd','男','jyd','摸鱼组','admin','110');


/*Table structure for table `tb_mcheckout` */

DROP TABLE IF EXISTS `tb_mcheckout`;

CREATE TABLE `tb_mcheckout` (
  `OID` INT(11) NOT NULL AUTO_INCREMENT COMMENT'借还id',
  `IID` INT(11) NOT NULL COMMENT'物资id',
  `UID` INT(11) NOT NULL COMMENT'用户id',
  `Ostate` VARCHAR(50) NOT NULL COMMENT'借还状态',
  `Otime` VARCHAR(50) NOT NULL COMMENT'借还时间',
  PRIMARY KEY (`OID`),
  KEY `mcheckout_materials_fk` (`IID`),
  KEY `mcheckout_user_fk` (`UID`),
  CONSTRAINT `mcheckout_materials_fk` FOREIGN KEY (`IID`) REFERENCES `tb_materials` (`IID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mcheckout_user_fk` FOREIGN KEY (`UID`) REFERENCES `uuser` (`UID`) ON UPDATE CASCADE
) COMMENT'借还表' ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_mcheckout` */

/*Table structure for table `tb_mdetail` */

DROP TABLE IF EXISTS `tb_mdetail`;

CREATE TABLE `tb_mdetail`  (
  `DID` INT(11) NOT NULL AUTO_INCREMENT COMMENT'详情id',
  `CID` INT(11) NOT NULL COMMENT'物资种类id',
  `IID` INT(11) NOT NULL COMMENT'物资id',
  `Dproperity` VARCHAR(50) DEFAULT NULL COMMENT '物资属性',
  PRIMARY KEY (`DID`),
  KEY `mdetail_mcategory_fk` (`CID`),
  KEY `mdetail_materials_fk` (`IID`),
  CONSTRAINT `mdetail_materials_fk` FOREIGN KEY (`IID`) REFERENCES `tb_materials` (`IID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mdetail_mcategory_fk` FOREIGN KEY (`CID`) REFERENCES `mcategory` (`CID`) ON UPDATE CASCADE
) COMMENT '物资详情' ENGINE=INNODB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tb_mdetail` */

INSERT  INTO `tb_mdetail`(`DID`,`CID`,`IID`,`Dproperity`) VALUES (4,1,2,'电脑参数XXX'),(5,1,3,'电脑参数XXX'),(6,1,4,'电脑参数XXX'),(7,2,5,'内存条参数XXX'),(8,2,6,'内存条参数XXX'),(9,3,7,'显卡参数XXX'),(10,3,8,'参数XXX');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
