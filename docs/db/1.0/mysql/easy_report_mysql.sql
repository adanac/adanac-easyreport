/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : easy_report

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2014-08-04 11:59:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for config_dict
-- ----------------------------
DROP TABLE IF EXISTS `config_dict`;
CREATE TABLE `config_dict` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置字典ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `key` varchar(50) NOT NULL,
  `value` varchar(1000) NOT NULL,
  `sequence` int(11) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_key` (`key`,`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='配置字典表';

-- ----------------------------
-- Table structure for datasource
-- ----------------------------
DROP TABLE IF EXISTS `datasource`;
CREATE TABLE `datasource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据源ID',
  `uid` varchar(128) NOT NULL COMMENT '数据源唯一ID,由调接口方传入',
  `name` varchar(50) NOT NULL COMMENT '数据源名称',
  `jdbc_url` varchar(500) NOT NULL COMMENT '数据源连接字符串(JDBC)',
  `user` varchar(50) NOT NULL COMMENT '数据源登录用户名',
  `password` varchar(100) NOT NULL COMMENT '数据源登录密码',
  `comment` varchar(100) NOT NULL COMMENT '说明备注',
  `create_user` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`),
  KEY `AK_uk_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='数据源配置信息表';

-- ----------------------------
-- Table structure for reporting
-- ----------------------------
DROP TABLE IF EXISTS `reporting`;
CREATE TABLE `reporting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '报表ID',
  `pid` int(11) NOT NULL DEFAULT '0',
  `ds_id` int(11) NOT NULL COMMENT '数据源ID',
  `uid` varchar(128) DEFAULT NULL COMMENT '报表唯一ID,由接口调用方传入',
  `name` varchar(50) NOT NULL COMMENT '报表名称',
  `path` varchar(500) NOT NULL COMMENT '报表树型结构路径',
  `flag` int(11) NOT NULL COMMENT '报表树型节点标志,0为分类节点，1为报表结点',
  `has_child` tinyint(1) NOT NULL,
  `status` int(11) NOT NULL COMMENT '报表状态（1表示锁定，0表示编辑)',
  `sequence` int(11) NOT NULL COMMENT '报表节点在其父节点中的顺序',
  `data_range` int(11) NOT NULL DEFAULT '7' COMMENT '报表默认展示多少天的数据',
  `layout` int(2) NOT NULL COMMENT '布局形式.1横向;2纵向',
  `stat_column_layout` int(11) DEFAULT '1' COMMENT '统计列布局形式.1横向;2纵向',
  `sql_text` text NOT NULL COMMENT '报表SQL语句',
  `meta_columns` text NOT NULL COMMENT '配置项对象JSON序列化字符串',
  `query_params` text NOT NULL COMMENT '查询条件列属性集合json字符串',
  `comment` varchar(500) DEFAULT NULL COMMENT '说明备注',
  `create_user` varchar(50) NOT NULL COMMENT '创建用户',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`),
  KEY `ukuid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=728 DEFAULT CHARSET=utf8 COMMENT='报表信息表';

-- ----------------------------
-- Table structure for reporting_sql_history
-- ----------------------------
DROP TABLE IF EXISTS `reporting_sql_history`;
CREATE TABLE `reporting_sql_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '报表SQL语句版本历史id',
  `report_id` int(11) NOT NULL COMMENT '报表id',
  `sql_text` text NOT NULL COMMENT '报表SQL语句',
  `author` varchar(64) NOT NULL COMMENT '报表SQL语句当前版本创建者',
  `comment` varchar(100) NOT NULL COMMENT '报表SQL语句版本历史说明',
  `create_time` datetime NOT NULL COMMENT '报表SQL语句版本历史创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '报表SQL语句版本历史修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reporting_task
-- ----------------------------
DROP TABLE IF EXISTS `reporting_task`;
CREATE TABLE `reporting_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '报表任务ID',
  `report_ids` varchar(1024) NOT NULL COMMENT '报表ID列表',
  `peroid` varchar(2) NOT NULL COMMENT '报表任务执行频率(取值：y每年|M每月|w每周|d每天|h每小时|m每分|s每秒)',
  `interval` int(11) NOT NULL COMMENT '报表任务执行间隔',
  `time` time NOT NULL COMMENT '报表任务执行时间,指定任务什么时间执行',
  `comment` varchar(100) NOT NULL COMMENT '报表任务说明',
  `create_time` datetime NOT NULL COMMENT '报表任务记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '报表任务记录修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='报表任务信息表';

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence` (
  `pos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('0');
