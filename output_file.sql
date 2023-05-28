-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: sportsdb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add blog post',10,'add_blogpost'),(38,'Can change blog post',10,'change_blogpost'),(39,'Can delete blog post',10,'delete_blogpost'),(40,'Can view blog post',10,'view_blogpost'),(41,'Can add site setting',11,'add_sitesetting'),(42,'Can change site setting',11,'change_sitesetting'),(43,'Can delete site setting',11,'delete_sitesetting'),(44,'Can view site setting',11,'view_sitesetting'),(45,'Can add file model',12,'add_filemodel'),(46,'Can change file model',12,'change_filemodel'),(47,'Can delete file model',12,'delete_filemodel'),(48,'Can view file model',12,'view_filemodel'),(49,'Can add contact',13,'add_contact'),(50,'Can change contact',13,'change_contact'),(51,'Can delete contact',13,'delete_contact'),(52,'Can view contact',13,'view_contact');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$irNs91h8TKlPHjJB1eqP8B$tTPOziojsckmqBoQE7E1AT3kGv+6t5RHfFunkAzYD08=','2023-05-18 17:21:10.770000',1,'sami','','','',1,1,'2023-05-17 04:46:48.550000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('0f1940c56d9a7479bc59f679b556df37d5d6d7bc','2023-05-18 17:29:37.748000',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'sports','blogpost'),(9,'sports','category'),(13,'sports','contact'),(12,'sports','filemodel'),(11,'sports','sitesetting');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-28 06:02:52.512019'),(2,'auth','0001_initial','2023-05-28 06:02:52.901864'),(3,'admin','0001_initial','2023-05-28 06:02:52.990940'),(4,'admin','0002_logentry_remove_auto_add','2023-05-28 06:02:53.000611'),(5,'admin','0003_logentry_add_action_flag_choices','2023-05-28 06:02:53.009614'),(6,'contenttypes','0002_remove_content_type_name','2023-05-28 06:02:53.061215'),(7,'auth','0002_alter_permission_name_max_length','2023-05-28 06:02:53.098663'),(8,'auth','0003_alter_user_email_max_length','2023-05-28 06:02:53.123207'),(9,'auth','0004_alter_user_username_opts','2023-05-28 06:02:53.131962'),(10,'auth','0005_alter_user_last_login_null','2023-05-28 06:02:53.165860'),(11,'auth','0006_require_contenttypes_0002','2023-05-28 06:02:53.168692'),(12,'auth','0007_alter_validators_add_error_messages','2023-05-28 06:02:53.176017'),(13,'auth','0008_alter_user_username_max_length','2023-05-28 06:02:53.217317'),(14,'auth','0009_alter_user_last_name_max_length','2023-05-28 06:02:53.253922'),(15,'auth','0010_alter_group_name_max_length','2023-05-28 06:02:53.276570'),(16,'auth','0011_update_proxy_permissions','2023-05-28 06:02:53.283316'),(17,'auth','0012_alter_user_first_name_max_length','2023-05-28 06:02:53.322318'),(18,'authtoken','0001_initial','2023-05-28 06:02:53.366704'),(19,'authtoken','0002_auto_20160226_1747','2023-05-28 06:02:53.389608'),(20,'authtoken','0003_tokenproxy','2023-05-28 06:02:53.393550'),(21,'sessions','0001_initial','2023-05-28 06:02:53.418875'),(22,'sports','0001_initial','2023-05-28 06:02:53.521249'),(23,'sports','0002_alter_blogpost_body','2023-05-28 06:02:53.531573'),(24,'sports','0003_sitesetting','2023-05-28 06:02:53.545576'),(25,'sports','0004_alter_blogpost_author_alter_blogpost_category','2023-05-28 06:02:53.712750'),(26,'sports','0005_alter_blogpost_slug','2023-05-28 06:02:53.744115'),(27,'sports','0006_filemodel','2023-05-28 06:02:53.758162'),(28,'sports','0007_contact','2023-05-28 06:02:53.773444'),(29,'sports','0008_blogpost_status','2023-05-28 06:02:53.799575'),(30,'sports','0009_alter_blogpost_author','2023-05-28 06:02:53.811048'),(31,'sports','0010_alter_blogpost_author','2023-05-28 06:02:53.867695'),(32,'sports','0011_alter_blogpost_author','2023-05-28 06:02:53.954593'),(33,'sports','0012_blogpost_indexing','2023-05-28 06:02:53.981268'),(34,'sports','0013_remove_blogpost_indexing_alter_blogpost_status','2023-05-28 06:02:54.005924'),(35,'sports','0014_blogpost_indexing_alter_blogpost_status','2023-05-28 06:02:54.037570');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_blogpost`
--

DROP TABLE IF EXISTS `sports_blogpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_blogpost` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `post_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `feature_image` varchar(100) DEFAULT NULL,
  `author_id` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `indexing` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sports_blogpost_slug_59e9b939_uniq` (`slug`),
  KEY `sports_blogpost_category_id_ecb29a6c_fk_sports_category_id` (`category_id`),
  KEY `sports_blogpost_author_id_980258a1_fk_auth_user_id` (`author_id`),
  CONSTRAINT `sports_blogpost_author_id_980258a1_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `sports_blogpost_category_id_ecb29a6c_fk_sports_category_id` FOREIGN KEY (`category_id`) REFERENCES `sports_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_blogpost`
--

