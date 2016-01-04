/*
SQLyog Ultimate v9.10 
MySQL - 5.1.71 : Database - test
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

/*Table structure for table `e_seat` */

DROP TABLE IF EXISTS `e_seat`;

CREATE TABLE `e_seat` (
  `zone` varchar(32) NOT NULL,
  `date` varchar(14) NOT NULL,
  `begintime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `creattime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `seatid` varchar(10) NOT NULL,
  `seat` int(11) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `commnet` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`zone`,`date`,`begintime`,`endtime`,`seatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_seat` */

insert  into `e_seat`(`zone`,`date`,`begintime`,`endtime`,`creattime`,`seatid`,`seat`,`user`,`commnet`) values ('7B','2015-03-16',8,9,'2015-03-16 16:17:50','3_4',14,'70203902',NULL),('7B','2015-03-16',8,9,'2015-03-16 16:18:01','4_1',16,'70203902',NULL),('7B','2015-03-16',8,9,'2015-03-16 17:50:10','4_4',19,'70203902',NULL),('7B','2015-03-16',8,9,'2015-03-16 16:17:55','4_5',20,'70203902',NULL),('7B','2015-03-16',8,11,'2015-03-16 16:18:39','3_3',13,'70203902',NULL),('7B','2015-03-16',9,10,'2015-03-16 16:18:21','3_5',15,'70203902',NULL),('7B','2015-03-20',8,9,'2015-03-20 19:08:23','3_1',11,'70203902',NULL),('7B','2015-03-21',8,9,'2015-03-20 19:09:39','3_4',14,'70203902',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
