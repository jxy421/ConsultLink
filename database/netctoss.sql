grant debug connect session,debug any procedure to jsd1302;

----------------------- ����ص��������DDL��DML��TCL
--�ʷ���Ϣ��
orcacle
drop table COST;
create table cost(
  	cost_id			number(4) constraint cost_id_pk primary key,
  	name 			varchar(50)  not null,
  	base_duration 	number(11),
  	base_cost 		number(7,2),
  	unit_cost 		number(7,4),
  	status 			char(1)  constraint cost_status_ck 
							check (status  in  (0,1)),
  	descr 			varchar2(100),
  	creatime 		date default sysdate ,
  	startime 		date,
		cost_type		char(1) constraint cost_type_ck 
							check (cost_type in  (1,2,3))
  );
mysql
create table cost(
  	cost_id			INT(11),
  	name 			varchar(50)  not null,
  	base_duration 	INT(11),
  	base_cost 		DOUBLE(7,2),
  	unit_cost 		DOUBLE(7,4),
  	status 			char(1),
  	descr 			varchar(100),
  	creatime 		timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  	startime 		date,
		cost_type		char(1),
    constraint cost_id_pk primary key(cost_id),
    constraint cost_status_ck check(status  in  (0,1)),
    constraint cost_type_ck check(cost_type in  (1,2,3))
);

