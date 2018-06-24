/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.21 : Database - massage_dn
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`massage_dn` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `massage_dn`;

/*Table structure for table `ad_activity` */

DROP TABLE IF EXISTS `ad_activity`;

CREATE TABLE `ad_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên giảng viên',
  `description` text NOT NULL COMMENT 'mô tả',
  `image` varchar(255) NOT NULL COMMENT 'ảnh đại diện',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `type` bigint(20) NOT NULL COMMENT 'Loại chuyên mục',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ad_activity` */

insert  into `ad_activity`(`id`,`name`,`description`,`image`,`priority`,`type`,`is_active`,`created_at`,`updated_at`) values (1,'Huấn luyện và dẫn dắt','Huấn luyện và dẫn dắt Huấn luyện và dẫn dắt Huấn luyện và dẫn dắtHuấn luyện và dẫn dắt','/31/9f/f3/5a5b2f86375d2.jpg',10,1,1,'2018-01-14 11:23:02','2018-01-14 11:23:02');

/*Table structure for table `ad_advertise` */

DROP TABLE IF EXISTS `ad_advertise`;

CREATE TABLE `ad_advertise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên banner',
  `description` text COMMENT 'Mô tả',
  `location` varchar(255) DEFAULT NULL COMMENT 'Trang hiển thị',
  `view_type` varchar(10) DEFAULT NULL COMMENT 'Kiểu hiển thị S=Slide, F=Flash, I=Ảnh',
  `amount` bigint(20) DEFAULT '0' COMMENT 'Số lượng ảnh hiển thị',
  `width` bigint(20) DEFAULT '0' COMMENT 'Chiều rộng',
  `height` bigint(20) DEFAULT '0' COMMENT 'Chiều cao',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `lang` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `ad_advertise` */

insert  into `ad_advertise`(`id`,`name`,`description`,`location`,`view_type`,`amount`,`width`,`height`,`is_active`,`created_by`,`updated_by`,`created_at`,`updated_at`,`lang`) values (1,'Trang chủ - Slideshow','',NULL,'1',30,0,0,1,1,1,'2015-06-12 18:27:13','2015-10-22 16:41:30','vi');

/*Table structure for table `ad_advertise_image` */

DROP TABLE IF EXISTS `ad_advertise_image`;

CREATE TABLE `ad_advertise_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) NOT NULL COMMENT 'Đường dẫn file',
  `advertise_id` bigint(20) DEFAULT NULL COMMENT 'banner quảng cáo',
  `extension` varchar(200) DEFAULT NULL COMMENT 'phần mở rộng của file',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng',
  `link` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn chi tiết (nếu có)',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `advertise_id_idx` (`advertise_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `ad_advertise_image` */

insert  into `ad_advertise_image`(`id`,`file_path`,`advertise_id`,`extension`,`priority`,`is_active`,`link`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (36,'/aa/18/8a/59673844cdbd8.jpg',1,'jpg',0,1,'',1,1,'2015-11-15 17:05:25','2017-07-13 09:07:16'),(37,'/a0/c6/6a/579dcfcb19fc6.jpg',1,'jpg',0,0,'',22,1,'2016-07-30 12:44:33','2017-07-13 09:07:28');

/*Table structure for table `ad_advertise_location` */

DROP TABLE IF EXISTS `ad_advertise_location`;

CREATE TABLE `ad_advertise_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'Ten vi tri quang cao',
  `page` varchar(200) DEFAULT NULL COMMENT 'Trang hiển thị',
  `template` varchar(200) DEFAULT NULL COMMENT 'Duong dan toi file template quang cao',
  `advertise_id` bigint(20) DEFAULT NULL COMMENT 'banner quảng cáo',
  `priority` bigint(20) NOT NULL COMMENT 'Thứ tự hiển thị',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `ad_advertise_location` */

insert  into `ad_advertise_location`(`id`,`name`,`page`,`template`,`advertise_id`,`priority`) values (1,'top trang chu','homepage','topone',1,1),(10,'Banner chuyên mục sản phẩm','products','topone',1,0),(11,'Chi tiết sản phẩm','product_detail','topone',1,0),(12,'Chuyên mục tin tức','category_news','topone',1,0),(13,'Trang sản phẩm','product_all','topone',1,0),(14,'Trang tìm kiếm','page_search','topone',1,0),(15,'Chi tiết tin tức','article_detail','topone',1,0);

/*Table structure for table `ad_album` */

DROP TABLE IF EXISTS `ad_album`;

CREATE TABLE `ad_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên Album',
  `description` text NOT NULL COMMENT 'Giới thiệu album',
  `event_date` datetime NOT NULL COMMENT 'Ngày diễn ra sự kiện',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: Chưa kích hoạt, 1: đã kích hoạt)',
  `image_path` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái mặc định để hiển thị, 1: hiển thị, 0: không hiển thị.',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `ad_album` */

insert  into `ad_album`(`id`,`name`,`description`,`event_date`,`priority`,`is_active`,`image_path`,`is_default`,`lang`,`slug`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'Boss Auto - MMO tốt nhất hiện nay','Bạn muốn kiếm tiền nhanh, hãy đến với Boss Auto - Web site đầu tư ô tô lớn nhất thế giới.','2015-06-01 00:00:00',1,0,'/5c/f4/45/55a228338611b.jpg',0,'vi','boss-auto-mmo-tot-nhat-hien-nay',1,15,'2015-06-20 16:21:38','2015-09-27 23:53:36'),(2,'Sống và chiến đấu','Kungfu Pet - Game nuôi thú chiến đấu tuyệt đỉnh. Mời bạn cùng tham gia với chúng tôi...','2015-07-01 00:00:00',0,0,'/fc/03/3f/55a2291390465.png',0,'vi','song-va-chien-dau',1,15,'2015-07-12 08:45:07','2015-09-27 23:53:34'),(3,'Một người khỏe - 2 người vui','Một người khỏe - 2 người vui','2015-07-10 00:00:00',3,0,'/71/38/87/55a23a187c3d5.jpg',0,'vi','mot-nguoi-khoe-2-nguoi-vui',1,15,'2015-07-12 09:56:04','2015-09-27 23:53:42'),(4,'Chùm thơ thu','Mùa thu là mùa của yêu thương, cảm xúc','2015-07-06 00:00:00',1,0,'/6b/b8/86/55a23a512e072.jpg',0,'vi','chum-tho-thu',1,15,'2015-07-12 09:58:41','2015-09-27 23:53:38'),(5,'tesst','','0000-00-00 00:00:00',1,0,'/4c/4d/d4/55b4ac9ede810.jpg',0,'vi','tesst',1,15,'2015-07-26 09:47:10','2015-09-27 23:53:39'),(6,'Tạo album mới','','0000-00-00 00:00:00',0,0,'/ba/5a/ab/55be4adc826c7.png',0,'vi','tao-album-moi',1,15,'2015-08-02 16:52:44','2015-09-27 23:53:35'),(7,'Test Album','Test Album','2015-09-09 00:00:00',1,0,'/d6/73/3d/55efbe8749f35.jpg',0,'vi','test-album',1,15,'2015-09-09 12:07:20','2015-09-27 23:53:41'),(8,'Album tạo thử','Giới thiệu album tạo thử','2015-09-10 00:00:00',1,0,'/9a/cd/d9/55efdb715add9.jpg',0,'vi','album-tao-thu',1,15,'2015-09-09 14:10:42','2015-09-27 23:53:41'),(29,'ádfsad','ád','0000-00-00 00:00:00',0,1,NULL,0,'vi','adfsad',22,22,'2017-07-02 05:05:19','2017-07-02 05:05:22');

/*Table structure for table `ad_album_photo` */

DROP TABLE IF EXISTS `ad_album_photo`;

CREATE TABLE `ad_album_photo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên photo',
  `file_path` varchar(255) NOT NULL COMMENT 'Đường dẫn file',
  `album_id` bigint(20) DEFAULT NULL COMMENT 'banner quảng cáo',
  `extension` varchar(200) DEFAULT NULL COMMENT 'phần mở rộng của file',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Ảnh đại diện cho Album',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id_idx` (`album_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `ad_album_photo` */

insert  into `ad_album_photo`(`id`,`name`,`file_path`,`album_id`,`extension`,`priority`,`is_active`,`is_default`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'Boss 1','/90/76/69/55a239027d329.jpg',1,'',1,1,0,1,1,'2015-07-12 09:53:06','2015-07-12 09:53:06'),(2,'Boss 2','/b1/f9/9b/55a2392d1d459.jpg',1,'',2,1,0,1,1,'2015-07-12 09:53:49','2015-07-12 09:53:49'),(3,'Sống 1','/07/86/60/55a23951717d9.png',2,'',1,1,0,1,1,'2015-07-12 09:54:25','2015-07-12 09:54:25'),(4,'Sống 2','/60/39/96/55a2396d9e64d.jpg',2,'',2,1,0,1,1,'2015-07-12 09:54:53','2015-07-12 09:54:53'),(5,'1','/6f/17/76/55a239c3399fd.jpg',3,'',1,1,0,1,1,'2015-07-12 09:56:19','2015-07-12 09:56:19'),(6,'vui 2','/67/10/06/55a239fb954db.png',3,'',2,1,0,1,1,'2015-07-12 09:57:15','2015-07-12 09:57:15'),(7,'4334','/05/ba/a0/55a23a65aac87.jpg',4,'',3,1,0,1,1,'2015-07-12 09:59:01','2015-07-12 09:59:01'),(8,'anh 1','/19/f4/41/55b4acd107b95.jpg',5,'',0,1,0,1,1,'2015-07-26 09:48:01','2015-07-26 09:48:01'),(9,'Ảnh mới','/c3/14/4c/55b4c59bdd585.jpg',2,'',1,1,0,1,1,'2015-07-26 11:33:47','2015-07-26 11:33:47'),(10,'3234234','/3a/39/93/55b4c6335d4ab.jpg',5,'',2,1,0,1,1,'2015-07-26 11:34:59','2015-07-26 11:36:19'),(11,'Hình 1','/50/31/15/55b58cf4bc965.jpg',2,'',3,1,0,1,1,'2015-07-27 01:44:20','2015-07-27 01:44:20'),(12,'hình 1','/66/31/16/55be4b34f272a.jpg',6,'',0,1,0,1,1,'2015-08-02 16:54:13','2015-08-02 16:54:13'),(13,'hình 2','/a3/bc/ca/55be4b4ae7257.jpg',6,'',0,1,0,1,1,'2015-08-02 16:54:35','2015-08-02 16:54:35'),(14,'Ảnh 1','/a4/4b/ba/55efbec16b336.jpg',7,'',1,1,0,1,1,'2015-09-09 12:08:17','2015-09-09 12:08:17'),(15,'a','/c3/db/bc/55f0c5d3d5b5d.jpg',9,'',0,1,0,1,1,'2015-09-10 06:50:44','2015-09-10 06:50:44'),(16,'Văn phòng Hội và Báo Hà Tĩnh tổ chức giao lưu, ăn cơm trưa nhân Ngày báo chí cách mạng Việt Nam 21/6/2011','/66/ea/a6/5611ebbf20d09.jpg',24,'',1,1,0,1,15,'2015-10-05 10:17:19','2015-10-10 08:30:23'),(17,'Lãnh đạo, nhân viên Văn phòng Hội viếng và thắp hương mộ liệt sỹ Nhà báo Phạm Hồ nhân nhày thành lập Hội 21/4/2011','/46/4b/b4/5611ebcbae136.jpg',24,'',2,1,0,1,15,'2015-10-05 10:17:31','2015-10-10 08:31:07'),(19,'Ngân hàng Vietcombank','/e9/43/3e/56149608db2f3.jpg',27,'',2,1,0,15,15,'2015-10-07 10:48:24','2015-10-07 10:48:24'),(20,'Mitraco','/58/92/25/5614967ac88f3.jpg',27,'',3,1,0,15,15,'2015-10-07 10:50:18','2015-10-07 10:50:18'),(21,'Ảnh ngoài nét, sao đưa lên đây bị mờ, không nét','/ec/e0/0e/5614d1c79703d.jpg',28,'',1,1,0,15,15,'2015-10-07 15:03:19','2015-10-07 15:10:51'),(22,'Ảnh ngoài nét, sao đưa lên đây bị mờ, không nét','/96/a7/79/5614d22a90d45.jpg',28,'',2,0,0,15,15,'2015-10-07 15:04:58','2015-10-08 07:34:06'),(23,'Ảnh ngoài nét, sao đưa lên đây bị mờ, không nét','/1d/2b/b1/5614d2f43b3f5.jpg',28,'',3,1,0,15,15,'2015-10-07 15:08:20','2015-10-08 07:34:04'),(24,'Ảnh ngoài nét, sao đưa lên đây bị mờ, không nét','/7e/08/87/5615b7dd1a5a4.jpg',28,'',5,1,0,15,15,'2015-10-08 07:25:01','2015-10-08 07:25:01'),(25,'Ảnh ngoài nét, sao đưa lên đây bị mờ, không nét','/16/30/01/5615bb4fe0d46.jpg',28,'',4,1,0,15,15,'2015-10-08 07:39:43','2015-10-08 07:39:43'),(27,'Trao giải báo chí Biên phòng','/8a/91/18/561872a410b26.jpg',28,'',5,1,0,15,15,'2015-10-10 09:06:28','2015-10-10 09:06:28'),(28,'Tặng quà','/22/01/12/561873848fbd3.jpg',28,'',6,1,0,15,15,'2015-10-10 09:10:12','2015-10-10 09:10:12'),(29,'Tặng quà 2','/51/0e/e5/561873fa6c7fd.jpg',28,'',7,1,0,15,15,'2015-10-10 09:12:10','2015-10-10 09:12:10'),(30,'Thủa con thơ','/fe/02/2f/56187483a909c.jpg',28,'',8,1,0,15,15,'2015-10-10 09:14:27','2015-10-10 09:14:27'),(31,'Thamquan lan 1','/b9/5f/fb/561875d46ef4a.jpg',28,'',9,1,0,15,15,'2015-10-10 09:20:04','2015-10-10 09:20:04'),(32,'Tham quan lan 2','/a8/c2/2a/561875eabd072.jpg',28,'',10,1,0,15,15,'2015-10-10 09:20:26','2015-10-10 09:20:26'),(33,'Tham quan lân 3','/ee/09/9e/561876ad7104f.jpg',28,'',11,1,0,15,15,'2015-10-10 09:23:41','2015-10-10 09:23:41'),(34,'Tham quan4','/61/f7/76/56187b1b927b0.jpg',28,'',12,1,0,15,15,'2015-10-10 09:42:35','2015-10-10 09:42:35'),(35,'tác nghiệp','/b9/20/0b/56187ce85ffb0.jpg',28,'',13,1,0,15,15,'2015-10-10 09:50:16','2015-10-10 09:50:16'),(36,'Tác nghiệp 2','/f5/d1/1f/56187f4245092.jpg',28,'',14,1,0,15,15,'2015-10-10 10:00:18','2015-10-10 10:00:18'),(37,'abc','/65/51/16/59586370ae0f3.jpg',29,'',1,1,0,22,22,'2017-07-02 05:07:29','2017-07-02 05:07:29');

/*Table structure for table `ad_article` */

DROP TABLE IF EXISTS `ad_article`;

CREATE TABLE `ad_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL COMMENT 'Tiêu đề bài viết',
  `alttitle` varchar(255) DEFAULT NULL COMMENT 'Tiêu đề rút gọn',
  `header` longtext COMMENT 'Trích yếu',
  `body` longtext COMMENT 'Nội dung bài viết trên web',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn ảnh đại diện',
  `attributes` bigint(20) DEFAULT NULL COMMENT 'Thuộc tính của bài viết: khuyến mại, ',
  `hit_count` bigint(20) DEFAULT '0' COMMENT 'Số lượt truy cập',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `published_time` datetime DEFAULT NULL COMMENT 'Thời gian xuất bản',
  `expiredate_time` datetime DEFAULT NULL COMMENT 'Thời gian kết thúc bản tin',
  `meta` varchar(255) DEFAULT NULL COMMENT 'Nội dung meta',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'Nội dung keywords',
  `author` varchar(255) DEFAULT NULL COMMENT 'Tác giả',
  `other_link` longtext COMMENT 'Các link liên quan',
  `is_active` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (-1: Bản nháp, 0- Chờ duyệt, 1- Đã duyệt, 2- Đã đăng)',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hiển thị trên trang chủ (0- ko hiển thị, 1- hiển thị)',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `category_id` bigint(20) DEFAULT NULL COMMENT 'Id của danh mục tin tức',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `category_id_idx` (`category_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

/*Data for the table `ad_article` */

insert  into `ad_article`(`id`,`title`,`alttitle`,`header`,`body`,`image_path`,`attributes`,`hit_count`,`priority`,`published_time`,`expiredate_time`,`meta`,`keywords`,`author`,`other_link`,`is_active`,`is_hot`,`lang`,`slug`,`category_id`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (206,'bai viet 1','','bai viet 1','<p>bai viet 1</p>','/46/f9/94/595e08c2797c7.jpg',NULL,0,0,'2017-07-06 00:00:00','2017-07-29 00:00:00','bai viet 1','bai viet 1','','',2,0,'vi','bai-viet-1',4,1,1,'2017-07-06 16:54:10','2017-07-06 16:58:17'),(207,'bai viet 2','','bai viet 2','<p>bai viet 2</p>','/b1/f8/8b/595e09f35110a.jpg',NULL,0,1,'2017-07-06 00:00:00','2017-07-31 00:00:00','bai viet 2','bai viet 2','','',2,0,'vi','bai-viet-2',4,1,1,'2017-07-06 16:54:40','2017-07-06 16:59:15'),(208,'bai viet 3','','bai viet 3','<p>bai viet 3</p>','/08/2d/d0/595e09e152475.jpg',NULL,0,0,'2017-07-06 00:00:00','2017-07-29 00:00:00','bai viet 3','bai viet 3','','',2,0,'vi','bai-viet-3',4,1,1,'2017-07-06 16:55:08','2017-07-06 16:58:57'),(209,'bai viet 4','','bai viet 4','<p>vbai viet 4</p>','/6b/44/46/595e0923a0edc.jpg',NULL,0,0,'2017-07-06 00:00:00','2017-07-29 00:00:00','bai viet 4','bai viet 4','','',2,0,'vi','bai-viet-4',4,1,1,'2017-07-06 16:55:47','2017-07-06 16:55:47'),(210,'bai viet 5','','bai viet 5','<p>bai viet 5</p>','/be/6c/cb/595e0944bf6bb.jpg',NULL,0,0,'2017-07-06 00:00:00','2017-07-28 00:00:00','','bai viet 5','','',2,0,'vi','bai-viet-5',4,1,1,'2017-07-06 16:56:20','2017-07-06 16:58:36'),(211,'bai viet 6','','bai viet 6','<p>bai viet 6</p>','/48/09/94/595e0960073b1.jpg',NULL,0,0,'2017-07-06 00:00:00','2017-07-29 00:00:00','bai viet 6','bai viet 6','','',2,0,'vi','bai-viet-6',4,1,1,'2017-07-06 16:56:48','2017-07-06 16:56:48'),(212,'bai viet 7','','bai viet 7','<p>bai viet 7</p>','/74/b1/17/595e098fcf5c8.jpg',NULL,0,0,'2017-07-06 00:00:00','2017-07-29 00:00:00','bai viet 7','bai viet 7','','',2,0,'vi','bai-viet-7',4,1,1,'2017-07-06 16:57:27','2017-07-06 16:57:35');

/*Table structure for table `ad_article_comment` */

DROP TABLE IF EXISTS `ad_article_comment`;

CREATE TABLE `ad_article_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) DEFAULT NULL COMMENT 'Id của bài tin tức',
  `fullname` varchar(255) DEFAULT NULL COMMENT 'ho ten',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `content` text COMMENT 'Noi dung comment',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái duyệt bài viết',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_article_comment` */

/*Table structure for table `ad_article_related` */

DROP TABLE IF EXISTS `ad_article_related`;

CREATE TABLE `ad_article_related` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) DEFAULT NULL COMMENT 'Id của bài tin tức',
  `related_article_id` bigint(20) DEFAULT NULL COMMENT 'Id của bài viết liên quan',
  PRIMARY KEY (`id`),
  CONSTRAINT `ad_article_related_id_ad_article_id` FOREIGN KEY (`id`) REFERENCES `ad_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_article_related` */

/*Table structure for table `ad_category` */

DROP TABLE IF EXISTS `ad_category`;

CREATE TABLE `ad_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên chuyên mục',
  `description` longtext COMMENT 'Mô tả chuyên mục',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện chuyên mục',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT 'Hiển thị cột phải',
  `lang` varchar(10) DEFAULT NULL COMMENT 'Đa ngôn ngữ',
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'Danh mục cha',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `link` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn của chuyên mục (nếu có)',
  `level` bigint(20) DEFAULT '0' COMMENT 'phân cấp chuyên mục',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_category` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'có xem bài chi tiết hay không',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `parent_id_idx` (`parent_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

/*Data for the table `ad_category` */

insert  into `ad_category`(`id`,`name`,`description`,`image_path`,`is_active`,`is_hot`,`lang`,`parent_id`,`slug`,`link`,`level`,`priority`,`is_category`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'Trang chủ','',NULL,1,0,'vi',NULL,'trang-chu','@homepage',0,1,0,NULL,1,'2015-05-27 17:41:08','2015-06-15 18:39:59'),(18,'Giới thiệu','','',1,0,'vi',NULL,'gioi-thieu','',0,3,1,NULL,1,'2015-05-27 17:52:11','2015-10-22 13:59:49'),(102,'Liên hệ','',NULL,1,0,'vi',NULL,'lien-he','@contact',0,89,0,1,1,'2015-10-22 13:45:06','2015-10-22 13:45:06'),(103,'Tin tức','Tin tức',NULL,1,0,'vi',NULL,'tin-tuc','',0,90,1,1,1,'2015-11-15 16:24:40','2015-11-15 16:24:40'),(104,'Phong thủy','',NULL,1,0,'vi',103,'phong-thuy','@category_news',1,91,1,1,1,'2016-03-20 03:24:13','2016-03-20 03:24:13');

/*Table structure for table `ad_category_permission` */

DROP TABLE IF EXISTS `ad_category_permission`;

CREATE TABLE `ad_category_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL COMMENT 'Id của danh mục tin tức',
  `permission_id` bigint(20) DEFAULT NULL COMMENT 'Id quyền',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_category_permission` */

/*Table structure for table `ad_chain_image` */

DROP TABLE IF EXISTS `ad_chain_image`;

CREATE TABLE `ad_chain_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) NOT NULL COMMENT 'Đường dẫn file',
  `extension` varchar(200) DEFAULT NULL COMMENT 'phần mở rộng của file',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `product` bigint(25) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`),
  CONSTRAINT `ad_chain_image_created_by_sf_guard_user_id` FOREIGN KEY (`created_by`) REFERENCES `sf_guard_user` (`id`),
  CONSTRAINT `ad_chain_image_updated_by_sf_guard_user_id` FOREIGN KEY (`updated_by`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ad_chain_image` */

insert  into `ad_chain_image`(`id`,`file_path`,`extension`,`priority`,`created_by`,`updated_by`,`created_at`,`updated_at`,`product`,`lang`,`is_active`) values (1,'/54/0c/c5/5958b34005194.jpg',NULL,1,1,1,'2017-07-02 15:48:00','2017-07-02 15:48:00',1,'vi',1);

/*Table structure for table `ad_comment` */

DROP TABLE IF EXISTS `ad_comment`;

CREATE TABLE `ad_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Tiêu đề',
  `full_name` varchar(255) NOT NULL COMMENT 'Ho ten nguoi gop y',
  `phone_number` varchar(25) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT 'Ngày tạo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `ad_comment` */

/*Table structure for table `ad_config` */

DROP TABLE IF EXISTS `ad_config`;

CREATE TABLE `ad_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(255) NOT NULL COMMENT 'config_key',
  `config_val` text NOT NULL COMMENT 'config_val',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `ad_config` */

insert  into `ad_config`(`id`,`config_key`,`config_val`,`is_active`,`lang`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (2,'fb_keywords','Nội dung keyword của website',1,'',1,1,'2018-06-16 11:14:07','2018-06-16 11:14:07'),(3,'fb_description','Nội dung thẻ description',1,'',1,1,'2018-06-16 11:16:55','2018-06-16 11:16:55'),(4,'fb_title','Massage Hà Nội - Tổng hợp các địa điểm massage nam, nữ chất lượng nhất',1,'',1,1,'2018-06-16 11:59:00','2018-06-16 12:05:01');

/*Table structure for table `ad_contact` */

DROP TABLE IF EXISTS `ad_contact`;

CREATE TABLE `ad_contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Tiêu đề',
  `content` text,
  `lat` varchar(50) DEFAULT NULL,
  `lng` varchar(50) DEFAULT NULL,
  `zoom` varchar(5) DEFAULT NULL,
  `maptypeid` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`),
  CONSTRAINT `ad_contact_created_by_sf_guard_user_id` FOREIGN KEY (`created_by`) REFERENCES `sf_guard_user` (`id`),
  CONSTRAINT `ad_contact_updated_by_sf_guard_user_id` FOREIGN KEY (`updated_by`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_contact` */

/*Table structure for table `ad_document` */

DROP TABLE IF EXISTS `ad_document`;

CREATE TABLE `ad_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Ho ten nguoi gop y',
  `description` text,
  `file_path` varchar(255) NOT NULL,
  `extension` varchar(25) DEFAULT NULL,
  `document_number` varchar(150) DEFAULT NULL,
  `document_date` datetime DEFAULT NULL,
  `priority` int(4) DEFAULT NULL,
  `category_id` int(8) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_home` tinyint(4) DEFAULT '0',
  `is_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id_idx` (`category_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `ad_document` */

insert  into `ad_document`(`id`,`name`,`description`,`file_path`,`extension`,`document_number`,`document_date`,`priority`,`category_id`,`created_by`,`updated_by`,`created_at`,`updated_at`,`is_home`,`is_active`) values (8,'Luật Báo chí','Luật Báo chí','/3d/74/43/55f290ca8451c.docx','','1','2015-09-11 00:00:00',1,2,NULL,1,'2015-09-11 15:28:58','2015-09-14 21:18:40',0,1),(9,'Test văn bản thử','3333','/f0/a4/4f/55f29bf0aad27.doc','','2222','2015-09-11 00:00:00',1,3,NULL,1,'2015-09-11 16:16:32','2015-09-17 05:46:26',0,1),(11,'Test văn bản pháp luật','','/5c/49/95/55f9f134c82ba.doc','','11','2015-09-17 00:00:00',NULL,4,1,1,'2015-09-17 05:46:12','2015-09-17 05:46:12',0,1);

/*Table structure for table `ad_document_category` */

DROP TABLE IF EXISTS `ad_document_category`;

CREATE TABLE `ad_document_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Ho ten nguoi gop y',
  `image_path` varchar(255) DEFAULT NULL,
  `description` text,
  `priority` int(5) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(4) DEFAULT '0',
  `is_home` tinyint(1) DEFAULT '0',
  `keywords` text,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `ad_document_category` */

insert  into `ad_document_category`(`id`,`name`,`image_path`,`description`,`priority`,`created_by`,`updated_by`,`created_at`,`updated_at`,`is_active`,`is_home`,`keywords`) values (2,'Luật- Nghị Định- Thông tư','/1e/cb/b1/5a70836815ebe.jpg','Tổng hợp các văn bản Luật, Nghị định, Thông tư, Công văn hướng dẫn của các bộ ban ngành... từ các nguồn tài liệu chính thống, thuận tiện cho doanh nghiệp và người khai hải quan sử dụng.',3,1,27,'2015-05-31 19:17:32','2018-03-01 09:58:17',1,1,'Luật hải quan, thông tư 38/2015, biểu thuế xuất nhập khẩu song ngữ 2018 mới nhất, CV 1786/TCHQ, danh mục hàng hóa có điều kiện, QD38-2017-QĐ-TTg'),(3,'Phần mềm chuyên dụng','/30/85/53/556b423c6d243.png','Tổng hợp các phần mềm chuyên dụng trong XNK, hỗ trợ tối đa hóa hiệu suất xử lý công việc.',23,1,27,'2015-05-31 19:17:48','2018-03-01 10:21:37',1,1,'phần mềm khai báo hải quan ecus5vnaccs, phần mềm trình ký, teamviewer 13, ultraviewer, pdf xchange viewer,'),(4,'Ebook','/6e/21/16/556b424620f8e.png','Kho ebook khổng lồ cho những ai đam mê nghiên cứu sâu sắc về lĩnh vực XNK, các bài viết được chia sẻ lại dưới dạng ebook để bạn dễ dàng lưu về máy và chủ động sử dụng bất kỳ lúc nào.',2,1,27,'2015-05-31 19:17:58','2018-03-01 10:23:33',1,1,'ebook xuất nhập khẩu, tải tài liệu xuất nhập khẩu, sách về xuất nhập khẩu'),(6,'Tin học Xuất nhập khẩu','/6e/21/16/556b424620f8e.png','Hướng dẫn các kỹ năng tin học thiết yếu sử dụng trong xuất nhập khẩu, giúp bạn thành thạo các kỹ năng \"ghi điểm\" trong mắt nhà tuyển dụng và đồng nghiệp',4,1,27,'2015-05-31 19:17:58','2018-03-01 10:35:21',1,1,'tin học xuất nhập khẩu, excel xuất nhập khẩu'),(7,'Chứng từ mẫu',NULL,'Hàng chục mẫu chứng từ các loại phát sinh trong nhiều nghiệp vụ khác nhau của quy trình supply chain, hỗ trợ trực quan cho học viên và người mới vào nghề tiếp cận chứng từ đầy đủ, chủ động',0,26,27,'2018-02-23 13:26:09','2018-03-01 10:42:17',1,0,'chứng từ xuất nhập khẩu, tờ khai hải quan, vận đơn đường biển, vận đơn gốc, chứng nhận xuất xứ, hóa đơn thương mại, công văn xin gia hạn...');

/*Table structure for table `ad_document_download` */

DROP TABLE IF EXISTS `ad_document_download`;

CREATE TABLE `ad_document_download` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên video',
  `description` text NOT NULL COMMENT 'mô tả',
  `body` longtext COMMENT 'Nội dung bài viết trên web',
  `link` varchar(255) NOT NULL COMMENT 'link google driver',
  `image` varchar(255) NOT NULL COMMENT 'ảnh đại diện',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ad_document_download` */

insert  into `ad_document_download`(`id`,`name`,`description`,`body`,`link`,`image`,`priority`,`is_active`,`created_at`,`updated_at`) values (1,'Nguyên vật liệu thi công','1','<p>1</p>','1','/61/dc/c6/5a5896317b0cb.jpg',1,1,'2018-01-12 12:04:17','2018-01-12 12:04:17');

/*Table structure for table `ad_feed_back` */

DROP TABLE IF EXISTS `ad_feed_back`;

CREATE TABLE `ad_feed_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên',
  `email` varchar(255) NOT NULL COMMENT 'email',
  `phone` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL COMMENT 'tieu de',
  `message` varchar(255) NOT NULL COMMENT 'tin nhan',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `ad_feed_back` */

insert  into `ad_feed_back`(`id`,`name`,`email`,`phone`,`title`,`message`,`is_active`,`lang`,`created_at`,`updated_at`) values (2,'Bạch Anh Khang','dungbq89@gmail.com','0972241089','Chất lượng dịch vụ','23334234',0,'en','2017-07-23 13:17:06','2017-07-23 13:17:06'),(3,'dung','bq','092384234','test','234234',0,'en','2017-07-23 16:51:08','2017-07-23 16:51:08');

/*Table structure for table `ad_giang_vien` */

DROP TABLE IF EXISTS `ad_giang_vien`;

CREATE TABLE `ad_giang_vien` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên giảng viên',
  `description` text NOT NULL COMMENT 'mô tả',
  `image` varchar(255) NOT NULL COMMENT 'ảnh đại diện',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `body` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ad_giang_vien` */

insert  into `ad_giang_vien`(`id`,`name`,`description`,`image`,`priority`,`is_active`,`created_at`,`updated_at`,`body`) values (1,'Dương Trang (Ms Sarah)','Ms Trang là chuyên viên Logistics nhưng học viên biết đến Ms Trang như một chuyên gia đào tạo cả về kỹ năng mềm. Ms Trang sẽ đồng hành cùng các bạn để các bạn thực sự tỏa sáng, luôn là người tích cực trong cuộc sống và công việc.','/c4/97/7c/5a68051970860.jpg',2,1,'2018-01-12 16:28:07','2018-01-30 11:38:20',''),(2,'Đoàn Thúy (Mrs Jade)','Mrs Thúy là chuyên viên Xuất nhập khẩu với 7 năm kinh nghiệm tại các Công ty Xuất nhập khẩu. Mrs Thúy sẽ là người truyền cảm hứng  giúp các bạn học viên tự tin hơn trong công việc và dẫn dắt bạn đến gần hơn với nghề Xuất nhập khẩu','/70/de/e7/5a6c068ee9295.jpg',5,1,'2018-01-13 19:56:47','2018-01-30 11:37:48','');

/*Table structure for table `ad_hoc_vien` */

DROP TABLE IF EXISTS `ad_hoc_vien`;

CREATE TABLE `ad_hoc_vien` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên học viên',
  `description` text NOT NULL COMMENT 'mô tả',
  `image` varchar(255) NOT NULL COMMENT 'ảnh đại diện',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `body` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `ad_hoc_vien` */

insert  into `ad_hoc_vien`(`id`,`name`,`description`,`image`,`priority`,`is_active`,`created_at`,`updated_at`,`body`) values (9,'Bùi Ngọc Anh (1995)- Đại học Ngoại Thương','','/c5/f1/1c/5a6859a5e9cbd.jpg',100,1,'2018-01-24 13:51:43','2018-03-03 09:39:30','<p>C&ocirc; b&eacute; rất hiền l&agrave;nh, d&ugrave; trong lớp&nbsp;&iacute;t ph&aacute;t biểu hay&nbsp;đưa ra c&acirc;u hỏi nhưng bạn lại thể hiện qu&aacute; &rdquo;xuất sắc&rdquo; với Nh&agrave; tuyển dụng th&ocirc;ng qua buổi phỏng vấn dựa v&agrave;o những kinh nghiệm phỏng vấn&nbsp;được học tại CLB Y&ecirc;u Xuất Nhập Khẩu. Giờ bạn&nbsp;đang l&agrave;m vị tr&iacute; &nbsp;mua h&agrave;ng tại C&ocirc;ng ty nhập khẩu gỗ. C&ugrave;ng lắng nghe những chia sẻ của Ngọc Anh từ ng&agrave;y bắt đầu phỏng vấn đến&nbsp;ng&agrave;y&nbsp;đầu sau khi tr&uacute;ng tuyển v&agrave; qu&aacute; tr&igrave;nh thăng tiến&nbsp;của bạn nh&eacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/NA1-3.jpg\" style=\"height:345px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/NA4-6.jpg\" style=\"height:345px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/NA7-9.jpg\" style=\"height:345px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/NA4.jpg\" style=\"height:661px; width:500px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/NA6.jpg\" style=\"height:889px; width:500px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/NA1-3.jpg\" style=\"height:345px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/NA4-6.jpg\" style=\"height:345px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/NA7-9.jpg\" style=\"height:345px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/NA4.jpg\" style=\"height:960px; width:726px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"bui ngoc anh\" /><img alt=\"\" src=\"/uploads/ckfinder/images/NA6.jpg\" style=\"height:960px; width:540px\" /></p>'),(10,'Bùi Thị Miền (1995)-Sinh viên Đại học Thương Mại','','/fb/65/5f/5a6976bb84471.jpg',2,1,'2018-01-24 14:08:28','2018-02-09 15:31:25','<p>Bạn t&igrave;m đến Lớp học HAN EXIM CLUB qua việc tự t&igrave;m kiếm tr&ecirc;n mạng về c&aacute;ch Soạn chứng từ Xuất nhập khẩu, l&agrave; một sinh vi&ecirc;n chuy&ecirc;n ng&agrave;nh Thương Mại Quốc Tế n&ecirc;n bạn rất cẩn thận trước khi chọn nơi học cho m&igrave;nh. Qua nhiều nguồn th&ocirc;ng tin v&agrave; so s&aacute;nh những nơi kh&aacute;c, bạn đ&atilde; quyết định chọn học với hai c&ocirc; gi&aacute;o. Đến giữa kh&oacute;a học bạn c&oacute; đợt tập huấn tr&ecirc;n trường để đi l&agrave;m tại C&ocirc;ng ty XNK v&agrave; được đ&aacute;nh gi&aacute; cao hơn so với những bạn kh&aacute;c. Ch&uacute;ng ta sẽ update bạn sau một thời gian nữa nh&eacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/MIEN.jpg\" style=\"height:337px; width:559px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/bui%20mien2.jpg\" style=\"height:932px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/bui%20mien3.jpg\" style=\"height:337px; width:559px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/bui%20mien2.jpg\" style=\"height:932px; width:540px\" /></p>'),(11,'Đào Sỹ Tiến (1994)- ĐH Kinh tế Quốc Dân','','/3e/07/73/5a68589c144e1.jpg',40,1,'2018-01-24 16:57:48','2018-04-07 22:22:50','<p>Ch&agrave;ng trai rất &ldquo;man&rdquo;, lu&ocirc;n gi&uacute;p&nbsp;đỡ c&aacute;c bạn c&ugrave;ng lớp. Sau khi ho&agrave;n th&agrave;nh kh&oacute;a học, hiện bạn&nbsp;đang l&agrave;m tại C&ocirc;ng ty XNK về Dầu v&agrave; h&oacute;a chất. C&ugrave;ng xem những chia sẻ ng&agrave;y&nbsp;đầu l&agrave;m việc của bạn nh&eacute;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/sy%20tien.jpg\" style=\"height:356px; width:388px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/sy%20tien%201.jpg\" style=\"height:356px; width:388px\" /></p>\r\n\r\n<p>Bạn đi l&agrave;m được khoảng 1 th&aacute;ng th&igrave; được C&ocirc;ng ty cử đi tiếp đối t&aacute;c Singapore tại S&agrave;i G&ograve;n. C&ocirc;ng việc được &ldquo;đi đ&oacute; đi đ&acirc;y&rdquo; l&agrave; ước mơ của rất nhiều bạn khi bước v&agrave;o nghề Xuất Nhập Khẩu, cố gắng trau dồi ngoại ngữ v&agrave; tư duy, th&aacute;i độ tốt th&igrave; sớm muộn c&aacute;c em sẽ được nh&igrave;n nhận.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/sy%20tien%202.jpg\" style=\"height:435px; width:490px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/sy%20tien%202.jpg\" style=\"height:435px; width:490px\" /></p>\r\n\r\n<p>V&agrave; thỉnh thoảng viết mail hỏi thăm 2 c&ocirc; gi&aacute;o</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/sy%20tien%203.jpg\" style=\"height:960px; width:540px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/sy%20tien%203.jpg\" style=\"height:960px; width:540px\" /></p>\r\n\r\n<p>&nbsp;</p>'),(12,'Đào Thị Hạ Giang (1994)- ĐH Tài Nguyên Môi Trường','','/cd/a7/7c/5a68595ebfa97.jpg',3,1,'2018-01-24 17:01:02','2018-02-09 15:34:59','<p>L&agrave; một sinh vi&ecirc;n mới tốt nghiệp ĐH T&agrave;i Nguy&ecirc;n M&ocirc;i Trường, bạn đến với xuất nhập khẩu để phụ gi&uacute;p c&ocirc;ng việc kinh doanh của gia đ&igrave;nh. C&ugrave;ng l&uacute;c học th&ecirc;m cả Xuất Nhập Khẩu tại HAN EXIM CLUB v&agrave; học nghiệp vụ kế to&aacute;n tại một nơi kh&aacute;c nhưng bạn đ&atilde; &ldquo;m&ecirc;&rdquo; Xuất nhập khẩu v&agrave; đ&atilde; c&oacute; những th&agrave;nh quả đầu ti&ecirc;n khi l&agrave;m cho ch&iacute;nh gia đ&igrave;nh m&igrave;nh. Nếu bạn thực sự đam m&ecirc; th&igrave; kh&ocirc;ng g&igrave; l&agrave; kh&ocirc;ng thể phải kh&ocirc;ng?</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/GIANG%20DAO%201.jpg\" style=\"height:345px; width:540px\" /></p>'),(13,'Đào Thị Thùy Dương (1996)- Đại học Kinh tế Quốc Dân','','/1b/15/51/5a685ee37d246.jpg',20,1,'2018-01-24 17:24:35','2018-02-09 15:36:11','<p>C&ocirc; g&aacute;i trẻ của ch&uacute;ng ta đang c&oacute; một thế mạnh đ&oacute; l&agrave; ham học hỏi v&agrave; th&aacute;i độ t&iacute;ch cực, v&agrave;o lớp học của hai chị sau đ&oacute; bạn đ&atilde; c&oacute; sự bứt ph&aacute; ngoạn mục. Bạn gần như l&agrave; một ứng vi&ecirc;n m&agrave; bất cứ nh&agrave; tuyển dụng n&agrave;o cũng muốn c&oacute;, pass phỏng vấn v&agrave; nhận việc ch&iacute;nh thức lu&ocirc;n, kh&ocirc;ng bị &aacute;p lương thử việc. C&ugrave;ng xem những g&igrave; bạn ấy n&oacute;i về cuộc phỏng vấn v&agrave; c&ocirc;ng việc sau một thời gian đi l&agrave;m nh&eacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"thuy-duong\" /><img alt=\"\" src=\"/uploads/ckfinder/images/thuy%20duong.jpg\" style=\"height:345px; width:1036px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/thuy%20duong%203.jpg\" style=\"height:345px; width:586px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thuy%20duong%202.jpg\" style=\"height:345px; width:1036px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thuy%20duong%203.jpg\" style=\"height:345px; width:586px\" /></p>'),(14,'Đỗ Thị Hải (1993)- Học viện Nông nghiệp Việt Nam','','/7f/91/17/5a68600f9c37c.jpg',10,1,'2018-01-24 17:29:35','2018-02-09 15:37:16','<p>C&acirc;u chuyện của Hải l&agrave; 1 tấm gương về việc &ldquo;C&oacute; c&ocirc;ng m&agrave;i sắt c&oacute; ng&agrave;y n&ecirc;n kim&rdquo;, xuất ph&aacute;t điểm kh&ocirc;ng c&oacute; kiến thức về kinh tế n&oacute;i chung v&agrave; Xuất nhập khẩu n&oacute;i ri&ecirc;ng. Sau khi c&ocirc;ng t&aacute;c tại một c&ocirc;ng ty về bảo hộ lao động tại H&agrave; Nam, bạn đăng k&yacute; lớp Chủ nhật (học cả ng&agrave;y) v&agrave; chưa hề nghỉ buổi học n&agrave;o. Đối với bạn mỗi buổi đi học thực sự qu&yacute; gi&aacute; v&igrave; bạn phải đi cả chặng đường d&agrave;i. Kết quả l&agrave; hiện bạn đang l&agrave;m vị tr&iacute; Mua h&agrave;ng v&agrave; Xuất nhập khẩu. C&aacute;c bạn c&ugrave;ng xem phản hồi bạn ấy về kết quả buổi phỏng vấn b&ecirc;n dưới.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/do%20hai%202.jpg\" style=\"height:345px; width:582px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/do%20hai%202.jpg\" style=\"height:345px; width:582px\" /></p>'),(15,'Đoàn Thị Quỳnh (1995)- Sinh viên Đại học Kinh tế Quốc Dân','','/3a/83/33/5a68620ca5e16.jpg',0,1,'2018-01-24 17:38:04','2018-02-09 15:37:49','<p>Học vi&ecirc;n đi l&agrave;m rồi bận qu&aacute; to&agrave;n qu&ecirc;n &ldquo;b&aacute;o c&aacute;o&rdquo; sau khi học th&ocirc;i. Bạn Quỳnh đ&atilde; đi l&agrave;m vị tr&iacute; Nh&acirc;n vi&ecirc;n mua h&agrave;ng&nbsp; trước khi kết th&uacute;c kh&oacute;a học 2 tuần. Nhờ những kiến thức đ&atilde; được đ&agrave;o tạo m&agrave; bạn cũng &iacute;t phải hỏi lại gi&aacute;o vi&ecirc;n sau &nbsp;khi học bởi lẽ tr&ecirc;n lớp bạn ghi ch&eacute;p v&agrave; học h&agrave;nh rất chăm chỉ, lại c&ograve;n chủ động học tập v&agrave; t&igrave;m t&ograve;i nữa. Ch&uacute;ng ta c&ugrave;ng ch&uacute;c mừng cho Quỳnh nh&eacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"DOAN-QUYNH\" /><img alt=\"\" src=\"/uploads/ckfinder/images/DOAN%20QUYNH.jpg\" style=\"height:345px; width:388px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/DOAN%20QUYNH.jpg\" style=\"height:345px; width:388px\" /></p>'),(16,'Lê Đức Trung (1995)- Đại học Mỏ Địa Chất','','/ee/a5/5e/5a68631ca7791.jpg',5,1,'2018-01-24 17:42:36','2018-02-09 15:38:42','<p>Xuất ph&aacute;t điểm từ một chuy&ecirc;n ng&agrave;nh kh&aacute;c nhưng một khi đ&atilde; đến với HAN EXIM CLUB l&agrave; bạn ấy đ&atilde; gửi gắm tất cả hy vọng v&agrave; niềm tin để c&oacute; một nghề mới. Học vi&ecirc;n lớp Chủ Nhật cứ h&agrave;ng tuần đều đặn từ sang đến chiều tối, kh&ocirc;ng nghỉ buổi n&agrave;o. Trước khi đi phỏng vấn c&ograve;n định lập team &ocirc;n b&agrave;i vậy m&agrave; chưa kịp lập team đ&atilde; pass phỏng vấn v&agrave; đi l&agrave;m rồi.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/LE%20DUC%20TRUNG.jpg\" style=\"height:345px; width:388px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/LE%20DUC%20TRUNG.jpg\" style=\"height:345px; width:388px\" /></p>'),(17,'Hoàng Mạnh Thắng (1995)- Khoa Hải quan, ĐH Kinh tế Quốc dân','','/bb/2d/db/5a68645d6ac38.jpg',8,1,'2018-01-24 17:47:57','2018-02-09 15:39:41','<p>Một dấu ấn kh&ocirc;ng thể lẫn v&agrave;o đ&acirc;u được của bạn ấy: với vẻ ngo&agrave;i v&agrave; phong th&aacute;i nghi&ecirc;m chỉnh như c&aacute;n bộ Hải quan, học khoa Hải quan trường KTQD, c&oacute; biệt danh ở trường l&agrave; &ldquo;Gi&aacute;o sư&rdquo; v&igrave; kiến thức nền của bạn qu&aacute; chắc n&ecirc;n những ng&agrave;y đầu bạn ấy c&ograve;n lạnh l&ugrave;ng v&agrave; &iacute;t n&oacute;i. Tuy nhi&ecirc;n, bạn ấy c&oacute; th&aacute;i độ học tập nghi&ecirc;m t&uacute;c v&agrave; tư duy rất mở với kiến thức mới. N&ecirc;n dần dần bạn ấy cũng &ldquo;ngấm&rdquo; được niềm đam m&ecirc; nghề nghiệp m&agrave; c&aacute;c chị truyền cho.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/thang%20hoang.jpg\" style=\"height:539px; width:825px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/thang%20hoang%202.jpg\" style=\"height:932px; width:540px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thang%20hoang.jpg\" style=\"height:539px; width:825px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thang%20hoang%202.jpg\" style=\"height:932px; width:540px\" /></p>'),(18,'Hoàng Thị Minh Nguyệt (1995)- Đại học Giao thông vận tải','','/00/70/00/5a68661c0bfa2.jpg',12,1,'2018-01-24 17:55:24','2018-02-09 15:41:12','<p>Bạn ấy đến với lớp học Xuất nhập khẩu từ con số 0 nhưng v&ocirc; c&ugrave;ng chăm chỉ, lu&ocirc;n ngồi b&agrave;n đầu, ghi ch&eacute;p đầy đủ, kh&ocirc;ng &iacute;t lần được C&ocirc; gi&aacute;o tuy&ecirc;n dương. V&agrave; kết quả kh&ocirc;ng ngo&agrave;i mong đợi, giờ bạn đ&atilde; v&agrave; đang l&agrave;m vị tr&iacute; Chứng từ+ Khai b&aacute;o Hải quan, v&agrave; được &aacute;p dụng c&aacute;c kiến thức đ&atilde; học. Dưới đ&acirc;y l&agrave; chia sẻ của bạn ấy.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/MINH%20NGUYET.jpg\" style=\"height:345px; width:388px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/MINH%20NGUYET.jpg\" style=\"height:345px; width:388px\" /></p>\r\n\r\n<p>&nbsp;</p>'),(19,'Nguyễn Thị Hương Danh (1995)- Đại học Kinh tế Quốc dân','','/cb/59/9c/5a6867aee7e68.jpg',16,1,'2018-01-24 18:02:06','2018-03-03 10:01:04','<p>C&ocirc; g&aacute;i nhỏ nhắn, xinh xắn với nụ cười tỏa s&aacute;ng tuy nhi&ecirc;n vẫn thiếu tự tin mặc d&ugrave; xuất th&acirc;n từ đ&uacute;ng chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo. Bạn Danh l&agrave; 1 học vi&ecirc;n rất chăm chỉ, t&iacute;ch cực trong học tập, trải qua kh&oacute;a học bạn đ&atilde; trưởng th&agrave;nh l&ecirc;n rất nhiều, tự tin hơn. Ch&uacute;c mừng bạn đ&atilde; trở th&agrave;nh nh&acirc;n vi&ecirc;n chứng từ h&agrave;ng xuất tại c&ocirc;ng ty Xuất khẩu.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/HUONG%20DANH.jpg\" style=\"height:345px; width:388px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/HUONG%20DANH.jpg\" style=\"height:345px; width:388px\" /></p>'),(20,'Lê Gia Sơn (1996)- Đại học Ngoại Thương','','/0a/c8/80/5a6887e609938.jpg',20,1,'2018-01-24 20:19:34','2018-03-03 09:59:51','<p>Bạn đến với kh&oacute;a học khi mới l&agrave; sinh vi&ecirc;n năm ba Ngoại Thương, với định hướng sớm như vậy v&agrave; kết hợp với việc học đ&uacute;ng chuy&ecirc;n ng&agrave;nh th&igrave; ngay từ năm ba bạn đ&atilde; được tiếp x&uacute;c với c&aacute;c c&ocirc;ng việc thực tế tại Doanh nghiệp, c&oacute; điều kiện để &aacute;p dụng những kiến thức đ&atilde; học v&agrave; c&ograve;n gi&uacute;p việc học tr&ecirc;n lớp của bạn tốt hơn. Vậy c&aacute;c bạn năm ba c&ugrave;ng lấy bạn Sơn l&agrave;m tấm gương noi theo nh&eacute;.<img alt=\"\" src=\"/uploads/ckfinder/images/gia%20son.jpg\" style=\"height:345px; width:388px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/gia%20son.jpg\" style=\"height:345px; width:388px\" /></p>'),(21,'Lê Thị Thanh Lan (1991)- Nhân viên kế toán','','/8f/bd/d8/5a6895348b922.jpg',0,1,'2018-01-24 21:16:20','2018-02-25 11:17:03','<p>Xuất ph&aacute;t điểm từ một nh&acirc;n vi&ecirc;n kế to&aacute;n với background cũng kh&ocirc;ng li&ecirc;n quan g&igrave; đến nghề XNK. Nhưng với t&iacute;nh chủ động học hỏi v&agrave; tư duy nhanh nhạy, bạn ấy đ&atilde; vượt qua tất cả mọi kh&oacute; khăn cản trở của việc &ldquo;l&agrave;m tr&aacute;i nghề&rdquo; để vượt l&ecirc;n th&agrave;nh một nh&acirc;n vi&ecirc;n Logistics sắc sảo v&agrave; cứng cỏi chỉ sau 6 th&aacute;ng đi l&agrave;m.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/THANH%20lan%20email.jpg\" style=\"height:960px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thanh%20lan%202.jpg\" style=\"height:482px; width:604px\" /></p>\r\n\r\n<p>Học vi&ecirc;n của CLB sau khi tốt nghiệp đi l&agrave;m, c&ograve;n quay lại CLB chia sẻ kinh nghiệm đi l&agrave;m để gi&uacute;p đỡ c&aacute;c bạn kh&oacute;a sau c&oacute; th&ecirc;m sự chuẩn bị tốt nhất cho c&ocirc;ng việc. Rất cảm ơn c&aacute;c em về những t&igrave;nh cảm đặc biệt đ&oacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/THANH%20LAN%20LETTER.jpg\" style=\"height:273px; width:750px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/thanh%20lan%202.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),(22,'Lê Thị Hợp (1992)- Đại học Thủy Lợi (Hà Nội)','','/6f/62/26/5a6898ee22ec0.jpg',55,1,'2018-01-24 21:32:14','2018-02-09 15:45:55','<p>Đ&acirc;y cũng l&agrave; 1 bạn học vi&ecirc;n như vậy, đặc biệt l&agrave; kh&ocirc;ng c&oacute; li&ecirc;n quan g&igrave; đến Kinh tế cả, bạn học khoa M&ocirc;i trường của Đại học Thủy Lợi. C&aacute;i duy&ecirc;n đưa bạn đến lớp học giữa bao nhi&ecirc;u băn khoăn kh&ocirc;ng biết c&oacute; l&agrave;m được nghề n&agrave;y kh&ocirc;ng, sau buổi khai giảng được tư vấn từ gi&aacute;o vi&ecirc;n bạn đ&atilde; quyết t&acirc;m theo học. Trong qu&aacute; tr&igrave;nh học bạn biết m&igrave;nh biết ta, cố gắng gấp đ&ocirc;i, gấp ba những người kh&aacute;c v&agrave; kết quả ngo&agrave;i mong đợi khi sau kh&oacute;a học 1 th&aacute;ng l&agrave; bạn đ&atilde; c&oacute; c&ocirc;ng việc. Bạn c&oacute; t&acirc;m sự về việc Nh&agrave; tuyển dụng kh&aacute; bất ngờ v&igrave; những kiến thức bạn c&oacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/em%20hop%202.jpg\" style=\"height:538px; width:649px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/em%20hop%204.jpg\" style=\"height:430px; width:890px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/em%20hop%202.jpg\" style=\"height:538px; width:649px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/em%20hop%204.jpg\" style=\"height:430px; width:890px\" /></p>'),(23,'Lương Thị Thu Hà (1990)- Nhân viên kế toán','','/b3/ab/bb/5a689c5452e3d.jpg',0,1,'2018-01-24 21:46:44','2018-02-09 15:47:34','<p>Học vi&ecirc;n comment về trải nghiệm sau khi đi l&agrave;m, trước đ&oacute; bạn ấy kh&ocirc;ng c&oacute; ch&uacute;t kiến thức g&igrave; về Xuất nhập khẩu v&igrave; xuất th&acirc;n từ kế to&aacute;n. Giờ th&igrave; bạn ấy đang được l&agrave;m c&ocirc;ng việc m&igrave;nh th&iacute;ch. Đọc kỹ chia sẻ của bạn ấy v&igrave; những kiến thức trong kh&oacute;a học đ&atilde; gi&uacute;p bạn ấy vượt qua buổi phỏng vấn thế n&agrave;o để được nhận l&agrave;m xuất nhập khẩu nh&eacute;.<img alt=\"\" src=\"/uploads/ckfinder/images/luong%20ha%201.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/luong%20thu%20ha%202.jpg\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/luong%20ha%201.jpg\" style=\"height:345px; width:740px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/luong%20ha%202.jpg\" style=\"height:345px; width:740px\" /></p>'),(24,'Hoàng Thị Mai Hương (1996)- Đại học Ngoại Thương','','/63/3c/c6/5a689de404aa6.jpg',50,1,'2018-01-24 21:53:24','2018-04-07 22:23:28','<p>Một bạn học vi&ecirc;n FTU mới chỉ năm cuối đ&atilde; được nhận v&agrave;o c&ocirc;ng ty lớn. C&aacute;c em h&atilde;y nhớ rằng &quot;th&ocirc;ng minh kh&ocirc;ng bằng chăm chỉ&quot;, &quot;th&aacute;i độ hơn tr&igrave;nh độ&quot; c&ograve;n c&oacute; được cả 2 điều n&agrave;y bằng Perfect. Sau kh&oacute;a học với hai c&ocirc; gi&aacute;o, Mai Hương đ&atilde; trở n&ecirc;n rất tự tin, c&oacute; th&aacute;i độ tốt, t&iacute;ch cực v&agrave; đi đến đ&acirc;u cũng l&agrave; t&acirc;m điểm ch&uacute; &yacute;.<img alt=\"\" src=\"/uploads/ckfinder/images/mai%20huong%20bee.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/mai%20huong%20bee.jpg\" style=\"height:345px; width:388px\" /></p>\r\n\r\n<p>&nbsp;</p>'),(25,'Mai Thị Khuyên (1995)- Sinh viên Kinh tế Quốc dân','','/0e/5f/f0/5a697e630d51a.jpg',0,1,'2018-01-24 22:02:39','2018-02-09 15:49:44','<p>Một c&ocirc; g&aacute;i vui vẻ, th&acirc;n thiện với nụ cười lu&ocirc;n thường trực tr&ecirc;n khu&ocirc;n mặt v&agrave;&nbsp;th&aacute;i độ học tập &ndash; l&agrave;m việc nghi&ecirc;m t&uacute;c c&ugrave;ng tinh thần cầu tiến đ&atilde; gi&uacute;p em vượt qua rất nhiều ứng vi&ecirc;n &ldquo;con &ocirc;ng ch&aacute;u cha&rdquo; để c&oacute; một khởi đầu tốt hơn cả mong đợi! Đ&acirc;y cũng l&agrave; điều m&agrave; C&ocirc; gi&aacute;o lu&ocirc;n nhấn mạnh với c&aacute;c em, TH&Aacute;I ĐỘ HƠN TR&Igrave;NH ĐỘ!</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/mai%20khuyen.jpg\" style=\"height:710px; width:922px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/mai%20khuyen%202.jpg\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/mai%20khuyen.jpg\" style=\"height:710px; width:922px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/mai%20khuyen%202.jpg\" style=\"height:345px; width:393px\" /></p>'),(26,'Phạm Thị Minh Thanh (1995)- Học viện chính sách phát triển','','/91/6e/e9/5a68a116bfbee.jpg',0,1,'2018-01-24 22:07:02','2018-02-09 15:50:24','<p>Từ một c&ocirc; g&aacute;i nh&uacute;t nh&aacute;t, e d&egrave; phải một thời gian d&agrave;i khi đ&atilde; thấy rất nhiều bạn b&egrave; c&ugrave;ng trường th&agrave;nh c&ocirc;ng, c&oacute; việc l&agrave;m ngay sau kh&oacute;a học b&ecirc;n HAN EXIM CLUB th&igrave; bạn ấy mới đăng k&yacute; học. Bạn học tiến bộ từng ng&agrave;y, giờ bạn cũng đ&atilde; c&oacute; c&ocirc;ng việc m&igrave;nh mong muốn l&agrave; Nh&acirc;n vi&ecirc;n chứng từ h&agrave;ng xuất. Kh&ocirc;ng c&oacute; g&igrave; l&agrave; qu&aacute; muộn nếu em thực hiện n&oacute; ngay h&ocirc;m nay phải kh&ocirc;ng n&agrave;o?<img alt=\"\" src=\"/uploads/ckfinder/images/minh%20thanh%202.jpg\" style=\"height:924px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/minh%20thanh%202.jpg\" style=\"height:924px; width:540px\" /></p>'),(27,'Mr Nguyễn Ngọc Anh (1986)- nhân viên xuất nhập khẩu','','/29/2c/c2/5a68a29862d8a.jpg',30,1,'2018-01-24 22:13:28','2018-04-07 22:27:08','<p>Mr Ngọc Anh- xuất th&acirc;n từ ĐH Ngoại Thương nhưng anh đ&atilde; dường như &ldquo;qu&ecirc;n&rdquo; gần hết những g&igrave; đ&atilde; được học ở trường sau 1 thời gian d&agrave;i kh&ocirc;ng l&agrave;m g&igrave; li&ecirc;n quan đến kinh tế hay xuất nhập khẩu. Anh l&agrave; người anh C&ocirc; gi&aacute;o v&agrave; c&aacute;c học vi&ecirc;n lu&ocirc;n y&ecirc;u mến bởi sự nhiệt t&igrave;nh của anh. Giờ anh đ&atilde; c&oacute; rất nhiều kinh nghiệm về xuất nhập khẩu rồi v&agrave; lu&ocirc;n d&otilde;i theo sự th&agrave;nh c&ocirc;ng của c&aacute;c học vi&ecirc;n kh&aacute;c.<img alt=\"\" src=\"/uploads/ckfinder/images/mr%20ngoc%20anh%202.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/mr%20ngoc%20anh%202.jpg\" style=\"height:345px; width:630px\" /></p>'),(28,'Ngô Thị Dung (1995)- Sinh viên ĐH Giao thông vận tải','','/0d/e6/60/5a68a40429113.jpg',0,1,'2018-01-24 22:19:32','2018-02-09 15:51:45','<p>Vui mừng kh&ocirc;n xiết khi kheo c&ocirc; gi&aacute;o v&igrave; đ&atilde; tr&uacute;ng tuyển nhưng trước đ&oacute; khi mới bước v&agrave;o kh&oacute;a học, bạn c&ograve;n kh&aacute; nh&uacute;t nh&aacute;t v&agrave; lo lắng v&igrave; chưa c&oacute; kiến thức về Xuất nhập khẩu- Logistics nhưng sau khi ho&agrave;n th&agrave;nh kh&oacute;a học, hiện bạn&nbsp;đang l&agrave;m Cus cho c&ocirc;ng ty về Logistics. H&atilde;y tiếp tục học học v&agrave; n&acirc;ng cao kỹ năng nghiệp vụ trở n&ecirc;n xuất sắc Dung nh&eacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/dung%20ngo%202.jpg\" style=\"height:345px; width:398px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/dung%20ngo%202.jpg\" style=\"height:345px; width:398px\" /></p>'),(29,'Nguyễn Đỗ Thái Hưng – (1994) –  Đại học Ngoại Thương','','/61/d8/86/5a68a52310b9a.jpg',0,1,'2018-01-24 22:24:19','2018-02-09 15:52:24','<p>L&agrave; một trong những học vi&ecirc;n kh&oacute;a đầu ti&ecirc;n đ&atilde; c&oacute; nhiều trải nghiệm đ&aacute;ng kể trong qu&aacute; tr&igrave;nh r&egrave;n luyện tại HAN EXIM CLUB v&agrave; trong thời gian đi l&agrave;m. Hiện nay bạn ấy c&ograve;n trở lại CLB hỗ trợ lớp học với tư c&aacute;ch &ldquo;người đi trước&rdquo;, chia sẻ cho c&aacute;c học vi&ecirc;n kh&oacute;a sau những kiến thức thực tế m&agrave; bạn ấy t&iacute;ch g&oacute;p được thời gian vừa qua.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/hung%20thai%202.jpg\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/hung%20thai%202.jpg\" style=\"height:788px; width:940px\" /></p>'),(30,'Nguyễn Phương Lan (1991)- nhân viên kế hoạch vật tư','','/48/0b/b4/5a6931b0cd4ea.jpg',0,1,'2018-01-25 08:24:00','2018-02-09 15:53:04','<p>Đang từ một nh&acirc;n vi&ecirc;n kế hoạch, c&ocirc;ng việc ổn định nhưng quyết t&acirc;m đổi nghề bằng việc tham gia kh&oacute;a học Nghiệp vụ Xuất nhập khẩu chỗ C&ocirc; gi&aacute;o. V&agrave; sau khi học xong, bạn đ&atilde; th&agrave;nh c&ocirc;ng với việc trở th&agrave;nh một nh&acirc;n vi&ecirc;n Chứng từ ki&ecirc;m Dịch vụ kh&aacute;ch hang (Documentation and Customer service)</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/phuong%20lan%202.jpg\" style=\"height:932px; width:540px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/phuong%20lan%202.jpg\" style=\"height:932px; width:540px\" /></p>'),(31,'Nguyễn Quang Lượng (1995) – Đại học Kinh Tế Quốc Dân','','/6d/8e/e6/5a6933fae6885.jpg',15,1,'2018-01-25 08:33:46','2018-03-03 10:00:04','<p>Lượng xuất ph&aacute;t l&agrave; một sinh vi&ecirc;n Khoa Kinh tế Quốc Tế, ngay sau kh&oacute;a học bạn đ&atilde; được thực tập tại C&ocirc;ng ty Xuất Nhập Khẩu, tại đ&acirc;y bạn đ&atilde; c&oacute; điều kiện học hỏi rất nhiều điều từ người đi trước. Sauk hi ra trường bạn c&oacute; ngay c&ocirc;ng việc trong Nội đ&ocirc; về Chứng từ v&agrave; Khai b&aacute;o Hải quan. Bạn cũng đ&atilde; c&oacute; &ldquo;c&aacute;i t&acirc;m&rdquo; của người l&agrave;m nghề khi mất ăn mất ngủ lo cho l&ocirc; h&agrave;ng của c&ocirc;ng ty. Nh&igrave;n thấy học tr&ograve; của m&igrave;nh mỗi ng&agrave;y một gi&agrave; dặn hơn, kinh nghiệm hơn v&agrave; ch&iacute;n chắn hơn, đ&oacute; l&agrave; niềm vui kh&ocirc;ng thể n&agrave;o diễn tả nổi bằng lời của những người dẫn đường.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/quang%20luong.jpg\" style=\"height:345px; width:600px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/quang%20luong.jpg\" style=\"height:345px; width:600px\" /></p>'),(32,'Nguyễn Thị Hạnh (1995) – Học viện chính sách phát triển','','/95/6e/e9/5a6934cc25853.jpg',0,1,'2018-01-25 08:37:16','2018-02-09 15:54:13','<p>Suốt 21 buổi học em rất chăm chỉ, lặng lẽ &ldquo;nuốt&rdquo; từng lời từ b&agrave;i giảng của c&aacute;c chị. Chịu kh&oacute; thực h&agrave;nh nhiều, khả năng tự học tốt. Em c&oacute; bề ngo&agrave;i lạnh l&ugrave;ng nhưng khi t&acirc;m sự với c&aacute;c chị, thực ra b&ecirc;n trong em l&agrave; cả một tr&aacute;i tim đầy nhiệt huyết v&agrave; sự ki&ecirc;n nhẫn hiếm c&oacute;, em c&oacute; t&igrave;nh y&ecirc;u s&acirc;u sắc với nghề gi&aacute;o v&agrave; niềm đam m&ecirc; với nghề Xuất nhập khẩu. Em l&agrave; một c&ocirc; b&eacute; &ldquo;gan l&igrave;&rdquo;, kh&ocirc;ng chọn con đường bằng phẳng v&agrave; &ecirc;m &aacute;i để đi m&agrave; ngược lại, em quyết định cho bản th&acirc;n m&igrave;nh được t&ocirc;i luyện bằng việc chọn khởi đầu với ch&ocirc;ng gai v&agrave; thử th&aacute;ch.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/hanh.jpg\" style=\"height:960px; width:540px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/NGUYEN%20THI%20HANH.jpg\" style=\"height:960px; width:540px\" /></p>'),(33,'Nguyễn Thị Hoàng Mai (1995)- Sinh viên Học viện Chính sách phát triển','','/ce/2b/bc/5a69361d8f062.jpg',0,1,'2018-01-25 08:42:53','2018-02-09 15:54:45','<p>C&ocirc; b&eacute; chăm chỉ, cần mẫn, hay ph&aacute;t biểu v&agrave; lu&ocirc;n biết lắng nghe. Hiện tại bạn&nbsp;đang l&agrave;m Chứng từ tại C&ocirc;ng ty về Logistics. Khi&nbsp;đi phỏng vấn, bạn&nbsp;ấy d&aacute;m bỏ những c&ocirc;ng ty trả lương cao hơn nhưng kh&ocirc;ng&nbsp;được vận dụng những g&igrave;&nbsp;đ&atilde; học&nbsp;để theo&nbsp;đuổi mục ti&ecirc;u về nghề XNK-logistics.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/hoang%20mai.jpg\" style=\"height:345px; width:540px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/hoang%20mai.jpg\" style=\"height:345px; width:540px\" /></p>'),(34,'Nguyễn Thị Ngọc (1995)- Đại học Kinh tế- ĐH Quốc Gia Hà Nội','','/3c/2a/a3/5a697d30b2eb6.jpg',0,1,'2018-01-25 08:51:52','2018-02-09 15:55:24','<p>Đến với lớp học như một c&aacute;i duy&ecirc;n, bạn đi ngược lại với đ&aacute;m đ&ocirc;ng bạn b&egrave; rủ học ở những nơi quảng c&aacute;o rầm rộ, ho&agrave;nh tr&aacute;ng. V&agrave; thực sự bạn đ&atilde; đ&uacute;ng, học vi&ecirc;n đến với ch&uacute;ng t&ocirc;i bằng tấm gương từ những bạn b&egrave; đi trước, theo d&otilde;i d&agrave;i hạn tr&ecirc;n facebook. Học vi&ecirc;n chất qu&aacute; đ&uacute;ng kh&ocirc;ng c&aacute;c bạn?</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/ngoc%20nemo2.jpg\" style=\"height:345px; width:388px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/ngoc%20nemo2.jpg\" style=\"height:345px; width:388px\" /></p>'),(35,'Nguyễn Thị Ngợi (1995)- ĐH Kinh tế Quốc dân','','/4f/63/34/5a693af8b3439.jpg',40,1,'2018-01-25 09:03:36','2018-02-09 15:56:22','<p>Bạn Ngợi đ&atilde; tr&uacute;ng tuyển v&agrave;o Honda Việt Nam. H&atilde;y c&ugrave;ng xem những chia sẻ của bạn ấy v&agrave; h&atilde;y tin những g&igrave; ch&uacute;ng t&ocirc;i day cho c&aacute;c bạn đều c&oacute; l&yacute; do của n&oacute;, đ&atilde; rất nhiều bạn tr&uacute;ng tuyển cả v&agrave;o những tập đo&agrave;n lớn như Samsung, LC, Honda, KMG&hellip;nhờ v&agrave;o việc l&agrave;m đủ v&agrave; đ&uacute;ng những y&ecirc;u cầu tr&ecirc;n lớp. Ch&uacute;ng t&ocirc;i lu&ocirc;n cố gắng để c&aacute;c bạn được thực h&agrave;nh nhiều nhất những g&igrave; trong thực tế sẽ gặp để đi phỏng vấn trở th&agrave;nh &ldquo;cuộc dạo chơi&rdquo; chứ kh&ocirc;ng phải &aacute;p lực.<img alt=\"\" src=\"/uploads/ckfinder/images/ngoi%202.jpg\" style=\"height:345px; width:776px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/ngoi3.jpg\" style=\"height:932px; width:540px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/ngoi%202.jpg\" style=\"height:345px; width:776px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/ngoi3.jpg\" style=\"height:932px; width:540px\" /></p>'),(36,'Nguyễn Thị Thảo (1994)- Sinh viên ĐH ngoại ngữ – ĐH Quốc gia Hà Nội','','/12/a8/81/5a6941fb82e02.jpg',40,1,'2018-01-25 09:33:31','2018-03-03 10:41:53','<p>Một c&ocirc; g&aacute;i s&ocirc;i nổi v&agrave; t&iacute;ch cực. Biết m&igrave;nh xuất ph&aacute;t điểm tr&aacute;i ng&agrave;nh so với c&aacute;c bạn Ngoại thương c&ugrave;ng lớp, Thảo đ&atilde; rất cố gắng học tập v&agrave; r&egrave;n luyện rất chăm chỉ những g&igrave; được học. Ngay sau kh&oacute;a học, Thảo đ&atilde; được nhận v&agrave;o một c&ocirc;ng ty xuất khẩu l&agrave;m việc với mức lương khởi điểm rất xứng đ&aacute;ng. Dần dần với th&aacute;i độ l&agrave;m việc tốt c&ugrave;ng những thể hiện của m&igrave;nh, Thảo được c&ocirc;ng ty tin tưởng giao ph&oacute; cho c&aacute;c nhiệm vụ quan trọng, kể cả đi c&ocirc;ng t&aacute;c nước ngo&agrave;i v&agrave; tham gia b&agrave;n đ&agrave;m ph&aacute;n với kh&aacute;ch h&agrave;ng đến từ Ch&acirc;u &Acirc;u.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/thao%202.jpg\" style=\"height:788px; width:940px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/thao%201.jpg\" style=\"height:363px; width:262px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thao%202.jpg\" style=\"height:461px; width:550px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thao%201.jpg\" style=\"height:363px; width:262px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thao%206.jpg\" style=\"height:241px; width:550px\" /></p>\r\n\r\n<p>Đ&acirc;y l&agrave; thư em Thảo viết bằng word gửi email tới c&aacute;c chị để chia sẻ suy nghĩ của m&igrave;nh về thời gian b&ecirc;n cạnh c&aacute;c chị v&agrave; lớp học của em. Xin ph&eacute;p Thảo nh&eacute; ^^</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thao%204.jpg\" style=\"height:712px; width:550px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thao%205.jpg\" style=\"height:712px; width:550px\" /></p>'),(37,'Trần Thị Chinh (1994) – Học viện Nông nghiệp Việt Nam','','/09/3e/e0/5a69471493f32.jpg',0,1,'2018-01-25 09:55:16','2018-02-09 15:58:14','<p>Ng&agrave;y đầu tới lớp với đ&ocirc;i mắt ngơ ng&aacute;c kh&ocirc;ng r&otilde; định hướng, lại rất rụt r&egrave; v&agrave; &iacute;t n&oacute;i. Tiếp x&uacute;c với c&ocirc; b&eacute; mới biết em c&oacute; rất nhiều nỗi sợ h&atilde;i, lu&ocirc;n thiếu tự tin về bản th&acirc;n. Hiện tại, em Chinh đang l&agrave;m việc rất tự tin v&agrave; cứng c&aacute;p với vai tr&ograve; l&agrave; nh&acirc;n vi&ecirc;n chứng từ &ndash; khai b&aacute;o hải quan cho c&ocirc;ng ty logistics.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/chinh%202.jpg\" style=\"height:788px; width:940px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/chinh%202.jpg\" /></p>'),(38,'Nguyễn Thu Hà (1991)- nhân viên kế toán','','/1e/a7/71/5a694b2a4a6e3.jpg',60,1,'2018-01-25 10:12:42','2018-04-07 22:23:51','<p>Cũng giống như c&aacute;c bạn học vi&ecirc;n chuyển đổi nghề nghiệp kh&aacute;c, khi đến với kh&oacute;a học ban đầu bạn cũng c&ograve;n băn khoăn hay với mục ti&ecirc;u đơn giản l&agrave; học để tăng th&ecirc;m hiểu biết. Nhưng nhờ kiến thức trong kh&oacute;a học bạn đ&atilde; thể hiện được tại c&ocirc;ng ty cũ để c&ocirc;ng ty giao cho bạn ki&ecirc;m nhiệm th&ecirc;m về XNK. Kết quả l&agrave; mức lương của bạn đ&atilde; tăng so với trước, đ&uacute;ng l&agrave; &ldquo;đầu tư cho gi&aacute;o dục l&agrave; sự đầu tư kh&ocirc;n ngoan nhất&rdquo; phải kh&ocirc;ng c&aacute;c bạn?</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/thu%20ha%202.jpg\" style=\"height:345px; width:582px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thu%20ha%202.jpg\" /></p>'),(39,'Nguyễn Thúy Quỳnh (1995)- sinh viên ĐH Kinh tế- Đại học Quốc Gia Hà Nội','','/ec/87/7e/5a694e360db67.jpg',0,1,'2018-01-25 10:25:42','2018-02-09 15:59:42','<p>C&ograve;n tận 2 tuần nữa mới ho&agrave;n th&agrave;nh kh&oacute;a học m&agrave; bạn đ&atilde; &ldquo;trốn&rdquo; C&ocirc; gi&aacute;o đi phỏng vấn v&agrave; tr&uacute;ng tuyển ngay v&agrave;o vị tr&iacute; Mua h&agrave;ng. Hiện tại bạn đang l&agrave;m rất tốt qua chia sẻ dưới đ&acirc;y nh&eacute;:</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/THUY%20QUYNH%201.jpg\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/THUY%20QUYNH%201.jpg\" style=\"height:450px; width:810px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/THUY%20QUYNH%202.jpg\" style=\"height:345px; width:388px\" /></p>'),(40,'Phạm Thị Dịu (1995) – Học viện chính sách phát triển','','/45/33/34/5a69529932561.jpg',65,1,'2018-01-25 10:44:25','2018-04-07 22:24:44','<p>Đ&acirc;y l&agrave; một trong những học vi&ecirc;n đặc biệt nhất. Hồi em mới tham gia CLB, em l&agrave; một c&ocirc; b&eacute; cực kỳ nh&uacute;t nh&aacute;t v&agrave; &iacute;t n&oacute;i. Giờ&nbsp;kh&ocirc;ng chỉ l&agrave; một nh&acirc;n vi&ecirc;n chứng từ-khai b&aacute;o hải quan, em c&ograve;n ki&ecirc;m cả việc thay c&ocirc;ng ty tuyển dụng nh&acirc;n sự cho c&aacute;c vị tr&iacute; kh&aacute;c nhau, v&agrave; nguồn em ấy lựa chọn tin cậy nhất ch&iacute;nh l&agrave; c&aacute;c học vi&ecirc;n kh&oacute;a sau của CLB. Sự thay đổi ngoạn mục của em cũng ch&iacute;nh l&agrave; đ&ograve;n bẩy tinh thần, tạo sức ảnh hưởng rất lớn đến c&aacute;c bạn c&ugrave;ng lớp của m&igrave;nh, c&ugrave;ng d&igrave;u dắt nhau bước v&agrave;o một ng&agrave;nh nghề mới: nghề xuất nhập khẩu- logistics.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/9.jpg\" style=\"height:788px; width:940px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/diu%20pham.jpg\" style=\"height:345px; width:582px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/DIU%20PHAM%201.jpg\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/diu%20pham.jpg\" style=\"height:345px; width:582px\" /></p>'),(41,'Phạm Thị Hải Yến (1995)- Đại học Ngoại thương','','/5e/2c/c5/5a69563f867e9.jpg',60,1,'2018-01-25 10:59:59','2018-02-09 16:01:51','<p>Ngay từ buổi đầu kh&oacute;a học bạn đ&atilde; rất h&agrave;o hứng v&agrave; rất chăm chỉ, kh&ocirc;ng nghỉ bất cứ buổi học n&agrave;o. Mặc d&ugrave; đến từ trường Ngoại thương nhưng bạn rất khi&ecirc;m tốn, biết m&igrave;nh thiếu những kỹ năng g&igrave; v&agrave; lu&ocirc;n ham học hỏi. Ch&iacute;nh sự khi&ecirc;m tốn đ&oacute; đ&atilde; l&agrave;m bạn tiếp thu kiến thức một c&aacute;ch rất trọng vẹn.</p>\r\n\r\n<p>Khi đi phỏng vấn hầu hết lần n&agrave;o bạn cũng pass do đ&atilde; được huấn luyện kỹ c&agrave;ng v&agrave; c&oacute; cẩm nang trả lời phỏng vấn của lớp HAN EXIM</p>\r\n\r\n<p>Cuối c&ugrave;ng bạn đ&atilde; l&agrave;m c&ocirc;ng việc m&igrave;nh y&ecirc;u th&iacute;ch l&agrave; trở th&agrave;nh nh&acirc;n vi&ecirc;n Sales Xuất Khẩu, v&agrave; hơn nữa l&agrave; bạn đ&atilde; xuất được container h&agrave;ng đầu ti&ecirc;n khi c&ograve;n đang thử việc.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/yen%20pham%202.jpg\" style=\"height:345px; width:584px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/yen%20pham%201.jpg\" style=\"height:265px; width:556px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/yen%20pham%202.jpg\" style=\"height:345px; width:584px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/yen%20pham%203.jpg\" style=\"height:345px; width:398px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/yen%20pham%201.jpg\" style=\"height:265px; width:556px\" /></p>'),(42,'Phạm Trung Kiên (1996) – Đại học Ngoại Thương','','/43/79/94/5a695d01c5fb9.jpg',0,1,'2018-01-25 11:28:49','2018-02-09 16:03:23','<p>Bạn tham gia lớp học khi mới năm ba đại học. Bạn l&agrave; một học vi&ecirc;n rất chăm chỉ, chịu kh&oacute; ngo&agrave;i ra Ki&ecirc;n c&oacute; tố chất của người dẫn đầu với sự nhiệt t&igrave;nh, chu đ&aacute;o v&agrave; cầu tiến, em sẽ lu&ocirc;n l&agrave; một c&aacute; nh&acirc;n xuất sắc. H&atilde;y giữ g&igrave;n v&agrave; trau dồi hơn nữa để biến những đức t&iacute;nh đ&oacute; trở th&agrave;nh con người của m&igrave;nh Ki&ecirc;n nh&eacute;. Ch&uacute;ng t&ocirc;i sẽ lu&ocirc;n d&otilde;i theo từng bước ph&aacute;t triển của c&aacute;c học vi&ecirc;n.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/kien%202.jpg\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/kien%202.jpg\" style=\"height:450px; width:810px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/kien%203.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/kien%203.jpg\" style=\"height:345px; width:388px\" /></p>'),(43,'Phan Thị Thục Hiền (1994)- Sinh viên ĐH Kinh tế Quốc Dân','','/55/90/05/5a695ece11301.jpg',0,1,'2018-01-25 11:36:30','2018-02-09 16:03:54','<p>Xuất ph&aacute;t điểm cũng l&agrave; một nh&acirc;n vi&ecirc;n văn ph&ograve;ng &ldquo;chưa biết g&igrave; về XNK&rdquo;. Ngồi học trong lớp rất trầm, chỉ n&oacute;i khi được gọi t&ecirc;n. Nhưng đổi lại, bạn ấy rất chịu kh&oacute; thực h&agrave;nh v&agrave; ghi ch&eacute;p, tự học th&ecirc;m. V&agrave; kết quả như dưới đ&acirc;y&hellip;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/THUC%20HIEN.jpg\" style=\"height:450px; width:810px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/THUC%20HIEN.jpg\" style=\"height:450px; width:810px\" /></p>'),(44,'Vũ Thị Thúy – (1992) –  Nhân viên Logistics','','/83/4f/f8/5a69613137fe4.jpg',1,1,'2018-01-25 11:46:41','2018-02-09 16:05:02','<p>Một c&ocirc; g&aacute;i c&oacute; ho&agrave;n cảnh đặc biệt nhưng với sức mạnh ki&ecirc;n cường v&agrave; &yacute; ch&iacute; kh&ocirc;ng khuất phục, em đ&atilde; vượt mọi kh&oacute; khăn trong cuộc sống để vươn đến điều m&igrave;nh mong muốn. Vẻ ngo&agrave;i d&ugrave; c&oacute; rắn rỏi&nbsp;đến đ&acirc;u nhưng những cử chỉ quan t&acirc;m nhỏ nhặt n&agrave;y của em cũng đủ thể hiện l&agrave; một c&ocirc; b&eacute; t&igrave;nh cảm, s&acirc;u sắc. Cảm ơn em v&agrave; ch&uacute;c những điều tốt đẹp nhất sẽ đến với em!</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/vu%20thuy%202.jpg\" style=\"height:788px; width:940px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/vu%20thuy.jpg\" style=\"height:960px; width:540px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/vu%20thuy%202.jpg\" style=\"height:788px; width:940px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/vu%20thuy.jpg\" style=\"height:960px; width:540px\" /></p>'),(45,'Phùng Phương Thảo (1994) – SV ĐH Kinh tế quốc dân','','/21/24/42/5a69633bb640c.jpg',0,1,'2018-01-25 11:55:23','2018-02-09 16:05:44','<p>Những tin mừng nối tiếp tin mừng. Trong qu&aacute; tr&igrave;nh huấn luyện, ch&uacute;ng t&ocirc;i lu&ocirc;n hướng cho học vi&ecirc;n của m&igrave;nh r&egrave;n luyện cả kiến thức, kỹ năng lẫn tư duy. V&agrave; một trong những tư duy quan trọng l&agrave; CHỌN VIỆC thay v&igrave; XIN VIỆC. Khi nắm được tinh thần n&agrave;y, vị thế của c&aacute;c em cũng kh&aacute;c hẳn trong những buổi phỏng vấn tuyển dụng, v&agrave; kết quả r&otilde; r&agrave;ng dưới đ&acirc;y.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/phung%20thao2.jpg\" style=\"height:345px; width:388px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/phung%20thao2.jpg\" style=\"height:345px; width:388px\" /></p>'),(46,'Nguyễn Thị Thu Hương (1994)- Đại học Hà Nội','','/63/4a/a6/5a69674249200.jpg',0,1,'2018-01-25 12:12:34','2018-02-09 16:06:17','<p>Xuất ph&aacute;t l&agrave; sinh vi&ecirc;n khoa tiếng &Yacute;- Đại học H&agrave; Nội bạn t&igrave;m đến với HAN EXIM CLUB khi trong long c&ograve;n nhiều vướng mắc. Bạn chưa được tiếp x&uacute;c về khối ng&agrave;nh kinh tế v&agrave; xuất nhập khẩu th&igrave; c&agrave;ng kh&ocirc;ng, sau khi được tư vấn bạn đ&atilde; quyết định theo học. 20/11/2017 bạn b&aacute;o tin vui v&agrave;o ng&agrave;y đầy &yacute; nghĩa n&agrave;y, bạn đ&atilde; thực hiện ước mơ khi l&agrave;m Nh&acirc;n vi&ecirc;n mua h&agrave;ng (Purchasing) tại c&ocirc;ng ty Xuất nhập khẩu. Với c&ocirc;ng việc n&agrave;y bạn đ&atilde; c&oacute; thu nhập ổn định v&agrave; được sử dụng Ngoại ngữ kh&aacute; nhiều để phục vụ c&ocirc;ng việc. C&ugrave;ng xem chia sẻ của bạn g&aacute;i ấy về việc Những kiến thức được truyền đạt tr&ecirc;n lớp, kỹ năng, c&aacute;ch trả lời phỏng vấn được training bạn đ&atilde; &aacute;p dụng ra sao nh&eacute;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/thu%20huong%202.jpg\" style=\"height:345px; width:582px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thu%20huong%202.jpg\" style=\"height:345px; width:582px\" /></p>'),(47,'Trần Diệu Ly (1995)- Đại học Ngoại ngữ Hà Nội khoa tiếng Nga','','/f0/39/9f/5a6968b327ea9.jpg',15,1,'2018-01-25 12:18:43','2018-02-09 16:07:47','<p>C&ocirc; gi&aacute;o vẫn c&ograve;n nhớ h&igrave;nh ảnh của bạn khi đến buổi học đầu ti&ecirc;n bị c&ocirc; gi&aacute;o mắng v&igrave; kh&ocirc;ng c&oacute; &yacute; ch&iacute; th&igrave; sẽ kh&ocirc;ng l&agrave;m được g&igrave; nhưng chỉ sau buổi học đ&oacute; bạn đ&atilde; &rdquo;thay đổi&rdquo; rất rất nhiều. Ngo&agrave;i việc t&iacute;ch cực đi học, chăm chỉ học tập v&agrave; ghi ch&eacute;p bạn c&ograve;n được c&ocirc; gi&aacute;o chỉ ra c&aacute;c kỹ năng c&ograve;n thiếu. V&agrave;&hellip; tin vui đến ngay sau khi kết th&uacute;c kh&oacute;a học, bạn đ&atilde; thực hiện được ước mơ l&agrave;m Nh&acirc;n vi&ecirc;n xuất khẩu n&ocirc;ng sản, được sử dụng kh&aacute; nhiều ngoại ngữ l&agrave; tiếng Nga v&agrave; tiếng Anh trong c&ocirc;ng việc. C&ocirc; gi&aacute;o đ&atilde; thực hiện được &ldquo;lời hứa&rdquo; với bạn l&agrave; &ldquo;nếu em cố gắng em sẽ c&oacute; việc ngay sau khi học&rdquo;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/dieu%20ly%202.jpg\" style=\"height:345px; width:540px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/dieu%20ly%202.jpg\" style=\"height:345px; width:540px\" /></p>'),(48,'Trần Hữu Tiến (1995)- Đại học Kinh tế Quốc Dân','','/34/40/03/5a6969bccf690.jpg',0,1,'2018-01-25 12:23:08','2018-02-09 16:08:20','<p>Tiến l&agrave; học vi&ecirc;n nam rất t&iacute;ch cực trong mỗi giờ học tr&ecirc;n lớp, kỹ năng giao tiếp. Sau khi học xong, bạn rất khi&ecirc;m tốn, cứ muốn th&agrave;nh c&ocirc;ng rồi mới khoe C&ocirc; gi&aacute;o. C&oacute; được một c&ocirc;ng việc li&ecirc;n quan đến những g&igrave; được học l&agrave; th&agrave;nh c&ocirc;ng rồi phải kh&ocirc;ng c&aacute;c bạn? Ch&uacute;c cho Tiến sẽ m&atilde;i vững bước v&agrave; tự tin tr&ecirc;n con đường m&agrave; m&igrave;nh đ&atilde; chọn.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/huu%20tien%202.jpg\" style=\"height:345px; width:578px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/huu%20tien%202.jpg\" style=\"height:345px; width:578px\" /></p>'),(49,'Trần Thị Hồng Nhung (1993)- Đại học Ngoại Thương','','/6a/1a/a6/5a696b2a8a5c1.jpg',30,1,'2018-01-25 12:29:14','2018-03-03 09:56:50','<p>Đến từ khoa Tiếng Ph&aacute;p của Ngoại Thương, kh&ocirc;ng c&oacute; nhiều kiến thức nền về XNK nhưng sau khi được đ&agrave;o tạo, học vi&ecirc;n của C&ocirc; gi&aacute;o to&agrave;n được &rdquo;chọn việc&rdquo; thế n&agrave;y đ&acirc;y. Khi đang học tại lớp Chủ Nhật&nbsp;Hồ T&ugrave;ng Mậu, kh&oacute;a c&ograve;n chưa kết th&uacute;c&nbsp;bạn ấy đi phỏng vấn đ&atilde; được 3/4 c&ocirc;ng ty gọi đi l&agrave;m.<br />\r\nBạn n&agrave;o c&ograve;n t&ograve; m&ograve; về C&ocirc; gi&aacute;o cứ chat với học vi&ecirc;n của C&ocirc; gi&aacute;o hỏi thoải m&aacute;i xem C&ocirc; gi&aacute;o &ldquo;training&rdquo; học vi&ecirc;n thế n&agrave;o m&agrave; được vậy nh&eacute;, input &rdquo;trước học&rdquo; ra sao v&agrave; output &rdquo;sau khi học&rdquo; như thế n&agrave;o.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/nhung%20tran%202.jpg\" style=\"height:345px; width:582px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/nhung%20tran%202.jpg\" style=\"height:345px; width:582px\" /></p>'),(50,'Trần Thị Huệ (1995)- Học viện chính sách phát triển','','/09/9d/d0/5a696bdd74b42.jpg',0,1,'2018-01-25 12:32:13','2018-02-09 16:10:43','<p>Từ một c&ocirc; g&aacute;i nh&uacute;t nh&aacute;t, e d&egrave; mặc d&ugrave; học đ&uacute;ng chuy&ecirc;n ng&agrave;nh nhưng bạn thiếu tự tin v&agrave;o c&aacute;c kiến thức tr&ecirc;n trường, kh&ocirc;ng biết sẽ &aacute;p dụng ra sao ngo&agrave;i thực tế n&ecirc;n đến với kh&oacute;a học bạn đ&atilde; cố gắng rất nhiều. Phần thưởng của bạn ch&iacute;nh l&agrave; c&ocirc;ng việc bạn đang l&agrave;m đ&atilde; được &aacute;p dụng những g&igrave; đ&atilde; học. Ch&uacute;c em sẽ gặt h&aacute;i được nhiều th&agrave;nh c&ocirc;ng tr&ecirc;n chặng đường d&agrave;i sau n&agrave;y.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/tran%20hue.jpg\" style=\"height:345px; width:388px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/tran%20hue.jpg\" /></p>'),(51,'Trần Thị Hường – (1990) –  Nhân viên xuất nhập khẩu','','/a3/1e/ea/5a696d4d700bd.jpg',0,1,'2018-01-25 12:38:21','2018-03-03 10:00:49','<p>Cũng l&agrave; một trong số những bạn đi học để thay đổi c&ocirc;ng việc. Một trong những học vi&ecirc;n xuất sắc, t&igrave;nh cảm v&agrave; kh&aacute; k&iacute;n tiếng. Bạn ấy c&oacute; mức lương khởi điểm ngang bằng với nhiều bạn c&oacute; kinh nghiệm 2-3 năm, nhưng y&ecirc;u cầu c&aacute;c chị kh&ocirc;ng được tiết lộ h&igrave;nh ảnh. Ch&uacute;c mừng em Hường nh&eacute;! Em cũng l&agrave; một niềm tự h&agrave;o lớn cho c&aacute;c chị v&agrave; l&agrave; điển h&igrave;nh cho c&aacute;c bạn chuyển việc c&ograve;n đang cảm thấy thiếu tự tin c&oacute; thể học tập em đấy!</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/huong%20tran%202.jpg\" style=\"height:495px; width:496px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/huong%20tran%202.jpg\" style=\"height:495px; width:496px\" /></p>'),(52,'Trần Thị Lan Phương (1995)- Sinh viên ĐH ngoại ngữ – ĐH Quốc gia Hà Nội','','/87/07/78/5a696e4a5426d.jpg',60,1,'2018-01-25 12:42:34','2018-02-09 16:13:07','<p>Tốt nghiệp kh&oacute;a học ngay khi c&ograve;n l&agrave; sinh vi&ecirc;n năm thứ 3. C&ugrave;ng với nền tảng sinh vi&ecirc;n ngoại ngữ, ngo&agrave;i tiếng Anh, Phương c&ograve;n c&oacute; Tiếng Trung &ndash; được gọi l&agrave; &ldquo;language of business&rdquo;, em đ&atilde; vượt qua rất nhiều ứng vi&ecirc;n kinh nghiệm kh&aacute;c để c&oacute; được vị tr&iacute; nh&acirc;n vi&ecirc;n mua h&agrave;ng (purchasing) tại một c&ocirc;ng ty nhập khẩu với đối t&aacute;c ch&iacute;nh đến từ Trung Quốc.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/lan%20phuong.jpg\" style=\"height:725px; width:940px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/lan%20phuong.jpg\" /></p>'),(53,'Trần Thu Thủy (1993)- Đại học Khoa học xã hội và nhân văn','','/65/25/56/5a69705306b6d.jpg',35,1,'2018-01-25 12:51:15','2018-04-07 22:25:49','<p>Bạn Thủy cũng l&agrave; d&acirc;n ngoại đạo, học trường về Nh&acirc;n văn kh&ocirc;ng hề li&ecirc;n quan nhưng sau buổi học đầu ti&ecirc;n bạn đ&atilde; thật sự &ldquo;m&ecirc;&quot;&nbsp;gi&aacute;o vi&ecirc;n v&agrave; c&aacute;ch dạy của c&aacute;c c&ocirc; gi&aacute;o. Bạn rất thấm những g&igrave; được đ&agrave;o tạo cả kiến thức v&agrave; kỹ năng, những c&acirc;u chuyện trong nghề v&agrave; giờ bạn đ&atilde; thực hiện được ước mơ sang lĩnh vực mới.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/thu%20thuy%202.jpg\" style=\"height:345px; width:776px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/thu%20thuy%201.jpg\" style=\"height:379px; width:494px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thu%20thuy%201.jpg\" style=\"height:379px; width:494px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/thu%20thuy%202.jpg\" style=\"height:345px; width:776px\" /></p>'),(54,'Vũ Lan Phương (1996)- Học viện ngân hàng','','/9b/5b/b9/5a6971a44527c.jpg',0,1,'2018-01-25 12:56:52','2018-02-09 16:14:24','<p>Bạn Lan Phương đến với kh&oacute;a học khi đang học năm 3 tại HVNH, với sinh vi&ecirc;n năm 3 th&igrave; mong muốn của c&aacute;c bạn đ&oacute; l&agrave; được đi thực tập/học việc sớm v&agrave; bạn Lan Phương đ&atilde; l&agrave;m được điều đ&oacute;. Việc được nhận thực tập tại C&ocirc;ng ty Xuất nhập khẩu kh&ocirc;ng phải dễ đ&acirc;u c&aacute;c bạn nh&eacute;. Ch&uacute;ng ta h&atilde;y c&ugrave;ng chờ xem những bước ph&aacute;t triển của bạn ấy sau một thời gian nữa nh&eacute;<img alt=\"\" src=\"/uploads/ckfinder/images/lan%20phuong(1).jpg\" style=\"height:960px; width:697px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/lan%20phuong(1).jpg\" /></p>'),(55,'Vũ Thị Huế (1995) – Học viện chính sách phát triển','','/58/70/05/5a6973372f183.jpg',0,1,'2018-01-25 13:03:35','2018-02-09 16:15:05','<p>L&agrave; một c&ocirc; g&aacute;i t&igrave;nh cảm, nhẹ nh&agrave;ng c&oacute; thi&ecirc;n hướng nghệ thuật (bạn &yacute; vẽ đẹp lắm ^^) nhưng lại th&iacute;ch một c&ocirc;ng việc nhiều thử th&aacute;ch. C&ocirc; b&eacute; đ&atilde; chọn CLB Y&ecirc;u xuất nhập khẩu H&agrave; Nội để khởi đầu cho con đường sự nghiệp của m&igrave;nh&nbsp;v&agrave; ngay sau khi ho&agrave;n th&agrave;nh kh&oacute;a học, bạn ấy đ&atilde; được nhận đi l&agrave;m ngay với mức lương rất xứng đ&aacute;ng.<img alt=\"\" src=\"/uploads/ckfinder/images/hue%20vu.jpg\" style=\"height:345px; width:776px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/hue%20vu.jpg\" style=\"height:345px; width:776px\" /></p>'),(57,'Kiều Mỹ Linh (1994) – SV khoa Thương mại quốc tế – ĐH Thương mại','','/71/b7/77/5a697c9eed0db.jpg',58,1,'2018-01-25 13:43:42','2018-02-09 16:15:42','<p>Em c&oacute; nhiều s&oacute;ng gi&oacute; trong cuộc sống. Với tham vọng của em l&agrave; trở th&agrave;nh chuy&ecirc;n gia trong ng&agrave;nh XNK, em đ&atilde; cố gắng rất nhiều để đạt được mục ti&ecirc;u đ&oacute;. Hiện nay, em đang l&agrave; chuy&ecirc;n vi&ecirc;n l&agrave;m chứng từ-thủ tục hải quan cho một c&ocirc;ng ty logistics, chuy&ecirc;n s&acirc;u mảng dịch vụ giấy ph&eacute;p-kiểm tra chất lượng h&agrave;ng xuất khẩu &ndash; nhập khẩu.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/my%20linh%202.jpg\" style=\"height:788px; width:940px\" /><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/my%20linh%202.jpg\" style=\"height:345px; width:540px\" /></p>'),(58,'Đoàn Thị Thu Trang (1996) - Học viện ngân hàng','','/b9/3a/ab/5a9a070590d3e.jpg',0,1,'2018-03-03 09:23:01','2018-03-03 10:44:14','<p>Trang c&oacute; xuất ph&aacute;t điểm l&agrave; sinh vi&ecirc;n Ng&acirc;n h&agrave;ng, được bạn b&egrave; giới thiệu biết đến HAN EXIM CLUB, rất may mắn v&igrave; sau&nbsp;buổi học đầu ti&ecirc;n được sự tư vấn về c&aacute;ch trả lời phỏng vấn&nbsp;bạn đ&atilde; tr&uacute;ng tuyển vị tr&iacute; thực tập sinh tại&nbsp; C&ocirc;ng ty Xuất Nhập Khẩu. Vui mừng hơn nữa, sau khi kết th&uacute;c kh&oacute;a học bạn ấy b&aacute;o về với c&aacute;c c&ocirc; gi&aacute;o l&agrave; C&ocirc;ng ty bạn ấy thực tập quyết định đợi bạn ấy ra trường sẽ nhận l&agrave;m ch&iacute;nh thức. Sự cố gắng, nỗ lực của em đ&atilde; được đền đ&aacute;p xứng đ&aacute;ng.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/TRANG%20DOAN%201.jpg\" style=\"height:825px; width:550px\" /></p>'),(59,'Lê Thuỳ Linh (1996) - Đại học Kinh tế quốc dân','','/c1/59/9c/5a9a07684296e.jpg',55,1,'2018-03-03 09:24:40','2018-04-07 22:25:08','<p>Bạn L&ecirc; Th&ugrave;y Linh được c&ocirc; gi&aacute;o ph&acirc;n c&ocirc;ng l&agrave;m lớp trưởng tr&ecirc;n lớp Xuất nhập khẩu ngay từ buổi đầu ti&ecirc;n bởi sự nhiệt t&igrave;nh v&agrave; hăng h&aacute;i, t&iacute;nh cẩn thận của bạn ấy. Linh t&igrave;m đến kh&oacute;a học do được người chị&nbsp;c&ugrave;ng ph&ograve;ng đ&atilde; theo học tại HAN EXIM CLUB v&agrave; sau khi học đ&atilde; xuất sắc tr&uacute;ng tuyển vị tr&iacute; Nh&acirc;n vi&ecirc;n Xuất nhập khẩu của HONDA Vệt Nam.&nbsp;(Bạn Nguyễn Thị Ngợi c&oacute; ở phần Cảm nhận học vi&ecirc;n).</p>\r\n\r\n<p>Kh&ocirc;ng thua k&eacute;m bạn b&egrave;, sau khi học xong kh&oacute;a Nghiệp vụ Xuất nhập khẩu- Logistics tại HAN EXIM CLUB mới đầu năm 4 nhưng đ&atilde; tr&uacute;ng tuyển thực tập. C&ugrave;ng xem những cảm nhận của bạn ấy để biết kh&oacute;a học đ&atilde; gi&uacute;p bạn ấy thế n&agrave;o khi&nbsp;&quot;lần đầu&quot; l&agrave;m việc thực tế.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/LE%20THUY%20LINH%201.jpg\" style=\"height:825px; width:550px\" /></p>'),(60,'Bùi Thị My (1996) - Đại học Thương mại','','/7b/8e/e7/5ab9280533d30.jpg',80,1,'2018-03-27 00:04:05','2018-03-27 00:05:50','<p>Vậy l&agrave; c&ocirc; b&eacute; của ch&uacute;ng ta đ&atilde; ch&iacute;nh thức trở th&agrave;nh Purchasing Staff của Canon Việt Nam rồi. Ngay từ những buổi đầu kh&oacute;a học t&ocirc;i c&ograve;n nhớ đ&ocirc;i mắt long lanh, đầy x&uacute;c động của em khi được học những thứ &ldquo;lần đầu ti&ecirc;n&rdquo; được biết v&agrave; mỗi buổi học tr&ocirc;i qua em trưởng th&agrave;nh hơn từng ng&agrave;y. T&ocirc;i rất vui mừng khi đ&atilde; chắp c&aacute;nh ước mơ cho rất nhiều bạn trở th&agrave;nh &nbsp;Purchasing, vị tr&iacute; đ&ograve;i hỏi nhiều kiến thức, kỹ năng v&agrave; lu&ocirc;n cần học hỏi kh&ocirc;ng ngừng. &nbsp;C&aacute;c bạn trong lớp c&ugrave;ng ch&uacute;c mừng cho My nh&eacute;. &nbsp;Em lại l&agrave; động lực cho c&aacute;c bạn học vi&ecirc;n kh&aacute;c cố gắng, minh chứng cho những g&igrave; ch&uacute;ng t&ocirc;i đ&atilde; v&agrave; đang l&agrave;m cho c&aacute;c học vi&ecirc;n của m&igrave;nh.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/Bui%20Thi%20My%20Hun2.jpg\" style=\"height:310px; width:550px\" /><br />\r\n<img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/Bui%20Thi%20My%20Hun1.jpg\" style=\"height:309px; width:550px\" /></p>'),(61,'Trần Văn Minh (1996) - Đại học Ngoại thương','','/97/55/59/5ac8e1a67a4a9.jpg',70,1,'2018-04-07 22:20:06','2018-04-07 22:20:06','<p>Ch&agrave;ng trai n&agrave;y nổi bật kh&ocirc;ng phải v&igrave; l&agrave; &ldquo;nam vương trường Ngoại thương&rdquo; m&agrave; v&igrave; th&aacute;i độ ứng xử v&agrave; c&aacute;ch đối nh&acirc;n xử thế. Những điều n&agrave;y thực sự chẳng trường lớp n&agrave;o c&oacute; thể dạy nổi c&aacute;c bạn. Bạn ấy c&oacute; sự nh&atilde; nhặn, lịch thiệp, trưởng th&agrave;nh như một qu&yacute; &ocirc;ng xen lẫn nhiệt huyết v&agrave; ch&acirc;n th&agrave;nh của một thanh ni&ecirc;n trẻ tuổi, đ&oacute; l&agrave; những yếu tố bổ trợ gi&uacute;p bạn ấy lu&ocirc;n gặp nhiều thuận lợi trong c&ocirc;ng việc, cuộc sống của m&igrave;nh. Trong lớp, bạn cũng l&agrave; người rất chu đ&aacute;o v&agrave; tử tế, th&acirc;n thiện v&agrave; được bạn b&egrave;, c&ocirc; gi&aacute;o y&ecirc;u qu&yacute;. Khởi sự một c&ocirc;ng việc mới nhiều thử th&aacute;ch, chị lu&ocirc;n tin em c&oacute; thể l&agrave;m tốt v&agrave; tốt hơn nữa!&nbsp;<br />\r\nMinh &agrave;, em l&agrave; một trong những học sinh xuất sắc kh&ocirc;ng phải ri&ecirc;ng trong lớp m&agrave; lọt &ldquo;TOP HAN EXIM&rdquo; rồi đấy nh&eacute;, những chia sẻ n&agrave;y của em ch&iacute;nh l&agrave; nguồn cảm hứng cho c&aacute;c bạn kh&aacute;c tiếp tục &ldquo;y&ecirc;u những g&igrave; m&igrave;nh l&agrave;m v&agrave; l&agrave;m những g&igrave; m&igrave;nh y&ecirc;u&rdquo;. C&aacute;c chị tự h&agrave;o về em!&nbsp;<br />\r\n<img alt=\"\" src=\"/uploads/ckfinder/images/CAM%20NHAN%20HOC%20VIEN/Tr%E1%BA%A7n%20V%C4%83n%20Minh.jpg\" style=\"height:285px; width:600px\" /></p>');

/*Table structure for table `ad_html` */

DROP TABLE IF EXISTS `ad_html`;

CREATE TABLE `ad_html` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên bài viết',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn ảnh đại diện',
  `content` longtext COMMENT 'Nội dung bài viết',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái duyệt bài viết',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `prefix_path` varchar(255) NOT NULL COMMENT 'Đường dẫn trang hiển thị vd: /gioi-thieu/:slug',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Data for the table `ad_html` */

insert  into `ad_html`(`id`,`name`,`image_path`,`content`,`is_active`,`lang`,`slug`,`prefix_path`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (40,'Tủ bếp gỗ tự nhiên với bàn đảo sang trọng',NULL,'<p style=\"text-align:justify\">Hiện nay tr&ecirc;n thị trường c&oacute; rất nhiều loại tủ bếp gỗ kh&aacute;c nhau nhằm đ&aacute;p ứng tối đa nhu cầu của kh&aacute;ch h&agrave;ng v&agrave; sự ph&ugrave; hợp với những gian bếp kh&aacute;c nhau. Những sản phẩm tự nhi&ecirc;n c&oacute; lẽ lu&ocirc;n d&agrave;nh được sự ưu ti&ecirc;n h&agrave;ng đầu của người ti&ecirc;u d&ugrave;ng. Thật vậy<strong> <a href=\"http://tubepthangloi.com/index.php/chuyen-muc/tu-bep-go-tu-nhien\" target=\"_blank\" title=\"tu bep tu nhien\">tủ bếp gỗ tự nhi&ecirc;n</a></strong> lu&ocirc;n được mọi người ưu ti&ecirc;n lựa chọn h&agrave;ng đầu<br />\r\nBởi n&oacute; kh&ocirc;ng chỉ mang đến vẻ đẹp tự nhi&ecirc;n, tạo sự sang trọng m&agrave; c&ograve;n c&oacute; độ bền cao, kh&ocirc;ng thấm nước v&agrave; chống mối mọi l&agrave; điều m&agrave; nhiều người hay lo ngại</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/uploads/ckfinder/images/tu-bep-go-tu-nhien.jpg\" style=\"height:397px; width:500px\" title=\"tủ bếp gỗ tự nhiên với thiết kế sang trọng\" /></p>\r\n\r\n<p>Với những mẫu tủ bếp&nbsp;đi k&egrave;m với b&agrave;n đảo sang trọng, khiến cho gian bếp của gia đ&igrave;nh trở n&ecirc;n sang trọng, ấm &aacute;p v&agrave; cả sự tiện nghi cho c&aacute;c b&agrave; nội chợ, đảm bảo đầy đủ tiện nghi với nhiều gian tủ để bạn c&oacute; thể để nhiều loại đồ d&ugrave;ng kh&aacute;c nhau trong gian bếp.<br />\r\nThiết kế hiện đại theo hơi hướng phướng T&acirc;y tạo n&ecirc;n phong c&aacute;ch ri&ecirc;ng, ấn tượng cho căn bếp của gia chủ. Ngo&agrave;i ra bạn c&oacute; thể lựa chọn nhiều kiểu d&aacute;ng tủ gỗ kh&aacute;c nhau sao cho ph&ugrave; hợp nhất với gian bếp nh&agrave; bạn.<br />\r\nH&atilde;y c&ugrave;ng tham khảo những gian mẫu <strong>tủ bếp gỗ tự nhi&ecirc;n</strong> dưới đ&acirc;y để cảm nhận sự tiện nghi, c&ugrave;ng t&iacute;nh thẩm mỹ cho kh&ocirc;ng gian bếp nh&agrave; m&igrave;nh</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/uploads/ckfinder/images/tu-bep-go-tu-nhien1.jpg\" style=\"height:323px; width:500px\" title=\"tủ bếp tự nhiên bằng gỗ sồi Nga có bàn đảo\" /></p>\r\n\r\n<p>Ngo&agrave;i ra c&ograve;n rất nhiều điều th&uacute; vị kh&aacute;c đang chờ bạn khi đến với tủ bếp thắng lợi. Bạn c&oacute; thể chi&ecirc;m ngưỡng nhiều mẫu thiết kế tủ bếp kh&aacute;c nhau tạo cảm hứng thiết kế cho kh&ocirc;ng gian bếp nh&agrave; m&igrave;nh. Li&ecirc;n hệ ngay với ch&uacute;ng t&ocirc;i để nhận những ưu đ&atilde;i bất ngờ.</p>',1,'vi','tu-bep-go-tu-nhien-voi-ban-dao-sang-trong','category_news',1,1,'2016-09-11 22:58:04','2016-09-11 23:06:14'),(41,'Các kiểu tủ bếp gỗ Veneer rất được yêu thích hiện nay',NULL,'<p>N&oacute;i đến c&aacute;c d&ograve;ng tủ bếp được y&ecirc;u th&iacute;ch hiện nay, phải kể đến <a href=\"http://tubepthangloi.com/index.php/chuyen-muc/tu-bep-go-verneer\" target=\"_blank\" title=\"tu bep go veneer\"><strong>tủ bếp gỗ Veneer</strong></a> với nhiều mẫu m&atilde; kiểu d&aacute;ng kh&aacute;c nhau, thiết kế đa dạng sang trọng ph&ugrave; hợp với mọi gian bếp của gia đ&igrave;nh bạn. Từ những chất liệu gỗ tự nhi&ecirc;n dưới b&agrave;n tay của những nghệ nh&acirc;n đ&atilde; mang đến c&aacute;c sản phẩm nh&agrave; bếp tuyệt vời được nhiều người y&ecirc;u th&iacute;ch từ những kiểu d&aacute;ng truyền thống đến những tủ bếp c&aacute;ch t&acirc;n mang hơi hướng phương t&acirc;y, tạo n&ecirc;n phong c&aacute;ch ri&ecirc;ng cho kh&ocirc;ng gian bếp. Với mục đ&iacute;ch kh&ocirc;ng chỉ mang đến sự tiện &iacute;ch cho c&aacute;c b&agrave; nội chợ m&agrave; c&ograve;n c&oacute; t&iacute;nh thẩm mũ cao. H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; 1 số mẫu tủ bếp Veneer hot nhất hiện nay.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/tu-bep-go-veneer.jpg\" style=\"height:361px; width:500px\" title=\"tủ bếp gỗ Veneer hiện đại sang trọng\" /></p>\r\n\r\n<p>1. Thiết kế tủ bếp h&igrave;nh chữ L, h&igrave;nh chữ I<br />\r\nĐ&acirc;y l&agrave; kiểu d&aacute;ng kh&aacute; phổ biến hiện nay, vừa đơn giản m&agrave; lại kh&aacute; đẹp mắt. dễ th&iacute;ch nghi với kh&ocirc;ng gian bếp m&agrave; cẫn đảm bảo c&aacute;c c&ocirc;ng năng sử dụng.<br />\r\nKiểu tủ bếp chữ I chiếm được t&igrave;nh cảm của người ti&ecirc;u d&ugrave;ng bởi những thiết kế thanh mảnh, họa tiết đơn giản nhưng lại c&oacute; điểm nhấn ở m&agrave;u sắc tạo n&ecirc;n sự ph&aacute; c&aacute;ch nổi bật cho nh&agrave; bếp<br />\r\nKh&aacute;c với tủ chữ I, tủ bếp chữ L lại mang đến cho người sử dụng nhiều sự tiện nghi hơn vẫn tr&ecirc;n nền tảng chủ đạo l&agrave; thiết kế nhẹ nh&agrave;ng với sự h&ograve;a trộn của 2 game m&agrave;u xanh, trắng. Đặc biệt c&oacute; thể bố tr&iacute; gần cửa sổ khiến cho ph&ograve;ng bếp trở n&ecirc;n tho&aacute;ng đ&atilde;ng, tận dụng được &aacute;nh s&aacute;ng tự nhi&ecirc;n. Bạn kh&ocirc;ng phải lo ngại về m&ugrave;i ph&ograve;ng bếp khi đun nấu.<br />\r\n2. Thiết kế h&igrave;nh chữ U, h&igrave;nh chữ G</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/Tu-bep-go-Veneer-kieu-chu-U.jpg\" style=\"height:265px; width:500px\" title=\"tủ bếp gỗ Veneer hình chữ U\" /></p>\r\n\r\n<p>Ngo&agrave;i chữ L v&agrave; I, <strong>tủ bếp gỗ Veneer</strong> c&ograve;n c&oacute; sự ph&aacute; c&aacute;ch ở kiểu d&aacute;ng chữ U hay chữ G, mang lại sự ấm &aacute;p cho ng&ocirc;i nh&agrave; v&agrave; sự đột ph&aacute; trong s&aacute;ng tạo kiểu d&aacute;ng. Mẫu thiết kế tủ bếp h&igrave;nh chữ U dưới đ&acirc;y với sự c&aacute;ch t&acirc;n ở 2 b&ecirc;n c&aacute;nh ngắn l&agrave;m cho gian bếp th&ecirc;m phần độc đ&aacute;o, tinh tế.<br />\r\n3. Thiết kế tủ bếp c&oacute; b&agrave;n đảo, quầy bar<br />\r\nĐi k&egrave;m với tủ bếp l&agrave; kh&ocirc;ng gian nấu ăn thuận tiện. Ch&iacute;nh v&igrave; thế m&agrave; tủ bếp b&agrave;n đảo, hay quầy bar &nbsp;ra đời. N&oacute; đang l&agrave; một xu hướng mới hiện nay. Ưu điểm của n&oacute; nằm ở sự linh hoạt. Bạn c&oacute; thể t&ugrave;y &yacute; đặt vị tr&iacute; b&agrave;n đảo theo sở th&iacute;ch của m&igrave;nh vừa l&agrave; để trang tr&iacute; vừa l&agrave; nơi bạn c&oacute; thể nấu nướng hay thưởng thức c&aacute;c m&oacute;n ăn.<br />\r\nH&atilde;y đến ngay c&aacute;c showroom của <strong>tủ bếp gỗ Veneer</strong> Thắng lợi để lựa chọn cho m&igrave;nh sản phẩm ph&ugrave; hợp nhất cho gian bếp của gia đ&igrave;nh bạn, ngo&agrave;i ra c&ograve;n nhận được những ưu đ&atilde;i, khuyến m&atilde;i bất ngờ.</p>',1,'vi','cac-kieu-tu-bep-go-veneer-rat-duoc-yeu-thich-hien-nay','category_news',1,1,'2016-09-11 23:10:27','2016-09-11 23:10:27'),(42,'Ưu điểm nổi bật của các loại tủ bếp gỗ Laminate',NULL,'<p>Nếu c&aacute;c d&ograve;ng tủ bếp g&otilde; tự nhi&ecirc;n mang đến c&aacute;c sản phẩm với chất liệu tự nhi&ecirc;n th&igrave; <a href=\"http://tubepthangloi.com/index.php/chuyen-muc/tu-bep-go-laminale\" target=\"_blank\" title=\"tu bep go laminale\"><strong>tủ bếp gỗ Laminate</strong></a> lại được người ti&ecirc;u d&ugrave;ng y&ecirc;u th&iacute;ch bởi kiểu d&aacute;ng đẹp mắt, gọn nhẹ đa m&agrave;u sắc<br />\r\nLaminate l&agrave; 1 sản phẩm của c&ocirc;ng nghiệp in m&agrave;u cao cấp tr&ecirc;n giấy Graft. C&oacute; rất nhiều sự lựa chọn kh&aacute;c nhau cho bạn về cả m&agrave;u sắc lần kiểu d&aacute;ng như m&agrave;u trơn, v&acirc;n đ&aacute;, v&acirc;n gỗ hay kim loại m&agrave;u, &aacute;nh nhũ&hellip;. Những hoa văn họa tiết được thiết kiết ri&ecirc;ng như bề mặt mịn, mờ hay v&acirc;n nổi m&agrave; ở gỗ tự nhi&ecirc;n kh&ocirc;ng thể c&oacute; được.</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/tu-bep-go-laminale.jpg\" style=\"height:375px; width:500px\" title=\"Tủ bếp gỗ laminale kiểu dáng đẹp mắt sang trọng\" /></p>\r\n\r\n<p><strong>Tủ bếp gỗ Laminate</strong> gi&uacute;p c&aacute;c nh&agrave; thiết kể thể hiện tối đa sự s&aacute;ng tạo của m&igrave;nh m&agrave; kh&ocirc;ng k&eacute;m phần sang trọng. Ưu điểm nổi bật của loại bếp n&agrave;y ch&iacute;nh l&agrave; khả năng chống xước, chống v&agrave; đập mối mọt hay kh&aacute;ng ẩm. Đ&acirc;y c&oacute; lẽ l&agrave; những tiến bộ vượt bậc so với mong đợi của người d&ugrave;ng,<br />\r\nTubepthangloi.com xin giới thiệu đến c&aacute;c bạn những mẫu thiết kế <strong>tủ bếp gỗ Laminate</strong>, được sản xuất tr&ecirc;n d&acirc;y chuyền hiện đại c&ugrave;ng đội ngũ nh&acirc;n vi&ecirc;n thiết kế s&aacute;ng tạo.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/tu-bep-go-laminale-ban-dao.jpg\" style=\"height:345px; width:500px\" title=\"Tủ bếp gỗ laminale có bàn đảo\" /></p>\r\n\r\n<p>Kiểu d&aacute;ng chữ L gọn nhẹ, th&acirc;n thiện với kh&ocirc;ng gian bếp, c&oacute; thể ph&ugrave; hợp với cả những gian bếp c&oacute; diện t&iacute;ch nhỏ hẹp. Để hạn chế nhược điểm n&agrave;y của gian bếp, tủ được thiết kế với nhiều ngăn tủ kh&aacute;c nhau, bạn c&oacute; thể bố tr&iacute; nhiều loại vật dụng kh&aacute;c nhau<br />\r\nĐược sản xuất tr&ecirc;n d&acirc;y truyền hiện đại, sử dụng chất liệu gỗ &eacute;p c&ocirc;ng nghiệp, <strong>tủ bếp gỗ Laminate</strong> khắc phục được mọi nhược điểm của gỗ tự nhi&ecirc;n c&ugrave;ng với đ&oacute; l&agrave; khả năng chống mối mọt ẩm mốc, kh&ocirc;ng sợ bị cong v&ecirc;nh hoặc nứt nẻ do thay đổi thời tiết. C&oacute; khả năng chịu nhiệt, bạn kh&ocirc;ng sợ bị ảnh hưởng của nhiệt độ cao khi nấu nướng.<br />\r\nC&ugrave;ng với đ&oacute; l&agrave; m&agrave;u sắc sang trọng thanh lịch được phủ bởi lớp sơn cao cấp bảo vệ bề mặt tủ, mang đến t&iacute;nh thẩm mỹ tối đa cho căn bếp nh&agrave; bạn<br />\r\nNgo&agrave;i ra c&ograve;n rất nhiều sản phẩm vượt trội kh&aacute;c ở Thắng lợi. Nhanh tay đến với c&aacute;c showroom của tubepthangloi.com để tiện nghi hơn cho gian bếp nh&agrave; bạn.</p>',1,'vi','uu-diem-noi-bat-cua-cac-loai-tu-bep-go-laminate','services',1,1,'2016-09-11 23:54:41','2016-09-11 23:54:41'),(43,'Mẹo lựa chọn máy rửa bát tốt nhất cho gia đình',NULL,'<p>Cuộc sống hiện đại khiến con người lu&ocirc;n bận rộn với c&ocirc;ng việc học tập. Sự ph&aacute;t triển của khoa học c&ocirc;ng nghệ mang đến những sản phẩm tiện &iacute;ch, l&agrave;m giảm sức lao động cuả con người. <a href=\"http://tubepthangloi.com/index.php/chuyen-muc/may-rua-bat\" target=\"_blank\" title=\"may rua bat\"><strong>M&aacute;y rửa b&aacute;t</strong></a> l&agrave; một trong những th&agrave;nh c&ocirc;ng phải kể đến. Gi&uacute;p c&aacute;c b&agrave; nội trợ giảm đi những g&aacute;nh nặng việc nh&agrave;, v&agrave; nỗi lo bị hại do tay do dầu rửa b&aacute;t.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckfinder/images/may-rua-bat.jpg\" style=\"height:561px; width:500px\" title=\"Máy rửa bát với những tiện ích bất ngờ\" /></p>\r\n\r\n<p><strong>M&aacute;y rửa b&aacute;t</strong> gi&uacute;p chị em tiết kiệm được rất nhiều thời gian l&agrave;m việc nh&agrave;.<br />\r\nƯu điểm của m&aacute;y l&agrave; ph&ugrave; hợp với những gia đ&igrave;nh đ&ocirc;ng đ&uacute;c, v&agrave;o những dịp lễ tết, b&aacute;t đũa được sử dụng rất nhiều. Tuy nhi&ecirc;n m&aacute;y lại c&oacute; k&iacute;ch thước kh&aacute; lớn n&ecirc;n chiếm nhiều diện t&iacute;ch. Đ&ograve;i hỏi gia đ&igrave;nh phải c&oacute; kh&ocirc;ng gian bếp đủ rộng.<br />\r\nĐể khắc phục nhược điểm n&agrave;y, hiện nay đ&atilde; c&oacute; một số loại <strong>m&aacute;y rửa b&aacute;t</strong> để b&agrave;n c&oacute; k&iacute;ch thước nhỏ gọn hơn, ph&ugrave; hợp với những kh&ocirc;ng gian nhỏ hẹp. Trong đ&oacute;, bề ngang của m&aacute;y dao động từ 30 - 45 cm thường v&agrave; chỉ c&oacute; 1 ngăn. Sử dụng rửa tối đa được khoảng 15 loại đồ d&ugrave;ng. V&igrave; vậy loại m&aacute;y n&agrave;y chỉ d&ugrave;ng phổ biến cho những gia đ&igrave;nh &iacute;t người.<br />\r\nLựa chọn được chiếc m&aacute;y&nbsp;ph&ugrave; hợp th&igrave; vị tr&iacute; đặt m&aacute;y cũng l&agrave; một vấn đề cần được quan t&acirc;m. Th&ocirc;ng thường m&aacute;y n&agrave;y&nbsp;lu&ocirc;n được ưu ti&ecirc;n đặt trong gian bếp , gần tủ b&aacute;t để dễ d&agrave;ng thuận tiện trong việc dọn dẹp.&nbsp;<br />\r\nNgười d&ugrave;ng cần lưu &yacute; khi sử dụng m&aacute;y, trước khi cho b&aacute;t đĩa v&agrave;o m&aacute;y bạn phải gạt bỏ hết thức ăn thừa v&agrave; n&ecirc;n xếp ch&uacute;ng theo chiều nghi&ecirc;ng để m&aacute;y rửa sạch dễ d&agrave;ng.<br />\r\nM&aacute;y khi&nbsp;hoạt động tốn kh&aacute; nhiều nước để l&agrave;m sạch, v&igrave; thế bạn n&ecirc;n gom b&aacute;t đũa vừa đủ với dung lượng của m&aacute;y, để giảm chi ph&iacute;. C&ugrave;ng kh&ocirc;ng n&ecirc;n bỏ xong chảo, c&ugrave;ng c&aacute;c vật dụng c&oacute; nhiều hoa văn sẽ khiến hoa văn nhanh mờ.<br />\r\nTr&ecirc;n đ&acirc;y l&agrave; những tiện &iacute;ch cũng như những lưu &yacute; cho c&aacute;c b&agrave; nội chợ khi chọn mua <strong>m&aacute;y rửa b&aacute;t</strong> cho gia đ&igrave;nh m&igrave;nh. H&atilde;y đến ngay với tubepthangloi.com để hiểu r&otilde; hơn về sản phẩm. Ch&uacute;c bạn sớm lựa chọn được sản phẩm ưng &yacute; cho gian bếp gia đ&igrave;nh m&igrave;nh.&nbsp;</p>',1,'vi','meo-lua-chon-may-rua-bat-tot-nhat-cho-gia-dinh','about_us',1,1,'2016-09-11 23:55:12','2016-09-11 23:55:12');

/*Table structure for table `ad_link` */

DROP TABLE IF EXISTS `ad_link`;

CREATE TABLE `ad_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên link',
  `link` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn',
  `priority` bigint(20) DEFAULT NULL,
  `type` bigint(20) DEFAULT '1' COMMENT '1: kiểu link cột bên phải, 2 là link footer',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái duyệt bài viết',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `ad_link` */

/*Table structure for table `ad_location` */

DROP TABLE IF EXISTS `ad_location`;

CREATE TABLE `ad_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên tỉnh thành',
  `code` varchar(255) NOT NULL COMMENT 'Mã tỉnh thành',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'Danh mục cha',
  `level` bigint(20) DEFAULT '0' COMMENT 'phân cấp chuyên mục',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `ad_location` */

insert  into `ad_location`(`id`,`name`,`code`,`is_active`,`parent_id`,`level`,`priority`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'Ba Đình','H004',1,NULL,0,10,1,1,'2018-06-17 03:40:37','2018-06-17 03:40:37'),(2,'Hoàn Kiếm','H004',1,NULL,0,20,1,1,'2018-06-17 03:40:56','2018-06-17 03:40:56'),(3,'Hai Bà Trưng','H004',1,NULL,0,30,1,1,'2018-06-17 03:41:14','2018-06-17 03:41:14'),(4,'Đống Đa','H004',1,NULL,0,40,1,1,'2018-06-17 03:41:57','2018-06-17 03:41:57'),(5,'Tây Hồ','H004',1,NULL,0,50,1,1,'2018-06-17 03:42:13','2018-06-17 03:42:13'),(6,'Cầu Giấy','H004',1,NULL,0,60,1,1,'2018-06-17 03:42:24','2018-06-17 03:42:24'),(7,'Thanh Xuân','H004',1,NULL,0,60,1,1,'2018-06-17 03:42:45','2018-06-17 03:42:45'),(8,'Hoàng Mai','H004',1,NULL,0,70,1,1,'2018-06-17 03:42:55','2018-06-17 03:42:55'),(9,'Long Biên','H004',1,NULL,0,80,1,1,'2018-06-17 03:43:27','2018-06-17 03:43:27'),(10,'Từ Liêm','H004',1,NULL,0,90,1,1,'2018-06-17 03:43:37','2018-06-17 03:43:37');

/*Table structure for table `ad_manage_file` */

DROP TABLE IF EXISTS `ad_manage_file`;

CREATE TABLE `ad_manage_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) DEFAULT NULL COMMENT 'id tin tuc',
  `short_url` varchar(255) NOT NULL COMMENT 'media/2014/07/17/test.jpg',
  `description` longtext,
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '1: image, 2: audio, 3 video',
  `duration` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL COMMENT 'vi tri anh, video',
  `type_product` int(11) DEFAULT NULL COMMENT 'anh phan he',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_manage_file` */

/*Table structure for table `ad_massage` */

DROP TABLE IF EXISTS `ad_massage`;

CREATE TABLE `ad_massage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên cơ sở',
  `address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ',
  `time_open` varchar(255) DEFAULT NULL COMMENT 'Thời gian mở cửa',
  `time_close` varchar(255) DEFAULT NULL COMMENT 'Thời gian đóng cửa',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'keywords',
  `phone` varchar(255) DEFAULT NULL COMMENT 'Số điện thoại',
  `description` text NOT NULL COMMENT 'mô tả',
  `location_id` bigint(20) DEFAULT NULL COMMENT 'Quận, huyện',
  `rate` bigint(20) DEFAULT NULL COMMENT 'rate',
  `total_view` bigint(20) DEFAULT NULL COMMENT 'Số lượt xem',
  `lat` varchar(255) DEFAULT NULL COMMENT 'tọa độ latitude',
  `lng` varchar(255) DEFAULT NULL COMMENT 'tọa dộ longtidude',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `content` longtext COMMENT 'Nội dung bài viết',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL COMMENT 'Ảnh đại diện',
  `slug` varchar(255) DEFAULT NULL COMMENT 'slug',
  `is_home` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Data for the table `ad_massage` */

insert  into `ad_massage`(`id`,`name`,`address`,`time_open`,`time_close`,`keywords`,`phone`,`description`,`location_id`,`rate`,`total_view`,`lat`,`lng`,`is_active`,`priority`,`content`,`created_by`,`updated_by`,`created_at`,`updated_at`,`image`,`slug`,`is_home`) values (1,'Quyền Beauty & Spa ','51 Cù Chính Lan ','8:00','21:00',NULL,'0977 791 500','Các dịch vụ tại Quyền B&S :  ● Phun xăm thẩm mỹ  ● Phun môi Collagen ● Phun môi pha lê  ● Phun mí mở tròng  ● Phun mày tản bột  ● Massage đầu, gội đầu ● Điều trị mụn  ● Nối mi  ',NULL,NULL,NULL,'16.0651421','108.187845',1,100,NULL,NULL,NULL,'2018-06-24 17:25:26','2018-06-24 17:25:26','1512146142664_927dbd19-7525-4415-8cdc-9f50a1434b75.jpg','quye-n-beauty-spa-51-cu-chi-nh-lan-13360',0),(2,'Massage Samdi','203 Nguyễn Văn Linh','10:00','0:00',NULL,'02363586222','Nằm trong khách sạn 4 sao cực đẹp tại trung tâm Đà Nẵng. Massage Samdi ở tầng 5 của khách sạn. Với phòng ốc cực đẹp theo tiêu chuẩn 4 sao và đội ngũ nhân viên xinh đẹp và nhiệt tình cùng tay nghề rất khá chắc chắn sẽ đem lại những giây phút sảng khoái và tuyệt vời cho các quý ông khi đến massage thư giản tại đây.  ',NULL,NULL,NULL,'16.0593825','108.20857421875',1,100,NULL,NULL,NULL,'2018-06-24 17:25:28','2018-06-24 17:25:28','1517025999265_01057f02-dfa0-4e55-9acb-d4b1a3097f22.jpg','massage-samdi-203-nguyen-van-linh-19452',0),(3,'Asean Massage Chùa Bộc','8 Chùa Bộc - Đống Đa - Hà Nội','10:00','0:00',NULL,'0435735710','Asean Massage nằm ở khuôn viên tầng 1 khách sạn 3* Asean. Do vậy cơ sở massage này rất được đầu tư, có cơ sở vật chất hiện đại, tiện nghi, phòng ốc sạch sẽ, rộng rãi. Dàn nhân viên phải đáp ứng được các tiêu chuẩn cao về ngoại hình, thái độ và tay nghề, mức độ chiều chuộng khách hàng rất cao, là một điểm đến hứa hẹn cho quý khách lần đầu và quen thuộc với những quý khách đã từng trại nghiệm dịch vụ ở đây',NULL,NULL,NULL,'21.008440999999998','105.82647659999999',1,100,NULL,NULL,NULL,'2018-06-24 17:25:31','2018-06-24 17:25:31','1517365546528_b2466383-eaf8-40d3-bc34-9d023ff06155.jpg','asean-massage-chua-boc-8-chua-boc-dong-da-ha-noi-19582',0),(4,'Massage Eden Plaza','5 - 7 Duy Tân','10:00','0:00',NULL,'02363662666','Massage này trong chuỗi nhà hàng khách sạn Eden Plaza. Đây được xem là cơ sở massage huyền bí nhất và chất lượng nhất Đà Nẵng, chất lượng dịch vụ tuyệt vời, với đội ngũ nhân viên rất đẹp chắc chắn sẽ làm hài lòng các quý ông khi đến đây. ',NULL,NULL,NULL,'16.0483084','108.2163161',1,100,NULL,NULL,NULL,'2018-06-24 17:25:41','2018-06-24 17:25:41','1517026657905_b8c32309-5d98-490b-8b6c-84ce249ed6fd.jpg','massage-eden-plaza-5-7-duy-tan-19454',0),(5,'Massage Lavender Phương Bắc Trần Duy Hưng','số 39 ngõ 80 Trần Duy Hưng - Cầu Giấy - Hà Nội','9:00','1:00',NULL,'0888696866','Lavender là một cơ sở massage có tiếng ở miền Nam, bây giờ đã có mặt tại Hà Nội. Tọa lạc tại con đường khét tiếng Trần Duy Hưng với cơ sở vật chất được đầu tư mạnh, trang trí bát mắt, sang trọng và đội ngũ nhân viên được tuyển chọn, đào tạo bài bản, chú trọng vào chất lượng, chắc chắn sẽ là một điểm đến cực kỳ hot trong giới massage sắp tới',NULL,NULL,NULL,'21.0125291','105.8007758',1,100,NULL,NULL,NULL,'2018-06-24 17:25:44','2018-06-24 17:25:44','1517376125416_dad9f93a-50f9-4b4c-9ca3-b3c8490a9c65.jpg','massage-lavender-phuong-bac-tran-duy-hung-so-39-ngo-80-tran-duy-hung-cau-giay-ha-noi-19605',0),(6,'VGalaxy massage & spa','231 Lý Tự Trọng, Quận 1, Tp. Hồ Chí Minh','09:00','22:00',NULL,'028 382 34779','Dịch vụ: - Massage thư giãn chân và lưng được thực hiện bởi đội ngũ nhân viên có thâm niên từ 5 đến 10 năm trong nghề. - Liệu pháp oxygen phục hồi lại năng lượng - Trị liệu da mặt: chăm sóc da, tẩy tế bào chết, dưỡng da Không gian: rộng thoáng, được cung cấp oxy tinh khiết mỗi 48 giờ, thay đổi nguồn khí đem lại sự cân bằng thể chất và tinh thần cho khách hàng. Giờ mở cửa:9h - 23h30.',NULL,NULL,NULL,'10.7727344334207','106.695406265047',1,100,NULL,NULL,NULL,'2018-06-24 17:25:48','2018-06-24 17:25:48','1515651144489_5f60cd2a-7cff-46c6-932b-f061cf352bb3.jpg','vgalaxy-massage-spa-231-ly-tu-trong-quan-1-tp-ho-chi-minh-18593',0),(7,'Massage Zeus','359 Phạm Ngũ Lão, Quận 1, TP Hồ Chí Minh','12:00','00:00',NULL,'0888 69 68 66','Masage Zeus tọa lạc trên Quận 1. Hệ thống cơ sở vật chất, phòng ốc được thiết kế theo phong cách hiện đại nhưng không kém phần lãng mạn cùng đội ngũ nhân viên xinh đẹp, nhiệt tình, chu đáo, tay nghề cao, chắc chắn sẽ đáp ứng được mọi nhu cầu của quý khách',NULL,NULL,NULL,'10.767041','106.689758',1,100,NULL,NULL,NULL,'2018-06-24 17:25:51','2018-06-24 17:25:51','1517489915297_9cd7d67c-5ff5-44a9-b666-969fa4e4825c.jpg','massage-zeus-359-pham-ngu-lao-quan-1-tp-ho-chi-minh-19817',0),(8,'Darling Sauna Massage','D8 Giảng Võ - Ba Đình - Hà Nội','10:30','1:00',NULL,'0438452270','Darling Sauna Massage là một cơ sở massage cao cấp nằm trong khách sạn 4* Hà Nội - một khách sạn đẳng cấp Hà Thành. Darling Sauna Massage với cơ sở vật chất sang trọng, đạt chuẩn cao cấp cùng với đội ngũ nhân viên được tuyển chọn kỹ lưỡng, đào tạo bài bản, có hình thức và chuyên môn, thái độ cực kỳ chuyên nghiệp, nhất định sẽ là một cơ sở massage không thể nào bỏ qua tại Hà Nội',NULL,NULL,NULL,'21.029574699999998','105.81893249999999',1,100,NULL,NULL,NULL,'2018-06-24 17:25:55','2018-06-24 17:25:55','1517323569255_2d4d2fff-aab0-4d01-b779-29e6d48f1d95.jpg','darling-sauna-massage-d8-giang-vo-ba-dinh-ha-noi-19577',0),(9,'Lê Yên Massage Đại Kim','B9 KĐT Đại Kim - Hoàng Mai - Hà Nội','9:00','23:00',NULL,'02436408686','Lê Yên Massage Đại Kim là địa chỉ mới của Mường Thanh Massage Linh Đàm, có tiếng và là cơ sở massage hàng đầu tại Hà Nội. Có cơ sở vật chất hoàng tráng, sang trọng cùng với đội ngũ nhân viên được đào tạo bài bản, có nhiều năm kinh nghiệm và cực kỳ nhiệt tình ngoan ngoãn. Xứng đáng là địa điểm hàng đầu dành cho các khách hàng đam mê massage',NULL,NULL,NULL,'20.9739692','105.8216911',1,100,NULL,NULL,NULL,'2018-06-24 17:25:59','2018-06-24 17:25:59','1517221233649_edb17a8c-0fc4-497c-96b4-2f1e663b2144.jpg','le-yen-massage-dai-kim-b9-kdt-dai-kim-hoang-mai-ha-noi-19563',0),(10,'Mường Thanh Massage Mạc Đĩnh Chi','8A Mạc Đĩnh Chi - Quận 1- Tp.HCM','10:00','0:00',NULL,'02838279595','Mường Thanh Massage Mạc Đĩnh Chi là một cơ sở trong hệ thống massage nổi tiếng bậc nhất cả nước của tập đoàn Mường Thanh. Mường Thanh Massage Mạc Đĩnh Chi có cơ sở vật chất sang trọng, đăng cấp, đội ngũ nhân viên với phong cách làm việc chuyên nghiệp, chuyên môn cao và cực kỳ chiều khách, chắc chắn sẽ là một điểm đến cực kỳ hot trong giới massage',NULL,NULL,NULL,'10.785353','106.699754',1,100,NULL,NULL,NULL,'2018-06-24 17:26:02','2018-06-24 17:26:02','1517494604290_2d4b8c9d-7a9b-4659-809e-691f5c8534b8.jpg','muong-thanh-massage-mac-dinh-chi-8a-mac-dinh-chi-quan-1-tp-hcm-19820',0),(11,'Massage Tân Đông Kinh','Tòa nhà Smart Office - đường 3/2, 03 3 Tháng 2, Phường 12, phường 14 quận 10, Hồ Chí Minh','09:00','02:00',NULL,'0915938375','Nói chung tại đây các bác được chiều chuộng như người yêu, muốn làm gì thì làm, KTV có tay nghề mát xa cực đỉnh',NULL,NULL,NULL,'10.7643765','106.6608741',1,100,NULL,NULL,NULL,'2018-06-24 17:26:07','2018-06-24 17:26:07','1517591907138_04d61590-08a9-45f6-aea5-daff4362b447.jpg','massage-tan-dong-kinh-toa-nha-smart-office-duong-3-2-03-3-thang-2-phuong-12-phuong-14-quan-10-ho-chi-minh-20256',0),(12,'Spa De Palace Fortuna Hotel','6B Láng Hạ - Ba Đình - Hà Nội','10:00','0:00',NULL,'02438313333','Tọa lạc trên penthouse tầng 17 của khách sạn 4* Fortuna Hotel, Spa De Place là một cơ sở massage có đầy đủ các trang thiết bị hiện đại, tối tân, trang trí sang trọng, đẳng cấpvà có đội ngũ nhân viên quản lý, kỹ thuật viên được tuyển chọn cực kỳ kỹ càng và chọn lọc, cực kỳ xinh đẹp và nhiệt tình với khách hàng. Chắc chắn sẽ khẳng định được dịch vụ thư giãn dành cho những dân chơi thứ thiệt',NULL,NULL,NULL,'21.021784000000004','105.8182829',1,100,NULL,NULL,NULL,'2018-06-24 17:28:03','2018-06-24 17:28:03','1517321665000_0843ee48-8729-4d51-bc82-cbd346aeed1e.jpg','spa-de-palace-fortuna-hotel-6b-lang-ha-ba-dinh-ha-noi-19576',0),(13,'Vietlotusspa','26 Ngõ 12 - Đặng Thai Mai','09:00','22:00',NULL,'094 389 54 56','Vietlotusspa is offering the best SPA services in Tay Ho. Our Professional therapists know how to take care of your body. Come to enjoy relaxation !',NULL,NULL,NULL,'21.062889','105.8235356',1,100,NULL,NULL,NULL,'2018-06-24 17:28:07','2018-06-24 17:28:07','1506055315035_8b937006-b2b9-4c71-b3a7-cff190173b82.jpg','vietlotusspa-26-ngo-12-dang-thai-mai-9730',0),(14,'Mường Thanh Massage Xa La','khu đô thị Xa La - Hà Đông - Hà Nội','9:00','23:00',NULL,'02433115555','Mường Thanh Massage Xa La nằm trong khách sạn sang trọng hàng đầu thủ đô Mường Thanh Xa La. Với hệ thống trang thiết bị, cơ sở vật chất hiện đại và đội ngũ nhân viên được tuyển chọn, đào tạo bài bản về cả ngoại hình và tay nghề, kỹ năng, kỹ thuật cam kết sẽ giúp cho quý khách những cảm giác khó mà có được',NULL,NULL,NULL,'20.960604','105.792677',1,100,NULL,NULL,NULL,'2018-06-24 17:28:19','2018-06-24 17:28:19','1517147482711_a2ba8372-33ef-4d39-957f-d7936b7771da.jpg','muong-thanh-massage-xa-la-khu-do-thi-xa-la-ha-dong-ha-noi-19525',0),(15,'Ocean Spa','130 Vũ Phạm Hàm, Yên Hoà','09:00','22:00',NULL,'093 694 6177','Ocean Spa là địa điểm lý tưởng để bạn và những người thân có thể tận hưởng những phút giây thư giãn thoải mái tuyệt vời nhất. Với hệ thống máy móc hiện đại, công nghệ làm đẹp tiên tiến, Ocean Spa hứa hẹn mang đến cho bạn nhiều dịch vụ chất lượng như: chăm sóc da mặt, trẻ hóa làn da, massage body, … để phục vụ nhu cầu làm đẹp của khách hàng một cách tốt nhất.',NULL,NULL,NULL,'21.0189464','105.7995769',1,100,NULL,NULL,NULL,'2018-06-24 17:28:25','2018-06-24 17:28:25','1513666329941_0b93fae0-66f7-4a1f-a819-7f5a5de670b2.jpg','ocean-spa-130-vu-pham-ham-yen-hoa-15011',0),(16,'Massage Oasis hotel','19 Láng Hạ','11:00','0:00',NULL,'02435143888','Nằm trong chuỗi khách sạn Quốc tế, có mặt trên 10 thành phố của Nhật, Oasis Hotels Hanoi đã được khẳng định đạt tiêu chuẩn khách sạn 3 sao và chất lượng dịch vụ hạng sang',NULL,NULL,NULL,'21.021831','105.8196679',1,100,NULL,NULL,NULL,'2018-06-24 17:28:35','2018-06-24 17:28:35','1519886753133_b15c46a5-8072-4bcb-82f7-c6f5d836ef69.jpg','massage-oasis-hotel-19-lang-ha-7553',0),(17,'Donna Spa -Face & body treatment Hotline 04.35551875','59 Lê Duẩn, hanoi','08:30','23:00',NULL,'+243 55 51875','Nơi tận hưởng sự yên tĩnh và thư giãn. Enjoy your Leisure time. Hotline 04.35551875',NULL,NULL,NULL,'21.02646','105.84156',1,100,NULL,NULL,NULL,'2018-06-24 17:28:37','2018-06-24 17:28:37','1506055306993_2c374eec-a94f-4727-8b78-e978f8461474.jpg','donna-spa-face-body-treatment-hotline-04-35551875-59-le-duan-hanoi-9728',0),(18,'Windy Massage Nguyễn Thị Định','Villa B9 Nguyễn Thị Định - Cầu Giấy - Hà Nội','9:00','23:30',NULL,'0912704334','Windy Massage là một trong những chuỗi dịch vụ Massage có uy tín và nổi tiếng nhất trên toàn quốc, cam kết đem đến cho khách hàng dịch vụ tốt nhất và cho anh em những phút giây thư giãn sau những phút giây mệt mỏi của công việc',NULL,NULL,NULL,'21.0104108','105.8046567',1,100,NULL,NULL,NULL,'2018-06-24 17:28:50','2018-06-24 17:28:50','1516973405282_526d0e3e-c58c-4955-9b02-a956da970112.jpg','windy-massage-nguyen-thi-dinh-villa-b9-nguyen-thi-dinh-cau-giay-ha-noi-19422',0),(19,'Windy Massage Duy Tân','số 18 ngõ 76 Duy Tân - Cầu Giấy - Hà Nội','9:00','23:30',NULL,'0466839999','Windy Massage Duy Tân là một cơ sở trong chuỗi massage Windy nổi tiếng tại Hà Nội. Windy Duy Tân có cơ sở vật chất tối tân, dàn nhân viên cao ráo, xinh đẹp với trình độ chuyên môn cao, kỹ năng kỹ xảo điêu luyện và nhiều chiêu bài sẽ khiến cho các anh em một đi không trở lại',NULL,NULL,NULL,'21.030944899999994','105.78403879999999',1,100,NULL,NULL,NULL,'2018-06-24 17:28:54','2018-06-24 17:28:54','1517123017714_983418f8-4d10-46d5-8ce6-193c3841a605.jpg','windy-massage-duy-tan-so-18-ngo-76-duy-tan-cau-giay-ha-noi-19509',0),(20,'Massage Yoni Hà Nội','Số 8 Đinh Tiên Hoàng','06:00','23:55',NULL,'096 908 88 53','Anh Chị mong muốn được massage tại nhà rồi sau đó có một giấc ngủ thật ngon? Vậy hãy liên hệ với chúng tôi qua Hotline: 0969.0888.53 để được chăm sóc tận nơi',NULL,NULL,NULL,'21.1434926','105.5050475',1,100,NULL,NULL,NULL,'2018-06-24 17:28:59','2018-06-24 17:28:59','1506055281466_c4fdc6bf-6bb1-4e92-a656-bb17c2e53eed.jpg','massage-yoni-ha-noi-so-8-dinh-tien-hoang-9722',0),(21,'Urban Oasis Spa','39A Hang Hanh-Hoan Kiem','09:00','22:00',NULL,'097 413 26 32','For more than 10 years of experience, Urban Oasis Spa knows very well how to take care of customers. It is endowed with a highly trained and professional .',NULL,NULL,NULL,'21.031210900909','105.85011551273',1,100,NULL,NULL,NULL,'2018-06-24 17:29:01','2018-06-24 17:29:01','1506055051249_6c92b2ff-f675-4598-922e-de5885356b62.jpg','urban-oasis-spa-39a-hang-hanh-hoan-kiem-9709',0),(22,'SF Spa Hà Nội','30 Cua Dong, Hoan Kiem','09:00','23:30',NULL,'04 3747 5301','Spa in Hanoi, professional spa in Hanoi, Body massage, foot massage, face care, VietnameseTraditional Spa,',NULL,NULL,NULL,'21.034783565238','105.84541778762',1,100,NULL,NULL,NULL,'2018-06-24 17:29:07','2018-06-24 17:29:07','1506055286915_6afeb59b-8316-48d7-9c91-b06ee75ded13.jpg','sf-spa-ha-noi-30-cua-dong-hoan-kiem-9705',0),(23,'Yakson Beauty','Tầng 1 toà C TTTM Imperia Garden, số 203 Nguyễn Huy Tưởng, Thanh Xuân, Hà Nội','09:00','20:00',NULL,'02471099556','Viện trị liệu thẩm mỹ của những nghệ nhân',NULL,NULL,NULL,'20.9965156216347','105.802697679127',1,100,NULL,NULL,NULL,'2018-06-24 17:29:15','2018-06-24 17:29:15','1527922422239_cc8fc3e4-00f5-4ac2-a1fd-d990d3bea7c3.jpg','yakson-beauty-tang-1-toa-c-tttm-imperia-garden-so-203-nguyen-huy-tuong-thanh-xuan-ha-noi-24441',0),(24,'Massage Minh Tâm Lý Thường Kiệt','512 Lý Thường Kiệt - Tân Binh - Tp.HCM','10:00','23:00',NULL,'02838641585','Massage Minh Tâm nằm trong khuân viên của khách sạn Thanh Bình 2. Minh Tâm có cơ sở vật chất hiện đại, sang trọng đầy đủ tiện nghi và được trang trí đẹp mắt. Đội ngũ của Minh Tâm massage được tuyển chọn và đào tạo một cách kỹ lưỡng, có hình thức đẹp, quyến rũ cùng trình độ chuyên môn tốt, chắc chắn sẽ khiến quý khách vô cùng hài lòng',NULL,NULL,NULL,'10.779406999999999','106.654265',1,100,NULL,NULL,NULL,'2018-06-24 17:29:32','2018-06-24 17:29:32','1517489606259_f4be6e99-4d42-47ba-9cef-4a6aef52fa47.jpg','massage-minh-tam-ly-thuong-kiet-512-ly-thuong-kiet-tan-binh-tp-hcm-19816',0),(25,'Massage Galaxy ( KS Danh Uy 1 )',' 90-92 Nguyễn Tri Phương, P.7, Q.5, TPHCM','12:00','03:00',NULL,'0838361519','Massage Galaxy sở hữu lợi thế về địa lý vì nằm ngay trên trục đường lớn Nguyễn Tri Phương. Ngoài ra còn có cơ sở vật chất hoàn hảo, đội ngũ kỹ thuật viên với tay nghề cao, hứa hẹn sẽ mang đến cho quý anh em những giây phút thư giãn tuyệt vời nhất. ',NULL,NULL,NULL,'10.7600026','106.6688655',1,100,NULL,NULL,NULL,'2018-06-24 17:29:36','2018-06-24 17:29:36','1517669839237_fdd6a011-6447-4f74-ac67-c9f3749809cd.jpg','massage-galaxy-ks-danh-uy-1-90-92-nguyen-tri-phuong-p-7-q-5-tphcm-20285',0),(26,'Body and Soul Spa Hanoi','Number 5, Ngõ 12 Đường Đặng Thai Mai. Tây Hồ.','09:00','19:00',NULL,'090 424 13 14','Body&Soul Beauty Salon and Boutique bring the very best of traditional natural beauty treatment from Asia combined with luxury Western high standard.',NULL,NULL,NULL,'21.0639554','105.8254421',1,100,NULL,NULL,NULL,'2018-06-24 17:29:40','2018-06-24 17:29:40','1506055299042_ee05cbaa-5ad9-4bc8-980a-5137ca4bc563.jpg','body-and-soul-spa-hanoi-number-5-ngo-12-duong-dang-thai-mai-tay-ho-9725',0),(27,'Massage SAIGON STAR',' 204 Nguyễn Thị Minh Khai, phường 6, Quận 3, Hồ Chí Minh​','00:00','23:59',NULL,'02839306290','Massage Saigon Star nằm trong khách sạn Star tiêu chuẩn 3***, tọa lạc ngay tại trung tâm thành phố nên rất thuận tiện cho việc đi lại của bạn. Không gian cao cấp, sang trọng nhưng luôn tạo ra sư ấm cúng, đến với Massage Saigon Star, bạn sẽ được tận hưởng những giây phút nghỉ ngơi tuyệt với nhất.',NULL,NULL,NULL,'10.7779377','106.6934507',1,100,NULL,NULL,NULL,'2018-06-24 17:29:52','2018-06-24 17:29:52','1517547683551_9bbf0b70-8c8e-451d-aeb5-053ba22b5786.jpg','massage-saigon-star-204-nguyen-thi-minh-khai-phuong-6-quan-3-ho-chi-minh-20013',0),(28,'Massage Suối Hoa ','ngõ 63 Lê Đức Thọ - Nam Từ Liêm - Hà Nội ','9:00','23:30',NULL,'0912843388','Massage Suối Hoa Lê Đức Thọ là một địa điểm lý tưởng dành cho các quý ông muốn đổi gió sau những giờ làm việc căng thẳng. Phong cách bài trí mờ ảo, độc đáo cùng với các em nhân viên cực kỳ nhiệt tình, vui vẻ, hết mình vì các \'\'thượng đế\'\' nhất định sẽ khiến bạn cực kỳ thỏa mãn',NULL,NULL,NULL,'21.030273099999995','105.7712227',1,100,NULL,NULL,NULL,'2018-06-24 17:29:55','2018-06-24 17:29:55','1517143766795_0497891d-f322-449b-bfbf-c03a8194643c.jpg','massage-suoi-hoa-ngo-63-le-duc-tho-nam-tu-liem-ha-noi-19523',0),(29,'King Spa Tô Hiệu','63 Tô Hiệu - Cầu Giấy - Hà Nội','9:00','0:00',NULL,'0974645996','King Spa là một địa chỉ nổi tiềng trong ngành massage Hà Thành. Với cơ sở vật chất hiện đại, lịch sự, sạch sẽ, liên tục được tu sửa và dàn nhân viên chân dài, trẻ trung xinh đẹp, tâm huyết với nghề cam kết sẽ khiến các \'\'ông hoàng\'\' có những khoảng khắc khó quên',NULL,NULL,NULL,'21.044878000000004','105.7965803',1,100,NULL,NULL,NULL,'2018-06-24 17:30:00','2018-06-24 17:30:00','1517195772402_ce782d3f-c31d-4ee0-b810-3de1a04f4fec.jpg','king-spa-to-hieu-63-to-hieu-cau-giay-ha-noi-19530',0),(30,'Blue Spa Nguyễn Khánh Toàn','số 5 ngõ 5 Nguyễn Khánh Toàn - Cầu Giấy - Hà Nội','9:00','0:45',NULL,'0914831666','Blue Spa tọa lạc trên khu phố ăn chơi sầm uất về đêm Nguyễn Khánh Toàn. Cơ sở vật chất hiện đại, giá cả hợp lý, đặc biệt là dàn nhân viên làm nghề giàu kinh nghiệm, kỹ thuật điêu luyện và ngoại hình trẻ đẹp, từ đáng yêu tới gợi cảm, hứa hẹn sẽ là một trong những điểm đến hàng đầu cho các anh em đam mê massage',NULL,NULL,NULL,'21.035043400000003','105.8039932',1,100,NULL,NULL,NULL,'2018-06-24 17:30:06','2018-06-24 17:30:06','1517105851853_98676106-39e0-4860-8b5c-40aa8b8d38d7.jpg','blue-spa-nguyen-khanh-toan-so-5-ngo-5-nguyen-khanh-toan-cau-giay-ha-noi-19482',0),(31,'Massage Hương Sen','49 Thái Thịnh','8:30','22:30',NULL,'02438533798','Massage vật lý trị liệu (Matxa vật lý trị liệu) đã trở thành thuật ngữ quen thuộc với tất cả mọi người, trở thành một “món ăn tinh thần” sau những giờ phút làm việc miệt mài, căng thẳng. Không những đem lại một tâm hồn thư thái, sảng khoái mà còn nâng niu, chăm sóc vẻ đẹp của bạn.',NULL,NULL,NULL,'21.008684099999996','105.8193405',1,100,NULL,NULL,NULL,'2018-06-24 17:30:11','2018-06-24 17:30:11','1519888049389_abdb7a8f-fa0f-466b-a437-373dd9905db3.jpg','massage-huong-sen-49-thai-thinh-20637',0),(32,'Đại Cát Foot Massage','145 Giảng Võ - Đống Đa - Hà Nội','9:00','22:00',NULL,'0437344808','Spa chất lượng cao, nơi thư giãn sau những ngày làm việc căng thẳng',NULL,NULL,NULL,'21.026583','105.823658',1,100,NULL,NULL,NULL,'2018-06-24 17:30:13','2018-06-24 17:30:13','1514344175415_28c8f83d-52ac-4be6-879a-2658a09e706d.jpg','dai-cat-foot-massage-145-giang-vo-dong-da-ha-noi-16238',0),(33,'Massage Việt Hồng','275 Cách Mạng Tháng Tám - Quận 10  - Tp.HCM','12:00','3:00',NULL,'0932384068','Massage Việt Hồng là một điểm massage có bề dày kinh doanh tại Sài Thành. Việt Hồng có cơ sở vật chất lịch sự, sạch sẽ, tiện nghi, trang trí ấm cúng, đẹp mắt cùng dàn nhân viên gợi cảm, quyến rũ nhưng dịu dàng, nhỏ nhẹ, ngoan ngoãn, cực kỳ chiều khách và kỹ thuật cao, chắc chắn sẽ khiến quý khách không thể nào hài lòng hơn',NULL,NULL,NULL,'10.7780314','106.6810216',1,100,NULL,NULL,NULL,'2018-06-24 17:30:17','2018-06-24 17:30:17','1517457569750_9fdf5b49-ab02-4e5c-a91c-1fa2b195bc6f.jpg','massage-viet-hong-275-cach-mang-thang-tam-quan-10-tp-hcm-19762',0),(34,'Massage Regal','57-59 Phó Đức Chính, Q1','09:00','01:00',NULL,'0888.882.663','Như body hay foot masage(massa chân có tiền bo) sauna, steambath jacuzzi, ngâm chân thuốc bắc….. thêm nước uống cafe lipton đá chanh,trái cây,bánh kẹo,mì gói free…(đừng uống nước suối hay nước đóng lon có thanh toán tiền nước) khuyến mãi cho anh em nhiều số em út dễ thương luôn nhé',NULL,NULL,NULL,'10.7990144','106.6970287',1,100,NULL,NULL,NULL,'2018-06-24 17:30:20','2018-06-24 17:30:20','1517676155601_93daef7a-0929-449e-8647-c97a8b9ce5e5.jpg','massage-regal-57-59-pho-duc-chinh-q1-20292',0),(35,'Queen Sauna Massage Trần Đăng Ninh','233 Trần Đăng Ninh - Cầu Giấy - Hà Nội','9:00','20:00',NULL,'02437932592','Queen Massage với đội ngũ nhân viên lành nghề sẽ đêm đến cho quý khách ở mọi lứa tuổi những phút giây thư giãn, giá thành hợp lý',NULL,NULL,NULL,'21.039091799999998','105.79176749999999',1,100,NULL,NULL,NULL,'2018-06-24 17:30:24','2018-06-24 17:30:24','1516976794055_755784ca-33bd-4a37-8549-830cb4b7ae8e.jpg','queen-sauna-massage-tran-dang-ninh-233-tran-dang-ninh-cau-giay-ha-noi-19426',0),(36,'Massage Minh Minh Tâm',' 709 Lê Hồng Phong - P.12 - Q.10 ​','10:00','03:00',NULL,'0888.882.663','Massage Minh Minh Tâm LHP được thiết kế hoàn hảo và khá ấn tượng với các khu phòng vip và supper vip cực đẹp. Phong cách sang trọng được thiết kế tinh tế nhưng không kém phần trang nhã mang đến quý khách hàng những phút giây thư giản thoải mái với không gian đúng chất của 1 Massage Đẳng Cấp',NULL,NULL,NULL,'10.764953','106.675384',1,100,NULL,NULL,NULL,'2018-06-24 17:30:28','2018-06-24 17:30:28','1517656921401_0595b58b-e9c6-4007-b8f2-a300ffff0593.jpg','massage-minh-minh-tam-709-le-hong-phong-p-12-q-10-20284',0),(37,'Massage Godfather',' 275 Cách Mạng Tháng 8, P.12, Q.10','10:00','02:00',NULL,'0888696866','Nơi cảm xúc thăng hoa, mệt mỏi tan biến. Đội ngũ kỹ thuật viên nhiệt tình, trẻ trung sẽ làm hài lòng đấng mày râu',NULL,NULL,NULL,'10.7780968','106.6810643',1,100,NULL,NULL,NULL,'2018-06-24 17:30:31','2018-06-24 17:30:31','1517544861236_e16843c3-07b9-4e55-86e0-ccbdf1e77e5e.jpg','massage-godfather-275-cach-mang-thang-8-p-12-q-10-19932',0),(38,'Massage Royal Tân Bình','417A Cộng Hòa - Tân Bình - Tp.HCM','12:00','0:00',NULL,'02838123871','Massage Royal là sự kết hợp hài hòa giữa mát xa cổ truyền Việt Nam với kỹ thuật mát xa Thái - Hồng Kông. Đến đây, khách hàng sẽ được trại nghiệm những dịch vụ massage độc đáo, sảng khoái, được thực hiện bởi đội ngũ nhân viên xinh đẹp, nhiệt tình chuyên nghiệp, xứng đáng là chốn qua lại của dân chơi Sài Thành',NULL,NULL,NULL,'10.804554800000002','106.6372483',1,100,NULL,NULL,NULL,'2018-06-24 17:30:35','2018-06-24 17:30:35','1517399322148_d3a5b813-dc15-4e65-99ca-ec1ea680bef0.jpg','massage-royal-tan-binh-417a-cong-hoa-tan-binh-tp-hcm-19746',0),(39,'Kingston Club Hàng Chuối','53B Hàng Chuối - Hai Bà Trưng - Hà Nội','9:00','0:00',NULL,'0439725872','Kingston Club nằm trong chuỗi Kingston Massage nổi tiếng Hà Thành. Kingston Club có cơ sở vật chất lịch sự, sạch sẽ, ấm cúng cùng đội ngũ kỹ thuật viên được tuyển chọn kỹ càng cả về mặt hình thức lẫn thái độ, chuyên môn. Kingston Club đã, đang và sẽ là điểm đến ruột của các anh em đam mê massage pha chút thư giãn',NULL,NULL,NULL,'21.016268999999998','105.85779199999999',1,100,NULL,NULL,NULL,'2018-06-24 17:30:38','2018-06-24 17:30:38','1517320889989_11511653-6ca8-4e83-a075-58381e314583.jpg','kingston-club-hang-chuoi-53b-hang-chuoi-hai-ba-trung-ha-noi-19575',0),(40,'Massage Avatar HBO','433/6 Sư Vạn Hạnh, Phường 12, Quận 10','12:00','00:00',NULL,'0888.69.68.66','Vẫn nằm trên cung đường đầy hoa lệ với địa chỉ 433/6 Sư Vạn Hạnh, Phường 12, Quận 10. Sẽ là điểm đến không thể bỏ qua cho quý anh em trong những cuộc vui bất tận. Cung đường này trãi dài các dịch vụ giải trí như Karaoke, café đàm đạo, xa hơn tí là giáp với cung đường quán nhậu Thành Thái. Massage Avatar HBO sẽ là điểm đến lý tưởng cho các anh em đến thư giản khi kết thúc buổi hội cùng bè bạn hoặc tiếp đãi đối tác.',NULL,NULL,NULL,'10.768135','106.6714678',1,100,NULL,NULL,NULL,'2018-06-24 17:30:42','2018-06-24 17:30:42','1517671866215_131505fb-f321-48d8-9c02-d72eae6c16e6.jpg','massage-avatar-hbo-433-6-su-van-hanh-phuong-12-quan-10-20287',0),(41,'Massage Điêu Thuyền','242 Đồng Đen - Tân Bình - Tp.HCM','10:30','1:00',NULL,'0888966866','Massage Điêu Thuyền là cơ sở massage ko thể bỏ qua khi tới quận Tân Bình, được đánh giá là tốt nhất khu vực. Điêu Thuyền Massage nằm gần trung tâm thành phố, có thiết kế sang trọng, lịch sự, cơ sở vật chất hiện đại cùng dàn chân dài ngoan ngoãn, yêu nghề, chuyên môn cao. Chắc chắn sẽ làm hài lòng quý khách khi tới đây',NULL,NULL,NULL,'10.788159400000001','106.64303179999999',1,100,NULL,NULL,NULL,'2018-06-24 17:30:45','2018-06-24 17:30:45','1517410493199_f2fabd05-0ec9-4ee0-a7e4-64cbe703e365.jpg','massage-dieu-thuyen-242-dong-den-tan-binh-tp-hcm-19747',0),(42,'Massage Tiểu Long Nữ','132 Trần Quốc Tuấn, Phường 1, Quận Gò Vấp.','12:00','00:00',NULL,'0888696866','Sẽ là một địa điểm vui chơi, thư giãn mới mẻ, sang trọng và đẳng cấp cho những anh em đang cần giải tỏa những căng thẳng mệt mỏi hằng ngày. Quý anh em hãy đến với dịch vụ của cơ sở Massage Tiểu Long Nữ để thưởng thức được ”Sắc Nước Hương Trời” tại chốn “ Bồng Lai Tiên Cảnh” được hội tụ trong một không gian hoàn toàn riêng biệt và ấm cúng. Thưởng hoa du ngoạn ở chốn “ Tiên Bồng”!! ',NULL,NULL,NULL,'10.8199348','106.689949',1,100,NULL,NULL,NULL,'2018-06-24 17:30:48','2018-06-24 17:30:48','1517671172745_b780697f-5adf-4a9d-9433-67edba412b57.jpg','massage-tieu-long-nu-132-tran-quoc-tuan-phuong-1-quan-go-vap-20286',0),(43,'Geisha Massage Lê Đức Thọ','20 Lê Đức Thọ - Nam Từ Liêm - Hà Nội','10:00','0:00',NULL,'0911999997','Geisha Massage Lê Đức Thọ nằm trong chuỗi massage có uy tín, nổi tiếng tại Hà Nội - Geisha Massage. Với cơ sở vật chất hiện đại, sạch sẽ, trang trí sang trọng, bát mắt và dàn nhân viên được tuyển chọn về cả ngoại hình và chuyên môn, rất chiều chuộng khách hàng, Geisha Massage Lê Đức Thọ sẽ tiếp tục đem đến sự thư giãn tuyệt vời nhất dành cho khách hàng',NULL,NULL,NULL,'21.036050000000003','105.77069999999999',1,100,NULL,NULL,NULL,'2018-06-24 17:30:52','2018-06-24 17:30:52','1517391064676_a9f76194-29b5-4b31-9821-b548b05c4952.jpg','geisha-massage-le-duc-tho-20-le-duc-tho-nam-tu-liem-ha-noi-19740',0),(44,'Hiền Hạnh Spa- Số1về Điều trị Nám,Mụn,PhunThêu tại Đông Anh, Hà Nội','Số 41 Vân Trì, Vân Nội, Đông Anh, Hà Nội','08:00','08:00',NULL,'098 221 19 27','skin clinic , DDk , Es, Teana',NULL,NULL,NULL,'21.140598616132','105.81431508064',1,100,NULL,NULL,NULL,'2018-06-24 17:30:56','2018-06-24 17:30:56','1505714740706_9a0d6771-d45b-4e29-ba18-c7c2000f751f.jpg','hien-hanh-spa-so1ve-dieu-tri-nam-mun-phuntheu-tai-dong-anh-ha-noi-so-41-van-tri-van-noi-dong-anh-ha-noi-9427',0),(45,'Zeus Spa Âu Cơ','1/431 Âu Cơ - Tây Hồ - Hà Nội','9:00','2:00',NULL,'0945693838','Zeus Spa nằm gần công viên nước Hồ Tây, là một điểm đến quan thuộc của các dân chơi Hà Thành. Zeus Spa có cơ sở vật chất hoành tráng, sang trọng, cao cấp trang trí theo phong cách Hy Lạp cầu kỳ, đẹp mắt. Đội ngũ nhân viên được tuyển chọn kỹ càng về mọi mặt, đặc biệt là cực kỳ đẹp về hình thức lại rất ngoan ngoãn, nhất định sẽ khiến quý khách không thể nào không quay lại',NULL,NULL,NULL,'21.076954','105.82054099999999',1,100,NULL,NULL,NULL,'2018-06-24 17:30:58','2018-06-24 17:30:58','1517364754841_ac10f1fb-6cf5-4815-8cc3-618c289730ac.jpg','zeus-spa-au-co-1-431-au-co-tay-ho-ha-noi-19581',0),(46,'Esalen Massage Hoàng Cầu ','18 Hoàng Cầu - Đống Đa - Hà Nội','9:00','23:30',NULL,'02435380488','Esalen Massage Hoàng Cầu là một cơ sở massage bình dân cho các anh em muốn thư giãn. Cơ sở vật chất lịch sự, sạch sẽ, đầy đủ và dàn nhân viên ngoại hình tốt, ngoan ngoãn, nhiệt tình, hết mình vì khách hàng. Chắc chắn sẽ là một nơi cực kỳ đáng đến sau những ngày căng thẳng',NULL,NULL,NULL,'21.019464300000003','105.8251267',1,100,NULL,NULL,NULL,'2018-06-24 17:31:01','2018-06-24 17:31:01','1517196548005_7a25652f-145d-481b-b416-e5ac3f8757a3.jpg','esalen-massage-hoang-cau-18-hoang-cau-dong-da-ha-noi-19531',0),(47,'Massage Boss Place','306-308 Nguyễn Thiện Thuật - Quận 3 - Tp. HCM','0:00','0:00',NULL,'0938578747','Massage Boss Place nằm trong khuân viên Boss Place Hotel - một khách sạn cao cấp nằm ở trung tâm thành phố, gần các địa điểm du lịch. Đến đây, khách hàng sẽ được trải nghiệm những dịch vụ thư giãn cực kỳ thú vị bởi bàn tay của những nhân viên xinh đẹp, chuyên nghiệp, ngoan ngoãn, trong một cơ sở vật chất cực kỳ sang trọng, đẳng cấp.',NULL,NULL,NULL,'10.7700272','106.6774159',1,100,NULL,NULL,NULL,'2018-06-24 17:31:05','2018-06-24 17:31:05','1517448423032_ff38bc5e-3108-4a59-bed5-05d44a09dad2.jpg','massage-boss-place-306-308-nguyen-thien-thuat-quan-3-tp-hcm-19756',0),(48,'Massage Hưng Thịnh','281 Tây Thạnh - P.Tây Thạnh - Q.Tân Phú','22:00','03:00',NULL,'0903699711','Tọa lạc ở địa chỉ 281 Tây Thạnh - P.Tây Thạnh - Q.Tân Phú với vị trí giao thông thuận lợi Massage Hưng Thịnh đã mạnh dạng đầu tư về cơ sở vật chất nhằm phục vụ anh em có những giây phút thưa giản tốt nhất.',NULL,NULL,NULL,'10.8122907','106.6261831',1,100,NULL,NULL,NULL,'2018-06-24 17:31:09','2018-06-24 17:31:09','1517493064572_eff1591f-92c0-4ace-ba02-acd5aeb03a3b.jpg','massage-hung-thinh-281-tay-thanh-p-tay-thanh-q-tan-phu-19819',0),(49,'Massage Sweetlady Hoàn Kiếm','929 Hồng Hà - Hoàn Kiếm - Hà Nội','10:00','0:00',NULL,'0965228228','Massage Sweetlady là phiên bản nâng cấp, hoàn thiện của GS HTK. Với cơ sở vật chất được trùng tu, sạch sẽ, lịch sự, đầy đủ tiện nghi, trang trí sang trọng, bát mắt cùng dàn nhân viên được tuyển chọn kỹ càng về cả ngoại hình lẫn chuyên môn nhất định sẽ làm quý khách hài lòng',NULL,NULL,NULL,'21.023370900000003','105.86109929999999',1,100,NULL,NULL,NULL,'2018-06-24 17:31:12','2018-06-24 17:31:12','1517394110925_2c3eaa81-cb67-40de-8e2b-fb2cd88bd17a.jpg','massage-sweetlady-hoan-kiem-929-hong-ha-hoan-kiem-ha-noi-19742',0),(50,'Sakura Spa Quan Hoa','175 đường bờ sông Quan Hoa - Cầu Giấy - Hà Nội','11:00','0:00',NULL,'0913565630','Sakura Spa Quan Hoa là 1 cơ sở của hệ thống Sakura Spa cực kỳ nổi tiếng và uy tín tại thủ đô Hà Nội trong lĩnh vực massage. Sakura Quan Hoa có cơ sở vật chất hiện đại, sạch sẽ, trang trí theo phong cách Nhật Bản đẹp mắt, độc đáo, dàn nhân viên được tuyển chọn và đào tạo kỹ lưỡng, mặt bằng chung từ khá tốt trở lên về cả ngoại hình, chuyên môn và thái độ',NULL,NULL,NULL,'21.0355657','105.804869',1,100,NULL,NULL,NULL,'2018-06-24 17:31:17','2018-06-24 17:31:17','1517368268855_2964e939-fda0-48de-bcee-5509786cc473.jpg','sakura-spa-quan-hoa-175-duong-bo-song-quan-hoa-cau-giay-ha-noi-19585',0),(51,'Geisha Massage Huỳnh Thúc Kháng','số 10 ngõ 55 Huỳnh Thúc Kháng - Cầu Giấy - Hà Nội','10:00','0:00',NULL,'0868336335','Geisha Massage Huỳnh Thúc Kháng sau đợt nâng cấp sửa chữa và cải tổ lại đội ngũ nhân viên đã trở thành một điểm đến cực kỳ nóng đối với anh em đam mê massage. Với mức giá hợp lý, cơ sở vật chất đầy đủ tiện nghi, sạch sẽ, trang trí sang trọng và đội ngũ nhân viên tay nghề cao, phong độ tốt, ngoan ngoãn, chiều chuộng thì chắc chắn sẽ đem lại được những trải nghiệm cực kỳ thăng hoa cho quý khách',NULL,NULL,NULL,'21.0186431','105.8099046',1,100,NULL,NULL,NULL,'2018-06-24 17:31:20','2018-06-24 17:31:20','1517376807782_fdaaa2b2-a718-4387-a84b-38073a2d9a7a.jpg','geisha-massage-hu-nh-thuc-khang-so-10-ngo-55-hu-nh-thuc-khang-cau-giay-ha-noi-19606',0),(52,'Sakura Spa Âu Cơ','217 Âu Cơ - Tây Hồ - Hà Nội','10:30','0:00',NULL,'0913565630','Sakura Spa Âu Cơ là một cở sở trong chuỗi massage nổi tiếng và uy tín bậc nhất Hà Nội - Sakura Spa. Với kiến trúc phong cách Nhật Bản, cơ sở vật chất, phương tiện, dụng cụ massage hiện đại và đội ngũ nhân viên giàu kinh nghiệm, yêu nghề, trình độ chuyên môn cao, chắc chắn sẽ giúp cho quý khách có những phút giây thư giãn cực kỳ đáng nhớ',NULL,NULL,NULL,'21.066121099999997','105.82805409999999',1,100,NULL,NULL,NULL,'2018-06-24 17:31:24','2018-06-24 17:31:24','1517372857567_1f89be26-fb65-41c6-ab8f-eafeecbce8c9.jpg','sakura-spa-au-co-217-au-co-tay-ho-ha-noi-19602',0),(53,'Massage Festival Cao Thắng','31 Cao Thắng - Quận 3 - Tp.HCM','0:00','0:00',NULL,'0888696866','Massage Festival tọa lạc trên con phố ăn chơi sầm uất Cao Thắng với nhiều dịch vụ đa dạng, thú vị. Festival Massage có cơ sở vật chất sang trọng, lịch sự và dàn nhân viên được đào tạo bài bản, tuyển chọn kỹ lưỡng, có ngoại hình đẹp, chuyên môn, tay nghề cao, chắc chắn sẽ đem lại cho khách hàng những cảm xúc chưa bao giờ có',NULL,NULL,NULL,'10.769397399999999','106.68324349999999',1,100,NULL,NULL,NULL,'2018-06-24 17:31:28','2018-06-24 17:31:28','1517452141677_bd8e1584-b57e-4a95-8b67-3a5ed1bccbfb.jpg','massage-festival-cao-thang-31-cao-thang-quan-3-tp-hcm-19759',0),(54,'Massage Ocean Phương Liệt','tầng 2 Khách sạn Ocean 63A Phương Liệt - Thanh Xuân - Hà Nội','10:00','23:30',NULL,'02438685718','Massage Ocean Phương Liệt là địa chỉ tin cậy và uy tín cho phái mạnh đến tìm kiếm sự thư giãn và thoải mái, với giá thành thấp nhưng hợp lý với chất lượng cao và đội ngũ nhân viên trẻ đẹp có kỹ thuật điêu luyện',NULL,NULL,NULL,'20.995948000000002','105.84024029999999',1,100,NULL,NULL,NULL,'2018-06-24 17:31:31','2018-06-24 17:31:31','1516965769476_5b8c6b94-f088-4cc2-8478-72c355f536db.jpg','massage-ocean-phuong-liet-tang-2-khach-san-ocean-63a-phuong-liet-thanh-xuan-ha-noi-19419',0),(55,'Massage Tây Thi','96 Gò Dầu - Tân Phú - Tp.HCM','10:00','2:00',NULL,'0898549305','Massage Tây Thi là một cơ sở massage được thiết kế sinh động, riêng biệt yên tĩnh, trang trí độc đáo với hệ thống đèn LED và có mùi hương quyến rũ dịu nhẹ. Với cơ sở vật chật lịch sự, sạch sẽ đầy đủ tiện nghi cùng dàn \'\'Tây Thi\'\' gợi cảm nhưng không kém phần đáng yêu và cực kỳ cao tay, nhất định sẽ là một điểm đến ưa thích của dân chơi Sài Thành',NULL,NULL,NULL,'10.7147052','106.7296423',1,100,NULL,NULL,NULL,'2018-06-24 17:31:36','2018-06-24 17:31:36','1517477855382_1023b359-3f58-4332-8b3a-977b46ab8cf0.jpg','massage-tay-thi-96-go-dau-tan-phu-tp-hcm-19814',0),(56,'Trung tâm chăm sóc sức khỏe y học cổ truyền Đồng Tiến ','số 2, ngõ 165 Giáp Bát ','9:00','22:00',NULL,'02439911237','Chuyên chữa các bệnh hệ thần kinh,  cơ xương khớp,  tác động cột sống,  xoa bóp bấm huyệt, phục hồi chức năng sau tai biến,  chăm sóc da chuyên sâu',NULL,NULL,NULL,'20.98512250000001','105.84357421874998',1,100,NULL,NULL,NULL,'2018-06-24 17:31:40','2018-06-24 17:31:40','1507385311164_2bbef475-448d-4cb4-a640-e1df7b97787d.jpg','trung-tam-cham-soc-suc-khoe-y-hoc-co-truyen-dong-tien-so-2-ngo-165-giap-bat-11429',0),(57,'Massage Dubai','206 Nguyển Văn Lượng, P17, Q Gò Vấp​','10:00','04:00',NULL,'0888.882.663','Với tiêu chí mỗi khách hàng đều là V.I.P, Masssage Dubai được thiết kế với toàn bộ hệ thống phòng đều là phòng VIP với mong muốn được phục vụ Quý khách với cơ sở vật chất tốt nhất cùng chất lượng dịch vụ chu đáo nhất',NULL,NULL,NULL,'10.8386657','106.6700686',1,100,NULL,NULL,NULL,'2018-06-24 17:31:42','2018-06-24 17:31:42','1517546364863_a8624cb3-647a-47c0-998c-c0edf88f6731.jpg','massage-dubai-206-nguyen-van-luong-p17-q-go-vap-19983',0),(58,'massage Linh Hà Sơn Kỳ','48 sơn kỳ - P.sơn kỳ - Q.tân phú - TP.HCM','09:00','03:00',NULL,'0869026003','Massage Linh Hà là sự kết hợp hài hòa, giữa nghệ thuật xoa bóp cổ truyền Việt Nam – với kỹ thuật Massage Thai Lan . Có bề dầy nhiều năm kinh nghiệm, là một trong những dịch vụ có thương hiệu lâu năm trong tâm trí khách hàng. ',NULL,NULL,NULL,'10.8033223','106.615868',1,100,NULL,NULL,NULL,'2018-06-24 17:31:45','2018-06-24 17:31:45','1517717177976_3c52cd41-3864-4140-aeb7-f9935bead6fc.jpg','massage-linh-ha-son-k-48-son-k-p-son-k-q-tan-phu-tp-hcm-20294',0),(59,'Massage Viễn Đông','275A, Phạm Ngũ Lão, Quận 1, Hồ Chí Minh','20:00','03:00',NULL,'0838364556','Toạ lạc tại trung tâm thành phố với vị trí đặc địa; từ lâu massage Viễn Đông được biết đến như 1 điểm đến cực chất với cơ sở vật chất sang trọng cùng những kỳ thuật viên xinh đẹp luôn chào đón quý khách với tất cả sự nồng nhiệt',NULL,NULL,NULL,'10.7680838','106.6916933',1,100,NULL,NULL,NULL,'2018-06-24 17:31:48','2018-06-24 17:31:48','1517491783144_2856fa3c-34e6-4127-baf0-34eec8d9d2fb.jpg','massage-vien-dong-275a-pham-ngu-lao-quan-1-ho-chi-minh-19818',0),(60,'Massage Lavender',' 82 Trường Chinh, phường Tân Hưng Thuận, quận 12.','12:00','03:00',NULL,'0937366707','Cùng với đội ngũ nhân viên ân cần, phải phép, phục vụ tốt tối đa nhu cầu của quý anh em, sẽ không làm anh em thất vọng.  Kỹ Thuật Viên mang nhiều sắc vóc, “ kỹ năng thượng thừa” nhiều kinh nghiệm sẽ giúp cho anh em một cảm xúc thăng hoa khi thư giãn cùng với KTV.  Kết hợp song song đó là từng phòng riêng biệt, hiệu ứng đèn led mờ ảo, tạo nên một không gian ấm cúng, riêng tư, xúc cảm được đưa lên tột độ trong khoảnh khắc tuyệt vời.  Nơi đây hứa hẹn sẽ là một địa điểm lí thú cho quý anh em khi dừng chân ghé qua',NULL,NULL,NULL,'10.8163966','106.6321148',1,100,NULL,NULL,NULL,'2018-06-24 17:31:52','2018-06-24 17:31:52','1517590786533_c12c4ba9-6cff-4a24-b7d0-e1573464df58.jpg','massage-lavender-82-truong-chinh-phuong-tan-hung-thuan-quan-12-20255',0),(61,'Massage Minh Tâm Cộng Hòa','278 Cộng Hòa - Tân Bình - TP.HCM','10:00','0:00',NULL,'02862963618','Massage Minh Tâm nằm trong khuân viên khách sạn Minh Tâm, là một điểm đến lý tưởng dành cho các anh em muốn thư giãn gân cốt. Với cơ sở vật chất hiện đại, khang trang cùng đội ngũ nhân viên chất lượng tốt về cả ngoại hình, chuyên môn và các dịch vụ đa dạng, phong phú, nhất định sẽ phục vụ quý khách thật tốt',NULL,NULL,NULL,'10.80237','106.646475',1,100,NULL,NULL,NULL,'2018-06-24 17:31:55','2018-06-24 17:31:55','1517396609416_e6ed31c9-3833-4842-a766-71c9d0fe5b4c.jpg','massage-minh-tam-cong-hoa-278-cong-hoa-tan-binh-tp-hcm-19744',0),(62,'Massage Quê Hương 4 ','265 Phạm Ngũ Lão - Quận 1 -Tp.HCM','10:00','23:00',NULL,'0839209879','Massage Quê Hương 4 là một cơ sở massage nổi tiếng TP HCM thuộc Quê Hương Liberty 4 Hotel. Quê Hương Massage 4 có cơ sở vật chất đạt tiêu chuẩn 3* lịch sự, sang trọng, sạch sẽ cùng đội ngũ nhân viên có phong cách làm việc chuyên nghiệp, chuyên môn cao, ngoan ngoãn nhiệt tình, sẽ mang đến những trải nghiệm hoàn hảo dành cho khách hàng',NULL,NULL,NULL,'10.768001000000002','106.692358',1,100,NULL,NULL,NULL,'2018-06-24 17:31:59','2018-06-24 17:31:59','1517456532713_f89e2591-4d76-4395-b584-102065336dac.jpg','massage-que-huong-4-265-pham-ngu-lao-quan-1-tp-hcm-19761',0),(63,'Massage hoa ban','62 đường 11, phường 11, quận gò vấp​','10:00','03:00',NULL,'0869026003','Với phòng ốc sang trọng được thiết kế tinh tế, giản dị, thoải mái với hương thơm nhẹ nhàng lan tỏa khắp phòng. Tất cả các phòng được trang bị đầy đủ tiện nghi cho khách, đội ngũ nhân viên chuyên nghiệp phục vụ nhiệt tình và chu đáo.',NULL,NULL,NULL,'10.849868','106.7628948',1,100,NULL,NULL,NULL,'2018-06-24 17:32:03','2018-06-24 17:32:03','1517727157243_79c126c9-f2d7-4357-a5b5-28c6c60f39ff.jpg','massage-hoa-ban-62-duong-11-phuong-11-quan-go-vap-20295',0),(64,'Đại Nam Massage ','79 Trần Hưng Đạo - Quận 1 - Tp.HCM','9:00','4:00',NULL,'02838242541','Đại Nam Massage nằm trong khuân viên khách sạn 3* Đại Nam Hotel gần trung tâm thành phố. Đại Nam Massage có cơ sở vật chất sang trọng, trang trí bát mắt, cầu kỳ cùng dàn nhân viên đa dạng (đáng yêu, gợi cảm, dễ thương, cao ráo, ...), có độ đều về chuyên môn, kỹ thuật và thái độ phục vụ cực kỳ tốt. Đảm bảo sẽ khiến quý khách hài lòng.',NULL,NULL,NULL,'10.768574','106.6961903',1,100,NULL,NULL,NULL,'2018-06-24 17:32:06','2018-06-24 17:32:06','1517450171323_3ef94601-b94e-4615-802a-d8beadf5c864.jpg','dai-nam-massage-79-tran-hung-dao-quan-1-tp-hcm-19758',0),(65,'Massage Minh Long','337 Nguyễn Thượng Hiền - P.11 - Q.10','10:00','02:00',NULL,'0838390080','Massage Minh Long - Khi Lấy Mã Code Qua Hotline 0888882663 Quý Khách Sẽ Được Ưu Đãi',NULL,NULL,NULL,'10.7749746','106.6834802',1,100,NULL,NULL,NULL,'2018-06-24 17:32:10','2018-06-24 17:32:10','1517543972185_d799459b-d0ad-4950-aee8-8b1b5705c00e.jpg','massage-minh-long-337-nguyen-thuong-hien-p-11-q-10-19910',0),(66,'Massage Du Xuân','3 Trần Khắc Chân, Tân Bình, HCM','10:00','00:00',NULL,'02862915056','Hệ thống cơ sở vật chất, phòng ốc được thiết kế theo phong cách hiện đại nhưng không kém phần lãng mạn cùng đội ngũ nhân viên xinh đẹp, nhiệt tình, chu đáo, tay nghề cao, chắc chắn sẽ đáp ứng được mọi nhu cầu của quý khách',NULL,NULL,NULL,'10.7935105','106.6914949',1,100,NULL,NULL,NULL,'2018-06-24 17:32:15','2018-06-24 17:32:15','1517672988243_c657bd26-a6d1-436c-9edb-11092d38e2e2.jpg','massage-du-xuan-3-tran-khac-chan-tan-binh-hcm-20288',0),(67,'Massage Hoàng Châu','  424 Trường Chinh, P.13, Q. Tân Bình','11:00','03:00',NULL,'0888.882.663','Đến với massage Hoàng Châu quý khách sẽ có được những phút giây thư giãn, giảm stress với đội ngũ KTV có tay nghề kỹ thuật bài bản',NULL,NULL,NULL,'10.8163966','106.6321148',1,100,NULL,NULL,NULL,'2018-06-24 17:32:18','2018-06-24 17:32:18','1517728331125_9f7e205f-a649-449a-a1a9-b5cbb4a88db9.jpg','massage-hoang-chau-424-truong-chinh-p-13-q-tan-binh-20296',0),(68,'Eva Massage Nguyễn Khang','95 Nguyễn Khang - Cầu Giấy - Hà Nội','9:00','23:00',NULL,'0973843315','Eva Massage tọa lạc trên con đường Nguyễn Khang, một con đường dành cho các dân chơi. Eva massage có giá cả vô cùng hợp lý, cơ sở vật chất đẹp, sạch sẽ, nhân viên được tuyển chọn kỹ lưỡng, chỉ tuyển những em gái trẻ đẹp, ngoan ngoãn và nhiệt tình với công việc. Đảm bảo sẽ là một điểm đến quen thuộc cho những anh em đã từng qua lại',NULL,NULL,NULL,'21.018877999999994','105.801414',1,100,NULL,NULL,NULL,'2018-06-24 17:32:21','2018-06-24 17:32:21','1517149206117_842bb994-5674-463a-84be-4f7be9b384db.jpg','eva-massage-nguyen-khang-95-nguyen-khang-cau-giay-ha-noi-19526',0),(69,'Massage Nine Linh Đàm','KĐT Tây Nam Linh Đàm - Hoàng Mai - Hà Nội','9:00','23:00',NULL,'01242282222','Massage Nine là một cơ sở massage mới nằm tại khu đô thị mới Tây Nam Linh Đàm. Có cơ sở vật chất mới cực đep, sang trọng, sạch sẽ và dàn nhân viên được đầu tư mạnh, có nhan sắc, ngoại hình và trình độ chuyên môn cao, nhất định sẽ không phụ lòng của quý khách đã ghé thăm',NULL,NULL,NULL,'20.9628948','105.8238927',1,100,NULL,NULL,NULL,'2018-06-24 17:32:24','2018-06-24 17:32:24','1517219621082_92b1e60e-4c69-46a3-8867-e9c042d0726c.jpg','massage-nine-linh-dam-kdt-tay-nam-linh-dam-hoang-mai-ha-noi-19562',0),(70,'Geisha Massage Hà Đông','số 2 ngõ 2 Nguyễn Văn Lộc - Hà Đông - Hà Nội','10:00','0:00',NULL,'0868343636','Geisha Massage Hà Đông là một cơ sở trong chuỗi massage nổi tiếng Geisha Massage. Với cơ sở vật chất lịch sự, sạch sẽ, sang trọng, trang trí độc đáo, đẹp mắt cùng đội ngũ nhân viên xinh đẹp, trẻ trung, được đào tạo bài bản về dịch vụ, tay nghề, cực kỳ chiều khách thì Geisha Hà Đông luôn luôn là một điểm đến quen thuộc của anh em đam mê bộ môn này',NULL,NULL,NULL,'20.9857135','105.7830621',1,100,NULL,NULL,NULL,'2018-06-24 17:32:29','2018-06-24 17:32:29','1517390265466_9dc661de-583e-4bae-9df5-4fbf307b7504.jpg','geisha-massage-ha-dong-so-2-ngo-2-nguyen-van-loc-ha-dong-ha-noi-19739',0),(71,'Vân Anh Club Massage','159 Trần Hưng Đạo','10:00','23:30',NULL,'0993333513','Vân Anh Club được đầu tư bài bản về cơ sở vật chất cũng như nhân viên phục vụ. Vân Anh Club massage là địa điểm lý tưởng cho các quý ông, tại đây các quý ông sẽ được hưởng thụ những nét tinh túy nhất của nghệ thuật massage Thai mà không phải tốn nhiều thời gian và chi phí.',NULL,NULL,NULL,'16.079326599999998','108.2290206',1,100,NULL,NULL,NULL,'2018-06-24 17:32:40','2018-06-24 17:32:40','1517558829029_e4728164-ab3c-4cf5-83e2-1ce35a93e19a.jpg','van-anh-club-massage-159-tran-hung-dao-20242',0),(72,'Vip Ngôi Sao Massage','N8 A6 Nguyễn Thị Thập - Cầu Giấy - Hà Nội','9:00','23:30',NULL,'0962438888','Vip Ngôi Sao Massage là địa chỉ tin cậy cho đấng mày râu tìm kiếm sự thư giãn và thoải mái sau những phút giây căng thẳng của cuộc sống và công việc, với đội ngũ nhân viên trẻ trung xinh đẹp , lịch sự nhiệt tình có chuyên môn cao về mát xa ',NULL,NULL,NULL,'21.007883000000003','105.8039029',1,100,NULL,NULL,NULL,'2018-06-24 17:32:42','2018-06-24 17:32:42','1516972530483_f7003987-e3b9-48c1-aecd-d36558f10fad.jpg','vip-ngoi-sao-massage-n8-a6-nguyen-thi-thap-cau-giay-ha-noi-19421',0),(73,'Massage 152','152 Trần Quang Khải, Tân Định, Quận 1, Hồ Chí Minh','09:00','02:00',NULL,'090 999 23 63','Massage 152 Thiên Đường Ngay Trung Tâm Của Thành Phố Hoa Lệ Sẽ MANG LẠI CHO QUÝ KHÁCH NHỮNG GIÂY PHÚT KHOÁI CẢM',NULL,NULL,NULL,'10.7918996','106.6914036',1,100,NULL,NULL,NULL,'2018-06-24 17:32:46','2018-06-24 17:32:46','1517673587041_3d248060-78c2-4741-ba06-26d3318c7b4b.jpg','massage-152-152-tran-quang-khai-tan-dinh-quan-1-ho-chi-minh-20289',0),(74,'Geisha Massage Trung Yên 3','20 Trung Yên 3 - Cầu Giấy - Hà Nội','10:00','0:00',NULL,'0911999997','Geisha Massage Trung Yên là một cơ cở trong chuỗi massage nổi tiếng Geisha Massage. Với CSVC sạch sẽ, lịch sử, đầy đủ tiện nghi cùng với đội ngũ nhân viên trẻ trung, xinh đẹp, kỹ năng, kỹ thuật cao, nhiệt tình, chiều khách, Geisha Massage Trung Yên luôn luôn giữ vững phong độ của mình và đem đến những dịch vụ tuyệt vời nhất cho khách hàng',NULL,NULL,NULL,'21.0160773','105.8010529',1,100,NULL,NULL,NULL,'2018-06-24 17:32:49','2018-06-24 17:32:49','1517388810555_71c2e936-a11b-4327-91c7-49c31bce8dd3.jpg','geisha-massage-trung-yen-3-20-trung-yen-3-cau-giay-ha-noi-19737',0),(75,'Massage Tân Thủ Đô 2','97A Nguyễn Duy Dương, P9, Quận 5','14:00','03:00',NULL,'0838354056','ới quyết tâm mang đến cho các khách hàng thân thương những giây phút thư giãn tuyệt vời nhất, Massage Tân Thủ Đô 2 luôn cố gắng hoàn thiện, chăm chút từng chi tiết nhỏ; từ cơ sở vật chất đến chất lượng dịch vụ nhằm mang đến các khách hàng thân yêu sự hài lòng nhất. Đội ngũ KTV trẻ trung, dễ thương và nồng nhiệt, được đào tạo bài bản, luôn chăm sóc chu đáo nhiệt tình, sẽ mang đến Quý khách những giây phút thư giãn thật thoải mái với những khoảnh khắc thăng hoa tuyệt vời nhất',NULL,NULL,NULL,'10.7594128','106.6710669',1,100,NULL,NULL,NULL,'2018-06-24 17:32:53','2018-06-24 17:32:53','1517546933822_3b26eb6a-8239-4f09-9cdf-3f07cd936389.jpg','massage-tan-thu-do-2-97a-nguyen-duy-duong-p9-quan-5-19984',0),(76,'X Spa Nguyễn Khang','28 Nguyễn Khang - Cầu Giấy - Hà Nội','9:00','0:00',NULL,'0981888522','X Spa - Massage dành cho phái mạnh. Là một cơ sở massage có cơ sở vật chất sang trọng, lịch sự kết hợp với hệ thống karaoke hiện đại, hứa hẹn mang đến cho quý khách một loại hình massage mới mẻ, thú vị. X spa có dàn nhân viên đẹp và cực kỳ ngoan, chiều khách, tận tụy với nghề',NULL,NULL,NULL,'21.029672','105.80052099999999',1,100,NULL,NULL,NULL,'2018-06-24 17:32:57','2018-06-24 17:32:57','1517131815862_bbb15cd6-d52b-495a-b757-a512dc450863.jpg','x-spa-nguyen-khang-28-nguyen-khang-cau-giay-ha-noi-19513',0),(77,'Massage Sweetlady Cầu Giấy','8 Trần Thái Tông - Cầu Giấy - Hà Nội','10:00','0:00',NULL,'0965921134','Massage Sweetlady là phiên bản nâng cấp, hoàn chỉnh hơn của GS HTK. Với cơ sở vật chất được trùng tu, sang trọng, lịch sự, đầy đủ tiện nghi cùng dàn nhân viên được tuyển chọn, đào tạo kỹ lưỡng, xinh đẹp, trẻ trung, ngoan ngoãn, chiều khách, cam đoan sẽ không làm quý khách thất vọng khi sử dụng dịch vụ tại đây',NULL,NULL,NULL,'21.035954200000003','105.78925629999999',1,100,NULL,NULL,NULL,'2018-06-24 17:33:01','2018-06-24 17:33:01','1517393662921_7feae0ac-50d2-4bca-a8ca-a901b99929b3.jpg','massage-sweetlady-cau-giay-8-tran-thai-tong-cau-giay-ha-noi-19741',0),(78,'Massage Hoa Mai','723 Lê Hồng Phong - Quận 10 - Tp.HCM','10:00','0:00',NULL,'02838624669','Massage Hoa Mai là một địa điểm massage nằm gần trung tâm thành phố nhưng lại cực kỳ yên tĩnh, riêng tư. Đến đây, quý khách sẽ được trải nghiệm những dịch vụ cực kỳ thú vị bởi các kỹ thuật viên cực kỳ xinh đẹp, nhiệt tình, tay nghề cao trong một cơ sở vật chất sang trọng, lịch sự. Chắc chắn quý khách hài lòng với Massage Hoa Mai',NULL,NULL,NULL,'10.7740111','106.67174639999999',1,100,NULL,NULL,NULL,'2018-06-24 17:33:06','2018-06-24 17:33:06','1517497542814_737535f7-767b-4786-8c1a-5621b69e2608.jpg','massage-hoa-mai-723-le-hong-phong-quan-10-tp-hcm-19822',0),(79,'Massage Đào Nguyên','159 Hoàng Văn Thụ, 8, Phú Nhuận, Hồ Chí Minh','09:00','01:00',NULL,'0283 8423 596','Với đội ngũ nhân viên có kinh nghiệm và cực kì trẻ trung năng động cửa hàng sẽ làm hài lòng những quý ông khó tính nhất',NULL,NULL,NULL,'10.8002712','106.6669107',1,100,NULL,NULL,NULL,'2018-06-24 17:33:10','2018-06-24 17:33:10','1517732419091_4e62e4f3-2800-4c43-ad18-843bf92a4a9e.jpg','massage-dao-nguyen-159-hoang-van-thu-8-phu-nhuan-ho-chi-minh-20299',0),(80,'Massage Sài Gòn 168','số 2 ngõ 91 Trần Duy Hưng - Cầu Giấy - Hà Nội','9:00','23:00',NULL,'02462973239','Massage Sài Gòn 168 nằm trên con đường ăn chơi nổi tiếng Trần Duy Hưng, là một địa điểm massage tập trung cao vào chuyên môn với cơ sở vật chất đẹp mắt, lịch sự cùng đội ngũ nhân viên giàu kinh nghiệm, tay nghề cao. Phù hợp với khách hàng có nhu cầu massage thư giãn đầu óc sau những ngày làm việc căng thẳng.',NULL,NULL,NULL,'21.0118014','105.8006877',1,100,NULL,NULL,NULL,'2018-06-24 17:33:13','2018-06-24 17:33:13','1517141784538_29022124-a738-45b9-b3ba-da9ef16e1246.jpg','massage-sai-gon-168-so-2-ngo-91-tran-duy-hung-cau-giay-ha-noi-19519',0),(81,'Nga My Massage','1238 Trường Sa, phường 14, q.Phú Nhuận, tp HCM','12:00','03:00',NULL,'0888696866','Nga My là tiệm mát xa chuyên nghiệp chuyên phục vụ các quý ông mạnh mẽ sau những giờ làm việc căng thẳng. Với trang thiết bị tiên tiến và đôi ngũ phục vụ trẻ trung năng động nhiệt tình đảm bảo sẽ cho các quý ông khó tính nhất cũng phải hài lòng với những phút giây sung sướng tuyệt vời',NULL,NULL,NULL,'10.7904678474472','106.6670829',1,100,NULL,NULL,NULL,'2018-06-24 17:33:17','2018-06-24 17:33:17','1517419889043_5895270f-392c-4298-93ec-1369557b68c4.jpg','nga-my-massage-1238-truong-sa-phuong-14-q-phu-nhuan-tp-hcm-19754',0),(82,'Vip Massage Suka','số 2 ngõ 102 Ngụy Như Kom Tum - Thanh Xuân - Hà Nội','9:00','23:30',NULL,'0962438888','Vip Massage Suka với đội ngũ nhân viên giàu kinh nghiệm và cực kì xinh đẹp và khéo léo sẽ mang lại những trải nghiệm thú vị cho các anh chàng mạnh mẽ và sự khoan khoái hạnh phúc cho các khách hàng sau những giờ làm việc dài căng thẳng mệt nhọc',NULL,NULL,NULL,'21.000442599999996','105.80286339999999',1,100,NULL,NULL,NULL,'2018-06-24 17:33:20','2018-06-24 17:33:20','1516967388255_b50d0e59-e832-4321-9a80-07589d530e5e.jpg','vip-massage-suka-so-2-ngo-102-nguy-nhu-kom-tum-thanh-xuan-ha-noi-19420',0),(83,'Minosa Massage Linh Lang','27 Linh Lang - Ba Đình - Hà Nội','9:00','23:30',NULL,'0939866468','Minosa Massage Linh Lang là một điểm massage mới lạ dành cho anh em đam mê massage. Minosa có sơ sở vật chất tốt, sạch sẽ, lịch sự, nằm ở vị trí yên tĩnh, vắng vẻ nên phù hợp với các anh em muốn được thư giãn sau những ngày làm việc mệt mỏi. Đội ngũ nhân viên của Minosa có ngoại hình đẹp, nhiệt tình, kỹ năng tốt, tập trung vào thư giãn phù hợp với các quý ông có nhu cầu cao và tìm kiếm sự sung sướng',NULL,NULL,NULL,'21.0358898','105.8106086',1,100,NULL,NULL,NULL,'2018-06-24 17:33:32','2018-06-24 17:33:32','1517112297269_d08e38b4-b2c2-40f1-9e57-6b2225a61563.jpg','minosa-massage-linh-lang-27-linh-lang-ba-dinh-ha-noi-19497',0),(84,'Massage Ngọc Ánh','23-25 Chợ Lớn - Quận 6 - Tp.HCM','10:00','23:00',NULL,'0837554205','Massage Ngọc Ánh tọa lạc trên con đường Chợ Lớn - Quận 6. Hệ thống cơ sở vật chất, phòng ốc được thiết kế theo phong cách hiện đại nhưng không kém phần lãng mạn cùng đội ngũ nhân viên xinh đẹp, nhiệt tình, chu đáo, tay nghề cao, chắc chắn sẽ đáp ứng được mọi nhu cầu của quý khách',NULL,NULL,NULL,'10.746199899999999','106.63369770000001',1,100,NULL,NULL,NULL,'2018-06-24 17:33:38','2018-06-24 17:33:38','1517489048949_000d46ce-25a6-4c6b-8dce-a565823547ab.jpg','massage-ngoc-anh-23-25-cho-lon-quan-6-tp-hcm-19815',0),(85,'Massage Hải Sơn','88 Lê Lai, Bến Thành, Quận 1, Hồ Chí Minh','09:00','00:00',NULL,'0283 8330 170','Massage Hải Sơn đạt tiêu chuẩn khách sạn 2 sao, khi đến với Massage Hải Sơn bạn sẽ cảm nhận được một không gian riêng thật ấm áp được kết hợp hài hòa tinh tế với sự tiện nghi và sang trọng. Với phương châm uy tín-chất lượng dịch vụ là cội nguồn cho sự trường tồn, Massage Hải Sơn luôn không ngừng đem đến cho bạn những dịch vụ tốt nhất và hài lòng nhất.  ',NULL,NULL,NULL,'10.7698839','106.6933484',1,100,NULL,NULL,NULL,'2018-06-24 17:33:41','2018-06-24 17:33:41','1517675288107_ec61edfd-d74f-4e8e-a634-724e3f2d982d.jpg','massage-hai-son-88-le-lai-ben-thanh-quan-1-ho-chi-minh-20291',0),(86,'Massage Phước Lộc Thọ 1','172-174 Sư Vạn Hạnh - Quận t - Tp.HCM','0:00','12:00',NULL,'0838351988','Phước Lộc Thọ Massage nằm trong tổ hợp nhà hàng, khách sạn Phước Lộc Thọ. Phước Lộc Thọ Massage có thiết kế giản dị, sạch sẽ, đầy đủ tiện nghi, có mùi hương dịu nhẹ, quyến rũ từ chính các kỹ thuật viên yêu nghề, tâm huyết, chuyên môn cao, xinh đẹp, sẽ làm quý khách có những phút giây thật hạnh phúc trong cuộc đời',NULL,NULL,NULL,'10.772232899999997','106.6716284',1,100,NULL,NULL,NULL,'2018-06-24 17:33:45','2018-06-24 17:33:45','1517456017670_af9838d6-dce3-4397-ba66-3b455b75f1c6.jpg','massage-phuoc-loc-tho-1-172-174-su-van-hanh-quan-t-tp-hcm-19760',0),(87,'Oasis massage','62 Tôn Thất Tùng ','10:00','23:00',NULL,'chưa có ','sauna massage',NULL,NULL,NULL,'21.001762','105.8294666',1,100,NULL,NULL,NULL,'2018-06-24 17:33:49','2018-06-24 17:33:49','1509282189009_246e3777-f29d-484d-9bb4-99d6a853854a.jpg','oasis-massage-62-ton-that-tung-8900',0),(88,'Massage P.A Relax','383 Sư Vạn Hạnh nối dài, P.12, Q.10','09:00','03:00',NULL,'0938.191.226','Miễn phí mì trứng, nước suối ( sắp tới sẽ có thêm nước sâm, cafe, đá chanh, trái cây...để phục vụ ạ )',NULL,NULL,NULL,'10.768135','106.6714678',1,100,NULL,NULL,NULL,'2018-06-24 17:33:51','2018-06-24 17:33:51','1517545901328_a37bda21-5023-43b2-b835-12eb344fb173.jpg','massage-p-a-relax-383-su-van-hanh-noi-dai-p-12-q-10-19982',0),(89,'Massage Hoàng Sa','54 56 Dương Đình Nghệ','12:00','23:30',NULL,'0942067777','Hệ thống massage hiện đại, chuyên nghiệp mang tới cho du khách giây phút thư giãn tuyệt vời. Massage of khách sạn Hoàng Sa có 11 phòng VIP for dịch vụ Steambath – Jacuzzi – Massage phục vụ khép kín riêng biệt, 7 phòng thường dịch vụ Sauna – Steambath – Jacuzzi tại phòng chung lớn.',NULL,NULL,NULL,'16.068728800000002','108.2383583',1,100,NULL,NULL,NULL,'2018-06-24 17:33:54','2018-06-24 17:33:54','1517207648410_abafb0e0-a8ae-444f-ba6a-17e6f9865f79.jpg','massage-hoang-sa-54-56-duong-dinh-nghe-19536',0),(90,'Massage New Hanoi Trần Duy Hưng','57 Trần Duy Hưng - Cầu Giấy - Hà Nội','9:00','0:00',NULL,'0435560879','Massage New Hanoi nằm trên con phố sầm uất Trần Duy Hưng, là một điểm đến quen thuộc của các anh em đam mê massage. Massage New Hanoi có cơ sở vật chất lịch sự, sang trọng, sạch sẽ, nhân viên được tuyển chọn kỹ lưỡng, có từ đáng yêu đến gợi cảm, từ nam ra bắc, cam đoán sẽ phục vụ mọi nhu cầu, sở thích của quý khách hàng',NULL,NULL,NULL,'21.0119817','105.80142049999999',1,100,NULL,NULL,NULL,'2018-06-24 17:33:57','2018-06-24 17:33:57','1517217885909_bdfb516c-0d3e-4f7e-8d02-1386804d2163.jpg','massage-new-hanoi-tran-duy-hung-57-tran-duy-hung-cau-giay-ha-noi-19561',0),(91,'Massage 337 Trần Khát Chân','337 Trần Khát Chân - Hai Bà Trưng - Hà Nội','9:00','23:00',NULL,'0439724377','Massage 337 Trần Khát Chân có phòng ốc đẹp, sạch sẽ và thiết bị hiện đại. Với nhiều mức giá và những em nhân viên yêu nghề, non trẻ và kỹ thuật chuyên môn cao, nhất định sẽ giúp cho quý khách cảm thấy thực sự thoải mái, đặc biệt là kỹ năng massage HJ',NULL,NULL,NULL,'21.01003','105.857688',1,100,NULL,NULL,NULL,'2018-06-24 17:34:00','2018-06-24 17:34:00','1517139143702_d56d3497-54a9-4afa-a981-b3e21aad10ea.jpg','massage-337-tran-khat-chan-337-tran-khat-chan-hai-ba-trung-ha-noi-19518',0),(92,'Windy Massage Kim Ngưu','265 Kim Ngưu - Hai Bà Trưng - Hà Nội','9:00','23:30',NULL,'0965298998','Windy Massage Kim Ngưu là một trong những chi nhánh hàng đầu của hệ thống Windy về sự chuyên nghiệp. Cơ sở vật chất đẹp, đặc biệt đó là dàn nhân viên mơn mởn được đào tạo bài bản, kỹ thuật tốt, cực kỳ ngoan ngoãn, nhiệt tình và cực chiều các quý ông. Nếu tìm kiếm sự sung sướng thì Windy Kim Ngưu là một điểm đến không thể nào bỏ qua',NULL,NULL,NULL,'20.998608200000003','105.8621739',1,100,NULL,NULL,NULL,'2018-06-24 17:34:03','2018-06-24 17:34:03','1517108751493_ffe599e1-456b-415a-a0bf-946aeb487ff5.jpg','windy-massage-kim-nguu-265-kim-nguu-hai-ba-trung-ha-noi-19485',0),(93,'Massage Thuý Hường',' 175 Lương Đình Của, Quận 2, Hồ chí Minh.','10:00','03:00',NULL,'0888696866','Kỹ Thuật Viên mang nhiều sắc vóc, “ kỹ năng thượng thừa” nhiều kinh nghiệm sẽ giúp cho anh em một cảm xúc thăng hoa khi thư giãn cùng với KTV.',NULL,NULL,NULL,'10.7909971','106.745401',1,100,NULL,NULL,NULL,'2018-06-24 17:34:08','2018-06-24 17:34:08','1517592801373_82a11803-d1a7-4574-a123-16c8d3e67c80.jpg','massage-thuy-huong-175-luong-dinh-cua-quan-2-ho-chi-minh-20257',0),(94,'Mai Spa Nguyễn Khánh Toàn','số 47 ngõ 5 Nguyễn Khánh Toàn - Cầu Giấy - Hà Nội','9:00','23:00',NULL,'0438398170','Mai Spa là một địa chỉ massage lâu đời tại thủ đô Hà Nội trên con đường ăn chơi Nguyễn Khánh Toàn. Luôn luôn lắng nghe quý khách và nâng cao cơ sở vật chất đẹp, có phong cách cũng như đội ngũ nhân viên ngoan ngoãn, nhiệt tình bậc nhất Hà Thành. Cam kết sẽ đem đến sự thư giãn và sung sướng tột cùng cho đấng mày râu',NULL,NULL,NULL,'21.035043400000003','105.8039932',1,100,NULL,NULL,NULL,'2018-06-24 17:34:11','2018-06-24 17:34:11','1517106969146_ac2cbc1f-fbb1-43f5-82b8-8f367614d525.jpg','mai-spa-nguyen-khanh-toan-so-47-ngo-5-nguyen-khanh-toan-cau-giay-ha-noi-19483',0),(95,'Massage Green Club','34a ngõ 120 Trường Chinh - Đống Đa - Hà Nội','9:00','23:30',NULL,'0435765840','Massage Green Club là một điểm massage có tiếng trong khu vực quận Đống Đa. Với nhiều năm trong lĩnh vực massage, luôn luôn lắng nghe tâm tư, phản ánh của khách hàng, Massage Green luôn luôn cố gắng nâng cấp CSVC sạch sẽ, lịch sự, đầy đủ tiện nghi cùng với việc đào tạo, tuyển chọn kỹ thuật viên xinh đẹp, yêu nghề, ngoan ngoãn và kỹ thuật tốt để có thể phục vụ anh em một các tốt nhất',NULL,NULL,NULL,'20.999130900000004','105.836061',1,100,NULL,NULL,NULL,'2018-06-24 17:34:14','2018-06-24 17:34:14','1517362271513_f5f79623-4c72-4ea9-8c69-67895384f077.jpg','massage-green-club-34a-ngo-120-truong-chinh-dong-da-ha-noi-19578',0),(96,'Massage Hoa Xuân','5A ngõ 148 Trần Duy Hưng - Cầu Giấy - Hà Nội','10:00','0:00',NULL,'0976180000','Massage Hoa Xuân nằm trong một con ngõ nhỏ tại khu phố nổi tiếng Trần Duy Hưng. Có chỗ để xe máy, xe ô tô, cực kỳ riêng tư. Hoa Xuân có CSVC sạch đẹp, lịch sự, có mùi thơm nhẹ nhàng, quyến rũ cùng dàn nhân viên trẻ đẹp, gợi cảm, cực kỳ chiều chuộng khách hàng nhất định sẽ để lại những ấn tượng không thể nào quên',NULL,NULL,NULL,'21.009444199999997','105.7979218',1,100,NULL,NULL,NULL,'2018-06-24 17:34:18','2018-06-24 17:34:18','1517362825196_3bf0a09d-bfd6-4f8c-b096-7141e4f3800f.jpg','massage-hoa-xuan-5a-ngo-148-tran-duy-hung-cau-giay-ha-noi-19579',0),(97,'Massage Hòn Én','138B Lê Lợi, Quận Gò Vấp, TP. HCM','10:00','02:00',NULL,'08 3994 1343','Đến với Hòn Én để tận hưởng những phút giây thư giãn sau những giờ làm việc căng thẳng',NULL,NULL,NULL,'10.817631','106.685395',1,100,NULL,NULL,NULL,'2018-06-24 17:34:21','2018-06-24 17:34:21','1517729749686_7cb75383-09ef-412c-8936-11253fc7392b.jpg','massage-hon-en-138b-le-loi-quan-go-vap-tp-hcm-20297',0),(98,'TLT Men Spa Emperor','ngõ 118 Nguyễn Khánh Toàn - Cầu Giấy - Hà Nội','9:30','0:00',NULL,'0422664455','TLT Men Spa Emperor nằm trong hệ thống Men Spa nổi tiếng. TLT có hệ thống cơ sở vật chất massage đầy đủ tiện nghi, sạch sẽ, sang trọng nhưng không kém phần ấm cúng. TLT còn có đội ngũ quản lý và kỹ thuật viên được tuyển chọn kỹ lưỡng, có kinh nghiệm và đạo đức nghề nghiệp, biết chiều lòng quý khách chắc chắn sẽ khiến đấng mày râu muốn 1 đi không trở lại',NULL,NULL,NULL,'21.038028999999998','105.801273',1,100,NULL,NULL,NULL,'2018-06-24 17:34:25','2018-06-24 17:34:25','1517364186971_a60abc8c-2659-4d94-9992-b2789efff256.jpg','tlt-men-spa-emperor-ngo-118-nguyen-khanh-toan-cau-giay-ha-noi-19580',0),(99,'Massage Tân Trà','95 Trần Quốc Toản - Hoàn Kiếm - Hà Nội','9:00','23:30',NULL,'0964196666','Massage Tân Trà nằm gần trung tâm Hà Thành, là một địa điểm massage quen thuộc của khách trong nước và hấp dẫn khách nước ngoài. Massage Tân Trà có cơ sở vật chất lịch sự, sạch sẽ và ấm cúng. Với một mức giá thấp nhưng hợp lý và dàn nhân viên trẻ đẹp, tâm lý, hiểu và chiều ý khách, quý khách chắc chắn sẽ có được những giây phút cực kỳ thư giãn',NULL,NULL,NULL,'21.021183999999998','105.844369',1,100,NULL,NULL,NULL,'2018-06-24 17:34:28','2018-06-24 17:34:28','1517133256857_4394243c-1fb8-4335-b722-eb11d371824c.jpg','massage-tan-tra-95-tran-quoc-toan-hoan-kiem-ha-noi-19515',0);

/*Table structure for table `ad_massage_comment` */

DROP TABLE IF EXISTS `ad_massage_comment`;

CREATE TABLE `ad_massage_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `massage_id` bigint(20) DEFAULT NULL COMMENT 'Cơ sở',
  `comment` text COMMENT 'Nội dung comment',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_massage_comment` */

/*Table structure for table `ad_massage_image` */

DROP TABLE IF EXISTS `ad_massage_image`;

CREATE TABLE `ad_massage_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) NOT NULL COMMENT 'Đường dẫn file',
  `massage_id` bigint(20) DEFAULT NULL COMMENT 'Cơ sở',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;

/*Data for the table `ad_massage_image` */

insert  into `ad_massage_image`(`id`,`file_path`,`massage_id`,`priority`,`is_active`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'1517203422388_7c5965f3-4545-42a5-b2f3-b0e2f66b16a3.jpg',2,100,1,NULL,NULL,'2018-06-24 17:25:29','2018-06-24 17:25:29'),(2,'1517588599364_5f2667df-05a9-480a-95e5-b87b27916ccd.jpg',2,100,1,NULL,NULL,'2018-06-24 17:25:29','2018-06-24 17:25:29'),(3,'1517203372903_a5695244-b7e6-4e1d-a2fe-98cc2277fdf5.jpg',2,100,1,NULL,NULL,'2018-06-24 17:25:30','2018-06-24 17:25:30'),(4,'1524204665160_d41dad69-bb20-4787-89b2-249684c3f909.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:32','2018-06-24 17:25:32'),(5,'1524205362738_e8cca2e9-e91c-4f8f-b7ed-912545372db3.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:33','2018-06-24 17:25:33'),(6,'1524205084642_a7dec67f-35a0-42b3-a2e7-87189d1e41a3.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:33','2018-06-24 17:25:33'),(7,'1524205497575_0e8d828e-2fe4-489b-89f9-7be54e5a6b96.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:34','2018-06-24 17:25:34'),(8,'1524205795418_ff17a510-5ecd-4055-9026-bb9afb0b9c70.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:34','2018-06-24 17:25:34'),(9,'1524206361515_460cef55-863b-4843-a72a-cd0882962249.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:35','2018-06-24 17:25:35'),(10,'1524206533116_d027353a-4fa1-4a6f-b412-9469db9406bc.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:36','2018-06-24 17:25:36'),(11,'1524206711581_07279c35-282a-4a26-99ed-0dad4da09e25.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:37','2018-06-24 17:25:37'),(12,'1524199194487_138b04b4-ee21-45f2-80a5-c7bfedd23c02.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:38','2018-06-24 17:25:38'),(13,'1524199345543_003d13b3-c2a5-4ed2-8712-9dab22ac2a53.jpg',3,100,1,NULL,NULL,'2018-06-24 17:25:39','2018-06-24 17:25:39'),(14,'1517204690848_dd1d0e2b-958d-4864-9981-2fae15940922.jpg',4,100,1,NULL,NULL,'2018-06-24 17:25:41','2018-06-24 17:25:41'),(15,'1517204599541_197a09c6-fd67-4fe7-8030-d60260b80c29.jpg',4,100,1,NULL,NULL,'2018-06-24 17:25:42','2018-06-24 17:25:42'),(16,'1517204652328_674f237e-ce4e-4ae2-a1a8-4ee1b10a9347.jpg',4,100,1,NULL,NULL,'2018-06-24 17:25:42','2018-06-24 17:25:42'),(17,'1526029015977_7640e507-0bd0-41f4-9571-f58f74fc77a1.jpg',5,100,1,NULL,NULL,'2018-06-24 17:25:45','2018-06-24 17:25:45'),(18,'1526029031468_8ef14629-d82f-4daf-9aef-129bbe66274e.jpg',5,100,1,NULL,NULL,'2018-06-24 17:25:46','2018-06-24 17:25:46'),(19,'1526029045257_356896a6-59ab-49bc-9575-8c1aff3507de.jpg',5,100,1,NULL,NULL,'2018-06-24 17:25:47','2018-06-24 17:25:47'),(20,'1517490122257_5b6bbca3-3314-4729-ba3e-a43fd6e5345d.jpg',7,100,1,NULL,NULL,'2018-06-24 17:25:51','2018-06-24 17:25:51'),(21,'1517490289731_1be0a3ef-82ea-4b98-8ea7-380bc2137471.jpg',7,100,1,NULL,NULL,'2018-06-24 17:25:52','2018-06-24 17:25:52'),(22,'1517490390036_851bbae0-4867-4b8e-983d-72d31ae88bc7.jpg',7,100,1,NULL,NULL,'2018-06-24 17:25:52','2018-06-24 17:25:52'),(23,'1517490042177_18108fa4-8515-4c13-964f-6b9f82f0e53d.jpg',7,100,1,NULL,NULL,'2018-06-24 17:25:53','2018-06-24 17:25:53'),(24,'1517324644308_17a36f15-07b8-47b4-ab3e-6103e447f910.jpg',8,100,1,NULL,NULL,'2018-06-24 17:25:55','2018-06-24 17:25:55'),(25,'1517324567373_30096de1-97ee-4d60-bbe4-657fab964528.jpg',8,100,1,NULL,NULL,'2018-06-24 17:25:56','2018-06-24 17:25:56'),(26,'1517324723829_cbf550fb-8f38-4e06-933c-e5b471ddaa83.jpg',8,100,1,NULL,NULL,'2018-06-24 17:25:57','2018-06-24 17:25:57'),(27,'1517221304166_e7e911d7-85ec-40e7-bcf9-806c52603d99.jpg',9,100,1,NULL,NULL,'2018-06-24 17:25:59','2018-06-24 17:25:59'),(28,'1517221327138_246dcad5-f4a5-4fa1-aceb-fd059bdb2ded.jpg',9,100,1,NULL,NULL,'2018-06-24 17:26:00','2018-06-24 17:26:00'),(29,'1517221353363_ab08a6a0-35b3-423f-bb2b-b913a9e3883d.jpg',9,100,1,NULL,NULL,'2018-06-24 17:26:00','2018-06-24 17:26:00'),(30,'1517494722891_0fbff007-2047-4fa5-b2f1-0cf0eae687cc.jpg',10,100,1,NULL,NULL,'2018-06-24 17:26:03','2018-06-24 17:26:03'),(31,'1517494824131_24dcd8a3-7015-4a72-b58a-00da7d1eeabd.jpg',10,100,1,NULL,NULL,'2018-06-24 17:26:04','2018-06-24 17:26:04'),(32,'1517494690708_2adab33b-96e0-4a96-84a6-ee2d9a74ea4d.jpg',10,100,1,NULL,NULL,'2018-06-24 17:26:05','2018-06-24 17:26:05'),(33,'1517592139518_06f29e6f-f277-4f93-a5bb-c811514b8909.jpg',11,100,1,NULL,NULL,'2018-06-24 17:26:08','2018-06-24 17:26:08'),(34,'1517592153689_07a0fcdf-33c8-4e63-877a-889ee507ed67.jpg',11,100,1,NULL,NULL,'2018-06-24 17:26:08','2018-06-24 17:26:08'),(35,'1517592063167_753c0d2e-bc84-46dc-a1f3-ea6a88f60385.jpg',11,100,1,NULL,NULL,'2018-06-24 17:26:09','2018-06-24 17:26:09'),(36,'1526028260692_62cdf5c3-c404-4fa2-98ca-3beed03657c1.jpg',12,100,1,NULL,NULL,'2018-06-24 17:28:04','2018-06-24 17:28:04'),(37,'1526028186190_90011e3b-266c-4e10-9807-755cf225e8df.jpg',12,100,1,NULL,NULL,'2018-06-24 17:28:05','2018-06-24 17:28:05'),(38,'1526028408971_77bc8d89-9139-4708-8683-6d09b8bb42be.jpg',12,100,1,NULL,NULL,'2018-06-24 17:28:06','2018-06-24 17:28:06'),(39,'1524212054429_fcbe6c1a-d465-4427-8026-d3e29120cd8b.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:08','2018-06-24 17:28:08'),(40,'1524212249068_282179f7-eac0-4364-835a-85153a7f0f64.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:09','2018-06-24 17:28:09'),(41,'1524212764876_26a100ff-d6b3-400f-a17d-afd7ec2304c6.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:10','2018-06-24 17:28:10'),(42,'1524212986708_fa41036a-8fd4-4cc0-898d-2fe72adfc96f.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:12','2018-06-24 17:28:12'),(43,'1524213263584_8af1f4e3-113d-4440-94ea-c11a2bb038b1.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:13','2018-06-24 17:28:13'),(44,'1524213397755_1a02c92d-6c25-4634-9234-5e01a72b0390.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:14','2018-06-24 17:28:14'),(45,'1524213754565_6d988634-8a09-469e-bd15-25f51c1bca37.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:15','2018-06-24 17:28:15'),(46,'1524213921371_d5c62215-9f1d-4d6b-ada3-38de861bc8c4.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:16','2018-06-24 17:28:16'),(47,'1524211074174_ea0ea9f1-a8a9-4f75-b7f5-2755ce654907.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:17','2018-06-24 17:28:17'),(48,'1524211168745_9fc027ee-fc52-4952-a915-0cc3789205aa.jpg',13,100,1,NULL,NULL,'2018-06-24 17:28:18','2018-06-24 17:28:18'),(49,'1526027645821_d3058d46-cefc-4b26-8c7f-b357ea5d071c.jpg',14,100,1,NULL,NULL,'2018-06-24 17:28:20','2018-06-24 17:28:20'),(50,'1526027386969_29c6e0d1-2781-4fa0-8f77-5bc6f52d30be.jpg',14,100,1,NULL,NULL,'2018-06-24 17:28:21','2018-06-24 17:28:21'),(51,'1526027579681_b4dd3b4c-c51b-4b6a-856c-06b168c57cb2.jpg',14,100,1,NULL,NULL,'2018-06-24 17:28:23','2018-06-24 17:28:23'),(52,'1526027821313_8416aa63-18a3-42b9-bd35-bd1d441f0b9b.jpg',14,100,1,NULL,NULL,'2018-06-24 17:28:24','2018-06-24 17:28:24'),(53,'1524209400860_6287d731-db5e-4a37-a950-65afd8a7f1e8.jpg',15,100,1,NULL,NULL,'2018-06-24 17:28:27','2018-06-24 17:28:27'),(54,'1524209848926_2f7e7674-f0ae-4787-88d3-9bc7fecda475.jpg',15,100,1,NULL,NULL,'2018-06-24 17:28:27','2018-06-24 17:28:27'),(55,'1524209951690_2e9e00f3-92c9-4f1e-aca5-3ba481ac9e73.jpg',15,100,1,NULL,NULL,'2018-06-24 17:28:28','2018-06-24 17:28:28'),(56,'1524210090697_ebabf924-e294-43ea-b62a-be0705893161.jpg',15,100,1,NULL,NULL,'2018-06-24 17:28:29','2018-06-24 17:28:29'),(57,'1524208721458_b2680f30-ec4f-481c-9bd4-f9983936e93d.jpg',15,100,1,NULL,NULL,'2018-06-24 17:28:30','2018-06-24 17:28:30'),(58,'1524209681310_4ac928ff-d796-41eb-9667-73a2648f139b.jpg',15,100,1,NULL,NULL,'2018-06-24 17:28:31','2018-06-24 17:28:31'),(59,'1524208667926_a1ed0b14-377e-437a-a5b2-89a53bd13e21.jpg',15,100,1,NULL,NULL,'2018-06-24 17:28:32','2018-06-24 17:28:32'),(60,'1524208888156_ccafb300-b360-4b63-ae16-81cf2a7cc42d.jpg',15,100,1,NULL,NULL,'2018-06-24 17:28:33','2018-06-24 17:28:33'),(61,'1524209183174_e494bbf6-2e33-4705-8cbf-61da5b2c57fd.jpg',15,100,1,NULL,NULL,'2018-06-24 17:28:33','2018-06-24 17:28:33'),(62,'1524215030883_964bcd0a-0dc0-4ce0-acf2-eb5e446ec4a5.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:38','2018-06-24 17:28:38'),(63,'1524216274509_418e333a-994f-41f0-a1c3-52a2f45dd30a.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:39','2018-06-24 17:28:39'),(64,'1524216360423_461ada15-687a-4a25-89f9-203508bdf2b2.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:40','2018-06-24 17:28:40'),(65,'1524216669250_0c5ab4ba-f80b-48b2-a9f5-cf70aba39356.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:41','2018-06-24 17:28:41'),(66,'1524216995899_281774ee-391a-496c-ad95-1a246ac7ae10.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:42','2018-06-24 17:28:42'),(67,'1524218453143_21a9d671-712a-4325-8c78-736d634c98ad.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:43','2018-06-24 17:28:43'),(68,'1524218781754_cc62346d-dfe4-480c-a723-532d47dce7a6.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:45','2018-06-24 17:28:45'),(69,'1524219368886_b58b3444-9f9d-47c7-b435-7060c50dffcc.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:46','2018-06-24 17:28:46'),(70,'1524219718810_6c987ea3-7441-45f4-88c5-a6c8939aa46b.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:47','2018-06-24 17:28:47'),(71,'1524215308263_828236f9-77c1-4770-bd89-ee8124a9957d.jpg',17,100,1,NULL,NULL,'2018-06-24 17:28:48','2018-06-24 17:28:48'),(72,'1516973783415_8f339dd3-3cf6-4b2d-b71d-34ae4c299deb.jpg',18,100,1,NULL,NULL,'2018-06-24 17:28:50','2018-06-24 17:28:50'),(73,'1516973768585_1425ead7-14d5-4383-8ff5-1a184928f828.jpg',18,100,1,NULL,NULL,'2018-06-24 17:28:51','2018-06-24 17:28:51'),(74,'1516973618032_d115d75e-3bca-4729-a676-c878c124ca6c.jpg',18,100,1,NULL,NULL,'2018-06-24 17:28:52','2018-06-24 17:28:52'),(75,'1516973643458_44ebfd55-27b8-435b-95c5-2067c31ef565.jpg',18,100,1,NULL,NULL,'2018-06-24 17:28:52','2018-06-24 17:28:52'),(76,'1517123624757_b17e9a1a-1d3e-403d-b464-7a85415afb09.jpg',19,100,1,NULL,NULL,'2018-06-24 17:28:55','2018-06-24 17:28:55'),(77,'1517123601591_ff6c12c2-a2a0-4b5b-a389-3512d8a4d599.jpg',19,100,1,NULL,NULL,'2018-06-24 17:28:56','2018-06-24 17:28:56'),(78,'1517123646644_b12e0b7a-9d06-498c-80eb-9f7a0db373f9.jpg',19,100,1,NULL,NULL,'2018-06-24 17:28:57','2018-06-24 17:28:57'),(79,'1517123573807_7a2ee8ae-b512-4523-9204-5b5c1b8bf6bb.jpg',19,100,1,NULL,NULL,'2018-06-24 17:28:58','2018-06-24 17:28:58'),(80,'1506055056756_b5897a3e-b975-44fd-8500-4ae09415b98f.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:01','2018-06-24 17:29:01'),(81,'1506055056911_890ecbd1-89c2-41d9-a512-4252e04d3ac8.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:01','2018-06-24 17:29:01'),(82,'1506055056981_407863fa-b11f-4194-8925-c1611032f2b9.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:02','2018-06-24 17:29:02'),(83,'1506055057063_3651873a-0bcd-48d2-97da-63679d2992c6.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:02','2018-06-24 17:29:02'),(84,'1506055057215_e69e3592-ae74-4ef3-947e-08601bd221f8.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:03','2018-06-24 17:29:03'),(85,'1506055057397_ff62ef51-5e82-44bb-a742-38e6ce04f880.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:03','2018-06-24 17:29:03'),(86,'1506055057501_483c9fe0-9b68-4d2d-907d-35c09ce3e259.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:03','2018-06-24 17:29:03'),(87,'1506055056327_69d6d4dc-f4b0-4fb9-a6df-bc83e4316d65.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:04','2018-06-24 17:29:04'),(88,'1506055056462_70e48ff6-a316-4567-8ead-18d278be705d.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:04','2018-06-24 17:29:04'),(89,'1506055056581_55d500b6-fdc5-4b4c-b568-231fe61efa0c.jpg',21,100,1,NULL,NULL,'2018-06-24 17:29:05','2018-06-24 17:29:05'),(90,'1524126223824_20afca4f-b9c8-410a-bb6b-bfa2c911c9fa.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:07','2018-06-24 17:29:07'),(91,'1524122483260_7a30b23f-1a3b-4ac8-be5a-ced564b7f750.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:08','2018-06-24 17:29:08'),(92,'1524122813939_44f97db7-5add-4a52-89ea-53f436bf2514.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:08','2018-06-24 17:29:08'),(93,'1524123356602_4c8fa7a9-68a3-4d00-8273-04fe05259c0c.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:09','2018-06-24 17:29:09'),(94,'1524124174089_22fd9e34-dec3-4ada-a729-193371eb558b.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:10','2018-06-24 17:29:10'),(95,'1524124383177_6ecdc053-9f83-41e8-8616-50c6d4689b79.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:10','2018-06-24 17:29:10'),(96,'1524125017011_15dae365-f796-46d1-a851-3a8ae20b7b0d.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:11','2018-06-24 17:29:11'),(97,'1524125443120_991e2d8a-8710-4240-8fbd-79046392bf79.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:12','2018-06-24 17:29:12'),(98,'1524125689464_43e19141-3c4a-4e94-9c4e-4d02eef430d5.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:13','2018-06-24 17:29:13'),(99,'1524125912808_09772d24-eaa0-4f9d-8d86-1e7ebd645dc4.jpg',22,100,1,NULL,NULL,'2018-06-24 17:29:13','2018-06-24 17:29:13'),(100,'1517489663697_acf4f42f-8d06-4454-bad3-0ac56ad03a7e.jpg',24,100,1,NULL,NULL,'2018-06-24 17:29:33','2018-06-24 17:29:33'),(101,'1517489714606_5d887af5-352a-4f70-8403-1c228a9ff674.jpg',24,100,1,NULL,NULL,'2018-06-24 17:29:34','2018-06-24 17:29:34'),(102,'1517489641864_2e3406e6-fa9a-4d87-b647-bc90b4102c11.jpg',24,100,1,NULL,NULL,'2018-06-24 17:29:34','2018-06-24 17:29:34'),(103,'1517670217209_4e3db435-d0b7-4c53-ada0-0ed9599bea96.jpg',25,100,1,NULL,NULL,'2018-06-24 17:29:36','2018-06-24 17:29:36'),(104,'1517670330292_1f052a4c-89e4-44a7-8f25-4df1efd5db4c.jpg',25,100,1,NULL,NULL,'2018-06-24 17:29:37','2018-06-24 17:29:37'),(105,'1517670389267_8e8b5dc0-50b9-4cbe-bfe9-fa5b1d99aade.jpg',25,100,1,NULL,NULL,'2018-06-24 17:29:37','2018-06-24 17:29:37'),(106,'1517670154903_67b3322b-58f2-4ee6-b7e3-cf4745bb9485.jpg',25,100,1,NULL,NULL,'2018-06-24 17:29:38','2018-06-24 17:29:38'),(107,'1524118308726_1b56e17c-b16a-493d-8f02-f371abaa05e8.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:40','2018-06-24 17:29:40'),(108,'1524118484101_4d612b32-0cf5-4951-ae57-35ce4f3e87f2.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:43','2018-06-24 17:29:43'),(109,'1524118775286_4f08e278-fef5-424a-b63c-565e6d43ba57.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:45','2018-06-24 17:29:45'),(110,'1506055301443_4816270a-d33b-47b7-aa35-52886a3fced7.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:45','2018-06-24 17:29:45'),(111,'1506055301834_fe93f40d-faca-4d0c-a08c-464a9d05baf0.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:46','2018-06-24 17:29:46'),(112,'1506055302114_ad661f72-76e3-45da-a45a-7482de504de5.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:46','2018-06-24 17:29:46'),(113,'1506055302362_99fb3d30-3ec9-4896-83b1-bf111a009144.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:47','2018-06-24 17:29:47'),(114,'1524112767007_1ce85301-8dd1-4461-a520-c2c5fbd76fb6.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:48','2018-06-24 17:29:48'),(115,'1524115973560_64d0739b-19bc-4c93-93cd-965d48f09d6b.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:49','2018-06-24 17:29:49'),(116,'1524118001603_a2da8977-04e3-49bb-8d91-2fe0d2d30a3c.jpg',26,100,1,NULL,NULL,'2018-06-24 17:29:51','2018-06-24 17:29:51'),(117,'1517547852004_e80a0f48-63bb-4274-b009-9e6c2b1456a5.jpg',27,100,1,NULL,NULL,'2018-06-24 17:29:53','2018-06-24 17:29:53'),(118,'1517547773670_2f9773a3-b60a-46a1-8752-34c223924afa.jpg',27,100,1,NULL,NULL,'2018-06-24 17:29:53','2018-06-24 17:29:53'),(119,'1517547807170_60de6023-1671-47dd-907a-e2567ce0fda0.jpg',27,100,1,NULL,NULL,'2018-06-24 17:29:54','2018-06-24 17:29:54'),(120,'1517143880957_b915acb8-f7c2-4b27-8c30-4ea7adf7aaf8.jpg',28,100,1,NULL,NULL,'2018-06-24 17:29:57','2018-06-24 17:29:57'),(121,'1517143916307_ce4f8ae8-0aa4-49fc-887a-a2aa21d5e2dc.jpg',28,100,1,NULL,NULL,'2018-06-24 17:29:57','2018-06-24 17:29:57'),(122,'1517143940369_0842fd41-467a-4ca3-ad8c-b838c4e97a76.jpg',28,100,1,NULL,NULL,'2018-06-24 17:29:58','2018-06-24 17:29:58'),(123,'1517143966214_01c1a3c0-0225-4dff-a1a1-dc4543a4021e.jpg',28,100,1,NULL,NULL,'2018-06-24 17:29:58','2018-06-24 17:29:58'),(124,'1517195843687_6963fe03-f3c3-4d08-a38e-39e41c137633.jpg',29,100,1,NULL,NULL,'2018-06-24 17:30:02','2018-06-24 17:30:02'),(125,'1517195865799_c17bbcbf-90f1-4170-a316-782c12e0826e.jpg',29,100,1,NULL,NULL,'2018-06-24 17:30:03','2018-06-24 17:30:03'),(126,'1517195805804_afdec5d1-3002-42f7-af6f-1bd1f3ed0e5e.jpg',29,100,1,NULL,NULL,'2018-06-24 17:30:04','2018-06-24 17:30:04'),(127,'1517195824982_7db6415d-dc22-4d31-9b17-f6c57a2eca1f.jpg',29,100,1,NULL,NULL,'2018-06-24 17:30:05','2018-06-24 17:30:05'),(128,'1517105813599_1048c7e2-6b71-48b6-8f7d-2b2007e6c3e5.jpg',30,100,1,NULL,NULL,'2018-06-24 17:30:07','2018-06-24 17:30:07'),(129,'1517105679897_b07c2105-704b-496b-a7f7-6759fbc0caf4.jpg',30,100,1,NULL,NULL,'2018-06-24 17:30:08','2018-06-24 17:30:08'),(130,'1517105754117_13a66a9f-e59a-4526-a386-bfcd171cc286.jpg',30,100,1,NULL,NULL,'2018-06-24 17:30:09','2018-06-24 17:30:09'),(131,'1517105742067_a7886e0e-2e6d-4919-a4df-4b537c87886d.jpg',30,100,1,NULL,NULL,'2018-06-24 17:30:10','2018-06-24 17:30:10'),(132,'1514344421126_5d497d18-13fa-4d2c-bb91-0d17fab9b1a6.jpg',32,100,1,NULL,NULL,'2018-06-24 17:30:14','2018-06-24 17:30:14'),(133,'1514344452558_fffe1219-c1e3-4276-9762-620261c7189f.jpg',32,100,1,NULL,NULL,'2018-06-24 17:30:14','2018-06-24 17:30:14'),(134,'1514344227207_8aae3258-2ef2-43db-8691-cd15f0e2be22.jpg',32,100,1,NULL,NULL,'2018-06-24 17:30:15','2018-06-24 17:30:15'),(135,'1514344278331_e45e8746-e040-4bd1-b6c3-99ff682dffd9.jpg',32,100,1,NULL,NULL,'2018-06-24 17:30:15','2018-06-24 17:30:15'),(136,'1517457620522_78df221b-aaf9-4502-9d18-c158829eead2.jpg',33,100,1,NULL,NULL,'2018-06-24 17:30:17','2018-06-24 17:30:17'),(137,'1517457636704_aa6767d2-df86-4e4f-a280-4ddc4a1b0c42.jpg',33,100,1,NULL,NULL,'2018-06-24 17:30:18','2018-06-24 17:30:18'),(138,'1517457596727_a03611d1-2068-42fc-8cf7-e55cbaab372b.jpg',33,100,1,NULL,NULL,'2018-06-24 17:30:19','2018-06-24 17:30:19'),(139,'1517676222881_1e703992-fa04-4344-aa11-001bc16be022.jpg',34,100,1,NULL,NULL,'2018-06-24 17:30:21','2018-06-24 17:30:21'),(140,'1517676266647_75d71cfc-31b0-4e3b-80d7-6dee396a3f3b.jpg',34,100,1,NULL,NULL,'2018-06-24 17:30:21','2018-06-24 17:30:21'),(141,'1517676335500_bbfe5eaa-b7b4-4f5e-ac91-bc123b03d7ec.jpg',34,100,1,NULL,NULL,'2018-06-24 17:30:22','2018-06-24 17:30:22'),(142,'1516976933191_7c766604-d8ef-48d1-a571-5707fce0dc91.jpg',35,100,1,NULL,NULL,'2018-06-24 17:30:25','2018-06-24 17:30:25'),(143,'1516976974115_4f5a7c49-d284-4f20-b143-e73a9a63c559.jpg',35,100,1,NULL,NULL,'2018-06-24 17:30:25','2018-06-24 17:30:25'),(144,'1516976942139_50d7519c-1ff3-4873-ae1b-2a57c63c5b2e.jpg',35,100,1,NULL,NULL,'2018-06-24 17:30:26','2018-06-24 17:30:26'),(145,'1516976865919_167c9ba4-5ff7-486c-b457-6cb30c03db4d.jpg',35,100,1,NULL,NULL,'2018-06-24 17:30:26','2018-06-24 17:30:26'),(146,'1517656995698_9692a807-06ab-4ddb-bf00-19fce6144b46.jpg',36,100,1,NULL,NULL,'2018-06-24 17:30:28','2018-06-24 17:30:28'),(147,'1517657055726_c706f8f8-27c5-49bd-87f5-89be7923e5d3.jpg',36,100,1,NULL,NULL,'2018-06-24 17:30:29','2018-06-24 17:30:29'),(148,'1517657285187_f3af01db-f24b-4283-b19e-7ace98d90418.jpg',36,100,1,NULL,NULL,'2018-06-24 17:30:29','2018-06-24 17:30:29'),(149,'1517545176293_19b8fb1a-f5d0-4c7e-b805-e219bcd552d9.jpg',37,100,1,NULL,NULL,'2018-06-24 17:30:32','2018-06-24 17:30:32'),(150,'1517545193759_597609d7-388f-4518-994c-f3157ac4e910.jpg',37,100,1,NULL,NULL,'2018-06-24 17:30:32','2018-06-24 17:30:32'),(151,'1517545211223_44eedf5b-7ec1-4327-84fe-3ab901085232.jpg',37,100,1,NULL,NULL,'2018-06-24 17:30:32','2018-06-24 17:30:32'),(152,'1517545255394_bf210ca6-cab3-4b95-b6ce-472bd11f9846.jpg',37,100,1,NULL,NULL,'2018-06-24 17:30:33','2018-06-24 17:30:33'),(153,'1517399371968_3f6e2dd6-d2ef-44c7-abc0-3d87795d1d6b.jpg',38,100,1,NULL,NULL,'2018-06-24 17:30:35','2018-06-24 17:30:35'),(154,'1517399389920_36b18b5a-7460-4ce1-b2cf-d6ab9722f8e7.jpg',38,100,1,NULL,NULL,'2018-06-24 17:30:36','2018-06-24 17:30:36'),(155,'1517399420443_b9a232a6-cc1a-449c-9d57-3aea7553bae2.jpg',38,100,1,NULL,NULL,'2018-06-24 17:30:36','2018-06-24 17:30:36'),(156,'1517320981856_ed208c8b-dc39-4037-b1b4-93ee9fdf48cc.jpg',39,100,1,NULL,NULL,'2018-06-24 17:30:39','2018-06-24 17:30:39'),(157,'1517320929444_e75bab2b-f5c2-47de-aecd-fea351a2fedd.jpg',39,100,1,NULL,NULL,'2018-06-24 17:30:39','2018-06-24 17:30:39'),(158,'1517320953711_fe6c262c-c8f3-4d8a-a486-038b90fc4f51.jpg',39,100,1,NULL,NULL,'2018-06-24 17:30:40','2018-06-24 17:30:40'),(159,'1517672330078_c6528120-ce14-404a-b1d2-aba14b4f8e2a.jpg',40,100,1,NULL,NULL,'2018-06-24 17:30:42','2018-06-24 17:30:42'),(160,'1517672400384_49acedf9-c226-4e5c-bbef-f39a0563d61d.jpg',40,100,1,NULL,NULL,'2018-06-24 17:30:43','2018-06-24 17:30:43'),(161,'1517671950382_a912f89e-d541-4296-9c6f-a96178262ac0.jpg',40,100,1,NULL,NULL,'2018-06-24 17:30:43','2018-06-24 17:30:43'),(162,'1517672281041_decea463-cbc6-436c-b14d-a0ea0e15d7f6.jpg',40,100,1,NULL,NULL,'2018-06-24 17:30:43','2018-06-24 17:30:43'),(163,'1517410571784_285e93d8-4715-408c-8aee-fae39ed5cf4d.jpg',41,100,1,NULL,NULL,'2018-06-24 17:30:46','2018-06-24 17:30:46'),(164,'1517410592888_f941eeeb-626b-4a9f-b415-f73d927d5343.jpg',41,100,1,NULL,NULL,'2018-06-24 17:30:46','2018-06-24 17:30:46'),(165,'1517410616936_c0777169-e4d0-4698-8726-c9d3b2653a70.jpg',41,100,1,NULL,NULL,'2018-06-24 17:30:47','2018-06-24 17:30:47'),(166,'1517671221589_78ed78dc-6e09-4219-9439-b84f2b4b5f48.jpg',42,100,1,NULL,NULL,'2018-06-24 17:30:49','2018-06-24 17:30:49'),(167,'1517671267030_a5ff6ada-12b5-4fda-866e-50d69013d36d.jpg',42,100,1,NULL,NULL,'2018-06-24 17:30:49','2018-06-24 17:30:49'),(168,'1517671308747_27f9afff-afca-47c0-9d68-dfb25477fe83.jpg',42,100,1,NULL,NULL,'2018-06-24 17:30:50','2018-06-24 17:30:50'),(169,'1517671356788_b059adbf-c304-4a6a-bf23-059666584ec5.jpg',42,100,1,NULL,NULL,'2018-06-24 17:30:50','2018-06-24 17:30:50'),(170,'1517391151647_6706ebf4-750d-4762-bffb-630cefff0aee.jpg',43,100,1,NULL,NULL,'2018-06-24 17:30:53','2018-06-24 17:30:53'),(171,'1517391193746_1e7dc364-3ecf-4f7a-894d-fdda46d95ff2.jpg',43,100,1,NULL,NULL,'2018-06-24 17:30:54','2018-06-24 17:30:54'),(172,'1517391268608_04b4fe52-2841-417c-a731-e890cd327e3a.jpg',43,100,1,NULL,NULL,'2018-06-24 17:30:55','2018-06-24 17:30:55'),(173,'1512140838380_7d1a70b4-7240-465f-b0ef-83730263bfd6.jpg',44,100,1,NULL,NULL,'2018-06-24 17:30:57','2018-06-24 17:30:57'),(174,'1517364847324_03f899d3-94c5-4e33-acf3-d46044c5a301.jpg',45,100,1,NULL,NULL,'2018-06-24 17:30:59','2018-06-24 17:30:59'),(175,'1517364890653_d52fa1a6-61a6-4f5e-90c6-7454c3e4922b.jpg',45,100,1,NULL,NULL,'2018-06-24 17:30:59','2018-06-24 17:30:59'),(176,'1517364813949_d043aa66-8088-4db0-9e8c-6e17cd166124.jpg',45,100,1,NULL,NULL,'2018-06-24 17:30:59','2018-06-24 17:30:59'),(177,'1517196689682_8baf745c-383d-4747-8f88-bcaa6f2b1e3f.jpg',46,100,1,NULL,NULL,'2018-06-24 17:31:02','2018-06-24 17:31:02'),(178,'1517196785551_4d95f774-cf69-4c0e-93e1-97c3afeac32e.jpg',46,100,1,NULL,NULL,'2018-06-24 17:31:02','2018-06-24 17:31:02'),(179,'1517196950240_999aab63-012d-41bd-a2e9-56c8a1f03cfb.jpg',46,100,1,NULL,NULL,'2018-06-24 17:31:03','2018-06-24 17:31:03'),(180,'1517196844884_12794639-c538-4284-953a-02d48d4779a1.jpg',46,100,1,NULL,NULL,'2018-06-24 17:31:03','2018-06-24 17:31:03'),(181,'1517448571147_07692918-7a99-4ed6-b98b-61dfc1b232f2.jpg',47,100,1,NULL,NULL,'2018-06-24 17:31:06','2018-06-24 17:31:06'),(182,'1517448508505_0ae762a7-0ce6-474f-a691-b918add8ccb2.jpg',47,100,1,NULL,NULL,'2018-06-24 17:31:07','2018-06-24 17:31:07'),(183,'1517448540013_b28a4d94-2268-460c-81ba-5700705c3860.jpg',47,100,1,NULL,NULL,'2018-06-24 17:31:07','2018-06-24 17:31:07'),(184,'1517492995340_cbdfcdc0-0eef-487d-a57c-907515488411.jpg',48,100,1,NULL,NULL,'2018-06-24 17:31:10','2018-06-24 17:31:10'),(185,'1517493059725_7d051bbe-c5d2-43c4-bcda-4b0b265dd376.jpg',48,100,1,NULL,NULL,'2018-06-24 17:31:10','2018-06-24 17:31:10'),(186,'1517492829910_5a76730a-9435-45f4-a62e-5043480c1f99.jpg',48,100,1,NULL,NULL,'2018-06-24 17:31:10','2018-06-24 17:31:10'),(187,'1517492902714_4b302b0c-5b29-4126-a241-8b65a1eb672c.jpg',48,100,1,NULL,NULL,'2018-06-24 17:31:11','2018-06-24 17:31:11'),(188,'1517394434159_228d661b-3989-4f8c-9e2a-496257d37e1e.jpg',49,100,1,NULL,NULL,'2018-06-24 17:31:13','2018-06-24 17:31:13'),(189,'1517394261215_8d992545-f79a-4187-8b93-f3dc02251101.jpg',49,100,1,NULL,NULL,'2018-06-24 17:31:14','2018-06-24 17:31:14'),(190,'1517394385027_f9a9b3ee-a698-49d3-808b-a03740f60118.jpg',49,100,1,NULL,NULL,'2018-06-24 17:31:14','2018-06-24 17:31:14'),(191,'1517368335394_1bdf1ade-c4c9-48ca-8f9b-a91215f5e87a.jpg',50,100,1,NULL,NULL,'2018-06-24 17:31:17','2018-06-24 17:31:17'),(192,'1517368355449_a904427c-5bf9-4b19-9fb7-90a9d4bc36a6.jpg',50,100,1,NULL,NULL,'2018-06-24 17:31:18','2018-06-24 17:31:18'),(193,'1517368377397_79525e52-3935-4de3-afc0-40f7468132f4.jpg',50,100,1,NULL,NULL,'2018-06-24 17:31:18','2018-06-24 17:31:18'),(194,'1517376880597_0c407c34-2f23-4db6-ae39-fcfd4e6d2312.jpg',51,100,1,NULL,NULL,'2018-06-24 17:31:21','2018-06-24 17:31:21'),(195,'1517376902715_2662c81e-3219-41f0-b946-97bc501a205d.jpg',51,100,1,NULL,NULL,'2018-06-24 17:31:22','2018-06-24 17:31:22'),(196,'1517376929851_22836cc0-1622-4b4c-8c24-fcf5bc8bae4d.jpg',51,100,1,NULL,NULL,'2018-06-24 17:31:23','2018-06-24 17:31:23'),(197,'1517372971532_607515ee-4de2-4375-b524-00f7b0e93d8f.jpg',52,100,1,NULL,NULL,'2018-06-24 17:31:25','2018-06-24 17:31:25'),(198,'1517373001901_f0fa2e64-19c9-49e1-b472-9dc3ac2a29c8.jpg',52,100,1,NULL,NULL,'2018-06-24 17:31:26','2018-06-24 17:31:26'),(199,'1517372948676_a03194a3-90fd-4d96-932c-f74267498d20.jpg',52,100,1,NULL,NULL,'2018-06-24 17:31:27','2018-06-24 17:31:27'),(200,'1517452230682_07f1b976-3acb-4b35-82c3-ebe9328101f4.jpg',53,100,1,NULL,NULL,'2018-06-24 17:31:29','2018-06-24 17:31:29'),(201,'1517452249772_a285166c-0a2a-437d-8a6f-bd09ed1c7a35.jpg',53,100,1,NULL,NULL,'2018-06-24 17:31:29','2018-06-24 17:31:29'),(202,'1517452269119_676650aa-45ce-4f03-9781-c3d009e39b1b.jpg',53,100,1,NULL,NULL,'2018-06-24 17:31:30','2018-06-24 17:31:30'),(203,'1516966051276_57ccea52-7075-455d-b3f9-6632d62799c6.jpg',54,100,1,NULL,NULL,'2018-06-24 17:31:32','2018-06-24 17:31:32'),(204,'1516966243826_a68de963-160d-4399-92be-e100b2d93f60.jpg',54,100,1,NULL,NULL,'2018-06-24 17:31:33','2018-06-24 17:31:33'),(205,'1516966275172_e69c2efa-b847-4b3b-b060-36af8b8af0f9.jpg',54,100,1,NULL,NULL,'2018-06-24 17:31:33','2018-06-24 17:31:33'),(206,'1516965990288_8fa1e211-9f48-4980-9074-ee5c70d7ad9c.jpg',54,100,1,NULL,NULL,'2018-06-24 17:31:34','2018-06-24 17:31:34'),(207,'1517477886076_7b42332c-dc68-42f9-92ad-1c64d00955ec.jpg',55,100,1,NULL,NULL,'2018-06-24 17:31:36','2018-06-24 17:31:36'),(208,'1517477920794_8f86ab0c-0508-4c68-be57-8a5c5368bca0.jpg',55,100,1,NULL,NULL,'2018-06-24 17:31:37','2018-06-24 17:31:37'),(209,'1517477942202_52b25ead-0646-4d48-9f1e-361cbde432ad.jpg',55,100,1,NULL,NULL,'2018-06-24 17:31:38','2018-06-24 17:31:38'),(210,'1507385185418_892aa20d-c4a6-4892-83f3-a0bf6c05f316.jpg',56,100,1,NULL,NULL,'2018-06-24 17:31:40','2018-06-24 17:31:40'),(211,'1517546521614_4b7cd4ad-74e1-495a-aa79-5d7e13244a97.jpg',57,100,1,NULL,NULL,'2018-06-24 17:31:42','2018-06-24 17:31:42'),(212,'1517546572386_b70586f6-5421-4b2b-a79e-f2e5b85bbc7a.jpg',57,100,1,NULL,NULL,'2018-06-24 17:31:43','2018-06-24 17:31:43'),(213,'1517546617513_a7b63a4b-c34f-44fe-af49-650e0e83a288.jpg',57,100,1,NULL,NULL,'2018-06-24 17:31:43','2018-06-24 17:31:43'),(214,'1517717342419_d20f6446-5331-4cfd-8f40-06f357d1fd22.jpg',58,100,1,NULL,NULL,'2018-06-24 17:31:45','2018-06-24 17:31:45'),(215,'1517717396300_ee604613-920e-42e5-bcdd-f15f3adcbd4e.jpg',58,100,1,NULL,NULL,'2018-06-24 17:31:46','2018-06-24 17:31:46'),(216,'1517717257319_b4b5ed7a-b71c-4aae-a248-9ef5dbcb86ac.jpg',58,100,1,NULL,NULL,'2018-06-24 17:31:46','2018-06-24 17:31:46'),(217,'1517491605730_5a853175-0c20-4eee-ad85-72ec9b481ca0.jpg',59,100,1,NULL,NULL,'2018-06-24 17:31:49','2018-06-24 17:31:49'),(218,'1517491674122_4a653a9a-e4b7-432b-8094-fc8ca747b5e5.jpg',59,100,1,NULL,NULL,'2018-06-24 17:31:50','2018-06-24 17:31:50'),(219,'1517491779663_85d595bf-d953-4d3b-a467-2c78d6325959.jpg',59,100,1,NULL,NULL,'2018-06-24 17:31:50','2018-06-24 17:31:50'),(220,'1517491484182_50c99eee-1a8f-485b-b943-a165502cf987.jpg',59,100,1,NULL,NULL,'2018-06-24 17:31:51','2018-06-24 17:31:51'),(221,'1517590979482_a03a9834-83c1-41f6-b6ed-0595e5651c01.jpg',60,100,1,NULL,NULL,'2018-06-24 17:31:53','2018-06-24 17:31:53'),(222,'1517591045005_b37e97d6-139e-4d0d-87d1-6fb734e0ca2e.jpg',60,100,1,NULL,NULL,'2018-06-24 17:31:53','2018-06-24 17:31:53'),(223,'1517590903503_f002dd69-df2c-42ff-b0f9-869aa641f15f.jpg',60,100,1,NULL,NULL,'2018-06-24 17:31:54','2018-06-24 17:31:54'),(224,'1517396694785_a6635ff7-a23e-4c70-9b41-38e08a634da9.jpg',61,100,1,NULL,NULL,'2018-06-24 17:31:56','2018-06-24 17:31:56'),(225,'1517396722860_8ddcff68-259a-486a-9e07-1a28a69b3821.jpg',61,100,1,NULL,NULL,'2018-06-24 17:31:57','2018-06-24 17:31:57'),(226,'1517396677779_e6709a4a-571f-4e8d-8660-9b090b1f17c3.jpg',61,100,1,NULL,NULL,'2018-06-24 17:31:57','2018-06-24 17:31:57'),(227,'1517456599764_78ca87c3-f33b-4b68-baa9-48575ec5ee48.jpg',62,100,1,NULL,NULL,'2018-06-24 17:32:00','2018-06-24 17:32:00'),(228,'1517456654444_2c86f214-7170-4cf0-8266-8ac1f02cbc3a.jpg',62,100,1,NULL,NULL,'2018-06-24 17:32:00','2018-06-24 17:32:00'),(229,'1517456569343_27b3f612-e474-4f89-a8ef-0c26b452fd50.jpg',62,100,1,NULL,NULL,'2018-06-24 17:32:01','2018-06-24 17:32:01'),(230,'1517727266690_0a27d4cb-112d-4c97-821f-7ce8600230bc.jpg',63,100,1,NULL,NULL,'2018-06-24 17:32:04','2018-06-24 17:32:04'),(231,'1517727334436_5b2b95d5-28f5-4cc5-80fb-0a5ab90cc03a.jpg',63,100,1,NULL,NULL,'2018-06-24 17:32:04','2018-06-24 17:32:04'),(232,'1517727400431_ee510588-9e80-48c0-a916-940acf421aeb.jpg',63,100,1,NULL,NULL,'2018-06-24 17:32:05','2018-06-24 17:32:05'),(233,'1517450198001_d8cccfb4-f2ec-4770-afbd-ad548c763cf0.jpg',64,100,1,NULL,NULL,'2018-06-24 17:32:07','2018-06-24 17:32:07'),(234,'1517450218720_851157e6-c5f6-40a4-9d57-2c46bfc7751e.jpg',64,100,1,NULL,NULL,'2018-06-24 17:32:08','2018-06-24 17:32:08'),(235,'1517450283172_4d2d5231-32a7-4319-b53d-ed89907869f3.jpg',64,100,1,NULL,NULL,'2018-06-24 17:32:08','2018-06-24 17:32:08'),(236,'1517544387387_506cf6ae-3eb3-4e85-83be-efdfe3b55124.jpg',65,100,1,NULL,NULL,'2018-06-24 17:32:10','2018-06-24 17:32:10'),(237,'1517544108178_9a7435c5-23b4-4db9-8a28-85ada72d98ed.jpg',65,100,1,NULL,NULL,'2018-06-24 17:32:11','2018-06-24 17:32:11'),(238,'1517544130078_f0a5b704-a0c2-446d-86ce-e834b21aacba.jpg',65,100,1,NULL,NULL,'2018-06-24 17:32:12','2018-06-24 17:32:12'),(239,'1517544246234_d6c82ffa-4038-4588-9983-172b8421ecc9.jpg',65,100,1,NULL,NULL,'2018-06-24 17:32:12','2018-06-24 17:32:12'),(240,'1517544317367_762cbbb8-0e93-44a2-9175-c0b386c3c5d5.jpg',65,100,1,NULL,NULL,'2018-06-24 17:32:13','2018-06-24 17:32:13'),(241,'1517673091390_3e11527e-9e29-4e0c-b9ee-bacd83b62e1d.jpg',66,100,1,NULL,NULL,'2018-06-24 17:32:15','2018-06-24 17:32:15'),(242,'1517673143790_7f9f4db2-b0d7-49ac-b9e2-250570ffe55d.jpg',66,100,1,NULL,NULL,'2018-06-24 17:32:15','2018-06-24 17:32:15'),(243,'1517673045261_8cca4b27-957c-470e-a919-cb36f115af3f.jpg',66,100,1,NULL,NULL,'2018-06-24 17:32:16','2018-06-24 17:32:16'),(244,'1517728413088_ace192fc-7f82-4759-80b4-23098747026d.jpg',67,100,1,NULL,NULL,'2018-06-24 17:32:18','2018-06-24 17:32:18'),(245,'1517728482279_19c86e5f-6420-496f-8a82-fed54a66b3db.jpg',67,100,1,NULL,NULL,'2018-06-24 17:32:18','2018-06-24 17:32:18'),(246,'1517728586878_478df7de-7baf-414a-9b3f-92f2722efbff.jpg',67,100,1,NULL,NULL,'2018-06-24 17:32:19','2018-06-24 17:32:19'),(247,'1517728656792_0624244f-b565-4973-a862-d5020d46e933.jpg',67,100,1,NULL,NULL,'2018-06-24 17:32:19','2018-06-24 17:32:19'),(248,'1517149129526_181e4ada-28e0-4c28-b362-a6fc19c33e88.jpg',68,100,1,NULL,NULL,'2018-06-24 17:32:21','2018-06-24 17:32:21'),(249,'1517149029371_c02670a5-a6fd-4b5f-939b-de9d7c544a42.jpg',68,100,1,NULL,NULL,'2018-06-24 17:32:22','2018-06-24 17:32:22'),(250,'1517149065510_cfd30739-25f2-456c-b2b4-0834e1613183.jpg',68,100,1,NULL,NULL,'2018-06-24 17:32:22','2018-06-24 17:32:22'),(251,'1517149095036_140935ad-ba6a-4288-aa94-3b9c1e44c594.jpg',68,100,1,NULL,NULL,'2018-06-24 17:32:23','2018-06-24 17:32:23'),(252,'1517219676287_7ebf4ceb-f35e-4565-8200-54660c70785b.jpg',69,100,1,NULL,NULL,'2018-06-24 17:32:26','2018-06-24 17:32:26'),(253,'1517219691274_9c6c420f-aa49-4afe-b522-277d752a31a1.jpg',69,100,1,NULL,NULL,'2018-06-24 17:32:26','2018-06-24 17:32:26'),(254,'1517219944262_1a25e2b3-fa3c-4290-9704-3a06f7b04359.jpg',69,100,1,NULL,NULL,'2018-06-24 17:32:27','2018-06-24 17:32:27'),(255,'1517390323468_ff6a7925-0575-4c59-b486-345a1b5c3572.jpg',70,100,1,NULL,NULL,'2018-06-24 17:32:34','2018-06-24 17:32:34'),(256,'1517390406561_88ec251a-8458-49aa-93f4-4ee6afda2ea3.jpg',70,100,1,NULL,NULL,'2018-06-24 17:32:36','2018-06-24 17:32:36'),(257,'1517390484163_5967fd4b-535a-4937-b7aa-fc2c6f65929f.jpg',70,100,1,NULL,NULL,'2018-06-24 17:32:38','2018-06-24 17:32:38'),(258,'1517559524406_0e154c35-d090-4a77-924b-ee3b3c942619.jpg',71,100,1,NULL,NULL,'2018-06-24 17:32:40','2018-06-24 17:32:40'),(259,'1516972666031_37f4540e-40cd-420b-bc4f-e1b8f71e1184.jpg',72,100,1,NULL,NULL,'2018-06-24 17:32:42','2018-06-24 17:32:42'),(260,'1516972707548_bc2d6342-b50e-4ec3-a924-6ebcf044abb8.jpg',72,100,1,NULL,NULL,'2018-06-24 17:32:43','2018-06-24 17:32:43'),(261,'1516972616536_04d99b78-97e8-4eec-84a8-9d2eec9cf299.jpg',72,100,1,NULL,NULL,'2018-06-24 17:32:44','2018-06-24 17:32:44'),(262,'1516972644848_2672f62b-4d86-4f93-b617-84c5d4c6b900.jpg',72,100,1,NULL,NULL,'2018-06-24 17:32:44','2018-06-24 17:32:44'),(263,'1517673791630_e4c058cf-7395-4140-a93d-7faf43361f3a.jpg',73,100,1,NULL,NULL,'2018-06-24 17:32:46','2018-06-24 17:32:46'),(264,'1517673804416_4320d594-522f-41b7-bc98-3fc4deea3086.jpg',73,100,1,NULL,NULL,'2018-06-24 17:32:47','2018-06-24 17:32:47'),(265,'1517673825199_24cf05b0-fe75-4961-8c51-de88d01f7534.jpg',73,100,1,NULL,NULL,'2018-06-24 17:32:47','2018-06-24 17:32:47'),(266,'1517388906390_b76fa154-b842-407d-95c3-22771805949f.jpg',74,100,1,NULL,NULL,'2018-06-24 17:32:50','2018-06-24 17:32:50'),(267,'1517388940275_43ed14c9-e0e2-49f4-b523-8457af8f58d0.jpg',74,100,1,NULL,NULL,'2018-06-24 17:32:51','2018-06-24 17:32:51'),(268,'1517388877024_af23551b-ed23-4177-8215-25eeffeb73fd.jpg',74,100,1,NULL,NULL,'2018-06-24 17:32:51','2018-06-24 17:32:51'),(269,'1517547273490_3479faab-5a0c-43d4-aa87-a39274286ca2.jpg',75,100,1,NULL,NULL,'2018-06-24 17:32:54','2018-06-24 17:32:54'),(270,'1517547187424_741f6b33-2ddd-4555-8acc-a3490d75bf02.jpg',75,100,1,NULL,NULL,'2018-06-24 17:32:54','2018-06-24 17:32:54'),(271,'1517547209758_c0bc7143-c066-4a88-845b-8856f90329fb.jpg',75,100,1,NULL,NULL,'2018-06-24 17:32:55','2018-06-24 17:32:55'),(272,'1517132203953_802a8b5e-26ed-4a9a-b403-82ef891cfb58.jpg',76,100,1,NULL,NULL,'2018-06-24 17:32:57','2018-06-24 17:32:57'),(273,'1517132225653_b6eda728-661f-4f6b-866b-aa14e36a70ab.jpg',76,100,1,NULL,NULL,'2018-06-24 17:32:58','2018-06-24 17:32:58'),(274,'1517132160837_632dbbd7-5d37-4a16-aeb5-d13bbf6f819a.jpg',76,100,1,NULL,NULL,'2018-06-24 17:32:58','2018-06-24 17:32:58'),(275,'1517132182414_ea24c9f1-40f5-4bad-98fe-f6181ed660cf.jpg',76,100,1,NULL,NULL,'2018-06-24 17:32:59','2018-06-24 17:32:59'),(276,'1517393719936_35c2d1d1-4030-43f0-9a79-8fdde992353c.jpg',77,100,1,NULL,NULL,'2018-06-24 17:33:01','2018-06-24 17:33:02'),(277,'1517393745204_4c5dfa5e-ad3e-44e2-973a-068980029393.jpg',77,100,1,NULL,NULL,'2018-06-24 17:33:03','2018-06-24 17:33:03'),(278,'1517393764822_7ec4d52a-387f-47ae-a7e4-f2cebc1be575.jpg',77,100,1,NULL,NULL,'2018-06-24 17:33:04','2018-06-24 17:33:04'),(279,'1517497614340_a9d84c55-f932-497a-8e32-dddc8df94f39.jpg',78,100,1,NULL,NULL,'2018-06-24 17:33:07','2018-06-24 17:33:07'),(280,'1517497575489_a4d65c5c-f14b-42d0-949b-1ef45fa177ee.jpg',78,100,1,NULL,NULL,'2018-06-24 17:33:07','2018-06-24 17:33:07'),(281,'1517497594198_8795408d-422b-4738-b6dc-008300c7cb11.jpg',78,100,1,NULL,NULL,'2018-06-24 17:33:08','2018-06-24 17:33:08'),(282,'1517732644618_a4431a68-6285-48de-b038-c9933006a5c7.jpg',79,100,1,NULL,NULL,'2018-06-24 17:33:10','2018-06-24 17:33:10'),(283,'1517732680362_666fa002-1e2b-4409-a0c8-33409635f6f1.jpg',79,100,1,NULL,NULL,'2018-06-24 17:33:11','2018-06-24 17:33:11'),(284,'1517732761304_b3601449-179e-4bef-a0b0-14a4a79db835.jpg',79,100,1,NULL,NULL,'2018-06-24 17:33:11','2018-06-24 17:33:11'),(285,'1517142020213_48308990-afe8-4ee5-8241-7bd496c46aeb.jpg',80,100,1,NULL,NULL,'2018-06-24 17:33:13','2018-06-24 17:33:13'),(286,'1517142051427_ec3fab96-21e5-42d7-a69e-58741b9db020.jpg',80,100,1,NULL,NULL,'2018-06-24 17:33:14','2018-06-24 17:33:14'),(287,'1517141958434_d9b6abe3-be4a-44bd-85b8-10690bc3b7fb.jpg',80,100,1,NULL,NULL,'2018-06-24 17:33:15','2018-06-24 17:33:15'),(288,'1517141990198_42155996-034b-449f-aebb-3d0050b3bcb0.jpg',80,100,1,NULL,NULL,'2018-06-24 17:33:15','2018-06-24 17:33:15'),(289,'1517420636578_6aee6d46-574d-4265-9423-e309c6d6384c.jpg',81,100,1,NULL,NULL,'2018-06-24 17:33:17','2018-06-24 17:33:17'),(290,'1517420215554_d9fc3f2a-c3ad-4272-951a-217ef2c04c36.jpg',81,100,1,NULL,NULL,'2018-06-24 17:33:18','2018-06-24 17:33:18'),(291,'1517420312326_55e45483-0e93-4a4d-af21-b011ca110d0c.jpg',81,100,1,NULL,NULL,'2018-06-24 17:33:18','2018-06-24 17:33:18'),(292,'1517381900349_9d2b5d39-de7a-42fe-87ef-dde945e6cd6e.jpg',82,100,1,NULL,NULL,'2018-06-24 17:33:24','2018-06-24 17:33:24'),(293,'1517381862119_e9173169-4507-4e2e-9b42-84b347bf1a2c.jpg',82,100,1,NULL,NULL,'2018-06-24 17:33:27','2018-06-24 17:33:27'),(294,'1517381838108_3459bcac-b553-4dca-a022-6e94f1f033ff.jpg',82,100,1,NULL,NULL,'2018-06-24 17:33:28','2018-06-24 17:33:28'),(295,'1517381880359_474144d0-6148-4adb-b486-7cebd8423f8d.jpg',82,100,1,NULL,NULL,'2018-06-24 17:33:31','2018-06-24 17:33:31'),(296,'1517112844348_f2194aa9-a2d1-4b81-a6c4-ca6a67a890dc.jpg',83,100,1,NULL,NULL,'2018-06-24 17:33:33','2018-06-24 17:33:33'),(297,'1517112959900_ca9b9411-be7b-43ff-86a9-a2f37d9b45d2.jpg',83,100,1,NULL,NULL,'2018-06-24 17:33:34','2018-06-24 17:33:34'),(298,'1517112932315_1d09f896-5be6-4f54-bbb2-4a643ba56175.jpg',83,100,1,NULL,NULL,'2018-06-24 17:33:35','2018-06-24 17:33:35'),(299,'1517112795787_152e0924-aec3-4556-a77c-095588058e84.jpg',83,100,1,NULL,NULL,'2018-06-24 17:33:36','2018-06-24 17:33:36'),(300,'1517489112917_50461714-9790-4c54-9b35-78dfd41b6520.jpg',84,100,1,NULL,NULL,'2018-06-24 17:33:38','2018-06-24 17:33:38'),(301,'1517489141227_39a0a4b0-73a8-41c8-966b-09fb41eec460.jpg',84,100,1,NULL,NULL,'2018-06-24 17:33:39','2018-06-24 17:33:39'),(302,'1517489087778_5cbdab9f-9c1d-4c93-881a-b9929987cbf7.jpg',84,100,1,NULL,NULL,'2018-06-24 17:33:39','2018-06-24 17:33:39'),(303,'1517675590398_1cf56b16-9392-483e-ab46-2d9d44710a44.jpg',85,100,1,NULL,NULL,'2018-06-24 17:33:42','2018-06-24 17:33:42'),(304,'1517675626863_52208f71-8cf4-4fee-a5e0-4a9c9d2a30b9.jpg',85,100,1,NULL,NULL,'2018-06-24 17:33:43','2018-06-24 17:33:43'),(305,'1517675546933_496a0f99-6b70-4160-9f63-22c61399d9de.jpg',85,100,1,NULL,NULL,'2018-06-24 17:33:43','2018-06-24 17:33:43'),(306,'1517456107154_27bb8d97-5799-4392-9a7c-64a4fa78c273.jpg',86,100,1,NULL,NULL,'2018-06-24 17:33:46','2018-06-24 17:33:46'),(307,'1517456052418_e3c33c19-d0f5-424a-88cb-58865ae8fb3d.jpg',86,100,1,NULL,NULL,'2018-06-24 17:33:46','2018-06-24 17:33:46'),(308,'1517456065407_b8358450-9877-4ccf-831e-f8be5ef4ccc3.jpg',86,100,1,NULL,NULL,'2018-06-24 17:33:48','2018-06-24 17:33:48'),(309,'1517546068608_9f38b21b-9dec-4fd5-9e2a-933eb3a00a68.jpg',88,100,1,NULL,NULL,'2018-06-24 17:33:51','2018-06-24 17:33:51'),(310,'1517546083117_169fb13d-e80d-4c1f-b90e-31ad9dd9f92b.jpg',88,100,1,NULL,NULL,'2018-06-24 17:33:52','2018-06-24 17:33:52'),(311,'1517546047464_3fee4286-ae4a-4549-b9fc-1a58676c4a7f.jpg',88,100,1,NULL,NULL,'2018-06-24 17:33:52','2018-06-24 17:33:52'),(312,'1517207805744_51608e67-5234-4ba5-b973-fd4bb8c7075a.jpg',89,100,1,NULL,NULL,'2018-06-24 17:33:54','2018-06-24 17:33:54'),(313,'1517207781263_d33acb19-b871-4c8b-9574-1ac175a04b59.jpg',89,100,1,NULL,NULL,'2018-06-24 17:33:55','2018-06-24 17:33:55'),(314,'1517218069049_4f180b9a-38fd-4311-a76c-6426a2497d2a.jpg',90,100,1,NULL,NULL,'2018-06-24 17:33:57','2018-06-24 17:33:57'),(315,'1517218100533_742c9de0-a24b-4597-9e7a-66cec5364d07.jpg',90,100,1,NULL,NULL,'2018-06-24 17:33:58','2018-06-24 17:33:58'),(316,'1517218136158_20f8cb60-be29-4d34-a000-3454430058d2.jpg',90,100,1,NULL,NULL,'2018-06-24 17:33:58','2018-06-24 17:33:58'),(317,'1517139341989_45faf138-9c0b-4690-9322-51ced6cb890a.jpg',91,100,1,NULL,NULL,'2018-06-24 17:34:00','2018-06-24 17:34:00'),(318,'1517139276854_b7eaa7e0-1309-4a02-9008-89f6f9ea0650.jpg',91,100,1,NULL,NULL,'2018-06-24 17:34:01','2018-06-24 17:34:01'),(319,'1517139255782_deeaa5fe-742a-40e6-a192-326ee0e09d76.jpg',91,100,1,NULL,NULL,'2018-06-24 17:34:01','2018-06-24 17:34:01'),(320,'1517139314300_1766f2d8-e5b5-42cd-954e-408ba398e8e1.jpg',91,100,1,NULL,NULL,'2018-06-24 17:34:02','2018-06-24 17:34:02'),(321,'1517108782735_f69bae8b-2f1f-4b4e-a787-71033d7b8c03.jpg',92,100,1,NULL,NULL,'2018-06-24 17:34:04','2018-06-24 17:34:04'),(322,'1517108796671_984dc3e6-a243-4ef3-bb04-1ce7ee453ee7.jpg',92,100,1,NULL,NULL,'2018-06-24 17:34:05','2018-06-24 17:34:05'),(323,'1517108819846_00a9687f-1f76-4af5-96a6-edea1a78d5d9.jpg',92,100,1,NULL,NULL,'2018-06-24 17:34:05','2018-06-24 17:34:05'),(324,'1517108835293_a2480b68-6409-429d-b71c-2e5528f6c6e8.jpg',92,100,1,NULL,NULL,'2018-06-24 17:34:06','2018-06-24 17:34:06'),(325,'1517592981720_b9c69806-3059-4e63-b8d3-2382be366bcc.jpg',93,100,1,NULL,NULL,'2018-06-24 17:34:08','2018-06-24 17:34:08'),(326,'1517593021668_39bacbd0-cabd-4d34-b601-626d35af98be.jpg',93,100,1,NULL,NULL,'2018-06-24 17:34:08','2018-06-24 17:34:08'),(327,'1517592900441_8689df41-c680-44bb-9405-101a8c2c25d8.jpg',93,100,1,NULL,NULL,'2018-06-24 17:34:09','2018-06-24 17:34:09'),(328,'1517107058409_506fbe16-14c0-4c85-8b55-57aabe12e232.jpg',94,100,1,NULL,NULL,'2018-06-24 17:34:11','2018-06-24 17:34:11'),(329,'1517107109636_76e664f1-aa50-440e-8251-fc6b9b7cd58b.jpg',94,100,1,NULL,NULL,'2018-06-24 17:34:11','2018-06-24 17:34:11'),(330,'1517107128309_ae776dfb-8af2-4165-a2c1-1b37a0d16127.jpg',94,100,1,NULL,NULL,'2018-06-24 17:34:12','2018-06-24 17:34:12'),(331,'1517107175996_03e3b885-c3d4-4199-a397-2771e243e646.jpg',94,100,1,NULL,NULL,'2018-06-24 17:34:12','2018-06-24 17:34:12'),(332,'1517362343157_44b47d93-7b36-420b-8e96-701375f85bb7.jpg',95,100,1,NULL,NULL,'2018-06-24 17:34:15','2018-06-24 17:34:15'),(333,'1517362371681_af5174ba-a04c-4f61-af9a-6137931152e0.jpg',95,100,1,NULL,NULL,'2018-06-24 17:34:15','2018-06-24 17:34:15'),(334,'1517362388184_53b08bc8-20ca-44db-9f0a-2330024c633d.jpg',95,100,1,NULL,NULL,'2018-06-24 17:34:16','2018-06-24 17:34:16'),(335,'1517362325900_1f6ebceb-ea8a-42d2-a006-f76c9cd3da0c.jpg',95,100,1,NULL,NULL,'2018-06-24 17:34:16','2018-06-24 17:34:16'),(336,'1517362873205_536c52d9-19b4-4c0e-97bd-c44c101815f9.jpg',96,100,1,NULL,NULL,'2018-06-24 17:34:18','2018-06-24 17:34:18'),(337,'1517362899497_0d00aefe-ff4a-4954-bd6f-dfd210719d25.jpg',96,100,1,NULL,NULL,'2018-06-24 17:34:19','2018-06-24 17:34:19'),(338,'1517362944163_e4a636af-0042-4c07-8f00-97bfc691231b.jpg',96,100,1,NULL,NULL,'2018-06-24 17:34:20','2018-06-24 17:34:20'),(339,'1517729965096_7fc55357-a275-4273-8f11-de6e7a9346d9.jpg',97,100,1,NULL,NULL,'2018-06-24 17:34:22','2018-06-24 17:34:22'),(340,'1517730030778_1e4ddcfe-1800-4456-986c-6d7c87af737c.jpg',97,100,1,NULL,NULL,'2018-06-24 17:34:22','2018-06-24 17:34:22'),(341,'1517729902545_f398d950-00a6-4467-8339-fd39becc78ac.jpg',97,100,1,NULL,NULL,'2018-06-24 17:34:23','2018-06-24 17:34:23'),(342,'1517364230402_a689fe64-27c2-47b4-9af8-18b18bf963fa.jpg',98,100,1,NULL,NULL,'2018-06-24 17:34:25','2018-06-24 17:34:25'),(343,'1517364249373_ba22b228-0d50-443d-9c97-e460fb6a50d8.jpg',98,100,1,NULL,NULL,'2018-06-24 17:34:25','2018-06-24 17:34:25'),(344,'1517364266711_f404b244-6fab-4f90-b995-35c8088acd8c.jpg',98,100,1,NULL,NULL,'2018-06-24 17:34:26','2018-06-24 17:34:26'),(345,'1517133125641_41bbab78-087d-4b65-8372-9fab6995d6b3.jpg',99,100,1,NULL,NULL,'2018-06-24 17:34:28','2018-06-24 17:34:28'),(346,'1517133052226_b8839f05-9b85-4727-a076-4e5693eba8ee.jpg',99,100,1,NULL,NULL,'2018-06-24 17:34:28','2018-06-24 17:34:28'),(347,'1517133079645_034c507a-b922-4576-84da-aac8ad92eeca.jpg',99,100,1,NULL,NULL,'2018-06-24 17:34:29','2018-06-24 17:34:29'),(348,'1517133102449_330d5100-4126-4501-af13-04b40ee1526a.jpg',99,100,1,NULL,NULL,'2018-06-24 17:34:29','2018-06-24 17:34:29');

/*Table structure for table `ad_news` */

DROP TABLE IF EXISTS `ad_news`;

CREATE TABLE `ad_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL COMMENT 'Tiêu đề bài viết',
  `alttitle` varchar(255) DEFAULT NULL COMMENT 'Tiêu đề rút gọn',
  `header` longtext COMMENT 'Trích yếu',
  `body` longtext COMMENT 'Nội dung bài viết trên web',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn ảnh đại diện',
  `attributes` bigint(20) DEFAULT NULL COMMENT 'Thuộc tính của bài viết: khuyến mại, ',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `published_time` datetime DEFAULT NULL COMMENT 'Thời gian xuất bản',
  `expiredate_time` datetime DEFAULT NULL COMMENT 'Thời gian kết thúc bản tin',
  `meta` varchar(255) DEFAULT NULL COMMENT 'Nội dung meta',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'Nội dung keywords',
  `author` varchar(255) DEFAULT NULL COMMENT 'Tác giả',
  `is_active` bigint(20) NOT NULL DEFAULT '0' COMMENT '0 ẩn, 1 hiện',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hiển thị trên trang chủ (0- ko hiển thị, 1- hiển thị)',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `category_id` bigint(20) DEFAULT NULL COMMENT 'Id của danh mục tin tức',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`),
  CONSTRAINT `ad_news_created_by_sf_guard_user_id` FOREIGN KEY (`created_by`) REFERENCES `sf_guard_user` (`id`),
  CONSTRAINT `ad_news_updated_by_sf_guard_user_id` FOREIGN KEY (`updated_by`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_news` */

/*Table structure for table `ad_personal` */

DROP TABLE IF EXISTS `ad_personal`;

CREATE TABLE `ad_personal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL COMMENT 'Ho ten nguoi gop y',
  `birthday` datetime DEFAULT NULL COMMENT 'Ngày sinh',
  `sex` varchar(25) DEFAULT NULL COMMENT 'Giới tính',
  `phone_number` varchar(25) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `introduction` text,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `ad_personal` */

/*Table structure for table `ad_product` */

DROP TABLE IF EXISTS `ad_product`;

CREATE TABLE `ad_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên chuyên mục sản phẩm',
  `description` longtext COMMENT 'Mô tả chuyên mục',
  `content` longtext COMMENT 'Nội dung sản phẩm',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `lang` varchar(10) DEFAULT NULL COMMENT 'Đa ngôn ngữ',
  `category_id` bigint(20) DEFAULT NULL COMMENT 'Danh mục cha',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `meta_keyword` varchar(255) DEFAULT NULL COMMENT 'keyword',
  `meta_description` varchar(255) DEFAULT NULL COMMENT 'meta description',
  `price` bigint(20) DEFAULT NULL COMMENT 'giá',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`),
  CONSTRAINT `ad_product_created_by_sf_guard_user_id` FOREIGN KEY (`created_by`) REFERENCES `sf_guard_user` (`id`),
  CONSTRAINT `ad_product_updated_by_sf_guard_user_id` FOREIGN KEY (`updated_by`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_product` */

/*Table structure for table `ad_product_category` */

DROP TABLE IF EXISTS `ad_product_category`;

CREATE TABLE `ad_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên chuyên mục sản phẩm',
  `description` longtext COMMENT 'Mô tả chuyên mục',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện chuyên mục',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `lang` varchar(10) DEFAULT NULL COMMENT 'Đa ngôn ngữ',
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'Danh mục cha',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `meta_keyword` varchar(255) DEFAULT NULL COMMENT 'keyword',
  `meta_description` varchar(255) DEFAULT NULL COMMENT 'meta description',
  `link` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn của chuyên mục (nếu có)',
  `level` bigint(20) DEFAULT '0' COMMENT 'phân cấp chuyên mục',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`),
  CONSTRAINT `ad_product_category_created_by_sf_guard_user_id` FOREIGN KEY (`created_by`) REFERENCES `sf_guard_user` (`id`),
  CONSTRAINT `ad_product_category_updated_by_sf_guard_user_id` FOREIGN KEY (`updated_by`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_product_category` */

/*Table structure for table `ad_report_hitcounter` */

DROP TABLE IF EXISTS `ad_report_hitcounter`;

CREATE TABLE `ad_report_hitcounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT '0' COMMENT 'chuyen muc thong ke',
  `hitcounter` bigint(20) DEFAULT '0' COMMENT 'Tong so luot xem',
  `parent_id` bigint(2) DEFAULT '0' COMMENT 'phan biet chuyen muc cha con',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `ad_report_hitcounter` */

insert  into `ad_report_hitcounter`(`id`,`category_id`,`hitcounter`,`parent_id`) values (1,11,47,NULL),(2,12,76,NULL),(3,18,99,NULL),(4,25,26,11),(5,50,12,12),(8,11,26,0),(9,12,12,0);

/*Table structure for table `ad_report_total_record` */

DROP TABLE IF EXISTS `ad_report_total_record`;

CREATE TABLE `ad_report_total_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT '0' COMMENT 'chuyen muc thong ke',
  `total_record` bigint(20) DEFAULT '0' COMMENT 'tong so ban ghi trong chuyen muc',
  `date_time` datetime DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT '0' COMMENT 'Phan biet chuyen muc cha con',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `ad_report_total_record` */

insert  into `ad_report_total_record`(`id`,`category_id`,`total_record`,`date_time`,`parent_id`) values (1,11,1,'2015-09-10 00:00:00',NULL),(2,12,1,'2015-09-10 00:00:00',NULL),(3,12,1,'2015-09-11 00:00:00',NULL),(4,12,1,'2015-09-11 14:34:20',NULL),(5,18,1,'2015-06-21 00:00:00',NULL),(6,18,1,'2015-09-11 10:30:13',NULL),(7,18,1,'2015-09-11 16:28:30',NULL),(8,18,2,'2015-09-21 00:00:00',NULL),(9,25,1,'2015-09-11 00:00:00',11),(10,50,1,'2015-09-11 00:00:00',12),(16,11,1,'2015-09-11 00:00:00',0),(17,12,1,'2015-09-11 00:00:00',0);

/*Table structure for table `ad_seo` */

DROP TABLE IF EXISTS `ad_seo`;

CREATE TABLE `ad_seo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Tiêu đề',
  `description` text,
  `keyword` text,
  `image` varchar(255) DEFAULT NULL COMMENT 'Ảnh khi share lên FB',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`),
  CONSTRAINT `ad_seo_created_by_sf_guard_user_id` FOREIGN KEY (`created_by`) REFERENCES `sf_guard_user` (`id`),
  CONSTRAINT `ad_seo_updated_by_sf_guard_user_id` FOREIGN KEY (`updated_by`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_seo` */

/*Table structure for table `ad_user_signin_lock` */

DROP TABLE IF EXISTS `ad_user_signin_lock`;

CREATE TABLE `ad_user_signin_lock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `created_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

/*Data for the table `ad_user_signin_lock` */

insert  into `ad_user_signin_lock`(`id`,`user_name`,`created_time`) values (2,'ninhpv',1438687738),(8,'ninhpv',1440726386),(9,'phamthuha',1441641540),(19,'congtacvien3',1441802355),(61,'admin1',1471063683),(62,'admin1',1471063694),(96,'admin1',1486353711),(95,'admin1',1486353674),(97,'admin1',1486353748),(98,'admin1',1486353809);

/*Table structure for table `ad_video` */

DROP TABLE IF EXISTS `ad_video`;

CREATE TABLE `ad_video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên video',
  `description` text NOT NULL COMMENT 'Giới thiệu video',
  `event_date` datetime NOT NULL COMMENT 'Ngày diễn ra sự kiện',
  `file_path` varchar(255) NOT NULL COMMENT 'Đường dẫn file',
  `extension` varchar(200) DEFAULT NULL COMMENT 'phần mở rộng của file',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: Chưa kích hoạt, 1: đã kích hoạt)',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái mặc định để hiển thị, 1: hiển thị, 0: không hiển thị. 1 là duy nhất',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện video',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `ad_video` */

insert  into `ad_video`(`id`,`name`,`description`,`event_date`,`file_path`,`extension`,`priority`,`is_active`,`is_default`,`lang`,`slug`,`image_path`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (11,'Hội nghị Khoa học 2013 - Đại học Thăng Long','','2015-09-11 00:00:00','55f240407956c.flv','flv',4,0,0,'vi','ha-tinh-que-minh','/3c/4a/a3/55f240407992b.jpg',13,15,'2015-09-11 09:45:20','2015-09-24 10:54:02'),(12,'Giới thiệu phòng tự học điện tử','','2015-09-11 00:00:00','55f2448b62171.flv','flv',6,0,0,'vi','neo-dau-ben-que','/9c/f9/99/55f2448b62640.jpg',13,15,'2015-09-11 10:03:42','2015-09-18 01:47:32'),(13,'OPEN DAY 2012','','2015-09-11 00:00:00','55f2472409f96.flv','flv',7,0,0,'vi','dieu-vi-dam-la-em','/63/77/76/55f247240a3c2.jpg',13,15,'2015-09-11 10:14:45','2015-09-24 10:54:06'),(14,'Miss Thăng Long 2012 (đêm chung khảo - phần thi dạ hội) ','','2015-09-11 00:00:00','55fa8ef8506ca.flv','flv',2,1,0,'vi','dai-hoi-vii-hoi-nha-bao-ha-tinh','/ae/09/9a/55f24961554b8.jpg',15,15,'2015-09-11 10:24:17','2015-09-18 01:48:42'),(16,'Chung kết Miss Thăng Long 2012- Opendancing ','','2015-09-10 00:00:00','55fb06970fd3b.flv','flv',3,1,0,'vi','hoi-nha-bao-ha-tinh-quang-tri-di-thuc-te','/4f/fc/c4/55fb069710dac.jpg',15,15,'2015-09-18 00:35:42','2015-09-21 07:47:19'),(18,'Thư viện Đại học Thăng Long','','2015-06-17 00:00:00','55fb117f5d609.flv','flv',1,1,1,'vi','phong-su-chao-mung-dai-hoi-vii-hnb','/d7/77/7d/55fb117f65c46.jpg',15,15,'2015-09-18 02:16:20','2015-09-18 02:16:24');

/*Table structure for table `ad_youtube` */

DROP TABLE IF EXISTS `ad_youtube`;

CREATE TABLE `ad_youtube` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên video',
  `description` text NOT NULL COMMENT 'mô tả',
  `body` longtext COMMENT 'Nội dung bài viết trên web',
  `link` varchar(255) NOT NULL COMMENT 'link youtube',
  `image` varchar(255) NOT NULL COMMENT 'ảnh đại diện',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ad_youtube` */

insert  into `ad_youtube`(`id`,`name`,`description`,`body`,`link`,`image`,`priority`,`is_active`,`created_at`,`updated_at`) values (1,'Những chiếc eke','Những chiếc eke','<p>123456</p>','https://www.youtube.com/watch?v=jxWVS2ASQaM','/17/d6/61/5a588f72e6734.png',3,1,'2018-01-12 11:17:35','2018-01-12 11:35:30'),(2,'Nguyên vật liệu thi công','Tài liệu về abc','','https://www.youtube.com/watch?v=KE4I_W3jLuI','/69/28/86/5a58959f61d06.jpg',3,1,'2018-01-12 12:01:51','2018-01-12 12:01:51');

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL COMMENT 'Tên KH',
  `phone` varchar(255) DEFAULT NULL COMMENT 'SĐT',
  `email` varchar(255) DEFAULT NULL COMMENT 'email',
  `body` longtext COMMENT 'Nội dung bài viết trên web',
  `category_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `is_check` bigint(20) DEFAULT '0' COMMENT '0 chưa xử lý, 1 đang xử lý, 2 đã xử lý',
  `from_time` datetime DEFAULT NULL COMMENT 'Thời gian đặt phòng',
  `to_time` datetime DEFAULT NULL COMMENT 'Thời gian kết thúc đặt phòng',
  `number_person` bigint(20) DEFAULT NULL,
  `number_room` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `booking` */

insert  into `booking`(`id`,`full_name`,`phone`,`email`,`body`,`category_id`,`product_id`,`lang`,`is_check`,`from_time`,`to_time`,`number_person`,`number_room`,`created_at`,`updated_at`) values (1,'Bạch Quốc Dũng','0988103864','dungbq89@gmail.com',NULL,1,2,'',0,'1970-01-01 00:00:00','1970-01-01 00:00:00',5,2,'2017-07-19 04:26:20','2017-07-19 04:26:20'),(2,'234','234','234',NULL,1,2,'',0,'2017-07-21 00:00:00','2017-07-23 00:00:00',19,12,'2017-07-19 04:37:23','2017-07-19 04:37:23'),(3,'Bạch Anh Khang','0972241089','khangba@gmail.com',NULL,1,2,'',0,'2017-07-26 00:00:00','2017-07-20 00:00:00',18,13,'2017-07-19 05:33:09','2017-07-19 05:33:09'),(4,'Bạch Quốc Dũng','0988103864','dungbq89@gmail.com','',1,2,'vi',1,'2017-07-19 00:00:00','2017-07-29 00:00:00',17,12,'2017-07-19 05:35:01','2017-07-22 11:50:53'),(5,'Hoàng Ngọc Bích','0971778490','hoangbich@gmail.com',NULL,1,1,'',0,'2017-07-19 00:00:00','2017-07-20 00:00:00',2,1,'2017-07-19 05:37:33','2017-07-19 05:37:33'),(6,'Bạch Quốc Dũng','0988103864','dungbq89@gmail.com',NULL,1,1,'',0,'2017-07-20 00:00:00','2017-07-22 00:00:00',13,5,'2017-07-19 05:58:18','2017-07-19 05:58:18');

/*Table structure for table `parameter` */

DROP TABLE IF EXISTS `parameter`;

CREATE TABLE `parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên',
  `priority` bigint(20) DEFAULT NULL,
  `cat_id` bigint(20) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`),
  CONSTRAINT `parameter_created_by_sf_guard_user_id` FOREIGN KEY (`created_by`) REFERENCES `sf_guard_user` (`id`),
  CONSTRAINT `parameter_updated_by_sf_guard_user_id` FOREIGN KEY (`updated_by`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `parameter` */

insert  into `parameter`(`id`,`name`,`priority`,`cat_id`,`is_active`,`lang`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'Beds',1,2,1,'en',1,1,'2017-07-02 13:43:32','2017-07-02 13:43:32');

/*Table structure for table `parameter_category` */

DROP TABLE IF EXISTS `parameter_category`;

CREATE TABLE `parameter_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên',
  `priority` bigint(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`),
  CONSTRAINT `parameter_category_created_by_sf_guard_user_id` FOREIGN KEY (`created_by`) REFERENCES `sf_guard_user` (`id`),
  CONSTRAINT `parameter_category_updated_by_sf_guard_user_id` FOREIGN KEY (`updated_by`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `parameter_category` */

insert  into `parameter_category`(`id`,`name`,`priority`,`is_active`,`lang`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'Interior Features',1,1,'vi',NULL,1,'2017-07-02 10:24:24','2017-07-02 10:32:55'),(2,'Interior Features',1,1,'en',1,1,'2017-07-02 13:37:35','2017-07-02 13:37:35'),(3,'General Facilities',1,1,'vi',1,1,'2017-07-02 16:05:29','2017-07-02 16:05:29'),(4,'Services Included',1,1,'vi',1,1,'2017-07-02 16:05:49','2017-07-02 16:05:49');

/*Table structure for table `send_mail` */

DROP TABLE IF EXISTS `send_mail`;

CREATE TABLE `send_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL COMMENT 'email',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `send_mail` */

/*Table structure for table `sessions_admin` */

DROP TABLE IF EXISTS `sessions_admin`;

CREATE TABLE `sessions_admin` (
  `sess_id` varchar(64) NOT NULL DEFAULT '',
  `sess_data` longtext NOT NULL,
  `sess_time` bigint(20) NOT NULL,
  `sess_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sessions_admin` */

insert  into `sessions_admin`(`sess_id`,`sess_data`,`sess_time`,`sess_userid`) values ('e4vousvms03arfr6cs6l4d56r2','',1529742761,NULL),('u5ido63dptk3kmi8fco9fdlni0','',1529224373,NULL),('74ppeaq4r6blhbq7vfhac7sau1','',1529224875,NULL),('ug4a093ev4rte8vodqvn7ihi55','',1529246816,NULL),('d0uiih545oebhvn6dorimq6q91','',1529246825,NULL),('12i5iec4nc8l7lf0clbev0o5e0','symfony/user/sfUser/lastRequest|i:1529851650;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:2:{s:30:\"symfony/user/sfUser/attributes\";a:3:{s:9:\"IpAddress\";s:3:\"::1\";s:9:\"UserAgent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0\";s:18:\"default_massage_id\";s:1:\"5\";}s:12:\"admin_module\";a:2:{s:14:\"adMassage.page\";i:1;s:14:\"adMassage.sort\";a:2:{i:0;N;i:1;N;}}}symfony/user/sfUser/culture|s:2:\"vi\";securimage_code_value|a:1:{s:7:\"default\";s:2:\"d7\";}securimage_code_ctime|a:1:{s:7:\"default\";i:1529851650;}',1529851650,0),('u818q0cdqqs1ajc9jsqitorbj1','',1529851255,NULL),('eab5l73n2md5s8amu9o41p5vq0','',1529830281,NULL);

/*Table structure for table `sf_guard_forgot_password` */

DROP TABLE IF EXISTS `sf_guard_forgot_password`;

CREATE TABLE `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sf_guard_forgot_password` */

/*Table structure for table `sf_guard_group` */

DROP TABLE IF EXISTS `sf_guard_group`;

CREATE TABLE `sf_guard_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sf_guard_group` */

/*Table structure for table `sf_guard_group_permission` */

DROP TABLE IF EXISTS `sf_guard_group_permission`;

CREATE TABLE `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sf_guard_group_permission` */

/*Table structure for table `sf_guard_permission` */

DROP TABLE IF EXISTS `sf_guard_permission`;

CREATE TABLE `sf_guard_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `types` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Loại quyền: 0 - Quyền hệ thống, 1 - Quyền nội dung. Nếu là quyền hệ thống thì chỉ đọc mà không được sửa',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `sf_guard_permission` */

insert  into `sf_guard_permission`(`id`,`name`,`description`,`types`,`created_at`,`updated_at`) values (1,'admin','Quyền quản trị hệ thống',0,'2013-08-07 09:38:38','2013-11-22 10:27:58'),(17,'news_editor','',0,'2015-05-27 17:37:08','2015-05-27 17:37:08'),(18,'news_approved','',0,'2015-05-27 17:38:26','2015-05-27 17:38:26'),(19,'news_public','',0,'2015-05-27 17:38:43','2015-05-27 17:38:43'),(20,'news_tintucsukien','',1,'2015-05-27 17:39:27','2015-05-27 17:39:27'),(21,'Bài đăng CTV','',1,'2015-09-09 16:03:59','2015-09-09 16:03:59'),(22,'Quyền tạo mới','',0,'2015-09-10 04:55:16','2015-09-10 04:55:16'),(23,'Bài CTV','Quyền dành cho thành viên truy cập và gửi, xóa bài trong chuyên mục Bài CTV',1,'2015-09-10 04:58:26','2015-09-10 04:58:26'),(24,'subAdmin','Nhóm quyền tạo video, album, quảng cáo',0,'2015-09-10 22:05:49','2015-09-10 22:05:49');

/*Table structure for table `sf_guard_remember_key` */

DROP TABLE IF EXISTS `sf_guard_remember_key`;

CREATE TABLE `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sf_guard_remember_key` */

/*Table structure for table `sf_guard_user` */

DROP TABLE IF EXISTS `sf_guard_user`;

CREATE TABLE `sf_guard_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `algorithm` varchar(255) NOT NULL DEFAULT 'sha1',
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `pass_update_at` datetime DEFAULT NULL,
  `is_lock_signin` tinyint(1) DEFAULT NULL,
  `locked_time` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email_address` (`email_address`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `sf_guard_user` */

insert  into `sf_guard_user`(`id`,`first_name`,`last_name`,`phone`,`email_address`,`username`,`algorithm`,`salt`,`password`,`is_active`,`is_super_admin`,`last_login`,`pass_update_at`,`is_lock_signin`,`locked_time`,`created_at`,`updated_at`) values (1,'huy','nguyen','0988103864','huync2@gmail.com','admin','sha1','fd5d0f46cf9f4c45d58bcf1dc68d6856','9fbb8a236753c26b2a3bd1307119ad78ff34cdd6',1,1,'2018-06-24 10:51:21','2017-07-11 15:34:22',0,NULL,'2014-04-19 08:29:58','2018-06-24 10:51:21'),(22,'dung','bach','0988103864','dungbq89@gmail.com','dungbq','sha1','a612f7aa974cb0d6b25fb956d45ebf6a','bf77212c171f90690e6b22037abf71e7bf65f864',1,1,'2017-07-30 05:26:09','2017-07-02 04:39:20',0,NULL,'2016-06-20 15:23:34','2017-07-30 05:26:09'),(23,'admin1','admin','0972636751','mkt.nehob@gmail.com','admin1','sha1','73c49e557250827bfc5275dff63b9573','e0a000e6aaf365333c357716022815f8b5f0f811',1,0,'2016-08-13 09:24:55','2017-02-13 11:05:20',0,NULL,'2016-08-06 07:28:41','2017-02-13 11:05:20'),(24,'admin2',NULL,NULL,NULL,'admin2','sha1','aa','f9ca1d887d492f27729406b9081b52ce5beb2578',1,1,'2017-07-02 09:37:39','2017-07-02 09:36:37',NULL,NULL,'2017-07-02 09:36:43','2017-07-02 09:37:40'),(25,'user1','user1','0988103864','abc@123.vn','user1','sha1','e4d9ea9e5dc4676f838c9f21cbce9417','574e15c993d63a1b337796c6aa2b93d6bf76d64d',1,0,NULL,NULL,0,NULL,'2017-07-30 05:34:30','2017-07-30 05:34:30');

/*Table structure for table `sf_guard_user_group` */

DROP TABLE IF EXISTS `sf_guard_user_group`;

CREATE TABLE `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sf_guard_user_group` */

/*Table structure for table `sf_guard_user_permission` */

DROP TABLE IF EXISTS `sf_guard_user_permission`;

CREATE TABLE `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sf_guard_user_permission` */

insert  into `sf_guard_user_permission`(`user_id`,`permission_id`,`created_at`,`updated_at`) values (1,1,'2017-07-02 04:40:33','2017-07-02 04:40:33'),(1,17,'2017-07-02 04:40:35','2017-07-02 04:40:35'),(1,18,'2017-07-02 04:40:36','2017-07-02 04:40:36'),(1,19,'2017-07-02 04:40:37','2017-07-02 04:40:37'),(1,20,'2017-07-02 04:40:38','2017-07-02 04:40:38'),(1,21,'2017-07-02 04:40:39','2017-07-02 04:40:39'),(1,22,'2017-07-02 04:40:40','2017-07-02 04:40:40'),(1,23,'2017-07-02 04:40:41','2017-07-02 04:40:41'),(2,17,'2015-09-07 23:02:11','2015-09-07 23:02:11'),(2,18,'2015-09-07 23:02:11','2015-09-07 23:02:11'),(2,19,'2015-09-07 23:02:11','2015-09-07 23:02:11'),(2,20,'2015-09-07 23:02:11','2015-09-07 23:02:11'),(2,21,'2015-09-09 16:03:59','2015-09-09 16:03:59'),(2,22,'2015-09-10 04:55:17','2015-09-10 04:55:17'),(2,23,'2015-09-10 04:58:26','2015-09-10 04:58:26'),(3,17,'2015-09-07 23:09:18','2015-09-07 23:09:18'),(3,18,'2015-09-07 23:09:18','2015-09-07 23:09:18'),(3,19,'2015-09-07 23:09:18','2015-09-07 23:09:18'),(3,20,'2015-09-07 23:09:18','2015-09-07 23:09:18'),(3,21,'2015-09-09 16:03:59','2015-09-09 16:03:59'),(3,22,'2015-09-10 04:55:17','2015-09-10 04:55:17'),(3,23,'2015-09-10 04:58:26','2015-09-10 04:58:26'),(4,17,'2015-09-10 22:07:26','2015-09-10 22:07:26'),(4,18,'2015-09-10 22:07:26','2015-09-10 22:07:26'),(4,19,'2015-09-10 22:07:27','2015-09-10 22:07:27'),(4,20,'2015-09-10 22:07:27','2015-09-10 22:07:27'),(4,21,'2015-09-10 22:07:26','2015-09-10 22:07:26'),(4,22,'2015-09-10 22:07:27','2015-09-10 22:07:27'),(4,23,'2015-09-10 22:07:26','2015-09-10 22:07:26'),(4,24,'2015-09-10 22:07:27','2015-09-10 22:07:27'),(5,17,'2015-09-09 09:47:31','2015-09-09 09:47:31'),(5,18,'2015-09-09 09:47:30','2015-09-09 09:47:30'),(6,17,'2015-09-17 06:35:13','2015-09-17 06:35:13'),(6,22,'2015-09-17 06:35:13','2015-09-17 06:35:13'),(7,18,'2015-09-10 05:45:58','2015-09-10 05:45:58'),(7,21,'2015-09-10 05:45:58','2015-09-10 05:45:58'),(7,22,'2015-09-10 05:45:58','2015-09-10 05:45:58'),(7,23,'2015-09-10 05:45:58','2015-09-10 05:45:58'),(8,19,'2015-09-10 05:59:44','2015-09-10 05:59:44'),(8,21,'2015-09-10 05:59:44','2015-09-10 05:59:44'),(8,22,'2015-09-10 05:59:44','2015-09-10 05:59:44'),(8,23,'2015-09-10 05:59:44','2015-09-10 05:59:44'),(9,17,'2015-09-10 06:07:35','2015-09-10 06:07:35'),(9,18,'2015-09-10 06:07:35','2015-09-10 06:07:35'),(9,23,'2015-09-10 06:07:35','2015-09-10 06:07:35'),(10,17,'2015-09-10 06:17:45','2015-09-10 06:17:45'),(10,19,'2015-09-10 06:17:46','2015-09-10 06:17:46'),(10,23,'2015-09-10 06:17:45','2015-09-10 06:17:45'),(11,18,'2015-09-10 06:22:45','2015-09-10 06:22:45'),(11,19,'2015-09-10 06:22:45','2015-09-10 06:22:45'),(11,23,'2015-09-10 06:22:45','2015-09-10 06:22:45'),(12,17,'2015-09-10 06:26:16','2015-09-10 06:26:16'),(12,18,'2015-09-10 06:26:16','2015-09-10 06:26:16'),(12,19,'2015-09-10 06:26:16','2015-09-10 06:26:16'),(12,23,'2015-09-10 06:26:16','2015-09-10 06:26:16'),(13,1,'2015-09-10 10:01:33','2015-09-10 10:01:33'),(13,17,'2015-09-10 10:01:34','2015-09-10 10:01:34'),(13,18,'2015-09-10 10:01:34','2015-09-10 10:01:34'),(13,19,'2015-09-10 10:01:35','2015-09-10 10:01:35'),(13,20,'2015-09-10 10:01:35','2015-09-10 10:01:35'),(13,21,'2015-09-10 10:01:33','2015-09-10 10:01:33'),(13,22,'2015-09-10 10:01:35','2015-09-10 10:01:35'),(13,23,'2015-09-10 10:01:33','2015-09-10 10:01:33'),(14,1,'2015-09-10 14:32:55','2015-09-10 14:32:55'),(14,17,'2015-09-10 14:32:56','2015-09-10 14:32:56'),(14,18,'2015-09-10 14:32:56','2015-09-10 14:32:56'),(14,19,'2015-09-10 14:32:56','2015-09-10 14:32:56'),(14,20,'2015-09-10 14:32:57','2015-09-10 14:32:57'),(14,21,'2015-09-10 14:32:56','2015-09-10 14:32:56'),(14,22,'2015-09-10 14:32:57','2015-09-10 14:32:57'),(14,23,'2015-09-10 14:32:56','2015-09-10 14:32:56'),(15,17,'2015-10-09 08:50:31','2015-10-09 08:50:31'),(15,18,'2015-10-09 08:50:31','2015-10-09 08:50:31'),(15,19,'2015-10-09 08:50:31','2015-10-09 08:50:31'),(15,20,'2015-10-09 08:50:31','2015-10-09 08:50:31'),(15,1,'2015-10-09 08:50:31','2015-10-09 08:50:31'),(16,17,'2015-09-10 15:50:44','2015-09-10 15:50:44'),(16,20,'2015-09-10 15:50:45','2015-09-10 15:50:45'),(16,23,'2015-09-10 15:50:44','2015-09-10 15:50:44'),(17,17,'2015-10-10 15:45:54','2015-10-10 15:45:54'),(17,20,'2015-10-10 15:45:54','2015-10-10 15:45:54'),(18,17,'2015-09-11 16:54:18','2015-09-11 16:54:18'),(18,20,'2015-09-11 16:54:18','2015-09-11 16:54:18'),(19,17,'2015-10-05 10:35:13','2015-10-05 10:35:13'),(19,1,'2015-10-05 10:35:13','2015-10-05 10:35:13'),(19,18,'2015-10-05 10:35:13','2015-10-05 10:35:13'),(19,19,'2015-10-05 10:35:13','2015-10-05 10:35:13'),(19,20,'2015-10-05 10:35:13','2015-10-05 10:35:13'),(20,1,'2015-10-27 10:18:17','2015-10-27 10:18:17'),(21,1,'2015-10-27 10:19:17','2015-10-27 10:19:17'),(23,1,'2017-02-13 11:05:20','2017-02-13 11:05:20'),(1,24,'2017-07-02 04:40:42','2017-07-02 04:40:42'),(25,1,'2017-07-30 05:34:30','2017-07-30 05:34:30');

/*Table structure for table `vtp_category` */

DROP TABLE IF EXISTS `vtp_category`;

CREATE TABLE `vtp_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên chuyên mục',
  `description` longtext COMMENT 'Mô tả chuyên mục',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện chuyên mục',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `lang` varchar(10) DEFAULT NULL COMMENT 'Đa ngôn ngữ',
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'Danh mục cha',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `link` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn của chuyên mục (nếu có)',
  `level` bigint(20) DEFAULT '0' COMMENT 'phân cấp chuyên mục',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `type` varchar(20) DEFAULT NULL COMMENT 'N=Tin tức, S=Dịch vụ',
  `is_detail` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'có xem bài chi tiết hay không',
  `portal_id` bigint(20) DEFAULT NULL COMMENT 'Portal cần hiển thị nội dung, được quy ước trong file cấu hình (Khách hàng cá nhân / Khách hàng doanh nghiệp)',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `parent_id_idx` (`parent_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `vtp_category` */

insert  into `vtp_category`(`id`,`name`,`description`,`image_path`,`is_active`,`lang`,`parent_id`,`slug`,`link`,`level`,`priority`,`type`,`is_detail`,`portal_id`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (4,'Tin tức','','/3d/e9/93/595e38ee7de6b.jpg',1,'vi',NULL,'tin-tuc','',0,1,'N',0,0,NULL,1,'2016-09-15 23:34:56','2017-07-06 20:19:42'),(5,'Tin tức 2','Tin tức 2','/67/06/66/595e38fda6396.jpg',1,'vi',NULL,'tin-tuc-2','',0,2,'N',0,0,NULL,1,'2017-07-06 20:19:28','2017-07-06 20:19:57');

/*Table structure for table `vtp_category_permission` */

DROP TABLE IF EXISTS `vtp_category_permission`;

CREATE TABLE `vtp_category_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL COMMENT 'Id của danh mục tin tức',
  `permission_id` bigint(20) DEFAULT NULL COMMENT 'Id quyền',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `vtp_category_permission` */

insert  into `vtp_category_permission`(`id`,`category_id`,`permission_id`) values (8,4,23),(9,4,21),(10,4,20);

/*Table structure for table `vtp_menu` */

DROP TABLE IF EXISTS `vtp_menu`;

CREATE TABLE `vtp_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Tên menu',
  `description` longtext COMMENT 'Mô tả menu',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện menu',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)',
  `lang` varchar(10) DEFAULT NULL COMMENT 'Đa ngôn ngữ',
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'Menu cấp cha',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `link` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn của Menu (nếu có)',
  `level` bigint(20) DEFAULT '0' COMMENT 'phân cấp Menu',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `is_detail` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'có xem bài chi tiết hay không',
  `type` bigint(20) DEFAULT '0' COMMENT '0-menu chính, 1-Menu footer',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `parent_id_idx` (`parent_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `vtp_menu` */

insert  into `vtp_menu`(`id`,`name`,`description`,`image_path`,`is_active`,`lang`,`parent_id`,`slug`,`link`,`level`,`priority`,`is_detail`,`type`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'Trang chủ','',NULL,1,'vi',NULL,'trang-chu','@homepage',0,1,0,0,1,1,'2016-03-27 06:06:41','2016-03-27 17:47:45'),(3,'Sản phẩm','',NULL,1,'vi',NULL,'san-pham_rWYjk','@product_all',0,3,0,0,1,22,'2016-04-11 17:55:52','2016-09-16 00:07:51'),(5,'Tin tức','',NULL,1,'vi',NULL,'tin-tuc','@category_news?slug=tin-tuc',0,6,0,0,22,22,'2016-09-15 23:56:20','2016-09-15 23:56:20');

/*Table structure for table `vtp_products` */

DROP TABLE IF EXISTS `vtp_products`;

CREATE TABLE `vtp_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL COMMENT 'Tên sản phẩm',
  `product_code` varchar(100) DEFAULT NULL COMMENT 'Mã sản phẩm',
  `category_id` bigint(20) DEFAULT NULL COMMENT 'Chuyên mục sản phẩm',
  `price` bigint(20) DEFAULT NULL COMMENT 'Giá sản phẩm',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn file ảnh đại diện',
  `link` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn chi tiết trên viettel shop',
  `priority` bigint(20) DEFAULT '0' COMMENT 'Thứ tự hiển thị',
  `description` text COMMENT 'Mô tả về sản phẩm',
  `content` longtext COMMENT 'Nội dung bài viết',
  `comment` longtext COMMENT 'Nội dung đánh giá sản phẩm bài viết',
  `warranty_information` longtext COMMENT 'Thông tin bảo hành',
  `manufacturer` varchar(255) DEFAULT NULL COMMENT 'Hãng sản xuất',
  `accessories` varchar(255) DEFAULT NULL COMMENT 'Phụ kiện',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `portal_id` bigint(20) DEFAULT NULL COMMENT 'Portal cần hiển thị nội dung, được quy ước trong file cấu hình (Khách hàng cá nhân / Khách hàng doanh nghiệp)',
  `lang` varchar(10) NOT NULL COMMENT 'Đa ngôn ngữ',
  `meta` varchar(255) DEFAULT NULL COMMENT 'Nội dung meta',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'Nội dung keywords',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_home` tinyint(4) DEFAULT NULL,
  `price_promotion` int(10) DEFAULT NULL COMMENT 'Giá khuyến mại',
  `is_hot` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_name` (`product_name`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `product_code` (`product_code`),
  KEY `category_id_idx` (`category_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `vtp_products` */

insert  into `vtp_products`(`id`,`product_name`,`product_code`,`category_id`,`price`,`image_path`,`link`,`priority`,`description`,`content`,`comment`,`warranty_information`,`manufacturer`,`accessories`,`is_active`,`slug`,`portal_id`,`lang`,`meta`,`keywords`,`created_by`,`updated_by`,`created_at`,`updated_at`,`is_home`,`price_promotion`,`is_hot`) values (1,'12312',NULL,1,123,'/1b/01/11/5958ba320979a.jpg','123',0,'123','<p>123</p>','','','','',1,'12312',0,'vi','123','123',1,1,'2017-07-02 16:17:38','2017-07-02 16:17:38',1,123,1),(2,'Nehob 3',NULL,1,100000,'/5b/50/05/596b2ec8724f2.jpg','',0,'I booked my room for three days but was so pleased with the friendly and accommodating staff, especially the manager, that I booked an additional three weeks. The hotel is situated in a narrow alley with an incredible mix of shops, restaurants','<p><span style=\"font-size:12px\"><em><span style=\"color:rgb(78, 78, 78); font-family:mallory,helvetica neue,helvetica,arial,sans-serif\">I booked my room for three days but was so pleased with the friendly and accommodating staff, especially the manager, that I booked an additional three weeks. The hotel is situated in a narrow alley with an incredible mix of shops, restaurants</span></em></span></p>','','','','',1,'nehob-3',0,'vi','','',22,22,'2017-07-16 11:15:53','2017-07-16 11:15:54',1,1200000,0);

/*Table structure for table `vtp_products_category` */

DROP TABLE IF EXISTS `vtp_products_category`;

CREATE TABLE `vtp_products_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Tên chuyên mục',
  `image_path` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn file',
  `link` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn chi tiết trên viettel shop',
  `priority` bigint(20) DEFAULT '0' COMMENT 'Thứ tự hiển thị',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng',
  `lang` varchar(10) DEFAULT NULL COMMENT 'Đa ngôn ngữ',
  `description` text COMMENT 'Mô tả về sản phẩm',
  `slug` varchar(255) NOT NULL COMMENT 'chuyển đổi url',
  `portal_id` bigint(20) DEFAULT NULL COMMENT 'Portal cần hiển thị nội dung, được quy ước trong file cấu hình (Khách hàng cá nhân / Khách hàng doanh nghiệp)',
  `meta` varchar(255) DEFAULT NULL COMMENT 'Nội dung meta',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'Nội dung keywords',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_home` tinyint(1) DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `show_banner` tinyint(2) DEFAULT '0' COMMENT 'Hiển thị banner',
  `address` varchar(255) DEFAULT NULL COMMENT 'address',
  `lat` varchar(255) DEFAULT NULL COMMENT 'lat',
  `log` varchar(255) DEFAULT NULL COMMENT 'long',
  `parameter_ids` varbinary(255) DEFAULT NULL COMMENT 'parameter_ids',
  `list_image` bigint(25) DEFAULT NULL COMMENT 'list_image',
  `email` varchar(1000) DEFAULT NULL COMMENT 'email',
  `msisdn` varchar(255) DEFAULT NULL COMMENT 'msisdn',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vtp_products_category` */

insert  into `vtp_products_category`(`id`,`name`,`image_path`,`link`,`priority`,`is_active`,`lang`,`description`,`slug`,`portal_id`,`meta`,`keywords`,`created_by`,`updated_by`,`created_at`,`updated_at`,`is_home`,`parent_id`,`level`,`show_banner`,`address`,`lat`,`log`,`parameter_ids`,`list_image`,`email`,`msisdn`) values (1,'NEWLAND 1','/0e/6d/d0/5958b16defb3a.jpg','',1,1,'vi','NEWLAND 1','newland-1',0,'NEWLAND 1','NEWLAND 1',1,1,'2017-07-02 15:40:14','2017-07-02 16:12:54',0,NULL,0,0,'123','123','','1,3',NULL,'123','123');

/*Table structure for table `vtp_products_image` */

DROP TABLE IF EXISTS `vtp_products_image`;

CREATE TABLE `vtp_products_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) NOT NULL COMMENT 'Đường dẫn file',
  `product_id` bigint(20) DEFAULT NULL COMMENT 'sản phẩm thiết bị',
  `extension` varchar(200) DEFAULT NULL COMMENT 'phần mở rộng của file',
  `priority` bigint(20) NOT NULL COMMENT 'Độ ưu tiên hiển thị',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id_idx` (`product_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vtp_products_image` */

insert  into `vtp_products_image`(`id`,`file_path`,`product_id`,`extension`,`priority`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'/be/26/6b/5958ba3fa238f.jpg',1,'',0,1,1,'2017-07-02 16:17:51','2017-07-02 16:17:51');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
