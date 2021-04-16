/*
Navicat MySQL Data Transfer

Source Server         : 106.13.236.137
Source Server Version : 50642
Source Host           : 106.13.236.137:3306
Source Database       : bootstrap-And-Jqgrid

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-11-13 01:21:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` varchar(99) DEFAULT NULL,
  `name` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '建设部');
INSERT INTO `dept` VALUES ('2', '门铃部');
INSERT INTO `dept` VALUES ('3', '研发部');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` varchar(99) DEFAULT NULL,
  `name` varchar(99) DEFAULT NULL,
  `salary` varchar(99) DEFAULT NULL,
  `age` varchar(99) DEFAULT NULL,
  `bir` date DEFAULT NULL,
  `did` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '张三', '1', '1', '2019-11-12', '1');
INSERT INTO `emp` VALUES ('2', '李四', '2', '2', '2019-11-12', '2');
INSERT INTO `emp` VALUES ('3', '王五', '3', '3', '2019-11-12', '2');
INSERT INTO `emp` VALUES ('4', '孙七', '4', '4', '2019-11-12', '3');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` varchar(99) DEFAULT NULL,
  `tag` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '小胖子');
INSERT INTO `tag` VALUES ('2', '小瘦子');
INSERT INTO `tag` VALUES ('3', '大帅哥');
INSERT INTO `tag` VALUES ('4', '大美女');

-- ----------------------------
-- Table structure for tagz
-- ----------------------------
DROP TABLE IF EXISTS `tagz`;
CREATE TABLE `tagz` (
  `id` varchar(11) DEFAULT NULL,
  `tid` varchar(11) DEFAULT NULL,
  `eid` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tagz
-- ----------------------------
INSERT INTO `tagz` VALUES ('1', '1', '1');
INSERT INTO `tagz` VALUES ('2', '1', '2');
INSERT INTO `tagz` VALUES ('3', '2', '2');
INSERT INTO `tagz` VALUES ('4', '1', '3');
INSERT INTO `tagz` VALUES ('5', '2', '3');
INSERT INTO `tagz` VALUES ('6', '3', '3');
INSERT INTO `tagz` VALUES ('7', '1', '4');
INSERT INTO `tagz` VALUES ('8', '2', '4');
INSERT INTO `tagz` VALUES ('9', '3', '4');
INSERT INTO `tagz` VALUES ('10', '4', '4');
