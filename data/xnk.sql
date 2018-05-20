/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.21 : Database - dung_xnk
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dung_xnk` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `dung_xnk`;

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
  KEY `updated_by_idx` (`updated_by`),
  CONSTRAINT `ad_config_created_by_sf_guard_user_id` FOREIGN KEY (`created_by`) REFERENCES `sf_guard_user` (`id`),
  CONSTRAINT `ad_config_updated_by_sf_guard_user_id` FOREIGN KEY (`updated_by`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ad_config` */

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
  PRIMARY KEY (`id`),
  KEY `created_by_idx` (`created_by`),
  KEY `updated_by_idx` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ad_document_category` */

insert  into `ad_document_category`(`id`,`name`,`image_path`,`description`,`priority`,`created_by`,`updated_by`,`created_at`,`updated_at`,`is_active`,`is_home`) values (2,'Luật/Pháp lệnh','/97/a4/49/556b422cb40ee.png','324',3,1,13,'2015-05-31 19:17:32','2015-09-11 15:41:10',1,1),(3,'Nghị định','/30/85/53/556b423c6d243.png','234',23,1,1,'2015-05-31 19:17:48','2015-06-07 19:13:58',1,1),(4,'Quy chế - Quy định','/6e/21/16/556b424620f8e.png','235',2,1,1,'2015-05-31 19:17:58','2015-05-31 19:17:58',1,1),(6,'Thông tư','/6e/21/16/556b424620f8e.png','236',4,1,1,'2015-05-31 19:17:58','2015-05-31 19:17:58',1,1);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ad_giang_vien` */