INSERT INTO `sequence` VALUES ('1');
INSERT INTO `sequence` VALUES ('2');
INSERT INTO `sequence` VALUES ('3');
INSERT INTO `sequence` VALUES ('4');
INSERT INTO `sequence` VALUES ('5');
INSERT INTO `sequence` VALUES ('6');
INSERT INTO `sequence` VALUES ('7');
INSERT INTO `sequence` VALUES ('8');
INSERT INTO `sequence` VALUES ('9');
INSERT INTO `sequence` VALUES ('10');
INSERT INTO `sequence` VALUES ('11');
INSERT INTO `sequence` VALUES ('12');
INSERT INTO `sequence` VALUES ('13');
INSERT INTO `sequence` VALUES ('14');
INSERT INTO `sequence` VALUES ('15');
INSERT INTO `sequence` VALUES ('16');
INSERT INTO `sequence` VALUES ('17');
INSERT INTO `sequence` VALUES ('18');
INSERT INTO `sequence` VALUES ('19');
INSERT INTO `sequence` VALUES ('20');
INSERT INTO `sequence` VALUES ('21');
INSERT INTO `sequence` VALUES ('22');
INSERT INTO `sequence` VALUES ('23');
INSERT INTO `sequence` VALUES ('24');
INSERT INTO `sequence` VALUES ('25');
INSERT INTO `sequence` VALUES ('26');
INSERT INTO `sequence` VALUES ('27');
INSERT INTO `sequence` VALUES ('28');
INSERT INTO `sequence` VALUES ('29');
INSERT INTO `sequence` VALUES ('30');
INSERT INTO `sequence` VALUES ('31');
INSERT INTO `sequence` VALUES ('32');
INSERT INTO `sequence` VALUES ('33');
INSERT INTO `sequence` VALUES ('34');
INSERT INTO `sequence` VALUES ('35');
INSERT INTO `sequence` VALUES ('36');
INSERT INTO `sequence` VALUES ('37');
INSERT INTO `sequence` VALUES ('38');
INSERT INTO `sequence` VALUES ('39');
INSERT INTO `sequence` VALUES ('40');
INSERT INTO `sequence` VALUES ('41');
INSERT INTO `sequence` VALUES ('42');
INSERT INTO `sequence` VALUES ('43');
INSERT INTO `sequence` VALUES ('44');
INSERT INTO `sequence` VALUES ('45');
INSERT INTO `sequence` VALUES ('46');
INSERT INTO `sequence` VALUES ('47');
INSERT INTO `sequence` VALUES ('48');
INSERT INTO `sequence` VALUES ('49');
INSERT INTO `sequence` VALUES ('50');
INSERT INTO `sequence` VALUES ('51');
INSERT INTO `sequence` VALUES ('52');
INSERT INTO `sequence` VALUES ('53');
INSERT INTO `sequence` VALUES ('54');
INSERT INTO `sequence` VALUES ('55');
INSERT INTO `sequence` VALUES ('56');
INSERT INTO `sequence` VALUES ('57');
INSERT INTO `sequence` VALUES ('58');
INSERT INTO `sequence` VALUES ('59');
INSERT INTO `sequence` VALUES ('60');
INSERT INTO `sequence` VALUES ('61');
INSERT INTO `sequence` VALUES ('62');
INSERT INTO `sequence` VALUES ('63');
INSERT INTO `sequence` VALUES ('64');
INSERT INTO `sequence` VALUES ('65');
INSERT INTO `sequence` VALUES ('66');
INSERT INTO `sequence` VALUES ('67');
INSERT INTO `sequence` VALUES ('68');
INSERT INTO `sequence` VALUES ('69');
INSERT INTO `sequence` VALUES ('70');
INSERT INTO `sequence` VALUES ('71');
INSERT INTO `sequence` VALUES ('72');
INSERT INTO `sequence` VALUES ('73');
INSERT INTO `sequence` VALUES ('74');
INSERT INTO `sequence` VALUES ('75');
INSERT INTO `sequence` VALUES ('76');
INSERT INTO `sequence` VALUES ('77');
INSERT INTO `sequence` VALUES ('78');
INSERT INTO `sequence` VALUES ('79');
INSERT INTO `sequence` VALUES ('80');
INSERT INTO `sequence` VALUES ('81');
INSERT INTO `sequence` VALUES ('82');
INSERT INTO `sequence` VALUES ('83');
INSERT INTO `sequence` VALUES ('84');
INSERT INTO `sequence` VALUES ('85');
INSERT INTO `sequence` VALUES ('86');
INSERT INTO `sequence` VALUES ('87');
INSERT INTO `sequence` VALUES ('88');
INSERT INTO `sequence` VALUES ('89');
INSERT INTO `sequence` VALUES ('90');
INSERT INTO `sequence` VALUES ('91');
INSERT INTO `sequence` VALUES ('92');
INSERT INTO `sequence` VALUES ('93');
INSERT INTO `sequence` VALUES ('94');
INSERT INTO `sequence` VALUES ('95');
INSERT INTO `sequence` VALUES ('96');
INSERT INTO `sequence` VALUES ('97');
INSERT INTO `sequence` VALUES ('98');
INSERT INTO `sequence` VALUES ('99');
INSERT INTO `sequence` VALUES ('100');
INSERT INTO `sequence` VALUES ('101');
INSERT INTO `sequence` VALUES ('102');
INSERT INTO `sequence` VALUES ('103');
INSERT INTO `sequence` VALUES ('104');
INSERT INTO `sequence` VALUES ('105');
INSERT INTO `sequence` VALUES ('106');
INSERT INTO `sequence` VALUES ('107');
INSERT INTO `sequence` VALUES ('108');
INSERT INTO `sequence` VALUES ('109');
INSERT INTO `sequence` VALUES ('110');
INSERT INTO `sequence` VALUES ('111');
INSERT INTO `sequence` VALUES ('112');
INSERT INTO `sequence` VALUES ('113');
INSERT INTO `sequence` VALUES ('114');
INSERT INTO `sequence` VALUES ('115');
INSERT INTO `sequence` VALUES ('116');
INSERT INTO `sequence` VALUES ('117');
INSERT INTO `sequence` VALUES ('118');
INSERT INTO `sequence` VALUES ('119');
INSERT INTO `sequence` VALUES ('120');
INSERT INTO `sequence` VALUES ('121');
INSERT INTO `sequence` VALUES ('122');
INSERT INTO `sequence` VALUES ('123');
INSERT INTO `sequence` VALUES ('124');
INSERT INTO `sequence` VALUES ('125');
INSERT INTO `sequence` VALUES ('126');
INSERT INTO `sequence` VALUES ('127');
INSERT INTO `sequence` VALUES ('128');
INSERT INTO `sequence` VALUES ('129');
INSERT INTO `sequence` VALUES ('130');
INSERT INTO `sequence` VALUES ('131');
INSERT INTO `sequence` VALUES ('132');
INSERT INTO `sequence` VALUES ('133');
INSERT INTO `sequence` VALUES ('134');
INSERT INTO `sequence` VALUES ('135');
INSERT INTO `sequence` VALUES ('136');
INSERT INTO `sequence` VALUES ('137');
INSERT INTO `sequence` VALUES ('138');
INSERT INTO `sequence` VALUES ('139');
INSERT INTO `sequence` VALUES ('140');
INSERT INTO `sequence` VALUES ('141');
INSERT INTO `sequence` VALUES ('142');
INSERT INTO `sequence` VALUES ('143');
INSERT INTO `sequence` VALUES ('144');
INSERT INTO `sequence` VALUES ('145');
INSERT INTO `sequence` VALUES ('146');
INSERT INTO `sequence` VALUES ('147');
INSERT INTO `sequence` VALUES ('148');
INSERT INTO `sequence` VALUES ('149');
INSERT INTO `sequence` VALUES ('150');
INSERT INTO `sequence` VALUES ('151');
INSERT INTO `sequence` VALUES ('152');
INSERT INTO `sequence` VALUES ('153');
INSERT INTO `sequence` VALUES ('154');
INSERT INTO `sequence` VALUES ('155');
INSERT INTO `sequence` VALUES ('156');
INSERT INTO `sequence` VALUES ('157');
INSERT INTO `sequence` VALUES ('158');
INSERT INTO `sequence` VALUES ('159');
INSERT INTO `sequence` VALUES ('160');
INSERT INTO `sequence` VALUES ('161');
INSERT INTO `sequence` VALUES ('162');
INSERT INTO `sequence` VALUES ('163');
INSERT INTO `sequence` VALUES ('164');
INSERT INTO `sequence` VALUES ('165');
INSERT INTO `sequence` VALUES ('166');
INSERT INTO `sequence` VALUES ('167');
INSERT INTO `sequence` VALUES ('168');
INSERT INTO `sequence` VALUES ('169');
INSERT INTO `sequence` VALUES ('170');
INSERT INTO `sequence` VALUES ('171');
INSERT INTO `sequence` VALUES ('172');
INSERT INTO `sequence` VALUES ('173');
INSERT INTO `sequence` VALUES ('174');
INSERT INTO `sequence` VALUES ('175');
INSERT INTO `sequence` VALUES ('176');
INSERT INTO `sequence` VALUES ('177');
INSERT INTO `sequence` VALUES ('178');
INSERT INTO `sequence` VALUES ('179');
INSERT INTO `sequence` VALUES ('180');
INSERT INTO `sequence` VALUES ('181');
INSERT INTO `sequence` VALUES ('182');
INSERT INTO `sequence` VALUES ('183');
INSERT INTO `sequence` VALUES ('184');
INSERT INTO `sequence` VALUES ('185');
INSERT INTO `sequence` VALUES ('186');
INSERT INTO `sequence` VALUES ('187');
INSERT INTO `sequence` VALUES ('188');
INSERT INTO `sequence` VALUES ('189');
INSERT INTO `sequence` VALUES ('190');
INSERT INTO `sequence` VALUES ('191');
INSERT INTO `sequence` VALUES ('192');
INSERT INTO `sequence` VALUES ('193');
INSERT INTO `sequence` VALUES ('194');
INSERT INTO `sequence` VALUES ('195');
INSERT INTO `sequence` VALUES ('196');
INSERT INTO `sequence` VALUES ('197');
INSERT INTO `sequence` VALUES ('198');
INSERT INTO `sequence` VALUES ('199');
INSERT INTO `sequence` VALUES ('200');
INSERT INTO `sequence` VALUES ('201');
INSERT INTO `sequence` VALUES ('202');
INSERT INTO `sequence` VALUES ('203');
INSERT INTO `sequence` VALUES ('204');
INSERT INTO `sequence` VALUES ('205');
INSERT INTO `sequence` VALUES ('206');
INSERT INTO `sequence` VALUES ('207');
INSERT INTO `sequence` VALUES ('208');
INSERT INTO `sequence` VALUES ('209');
INSERT INTO `sequence` VALUES ('210');
INSERT INTO `sequence` VALUES ('211');
INSERT INTO `sequence` VALUES ('212');
INSERT INTO `sequence` VALUES ('213');
INSERT INTO `sequence` VALUES ('214');
INSERT INTO `sequence` VALUES ('215');
INSERT INTO `sequence` VALUES ('216');
INSERT INTO `sequence` VALUES ('217');
INSERT INTO `sequence` VALUES ('218');
INSERT INTO `sequence` VALUES ('219');
INSERT INTO `sequence` VALUES ('220');
INSERT INTO `sequence` VALUES ('221');
INSERT INTO `sequence` VALUES ('222');
INSERT INTO `sequence` VALUES ('223');
INSERT INTO `sequence` VALUES ('224');
INSERT INTO `sequence` VALUES ('225');
INSERT INTO `sequence` VALUES ('226');
INSERT INTO `sequence` VALUES ('227');
INSERT INTO `sequence` VALUES ('228');
INSERT INTO `sequence` VALUES ('229');
INSERT INTO `sequence` VALUES ('230');
INSERT INTO `sequence` VALUES ('231');
INSERT INTO `sequence` VALUES ('232');
INSERT INTO `sequence` VALUES ('233');
INSERT INTO `sequence` VALUES ('234');
INSERT INTO `sequence` VALUES ('235');
INSERT INTO `sequence` VALUES ('236');
INSERT INTO `sequence` VALUES ('237');
INSERT INTO `sequence` VALUES ('238');
INSERT INTO `sequence` VALUES ('239');
INSERT INTO `sequence` VALUES ('240');
INSERT INTO `sequence` VALUES ('241');
INSERT INTO `sequence` VALUES ('242');
INSERT INTO `sequence` VALUES ('243');
INSERT INTO `sequence` VALUES ('244');
INSERT INTO `sequence` VALUES ('245');
INSERT INTO `sequence` VALUES ('246');
INSERT INTO `sequence` VALUES ('247');
INSERT INTO `sequence` VALUES ('248');
INSERT INTO `sequence` VALUES ('249');
INSERT INTO `sequence` VALUES ('250');
INSERT INTO `sequence` VALUES ('251');
INSERT INTO `sequence` VALUES ('252');
INSERT INTO `sequence` VALUES ('253');
INSERT INTO `sequence` VALUES ('254');
INSERT INTO `sequence` VALUES ('255');
INSERT INTO `sequence` VALUES ('256');
INSERT INTO `sequence` VALUES ('257');
INSERT INTO `sequence` VALUES ('258');
INSERT INTO `sequence` VALUES ('259');
INSERT INTO `sequence` VALUES ('260');
INSERT INTO `sequence` VALUES ('261');
INSERT INTO `sequence` VALUES ('262');
INSERT INTO `sequence` VALUES ('263');
INSERT INTO `sequence` VALUES ('264');
INSERT INTO `sequence` VALUES ('265');
INSERT INTO `sequence` VALUES ('266');
INSERT INTO `sequence` VALUES ('267');
INSERT INTO `sequence` VALUES ('268');
INSERT INTO `sequence` VALUES ('269');
INSERT INTO `sequence` VALUES ('270');
INSERT INTO `sequence` VALUES ('271');
INSERT INTO `sequence` VALUES ('272');
INSERT INTO `sequence` VALUES ('273');
INSERT INTO `sequence` VALUES ('274');
INSERT INTO `sequence` VALUES ('275');
INSERT INTO `sequence` VALUES ('276');
INSERT INTO `sequence` VALUES ('277');
INSERT INTO `sequence` VALUES ('278');
INSERT INTO `sequence` VALUES ('279');
INSERT INTO `sequence` VALUES ('280');
INSERT INTO `sequence` VALUES ('281');
INSERT INTO `sequence` VALUES ('282');
INSERT INTO `sequence` VALUES ('283');
INSERT INTO `sequence` VALUES ('284');
INSERT INTO `sequence` VALUES ('285');
INSERT INTO `sequence` VALUES ('286');
INSERT INTO `sequence` VALUES ('287');
INSERT INTO `sequence` VALUES ('288');
INSERT INTO `sequence` VALUES ('289');
INSERT INTO `sequence` VALUES ('290');
INSERT INTO `sequence` VALUES ('291');
INSERT INTO `sequence` VALUES ('292');
INSERT INTO `sequence` VALUES ('293');
INSERT INTO `sequence` VALUES ('294');
INSERT INTO `sequence` VALUES ('295');
INSERT INTO `sequence` VALUES ('296');
INSERT INTO `sequence` VALUES ('297');
INSERT INTO `sequence` VALUES ('298');
INSERT INTO `sequence` VALUES ('299');
INSERT INTO `sequence` VALUES ('300');
INSERT INTO `sequence` VALUES ('301');
INSERT INTO `sequence` VALUES ('302');
INSERT INTO `sequence` VALUES ('303');
INSERT INTO `sequence` VALUES ('304');
INSERT INTO `sequence` VALUES ('305');
INSERT INTO `sequence` VALUES ('306');
INSERT INTO `sequence` VALUES ('307');
INSERT INTO `sequence` VALUES ('308');
INSERT INTO `sequence` VALUES ('309');
INSERT INTO `sequence` VALUES ('310');
INSERT INTO `sequence` VALUES ('311');
INSERT INTO `sequence` VALUES ('312');
INSERT INTO `sequence` VALUES ('313');
INSERT INTO `sequence` VALUES ('314');
INSERT INTO `sequence` VALUES ('315');
INSERT INTO `sequence` VALUES ('316');
INSERT INTO `sequence` VALUES ('317');
INSERT INTO `sequence` VALUES ('318');
INSERT INTO `sequence` VALUES ('319');
INSERT INTO `sequence` VALUES ('320');
INSERT INTO `sequence` VALUES ('321');
INSERT INTO `sequence` VALUES ('322');
INSERT INTO `sequence` VALUES ('323');
INSERT INTO `sequence` VALUES ('324');
INSERT INTO `sequence` VALUES ('325');
INSERT INTO `sequence` VALUES ('326');
INSERT INTO `sequence` VALUES ('327');
INSERT INTO `sequence` VALUES ('328');
INSERT INTO `sequence` VALUES ('329');
INSERT INTO `sequence` VALUES ('330');
INSERT INTO `sequence` VALUES ('331');
INSERT INTO `sequence` VALUES ('332');
INSERT INTO `sequence` VALUES ('333');
INSERT INTO `sequence` VALUES ('334');
INSERT INTO `sequence` VALUES ('335');
INSERT INTO `sequence` VALUES ('336');
INSERT INTO `sequence` VALUES ('337');
INSERT INTO `sequence` VALUES ('338');
INSERT INTO `sequence` VALUES ('339');
INSERT INTO `sequence` VALUES ('340');
INSERT INTO `sequence` VALUES ('341');
INSERT INTO `sequence` VALUES ('342');
INSERT INTO `sequence` VALUES ('343');
INSERT INTO `sequence` VALUES ('344');
INSERT INTO `sequence` VALUES ('345');
INSERT INTO `sequence` VALUES ('346');
INSERT INTO `sequence` VALUES ('347');
INSERT INTO `sequence` VALUES ('348');
INSERT INTO `sequence` VALUES ('349');
INSERT INTO `sequence` VALUES ('350');
INSERT INTO `sequence` VALUES ('351');
INSERT INTO `sequence` VALUES ('352');
INSERT INTO `sequence` VALUES ('353');
INSERT INTO `sequence` VALUES ('354');
INSERT INTO `sequence` VALUES ('355');
INSERT INTO `sequence` VALUES ('356');
INSERT INTO `sequence` VALUES ('357');
INSERT INTO `sequence` VALUES ('358');
INSERT INTO `sequence` VALUES ('359');
INSERT INTO `sequence` VALUES ('360');
INSERT INTO `sequence` VALUES ('361');
INSERT INTO `sequence` VALUES ('362');
INSERT INTO `sequence` VALUES ('363');
INSERT INTO `sequence` VALUES ('364');
INSERT INTO `sequence` VALUES ('365');
INSERT INTO `sequence` VALUES ('366');
INSERT INTO `sequence` VALUES ('367');
INSERT INTO `sequence` VALUES ('368');
INSERT INTO `sequence` VALUES ('369');
INSERT INTO `sequence` VALUES ('370');
INSERT INTO `sequence` VALUES ('371');
INSERT INTO `sequence` VALUES ('372');
INSERT INTO `sequence` VALUES ('373');
INSERT INTO `sequence` VALUES ('374');
INSERT INTO `sequence` VALUES ('375');
INSERT INTO `sequence` VALUES ('376');
INSERT INTO `sequence` VALUES ('377');
INSERT INTO `sequence` VALUES ('378');
INSERT INTO `sequence` VALUES ('379');
INSERT INTO `sequence` VALUES ('380');
INSERT INTO `sequence` VALUES ('381');
INSERT INTO `sequence` VALUES ('382');
INSERT INTO `sequence` VALUES ('383');
INSERT INTO `sequence` VALUES ('384');
INSERT INTO `sequence` VALUES ('385');
INSERT INTO `sequence` VALUES ('386');
INSERT INTO `sequence` VALUES ('387');
INSERT INTO `sequence` VALUES ('388');
INSERT INTO `sequence` VALUES ('389');
INSERT INTO `sequence` VALUES ('390');
INSERT INTO `sequence` VALUES ('391');
INSERT INTO `sequence` VALUES ('392');
INSERT INTO `sequence` VALUES ('393');
INSERT INTO `sequence` VALUES ('394');
INSERT INTO `sequence` VALUES ('395');
INSERT INTO `sequence` VALUES ('396');
INSERT INTO `sequence` VALUES ('397');
INSERT INTO `sequence` VALUES ('398');
INSERT INTO `sequence` VALUES ('399');
INSERT INTO `sequence` VALUES ('400');
INSERT INTO `sequence` VALUES ('401');
INSERT INTO `sequence` VALUES ('402');
INSERT INTO `sequence` VALUES ('403');
INSERT INTO `sequence` VALUES ('404');
INSERT INTO `sequence` VALUES ('405');
INSERT INTO `sequence` VALUES ('406');
INSERT INTO `sequence` VALUES ('407');
INSERT INTO `sequence` VALUES ('408');
INSERT INTO `sequence` VALUES ('409');
INSERT INTO `sequence` VALUES ('410');
INSERT INTO `sequence` VALUES ('411');
INSERT INTO `sequence` VALUES ('412');
INSERT INTO `sequence` VALUES ('413');
INSERT INTO `sequence` VALUES ('414');
INSERT INTO `sequence` VALUES ('415');
INSERT INTO `sequence` VALUES ('416');
INSERT INTO `sequence` VALUES ('417');
INSERT INTO `sequence` VALUES ('418');
INSERT INTO `sequence` VALUES ('419');
INSERT INTO `sequence` VALUES ('420');
INSERT INTO `sequence` VALUES ('421');
INSERT INTO `sequence` VALUES ('422');
INSERT INTO `sequence` VALUES ('423');
INSERT INTO `sequence` VALUES ('424');
INSERT INTO `sequence` VALUES ('425');
INSERT INTO `sequence` VALUES ('426');
INSERT INTO `sequence` VALUES ('427');
INSERT INTO `sequence` VALUES ('428');
INSERT INTO `sequence` VALUES ('429');
INSERT INTO `sequence` VALUES ('430');
INSERT INTO `sequence` VALUES ('431');
INSERT INTO `sequence` VALUES ('432');
INSERT INTO `sequence` VALUES ('433');
INSERT INTO `sequence` VALUES ('434');
INSERT INTO `sequence` VALUES ('435');
INSERT INTO `sequence` VALUES ('436');
INSERT INTO `sequence` VALUES ('437');
INSERT INTO `sequence` VALUES ('438');
INSERT INTO `sequence` VALUES ('439');
INSERT INTO `sequence` VALUES ('440');
INSERT INTO `sequence` VALUES ('441');
INSERT INTO `sequence` VALUES ('442');
INSERT INTO `sequence` VALUES ('443');
INSERT INTO `sequence` VALUES ('444');
INSERT INTO `sequence` VALUES ('445');
INSERT INTO `sequence` VALUES ('446');
INSERT INTO `sequence` VALUES ('447');
INSERT INTO `sequence` VALUES ('448');
INSERT INTO `sequence` VALUES ('449');
INSERT INTO `sequence` VALUES ('450');
INSERT INTO `sequence` VALUES ('451');
INSERT INTO `sequence` VALUES ('452');
INSERT INTO `sequence` VALUES ('453');
INSERT INTO `sequence` VALUES ('454');
INSERT INTO `sequence` VALUES ('455');
INSERT INTO `sequence` VALUES ('456');
INSERT INTO `sequence` VALUES ('457');
INSERT INTO `sequence` VALUES ('458');
INSERT INTO `sequence` VALUES ('459');
INSERT INTO `sequence` VALUES ('460');
INSERT INTO `sequence` VALUES ('461');
INSERT INTO `sequence` VALUES ('462');
INSERT INTO `sequence` VALUES ('463');
INSERT INTO `sequence` VALUES ('464');
INSERT INTO `sequence` VALUES ('465');
INSERT INTO `sequence` VALUES ('466');
INSERT INTO `sequence` VALUES ('467');
INSERT INTO `sequence` VALUES ('468');
INSERT INTO `sequence` VALUES ('469');
INSERT INTO `sequence` VALUES ('470');
INSERT INTO `sequence` VALUES ('471');
INSERT INTO `sequence` VALUES ('472');
INSERT INTO `sequence` VALUES ('473');
INSERT INTO `sequence` VALUES ('474');
INSERT INTO `sequence` VALUES ('475');
INSERT INTO `sequence` VALUES ('476');
INSERT INTO `sequence` VALUES ('477');
INSERT INTO `sequence` VALUES ('478');
INSERT INTO `sequence` VALUES ('479');
INSERT INTO `sequence` VALUES ('480');
INSERT INTO `sequence` VALUES ('481');
INSERT INTO `sequence` VALUES ('482');
INSERT INTO `sequence` VALUES ('483');
INSERT INTO `sequence` VALUES ('484');
INSERT INTO `sequence` VALUES ('485');
INSERT INTO `sequence` VALUES ('486');
INSERT INTO `sequence` VALUES ('487');
INSERT INTO `sequence` VALUES ('488');
INSERT INTO `sequence` VALUES ('489');
INSERT INTO `sequence` VALUES ('490');
INSERT INTO `sequence` VALUES ('491');
INSERT INTO `sequence` VALUES ('492');
INSERT INTO `sequence` VALUES ('493');
INSERT INTO `sequence` VALUES ('494');
INSERT INTO `sequence` VALUES ('495');
INSERT INTO `sequence` VALUES ('496');
INSERT INTO `sequence` VALUES ('497');
INSERT INTO `sequence` VALUES ('498');
INSERT INTO `sequence` VALUES ('499');
INSERT INTO `sequence` VALUES ('500');
INSERT INTO `sequence` VALUES ('501');
INSERT INTO `sequence` VALUES ('502');
INSERT INTO `sequence` VALUES ('503');
INSERT INTO `sequence` VALUES ('504');
INSERT INTO `sequence` VALUES ('505');
INSERT INTO `sequence` VALUES ('506');
INSERT INTO `sequence` VALUES ('507');
INSERT INTO `sequence` VALUES ('508');

