/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : place

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2015-05-11 12:30:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tcity`
-- ----------------------------
DROP TABLE IF EXISTS `tcity`;
CREATE TABLE `tcity` (
  `cityId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `provinceId` int(11) unsigned NOT NULL,
  `cityCode` varchar(20) DEFAULT NULL,
  `cityName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cityId`),
  KEY `FK_PROVINCE` (`provinceId`),
  CONSTRAINT `FK_PROVINCE` FOREIGN KEY (`provinceId`) REFERENCES `tprovince` (`provinceId`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tcity
-- ----------------------------
INSERT INTO `tcity` VALUES ('1', '1', '110100', '北京市区');
INSERT INTO `tcity` VALUES ('2', '1', '110200', '北京郊区');
INSERT INTO `tcity` VALUES ('3', '2', '120100', '天津市区');
INSERT INTO `tcity` VALUES ('4', '2', '120200', '天津郊区');
INSERT INTO `tcity` VALUES ('5', '3', '130100', '石家庄市');
INSERT INTO `tcity` VALUES ('6', '3', '130200', '唐山市');
INSERT INTO `tcity` VALUES ('7', '3', '130300', '秦皇岛市');
INSERT INTO `tcity` VALUES ('8', '3', '130400', '邯郸市');
INSERT INTO `tcity` VALUES ('9', '3', '130500', '邢台市');
INSERT INTO `tcity` VALUES ('10', '3', '130600', '保定市');
INSERT INTO `tcity` VALUES ('11', '3', '130700', '张家口市');
INSERT INTO `tcity` VALUES ('12', '3', '130800', '承德市');
INSERT INTO `tcity` VALUES ('13', '3', '130900', '沧州市');
INSERT INTO `tcity` VALUES ('14', '3', '131000', '廊坊市');
INSERT INTO `tcity` VALUES ('15', '3', '131100', '衡水市');
INSERT INTO `tcity` VALUES ('16', '4', '140100', '太原市');
INSERT INTO `tcity` VALUES ('17', '4', '140200', '大同市');
INSERT INTO `tcity` VALUES ('18', '4', '140300', '阳泉市');
INSERT INTO `tcity` VALUES ('19', '4', '140400', '长治市');
INSERT INTO `tcity` VALUES ('20', '4', '140500', '晋城市');
INSERT INTO `tcity` VALUES ('21', '4', '140600', '朔州市');
INSERT INTO `tcity` VALUES ('22', '4', '140700', '晋中市');
INSERT INTO `tcity` VALUES ('23', '4', '140800', '运城市');
INSERT INTO `tcity` VALUES ('24', '4', '140900', '忻州市');
INSERT INTO `tcity` VALUES ('25', '4', '141000', '临汾市');
INSERT INTO `tcity` VALUES ('26', '4', '141100', '吕梁市');
INSERT INTO `tcity` VALUES ('27', '5', '150100', '呼和浩特市');
INSERT INTO `tcity` VALUES ('28', '5', '150200', '包头市');
INSERT INTO `tcity` VALUES ('29', '5', '150300', '乌海市');
INSERT INTO `tcity` VALUES ('30', '5', '150400', '赤峰市');
INSERT INTO `tcity` VALUES ('31', '5', '150500', '通辽市');
INSERT INTO `tcity` VALUES ('32', '5', '150600', '鄂尔多斯市');
INSERT INTO `tcity` VALUES ('33', '5', '150700', '呼伦贝尔市');
INSERT INTO `tcity` VALUES ('34', '5', '150800', '巴彦淖尔市');
INSERT INTO `tcity` VALUES ('35', '5', '150900', '乌兰察布市');
INSERT INTO `tcity` VALUES ('36', '5', '152200', '兴安盟');
INSERT INTO `tcity` VALUES ('37', '5', '152500', '锡林郭勒盟');
INSERT INTO `tcity` VALUES ('38', '5', '152900', '阿拉善盟');
INSERT INTO `tcity` VALUES ('39', '6', '210100', '沈阳市');
INSERT INTO `tcity` VALUES ('40', '6', '210200', '大连市');
INSERT INTO `tcity` VALUES ('41', '6', '210300', '鞍山市');
INSERT INTO `tcity` VALUES ('42', '6', '210400', '抚顺市');
INSERT INTO `tcity` VALUES ('43', '6', '210500', '本溪市');
INSERT INTO `tcity` VALUES ('44', '6', '210600', '丹东市');
INSERT INTO `tcity` VALUES ('45', '6', '210700', '锦州市');
INSERT INTO `tcity` VALUES ('46', '6', '210800', '营口市');
INSERT INTO `tcity` VALUES ('47', '6', '210900', '阜新市');
INSERT INTO `tcity` VALUES ('48', '6', '211000', '辽阳市');
INSERT INTO `tcity` VALUES ('49', '6', '211100', '盘锦市');
INSERT INTO `tcity` VALUES ('50', '6', '211200', '铁岭市');
INSERT INTO `tcity` VALUES ('51', '6', '211300', '朝阳市');
INSERT INTO `tcity` VALUES ('52', '6', '211400', '葫芦岛市');
INSERT INTO `tcity` VALUES ('53', '7', '220100', '长春市');
INSERT INTO `tcity` VALUES ('54', '7', '220200', '吉林市');
INSERT INTO `tcity` VALUES ('55', '7', '220300', '四平市');
INSERT INTO `tcity` VALUES ('56', '7', '220400', '辽源市');
INSERT INTO `tcity` VALUES ('57', '7', '220500', '通化市');
INSERT INTO `tcity` VALUES ('58', '7', '220600', '白山市');
INSERT INTO `tcity` VALUES ('59', '7', '220700', '松原市');
INSERT INTO `tcity` VALUES ('60', '7', '220800', '白城市');
INSERT INTO `tcity` VALUES ('61', '7', '222400', '延边朝鲜族自治州');
INSERT INTO `tcity` VALUES ('62', '8', '230100', '哈尔滨市');
INSERT INTO `tcity` VALUES ('63', '8', '230200', '齐齐哈尔市');
INSERT INTO `tcity` VALUES ('64', '8', '230300', '鸡西市');
INSERT INTO `tcity` VALUES ('65', '8', '230400', '鹤岗市');
INSERT INTO `tcity` VALUES ('66', '8', '230500', '双鸭山市');
INSERT INTO `tcity` VALUES ('67', '8', '230600', '大庆市');
INSERT INTO `tcity` VALUES ('68', '8', '230700', '伊春市');
INSERT INTO `tcity` VALUES ('69', '8', '230800', '佳木斯市');
INSERT INTO `tcity` VALUES ('70', '8', '230900', '七台河市');
INSERT INTO `tcity` VALUES ('71', '8', '231000', '牡丹江市');
INSERT INTO `tcity` VALUES ('72', '8', '231100', '黑河市');
INSERT INTO `tcity` VALUES ('73', '8', '231200', '绥化市');
INSERT INTO `tcity` VALUES ('74', '8', '232700', '大兴安岭地区');
INSERT INTO `tcity` VALUES ('75', '9', '310100', '上海市区');
INSERT INTO `tcity` VALUES ('76', '9', '310200', '县');
INSERT INTO `tcity` VALUES ('77', '10', '320100', '南京市');
INSERT INTO `tcity` VALUES ('78', '10', '320200', '无锡市');
INSERT INTO `tcity` VALUES ('79', '10', '320300', '徐州市');
INSERT INTO `tcity` VALUES ('80', '10', '320400', '常州市');
INSERT INTO `tcity` VALUES ('81', '10', '320500', '苏州市');
INSERT INTO `tcity` VALUES ('82', '10', '320600', '南通市');
INSERT INTO `tcity` VALUES ('83', '10', '320700', '连云港市');
INSERT INTO `tcity` VALUES ('84', '10', '320800', '淮安市');
INSERT INTO `tcity` VALUES ('85', '10', '320900', '盐城市');
INSERT INTO `tcity` VALUES ('86', '10', '321000', '扬州市');
INSERT INTO `tcity` VALUES ('87', '10', '321100', '镇江市');
INSERT INTO `tcity` VALUES ('88', '10', '321200', '泰州市');
INSERT INTO `tcity` VALUES ('89', '10', '321300', '宿迁市');
INSERT INTO `tcity` VALUES ('90', '11', '330100', '杭州市');
INSERT INTO `tcity` VALUES ('91', '11', '330200', '宁波市');
INSERT INTO `tcity` VALUES ('92', '11', '330300', '温州市');
INSERT INTO `tcity` VALUES ('93', '11', '330400', '嘉兴市');
INSERT INTO `tcity` VALUES ('94', '11', '330500', '湖州市');
INSERT INTO `tcity` VALUES ('95', '11', '330600', '绍兴市');
INSERT INTO `tcity` VALUES ('96', '11', '330700', '金华市');
INSERT INTO `tcity` VALUES ('97', '11', '330800', '衢州市');
INSERT INTO `tcity` VALUES ('98', '11', '330900', '舟山市');
INSERT INTO `tcity` VALUES ('99', '11', '331000', '台州市');
INSERT INTO `tcity` VALUES ('100', '11', '331100', '丽水市');
INSERT INTO `tcity` VALUES ('101', '12', '340100', '合肥市');
INSERT INTO `tcity` VALUES ('102', '12', '340200', '芜湖市');
INSERT INTO `tcity` VALUES ('103', '12', '340300', '蚌埠市');
INSERT INTO `tcity` VALUES ('104', '12', '340400', '淮南市');
INSERT INTO `tcity` VALUES ('105', '12', '340500', '马鞍山市');
INSERT INTO `tcity` VALUES ('106', '12', '340600', '淮北市');
INSERT INTO `tcity` VALUES ('107', '12', '340700', '铜陵市');
INSERT INTO `tcity` VALUES ('108', '12', '340800', '安庆市');
INSERT INTO `tcity` VALUES ('109', '12', '341000', '黄山市');
INSERT INTO `tcity` VALUES ('110', '12', '341100', '滁州市');
INSERT INTO `tcity` VALUES ('111', '12', '341200', '阜阳市');
INSERT INTO `tcity` VALUES ('112', '12', '341300', '宿州市');
INSERT INTO `tcity` VALUES ('113', '12', '341400', '巢湖市');
INSERT INTO `tcity` VALUES ('114', '12', '341500', '六安市');
INSERT INTO `tcity` VALUES ('115', '12', '341600', '亳州市');
INSERT INTO `tcity` VALUES ('116', '12', '341700', '池州市');
INSERT INTO `tcity` VALUES ('117', '12', '341800', '宣城市');
INSERT INTO `tcity` VALUES ('118', '13', '350100', '福州市');
INSERT INTO `tcity` VALUES ('119', '13', '350200', '厦门市');
INSERT INTO `tcity` VALUES ('120', '13', '350300', '莆田市');
INSERT INTO `tcity` VALUES ('121', '13', '350400', '三明市');
INSERT INTO `tcity` VALUES ('122', '13', '350500', '泉州市');
INSERT INTO `tcity` VALUES ('123', '13', '350600', '漳州市');
INSERT INTO `tcity` VALUES ('124', '13', '350700', '南平市');
INSERT INTO `tcity` VALUES ('125', '13', '350800', '龙岩市');
INSERT INTO `tcity` VALUES ('126', '13', '350900', '宁德市');
INSERT INTO `tcity` VALUES ('127', '14', '360100', '南昌市');
INSERT INTO `tcity` VALUES ('128', '14', '360200', '景德镇市');
INSERT INTO `tcity` VALUES ('129', '14', '360300', '萍乡市');
INSERT INTO `tcity` VALUES ('130', '14', '360400', '九江市');
INSERT INTO `tcity` VALUES ('131', '14', '360500', '新余市');
INSERT INTO `tcity` VALUES ('132', '14', '360600', '鹰潭市');
INSERT INTO `tcity` VALUES ('133', '14', '360700', '赣州市');
INSERT INTO `tcity` VALUES ('134', '14', '360800', '吉安市');
INSERT INTO `tcity` VALUES ('135', '14', '360900', '宜春市');
INSERT INTO `tcity` VALUES ('136', '14', '361000', '抚州市');
INSERT INTO `tcity` VALUES ('137', '14', '361100', '上饶市');
INSERT INTO `tcity` VALUES ('138', '15', '370100', '济南市');
INSERT INTO `tcity` VALUES ('139', '15', '370200', '青岛市');
INSERT INTO `tcity` VALUES ('140', '15', '370300', '淄博市');
INSERT INTO `tcity` VALUES ('141', '15', '370400', '枣庄市');
INSERT INTO `tcity` VALUES ('142', '15', '370500', '东营市');
INSERT INTO `tcity` VALUES ('143', '15', '370600', '烟台市');
INSERT INTO `tcity` VALUES ('144', '15', '370700', '潍坊市');
INSERT INTO `tcity` VALUES ('145', '15', '370800', '济宁市');
INSERT INTO `tcity` VALUES ('146', '15', '370900', '泰安市');
INSERT INTO `tcity` VALUES ('147', '15', '371000', '威海市');
INSERT INTO `tcity` VALUES ('148', '15', '371100', '日照市');
INSERT INTO `tcity` VALUES ('149', '15', '371200', '莱芜市');
INSERT INTO `tcity` VALUES ('150', '15', '371300', '临沂市');
INSERT INTO `tcity` VALUES ('151', '15', '371400', '德州市');
INSERT INTO `tcity` VALUES ('152', '15', '371500', '聊城市');
INSERT INTO `tcity` VALUES ('153', '15', '371600', '滨州市');
INSERT INTO `tcity` VALUES ('154', '15', '371700', '荷泽市');
INSERT INTO `tcity` VALUES ('155', '16', '410100', '郑州市');
INSERT INTO `tcity` VALUES ('156', '16', '410200', '开封市');
INSERT INTO `tcity` VALUES ('157', '16', '410300', '洛阳市');
INSERT INTO `tcity` VALUES ('158', '16', '410400', '平顶山市');
INSERT INTO `tcity` VALUES ('159', '16', '410500', '安阳市');
INSERT INTO `tcity` VALUES ('160', '16', '410600', '鹤壁市');
INSERT INTO `tcity` VALUES ('161', '16', '410700', '新乡市');
INSERT INTO `tcity` VALUES ('162', '16', '410800', '焦作市');
INSERT INTO `tcity` VALUES ('163', '16', '410900', '濮阳市');
INSERT INTO `tcity` VALUES ('164', '16', '411000', '许昌市');
INSERT INTO `tcity` VALUES ('165', '16', '411100', '漯河市');
INSERT INTO `tcity` VALUES ('166', '16', '411200', '三门峡市');
INSERT INTO `tcity` VALUES ('167', '16', '411300', '南阳市');
INSERT INTO `tcity` VALUES ('168', '16', '411400', '商丘市');
INSERT INTO `tcity` VALUES ('169', '16', '411500', '信阳市');
INSERT INTO `tcity` VALUES ('170', '16', '411600', '周口市');
INSERT INTO `tcity` VALUES ('171', '16', '411700', '驻马店市');
INSERT INTO `tcity` VALUES ('172', '17', '420100', '武汉市');
INSERT INTO `tcity` VALUES ('173', '17', '420200', '黄石市');
INSERT INTO `tcity` VALUES ('174', '17', '420300', '十堰市');
INSERT INTO `tcity` VALUES ('175', '17', '420500', '宜昌市');
INSERT INTO `tcity` VALUES ('176', '17', '420600', '襄樊市');
INSERT INTO `tcity` VALUES ('177', '17', '420700', '鄂州市');
INSERT INTO `tcity` VALUES ('178', '17', '420800', '荆门市');
INSERT INTO `tcity` VALUES ('179', '17', '420900', '孝感市');
INSERT INTO `tcity` VALUES ('180', '17', '421000', '荆州市');
INSERT INTO `tcity` VALUES ('181', '17', '421100', '黄冈市');
INSERT INTO `tcity` VALUES ('182', '17', '421200', '咸宁市');
INSERT INTO `tcity` VALUES ('183', '17', '421300', '随州市');
INSERT INTO `tcity` VALUES ('184', '17', '422800', '恩施土家族苗族自治州');
INSERT INTO `tcity` VALUES ('185', '17', '429000', '省直辖行政单位');
INSERT INTO `tcity` VALUES ('186', '18', '430100', '长沙市');
INSERT INTO `tcity` VALUES ('187', '18', '430200', '株洲市');
INSERT INTO `tcity` VALUES ('188', '18', '430300', '湘潭市');
INSERT INTO `tcity` VALUES ('189', '18', '430400', '衡阳市');
INSERT INTO `tcity` VALUES ('190', '18', '430500', '邵阳市');
INSERT INTO `tcity` VALUES ('191', '18', '430600', '岳阳市');
INSERT INTO `tcity` VALUES ('192', '18', '430700', '常德市');
INSERT INTO `tcity` VALUES ('193', '18', '430800', '张家界市');
INSERT INTO `tcity` VALUES ('194', '18', '430900', '益阳市');
INSERT INTO `tcity` VALUES ('195', '18', '431000', '郴州市');
INSERT INTO `tcity` VALUES ('196', '18', '431100', '永州市');
INSERT INTO `tcity` VALUES ('197', '18', '431200', '怀化市');
INSERT INTO `tcity` VALUES ('198', '18', '431300', '娄底市');
INSERT INTO `tcity` VALUES ('199', '18', '433100', '湘西土家族苗族自治州');
INSERT INTO `tcity` VALUES ('200', '19', '440100', '广州市');
INSERT INTO `tcity` VALUES ('201', '19', '440200', '韶关市');
INSERT INTO `tcity` VALUES ('202', '19', '440300', '深圳市');
INSERT INTO `tcity` VALUES ('203', '19', '440400', '珠海市');
INSERT INTO `tcity` VALUES ('204', '19', '440500', '汕头市');
INSERT INTO `tcity` VALUES ('205', '19', '440600', '佛山市');
INSERT INTO `tcity` VALUES ('206', '19', '440700', '江门市');
INSERT INTO `tcity` VALUES ('207', '19', '440800', '湛江市');
INSERT INTO `tcity` VALUES ('208', '19', '440900', '茂名市');
INSERT INTO `tcity` VALUES ('209', '19', '441200', '肇庆市');
INSERT INTO `tcity` VALUES ('210', '19', '441300', '惠州市');
INSERT INTO `tcity` VALUES ('211', '19', '441400', '梅州市');
INSERT INTO `tcity` VALUES ('212', '19', '441500', '汕尾市');
INSERT INTO `tcity` VALUES ('213', '19', '441600', '河源市');
INSERT INTO `tcity` VALUES ('214', '19', '441700', '阳江市');
INSERT INTO `tcity` VALUES ('215', '19', '441800', '清远市');
INSERT INTO `tcity` VALUES ('216', '19', '441900', '东莞市');
INSERT INTO `tcity` VALUES ('217', '19', '442000', '中山市');
INSERT INTO `tcity` VALUES ('218', '19', '445100', '潮州市');
INSERT INTO `tcity` VALUES ('219', '19', '445200', '揭阳市');
INSERT INTO `tcity` VALUES ('220', '19', '445300', '云浮市');
INSERT INTO `tcity` VALUES ('221', '20', '450100', '南宁市');
INSERT INTO `tcity` VALUES ('222', '20', '450200', '柳州市');
INSERT INTO `tcity` VALUES ('223', '20', '450300', '桂林市');
INSERT INTO `tcity` VALUES ('224', '20', '450400', '梧州市');
INSERT INTO `tcity` VALUES ('225', '20', '450500', '北海市');
INSERT INTO `tcity` VALUES ('226', '20', '450600', '防城港市');
INSERT INTO `tcity` VALUES ('227', '20', '450700', '钦州市');
INSERT INTO `tcity` VALUES ('228', '20', '450800', '贵港市');
INSERT INTO `tcity` VALUES ('229', '20', '450900', '玉林市');
INSERT INTO `tcity` VALUES ('230', '20', '451000', '百色市');
INSERT INTO `tcity` VALUES ('231', '20', '451100', '贺州市');
INSERT INTO `tcity` VALUES ('232', '20', '451200', '河池市');
INSERT INTO `tcity` VALUES ('233', '20', '451300', '来宾市');
INSERT INTO `tcity` VALUES ('234', '20', '451400', '崇左市');
INSERT INTO `tcity` VALUES ('235', '21', '460100', '海口市');
INSERT INTO `tcity` VALUES ('236', '21', '460200', '三亚市');
INSERT INTO `tcity` VALUES ('237', '21', '469000', '省直辖县级行政单位');
INSERT INTO `tcity` VALUES ('238', '22', '500100', '重庆市区');
INSERT INTO `tcity` VALUES ('239', '22', '500200', '重庆县级');
INSERT INTO `tcity` VALUES ('240', '22', '500300', '万州');
INSERT INTO `tcity` VALUES ('241', '23', '510100', '成都市');
INSERT INTO `tcity` VALUES ('242', '23', '510300', '自贡市');
INSERT INTO `tcity` VALUES ('243', '23', '510400', '攀枝花市');
INSERT INTO `tcity` VALUES ('244', '23', '510500', '泸州市');
INSERT INTO `tcity` VALUES ('245', '23', '510600', '德阳市');
INSERT INTO `tcity` VALUES ('246', '23', '510700', '绵阳市');
INSERT INTO `tcity` VALUES ('247', '23', '510800', '广元市');
INSERT INTO `tcity` VALUES ('248', '23', '510900', '遂宁市');
INSERT INTO `tcity` VALUES ('249', '23', '511000', '内江市');
INSERT INTO `tcity` VALUES ('250', '23', '511100', '乐山市');
INSERT INTO `tcity` VALUES ('251', '23', '511300', '南充市');
INSERT INTO `tcity` VALUES ('252', '23', '511400', '眉山市');
INSERT INTO `tcity` VALUES ('253', '23', '511500', '宜宾市');
INSERT INTO `tcity` VALUES ('254', '23', '511600', '广安市');
INSERT INTO `tcity` VALUES ('255', '23', '511700', '达州市');
INSERT INTO `tcity` VALUES ('256', '23', '511800', '雅安市');
INSERT INTO `tcity` VALUES ('257', '23', '511900', '巴中市');
INSERT INTO `tcity` VALUES ('258', '23', '512000', '资阳市');
INSERT INTO `tcity` VALUES ('259', '23', '513200', '阿坝藏族羌族自治州');
INSERT INTO `tcity` VALUES ('260', '23', '513300', '甘孜藏族自治州');
INSERT INTO `tcity` VALUES ('261', '23', '513400', '凉山彝族自治州');
INSERT INTO `tcity` VALUES ('262', '24', '520100', '贵阳市');
INSERT INTO `tcity` VALUES ('263', '24', '520200', '六盘水市');
INSERT INTO `tcity` VALUES ('264', '24', '520300', '遵义市');
INSERT INTO `tcity` VALUES ('265', '24', '520400', '安顺市');
INSERT INTO `tcity` VALUES ('266', '24', '522200', '铜仁地区');
INSERT INTO `tcity` VALUES ('267', '24', '522300', '黔西南布依族苗族自治州');
INSERT INTO `tcity` VALUES ('268', '24', '522400', '毕节地区');
INSERT INTO `tcity` VALUES ('269', '24', '522600', '黔东南苗族侗族自治州');
INSERT INTO `tcity` VALUES ('270', '24', '522700', '黔南布依族苗族自治州');
INSERT INTO `tcity` VALUES ('271', '25', '530100', '昆明市');
INSERT INTO `tcity` VALUES ('272', '25', '530300', '曲靖市');
INSERT INTO `tcity` VALUES ('273', '25', '530400', '玉溪市');
INSERT INTO `tcity` VALUES ('274', '25', '530500', '保山市');
INSERT INTO `tcity` VALUES ('275', '25', '530600', '昭通市');
INSERT INTO `tcity` VALUES ('276', '25', '530700', '丽江市');
INSERT INTO `tcity` VALUES ('277', '25', '530800', '思茅市');
INSERT INTO `tcity` VALUES ('278', '25', '530900', '临沧市');
INSERT INTO `tcity` VALUES ('279', '25', '532300', '楚雄彝族自治州');
INSERT INTO `tcity` VALUES ('280', '25', '532500', '红河哈尼族彝族自治州');
INSERT INTO `tcity` VALUES ('281', '25', '532600', '文山壮族苗族自治州');
INSERT INTO `tcity` VALUES ('282', '25', '532800', '西双版纳傣族自治州');
INSERT INTO `tcity` VALUES ('283', '25', '532900', '大理白族自治州');
INSERT INTO `tcity` VALUES ('284', '25', '533100', '德宏傣族景颇族自治州');
INSERT INTO `tcity` VALUES ('285', '25', '533300', '怒江傈僳族自治州');
INSERT INTO `tcity` VALUES ('286', '25', '533400', '迪庆藏族自治州');
INSERT INTO `tcity` VALUES ('287', '26', '540100', '拉萨市');
INSERT INTO `tcity` VALUES ('288', '26', '542100', '昌都地区');
INSERT INTO `tcity` VALUES ('289', '26', '542200', '山南地区');
INSERT INTO `tcity` VALUES ('290', '26', '542300', '日喀则地区');
INSERT INTO `tcity` VALUES ('291', '26', '542400', '那曲地区');
INSERT INTO `tcity` VALUES ('292', '26', '542500', '阿里地区');
INSERT INTO `tcity` VALUES ('293', '26', '542600', '林芝地区');
INSERT INTO `tcity` VALUES ('294', '27', '610100', '西安市');
INSERT INTO `tcity` VALUES ('295', '27', '610200', '铜川市');
INSERT INTO `tcity` VALUES ('296', '27', '610300', '宝鸡市');
INSERT INTO `tcity` VALUES ('297', '27', '610400', '咸阳市');
INSERT INTO `tcity` VALUES ('298', '27', '610500', '渭南市');
INSERT INTO `tcity` VALUES ('299', '27', '610600', '延安市');
INSERT INTO `tcity` VALUES ('300', '27', '610700', '汉中市');
INSERT INTO `tcity` VALUES ('301', '27', '610800', '榆林市');
INSERT INTO `tcity` VALUES ('302', '27', '610900', '安康市');
INSERT INTO `tcity` VALUES ('303', '27', '611000', '商洛市');
INSERT INTO `tcity` VALUES ('304', '28', '620100', '兰州市');
INSERT INTO `tcity` VALUES ('305', '28', '620200', '嘉峪关市');
INSERT INTO `tcity` VALUES ('306', '28', '620300', '金昌市');
INSERT INTO `tcity` VALUES ('307', '28', '620400', '白银市');
INSERT INTO `tcity` VALUES ('308', '28', '620500', '天水市');
INSERT INTO `tcity` VALUES ('309', '28', '620600', '武威市');
INSERT INTO `tcity` VALUES ('310', '28', '620700', '张掖市');
INSERT INTO `tcity` VALUES ('311', '28', '620800', '平凉市');
INSERT INTO `tcity` VALUES ('312', '28', '620900', '酒泉市');
INSERT INTO `tcity` VALUES ('313', '28', '621000', '庆阳市');
INSERT INTO `tcity` VALUES ('314', '28', '621100', '定西市');
INSERT INTO `tcity` VALUES ('315', '28', '621200', '陇南市');
INSERT INTO `tcity` VALUES ('316', '28', '622900', '临夏回族自治州');
INSERT INTO `tcity` VALUES ('317', '28', '623000', '甘南藏族自治州');
INSERT INTO `tcity` VALUES ('318', '29', '630100', '西宁市');
INSERT INTO `tcity` VALUES ('319', '29', '632100', '海东地区');
INSERT INTO `tcity` VALUES ('320', '29', '632200', '海北藏族自治州');
INSERT INTO `tcity` VALUES ('321', '29', '632300', '黄南藏族自治州');
INSERT INTO `tcity` VALUES ('322', '29', '632500', '海南藏族自治州');
INSERT INTO `tcity` VALUES ('323', '29', '632600', '果洛藏族自治州');
INSERT INTO `tcity` VALUES ('324', '29', '632700', '玉树藏族自治州');
INSERT INTO `tcity` VALUES ('325', '29', '632800', '海西蒙古族藏族自治州');
INSERT INTO `tcity` VALUES ('326', '30', '640100', '银川市');
INSERT INTO `tcity` VALUES ('327', '30', '640200', '石嘴山市');
INSERT INTO `tcity` VALUES ('328', '30', '640300', '吴忠市');
INSERT INTO `tcity` VALUES ('329', '30', '640400', '固原市');
INSERT INTO `tcity` VALUES ('330', '30', '640500', '中卫市');
INSERT INTO `tcity` VALUES ('331', '31', '650100', '乌鲁木齐市');
INSERT INTO `tcity` VALUES ('332', '31', '650200', '克拉玛依市');
INSERT INTO `tcity` VALUES ('333', '31', '652100', '吐鲁番地区');
INSERT INTO `tcity` VALUES ('334', '31', '652200', '哈密地区');
INSERT INTO `tcity` VALUES ('335', '31', '652300', '昌吉回族自治州');
INSERT INTO `tcity` VALUES ('336', '31', '652700', '博尔塔拉蒙古自治州');
INSERT INTO `tcity` VALUES ('337', '31', '652800', '巴音郭楞蒙古自治州');
INSERT INTO `tcity` VALUES ('338', '31', '652900', '阿克苏地区');
INSERT INTO `tcity` VALUES ('339', '31', '653000', '克孜勒苏柯尔克孜自治州');
INSERT INTO `tcity` VALUES ('340', '31', '653100', '喀什地区');
INSERT INTO `tcity` VALUES ('341', '31', '653200', '和田地区');
INSERT INTO `tcity` VALUES ('342', '31', '654000', '伊犁哈萨克自治州');
INSERT INTO `tcity` VALUES ('343', '31', '654200', '塔城地区');
INSERT INTO `tcity` VALUES ('344', '31', '654300', '阿勒泰地区');
INSERT INTO `tcity` VALUES ('345', '31', '659000', '省直辖行政单位');
INSERT INTO `tcity` VALUES ('346', '32', '710100', '台北');
INSERT INTO `tcity` VALUES ('347', '32', '710200', '高雄');
INSERT INTO `tcity` VALUES ('348', '32', '710300', '台中');
INSERT INTO `tcity` VALUES ('349', '32', '710400', '台南');
INSERT INTO `tcity` VALUES ('350', '32', '710500', '基隆');
INSERT INTO `tcity` VALUES ('351', '32', '710600', '新竹');
INSERT INTO `tcity` VALUES ('352', '33', '810100', '香港');
INSERT INTO `tcity` VALUES ('353', '34', '820100', '澳门');

-- ----------------------------
-- Table structure for `tprovince`
-- ----------------------------
DROP TABLE IF EXISTS `tprovince`;
CREATE TABLE `tprovince` (
  `provinceId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provinceCode` varchar(20) DEFAULT NULL,
  `provinceName` varchar(50) DEFAULT NULL,
  `provinceNum` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`provinceId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tprovince
-- ----------------------------
INSERT INTO `tprovince` VALUES ('1', '110000', '北京市', '11');
INSERT INTO `tprovince` VALUES ('2', '120000', '天津市', '12');
INSERT INTO `tprovince` VALUES ('3', '130000', '河北省', '13');
INSERT INTO `tprovince` VALUES ('4', '140000', '山西省', '14');
INSERT INTO `tprovince` VALUES ('5', '150000', '内蒙古自治区', '15');
INSERT INTO `tprovince` VALUES ('6', '210000', '辽宁省', '21');
INSERT INTO `tprovince` VALUES ('7', '220000', '吉林省', '22');
INSERT INTO `tprovince` VALUES ('8', '230000', '黑龙江省', '23');
INSERT INTO `tprovince` VALUES ('9', '310000', '上海市', '31');
INSERT INTO `tprovince` VALUES ('10', '320000', '江苏省', '32');
INSERT INTO `tprovince` VALUES ('11', '330000', '浙江省', '33');
INSERT INTO `tprovince` VALUES ('12', '340000', '安徽省', '34');
INSERT INTO `tprovince` VALUES ('13', '350000', '福建省', '35');
INSERT INTO `tprovince` VALUES ('14', '360000', '江西省', '36');
INSERT INTO `tprovince` VALUES ('15', '370000', '山东省', '37');
INSERT INTO `tprovince` VALUES ('16', '410000', '河南省', '41');
INSERT INTO `tprovince` VALUES ('17', '420000', '湖北省', '42');
INSERT INTO `tprovince` VALUES ('18', '430000', '湖南省', '43');
INSERT INTO `tprovince` VALUES ('19', '440000', '广东省', '44');
INSERT INTO `tprovince` VALUES ('20', '450000', '广西壮族自治区', '45');
INSERT INTO `tprovince` VALUES ('21', '460000', '海南省', '46');
INSERT INTO `tprovince` VALUES ('22', '500000', '重庆市', '50');
INSERT INTO `tprovince` VALUES ('23', '510000', '四川省', '51');
INSERT INTO `tprovince` VALUES ('24', '520000', '贵州省', '52');
INSERT INTO `tprovince` VALUES ('25', '530000', '云南省', '53');
INSERT INTO `tprovince` VALUES ('26', '540000', '西藏自治区', '54');
INSERT INTO `tprovince` VALUES ('27', '610000', '陕西省', '61');
INSERT INTO `tprovince` VALUES ('28', '620000', '甘肃省', '62');
INSERT INTO `tprovince` VALUES ('29', '630000', '青海省', '63');
INSERT INTO `tprovince` VALUES ('30', '640000', '宁夏回族自治区', '64');
INSERT INTO `tprovince` VALUES ('31', '650000', '新疆维吾尔自治区', '65');
INSERT INTO `tprovince` VALUES ('32', '710000', '台湾省', '71');
INSERT INTO `tprovince` VALUES ('33', '810000', '香港特别行政区', '81');
INSERT INTO `tprovince` VALUES ('34', '820000', '澳门特别行政区', '82');
