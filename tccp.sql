/*
Navicat MySQL Data Transfer

Source Server         : localhost：3306
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : tccp

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-03-29 16:30:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tccp_action
-- ----------------------------
DROP TABLE IF EXISTS `tccp_action`;
CREATE TABLE `tccp_action` (
  `action_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `action` int(10) NOT NULL DEFAULT '0' COMMENT '0代表“动态”',
  `date` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `like` int(10) DEFAULT '0',
  PRIMARY KEY (`action_id`),
  KEY `ui` (`user_id`) USING BTREE,
  CONSTRAINT `user-action1` FOREIGN KEY (`user_id`) REFERENCES `tccp_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tccp_action
-- ----------------------------

-- ----------------------------
-- Table structure for tccp_user
-- ----------------------------
DROP TABLE IF EXISTS `tccp_user`;
CREATE TABLE `tccp_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '123456',
  `sex` int(10) DEFAULT '0',
  `phonenum` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `blog` varchar(50) DEFAULT NULL,
  `github` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `workplace` varchar(50) DEFAULT '西安邮电大学',
  `job` varchar(50) DEFAULT '学生',
  `priority` int(10) DEFAULT NULL,
  `image` varchar(50) DEFAULT 'noimg.png',
  `motto` varchar(255) DEFAULT '技术改变生活，奋斗共享价值',
  `groups` int(10) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tccp_user
-- ----------------------------
INSERT INTO `tccp_user` VALUES ('1', 'superAdmin', '666666', '0', '18829291491', '352862566@qq.com', '352862566', 'http://blog.csdn.net/zhangliangzi', 'https://github.com/leeonl', '大三', '计科', '1994-09-10', '西安邮电大学', '学生', '2', 'noimg.png', '技术改变生活，奋斗共享价值！哈~', '1');
INSERT INTO `tccp_user` VALUES ('2', 'testname', '123456', '1', '18829291325', 'testname@163.com', '123456', 'TCCP的博客', 'https://test.git', '大三', '物联网', '1993-09-11', '西安邮电大学', '学生', '0', 'Chrysanthemum.jpg', '技术改变人生，奋斗共享价值！', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `age` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'tccp', '1');
INSERT INTO `user` VALUES ('2', '张三', '18');
INSERT INTO `user` VALUES ('3', '李四', '22');
INSERT INTO `user` VALUES ('5', '钱6', '24');
INSERT INTO `user` VALUES ('7', '王五', '33');
INSERT INTO `user` VALUES ('9', 'cx', '324');
