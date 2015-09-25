/*
Navicat MySQL Data Transfer

Source Server         : jxy
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : test2

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2015-09-25 22:20:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(9) NOT NULL DEFAULT '0',
  `recommender_id` int(9) DEFAULT NULL,
  `login_name` varchar(30) NOT NULL,
  `login_passwd` varchar(30) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pause_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `real_name` varchar(20) NOT NULL,
  `idcard_no` char(18) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mailaddress` varchar(200) DEFAULT NULL,
  `zipcode` char(6) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `last_login_time` date DEFAULT NULL,
  `last_login_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_login_name_uk` (`login_name`),
  UNIQUE KEY `account_incard_no` (`idcard_no`),
  KEY `account_recommender_id_fk` (`recommender_id`),
  CONSTRAINT `account_recommender_id_fk` FOREIGN KEY (`recommender_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1005', null, 'taiji001', '256528', '1', '2008-03-15 00:00:00', null, null, 'zhangsanfeng', '410381194302256528', '1943-02-25', null, null, '13669351234', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1010', null, 'xl18z60', '190613', '1', '2009-01-10 00:00:00', null, null, 'guojing', '330682196903190613', '1969-03-19', null, null, '13338924567', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1011', '1010', 'dgbf70', '270429', '1', '2009-03-01 00:00:00', null, null, 'huangrong', '330902197108270429', '1971-08-27', null, null, '13637811357', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1015', '1005', 'mjjzh64', '041115', '1', '2010-03-12 00:00:00', null, null, 'zhangwuji', '610121198906041115', '1989-06-04', null, null, '13572952468', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1018', '1011', 'jmdxj00', '010322', '1', '2011-01-01 00:00:00', null, null, 'guofurong', '350581200201010322', '1996-01-01', null, null, '18617832562', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1019', '1011', 'ljxj90', '310346', '1', '2012-02-01 00:00:00', null, null, 'luwushuang', '320211199307310346', '1993-07-31', null, null, '13186454984', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1020', null, 'kxhxd20', '012115', '1', '2012-02-20 00:00:00', null, null, 'weixiaobao', '321022200010012115', '2000-10-01', null, null, '13953410078', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1021', null, 'kxhxd21', '012116', '1', '2012-02-20 00:00:00', null, null, 'zhangsan', '321022200010012116', '2000-10-02', null, null, '13953410079', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1022', null, 'kxhxd22', '012117', '1', '2012-02-20 00:00:00', null, null, 'lisi', '321022200010012117', '2000-10-03', null, null, '13953410080', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1023', null, 'kxhxd23', '012118', '1', '2012-02-20 00:00:00', null, null, 'wangwu', '321022200010012118', '2000-10-04', null, null, '13953410081', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1024', null, 'kxhxd24', '012119', '1', '2012-02-20 00:00:00', null, null, 'zhouliu', '321022200010012119', '2000-10-05', null, null, '13953410082', null, null, null, null, null, null);
INSERT INTO `account` VALUES ('1025', null, 'kxhxd25', '012120', '1', '2012-02-20 00:00:00', null, null, 'maqi', '321022200010012120', '2000-10-06', null, null, '13953410083', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `admin_info`
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
  `admin_id` int(4) NOT NULL,
  `admin_code` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `enrolldate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_code` (`admin_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
INSERT INTO `admin_info` VALUES ('2000', 'admin', '123', 'ADMIN', '123456789', 'admin@tarena.com.cn', '2015-09-25 14:05:05');
INSERT INTO `admin_info` VALUES ('3000', 'zhangfei', '123', 'ZhangFei', '123456789', 'zhangfei@tarena.com.cn', '2015-09-25 14:05:05');
INSERT INTO `admin_info` VALUES ('4000', 'liubei', '123', 'LiuBei', '123456789', 'liubei@tarena.com.cn', '2015-09-25 14:05:05');
INSERT INTO `admin_info` VALUES ('5000', 'caocao', '123', 'CaoCao', '123456789', 'caocao@tarena.com.cn', '2015-09-25 14:05:05');
INSERT INTO `admin_info` VALUES ('6000', 'aaa', '123', 'AAA', '123456789', 'aaa@tarena.com.cn', '2015-09-25 14:05:06');
INSERT INTO `admin_info` VALUES ('7000', 'bbb', '123', 'BBB', '123456789', 'bbb@tarena.com.cn', '2015-09-25 14:05:06');

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `admin_id` int(8) NOT NULL,
  `role_id` int(4) NOT NULL,
  PRIMARY KEY (`admin_id`,`role_id`),
  KEY `admin_role_role_id_fk` (`role_id`),
  CONSTRAINT `admin_role_admin_id_fk` FOREIGN KEY (`admin_id`) REFERENCES `admin_info` (`admin_id`),
  CONSTRAINT `admin_role_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('2000', '100');
INSERT INTO `admin_role` VALUES ('5000', '100');
INSERT INTO `admin_role` VALUES ('3000', '200');
INSERT INTO `admin_role` VALUES ('5000', '200');
INSERT INTO `admin_role` VALUES ('4000', '300');
INSERT INTO `admin_role` VALUES ('5000', '300');

-- ----------------------------
-- Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL DEFAULT '0',
  `account_id` int(9) NOT NULL,
  `bill_month` char(6) DEFAULT NULL,
  `cost` double(13,2) DEFAULT NULL,
  `payment_mode` char(1) DEFAULT NULL,
  `pay_state` char(10) DEFAULT '0',
  PRIMARY KEY (`bill_id`),
  KEY `bill_account_id` (`account_id`),
  CONSTRAINT `bill_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------

-- ----------------------------
-- Table structure for `cost`
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost` (
  `cost_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `base_duration` int(11) DEFAULT NULL,
  `base_cost` double(7,2) DEFAULT NULL,
  `unit_cost` double(7,4) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `descr` varchar(100) DEFAULT NULL,
  `creatime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `startime` date DEFAULT NULL,
  `cost_type` char(1) DEFAULT NULL,
  PRIMARY KEY (`cost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES ('1', '5.9元套餐', '20', '5.90', '0.4000', '1', '5.9元20小时/月,超出部分0.4元/时', '2015-09-25 10:20:06', null, null);
INSERT INTO `cost` VALUES ('2', '6.9元套餐', '40', '6.90', '0.3000', '1', '6.9元40小时/月,超出部分0.3元/时', '2015-09-25 10:20:07', null, null);
INSERT INTO `cost` VALUES ('3', '8.5元套餐', '100', '8.50', '0.2000', '1', '8.5元100小时/月,超出部分0.2元/时', '2015-09-25 10:20:07', null, null);
INSERT INTO `cost` VALUES ('4', '10.5元套餐', '200', '10.50', '0.1000', '1', '10.5元200小时/月,超出部分0.1元/时', '2015-09-25 10:20:07', null, null);
INSERT INTO `cost` VALUES ('5', '计时收费', null, null, '0.5000', '1', '0.5元/时,不使用不收费', '2015-09-25 10:20:07', null, null);
INSERT INTO `cost` VALUES ('6', '包月', null, '20.00', null, '1', '每月20元,不限制使用时间', '2015-09-25 10:20:07', null, null);

-- ----------------------------
-- Table structure for `dept_`
-- ----------------------------
DROP TABLE IF EXISTS `dept_`;
CREATE TABLE `dept_` (
  `deptno` int(4) NOT NULL,
  `dname` varchar(20) NOT NULL,
  `loc` varchar(20) NOT NULL,
  UNIQUE KEY `deptno` (`deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept_
-- ----------------------------
INSERT INTO `dept_` VALUES ('10', 'ACCOUNTING', 'NEW YORK');
INSERT INTO `dept_` VALUES ('20', 'RESEARCH', 'DALLAS');
INSERT INTO `dept_` VALUES ('30', 'SALES', 'CHICAGO');
INSERT INTO `dept_` VALUES ('40', 'OPERATIONS', 'BOSTON');

-- ----------------------------
-- Table structure for `emp_`
-- ----------------------------
DROP TABLE IF EXISTS `emp_`;
CREATE TABLE `emp_` (
  `empno` int(4) NOT NULL,
  `ename` varchar(10) DEFAULT NULL,
  `job` varchar(9) DEFAULT NULL,
  `mgr` int(4) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `sal` double(7,2) DEFAULT NULL,
  `comm` double(7,2) DEFAULT NULL,
  `deptno` int(2) DEFAULT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_
-- ----------------------------
INSERT INTO `emp_` VALUES ('7369', 'SMITH', 'CLERK', '7902', '1980-12-17', '800.00', null, '20');
INSERT INTO `emp_` VALUES ('7499', 'ALLEN', 'SALESMAN', '7698', '1981-02-20', '1600.00', '300.00', '30');
INSERT INTO `emp_` VALUES ('7521', 'WARD', 'SALESMAN', '7698', '1981-02-22', '1250.00', '500.00', '30');
INSERT INTO `emp_` VALUES ('7566', 'JONES', 'MANAGER', '7839', '1981-04-02', '2975.00', null, '20');
INSERT INTO `emp_` VALUES ('7654', 'MARTIN', 'SALESMAN', '7698', '1981-09-28', '1250.00', '1400.00', '30');
INSERT INTO `emp_` VALUES ('7698', 'BLAKE', 'MANAGER', '7839', '1981-05-01', '2850.00', null, '30');
INSERT INTO `emp_` VALUES ('7782', 'CLARK', 'MANAGER', '7839', '1981-06-09', '2450.00', null, '10');
INSERT INTO `emp_` VALUES ('7788', 'SCOTT', 'ANALYST', '7566', '1987-04-19', '3000.00', null, '20');
INSERT INTO `emp_` VALUES ('7839', 'KING', 'PRESIDENT', null, '1981-11-17', '5000.00', null, '10');
INSERT INTO `emp_` VALUES ('7844', 'TURNER', 'SALESMAN', '7698', '1981-09-08', '1500.00', '0.00', '30');
INSERT INTO `emp_` VALUES ('7876', 'ADAMS', 'CLERK', '7788', '1987-05-23', '1100.00', null, '20');
INSERT INTO `emp_` VALUES ('7900', 'JAMES', 'CLERK', '7698', '1981-12-03', '950.00', null, '30');
INSERT INTO `emp_` VALUES ('7902', 'FORD', 'ANALYST', '7566', '1981-12-03', '3000.00', null, '20');
INSERT INTO `emp_` VALUES ('7934', '李易峰', 'CLERK', '7782', '1982-01-23', '1300.00', null, '10');

-- ----------------------------
-- Table structure for `function_info`
-- ----------------------------
DROP TABLE IF EXISTS `function_info`;
CREATE TABLE `function_info` (
  `function_id` int(8) NOT NULL DEFAULT '0',
  `function_code` varchar(50) NOT NULL,
  `module_id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`function_id`),
  UNIQUE KEY `function_code` (`function_code`),
  KEY `function_module_id_fk` (`module_id`),
  CONSTRAINT `function_module_id_fk` FOREIGN KEY (`module_id`) REFERENCES `module_info` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of function_info
-- ----------------------------

-- ----------------------------
-- Table structure for `host`
-- ----------------------------
DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `host_id` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of host
-- ----------------------------
INSERT INTO `host` VALUES ('192.168.0.20', 'sun-server', 'beijing');
INSERT INTO `host` VALUES ('192.168.0.200', 'ultra10', 'beijing');
INSERT INTO `host` VALUES ('192.168.0.23', 'sun280', 'beijing');
INSERT INTO `host` VALUES ('192.168.0.26', 'sunv210', 'beijing');

-- ----------------------------
-- Table structure for `module_info`
-- ----------------------------
DROP TABLE IF EXISTS `module_info`;
CREATE TABLE `module_info` (
  `module_id` int(4) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module_info
-- ----------------------------
INSERT INTO `module_info` VALUES ('1', '角色管理');
INSERT INTO `module_info` VALUES ('2', '管理员');
INSERT INTO `module_info` VALUES ('3', '资费管理');
INSERT INTO `module_info` VALUES ('4', '账务账号');
INSERT INTO `module_info` VALUES ('5', '业务账号');
INSERT INTO `module_info` VALUES ('6', '账单管理');
INSERT INTO `module_info` VALUES ('7', '报表');

-- ----------------------------
-- Table structure for `role_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` int(4) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('100', '管理员');
INSERT INTO `role_info` VALUES ('200', '营业员');
INSERT INTO `role_info` VALUES ('300', '经理');
INSERT INTO `role_info` VALUES ('400', 'aaa');
INSERT INTO `role_info` VALUES ('500', 'bbb');
INSERT INTO `role_info` VALUES ('600', 'ccc');

-- ----------------------------
-- Table structure for `role_module`
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module` (
  `role_id` int(4) NOT NULL,
  `module_id` int(4) NOT NULL,
  PRIMARY KEY (`role_id`,`module_id`),
  KEY `role_module_module_id_fk` (`module_id`),
  CONSTRAINT `role_module_module_id_fk` FOREIGN KEY (`module_id`) REFERENCES `module_info` (`module_id`),
  CONSTRAINT `role_module_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO `role_module` VALUES ('100', '1');
INSERT INTO `role_module` VALUES ('100', '2');
INSERT INTO `role_module` VALUES ('200', '3');
INSERT INTO `role_module` VALUES ('200', '4');
INSERT INTO `role_module` VALUES ('200', '5');
INSERT INTO `role_module` VALUES ('200', '6');
INSERT INTO `role_module` VALUES ('300', '7');

-- ----------------------------
-- Table structure for `service`
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `service_id` int(10) NOT NULL DEFAULT '0',
  `account_id` int(9) NOT NULL,
  `unix_host` varchar(15) NOT NULL,
  `os_username` varchar(8) NOT NULL,
  `login_passwd` varchar(30) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pause_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `cost_id` int(4) NOT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `service_unixhost_osusername_uk` (`unix_host`,`os_username`),
  KEY `service_account_id_fk` (`account_id`),
  KEY `service_cost_id_fk` (`cost_id`),
  CONSTRAINT `service_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `service_cost_id_fk` FOREIGN KEY (`cost_id`) REFERENCES `cost` (`cost_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('2001', '1010', '192.168.0.26', 'guojing', 'guo1234', '0', '2015-09-25 13:35:02', null, null, '1');
INSERT INTO `service` VALUES ('2002', '1011', '192.168.0.26', 'huangr', 'huang234', '0', '2015-09-25 13:35:02', null, null, '1');
INSERT INTO `service` VALUES ('2003', '1011', '192.168.0.20', 'huangr', 'huang234', '0', '2015-09-25 13:35:02', null, null, '3');
INSERT INTO `service` VALUES ('2004', '1011', '192.168.0.23', 'huangr', 'huang234', '0', '2015-09-25 13:35:02', null, null, '6');
INSERT INTO `service` VALUES ('2005', '1019', '192.168.0.26', 'luwsh', 'luwu2345', '0', '2015-09-25 13:35:02', null, null, '4');
INSERT INTO `service` VALUES ('2006', '1019', '192.168.0.20', 'luwsh', 'luwu2345', '0', '2015-09-25 13:35:02', null, null, '5');
INSERT INTO `service` VALUES ('2007', '1020', '192.168.0.20', 'weixb', 'wei12345', '0', '2015-09-25 13:35:02', null, null, '6');
INSERT INTO `service` VALUES ('2008', '1010', '192.168.0.20', 'guojing', 'guo09876', '0', '2015-09-25 13:35:02', null, null, '6');

-- ----------------------------
-- Table structure for `service_detail`
-- ----------------------------
DROP TABLE IF EXISTS `service_detail`;
CREATE TABLE `service_detail` (
  `detail_id` int(11) NOT NULL DEFAULT '0',
  `service_id` int(10) NOT NULL,
  `client_host` varchar(15) DEFAULT NULL,
  `os_username` varchar(8) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `login_time` date DEFAULT NULL,
  `logout_time` date DEFAULT NULL,
  `duration` double(20,9) DEFAULT NULL,
  `cost` double(20,6) DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `service_detail_service_id` (`service_id`),
  CONSTRAINT `service_detail_service_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_detail
-- ----------------------------
INSERT INTO `service_detail` VALUES ('1', '2001', '192.168.172.4', 'guojing', null, null, '2013-06-11', '3610.000000000', null);
INSERT INTO `service_detail` VALUES ('2', '2001', '192.168.172.4', 'guojing', null, null, '2013-06-13', '10800.000000000', null);
INSERT INTO `service_detail` VALUES ('3', '2001', '192.168.172.4', 'guojing', null, null, '2013-06-14', '10800.000000000', null);
INSERT INTO `service_detail` VALUES ('4', '2001', '192.168.172.4', 'guojing', null, null, '2013-06-15', '32400.000000000', null);
INSERT INTO `service_detail` VALUES ('5', '2001', '192.168.172.4', 'guojing', null, null, '2013-06-18', '36000.000000000', null);
INSERT INTO `service_detail` VALUES ('6', '2001', '192.168.172.4', 'guojing', null, null, '2013-06-20', '36000.000000000', null);