-- ----------------------------
-- Records of config_dict
-- ----------------------------
INSERT INTO `config_dict` VALUES ('1', '33', '常见统计列', 'statColumn', 'statColumn', '0', '统计列', '2015-02-10 10:23:56', '2015-02-10 10:23:56');
INSERT INTO `config_dict` VALUES ('5', '1', 'AQI指数', 'aqi', '空气指数', '100', '空气指数', '2015-02-10 11:01:45', '2015-02-10 11:01:45');
INSERT INTO `config_dict` VALUES ('6', '1', 'AQI指数范围', 'aqi_range', 'AQI指数范围', '100', 'AQI指数范围', '2015-02-10 11:02:34', '2015-02-10 11:02:34');
INSERT INTO `config_dict` VALUES ('7', '1', '空气等级', 'quality', '空气等级', '100', '空气等级', '2015-02-10 11:03:41', '2015-02-10 11:03:41');
INSERT INTO `config_dict` VALUES ('15', '33', '常见日期列', 'dateColumn', 'dateColumn', '100', '', '2015-02-10 10:23:56', '2015-02-10 10:23:56');
INSERT INTO `config_dict` VALUES ('16', '15', 'dt日期', 'dt', '日期', '100', '', '2015-02-10 11:17:18', '2015-02-10 11:17:18');
INSERT INTO `config_dict` VALUES ('17', '15', 'date日期', 'date', '日期', '100', '日期列', '2015-02-10 11:17:22', '2015-02-10 11:17:22');
INSERT INTO `config_dict` VALUES ('18', '1', 'PM2.5细颗粒物', 'pm25', 'PM2.5细颗粒物', '100', 'PM2.5细颗粒物', '2015-02-10 11:04:31', '2015-02-10 11:04:31');
INSERT INTO `config_dict` VALUES ('19', '1', 'PM10可吸入颗粒物', 'pm10', 'PM10可吸入颗粒物', '100', 'PM10可吸入颗粒物', '2015-02-10 11:05:05', '2015-02-10 11:05:05');
INSERT INTO `config_dict` VALUES ('32', '33', '常见维度列', 'dimColumn', 'dimColumn', '0', '常见统计列', '2015-02-10 10:23:56', '2015-02-10 10:23:56');
INSERT INTO `config_dict` VALUES ('33', '0', '报表常用元数据列', 'reportCommonMetaColum', 'reportCommonMetaColum', '0', '报表常用元数据列', '2015-02-10 10:23:56', '2015-02-10 10:23:56');
INSERT INTO `config_dict` VALUES ('36', '1', '二氧化硫', 'so2', '二氧化硫(So2)', '100', '二氧化硫', '2015-02-10 11:05:57', '2015-02-10 11:05:57');
INSERT INTO `config_dict` VALUES ('37', '32', '城市', 'area', '城市', '100', '', '2015-02-10 11:10:47', '2015-02-10 11:10:47');
INSERT INTO `config_dict` VALUES ('38', '32', '地区', 'region', '地区', '100', '华北，华南', '2015-02-10 11:11:06', '2015-02-10 11:11:06');
INSERT INTO `config_dict` VALUES ('39', '32', '省(直辖市)', 'province', '省(直辖市)', '100', '', '2015-02-10 11:11:41', '2015-02-10 11:11:41');
INSERT INTO `config_dict` VALUES ('40', '32', '城市', 'city', '城市', '100', '北京，上海', '2015-02-10 11:12:01', '2015-02-10 11:12:01');
INSERT INTO `config_dict` VALUES ('41', '32', '城区', 'district', '城区', '100', '海淀区、朝阳区', '2015-02-10 11:12:43', '2015-02-10 11:12:43');
INSERT INTO `config_dict` VALUES ('42', '32', '标题', 'title', '标题', '100', '', '2015-02-10 11:13:30', '2015-02-10 11:13:30');
INSERT INTO `config_dict` VALUES ('48', '32', '标识', 'id', '标识', '100', '', '2015-02-10 11:13:44', '2015-02-10 11:13:44');
INSERT INTO `config_dict` VALUES ('49', '32', '文本', 'text', '文本', '100', '', '2015-02-10 11:14:22', '2015-02-10 11:14:22');
INSERT INTO `config_dict` VALUES ('50', '32', '首字母', 'capital', '首字母', '100', '首字母', '2015-02-10 11:15:27', '2015-02-10 11:15:27');
INSERT INTO `config_dict` VALUES ('52', '33', '常见可选列', 'optionalColumn', 'optionalColumn', '0', '', '2015-02-10 10:23:56', '2015-02-10 10:23:56');
INSERT INTO `config_dict` VALUES ('53', '52', '二氧化氮', 'no2', '二氧化氮(No2)', '100', '', '2015-02-10 11:20:21', '2015-02-10 11:20:21');
INSERT INTO `config_dict` VALUES ('54', '52', '臭氧', 'o3', '臭氧(O3)', '100', '', '2015-02-10 11:20:55', '2015-02-10 11:20:55');
INSERT INTO `config_dict` VALUES ('55', '32', '代号', 'code', '代号', '100', '', '2015-02-10 11:15:09', '2015-02-10 11:15:09');
INSERT INTO `config_dict` VALUES ('56', '1', '一氧化碳', 'co', '一氧化碳(Co)', '100', '一氧化碳', '2015-02-10 11:06:26', '2015-02-10 11:06:26');
INSERT INTO `config_dict` VALUES ('57', '1', '二氧化氮', 'no2', '二氧化氮(No2)', '100', '二氧化氮', '2015-02-10 11:06:48', '2015-02-10 11:06:48');
INSERT INTO `config_dict` VALUES ('58', '1', '臭氧', 'o3', '臭氧(O3)', '100', '臭氧', '2015-02-10 11:07:21', '2015-02-10 11:07:21');
INSERT INTO `config_dict` VALUES ('59', '15', '天', 'day', '天', '100', '', '2015-02-10 11:17:10', '2015-02-10 11:17:10');
INSERT INTO `config_dict` VALUES ('60', '15', '小时', 'hour', '小时', '100', '', '2015-02-10 11:17:38', '2015-02-10 11:17:38');
INSERT INTO `config_dict` VALUES ('61', '15', '月度', 'month', '月度', '100', '', '2015-02-10 11:17:57', '2015-02-10 11:17:57');

