-- MySQL dump 10.13  Distrib 5.5.15, for Linux (x86_64)
--
-- Host: localhost    Database: e9_staging_development
-- ------------------------------------------------------
-- Server version	5.5.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertising_costs`
--

DROP TABLE IF EXISTS `advertising_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertising_costs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` int(11) DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertising_costs`
--

LOCK TABLES `advertising_costs` WRITE;
/*!40000 ALTER TABLE `advertising_costs` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertising_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_groups`
--

DROP TABLE IF EXISTS `campaign_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_groups`
--

LOCK TABLES `campaign_groups` WRITE;
/*!40000 ALTER TABLE `campaign_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_group_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `sales_person_id` int(11) DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `affiliate_fee` int(11) DEFAULT '0',
  `sales_fee` int(11) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_campaigns_on_campaign_group_id` (`campaign_group_id`),
  KEY `index_campaigns_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'NoCampaign','Campaign1',NULL,NULL,NULL,'Code1',0,0,1,'2011-09-16 20:36:30','2011-10-19 20:08:21'),(2,'AdvertisingCampaign','Test',NULL,NULL,NULL,'ASFD',0,0,1,'2011-09-16 21:09:14','2011-09-16 21:09:14'),(3,'SalesCampaign','C1',NULL,NULL,4,'C1',0,1000,1,'2011-09-20 17:36:44','2011-09-26 20:30:24'),(4,'AffiliateCampaign','affiliate campaign',NULL,4,4,'asdf',0,0,1,'2011-09-26 20:25:47','2011-09-26 20:30:24'),(5,'EmailCampaign','My campaign',NULL,NULL,NULL,'EMAIL',0,0,1,'2011-09-30 22:05:11','2011-09-30 22:05:11'),(6,'EmailCampaign','Campaign TEST',NULL,NULL,NULL,'TEST',0,0,1,'2011-09-30 22:23:27','2011-09-30 22:23:27'),(7,'EmailCampaign','Campaign HEY',NULL,NULL,NULL,'HEY',0,0,1,'2011-10-03 17:34:32','2011-10-03 17:34:32');
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `display_slide_selector` tinyint(1) DEFAULT '1',
  `layout_id` int(11) DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_categories_on_permalink` (`permalink`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'My Blog','Blog','guest',NULL,1,'2011-09-16 20:27:29','2011-09-16 20:27:38','my-blog',NULL,NULL,1,5,NULL,NULL),(2,'General Topics','Forum','user',NULL,1,'2011-09-16 20:27:29','2011-09-16 20:27:29','general-topics',NULL,NULL,1,6,NULL,NULL),(3,'FAQ guest','Faq','guest',NULL,1,'2011-09-16 20:27:38','2011-09-16 20:27:39','faq-guest',NULL,NULL,1,NULL,NULL,NULL),(4,'FAQ user','Faq','user',NULL,2,'2011-09-16 20:27:38','2011-09-16 20:27:39','faq-user',NULL,NULL,1,NULL,NULL,NULL),(5,'FAQ employee','Faq','employee',NULL,2,'2011-09-16 20:27:38','2011-09-16 20:27:40','faq-employee',NULL,NULL,1,NULL,NULL,NULL),(6,'User Forum','Forum','user',NULL,2,'2011-09-16 20:27:40','2011-09-16 20:27:40','user-forum',NULL,NULL,1,NULL,NULL,NULL),(7,'Employee Forum','Forum','employee',NULL,3,'2011-09-16 20:27:40','2011-09-16 20:27:40','employee-forum',NULL,NULL,1,NULL,NULL,NULL),(8,'My Slideshow','Slideshow','guest',NULL,NULL,'2011-09-16 20:27:41','2011-09-16 20:27:41','my-slideshow',NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `deleter_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `ok_to_email` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_contacts_on_company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (2,'Conrad','Strabone','','avatar.png','contact',NULL,'2011-09-16 20:27:08','2011-09-26 22:28:32','',1),(3,'Jina','Kiem','',NULL,'contact',NULL,'2011-09-16 20:27:09','2011-09-20 20:34:43','',1),(4,'Travis','adminerson','',NULL,'contact',NULL,'2011-09-16 20:27:09','2011-10-19 20:19:43','\n\n',1),(7,'asdf','','',NULL,'contact',NULL,'2011-09-20 19:34:54','2011-09-20 19:34:54','',1),(14,'John','',NULL,NULL,'contact',NULL,'2011-09-27 15:03:42','2011-09-27 15:03:42',NULL,1),(15,'John','',NULL,NULL,'contact',NULL,'2011-09-27 15:26:57','2011-09-27 15:26:57',NULL,1),(16,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-03 17:54:40','2011-10-03 17:54:40',NULL,1),(17,'buck',NULL,NULL,NULL,'contact',NULL,'2011-10-03 18:03:04','2011-10-03 18:03:04',NULL,1),(18,'dan',NULL,NULL,NULL,'contact',NULL,'2011-10-03 18:16:35','2011-10-03 18:16:35',NULL,1),(19,'fafafafa','','',NULL,'contact',NULL,'2011-10-17 23:08:14','2011-10-17 23:08:14','',1),(21,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 16:46:54','2011-10-18 16:46:54',NULL,1),(22,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 16:49:36','2011-10-18 16:49:36',NULL,1),(23,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:00:02','2011-10-18 18:00:02',NULL,1),(24,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:11:09','2011-10-18 18:11:09',NULL,1),(25,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:38:28','2011-10-18 18:38:28',NULL,1),(26,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:43:45','2011-10-18 18:43:45',NULL,1),(27,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:49:06','2011-10-18 18:49:06',NULL,1),(28,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:51:01','2011-10-18 18:51:01',NULL,1),(29,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:52:18','2011-10-18 18:52:18',NULL,1),(30,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:53:23','2011-10-18 18:53:23',NULL,1),(31,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:55:48','2011-10-18 18:55:48',NULL,1),(32,'bob',NULL,NULL,NULL,'contact',NULL,'2011-10-18 18:57:49','2011-10-18 18:57:49',NULL,1),(33,'asdfasfd','','',NULL,'contact',NULL,'2011-10-18 19:12:27','2011-10-18 19:12:27','',1),(34,'numbers',NULL,NULL,NULL,'contact',NULL,'2011-10-18 21:58:43','2011-10-18 21:58:43',NULL,1);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_deals`
--

DROP TABLE IF EXISTS `contacts_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_deals` (
  `contact_id` int(11) DEFAULT NULL,
  `deal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_deals`
--

LOCK TABLES `contacts_deals` WRITE;
/*!40000 ALTER TABLE `contacts_deals` DISABLE KEYS */;
INSERT INTO `contacts_deals` VALUES (7,16),(7,20),(4,21),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(2,5),(3,5),(4,24),(23,28),(7,29),(7,30),(7,31),(7,32),(7,33);
/*!40000 ALTER TABLE `contacts_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_updates`
--

DROP TABLE IF EXISTS `content_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_updates`
--

LOCK TABLES `content_updates` WRITE;
/*!40000 ALTER TABLE `content_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_views`
--

DROP TABLE IF EXISTS `content_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT '0',
  `master` tinyint(1) DEFAULT '0',
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `blog_id` int(11) DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `comments_count` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `text_version` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `display_social_bookmarks` tinyint(1) DEFAULT NULL,
  `display_date` tinyint(1) DEFAULT NULL,
  `display_author_info` tinyint(1) DEFAULT NULL,
  `display_labels` tinyint(1) DEFAULT NULL,
  `allow_comments` tinyint(1) DEFAULT NULL,
  `previously_published` tinyint(1) DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `editable_content` tinyint(1) DEFAULT '1',
  `author_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `faq_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `social_feed_settings_completed` tinyint(1) DEFAULT '0',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_title` tinyint(1) DEFAULT '1',
  `display_actions` tinyint(1) DEFAULT NULL,
  `link_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_more_info` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pages_on_permalink` (`permalink`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_views`
--

LOCK TABLES `content_views` WRITE;
/*!40000 ALTER TABLE `content_views` DISABLE KEYS */;
INSERT INTO `content_views` VALUES (1,'SystemPage','system-master-47e49448-e0a2-11e0-a7dc-0021cc4a76bb',0,1,'system_master',0,NULL,NULL,0,5,'System Master','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:21',NULL,'2011-09-16 20:27:21','2011-09-16 20:27:21',4,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(2,'SystemPage','admin-page-480c5b86-e0a2-11e0-a7dc-0021cc4a76bb',0,0,'admin',0,NULL,NULL,0,5,'Admin Page','administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:21',NULL,'2011-09-16 20:27:21','2011-09-16 20:27:21',4,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(3,'SystemPage','search-results-482112ec-e0a2-11e0-a7dc-0021cc4a76bb',0,0,'search',0,NULL,NULL,0,5,'Search Results','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:22',NULL,'2011-09-16 20:27:22','2011-09-16 20:27:22',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(4,'SystemPage','page-not-found-48375b2e-e0a2-11e0-a7dc-0021cc4a76bb',0,0,'not_found',0,NULL,NULL,0,5,'Page Not Found','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:22',NULL,'2011-09-16 20:27:22','2011-09-16 20:27:22',1,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(5,'SystemPage','manage-email-preferences-484bf5ca-e0a2-11e0-a7dc-0021cc4a76bb',0,0,'unsubscribe',0,NULL,NULL,0,5,'Manage Email Preferences','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:22',NULL,'2011-09-16 20:27:22','2011-09-16 20:27:22',1,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(6,'SystemPage','slides-48600164-e0a2-11e0-a7dc-0021cc4a76bb',0,0,'slides',0,NULL,NULL,0,5,'Slides','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:22',NULL,'2011-09-16 20:27:22','2011-09-16 20:27:22',7,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(7,'LinkableSystemPage','help',0,0,'admin_help',0,NULL,NULL,0,5,'Admin Help','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:22',NULL,'2011-09-16 20:27:22','2011-09-16 20:27:22',4,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(8,'LinkableSystemPage','blog',0,0,'blog',0,NULL,NULL,0,5,'Blog','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:23',NULL,'2011-09-16 20:27:23','2011-09-16 20:27:23',5,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(9,'LinkableSystemPage','forums',0,0,'forums',0,NULL,NULL,0,5,'Forum','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:23',NULL,'2011-09-16 20:27:23','2011-10-18 21:58:00',6,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(10,'LinkableSystemPage','administrator/faqs',0,0,'administrator_faqs',0,NULL,NULL,0,5,'Administrator FAQs','administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:23',NULL,'2011-09-16 20:27:23','2011-09-16 20:27:23',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(11,'LinkableSystemPage','profile/edit',0,0,'edit_profile',0,NULL,NULL,0,5,'Edit My Profile','user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:23',NULL,'2011-09-16 20:27:23','2011-09-16 20:27:23',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(12,'LinkableSystemPage','employee/faqs',0,0,'employee_faqs',0,NULL,NULL,0,5,'Employee FAQs','employee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:23',NULL,'2011-09-16 20:27:23','2011-09-16 20:27:23',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(13,'LinkableSystemPage','faqs',0,0,'faqs',0,NULL,NULL,0,5,'FAQ','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:23',NULL,'2011-09-16 20:27:23','2011-09-16 20:27:23',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(14,'LinkableSystemPage','profile',0,0,'profile',0,NULL,NULL,0,5,'Profile','user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:23',NULL,'2011-09-16 20:27:23','2011-09-16 20:27:23',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(15,'LinkableSystemPage','sign_in',0,0,'sign_in',0,NULL,NULL,0,5,'Sign In','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:24',NULL,'2011-09-16 20:27:24','2011-09-16 20:27:24',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(16,'LinkableSystemPage','sign_up',0,0,'sign_up',0,NULL,NULL,0,5,'Sign Up','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:24',NULL,'2011-09-16 20:27:24','2011-09-16 20:27:24',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(17,'LinkableSystemPage','slideshows',0,0,'slideshows',0,NULL,NULL,0,5,'Slideshows','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:24',NULL,'2011-09-16 20:27:24','2011-09-16 20:27:24',1,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(18,'LinkableSystemPage','superuser/faqs',0,0,'superuser_faqs',0,NULL,NULL,0,5,'Super User FAQs','superuser',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:24',NULL,'2011-09-16 20:27:24','2011-09-16 20:27:24',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(19,'LinkableSystemPage','user/faqs',0,0,'user_faqs',0,NULL,NULL,0,5,'User FAQs','user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:24',NULL,'2011-09-16 20:27:24','2011-09-16 20:27:24',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(20,'LinkableSystemPage','',0,0,'home',0,NULL,NULL,0,5,'Home','guest','<p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.</p>\n<p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla. Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.\nCras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla. Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:24',NULL,'2011-09-16 20:27:24','2011-09-16 20:27:24',2,1,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL),(21,'UserPage','services',1,0,NULL,0,NULL,NULL,0,5,'Services','guest','<p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n<p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \nCras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:31',NULL,'2011-09-16 20:27:31','2011-10-14 18:40:10',1,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(22,'UserPage','about-us',1,0,NULL,0,NULL,NULL,0,5,'About Us','guest','<p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n<p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \nCras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:31',NULL,'2011-09-16 20:27:31','2011-09-16 20:27:31',1,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(23,'UserPage','contact-us',1,0,NULL,0,NULL,NULL,0,5,'Contact Us','guest','<p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n<p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \nCras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:31',NULL,'2011-09-16 20:27:31','2011-09-16 20:27:31',1,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(24,'SystemPage','offer-conversion-4f9d0bfc-e0a2-11e0-a7dc-0021cc4a76bb',0,0,'offer_page',0,NULL,NULL,0,1,'Offer Conversion','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-09-16 20:27:34',NULL,'2011-09-16 20:27:34','2011-09-16 20:27:34',1,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(25,'BlogPost','blog-post-1',1,0,NULL,0,1,NULL,0,5,'Blog Post 1','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:36',NULL,'2011-09-16 20:27:36','2011-09-16 20:27:36',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(26,'BlogPost','blog-post-2',1,0,NULL,0,1,NULL,0,5,'Blog Post 2','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:37',NULL,'2011-09-16 20:27:36','2011-09-16 20:27:36',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(27,'BlogPost','blog-post-3',1,0,NULL,0,1,NULL,0,5,'Blog Post 3','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:37',NULL,'2011-09-16 20:27:37','2011-09-16 20:27:37',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(28,'BlogPost','blog-post-4',1,0,NULL,0,1,NULL,0,5,'Blog Post 4','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:37',NULL,'2011-09-16 20:27:37','2011-09-16 20:27:37',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(29,'BlogPost','blog-post-5',1,0,NULL,0,1,NULL,0,5,'Blog Post 5','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:37',NULL,'2011-09-16 20:27:37','2011-09-16 20:27:37',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(30,'BlogPost','blog-post-6',1,0,NULL,0,1,NULL,0,5,'Blog Post 6','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:37',NULL,'2011-09-16 20:27:37','2011-09-16 20:27:37',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(31,'BlogPost','blog-post-7',1,0,NULL,0,1,NULL,0,5,'Blog Post 7','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:37',NULL,'2011-09-16 20:27:37','2011-09-16 20:27:37',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(32,'BlogPost','blog-post-8',1,0,NULL,0,1,NULL,0,5,'Blog Post 8','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:38',NULL,'2011-09-16 20:27:38','2011-09-16 20:27:38',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(33,'BlogPost','blog-post-9',1,0,NULL,0,1,NULL,0,5,'Blog Post 9','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:38',NULL,'2011-09-16 20:27:38','2011-09-16 20:27:38',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(34,'BlogPost','blog-post-10',1,0,NULL,0,1,NULL,0,5,'Blog Post 10','guest','  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>\n  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>\n  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>\n','  Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.\n  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  \n  Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.\n',NULL,1,1,1,1,1,1,'2011-09-16 20:27:38',NULL,'2011-09-16 20:27:38','2011-09-16 20:27:38',5,1,NULL,NULL,NULL,0,NULL,NULL,1,1,NULL,NULL),(35,'Question','guest-question',1,0,NULL,0,NULL,NULL,0,5,'guest question','guest','guest answer','guest answer',NULL,NULL,NULL,NULL,NULL,NULL,1,'2011-09-16 20:27:39',NULL,'2011-09-16 20:27:39','2011-09-16 20:27:39',NULL,1,NULL,3,2,0,NULL,NULL,1,NULL,NULL,NULL),(36,'Question','user-question',1,0,NULL,0,NULL,NULL,0,5,'user question','user','user answer','user answer',NULL,NULL,NULL,NULL,NULL,NULL,1,'2011-09-16 20:27:39',NULL,'2011-09-16 20:27:39','2011-09-16 20:27:39',NULL,1,NULL,4,2,0,NULL,NULL,1,NULL,NULL,NULL),(37,'Question','employee-question',1,0,NULL,0,NULL,NULL,0,5,'employee question','employee','employee answer','employee answer',NULL,NULL,NULL,NULL,NULL,NULL,1,'2011-09-16 20:27:40',NULL,'2011-09-16 20:27:40','2011-09-16 20:27:40',NULL,1,NULL,5,2,0,NULL,NULL,1,NULL,NULL,NULL),(38,'Topic','topic-0-of-user-forum',1,0,NULL,0,NULL,6,0,5,'Topic 0 of User Forum','user','initial comment on 0',NULL,NULL,1,NULL,NULL,NULL,NULL,1,'2011-09-16 20:27:40',NULL,'2011-09-16 20:27:40','2011-09-16 20:27:40',NULL,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(39,'Topic','topic-1-of-user-forum',1,0,NULL,0,NULL,6,0,5,'Topic 1 of User Forum','user','initial comment on 1',NULL,NULL,1,NULL,NULL,NULL,NULL,1,'2011-09-16 20:27:40',NULL,'2011-09-16 20:27:40','2011-09-16 20:27:40',NULL,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(40,'Topic','topic-2-of-user-forum',1,0,NULL,0,NULL,6,0,5,'Topic 2 of User Forum','user','initial comment on 2',NULL,NULL,1,NULL,NULL,NULL,NULL,1,'2011-09-16 20:27:40',NULL,'2011-09-16 20:27:40','2011-09-16 20:27:40',NULL,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(41,'Topic','topic-0-of-employee-forum',1,0,NULL,0,NULL,7,0,5,'Topic 0 of Employee Forum','employee','initial comment on 0',NULL,NULL,1,NULL,NULL,NULL,NULL,1,'2011-09-16 20:27:40',NULL,'2011-09-16 20:27:40','2011-09-16 20:27:40',NULL,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(42,'Topic','topic-1-of-employee-forum',1,0,NULL,0,NULL,7,0,5,'Topic 1 of Employee Forum','employee','initial comment on 1',NULL,NULL,1,NULL,NULL,NULL,NULL,1,'2011-09-16 20:27:40',NULL,'2011-09-16 20:27:40','2011-09-16 20:27:40',NULL,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(43,'Topic','topic-2-of-employee-forum',1,0,NULL,0,NULL,7,0,5,'Topic 2 of Employee Forum','employee','initial comment on 2',NULL,NULL,1,NULL,NULL,NULL,NULL,1,'2011-09-16 20:27:40',NULL,'2011-09-16 20:27:40','2011-09-16 20:27:40',NULL,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL),(44,'Slide','slide-1',1,0,NULL,0,NULL,NULL,0,5,'slide 1','guest','slide 1 body','slide 1 body',NULL,1,1,1,1,1,1,'2011-10-13 20:16:46',NULL,'2011-09-16 20:27:44','2011-10-13 20:16:46',8,1,NULL,NULL,NULL,0,'slide.png',NULL,1,1,NULL,1),(45,'Slide','slide-2',1,0,NULL,0,NULL,NULL,0,5,'slide 2','guest','slide 2 body','slide 2 body',NULL,1,1,1,1,1,1,'2011-10-13 20:16:48',NULL,'2011-09-16 20:27:45','2011-10-13 20:16:48',8,1,NULL,NULL,NULL,0,'slide.png',NULL,1,1,NULL,1),(46,'Slide','slide-3',1,0,NULL,0,NULL,NULL,0,5,'slide 3','guest','slide 3 body','slide 3 body',NULL,1,1,1,1,1,1,'2011-10-13 20:16:50',NULL,'2011-09-16 20:27:45','2011-10-13 20:16:50',8,1,NULL,NULL,NULL,0,'slide.png',NULL,1,1,NULL,1),(47,'Slide','slide-4',1,0,NULL,0,NULL,NULL,0,5,'slide 4','guest','slide 4 body','slide 4 body',NULL,1,1,1,1,1,1,'2011-10-13 20:16:52',NULL,'2011-09-16 20:27:46','2011-10-13 20:16:52',8,1,NULL,NULL,NULL,0,'slide.png',NULL,1,1,NULL,1),(48,'Slide','slide-5',1,0,NULL,0,NULL,NULL,0,5,'slide 5','guest','slide 5 body','slide 5 body',NULL,1,1,1,1,1,1,'2011-10-13 20:16:53',NULL,'2011-09-16 20:27:47','2011-10-18 21:58:00',8,1,NULL,NULL,NULL,0,'slide.png',NULL,1,1,NULL,1),(50,'LinkableSystemPage','revoke',0,0,'revoke',0,NULL,NULL,0,1,'Manage Your Account','guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2011-10-18 21:54:47',NULL,'2011-10-18 21:54:47','2011-10-18 21:54:47',1,0,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `content_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dated_costs`
--

DROP TABLE IF EXISTS `dated_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dated_costs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costable_id` int(11) DEFAULT NULL,
  `costable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` int(11) DEFAULT '0',
  `date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dated_costs`
--

LOCK TABLES `dated_costs` WRITE;
/*!40000 ALTER TABLE `dated_costs` DISABLE KEYS */;
INSERT INTO `dated_costs` VALUES (1,2,'Campaign',500,'2010-09-16','2011-09-16 21:10:15','2011-09-16 21:10:15'),(2,2,'Campaign',500,'2010-09-16','2011-09-16 21:10:16','2011-09-16 21:10:16'),(3,2,'Campaign',500,'2010-09-16','2011-09-16 21:10:17','2011-09-16 21:10:17'),(4,3,'Campaign',1000,'2011-09-16','2011-10-07 20:03:08','2011-10-07 20:03:08'),(5,3,'Campaign',1000,'2011-09-26','2011-10-07 20:03:57','2011-10-07 20:03:57');
/*!40000 ALTER TABLE `dated_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deals`
--

DROP TABLE IF EXISTS `deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  `offer_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `tracking_cookie_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `converted_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT '0',
  `offer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dated_cost_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_deals_on_campaign_id` (`campaign_id`),
  KEY `index_deals_on_offer_id` (`offer_id`),
  KEY `index_deals_on_status` (`status`),
  KEY `index_deals_on_tracking_cookie_id` (`tracking_cookie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
INSERT INTO `deals` VALUES (3,NULL,'ad deal','',NULL,NULL,'',NULL,NULL,3,NULL,2,NULL,'2011-09-16 04:00:00','2011-10-07 20:03:19','2011-09-16 21:11:23','2011-09-16 04:00:00','won',7500,NULL,'ASFD',4),(4,NULL,'Deal 2','Default',NULL,NULL,'asdf',NULL,NULL,3,NULL,2,NULL,'2011-09-20 04:00:00','2011-10-07 20:03:57','2011-09-26 18:02:35','2011-09-26 04:00:00','won',5000,NULL,'NoCode',5),(5,NULL,'Deal 3','',NULL,NULL,'',NULL,NULL,2,NULL,4,NULL,'2011-09-20 04:00:00','2011-09-26 22:21:45','2011-09-20 17:00:19','2011-09-23 04:00:00','won',0,NULL,'ASFD',NULL),(6,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\nasdf\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:33:27','2011-09-20 21:33:27',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(7,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\n\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:34:46','2011-09-20 21:34:46',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(8,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\n\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:35:14','2011-09-20 21:35:14',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(9,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\n\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:35:20','2011-09-20 21:35:20',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(10,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\n\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:35:57','2011-09-20 21:35:57',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(11,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\n\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:36:18','2011-09-20 21:36:18',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(12,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\n\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:36:43','2011-09-20 21:36:43',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(13,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\n\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:36:56','2011-09-20 21:36:56',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(14,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\n\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:42:52','2011-09-20 21:42:52',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(15,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\n\n\n',NULL,13,2,NULL,NULL,4,'2011-09-20 21:43:01','2011-09-20 21:43:01',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(16,NULL,NULL,NULL,'asdf@asdf.com','asdf','**Whatup:**\nasdf@afds.com\n\n',NULL,13,2,NULL,NULL,7,'2011-09-20 23:06:46','2011-09-20 23:06:46',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(17,NULL,NULL,NULL,'asfd@asdf.com','asdf','**Whatup:**\nasdf@asdf.com\n\n',NULL,13,2,NULL,NULL,10,'2011-09-22 18:59:33','2011-09-22 18:59:33',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(18,NULL,NULL,NULL,'asfd@asdf.com','asdf','**Whatup:**\nasdf@asdf.com\n\n',NULL,13,2,NULL,NULL,10,'2011-09-22 19:00:05','2011-09-22 19:00:05',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(19,NULL,NULL,NULL,'asfd@asdf.com','asdf','**Whatup:**\nasdf@asdf.com\n\n',NULL,13,2,NULL,NULL,10,'2011-09-22 19:00:50','2011-09-22 19:00:50',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(20,NULL,NULL,NULL,'asdf@asdf.com','asdf','**Whatup:**\nasfd@asdf.com\n\n',NULL,13,2,NULL,NULL,7,'2011-09-22 20:01:07','2011-09-22 20:01:07',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(21,NULL,NULL,NULL,'asdf@asfd.com','asdf@asdf','**Whatup:**\nasdf@asdf.com\n\n',NULL,13,2,NULL,NULL,11,'2011-09-22 20:15:19','2011-09-22 20:15:19',NULL,NULL,'lead',0,'testing 123','ASFD',NULL),(22,NULL,'Test','',NULL,NULL,'asdf',NULL,NULL,4,NULL,4,NULL,'2011-09-26 22:27:38','2011-09-26 22:27:38','2011-09-26 22:27:38',NULL,'pending',0,NULL,'asdf',NULL),(24,NULL,NULL,NULL,'travis@e9digital.com','Travis','**Whatup:**\nasdf@asdf.com\n\n',NULL,13,1,NULL,NULL,4,'2011-09-27 14:51:38','2011-09-27 14:51:38',NULL,NULL,'lead',0,'testing 123','NoCode',NULL),(26,NULL,NULL,NULL,'john@e9digital.com','johnnyboy','**Whatup:**\nhey@hey.com\n\n',NULL,13,1,NULL,NULL,5,'2011-09-27 14:58:46','2011-09-27 14:58:46',NULL,NULL,'lead',0,'testing 123','NoCode',NULL),(28,NULL,NULL,NULL,NULL,NULL,'asfdasdf\r\n\r\nasdfasdf\r\n\r\n\r\nasdfasdf',NULL,NULL,1,NULL,NULL,NULL,'2011-10-21 16:37:31','2011-10-21 16:37:31',NULL,NULL,'lead',0,NULL,'Code1',NULL),(29,NULL,NULL,NULL,NULL,NULL,'testing\n\n1\n\n2\n\n\n3',NULL,NULL,6,NULL,NULL,NULL,'2011-10-21 17:11:04','2011-10-21 17:11:04',NULL,NULL,'lead',0,NULL,'TEST',NULL),(30,NULL,NULL,NULL,NULL,NULL,'asdfasdf',NULL,NULL,5,NULL,NULL,NULL,'2011-10-21 17:11:44','2011-10-21 17:11:44',NULL,NULL,'lead',0,NULL,'EMAIL',NULL),(31,NULL,NULL,NULL,NULL,NULL,'asdfasdf',NULL,NULL,6,NULL,NULL,NULL,'2011-10-21 17:25:46','2011-10-21 17:25:46',NULL,NULL,'lead',0,NULL,'TEST',NULL),(32,NULL,NULL,NULL,NULL,NULL,'adsfa',NULL,NULL,1,NULL,NULL,NULL,'2011-10-21 17:29:28','2011-10-21 17:29:28',NULL,NULL,'lead',0,NULL,'Code1',NULL),(33,NULL,NULL,NULL,NULL,NULL,'asdfasdf',NULL,NULL,5,NULL,NULL,NULL,'2011-10-21 17:30:22','2011-10-21 17:30:22',NULL,NULL,'lead',0,NULL,'EMAIL',NULL);
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` text COLLATE utf8_unicode_ci,
  `last_error` text COLLATE utf8_unicode_ci,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_deliveries`
--

DROP TABLE IF EXISTS `email_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formats` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `html_body` text COLLATE utf8_unicode_ci,
  `text_body` text COLLATE utf8_unicode_ci,
  `contact_ids` text COLLATE utf8_unicode_ci,
  `requests` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_deliveries`
--

LOCK TABLES `email_deliveries` WRITE;
/*!40000 ALTER TABLE `email_deliveries` DISABLE KEYS */;
INSERT INTO `email_deliveries` VALUES (1,5,10,'testing 123',NULL,'numbers1311407@gmail.com',NULL,NULL,NULL,'{{contact.name}}<br/>{{recipient.email}}<br/>{{campaign.code}}','{{contact.name}}\n{{recipient.email}}\n{{campaign.code}}','4',0,'2011-10-07 17:52:31','2011-10-07 21:36:01'),(2,NULL,9,'Newsy',NULL,'travis@e9digital.com',NULL,NULL,NULL,'HTML BODY!','TEXT BODY!!!','8,7,33,16,20,21,22,23,24,25,26,27,28,29,30,31,32,17,2,18,19,3,14,15,34,4',2,'2011-10-19 16:35:29','2011-10-19 16:35:30'),(3,NULL,16,'asdfasdf',NULL,'travis@e9digital.com',NULL,NULL,NULL,'HTML BODY\r\n','TEXT BODY','4',1,'2011-10-19 17:01:11','2011-10-19 17:01:22'),(4,6,16,'asdfasdf',NULL,'travis@e9digital.com',NULL,NULL,NULL,'HTML BODY\r\n','TEXT BODY','4',1,'2011-10-19 17:05:11','2011-10-19 17:05:21'),(5,NULL,6,'','','',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\">omfg</a></p>\r\n\r\n<p>#unsubscribe_url#</p>','','4',1,'2011-10-19 17:20:12','2011-10-19 17:20:14'),(6,NULL,6,'','','',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\">omfg</a></p>\r\n\r\n<p>#unsubscribe_url#</p>','','4',1,'2011-10-19 17:20:31','2011-10-19 17:20:32'),(7,NULL,6,'testing 123','','travis@e9digital.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a>\n<br />#unsubscribe_url#</p>','hey http://omfg.com?\n#unsubscribe_url#','4',1,'2011-10-19 17:29:56','2011-10-19 17:29:58'),(8,NULL,6,'testing 123','','travis@e9digital.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a>\n<br />#unsubscribe_url#</p>','hey http://omfg.com?\n#unsubscribe_url#','4',1,'2011-10-19 17:31:55','2011-10-19 17:31:56'),(9,NULL,6,'testing 123','','travis@e9digital.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a>\n<br />#unsubscribe_url#</p>','hey http://omfg.com?\n#unsubscribe_url#','4',1,'2011-10-19 17:33:56','2011-10-19 17:33:57'),(10,NULL,6,'testing 123','','travis@e9digital.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a>\n<br />#unsubscribe_url#</p>','hey http://omfg.com?\n#unsubscribe_url#','4',1,'2011-10-19 17:34:16','2011-10-19 17:34:17'),(11,NULL,6,'testing 123','','travis@e9digital.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a>\n<br />#unsubscribe_url#</p>','hey http://omfg.com?\n#unsubscribe_url#','4',1,'2011-10-19 17:35:56','2011-10-19 17:35:59'),(12,NULL,6,'testing 123','','travis@e9digital.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a>\n<br />#unsubscribe_url#</p>','hey http://omfg.com?\n#unsubscribe_url#','4',1,'2011-10-19 17:37:50','2011-10-19 17:37:52'),(13,NULL,6,'testing 123','','travis@e9digital.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a>\n<br />#unsubscribe_url#</p>','hey http://omfg.com?\n#unsubscribe_url#','4',1,'2011-10-19 17:40:36','2011-10-19 17:40:38'),(14,NULL,6,'asdf','','asdf',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a>\n<br />#unsubscribe_url#</p>','hey http://omfg.com?\n#unsubscribe_url#','4',1,'2011-10-19 17:54:23','2011-10-19 17:54:26'),(15,NULL,6,'testing 123','','asdf@asdf.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a></p>\n\n<p>{{ config.can_spam_mailing_address }}</p>','hey http://omfg.com?\n\n{{ config.can_spam_mailing_address }}','34',1,'2011-10-21 20:03:43','2011-10-21 20:03:45'),(16,NULL,6,'testing 123','','asdf@asdf.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a></p>\n\n<p>{{ config.can_spam_mailing_address }}</p>','hey http://omfg.com?\n\n{{ config.can_spam_mailing_address }}','34',1,'2011-10-21 20:03:45','2011-10-21 20:03:46'),(17,NULL,6,'testing 123','','asdf@asdf.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a></p>\n\n<p>{{ config.can_spam_mailing_address }}</p>','hey http://omfg.com?\n\n{{ config.can_spam_mailing_address }}','34',1,'2011-10-21 20:03:47','2011-10-21 20:03:48'),(18,NULL,6,'testing 123','','asdf@asdf.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a></p>\n\n<p>{{ config.can_spam_mailing_address }}</p>','hey http://omfg.com?\n\n{{ config.can_spam_mailing_address }}','4',1,'2011-10-21 20:19:47','2011-10-21 20:19:48'),(19,NULL,6,'testing 123','','asdf@asdf.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a></p>\n\n<p>{{ config.can_spam_mailing_address }}</p>','hey http://omfg.com?\n\n{{ config.can_spam_mailing_address }}','4',1,'2011-10-21 20:20:47','2011-10-21 20:20:48'),(20,NULL,17,'asdfasdf',NULL,'travis@e9digital.com',NULL,NULL,NULL,'<p>testing 123</p>','testing 123','4',1,'2011-10-21 20:25:46','2011-10-21 20:25:47'),(21,NULL,6,'testing 123','','asdf@asdf.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a></p>\n\n<p>{{ config.can_spam_mailing_address }}</p>','hey http://omfg.com?\n\n{{ config.can_spam_mailing_address }}','4',1,'2011-10-21 20:27:23','2011-10-21 20:27:24'),(22,NULL,6,'multiples?','','asdf@asdf.com',NULL,NULL,NULL,'<p>hey <a href=\"http://omfg.com?\" rel=\"external nofollow\">http://omfg.com</a></p>\n\n<p>{{ config.can_spam_mailing_address }}</p>','hey http://omfg.com?\n\n{{ config.can_spam_mailing_address }}','34',1,'2011-10-21 20:28:45','2011-10-21 20:28:46');
/*!40000 ALTER TABLE `email_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailing_list_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html_body` text COLLATE utf8_unicode_ci,
  `text_body` text COLLATE utf8_unicode_ci,
  `delivery_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sub_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,NULL,'Reset Password Email','SystemEmail','{% site_name %} sent Password Reset Instructions',0,'reset_password',NULL,'resetpassword@e9digital.com','resetpassword_reply@e9digital.com','<p>Dear #first_name#,</p>\r\n\r\n<p>You can reset your password by clicking the link or pasting it into your browser: #reset_password_url# </p>\r\n\r\n<p>Many thanks!</p>\r\n\r\n<p>The {% site_name %} Team</p>\r\n\r\n<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>\r\n','Dear {% recipient_first_name %},\r\n\r\nYou can reset your password by clicking the link or pasting it into your browser: {% recipient_reset_password_url %}\r\n\r\nMany thanks!\r\n\r\nThe {% site_name %} Team\r\n\r\nPS: If you have any trouble or have questions, you can simply reply to this email and let us know!\r\n',NULL,'2011-09-16 20:27:09','2011-10-12 21:23:39',NULL),(2,3,'New Content Alert Email','SystemEmail','{% site_name %} has new content',0,'new_content_alert',NULL,'newcontent@e9digital.com','newcontent_reply@e9digital.com','<p>Dear {% recipient_first_name %},</p>\r\n\r\n<p>{% page_title %} was added to {% site_name %}</p>\r\n\r\n<p>You can visit this page by clicking the link or pasting it into your browser: {% page_url %}</p>\r\n\r\n<p>To unsubscribe to these alerts, click the link or paste it into your browser: #unsubscribe_url#</p>\r\n\r\n<p>Many thanks!</p>\r\n\r\n<p>The {% site_name %} Team</p>\r\n\r\n<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>\r\n','Dear {% recipient_first_name %},\r\n\r\n{% page_title %} was added to {% site_name %}\r\n\r\nYou can visit this page by clicking the link or pasting it into your browser: {% page_url %}\r\n\r\nTo unsubscribe to these alerts, click the link or paste it into your browser: #unsubscribe_url#\r\n\r\nMany thanks!\r\n\r\nThe {% site_name %} Team\r\n\r\nPS: If you have any trouble or have questions, you can simply reply to this email and let us know!\r\n',NULL,'2011-09-16 20:27:10','2011-10-05 19:28:19',NULL),(3,NULL,'Email a Friend Email','SystemEmail','I just saw this on {{ config.site_name }} - {{ page.title }}',0,'email_a_friend',NULL,'emf@e9digital.com','emf_reply@e9digital.com','<p>{% your_email %} just sent you a link:</p>\n\n<p>{% email_message %}</p>\n\n<p>You can visit \"{% page_title %}\" by clicking the link or pasting it into your browser: {% page_url %}</p>\n\n<p>The {% site_name %} Team</p>\n','{% your_email %} just sent you a link:\n\n{% email_message %}\n\nYou can visit \"{% page_title %}\" by clicking the link or pasting it into your browser: {% page_url %}\n\nThe {% site_name %} Team\n',NULL,'2011-09-16 20:27:10','2011-09-16 20:27:10',NULL),(4,2,'Comment Updates Email','SystemEmail','{% sender_username %} commented on {% site_name %} - {% page_title %}',0,'comment_update',NULL,'comments@e9digital.com','comments_reply@e9digital.com','<p>Dear {% recipient_first_name %}</p>\r\n\r\n<p>To see \"{% page_title %}\" and the comments, click on the link or paste it into your browser:\r\n{% page_url %}</p>\r\n\r\n<p>To unsubscribe to these alerts, click the link or paste it into your browser:\r\n{% recipient_unsubscribe_url %}</p>\r\n\r\n<p>Many thanks!</p>\r\n\r\n<p>The {% site_name %} Team</p>\r\n\r\n<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>\r\n','Dear {% recipient_first_name %}\r\n\r\nTo see \"{% page_title %}\" and the comments, click on the link or paste it into your browser:\r\n{% page_url %}\r\n\r\nTo unsubscribe to these alerts, click the link or paste it into your browser:\r\n{% recipient_unsubscribe_url %}\r\n\r\nMany thanks!\r\n\r\nThe {% site_name %} Team\r\n\r\nPS: If you have any trouble or have questions, you can simply reply to this email and let us know!\r\n',NULL,'2011-09-16 20:27:10','2011-09-23 16:44:16',NULL),(5,NULL,'Offer Conversion Email','SystemEmail','Lead for {{ offer.name }}',0,'offer_conversion_email',NULL,'offer_conversion@e9digital.com','offer_conversion@e9digital.com','The offer \"{{ offer.name }}\" was just converted.\r\n\r\nGo to the website\'s admin area to review this new lead.\r\n\r\nThanks,\r\n\r\nWebsite Team\r\n\r\n','The offer \"{{ offer.name }}\" was just converted.\r\n\r\nGo to the website\'s admin area to review this new lead.\r\n\r\nThanks,\r\n\r\nWebsite Team\r\n\r\n',NULL,'2011-09-16 20:27:34','2011-09-23 16:47:46',NULL),(6,1,'asdf','UserEmail','testing 123',1,NULL,'','asdf@asdf.com',NULL,'\r\n{{ config.can_spam_mailing_address }}\r\n\r\n{{ config.system_mailing_address }}\r\n\r\nhey hey hey','hey http://omfg.com\r\n\r\n{{ config.can_spam_mailing_address }}',NULL,'2011-09-28 21:02:12','2011-10-21 19:50:57','crm_template'),(7,1,'asdfff','UserEmail','woooowowwowoow',0,NULL,NULL,'travis@e9digital.com',NULL,'contact! {{ contact.name }}','\r\n',NULL,'2011-09-28 22:51:52','2011-09-30 21:45:22','newsletter'),(8,1,'Copy of asdfff','UserEmail','asdf',0,NULL,'','travis@e9digital.com',NULL,'<p>Dear {% recipient_first_name %},</p>\r\n<p>REPLACE WITH YOUR CONTENT HERE</p>\r\n<p>To unsubscribe from our email list, click the following link or paste it into your browser: {% recipient_unsubscribe_url %}</p>\r\n<p>Many thanks!</p>\r\n<p>The {% site_name %} Team</p>\r\n<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>\r\n<p>**** REPLACE WITH YOUR FULL STREET ADDRESS HERE TO COMPLY WITH CAN-SPAM ACT</p>\r\n','Dear {% recipient_first_name %},\r\n\r\nREPLACE WITH YOUR CONTENT HERE\r\n\r\nTo unsubscribe from our email list, click the following link or paste it into your browser:\r\n\r\n{% recipient_unsubscribe_url %}\r\n\r\nMany thanks!\r\n\r\nThe {% site_name %} Team \r\n\r\nPS: If you have any trouble or have questions, you can simply reply to this email and let us know!\r\n\r\n**** REPLACE WITH YOUR FULL STREET ADDRESS HERE TO COMPLY WITH CAN-SPAM ACT\r\n',NULL,'2011-09-29 17:01:12','2011-09-30 21:21:46','newsletter'),(9,1,'Bananas','UserEmail','asdf adsasdf',0,NULL,NULL,'asdf@asdf.com',NULL,'HTML BODY!','TEXT BODY!!!',NULL,'2011-09-29 17:01:44','2011-10-19 16:05:54','newsletter'),(10,1,'testing 123','UserEmail','testing 123',0,NULL,NULL,'travis@e9digital.com',NULL,'{{contact.name}}<br/>{{recipient.email}}<br/>{{campaign.code}}','{{contact.name}}\n{{recipient.email}}\n{{campaign.code}}',NULL,'2011-09-29 21:27:15','2011-10-07 21:30:17','crm_template'),(13,NULL,'Revocation Confirmation','SystemEmail','{{ config.site_name }} -- Your account has been revoked',1,'revocation_confirmation',NULL,'admin@e9digital.com','admin@e9digital.com','      <p>Hello</p>\n\n      The account registered for #email# has been deactivated as per your request.\n','      Hello\n\n      The account registered for #email# has been deactivated as per your request.\n',NULL,'2011-10-18 18:33:57','2011-10-18 18:33:57',NULL),(14,NULL,'Revocation Instructions','SystemEmail','{{ config.site_name }} -- Your account has been created',1,'revocation_instructions',NULL,'admin@e9digital.com','admin@e9digital.com','      <p>Hello #email#</p>\n\n      <p>You (or someone pretending to be you) has created an account at {% link_to root_url %}.</p>\n\n      <p>If you chose to sign up with us, please disregard this email!</p>\n\n      <p>However if this is not you, visit this url to take action: #revoke_account_url#</p>\n','      Hello #email#\n\n      You (or someone pretending to be you) has created an account at {% link_to root_url %}.\n\n      If you chose to sign up with us, please disregard this email!\n\n      However if this is not you, visit this url to take action: #revoke_account_url#\n',NULL,'2011-10-18 18:33:57','2011-10-18 18:33:57',NULL),(15,NULL,'New Registrant Notification','SystemEmail','{{ config.site_name }} - New Registrant',1,'new_registrant',NULL,'admin@example.com','admin@example.com','      <p>Greetings #first_name#!</p>\n\n      <p>There is a new registrant at {{ config.site_name }}.  Visit {% link_to admin_users_url %} to approve or deny new registrants.</p>\n','      Greetings #first_name#!\n\n      There is a new registrant at {{ config.site_name }}.  Visit {% link_to admin_users_url %} to approve or deny new registrants.\n',NULL,'2011-10-18 18:36:46','2011-10-18 18:36:46',NULL),(16,1,'asdfasdfasdf','UserEmail','asdfasdf',0,NULL,NULL,'asdf@asdf.com',NULL,'HTML BODY\r\n','TEXT BODY',NULL,'2011-10-19 15:53:41','2011-10-19 17:04:42','newsletter'),(17,1,'asdfasdf','UserEmail','asdfasdf',1,NULL,NULL,'',NULL,'<p>Dear {% recipient_first_name %},</p>\r\n<p>REPLACE WITH YOUR CONTENT HERE</p>\r\n<p>To unsubscribe from our email list, click the following link or paste it into your browser: {% recipient_unsubscribe_url %}</p>\r\n<p>Many thanks!</p>\r\n<p>The {% site_name %} Team</p>\r\n<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>\r\n<p>**** REPLACE WITH YOUR FULL STREET ADDRESS HERE TO COMPLY WITH CAN-SPAM ACT</p>\r\n','testing 123',NULL,'2011-10-20 15:30:36','2011-10-21 19:25:18','crm_template'),(18,NULL,'Employee Confirmation Email','SystemEmail','You have been confirmed as employee of {{ config.site_name }}',1,'elevation_notification',NULL,NULL,NULL,'<p>Dear #first_name#,</p>\n<p>You have just been confirmed as a employee of {{ config.site_name }}.</p>\n<p>Go to {% link_to edit_profile_url %} to enter your extended profile information.</p>\n<p>Many thanks!</p>\n<p>The {{ config.site_name }} Team<br />{{ config.can_spam_mailing_address}}</p>\n<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>\n','Dear #first_name#,\n\nYou have just been confirmed as a employee of {{ config.site_name }}.\n\nGo to {% link_to edit_profile_url %} to enter your extended profile information.\n\nMany thanks!\n\nThe {{ config.site_name }} Team\n{{ config.can_spam_mailing_address}}\n\nPS: If you have any trouble or have questions, you can simply reply to this email and let us know!\n',NULL,'2011-10-21 19:11:18','2011-10-21 19:11:18',NULL);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `favoritable_id` int(11) DEFAULT NULL,
  `favoritable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_favoritable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flaggable_id` int(11) DEFAULT NULL,
  `flaggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_flags_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_emails`
--

DROP TABLE IF EXISTS `friend_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `recipient_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_emails`
--

LOCK TABLES `friend_emails` WRITE;
/*!40000 ALTER TABLE `friend_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hits`
--

DROP TABLE IF EXISTS `hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hittable_id` int(11) DEFAULT NULL,
  `hittable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hits`
--

LOCK TABLES `hits` WRITE;
/*!40000 ALTER TABLE `hits` DISABLE KEYS */;
INSERT INTO `hits` VALUES (1,22,'ContentView','2011-09-20','2011-09-20 18:28:57','2011-09-20 18:28:57'),(2,21,'ContentView','2011-09-20','2011-09-20 18:29:00','2011-09-20 18:29:00'),(3,21,'ContentView','2011-09-20','2011-09-20 18:48:31','2011-09-20 18:48:31'),(4,21,'ContentView','2011-09-22','2011-09-22 20:00:49','2011-09-22 20:00:49'),(5,22,'ContentView','2011-10-12','2011-10-12 17:16:09','2011-10-12 17:16:09'),(6,22,'ContentView','2011-10-12','2011-10-12 17:22:16','2011-10-12 17:22:16'),(7,21,'ContentView','2011-10-12','2011-10-12 17:22:27','2011-10-12 17:22:27'),(8,48,'ContentView','2011-10-13','2011-10-13 20:13:42','2011-10-13 20:13:42'),(9,48,'ContentView','2011-10-13','2011-10-13 20:15:29','2011-10-13 20:15:29'),(10,48,'ContentView','2011-10-13','2011-10-13 20:15:31','2011-10-13 20:15:31'),(11,48,'ContentView','2011-10-13','2011-10-13 20:15:34','2011-10-13 20:15:34'),(12,48,'ContentView','2011-10-13','2011-10-13 20:15:36','2011-10-13 20:15:36'),(13,48,'ContentView','2011-10-13','2011-10-13 20:17:04','2011-10-13 20:17:04'),(14,48,'ContentView','2011-10-13','2011-10-13 20:17:06','2011-10-13 20:17:06'),(15,48,'ContentView','2011-10-13','2011-10-13 20:17:12','2011-10-13 20:17:12'),(16,48,'ContentView','2011-10-13','2011-10-13 20:17:14','2011-10-13 20:17:14'),(17,48,'ContentView','2011-10-13','2011-10-13 20:20:38','2011-10-13 20:20:38'),(18,48,'ContentView','2011-10-13','2011-10-13 20:20:41','2011-10-13 20:20:41'),(19,48,'ContentView','2011-10-13','2011-10-13 20:21:02','2011-10-13 20:21:02'),(20,48,'ContentView','2011-10-13','2011-10-13 20:21:04','2011-10-13 20:21:04'),(21,48,'ContentView','2011-10-13','2011-10-13 20:21:17','2011-10-13 20:21:17'),(22,48,'ContentView','2011-10-13','2011-10-13 20:21:19','2011-10-13 20:21:19'),(23,47,'ContentView','2011-10-13','2011-10-13 20:21:54','2011-10-13 20:21:54'),(24,47,'ContentView','2011-10-13','2011-10-13 20:21:56','2011-10-13 20:21:56'),(25,47,'ContentView','2011-10-13','2011-10-13 20:22:11','2011-10-13 20:22:11'),(26,23,'ContentView','2011-10-14','2011-10-14 15:34:28','2011-10-14 15:34:28'),(27,44,'ContentView','2011-10-14','2011-10-14 15:34:44','2011-10-14 15:34:44'),(28,45,'ContentView','2011-10-14','2011-10-14 18:00:03','2011-10-14 18:00:03'),(29,48,'ContentView','2011-10-14','2011-10-14 18:27:14','2011-10-14 18:27:14'),(30,48,'ContentView','2011-10-14','2011-10-14 18:27:16','2011-10-14 18:27:16'),(31,48,'ContentView','2011-10-14','2011-10-14 18:58:46','2011-10-14 18:58:46'),(32,48,'ContentView','2011-10-17','2011-10-17 21:40:32','2011-10-17 21:40:32'),(33,48,'ContentView','2011-10-17','2011-10-17 21:40:34','2011-10-17 21:40:34'),(34,48,'ContentView','2011-10-17','2011-10-17 21:42:55','2011-10-17 21:42:55'),(35,48,'ContentView','2011-10-17','2011-10-17 21:42:58','2011-10-17 21:42:58'),(36,48,'ContentView','2011-10-17','2011-10-17 21:44:06','2011-10-17 21:44:06'),(37,48,'ContentView','2011-10-17','2011-10-17 21:44:09','2011-10-17 21:44:09'),(38,48,'ContentView','2011-10-17','2011-10-17 21:45:35','2011-10-17 21:45:35'),(39,48,'ContentView','2011-10-17','2011-10-17 21:45:37','2011-10-17 21:45:37'),(40,48,'ContentView','2011-10-17','2011-10-17 21:45:52','2011-10-17 21:45:52'),(41,48,'ContentView','2011-10-17','2011-10-17 21:45:54','2011-10-17 21:45:54'),(42,48,'ContentView','2011-10-17','2011-10-17 21:48:48','2011-10-17 21:48:48'),(43,48,'ContentView','2011-10-17','2011-10-17 21:48:51','2011-10-17 21:48:51'),(44,48,'ContentView','2011-10-17','2011-10-17 21:49:00','2011-10-17 21:49:00'),(45,48,'ContentView','2011-10-17','2011-10-17 21:49:02','2011-10-17 21:49:02'),(46,48,'ContentView','2011-10-17','2011-10-17 22:07:46','2011-10-17 22:07:46'),(47,48,'ContentView','2011-10-17','2011-10-17 22:07:48','2011-10-17 22:07:48'),(48,48,'ContentView','2011-10-17','2011-10-17 22:11:31','2011-10-17 22:11:31'),(49,48,'ContentView','2011-10-17','2011-10-17 22:11:32','2011-10-17 22:11:32'),(51,48,'ContentView','2011-10-17','2011-10-17 22:47:34','2011-10-17 22:47:34'),(52,48,'ContentView','2011-10-17','2011-10-17 22:47:36','2011-10-17 22:47:36'),(53,48,'ContentView','2011-10-19','2011-10-19 15:43:18','2011-10-19 15:43:18'),(54,48,'ContentView','2011-10-19','2011-10-19 15:43:20','2011-10-19 15:43:20');
/*!40000 ALTER TABLE `hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image_spec_id` int(11) DEFAULT NULL,
  `imaged_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imaged_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'banner.jpg','2011-09-16 20:27:19','2011-09-16 20:27:19',NULL,'Renderable',7,1),(2,'cover.jpg','2011-09-26 22:28:24','2011-09-26 22:28:24',NULL,NULL,NULL,1),(3,'cover.jpg','2011-10-11 23:14:21','2011-10-11 23:14:21',NULL,NULL,NULL,2),(4,'avatar.png','2011-10-13 22:51:29','2011-10-13 23:00:03',NULL,'Renderable',15,1),(5,'cover.jpg','2011-10-13 22:58:50','2011-10-13 22:58:50',NULL,NULL,NULL,3),(6,'avatar.png','2011-10-13 22:59:02','2011-10-13 22:59:02',NULL,NULL,NULL,4),(7,'avatar.png','2011-10-13 22:59:26','2011-10-13 22:59:26',NULL,NULL,NULL,5),(8,'avatar.png','2011-10-13 22:59:59','2011-10-13 22:59:59',NULL,NULL,NULL,6),(9,NULL,'2011-10-13 23:02:37','2011-10-13 23:02:37',NULL,'Renderable',15,2),(10,'avatar.png','2011-10-13 23:02:48','2011-10-13 23:02:48',NULL,NULL,NULL,7);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layouts`
--

DROP TABLE IF EXISTS `layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preview` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `layout_preview` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `system` tinyint(1) DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prototypeable` tinyint(1) DEFAULT '0',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layouts`
--

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
INSERT INTO `layouts` VALUES (1,'user_page','Page: Two Column','application/default/page',NULL,'2011-09-16 20:27:12','2011-09-16 20:27:12',NULL,1,NULL,'guest',0,NULL),(2,'user_page_home','Page: Home','application/home',NULL,'2011-09-16 20:27:12','2011-09-16 20:27:12',NULL,1,1,'guest',0,NULL),(3,'user_page_one_column','Page: One Column','application/one_column',NULL,'2011-09-16 20:27:12','2011-09-16 20:27:12',NULL,1,1,'guest',0,NULL),(4,'user_page_admin','Admin','application/admin',NULL,'2011-09-16 20:27:12','2011-09-16 20:27:12',NULL,1,1,'e9_user',0,NULL),(5,'blog','Blog','application/default/blog',NULL,'2011-09-16 20:27:13','2011-09-16 20:27:13',NULL,1,NULL,'guest',0,NULL),(6,'forum','Forum','application/default/forum',NULL,'2011-09-16 20:27:13','2011-09-16 20:27:13',NULL,1,NULL,'guest',0,NULL),(7,'slide','Slide Default','application/default/slide',NULL,'2011-09-16 20:27:13','2011-10-13 20:15:26',NULL,1,NULL,'guest',0,NULL),(8,'slide_8','Slide One','application/default/slides/one',NULL,'2011-10-13 20:14:57','2011-10-13 20:14:57',NULL,0,7,'guest',0,NULL);
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layouts_region_types`
--

DROP TABLE IF EXISTS `layouts_region_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layouts_region_types` (
  `layout_id` int(11) DEFAULT NULL,
  `region_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layouts_region_types`
--

LOCK TABLES `layouts_region_types` WRITE;
/*!40000 ALTER TABLE `layouts_region_types` DISABLE KEYS */;
INSERT INTO `layouts_region_types` VALUES (1,1),(1,2),(1,4),(1,3),(1,7),(1,8),(1,5),(1,6),(2,1),(2,2),(2,4),(2,3),(2,7),(2,8),(2,5),(2,6),(3,1),(3,2),(3,4),(3,3),(3,7),(3,8),(3,5),(4,1),(4,2),(4,4),(4,3),(5,1),(5,2),(5,4),(5,3),(5,7),(5,8),(5,5),(5,6),(6,1),(6,2),(6,4),(6,3),(6,7),(6,8),(6,5),(6,6),(7,1),(7,2),(7,4),(7,3),(7,7),(7,8),(7,5),(7,6),(8,1),(8,2),(8,4),(8,3),(8,7),(8,8),(8,5),(8,6);
/*!40000 ALTER TABLE `layouts_region_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkable_id` int(11) DEFAULT NULL,
  `linkable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_linkable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,7,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:22','2011-09-16 20:27:22'),(2,8,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:23','2011-09-16 20:27:23'),(3,9,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:23','2011-09-16 20:27:23'),(4,10,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:23','2011-09-16 20:27:23'),(5,11,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:23','2011-09-16 20:27:23'),(6,12,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:23','2011-09-16 20:27:23'),(7,13,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:23','2011-09-16 20:27:23'),(8,14,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:23','2011-09-16 20:27:23'),(9,15,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:24','2011-09-16 20:27:24'),(10,16,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:24','2011-09-16 20:27:24'),(11,17,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:24','2011-09-16 20:27:24'),(12,18,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:24','2011-09-16 20:27:24'),(13,19,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:24','2011-09-16 20:27:24'),(14,20,'ContentView','LinkableSystemPage','guest','2011-09-16 20:27:24','2011-09-16 20:27:24'),(15,1,'Category','Blog','guest','2011-09-16 20:27:29','2011-09-16 20:27:29'),(16,2,'Category','Forum','guest','2011-09-16 20:27:29','2011-09-16 20:27:29'),(17,21,'ContentView','UserPage','guest','2011-09-16 20:27:31','2011-09-16 20:27:31'),(18,22,'ContentView','UserPage','guest','2011-09-16 20:27:31','2011-09-16 20:27:31'),(19,23,'ContentView','UserPage','guest','2011-09-16 20:27:31','2011-09-16 20:27:31'),(20,25,'ContentView','BlogPost','guest','2011-09-16 20:27:36','2011-09-16 20:27:36'),(21,26,'ContentView','BlogPost','guest','2011-09-16 20:27:37','2011-09-16 20:27:37'),(22,27,'ContentView','BlogPost','guest','2011-09-16 20:27:37','2011-09-16 20:27:37'),(23,28,'ContentView','BlogPost','guest','2011-09-16 20:27:37','2011-09-16 20:27:37'),(24,29,'ContentView','BlogPost','guest','2011-09-16 20:27:37','2011-09-16 20:27:37'),(25,30,'ContentView','BlogPost','guest','2011-09-16 20:27:37','2011-09-16 20:27:37'),(26,31,'ContentView','BlogPost','guest','2011-09-16 20:27:37','2011-09-16 20:27:37'),(27,32,'ContentView','BlogPost','guest','2011-09-16 20:27:38','2011-09-16 20:27:38'),(28,33,'ContentView','BlogPost','guest','2011-09-16 20:27:38','2011-09-16 20:27:38'),(29,34,'ContentView','BlogPost','guest','2011-09-16 20:27:38','2011-09-16 20:27:38'),(30,3,'Category','Faq','guest','2011-09-16 20:27:38','2011-09-16 20:27:38'),(31,4,'Category','Faq','guest','2011-09-16 20:27:38','2011-09-16 20:27:38'),(32,5,'Category','Faq','guest','2011-09-16 20:27:38','2011-09-16 20:27:38'),(33,35,'ContentView','Question','guest','2011-09-16 20:27:39','2011-09-16 20:27:39'),(34,36,'ContentView','Question','guest','2011-09-16 20:27:39','2011-09-16 20:27:39'),(35,37,'ContentView','Question','guest','2011-09-16 20:27:40','2011-09-16 20:27:40'),(36,6,'Category','Forum','guest','2011-09-16 20:27:40','2011-09-16 20:27:40'),(37,38,'ContentView','Topic','guest','2011-09-16 20:27:40','2011-09-16 20:27:40'),(38,39,'ContentView','Topic','guest','2011-09-16 20:27:40','2011-09-16 20:27:40'),(39,40,'ContentView','Topic','guest','2011-09-16 20:27:40','2011-09-16 20:27:40'),(40,7,'Category','Forum','guest','2011-09-16 20:27:40','2011-09-16 20:27:40'),(41,41,'ContentView','Topic','guest','2011-09-16 20:27:40','2011-09-16 20:27:40'),(42,42,'ContentView','Topic','guest','2011-09-16 20:27:40','2011-09-16 20:27:40'),(43,43,'ContentView','Topic','guest','2011-09-16 20:27:40','2011-09-16 20:27:40'),(44,8,'Category','Slideshow','guest','2011-09-16 20:27:41','2011-09-16 20:27:41'),(45,44,'ContentView','Slide','guest','2011-09-16 20:27:44','2011-09-16 20:27:44'),(46,45,'ContentView','Slide','guest','2011-09-16 20:27:45','2011-09-16 20:27:45'),(47,46,'ContentView','Slide','guest','2011-09-16 20:27:45','2011-09-16 20:27:45'),(48,47,'ContentView','Slide','guest','2011-09-16 20:27:46','2011-09-16 20:27:46'),(49,48,'ContentView','Slide','guest','2011-09-16 20:27:47','2011-09-16 20:27:47'),(66,29,'User','User','guest','2011-10-18 19:12:27','2011-10-18 19:12:27'),(69,50,'ContentView','LinkableSystemPage','guest','2011-10-18 21:54:47','2011-10-18 21:54:47'),(70,30,'User','User','guest','2011-10-18 21:58:43','2011-10-18 21:58:43');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailing_lists`
--

DROP TABLE IF EXISTS `mailing_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailing_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscriptions_count` int(11) DEFAULT '0',
  `system` tinyint(1) DEFAULT '0',
  `newsletter` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailing_lists`
--

LOCK TABLES `mailing_lists` WRITE;
/*!40000 ALTER TABLE `mailing_lists` DISABLE KEYS */;
INSERT INTO `mailing_lists` VALUES (1,'Default Newsletter (system)','newsletter','guest','Send me the default newsletter!',2,1,1,'2011-09-16 20:27:09','2011-09-16 20:27:09'),(2,'Comments and Topics Notification','coment_updates','guest','Email me when people comment on topics & pages that I saved or where I commented',2,1,0,'2011-09-16 20:27:09','2011-09-16 20:27:09'),(3,'New Content Posted Notification','new_content_alerts','guest','Email me when new content is posted to the site',0,1,0,'2011-09-16 20:27:09','2011-09-16 20:27:09'),(4,'Testing 124',NULL,'employee','hey whatup',0,0,1,'2011-10-20 16:39:56','2011-10-20 16:39:56');
/*!40000 ALTER TABLE `mailing_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_options`
--

DROP TABLE IF EXISTS `menu_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_options`
--

LOCK TABLES `menu_options` WRITE;
/*!40000 ALTER TABLE `menu_options` DISABLE KEYS */;
INSERT INTO `menu_options` VALUES (1,1,'Deal Category','Default'),(2,1,'Email','Personal'),(3,2,'Email','Work'),(4,3,'Email','Other'),(5,1,'Instant Messaging Handle','AIM'),(6,2,'Instant Messaging Handle','Google Talk'),(7,3,'Instant Messaging Handle','ICQ'),(8,4,'Instant Messaging Handle','Jabber'),(9,5,'Instant Messaging Handle','MSN'),(10,6,'Instant Messaging Handle','QQ'),(11,7,'Instant Messaging Handle','Skype'),(12,8,'Instant Messaging Handle','Yahoo'),(13,1,'Website','Personal'),(14,2,'Website','Work'),(15,3,'Website','Other'),(16,1,'Address','Personal'),(17,2,'Address','Work'),(18,3,'Address','Other'),(19,1,'Phone Number','Personal'),(20,2,'Phone Number','Work'),(21,3,'Phone Number','Mobile'),(22,4,'Phone Number','Other');
/*!40000 ALTER TABLE `menu_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `new_window` tinyint(1) DEFAULT '0',
  `external` tinyint(1) DEFAULT '0',
  `system` tinyint(1) DEFAULT '0',
  `logged_out_only` tinyint(1) DEFAULT '0',
  `delegate_title_to_link` tinyint(1) DEFAULT '1',
  `href` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toggle_eval` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `path_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Admin Menu','admin_menu',NULL,NULL,1,108,NULL,0,0,1,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:24','2011-10-05 15:25:42',NULL,NULL,0),(2,'Admin Home',NULL,NULL,1,2,13,1,0,0,0,0,1,'/admin/home',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:25',NULL,'HardLink',1),(3,'Analytics',NULL,NULL,2,3,4,2,0,1,0,0,1,'http://google.com/analytics',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:25',NULL,'HardLink',1),(4,'Flagged Comments',NULL,NULL,2,5,6,2,0,0,0,0,1,'/admin/comments/flagged',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:25',NULL,'HardLink',1),(5,'Search Log',NULL,NULL,2,7,8,2,0,0,0,0,1,'/admin/search_log',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:25',NULL,'HardLink',1),(6,'Social Feeds',NULL,NULL,2,9,10,2,0,0,0,0,1,'/admin/social_feeds',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:25',NULL,'HardLink',1),(7,'Users',NULL,NULL,2,11,12,2,0,0,0,0,1,'/admin/users',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:25',NULL,'HardLink',1),(8,'Content',NULL,NULL,1,14,29,1,0,0,0,0,1,'/admin/pages',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:26',NULL,'HardLink',1),(9,'Blog Posts',NULL,NULL,8,15,16,2,0,0,0,0,1,'/admin/blog_posts',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:25',NULL,'HardLink',1),(10,'FAQs',NULL,NULL,8,17,18,2,0,0,0,0,1,'/admin/faqs',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:25',NULL,'HardLink',1),(11,'Layouts',NULL,NULL,8,19,20,2,0,0,0,0,1,'/admin/layouts',NULL,NULL,'guest','2011-09-16 20:27:25','2011-09-16 20:27:25',NULL,'HardLink',1),(12,'Menus',NULL,NULL,8,21,22,2,0,0,0,0,1,'/admin/menus/main/submenus',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:26',NULL,'HardLink',1),(13,'Pages',NULL,NULL,8,23,24,2,0,0,0,0,1,'/admin/pages',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:26',NULL,'HardLink',1),(14,'Slides',NULL,NULL,8,25,26,2,0,0,0,0,1,'/admin/slides',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:26',NULL,'HardLink',1),(15,'System Pages',NULL,NULL,8,27,28,2,0,0,0,0,1,'/admin/system_pages',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:26',NULL,'HardLink',1),(16,'Widgets',NULL,NULL,1,30,45,1,0,0,0,0,1,'/admin/feed_widgets',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:27',NULL,'HardLink',1),(17,'Banners',NULL,NULL,16,31,32,2,0,0,0,0,1,'/admin/banners',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:26',NULL,'HardLink',1),(18,'Content Feed',NULL,NULL,16,33,34,2,0,0,0,0,1,'/admin/feed_widgets',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:26',NULL,'HardLink',1),(19,'Feed Templates',NULL,NULL,16,35,36,2,0,0,0,0,1,'/admin/widget_templates',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:26',NULL,'HardLink',1),(20,'Polls',NULL,NULL,16,37,38,2,0,0,0,0,1,'/admin/polls',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:26',NULL,'HardLink',1),(21,'Slideshow Widget',NULL,NULL,16,39,40,2,0,0,0,0,1,'/admin/slideshow_widgets',NULL,NULL,'guest','2011-09-16 20:27:26','2011-09-16 20:27:26',NULL,'HardLink',1),(22,'Snippets',NULL,NULL,16,41,42,2,0,0,0,0,1,'/admin/snippets',NULL,NULL,'guest','2011-09-16 20:27:27','2011-09-16 20:27:27',NULL,'HardLink',1),(23,'Top Content Feed',NULL,NULL,16,43,44,2,0,0,0,0,1,'/admin/top_widgets',NULL,NULL,'guest','2011-09-16 20:27:27','2011-09-16 20:27:27',NULL,'HardLink',1),(24,'Email Newsletters',NULL,NULL,1,46,51,1,0,0,0,0,1,'/admin/email/pending',NULL,NULL,'guest','2011-09-16 20:27:27','2011-09-16 20:27:27',NULL,'HardLink',1),(25,'Create Newsletter',NULL,NULL,24,47,48,2,0,0,0,0,1,'/admin/email/pending/new',NULL,NULL,'guest','2011-09-16 20:27:27','2011-09-16 20:27:27',NULL,'HardLink',1),(26,'Sent Newsletters',NULL,NULL,24,49,50,2,0,0,0,0,1,'/admin/email/sent',NULL,NULL,'guest','2011-09-16 20:27:27','2011-09-16 20:27:27',NULL,'HardLink',1),(27,'Settings',NULL,NULL,1,52,73,1,0,0,0,0,1,'/admin/settings',NULL,NULL,'guest','2011-09-16 20:27:27','2011-09-16 20:27:29',NULL,'HardLink',1),(28,'Content Settings',NULL,NULL,27,53,54,2,0,0,0,0,1,'/admin/settings/content',NULL,NULL,'guest','2011-09-16 20:27:27','2011-09-16 20:27:27',NULL,'HardLink',1),(29,'Email Settings',NULL,NULL,27,55,56,2,0,0,0,0,1,'/admin/settings/email',NULL,NULL,'guest','2011-09-16 20:27:27','2011-09-16 20:27:27',NULL,'HardLink',1),(30,'General Settings',NULL,NULL,27,57,58,2,0,0,0,0,1,'/admin/settings/general',NULL,NULL,'guest','2011-09-16 20:27:27','2011-09-16 20:27:27',NULL,'HardLink',1),(31,'Social Settings',NULL,NULL,27,59,60,2,0,0,0,0,1,'/admin/settings/social',NULL,NULL,'guest','2011-09-16 20:27:28','2011-09-16 20:27:28',NULL,'HardLink',1),(32,'Blogs',NULL,NULL,27,61,62,2,0,0,0,0,1,'/admin/blogs',NULL,NULL,'guest','2011-09-16 20:27:28','2011-09-16 20:27:28',NULL,'HardLink',1),(33,'Forums',NULL,NULL,27,63,64,2,0,0,0,0,1,'/admin/forums',NULL,NULL,'guest','2011-09-16 20:27:28','2011-09-16 20:27:28',NULL,'HardLink',1),(34,'Mailing Lists',NULL,NULL,27,65,66,2,0,0,0,0,1,'/admin/email/lists',NULL,NULL,'guest','2011-09-16 20:27:28','2011-09-16 20:27:28',NULL,'HardLink',1),(35,'Share Sites',NULL,NULL,27,67,68,2,0,0,0,0,1,'/admin/settings/share_sites',NULL,NULL,'guest','2011-09-16 20:27:28','2011-09-16 20:27:28',NULL,'HardLink',1),(36,'Slideshows',NULL,NULL,27,69,70,2,0,0,0,0,1,'/admin/slideshows',NULL,NULL,'guest','2011-09-16 20:27:29','2011-09-16 20:27:29',NULL,'HardLink',1),(37,'System Email',NULL,NULL,27,71,72,2,0,0,0,0,1,'/admin/email/system',NULL,NULL,'guest','2011-09-16 20:27:29','2011-09-16 20:27:29',NULL,'HardLink',1),(38,'Help',NULL,NULL,1,74,75,1,0,0,0,0,1,'/admin/help',NULL,NULL,'guest','2011-09-16 20:27:29','2011-09-16 20:27:29',NULL,'HardLink',1),(39,'Main Menu','main_menu',NULL,NULL,109,122,NULL,0,0,1,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:29','2011-10-18 21:58:00',NULL,NULL,1),(40,'Top Nav Menu','top_nav_menu',NULL,NULL,123,136,NULL,0,0,1,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:30','2011-09-16 20:27:30',NULL,NULL,1),(41,'Footer','footer_menu',NULL,NULL,137,148,NULL,0,0,1,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:30','2011-09-16 20:27:32',NULL,NULL,1),(42,'Admin',NULL,NULL,40,124,125,1,0,0,0,0,1,'/admin',NULL,NULL,'administrator','2011-09-16 20:27:30','2011-09-16 20:27:30',NULL,'HardLink',1),(43,NULL,NULL,8,40,126,127,1,0,0,0,0,1,NULL,NULL,NULL,'user','2011-09-16 20:27:30','2011-09-16 20:27:30',NULL,'SoftLink',1),(44,NULL,NULL,5,40,128,129,1,0,0,0,0,1,NULL,NULL,NULL,'user','2011-09-16 20:27:30','2011-09-16 20:27:30',NULL,'SoftLink',1),(45,'Sign Out',NULL,NULL,40,130,131,1,0,0,0,0,1,'/sign_out',NULL,NULL,'user','2011-09-16 20:27:30','2011-09-16 20:27:30',NULL,'HardLink',1),(46,NULL,NULL,9,40,132,133,1,0,0,0,1,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:30','2011-09-16 20:27:30',NULL,'SoftLink',1),(47,NULL,NULL,10,40,134,135,1,0,0,0,1,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:30','2011-09-16 20:27:30',NULL,'SoftLink',1),(48,NULL,NULL,18,41,138,139,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:31','2011-09-16 20:27:31',NULL,'SoftLink',1),(49,NULL,NULL,17,41,140,141,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:31','2011-09-16 20:27:31',NULL,'SoftLink',1),(50,'Blog',NULL,NULL,41,142,143,1,0,0,0,0,1,'/blogs/my-blog',NULL,NULL,'guest','2011-09-16 20:27:31','2011-09-16 20:27:31',NULL,'HardLink',1),(51,NULL,NULL,7,41,144,145,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:31','2011-09-16 20:27:31',NULL,'SoftLink',1),(52,NULL,NULL,19,41,146,147,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:32','2011-09-16 20:27:32',NULL,'SoftLink',1),(53,NULL,NULL,14,39,110,111,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:32','2011-09-20 21:29:14',NULL,'SoftLink',1),(54,NULL,NULL,18,39,112,113,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:32','2011-09-16 20:27:32',NULL,'SoftLink',1),(55,NULL,NULL,17,39,114,115,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:32','2011-09-16 20:27:32',NULL,'SoftLink',1),(56,NULL,NULL,15,39,116,117,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:32','2011-09-16 20:27:38',NULL,'SoftLink',1),(57,NULL,NULL,16,39,118,119,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:32','2011-10-18 21:58:00',NULL,'SoftLink',1),(58,'CRM',NULL,NULL,1,76,107,1,0,0,0,0,1,'/admin/crm',NULL,NULL,'guest','2011-09-16 20:27:32','2011-10-05 15:25:42',NULL,'HardLink',1),(59,'Campaigns',NULL,NULL,58,77,90,2,0,0,0,0,1,'/admin/crm/campaigns',NULL,NULL,'guest','2011-09-16 20:27:32','2011-10-05 15:25:02',NULL,'HardLink',1),(60,'Advertising',NULL,NULL,59,78,79,3,0,0,0,0,1,'/admin/crm/campaigns/advertising',NULL,NULL,'guest','2011-09-16 20:27:32','2011-09-16 20:27:32',NULL,'HardLink',1),(61,'Affiliate',NULL,NULL,59,80,81,3,0,0,0,0,1,'/admin/crm/campaigns/affiliate',NULL,NULL,'guest','2011-09-16 20:27:32','2011-09-16 20:27:32',NULL,'HardLink',1),(62,'Email',NULL,NULL,59,82,83,3,0,0,0,0,1,'/admin/email/templates',NULL,NULL,'guest','2011-09-16 20:27:33','2011-10-05 15:25:02',NULL,'HardLink',1),(63,'Sales',NULL,NULL,59,84,85,3,0,0,0,0,1,'/admin/crm/campaigns/sales',NULL,NULL,'guest','2011-09-16 20:27:33','2011-09-16 20:27:33',NULL,'HardLink',1),(64,'Campaign Groups',NULL,NULL,59,86,87,3,0,0,0,0,1,'/admin/crm/campaigns/groups',NULL,NULL,'guest','2011-09-16 20:27:33','2011-09-16 20:27:33',NULL,'HardLink',1),(65,'Activity Reports',NULL,NULL,59,88,89,3,0,0,0,0,1,'/admin/crm/campaigns/activity',NULL,NULL,'guest','2011-09-16 20:27:33','2011-09-16 20:27:33',NULL,'HardLink',1),(66,'Companies',NULL,NULL,58,91,92,2,0,0,0,0,1,'/admin/crm/companies',NULL,NULL,'guest','2011-09-16 20:27:33','2011-09-16 20:27:33',NULL,'HardLink',1),(67,'Contacts',NULL,NULL,58,93,94,2,0,0,0,0,1,'/admin/crm/contacts',NULL,NULL,'guest','2011-09-16 20:27:33','2011-09-16 20:27:33',NULL,'HardLink',1),(68,'Deals',NULL,NULL,58,95,96,2,0,0,0,0,1,'/admin/crm/deals',NULL,NULL,'guest','2011-09-16 20:27:33','2011-09-16 20:27:33',NULL,'HardLink',1),(69,'Email Templates',NULL,NULL,58,97,98,2,0,0,0,0,1,'/admin/email/templates',NULL,NULL,'guest','2011-09-16 20:27:33','2011-10-05 15:25:42',NULL,'HardLink',1),(70,'Leads',NULL,NULL,58,99,100,2,0,0,0,0,1,'/admin/crm/leads',NULL,NULL,'guest','2011-09-16 20:27:33','2011-09-16 20:27:33',NULL,'HardLink',1),(71,'Marketing Report',NULL,NULL,58,101,102,2,0,0,0,0,1,'/admin/crm/marketing_report',NULL,NULL,'guest','2011-09-16 20:27:34','2011-09-16 20:27:34',NULL,'HardLink',1),(72,'Menu Manager',NULL,NULL,58,103,104,2,0,0,0,0,1,'/admin/menu_options',NULL,NULL,'guest','2011-09-16 20:27:34','2011-09-16 20:27:34',NULL,'HardLink',1),(73,'Offers',NULL,NULL,58,105,106,2,0,0,0,0,1,'/admin/crm/offers',NULL,NULL,'guest','2011-09-16 20:27:34','2011-09-16 20:27:34',NULL,'HardLink',1),(74,NULL,NULL,44,39,120,121,1,0,0,0,0,1,NULL,NULL,NULL,'guest','2011-09-16 20:27:47','2011-09-16 20:27:47',NULL,'SoftLink',1);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `renderable_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,2,2,1,'2011-09-16 20:27:14','2011-09-16 20:27:14'),(2,2,18,1,'2011-09-16 20:27:14','2011-09-16 20:27:14'),(3,2,26,1,'2011-09-16 20:27:14','2011-09-16 20:27:14'),(4,2,46,1,'2011-09-16 20:27:14','2011-09-16 20:27:14'),(5,2,54,1,'2011-09-16 20:27:15','2011-09-16 20:27:15'),(6,2,62,1,'2011-09-16 20:27:15','2011-09-16 20:27:15'),(7,3,1,1,'2011-09-16 20:27:15','2011-09-16 20:27:15'),(8,3,17,1,'2011-09-16 20:27:15','2011-09-16 20:27:15'),(9,3,25,1,'2011-09-16 20:27:15','2011-09-16 20:27:15'),(10,3,41,1,'2011-09-16 20:27:15','2011-09-16 20:27:15'),(11,3,45,1,'2011-09-16 20:27:15','2011-09-16 20:27:15'),(12,3,53,1,'2011-09-16 20:27:16','2011-09-16 20:27:16'),(13,3,61,1,'2011-09-16 20:27:16','2011-09-16 20:27:16'),(14,4,3,1,'2011-09-16 20:27:16','2011-09-16 20:27:16'),(15,4,19,1,'2011-09-16 20:27:16','2011-09-16 20:27:16'),(16,4,27,1,'2011-09-16 20:27:16','2011-09-16 20:27:16'),(17,4,43,1,'2011-09-16 20:27:16','2011-09-16 20:27:16'),(18,4,47,1,'2011-09-16 20:27:16','2011-09-16 20:27:16'),(19,4,55,1,'2011-09-16 20:27:16','2011-09-16 20:27:16'),(20,4,63,1,'2011-09-16 20:27:16','2011-09-16 20:27:16'),(21,5,3,2,'2011-09-16 20:27:17','2011-09-16 20:27:17'),(22,5,19,2,'2011-09-16 20:27:17','2011-09-16 20:27:17'),(23,5,27,2,'2011-09-16 20:27:17','2011-09-16 20:27:17'),(24,5,43,2,'2011-09-16 20:27:17','2011-09-16 20:27:17'),(25,5,47,2,'2011-09-16 20:27:17','2011-09-16 20:27:17'),(26,5,55,2,'2011-09-16 20:27:18','2011-09-16 20:27:18'),(27,5,63,2,'2011-09-16 20:27:18','2011-09-16 20:27:18'),(28,6,4,1,'2011-09-16 20:27:18','2011-09-16 20:27:18'),(29,6,20,1,'2011-09-16 20:27:18','2011-09-16 20:27:18'),(30,6,28,1,'2011-09-16 20:27:18','2011-09-16 20:27:18'),(31,6,44,1,'2011-09-16 20:27:18','2011-09-16 20:27:18'),(32,6,48,1,'2011-09-16 20:27:18','2011-09-16 20:27:18'),(33,6,56,1,'2011-09-16 20:27:18','2011-09-16 20:27:18'),(34,6,64,1,'2011-09-16 20:27:18','2011-09-16 20:27:18'),(35,7,7,1,'2011-09-16 20:27:19','2011-09-16 20:27:19'),(36,7,23,1,'2011-09-16 20:27:19','2011-09-16 20:27:19'),(37,7,31,1,'2011-09-16 20:27:19','2011-09-16 20:27:19'),(38,7,51,1,'2011-09-16 20:27:19','2011-09-16 20:27:19'),(39,7,59,1,'2011-09-16 20:27:19','2011-09-16 20:27:19'),(40,7,67,1,'2011-09-16 20:27:20','2011-09-16 20:27:20'),(41,8,60,1,'2011-09-16 20:27:20','2011-09-16 20:27:20'),(42,9,52,1,'2011-09-16 20:27:20','2011-09-16 20:27:20'),(43,10,52,2,'2011-09-16 20:27:20','2011-09-16 20:27:20'),(44,11,8,1,'2011-09-16 20:27:20','2011-09-16 20:27:20'),(45,11,24,1,'2011-09-16 20:27:20','2011-09-16 20:27:20'),(46,11,32,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(47,11,52,3,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(48,11,60,2,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(49,11,68,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(50,12,42,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(51,3,69,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(52,12,70,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(53,4,71,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(54,5,71,2,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(55,6,72,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(56,3,73,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(57,12,74,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(58,4,75,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(59,5,75,2,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(60,6,76,1,'2011-09-16 20:27:21','2011-09-16 20:27:21'),(61,3,77,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(62,2,78,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(63,4,79,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(64,5,79,2,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(65,6,80,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(66,7,83,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(67,11,84,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(68,3,85,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(69,2,86,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(70,4,87,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(71,5,87,2,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(72,6,88,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(73,7,91,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(74,11,92,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(75,3,93,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(76,2,94,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(77,4,95,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(78,5,95,2,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(79,6,96,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(80,7,99,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(81,11,100,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(82,3,101,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(83,2,102,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(84,4,103,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(85,5,103,2,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(86,6,104,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(87,7,107,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(88,11,108,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(89,3,109,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(90,12,110,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(91,4,111,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(92,5,111,2,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(93,6,112,1,'2011-09-16 20:27:22','2011-09-16 20:27:22'),(94,3,113,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(95,2,114,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(96,4,115,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(97,5,115,2,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(98,6,116,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(99,7,119,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(100,9,120,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(101,10,120,2,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(102,11,120,3,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(103,3,121,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(104,2,122,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(105,4,123,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(106,5,123,2,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(107,6,124,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(108,7,127,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(109,8,128,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(110,11,128,2,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(111,3,129,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(112,2,130,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(113,4,131,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(114,5,131,2,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(115,6,132,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(116,7,135,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(117,11,136,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(118,3,137,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(119,2,138,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(120,4,139,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(121,5,139,2,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(122,6,140,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(123,7,143,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(124,11,144,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(125,3,145,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(126,2,146,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(127,4,147,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(128,5,147,2,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(129,6,148,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(130,7,151,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(131,11,152,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(132,3,153,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(133,2,154,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(134,4,155,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(135,5,155,2,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(136,6,156,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(137,7,159,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(138,11,160,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(139,3,161,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(140,2,162,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(141,4,163,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(142,5,163,2,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(143,6,164,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(144,7,167,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(145,11,168,1,'2011-09-16 20:27:23','2011-09-16 20:27:23'),(146,3,169,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(147,2,170,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(148,4,171,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(149,5,171,2,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(150,6,172,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(151,7,175,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(152,11,176,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(153,3,177,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(154,2,178,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(155,4,179,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(156,5,179,2,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(157,6,180,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(158,7,183,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(159,11,184,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(160,3,185,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(161,2,186,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(162,4,187,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(163,5,187,2,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(164,6,188,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(165,7,191,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(166,11,192,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(167,3,193,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(168,2,194,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(169,4,195,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(170,5,195,2,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(171,6,196,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(172,7,199,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(173,11,200,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(174,3,201,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(175,2,202,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(176,4,203,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(177,5,203,2,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(178,6,204,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(179,7,207,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(180,11,208,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(181,3,209,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(182,2,210,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(185,6,212,1,'2011-09-16 20:27:24','2011-09-16 20:27:24'),(188,3,217,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(189,2,218,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(190,4,219,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(191,5,219,2,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(192,6,220,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(193,7,223,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(194,9,224,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(195,10,224,2,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(196,11,224,3,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(197,3,225,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(198,2,226,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(199,4,227,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(200,5,227,2,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(201,6,228,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(202,7,231,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(203,8,232,1,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(204,11,232,2,'2011-09-16 20:27:29','2011-09-16 20:27:29'),(205,3,233,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(206,2,234,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(207,4,235,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(208,5,235,2,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(209,6,236,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(210,7,239,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(211,11,240,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(212,3,241,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(213,2,242,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(214,4,243,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(215,5,243,2,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(216,6,244,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(217,7,247,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(218,11,248,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(219,3,249,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(220,2,250,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(221,4,251,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(222,5,251,2,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(223,6,252,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(224,7,255,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(225,11,256,1,'2011-09-16 20:27:31','2011-09-16 20:27:31'),(226,3,257,1,'2011-09-16 20:27:34','2011-09-16 20:27:34'),(227,2,258,1,'2011-09-16 20:27:34','2011-09-16 20:27:34'),(228,4,259,1,'2011-09-16 20:27:34','2011-09-16 20:27:34'),(229,5,259,2,'2011-09-16 20:27:34','2011-09-16 20:27:34'),(230,6,260,1,'2011-09-16 20:27:34','2011-09-16 20:27:34'),(231,7,263,1,'2011-09-16 20:27:34','2011-09-16 20:27:34'),(232,11,264,1,'2011-09-16 20:27:34','2011-09-16 20:27:34'),(233,3,265,1,'2011-09-16 20:27:36','2011-09-16 20:27:36'),(234,2,266,1,'2011-09-16 20:27:36','2011-09-16 20:27:36'),(235,4,267,1,'2011-09-16 20:27:36','2011-09-16 20:27:36'),(236,5,267,2,'2011-09-16 20:27:36','2011-09-16 20:27:36'),(237,6,268,1,'2011-09-16 20:27:36','2011-09-16 20:27:36'),(238,7,271,1,'2011-09-16 20:27:36','2011-09-16 20:27:36'),(239,9,272,1,'2011-09-16 20:27:36','2011-09-16 20:27:36'),(240,10,272,2,'2011-09-16 20:27:36','2011-09-16 20:27:36'),(241,11,272,3,'2011-09-16 20:27:36','2011-09-16 20:27:36'),(242,3,273,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(243,2,274,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(244,4,275,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(245,5,275,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(246,6,276,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(247,7,279,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(248,9,280,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(249,10,280,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(250,11,280,3,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(251,3,281,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(252,2,282,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(253,4,283,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(254,5,283,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(255,6,284,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(256,7,287,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(257,9,288,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(258,10,288,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(259,11,288,3,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(260,3,289,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(261,2,290,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(262,4,291,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(263,5,291,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(264,6,292,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(265,7,295,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(266,9,296,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(267,10,296,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(268,11,296,3,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(269,3,297,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(270,2,298,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(271,4,299,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(272,5,299,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(273,6,300,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(274,7,303,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(275,9,304,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(276,10,304,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(277,11,304,3,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(278,3,305,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(279,2,306,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(280,4,307,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(281,5,307,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(282,6,308,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(283,7,311,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(284,9,312,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(285,10,312,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(286,11,312,3,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(287,3,313,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(288,2,314,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(289,4,315,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(290,5,315,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(291,6,316,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(292,7,319,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(293,9,320,1,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(294,10,320,2,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(295,11,320,3,'2011-09-16 20:27:37','2011-09-16 20:27:37'),(296,3,321,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(297,2,322,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(298,4,323,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(299,5,323,2,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(300,6,324,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(301,7,327,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(302,9,328,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(303,10,328,2,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(304,11,328,3,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(305,3,329,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(306,2,330,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(307,4,331,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(308,5,331,2,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(309,6,332,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(310,7,335,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(311,9,336,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(312,10,336,2,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(313,11,336,3,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(314,3,337,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(315,2,338,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(316,4,339,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(317,5,339,2,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(318,6,340,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(319,7,343,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(320,9,344,1,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(321,10,344,2,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(322,11,344,3,'2011-09-16 20:27:38','2011-09-16 20:27:38'),(363,4,211,1,'2011-09-20 21:29:14','2011-09-20 21:29:14'),(364,5,211,2,'2011-09-20 21:29:14','2011-09-20 21:29:14'),(365,7,215,1,'2011-09-20 21:29:14','2011-09-20 21:29:14'),(366,11,216,1,'2011-09-20 21:29:14','2011-09-20 21:29:14'),(367,13,216,2,'2011-09-20 21:29:14','2011-09-20 21:29:14'),(368,3,385,1,'2011-10-13 20:14:57','2011-10-13 20:14:57'),(369,2,386,1,'2011-10-13 20:14:57','2011-10-13 20:14:57'),(370,4,387,1,'2011-10-13 20:14:57','2011-10-13 20:14:57'),(371,5,387,2,'2011-10-13 20:14:57','2011-10-13 20:14:57'),(372,6,388,1,'2011-10-13 20:14:57','2011-10-13 20:14:57'),(373,7,391,1,'2011-10-13 20:14:57','2011-10-13 20:14:57'),(374,11,392,1,'2011-10-13 20:14:57','2011-10-13 20:14:57'),(375,3,393,1,'2011-10-13 20:16:41','2011-10-13 20:16:41'),(376,2,394,1,'2011-10-13 20:16:41','2011-10-13 20:16:41'),(377,4,395,1,'2011-10-13 20:16:41','2011-10-13 20:16:41'),(378,5,395,2,'2011-10-13 20:16:41','2011-10-13 20:16:41'),(379,6,396,1,'2011-10-13 20:16:41','2011-10-13 20:16:41'),(380,7,399,1,'2011-10-13 20:16:41','2011-10-13 20:16:41'),(381,11,400,1,'2011-10-13 20:16:41','2011-10-13 20:16:41'),(382,3,401,1,'2011-10-13 20:16:48','2011-10-13 20:16:48'),(383,2,402,1,'2011-10-13 20:16:48','2011-10-13 20:16:48'),(384,4,403,1,'2011-10-13 20:16:48','2011-10-13 20:16:48'),(385,5,403,2,'2011-10-13 20:16:48','2011-10-13 20:16:48'),(386,6,404,1,'2011-10-13 20:16:48','2011-10-13 20:16:48'),(387,7,407,1,'2011-10-13 20:16:48','2011-10-13 20:16:48'),(388,11,408,1,'2011-10-13 20:16:48','2011-10-13 20:16:48'),(389,3,409,1,'2011-10-13 20:16:50','2011-10-13 20:16:50'),(390,2,410,1,'2011-10-13 20:16:50','2011-10-13 20:16:50'),(391,4,411,1,'2011-10-13 20:16:50','2011-10-13 20:16:50'),(392,5,411,2,'2011-10-13 20:16:50','2011-10-13 20:16:50'),(393,6,412,1,'2011-10-13 20:16:50','2011-10-13 20:16:50'),(394,7,415,1,'2011-10-13 20:16:50','2011-10-13 20:16:50'),(395,11,416,1,'2011-10-13 20:16:50','2011-10-13 20:16:50'),(396,3,417,1,'2011-10-13 20:16:51','2011-10-13 20:16:51'),(397,2,418,1,'2011-10-13 20:16:51','2011-10-13 20:16:51'),(398,4,419,1,'2011-10-13 20:16:51','2011-10-13 20:16:51'),(399,5,419,2,'2011-10-13 20:16:51','2011-10-13 20:16:51'),(400,6,420,1,'2011-10-13 20:16:51','2011-10-13 20:16:51'),(401,7,423,1,'2011-10-13 20:16:51','2011-10-13 20:16:51'),(402,11,424,1,'2011-10-13 20:16:51','2011-10-13 20:16:51'),(403,3,425,1,'2011-10-13 20:16:53','2011-10-13 20:16:53'),(404,2,426,1,'2011-10-13 20:16:53','2011-10-13 20:16:53'),(405,4,427,1,'2011-10-13 20:16:53','2011-10-13 20:16:53'),(406,5,427,2,'2011-10-13 20:16:53','2011-10-13 20:16:53'),(407,6,428,1,'2011-10-13 20:16:53','2011-10-13 20:16:53'),(408,7,431,1,'2011-10-13 20:16:53','2011-10-13 20:16:53'),(409,11,432,1,'2011-10-13 20:16:53','2011-10-13 20:16:53'),(410,3,433,1,'2011-10-18 21:54:47','2011-10-18 21:54:47'),(411,2,434,1,'2011-10-18 21:54:47','2011-10-18 21:54:47'),(412,4,435,1,'2011-10-18 21:54:47','2011-10-18 21:54:47'),(413,5,435,2,'2011-10-18 21:54:47','2011-10-18 21:54:47'),(414,6,436,1,'2011-10-18 21:54:47','2011-10-18 21:54:47'),(415,7,439,1,'2011-10-18 21:54:47','2011-10-18 21:54:47'),(416,11,440,1,'2011-10-18 21:54:47','2011-10-18 21:54:47');
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_responses`
--

DROP TABLE IF EXISTS `offer_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_responses`
--

LOCK TABLES `offer_responses` WRITE;
/*!40000 ALTER TABLE `offer_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `tracking_cookie_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `converted_at` datetime DEFAULT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_views`
--

DROP TABLE IF EXISTS `page_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracking_cookie_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `request_path` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remote_ip` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_visit` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_page_views_on_campaign_id` (`campaign_id`),
  KEY `index_page_views_on_tracking_cookie_id` (`tracking_cookie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_views`
--

LOCK TABLES `page_views` WRITE;
/*!40000 ALTER TABLE `page_views` DISABLE KEYS */;
INSERT INTO `page_views` VALUES (524,34,1,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','396f941636b16b65ff33080150c36eae','127.0.0.1',1,'2011-10-20 19:07:26'),(525,34,1,'/forums/general-topics','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/','396f941636b16b65ff33080150c36eae','127.0.0.1',1,'2011-10-20 19:07:36'),(526,34,1,'/sign_in','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/forums/general-topics','396f941636b16b65ff33080150c36eae','127.0.0.1',1,'2011-10-20 19:09:23'),(527,34,1,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/sign_in','e38eb4dcde7ddf06475d7b242cc837a9','127.0.0.1',1,'2011-10-20 19:10:04'),(528,34,1,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/admin/crm/activity','e38eb4dcde7ddf06475d7b242cc837a9','127.0.0.1',1,'2011-10-20 19:37:58'),(529,34,1,'/sign_out','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/','e38eb4dcde7ddf06475d7b242cc837a9','127.0.0.1',1,'2011-10-20 20:02:29'),(530,34,1,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/','e38eb4dcde7ddf06475d7b242cc837a9','127.0.0.1',1,'2011-10-20 20:02:29'),(531,35,1,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','2d1e005e0d61492a636997230ac29bf5','127.0.0.1',1,'2011-10-20 20:02:45'),(532,35,7,'/?code=HEY','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','2d1e005e0d61492a636997230ac29bf5','127.0.0.1',1,'2011-10-20 20:04:34'),(533,35,7,'/sign_in','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/?code=HEY','2d1e005e0d61492a636997230ac29bf5','127.0.0.1',1,'2011-10-20 20:04:50'),(534,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/sign_in','e058fba8a3a7a173fa44e7dd1788b3d8','127.0.0.1',1,'2011-10-20 20:04:54'),(535,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','e058fba8a3a7a173fa44e7dd1788b3d8','127.0.0.1',1,'2011-10-01 03:00:00'),(536,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','9e1fb903960b3ba08f029b0bcb5b331b','127.0.0.1',0,'2011-10-21 14:21:41'),(537,35,7,'/sign_in','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/','9e1fb903960b3ba08f029b0bcb5b331b','127.0.0.1',0,'2011-10-21 14:24:14'),(538,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/sign_in','6c49fde7be4b2cee147805f452f8ea74','127.0.0.1',0,'2011-10-21 14:24:21'),(539,35,7,'/sign_in','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/admin/email/templates','6c49fde7be4b2cee147805f452f8ea74','127.0.0.1',0,'2011-10-21 19:12:43'),(540,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/sign_in','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 19:12:48'),(541,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 21:23:14'),(542,35,7,'/profile/edit','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/admin/crm/contacts/7/edit','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:00:37'),(543,35,7,'/profile/edit','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/admin/crm/contacts/7/edit','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:01:04'),(544,35,7,'/profile/edit','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/admin/crm/contacts/7/edit','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:01:20'),(545,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:05:08'),(546,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:05:13'),(547,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:09:14'),(548,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:09:20'),(549,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:10:14'),(550,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:10:18'),(551,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:12:45'),(552,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:26:08'),(553,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:26:47'),(554,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','http://localhost:3000/profiles','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:27:13'),(555,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:27:21'),(556,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:28:28'),(557,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:29:44'),(558,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:30:36'),(559,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:31:39'),(560,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:31:43'),(561,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:34:04'),(562,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:34:08'),(563,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:34:20'),(564,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:37:12'),(565,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:37:30'),(566,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:38:11'),(567,35,7,'/profiles','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:38:22'),(568,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:42:43'),(569,35,7,'/','Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2','/','4c68fe4456e5774599470d9a4fe52607','127.0.0.1',0,'2011-10-21 22:42:54');
/*!40000 ALTER TABLE `page_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answers`
--

DROP TABLE IF EXISTS `poll_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answers`
--

LOCK TABLES `poll_answers` WRITE;
/*!40000 ALTER TABLE `poll_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faq_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `text_version` text COLLATE utf8_unicode_ci,
  `display_author_info` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_attributes`
--

DROP TABLE IF EXISTS `record_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `record_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_attributes`
--

LOCK TABLES `record_attributes` WRITE;
/*!40000 ALTER TABLE `record_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_types`
--

DROP TABLE IF EXISTS `region_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `layout_only` tinyint(1) DEFAULT '0',
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_region_types_on_identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_types`
--

LOCK TABLES `region_types` WRITE;
/*!40000 ALTER TABLE `region_types` DISABLE KEYS */;
INSERT INTO `region_types` VALUES (1,'Top Nav','top-nav','e9_user',0,NULL),(2,'Main Nav','main-nav','e9_user',0,NULL),(3,'Bottom Footer','bottom-footer','e9_user',0,NULL),(4,'Footer','footer','administrator',0,NULL),(5,'Main Banner','main-banner','administrator',0,'banner_main'),(6,'Right Column','right','administrator',0,NULL),(7,'Content Top','content-top','administrator',0,NULL),(8,'Content Bottom','content-bottom','administrator',0,NULL);
/*!40000 ALTER TABLE `region_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_types_renderables`
--

DROP TABLE IF EXISTS `region_types_renderables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_types_renderables` (
  `region_type_id` int(11) DEFAULT NULL,
  `renderable_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_types_renderables`
--

LOCK TABLES `region_types_renderables` WRITE;
/*!40000 ALTER TABLE `region_types_renderables` DISABLE KEYS */;
INSERT INTO `region_types_renderables` VALUES (2,2),(1,3),(4,4),(4,5),(3,6),(5,7),(6,8),(6,9),(6,10),(6,11),(2,12),(6,13),(5,15);
/*!40000 ALTER TABLE `region_types_renderables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `view_id` int(11) DEFAULT NULL,
  `view_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,1,'Layout',1,'Top Nav','top-nav','2011-09-16 20:27:12','2011-09-16 20:27:12'),(2,1,'Layout',2,'Main Nav','main-nav','2011-09-16 20:27:12','2011-09-16 20:27:12'),(3,1,'Layout',4,'Footer','footer','2011-09-16 20:27:12','2011-09-16 20:27:12'),(4,1,'Layout',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:12','2011-09-16 20:27:12'),(5,1,'Layout',7,'Content Top','content-top','2011-09-16 20:27:12','2011-09-16 20:27:12'),(6,1,'Layout',8,'Content Bottom','content-bottom','2011-09-16 20:27:12','2011-09-16 20:27:12'),(7,1,'Layout',5,'Main Banner','main-banner','2011-09-16 20:27:12','2011-09-16 20:27:12'),(8,1,'Layout',6,'Right Column','right','2011-09-16 20:27:12','2011-09-16 20:27:12'),(17,2,'Layout',1,'Top Nav','top-nav','2011-09-16 20:27:12','2011-09-16 20:27:12'),(18,2,'Layout',2,'Main Nav','main-nav','2011-09-16 20:27:12','2011-09-16 20:27:12'),(19,2,'Layout',4,'Footer','footer','2011-09-16 20:27:12','2011-09-16 20:27:12'),(20,2,'Layout',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:12','2011-09-16 20:27:12'),(21,2,'Layout',7,'Content Top','content-top','2011-09-16 20:27:12','2011-09-16 20:27:12'),(22,2,'Layout',8,'Content Bottom','content-bottom','2011-09-16 20:27:12','2011-09-16 20:27:12'),(23,2,'Layout',5,'Main Banner','main-banner','2011-09-16 20:27:12','2011-09-16 20:27:12'),(24,2,'Layout',6,'Right Column','right','2011-09-16 20:27:12','2011-09-16 20:27:12'),(25,3,'Layout',1,'Top Nav','top-nav','2011-09-16 20:27:12','2011-09-16 20:27:12'),(26,3,'Layout',2,'Main Nav','main-nav','2011-09-16 20:27:12','2011-09-16 20:27:12'),(27,3,'Layout',4,'Footer','footer','2011-09-16 20:27:12','2011-09-16 20:27:12'),(28,3,'Layout',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:12','2011-09-16 20:27:12'),(29,3,'Layout',7,'Content Top','content-top','2011-09-16 20:27:12','2011-09-16 20:27:12'),(30,3,'Layout',8,'Content Bottom','content-bottom','2011-09-16 20:27:12','2011-09-16 20:27:12'),(31,3,'Layout',5,'Main Banner','main-banner','2011-09-16 20:27:12','2011-09-16 20:27:12'),(32,3,'Layout',6,'Right Column','right','2011-09-16 20:27:12','2011-09-16 20:27:12'),(41,4,'Layout',1,'Top Nav','top-nav','2011-09-16 20:27:13','2011-09-16 20:27:13'),(42,4,'Layout',2,'Main Nav','main-nav','2011-09-16 20:27:13','2011-09-16 20:27:13'),(43,4,'Layout',4,'Footer','footer','2011-09-16 20:27:13','2011-09-16 20:27:13'),(44,4,'Layout',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:13','2011-09-16 20:27:13'),(45,5,'Layout',1,'Top Nav','top-nav','2011-09-16 20:27:13','2011-09-16 20:27:13'),(46,5,'Layout',2,'Main Nav','main-nav','2011-09-16 20:27:13','2011-09-16 20:27:13'),(47,5,'Layout',4,'Footer','footer','2011-09-16 20:27:13','2011-09-16 20:27:13'),(48,5,'Layout',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:13','2011-09-16 20:27:13'),(49,5,'Layout',7,'Content Top','content-top','2011-09-16 20:27:13','2011-09-16 20:27:13'),(50,5,'Layout',8,'Content Bottom','content-bottom','2011-09-16 20:27:13','2011-09-16 20:27:13'),(51,5,'Layout',5,'Main Banner','main-banner','2011-09-16 20:27:13','2011-09-16 20:27:13'),(52,5,'Layout',6,'Right Column','right','2011-09-16 20:27:13','2011-09-16 20:27:13'),(53,6,'Layout',1,'Top Nav','top-nav','2011-09-16 20:27:13','2011-09-16 20:27:13'),(54,6,'Layout',2,'Main Nav','main-nav','2011-09-16 20:27:13','2011-09-16 20:27:13'),(55,6,'Layout',4,'Footer','footer','2011-09-16 20:27:13','2011-09-16 20:27:13'),(56,6,'Layout',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:13','2011-09-16 20:27:13'),(57,6,'Layout',7,'Content Top','content-top','2011-09-16 20:27:13','2011-09-16 20:27:13'),(58,6,'Layout',8,'Content Bottom','content-bottom','2011-09-16 20:27:13','2011-09-16 20:27:13'),(59,6,'Layout',5,'Main Banner','main-banner','2011-09-16 20:27:13','2011-09-16 20:27:13'),(60,6,'Layout',6,'Right Column','right','2011-09-16 20:27:13','2011-09-16 20:27:13'),(61,7,'Layout',1,'Top Nav','top-nav','2011-09-16 20:27:13','2011-09-16 20:27:13'),(62,7,'Layout',2,'Main Nav','main-nav','2011-09-16 20:27:13','2011-09-16 20:27:13'),(63,7,'Layout',4,'Footer','footer','2011-09-16 20:27:13','2011-09-16 20:27:13'),(64,7,'Layout',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:13','2011-09-16 20:27:13'),(65,7,'Layout',7,'Content Top','content-top','2011-09-16 20:27:13','2011-09-16 20:27:13'),(66,7,'Layout',8,'Content Bottom','content-bottom','2011-09-16 20:27:13','2011-09-16 20:27:13'),(67,7,'Layout',5,'Main Banner','main-banner','2011-09-16 20:27:13','2011-09-16 20:27:13'),(68,7,'Layout',6,'Right Column','right','2011-09-16 20:27:13','2011-09-16 20:27:13'),(69,1,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:21','2011-09-16 20:27:21'),(70,1,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:21','2011-09-16 20:27:21'),(71,1,'ContentView',4,'Footer','footer','2011-09-16 20:27:21','2011-09-16 20:27:21'),(72,1,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:21','2011-09-16 20:27:21'),(73,2,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:21','2011-09-16 20:27:21'),(74,2,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:21','2011-09-16 20:27:21'),(75,2,'ContentView',4,'Footer','footer','2011-09-16 20:27:21','2011-09-16 20:27:21'),(76,2,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:21','2011-09-16 20:27:21'),(77,3,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(78,3,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(79,3,'ContentView',4,'Footer','footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(80,3,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(81,3,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:22','2011-09-16 20:27:22'),(82,3,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:22','2011-09-16 20:27:22'),(83,3,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:22','2011-09-16 20:27:22'),(84,3,'ContentView',6,'Right Column','right','2011-09-16 20:27:22','2011-09-16 20:27:22'),(85,4,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(86,4,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(87,4,'ContentView',4,'Footer','footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(88,4,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(89,4,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:22','2011-09-16 20:27:22'),(90,4,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:22','2011-09-16 20:27:22'),(91,4,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:22','2011-09-16 20:27:22'),(92,4,'ContentView',6,'Right Column','right','2011-09-16 20:27:22','2011-09-16 20:27:22'),(93,5,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(94,5,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(95,5,'ContentView',4,'Footer','footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(96,5,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(97,5,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:22','2011-09-16 20:27:22'),(98,5,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:22','2011-09-16 20:27:22'),(99,5,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:22','2011-09-16 20:27:22'),(100,5,'ContentView',6,'Right Column','right','2011-09-16 20:27:22','2011-09-16 20:27:22'),(101,6,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(102,6,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(103,6,'ContentView',4,'Footer','footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(104,6,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(105,6,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:22','2011-09-16 20:27:22'),(106,6,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:22','2011-09-16 20:27:22'),(107,6,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:22','2011-09-16 20:27:22'),(108,6,'ContentView',6,'Right Column','right','2011-09-16 20:27:22','2011-09-16 20:27:22'),(109,7,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(110,7,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:22','2011-09-16 20:27:22'),(111,7,'ContentView',4,'Footer','footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(112,7,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:22','2011-09-16 20:27:22'),(113,8,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(114,8,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(115,8,'ContentView',4,'Footer','footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(116,8,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(117,8,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:23','2011-09-16 20:27:23'),(118,8,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:23','2011-09-16 20:27:23'),(119,8,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:23','2011-09-16 20:27:23'),(120,8,'ContentView',6,'Right Column','right','2011-09-16 20:27:23','2011-09-16 20:27:23'),(121,9,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(122,9,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(123,9,'ContentView',4,'Footer','footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(124,9,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(125,9,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:23','2011-09-16 20:27:23'),(126,9,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:23','2011-09-16 20:27:23'),(127,9,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:23','2011-09-16 20:27:23'),(128,9,'ContentView',6,'Right Column','right','2011-09-16 20:27:23','2011-09-16 20:27:23'),(129,10,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(130,10,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(131,10,'ContentView',4,'Footer','footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(132,10,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(133,10,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:23','2011-09-16 20:27:23'),(134,10,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:23','2011-09-16 20:27:23'),(135,10,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:23','2011-09-16 20:27:23'),(136,10,'ContentView',6,'Right Column','right','2011-09-16 20:27:23','2011-09-16 20:27:23'),(137,11,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(138,11,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(139,11,'ContentView',4,'Footer','footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(140,11,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(141,11,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:23','2011-09-16 20:27:23'),(142,11,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:23','2011-09-16 20:27:23'),(143,11,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:23','2011-09-16 20:27:23'),(144,11,'ContentView',6,'Right Column','right','2011-09-16 20:27:23','2011-09-16 20:27:23'),(145,12,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(146,12,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(147,12,'ContentView',4,'Footer','footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(148,12,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(149,12,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:23','2011-09-16 20:27:23'),(150,12,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:23','2011-09-16 20:27:23'),(151,12,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:23','2011-09-16 20:27:23'),(152,12,'ContentView',6,'Right Column','right','2011-09-16 20:27:23','2011-09-16 20:27:23'),(153,13,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(154,13,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(155,13,'ContentView',4,'Footer','footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(156,13,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(157,13,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:23','2011-09-16 20:27:23'),(158,13,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:23','2011-09-16 20:27:23'),(159,13,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:23','2011-09-16 20:27:23'),(160,13,'ContentView',6,'Right Column','right','2011-09-16 20:27:23','2011-09-16 20:27:23'),(161,14,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(162,14,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:23','2011-09-16 20:27:23'),(163,14,'ContentView',4,'Footer','footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(164,14,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:23','2011-09-16 20:27:23'),(165,14,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:23','2011-09-16 20:27:23'),(166,14,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:23','2011-09-16 20:27:23'),(167,14,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:23','2011-09-16 20:27:23'),(168,14,'ContentView',6,'Right Column','right','2011-09-16 20:27:23','2011-09-16 20:27:23'),(169,15,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(170,15,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(171,15,'ContentView',4,'Footer','footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(172,15,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(173,15,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:24','2011-09-16 20:27:24'),(174,15,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:24','2011-09-16 20:27:24'),(175,15,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:24','2011-09-16 20:27:24'),(176,15,'ContentView',6,'Right Column','right','2011-09-16 20:27:24','2011-09-16 20:27:24'),(177,16,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(178,16,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(179,16,'ContentView',4,'Footer','footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(180,16,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(181,16,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:24','2011-09-16 20:27:24'),(182,16,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:24','2011-09-16 20:27:24'),(183,16,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:24','2011-09-16 20:27:24'),(184,16,'ContentView',6,'Right Column','right','2011-09-16 20:27:24','2011-09-16 20:27:24'),(185,17,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(186,17,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(187,17,'ContentView',4,'Footer','footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(188,17,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(189,17,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:24','2011-09-16 20:27:24'),(190,17,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:24','2011-09-16 20:27:24'),(191,17,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:24','2011-09-16 20:27:24'),(192,17,'ContentView',6,'Right Column','right','2011-09-16 20:27:24','2011-09-16 20:27:24'),(193,18,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(194,18,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(195,18,'ContentView',4,'Footer','footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(196,18,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(197,18,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:24','2011-09-16 20:27:24'),(198,18,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:24','2011-09-16 20:27:24'),(199,18,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:24','2011-09-16 20:27:24'),(200,18,'ContentView',6,'Right Column','right','2011-09-16 20:27:24','2011-09-16 20:27:24'),(201,19,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(202,19,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(203,19,'ContentView',4,'Footer','footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(204,19,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(205,19,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:24','2011-09-16 20:27:24'),(206,19,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:24','2011-09-16 20:27:24'),(207,19,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:24','2011-09-16 20:27:24'),(208,19,'ContentView',6,'Right Column','right','2011-09-16 20:27:24','2011-09-16 20:27:24'),(209,20,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(210,20,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:24','2011-09-16 20:27:24'),(211,20,'ContentView',4,'Footer','footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(212,20,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:24','2011-09-16 20:27:24'),(213,20,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:24','2011-09-16 20:27:24'),(214,20,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:24','2011-09-16 20:27:24'),(215,20,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:24','2011-09-16 20:27:24'),(216,20,'ContentView',6,'Right Column','right','2011-09-16 20:27:24','2011-09-16 20:27:24'),(217,1,'Category',1,'Top Nav','top-nav','2011-09-16 20:27:29','2011-09-16 20:27:29'),(218,1,'Category',2,'Main Nav','main-nav','2011-09-16 20:27:29','2011-09-16 20:27:29'),(219,1,'Category',4,'Footer','footer','2011-09-16 20:27:29','2011-09-16 20:27:29'),(220,1,'Category',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:29','2011-09-16 20:27:29'),(221,1,'Category',7,'Content Top','content-top','2011-09-16 20:27:29','2011-09-16 20:27:29'),(222,1,'Category',8,'Content Bottom','content-bottom','2011-09-16 20:27:29','2011-09-16 20:27:29'),(223,1,'Category',5,'Main Banner','main-banner','2011-09-16 20:27:29','2011-09-16 20:27:29'),(224,1,'Category',6,'Right Column','right','2011-09-16 20:27:29','2011-09-16 20:27:29'),(225,2,'Category',1,'Top Nav','top-nav','2011-09-16 20:27:29','2011-09-16 20:27:29'),(226,2,'Category',2,'Main Nav','main-nav','2011-09-16 20:27:29','2011-09-16 20:27:29'),(227,2,'Category',4,'Footer','footer','2011-09-16 20:27:29','2011-09-16 20:27:29'),(228,2,'Category',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:29','2011-09-16 20:27:29'),(229,2,'Category',7,'Content Top','content-top','2011-09-16 20:27:29','2011-09-16 20:27:29'),(230,2,'Category',8,'Content Bottom','content-bottom','2011-09-16 20:27:29','2011-09-16 20:27:29'),(231,2,'Category',5,'Main Banner','main-banner','2011-09-16 20:27:29','2011-09-16 20:27:29'),(232,2,'Category',6,'Right Column','right','2011-09-16 20:27:29','2011-09-16 20:27:29'),(233,21,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:31','2011-09-16 20:27:31'),(234,21,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:31','2011-09-16 20:27:31'),(235,21,'ContentView',4,'Footer','footer','2011-09-16 20:27:31','2011-09-16 20:27:31'),(236,21,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:31','2011-09-16 20:27:31'),(237,21,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:31','2011-09-16 20:27:31'),(238,21,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:31','2011-09-16 20:27:31'),(239,21,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:31','2011-09-16 20:27:31'),(240,21,'ContentView',6,'Right Column','right','2011-09-16 20:27:31','2011-09-16 20:27:31'),(241,22,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:31','2011-09-16 20:27:31'),(242,22,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:31','2011-09-16 20:27:31'),(243,22,'ContentView',4,'Footer','footer','2011-09-16 20:27:31','2011-09-16 20:27:31'),(244,22,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:31','2011-09-16 20:27:31'),(245,22,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:31','2011-09-16 20:27:31'),(246,22,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:31','2011-09-16 20:27:31'),(247,22,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:31','2011-09-16 20:27:31'),(248,22,'ContentView',6,'Right Column','right','2011-09-16 20:27:31','2011-09-16 20:27:31'),(249,23,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:31','2011-09-16 20:27:31'),(250,23,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:31','2011-09-16 20:27:31'),(251,23,'ContentView',4,'Footer','footer','2011-09-16 20:27:31','2011-09-16 20:27:31'),(252,23,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:31','2011-09-16 20:27:31'),(253,23,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:31','2011-09-16 20:27:31'),(254,23,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:31','2011-09-16 20:27:31'),(255,23,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:31','2011-09-16 20:27:31'),(256,23,'ContentView',6,'Right Column','right','2011-09-16 20:27:31','2011-09-16 20:27:31'),(257,24,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:34','2011-09-16 20:27:34'),(258,24,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:34','2011-09-16 20:27:34'),(259,24,'ContentView',4,'Footer','footer','2011-09-16 20:27:34','2011-09-16 20:27:34'),(260,24,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:34','2011-09-16 20:27:34'),(261,24,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:34','2011-09-16 20:27:34'),(262,24,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:34','2011-09-16 20:27:34'),(263,24,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:34','2011-09-16 20:27:34'),(264,24,'ContentView',6,'Right Column','right','2011-09-16 20:27:34','2011-09-16 20:27:34'),(265,25,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:36','2011-09-16 20:27:36'),(266,25,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:36','2011-09-16 20:27:36'),(267,25,'ContentView',4,'Footer','footer','2011-09-16 20:27:36','2011-09-16 20:27:36'),(268,25,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:36','2011-09-16 20:27:36'),(269,25,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:36','2011-09-16 20:27:36'),(270,25,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:36','2011-09-16 20:27:36'),(271,25,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:36','2011-09-16 20:27:36'),(272,25,'ContentView',6,'Right Column','right','2011-09-16 20:27:36','2011-09-16 20:27:36'),(273,26,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(274,26,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(275,26,'ContentView',4,'Footer','footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(276,26,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(277,26,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:37','2011-09-16 20:27:37'),(278,26,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:37','2011-09-16 20:27:37'),(279,26,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:37','2011-09-16 20:27:37'),(280,26,'ContentView',6,'Right Column','right','2011-09-16 20:27:37','2011-09-16 20:27:37'),(281,27,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(282,27,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(283,27,'ContentView',4,'Footer','footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(284,27,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(285,27,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:37','2011-09-16 20:27:37'),(286,27,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:37','2011-09-16 20:27:37'),(287,27,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:37','2011-09-16 20:27:37'),(288,27,'ContentView',6,'Right Column','right','2011-09-16 20:27:37','2011-09-16 20:27:37'),(289,28,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(290,28,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(291,28,'ContentView',4,'Footer','footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(292,28,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(293,28,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:37','2011-09-16 20:27:37'),(294,28,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:37','2011-09-16 20:27:37'),(295,28,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:37','2011-09-16 20:27:37'),(296,28,'ContentView',6,'Right Column','right','2011-09-16 20:27:37','2011-09-16 20:27:37'),(297,29,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(298,29,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(299,29,'ContentView',4,'Footer','footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(300,29,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(301,29,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:37','2011-09-16 20:27:37'),(302,29,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:37','2011-09-16 20:27:37'),(303,29,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:37','2011-09-16 20:27:37'),(304,29,'ContentView',6,'Right Column','right','2011-09-16 20:27:37','2011-09-16 20:27:37'),(305,30,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(306,30,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(307,30,'ContentView',4,'Footer','footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(308,30,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(309,30,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:37','2011-09-16 20:27:37'),(310,30,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:37','2011-09-16 20:27:37'),(311,30,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:37','2011-09-16 20:27:37'),(312,30,'ContentView',6,'Right Column','right','2011-09-16 20:27:37','2011-09-16 20:27:37'),(313,31,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(314,31,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:37','2011-09-16 20:27:37'),(315,31,'ContentView',4,'Footer','footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(316,31,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:37','2011-09-16 20:27:37'),(317,31,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:37','2011-09-16 20:27:37'),(318,31,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:37','2011-09-16 20:27:37'),(319,31,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:37','2011-09-16 20:27:37'),(320,31,'ContentView',6,'Right Column','right','2011-09-16 20:27:37','2011-09-16 20:27:37'),(321,32,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:38','2011-09-16 20:27:38'),(322,32,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:38','2011-09-16 20:27:38'),(323,32,'ContentView',4,'Footer','footer','2011-09-16 20:27:38','2011-09-16 20:27:38'),(324,32,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:38','2011-09-16 20:27:38'),(325,32,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:38','2011-09-16 20:27:38'),(326,32,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:38','2011-09-16 20:27:38'),(327,32,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:38','2011-09-16 20:27:38'),(328,32,'ContentView',6,'Right Column','right','2011-09-16 20:27:38','2011-09-16 20:27:38'),(329,33,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:38','2011-09-16 20:27:38'),(330,33,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:38','2011-09-16 20:27:38'),(331,33,'ContentView',4,'Footer','footer','2011-09-16 20:27:38','2011-09-16 20:27:38'),(332,33,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:38','2011-09-16 20:27:38'),(333,33,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:38','2011-09-16 20:27:38'),(334,33,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:38','2011-09-16 20:27:38'),(335,33,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:38','2011-09-16 20:27:38'),(336,33,'ContentView',6,'Right Column','right','2011-09-16 20:27:38','2011-09-16 20:27:38'),(337,34,'ContentView',1,'Top Nav','top-nav','2011-09-16 20:27:38','2011-09-16 20:27:38'),(338,34,'ContentView',2,'Main Nav','main-nav','2011-09-16 20:27:38','2011-09-16 20:27:38'),(339,34,'ContentView',4,'Footer','footer','2011-09-16 20:27:38','2011-09-16 20:27:38'),(340,34,'ContentView',3,'Bottom Footer','bottom-footer','2011-09-16 20:27:38','2011-09-16 20:27:38'),(341,34,'ContentView',7,'Content Top','content-top','2011-09-16 20:27:38','2011-09-16 20:27:38'),(342,34,'ContentView',8,'Content Bottom','content-bottom','2011-09-16 20:27:38','2011-09-16 20:27:38'),(343,34,'ContentView',5,'Main Banner','main-banner','2011-09-16 20:27:38','2011-09-16 20:27:38'),(344,34,'ContentView',6,'Right Column','right','2011-09-16 20:27:38','2011-09-16 20:27:38'),(385,8,'Layout',1,'Top Nav','top-nav','2011-10-13 20:14:57','2011-10-13 20:14:57'),(386,8,'Layout',2,'Main Nav','main-nav','2011-10-13 20:14:57','2011-10-13 20:14:57'),(387,8,'Layout',4,'Footer','footer','2011-10-13 20:14:57','2011-10-13 20:14:57'),(388,8,'Layout',3,'Bottom Footer','bottom-footer','2011-10-13 20:14:57','2011-10-13 20:14:57'),(389,8,'Layout',7,'Content Top','content-top','2011-10-13 20:14:57','2011-10-13 20:14:57'),(390,8,'Layout',8,'Content Bottom','content-bottom','2011-10-13 20:14:57','2011-10-13 20:14:57'),(391,8,'Layout',5,'Main Banner','main-banner','2011-10-13 20:14:57','2011-10-13 20:14:57'),(392,8,'Layout',6,'Right Column','right','2011-10-13 20:14:57','2011-10-13 20:14:57'),(393,44,'ContentView',1,'Top Nav','top-nav','2011-10-13 20:16:41','2011-10-13 20:16:41'),(394,44,'ContentView',2,'Main Nav','main-nav','2011-10-13 20:16:41','2011-10-13 20:16:41'),(395,44,'ContentView',4,'Footer','footer','2011-10-13 20:16:41','2011-10-13 20:16:41'),(396,44,'ContentView',3,'Bottom Footer','bottom-footer','2011-10-13 20:16:41','2011-10-13 20:16:41'),(397,44,'ContentView',7,'Content Top','content-top','2011-10-13 20:16:41','2011-10-13 20:16:41'),(398,44,'ContentView',8,'Content Bottom','content-bottom','2011-10-13 20:16:41','2011-10-13 20:16:41'),(399,44,'ContentView',5,'Main Banner','main-banner','2011-10-13 20:16:41','2011-10-13 20:16:41'),(400,44,'ContentView',6,'Right Column','right','2011-10-13 20:16:41','2011-10-13 20:16:41'),(401,45,'ContentView',1,'Top Nav','top-nav','2011-10-13 20:16:48','2011-10-13 20:16:48'),(402,45,'ContentView',2,'Main Nav','main-nav','2011-10-13 20:16:48','2011-10-13 20:16:48'),(403,45,'ContentView',4,'Footer','footer','2011-10-13 20:16:48','2011-10-13 20:16:48'),(404,45,'ContentView',3,'Bottom Footer','bottom-footer','2011-10-13 20:16:48','2011-10-13 20:16:48'),(405,45,'ContentView',7,'Content Top','content-top','2011-10-13 20:16:48','2011-10-13 20:16:48'),(406,45,'ContentView',8,'Content Bottom','content-bottom','2011-10-13 20:16:48','2011-10-13 20:16:48'),(407,45,'ContentView',5,'Main Banner','main-banner','2011-10-13 20:16:48','2011-10-13 20:16:48'),(408,45,'ContentView',6,'Right Column','right','2011-10-13 20:16:48','2011-10-13 20:16:48'),(409,46,'ContentView',1,'Top Nav','top-nav','2011-10-13 20:16:50','2011-10-13 20:16:50'),(410,46,'ContentView',2,'Main Nav','main-nav','2011-10-13 20:16:50','2011-10-13 20:16:50'),(411,46,'ContentView',4,'Footer','footer','2011-10-13 20:16:50','2011-10-13 20:16:50'),(412,46,'ContentView',3,'Bottom Footer','bottom-footer','2011-10-13 20:16:50','2011-10-13 20:16:50'),(413,46,'ContentView',7,'Content Top','content-top','2011-10-13 20:16:50','2011-10-13 20:16:50'),(414,46,'ContentView',8,'Content Bottom','content-bottom','2011-10-13 20:16:50','2011-10-13 20:16:50'),(415,46,'ContentView',5,'Main Banner','main-banner','2011-10-13 20:16:50','2011-10-13 20:16:50'),(416,46,'ContentView',6,'Right Column','right','2011-10-13 20:16:50','2011-10-13 20:16:50'),(417,47,'ContentView',1,'Top Nav','top-nav','2011-10-13 20:16:51','2011-10-13 20:16:51'),(418,47,'ContentView',2,'Main Nav','main-nav','2011-10-13 20:16:51','2011-10-13 20:16:51'),(419,47,'ContentView',4,'Footer','footer','2011-10-13 20:16:51','2011-10-13 20:16:51'),(420,47,'ContentView',3,'Bottom Footer','bottom-footer','2011-10-13 20:16:51','2011-10-13 20:16:51'),(421,47,'ContentView',7,'Content Top','content-top','2011-10-13 20:16:51','2011-10-13 20:16:51'),(422,47,'ContentView',8,'Content Bottom','content-bottom','2011-10-13 20:16:51','2011-10-13 20:16:51'),(423,47,'ContentView',5,'Main Banner','main-banner','2011-10-13 20:16:51','2011-10-13 20:16:51'),(424,47,'ContentView',6,'Right Column','right','2011-10-13 20:16:51','2011-10-13 20:16:51'),(425,48,'ContentView',1,'Top Nav','top-nav','2011-10-13 20:16:53','2011-10-13 20:16:53'),(426,48,'ContentView',2,'Main Nav','main-nav','2011-10-13 20:16:53','2011-10-13 20:16:53'),(427,48,'ContentView',4,'Footer','footer','2011-10-13 20:16:53','2011-10-13 20:16:53'),(428,48,'ContentView',3,'Bottom Footer','bottom-footer','2011-10-13 20:16:53','2011-10-13 20:16:53'),(429,48,'ContentView',7,'Content Top','content-top','2011-10-13 20:16:53','2011-10-13 20:16:53'),(430,48,'ContentView',8,'Content Bottom','content-bottom','2011-10-13 20:16:53','2011-10-13 20:16:53'),(431,48,'ContentView',5,'Main Banner','main-banner','2011-10-13 20:16:53','2011-10-13 20:16:53'),(432,48,'ContentView',6,'Right Column','right','2011-10-13 20:16:53','2011-10-13 20:16:53'),(433,50,'ContentView',1,'Top Nav','top-nav','2011-10-18 21:54:47','2011-10-18 21:54:47'),(434,50,'ContentView',2,'Main Nav','main-nav','2011-10-18 21:54:47','2011-10-18 21:54:47'),(435,50,'ContentView',4,'Footer','footer','2011-10-18 21:54:47','2011-10-18 21:54:47'),(436,50,'ContentView',3,'Bottom Footer','bottom-footer','2011-10-18 21:54:47','2011-10-18 21:54:47'),(437,50,'ContentView',7,'Content Top','content-top','2011-10-18 21:54:47','2011-10-18 21:54:47'),(438,50,'ContentView',8,'Content Bottom','content-bottom','2011-10-18 21:54:47','2011-10-18 21:54:47'),(439,50,'ContentView',5,'Main Banner','main-banner','2011-10-18 21:54:47','2011-10-18 21:54:47'),(440,50,'ContentView',6,'Right Column','right','2011-10-18 21:54:47','2011-10-18 21:54:47');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renderables`
--

DROP TABLE IF EXISTS `renderables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renderables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `template` text COLLATE utf8_unicode_ci,
  `revert_template` text COLLATE utf8_unicode_ci,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `associated_id` int(11) DEFAULT NULL,
  `system` tinyint(1) DEFAULT '0',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renderables`
--

LOCK TABLES `renderables` WRITE;
/*!40000 ALTER TABLE `renderables` DISABLE KEYS */;
INSERT INTO `renderables` VALUES (1,'Slide One','ImageSpec','administrator','2011-09-16 20:27:13','2011-09-16 20:27:13',NULL,NULL,NULL,NULL,1,505,335,7,'Layout',NULL,NULL),(2,'Main Menu','Snippet','administrator','2011-09-16 20:27:14','2011-09-16 20:27:14','<ul class=\"menu\">{% menu identifier[main_menu] %}</ul>',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Top Nav Content','Snippet','administrator','2011-09-16 20:27:15','2011-09-16 20:27:15','<ul class=\"right\">\n  <li class=\"welcome\">\n    {% if current_user %}\n      {% welcome_firstname %}\n    {% else %}\n      Welcome!\n    {% endif %}\n  </li>\n  {% menu identifier[top_nav_menu] %}\n  <li class=\"search\"> \n    <form method=\"GET\" action=\"/search\" style=\"display:none\">\n      <fieldset>\n        <input type=\"text\" name=\"query\" id=\"search_query\" >\n      </fieldset>\n    </form>\n    <a href=\"#\">Search</a>\n  </li>\n</ul>\n',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Title & Author Feed','FeedWidget','administrator','2011-09-16 20:27:16','2011-09-16 20:27:16',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,3,'--- \ncontent_type: \n- user_page\nlimit: 2\n'),(5,'Footer Menu & Social Links','Snippet','administrator','2011-09-16 20:27:16','2011-09-16 20:27:16','<div class=\"footer-module\">\n  <ul class=\"footer-menu menu\">\n    {% menu identifier[footer_menu] %}\n  </ul>\n  <ul class=\"social-module\">\n    <li><a class=\"social-link facebook\" href=\"{{ config.facebook_company_page_url }}\" rel=\"external\">Favorite us on Facebook</a></li>\n    <li><a class=\"social-link twitter\" href=\"{{ config.twitter_company_page_url }}\" rel=\"external\">Follow us on Twitter</a></li>\n    <li><a class=\"social-link linked-in\" href=\"{{ config.linked_in_company_page_url }}\" rel=\"external\">Connect on LinkedIn</a></li>\n    <li>\n      <a class=\"social-link hello\" href=\"/contact-us\">\n        For more BNI Lucky 62 info, call us at: <span class=\"maroon italic\">1.646.233.1068</span>\n      </a>\n    </li>\n  </ul>\n</div>\n','<div class=\"footer-module\">\n  <ul class=\"footer-menu menu\">\n    {% menu identifier[footer_menu] %}\n  </ul>\n  <ul class=\"social-module\">\n    <li><a class=\"social-link facebook\" href=\"{{ config.facebook_company_page_url }}\" rel=\"external\">Favorite us on Facebook</a></li>\n    <li><a class=\"social-link twitter\" href=\"{{ config.twitter_company_page_url }}\" rel=\"external\">Follow us on Twitter</a></li>\n    <li><a class=\"social-link linked-in\" href=\"{{ config.linked_in_company_page_url }}\" rel=\"external\">Connect on LinkedIn</a></li>\n    <li>\n      <a class=\"social-link hello\" href=\"/contact-us\">\n        For more BNI Lucky 62 info, call us at: <span class=\"maroon italic\">1.646.233.1068</span>\n      </a>\n    </li>\n  </ul>\n</div>\n',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Bottom Footer Content','Snippet','e9_user','2011-09-16 20:27:18','2011-09-16 20:27:18','<span class=\"copyright\">{% helper footer_copyright_content %}</span>\n<span> | </span>\n<span class=\"marketsmiths\">\n  <a href=\"http://www.marketsmiths.com\" rel=\"external\">Website copy</a> \n  by \n  <a href=\"http://www.marketsmiths.com\" rel=\"external\">MarketSmiths</a>\n</span>\n<span class=\"e9digital\">\n  {% helper link_to_google_bomb %}\n</span>\n','<span class=\"copyright\">{% helper footer_copyright_content %}</span>\n<span> | </span>\n<span class=\"marketsmiths\">\n  <a href=\"http://www.marketsmiths.com\" rel=\"external\">Website copy</a> \n  by \n  <a href=\"http://www.marketsmiths.com\" rel=\"external\">MarketSmiths</a>\n</span>\n<span class=\"e9digital\">\n  {% helper link_to_google_bomb %}\n</span>\n',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Main Banner','Banner','user','2011-09-16 20:27:19','2011-09-16 20:27:19',NULL,NULL,NULL,NULL,0,985,287,NULL,NULL,NULL,NULL),(8,'Forum Menu','Partial','e9_user','2011-09-16 20:27:20','2011-09-16 20:27:20',NULL,NULL,'partials/forum_menu',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Blog Menu','Partial','e9_user','2011-09-16 20:27:20','2011-09-16 20:27:20',NULL,NULL,'partials/blog_menu',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(10,'Previous/Next Links','Snippet','administrator','2011-09-16 20:27:20','2011-09-16 20:27:20','{% if page.previous_record or page.next_record %}\n  <div class=\"record-seq\">\n    <div class=\"record-seq-prev\">\n    {% if page.previous_record %}   \n      <div class=\"record-seq-link\">{% link_to previous_record text[&lt; Previous] %}</div>\n      <div class=\"record-seq-image\">{% link_to previous_record thumb[true] %}</div>\n      <div class=\"record-seq-title\">{% link_to previous_record %}</div>\n      <div class=\"record-seq-dateline\">{{ page.previous_record.created_at }}</div>\n      <div class=\"record-seq-author\">by {{ page.previous_record.author.name }}</div>\n      <div class=\"record-seq-summary\">{{ page.previous_record.summary | truncate: 50 }}</div>\n    {% else %} \n      <div class=\"record-seq-link\"><span class=\"ico\">&lt; Previous</span></div>\n      <div class=\"record-seq-image\"><img src=\"/images/defaults/blog_nav_thumb.png\" /></div>\n      <div class=\"record-seq-title\">{{ page.parent.title }}</div>\n    {% endif %}\n    </div>\n    <div class=\"record-seq-next\">\n    {% if page.next_record %} \n      <div class=\"record-seq-link\">{% link_to next_record text[Next &gt;] %}</div>\n      <div class=\"record-seq-image\">{% link_to next_record thumb[true] %}</div>\n      <div class=\"record-seq-title\">{% link_to next_record %}</div>\n      <div class=\"record-seq-dateline\">{{ page.next_record.created_at }}</div>\n      <div class=\"record-seq-author\">by {{ page.next_record.author.name }}</div>\n      <div class=\"record-seq-summary\">{{ page.next_record.summary | truncate: 50 }}</div>\n    {% else %} \n      <div class=\"record-seq-link\"><span class=\"ico\">Next &gt;</span></div>\n      <div class=\"record-seq-image\"><img src=\"/images/defaults/blog_nav_thumb.png\" /></div>\n      <div class=\"record-seq-title\">{{ page.parent.title }}</div>\n    {% endif %}\n    </div>\n  </div>\n{% endif %}\n','{% if page.previous_record or page.next_record %}\n  <div class=\"record-seq\">\n    <div class=\"record-seq-prev\">\n    {% if page.previous_record %}   \n      <div class=\"record-seq-link\">{% link_to previous_record text[&lt; Previous] %}</div>\n      <div class=\"record-seq-image\">{% link_to previous_record thumb[true] %}</div>\n      <div class=\"record-seq-title\">{% link_to previous_record %}</div>\n      <div class=\"record-seq-dateline\">{{ page.previous_record.created_at }}</div>\n      <div class=\"record-seq-author\">by {{ page.previous_record.author.name }}</div>\n      <div class=\"record-seq-summary\">{{ page.previous_record.summary | truncate: 50 }}</div>\n    {% else %} \n      <div class=\"record-seq-link\"><span class=\"ico\">&lt; Previous</span></div>\n      <div class=\"record-seq-image\"><img src=\"/images/defaults/blog_nav_thumb.png\" /></div>\n      <div class=\"record-seq-title\">{{ page.parent.title }}</div>\n    {% endif %}\n    </div>\n    <div class=\"record-seq-next\">\n    {% if page.next_record %} \n      <div class=\"record-seq-link\">{% link_to next_record text[Next &gt;] %}</div>\n      <div class=\"record-seq-image\">{% link_to next_record thumb[true] %}</div>\n      <div class=\"record-seq-title\">{% link_to next_record %}</div>\n      <div class=\"record-seq-dateline\">{{ page.next_record.created_at }}</div>\n      <div class=\"record-seq-author\">by {{ page.next_record.author.name }}</div>\n      <div class=\"record-seq-summary\">{{ page.next_record.summary | truncate: 50 }}</div>\n    {% else %} \n      <div class=\"record-seq-link\"><span class=\"ico\">Next &gt;</span></div>\n      <div class=\"record-seq-image\"><img src=\"/images/defaults/blog_nav_thumb.png\" /></div>\n      <div class=\"record-seq-title\">{{ page.parent.title }}</div>\n    {% endif %}\n    </div>\n  </div>\n{% endif %}\n',NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL),(11,'Blog Feed','FeedWidget','administrator','2011-09-16 20:27:20','2011-09-16 20:27:20',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,'--- \nheader_text: Find more tips in my energy saving blog!\nlimit: 2\n'),(12,'Admin Menu','Snippet','user','2011-09-16 20:27:21','2011-09-16 20:27:21','<ul class=\"menu\">{% menu identifier[admin_menu] %}</ul>',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(13,'testing 123','Offer','administrator','2011-09-20 21:24:51','2011-09-20 21:33:20','Hey what\'s going on.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'--- \nsubmit_button_text: Submit!\nsuccess_page_text: Thank you!\nconversion_alert_email: \"\"\ncustom_form_html: |-\n  <div class=\"field\">\r\n    <label>Whatup</label>\r\n    <input type=\"text\" name=\"deal[options][whatup]\" class=\"email required\"/>\r\n  </div>\nmailing_list_ids: []\n\n'),(14,'Copy of Slide One (1)','ImageSpec','administrator','2011-09-16 20:27:13','2011-09-16 20:27:13',NULL,NULL,NULL,NULL,1,505,335,8,'Layout',NULL,NULL),(15,'bananas','Banner','administrator','2011-10-13 22:51:29','2011-10-13 22:51:29',NULL,NULL,NULL,NULL,0,985,287,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `renderables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110526172226'),('20110601170330'),('20110616175549'),('20110616182120'),('20110804164923'),('20110830214356'),('20110831204850'),('20110913231308'),('20110919201607'),('20110923155213'),('20110927195255'),('20110928151340'),('20111011220252'),('20111018162343'),('20111018215135'),('20111020144041'),('20111021183445'),('20111021191501');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `results_count` int(11) DEFAULT NULL,
  `search_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
INSERT INTO `searches` VALUES (1,'alpha',NULL,'e9_user',4,0,1,'2011-10-17 22:49:28','2011-10-17 22:49:28'),(2,'a',NULL,'e9_user',4,25,1,'2011-10-17 23:06:30','2011-10-17 23:06:30'),(3,'a',NULL,'e9_user',4,25,2,'2011-10-17 23:07:01','2011-10-17 23:07:01');
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debug_mode` tinyint(1) DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `copyright_start_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_meta_description` text COLLATE utf8_unicode_ci,
  `default_meta_keywords` text COLLATE utf8_unicode_ci,
  `google_analytics_code` text COLLATE utf8_unicode_ci,
  `google_site_verification_code` text COLLATE utf8_unicode_ci,
  `avatar_size` int(11) DEFAULT NULL,
  `content_icon_size` int(11) DEFAULT NULL,
  `menu_icon_size` int(11) DEFAULT NULL,
  `share_site_icon_size` int(11) DEFAULT NULL,
  `layout_preview_width` int(11) DEFAULT NULL,
  `layout_preview_height` int(11) DEFAULT NULL,
  `page_show_date` tinyint(1) DEFAULT NULL,
  `page_show_social_bookmarks` tinyint(1) DEFAULT NULL,
  `page_show_author_info` tinyint(1) DEFAULT NULL,
  `page_show_labels` tinyint(1) DEFAULT NULL,
  `page_allow_comments` tinyint(1) DEFAULT NULL,
  `page_submenu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forums_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `faqs_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign_in_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign_up_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proile_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edit_profile_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_submenu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_pagination_records` int(11) DEFAULT NULL,
  `blog_teaser_body_length` int(11) DEFAULT NULL,
  `blog_show_date` tinyint(1) DEFAULT NULL,
  `blog_show_social_bookmarks` tinyint(1) DEFAULT NULL,
  `blog_show_author_info` tinyint(1) DEFAULT NULL,
  `blog_show_labels` tinyint(1) DEFAULT NULL,
  `blog_allow_comments` tinyint(1) DEFAULT NULL,
  `forum_pagination_records` int(11) DEFAULT NULL,
  `faq_show_date` tinyint(1) DEFAULT NULL,
  `faq_show_author_info` tinyint(1) DEFAULT NULL,
  `menu_record_count` int(11) DEFAULT NULL,
  `feed_records` int(11) DEFAULT NULL,
  `feed_summary_characters` int(11) DEFAULT NULL,
  `feed_max_title_characters` int(11) DEFAULT NULL,
  `records_per_page` int(11) DEFAULT NULL,
  `search_records_per_page` int(11) DEFAULT NULL,
  `home_records_per_page` int(11) DEFAULT NULL,
  `admin_records_per_page` int(11) DEFAULT NULL,
  `excerpt_display_chars` int(11) DEFAULT NULL,
  `maximum_share_site_count` int(11) DEFAULT NULL,
  `sales_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_form_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_form_page_text` text COLLATE utf8_unicode_ci,
  `contact_thanks_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_thanks_page_text` text COLLATE utf8_unicode_ci,
  `add_sales_contact_intro` text COLLATE utf8_unicode_ci,
  `site_email_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_html_email` text COLLATE utf8_unicode_ci,
  `default_text_email` text COLLATE utf8_unicode_ci,
  `display_custom_help` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `facebook_app_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_app_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_app_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_app_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_secret_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_company_page_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_company_page_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_page_template` text COLLATE utf8_unicode_ci,
  `facebook_pages_by_default` tinyint(1) DEFAULT '1',
  `facebook_forum_template` text COLLATE utf8_unicode_ci,
  `facebook_forums_by_default` tinyint(1) DEFAULT '1',
  `twitter_page_template` text COLLATE utf8_unicode_ci,
  `twitter_pages_by_default` tinyint(1) DEFAULT '1',
  `twitter_forum_template` text COLLATE utf8_unicode_ci,
  `twitter_forums_by_default` tinyint(1) DEFAULT '1',
  `twitter_company_page_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_menu_truncation` int(11) DEFAULT NULL,
  `bitly_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bitly_api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e9_admin_home_blog_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e9_admin_home_page_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_content_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slide_show_social_bookmarks` tinyint(1) DEFAULT NULL,
  `slide_show_date` tinyint(1) DEFAULT NULL,
  `slide_show_author_info` tinyint(1) DEFAULT NULL,
  `slide_show_labels` tinyint(1) DEFAULT NULL,
  `slide_allow_comments` tinyint(1) DEFAULT NULL,
  `slide_embeddable_width` int(11) DEFAULT NULL,
  `slide_embeddable_height` int(11) DEFAULT NULL,
  `slide_pagination_records` int(11) DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_page_thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_post_thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wide_thumb_width` int(11) DEFAULT NULL,
  `wide_thumb_height` int(11) DEFAULT NULL,
  `linked_in_company_page_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner_width` int(11) DEFAULT NULL,
  `banner_height` int(11) DEFAULT NULL,
  `e9_standard_help` text COLLATE utf8_unicode_ci,
  `e9_custom_help` text COLLATE utf8_unicode_ci,
  `facebook_slides_by_default` tinyint(1) DEFAULT NULL,
  `facebook_blog_posts_by_default` tinyint(1) DEFAULT NULL,
  `facebook_slideshows_by_default` tinyint(1) DEFAULT NULL,
  `twitter_slides_by_default` tinyint(1) DEFAULT NULL,
  `twitter_blog_posts_by_default` tinyint(1) DEFAULT NULL,
  `twitter_slideshows_by_default` tinyint(1) DEFAULT NULL,
  `header_text` text COLLATE utf8_unicode_ci,
  `email_style_block` text COLLATE utf8_unicode_ci,
  `page_display_actions` tinyint(1) DEFAULT NULL,
  `blog_display_actions` tinyint(1) DEFAULT NULL,
  `slide_display_actions` tinyint(1) DEFAULT NULL,
  `layout_image_width` int(11) DEFAULT NULL,
  `layout_image_height` int(11) DEFAULT NULL,
  `slide_display_more_info` tinyint(1) DEFAULT NULL,
  `use_captcha_registrations` tinyint(1) DEFAULT NULL,
  `use_captcha_comments` tinyint(1) DEFAULT NULL,
  `smtp_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_mailing_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `can_spam_mailing_address` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Default Configuration',0,'Site Name','2009','localhost:3000','default meta description','default, meta, keywords','<script>var google_conversion_id = 123456789;</script>','google_site_verification_code',90,100,30,30,200,162,1,1,1,1,1,'pagination',NULL,NULL,NULL,NULL,'Sign In','Sign Up',NULL,NULL,'digest','pagination',10,200,1,1,1,1,1,3,1,1,5,10,100,100,10,5,4,10,400,8,'sales@example.com','Contact Us','','Thanks!','','','site@example.com','<p>Dear {% recipient_first_name %},</p>\r\n<p>REPLACE WITH YOUR CONTENT HERE</p>\r\n<p>To unsubscribe from our email list, click the following link or paste it into your browser: {% recipient_unsubscribe_url %}</p>\r\n<p>Many thanks!</p>\r\n<p>The {% site_name %} Team</p>\r\n<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>\r\n<p>**** REPLACE WITH YOUR FULL STREET ADDRESS HERE TO COMPLY WITH CAN-SPAM ACT</p>\r\n','Dear {% recipient_first_name %},\r\n\r\nREPLACE WITH YOUR CONTENT HERE\r\n\r\nTo unsubscribe from our email list, click the following link or paste it into your browser:\r\n\r\n{% recipient_unsubscribe_url %}\r\n\r\nMany thanks!\r\n\r\nThe {% site_name %} Team \r\n\r\nPS: If you have any trouble or have questions, you can simply reply to this email and let us know!\r\n\r\n**** REPLACE WITH YOUR FULL STREET ADDRESS HERE TO COMPLY WITH CAN-SPAM ACT\r\n',NULL,'2011-09-16 20:27:08','2011-10-21 19:37:15','155577647799335','36a8d602a5a5abf16db2fc9137e1398a','155577647799335|1bae03331749f077d1be05ba.0-46300895|dkcDw0GZbFCm3-iylWBEyONutZA','ym5Aq01PMdayEZ8c5SOSA','DX5FloOiixoRlsmHEJH8ZSkqgb0ye57YBX5SyZowVo','197161961-5Z7YSofDf3cq7uFhbB2kGsgz22KLjM4tRBxLGyfg','hdoLw96si5NdaLXz9mLmiFIPW7z7o0g195aBHY','http://facebook.com',NULL,'{% username %} created a {% content_type %}: {% title %}',0,'{% username %} created a {% content_type %}: {% title %}',0,'{% username %} created a {% content_type %}: {% title %}',0,'{% username %} created a {% content_type %}: {% title %}',0,'http://twitter.com',25,'e9digital','R_e3a7627deda2b73f2a4e047988d70387',NULL,NULL,NULL,NULL,1,1,1,1,1,590,390,4,'avatar_thumb.png','user_page_thumb.png','blog_post_thumb.png','question_thumb.png',156,102,'http://linkedin.com',985,287,'<div><iframe src=\"https://docs.google.com/document/pub?id=1bf82OyLzootm1TbgAjDl8OiikD8hzyquwHyYa8kRpi0&amp;embedded=true\" style=\"width:100%;height:1000px;\"></iframe></div>',NULL,0,0,0,0,0,0,NULL,NULL,1,1,1,NULL,NULL,1,NULL,1,'travis','thund3rcats','stoneleafdoor.com','smtp.sendgrid.net','system@example.com','123123 ASDF St\r\nWyoming, NY 10016');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_sites`
--

DROP TABLE IF EXISTS `share_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `icon_index` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_sites`
--

LOCK TABLES `share_sites` WRITE;
/*!40000 ALTER TABLE `share_sites` DISABLE KEYS */;
INSERT INTO `share_sites` VALUES (1,'Facebook','http://www.facebook.com/sharer.php?u={% page_url | uri_escape %}',1,1,10,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(2,'Twitter','http://www.twitter.com/home?status=Check%20this%20out:{% page_url | uri_escape %}',2,1,31,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(3,'Google','http://www.google.com/bookmarks/mark?op=add&bkmk={% page_url | uri_escape %}&title={% page_title | url_escape %}',3,1,11,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(4,'Google Buzz','http://www.google.com/buzz/post?url={% page_url | uri_escape %}',4,1,12,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(5,'Kaboodle','http://www.kaboodle.com/za/selectpage?p_pop=false&pa=url&u={% page_url | uri_escape %}',5,1,14,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(6,'Delicious','http://delicious.com/post?url={% page_url | uri_escape %}&title={% page_title | uri_escape %}',6,1,5,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(7,'Propellor','http://propeller.com/story/submit?url={% page_url | uri_escape %}&title={% page_title | uri_escape %}',7,1,21,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(8,'Yahoo! Buzz','http://buzz.yahoo.com/buzz?src=addthis&targetUrl={% page_url | uri_escape %}&headline={% page_title | uri_escape %}',8,1,1,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(9,'StumbleUpon','http://www.stumbleupon.com/submit?url={% page_url | uri_escape %}',9,1,29,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(10,'Reddit','http://www.reddit.com/submit?url={% page_url | uri_escape %}&title={% page_title | uri_escape %}',10,1,22,'2011-09-16 20:27:10','2011-09-16 20:27:10'),(11,'Digg','http://digg.com/submit?phase=2&url={% page_url | uri_escape %}',11,1,6,'2011-09-16 20:27:11','2011-09-16 20:27:11'),(12,'Mixx','http://mixx.com/submit?page_url={% page_url | uri_escape %}',12,1,18,'2011-09-16 20:27:11','2011-09-16 20:27:11'),(13,'Technorati','http://technorati.com/faves?add={% page_url | uri_escape %}',13,1,30,'2011-09-16 20:27:11','2011-09-16 20:27:11'),(14,'LinkedIn','http://www.linkedin.com/shareArticle?mini=true&url={% page_url | uri_escape %}&title={% page_title | url_escape %}',14,1,17,'2011-09-16 20:27:11','2011-09-16 20:27:11');
/*!40000 ALTER TABLE `share_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slide_shows`
--

DROP TABLE IF EXISTS `slide_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slide_shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slide_shows`
--

LOCK TABLES `slide_shows` WRITE;
/*!40000 ALTER TABLE `slide_shows` DISABLE KEYS */;
/*!40000 ALTER TABLE `slide_shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_assignments`
--

DROP TABLE IF EXISTS `slideshow_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) DEFAULT NULL,
  `slideshow_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_assignments`
--

LOCK TABLES `slideshow_assignments` WRITE;
/*!40000 ALTER TABLE `slideshow_assignments` DISABLE KEYS */;
INSERT INTO `slideshow_assignments` VALUES (2,45,8,2),(3,46,8,2),(4,47,8,2),(5,48,8,2),(6,44,8,3);
/*!40000 ALTER TABLE `slideshow_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `mailing_list_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `unsubscribe_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_subscriptions_on_unsubscribe_token` (`unsubscribe_token`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (3,13,2,'2011-10-03 18:03:06','2011-10-03 18:03:06','f4982496b05cd8cfbba66ded23a39705518f27a1c3c4ac532e'),(7,15,NULL,'2011-10-05 21:44:18','2011-10-05 21:44:18','cc3e7b0b635a5d21d8f4d08ed264f3b7abdb333bb9d9032b0f'),(10,15,1,'2011-10-19 16:33:24','2011-10-19 16:33:24','05c13bdfc1f3038e57da5047559e1faca235a70b138c6f1a28'),(11,30,1,'2011-10-19 16:33:48','2011-10-19 16:33:48','5d39d6ffc60e6bf8970793f51899809ccdde2ecbfcc14936bb');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (1,1,4,'Contact',NULL,NULL,NULL,'users__h__','2011-10-11 23:37:02'),(2,1,7,'Contact',NULL,NULL,NULL,'users__h__','2011-10-21 21:24:02'),(3,2,7,'Contact',NULL,NULL,NULL,'users__h__','2011-10-21 21:24:02'),(4,3,7,'Contact',NULL,NULL,NULL,'users__h__','2011-10-21 21:24:02');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'asdf'),(2,'Qwer'),(3,'Qwert');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'Default Feed','WidgetTemplate','guest','<div class=\"default-feed-module\">\n  <div class=\"left image\">\n    <a href=\"{{record.path}}\">\n      <img src=\"{{record.thumb_url}}\"/>\n    </a>\n  </div>\n  <h3>\n    <a href=\"{{record.path}}\">{{record.title}}</a>\n  </h3>\n  <div class=\"info\">\n    <p>{{record.published_at}}</p>\n    <p>by {{record.author.name}}</p>\n  </div>\n  <p>{{record.description | truncate:200 }}</p>\n</div>\n','2011-09-16 20:27:14','2011-09-16 20:27:14',NULL),(2,'Titles and Descriptions','WidgetTemplate','guest','<dl class=\"title-description-module\">\n  <dt>\n    <a href=\"{{ record.url }}\">{{ record.title }}</a>\n  </dt>\n  <dd>{{ record.description |) truncate:\'70\',\'...\' }} </dd>\n</dl>\n','2011-09-16 20:27:14','2011-09-16 20:27:14',NULL),(3,'Titles and Authors','WidgetTemplate','guest','<div class=\"title-author-module\">\n  <div class=\"left image\">\n    <a href=\"{{record.path}}\">\n      <img src=\"{{record.thumb_url}}\"/>\n    </a>\n  </div>\n  <div>\n    <a href=\"{{record.path}}\">{{record.title}}</a>\n    <h3>{{record.author.name}}</h3>\n    <p>{{record.description | truncate:50 }}</p>\n  </div>\n</div>\n','2011-09-16 20:27:14','2011-09-16 20:27:14',NULL);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comments_count` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_cookies`
--

DROP TABLE IF EXISTS `tracking_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_cookies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hid` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tracking_cookies_on_code` (`code`),
  KEY `index_tracking_cookies_on_hid` (`hid`),
  KEY `index_tracking_cookies_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_cookies`
--

LOCK TABLES `tracking_cookies` WRITE;
/*!40000 ALTER TABLE `tracking_cookies` DISABLE KEYS */;
INSERT INTO `tracking_cookies` VALUES (1,4,'8a3161d03b6ef55aad9b41d98ef1a486',NULL,'2011-09-16 20:36:30','2011-09-16 20:36:30'),(2,4,'a23b9ad9e61b1d760ab15ff2cc2439c5',NULL,'2011-09-16 20:36:42','2011-09-16 20:36:42'),(3,4,'51db38abb3d3da67e34b405839614308','ASFD','2011-09-16 20:56:29','2011-09-20 17:50:42'),(4,1,'5c3800ae6460a7ee75f92fd258ae72f9',NULL,'2011-09-23 16:51:05','2011-09-23 16:51:05'),(5,4,'28c7f4715fdc5ee5e97fcb34ebdf3501',NULL,'2011-09-26 17:44:29','2011-09-26 17:44:29'),(6,NULL,'e2cddcff2aa79685a7a17d5e2bd97c47',NULL,'2011-09-26 20:36:23','2011-09-26 20:36:23'),(7,NULL,'89144ce071a10b9132267f4b1d272eae',NULL,'2011-09-26 20:41:55','2011-09-26 20:41:55'),(8,4,'0283bd2e25319d65203e05b24898cc27','EMAIL','2011-09-26 20:43:17','2011-10-14 16:30:22'),(9,NULL,'868ec976f35b5f94106e94c276e15c5a',NULL,'2011-09-26 20:52:39','2011-09-26 20:52:39'),(10,NULL,'a693e7729090bb198dbe840cc8a318cd',NULL,'2011-09-26 22:10:31','2011-09-26 22:10:31'),(11,4,'f8b8def80db9103cfa82d900e0b064fe',NULL,'2011-09-26 22:28:24','2011-09-26 22:28:24'),(12,12,'9a9b40283105999843e903b147f9a636',NULL,'2011-10-03 17:54:40','2011-10-03 17:54:40'),(13,13,'a869a5037485cae79835413c1fd3436c',NULL,'2011-10-03 18:03:07','2011-10-03 18:03:07'),(14,14,'9ab0bc25a9b6e4f8d80954e05ccb56d7',NULL,'2011-10-03 18:16:39','2011-10-03 18:16:39'),(15,4,'9ba3ad551e0daf3fbaa3f06b1ab79ef9',NULL,'2011-10-03 18:27:27','2011-10-03 18:27:27'),(16,4,'917932c21fc692efb420c00ecc06bacd',NULL,'2011-10-06 15:29:07','2011-10-06 15:30:31'),(17,4,'ec9576c61fbd41d278eb29bb4c392dc8',NULL,'2011-10-06 15:31:17','2011-10-06 15:31:17'),(18,4,'44207a23771848bf36217117a9ad76dc',NULL,'2011-10-11 23:14:21','2011-10-11 23:14:21'),(19,4,'92b7aecaa4e8012b82250ac98d821e94',NULL,'2011-10-13 22:58:50','2011-10-13 22:58:50'),(20,4,'ab6cf4442f6413afba552be17b805478',NULL,'2011-10-13 22:59:02','2011-10-13 22:59:02'),(21,4,'f8fe7ce9d6abc42fa0e4aee91b8ee393',NULL,'2011-10-13 22:59:26','2011-10-13 22:59:26'),(22,4,'894bd9624838137236325faf8860a379',NULL,'2011-10-13 22:59:59','2011-10-13 22:59:59'),(23,4,'cae88535468baaccaefac2c46626948d',NULL,'2011-10-13 23:02:48','2011-10-13 23:02:48'),(24,16,'c76ac2b8d1ee1be4c2f617c1db571925',NULL,'2011-10-18 16:41:13','2011-10-18 16:41:13'),(25,17,'32d863593864064133895fe89f8bbcca',NULL,'2011-10-18 16:46:54','2011-10-18 16:46:54'),(26,18,'b3c6c2714b44a9355aa1337818248a7e',NULL,'2011-10-18 16:49:36','2011-10-18 16:49:36'),(27,19,'38a804efedb3a552601f48e8fc41b18d',NULL,'2011-10-18 18:00:02','2011-10-18 18:00:02'),(28,20,'a2fd16574f07e07d2c70430ef46a9e9b',NULL,'2011-10-18 18:11:12','2011-10-18 18:11:12'),(29,21,'acff19725a2b0b1d5567984c78ca3fe0',NULL,'2011-10-18 18:38:50','2011-10-18 18:38:50'),(30,28,'63f5f290c3fb7375ded87050dbca5f2c',NULL,'2011-10-18 19:01:31','2011-10-18 19:01:31'),(31,30,'f48d3b0925a1f456ed51d12a56cab591',NULL,'2011-10-18 21:58:45','2011-10-18 21:58:45'),(32,1,'3acc08c5f083a4d4b86cac994d6c60ec',NULL,'2011-10-18 22:54:16','2011-10-18 22:54:16'),(33,15,'801509bd833e98c9321307f49f6ac802',NULL,'2011-10-19 15:42:26','2011-10-19 15:42:26'),(34,15,'b07658fca4048f5b0ff8268554d36c5a',NULL,'2011-10-20 19:07:25','2011-10-20 19:10:03'),(35,15,'06f9862eebfa0d6f77c11083c535236e','HEY','2011-10-20 20:02:44','2011-10-20 20:04:54');
/*!40000 ALTER TABLE `tracking_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auto_favorite` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscriptions_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_notifications` tinyint(1) DEFAULT '1',
  `comment_and_topic_notifications` tinyint(1) DEFAULT '1',
  `revocation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `bio` text COLLATE utf8_unicode_ci,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `has_bounced` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@e9digital.com','349d084f22bd34bf2274f9955d3d13995de20a95','I8FXkYslZtbElLpWWnAb',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Admin','','admin','e9_user',0,'2011-09-16 20:27:08','2011-10-19 20:19:44',NULL,NULL,1,1,NULL,NULL,'user',4,'--- \ntype: Personal\nprimary: false\n',NULL,NULL,NULL,NULL,0),(3,'jina@e9digital.com','65a456923a8c6f4fd0d58771ffb964471b4c8f25','5L6UTpw-DswDp-4V4z1I',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Jina','Kiem','jina','user',0,'2011-09-16 20:27:09','2011-10-18 18:45:56',NULL,NULL,1,1,NULL,NULL,'user',3,'--- !map:ActiveSupport::HashWithIndifferentAccess \ntype: Personal\nprimary: \"true\"\n',NULL,NULL,NULL,NULL,0),(5,'john@e9digital.com','bbdf256ed6f83f39b55f4d17bda90e7be3338add','f3c-ml7ul08q4Mmc7Uwm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'John','','jcrain','user',0,'2011-09-16 20:27:09','2011-10-18 18:45:47',NULL,NULL,1,1,NULL,NULL,'user',15,'--- \ntype: \nprimary: true\n',NULL,NULL,NULL,NULL,0),(7,'asdf@asdf.com','','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'asdf',NULL,NULL,'prospect',0,'2011-09-20 19:35:46','2011-10-21 21:24:02',NULL,NULL,1,1,NULL,NULL,'user',7,'--- !map:ActiveSupport::HashWithIndifferentAccess \ntype: Personal\nprimary: \"true\"\n',NULL,NULL,NULL,NULL,0),(8,'sdf@asdf.com','','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'adminG',NULL,NULL,'prospect',0,'2011-09-20 19:52:11','2011-10-19 20:19:44',NULL,NULL,1,1,NULL,NULL,'user',4,'--- \ntype: Personal\nprimary: false\n',NULL,NULL,NULL,NULL,0),(9,'werwer@asdasdf.com','','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'adminG',NULL,NULL,'prospect',0,'2011-09-20 19:52:11','2011-10-19 20:19:44',NULL,NULL,1,1,NULL,NULL,'user',4,'--- \ntype: Personal\nprimary: false\n',NULL,NULL,NULL,NULL,0),(11,'asdf@asfd.com','','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'asdf@asdf',NULL,NULL,'prospect',0,'2011-09-22 20:15:19','2011-10-11 23:37:02',NULL,NULL,1,1,NULL,NULL,'user',4,'--- !map:ActiveSupport::HashWithIndifferentAccess \ntype: Personal\nprimary: \"false\"\n',NULL,NULL,NULL,NULL,0),(13,'buck@naked.com','62305501136dbd441069891e956375432f71ee38','y-p8vg83yA9hyVAoKavW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'buck',NULL,'buck','user',0,'2011-10-03 18:03:04','2011-10-03 18:07:28',NULL,NULL,1,1,NULL,'2011-10-03 18:07:26','user',17,'--- \ntype: \nprimary: true\n',NULL,NULL,NULL,NULL,0),(15,'travis@e9digital.com','2ccf36747b884701a22581701eaedccfc407e208','XPci4jcjf_3kpAzu5b2u',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'travis',NULL,'tbone','superuser',0,'2011-10-05 21:33:25','2011-10-21 22:42:52',NULL,NULL,1,1,'Zlry9Z528rw7H35lLcCP',NULL,'user',4,'--- !map:ActiveSupport::HashWithIndifferentAccess \ntype: Personal\nprimary: \"true\"\n',NULL,NULL,NULL,NULL,0),(29,'werwerewr@asdfsdf.com','','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'asdfasfd',NULL,NULL,'prospect',0,'2011-10-18 19:12:27','2011-10-18 19:12:27',NULL,NULL,1,1,NULL,NULL,'user',33,'--- !map:ActiveSupport::HashWithIndifferentAccess \nprimary: \"true\"\ntype: Personal\n',NULL,NULL,NULL,NULL,0),(30,'numbers1311407@gmail.com','0ecb1b3c9ab3bb5b9aa4281fd28a50f5cdb6bf1e','PHnBGF8hyXqXYK3HJdhx',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'numbers',NULL,'numbers','user',0,'2011-10-18 21:58:43','2011-10-18 22:23:48',NULL,NULL,1,1,NULL,'2011-10-18 22:23:46','user',34,'--- \ntype: \nprimary: true\n',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-24 11:49:51