INSERT INTO COST VALUES (1,'5.9Ԫ�ײ�',20,5.9,0.4,0,'5.9Ԫ20Сʱ/��,��������0.4Ԫ/ʱ',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (2,'6.9Ԫ�ײ�',40,6.9,0.3,0,'6.9Ԫ40Сʱ/��,��������0.3Ԫ/ʱ',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (3,'8.5Ԫ�ײ�',100,8.5,0.2,0,'8.5Ԫ100Сʱ/��,��������0.2Ԫ/ʱ',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (4,'10.5Ԫ�ײ�',200,10.5,0.1,0,'10.5Ԫ200Сʱ/��,��������0.1Ԫ/ʱ',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (5,'��ʱ�շ�',null,null,0.5,0,'0.5Ԫ/ʱ,��ʹ�ò��շ�',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (6,'����',null,20,null,0,'ÿ��20Ԫ,������ʹ��ʱ��',DEFAULT,DEFAULT,NULL);
COMMIT;

COLUMN NAME FORMAT a10
COLUMN BASE_COST FORMAT 99.99
COLUMN BASE_DURATION FORMAT 999
COLUMN UNIT_COST FORMAT 99.99
COLUMN ID FORMAT 9
select id,name,base_cost,base_duration,unit_cost from cost

--UNIX��������Ϣ��
drop table host
create table host(
host_id 	varchar2(15) constraint host_id_pk primary key,
name 		varchar2(50), 
location	varchar2(100)
);


INSERT INTO HOST VALUES ('192.168.0.26','sunv210','beijing');
INSERT INTO HOST VALUES('192.168.0.20','sun-server','beijing');
INSERT INTO HOST VALUES ('192.168.0.23','sun280','beijing');
INSERT INTO HOST VALUES ('192.168.0.200','ultra10','beijing');
COMMIT;


--������Ϣ��
drop table account
create table account(
 	account_id		number(9) constraint account_id_pk primary key,
 	recommender_id	number(9) constraint account_recommender_id_fk
							references account(account_id),
 	login_name		varchar2(30)  not null
							constraint account_login_name_uk unique,
 	login_passwd	varchar2(30) not null,
 	status			char(1)	constraint account_status_ck
 						check (status in (0,1,2)),
 	create_date		date	 default sysdate,
 	pause_date		date,
 	close_date		date,
 	real_name		varchar2(20)	not null,
 	idcard_no		char(18)		not null
							constraint account_incard_no unique,
 	birthdate		date,
 	gender	        	char(1) constraint account_gender_ck
							check (gender in (0,1)),
 	occupation		varchar2(50),
 	telephone		varchar2(15) not null,
 	email			varchar2(50),
 	mailaddress		varchar2(200),
 	zipcode			char(6),
 	qq				varchar2(15),
 	last_login_time	  	date,
 	last_login_ip		varchar2(15)
);
mysql
create table account(
 	account_id		INT(9),
 	recommender_id	INT(9),
 	login_name		varchar(30)  not null,
 	login_passwd	varchar(30) not null,
 	status			char(1),
 	create_date		timestamp NULL DEFAULT CURRENT_TIMESTAMP,
 	pause_date		date,
 	close_date		date,
 	real_name		varchar(20)	not null,
 	idcard_no		char(18)		not null,
 	birthdate		date,
 	gender	        	char(1),
 	occupation		varchar(50),
 	telephone		varchar(15) not null,
 	email			varchar(50),
 	mailaddress		varchar(200),
 	zipcode			char(6),
 	qq				varchar(15),
 	last_login_time	  	date,
 	last_login_ip		varchar(15),
  constraint account_id_pk primary key(account_id),
  CONSTRAINT  account_recommender_id_fk FOREIGN KEY (recommender_id) REFERENCES account(account_id),
	constraint account_login_name_uk unique(login_name),
  constraint account_status_ck check (status in (0,1,2)),
	constraint account_incard_no unique(idcard_no),
  constraint account_gender_ck check (gender in (0,1))
);


ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy mm dd hh24:mi:ss';
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
     REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1005,NULL,'taiji001','256528',1,'2008 03 15','zhangsanfeng','19430225','410381194302256528',13669351234);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1010,NULL,'xl18z60','190613',1,'2009 01 10','guojing','19690319','330682196903190613',13338924567);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1011,1010,'dgbf70','270429',1,'2009 03 01','huangrong','19710827','330902197108270429',13637811357);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1015,1005,'mjjzh64','041115',1,'2010 03 12','zhangwuji','19890604','610121198906041115',13572952468);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1018,1011,'jmdxj00','010322',1,'2011 01 01','guofurong','199601010322','350581200201010322',18617832562);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1019,1011,'ljxj90','310346',1,'2012 02 01','luwushuang','19930731','320211199307310346',13186454984);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1020,NULL,'kxhxd20','012115',1,'2012 02 20','weixiaobao','20001001','321022200010012115',13953410078);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1021,NULL,'kxhxd21','012116',1,'2012 02 20','zhangsan','20001002','321022200010012116',13953410079);
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1022,NULL,'kxhxd22','012117',1,'2012 02 20','lisi','20001003','321022200010012117',13953410080);
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1023,NULL,'kxhxd23','012118',1,'2012 02 20','wangwu','20001004','321022200010012118',13953410081);
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1024,NULL,'kxhxd24','012119',1,'2012 02 20','zhouliu','20001005','321022200010012119',13953410082);
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1025,NULL,'kxhxd25','012120',1,'2012 02 20','maqi','20001006','321022200010012120',13953410083);
COMMIT;
mysql
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1010,NULL,'xl18z60','190613',1,'2009-01-10','guojing','1969-03-19','330682196903190613',13338924567);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1011,1010,'dgbf70','270429',1,'2009-03-01','huangrong','1971-08-27','330902197108270429',13637811357);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1015,1005,'mjjzh64','041115',1,'2010-03-12','zhangwuji','1989-06-04','610121198906041115',13572952468);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1018,1011,'jmdxj00','010322',1,'2011-01-01','guofurong','1996-01-01 03:22','350581200201010322',18617832562);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1019,1011,'ljxj90','310346',1,'2012-02-01','luwushuang','1993-07-31','320211199307310346',13186454984);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1020,NULL,'kxhxd20','012115',1,'2012-02-20','weixiaobao','2000-10-01','321022200010012115',13953410078);

INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1021,NULL,'kxhxd21','012116',1,'2012-02-20','zhangsan','2000-10-02','321022200010012116',13953410079);
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1022,NULL,'kxhxd22','012117',1,'2012-02-20','lisi','2000-10-03','321022200010012117',13953410080);
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1023,NULL,'kxhxd23','012118',1,'2012-02-20','wangwu','2000-10-04','321022200010012118',13953410081);
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1024,NULL,'kxhxd24','012119',1,'2012-02-20','zhouliu','2000-10-05','321022200010012119',13953410082);
INSERT INTO ACCOUNT(account_id,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1025,NULL,'kxhxd25','012120',1,'2012-02-20','maqi','2000-10-06','321022200010012120',13953410083);
select id,recommender_id,login_name,login_passwd,status,create_date,real_name,idcard_no,telephone
from account;
column id format 9999
column recommender_id format 9999
column login_name format a10
column login_passwd format a10
column real_name format a10

--ҵ����Ϣ��
drop table SERVICE
create table service(
 	service_id		number(10) constraint service_id_pk primary key,
 	account_id		number(9) constraint service_account_id_fk
							references account(account_id) not null,
 	unix_host		varchar2(15) constraint service_unix_host_fk not null ,
 	os_username		varchar2(8)	not null,
 						constraint service_unixhost_osusername_uk 
 						unique(unix_host,os_username),
 	login_passwd	varchar2(30) not null,
 	status 			char(1) 	constraint service_status_ck
								check ( status in (0,1,2) ),	
 	create_date		date	default sysdate,
 	pause_date		date,
 	close_date		date,
 	cost_id			number(4) constraint service_cost_id_fk
							references cost(cost_id) not null
);
INSERT INTO SERVICE VALUES (2001,1010,'192.168.0.26','guojing','guo1234','0',sysdate,null,null,1);

INSERT INTO SERVICE VALUES (2002,1011,'192.168.0.26','huangr','huang234','0',sysdate,null,null,1);

INSERT INTO SERVICE VALUES (2003,1011,'192.168.0.20','huangr','huang234','0',sysdate,null,null,3);

INSERT INTO SERVICE VALUES (2004,1011,'192.168.0.23','huangr','huang234','0',sysdate,null,null,6);

INSERT INTO SERVICE VALUES (2005,1019,'192.168.0.26','luwsh','luwu2345','0',sysdate,null,null,4);

INSERT INTO SERVICE VALUES (2006,1019,'192.168.0.20','luwsh','luwu2345','0',sysdate,null,null,5);

INSERT INTO SERVICE VALUES (2007,1020,'192.168.0.20','weixb','wei12345','0',sysdate,null,null,6);

