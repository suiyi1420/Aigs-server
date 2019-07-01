/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : orangepi_device

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-08-08 09:32:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `deviceid` varchar(50) NOT NULL,
  `device_num` varchar(50) NOT NULL COMMENT '设备编号',
  `status` varchar(2) NOT NULL COMMENT '设备状态 0.正常  1.冻结  2.禁用  3.失效',
  `online` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`deviceid`,`device_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', 'No.000001', '0', null);
INSERT INTO `device` VALUES ('2', '000002', '0', null);
INSERT INTO `device` VALUES ('3', '000003', '0', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `is_webchat` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码',
  `status` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号状态：0.正常 1.冻结 2.禁用 3.已失效',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `user_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`,`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1532510777069', 'oG1kV0WLguTv-HeM6IBkStEZwzCE', '1', '0', '?(-^o^)-?', 'https://wx.qlogo.cn/mmopen/vi_32/9dWfsO0TlWruWJia4NvrFvhy87PuA3GXsgw6WJUAXx90ZbEmPoIcGbBia6BYBxzzUsxuAGSWrrThibSNlE28icJEww/132', null);

-- ----------------------------
-- Table structure for user_device
-- ----------------------------
DROP TABLE IF EXISTS `user_device`;
CREATE TABLE `user_device` (
  `user_device_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `deviceid` varchar(50) NOT NULL,
  `status` varchar(2) NOT NULL,
  `creat_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_device
-- ----------------------------
INSERT INTO `user_device` VALUES ('1', '1532510777069', '1', '0', '2018-06-27 10:14:23');
