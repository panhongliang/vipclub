/*
Navicat MySQL Data Transfer

Source Server         : 172.30.42.48
Source Server Version : 50552
Source Host           : 172.30.42.48:3306
Source Database       : shiyy

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-02-28 09:18:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for CONSUME
-- ----------------------------
DROP TABLE IF EXISTS `CONSUME`;
CREATE TABLE `CONSUME` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `MONEY` decimal(11,2) DEFAULT NULL,
  `REMARK` varchar(2000) DEFAULT NULL,
  `buytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for CUSTOMER
-- ----------------------------
DROP TABLE IF EXISTS `CUSTOMER`;
CREATE TABLE `CUSTOMER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `SEX` varchar(50) DEFAULT NULL,
  `BIRTHDAY` varchar(50) DEFAULT NULL,
  `AGE` int(3) DEFAULT NULL,
  `MOBILE` varchar(50) DEFAULT NULL,
  `QQ` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `WORKUNIT` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(500) DEFAULT NULL,
  `IDCARD` varchar(100) DEFAULT NULL,
  `CU_STYLE` int(11) DEFAULT NULL,
  `CU_STYLE2` int(11) DEFAULT NULL,
  `CU_STYLE3` int(11) DEFAULT NULL,
  `REMARK` varchar(2000) DEFAULT NULL,
  `LASTMODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFY_USER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for DICGROUP
-- ----------------------------
DROP TABLE IF EXISTS `DICGROUP`;
CREATE TABLE `DICGROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIC_KEY` int(11) DEFAULT NULL,
  `DIC_NAME` varchar(50) DEFAULT NULL,
  `DIC_GROUP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `CREATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ACCOUNT` (`ACCOUNT`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
