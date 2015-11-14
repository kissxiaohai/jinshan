/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : jinshan

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2015-11-14 17:51:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `check_content`
-- ----------------------------
DROP TABLE IF EXISTS `check_content`;
CREATE TABLE `check_content` (
  `check_content_id` int(11) NOT NULL,
  `check_content` varchar(200) NOT NULL,
  PRIMARY KEY (`check_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_content
-- ----------------------------
INSERT INTO `check_content` VALUES ('1', '劳动防护用品');
INSERT INTO `check_content` VALUES ('2', '防雷防静电');
INSERT INTO `check_content` VALUES ('3', '出入库管理');
INSERT INTO `check_content` VALUES ('4', '库区环境管理');
INSERT INTO `check_content` VALUES ('5', '爆破器材的堆放标准');
INSERT INTO `check_content` VALUES ('6', '消防设施');

-- ----------------------------
-- Table structure for `check_item`
-- ----------------------------
DROP TABLE IF EXISTS `check_item`;
CREATE TABLE `check_item` (
  `check_item` varchar(200) NOT NULL,
  `table_sequence` int(11) unsigned NOT NULL,
  `check_content_id` int(11) NOT NULL,
  PRIMARY KEY (`check_item`),
  KEY `check_content_id` (`check_content_id`),
  CONSTRAINT `check_content_id` FOREIGN KEY (`check_content_id`) REFERENCES `check_content` (`check_content_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_item
-- ----------------------------
INSERT INTO `check_item` VALUES ('严禁人员携带火种、通讯工具、易燃易爆物品进入库区', '2', '3');
INSERT INTO `check_item` VALUES ('仓库门窗无破损，库内通风良好', '4', '4');
INSERT INTO `check_item` VALUES ('喷淋设施完好且水源充足', '6', '6');
INSERT INTO `check_item` VALUES ('外来人员应有人带领，实行严格登记手续', '1', '3');
INSERT INTO `check_item` VALUES ('库内安全通道无杂物堆放，畅通无阻', '2', '4');
INSERT INTO `check_item` VALUES ('库内温度保持在35度以下，湿度计保持在85%以下', '1', '4');
INSERT INTO `check_item` VALUES ('库区夜间照明充足（固定、移动照明）并设有应急照明', '7', '4');
INSERT INTO `check_item` VALUES ('库区有足够的消防通道并保持畅通（不小于4米，且形成环形通道）', '3', '4');
INSERT INTO `check_item` VALUES ('库区范围内无山火', '9', '4');
INSERT INTO `check_item` VALUES ('库房值班室应装有两部与外界联系的固定电话', '6', '3');
INSERT INTO `check_item` VALUES ('库房围墙、电网无破损', '10', '4');
INSERT INTO `check_item` VALUES ('库房无破损，屋顶无漏雨', '5', '4');
INSERT INTO `check_item` VALUES ('按规定穿戴安全帽、工作服、劳保鞋等劳保用品，并保持整洁', '1', '1');
INSERT INTO `check_item` VALUES ('按规定进行防雷防静电检测，并提供检测记录', '1', '2');
INSERT INTO `check_item` VALUES ('接地线、网无破损、断裂', '2', '2');
INSERT INTO `check_item` VALUES ('消防栓闸阀灵敏、可靠 ', '4', '6');
INSERT INTO `check_item` VALUES ('消防水池蓄满水，消防沙定期翻动  ', '3', '6');
INSERT INTO `check_item` VALUES ('消防水管、水泵完好并保证双回路供电  ', '2', '6');
INSERT INTO `check_item` VALUES ('消防水袋齐全、完好？确定数量 ', '5', '6');
INSERT INTO `check_item` VALUES ('火工器材出入帐目清楚，帐物相符', '3', '3');
INSERT INTO `check_item` VALUES ('火工器材箱子条码与货物条码一致', '5', '3');
INSERT INTO `check_item` VALUES ('灭火器插销完好并在有效期内使用，指针显示在绿色区域', '1', '6');
INSERT INTO `check_item` VALUES ('炸药堆高不超过1.8米、雷管堆高不超过1.6米', '2', '5');
INSERT INTO `check_item` VALUES ('炸药库周围无杂草及其它易燃物', '8', '4');
INSERT INTO `check_item` VALUES ('炸药库设双门双锁，门无变形、破损；标识牌、警示牌齐全、规范', '6', '4');
INSERT INTO `check_item` VALUES ('爆破器材要按类分存，严禁混存', '1', '5');
INSERT INTO `check_item` VALUES ('禁止车辆未熄火时进行装卸；装卸时必须轻拿轻放', '4', '3');
INSERT INTO `check_item` VALUES ('通道宽不少于1.3米，堆垛距离边墙不少于0.3米', '3', '5');

-- ----------------------------
-- Table structure for `check_record`
-- ----------------------------
DROP TABLE IF EXISTS `check_record`;
CREATE TABLE `check_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `check_item` varchar(200) NOT NULL,
  `passed` varchar(1) NOT NULL,
  `pic_url` varchar(200) DEFAULT '""',
  `note` varchar(200) DEFAULT '""',
  PRIMARY KEY (`record_id`),
  KEY `check_item` (`check_item`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `check_item` FOREIGN KEY (`check_item`) REFERENCES `check_item` (`check_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_id` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_record
-- ----------------------------
INSERT INTO `check_record` VALUES ('1', '1', '按规定穿戴安全帽、工作服、劳保鞋等劳保用品，并保持整洁', '1', '', '备注1');
INSERT INTO `check_record` VALUES ('2', '1', '按规定进行防雷防静电检测，并提供检测记录', '1', '', '备注2');
INSERT INTO `check_record` VALUES ('3', '1', '接地线、网无破损、断裂', '0', '', '备注3');

-- ----------------------------
-- Table structure for `report`
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(200) NOT NULL,
  `report_creator` varchar(200) NOT NULL,
  `report_create_time` varchar(19) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', 'AH-H001-01 2015年3月11日18点测试表', '黄金定', '2015-11-14 11:46:10');