INSERT INTO SERVICE VALUES (2008,1010,'192.168.0.20','guojing','guo09876','0',sysdate,null,null,6);
COMMIT;
SELECT ID,ACCOUNT_ID,UNIX_HOST,OS_USERNAME,CREATE_DATE,COST_ID FROM SERVICE;
SELECT A.REAL_NAME,A.CREATE_DATE,A.LAST_LOGIN_TIME,S.UNIX_HOST,S.CREATE_DATE
FROM ACCOUNT  A LEFT JOIN SERVICE S
ON A.ID = S.ACCOUNT_ID;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR';
mysql
create table service(
 	service_id		INT(10),
 	account_id		INT(9) not null,
 	unix_host		varchar(15) NOT NULL ,
 	os_username		varchar(8)	not null,
 	login_passwd	varchar(30) not null,
 	status 			char(1),	
 	create_date		timestamp NULL DEFAULT CURRENT_TIMESTAMP,
 	pause_date		date,
 	close_date		date,
 	cost_id			INT(4) not null,
	constraint service_id_pk primary key(service_id),
	constraint service_account_id_fk FOREIGN KEY(account_id) references account(account_id) ,
  constraint service_unixhost_osusername_uk unique(unix_host,os_username),
	constraint service_status_ck check ( status in (0,1,2) ),
	constraint service_cost_id_fk FOREIGN KEY(cost_id) references cost(cost_id) 
);
INSERT INTO SERVICE VALUES (2001,1010,'192.168.0.26','guojing','guo1234','0',DEFAULT,null,null,1);
INSERT INTO SERVICE VALUES (2002,1011,'192.168.0.26','huangr','huang234','0',DEFAULT,null,null,1);
INSERT INTO SERVICE VALUES (2003,1011,'192.168.0.20','huangr','huang234','0',DEFAULT,null,null,3);
INSERT INTO SERVICE VALUES (2004,1011,'192.168.0.23','huangr','huang234','0',DEFAULT,null,null,6);
INSERT INTO SERVICE VALUES (2005,1019,'192.168.0.26','luwsh','luwu2345','0',DEFAULT,null,null,4);
INSERT INTO SERVICE VALUES (2006,1019,'192.168.0.20','luwsh','luwu2345','0',DEFAULT,null,null,5);
INSERT INTO SERVICE VALUES (2007,1020,'192.168.0.20','weixb','wei12345','0',DEFAULT,null,null,6);
INSERT INTO SERVICE VALUES (2008,1010,'192.168.0.20','guojing','guo09876','0',DEFAULT,null,null,6);
--ҵ���굥��
drop table SERVICE_DETAIL
create table service_detail(
		detail_id		number(11) constraint service_dtail_id_pk primary key,
		service_id 		number(10) constraint service_detail_service_id
                                references service(service_id) not null,
 	client_host 	varchar2(15),
 	os_username 	varchar2(8),
 	pid 				number(11),
 	login_time 		date,
 	logout_time 	date,
 	duration 		number(20,9),
 	cost		number(20,6)
);
mysql
create table service_detail(
	detail_id		INT(11),
	service_id 		INT(10) not null,
	client_host 	varchar(15),
 	os_username 	varchar(8),
 	pid 				INT(11),
 	login_time 		date,
 	logout_time 	date,
 	duration 		DOUBLE(20,9),
 	cost		DOUBLE(20,6),
	constraint service_dtail_id_pk primary key(detail_id),
	constraint service_detail_service_id FOREIGN KEY(service_id) references service(service_id) 
);
ALTER SESSION SET NLS_DATE_FORMAT  = 'yyyy mm dd hh24:mi:ss'
INSERT INTO SERVICE_DETAIL(detail_id,SERVICE_ID,CLIENT_HOST,OS_USERNAME,LOGOUT_TIME,DURATION) VALUES
(1,2001,'192.168.172.4','guojing','2013-06-11 08:30:00',3610);
INSERT INTO SERVICE_DETAIL(detail_id,SERVICE_ID,CLIENT_HOST,OS_USERNAME,LOGOUT_TIME,DURATION) VALUES
(2,2001,'192.168.172.4','guojing','2013-06-13 20:30:00',10800);
INSERT INTO SERVICE_DETAIL(detail_id,SERVICE_ID,CLIENT_HOST,OS_USERNAME,LOGOUT_TIME,DURATION) VALUES
(3,2001,'192.168.172.4','guojing','2013-06-14 20:30:00',10800);
INSERT INTO SERVICE_DETAIL(detail_id,SERVICE_ID,CLIENT_HOST,OS_USERNAME,LOGOUT_TIME,DURATION) VALUES
(4,2001,'192.168.172.4','guojing','2013-06-15 19:30:00',32400);
INSERT INTO SERVICE_DETAIL(detail_id,SERVICE_ID,CLIENT_HOST,OS_USERNAME,LOGOUT_TIME,DURATION) VALUES
(5,2001,'192.168.172.4','guojing','2013-06-18 19:30:00',36000);
INSERT INTO SERVICE_DETAIL(detail_id,SERVICE_ID,CLIENT_HOST,OS_USERNAME,LOGOUT_TIME,DURATION) VALUES
(6,2001,'192.168.172.4','guojing','2013-06-20 21:30:00',36000);
COMMIT;


