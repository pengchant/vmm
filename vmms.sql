/*
Navicat MySQL Data Transfer

Source Server         : database
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : vmms

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-02-13 16:48:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accessoryhis
-- ----------------------------
DROP TABLE IF EXISTS `accessoryhis`;
CREATE TABLE `accessoryhis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipients` char(20) DEFAULT NULL,
  `recijobnum` char(20) DEFAULT NULL,
  `contactinfo` char(20) DEFAULT NULL,
  `reciamount` double DEFAULT NULL,
  `recitime` datetime DEFAULT NULL,
  `partusedid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partusedid` (`partusedid`),
  CONSTRAINT `accessoryhis_ibfk_1` FOREIGN KEY (`partusedid`) REFERENCES `partused` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accessoryhis
-- ----------------------------

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountnumber` char(20) DEFAULT NULL,
  `passwords` char(20) DEFAULT NULL,
  `accountflag` char(10) DEFAULT NULL,
  `userinfoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userinfoid` (`userinfoid`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`userinfoid`) REFERENCES `userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '20130501140', 'xzit001', '1', '1');
INSERT INTO `account` VALUES ('2', '20130501141', 'xzit001', '1', '2');
INSERT INTO `account` VALUES ('3', '20130501142', 'xzit001', '1', '3');
INSERT INTO `account` VALUES ('4', '20130501143', 'xzit001', '1', '4');
INSERT INTO `account` VALUES ('5', '20130501144', 'xzit001', '1', '5');

-- ----------------------------
-- Table structure for arrears
-- ----------------------------
DROP TABLE IF EXISTS `arrears`;
CREATE TABLE `arrears` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currentamount` double DEFAULT NULL,
  `lastsettletime` datetime DEFAULT NULL,
  `ordersid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordersid` (`ordersid`),
  CONSTRAINT `arrears_ibfk_1` FOREIGN KEY (`ordersid`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of arrears
-- ----------------------------

-- ----------------------------
-- Table structure for balancesheet
-- ----------------------------
DROP TABLE IF EXISTS `balancesheet`;
CREATE TABLE `balancesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settlementdate` datetime DEFAULT NULL,
  `totalamount` double DEFAULT NULL,
  `settler` char(20) DEFAULT NULL,
  `ordersid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordersid` (`ordersid`),
  CONSTRAINT `balancesheet_ibfk_1` FOREIGN KEY (`ordersid`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of balancesheet
-- ----------------------------

-- ----------------------------
-- Table structure for bustatus
-- ----------------------------
DROP TABLE IF EXISTS `bustatus`;
CREATE TABLE `bustatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicecode` char(20) DEFAULT NULL,
  `statename` varchar(40) DEFAULT NULL,
  `remarks` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bustatus
-- ----------------------------
INSERT INTO `bustatus` VALUES ('1', 'xz001', '已下单', '1');
INSERT INTO `bustatus` VALUES ('2', 'xz002', '维修中', '1');
INSERT INTO `bustatus` VALUES ('3', 'xz003', '维修待质检', '1');
INSERT INTO `bustatus` VALUES ('4', 'xz004', '质检中', '1');
INSERT INTO `bustatus` VALUES ('5', 'xz005', '质检待提车', '1');
INSERT INTO `bustatus` VALUES ('6', 'xz006', '已提车', '1');

-- ----------------------------
-- Table structure for consumsettle
-- ----------------------------
DROP TABLE IF EXISTS `consumsettle`;
CREATE TABLE `consumsettle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` char(30) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `customername` char(20) DEFAULT NULL,
  `carbrand` char(20) DEFAULT NULL,
  `conntactinfo` char(20) DEFAULT NULL,
  `contactadd` varchar(100) DEFAULT NULL,
  `consumptotal` double DEFAULT NULL,
  `offers` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `manager` char(20) DEFAULT NULL,
  `mananum` char(20) DEFAULT NULL,
  `settletime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumsettle
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numbering` char(20) DEFAULT NULL,
  `mailbox` char(80) DEFAULT NULL,
  `contactinfo` varchar(100) DEFAULT NULL,
  `contactadd` varchar(100) DEFAULT NULL,
  `idcard` char(18) DEFAULT NULL,
  `customerflag` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '邓建都', 'dntchenpeng@163.com', '18796258891', '江苏省南通市江安镇江安中学', '1221324343534', '1');
INSERT INTO `customer` VALUES ('2', '周云', '12323@132.com', '232343432', '江苏省无锡市怀古豪庭8座8楼', '12323234234', '1');
INSERT INTO `customer` VALUES ('3', '张三', 'djsk@1232.com', '21323234', '浙江省温州市哈哈村', '1233324432', '1');
INSERT INTO `customer` VALUES ('4', '李四', 'what@123.com', '213233434', '湖北省荆州市沧浪路12号', '23234354356', '1');
INSERT INTO `customer` VALUES ('5', '王五', 'heihe@dsa.com', '12332343', '台湾省日月潭2323', '213234342', '1');
INSERT INTO `customer` VALUES ('6', '赵六', '23234@qq.com', '213233454', '重庆市是打发', '23534342223', '1');
INSERT INTO `customer` VALUES ('7', '122121', '32132@111.com', '321321321', '321321', '3212324342423213', '1');
INSERT INTO `customer` VALUES ('8', '测试的', 'hello@11.com', '1232323', '232321323', '3232454325432', '1');
INSERT INTO `customer` VALUES ('9', '陈', '1212@1123.com', '1212', '12', '32323435434', '1');
INSERT INTO `customer` VALUES ('10', '孔磊', 'konglei@xzit.com', '13961826751', '江苏省徐州市徐州工程学院', '3123214321', '1');
INSERT INTO `customer` VALUES ('11', '程红岭', 'chl@xzit.com', '1323', '江苏省徐州市信电工程学院', '1232343435', '1');
INSERT INTO `customer` VALUES ('12', 'LD', 'LD@DOUBI.COM', '232324', '江苏省无锡市怀古豪庭8座8楼', '1323423434', '1');
INSERT INTO `customer` VALUES ('13', '111', '111@11.com', '111', '111', '11', '1');
INSERT INTO `customer` VALUES ('14', '3333', '333@111.com', '111', '111', '3232', '1');
INSERT INTO `customer` VALUES ('15', '222', '222@dsa.com', '123534', 'fjkaslf', '32435', '1');
INSERT INTO `customer` VALUES ('16', 'fdsa', 'fdsa@dsa.com', '234234', '43', '`2343434', '1');
INSERT INTO `customer` VALUES ('17', 'dsa', 'sss@dsa.com', '2222', '23', '234234', '1');
INSERT INTO `customer` VALUES ('18', '习近平', 'xjp@xzit.com', '1112332', '山东省菏泽市', '213232344', '1');
INSERT INTO `customer` VALUES ('19', '胡局新', 'hjx@xzit.com', '13212123', '江苏省徐州市徐州工程学院', '23233424', '1');
INSERT INTO `customer` VALUES ('20', '简书', 'jianshu@xzit.com', '121212132', '江苏省无锡市', '12121212212', '1');
INSERT INTO `customer` VALUES ('21', '徐敏', 'xuming@xzit.com', '12312323', '江苏无锡', '323234153215', '1');
INSERT INTO `customer` VALUES ('22', '成龙', 'cl@xzit.com', '187962589', '上海黄浦', '21323243415432', '1');
INSERT INTO `customer` VALUES ('23', '逗比', 'doubi@xzit.com', '13961826751', '江苏省无锡市槐古豪庭8座8楼', '1232323345234', '1');
INSERT INTO `customer` VALUES ('24', '小龙女', 'xln@xzit.com', '21323', '江苏无锡', '23254325432', '1');

-- ----------------------------
-- Table structure for customervisithis
-- ----------------------------
DROP TABLE IF EXISTS `customervisithis`;
CREATE TABLE `customervisithis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` char(20) DEFAULT NULL,
  `contactinfo` char(20) DEFAULT NULL,
  `visittime` datetime DEFAULT NULL,
  `servicecontent` varchar(200) DEFAULT NULL,
  `isnew` smallint(6) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customervisithis
-- ----------------------------
INSERT INTO `customervisithis` VALUES ('1', '徐敏', '12312323', '2017-02-09 08:39:58', '汽车美容,装潢,汽车检测与维修,汽车电子', '0', '21');
INSERT INTO `customervisithis` VALUES ('2', '成龙', '187962589', '2017-02-09 09:05:35', '装潢,汽车检测与维修,汽车电子', '0', '22');
INSERT INTO `customervisithis` VALUES ('3', '简书', '121212132', '2017-02-09 09:11:00', '汽车美容,装潢,汽车检测与维修', '0', '20');
INSERT INTO `customervisithis` VALUES ('4', '小龙女', '21323', '2017-02-09 09:16:38', '汽车美容,装潢,汽车检测与维修', '1', '24');
INSERT INTO `customervisithis` VALUES ('5', '习近平', '1112332', '2017-02-09 09:24:40', null, '0', '18');
INSERT INTO `customervisithis` VALUES ('6', '习近平', '1112332', '2017-02-09 14:35:57', '汽车美容,装潢,汽车检测与维修', '0', '18');
INSERT INTO `customervisithis` VALUES ('7', '小龙女', '21323', '2017-02-09 14:53:58', '汽车美容,装潢,汽车检测与维修', '0', '24');
INSERT INTO `customervisithis` VALUES ('8', '孔磊', '13961826751', '2017-02-09 16:27:18', '汽车检测与维修', '0', '10');
INSERT INTO `customervisithis` VALUES ('9', '习近平', '1112332', '2017-02-10 08:29:29', '汽车美容,装潢', '0', '18');
INSERT INTO `customervisithis` VALUES ('10', 'fdsa', '234234', '2017-02-10 08:51:44', '汽车美容,装潢,汽车保养', '0', '16');
INSERT INTO `customervisithis` VALUES ('11', '胡局新', '13212123', '2017-02-10 08:52:16', null, '0', '19');
INSERT INTO `customervisithis` VALUES ('12', '测试的', '1232323', '2017-02-10 08:53:45', '汽车美容,汽车检测与维修', '0', '8');
INSERT INTO `customervisithis` VALUES ('13', '测试的', '1232323', '2017-02-10 08:54:55', null, '0', '8');
INSERT INTO `customervisithis` VALUES ('14', '王五', '12332343', '2017-02-13 08:15:49', '汽车检测与维修,汽车电子', '0', '5');

-- ----------------------------
-- Table structure for mainitem
-- ----------------------------
DROP TABLE IF EXISTS `mainitem`;
CREATE TABLE `mainitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mainnumbering` char(20) DEFAULT NULL,
  `projName` varchar(100) DEFAULT NULL,
  `projcategoryid` int(11) DEFAULT NULL,
  `itemprice` double DEFAULT NULL,
  `mainflag` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projcategoryid` (`projcategoryid`),
  CONSTRAINT `mainitem_ibfk_1` FOREIGN KEY (`projcategoryid`) REFERENCES `projcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mainitem
-- ----------------------------
INSERT INTO `mainitem` VALUES ('1', '1', '检修分电器', '3', '1213', '1');
INSERT INTO `mainitem` VALUES ('2', '2', '更换点火圈', '3', '12', '1');
INSERT INTO `mainitem` VALUES ('3', '3', '清晰化油器', '2', '323', '1');
INSERT INTO `mainitem` VALUES ('4', '4', '更换油量传感器', '1', '13123', '1');
INSERT INTO `mainitem` VALUES ('5', '5', '更换汽油泵', '4', '123', '1');
INSERT INTO `mainitem` VALUES ('6', '6', '更换曲轴前油封', '5', '123', '1');
INSERT INTO `mainitem` VALUES ('7', '7', '更换汽缸垫', '4', '232', '1');
INSERT INTO `mainitem` VALUES ('8', '8', '更换正时皮带', '5', '1232', '1');
INSERT INTO `mainitem` VALUES ('9', '9', '更换飞轮齿圈', '3', '213', '1');
INSERT INTO `mainitem` VALUES ('10', '10', '更换上下水管', '2', '222', '1');
INSERT INTO `mainitem` VALUES ('11', '11', '拆装水箱', '1', '877', '1');
INSERT INTO `mainitem` VALUES ('12', '12', '清洗水箱', '3', '123', '1');
INSERT INTO `mainitem` VALUES ('13', '13', '更换风扇叶', '4', '112', '1');
INSERT INTO `mainitem` VALUES ('14', '14', '更换水温传感器', '3', '121', '1');

-- ----------------------------
-- Table structure for mainprojreg
-- ----------------------------
DROP TABLE IF EXISTS `mainprojreg`;
CREATE TABLE `mainprojreg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordersid` int(11) DEFAULT NULL,
  `mainitemid` int(11) DEFAULT NULL,
  `regperson` char(20) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `spenttime` double DEFAULT NULL,
  `mainstatus` char(10) DEFAULT NULL,
  `haspassed` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordersid` (`ordersid`),
  KEY `mainitemid` (`mainitemid`),
  CONSTRAINT `mainprojreg_ibfk_1` FOREIGN KEY (`ordersid`) REFERENCES `orders` (`id`),
  CONSTRAINT `mainprojreg_ibfk_2` FOREIGN KEY (`mainitemid`) REFERENCES `mainitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mainprojreg
-- ----------------------------
INSERT INTO `mainprojreg` VALUES ('2', '3', '4', '1', '2017-02-13 08:14:58', '23', '已登记', '0');
INSERT INTO `mainprojreg` VALUES ('3', '3', '3', '1', '2017-02-13 08:46:24', '12121', '已登记', '0');
INSERT INTO `mainprojreg` VALUES ('5', '14', '3', '1', '2017-02-13 08:52:25', '666', '已登记', '0');
INSERT INTO `mainprojreg` VALUES ('6', '14', '8', '1', '2017-02-13 08:52:34', '655', '已登记', '0');
INSERT INTO `mainprojreg` VALUES ('7', '14', '4', '1', '2017-02-13 09:08:41', '433', '已登记', '0');
INSERT INTO `mainprojreg` VALUES ('8', '4', '2', '1', '2017-02-13 10:38:02', '1231', '已登记', '0');
INSERT INTO `mainprojreg` VALUES ('9', '4', '3', '1', '2017-02-13 10:38:08', '1213', '已登记', '0');
INSERT INTO `mainprojreg` VALUES ('11', '9', '1', '1', '2017-02-13 16:47:17', '444', '已登记', '0');
INSERT INTO `mainprojreg` VALUES ('12', '9', '4', '1', '2017-02-13 16:47:24', '666', '已登记', '0');
INSERT INTO `mainprojreg` VALUES ('13', '9', '8', '1', '2017-02-13 16:47:32', '999', '已登记', '0');

-- ----------------------------
-- Table structure for materhis
-- ----------------------------
DROP TABLE IF EXISTS `materhis`;
CREATE TABLE `materhis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` char(30) DEFAULT NULL,
  `customername` char(20) DEFAULT NULL,
  `carname` char(50) DEFAULT NULL,
  `mateialname` varchar(100) DEFAULT NULL,
  `materialnum` double DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  `sum` double DEFAULT NULL,
  `checkintime` datetime DEFAULT NULL,
  `recipients` char(20) DEFAULT NULL,
  `receiver` char(20) DEFAULT NULL,
  `rectime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of materhis
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numbering` char(30) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `vehicleid` int(11) DEFAULT NULL,
  `miles` double DEFAULT NULL,
  `ifused` smallint(6) DEFAULT NULL,
  `ifcheckspare` smallint(6) DEFAULT NULL,
  `ifclean` smallint(6) DEFAULT NULL,
  `esdeliverytime` datetime DEFAULT NULL,
  `warrcontent` varchar(200) DEFAULT NULL,
  `caritems` varchar(200) DEFAULT NULL,
  `valuableobj` varchar(200) DEFAULT NULL,
  `ownerdescribtion` text,
  `hassettled` smallint(6) DEFAULT NULL,
  `hascompleted` smallint(6) DEFAULT NULL,
  `completedate` smallint(6) DEFAULT NULL,
  `settlecompdate` datetime DEFAULT NULL,
  `bustatusid` int(11) DEFAULT NULL,
  `paystatusid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`customerid`),
  KEY `vehicleid` (`vehicleid`),
  KEY `bustatusid` (`bustatusid`),
  KEY `paystatusid` (`paystatusid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`vehicleid`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`bustatusid`) REFERENCES `bustatus` (`id`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`paystatusid`) REFERENCES `paystatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '121321321321', '21', '23', '1222', '1', '0', '0', '2017-02-09 02:03:00', '汽车美容,装潢,汽车检测与维修,汽车电子', '随车物品', '贵重物品', '故障情况', null, null, null, null, null, null);
INSERT INTO `orders` VALUES ('2', 'JhNc2CNAX6xe', '22', '24', '1111', '0', '0', '0', '2017-02-09 02:03:00', '装潢,汽车检测与维修,汽车电子', '111', '111', '111', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('3', 'DjodugWvFrqL', '20', '22', '1212', '0', '0', '0', '2017-02-05 15:03:00', '汽车美容,装潢,汽车检测与维修', '32131', '31231', '321321', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('4', 'wE31o2Av2Ngh', '24', '26', '2123', '1', '0', '1', '2017-02-09 02:03:00', '汽车美容,装潢,汽车检测与维修', '12112', '中华烟，啤酒一箱', '故障情况', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('5', 'CpuloCioDYUw', '18', '20', '121', '0', '0', '0', '2017-02-09 02:03:00', null, '321', '321', '32132', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('6', 'TAOK0mSEiErg', '18', '20', '12121', '1', '1', '0', '2017-02-07 02:03:00', '汽车美容,装潢,汽车检测与维修', 'what?', '贵重物品', '故障', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('7', 'VHpIsrlInETt', '24', '26', '12121', '0', '0', '0', '2017-02-09 02:03:00', '汽车美容,装潢,汽车检测与维修', '2121', '2121', '2121', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('8', 'VFLeFS3Ddt7D', '10', '13', '332', '1', '1', '1', '2017-02-09 02:03:00', '汽车检测与维修', '我屮艸芔茻', '呵呵', '这是故障啊  。。。。', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('9', 'H2KtQdEAkQUm', '18', '20', '1212', '0', '0', '0', '2017-02-10 02:03:00', '汽车美容,装潢', '2121', '2121', '2121', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('10', 'RcRlCNs0TuBC', '16', '18', '22121', '1', '1', '0', '2017-02-10 02:03:00', '汽车美容,装潢,汽车保养', '2121', '2121', '212121', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('11', 'AolEMjM3W5Oi', '19', '21', '3232', '1', '0', '1', '2017-02-10 02:03:00', null, '323', '323', '2323', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('12', 'uNKxhBB4vXj9', '8', '9', '3213', '1', '0', '1', '2017-02-10 02:03:00', '汽车美容,汽车检测与维修', '321', '2312', '321', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('13', 'dDkXYUVmDHBL', '8', '9', '233', '1', '0', '1', '2017-02-10 02:03:00', null, '111', '111', '111', null, null, null, null, '1', '1');
INSERT INTO `orders` VALUES ('14', 'HvZtP06Hp4Xb', '5', '6', '1', '1', '1', '0', '2017-02-15 02:03:00', '汽车检测与维修,汽车电子', '1', '1', '1', null, null, null, null, '1', '1');

-- ----------------------------
-- Table structure for part
-- ----------------------------
DROP TABLE IF EXISTS `part`;
CREATE TABLE `part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnumbering` char(20) DEFAULT NULL,
  `partcategoryid` int(11) DEFAULT NULL,
  `partname` varchar(200) DEFAULT NULL,
  `purchaseprice` double DEFAULT NULL,
  `salesprice` double DEFAULT NULL,
  `specifications` char(100) DEFAULT NULL,
  `remarks` varchar(400) DEFAULT NULL,
  `partflag` char(10) DEFAULT NULL,
  `supplierid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partcategoryid` (`partcategoryid`),
  KEY `supplierid` (`supplierid`),
  CONSTRAINT `part_ibfk_1` FOREIGN KEY (`partcategoryid`) REFERENCES `partcategory` (`id`),
  CONSTRAINT `part_ibfk_2` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of part
-- ----------------------------
INSERT INTO `part` VALUES ('1', 'xzxd_009023', '1', '发动机', '213', '245', '个', '0', '1', '1');
INSERT INTO `part` VALUES ('2', 'xzxd_009024', '1', '发动机总成', '200', '220', '个', '0', '1', '2');
INSERT INTO `part` VALUES ('3', 'xzxd_009025', '2', '离合器', '300', '320', '件', '0', '1', '2');
INSERT INTO `part` VALUES ('4', 'xzxd_009026', '2', '变速器', '200', '210', '件', '0', '1', '3');
INSERT INTO `part` VALUES ('5', 'xzxd_009027', '1', '制动总泵', '310', '349', '个', '0', '1', '1');
INSERT INTO `part` VALUES ('6', 'xzxd_009028', '4', '主哨', '321', '330', '个', '0', '1', '1');
INSERT INTO `part` VALUES ('7', 'xzxd_009029', '5', '后桥', '200', '220', '个', '0', '1', '1');
INSERT INTO `part` VALUES ('8', 'xzxd_009030', '6', '传感器', '100', '110', '个', '0', '1', '1');
INSERT INTO `part` VALUES ('9', 'xzxd_009031', '7', '装饰灯', '20', '10', '个', '0', '1', '1');
INSERT INTO `part` VALUES ('10', 'xzxd_0090232', '9', '轮胎大气泵', '320', '330', '件', '0', '1', '1');
INSERT INTO `part` VALUES ('11', 'xzxd_009033', '10', '地毯', '450', '220', '件', '0', '1', '1');

-- ----------------------------
-- Table structure for partcategory
-- ----------------------------
DROP TABLE IF EXISTS `partcategory`;
CREATE TABLE `partcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numbering` char(40) DEFAULT NULL,
  `partcategory` varchar(100) DEFAULT NULL,
  `partcatFlag` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partcategory
-- ----------------------------
INSERT INTO `partcategory` VALUES ('1', 'XZIT001', '发动机配件', '1');
INSERT INTO `partcategory` VALUES ('2', 'XZIT002', '传动系配件', '1');
INSERT INTO `partcategory` VALUES ('3', 'XZIT003', '转向系配件', '1');
INSERT INTO `partcategory` VALUES ('4', 'XZIT004', '行走系配件', '1');
INSERT INTO `partcategory` VALUES ('5', 'XZIT005', '电气仪表配件', '1');
INSERT INTO `partcategory` VALUES ('6', 'XZIT006', '汽车灯具', '1');
INSERT INTO `partcategory` VALUES ('7', 'XZIT007', '汽车改装配件', '1');
INSERT INTO `partcategory` VALUES ('8', 'XZIT008', '安全防盗配件', '1');
INSERT INTO `partcategory` VALUES ('9', 'XZIT009', '汽车内饰配件', '1');
INSERT INTO `partcategory` VALUES ('10', 'XZIT010', '汽车外饰配件', '1');
INSERT INTO `partcategory` VALUES ('11', 'XZIT011', '综合配件', '1');
INSERT INTO `partcategory` VALUES ('12', 'XZIT012', '影音电器配件', '1');
INSERT INTO `partcategory` VALUES ('13', 'XZIT013', '化工物理配件', '1');
INSERT INTO `partcategory` VALUES ('14', 'XZIT014', '汽车车身及附件', '1');
INSERT INTO `partcategory` VALUES ('15', 'XZIT015', '汽车维修配件', '1');

-- ----------------------------
-- Table structure for partproc
-- ----------------------------
DROP TABLE IF EXISTS `partproc`;
CREATE TABLE `partproc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partcategoryname` varchar(100) DEFAULT NULL,
  `partcategorycode` char(20) DEFAULT NULL,
  `partname` varchar(100) DEFAULT NULL,
  `partcode` char(20) DEFAULT NULL,
  `suppliercode` char(20) DEFAULT NULL,
  `suppliername` varchar(100) DEFAULT NULL,
  `pruchdemand` double DEFAULT NULL,
  `pruchprice` double DEFAULT NULL,
  `pruchernum` char(20) DEFAULT NULL,
  `prucher` char(20) DEFAULT NULL,
  `totalpurchase` double DEFAULT NULL,
  `purchstatus` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partproc
-- ----------------------------

-- ----------------------------
-- Table structure for partstorage
-- ----------------------------
DROP TABLE IF EXISTS `partstorage`;
CREATE TABLE `partstorage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partid` int(11) DEFAULT NULL,
  `warehouseid` int(11) DEFAULT NULL,
  `detaillocation` varchar(200) DEFAULT NULL,
  `inventory` double DEFAULT NULL,
  `storagetime` datetime DEFAULT NULL,
  `purchaser` char(20) DEFAULT NULL,
  `contactinfo` char(20) DEFAULT NULL,
  `jobnumber` char(20) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partid` (`partid`),
  KEY `warehouseid` (`warehouseid`),
  CONSTRAINT `partstorage_ibfk_1` FOREIGN KEY (`partid`) REFERENCES `part` (`id`),
  CONSTRAINT `partstorage_ibfk_2` FOREIGN KEY (`warehouseid`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partstorage
-- ----------------------------

-- ----------------------------
-- Table structure for partused
-- ----------------------------
DROP TABLE IF EXISTS `partused`;
CREATE TABLE `partused` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordersid` int(11) DEFAULT NULL,
  `partid` int(11) DEFAULT NULL,
  `useamount` double DEFAULT NULL,
  `applicant` char(20) DEFAULT NULL,
  `jobnumber` char(20) DEFAULT NULL,
  `concatinfo` char(20) DEFAULT NULL,
  `applicattime` datetime DEFAULT NULL,
  `registedspecnum` double DEFAULT NULL,
  `noreceivingnum` double DEFAULT NULL,
  `receivednum` double DEFAULT NULL,
  `receivestatus` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordersid` (`ordersid`),
  KEY `partid` (`partid`),
  CONSTRAINT `partused_ibfk_1` FOREIGN KEY (`ordersid`) REFERENCES `orders` (`id`),
  CONSTRAINT `partused_ibfk_2` FOREIGN KEY (`partid`) REFERENCES `part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partused
-- ----------------------------
INSERT INTO `partused` VALUES ('2', '3', '5', '1', '陈鹏', '20130501140', '1', '2017-02-13 14:50:22', '1', '1', '0', '已登记');
INSERT INTO `partused` VALUES ('3', '11', '10', '2', '陈鹏', '20130501140', '1', '2017-02-13 14:52:29', '2', '2', '0', '已登记');
INSERT INTO `partused` VALUES ('4', '3', '7', '5', '陈鹏', '20130501140', '1', '2017-02-13 14:55:51', '5', '5', '0', '已登记');
INSERT INTO `partused` VALUES ('5', '3', '6', '5', '陈鹏', '20130501140', '1', '2017-02-13 15:05:10', '5', '5', '0', '已登记');
INSERT INTO `partused` VALUES ('6', '3', '9', '1', '陈鹏', '20130501140', '1', '2017-02-13 15:49:25', '1', '1', '0', '已登记');
INSERT INTO `partused` VALUES ('7', '3', '9', '4', '陈鹏', '20130501140', '1', '2017-02-13 16:07:52', '4', '4', '0', '已登记');
INSERT INTO `partused` VALUES ('8', '4', '7', '3', '陈鹏', '20130501140', '1', '2017-02-13 16:20:29', '3', '3', '0', '已登记');
INSERT INTO `partused` VALUES ('12', '3', '3', '1', '陈鹏', '20130501140', '1', '2017-02-13 16:29:53', '1', '0', '1', '已登记');
INSERT INTO `partused` VALUES ('13', '4', '4', '1', '陈鹏', '20130501140', '1', '2017-02-13 16:44:54', '1', '1', '0', '已登记');
INSERT INTO `partused` VALUES ('14', '9', '10', '1', '陈鹏', '20130501140', '1', '2017-02-13 16:47:51', '1', '1', '0', '已登记');
INSERT INTO `partused` VALUES ('15', '9', '7', '2', '陈鹏', '20130501140', '1', '2017-02-13 16:47:54', '2', '2', '0', '已登记');
INSERT INTO `partused` VALUES ('16', '9', '6', '2', '陈鹏', '20130501140', '1', '2017-02-13 16:47:57', '2', '2', '0', '已登记');
INSERT INTO `partused` VALUES ('17', '9', '11', '1', '陈鹏', '20130501140', '1', '2017-02-13 16:48:15', '1', '1', '0', '已登记');

-- ----------------------------
-- Table structure for paystatus
-- ----------------------------
DROP TABLE IF EXISTS `paystatus`;
CREATE TABLE `paystatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paystatuscode` char(20) DEFAULT NULL,
  `statusname` char(40) DEFAULT NULL,
  `remarks` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paystatus
-- ----------------------------
INSERT INTO `paystatus` VALUES ('1', 'xz001', '未结算', '1');
INSERT INTO `paystatus` VALUES ('2', 'xz002', '已结算', '1');
INSERT INTO `paystatus` VALUES ('3', 'xz003', '尚欠金额', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pername` varchar(100) DEFAULT NULL,
  `authcategory` varchar(100) DEFAULT NULL,
  `perurl` varchar(200) DEFAULT NULL,
  `perflag` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '车辆接待', '汽车维修管理', '/vmm/vehicleReception.jsp#icon-application_form_edit', '1');
INSERT INTO `permission` VALUES ('2', '维修项目登记', '汽车维修管理', '/vmm/maintanceProjectReg.jsp#icon-car_add   ', '1');
INSERT INTO `permission` VALUES ('3', '维修领料', '汽车维修管理', '/vmm/maintenancePicking.jsp#icon-cart_put', '1');
INSERT INTO `permission` VALUES ('4', '质检完工', '汽车维修管理', '/vmm/qualityInsCompleted.jsp#icon-overlays', '1');
INSERT INTO `permission` VALUES ('5', '消费结算', '汽车维修管理', '/vmm/consumptionSettle.jsp#icon-money', '1');
INSERT INTO `permission` VALUES ('6', '采购配件', '配件管理', '/am/procurementOfasso.jsp#icon-cart', '1');
INSERT INTO `permission` VALUES ('7', '库存管理', '配件管理', '/am/inventoryMana.jsp#icon-shield', '1');
INSERT INTO `permission` VALUES ('8', '单据查询', '财务管理', '/fm/documentInquiry.jsp#icon-search', '1');
INSERT INTO `permission` VALUES ('9', '采购单据管理', '财务管理', '/fm/purchasingDocMana.jsp#icon-page_word', '1');
INSERT INTO `permission` VALUES ('10', '报表统计', '财务管理', '/fm/reportStatistics.jsp#icon-sum', '1');
INSERT INTO `permission` VALUES ('11', '客户资料管理', '基础数据管理', '/bdm/customerInfoMana.jsp#icon-user_edit', '1');
INSERT INTO `permission` VALUES ('12', '系统基础数据配置', '基础数据管理', '/bdm/sysBasicInfoConfig.jsp#icon-tag_green', '1');
INSERT INTO `permission` VALUES ('13', '维修项目管理', '基础数据管理', '/bdm/mainProjMana.jsp#icon-ruby_gear', '1');
INSERT INTO `permission` VALUES ('14', '供应商管理', '基础数据管理', '/bdm/supplierManage.jsp#icon-appication_form_edit', '1');
INSERT INTO `permission` VALUES ('15', '配件信息管理', '基础数据管理', '/bdm/accessoriesInfoMana.jsp#icon-database_key', '1');
INSERT INTO `permission` VALUES ('16', '仓库信息管理', '基础数据管理', '/bdm/warehouseInfoMan.jsp#icon-database_gear', '1');
INSERT INTO `permission` VALUES ('17', '业务类型管理', '基础数据管理', '/bdm/businessTypeMana.jsp#icon-wrench', '1');
INSERT INTO `permission` VALUES ('18', '系统用户管理', '系统维护', '/sm/sysUserMan.jsp#icon-user', '1');
INSERT INTO `permission` VALUES ('19', '修改密码', '系统维护', '/sm/modPass.jsp#icon-textfield_key', '1');
INSERT INTO `permission` VALUES ('20', '数据备份还原', '系统维护', '/sm/dataBackAndRest.jsp#icon-arrow_refresh', '1');
INSERT INTO `permission` VALUES ('21', '系统帮助', '系统维护', '/sm/sysHelp.jsp#icon-tip#icon-tip', '1');

-- ----------------------------
-- Table structure for personallocate
-- ----------------------------
DROP TABLE IF EXISTS `personallocate`;
CREATE TABLE `personallocate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfoid` int(11) DEFAULT NULL,
  `ordersid` int(11) DEFAULT NULL,
  `taskcategory` char(10) DEFAULT NULL,
  `allocatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userinfoid` (`userinfoid`),
  KEY `ordersid` (`ordersid`),
  CONSTRAINT `personallocate_ibfk_1` FOREIGN KEY (`userinfoid`) REFERENCES `userinfo` (`id`),
  CONSTRAINT `personallocate_ibfk_2` FOREIGN KEY (`ordersid`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personallocate
-- ----------------------------
INSERT INTO `personallocate` VALUES ('1', '7', '1', 'wx', '2017-02-09 08:39:58');
INSERT INTO `personallocate` VALUES ('2', '6', '1', 'wx', '2017-02-09 08:39:58');
INSERT INTO `personallocate` VALUES ('3', '2', '1', 'zj', '2017-02-09 08:39:58');
INSERT INTO `personallocate` VALUES ('4', '9', '1', 'zj', '2017-02-09 08:39:58');
INSERT INTO `personallocate` VALUES ('5', '6', '2', 'wx', '2017-02-09 09:05:35');
INSERT INTO `personallocate` VALUES ('6', '7', '2', 'wx', '2017-02-09 09:05:36');
INSERT INTO `personallocate` VALUES ('7', '3', '2', 'zj', '2017-02-09 09:05:36');
INSERT INTO `personallocate` VALUES ('8', '5', '2', 'zj', '2017-02-09 09:05:36');
INSERT INTO `personallocate` VALUES ('9', '1', '3', 'wx', '2017-02-09 09:11:00');
INSERT INTO `personallocate` VALUES ('10', '6', '3', 'wx', '2017-02-09 09:11:00');
INSERT INTO `personallocate` VALUES ('11', '2', '3', 'zj', '2017-02-09 09:11:01');
INSERT INTO `personallocate` VALUES ('12', '9', '3', 'zj', '2017-02-09 09:11:01');
INSERT INTO `personallocate` VALUES ('13', '7', '4', 'wx', '2017-02-09 09:16:38');
INSERT INTO `personallocate` VALUES ('14', '1', '4', 'wx', '2017-02-09 09:16:39');
INSERT INTO `personallocate` VALUES ('15', '2', '4', 'zj', '2017-02-09 09:16:39');
INSERT INTO `personallocate` VALUES ('16', '3', '4', 'zj', '2017-02-09 09:16:39');
INSERT INTO `personallocate` VALUES ('17', '6', '5', 'wx', '2017-02-09 09:24:40');
INSERT INTO `personallocate` VALUES ('18', '8', '5', 'wx', '2017-02-09 09:24:40');
INSERT INTO `personallocate` VALUES ('19', '2', '5', 'zj', '2017-02-09 09:24:40');
INSERT INTO `personallocate` VALUES ('20', '9', '5', 'zj', '2017-02-09 09:24:40');
INSERT INTO `personallocate` VALUES ('21', '1', '6', 'wx', '2017-02-09 14:35:57');
INSERT INTO `personallocate` VALUES ('22', '6', '6', 'wx', '2017-02-09 14:35:57');
INSERT INTO `personallocate` VALUES ('23', '1', '6', 'zj', '2017-02-09 14:35:57');
INSERT INTO `personallocate` VALUES ('24', '6', '7', 'wx', '2017-02-09 14:53:58');
INSERT INTO `personallocate` VALUES ('25', '1', '7', 'wx', '2017-02-09 14:53:58');
INSERT INTO `personallocate` VALUES ('26', '1', '7', 'zj', '2017-02-09 14:53:58');
INSERT INTO `personallocate` VALUES ('27', '1', '8', 'wx', '2017-02-09 16:27:18');
INSERT INTO `personallocate` VALUES ('28', '4', '8', 'zj', '2017-02-09 16:27:18');
INSERT INTO `personallocate` VALUES ('29', '1', '9', 'wx', '2017-02-10 08:29:29');
INSERT INTO `personallocate` VALUES ('30', '7', '9', 'wx', '2017-02-10 08:29:30');
INSERT INTO `personallocate` VALUES ('31', '2', '9', 'zj', '2017-02-10 08:29:30');
INSERT INTO `personallocate` VALUES ('32', '3', '9', 'zj', '2017-02-10 08:29:30');
INSERT INTO `personallocate` VALUES ('33', '1', '10', 'wx', '2017-02-10 08:51:44');
INSERT INTO `personallocate` VALUES ('34', '6', '10', 'wx', '2017-02-10 08:51:44');
INSERT INTO `personallocate` VALUES ('35', '1', '10', 'zj', '2017-02-10 08:51:45');
INSERT INTO `personallocate` VALUES ('36', '1', '11', 'wx', '2017-02-10 08:52:16');
INSERT INTO `personallocate` VALUES ('37', '1', '11', 'zj', '2017-02-10 08:52:16');
INSERT INTO `personallocate` VALUES ('38', '1', '12', 'wx', '2017-02-10 08:53:45');
INSERT INTO `personallocate` VALUES ('39', '1', '12', 'zj', '2017-02-10 08:53:46');
INSERT INTO `personallocate` VALUES ('40', '1', '13', 'wx', '2017-02-10 08:54:55');
INSERT INTO `personallocate` VALUES ('41', '6', '13', 'wx', '2017-02-10 08:54:56');
INSERT INTO `personallocate` VALUES ('42', '7', '13', 'wx', '2017-02-10 08:54:56');
INSERT INTO `personallocate` VALUES ('43', '1', '13', 'zj', '2017-02-10 08:54:56');
INSERT INTO `personallocate` VALUES ('44', '1', '14', 'wx', '2017-02-13 08:15:49');
INSERT INTO `personallocate` VALUES ('45', '7', '14', 'wx', '2017-02-13 08:15:49');
INSERT INTO `personallocate` VALUES ('46', '6', '14', 'zj', '2017-02-13 08:15:49');

-- ----------------------------
-- Table structure for projcategory
-- ----------------------------
DROP TABLE IF EXISTS `projcategory`;
CREATE TABLE `projcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numbering` char(40) DEFAULT NULL,
  `projcateNum` char(40) DEFAULT NULL,
  `projname` varchar(100) DEFAULT NULL,
  `catflag` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projcategory
-- ----------------------------
INSERT INTO `projcategory` VALUES ('1', 'XZIT001', 'XZIT001', '汽车美容', '1');
INSERT INTO `projcategory` VALUES ('2', 'XZIT002', 'XZIT002', '装潢', '1');
INSERT INTO `projcategory` VALUES ('3', 'XZIT003', 'XZIT003', '汽车检测与维修', '1');
INSERT INTO `projcategory` VALUES ('4', 'XZIT004', 'XZIT004', '汽车电子', '1');
INSERT INTO `projcategory` VALUES ('5', 'XZIT005', 'XZIT005', '汽车保养', '1');

-- ----------------------------
-- Table structure for qualityinspec
-- ----------------------------
DROP TABLE IF EXISTS `qualityinspec`;
CREATE TABLE `qualityinspec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mainprojregid` int(11) DEFAULT NULL,
  `inspectperson` char(20) DEFAULT NULL,
  `jobnum` char(20) DEFAULT NULL,
  `inspecttime` datetime DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mainprojregid` (`mainprojregid`),
  CONSTRAINT `qualityinspec_ibfk_1` FOREIGN KEY (`mainprojregid`) REFERENCES `mainprojreg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qualityinspec
-- ----------------------------

-- ----------------------------
-- Table structure for sector
-- ----------------------------
DROP TABLE IF EXISTS `sector`;
CREATE TABLE `sector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptname` varchar(100) DEFAULT NULL,
  `secflag` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sector
-- ----------------------------
INSERT INTO `sector` VALUES ('1', '维修部门', '1');
INSERT INTO `sector` VALUES ('2', '质检部门', '1');
INSERT INTO `sector` VALUES ('3', '采购部门', '1');
INSERT INTO `sector` VALUES ('4', '财务部门', '1');
INSERT INTO `sector` VALUES ('5', '客服部门', '1');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(200) DEFAULT NULL,
  `contacts` char(20) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `contactInfo` varchar(50) DEFAULT NULL,
  `fax` char(20) DEFAULT NULL,
  `mailbox` char(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `postcode` char(20) DEFAULT NULL,
  `bankaccount` char(20) DEFAULT NULL,
  `suppflag` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '江苏凯越汽车配件有限公司', '张三丰', '32454235432', '1323412', '12313@dsa', '321@131.com', '江苏省无锡市南长区南禅寺', '1213', '32332', '1');
INSERT INTO `supplier` VALUES ('2', '江苏肯尼迪汽车配件有限公司', '王尼玛', '234321', '213421', '235432', '1232@dd.com', '江苏省泰州市xxx', '13432', '235432', '1');
INSERT INTO `supplier` VALUES ('3', '江苏卡卡配件有限公司', '什么鬼', '1235423', '23432', '234345321', '234@1232.com', '江苏省如皋市234', '2134321', '4321', '1');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) DEFAULT NULL,
  `jobnumber` char(30) DEFAULT NULL,
  `concatinfo` char(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `entrytime` datetime DEFAULT NULL,
  `userflag` char(10) DEFAULT NULL,
  `sectorid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sectorid` (`sectorid`),
  CONSTRAINT `userinfo_ibfk_1` FOREIGN KEY (`sectorid`) REFERENCES `sector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '陈鹏', '20130501140', '13961826751', '江苏省无锡市怀古豪庭8座8楼', '2016-07-14 10:43:22', '1', '1');
INSERT INTO `userinfo` VALUES ('2', '孔磊', '20130501141', '13961826751', '江苏省徐州市徐州工程学院信电工程学院计算机教研室302', '2015-01-05 10:44:28', '1', '2');
INSERT INTO `userinfo` VALUES ('3', '胡局新', '20130501142', '18796258893', '江苏省徐州市中国矿业大学', '2017-01-02 10:45:32', '1', '3');
INSERT INTO `userinfo` VALUES ('4', '程红林', '20130501143', '12323234354', '江苏省徐州市xxx', '2017-01-01 10:46:08', '1', '4');
INSERT INTO `userinfo` VALUES ('5', '肖洋', '20130501144', '2121212', '江苏省徐州市xxx', '2017-01-07 10:46:40', '1', '5');
INSERT INTO `userinfo` VALUES ('6', '张加涛', '20130501145', '1123232323', '浙江省宁波市', '2016-12-05 13:39:44', '1', '1');
INSERT INTO `userinfo` VALUES ('7', '王安户', '20130501146', '213232342', '新疆省xx', '2017-01-02 13:40:45', '1', '1');
INSERT INTO `userinfo` VALUES ('8', '孟龙', '20130501149', '121223233', '徐州市1231223', '2017-02-15 16:58:11', '1', '1');
INSERT INTO `userinfo` VALUES ('9', '赵杰', '20130501150', '1212123243', '徐州市', '2017-02-01 16:58:47', '1', '1');

-- ----------------------------
-- Table structure for userrights
-- ----------------------------
DROP TABLE IF EXISTS `userrights`;
CREATE TABLE `userrights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionid` int(11) DEFAULT NULL,
  `accountid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissionid` (`permissionid`),
  KEY `accountid` (`accountid`),
  CONSTRAINT `userrights_ibfk_1` FOREIGN KEY (`permissionid`) REFERENCES `permission` (`id`),
  CONSTRAINT `userrights_ibfk_2` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrights
-- ----------------------------
INSERT INTO `userrights` VALUES ('1', '1', '1');
INSERT INTO `userrights` VALUES ('2', '2', '1');
INSERT INTO `userrights` VALUES ('3', '3', '1');
INSERT INTO `userrights` VALUES ('4', '4', '1');
INSERT INTO `userrights` VALUES ('5', '5', '1');
INSERT INTO `userrights` VALUES ('6', '6', '1');
INSERT INTO `userrights` VALUES ('7', '7', '1');
INSERT INTO `userrights` VALUES ('8', '8', '1');
INSERT INTO `userrights` VALUES ('9', '9', '1');
INSERT INTO `userrights` VALUES ('10', '10', '1');
INSERT INTO `userrights` VALUES ('11', '11', '1');
INSERT INTO `userrights` VALUES ('12', '12', '1');
INSERT INTO `userrights` VALUES ('13', '13', '1');
INSERT INTO `userrights` VALUES ('14', '14', '1');
INSERT INTO `userrights` VALUES ('15', '15', '1');
INSERT INTO `userrights` VALUES ('16', '16', '1');
INSERT INTO `userrights` VALUES ('17', '17', '1');
INSERT INTO `userrights` VALUES ('18', '18', '1');
INSERT INTO `userrights` VALUES ('19', '19', '1');
INSERT INTO `userrights` VALUES ('20', '20', '1');
INSERT INTO `userrights` VALUES ('21', '21', '2');

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehname` varchar(50) DEFAULT NULL,
  `carmodel` varchar(50) DEFAULT NULL,
  `inspectiondate` datetime DEFAULT NULL,
  `milage` double DEFAULT NULL,
  `platenum` char(20) DEFAULT NULL,
  `vehflag` char(10) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES ('1', '宝马4s', 'zd2323', '2017-01-03 19:16:54', '12132', '苏F2323', '212223', '1');
INSERT INTO `vehicle` VALUES ('2', '奔驰4s', '2323', '2017-01-01 20:02:10', '23232', '苏M32323', '132323', '1');
INSERT INTO `vehicle` VALUES ('3', '一汽奥迪', 'A3', '2017-01-03 14:41:06', '122323', '苏N2323', '232323', '2');
INSERT INTO `vehicle` VALUES ('4', '广汽本田', 'Accord', '2017-01-05 14:41:47', '432423', '苏Q23234', '2323234', '3');
INSERT INTO `vehicle` VALUES ('5', '华晨宝马', '3系', '2016-12-05 15:10:55', '2323232', '苏J2323', '23232', '4');
INSERT INTO `vehicle` VALUES ('6', '比亚迪', 'F3', '2016-12-05 15:11:33', '23232', '浙M2323', '232323', '5');
INSERT INTO `vehicle` VALUES ('7', '东风标致', '3008', '2016-10-10 15:12:23', '121223', '粤D2323', '232323', '6');
INSERT INTO `vehicle` VALUES ('8', '123213213', '43432432', '2017-02-06 00:00:00', '13231', '312321', null, '7');
INSERT INTO `vehicle` VALUES ('9', '汽车名称', '1232323', '2017-02-06 00:00:00', '232323', '2323', '23234234', '8');
INSERT INTO `vehicle` VALUES ('10', '测试的汽车名称', '2323', '2017-02-06 00:00:00', '2323', '1111', '·2222', '2');
INSERT INTO `vehicle` VALUES ('11', '凯迪拉克', 'SQ232', '2017-02-06 00:00:00', '12323', '苏C23H23', 'S20121DSA', '2');
INSERT INTO `vehicle` VALUES ('12', '宝马', '12', '2017-02-06 00:00:00', '23', '23', '32', '9');
INSERT INTO `vehicle` VALUES ('13', '13213', '313', '2017-02-06 00:00:00', '2131', '321312', '312321', '10');
INSERT INTO `vehicle` VALUES ('14', '奥迪', 'a11', '2017-02-06 00:00:00', '2323', '苏M2323', 'SD1323', '12');
INSERT INTO `vehicle` VALUES ('15', '11', '11', '2017-02-06 00:00:00', '11', '1', '11', '13');
INSERT INTO `vehicle` VALUES ('16', '2323', '111', '2017-02-06 00:00:00', '232', '323', '32', '14');
INSERT INTO `vehicle` VALUES ('17', 'fdsa`', '423', '2017-02-06 00:00:00', '423', '234', '2343', '15');
INSERT INTO `vehicle` VALUES ('18', '243324', '4234', '2017-02-06 00:00:00', '43423', '32443', '243', '16');
INSERT INTO `vehicle` VALUES ('19', '222', '22', '2017-02-06 00:00:00', '22', '222', '222', '17');
INSERT INTO `vehicle` VALUES ('20', '奥迪', 'A1', '2017-02-07 00:00:00', '232', '2132', '2323', '18');
INSERT INTO `vehicle` VALUES ('21', '北京现代', '132123', '2017-02-07 00:00:00', '23232', '2323', '232', '19');
INSERT INTO `vehicle` VALUES ('22', '劳斯莱斯', '2323', '2017-02-07 00:00:00', '232', '232', '23', '20');
INSERT INTO `vehicle` VALUES ('23', '劳斯来是', '132123', '2017-02-07 00:00:00', '32', '2323', '232', '21');
INSERT INTO `vehicle` VALUES ('24', '长安福特', 'SQ132', '2017-02-08 00:00:00', '213', '213', '23', '22');
INSERT INTO `vehicle` VALUES ('25', '奔驰', 'K1231', '2017-02-08 00:00:00', '2323', '2323', '213', '23');
INSERT INTO `vehicle` VALUES ('26', '奥迪', 'A6', '2017-02-09 00:00:00', '123', '苏Q231', '23315', '24');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouseName` varchar(100) DEFAULT NULL,
  `warehouseAdd` varchar(200) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `wareflag` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('1', '中央仓库-C01', '零件仓库1号', '0', '1');
INSERT INTO `warehouse` VALUES ('2', '中央仓库-C02', '零件仓库2号', '0', '1');
INSERT INTO `warehouse` VALUES ('3', '中央仓库-C03', '零件仓库3号', '0', '1');
INSERT INTO `warehouse` VALUES ('4', '中央仓库-C04', '零件仓库4号', '0', '1');
