/*
Navicat MySQL Data Transfer

Source Server         : localhost：3306
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : tccp

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-05-08 22:29:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tccp_action
-- ----------------------------
DROP TABLE IF EXISTS `tccp_action`;
CREATE TABLE `tccp_action` (
  `action_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `action_type` int(10) NOT NULL DEFAULT '0' COMMENT '0代表“动态”',
  `action_date` varchar(255) DEFAULT NULL,
  `action_message` varchar(255) DEFAULT NULL,
  `action_describe` int(10) DEFAULT NULL,
  `action_like` int(10) DEFAULT '0',
  PRIMARY KEY (`action_id`),
  KEY `ui` (`user_id`) USING BTREE,
  KEY `describe` (`action_describe`) USING BTREE,
  CONSTRAINT `user-action1` FOREIGN KEY (`user_id`) REFERENCES `tccp_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tccp_action
-- ----------------------------
INSERT INTO `tccp_action` VALUES ('1', '2', '0', '2016年05月02日 12时57分06秒', 'Leeon发表的动态1', '4', null);
INSERT INTO `tccp_action` VALUES ('2', '2', '2', '2016年05月02日 12时57分06秒', 'Leeon发表的公告1', null, '0');
INSERT INTO `tccp_action` VALUES ('3', '3', '1', '2016年05月02日 12时57分06秒', 'Alin对Leoon的评论1', '1', '0');
INSERT INTO `tccp_action` VALUES ('4', '2', '0', '2016年05月02日 12时57分06秒', 'Leeon发表的动态2', '2', '0');
INSERT INTO `tccp_action` VALUES ('5', '2', '0', '2016年05月02日 12时57分06秒', 'Leeon发表的动态3', '3', '0');
INSERT INTO `tccp_action` VALUES ('6', '3', '1', '2016年05月02日 12时57分06秒', 'Alin对Leoon的评论2', '1', '0');
INSERT INTO `tccp_action` VALUES ('7', '3', '0', '2016年05月02日 12时57分06秒', 'Alin发表的动态1', '8', '0');
INSERT INTO `tccp_action` VALUES ('8', '2', '1', '2016年05月02日 12时57分06秒', 'Leeon对Alin发表的评论1', '7', '0');
INSERT INTO `tccp_action` VALUES ('9', '4', '1', '2016年05月02日 12时57分06秒', 'test对Leeon的评论', '1', '0');
INSERT INTO `tccp_action` VALUES ('10', '4', '2', '2016年05月02日 12时57分06秒', 'test发表的公告', null, '0');
INSERT INTO `tccp_action` VALUES ('11', '4', '0', '2016年05月02日 12时57分06秒', 'test发表的动态1', '3', '0');
INSERT INTO `tccp_action` VALUES ('12', '4', '0', '2016年05月02日 12时57分06秒', 'test发表的动态2', '3', '0');
INSERT INTO `tccp_action` VALUES ('13', '3', '1', '2016年05月02日 12时57分06秒', 'Alin对test的评论1', '11', '0');
INSERT INTO `tccp_action` VALUES ('14', '2', '1', '2016年05月02日 12时57分06秒', 'Leeon对test的评论1', '12', '0');
INSERT INTO `tccp_action` VALUES ('15', '3', '1', '2016年05月02日 12时57分06秒', 'Alin对test的评论2', '12', '0');
INSERT INTO `tccp_action` VALUES ('16', '2', '1', '2016年05月02日 12时57分06秒', 'Leeon对test的评论2', '11', '0');

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
  `groups` varchar(10) DEFAULT 'Web组',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tccp_user
-- ----------------------------
INSERT INTO `tccp_user` VALUES ('1', 'superAdmin', 'e10adc3949ba59abbe56e057f20f883e', '0', '18829291491', '352862566@qq.com', '352862566', 'http://blog.csdn.net/zhangliangzi', 'https://github.com/leeonl', '大三', '计科', '1994-09-10', '西安邮电大学', '学生', '2', 'images/bg.png', '技术改变生活，奋斗共享价值！哈~', '嵌入式组');
INSERT INTO `tccp_user` VALUES ('2', 'leeon', 'e10adc3949ba59abbe56e057f20f883e', '0', '18829291325', 'testname@163.com', '123456', 'TCCP的博客', 'https://test.git', '大三', '软件', '1993-09-11', '西安', '学生', '1', 'images/bg.png', '技术改变人生，奋斗共享价值！', '大数据组');
INSERT INTO `tccp_user` VALUES ('3', 'alin', 'e10adc3949ba59abbe56e057f20f883e', '0', '18829291006', 'testname2@qq.com', '234567', null, null, '大三', '计科', null, '西安邮电大学', '学生', '1', 'images/bg.png', '技术改变生活，奋斗共享价值', 'Web组');
INSERT INTO `tccp_user` VALUES ('4', 'test', 'e10adc3949ba59abbe56e057f20f883e', '0', null, null, null, null, null, null, null, null, '西安邮电大学', '学生', '1', 'noimg.png', '技术改变生活，奋斗共享价值', 'Web组');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `age` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'tccp', '1');
INSERT INTO `user` VALUES ('2', '张三', '18');
INSERT INTO `user` VALUES ('3', '李四', '22');
INSERT INTO `user` VALUES ('5', '钱6', '24');
INSERT INTO `user` VALUES ('7', '王五', '33');
INSERT INTO `user` VALUES ('9', 'cx', '324');
INSERT INTO `user` VALUES ('10', '王五', '33');
