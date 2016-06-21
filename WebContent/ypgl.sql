/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : ypgl

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2016-06-21 09:07:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `caidan`
-- ----------------------------
DROP TABLE IF EXISTS `caidan`;
CREATE TABLE `caidan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `juese` varchar(255) DEFAULT NULL,
  `caidan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caidan
-- ----------------------------
INSERT INTO `caidan` VALUES ('32', '卖药的', '销售');
INSERT INTO `caidan` VALUES ('110', '普通用户', '系统用户管理');
INSERT INTO `caidan` VALUES ('111', '普通用户', '销售');
INSERT INTO `caidan` VALUES ('112', '管理员', '系统用户管理');
INSERT INTO `caidan` VALUES ('113', '管理员', '角色权限管理');
INSERT INTO `caidan` VALUES ('114', '管理员', '职工管理');
INSERT INTO `caidan` VALUES ('115', '管理员', '销售');
INSERT INTO `caidan` VALUES ('116', '管理员', '价目表管理');
INSERT INTO `caidan` VALUES ('117', '管理员', '销售单查询');
INSERT INTO `caidan` VALUES ('118', '管理员', '供应商信息管理');
INSERT INTO `caidan` VALUES ('119', '管理员', '进货');
INSERT INTO `caidan` VALUES ('120', '管理员', '进货单信息查询');
INSERT INTO `caidan` VALUES ('121', '管理员', '药品信息管理');
INSERT INTO `caidan` VALUES ('122', '管理员', '过期/毁坏处理');