insert  into `ad_giang_vien`(`id`,`name`,`description`,`image`,`priority`,`is_active`,`created_at`,`updated_at`) values (1,'Hoàng Mai Nhi','Giảng viên môn tâm lý','/51/22/25/5a58d4079adb1.png',3,1,'2018-01-12 16:28:07','2018-01-12 16:28:07');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ad_hoc_vien` */

insert  into `ad_hoc_vien`(`id`,`name`,`description`,`image`,`priority`,`is_active`,`created_at`,`updated_at`) values (1,'Bạch Quốc Dũng','','/b6/8d/db/5a58d71ef32e2.png',0,1,'2018-01-12 16:41:19','2018-01-12 16:41:25');

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

insert  into `sessions_admin`(`sess_id`,`sess_data`,`sess_time`,`sess_userid`) values ('7efaaba76f83b6159763c5ead23d325f','',1499936601,NULL),('e8b053e912172e1a6e6ae4f9be2d8c98','symfony/user/sfUser/lastRequest|i:1499936173;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";securimage_code_value|a:1:{s:7:\"default\";s:2:\"u7\";}securimage_code_ctime|a:1:{s:7:\"default\";i:1499936173;}',1499936173,0),('dd5fca7388693f324e0bb0c83130522e','',1499936770,NULL),('eaae1c3e06cbd4e825230c158a2c7351','symfony/user/sfUser/lastRequest|i:1499936492;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";',1499936492,0),('1fd3ee25f7c3b19364b33027c3d50f1a','symfony/user/sfUser/lastRequest|i:1499936569;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";securimage_code_value|a:1:{s:7:\"default\";s:2:\"bd\";}securimage_code_ctime|a:1:{s:7:\"default\";i:1499936569;}',1499936569,0),('kjqu44nsgdghguda4tchmqba51','',1499964862,NULL),('uhek98l3ufji8oah6vblomg2b7','',1500173969,NULL),('97rlrb8i1snmgke7r4f7davmt5','',1500196480,NULL),('3s5shfuv3il1s9sgq0ohnud2l6','',1500716167,NULL),('k6bnb8gtgmh5lhtr83a5hsqmq6','',1500735483,NULL),('ss50g7a2k473c729r7ns7hd1c7','',1500821656,NULL),('7v7m3652pv0k1tlpojlkko4iv0','',1500166867,NULL),('nga6c56h3su5qr09kppkean5a3','',1500735423,NULL),('pjcvi5j1ueddqefngn6uki3mb0','',1500539246,NULL),('fkuscrn9tope1ekmvbqk3c2ub7','symfony/user/sfUser/lastRequest|i:1500539605;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";securimage_code_value|a:1:{s:7:\"default\";s:2:\"rk\";}securimage_code_ctime|a:1:{s:7:\"default\";i:1500539605;}',1500539605,0),('tfg05voj9ibe5u7n7sb40r4u33','',1500539600,NULL),('5qi6bfe2iit8md6vrs1ridq785','',1500821648,NULL),('0bk6sqcq208vh320vbpj1avkc4','',1501385160,NULL),('q78il0epba2hjtfr6ebvbbgnv5','',1501385169,NULL),('dg3it3qtp896477c14lt5j70r6','symfony/user/sfUser/lastRequest|i:1515601486;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";',1515601490,0),('lqfvg5ni2231dku9qupje9orc4','',1515769754,NULL),('nd7ehbr65pnmt75483ud678b12','',1515749229,NULL),('38ihl0aqr6apccm2derps0dah2','',1515749234,NULL),('a0slrm93h3827oqskf63j1c1m6','symfony/user/sfUser/lastRequest|i:1515753844;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";',1515753844,0),('o0gq106k0785nh8rddru8jlkq3','securimage_code_value|a:1:{s:7:\"default\";s:2:\"u6\";}securimage_code_ctime|a:1:{s:7:\"default\";i:1515753845;}symfony/user/sfUser/lastRequest|i:1515753845;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";',1515753845,0),('kb75u0sm2p1arfl1sfvdu373k4','',1515765107,NULL),('h8hcr4e3of1t0iftunrhe2p2p5','',1515748103,NULL),('s77o5ee1it5o569qkjiem7f1r6','',1501376197,NULL),('k4tntfod4aur2p9h8afr4lv5e3','symfony/user/sfUser/lastRequest|i:1501385692;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";securimage_code_value|a:1:{s:7:\"default\";s:2:\"af\";}securimage_code_ctime|a:1:{s:7:\"default\";i:1501385692;}',1501385692,0),('3008l4iggmbqet116qf8ekuam3','',1501385692,NULL),('os9fil9aur2pl578einp1j2vm5','',1515752358,NULL),('114q3n2e9t7if2j7l3i7ipt3h3','',1515752363,NULL),('2oagn4a6ikelb6cst7trsonr20','',1515765944,NULL),('i7qev9ao0b8ueq24emcvr8otn0','symfony/user/sfUser/lastRequest|i:1515771753;symfony/user/sfUser/authenticated|b:1;symfony/user/sfUser/credentials|a:9:{i:0;s:5:\"admin\";i:1;s:11:\"news_editor\";i:2;s:13:\"news_approved\";i:3;s:11:\"news_public\";i:4;s:17:\"news_tintucsukien\";i:5;s:15:\"Bài đăng CTV\";i:6;s:19:\"Quyền tạo mới\";i:7;s:8:\"Bài CTV\";i:8;s:8:\"subAdmin\";}symfony/user/sfUser/attributes|a:5:{s:30:\"symfony/user/sfUser/attributes\";a:2:{s:9:\"IpAddress\";s:3:\"::1\";s:9:\"UserAgent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0\";}s:12:\"admin_module\";a:11:{s:21:\"adArticlesEditor.page\";i:1;s:29:\"adArticlesEditor.max_per_page\";i:10;s:21:\"adArticlesEditor.sort\";a:2:{i:0;N;i:1;N;}s:14:\"adYoutube.page\";i:1;s:14:\"adYoutube.sort\";a:2:{i:0;N;i:1;N;}s:23:\"adDocumentDownload.sort\";a:2:{i:0;N;i:1;N;}s:23:\"adDocumentDownload.page\";i:1;s:16:\"adGiangVien.sort\";a:2:{i:0;N;i:1;N;}s:16:\"adGiangVien.page\";i:1;s:14:\"adHocVien.page\";i:1;s:14:\"adHocVien.sort\";a:2:{i:0;N;i:1;N;}}s:25:\"symfony/user/sfUser/flash\";a:0:{}s:32:\"symfony/user/sfUser/flash/remove\";a:0:{}s:19:\"sfGuardSecurityUser\";a:1:{s:7:\"user_id\";s:1:\"1\";}}symfony/user/sfUser/culture|s:2:\"vi\";securimage_code_value|a:1:{s:7:\"default\";s:0:\"\";}securimage_code_ctime|a:1:{s:7:\"default\";s:0:\"\";}',1515771753,1),('58i1jj1021q9s2ig7j08reh9j5','',1515770324,NULL),('6c7fh2m0mh4u29mgire8qd2rt2','symfony/user/sfUser/lastRequest|i:1515753844;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";',1515753844,0),('m67md1amotqepmlgkinno89oh0','symfony/user/sfUser/lastRequest|i:1515810121;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";',1515810125,0),('g8cmkeij8hc0l3h9kh555f8cs2','securimage_code_value|a:1:{s:7:\"default\";s:2:\"jy\";}securimage_code_ctime|a:1:{s:7:\"default\";i:1515810127;}symfony/user/sfUser/lastRequest|i:1515810127;symfony/user/sfUser/authenticated|b:0;symfony/user/sfUser/credentials|a:0:{}symfony/user/sfUser/attributes|a:0:{}symfony/user/sfUser/culture|s:2:\"vi\";',1515810128,0);

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

insert  into `sf_guard_user`(`id`,`first_name`,`last_name`,`phone`,`email_address`,`username`,`algorithm`,`salt`,`password`,`is_active`,`is_super_admin`,`last_login`,`pass_update_at`,`is_lock_signin`,`locked_time`,`created_at`,`updated_at`) values (1,'huy','nguyen','0988103864','huync2@gmail.com','admin','sha1','fd5d0f46cf9f4c45d58bcf1dc68d6856','9fbb8a236753c26b2a3bd1307119ad78ff34cdd6',1,1,'2018-01-12 16:18:45','2017-07-11 15:34:22',0,NULL,'2014-04-19 08:29:58','2018-01-12 16:18:45'),(22,'dung','bach','0988103864','dungbq89@gmail.com','dungbq','sha1','a612f7aa974cb0d6b25fb956d45ebf6a','bf77212c171f90690e6b22037abf71e7bf65f864',1,1,'2017-07-30 05:26:09','2017-07-02 04:39:20',0,NULL,'2016-06-20 15:23:34','2017-07-30 05:26:09'),(23,'admin1','admin','0972636751','mkt.nehob@gmail.com','admin1','sha1','73c49e557250827bfc5275dff63b9573','e0a000e6aaf365333c357716022815f8b5f0f811',1,0,'2016-08-13 09:24:55','2017-02-13 11:05:20',0,NULL,'2016-08-06 07:28:41','2017-02-13 11:05:20'),(24,'admin2',NULL,NULL,NULL,'admin2','sha1','aa','f9ca1d887d492f27729406b9081b52ce5beb2578',1,1,'2017-07-02 09:37:39','2017-07-02 09:36:37',NULL,NULL,'2017-07-02 09:36:43','2017-07-02 09:37:40'),(25,'user1','user1','0988103864','abc@123.vn','user1','sha1','e4d9ea9e5dc4676f838c9f21cbce9417','574e15c993d63a1b337796c6aa2b93d6bf76d64d',1,0,NULL,NULL,0,NULL,'2017-07-30 05:34:30','2017-07-30 05:34:30');

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
