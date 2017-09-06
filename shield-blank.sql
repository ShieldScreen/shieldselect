-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: shield
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

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
-- Table structure for table `announcement_views`
--

DROP TABLE IF EXISTS `announcement_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `announcement_id` varchar(45) NOT NULL,
  `vendor_id` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `view_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `enabled` enum('true','false') DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_kits`
--

DROP TABLE IF EXISTS `client_kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_kits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(45) NOT NULL,
  `kit_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address_1` varchar(45) DEFAULT NULL,
  `address_2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'List B & C'),(2,'US Passport'),(3,'Passport Card');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_documents`
--

DROP TABLE IF EXISTS `employee_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(45) NOT NULL,
  `document_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_licenses`
--

DROP TABLE IF EXISTS `employee_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `license_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `alias` varchar(150) DEFAULT NULL,
  `suffix` varchar(45) DEFAULT NULL,
  `dob` date NOT NULL,
  `ssn` char(12) NOT NULL,
  `address_1` varchar(45) NOT NULL,
  `street_name` varchar(45) NOT NULL,
  `address_2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `county` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `monthly_income` float DEFAULT NULL,
  `monthly_rent` float DEFAULT NULL,
  `screening_notes` varchar(45) DEFAULT NULL,
  `active` enum('y','n') DEFAULT 'y',
  `last_screening_date` datetime DEFAULT NULL,
  `mvr_state` varchar(45) DEFAULT NULL,
  `dl_number` varchar(45) DEFAULT NULL,
  `dl_expiration` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `resident_status` varchar(45) DEFAULT NULL,
  `ref_number` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `label` varchar(45) DEFAULT NULL,
  `tip` varchar(45) DEFAULT NULL,
  `input_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (3,7,'Region','State',NULL,'select'),(4,8,'FormattedName','Reference Name',NULL,'text'),(5,8,'Telephone','Reference Phone',NULL,'text'),(6,8,'Relationship','',NULL,'text'),(7,9,'StartDate','Move-In Date','2010-10-10','text'),(8,9,'FormattedName','Contact Name',NULL,'text'),(9,9,'Telephone','Contact Phone',NULL,'text'),(10,9,'PostalCode','Zip',NULL,'text'),(11,9,'Region','State',NULL,'select'),(12,9,'Municipality','City',NULL,'text'),(13,9,'AddressLine','Address #',NULL,'text'),(14,9,'StreetName','Street Name',NULL,'text'),(15,10,'Region','State',NULL,'select'),(16,11,'OrganizationName','Organization Name',NULL,'text'),(17,11,'Title','Job Title',NULL,'text'),(18,11,'JobLevelInfo','Job Level','Full-Time | Part-Time','select'),(19,11,'StartDate','Start Date','2010-10-10','text'),(20,11,'EndDate','End Date','2010-10-10','text'),(21,11,'Compensation',NULL,'i.e. $15.00/hr | $60,000/yr','text'),(22,11,'FormattedName','Contact Name',NULL,'text'),(23,11,'Telephone','Contact Phone',NULL,'text'),(24,11,'PostalCode','Zip',NULL,'text'),(25,11,'Region','State',NULL,'select'),(26,11,'Municipality','City',NULL,'text'),(27,11,'AddressLine','Address #',NULL,'text'),(28,11,'StreetName','Street Name',NULL,'text'),(29,12,'Region','State',NULL,'select'),(30,12,'LicenseNumber','License Number',NULL,'text'),(32,12,'LicenseName','License Name','i.e. Licensee','text'),(33,13,'Region','State',NULL,'select'),(34,13,'SchoolName','School Name',NULL,'text'),(35,13,'Municipality','City',NULL,'text'),(36,13,'DegreeName','Degree Name',NULL,'text'),(37,13,'StringDate','Date','i.e. 2002-09 TO 2006-01','text'),(38,13,'schoolType','School Type','University, Community College, etc.','text'),(39,13,'degreeType','Degree Type','Masters, Bachelors, etc.','text'),(40,14,'PermissiblePurpose','Permissible Purpose','Pre-Employment, etc.','text'),(41,14,'SpecimenId','Specimen ID',NULL,'text'),(42,6,'Region','State',NULL,'select'),(43,6,'County','','','text'),(44,16,'Region','State','','select'),(45,16,'District','District',NULL,'text'),(46,17,'Region','State',NULL,'select'),(47,18,'Region','State',NULL,'select'),(48,18,'County','','','text'),(49,19,'Region','Country',NULL,'select'),(50,21,'Region','State',NULL,'select'),(51,14,'Panel','Panel','DOT Collection, etc.','text'),(52,32,'Region','State','','select'),(53,32,'LicenseNumber','License Number',NULL,'text'),(54,32,'LicenseName','License Name','i.e. Licensee','text');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `employee_id` varchar(45) NOT NULL,
  `date_uploaded` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `uuid` varchar(128) DEFAULT NULL,
  `directory` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `slug` varchar(100) DEFAULT NULL,
  `level` smallint(5) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Shield Admin','shield-admin',6),(2,'Program Manager','program-manager',5),(3,'Vendor','vendor',4),(4,'Vendor User','user',3);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit_components`
--

DROP TABLE IF EXISTS `kit_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kit_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kit_id` varchar(45) NOT NULL,
  `type_id` varchar(45) NOT NULL,
  `qualifier_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kits`
--