-- ----------------------------
-- Table structure for `gongyingshang`
-- ----------------------------
DROP TABLE IF EXISTS `gongyingshang`;
CREATE TABLE `gongyingshang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fuzeren` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `dizhi` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gongyingshang
-- ----------------------------
INSERT INTO `gongyingshang` VALUES ('1', '1', '1', '耶，测试成功了！', '1', '1');
INSERT INTO `gongyingshang` VALUES ('2', '2', '2', '2', '2', '1');
INSERT INTO `gongyingshang` VALUES ('3', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('4', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('5', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('6', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('7', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('8', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('9', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('10', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('11', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('12', '我的', '可以随意修改了！', '~~~~', '他的', '1');
INSERT INTO `gongyingshang` VALUES ('13', '我的de', '哈哈', '发', '', '1');
INSERT INTO `gongyingshang` VALUES ('14', '我的', '他的', '你的', '她的', '1');
INSERT INTO `gongyingshang` VALUES ('15', null, '的萨达', '是的', null, '1');
INSERT INTO `gongyingshang` VALUES ('16', null, null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('17', '', null, null, null, '1');
INSERT INTO `gongyingshang` VALUES ('18', '阿西吧的萨达让我去发送', '阿萨德你是', '哦呵呵', '阿萨德', '1');
INSERT INTO `gongyingshang` VALUES ('19', '发送过程', '阿萨德任务', '哦呵呵任务', '阿萨德任务', '1');
INSERT INTO `gongyingshang` VALUES ('20', '王企鹅完全', '请问奋斗', '恶趣味e', '王企鹅', '1');
INSERT INTO `gongyingshang` VALUES ('21', '去问问去恶趣味eqw让我去', ' 恶趣味', '额请问王企鹅qw', '恶趣味额请问', '1');
INSERT INTO `gongyingshang` VALUES ('22', '的撒', '', '', '', '1');
INSERT INTO `gongyingshang` VALUES ('23', '1', '1', '1', '1', '1');
INSERT INTO `gongyingshang` VALUES ('24', '1', '1', '1', '1', '0');
INSERT INTO `gongyingshang` VALUES ('25', '1', '1', '1', '1', '1');
INSERT INTO `gongyingshang` VALUES ('26', '1', '1', '1', '1', '0');
INSERT INTO `gongyingshang` VALUES ('27', '1', '1', '1', '1', '0');
INSERT INTO `gongyingshang` VALUES ('28', '1', '1', '1', '1', '0');
INSERT INTO `gongyingshang` VALUES ('29', '1', '1', '1', '1', '0');
INSERT INTO `gongyingshang` VALUES ('30', '1', '1', '1', '1', '0');
INSERT INTO `gongyingshang` VALUES ('31', '1', '1', '1', '1', '1');
INSERT INTO `gongyingshang` VALUES ('32', '1', '1', '1', '1', '0');
INSERT INTO `gongyingshang` VALUES ('33', '1', '1', '1', '1', '0');
INSERT INTO `gongyingshang` VALUES ('34', '1', '1', '1', '1', '1');
INSERT INTO `gongyingshang` VALUES ('35', '1', '2', '2', '2', '0');
INSERT INTO `gongyingshang` VALUES ('36', '1', '2', '2', '21', '1');

-- ----------------------------
-- Table structure for `jinhuo`
-- ----------------------------
DROP TABLE IF EXISTS `jinhuo`;
CREATE TABLE `jinhuo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yaopinid` varchar(255) DEFAULT NULL,
  `yaopinname` varchar(255) DEFAULT NULL,
  `jinhuodate` varchar(255) DEFAULT NULL,
  `gongyingshang` varchar(255) DEFAULT NULL,
  `pici` varchar(255) DEFAULT NULL,
  `shengchandate` varchar(255) DEFAULT NULL,
  `guoqidate` varchar(255) DEFAULT NULL,
  `shuliang` varchar(255) DEFAULT NULL,
  `danwei` varchar(255) DEFAULT NULL,
  `danjia` varchar(255) DEFAULT NULL,
  `zongjia` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jinhuo
-- ----------------------------
INSERT INTO `jinhuo` VALUES ('1', null, '阿莫西林', null, '1', '1', '20160510', '20160517', '1', '1', '1', '', '0');
INSERT INTO `jinhuo` VALUES ('2', null, '妇炎洁', null, '1', '1', '20160502', '20160504', '1', '1', '1', '', '0');
INSERT INTO `jinhuo` VALUES ('3', null, '妇炎洁', null, '1', '1', '20160502', '20160504', '1', '1', '1', '', '0');
INSERT INTO `jinhuo` VALUES ('4', null, '妇炎洁', null, '1', '1', '20160502', '20160504', '1', '1', '1', '', '0');
INSERT INTO `jinhuo` VALUES ('5', null, '妇炎洁', null, '1', '1', '20160502', '20160504', '1', '1', '1', '', '0');
INSERT INTO `jinhuo` VALUES ('6', null, '妇炎洁', null, '1', '1', '20160502', '20160504', '1', '1', '1', '', '0');
INSERT INTO `jinhuo` VALUES ('7', null, '妇炎洁', null, '1', '1', '20160502', '20160517', '2', '12', '2', '', '0');
INSERT INTO `jinhuo` VALUES ('8', null, '阿莫西林', null, '1', '为我', '20160503', '20160518', '为', '任务', '让我', '', '0');
INSERT INTO `jinhuo` VALUES ('9', null, '妇炎洁', null, '1', '让我去', '20160519', '20160518', '我', '我', '我', '', '0');
INSERT INTO `jinhuo` VALUES ('10', null, '阿莫西林', null, '1', '1', '20160517', '20160517', '1', '12', '1', '', '0');
INSERT INTO `jinhuo` VALUES ('11', null, '', null, '', '2123', '20160503', '20160511', '11', '321 ', '22', '242', '0');
INSERT INTO `jinhuo` VALUES ('12', null, '妇炎洁', null, '1', '的', '20160510', '20160504', '1', '的', '222', '222', '0');
INSERT INTO `jinhuo` VALUES ('13', null, '妇炎洁', null, '1', '1', '20160511', '20160511', '1', '1', '2', '2', '0');
INSERT INTO `jinhuo` VALUES ('14', null, '阿莫西林', null, '1', '3', '20160503', '20160516', '11', '12', '22', '242', '0');
INSERT INTO `jinhuo` VALUES ('15', null, '妇炎洁', null, '1', '1', '20160503', '20160502', '1', '1', '2', '2', '0');
INSERT INTO `jinhuo` VALUES ('16', null, '妇炎洁', '2016-05-02 13:48:29', '', '1', '20160502', '20160502', '2', '盒', '10', '20', '0');
INSERT INTO `jinhuo` VALUES ('17', null, '妇炎洁', '2016-05-02 13:49:55', '1', '1', '2016-06-01', '2016-05-18', '2', '盒', '10', '20', '0');
INSERT INTO `jinhuo` VALUES ('18', null, '阿莫西林', '2016-05-02 19:55:30', '1', '1 ', '2016-05-10', '2016-05-11', '9999', '盒', '10', '99990', '0');
INSERT INTO `jinhuo` VALUES ('19', null, '213', '2016-05-23 22:39:24', '', 'yyy', '2016-05-23', '2016-05-03', '123456', '123', '9999', '1234436544', '0');

-- ----------------------------
-- Table structure for `juese`
-- ----------------------------
DROP TABLE IF EXISTS `juese`;
CREATE TABLE `juese` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `juese` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of juese
-- ----------------------------
INSERT INTO `juese` VALUES ('1', '管理员');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `reqdate` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '普通用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('18', 'zddzdd', '1', '289115128@qq.com1', '赵小笛企鹅去', '15074481234', null, '0', '管理员');
INSERT INTO `userinfo` VALUES ('33', '1111111e', '1', '32@q.q', '盛大', '11111111111', null, '0', '普通用户');
INSERT INTO `userinfo` VALUES ('34', '1111111e2', '1', '32@q.q', '盛大', '11111111111', null, '0', '普通用户');
INSERT INTO `userinfo` VALUES ('35', '1111111e22', '1', '32@q.q', '盛大', '11111111111', null, '0', '普通用户');
INSERT INTO `userinfo` VALUES ('36', 'zddzdd1', '1', '1@q.c', '地方', '11111111111', '2016-04-23 08:44:22', '0', '普通用户');
INSERT INTO `userinfo` VALUES ('37', '1', '1', '1', '1', '1', '1', '0', '普通用户');
INSERT INTO `userinfo` VALUES ('38', '2', '1', '2', '2', '2', '2', '0', '管理员');
INSERT INTO `userinfo` VALUES ('39', '3', '1', '3', '3', '3', '3', '0', '普通用户');
INSERT INTO `userinfo` VALUES ('40', '4', '1', '4', '4', '4', '4', '0', '普通用户');
INSERT INTO `userinfo` VALUES ('41', '5', '1', '5', '5', '5', '5', '0', '普通用户');
INSERT INTO `userinfo` VALUES ('42', '6', 'password', '6', '6', '6', null, '0', '管理员');

-- ----------------------------
-- Table structure for `xiaoshou`
-- ----------------------------
DROP TABLE IF EXISTS `xiaoshou`;
CREATE TABLE `xiaoshou` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yaopinid` varchar(255) DEFAULT NULL,
  `yaopinname` varchar(255) DEFAULT NULL,
  `shuliang` varchar(255) DEFAULT NULL,
  `danjia` varchar(255) DEFAULT NULL,
  `zongjia` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiaoshou
-- ----------------------------
INSERT INTO `xiaoshou` VALUES ('1', null, '阿莫西林', '1', '2', '2', '2016-05-02 19:48:02', '0');
INSERT INTO `xiaoshou` VALUES ('2', null, '阿莫西林', '1', '2', '2', '2016-05-02 19:48:45', '0');
INSERT INTO `xiaoshou` VALUES ('3', null, '阿莫西林', '9', '2', '18', '2016-05-02 19:49:45', '0');
INSERT INTO `xiaoshou` VALUES ('4', null, '阿莫西林', '1', '2', '2', '2016-05-02 19:56:05', '0');
INSERT INTO `xiaoshou` VALUES ('5', null, '阿莫西林', '1', '2', '2', '2016-05-02 19:57:29', '0');
INSERT INTO `xiaoshou` VALUES ('6', null, '阿莫西林', '1', '2', '2', '2016-05-02 19:58:25', '0');

-- ----------------------------
-- Table structure for `yaopinchuli`
-- ----------------------------
DROP TABLE IF EXISTS `yaopinchuli`;
CREATE TABLE `yaopinchuli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shuliang` varchar(255) DEFAULT NULL,
  `yaopinname` varchar(255) DEFAULT NULL,
  `pici` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `yuanyin` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yaopinchuli
-- ----------------------------
INSERT INTO `yaopinchuli` VALUES ('1', '1', '阿莫西林', '22', '2016-05-02 21:04:34', '', '0');
INSERT INTO `yaopinchuli` VALUES ('2', '1', '阿莫西林', '22', '2016-05-02 21:05:32', '过期', '0');
INSERT INTO `yaopinchuli` VALUES ('3', '1', '阿莫西林', '1', '2016-05-02 21:11:58', '过期', '0');
INSERT INTO `yaopinchuli` VALUES ('4', '1', '阿莫西林', '1', '2016-05-02 21:26:36', '过期', '0');
INSERT INTO `yaopinchuli` VALUES ('5', '1', '阿莫西林', '1', '2016-05-02 21:26:41', '过期', '0');

-- ----------------------------
-- Table structure for `yaopininfo`
-- ----------------------------
DROP TABLE IF EXISTS `yaopininfo`;
CREATE TABLE `yaopininfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `changjia` varchar(255) DEFAULT NULL,
  `leibie` varchar(255) DEFAULT NULL,
  `danwei` varchar(255) DEFAULT NULL,
  `jhdanjia` varchar(255) DEFAULT NULL,
  `lsdanjia` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yaopininfo
-- ----------------------------
INSERT INTO `yaopininfo` VALUES ('1', '阿莫西林', '新疆阿尔泰', '111', '盒', '999', '888', '0');
INSERT INTO `yaopininfo` VALUES ('2', '妇炎洁', '213', '222水电费', '222', '10', '2', '1');
INSERT INTO `yaopininfo` VALUES ('3', '123', '123', '123', '123', null, '2', '1');
INSERT INTO `yaopininfo` VALUES ('4', '213', '123', '1234', '123', '9999', '888', '0');
INSERT INTO `yaopininfo` VALUES ('5', '333', '你好', '333', '333', null, '2', '1');

-- ----------------------------
-- Table structure for `yaopinjiage`
-- ----------------------------
DROP TABLE IF EXISTS `yaopinjiage`;
CREATE TABLE `yaopinjiage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yaopinid` varchar(255) DEFAULT NULL,
  `yaopinname` varchar(255) DEFAULT NULL,
  `jhdanjia` varchar(255) DEFAULT NULL,
  `lsdanjia` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yaopinjiage
-- ----------------------------

-- ----------------------------
-- Table structure for `yaopinkucun`
-- ----------------------------
DROP TABLE IF EXISTS `yaopinkucun`;
CREATE TABLE `yaopinkucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yaopinid` varchar(255) DEFAULT NULL,
  `yaopinname` varchar(255) DEFAULT NULL,
  `shuliang` varchar(255) DEFAULT NULL,
  `jhzongjia` varchar(255) DEFAULT NULL,
  `lszongjia` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yaopinkucun
-- ----------------------------
INSERT INTO `yaopinkucun` VALUES ('1', null, '妇炎洁', '6', '44', null, '0');
INSERT INTO `yaopinkucun` VALUES ('2', null, '阿莫西林', '9991', '242', null, '0');
INSERT INTO `yaopinkucun` VALUES ('3', null, '213', '123456', null, null, '0');

-- ----------------------------
-- Table structure for `zhigong`
-- ----------------------------
DROP TABLE IF EXISTS `zhigong`;
CREATE TABLE `zhigong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gonghao` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `bumen` varchar(255) DEFAULT NULL,
  `zhiwu` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `ruzhidate` varchar(255) DEFAULT NULL,
  `lizhidate` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zhigong
-- ----------------------------
INSERT INTO `zhigong` VALUES ('1', '3', '3', '3', '3', '3', '3', '3', '2016-05-04 21:13:01', '1');
INSERT INTO `zhigong` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '2016-05-04 21:13:17', '1');
INSERT INTO `zhigong` VALUES ('3', '2', '2', '2', '2', '12323', '2', '2', '2016-05-04 21:14:27', '1');
INSERT INTO `zhigong` VALUES ('4', '10086', '刘小娇', 'xbrl部门', '实习生', '123', '1', '2016-1-1', '2016-05-04 22:01:24', '1');
INSERT INTO `zhigong` VALUES ('5', '999', '999', '999', '999', '999', '999', '2016-05-04 21:59:30', '2016-05-04 22:01:49', '1');
INSERT INTO `zhigong` VALUES ('6', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:03', '2016-05-17 14:45:21', '1');
INSERT INTO `zhigong` VALUES ('7', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:27', null, '0');
INSERT INTO `zhigong` VALUES ('8', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:28', null, '0');
INSERT INTO `zhigong` VALUES ('9', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:29', null, '0');
INSERT INTO `zhigong` VALUES ('10', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:29', null, '0');
INSERT INTO `zhigong` VALUES ('11', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:30', null, '0');
INSERT INTO `zhigong` VALUES ('12', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:30', null, '0');
INSERT INTO `zhigong` VALUES ('13', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:30', null, '0');
INSERT INTO `zhigong` VALUES ('14', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:31', null, '0');
INSERT INTO `zhigong` VALUES ('15', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:31', null, '0');
INSERT INTO `zhigong` VALUES ('16', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:32', null, '0');
INSERT INTO `zhigong` VALUES ('17', '999', '999', '999', '999', '999', '999', '2016-05-04 22:01:32', null, '0');