LOCK TABLES `sports_blogpost` WRITE;
/*!40000 ALTER TABLE `sports_blogpost` DISABLE KEYS */;
INSERT INTO `sports_blogpost` VALUES (41,'Wyndham Clark Net Worth, Salary, Career, Height, Biography and More','<p>Wyndham Clark is a professional golfer from Colorado who currently plays on the PGA Tour. With three amateur wins under his belt, he is yet to win a major professional tour. He was born on December 9, 1993, in Denver, Colorado, and attended Valor Christian High School. In his short professional career, he has already earned a total of $4,242,259, with a net worth of $4 million in 2023. He is currently in a relationship with Julia Jane Kemmling and the couple is rumored to be planning their wedding soon.</p>\r\n\r\n<h2>About Wyndham Clark</h2>\r\n\r\n<p>Wyndham Clark is a professional golfer currently competing on the PGA Tour. He was born on December 9, 1993, in Denver, Colorado, and attended Valor Christian High School, where he won the Colorado state championship twice and was player of the year in 2011. As an amateur, Clark achieved three wins, and he turned professional in 2017, making his debut in the Web.com Tour. He has yet to achieve any major professional tour wins, but he participated in his best PGA Tour finish in March 2019 at the Honda Classic.</p>\r\n\r\n<p>In terms of personal information, Wyndham Clark is 28 years old and has a height of 6 ft 0 in (182.88 cm) and weighs 172 lbs. He is currently unmarried but is in a relationship with Julia Jane Kemmling, who serves as the assistant coach of the Quinnipiac University women&rsquo;s golf team. The couple is rumored to be planning their wedding ceremony, but they have no children.</p>\r\n\r\n<p>As of 2023, Clark&#39;s net worth is estimated to be $4 million. He has already earned a total of $4,242,259 in his short professional career, and he has made the most of the Bermuda Championship, where he became runner-up in 2020. From that tournament alone, he earned $436,000. His girlfriend&#39;s earnings, however, are unavailable. Clark&#39;s most recent income was from the Memorial Tournament, where he bagged $51,000 from being T37 positioned.</p>\r\n\r\n<p>Wyndham Clark graduated with a degree in business in 2017. His amateur debut started with 9th place at the 2012 USA Amateur under Oklahoma State. He transferred to Oregon in 2016, where he won the Pac-12 conference championship and Golfweek Player of the Year. From the 2020-21 session&#39;s 27 events that he participated in, he has already earned $1,198,800. Clark is currently participating in the Canadian Open for the 2022 PGA Tour.</p>\r\n\r\n<h2>Wyndham Clark&#39;s Net Worth, Salary, and Earnings</h2>\r\n\r\n<p>Wyndham Clark&rsquo;s net worth for 2023 is estimated at $4 million. In his short professional career, he has already accumulated over $4 million in earnings, with the 2020-2021 season accounting for $1,198,800. His most significant earnings came from his runner-up finish at the Bermuda Championship in 2020, earning him $436,000 alone. Despite not having any major professional wins yet, Clark has consistently been performing well and climbing up the rankings. As of writing, he is currently in the Canadian Open for the 2022 PGA Tour. Clark&rsquo;s rise to professional golfing started when he was still in high school at Valor Christian High School in Denver, Colorado. He won the Colorado state championship twice and named player of the year in 2011. During his amateur days, he won three titles, and in 2016, he transferred to Oregon, where he continued to excel. Clark won the Pac-12 conference championship and was named Golfweek Player of the Year. He eventually earned his graduate degree in business in 2017 and turned professional shortly after. Aside from his golfing career, Wyndham Clark is also in a relationship with Julia Jane Kemmling, who currently serves as the assistant coach of the Quinnipiac University women&rsquo;s golf team. While the couple is currently unmarried and has no kids, rumors are circulating that they are already planning their wedding ceremony. In terms of physical attributes, Clark has a height of 6 ft 0 in (182.88 cm), weighs 172 lbs, and is a right-handed golfer. He recently turned 28 years old on December 9, 2021. Despite not having any major wins yet, Clark&rsquo;s consistent performances in the PGA Tour have made him an up-and-coming golfer to watch out for in the future.</p>\r\n\r\n<h2>Endorsement</h2>\r\n\r\n<p>Unfortunately, there is no endorsement data mentioned in this content about Wyndham Clark. However, it does provide information about his amateur and professional golf career, personal information, net worth, and recent news. Clark has a net worth of $4 million as of 2023 and has already earned a total of $4,242,259 in his short professional career. He is currently participating in the Canadian Open for the 2022 PGA Tour. Additionally, Clark is not married but is in a relationship with Julia Jane Kemmling and they are rumored to be planning their wedding ceremony.</p>\r\n\r\n<h2>Wyndham Clark&#39;s Girlfriend/Wife</h2>\r\n\r\n<p>Wyndham Clark is currently in a relationship with Julia Jane Kemmling, who serves as an assistant coach for the Quinnipiac University women&#39;s golf team. The couple is rumored to be planning their wedding soon but they don&#39;t have any children yet.</p>\r\n\r\n<h2>Wyndham Clark Personal Informations</h2>\r\n<!-- wp:table -->\r\n\r\n<figure>\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Full Name</td>\r\n			<td>Wyndham Clark</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Birthdate</td>\r\n			<td>09 December 1993</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Height</td>\r\n			<td>6 ft 0 in (182.88 cm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Swing</td>\r\n			<td>Right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Nationality</td>\r\n			<td>American</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Father name</td>\r\n			<td>Randall Clark</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Career Earning</td>\r\n			<td>$4,242,259</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Age</td>\r\n			<td>[age_calculator birth_year=&quot;1993&quot;]</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Twitter Handle</td>\r\n			<td><a href=\"https://twitter.com/Wyndham_Clark/?hl=en\" rel=\"noreferrer noopener nofollow\" target=\"_blank\">@Wyndham_Clark</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Birthplace</td>\r\n			<td>Denver, Colorado, USA</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Residence</td>\r\n			<td>Scottsdale, Arizona, USA</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Salary</td>\r\n			<td>$1,198,800</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight</td>\r\n			<td>172 lbs</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Religion</td>\r\n			<td>Christian</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Instagram Handle</td>\r\n			<td><a href=\"https://www.instagram.com/wyndhamclark/?hl=en\" rel=\"noreferrer noopener nofollow\" target=\"_blank\">@wyndhamclark</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Marital Status</td>\r\n			<td>Single</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mother name</td>\r\n			<td>Lisa Clark</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</figure>\r\n<!-- /wp:table -->\r\n\r\n<h2>Age</h2>\r\n\r\n<p>Wyndham Clark is {% calculate_age 1993 %} years old (as of {{ current_year }}).</p>\r\n\r\n<h2>Height</h2>\r\n\r\n<p>Wyndham Clark&#39;s height is 6 ft 0 in (182.88 cm).</p>','2023-05-20 19:05:32.725000','2023-05-25 07:21:28.478000','wyndham-clark-net-worth-salary-career-height-biography-and-more','blog_images/wyndham-clark-net-worth-salary-career-height-biography.jpg',1,1,'published','noindex'),(42,'Steven Bergwijn Net Worth, Salary, Career, Height, Biography and More','<p>Steven Bergwijn is a 25-year-old Dutch professional footballer who has made a name for himself as a left winger. He started his senior career with PSV in the Eredivisie, scoring a crucial goal in their 3-0 win over Ajax in the 2017-18 season. Bergwijn then signed with Tottenham Hotspur in 2020 for a reported fee of &pound;26.7 million, before returning to the Netherlands in 2022 to sign a five-year contract with Ajax for a fee of &euro;31.25 million, making it the most expensive transfer in Eredivisie history. Bergwijn has also played for the Dutch national team, impressing in the Nations League and looking set to represent his country in the upcoming World Cup in Qatar.</p>\r\n\r\n<h2>About Steven Bergwijn</h2>\r\n\r\n<figure><img alt=\"\" class=\"body_image\" src=\"/media/blog_images/steven-bergwijn-1_8PgikjY.jpg\" /></figure>\r\n\r\n<p>Steven Bergwijn, a Dutch professional footballer, is currently playing as a Left Winger for Ajax in the Eredivisie. The 25-year-old has been in excellent form for both his club and country, playing all 6 matches for the Netherlands in the Nations League 22/23 and looking set to wear the OnsOranje colors in the upcoming World Cup in Qatar.</p>\r\n\r\n<p>Steven Charles Bergwijn was born in Amsterdam, Netherlands, on October 8, 1997. He marshaled his youth career first at Ajax and then at PSV, starting his senior career at Jong PSV in the second division in 2014 and later for PSV in the Eredivisie. The Dutchman scored a crucial goal in their 3-0 win over Ajax in the 2017-18 season to clinch the Eredivisie title.</p>\r\n\r\n<p>Steven Bergwijn signed a 5-year contract with Tottenham in 2020, a deal worth &pound;26.7 million. He played for the English club for the next couple of seasons, scoring 7 goals in 60 appearances. In 2022, he returned to the Netherlands and signed a 5-year contract with Ajax, which brought him for a reported transfer fee of &euro;31.25 million, the most expensive transfer in the history of the Eredivisie.</p>\r\n\r\n<p>Steven Bergwijn earned his international debut for the Netherlands in October 2018. The left-winger has developed into a key part of the Dutch squad, playing all 6 games in the Nations League last June and September and scoring 2 goals.</p>\r\n\r\n<p>Following were Steven Bergwijn&rsquo;s gross salaries per season at Tottenham Hotspur: &euro;4.49 million in 20/21 and &euro;4.49 million in 21/22. At Ajax, he will earn a gross salary of &euro;4.7 million for the 2022-23 season, with a weekly salary of &euro;90,385.</p>\r\n\r\n<p>Steven Bergwijn joined Adidas as an endorsed player and is set to wear the Adidas X Speedflow + boots for the 22/23 season. His current transfer market value stands at &euro;27.00m.</p>\r\n\r\n<h2>Steven Bergwijn&#39;s Net Worth, Salary, and Earnings</h2>\r\n\r\n<p>Steven Bergwijn is undoubtedly one of the brightest young talents in Dutch football today. The 25-year-old left-winger has been in awe-inspiring form for both his club and country in recent years. He played all six matches for the Netherlands in the Nations League 22/23 and looks set to don the Oranje colors in the upcoming World Cup in Qatar. Steven Charles Bergwijn&#39;s journey in football began at Ajax before he moved to PSV, where he scored a crucial goal in their 3-0 win over Ajax in the 2017-18 season to clinch the Eredivisie title. After making a strong impression in the Eredivisie, Bergwijn moved to Tottenham in 2020, with a deal worth &pound;26.7 million. He played for the English club for the next two seasons, scoring seven goals in 60 appearances. Steven Bergwijn has now returned to the Netherlands and signed a five-year contract with Ajax, for a reported transfer fee of &euro;31.25 million, which happens to be the most expensive transfer in the history of the Eredivisie. He has developed into one of the key parts of the Dutch squad over the years, playing all six games in the Nations League last June and September and scoring two goals. As of 2023, Steven Bergwijn&#39;s net worth is &euro;2.4 million, solely from his official salary and contracts with Ajax. He has five years left on his current contract with Ajax, which will expire on 30 June 2027. The Ajax winger will earn a gross salary of &euro;4.7 million for the 2022-23 season, with a weekly salary of &euro;90,385. Steven Bergwijn joined Ajax in 2022 from Tottenham for a reported transfer fee of &euro;31.25 million, the most expensive transfer in the history of the Eredivisie. His current transfer market value is &euro;27.00m. He is an Adidas-endorsed player and will wear the Adidas X Speedflow+ boots for the 22/23 season. Finally, Steven Bergwijn has been in a steady relationship with his girlfriend, Chloe Jay Lois, since 2015. The couple welcomed their son, Saint Stevie Isaï Bergwijn, into the world on 10 April 2020.</p>\r\n\r\n<h2>Endorsement</h2>\r\n\r\n<p>Steven Bergwijn is an Adidas-endorsed player and will be wearing the Adidas X Speedflow + boots for the 22/23 season.</p>\r\n\r\n<h2>Steven Bergwijn&#39;s Girlfriend/Wife</h2>\r\n\r\n<p>Steven Bergwijn has been dating Chloe Jay Lois since 2015, and the couple welcomed their son, Saint Stevie Isaï Bergwijn, in April 2020.</p>\r\n\r\n<h2>Quick Facts</h2>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Full Name</td>\r\n			<td>Steven Charles Bergwijn</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Current Club</td>\r\n			<td>Ajax</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Position</td>\r\n			<td>Left Wing</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Shirt No.</td>\r\n			<td>7</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Nationality</td>\r\n			<td>Dutch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Height</td>\r\n			<td>178 cm (5&prime; 10&Prime;)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Birthplace</td>\r\n			<td>Amsterdam, Netherlands</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Children</td>\r\n			<td>Saint Stevie Isaï Bergwijn</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Twitter</td>\r\n			<td><a href=\"https://twitter.com/StevenBergwijn/?hl=en\" rel=\"noreferrer noopener nofollow\" target=\"_blank\">@StevenBergwijn</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Age</td>\r\n			<td>[age_calculator birth_year=&quot;1997&quot;]</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Girlfriend</td>\r\n			<td>Chloe Jay Lois</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Date of Birth</td>\r\n			<td>8 October 1997</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Instagram</td>\r\n			<td><a href=\"https://www.instagram.com/stevenbergwijn/?hl=en\" rel=\"noreferrer noopener nofollow\" target=\"_blank\">stevenbergwijn</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Salary</td>\r\n			<td>&euro;90,385 weekly</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Outfitter</td>\r\n			<td>Adidas</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Net Worth</td>\r\n			<td>&euro;2.4 million</td>\r\n		</tr>\r\n		<tr>\r\n			<td>GF&rsquo;s Insta</td>\r\n			<td>chloejaylois</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Marital Status</td>\r\n			<td>In a Relationship</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Eredivisie: Ajax</h2>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Season</td>\r\n			<td>Match</td>\r\n			<td>Goal</td>\r\n			<td>Assist</td>\r\n		</tr>\r\n		<tr>\r\n			<td>22/23</td>\r\n			<td>11 (as of 29 Oct. 2022)</td>\r\n			<td>7</td>\r\n			<td>2</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>English Premier League: Tottenham</h2>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Season</td>\r\n			<td>Match</td>\r\n			<td>Goal</td>\r\n			<td>Assist</td>\r\n		</tr>\r\n		<tr>\r\n			<td>21/22</td>\r\n			<td>25</td>\r\n			<td>3</td>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>20/21</td>\r\n			<td>21</td>\r\n			<td>1</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>UEFA Nations League: Netherlands</h2>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Season</td>\r\n			<td>Match</td>\r\n			<td>Goal</td>\r\n			<td>Assist</td>\r\n		</tr>\r\n		<tr>\r\n			<td>22/23</td>\r\n			<td>6 (as of Group Stage)</td>\r\n			<td>2</td>\r\n			<td>0</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Age</h2>\r\n\r\n<p>Steven Bergwijn is {% calculate_age 1997 %} years old (as of {{ current_year }}).</p>\r\n\r\n<h2>Height</h2>\r\n\r\n<p>Steven Bergwijn&#39;s height is 178 cm (5&prime; 10&Prime;).</p>','2023-05-20 19:54:22.214000','2023-05-25 07:13:24.160000','steven-bergwijn-2-2-2','blog_images/steven-bergwijn-net-worth-salary-career-height-biography_DE5bZZN.jpg',1,1,'index','index'),(43,'My Rest API Post Title With Auth Token','<h1>This Is My Test Content</h1> <img src=\"/media/blog_images/image2_1usSTi8.jpg\" style=\"height:267px; width:400px\" alt=\"\" /> <p>This is the Sample Paragraph</p>','2023-05-21 17:59:55.452000','2023-05-21 17:59:55.452000','my-rest-api-post-title-with-auth-token','blog_images/image1_GotLI6f.jpg',1,1,'draft','index'),(44,'My Rest API Post Title With Auth Token','<h1>This Is My Test Content</h1> <img src=\"/media/blog_images/image2_5Z7X0iB.jpg\" style=\"height:267px; width:400px\" alt=\"\" /> <p>This is the Sample Paragraph</p>','2023-05-21 18:00:26.628000','2023-05-21 18:00:26.628000','my-rest-api-post-title-with-auth-token-2','',1,1,'draft','index'),(48,'Chaos at US High School Soccer Matches as Helicopter Rushes Injured Parents to Hospital','<p>It is becoming a growing problem in the US that parents are getting into physical altercations while watching their children play sports. This was evidenced at the soccer game between Union and Ridgeview High School on Tuesday, where a large brawl broke out in the stands. This was caused by parents who were overly invested in their children&#39;s success on the field and who may have been quick to anger.</p>\r\n\r\n<p>A Twitter page called &#39;Fight Haven&#39; published a video of a high school soccer game where a verbal disagreement turned physical, leading to a large-scale stand-off. The incident was so intense that it resembled a WWE Royal Rumble.</p>','2023-05-21 18:09:11.966000','2023-05-25 06:01:32.708000','chaos-at-us-high-school-soccer-matches-as-helicopter-rushes-injured-parents-to-hospital-2','',1,2,'published','index'),(49,'Juventus Hit with More Legal Woes over Player Salary Investigation!','<p>Juventus is facing legal trouble as the Italian soccer federation has charged the club and seven former team directors with fraud. The allegations relate to the handling of player salary cuts during the coronavirus pandemic.</p><p>During the onset of the pandemic, Juventus stated that 23 of their players had consented to a four-month reduction in their wages to assist the club in navigating through the crisis.</p>\n<p>However, prosecutors have alleged that the players had only relinquished one month\'s worth of pay.</p>','2023-05-21 18:09:25.582000','2023-05-21 18:09:25.582000','juventus-hit-with-more-legal-woes-over-player-salary-investigation','',1,2,'draft','index'),(50,'High School Soccer Match Turns Violent: Helicopter Rushes Injured Parents to Hospital','<p>Incidents of parents engaging in physical altercations while attending their children\'s sporting events are on the rise, causing significant issues in the United States. During the soccer game on Tuesday between Union and Ridgeview High School, a massive brawl broke out in the stands. This altercation was most likely instigated by overly passionate and protective parents who were eager to see their children succeed on the field.</p><p>A video shared on Twitter by \'Fight Haven\' depicts a high school soccer match where a verbal argument turned into a belligerent altercation. The incident resulted in one of the most significant standoffs ever observed in high school soccer. The footage has a resemblance to WWE\'s Royal Rumbles.</p><p>As per a Twitter account that shares noteworthy on-camera fights, the brawl originated from Ridgeview High parents hurling racial insults towards the parents of the home team. The situation escalated when home fans reached their limit and chose to retaliate with physical violence.</p><p>There were injuries and one person, Donald Guerrant, was arrested and charged with assault and battery after a nasty altercation, according to the Virginia sheriff. </p><p>Parents must set a good example and avoid behaving like quarreling adolescents. It\'s necessary to give a red card to anyone who is involved in such behavior.</p>','2023-05-21 18:10:06.860000','2023-05-21 18:10:06.860000','high-school-soccer-match-turns-violent-helicopter-rushes-injured-parents-to-hospital','',1,2,'draft','index'),(51,'Juventus faces legal heat again over skyrocketing player salaries','<p>Juventus is facing legal problems as the Italian soccer federation charged the club and seven former team directors with fraud. The allegations stem from the club\'s handling of player salary cuts during the coronavirus pandemic.</p><p>During the initial phase of the pandemic, Juventus announced that 23 of their players had consented to a salary cut for four months with the intention to support the club during this unprecedented situation. However, the prosecution alleges that the players only offered to forgo their salaries for one month.</p><p>Former Juventus president Andrea Agnelli, ex-vice president Pavel Nedved, and previous sports director Fabio Paratici face charges.</p><p>The latest allegations against Juventus will result in another sports trial, following a 15-point penalty that was imposed on the team this season by the federation for fraudulent accounting.</p><p>Last month, the highest sports court within the Italian Olympic Committee suspended the 15-point penalty. The penalty was subject to an appeal and was referred back to the soccer federation\'s appeals court for a new sentence.</p><p>In Turin, prosecutors have accused Juventus, along with Agnelli and 11 other individuals, of several crimes. These include false communications by a company listed publicly on the Milan stock exchange, obstructing watchdog agencies, false billing, and market manipulation.</p><p>On Thursday, Juventus was knocked out of the Europa League semifinals by Sevilla, resulting in the club going without any titles this season.</p>','2023-05-21 18:10:47.170000','2023-05-21 18:10:47.170000','juventus-faces-legal-heat-again-over-skyrocketing-player-salaries','',1,2,'draft','index'),(52,'Is Haaland\'s Champions League Drought a Concern for Man City Fans?','<p>Could Erling Haaland be frozen? It\'s hard to believe that he missed every opportunity against Courtois. Manchester City rejoiced as they secured their place in the Champions League final by defeating Real Madrid, the reigning European champions.</p><p>Bernardo Silva netted two goals, securing his status as the hero who propelled City into the finals.</p> \n<p>In the clashes against Real Madrid, Haaland struggled as he was constantly marked and thwarted by Courtois, resulting in limited chances.</p><p>Should City fans be concerned about the Terminator\'s lack of scoring in the semi-finals?</p>\n\n<p>Is it a cause for concern among City fans that the Terminator did not manage to score in the semi-finals?</p><p>On April 19, Haaland scored his most recent goal in the UEFA Champions League contest against Bayern Munich. Although he is a consistent threat within the penalty area, it remains to be seen if he can end his goalless streak and find the net in the final against Inter.</p><p>The future Golden Boot winner of the Premier League has shattered multiple records. In just 33 games, the Norwegian has netted an impressive 36 goals and provided 7 assists.</p>','2023-05-21 18:11:22.439000','2023-05-21 18:11:22.439000','is-haalands-champions-league-drought-a-concern-for-man-city-fans','',1,2,'draft','index'),(53,'Zendejas in the Mix: US Men\'s National Team Unveils Preliminary Nations League Roster!','<p>Last Friday, CONCACAF announced the preliminary roster of four teams that will participate in the Nations League\'s Final Four next month: the United States, Mexico, Canada, and Panama.</p><p>El Tri\'s opponent in the semi-finals, called up by the Stars and Stripes, will include Alejandro Zendejas from Club America. He declined the invitation from the Aztecs and will be playing for the U.S. team.</p><p>On Thursday, June 15, he may have to confront Mexico at Allegiant Stadium situated in Las Vegas, Nevada.</p><p>Coach Anthony Hudson made no surprises in his decision to call up his top players, such as Christian Pulisic, Weston McKennie, Sergino Dest, and Folarin Balogun, for the match against El Tri. Balogun chose to join the United States team instead of playing for England.</p><p>Today was the deadline for national teams to submit a preliminary list of up to 60 players. From this list, 23 players will be chosen to make up the final squad.</p><p>It is important to mention that if a player is not included in the provisional list, they will not be able to participate in the matches. This list must be finalized 24 hours prior to the commencement of the opening match.</p><p>The semi-finals stage of the competition has arrived, marking a significant milestone in the event. The top-performing contestants from the previous rounds will compete against each other to determine who will progress to the final stage. The tension and excitement are at an all-time high as the stakes are raised and the pressure intensifies. The contestants have worked hard to get to this point and will leave it all on the line to secure their spot in the final.</p><p>15th June, Thursday</p><p>There are two major stages in a competition: the preliminary stage and the final stage. However, there is also a third place match that takes place in some competitions. This match is held between the two semifinalists who did not make it to the final and determines the third and fourth place positions.</p>\n\n<p>The final stage is the ultimate round of the competition, where the top two contestants or teams compete against each other. The winner of the final stage is declared as the ultimate champion of the competition. This stage is regarded as the most important part of the competition and attracts a lot of attention from spectators.</p>','2023-05-21 18:12:22.580000','2023-05-21 18:12:22.580000','zendejas-in-the-mix-us-mens-national-team-unveils-preliminary-nations-league-roster','',1,2,'draft','index'),(54,'Breaking News: David Beckham Stuns Fans With His Topless Make Up Tutorial!','<p>David Beckham has left his fans feeling perplexed and amazed after releasing a video that showcases his unconventional make-up routine, whilst displaying his bare chest.</p><p>A father of four took control of his wife\'s TikTok account, belonging to Victoria Beckham, to share with followers her makeup routine.</p><p>Beckham made a joke by impersonating Victoria, indicating that he was teasing her.</p><p>Beckham started the video by using a makeup brush on his face and said, \"My wife thinks that this lighting is the best for creating content.\"</p><p>David Beckham spoke with wet hair and only a towel on. He admitted, \"I don\'t have much knowledge on the topic, but I agree with that statement.\"</p><p>According to Victoria Beckham beauty, the best way to take care of your skin is by moisturizing it regularly. As for me, I also like to keep my skin hydrated and well-maintained.</p><p>Victoria\'s TikTok channel fans seemed to love the appearance of the previous Manchester United and Real Madrid midfielder.</p><p>Someone once wrote the phrase \"Blend it like Beckham.\"</p>\n<p>The task is to simplify the phrase.</p>\n<p>Wrap each paragraph with <p></p> tags.</p><p>A second person commented that the tutorial was unexpected but necessary. Meanwhile, a third person pointed out that the makeup brush didn\'t even have any product on it, accompanied by several laughing emojis.</p><p>David and Victoria seem to have a positive dynamic when it comes to mocking each other. David wasted no time cracking jokes after Victoria deviated from her rigorous diet to celebrate her birthday.</p><p>After her birthday celebrations, she posted a picture on Instagram. David Beckham commented on the picture saying, \"Yep and she eats cake.\"</p>','2023-05-21 18:13:12.549000','2023-05-21 18:13:12.549000','breaking-news-david-beckham-stuns-fans-with-his-topless-make-up-tutorial','',1,2,'draft','index'),(55,'Victor Wembanyama\'s Shocking Height Revealed in Viral Video with Kylian Mbappe Sending NBA Fans into a Frenzy!','<p>On Tuesday, Victor Wembanyama hosted an NBA Draft lottery party in Paris where he gained a lot of social media attention. This was because of a video showing him standing alongside Paris Saint-Germain\'s superstar Kylian Mbappe. </p><p>The San Antonio Spurs have secured the top pick in the upcoming draft. They plan on selecting Wemby, who will be following in the footsteps of two of the franchise\'s legends: David Robinson and Tim Duncan. Both Robinson and Duncan were also number one picks for the team.</p><p>Wembanyama is a 19-year-old basketball player who is officially recorded at a height of 7-foot-2. However, he has claimed in the past that his real height is 7-foot-4.</p><p>According to some media outlets, the Frenchman is listed at a height of 7-foot-5 and they suggest that he may continue to grow.</p><p>He is often regarded as a remarkable talent of his time and the most anticipated draft pick since LeBron James.</p><p>Mbappe, who is 24 years of age, was present at his fellow countryman\'s exclusive occurrence. They have met before, and Mbappe has previously been spotted sitting courtside at Wemby\'s basketball matches. This includes one game that took place on the evening preceding the draft.</p><p>Their latest meeting\'s video was posted by NBA France on Twitter and has already received more than a million views.</p><p>Wembanyama and his family and friends stayed up past 2am to follow the lottery event.</p><p>\"I\'ll never forget this moment,\" said Wembanyama as his heart raced with excitement.</p>','2023-05-21 18:13:58.424000','2023-05-21 18:13:58.424000','victor-wembanyamas-shocking-height-revealed-in-viral-video-with-kylian-mbappe-sending-nba-fans-into-a-frenzy','',1,2,'draft','index'),(56,'West Ham Fan Becomes Real-Life Superhero, Defeats 100 AZ Alkmaar Ultras in Family Zone Attack','<p>One West Ham supporter, who goes by the name \"Knollsy\", has made a name for himself in the history of the club. He has gained a following among football fans as a result of his actions after the semifinal UEFA Conference League match against AZ Alkmaar, where he bravely confronted a group of hostile ultras.</p><p>The hooligans couldn\'t handle the 0-1 defeat. They reacted in a shocking manner by targeting the section of the stands where the player\'s friends and family sat during the game. Their attack was aimed at the most vulnerable individuals and if it wasn\'t for \'Knollsy\'s heroics, the consequences could have been even worse.</p><p>The video footage depicts a lone fan battling against a group of approximately one hundred Dutch hooligans, all dressed in black. Despite being greatly outnumbered, the fan courageously fought off each attacker with lethal punches and kicks. His efforts can be likened to that of a knight defending against an army within the confines of the AFAS Stadium. The fan\'s decision to engage in such a feat of bravery was commendable, considering the dangerous circumstances he faced. </p><p>Although the ultras tried their best, they couldn\'t overcome the firm stance of \'Knollsy\' amidst the black crowd. The video suggests that only one other person assisted their friend courageously.</p><p>Many football fans praised the courageous man on Twitter. One person who isn\'t a West Ham fan said, \"Credit to those two for taking a stand.\" Another fan remarked, \"This was like a combination of 300, Game of Thrones (Hodor), and Star Wars Episode 3 (the high ground). Excellent job!\"</p>','2023-05-21 18:14:41.193000','2023-05-21 18:14:41.193000','west-ham-fan-becomes-real-life-superhero-defeats-100-az-alkmaar-ultras-in-family-zone-attack','',1,2,'draft','index'),(57,'From Triumph to Turmoil: Napoli Braces for Implosion After Serie A Victory','<p>Napoli is celebrating both the club and city&#39;s recent Scudetto victory, which marks their third Serie A title win in history.</p>\r\n\r\n<p>Grey clouds are looming on the horizon, indicating trouble in the champion&#39;s territory.</p>\r\n\r\n<p>The future of head coach Luciano Spalletti is uncertain following reports of a difficult meeting with Napoli owner Aurelio De Laurentiis.</p>\r\n\r\n<p>Tension is increasing between the two despite their recent successful achievement. It appears that they are not in agreement.</p>\r\n\r\n<p>&quot;It&#39;s up to the club to choose whether to keep me or not,&quot; stated Spalletti, who recently received the Serie A Manager of the Year award.</p>\r\n\r\n<p>The recent turnaround in Naples is difficult to understand, as it was only a short time ago when it seemed certain that the Tuscan coach would continue to stay there permanently.</p>\r\n\r\n<p>The club utilized a clause to prolong his contract until 2024 and is discussing the possibility of an additional extension.</p>\r\n\r\n<p>&#39;Radio Kiss Kiss Napoli&#39;, the official media outlet of the club, recently emphasized that if Spalletti decides to resign from his position, he would be required to pay a sum of eight million euros as compensation.</p>\r\n\r\n<p>Within two years of being a member at the club, he has made six million dollars.</p>\r\n\r\n<p>It&#39;s a curious timing, which may be a message from the club. It could be a warning about who holds the negotiation power.</p>\r\n\r\n<p>It is clear that things are uncertain, despite the recent victory on the field that is still fresh in our minds.</p>\r\n\r\n<p>On Saturday, at 15:00 (CET), Spalletti will speak to the media and possibly provide an update on the situation himself.</p>\r\n\r\n<p>Supporters hope he clarifies the doubts.</p>\r\n\r\n<p>There could be tension between Spalletti and the club due to the way his recent renewal was handled. Reports suggest that he was informed about the automatic extension through an email, which may have left him unhappy.</p>\r\n\r\n<p>Behind all of this, there&#39;s the possibility that Napoli&#39;s director of sports, Cristiano Guintoli, could soon move to Juventus.</p>\r\n\r\n<p>Napoli has a strong foundation to build upon, but there&#39;s a risk of implosion.</p>','2023-05-21 18:15:42.793000','2023-05-25 06:07:19.690000','from-triumph-to-turmoil-napoli-braces-for-implosion-after-serie-a-victory-2','',1,2,'draft','index'),(58,'Man City\'s Exciting New Home Kit Sends the Internet into a Frenzy!','<p>Manchester City is dominating both the pitch and social media by unveiling their new home kit for the 2023-24 season.</p><p>The jersey design celebrates the 20th anniversary of Etihad Stadium, home of the citizens. The vertical stripes pay tribute to the stadium\'s architecture, specifically the spiral \"turrets\" found on the concourse outside both the Colin Bell West and East stands.</p><p>As an extra touch, the Puma designers incorporated the Etihad\'s zip code on the back of the jersey. Additionally, the design of this brand new kit was influenced by the one worn during the team\'s first year.</p><p>City has made some changes to their kit for the 2022-23 season. They have removed the red details as opposed to their proposal and returned the logo to the left side of the chest area.</p><p>Manchester City\'s new home kit has been well-received by fans on social media. Their reactions have shown that they really like the design.</p>','2023-05-21 18:16:12.087000','2023-05-21 18:16:12.087000','man-citys-exciting-new-home-kit-sends-the-internet-into-a-frenzy','',1,2,'draft','index'),(59,'San Diego Scores Big: MLS Expansion Team Joins the Game in 2025!','<p>The long-awaited moment has finally arrived.</p>\r\n\r\n<p>San Diego FC has been officially announced as the 30th franchise of Major League Soccer. The announcement was made on Thursday, and the team is expected to join the league for the 2025/26 season.</p>\r\n\r\n<p>MLS commissioner Don Garber announced the addition of a new team during an event held at Snapdragon Stadium in San Diego. The expansion club&#39;s ownership group stood alongside Garber during the reveal.</p>\r\n\r\n<p>San Diego FC ownership group is paying a high price to participate in the top tier of American soccer, as joining the MLS is a costly undertaking.</p>\r\n\r\n<p>San Diego&#39;s ownership received a boost of muscle and star power with the addition of Manny Machado, which was announced last Thursday. The new club sees the San Diego Padres third baseman take on the role of &quot;founding partner&quot; and majority owner.</p>\r\n\r\n<p>Machado&#39;s ownership share is solidifying his connections to the San Diego community. He committed to a long-term agreement with the Padres, securing an 11-year, $350 million contract with no opt-outs or trade clauses. As a result, he is determined to remain a key figure within the organization.</p>\r\n\r\n<p>The men&#39;s professional soccer team currently in San Diego doesn&#39;t seem to be included in the MLS&#39;s future plans.</p>\r\n\r\n<p>San Diego Loyal, a second-tier USL Championship team, sent a brief social media message wishing the new MLS franchise success, thereby indicating that there would be no partnership between the teams.</p>\r\n\r\n<p>The co-owners of The Loyal include Landon Donovan, a prominent figure in MLS history and United States soccer. However, it is unclear what role Donovan will have with San Diego FC going forward.</p>','2023-05-21 18:16:58.286000','2023-05-25 06:04:06.581000','san-diego-scores-big-mls-expansion-team-joins-the-game-in-2025-2','',1,2,'draft','index'),(60,'High School Soccer Match Turns Violent: Helicopter Rushes Injured Parents to Hospital','<p>Violent altercations between parents at youth sports events are becoming increasingly common and problematic in the United States. During a recent soccer match between Union and Ridgeview High School, an argument between parents erupted into a massive brawl in the stands. Video footage posted on the Twitter page &#39;Fight Haven&#39; shows the heated exchange escalating into a violent showdown, reminiscent of a WWE Royal Rumble. The altercation reportedly began when parents of Ridgeview High School began hurling racial slurs at the home team&#39;s parents, and escalated when home fans chose to respond with violence. The Virginia sheriff&#39;s department reported several injuries, and one individual, Donald Guerrant, was arrested and charged with assault and battery. This behavior is unacceptable and parents should set a better example for their children. A red card for all involved!</p>\r\n\r\n<p>Paragraphs are written to express ideas and communicate effectively. They are formed by a group of sentences that relate to a central topic or theme. The sentences are connected by transitional words and phrases to make the flow of the text more coherent. However, it is important to avoid using overly complicated language or lengthy sentences, as this may actually hinder understanding and detract from the overall message. Instead, simple language and shorter sentences can enhance the clarity and impact of the writing.</p>\r\n\r\n<p>When constructing a paragraph, it is essential to have a clear purpose in mind. The writer should determine whether the paragraph is intended to inform, explain, persuade, or describe. This will help ensure that the paragraph is focused and effectively conveys the intended message. Additionally, using concrete examples and specific details can help to illustrate the topic and make the writing more engaging for the reader.</p>\r\n\r\n<p>Paragraphs can also be structured in various ways, depending on the type of writing and the desired effect. For instance, a narrative paragraph may begin with an attention-grabbing phrase that sets the scene, followed by a series of events that build tension or emotion. Conversely, in a persuasive paragraph, the author may begin with a statement of the opposing view and then argue against it with supporting evidence. Ultimately, the structure of a paragraph should serve to enhance its overall effectiveness and impact.</p>','2023-05-21 18:25:19.593000','2023-05-25 07:07:26.815000','high-school-soccer-match-turns-violent-helicopter-rushes-injured-parents-to-hospital-2-2','',1,2,'published','index'),(61,'Juventus kicks off season with legal headache over player salaries probe','<p>Juventus and seven former team directors have been charged with fraud by the Italian soccer federation for their handling of player salary cuts during the pandemic. Although the club had claimed that 23 players agreed to salary reductions for four months, prosecutors allege that they only gave up one month&#39;s salary. The charges are the latest legal trouble for Juventus, which was already penalized 15 points for false accounting. Former president Andrea Agnelli, former vice president Pavel Nedved, and former sports director Fabio Paratici are among those charged.</p>\r\n\r\n<p>The penalty was suspended on appeal to the country&#39;s highest sports court, but the charges now lead to another sports trial. In Turin, prosecutors have also charged Juventus, Agnelli, and others with false communications, obstructing watchdog agencies, false billing, and market manipulation. Despite enduring a season without any titles, Juventus&#39; troubles continue to mount.</p>\r\n\r\n<p>The following are guidelines for preparing and delivering an effective presentation. Firstly, know your topic well. Conduct thorough research to gather enough information and resources to support your presentation. Secondly, organize your presentation in a way that is easy to follow. This can be achieved by creating an outline, sectioning your presentation or using visual aids. Thirdly, practice delivering your presentation before the big day. This will help you to be more confident and comfortable when presenting. Finally, tailor your presentation to your audience. Consider their level of understanding, interests, and needs when preparing and delivering your presentation.</p>\r\n\r\n<p>Writing a resume can be a daunting task, but following these tips can help make the process easier. Firstly, highlight your most relevant experience and skills. Tailor your resume to the job you are applying for, and only include information that is relevant to that particular position. Secondly, use a clean and easy-to-read font, and make sure your resume is error-free. Thirdly, include a brief summary or objective statement to express your career goals and aspirations. Finally, keep your resume concise and to the point, typically no more than two pages.</p>\r\n\r\n<p>Effective communication is essential in every relationship. Here are some tips for improving communication with your partner. Firstly, listen actively. This means paying attention to what your partner is saying, and acknowledging their thoughts and feelings. Secondly, avoid making assumptions or jumping to conclusions. Instead, ask for clarification when needed. Thirdly, be open and honest. Communication is a two-way street, and both partners should feel comfortable expressing their feelings and thoughts. Finally, work together to resolve conflicts. Communication is key to resolving disagreements and finding solutions that work for both partners.</p>','2023-05-21 18:26:17.337000','2023-05-25 07:07:18.852000','juventus-kicks-off-season-with-legal-headache-over-player-salaries-probe-2-2','',1,2,'published','index');
/*!40000 ALTER TABLE `sports_blogpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_category`
--

DROP TABLE IF EXISTS `sports_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_category`
--

LOCK TABLES `sports_category` WRITE;
/*!40000 ALTER TABLE `sports_category` DISABLE KEYS */;
INSERT INTO `sports_category` VALUES (1,'Player Bio','player-bio'),(2,'News','news'),(3,'Player\'s Wife','players-wife');
/*!40000 ALTER TABLE `sports_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_contact`
--

DROP TABLE IF EXISTS `sports_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_contact`
--

LOCK TABLES `sports_contact` WRITE;
/*!40000 ALTER TABLE `sports_contact` DISABLE KEYS */;
INSERT INTO `sports_contact` VALUES (1,'Samiul','samidurbar@gmail.com','Test Email','01670245815','Hi,\r\nThis Is a Test Email'),(2,'Samiul','samidurbar@gmail.com','Test Email','01670245815','Hi,\r\nThis Is a Test Email'),(3,'Samiul','samidurbar@gmail.com','Test','0146','Test'),(4,'Samiul Huda','samidurbar@gmail.com','Test Email with Confimr','01670245815','Hi,\r\nThis is a test email');
/*!40000 ALTER TABLE `sports_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_filemodel`
--

DROP TABLE IF EXISTS `sports_filemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_filemodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_filemodel`
--

LOCK TABLES `sports_filemodel` WRITE;
/*!40000 ALTER TABLE `sports_filemodel` DISABLE KEYS */;
INSERT INTO `sports_filemodel` VALUES (1,'blog_images/image2.jpg'),(2,'blog_images/image2_CG2nAGS.jpg'),(3,'blog_images/image2_M5PMqwR.jpg'),(4,'blog_images/image2_KeKNedS.jpg'),(5,'blog_images/image2_LrEtrZ5.jpg'),(6,'blog_images/image2_vD6e4gw.jpg'),(7,'blog_images/image2_vxkIr9b.jpg'),(8,'blog_images/image2_pAcj1an.jpg'),(9,'blog_images/image2_ZDvCsem.jpg'),(10,'blog_images/image2_psrXIM4.jpg'),(11,'blog_images/image2_xI4usWj.jpg'),(12,'blog_images/image2_XwXXWzz.jpg'),(13,'blog_images/cody-james-1.jpg'),(14,'blog_images/cody-james-1_LMx0ldm.jpg'),(15,'blog_images/cody-james-1_xzkjj2q.jpg'),(16,'blog_images/cody-james-1_f8anTNR.jpg'),(17,'blog_images/cody-james-1_WoBJV1e.jpg'),(18,'blog_images/steven-bergwijn-1.jpg'),(19,'blog_images/steven-bergwijn-1_06AFe0q.jpg'),(20,'blog_images/cody-james-1_YqciXJT.jpg'),(21,'blog_images/image2_81JfpAr.jpg'),(22,'blog_images/steven-bergwijn-1_Agg7Nqt.jpg'),(23,'blog_images/steven-bergwijn-1_WjEx0bx.jpg'),(24,'blog_images/cody-james-1_dDSFq5f.jpg'),(25,'blog_images/steven-bergwijn-1_P5rEVK6.jpg'),(26,'blog_images/steven-bergwijn-1_9VewFOg.jpg'),(27,'blog_images/steven-bergwijn-1_EtK6YCL.jpg'),(28,'blog_images/steven-bergwijn-1_h3BZoiZ.jpg'),(29,'blog_images/steven-bergwijn-1_kRd1siW.jpg'),(30,'blog_images/steven-bergwijn-1_IOxPV5V.jpg'),(31,'blog_images/steven-bergwijn-1_lks2keD.jpg'),(32,'blog_images/steven-bergwijn-1_xf6ZD6f.jpg'),(33,'blog_images/cody-james-1_5fatJYB.jpg'),(34,'blog_images/steven-bergwijn-1_1yq2KdC.jpg'),(35,'blog_images/steven-bergwijn-1_OoSusSY.jpg'),(36,'blog_images/cody-james-1_Q9TOj3w.jpg'),(37,'blog_images/steven-bergwijn-1_1M2x2Tg.jpg'),(38,'blog_images/steven-bergwijn-1_8spKaxt.jpg'),(39,'blog_images/steven-bergwijn-1_U1wjAnv.jpg'),(40,'blog_images/steven-bergwijn-1_kkhf03c.jpg'),(41,'blog_images/cody-james-1_MZ11u6u.jpg'),(42,'blog_images/cody-james-1_dv79ZSZ.jpg'),(43,'blog_images/steven-bergwijn-1_nXbxKvS.jpg'),(44,'blog_images/steven-bergwijn-1_xrcCk1A.jpg'),(45,'blog_images/steven-bergwijn-1_epMZMYg.jpg'),(46,'blog_images/steven-bergwijn-1_8PgikjY.jpg'),(47,'blog_images/cody-james-1_xpuxTGS.jpg'),(48,'blog_images/image2_1usSTi8.jpg'),(49,'blog_images/image2_5Z7X0iB.jpg');
/*!40000 ALTER TABLE `sports_filemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_sitesetting`
--

DROP TABLE IF EXISTS `sports_sitesetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_sitesetting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_sitesetting`
--

LOCK TABLES `sports_sitesetting` WRITE;
/*!40000 ALTER TABLE `sports_sitesetting` DISABLE KEYS */;
INSERT INTO `sports_sitesetting` VALUES (1,'sidebar_latest_posts','3');
/*!40000 ALTER TABLE `sports_sitesetting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-28 12:45:45