-- ----------------------------
-- Records of datasource
-- ----------------------------
INSERT INTO `datasource` VALUES ('49', '8b2d3b62-0c08-4d62-a666-8bb97fc9c222', '中国天气(SQLServer)', 'jdbc:sqlserver://localhost;databaseName=ChinaWeatherAir', 'sa', 'ddd', '', '', '2015-01-27 14:32:32', '2015-01-27 14:32:32');
INSERT INTO `datasource` VALUES ('50', '6423b076-ce78-47fc-8c25-c005be2b85af', '中国天气(MySQL)', 'jdbc:mysql://localhost:3306/china_weather_air?characterEncoding=UTF-8', 'root', 'ddd', '', '', '2015-01-29 17:54:32', '2015-01-29 17:54:32');

-- ----------------------------
-- Records of reporting
-- ----------------------------
INSERT INTO `reporting` VALUES ('704', '0', '0', '55fddeec-0853-469c-b44a-3f0c8cf0937a', '中国天气(SQLServer)', '704', '0', '1', '0', '100', '7', '1', '1', '', '', '', '', '', '2015-01-12 14:54:58', '2015-01-12 14:54:58');
INSERT INTO `reporting` VALUES ('711', '0', '0', '6fc45465-409d-4e41-9ddd-4e9e13c2f4b0', '中国空气(MySQL)', '711', '0', '1', '0', '100', '7', '1', '1', '', '', '', '', '', '2015-01-29 17:54:49', '2015-01-29 17:54:49');
INSERT INTO `reporting` VALUES ('712', '711', '50', 'bb7be838-31ae-41fe-ae63-4ae8efe5c138', '2014年北京每天空气指数', '711,712', '1', '0', '0', '100', '7', '2', '1', 'select * from fact_air_cn where area=\'北京市\' and year(dt)=\'2014\'', '[{\"ordinal\":0,\"name\":\"dt\",\"text\":\"日期\",\"dataType\":\"DATE\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":10,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"aqi\",\"text\":\"空气指数\",\"dataType\":\"INT\",\"expression\":\"\",\"width\":11,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"aqi_range\",\"text\":\"AQI指数范围\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":20,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"quality\",\"text\":\"空气等级\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":10,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"pm25\",\"text\":\"PM2.5细颗粒物\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"pm10\",\"text\":\"PM10可吸入颗粒物\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"so2\",\"text\":\"二氧化硫(So2)\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"co\",\"text\":\"一氧化碳(Co)\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"no2\",\"text\":\"二氧化氮(No2)\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"o3\",\"text\":\"臭氧(O3)\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false}]', '', '', '', '2015-01-29 17:59:14', '2015-01-29 17:59:14');
INSERT INTO `reporting` VALUES ('713', '711', '50', '3180eafe-e4a2-4b5c-828e-e054043f6e87', '30天内城市空气指数', '711,713', '1', '0', '0', '100', '30', '2', '1', 'select * from fact_air_cn where area in (\'${area}\') and dt>=\'${startTime}\' and dt <\'${endTime}\'', '[{\"ordinal\":0,\"name\":\"dt\",\"text\":\"日期\",\"dataType\":\"DATE\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":10,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"area\",\"text\":\"城市\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":20,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"aqi\",\"text\":\"空气指数\",\"dataType\":\"INT\",\"expression\":\"\",\"width\":11,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"aqi_range\",\"text\":\"AQI指数范围\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":20,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"quality\",\"text\":\"空气等级\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":10,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"pm25\",\"text\":\"PM2.5细颗粒物\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"pm10\",\"text\":\"PM10可吸入颗粒物\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"so2\",\"text\":\"二氧化硫(So2)\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"co\",\"text\":\"一氧化碳(Co)\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"no2\",\"text\":\"二氧化氮(No2)\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":true,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"o3\",\"text\":\"臭氧(O3)\",\"dataType\":\"FLOAT\",\"expression\":\"\",\"width\":12,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":true,\"footings\":false,\"displayInMail\":false}]', '[{\"name\":\"area\",\"text\":\"城市\",\"defaultValue\":\"北京市\",\"defaultText\":\"北京市\",\"dataType\":\"string\",\"width\":\"100\",\"required\":true,\"formElement\":\"selectMul\",\"dataSource\":\"sql\",\"content\":\"select distinct area as name,area as text from fact_air_cn\",\"autoComplete\":false}]', '', '', '2015-01-29 18:04:46', '2015-01-29 18:04:46');
INSERT INTO `reporting` VALUES ('714', '711', '50', '7608bb39-fa1b-4aff-bd15-b31f318e7025', '2014年主要城市空气质量', '711,714', '1', '0', '0', '100', '7', '2', '1', 'SELECT\n	area,\n	quality,\n	count(*) total,\n    count(*) / 365 as rating\nFROM\n	fact_air_cn\nWHERE\n	YEAR (dt) = \'2014\'\nGROUP BY\n	area,\n	quality', '[{\"ordinal\":0,\"name\":\"area\",\"text\":\"城市/地区\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":20,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"quality\",\"text\":\"空气质量\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":10,\"decimals\":\"0\",\"type\":\"2\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"total\",\"text\":\"天数\",\"dataType\":\"BIGINT\",\"expression\":\"\",\"width\":21,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"rating\",\"text\":\"占比\",\"dataType\":\"DECIMAL\",\"expression\":\"\",\"width\":26,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":true,\"optional\":false,\"footings\":false,\"displayInMail\":false}]', '', '', '', '2015-01-29 18:15:19', '2015-01-29 18:15:19');
INSERT INTO `reporting` VALUES ('715', '711', '50', 'c8258587-eb6f-4a2a-8caf-0ae236b77807', '2014年主要城市空气质量好坏表', '711,715', '1', '0', '0', '100', '7', '2', '1', 'SELECT\n	area,\n	quality,\n	sum(total) total,\n    sum(total) / 365 as rating\nFROM\n	(\n		SELECT\n			area,\n			CASE quality\n		WHEN \'优\' THEN\n			\'好\'\n		WHEN \'良\' THEN\n			\'好\'\n		ELSE\n			\'差\'\n		END AS quality,\n		count(*) total\n	FROM\n		fact_air_cn\n	WHERE\n		YEAR (dt) = \'2014\'\n	GROUP BY\n		area,\n		quality\n	) t\nGROUP BY\n	t.area,\n	t.quality', '[{\"ordinal\":0,\"name\":\"area\",\"text\":\"城市/地区\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":20,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"quality\",\"text\":\"质量\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":1,\"decimals\":\"0\",\"type\":\"2\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"total\",\"text\":\"天数\",\"dataType\":\"DECIMAL\",\"expression\":\"\",\"width\":43,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"rating\",\"text\":\"占比\",\"dataType\":\"DECIMAL\",\"expression\":\"\",\"width\":48,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":true,\"optional\":false,\"footings\":false,\"displayInMail\":false}]', '', '', '', '2015-01-29 18:31:43', '2015-01-29 18:31:43');
INSERT INTO `reporting` VALUES ('716', '0', '0', '4c1778a1-c888-46dd-854a-9fbcde34529e', '中国天气(MySQL)', '716', '0', '1', '0', '100', '7', '1', '1', '', '', '', '', '', '2015-02-10 15:20:31', '2015-02-10 15:20:31');
INSERT INTO `reporting` VALUES ('717', '716', '50', '5beca118-e15e-4c3b-91f4-5330dc9a62dd', '2014年北京每天天气', '716,717', '1', '0', '0', '1', '7', '2', '1', 'select * from fact_weather_cn where year(dt)=2014 and area=\'北京\'', '[{\"ordinal\":0,\"name\":\"dt\",\"text\":\"日期\",\"dataType\":\"DATE\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":10,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"weather\",\"text\":\"天气\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":50,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"min_temp\",\"text\":\"最低温度\",\"dataType\":\"INT\",\"expression\":\"\",\"width\":11,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"max_temp\",\"text\":\"最高温度\",\"dataType\":\"INT\",\"expression\":\"\",\"width\":11,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"wind_level\",\"text\":\"风级\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":255,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false},{\"ordinal\":0,\"name\":\"wind_direct\",\"text\":\"风向\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":255,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"footings\":false,\"displayInMail\":false,\"optional\":false}]', '', '', '', '2015-02-10 15:37:11', '2015-02-10 15:37:11');
INSERT INTO `reporting` VALUES ('718', '711', '50', 'b6e04111-75b7-4c6b-9a30-c3d7d0b846c4', '2014年主要城市(可选)空气质量', '711,718', '1', '0', '0', '100', '7', '1', '1', 'SELECT\n	area,\n	CASE quality\n		WHEN \'优\' THEN \'1-优\'\n		WHEN \'良\' THEN \'2-良\'\n		WHEN \'轻度污染\' THEN \'3-轻度污染\'\n		WHEN \'中度污染\' THEN \'4-中度污染\'\n		WHEN \'重度污染\' THEN \'5-重度污染\'\n		WHEN \'严重污染\' THEN \'6-严重污染\'	\n	END AS quality,\n	count(*) total,\n    count(*) / 365 as rating,\n    avg(aqi) avg_aqi\nFROM\n	fact_air_cn\nWHERE\n	YEAR (dt) = \'2014\' \n    AND area in (\'${area}\')\nGROUP BY\n	area,\n	quality\norder by total desc', '[{\"ordinal\":0,\"name\":\"area\",\"text\":\"城市\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":20,\"decimals\":\"0\",\"type\":\"2\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"quality\",\"text\":\"空气等级\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":6,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"3\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"total\",\"text\":\"天数\",\"dataType\":\"BIGINT\",\"expression\":\"\",\"width\":21,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"footings\":false,\"optional\":false,\"percent\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"rating\",\"text\":\"占比\",\"dataType\":\"DECIMAL\",\"expression\":\"\",\"width\":26,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"footings\":false,\"optional\":false,\"percent\":true,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"avg_aqi\",\"text\":\"AQI均值\",\"dataType\":\"DECIMAL\",\"expression\":\"\",\"width\":16,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"displayInMail\":false,\"footings\":false}]', '[{\"name\":\"area\",\"text\":\"城市\",\"defaultValue\":\"北京市\",\"defaultText\":\"北京市\",\"dataType\":\"string\",\"width\":\"100\",\"formElement\":\"selectMul\",\"dataSource\":\"sql\",\"content\":\"select distinct area as name,area as text from fact_air_cn\",\"required\":false,\"autoComplete\":false}]', '', '', '2015-02-11 18:58:46', '2015-02-11 18:58:46');
INSERT INTO `reporting` VALUES ('719', '711', '50', 'a6233a37-18b2-4ec9-8ca1-90e8fe3ffed1', '2014年分地区城市空气质量', '711,719', '1', '0', '0', '100', '7', '2', '1', 'SELECT\n	t1.region,\n	t1.province,\n	t2.area,\n	CASE t2.quality\n		WHEN \'优\' THEN \'1-优\'\n		WHEN \'良\' THEN \'2-良\'\n		WHEN \'轻度污染\' THEN \'3-轻度污染\'\n		WHEN \'中度污染\' THEN \'4-中度污染\'\n		WHEN \'重度污染\' THEN \'5-重度污染\'\n		WHEN \'严重污染\' THEN \'6-严重污染\'	\n	END AS quality,\n	count(*) total,\n	count(*) / 365 AS rating\nFROM\n	(\n		SELECT DISTINCT\n			t1.region,\n			t1.province,\n			t1.city\n		FROM\n			dim_area_cn t1\n	) t1\nINNER JOIN fact_air_cn t2 ON t1.city = t2.area\nWHERE\n	YEAR (t2.dt) = \'2014\'\n    AND t1.region like \'%${region}%\'\n	AND t1.province  like \'%${province}%\'\n	AND t2.area  like \'%${area}%\'\nGROUP BY\n	t1.region,\n	t1.province,\n	t2.area,\n	t2.quality', '[{\"ordinal\":0,\"name\":\"region\",\"text\":\"地区\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":10,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"province\",\"text\":\"省(直辖市)\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":50,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"area\",\"text\":\"城市\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":20,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"quality\",\"text\":\"空气等级\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":10,\"decimals\":\"0\",\"type\":\"2\",\"sortType\":\"1\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"total\",\"text\":\"天数\",\"dataType\":\"BIGINT\",\"expression\":\"\",\"width\":21,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"footings\":false,\"displayInMail\":false},{\"ordinal\":0,\"name\":\"rating\",\"text\":\"占比\",\"dataType\":\"DECIMAL\",\"expression\":\"\",\"width\":26,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":true,\"optional\":false,\"footings\":false,\"displayInMail\":false}]', '[{\"name\":\"region\",\"text\":\"地区\",\"defaultValue\":\"%\",\"defaultText\":\"全部\",\"dataType\":\"string\",\"width\":\"100\",\"formElement\":\"select\",\"dataSource\":\"sql\",\"content\":\"select distinct region as name,region as text from dim_area_cn\",\"required\":false,\"autoComplete\":false},{\"name\":\"province\",\"text\":\"省(市)\",\"defaultValue\":\"%\",\"defaultText\":\"全部\",\"dataType\":\"string\",\"width\":\"100\",\"formElement\":\"select\",\"dataSource\":\"sql\",\"content\":\"select distinct province as name,province as text from dim_area_cn\",\"required\":false,\"autoComplete\":false},{\"name\":\"area\",\"text\":\"城市\",\"defaultValue\":\"%\",\"defaultText\":\"全部\",\"dataType\":\"string\",\"width\":\"100\",\"formElement\":\"selectMul\",\"dataSource\":\"sql\",\"content\":\"select distinct area as name,area as text from fact_air_cn\",\"required\":false,\"autoComplete\":false}]', '', '', '2015-02-13 12:15:23', '2015-02-13 12:15:23');
INSERT INTO `reporting` VALUES ('720', '711', '50', '3b6d84ef-e6d7-4644-a145-e99b578426bf', '2014主要城市(可选)每月空气质量', '711,720', '1', '0', '0', '100', '7', '2', '1', 'SELECT\n    MONTH(dt) month,\n	area,\n	CASE quality\n		WHEN \'优\' THEN \'1-优\'\n		WHEN \'良\' THEN \'2-良\'\n		WHEN \'轻度污染\' THEN \'3-轻度污染\'\n		WHEN \'中度污染\' THEN \'4-中度污染\'\n		WHEN \'重度污染\' THEN \'5-重度污染\'\n		WHEN \'严重污染\' THEN \'6-严重污染\'	\n	END AS quality,\n	count(*) total,\n    count(*) / 365 as rating\nFROM\n	fact_air_cn\nWHERE\n	YEAR (dt) = \'2014\' \n    AND area in (\'${area}\')\nGROUP BY\n    MONTH(dt),\n	area,\n	quality\norder by total desc', '[{\"ordinal\":0,\"name\":\"month\",\"text\":\"月度\",\"dataType\":\"INT\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":2,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"1\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"displayInMail\":false,\"footings\":false},{\"ordinal\":0,\"name\":\"area\",\"text\":\"城市\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"format\":\"\",\"comment\":\"\",\"width\":20,\"decimals\":\"0\",\"type\":\"1\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"displayInMail\":false,\"footings\":false},{\"ordinal\":0,\"name\":\"quality\",\"text\":\"空气等级\",\"dataType\":\"VARCHAR\",\"expression\":\"\",\"width\":6,\"decimals\":\"0\",\"type\":\"2\",\"sortType\":\"1\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"displayInMail\":false,\"footings\":false},{\"ordinal\":0,\"name\":\"total\",\"text\":\"天数\",\"dataType\":\"BIGINT\",\"expression\":\"\",\"width\":21,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":false,\"optional\":false,\"displayInMail\":false,\"footings\":false},{\"ordinal\":0,\"name\":\"rating\",\"text\":\"占比\",\"dataType\":\"DECIMAL\",\"expression\":\"\",\"width\":26,\"decimals\":\"0\",\"type\":\"3\",\"sortType\":\"0\",\"extensions\":false,\"hidden\":false,\"percent\":true,\"optional\":false,\"displayInMail\":false,\"footings\":false}]', '[{\"name\":\"area\",\"text\":\"城市\",\"defaultValue\":\"北京市\",\"defaultText\":\"北京市\",\"dataType\":\"string\",\"width\":\"100\",\"formElement\":\"selectMul\",\"dataSource\":\"sql\",\"content\":\"select distinct area as name,area as text from fact_air_cn\",\"required\":false,\"autoComplete\":false}]', '', '', '2015-02-13 18:26:33', '2015-02-13 18:26:33');