DROP TABLE IF EXISTS `kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(45) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `license_agency_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,'Full Medical',1),(2,'Resident Physician',1),(3,'Physician Public Health',1),(4,'Medical Doctor',2),(5,'Nurse Practitioner',2),(6,'RN',3),(7,'LVN',3);
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(15) unsigned DEFAULT '0',
  `ip` int(10) unsigned DEFAULT NULL,
  `controller` varchar(20) DEFAULT NULL,
  `action` varchar(40) DEFAULT NULL,
  `message` text,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qualifiers`
--

DROP TABLE IF EXISTS `qualifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `custom_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `qualifiers` WRITE;
/*!40000 ALTER TABLE `qualifiers` DISABLE KEYS */;
INSERT INTO `qualifiers` VALUES (8,7,'statewide','Eviction Search',NULL),(9,7,'singlestate','InstaEviction Search',NULL),(10,8,'professional','Professional Reference',NULL),(11,8,'personal','Personal Reference',NULL),(14,6,'county',NULL,NULL),(15,16,'federal',NULL,NULL),(16,17,'statewide',NULL,NULL),(17,18,'county',NULL,NULL),(18,19,'international',NULL,NULL),(19,20,'multistate',NULL,NULL),(20,21,'singlestate',NULL,NULL),(21,22,'security',NULL,NULL),(22,23,'national',NULL,NULL),(23,24,'national_alias',NULL,NULL),(24,12,'imvPersonal',NULL,NULL),(25,32,'professional',NULL,NULL),(26,33,'imvcommercial',NULL,NULL),(27,30,'identity',NULL,'E-Verify I-9 Verification'),(28,31,'credentials',NULL,'Fingerprints');
/*!40000 ALTER TABLE `qualifiers` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `screening_type_fields`
--

DROP TABLE IF EXISTS `screening_type_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screening_type_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `screening_type_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screening_types`
--

DROP TABLE IF EXISTS `screening_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screening_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `screening_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `qualifier_id` int(11) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenings`
--

DROP TABLE IF EXISTS `screenings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `kit_id` int(11) DEFAULT '0',
  `requestor_id` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  `report` tinytext,
  `order_complete` enum('y','n') NOT NULL DEFAULT 'n',
  `submitted` enum('y','n') NOT NULL DEFAULT 'n',
  `date_created` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `raw_xml_response` text,
  `error` tinytext,
  `pass_confirmation_id` varchar(45) DEFAULT NULL,
  `fail_flag` enum('true','false') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `api_name` varchar(45) DEFAULT NULL,
  `display_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'credit','credit','Credit'),(2,'ssn','ssn','Social Securtiy'),(3,'personsearch','personsearch','Person Search'),(6,'civil','civil','Civil Court'),(7,'eviction','eviction','Eviction'),(8,'reference','reference','Reference'),(9,'resident','resident','Resident'),(10,'workcomp','workcomp','Workers Comp'),(11,'employment','employment','Employment'),(12,'license','license','Instant Driving Records Search'),(13,'education','education','Education'),(14,'drug','drug','Drug'),(15,'scorecard','scorecard','Tenant Scorecard'),(16,'criminal_federal','criminal','Criminal (Federal Court)'),(17,'criminal_statewide','criminal','Criminal (State Court)'),(18,'criminal_county','criminal','Criminal (County Court)'),(19,'criminal_international','criminal','Criminal (International Court)'),(20,'criminal_multistate','criminal','Criminal (InstaCriminal Multi-State)'),(21,'criminal_singlestate','criminal','Criminal (InstaCriminal Single-State)'),(22,'criminal_security','criminal','Criminal (Global Homeland Security)'),(23,'criminal_national','criminal','Criminal (National Search)'),(24,'national_alias','criminal','Criminal (National Alias Search)'),(25,'sex_offender','sex_offender','Sex Offender Records Search'),(26,'assumedname','assumedname','Assumed Name Records Search'),(27,'lienjudgment','lienjudgment','Lien and Judgment Filings Search'),(28,'bankruptcy','bankruptcy','Bankruptcy Filings Search'),(29,'healthcare_sanctions','healthcare_sanctions','Healthcare Sanctions Search'),(30,'identity','custom','E-Verify I-9 Verification'),(31,'credentials','custom','Fingerprints'),(32,'license_prof','license','Professional License'),(33,'license_comm','license','Commercial License');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(5) unsigned DEFAULT '0',
  `first_name` varchar(40) DEFAULT '',
  `last_name` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `active` tinyint(2) unsigned DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`username`),
  KEY `name` (`first_name`,`password`,`created`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Joe','McAdmin','admin','6edcec24c255890c0169b1d4f8999e3f7254e164',1,'2013-09-11 16:18:58','2014-04-23 23:11:36'),(2,1,'Brookside','Admin','admin@brooksidestudios.com','c52e5df947db29b29bfd5f501b8cbc7f14d3bfff',1,'2013-09-11 16:26:43','2014-04-29 14:03:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_announcements`
--

DROP TABLE IF EXISTS `vendor_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `announcement_id` int(11) NOT NULL,
  `vendor_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address_1` varchar(45) DEFAULT NULL,
  `addreess_2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `api_username` varchar(45) DEFAULT NULL,
  `api_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Uploads`
--

DROP TABLE IF EXISTS `Uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `employee_id` varchar(45) NOT NULL,
  `date_uploaded` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `encoded_filename` varchar(45) DEFAULT NULL,
  `directory` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `run_time` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `result_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendors_users`
--

DROP TABLE IF EXISTS `vendors_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-03 14:08:12
