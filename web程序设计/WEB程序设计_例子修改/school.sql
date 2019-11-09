/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : school

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2018-02-10 14:26:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `ID` INT(11) NOT NULL,
  `BOOK_NAME` VARCHAR(50) DEFAULT NULL,
  `book_price` DOUBLE DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('1', 'Java Web开发与应用', '44.5');
INSERT INTO `t_book` VALUES ('2', 'Java编程思想', '86.4');
INSERT INTO `t_book` VALUES ('3', 'Java核心技术', '94');
INSERT INTO `t_book` VALUES ('4', 'JavaEE程序设计与应用开发', '29');
INSERT INTO `t_book` VALUES ('5', '面向对象技术与UML', '30.24');

-- ----------------------------
-- Table structure for t_book2
-- ----------------------------
DROP TABLE IF EXISTS `t_book2`;
CREATE TABLE `t_book2` (
  `BOOKNO` VARCHAR(40) DEFAULT NULL,
  `BOOKNAME` VARCHAR(40) DEFAULT NULL,
  `BOOKPRICE` DOUBLE DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book2
-- ----------------------------
INSERT INTO `t_book2` VALUES ('1', '操作系统', '46');
INSERT INTO `t_book2` VALUES ('2', '算法与数据结构', '35');
INSERT INTO `t_book2` VALUES ('3', 'Java', '39');
INSERT INTO `t_book2` VALUES ('4', 'C++', '56');
INSERT INTO `t_book2` VALUES ('5', '离散数学', '32');
INSERT INTO `t_book2` VALUES ('6', '微积分', '30');
INSERT INTO `t_book2` VALUES ('7', '数学物理方法', '28');
INSERT INTO `t_book2` VALUES ('8', '机械设计', '26');
INSERT INTO `t_book2` VALUES ('9', '西方哲学', '28');
INSERT INTO `t_book2` VALUES ('10', '大学文学', '32');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `COURSENO` VARCHAR(20) DEFAULT NULL,
  `COURSENAME` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('001', '语文');
INSERT INTO `t_course` VALUES ('002', '数学');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `ACCOUNT` VARCHAR(40) DEFAULT NULL,
  `PASSWORD` VARCHAR(40) DEFAULT NULL,
  `CNAME` VARCHAR(40) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('0001', '1111', '李方');
INSERT INTO `t_customer` VALUES ('0002', '2222', '王伟');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `STUNO` VARCHAR(20) DEFAULT NULL,
  `TYPE` VARCHAR(20) DEFAULT NULL,
  `COURSENO` VARCHAR(20) DEFAULT NULL,
  `SCORE` INT(11) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('0001', '期中', '001', '90');
INSERT INTO `t_score` VALUES ('0001', '期末', '001', NULL);
INSERT INTO `t_score` VALUES ('0002', '期中', '001', '92');
INSERT INTO `t_score` VALUES ('0002', '期末', '001', '85');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `STUNO` VARCHAR(50) NOT NULL,
  `STUNAME` VARCHAR(50) DEFAULT NULL,
  `STUSEX` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`STUNO`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('0001', '王海', '男');
INSERT INTO `t_student` VALUES ('0002', '冯山', '女');
INSERT INTO `t_student` VALUES ('0003', '张平', '男');
INSERT INTO `t_student` VALUES ('0004', '刘欢', '女');
INSERT INTO `t_student` VALUES ('0005', '唐为', '男');
INSERT INTO `t_student` VALUES ('0006', '唐风', '女');
INSERT INTO `t_student` VALUES ('0007', '刘平', '男');
INSERT INTO `t_student` VALUES ('0008', '徐少强', '男');
INSERT INTO `t_student` VALUES ('0009', '陈发', '女');
INSERT INTO `t_student` VALUES ('0010', '江海', '女');

-- ----------------------------
-- Table structure for t_vote
-- ----------------------------
DROP TABLE IF EXISTS `t_vote`;
CREATE TABLE `t_vote` (
  `TEACHERNO` VARCHAR(20) DEFAULT NULL,
  `TEACHERNAME` VARCHAR(20) DEFAULT NULL,
  `VOTE` INT(11) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vote
-- ----------------------------
INSERT INTO `t_vote` VALUES ('1', '郭克华', '24');
INSERT INTO `t_vote` VALUES ('2', '李亚', '6');
INSERT INTO `t_vote` VALUES ('3', '刘璇', '2');
INSERT INTO `t_vote` VALUES ('4', '王刚', '18');
INSERT INTO `t_vote` VALUES ('5', '刘宁', '9');
INSERT INTO `t_vote` VALUES ('6', '朱芳', '7');
INSERT INTO `t_vote` VALUES ('7', '陈飞', '5');
INSERT INTO `t_vote` VALUES ('8', '王晓', '2');
INSERT INTO `t_vote` VALUES ('9', '周云', '4');

