/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 5.7.31 : Database - laravel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `laravel`;

/*Table structure for table `activity_log` */

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`),
  KEY `subject` (`subject_id`,`subject_type`),
  KEY `causer` (`causer_id`,`causer_type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `activity_log` */

insert  into `activity_log`(`id`,`log_name`,`description`,`subject_id`,`subject_type`,`causer_id`,`causer_type`,`properties`,`created_at`,`updated_at`) values 
(1,'default','created',1,'App\\Domains\\Announcement\\Models\\Announcement',NULL,NULL,'{\"attributes\": {\"area\": null, \"type\": \"info\", \"enabled\": true, \"ends_at\": null, \"message\": \"This is a <strong>Global</strong> announcement that will show on both the frontend and backend. <em>See <strong>AnnouncementSeeder</strong> for more usage examples.</em>\", \"starts_at\": null}}','2021-04-12 08:46:26','2021-04-12 08:46:26');

/*Table structure for table `announcements` */

DROP TABLE IF EXISTS `announcements`;

CREATE TABLE `announcements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area` enum('frontend','backend') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('info','danger','warning','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `announcements` */

insert  into `announcements`(`id`,`area`,`type`,`message`,`enabled`,`starts_at`,`ends_at`,`created_at`,`updated_at`) values 
(1,NULL,'info','This is a <strong>Global</strong> announcement that will show on both the frontend and backend. <em>See <strong>AnnouncementSeeder</strong> for more usage examples.</em>',1,NULL,NULL,'2021-04-12 08:46:26','2021-04-12 08:46:26');

/*Table structure for table `attachments` */

DROP TABLE IF EXISTS `attachments`;

CREATE TABLE `attachments` (
  `attachment_id` char(10) NOT NULL,
  `job_id` char(10) DEFAULT NULL,
  `email_id` char(10) DEFAULT NULL,
  `file_name` char(100) DEFAULT NULL,
  `file_type` char(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` char(10) NOT NULL,
  `checklist_id` char(10) DEFAULT NULL,
  `checklist_question_id` char(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `attachments` */

/*Table structure for table `attachments_in_email` */

DROP TABLE IF EXISTS `attachments_in_email`;

CREATE TABLE `attachments_in_email` (
  `job_id` char(10) NOT NULL,
  `email_id` char(10) NOT NULL,
  `attachment_id` char(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `attachments_in_email` */

/*Table structure for table `branches` */

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `branches` */

insert  into `branches`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'i4Survey Global',NULL,NULL),
(2,'Branch 2',NULL,NULL);

/*Table structure for table `checklist` */

DROP TABLE IF EXISTS `checklist`;

CREATE TABLE `checklist` (
  `checklist_id` char(10) NOT NULL,
  `customer_id` char(10) NOT NULL,
  `checklist_name` char(100) DEFAULT NULL,
  `checklist_description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `checklist` */

/*Table structure for table `checklist_in_job` */

DROP TABLE IF EXISTS `checklist_in_job`;

CREATE TABLE `checklist_in_job` (
  `job_id` char(10) NOT NULL,
  `checklist_id` char(10) NOT NULL,
  `checklist_name` char(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `checklist_in_job` */

/*Table structure for table `checklist_in_job_detail` */

DROP TABLE IF EXISTS `checklist_in_job_detail`;

CREATE TABLE `checklist_in_job_detail` (
  `checklist_detail_id` char(10) DEFAULT NULL,
  `job_id` char(10) DEFAULT NULL,
  `checklist_id` char(10) DEFAULT NULL,
  `checklist_detail_name` char(100) DEFAULT NULL,
  `checklist_type` char(100) DEFAULT NULL,
  `created_by` char(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `checklist_in_job_detail` */

/*Table structure for table `checklist_questions` */

DROP TABLE IF EXISTS `checklist_questions`;

CREATE TABLE `checklist_questions` (
  `checklist_question_id` char(10) NOT NULL,
  `checklist_id` char(10) NOT NULL,
  `question` text,
  `answer` text,
  `note` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` char(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `checklist_questions` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

insert  into `customers`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'AJ TRADINGS',NULL,NULL),
(2,'ALPHA DPIS CO',NULL,NULL);

/*Table structure for table `emails` */

DROP TABLE IF EXISTS `emails`;

CREATE TABLE `emails` (
  `email_id` char(10) NOT NULL,
  `job_id` char(10) DEFAULT NULL,
  `from` tinytext,
  `to` tinytext,
  `cc` text,
  `bcc` text,
  `subject` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text,
  `created_by` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `emails` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `branch_id` bigint(20) unsigned NOT NULL,
  `place_id` bigint(20) unsigned NOT NULL,
  `type` enum('loading','discharging','analysis','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'loading',
  `customer_reference` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expected_eta` timestamp NULL DEFAULT NULL,
  `demo` varchar(10) DEFAULT NULL,
  `vessel_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` char(10) NOT NULL,
  `status` char(30) DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `tons` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

/*Data for the table `jobs` */

insert  into `jobs`(`id`,`customer_id`,`branch_id`,`place_id`,`type`,`customer_reference`,`enabled`,`expected_eta`,`demo`,`vessel_id`,`created_at`,`updated_at`,`created_by`,`status`,`start`,`end`,`tons`) values 
(12,1,1,2,'loading','Rakib',1,'2021-06-08 00:24:00','Yes',2,'2021-06-07 18:24:37','2021-06-07 18:24:37','',NULL,NULL,NULL,NULL),
(11,1,1,2,'discharging','Sakib',1,'2021-06-08 00:22:00',NULL,2,'2021-06-07 18:23:59','2021-06-07 18:23:59','',NULL,NULL,NULL,NULL),
(9,1,2,1,'loading','Sakib',1,'2021-06-08 00:21:00',NULL,1,'2021-06-07 18:21:47','2021-06-07 18:21:47','',NULL,NULL,NULL,NULL),
(10,1,1,2,'discharging','Sakib',1,'2021-06-08 00:22:00','Yes',2,'2021-06-07 18:23:15','2021-06-07 18:23:15','',NULL,NULL,NULL,NULL),
(8,1,1,1,'analysis','Rakibul',1,'2021-06-08 00:17:00',NULL,2,'2021-06-07 18:19:27','2021-06-07 18:19:27','',NULL,NULL,NULL,NULL),
(13,2,1,1,'discharging','Fa',1,'2021-06-08 00:25:00',NULL,1,'2021-06-07 18:25:13','2021-06-07 18:25:13','',NULL,NULL,NULL,NULL),
(14,2,1,2,'analysis','Rakib',1,'2021-06-08 00:30:00','Yes',2,'2021-06-07 18:30:46','2021-06-07 18:30:46','',NULL,NULL,NULL,NULL),
(15,2,1,2,'analysis','Rakib',1,'2021-06-08 00:30:00',NULL,2,'2021-06-07 18:31:09','2021-06-07 18:31:09','',NULL,NULL,NULL,NULL),
(16,2,1,1,'loading','Sqak',1,'2021-06-08 00:31:00',NULL,2,'2021-06-07 18:32:03','2021-06-07 18:32:03','',NULL,NULL,NULL,NULL),
(17,1,2,2,'discharging','Test No',1,'2021-06-08 00:33:00','Yes',2,'2021-06-07 18:34:00','2021-06-07 18:34:00','',NULL,NULL,NULL,NULL),
(18,1,2,2,'discharging','Test No',1,'2021-06-08 00:33:00','Yes',2,'2021-06-07 18:34:11','2021-06-07 18:34:11','',NULL,NULL,NULL,NULL),
(19,1,2,2,'analysis','Test No',1,'2021-06-08 00:33:00','Yes',2,'2021-06-07 18:34:27','2021-06-07 18:34:27','',NULL,NULL,NULL,NULL),
(20,1,2,2,'analysis','Test No',1,'2021-06-08 00:33:00','Yes',2,'2021-06-07 18:34:40','2021-06-07 18:34:40','',NULL,NULL,NULL,NULL),
(21,1,2,2,'analysis','Test No',1,'2021-06-08 00:33:00',NULL,2,'2021-06-07 18:34:51','2021-06-07 18:34:51','',NULL,NULL,NULL,NULL),
(22,1,2,2,'analysis','Test No',1,'2021-06-08 00:33:00',NULL,2,'2021-06-07 18:35:11','2021-06-07 18:35:11','',NULL,NULL,NULL,NULL),
(23,1,2,2,'analysis','Test No',1,'2021-06-08 00:33:00','No',2,'2021-06-07 18:35:55','2021-06-07 18:35:55','',NULL,NULL,NULL,NULL),
(24,1,1,2,'discharging','Fa',1,'2021-06-08 00:37:00','Yes',2,'2021-06-07 18:37:15','2021-06-07 18:37:15','',NULL,NULL,NULL,NULL),
(25,1,1,2,'discharging','Fa',1,'2021-06-08 00:37:00',NULL,2,'2021-06-07 18:37:28','2021-06-07 18:37:28','',NULL,NULL,NULL,NULL),
(26,1,1,2,'discharging','Fa',1,'2021-06-08 00:37:00',NULL,2,'2021-06-07 18:37:49','2021-06-07 18:37:49','',NULL,NULL,NULL,NULL),
(27,1,1,2,'loading','Sm',1,'2021-06-08 00:40:00',NULL,2,'2021-06-07 18:40:40','2021-06-07 18:40:40','',NULL,NULL,NULL,NULL),
(28,1,1,1,'loading','Test No',1,'2021-06-08 00:43:00',NULL,2,'2021-06-07 18:43:38','2021-06-07 18:43:38','',NULL,NULL,NULL,NULL),
(29,1,1,2,'analysis','Md',1,'2021-06-08 14:41:00','1',1,'2021-06-08 08:41:18','2021-06-08 08:41:18','',NULL,NULL,NULL,NULL),
(30,1,2,1,'analysis','Sakib',1,'2021-06-08 14:42:00',NULL,2,'2021-06-08 08:42:20','2021-06-08 08:42:20','',NULL,NULL,NULL,NULL),
(31,1,2,1,'analysis','Sakib',1,'2021-06-08 14:42:00',NULL,2,'2021-06-08 08:44:26','2021-06-08 08:44:26','',NULL,NULL,NULL,NULL),
(32,1,2,1,'analysis','Sakib',1,'2021-06-08 14:42:00',NULL,2,'2021-06-08 08:44:58','2021-06-08 08:44:58','',NULL,NULL,NULL,NULL),
(33,1,1,1,'analysis','Sakib',1,'2021-06-08 14:45:00',NULL,3,'2021-06-08 08:45:53','2021-06-08 08:45:53','',NULL,NULL,NULL,NULL),
(34,1,1,1,'analysis','Sakib',1,'2021-06-08 14:45:00','0',3,'2021-06-08 08:46:18','2021-06-08 08:46:18','',NULL,NULL,NULL,NULL),
(35,1,1,1,'analysis','Sakib',1,'2021-06-08 14:45:00',NULL,3,'2021-06-08 08:46:52','2021-06-08 08:46:52','',NULL,NULL,NULL,NULL),
(36,1,1,1,'loading','Sakib',1,'2021-06-08 14:47:00','1',2,'2021-06-08 08:47:41','2021-06-08 08:47:41','',NULL,NULL,NULL,NULL),
(37,2,1,2,'analysis','Test No',1,'2021-06-08 14:48:00',NULL,3,'2021-06-08 08:48:27','2021-06-08 08:48:27','',NULL,NULL,NULL,NULL),
(38,1,1,1,'loading','Test No',1,'2021-06-08 14:49:00',NULL,2,'2021-06-08 08:49:12','2021-06-08 08:49:12','',NULL,NULL,NULL,NULL),
(39,1,1,2,'loading','USA',1,'2021-06-08 14:51:00',NULL,2,'2021-06-08 08:51:14','2021-06-08 08:51:14','',NULL,NULL,NULL,NULL),
(40,1,1,2,'loading','USA',1,'2021-06-08 14:51:00','0',2,'2021-06-08 08:51:46','2021-06-08 08:51:46','',NULL,NULL,NULL,NULL),
(41,1,1,1,'loading','Rakib',1,'2021-06-08 14:52:00',NULL,2,'2021-06-08 08:53:08','2021-06-08 08:53:08','',NULL,NULL,NULL,NULL),
(42,2,1,1,'discharging','Rakib',1,'2021-06-08 15:27:00','1',2,'2021-06-08 09:27:35','2021-06-08 09:27:35','',NULL,NULL,NULL,NULL),
(43,2,1,1,'discharging','Rakib',1,'2021-06-08 15:27:00','1',2,'2021-06-08 09:40:58','2021-06-08 09:40:58','',NULL,NULL,NULL,NULL),
(44,2,1,1,'loading','Rakib',1,'2021-06-08 15:41:00','1',2,'2021-06-08 09:41:20','2021-06-08 09:41:20','',NULL,NULL,NULL,NULL),
(45,1,1,1,'analysis','Sakib',1,'2021-06-08 23:40:00','1',2,'2021-06-08 17:40:10','2021-06-08 17:40:10','',NULL,NULL,NULL,NULL),
(46,1,1,1,'analysis','Sakib',1,'2021-06-08 23:40:00','1',2,'2021-06-08 17:40:44','2021-06-08 17:40:44','',NULL,NULL,NULL,NULL),
(47,1,1,1,'discharging','Rakibul',1,'2021-06-15 23:42:00','1',2,'2021-06-08 17:42:10','2021-06-08 17:42:10','',NULL,NULL,NULL,NULL),
(48,2,1,1,'loading','Rakib',1,'2021-06-08 23:44:00','1',2,'2021-06-08 17:44:12','2021-06-08 17:44:12','',NULL,NULL,NULL,NULL),
(49,2,1,1,'loading','Rakib',1,'2021-06-08 23:44:00','1',2,'2021-06-08 17:46:16','2021-06-08 17:46:16','',NULL,NULL,NULL,NULL),
(50,1,1,1,'loading','Test No',1,'2021-06-08 23:46:00','1',1,'2021-06-08 17:46:56','2021-06-08 17:46:56','',NULL,NULL,NULL,NULL),
(51,1,1,1,'discharging','Test No',1,'2021-06-08 23:47:00','1',2,'2021-06-08 17:48:01','2021-06-08 17:48:01','',NULL,NULL,NULL,NULL),
(52,1,1,1,'loading','Sakib',1,'2021-06-08 23:54:00',NULL,2,'2021-06-08 17:55:06','2021-06-08 17:55:06','',NULL,NULL,NULL,NULL),
(53,1,1,1,'loading','Sakib',1,'2021-06-08 23:54:00',NULL,2,'2021-06-08 17:56:00','2021-06-08 17:56:00','',NULL,NULL,NULL,NULL),
(54,1,1,2,'loading','Rakib',1,'2021-06-08 23:00:00',NULL,2,'2021-06-08 17:56:25','2021-06-08 17:56:25','',NULL,NULL,NULL,NULL),
(55,1,1,1,'discharging','Sakib',1,'2021-06-08 23:57:00','1',2,'2021-06-08 17:57:54','2021-06-08 17:57:54','',NULL,NULL,NULL,NULL),
(56,2,1,1,'discharging','Sakib',1,'2021-06-09 00:01:00','1',2,'2021-06-08 18:01:48','2021-06-08 18:01:48','',NULL,NULL,NULL,NULL),
(57,2,1,1,'discharging','Sakib',1,'2021-06-09 00:01:00','1',2,'2021-06-08 18:04:43','2021-06-08 18:04:43','',NULL,NULL,NULL,NULL),
(58,1,1,1,'loading','Rakib',1,'2021-06-09 00:07:00','1',2,'2021-06-08 18:07:09','2021-06-08 18:07:09','',NULL,NULL,NULL,NULL),
(59,1,1,1,'loading','Rakib',1,'2021-06-09 00:07:00','1',2,'2021-06-08 18:07:34','2021-06-08 18:07:34','',NULL,NULL,NULL,NULL),
(60,1,1,1,'loading','Rakib',1,'2021-06-09 00:07:00','1',2,'2021-06-08 18:09:37','2021-06-08 18:09:37','',NULL,NULL,NULL,NULL),
(61,1,1,1,'discharging','Mr. Abdc',1,'2021-06-09 00:10:00','1',2,'2021-06-08 18:10:33','2021-06-08 18:10:33','',NULL,NULL,NULL,NULL),
(62,1,1,1,'loading','Mr. Abcd',1,'2021-06-09 00:17:00','1',2,'2021-06-08 18:14:57','2021-06-08 18:14:57','',NULL,NULL,NULL,NULL),
(63,2,2,1,'discharging','Rakib',1,'2021-06-10 03:21:00',NULL,2,'2021-06-08 18:17:24','2021-06-08 18:17:24','',NULL,NULL,NULL,NULL),
(64,1,1,1,'loading','1212',1,'2021-06-25 11:12:00','1',1,'2021-06-11 05:12:21','2021-06-11 05:12:21','',NULL,NULL,NULL,NULL),
(65,1,1,1,'discharging','plpl',1,'2021-06-24 11:14:00','1',2,'2021-06-11 05:14:15','2021-06-11 05:14:15','',NULL,NULL,NULL,NULL),
(66,1,1,1,'loading','dsd',1,'2021-06-30 11:18:00','1',2,'2021-06-11 05:18:55','2021-06-11 05:18:55','',NULL,NULL,NULL,NULL),
(67,2,1,2,'loading','909',1,'2021-06-25 11:24:00','1',2,'2021-06-11 05:24:28','2021-06-11 05:24:28','',NULL,NULL,NULL,NULL),
(68,1,2,2,'loading','sdsd',1,'2021-06-24 11:32:00','1',2,'2021-06-11 05:32:50','2021-06-11 05:32:50','',NULL,NULL,NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2020_02_25_034148_create_permission_tables',1),
(5,'2020_05_25_021239_create_announcements_table',1),
(6,'2020_05_29_020244_create_password_histories_table',1),
(7,'2020_07_06_215139_create_activity_log_table',1),
(8,'2021_04_05_153840_create_two_factor_authentications_table',1),
(9,'2021_05_06_081856_create_posts_table',2);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values 
(1,'App\\Domains\\Auth\\Models\\User',1);

/*Table structure for table `password_histories` */

DROP TABLE IF EXISTS `password_histories`;

CREATE TABLE `password_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_histories` */

insert  into `password_histories`(`id`,`model_type`,`model_id`,`password`,`created_at`,`updated_at`) values 
(1,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$pCCfuwSdNDaJgA6Y83tOROeJjzExRTHkhrCmWecqRS8jWOvIiGFva','2021-04-12 08:46:25','2021-04-12 08:46:25'),
(2,'App\\Domains\\Auth\\Models\\User',2,'$2y$10$9YciyvqmhdZKs8WZrpYE0.B7EMgLVZtPcbR6ctj8PD4CtexqZvFWu','2021-04-12 08:46:26','2021-04-12 08:46:26');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_parent_id_foreign` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`type`,`guard_name`,`name`,`description`,`parent_id`,`sort`,`created_at`,`updated_at`) values 
(1,'admin','web','admin.access.user','All User Permissions',NULL,1,'2021-04-12 08:46:26','2021-04-12 08:46:26'),
(2,'admin','web','admin.access.user.list','View Users',1,1,'2021-04-12 08:46:26','2021-04-12 08:46:26'),
(3,'admin','web','admin.access.user.deactivate','Deactivate Users',1,2,'2021-04-12 08:46:26','2021-04-12 08:46:26'),
(4,'admin','web','admin.access.user.reactivate','Reactivate Users',1,3,'2021-04-12 08:46:26','2021-04-12 08:46:26'),
(5,'admin','web','admin.access.user.clear-session','Clear User Sessions',1,4,'2021-04-12 08:46:26','2021-04-12 08:46:26'),
(6,'admin','web','admin.access.user.impersonate','Impersonate Users',1,5,'2021-04-12 08:46:26','2021-04-12 08:46:26'),
(7,'admin','web','admin.access.user.change-password','Change User Passwords',1,6,'2021-04-12 08:46:26','2021-04-12 08:46:26');

/*Table structure for table `places` */

DROP TABLE IF EXISTS `places`;

CREATE TABLE `places` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `place_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `places` */

insert  into `places`(`id`,`place_name`,`created_at`,`updated_at`) values 
(1,'Spain',NULL,NULL),
(2,'USA-Test-',NULL,NULL);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `posts` */

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`type`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'admin','Administrator','web','2021-04-12 08:46:26','2021-04-12 08:46:26');

/*Table structure for table `two_factor_authentications` */

DROP TABLE IF EXISTS `two_factor_authentications`;

CREATE TABLE `two_factor_authentications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authenticatable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint(20) unsigned NOT NULL,
  `shared_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled_at` timestamp NULL DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digits` tinyint(3) unsigned NOT NULL DEFAULT '6',
  `seconds` tinyint(3) unsigned NOT NULL DEFAULT '30',
  `window` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `algorithm` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sha1',
  `recovery_codes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `recovery_codes_generated_at` timestamp NULL DEFAULT NULL,
  `safe_devices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `2fa_auth_type_auth_id_index` (`authenticatable_type`,`authenticatable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `two_factor_authentications` */

insert  into `two_factor_authentications`(`id`,`authenticatable_type`,`authenticatable_id`,`shared_secret`,`enabled_at`,`label`,`digits`,`seconds`,`window`,`algorithm`,`recovery_codes`,`recovery_codes_generated_at`,`safe_devices`,`created_at`,`updated_at`) values 
(1,'App\\Domains\\Auth\\Models\\User',1,'L5VCLC424FDFJC3KUDLTQS26FLUTODR7','2021-04-12 08:58:21','admin@admin.com',6,30,1,'sha1','[{\"code\":\"J5XFFBJH\",\"used_at\":\"2021-06-25T10:00:38.384974Z\"},{\"code\":\"ZYKYRVKD\",\"used_at\":\"2021-05-02T06:06:48.942267Z\"},{\"code\":\"XJIQE3YM\",\"used_at\":\"2021-05-03T05:10:03.892578Z\"},{\"code\":\"HAD1BECP\",\"used_at\":\"2021-05-03T05:42:36.999769Z\"},{\"code\":\"ERJC0I91\",\"used_at\":\"2021-05-06T06:13:05.452535Z\"},{\"code\":\"JDZXHSDK\",\"used_at\":null},{\"code\":\"IK7RX2HS\",\"used_at\":null},{\"code\":\"YP0YBWJF\",\"used_at\":\"2021-06-11T16:54:24.378758Z\"},{\"code\":\"TKBQEBJE\",\"used_at\":\"2021-06-11T05:11:49.871758Z\"},{\"code\":\"FR5CZMOU\",\"used_at\":\"2021-05-30T11:14:44.427377Z\"}]','2021-04-12 08:58:21',NULL,'2021-04-12 08:50:36','2021-06-25 10:00:38');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_be_logged_out` tinyint(1) NOT NULL DEFAULT '0',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`type`,`name`,`email`,`email_verified_at`,`password`,`password_changed_at`,`active`,`timezone`,`last_login_at`,`last_login_ip`,`to_be_logged_out`,`provider`,`provider_id`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'admin','Super Admin','admin@admin.com','2021-04-12 08:46:25','$2y$10$pCCfuwSdNDaJgA6Y83tOROeJjzExRTHkhrCmWecqRS8jWOvIiGFva',NULL,1,'America/New_York','2021-06-25 10:00:38','127.0.0.1',0,NULL,NULL,'2Bsk9GP7BsVPvbaw09KVRlLRkFSrX5OFyNRLll0cnfWvuHUqZu9F4BDOVxAf','2021-04-12 08:46:25','2021-06-25 10:00:38',NULL),
(2,'user','Test User','user@user.com','2021-04-12 08:46:25','$2y$10$9YciyvqmhdZKs8WZrpYE0.B7EMgLVZtPcbR6ctj8PD4CtexqZvFWu',NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2021-04-12 08:46:26','2021-04-12 08:46:26',NULL);

/*Table structure for table `vessels` */

DROP TABLE IF EXISTS `vessels`;

CREATE TABLE `vessels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `vessels` */

insert  into `vessels`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'Test Vessel 1',NULL,NULL),
(2,'Test Vessel 2',NULL,NULL),
(3,'test 2',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
