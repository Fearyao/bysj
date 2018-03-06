/*
Navicat MySQL Data Transfer

Source Server         : yyao
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-05 17:51:21
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bbs_reply`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_reply`;
CREATE TABLE `bbs_reply` (
  `RID` int(11) NOT NULL AUTO_INCREMENT,
  `RTID` int(11) DEFAULT NULL,
  `RSID` int(11) DEFAULT NULL,
  `RUID` int(11) DEFAULT NULL,
  `TEmotion` varchar(64) DEFAULT NULL,
  `RContent` varchar(1024) DEFAULT NULL,
  `RToContent` varchar(1024) DEFAULT NULL,
  `RToUser` varchar(1024) DEFAULT NULL,
  `RTime` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_reply
-- ----------------------------
INSERT INTO `bbs_reply` VALUES ('1', '2', null, '1', '/static/uploads/emotion.jpg', '一号说的话', '123', 'q', '11111111');
INSERT INTO `bbs_reply` VALUES ('2', '1', null, '2', '/static/uploads/emotion.jpg', '二号说的话', '456', 'w', null);
INSERT INTO `bbs_reply` VALUES ('3', '1', null, '3', '/static/uploads/emotion.jpg', '三号说的话', '963', 'e', null);
INSERT INTO `bbs_reply` VALUES ('4', '1', null, '4', '/static/uploads/emotion.jpg', '四号说的话', '159', 'r', null);
INSERT INTO `bbs_reply` VALUES ('5', '1', null, '5', '/static/uploads/emotion.jpg', '五号说的话', '65+', 't', null);
INSERT INTO `bbs_reply` VALUES ('6', '1', null, '5', '/static/uploads/emotion.jpg', 'ceshi', '二号说的话', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('7', '0', null, '0', '/static/uploads/emotion.jpg', 'haoya', 'undefined', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('8', '0', null, '0', '/static/uploads/emotion.jpg', 'hoaya', 'undefined', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('9', '0', null, '5', '/static/uploads/emotion.jpg', 'haoya', 'undefined', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('10', '1', null, '5', '/static/uploads/emotion.jpg', 'haoya', 'ceshi', '1', null);
INSERT INTO `bbs_reply` VALUES ('11', '1', null, '5', null, 'heiheihei', '五号说的话', '1', null);
INSERT INTO `bbs_reply` VALUES ('12', '1', null, '5', null, 'shima', 'haoya', '1', null);
INSERT INTO `bbs_reply` VALUES ('13', '1', null, '3', '/static/uploads/emotion.jpg', '你这个帅哥\n', '四号说的话', 'yyao', null);
INSERT INTO `bbs_reply` VALUES ('14', '1', null, '3', '/static/uploads/emotion.jpg', '你这个帅哥\n', '四号说的话', 'yyao', null);
INSERT INTO `bbs_reply` VALUES ('15', '1', null, '3', null, '你这个帅哥\n', '四号说的话', 'yyao', null);
INSERT INTO `bbs_reply` VALUES ('16', '1', null, '3', null, '你这个帅哥\n', '四号说的话', 'yyao', null);
INSERT INTO `bbs_reply` VALUES ('17', '0', null, '5', 'emotion.jpg', '嘿嘿嘿', 'undefined', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('18', '0', null, '5', null, '嘿嘿嘿', 'undefined', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('19', '0', null, '5', null, '嘿嘿嘿', 'undefined', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('20', '0', null, '5', null, '嘿嘿嘿', 'undefined', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('21', '0', null, '5', null, '嘿嘿嘿', 'undefined', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('22', '0', null, '5', null, '嘿嘿嘿', 'undefined', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('53', '2', null, '5', null, '123', '一号说的话', '风之杖\r\n', null);
INSERT INTO `bbs_reply` VALUES ('54', '1', null, '5', null, 'dsdafs', '你这个帅哥\n', 'Jumping', null);
INSERT INTO `bbs_reply` VALUES ('55', '1', null, '5', null, 'dsdafsfasdf', 'dsdafs', '11', null);
INSERT INTO `bbs_reply` VALUES ('56', '1', null, '5', null, 'asdfafd', '五号说的话', '11', null);
INSERT INTO `bbs_reply` VALUES ('57', '1', null, '5', null, 'asdfafd', '二号说的话', 'undefined', null);
INSERT INTO `bbs_reply` VALUES ('58', '2', null, '5', null, 'zxxls', '123', '1', null);
INSERT INTO `bbs_reply` VALUES ('59', '2', null, '5', '/static/uploads/emotion.jpg', '张晓旭老师', 'zxxls', '1', null);
INSERT INTO `bbs_reply` VALUES ('60', '1', null, '5', null, '656565', '二号说的话', '狂野之吸', null);
INSERT INTO `bbs_reply` VALUES ('61', '0', null, '5', null, '233', 'undefined', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('62', '0', null, '5', 'emotion.jpg', '233', 'undefined', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('63', '1', null, '5', null, '233', '656565', '1', null);
INSERT INTO `bbs_reply` VALUES ('64', '1', null, '5', null, '233', '656565', '1', null);
INSERT INTO `bbs_reply` VALUES ('65', '0', null, '5', null, '233', 'undefined', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('66', '0', null, '5', null, '233', 'undefined', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('67', '0', null, '5', null, '233', 'undefined', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('68', '1', null, '5', null, '654654654', '233', '1', null);
INSERT INTO `bbs_reply` VALUES ('69', '0', null, '5', null, '2333', 'undefined', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('70', '0', null, '5', null, '2333', 'undefined', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('71', '0', null, '5', null, '2333', 'undefined', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('72', '1', null, '5', null, '233', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('73', '1', null, '5', null, '233', '你这个帅哥\n', 'Jumping', null);
INSERT INTO `bbs_reply` VALUES ('74', '1', null, '5', null, '233', '233', '1', null);
INSERT INTO `bbs_reply` VALUES ('75', '1', null, '0', null, '', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('76', '1', null, '0', null, '', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('77', '1', null, '5', null, '', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('78', '1', null, '5', null, 'dfasd\ndfasdfa\ndsfasdf\nasdfa\nfasdf\nasdfa', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', null);
INSERT INTO `bbs_reply` VALUES ('79', '1', null, '5', null, '123233', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '2147483647');
INSERT INTO `bbs_reply` VALUES ('80', '1', null, '5', null, '123233', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '2147483647');
INSERT INTO `bbs_reply` VALUES ('81', '1', null, '5', null, '123233', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '2147483647');
INSERT INTO `bbs_reply` VALUES ('82', '1', null, '5', null, '123233', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '2147483647');
INSERT INTO `bbs_reply` VALUES ('83', '1', null, '5', null, '233', '123233', '1', '2147483647');
INSERT INTO `bbs_reply` VALUES ('84', '1', null, '5', null, 'shabi', '三号说的话', 'Jumping', '2147483647');
INSERT INTO `bbs_reply` VALUES ('85', '1', null, '5', null, '2333333', '五号说的话', '1', '2147483647');
INSERT INTO `bbs_reply` VALUES ('86', '1', null, '5', null, '65498465165', '三号说的话', 'Jumping', '2147483647');
INSERT INTO `bbs_reply` VALUES ('87', '1', null, '5', null, '312651652', '三号说的话', 'Jumping', '1493969741938');
INSERT INTO `bbs_reply` VALUES ('88', '1', null, '3', null, 'shabi\n', '二号说的话', '狂野之吸', '1493969783906');
INSERT INTO `bbs_reply` VALUES ('89', '1', null, '5', null, '123', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493974069496');
INSERT INTO `bbs_reply` VALUES ('90', '1', null, '5', null, '321', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493974437742');
INSERT INTO `bbs_reply` VALUES ('91', '1', null, '5', null, '123', '321', '1', '1493974991223');
INSERT INTO `bbs_reply` VALUES ('92', '1', null, '5', null, '123', '321', '1', '1493975060668');
INSERT INTO `bbs_reply` VALUES ('93', '1', null, '5', null, '123', '321', '1', '1493975364821');
INSERT INTO `bbs_reply` VALUES ('94', '1', null, '5', null, '123', '二号说的话', '狂野之吸', '1493975383334');
INSERT INTO `bbs_reply` VALUES ('95', '1', null, '5', null, '23333333333333333333', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493975635047');
INSERT INTO `bbs_reply` VALUES ('96', '1', null, '5', null, '322222222222222222222222222222', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493975730399');
INSERT INTO `bbs_reply` VALUES ('97', '1', null, '5', null, '2151513132', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493976335120');
INSERT INTO `bbs_reply` VALUES ('98', '1', null, '5', null, '3132', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493976431864');
INSERT INTO `bbs_reply` VALUES ('99', '1', null, '5', null, '13213515615615136', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493976501482');
INSERT INTO `bbs_reply` VALUES ('100', '1', null, '5', null, '13213515615615136', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493976594389');
INSERT INTO `bbs_reply` VALUES ('101', '1', null, '5', null, '123', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493976607944');
INSERT INTO `bbs_reply` VALUES ('102', '1', null, '5', null, '123', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493976617358');
INSERT INTO `bbs_reply` VALUES ('103', '1', null, '5', null, '123', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493976894161');
INSERT INTO `bbs_reply` VALUES ('104', '1', null, '5', null, '发生大幅', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493977008817');
INSERT INTO `bbs_reply` VALUES ('105', '1', null, '5', '/static/uploads/file-1493977082073.jpg', '发送富豪in个', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493977082049');
INSERT INTO `bbs_reply` VALUES ('106', '1', null, '3', '/static/uploads/file-1493977476176.jpg', '大力开发建设的两个', '三号说的话', 'Jumping', '1493977476152');
INSERT INTO `bbs_reply` VALUES ('107', '118', null, '3', null, '发生的', '阿萨德发上弹', 'Jumping', '1493977568200');
INSERT INTO `bbs_reply` VALUES ('108', '118', null, '3', null, '发生的', '阿萨德发上弹', 'Jumping', '1493977575041');
INSERT INTO `bbs_reply` VALUES ('109', '118', null, '0', null, '阿斯蒂芬', '阿萨德发上弹', 'Jumping', '1493977584129');
INSERT INTO `bbs_reply` VALUES ('110', '118', null, '5', null, '范德萨', '阿萨德发上弹', 'Jumping', '1493977602440');
INSERT INTO `bbs_reply` VALUES ('111', '118', null, '5', null, '范德萨', '阿萨德发上弹', 'Jumping', '1493977621961');
INSERT INTO `bbs_reply` VALUES ('112', '118', null, '5', null, '范德萨', '阿萨德发上弹', 'Jumping', '1493977638521');
INSERT INTO `bbs_reply` VALUES ('113', '118', null, '5', null, '54156', '阿萨德发上弹', 'Jumping', '1493977676875');
INSERT INTO `bbs_reply` VALUES ('114', '118', null, '5', null, '54156', '阿萨德发上弹', 'Jumping', '1493977689305');
INSERT INTO `bbs_reply` VALUES ('115', '1', null, '5', null, '5152', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', '风之杖', '1493977712393');
INSERT INTO `bbs_reply` VALUES ('116', '1', null, '5', null, '5152', '5152', '1', '1493977719336');
INSERT INTO `bbs_reply` VALUES ('117', '1', null, '5', null, '5152', '5152', '1', '1493977721569');
INSERT INTO `bbs_reply` VALUES ('118', '118', null, '5', null, '', '阿萨德发上弹', 'Jumping', '1493977835489');
INSERT INTO `bbs_reply` VALUES ('119', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977838857');
INSERT INTO `bbs_reply` VALUES ('120', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977839802');
INSERT INTO `bbs_reply` VALUES ('121', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977840153');
INSERT INTO `bbs_reply` VALUES ('122', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977840361');
INSERT INTO `bbs_reply` VALUES ('123', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977840570');
INSERT INTO `bbs_reply` VALUES ('124', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977840792');
INSERT INTO `bbs_reply` VALUES ('125', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977840970');
INSERT INTO `bbs_reply` VALUES ('126', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977841145');
INSERT INTO `bbs_reply` VALUES ('127', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977841328');
INSERT INTO `bbs_reply` VALUES ('128', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977841528');
INSERT INTO `bbs_reply` VALUES ('129', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977841723');
INSERT INTO `bbs_reply` VALUES ('130', '118', null, '5', null, '热天', '阿萨德发上弹', 'Jumping', '1493977841905');

-- ----------------------------
-- Table structure for `bbs_topic`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic`;
CREATE TABLE `bbs_topic` (
  `TID` int(11) NOT NULL AUTO_INCREMENT,
  `TSID` int(11) DEFAULT NULL,
  `TUID` int(11) DEFAULT NULL,
  `TTopic` varchar(1024) DEFAULT NULL,
  `TContent` varchar(1024) DEFAULT NULL,
  `TEmotion` varchar(1024) DEFAULT NULL,
  `Ttime` varchar(1024) DEFAULT NULL,
  `TLastReplayTime` varchar(1024) DEFAULT NULL,
  `TTYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_topic
-- ----------------------------
INSERT INTO `bbs_topic` VALUES ('1', null, '1', '测试一', '测试一内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', null, '2017-04-05', '2017-05-10', '1');
INSERT INTO `bbs_topic` VALUES ('3', null, '3', '测试三', '测试三内容Lorem ipsum dolor sit amet, consectetur adipisicing elit. N', null, null, null, '3');
INSERT INTO `bbs_topic` VALUES ('8', null, '3', '发表啊', '发动机反扒饿哦万股jo多哈jo的事', null, null, null, '2');
INSERT INTO `bbs_topic` VALUES ('9', null, '0', 'dsfalds', '4156416', null, null, null, '3');
INSERT INTO `bbs_topic` VALUES ('10', null, '0', '126', '165', null, null, null, '4');
INSERT INTO `bbs_topic` VALUES ('11', null, '0', '1', '11', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('12', null, '0', '1', '11', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('13', null, '0', 'rgsdr', 'rewgergw', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('14', null, '0', 'dsfads', 'dsaf ds', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('17', null, '0', 'ceshi', 'dfadsfadsfa', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('18', null, '3', '123', '123', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('19', null, '3', 'pengfei zhu', '656+56+56+', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('40', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('41', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('42', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('43', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('44', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('45', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('46', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('47', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('48', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('49', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('50', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('51', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('52', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('53', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('54', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('55', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('56', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('57', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('58', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('59', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('60', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('61', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('62', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('63', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('64', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('65', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('66', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('67', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('68', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('69', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('70', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('71', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('72', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('73', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('74', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('75', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('76', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('77', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('78', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('79', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('80', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('81', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('82', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('83', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('84', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('85', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('86', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('87', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('88', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('89', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('90', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('91', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('92', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('93', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('94', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('95', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('96', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('97', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('98', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('99', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('100', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('101', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('102', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('103', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('104', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('105', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('106', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('107', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('108', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('109', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('110', null, '5', 'ceshi', 'dfadsfe4dsfdsfaffafafafafafaff', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('111', null, '0', 'undefined', 'undefined', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('112', null, '0', 'undefined', 'undefined', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('113', null, '0', 'undefined', 'undefined', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('114', null, '0', '这是个测试', '车市啊 蠢货', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('115', null, '0', '', '第三发电示范', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('116', null, '5', '厕所股vuyudsfiahds', '阿萨德粉色', null, null, null, null);
INSERT INTO `bbs_topic` VALUES ('117', null, '0', 'daf', '64984654156', null, '2017-04-17', null, null);
INSERT INTO `bbs_topic` VALUES ('118', null, '3', '的萨芬', '阿萨德发上弹', null, '1493977552689', null, null);

-- ----------------------------
-- Table structure for `report`
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `reportUid` int(11) DEFAULT NULL,
  `reportedTid` int(11) DEFAULT NULL,
  `reportType` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `reportReason` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', '0', '0', 'undefined', 'undefined');
INSERT INTO `report` VALUES ('2', '5', '2', '??', '??');
INSERT INTO `report` VALUES ('3', '5', '2', '恶心', '??');
INSERT INTO `report` VALUES ('4', '5', '2', '恶心', '发送');
INSERT INTO `report` VALUES ('5', '3', '4', '反动', 'jiushifandong');
INSERT INTO `report` VALUES ('6', '3', '5', '反动', 'asfdfa');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) DEFAULT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `gender` varchar(64) DEFAULT NULL,
  `head` varchar(64) DEFAULT NULL,
  `birthday` varchar(0) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `admin` int(16) DEFAULT NULL,
  `power` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '风之杖', '123456', '965113581@qq.com', 'male', '/static/uploads/file-1493966901019.jpg', '', '1', '1', '管理员');
INSERT INTO `user_info` VALUES ('2', '狂野之吸', '123456', '1614200424@qq.com', null, '/static/uploads/2-head.jpg', null, null, '0', '管理员');
INSERT INTO `user_info` VALUES ('3', 'Jumping', '123456', '1321@qq.com', null, '/static/uploads/file-1493966339261.jpg', null, null, '1', '用户');
INSERT INTO `user_info` VALUES ('4', 'yyao', '321654', '', null, '/static/uploads/1-head.jpg', null, null, '0', null);
INSERT INTO `user_info` VALUES ('5', '1', '11', '', '', '/static/uploads/file-1493966214594.jpg', '', null, '1', null);
INSERT INTO `user_info` VALUES ('6', '伯伯', '123456', '595909660@qq.com', null, '/static/uploads/2-head.jpg', null, null, '0', '管理员');
INSERT INTO `user_info` VALUES ('33', 'biub32165165FASDFA', '123', '1@qq.com', null, '/static/uploads/1-head.jpg', null, null, null, null);
INSERT INTO `user_info` VALUES ('34', 'biub32165165FASDFAFASDF', '123', '1@qq.com', null, '/static/uploads/1-head.jpg', null, null, null, null);
INSERT INTO `user_info` VALUES ('35', 'yyaosdfasd', 'yyao', '1@QQ.COM', null, '/static/uploads/1-head.jpg', null, null, null, null);
