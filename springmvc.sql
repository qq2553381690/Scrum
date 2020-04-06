/*
Navicat MySQL Data Transfer

Source Server         : XYY
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : springmvc

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2020-04-07 00:39:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `au_name` varchar(50) DEFAULT NULL,
  `au_details` varchar(200) DEFAULT NULL,
  `shop_type` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '商户', '卖家', '0');
INSERT INTO `authority` VALUES ('2', '老师', '审核', '1');
INSERT INTO `authority` VALUES ('3', '学生', '买家', '2');

-- ----------------------------
-- Table structure for `branch`
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `competitor` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `post` int(10) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `fax` varchar(40) DEFAULT NULL,
  `manager` varchar(40) DEFAULT NULL,
  `area` varchar(60) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES ('1', '宏福有限公司', '市场部门', '市场', 'ssss', '123452', '1398517281', '11222', '王老五', 'ssds', '22323');
INSERT INTO `branch` VALUES ('8', '', 'A部门', '市场', '南京', '2111515', '213212332', '342134213', '老三', '南京', '无');
INSERT INTO `branch` VALUES ('9', 'B公司', 'B部门', '市场', '南京', '341321', '132423144', '3214324423', '老四', '南京', '341234213');
INSERT INTO `branch` VALUES ('11', '12321', '3214', '123412', '2134132', '213412', '123124231', '3214', '132412', '14324', '1234');
INSERT INTO `branch` VALUES ('12', '11', '', '', '', '222222', '22323232', '', '', '', '');

-- ----------------------------
-- Table structure for `card`
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_vid` varchar(32) NOT NULL,
  `sq_id` varchar(32) NOT NULL,
  `auth_id` int(11) NOT NULL,
  `state` char(1) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES ('1', '19900228ffe24e71a0a50c901109dd2b', '2010150127', '3', '1', '15039');
INSERT INTO `card` VALUES ('3', 'b0d6b2a0e1b54bdd88149a29aa8d13ed', '2010150126', '3', '1', '287');
INSERT INTO `card` VALUES ('4', '56071b45a3f94c9ea59cf9e09dbfacb7', '001', '2', '1', '996335');
INSERT INTO `card` VALUES ('13', '765688fc0f5241caad1060292d502ec3', '2010150103', '3', '1', '186');
INSERT INTO `card` VALUES ('14', 'b5b6da6d03ea4313b899b3553ca932da', '2010150101', '3', '1', '500');
INSERT INTO `card` VALUES ('15', '7fdfae140d4e46aaa18061021489dd39', '2010150102', '3', '1', '195');
INSERT INTO `card` VALUES ('16', '68fde70461494b97b2e93805e8c4de4e', '2010150104', '3', '1', '282');
INSERT INTO `card` VALUES ('17', '04c7a7951e55421c840850e29f5346b0', '2010150211', '3', '0', '0');
INSERT INTO `card` VALUES ('19', 'c06b5b3a49c14ff9806471a141860212', '2010150220', '3', '1', '267');
INSERT INTO `card` VALUES ('20', '6f252b2757674815a6cf39929f05df71', '2010150221', '3', '1', '200');
INSERT INTO `card` VALUES ('21', '601b3003f348412cade2e80aa51266bb', '2010150105', '3', '0', null);
INSERT INTO `card` VALUES ('22', 'e756789fa34d4df0998d3c2db5c09dec', '2010150106', '3', '0', null);
INSERT INTO `card` VALUES ('23', 'b3d68644cb564f36a408358eedf57616', '2010150107', '3', '0', null);
INSERT INTO `card` VALUES ('24', '629b8588e8144512b2bcfd4da51a7980', '2010150108', '3', '0', null);
INSERT INTO `card` VALUES ('25', 'dd5339e525a24f7fb69bbe60775d816b', '2010150109', '3', '0', null);
INSERT INTO `card` VALUES ('26', '3142452007c04e839f2ac2bb3ed0bd06', '2010150110', '3', '1', '383');
INSERT INTO `card` VALUES ('27', '86726251b6de4f3c949f932aa93b9d32', '2010150111', '3', '1', '160');
INSERT INTO `card` VALUES ('28', '9dfb2103aa4d4fdfbd6b10f253797f07', '2010150128', '3', '1', '500');
INSERT INTO `card` VALUES ('29', '8649fa97361a4317aad4ad6625fadda4', '2010150125', '3', '1', '200');
INSERT INTO `card` VALUES ('30', '144475eaee4948af9ce719d5252b802f', '1932203', '3', '1', '984');

-- ----------------------------
-- Table structure for `car_info`
-- ----------------------------
DROP TABLE IF EXISTS `car_info`;
CREATE TABLE `car_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `garage_num` int(10) DEFAULT NULL,
  `plate_num` varchar(10) DEFAULT NULL,
  `car_brand` varchar(30) DEFAULT NULL,
  `car_manager` varchar(30) DEFAULT NULL,
  `car_interior` varchar(200) DEFAULT NULL,
  `car_index` varchar(200) DEFAULT NULL,
  `car_fee_scale` varchar(200) DEFAULT NULL,
  `evaluation` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_info
-- ----------------------------
INSERT INTO `car_info` VALUES ('2', '2222', '苏B11111', '奔驰', '王五', '大气', 's', '8000/天', '舒适');
INSERT INTO `car_info` VALUES ('3', '3333', '苏C22222', '凯迪拉克', '李四', '上档次', 'q', '5000/天', '性能好');
INSERT INTO `car_info` VALUES ('4', '4444', '苏E33333', '马自达', '小三', '舒适', 'x', '1000/天', '相加比高');
INSERT INTO `car_info` VALUES ('5', '5555', '苏J77777', '奥迪', '小二', '贵气', 'a', '10000/天', '质量好');
INSERT INTO `car_info` VALUES ('6', '6666', '苏Z66666', '林肯', '张三', '高档', 'a', '10000/天', '好得不行');
INSERT INTO `car_info` VALUES ('7', '7777', '苏D55555', '路虎', '李四', '舒适', 'a', '8000/天', '舒适');
INSERT INTO `car_info` VALUES ('9', '5532', '苏A12345', '迈凯伦', '张三', '豪华', 'aad', '8000/天', '性价比高');
INSERT INTO `car_info` VALUES ('11', '2345', '苏A5555', '宝马', '小张', '豪华', 'saaa223', '5000/天', '满意');
INSERT INTO `car_info` VALUES ('13', '124598', '苏B12345', '保时捷', '小陈', '大气', 'sasx', '10000/天', '满意');
INSERT INTO `car_info` VALUES ('16', '12459', '苏A77778', '路虎', '小张', '舒适', 'aaassxx', '5000/天', '满意');
INSERT INTO `car_info` VALUES ('19', '31211', '苏H45678', '路虎', '小王', '舒适', '路虎aas', '8000/天', '满意');
INSERT INTO `car_info` VALUES ('20', '7475', '苏A666666', '宝马', '小张', '大气', '宝马X6', '8000/天', '性价比高');
INSERT INTO `car_info` VALUES ('21', '12345', '苏B456789', '宝马', '小张', '舒适', 'sdh', '8000/天', '满意');

-- ----------------------------
-- Table structure for `file_info`
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `dalx` varchar(100) DEFAULT NULL,
  `cdd` varchar(100) DEFAULT NULL,
  `dabh` varchar(100) NOT NULL,
  `dabt` varchar(100) DEFAULT NULL,
  `jdyh` varchar(100) DEFAULT NULL,
  `jdrq` varchar(100) DEFAULT NULL,
  `xgyh` varchar(100) DEFAULT NULL,
  `xgrq` varchar(100) DEFAULT NULL,
  `aqjb` varchar(100) DEFAULT NULL,
  `gqsj` varchar(100) DEFAULT NULL,
  `gqtz` varchar(100) DEFAULT NULL,
  `tzts` varchar(100) DEFAULT NULL,
  `sfcy` varchar(100) DEFAULT NULL,
  `wjbh` varchar(100) DEFAULT NULL,
  `fwdw` varchar(100) DEFAULT NULL,
  `lwbm` varchar(100) DEFAULT NULL,
  `fwr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dabh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO `file_info` VALUES ('001', '00101', '0001201', '0250', 'wsy', '20180621', 'wzt', '20180622', '高', '20180629', '20180630', '1', '否', '123', '123', '123', 'wsy');
INSERT INTO `file_info` VALUES ('001', '001', '00110', '001011', 'wsy', '20180621', 'wzt', '20180622', '高', '20180629', '20180630', '1', '否', '00110', '123', '123', 'wsy');
INSERT INTO `file_info` VALUES ('312', '22', '11', '232', 'da', 'da', 'da', 'ds', 'sad', 'a', 'ad', 'da', 'da', 'da', 'fa', 's', 'a');
INSERT INTO `file_info` VALUES ('das', 'ads', '2010', 'ads', '1da', '', 'asda', '', 'as', '', 'asd', '', 'ads', '', '', '', '');
INSERT INTO `file_info` VALUES ('123', '21', '3213', '12', '123123', '3312', '123', '23121', '12312312', '3312', '123123', '12', '312', '1233', '13212', '12312', '1312');
INSERT INTO `file_info` VALUES ('qq', 'wqww', '6789', 'qw', 'qw', 'qw', '', 'qw', '', 'qw', '', '', '', '', '', '', '');
INSERT INTO `file_info` VALUES ('da', '2', 'e1', '3', '213', '2', '3', '5', '21', '2', '31', '2', '1', '1', '1', '4', '4');
INSERT INTO `file_info` VALUES ('mkm', 'sd', 'pow', 'asa', '', 'asa', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `file_info` VALUES ('gg', 'da', 'ss', '1', 'da', '12', 'da', '241', 'ff', 'as', 'ss', 'da', 'a', 'ads', 'sa', 'dsa', 'sda');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(100) NOT NULL,
  `g_ly` varchar(100) NOT NULL,
  `g_vid` varchar(100) NOT NULL,
  `g_img` varchar(100) DEFAULT NULL,
  `g_simg` varchar(100) DEFAULT NULL,
  `g_label` varchar(200) DEFAULT NULL,
  `g_details` varchar(500) DEFAULT NULL,
  `g_state` char(1) NOT NULL,
  `g_num` int(11) NOT NULL,
  `g_unit_price` int(11) DEFAULT NULL,
  `s_i_uuid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('31', 'sss', 'ss', 'sss', 'ss', 'null', 'ss', 'sss', '1', '13', '111', 'null');
INSERT INTO `goods` VALUES ('42', '蛋糕', '江苏-南京', '1234859523', 'ss', '/upload/2e66f2b43-0473-4331-9a6f-430ae005cd11.jpg', '膨化食品', '250g', '0', '195', '50', '5');
INSERT INTO `goods` VALUES ('43', '巧克力饼干（大）', '江苏-南京', '1234859263', 'ss', '/upload/1a26b4eaa-e70b-4f8d-9def-45716d1f7888.jpg', '膨化食品', '300g', '0', '500', '11', '5');
INSERT INTO `goods` VALUES ('44', '雀巢咖啡', '江苏-苏州', '1234859256', 'sgdvxfh', '/upload/1670c21f6-14cf-457e-bad1-e9df5d63288d.jpg', '饮品', '原味', '1', '498', '10', '5');
INSERT INTO `goods` VALUES ('45', '榛子巧克力', '江苏-常州', '1234859256', 'sgdvxfh', '/upload/4dd5c045f-e45f-475b-a699-e9a7589a699d.jpg', '真谛', '150g', '1', '199', '10', '5');
INSERT INTO `goods` VALUES ('46', '乐事（中）', '江苏-南京', '12348592645', 'sgdvxfh', '/upload/78b6460dd-c693-47f6-8c5d-92c14c4268b5.jpg', '膨化食品', '250g', '1', '195', '5', '5');
INSERT INTO `goods` VALUES ('47', '乐事（中）', '江苏-南京', '1234859249', 'sgdvxfh', '/upload/6f9a25388-68b4-46e0-b80e-277f43d5d757.jpg', '膨化食品', '黄瓜味', '1', '294', '5', '1');
INSERT INTO `goods` VALUES ('48', '鸡条', '江苏-南京', '12348592678', 'sgdvxfh', '/upload/5adcaa327-d402-447c-8d95-466e5bc178dd.jpg', '膨化食品', '孜然', '2', '391', '5', '1');
INSERT INTO `goods` VALUES ('49', '蛋糕（小）', '江苏-南京', '1234859243', 'sgdvxfh', '/upload/260b198b0-10e8-42ae-a40b-514e1d87bfbd.jpg', '奶油蛋糕', '草莓味', '1', '398', '10', '1');
INSERT INTO `goods` VALUES ('50', '雀巢咖啡', '江苏-南京', '1234859212', 'sgdvxfh', '/upload/33a5b5cca-948d-46ca-827e-c33f1edc14d8.jpg', '饮品', '200g', '1', '497', '25', '1');
INSERT INTO `goods` VALUES ('53', '巧克力饼干', '江苏-南京', '1234859123', 'sgdvxfh', '/upload/13b52b5b7-e055-4d64-97e1-933e1a32eff8.jpg', '膨化食品', '巧克力味', '2', '500', '11', '1');
INSERT INTO `goods` VALUES ('54', '巧克力饼干', '江苏-南京', '12348594565', 'sgdvxfh', '/upload/110f18f30-b5f9-4587-ac87-ecddcebcad00.jpg', '膨化食品', '250g', '0', '500', '8', '9');
INSERT INTO `goods` VALUES ('55', '蛋糕（小）', '江苏-常州', '1234859459', 'sgdvxfh', '/upload/25255db6f-11ae-49eb-a790-5a21f1c436da.jpg', '蛋糕', '250g', '1', '497', '8', '9');
INSERT INTO `goods` VALUES ('56', '雀巢咖啡', '江苏-常州', '1234859759', 'sgdvxfh', '/upload/3f8326ea1-ee5e-4b87-bbf3-cee5dfeba267.jpg', '饮品', '200g', '2', '500', '15', '9');
INSERT INTO `goods` VALUES ('57', '榛子巧克力', '江苏-常州', '1234859256', 'sgdvxfh', '/upload/44d6a5b77-b7e4-4996-924a-9da1732176df.jpg', '巧克力', '200g', '1', '499', '11', '9');
INSERT INTO `goods` VALUES ('58', '鸡条', '江苏-南京', '1234859489', 'sgdvxfh', '/upload/56888b248-8292-4647-8436-5ced315d4416.jpg', '膨化食品', '200g', '1', '199', '8', '9');
INSERT INTO `goods` VALUES ('59', '乐事（中）', '江苏-常州', '1234859893', 'sgdvxfh', '/upload/6fa7b0d46-3f63-4679-bf5c-b707863dc14b.jpg', '膨化食品', '250g', '2', '500', '8', '9');
INSERT INTO `goods` VALUES ('60', '乐事（大）', '江苏-常州', '1234859756', 'sgdvxfh', '/upload/70424c4f4-f667-4926-8a39-7a6a577cbd5d.jpg', '膨化食品', '250g', '0', '500', '8', '9');
INSERT INTO `goods` VALUES ('61', '乐事（中）', '江苏-常州', '1234859216', 'sgdvxfh', '/upload/65c18ec15-9c2f-4af3-b48f-de65b8c1440c.jpg', '膨化食品', '黄瓜味', '2', '500', '5', '5');
INSERT INTO `goods` VALUES ('62', '蛋糕（小）', '江苏-常州', '1234859264', 'sgdvxfh', '/upload/2d59ede47-b464-4d6a-aacb-b31a332eb611.jpg', '奶油蛋糕', '草莓味', '2', '500', '15', '5');
INSERT INTO `goods` VALUES ('63', '蛋糕（小）', '江苏-常州', '1234859217', 'ss', '/upload/25c67787b-719c-45be-96da-09fa3f152de5.jpg', '奶油蛋糕', '草莓味', '1', '499', '15', '5');
INSERT INTO `goods` VALUES ('64', '鸡条', '江苏-常州', '1234859268', 'sgdvxfh', '/upload/511d9b74a-e0de-4a3e-b73e-3d0d34d8fb0f.jpg', '油炸食品', '孜然', '1', '500', '8', '5');
INSERT INTO `goods` VALUES ('65', '鸡条', '江苏-常州', '1234859268', 'sgdvxfh', '/upload/511d9b74a-e0de-4a3e-b73e-3d0d34d8fb0f.jpg', '油炸食品', '孜然', '0', '499', '8', '5');
INSERT INTO `goods` VALUES ('70', '乐事（中）', '江苏-南京', '1234859266', 'sgdvxfh', '/upload/62e78ec9a-54cc-460b-8ddc-fee2181538da.jpg', '膨化食品', '黄瓜味', '1', '200', '5', '9');
INSERT INTO `goods` VALUES ('71', '巧克力饼干(小）', '江苏-常州', '1234859261', 'sgdvxfh', '/upload/15116917b-038b-4846-b375-19abcad9043b.jpg', '膨化食品', '150g', '1', '500', '5', '9');
INSERT INTO `goods` VALUES ('72', '乐事（中）', '江苏-南京', '1234859265', 'sgdvxfh', '/upload/7034e304b-3fee-4062-8e24-ddd34b298bbd.jpg', '膨化食品', '500g', '1', '500', '11', '9');
INSERT INTO `goods` VALUES ('73', '蛋糕（中）', '江苏-泰州', '1234859267', 'sgdvxfh', '/upload/21cb950bd-7ee3-484b-8eb0-7155e34be6ca.jpg', '奶油蛋糕', '草莓味', '1', '200', '30', '9');
INSERT INTO `goods` VALUES ('74', '李子园', '江苏-南京', '1234859272', 'sgdvxfh', '/upload/liziyuancaomeiweief362ba9-a5fc-4b86-911e-ef6ef0a47521.jpg', '饮品', '草莓味', '1', '500', '4', '9');
INSERT INTO `goods` VALUES ('75', '李子园', '江苏-南京', '1234859215', 'sgdvxfh', '/upload/liziyuanhamigua9464ae93-d837-40e1-b8e3-7c29ca60620e.jpg', '饮品', '哈密瓜味', '1', '500', '4', '9');
INSERT INTO `goods` VALUES ('76', '李子园', '江苏-南京', '1234859245', 'sgdvxfh', '/upload/liziyuanyuanweic60b9638-398a-4a48-8165-315d9a7f74fb.jpg', '饮品', '原味', '1', '500', '4', '9');
INSERT INTO `goods` VALUES ('77', '耳机', '江苏-常州', '1234859246', 'sgdvxfh', '/upload/erji51291a89-c8f7-46a5-8f31-5dd56e6fcf26.jpg', '入耳式', '安卓/iPone 6/iPone6s', '1', '498', '35', '9');
INSERT INTO `goods` VALUES ('78', '帽子', '北京', '1234859289', 'sgdvxfh', '/upload/maozi6b864835-9c16-4960-b4a6-800699669400.jpg', '日用品', '鸭舌帽', '1', '500', '25', '9');
INSERT INTO `goods` VALUES ('79', '怡宝', '上海', '1234859248', 'sgdvxfh', '/upload/yibao3e29c1db-b01a-4b49-8c6a-fa209286326a.jpg', '矿泉水', '555ml', '1', '500', '2', '9');
INSERT INTO `goods` VALUES ('80', '鞋套', '上海', '1234859214', 'sgdvxfh', '/upload/xietao399bce19-6d54-4a09-bfdb-50a3d8ece2e6.jpg', '日用品', '防水', '1', '500', '5', '9');
INSERT INTO `goods` VALUES ('81', '安慕希', '江苏-南京', '1234859298', 'sgdvxfh', '/upload/anmuxifed9f816-d6d7-481b-bf1e-b4744c96c4b2.jpg', '牛奶', '300ml', '1', '500', '5', '9');
INSERT INTO `goods` VALUES ('82', '纯甄', '江苏-常州', '1234859226', 'sgdvxfh', '/upload/chunzhen455eb239-e89c-42ba-afe4-a249d99fd06b.jpg', '牛奶', '300ml', '1', '200', '5', '9');
INSERT INTO `goods` VALUES ('83', '李子园', '上海', '1234859277', 'sgdvxfh', '/upload/liziyuancaomeiwei96bd5215-3b42-455e-9eeb-c61672175e76.jpg', '饮品', '草莓味', '1', '499', '4', '5');
INSERT INTO `goods` VALUES ('84', '李子园', '上海', '1234859211', 'sgdvxfh', '/upload/liziyuanhamigua885efb18-7c2d-46a0-bc14-d63fd577269d.jpg', '饮品', '哈密瓜味', '1', '498', '4', '5');
INSERT INTO `goods` VALUES ('85', '怡宝', '上海', '1234859299', 'sgdvxfh', '/upload/yibao7e3fad13-6827-4af0-8a1c-24bdce275942.jpg', '矿泉水', '500ml', '1', '200', '2', '5');
INSERT INTO `goods` VALUES ('86', '李子园', '上海', '1234859244', 'sgdvxfh', '/upload/liziyuanyuanweidb86fb66-40f7-463a-8969-134a996ec952.jpg', '饮品', '原味', '1', '500', '4', '5');
INSERT INTO `goods` VALUES ('89', '蛋糕（小）', '江苏-南京', '1234859246', 'sgdvxfh', '/upload/2b8c8734e-a308-4c34-b4f4-aebc4298e916.jpg', '奶油蛋糕', '草莓味', '0', '500', '20', '5');
INSERT INTO `goods` VALUES ('91', '草莓蛋糕', '南京', 'txm', 'tupian', '/upload/203cf03f6-454f-4a4a-b1d0-df2967b4bf5f.jpg', '奶油', '50g', '0', '500', '15', '1');
INSERT INTO `goods` VALUES ('92', '薯片', '南京', '1234567894', 'tupian', '/upload/60018e2ca-a5cf-4ffb-b825-231039207f0b.jpg', '油炸', '黄瓜味，200g', '1', '500', '5', '1');
INSERT INTO `goods` VALUES ('93', '饼干', '南京', 'txm', 'tupian', '/upload/1670c21f6-14cf-457e-bad1-e9df5d63288d.jpg', '油炸', '200g', '1', '500', '5', 'null');
INSERT INTO `goods` VALUES ('95', '小风扇', '上海', '1123456897', 'tupian', '/upload/fengshane0594d11-1648-477c-9a41-fb531cd691f2.jpg', '生活用品', '5号电池', '1', '400', '15', '1');
INSERT INTO `goods` VALUES ('96', '纯甄牛奶', '福建', '1234567896', 'tupian', '/upload/chunzhenb266400e-174f-43da-b2ca-bf36d4eddac3.jpg', '乳制品', '150g', '1', '500', '5', '1');
INSERT INTO `goods` VALUES ('97', '帽子', '上海', '12345678969', 'tupian', '/upload/maozi2688ce53-5e7d-47bf-98da-1257d0ce358d.jpg', '生活用品', '黑白条纹', '1', '500', '15', '5');
INSERT INTO `goods` VALUES ('98', '耳机', '南京', '1123456894', 'tupian', '/upload/erjibef612bf-8afb-42f1-8d36-7cd2bac30a8c.jpg', '电子产品', '黑红', '1', '200', '20', '5');
INSERT INTO `goods` VALUES ('99', '耳机', '上海', '1234567899', 'tupian', '/upload/erji33e18c37-ea0d-4968-ad81-785e5eb51528.jpg', '电子产品', '红黑', '2', '200', '30', '5');
INSERT INTO `goods` VALUES ('100', '薯片', '上海', '1123456897', 'tupian', '/upload/463a7b754-e63b-4783-a499-d964328cbe13.jpg', '油炸', '孜然，100g', '2', '500', '10', '5');
INSERT INTO `goods` VALUES ('101', '怡宝', '南京', '1123456897', 'tupian', '/upload/yibao8cef8f4a-9919-43c0-b1e7-47832ee5b139.jpg', '生活用品', '矿泉水', '0', '200', '2', '5');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `uuid` varchar(32) NOT NULL,
  `user_uuid` varchar(32) NOT NULL,
  `g_id` int(11) NOT NULL,
  `g_num` int(11) NOT NULL,
  `g_unit_price` int(11) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('0321f63583a54cfd812500328b8e2980', '001', '55', '1', '8');
INSERT INTO `order` VALUES ('0357eb65dd70499fb4e4ffcdf6d3da08', '2010150103', '47', '1', '5');
INSERT INTO `order` VALUES ('07882cab77ba48c597a77eafa364f448', '001', '52', '1', '8');
INSERT INTO `order` VALUES ('0833ae60a3424a279bea89c9f8acf091', '2010150111', '68', '1', '15');
INSERT INTO `order` VALUES ('0abe29c3057b43f5896495d236c066c9', '2010150104', '18', '1', '2');
INSERT INTO `order` VALUES ('0f27c0c52e034852a6b49b6a8310f258', '001', '55', '1', '8');
INSERT INTO `order` VALUES ('10738ea5029c4fc78521e414432334fa', '2010150127', '1', '1', '5');
INSERT INTO `order` VALUES ('129db17548b74f7f94f7fbacd52af82f', '2010150104', '21', '1', '3');
INSERT INTO `order` VALUES ('19080d20b9264f1daeedbf2ba16c132b', '2010150127', '1', '1', '5');
INSERT INTO `order` VALUES ('1ac070d9e71f432ab2bd0ad9b02d9ff6', '2010150111', '49', '1', '10');
INSERT INTO `order` VALUES ('215a223e7a2d4a08b05322b2d263f6ce', '2010150101', '1', '1', '5');
INSERT INTO `order` VALUES ('233e4c53e7944b23ab04e54080944434', '2010150103', '58', '1', '8');
INSERT INTO `order` VALUES ('238e8bc2f66b4d9689be706723b206f4', '001', '51', '1', '8');
INSERT INTO `order` VALUES ('27f19d3713954efab405d092b8808f20', '2010150111', '47', '1', '5');
INSERT INTO `order` VALUES ('2e1c81c146844aa986861f12515de1b3', '001', '3', '1', '4');
INSERT INTO `order` VALUES ('303e00545f2b4b86b1c9e36959cd4358', '2010150104', '48', '1', '5');
INSERT INTO `order` VALUES ('342a925e0b1344d1b1c739441caf1d77', '2010150102', '1', '1', '5');
INSERT INTO `order` VALUES ('34322096dff94e3491844b4d1d4150c5', '001', '44', '1', '8');
INSERT INTO `order` VALUES ('35e92079c15041dd9c0e1dc37d05c632', '2010150103', '51', '1', '8');
INSERT INTO `order` VALUES ('388c011747824ab5a052da49c9006b2f', '001', '50', '1', '25');
INSERT INTO `order` VALUES ('3bf6f4172384448991cf5e81894f8d74', '2010150110', '48', '1', '5');
INSERT INTO `order` VALUES ('40908aed6920485eab0c55de00b52ece', '001', '63', '1', '15');
INSERT INTO `order` VALUES ('423baaf680f2428598a08dec70c30d57', '2010150211', '21', '1', '3');
INSERT INTO `order` VALUES ('4540b3bae70a4e00a98d7f178d8e1550', '2010150220', '50', '1', '25');
INSERT INTO `order` VALUES ('48bdc3d1496e42e89cbc3c6bbcb9904d', '2010150104', '51', '1', '8');
INSERT INTO `order` VALUES ('4fcf6f9b4f0345479060ce102a1d5679', '2010150103', '84', '1', '4');
INSERT INTO `order` VALUES ('5036865038e84e06a6cd78b16ef82d3c', '001', '3', '1', '4');
INSERT INTO `order` VALUES ('5064199dfde94b02ac57f6ed6f6302e0', '2010150103', '47', '1', '5');
INSERT INTO `order` VALUES ('50edda8c469d47aa8be208d7df9da921', '001', '77', '1', '35');
INSERT INTO `order` VALUES ('56071b45a3f94c9ea59cf9e09dbfacb7', '2010150126', '1', '10', '5');
INSERT INTO `order` VALUES ('592b815899534adea2c050607fb7d067', '2010150126', '1', '90', '5');
INSERT INTO `order` VALUES ('5ad9403b5e9145d5ace391a47788640a', '001', '19', '1', '4');
INSERT INTO `order` VALUES ('5c0b2c4df91448b2a95a2051489e27a6', '2010150110', '87', '1', '30');
INSERT INTO `order` VALUES ('653cbedbf04d49e4b5455fbd795f28ed', '2010150126', '19', '1', '4');
INSERT INTO `order` VALUES ('66f5b0d83d204015aaad552d49a7769d', '001', '21', '1', '3');
INSERT INTO `order` VALUES ('6b0badf5a1fd4117a94832244732fbb7', '2010150110', '52', '1', '8');
INSERT INTO `order` VALUES ('6bf69a7945ac45ddbcf00b8dea516f5c', '2010150110', '77', '1', '35');
INSERT INTO `order` VALUES ('70826a5c02f446e59b872594fb8b026d', '001', '3', '1', '4');
INSERT INTO `order` VALUES ('735da5f56af14e178d8dafefa62a4ba8', '2010150220', '47', '1', '5');
INSERT INTO `order` VALUES ('74bbbd96bed44fa68e47bc86c55cf56b', '2010150110', '57', '1', '11');
INSERT INTO `order` VALUES ('74d37837c0a74798875025606b70f32f', '001', '87', '1', '30');
INSERT INTO `order` VALUES ('7980938f00e44fcc99babd3f052aaced', '2010150126', '21', '3', '3');
INSERT INTO `order` VALUES ('7a70e7113b9e480dbc8c9d6f18574248', '2010150220', '21', '1', '3');
INSERT INTO `order` VALUES ('802975278d93458594f14f44d1ae9308', '2010150103', '45', '1', '10');
INSERT INTO `order` VALUES ('8c735f98a6e44b38867ef8692ddc7d06', '2010150102', '47', '1', '5');
INSERT INTO `order` VALUES ('929738ee06054e1c812c06ee3ded3394', '001', '3', '1', '4');
INSERT INTO `order` VALUES ('96ca5de41e5c4e7f9d344f7c0b58eb9d', '001', '51', '5', '8');
INSERT INTO `order` VALUES ('a3f3420ec2184e8fa69886cf10db8bbb', '001', '65', '1', '8');
INSERT INTO `order` VALUES ('a4d8542263084c0698e18cef31292374', '001', '51', '5', '8');
INSERT INTO `order` VALUES ('b1fdd36eb44747118aed518923b3dc1a', '2010150110', '55', '1', '8');
INSERT INTO `order` VALUES ('b236c280af7346d9acb88061337bf17f', '001', '83', '1', '4');
INSERT INTO `order` VALUES ('b51e267298944c4cba7c9328db1f7821', '001', '46', '5', '5');
INSERT INTO `order` VALUES ('b5545d9540bd4f318a7cbb6d1dfb169c', '2010150110', '84', '1', '4');
INSERT INTO `order` VALUES ('b76dbf18985e4ae7851de82329679805', '2010150211', '26', '1', '4');
INSERT INTO `order` VALUES ('bd78bf5e03b145719d6f293313eb3712', '2010150103', '6', '50', '2');
INSERT INTO `order` VALUES ('c1f7d3d9d11444a28ef0a99525b07bde', '2010150110', '41', '1', '8');
INSERT INTO `order` VALUES ('c353244d05ad4c0ca86db549a6ac51fc', '2010150126', '1', '90', '5');
INSERT INTO `order` VALUES ('c7efdda38acf4e25896fe393bea2894e', '1932203', '47', '1', '5');
INSERT INTO `order` VALUES ('c977e5c6968c48c480a20419f72ab732', '001', '68', '100', '15');
INSERT INTO `order` VALUES ('cbc65461c7ce416c9ce739a50c79eccc', '001', '48', '5', '5');
INSERT INTO `order` VALUES ('cbed9460e4d343ac8517a60f9661f4ea', '001', '6', '50', '2');
INSERT INTO `order` VALUES ('cbfe3e6bc42b4ddc9dc910d30bde2c8b', '1932203', '49', '1', '10');
INSERT INTO `order` VALUES ('d3fd62cb049f451c804cd27fcb440f61', '2010150102', '11', '1', '4');
INSERT INTO `order` VALUES ('d70e120478dd4733b8be262315074be1', '001', '7', '500', '3');
INSERT INTO `order` VALUES ('dbae073ec5544c96a73d05fad7b6f659', '2010150111', '50', '1', '25');
INSERT INTO `order` VALUES ('de9f0697790f42bbb958776dac25c52d', '001', '1', '1', '5');
INSERT INTO `order` VALUES ('e48243cc498e455287a8636391e98083', '2010150110', '51', '1', '8');
INSERT INTO `order` VALUES ('eac38629220544d6b671f923e786358f', '2010150127', '1', '1', '5');
INSERT INTO `order` VALUES ('eef57d54350545e5bd1de80c97b29696', '2010150103', '48', '1', '5');
INSERT INTO `order` VALUES ('efc809ea89794e65b622fbd5afd96e95', '001', '42', '5', '50');
INSERT INTO `order` VALUES ('f3ae0590712749e8a02acdff7804b376', '2010150111', '48', '1', '5');
INSERT INTO `order` VALUES ('f4199e04e9b74472858853e03bd884ae', '2010150103', '44', '1', '8');
INSERT INTO `order` VALUES ('f55182d9bafe427084099b727f460b22', '2010150126', '1', '100', '5');

-- ----------------------------
-- Table structure for `shop_info`
-- ----------------------------
DROP TABLE IF EXISTS `shop_info`;
CREATE TABLE `shop_info` (
  `uuid` varchar(32) NOT NULL,
  `shop_name` varchar(16) NOT NULL,
  `show_addr` varchar(50) NOT NULL,
  `state` char(1) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_info
-- ----------------------------
INSERT INTO `shop_info` VALUES ('1', '西苑商店', '南京', '1');
INSERT INTO `shop_info` VALUES ('5', '东苑商店', '南京', '1');
INSERT INTO `shop_info` VALUES ('9', '南苑商店', '南京', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'dsd', '0911', '15251709736', '江苏-南京');
INSERT INTO `t_user` VALUES ('2', 'ly', '0805', '18752017066', '江苏-南京');
INSERT INTO `t_user` VALUES ('3', '骆云', '0805', '18752017066', '江苏-南京');
INSERT INTO `t_user` VALUES ('4', '展思民', '0101', null, null);
INSERT INTO `t_user` VALUES ('5', 'ylc', '0000', null, null);
INSERT INTO `t_user` VALUES ('6', 'wsy', '1111', null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uuid` varchar(32) NOT NULL,
  `id` varchar(32) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `state` char(1) NOT NULL,
  `type` char(1) NOT NULL,
  `auth_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `auth_id` (`auth_id`),
  CONSTRAINT `auth_id` FOREIGN KEY (`auth_id`) REFERENCES `authority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '18752016299', '1', '1', '1', '1');
INSERT INTO `user` VALUES ('10', '2010150104', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('11', '2010150211', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('12', '2010150220', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('13', '2010150221', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('19', '2010150110', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('2', '2010150127', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('20', '2010150111', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('21', '2010150128', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('22', '2010150125', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('23', '1932203', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('3', '001', '1', '1', '2', '2');
INSERT INTO `user` VALUES ('4', '2010150126', '1', '1', '1', '3');
INSERT INTO `user` VALUES ('5', '18752017066', '1', '1', '1', '1');
INSERT INTO `user` VALUES ('6', '2010150103', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('7', '2010150101', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('8', '2010150102', '1', '1', '2', '3');
INSERT INTO `user` VALUES ('9', '18362923378', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `user_stu`
-- ----------------------------
DROP TABLE IF EXISTS `user_stu`;
CREATE TABLE `user_stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(32) NOT NULL,
  `name` varchar(10) NOT NULL,
  `class` varchar(32) NOT NULL,
  `address` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_stu
-- ----------------------------
INSERT INTO `user_stu` VALUES ('1', '2010150127', 'zsm', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('3', '2010150126', 'das', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('15', '2010150103', 'ly', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('16', '2010150101', 'cxf', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('17', '2010150102', 'cc', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('18', '2010150104', 'sjy', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('19', '2010150211', 'ch', '信科1502', '南京');
INSERT INTO `user_stu` VALUES ('21', '2010150220', '王盛羽', '信科1502', '南京');
INSERT INTO `user_stu` VALUES ('22', '2010150221', '张三', '信科1502', '南京');
INSERT INTO `user_stu` VALUES ('24', '2010150106', 'æäº', 'ä¿¡ç§1501', 'åäº¬');
INSERT INTO `user_stu` VALUES ('25', '2010150107', 'æå­', 'ä¿¡ç§1501', 'åäº¬');
INSERT INTO `user_stu` VALUES ('26', '2010150108', 'çäº', 'ä¿¡ç§1501', 'åäº¬');
INSERT INTO `user_stu` VALUES ('27', '2010150109', 'å¼ å®æ¬£', 'ä¿¡ç§1501', 'åäº¬');
INSERT INTO `user_stu` VALUES ('28', '2010150110', '程晨', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('29', '2010150111', '文静', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('30', '2010150128', '张佳敏', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('31', '2010150125', '文静1', '信科1501', '南京');
INSERT INTO `user_stu` VALUES ('32', '1932203', 'xwp', '1', '222');