--�˵���Ϣ��
drop table bill
DROP TABLE BILL CASCADE CONSTRAINTS PURGE;
create table bill
(
		bill_id			number(11) constraint bill_id_pk primary key,
 	account_id 		number(9) constraint bill_account_id
                                  references account(account_id) not null,
 	bill_month 		char(6),
 	cost 			number(13,2),
 	payment_mode 	char(1) constraint bill_payment_code_ck
								check (payment_mode in (0,1,2,3)),
 	pay_state		char(10) default 0 constraint bill_pay_state_ck
								check (pay_state in (0,1)) 
);
mysql
create table bill
(
		bill_id			int(11),
 	account_id 		int(9)not null,
 	bill_month 		char(6),
 	cost 			double(13,2),
 	payment_mode 	char(1) ,
 	pay_state		char(10) default 0  
	constraint bill_id_pk primary key(bill_id),
	constraint bill_account_id FOREIGN KEY(bill_id) references account(account_id) ,
	constraint bill_payment_code_ck check (payment_mode in (0,1,2,3)),
	constraint bill_pay_state_ck check (pay_state in (0,1))
);

--�˵���Ŀ��
DROP TABLE BILL_ITEM ;
create table bill_item
(
 	item_id		number(11) constraint bill_item_id_pk  primary key,
 	bill_id 	number(11) constraint bill_itme_bill_id
						references bill(bill_id) not null,
 	service_id 	number(10) not null,
 	cost 		number(13,2)
);
mysql
create table bill
(
	bill_id			INT(11) ,
 	account_id 		INT(9) not null,
 	bill_month 		char(6),
 	cost 			DOUBLE(13,2),
 	payment_mode 	char(1),
 	pay_state		char(10) default 0 , 
	constraint bill_id_pk primary key(bill_id),
	constraint bill_account_id FOREIGN KEY(account_id) references account(account_id), 
	constraint bill_payment_code_ck check (payment_mode in (0,1,2,3)),
	constraint bill_pay_state_ck check (pay_state in (0,1))
);


--ģ���
drop table MODULE_INFO
create table module_info(
		module_id 	number(4) constraint module_info_id_pk primary key,
		name 		varchar2(50) not null
);
mysql
create table module_info(
	module_id 	INT(4) ,
	name 		varchar(50) not null,
	constraint module_info_id_pk primary key(module_id)
);
--���ܱ�
drop table FUNCTION_INFO
create table function_info(
		function_id 	number(8) constraint function_info_id_pk primary key,
		function_code 	varchar2(50) unique not null,
  	module_id   		number(4) constraint function_module_id_fk
                			references module_info(module_id) not null,
		name 			varchar2(50) not null,
  	url 				varchar2(100) not null
);
mysql
create table function_info(
		function_id 	INT(8),
		function_code 	varchar(50) unique not null,
  	module_id   		INT(4) not null,
		name 			varchar(50) not null,
  	url 				varchar(100) not null,
		constraint function_info_id_pk primary key(function_id),
		constraint function_module_id_fk FOREIGN KEY(module_id) references module_info(module_id)
);
--��ɫ��
drop table ROLE_INFO;
create table role_info(
		role_id		number(4) 		constraint role_info_id_pk primary key,
		name 		varchar2(50) 	not null
);
mysql
create table role_info(
	role_id		INT(4) ,
	name 		varchar(50) 	not null,
	constraint role_info_id_pk primary key(role_id)
);

--��ɫģ���
drop table ROLE_MODULE;
create table role_module(
		role_id     number(4) constraint role_module_role_id_fk 
						references role_info(role_id) not null,
  	module_id   number(4) constraint role_module_module_id_fk 
						references module_info(module_id) not null,
  	constraint role_module_pk primary key(role_id,module_id)
);


