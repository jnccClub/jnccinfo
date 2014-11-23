/*
SQLyog Ultimate v9.10 
MySQL - 5.6.15 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

/*Table structure for table `e_application` */

DROP TABLE IF EXISTS `e_application`;

CREATE TABLE `e_application` (
  `applicationID` varchar(32) NOT NULL,
  `createUser` varchar(32) DEFAULT NULL,
  `approver` varchar(32) DEFAULT NULL,
  `curentHandler` varchar(32) DEFAULT NULL,
  `courseName` varchar(128) DEFAULT NULL,
  `className` varchar(32) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `os` varchar(16) DEFAULT NULL,
  `software` varchar(128) DEFAULT NULL,
  `booktype` int(11) DEFAULT NULL,
  `createdatetime` timestamp NULL DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `approvedtime` timestamp NULL DEFAULT NULL,
  `approveremark` varchar(1024) DEFAULT NULL,
  `comment` varchar(64) DEFAULT NULL,
  `contactNO` varchar(32) DEFAULT NULL,
  `Email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`applicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_application` */

/*Table structure for table `e_arrangement` */

DROP TABLE IF EXISTS `e_arrangement`;

CREATE TABLE `e_arrangement` (
  `zone` varchar(16) CHARACTER SET utf8 NOT NULL,
  `floor` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course` int(11) NOT NULL,
  `appID` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `comment` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`zone`,`date`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `e_arrangement` */

/*Table structure for table `e_coursemap` */

DROP TABLE IF EXISTS `e_coursemap`;

CREATE TABLE `e_coursemap` (
  `course` int(11) NOT NULL,
  `beginTime` varchar(16) NOT NULL,
  `endTime` varchar(16) NOT NULL,
  `commnet` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `e_coursemap` */

insert  into `e_coursemap`(`course`,`beginTime`,`endTime`,`commnet`) values (1,'08:00','10:00',NULL),(2,'10:00','12:00',NULL),(3,'12:00','14:00',NULL),(4,'14:00','16:00',NULL);

/*Table structure for table `e_member` */

DROP TABLE IF EXISTS `e_member`;

CREATE TABLE `e_member` (
  `username` varchar(32) NOT NULL,
  `realname` varchar(64) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `sex` varchar(11) DEFAULT '0',
  `birth` date DEFAULT '1990-01-01',
  `schoolno` varchar(32) DEFAULT NULL,
  `phoneno` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `qq` varchar(16) DEFAULT NULL,
  `preference` varchar(256) DEFAULT NULL,
  `selfIntroduce` varchar(256) DEFAULT NULL,
  `Role` varchar(5) DEFAULT '1',
  `State` varchar(5) DEFAULT '00000',
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_member` */

insert  into `e_member`(`username`,`realname`,`password`,`sex`,`birth`,`schoolno`,`phoneno`,`email`,`qq`,`preference`,`selfIntroduce`,`Role`,`State`,`status`) values ('1111','','','male','1990-01-01',NULL,'','','','HTML, CSS, UCD','','1','00000',NULL),('70206317','计算中心俱乐部','shenghuo','male','1990-01-01',NULL,'','','','HTML, CSS, UCD','','1','00000',NULL),('7020631711','计算中心俱乐部','shenghuo','female','1990-01-01',NULL,'','','','HTML, CSS, UCD','','1','00000',NULL),('jncc','计算中心俱乐部','shenghuo','male','1990-01-01','161210327','13888888888','zhuhaohan@nuaa.edu.cn','825857104','HTML, CSS, UCD','','1','00000',NULL),('test','计算中心俱乐部','jncc','male','1990-01-01','161210327','13888888888','zhuhaohan@nuaa.edu.cn','825857104','HTML, CSS, UCD','','1','00000',NULL),('计算中心俱乐部','计算中心俱乐部','shenghuo','male','1990-01-01',NULL,'','','','HTML, CSS','','1','00000',NULL);

/*Table structure for table `e_software` */

DROP TABLE IF EXISTS `e_software`;

CREATE TABLE `e_software` (
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `zone` varchar(16) CHARACTER SET utf8 NOT NULL,
  `createdate` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `os` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `operator` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `comment` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`name`,`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `e_software` */

insert  into `e_software`(`name`,`zone`,`createdate`,`os`,`operator`,`comment`) values ('3DMax','','2014-11-07','','张磊',''),('a sffsf','','','','',''),('a sffsf','dd','','','',''),('a sffsfttt','dd','','','',''),('Access','','2014-10-09','','张磊',''),('AOTHEWERE','','2014-11-16','','张磊',''),('AOTHEWERE 1','7F','2014-11-16','Windows XP','王玮',''),('AutoCAD','','2014-11-05','','张磊',''),('C','','2014-10-29','','张磊',''),('C++','','2014-10-16','','张磊',''),('Catia','','2014-10-12','','张磊',''),('CCS','','2014-10-20','','张磊',''),('Cooledit','','2014-11-01','','张磊',''),('Dreamwear','','2014-10-25','','张磊',''),('EWB','','2014-10-13','','张磊',''),('EXCEL','','2014-10-27','','张磊',''),('FLASH','','2014-11-15','','张磊',''),('Fortran','','2014-10-30','','张磊',''),('FrontPage','','2014-10-08','','张磊',''),('Iuastrator','','2014-11-04','','张磊',''),('Java','','2014-10-22','','张磊',''),('Masm','','2014-10-23','','张磊',''),('Mathematica','','2014-11-14','','张磊',''),('Matlab','','2014-10-10','','张磊',''),('MaxpulsII','','2014-10-19','','张磊',''),('Modelsim','','2014-10-11','','张磊',''),('Multisimprotel','','2014-10-18','','张磊',''),('office2003','','2014-10-07','Windows 7|Ubuntu','张磊',''),('Oracle','','2014-10-24','','张磊',''),('Photoshop','','2014-11-02','','张磊',''),('QuartusII','','2014-10-17','','张磊',''),('Rhino','','2014-11-03','','张磊',''),('SQL','','2014-10-14','','张磊',''),('TurboC','','2014-10-21','','张磊',''),('VB','','2014-10-26','','张磊',''),('VFP','','2014-10-15','','张磊',''),('新时代交互','','2014-11-10','','张磊',''),('新理念','','2014-11-12','','张磊',''),('新视野','','2014-11-11','','张磊',''),('民航英语听力','','2014-11-13','','张磊','');

/*Table structure for table `e_zonecfg` */

DROP TABLE IF EXISTS `e_zonecfg`;

CREATE TABLE `e_zonecfg` (
  `zone` varchar(16) CHARACTER SET utf8 NOT NULL,
  `floor` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `mic` tinyint(1) DEFAULT NULL,
  `projector` tinyint(1) DEFAULT NULL,
  `teachermanage` tinyint(1) DEFAULT NULL,
  `comment` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `e_zonecfg` */

insert  into `e_zonecfg`(`zone`,`floor`,`seats`,`mic`,`projector`,`teachermanage`,`comment`) values ('10A','10',50,0,0,0,'软件备份'),('10B','10',50,0,0,0,'软件备份'),('10C','10',50,0,0,0,'软件备份'),('10E','10',50,0,0,0,'软件备份'),('10F','10',50,0,0,0,'软件备份'),('7A','7',50,0,0,0,'软件备份'),('7B','7',50,0,0,0,'软件备份'),('7C','7',50,0,0,0,'软件备份'),('7D','7',50,0,0,0,'软件备份'),('7E','7',50,0,0,0,'软件备份'),('7F','7',50,0,0,0,'软件备份'),('8A','8',50,0,0,0,'软件备份'),('8B','8',50,0,0,0,'软件备份'),('8C','8',50,0,0,0,'软件备份'),('9A','9',50,0,0,0,'软件备份'),('9B','9',50,0,0,0,'软件备份'),('9C','9',50,0,0,0,'软件备份');

/*Table structure for table `hibernatetest` */

DROP TABLE IF EXISTS `hibernatetest`;

CREATE TABLE `hibernatetest` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hibernatetest` */

insert  into `hibernatetest`(`id`,`username`) values (1,'sb'),(2,'cg'),(3,'sb'),(4,'sb'),(5,'sb'),(6,'sb'),(7,'sb'),(8,'sb'),(9,'sb'),(10,'sb'),(11,'sb'),(12,'sb');

/*Table structure for table `homepageinfo` */

DROP TABLE IF EXISTS `homepageinfo`;

CREATE TABLE `homepageinfo` (
  `homepageid` int(10) unsigned NOT NULL DEFAULT '1',
  `caption` varchar(512) DEFAULT NULL,
  `content` longblob,
  PRIMARY KEY (`homepageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `homepageinfo` */

insert  into `homepageinfo`(`homepageid`,`caption`,`content`) values (1,'i love county','<p><span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;<span style=\"font-family: &#39;times new roman&#39;;\">i love you&#65281;&#65281;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>'),(2,'i love county','<p>sfsdf</p>'),(3,'Every thing goes well','<p><font color=\"#ffc000\"><b><i><u>zhuman is a pig</u></i></b></font></p>'),(4,'nishuoba','<p style=\"margin-top: 0.4em; margin-bottom: 0.5em; line-height: 19.1875px; font-size: 13px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    The novel tells of &quot;Love Story&quot; is romantic and funny, yet a tragic story. It is the story of two young college grads, whose love was stronger than any of the tests life threw at them. Oliver Barrett&nbsp;IV, a&nbsp;<a href=\"http://en.wikipedia.org/wiki/Harvard\" title=\"Harvard\" class=\"mw-redirect\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\">Harvard</a>&nbsp;<a href=\"http://en.wikipedia.org/wiki/Jock_(athlete)\" title=\"Jock (athlete)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\">jock</a>&nbsp;and wealthy heir to the Barrett fortune and legacy, and Jennifer Cavilleri, the quick-witted daughter of a Rhode Island baker. Oliver (Ollie) was expected to follow in his father&#39;s huge footsteps, while Jennifer (Jenny), a music major studying at&nbsp;<a href=\"http://en.wikipedia.org/wiki/Radcliffe_College\" title=\"Radcliffe College\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\">Radcliffe College</a>&nbsp;planned to study in&nbsp;<a href=\"http://en.wikipedia.org/wiki/Paris\" title=\"Paris\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\">Paris</a>. From very different worlds, Oliver and Jenny immediately attracted and their love deepened. The story of Jenny and Ollie is a realistic story of two young people who come from two separate worlds and are joined together in the most unlikely of ways.\r\n</p>\r\n<p style=\"margin-top: 0.4em; margin-bottom: 0.5em; line-height: 19.1875px; font-size: 13px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    Upon graduation from college, the two decide to marry against the wishes of Oliver&#39;s father, who thereupon severs all ties with his son. Without his father&#39;s financial support, the couple struggles to pay Oliver&#39;s way through&nbsp;<a href=\"http://en.wikipedia.org/wiki/Harvard_Law_School\" title=\"Harvard Law School\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\">Harvard Law School</a>, with Jenny working as a private school teacher. Graduating third in his class, Oliver gets several job offers and takes up a position at a respectable New York&nbsp;<a href=\"http://en.wikipedia.org/wiki/Law_firm\" title=\"Law firm\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\">law firm</a>. Jenny promises to follow Oliver anywhere on the East Coast. The couple moves to&nbsp;<a href=\"http://en.wikipedia.org/wiki/New_York_City\" title=\"New York City\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\">New York City</a>, excited to spend more time together, rather than in working and studying. With Oliver&#39;s new income, the pair of 24-year-olds decide to have a child. After Jenny fails to conceive, they consult a medical specialist, who after repeated tests, informs Oliver that Jenny is ill and will soon die as she is suffering from&nbsp;<a href=\"http://en.wikipedia.org/wiki/Leukemia\" title=\"Leukemia\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\">leukemia</a>.\r\n</p>\r\n<p style=\"margin-top: 0.4em; margin-bottom: 0.5em; line-height: 19.1875px; font-size: 13px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    As instructed by his doctor, Oliver attempts to live a &quot;normal life&quot; without telling Jenny of her condition. Jenny nevertheless discovers her ailment after confronting her doctor about her recent illness. With their days together numbered, Jenny begins a costly cancer therapy, and Oliver soon becomes unable to afford the multiplying hospital expenses. Desperate, he seeks financial relief from his father. Instead of telling his father what the money is truly for, Oliver misleads him. From her hospital bed, Jenny speaks with her father about funeral arrangements, and then asks for Oliver. She tells him to avoid blaming himself, and asks him to embrace her tightly before she dies. When Mr.&nbsp;Barrett realizes that Jenny is ill and that his son borrowed the money for her, he immediately sets out for New York. By the time he reaches the hospital, Jenny is dead. Mr.&nbsp;Barrett apologizes to his son, who replies with something Jenny had once told him: &quot;Love means never having to say you&#39;re sorry&quot;...and breaks down in his arms.\r\n</p>\r\n<p>\r\n    <span style=\"text-decoration: underline;\"><strong><em><span style=\"text-decoration: underline; color: rgb(255, 192, 0); border: 1px solid rgb(0, 0, 0);\"></span></em></strong></span><br/>\r\n</p>'),(5,'buzhidao yao ','<p><span style=\"font-family: &#39;times new roman&#39;;\">i don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t knowni don&#39;t known</span></p>');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `NO` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sequence',
  `NewsTitle` varchar(100) NOT NULL DEFAULT 'Welcome',
  `Modifytime` timestamp NOT NULL DEFAULT '2013-11-24 19:42:28',
  `Createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NewsContent` longtext,
  PRIMARY KEY (`NO`,`NewsTitle`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`NO`,`NewsTitle`,`Modifytime`,`Createtime`,`NewsContent`) values (3,'test1','2013-11-24 19:37:17','2013-11-24 19:37:17','<p>&#27861;&#24072;&#25171;&#21457;&#22763;&#22823;&#22827;</p>'),(4,'test2','2013-11-24 19:42:28','2013-11-24 19:42:28','<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\">\r\n    <li>\r\n        <p>\r\n            <span style=\"color: rgb(255, 0, 0);\"><strong><em><span style=\"border: 1px solid rgb(0, 0, 0); text-decoration: underline;\">i love china so much</span></em></strong></span>\r\n        </p>\r\n    </li>\r\n</ol>'),(5,'test3','2013-11-24 19:42:28','2013-11-24 19:45:36','Nothing3'),(7,'test520','2013-11-24 19:42:28','2013-11-24 19:53:33','Nothing');

/*Table structure for table `processtype` */

DROP TABLE IF EXISTS `processtype`;

CREATE TABLE `processtype` (
  `processID` varchar(32) NOT NULL,
  `processType` varchar(32) DEFAULT NULL,
  `processContent` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`processID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `processtype` */

/*Table structure for table `software_list` */

DROP TABLE IF EXISTS `software_list`;

CREATE TABLE `software_list` (
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `version` varchar(12) CHARACTER SET utf8 NOT NULL,
  `zone` varchar(32) CHARACTER SET utf8 NOT NULL,
  `createdate` date DEFAULT NULL,
  `os` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `operator` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `comment` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`name`,`version`,`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `software_list` */

insert  into `software_list`(`name`,`version`,`zone`,`createdate`,`os`,`operator`,`comment`) values ('auto Cad','7.5','',NULL,NULL,NULL,NULL);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` char(1) NOT NULL,
  `username` char(1) DEFAULT NULL,
  `password` char(1) DEFAULT NULL,
  `age` char(1) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

/*Table structure for table `tablename1` */

DROP TABLE IF EXISTS `tablename1`;

CREATE TABLE `tablename1` (
  `t` varchar(32) NOT NULL,
  PRIMARY KEY (`t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tablename1` */

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `test` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `zone_os` */

DROP TABLE IF EXISTS `zone_os`;

CREATE TABLE `zone_os` (
  `zone` varchar(18) CHARACTER SET utf8 NOT NULL,
  `osname` varchar(64) CHARACTER SET utf8 NOT NULL,
  `displayname` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `usage` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `operator` varchar(18) CHARACTER SET utf8 DEFAULT '张磊',
  `commnet` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`zone`,`osname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `zone_os` */

insert  into `zone_os`(`zone`,`osname`,`displayname`,`createDate`,`usage`,`operator`,`commnet`) values ('7E','windows 7','WIN7',NULL,NULL,'张磊',NULL),('7F','windows 7','WIN7',NULL,NULL,'张磊',NULL),('7F','windows XP','WIN XP',NULL,NULL,'张磊',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