--����Ա��
drop table ADMIN_INFO
create table admin_info(
   	admin_id 	number(4) primary key not null,
   	admin_code 	varchar2(30) unique not null,
   	password 	varchar2(30) not null,
   	name 		varchar2(30) not null,
   	telephone 	varchar2(15),
   	email 		varchar2(50),
   	enrolldate 	date default sysdate not null
);
mysql
create table admin_info(
   	admin_id 	INT(4) primary key not null,
   	admin_code 	varchar(30) unique not null,
   	password 	varchar(30) not null,
   	name 		varchar(30) not null,
   	telephone 	varchar(15),
   	email 		varchar(50),
   	enrolldate 	timestamp NULL DEFAULT CURRENT_TIMESTAMP
);

--����Ա��ɫ��
drop table ADMIN_ROLE
create table admin_role(
		admin_id	number(8) constraint admin_role_admin_id_fk 
						references admin_info(admin_id) not null,
  	role_id		number(4) constraint admin_role_role_id_fk 
						references role_info(role_id) not null,
  	constraint admin_role_pk primary key(admin_id,role_id)
);
mysql
create table admin_role(
	admin_id	INT(8) not null,
  role_id		INT(4) not null,
  constraint admin_role_pk primary key(admin_id,role_id),
	constraint admin_role_admin_id_fk FOREIGN KEY(admin_id) references admin_info(admin_id) ,
	constraint admin_role_role_id_fk FOREIGN KEY(role_id) references role_info(role_id)
);
--ģ���
insert into MODULE_INFO values(1,'��ɫ����');
insert into MODULE_INFO values(2,'����Ա');
insert into MODULE_INFO values(3,'�ʷѹ���');
insert into MODULE_INFO values(4,'�����˺�');
insert into MODULE_INFO values(5,'ҵ���˺�');
insert into MODULE_INFO values(6,'�˵�����');
insert into MODULE_INFO values(7,'����');
--��ɫ��
insert into role_info values(100,'����Ա');
insert into role_info values(200,'ӪҵԱ');
insert into role_info values(300,'����');
insert into role_info values(400,'aaa');
insert into role_info values(500,'bbb');
insert into role_info values(600,'ccc');
--��ɫģ���
insert into role_module values(100,1);
insert into role_module values(100,2);
insert into role_module values(200,3);
insert into role_module values(200,4);
insert into role_module values(200,5);
insert into role_module values(200,6);
insert into role_module values(300,7);
--����Ա��
insert into admin_info values(2000,'admin','123','ADMIN','123456789','admin@tarena.com.cn',sysdate);
insert into admin_info values(3000,'zhangfei','123','ZhangFei','123456789','zhangfei@tarena.com.cn',sysdate);
insert into admin_info values(4000,'liubei','123','LiuBei','123456789','liubei@tarena.com.cn',sysdate);
insert into admin_info values(5000,'caocao','123','CaoCao','123456789','caocao@tarena.com.cn',sysdate);
insert into admin_info values(6000,'aaa','123','AAA','123456789','aaa@tarena.com.cn',sysdate);
insert into admin_info values(7000,'bbb','123','BBB','123456789','bbb@tarena.com.cn',sysdate);
mysql
insert into admin_info values(2000,'admin','123','ADMIN','123456789','admin@tarena.com.cn',DEFAULT);
insert into admin_info values(3000,'zhangfei','123','ZhangFei','123456789','zhangfei@tarena.com.cn',DEFAULT);
insert into admin_info values(4000,'liubei','123','LiuBei','123456789','liubei@tarena.com.cn',DEFAULT);
insert into admin_info values(5000,'caocao','123','CaoCao','123456789','caocao@tarena.com.cn',DEFAULT);
insert into admin_info values(6000,'aaa','123','AAA','123456789','aaa@tarena.com.cn',DEFAULT);
insert into admin_info values(7000,'bbb','123','BBB','123456789','bbb@tarena.com.cn',DEFAULT);
--����Ա��ɫ��
insert into admin_role values(2000,100);
insert into admin_role values(3000,200);
insert into admin_role values(4000,300);
insert into admin_role values(5000,100);
insert into admin_role values(5000,200);
insert into admin_role values(5000,300);
mysql
http://www.cnblogs.com/lyhabc/p/3691555.html
