-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: test_bench
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data_entity_action_insert`
--

DROP TABLE IF EXISTS `data_entity_action_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_entity_action_insert` (
  `id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_action_type_id` int(10) unsigned NOT NULL,
  `entity_action_desc` varchar(1000) NOT NULL,
  `entity_action_data` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_action_insert`
--

LOCK TABLES `data_entity_action_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_action_insert` DISABLE KEYS */;
INSERT INTO `data_entity_action_insert` VALUES (1,4,2,'Text Box Enter Data: User Name - User name entry box','steve\r'),(2,5,2,'Text Box Enter Data: User Password - User password entry box','1234\r'),(3,6,1,'Button - Redirect: Login Button - Click to login','NA\r'),(4,9,3,'Image: Dakar Logo - Dakar logo','logo.png\r'),(5,10,3,'Label: Current Module Indicator label text','Payroll~Personell~Absence~T&A\r'),(6,11,1,'Button Function: Menu Toggle - Toggles the main menu view on/off','NA\r'),(7,12,4,'List: Current Company - Displays current company and list of all available companies','Mars Northern Products Ltd~Mars Incorporated Ltd\r'),(8,15,3,'Button Display: Employee Creation Wizard - Display the employee creation wizard form','NA\r'),(9,17,3,'Button Display: Employee Grid View - Display the employee grid view form','NA\r'),(10,18,3,'Button Display: Visual Reports - Display summary graphs form','NA\r'),(11,19,3,'Button Display: Dakar Intelligence - Display the DI form','NA\r'),(12,20,3,'Button Display: Organisation Chart - Display the organisation chart form','NA\r'),(13,21,3,'Button Display: My Company / Last Viewed - Display the last  viewed popup form','NA\r'),(14,22,3,'Button Display: All Notifications - Display the last  all notifications popup form. Displays total notifications (if there are any)','NA\r'),(15,23,3,'Button Display: New Employments - Display the new employments popup form.','NA\r'),(16,24,3,'Button Display: Terminations - Display the terminations popup form.','NA\r'),(17,25,3,'Button Display: Quick Links - Display the quick links popup form.','NA\r'),(18,26,3,'Button Display: User Avatar - Display the user config/action popup form. Displays the user image if setup.','NA\r'),(19,28,3,'Button Display: Employee List - Display the Employee List form.','NA\r'),(20,29,3,'Button Display: Documents - Display the user to the Employee Document form.','NA\r'),(21,30,3,'Button Display: Employees - Display the Employees sub menu.','NA\r'),(22,32,3,'Button Display: Payroll - Display the Payroll sub menu.','NA\r'),(23,33,3,'Button Display: Employee Statistics - Display the Employee Statistics sub menu.','NA\r'),(24,34,3,'Button Display: Payroll Statistics - Display the Payroll Statistics sub menu.','NA\r'),(25,35,3,'Button Display: Absence Statistics - Display the Absence Statistics sub menu.','NA\r'),(26,36,3,'Button Display: Reports - Display the Reports sub menu.','NA\r'),(27,38,3,'Button Display: Yearly Reports - Display the Yearly Payroll Reports form.','NA\r'),(28,39,3,'Button Display: Bulk Updates - Display the Bulk Updates sub menu.','NA\r'),(29,40,3,'Button Display: Settings - Display the user to the Settings form.','NA\r'),(30,14,3,'Button Display: Authorisations - Display the authorisations form','NA\r');
/*!40000 ALTER TABLE `data_entity_action_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_entity_action_insert_AFTER_INSERT` AFTER INSERT ON `data_entity_action_insert` FOR EACH ROW BEGIN
	 CALL create_entity_action(
		NEW.entity_id, 
		NEW.entity_action_type_id,
		NEW.entity_action_desc, 
		NEW.entity_action_data);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_entity_insert`
--

DROP TABLE IF EXISTS `data_entity_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_entity_insert` (
  `entity_id` int(10) unsigned NOT NULL,
  `entity_name` varchar(45) NOT NULL,
  `entity_parent` int(10) unsigned NOT NULL COMMENT 'id	entity_test_id	entity_test_name	entity_id	created_by_employee_id	entity_test_parent	description	initial_value	expected_value	received_value	insert_value	failure_halts_test	test_category_primary	test_category_secondary	test_created\n',
  `creation_type` enum('AUTO','MAN') NOT NULL,
  `entity_type_name` varchar(45) NOT NULL,
  `entity_desc` text,
  `should_have_tool_tip` varchar(5) NOT NULL,
  `tool_tip_text` varchar(250) DEFAULT NULL,
  `new_version_category` enum('MAJOR','MINOR','BUILD') NOT NULL,
  `endl` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`entity_name`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_insert`
--

LOCK TABLES `data_entity_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_insert` DISABLE KEYS */;
INSERT INTO `data_entity_insert` VALUES (1,'Root',0,'MAN','Root','FALSE','FALSE','NA','MAJOR','N\r'),(2,'Dakar Web',1,'MAN','Application','The Dakar Web App','FALSE','NA','MAJOR','N\r'),(3,'Login Screen',2,'MAN','Parent Form','The login screen that a user first encounters','FALSE','NA','MAJOR','N\r'),(4,'User Name',3,'MAN','Text In','User name entry box','FALSE','NA','MAJOR','N\r'),(5,'User Password',3,'MAN','Text In','User password entry box','FALSE','NA','MAJOR','N\r'),(6,'Login Button',3,'MAN','Button - Redirect','Click to login','FALSE','NA','MAJOR','N\r'),(7,'Home Page',2,'MAN','Parent Form','First page after login. Controls navigation of the app and provides some data to the user.','FALSE','NA','MAJOR','N\r'),(8,'Home Page Info Bar',7,'MAN','Info Bar','Top left info bar. Displays - 1: Logo 2: Current module 3:Full Screen Icon 4: TCL Icon 5: Current Company','FALSE','NA','MAJOR','N\r'),(9,'Dakar Logo',8,'MAN','Image','Dakar logo','FALSE','NA','MAJOR','N\r'),(10,'Current Module Indicator',8,'MAN','Label','Displays the currentlt selected module','FALSE','NA','MAJOR','N\r'),(11,'Menu Toggle',8,'MAN','Button - Function','Toggles the main menu view on/off','TRUE','Show or hide main menu. ','MAJOR','N\r'),(12,'Current Company',8,'MAN','List','Displays current company and list of all available companies','FALSE','NA','MAJOR','N\r'),(13,'Home Page Top Right Nav Bar',7,'MAN','Nav Bar','Provides shortcuts to app elements. Also is the only way to swap between modules.','FALSE','NA','MAJOR','N\r'),(14,'Authorisations',13,'MAN','Button - Display','Display the authorisations form','TRUE','Authorisations','MAJOR','N\r'),(15,'Employee Creation Wizard',13,'MAN','Button - Display','Display the employee creation wizard form','TRUE','Employee Creation','MAJOR','N\r'),(16,'Employee CV',13,'MAN','Button - Display','Display the employee CV form','TRUE','Employee CV','MAJOR','N\r'),(17,'Employee Grid View',13,'MAN','Button - Display','Display the employee grid view form','TRUE','Employee Grid View','MAJOR','N\r'),(18,'Visual Reports',13,'MAN','Button - Display','Display summary graphs form','TRUE','Visual Reports','MAJOR','N\r'),(19,'Dakar Intelligence',13,'MAN','Button - Display','Display the DI form','TRUE','Dakar Intelligence','MAJOR','N\r'),(20,'Organisation Chart',13,'MAN','Button - Display','Display the organisation chart form','TRUE','My Company / Last Viewed','MAJOR','N\r'),(21,'My Company / Last Viewed',13,'MAN','Button - Display','Display the last  viewed popup form','TRUE','Notifications','MAJOR','N\r'),(22,'All Notifications',13,'MAN','Button - Display','Display the last  all notifications popup form. Displays total notifications (if there are any)','TRUE','New Employements','MAJOR','N\r'),(23,'New Employments',13,'MAN','Button - Display','Display the new employments popup form.','TRUE','Terminations','MAJOR','N\r'),(24,'Terminations',13,'MAN','Button - Display','Display the terminations popup form.','TRUE','User Management','MAJOR','N\r'),(25,'Quick Links',13,'MAN','Button - Display','Display the quick links popup form.','TRUE','Quick Links','MAJOR','N\r'),(26,'User Avatar',13,'MAN','Button - Display','Display the user config/action popup form. Displays the user image if setup.','TRUE','User','MAJOR','N\r'),(27,'Main Menu',7,'MAN','Module','Main navigation bar for the currently selected module in the app.','FALSE','NA','MAJOR','N\r'),(28,'Employee List',27,'MAN','Button - Display','Display the Employee List form.','FALSE','NA','MAJOR','N\r'),(29,'Documents',27,'MAN','Button - Display','Display the user to the Employee Document form.','FALSE','NA','MAJOR','N\r'),(30,'Employees',27,'MAN','Button - Display','Display the Employees sub menu.','FALSE','NA','MAJOR','N\r'),(31,'Employee Others',27,'MAN','Button - Display','Display the Employee Others sub menu.','FALSE','NA','MAJOR','N\r'),(32,'Payroll',27,'MAN','Button - Display','Display the Payroll sub menu.','FALSE','NA','MAJOR','N\r'),(33,'Employee Statistics',27,'MAN','Button - Display','Display the Employee Statistics sub menu.','FALSE','NA','MAJOR','N\r'),(34,'Payroll Statistics',27,'MAN','Button - Display','Display the Payroll Statistics sub menu.','FALSE','NA','MAJOR','N\r'),(35,'Absence Statistics',27,'MAN','Button - Display','Display the Absence Statistics sub menu.','FALSE','NA','MAJOR','N\r'),(36,'Reports',27,'MAN','Button - Display','Display the Reports sub menu.','FALSE','NA','MAJOR','N\r'),(37,'Monthly Reports',27,'MAN','Button - Display','Display the Monthly Payroll Reports form.','FALSE','NA','MAJOR','N\r'),(38,'Yearly Reports',27,'MAN','Button - Display','Display the Yearly Payroll Reports form.','FALSE','NA','MAJOR','N\r'),(39,'Bulk Updates',27,'MAN','Button - Display','Display the Bulk Updates sub menu.','FALSE','NA','MAJOR','N\r'),(40,'Settings',27,'MAN','Button - Display','Display the user to the Settings form.','FALSE','NA','MAJOR','N\r');
/*!40000 ALTER TABLE `data_entity_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_entity_insert_AFTER_INSERT` AFTER INSERT ON `data_entity_insert` FOR EACH ROW BEGIN
	CALL create_new_entity(
		NEW.entity_id, 
        NEW.entity_name, 
        NEW.entity_type_name, 
        NEW.entity_desc, 
        NEW.creation_type, 
        NEW.entity_parent, 
        NEW.should_have_tool_tip,
        NEW.tool_tip_text,
        NEW.new_version_category);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_entity_test_insert`
--

DROP TABLE IF EXISTS `data_entity_test_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_entity_test_insert` (
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_name` varchar(200) NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_version_num` varchar(11) DEFAULT NULL,
  `entity_version_id` int(10) unsigned NOT NULL,
  `created_by_employee_id` varchar(45) NOT NULL,
  `entity_test_parent` int(10) unsigned NOT NULL,
  `description` text,
  `initial_value` varchar(1000) DEFAULT NULL COMMENT 'Value at the start of the test',
  `expected_value` varchar(1000) DEFAULT NULL COMMENT 'Expected value at the end of the test',
  `received_value` varchar(1000) DEFAULT NULL COMMENT 'Value from another source',
  `insert_value` varchar(1000) DEFAULT NULL COMMENT 'Value at the start of the test',
  `failure_halts_test` tinyint(4) NOT NULL DEFAULT '0',
  `primary_test_cat` varchar(45) NOT NULL,
  `secondary_test_cat` varchar(45) DEFAULT NULL,
  `max_current_version_number` varchar(11) DEFAULT NULL,
  `new_version_category` enum('MAJOR','MINOR','BUILD') NOT NULL COMMENT '\n',
  `test_created` date NOT NULL,
  `endl` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`entity_test_id`,`entity_test_name`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`),
  UNIQUE KEY `entity_test_id_UNIQUE` (`entity_test_id`),
  KEY `fk_entity_test_employee1_idx` (`created_by_employee_id`),
  CONSTRAINT `fk_entity_test_employee10` FOREIGN KEY (`created_by_employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_test_insert`
--

LOCK TABLES `data_entity_test_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_test_insert` DISABLE KEYS */;
INSERT INTO `data_entity_test_insert` VALUES (1,'Root - Top Level Test Case',1,'1.0.0',1,'SB_1',0,'This is the top level test for Root. For this to pass all its children must pass.','','','','',0,'NA  ','NA','1.0.0','MAJOR','2021-05-03','N\r'),(2,'Dakar Web - Top Level Test Case',2,'1.0.0',2,'SB_1',1,'This is the top level test for Dakar Web. For this to pass all its children must pass.','','','','',0,'App','NA','1.0.0','MAJOR','2021-05-03','N\r'),(3,'Login Screen - Top Level Test Case',3,'1.0.0',3,'SB_1',2,'This is the top level test for Login Screen. For this to pass all its children must pass.','','','','',0,'Group Controls','Group Data','1.0.0','MAJOR','2021-05-03','N\r'),(4,'Login Screen - User Name - Text In',4,'1.0.0',4,'SB_1',3,'Enter the user name to login to the app.','','','','steve',0,'Data In','NA','1.0.0','MAJOR','2021-05-03','N\r'),(5,'Login Screen - User Password - Text In',5,'1.0.0',5,'SB_1',3,'Enter the user password to login to the app.','','','','1234',0,'Data In','NA','1.0.0','MAJOR','2021-05-03','N\r'),(6,'Login Screen - Login Button - Button - Redirect',6,'1.0.0',6,'SB_1',3,'Click the login button to login.','','','','',0,'Redirect','NA','1.0.0','MAJOR','2021-05-03','N\r'),(7,'Home Page - Top Level Test Case',7,'1.0.0',7,'SB_1',2,'This is the top level test for Home Page. For this to pass all its children must pass.','','','','',0,'Group Controls','Group Data','1.0.0','MAJOR','2021-05-03','N\r'),(8,'Home Page Info Bar - Top Level Test Case',8,'1.0.0',8,'SB_1',7,'This is the top level test for Home Page Info Bar. For this to pass all its children must pass.','','','','',0,'Data Out','Redirect','1.0.0','MAJOR','2021-05-03','N\r'),(9,'Home Page Info Bar - Current Module Indicator - Label',10,'1.0.0',10,'SB_1',8,'Display the name of the current module.','','Payroll','','',0,'Data Out','NA','1.0.0','MAJOR','2021-05-03','N\r'),(10,'Home Page Info Bar - Menu Toggle - Button - Function',11,'1.0.0',11,'SB_1',8,'Toggles between displaying and hiding the main menu.','','','','',0,'Perform Function','NA','1.0.0','MAJOR','2021-05-03','N\r'),(11,'Home Page Info Bar - Current Company - List',12,'1.0.0',12,'SB_1',8,'Displays a list of companies available to the user.','','Mars Incorporated Ltd  Mars Northern Products Ltd','','',0,'Data Out','Data In','1.0.0','MAJOR','2021-05-03','N\r'),(12,'Home Page Top Right Nav Bar - Top Level Test Case',13,'1.0.0',13,'SB_1',7,'This is the top level test for Home Page Top Right Nav Bar. For this to pass all its children must pass.','','','','',0,'Redirect','Data Out','1.0.0','MAJOR','2021-05-03','N\r'),(13,'Home Page Top Right Nav Bar - Authorisations - Button - Display',14,'1.0.0',14,'SB_1',13,'Redirect the user to the authorisations page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(14,'Home Page Top Right Nav Bar - Employee Creation Wizard - Button - Display',15,'1.0.0',15,'SB_1',13,'Redirect the user to the employee creation wizard form.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(15,'Home Page Top Right Nav Bar - Employee CV - Button - Display',16,'1.0.0',16,'SB_1',13,'Redirect the user to the employee cv page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(16,'Home Page Top Right Nav Bar - Employee Grid View - Button - Display',17,'1.0.0',17,'SB_1',13,'Redirect the user to the employee grid view page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(17,'Home Page Top Right Nav Bar - Visual Reports - Button - Display',18,'1.0.0',18,'SB_1',13,'Redirect the user to the visual reports page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(18,'Home Page Top Right Nav Bar - Dakar Intelligence - Button - Display',19,'1.0.0',19,'SB_1',13,'Redirect the user to the dakar intelligence page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(19,'Home Page Top Right Nav Bar - Organisation Chart - Button - Display',20,'1.0.0',20,'SB_1',13,'Redirect the user to the organisation chart page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(20,'Home Page Top Right Nav Bar - My Company / Last Viewed - Button - Display',21,'1.0.0',21,'SB_1',13,'Redirect the user to the my company / last viewed popup.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(21,'Home Page Top Right Nav Bar - All Notifications - Button - Display',22,'1.0.0',22,'SB_1',13,'Redirect the user to the all notifications popup.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(22,'Home Page Top Right Nav Bar - New Employments - Button - Display',23,'1.0.0',23,'SB_1',13,'Redirect the user to the new employements popup.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(23,'Home Page Top Right Nav Bar - Terminations - Button - Display',24,'1.0.0',24,'SB_1',13,'Redirect the user to the terminations popup.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(24,'Home Page Top Right Nav Bar - Quick Links - Button - Display',25,'1.0.0',25,'SB_1',13,'Redirect the user to the quick links popup','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(25,'Home Page Top Right Nav Bar - User Avatar - Button - Display',26,'1.0.0',26,'SB_1',13,'Redirect the user to the user propfile popup.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(26,'Main Menu - Top Level Test Case',27,'1.0.0',27,'SB_1',7,'This is the top level test for Main Menu. For this to pass all its children must pass.','','','','',0,'Group App Functions','NA','1.0.0','MAJOR','2021-05-03','N\r'),(27,'Main Menu - Employee List - Button - Display',28,'1.0.0',28,'SB_1',27,'Redirect the user to the employee list page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(28,'Main Menu - Documents - Button - Display',29,'1.0.0',29,'SB_1',27,'Redirect the user to the documents page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(29,'Main Menu - Employees - Button - Display',30,'1.0.0',30,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(30,'Main Menu - Employee Others - Button - Display',31,'1.0.0',31,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(31,'Main Menu - Payroll - Button - Display',32,'1.0.0',32,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(32,'Main Menu - Employee Statistics - Button - Display',33,'1.0.0',33,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(33,'Main Menu - Payroll Statistics - Button - Display',34,'1.0.0',34,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(34,'Main Menu - Absence Statistics - Button - Display',35,'1.0.0',35,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(35,'Main Menu - Reports - Button - Display',36,'1.0.0',36,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(36,'Main Menu - Monthly Reports - Button - Display',37,'1.0.0',37,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(37,'Main Menu - Yearly Reports - Button - Display',38,'1.0.0',38,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(38,'Main Menu - Bulk Updates - Button - Display',39,'1.0.0',39,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r'),(39,'Main Menu - Settings - Button - Display',40,'1.0.0',40,'SB_1',27,'Redirect the user to the page.','','','','',0,'Display Child','NA','1.0.0','MAJOR','2021-05-03','N\r');
/*!40000 ALTER TABLE `data_entity_test_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_entity_test_insert_AFTER_INSERT` AFTER INSERT ON `data_entity_test_insert` FOR EACH ROW BEGIN

	CALL `create_new_entity_test_case`(
		NEW.entity_test_id, 
        NEW.entity_id, 
        NEW.entity_version_id,
        NEW.entity_test_name,
		NEW.created_by_employee_id, 
        NEW.entity_test_parent, 
        NEW.`description`, 
        NEW.initial_value, 
        NEW.expected_value, 
        NEW.received_value, 
        NEW.insert_value, 
		NEW.failure_halts_test,          
        NEW.primary_test_cat, 
        NEW.secondary_test_cat,
        NEW.test_created, 
        NEW.new_version_category);        
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_test_suite_insert`
--

DROP TABLE IF EXISTS `data_test_suite_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_test_suite_insert` (
  `id` int(10) unsigned NOT NULL,
  `test_suite_name` varchar(45) NOT NULL,
  `test_suite_parent_id` int(10) unsigned NOT NULL,
  `new_version_category` enum('MAJOR','MINOR','BUILD') NOT NULL,
  `endl` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_test_suite_insert`
--

LOCK TABLES `data_test_suite_insert` WRITE;
/*!40000 ALTER TABLE `data_test_suite_insert` DISABLE KEYS */;
INSERT INTO `data_test_suite_insert` VALUES (1,'Root',0,'MAJOR','N\r'),(2,'Dakar Web',1,'MAJOR','N\r'),(3,'Login Screen',2,'MAJOR','N\r'),(7,'Home Page',2,'MAJOR','N\r'),(8,'Home Page Info Bar',7,'MAJOR','N\r'),(13,'Home Page Top Right Nav Bar',7,'MAJOR','N\r'),(27,'Main Menu',7,'MAJOR','N\r');
/*!40000 ALTER TABLE `data_test_suite_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_test_suite_insert_AFTER_INSERT` AFTER INSERT ON `data_test_suite_insert` FOR EACH ROW BEGIN
	CALL create_new_test_suite(NEW.id, NEW.test_suite_name, NEW.test_suite_parent_id, 'Add NOTES', NEW.new_version_category);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_version_to_do`
--

DROP TABLE IF EXISTS `data_version_to_do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_version_to_do` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `todo_desc` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_version_to_do`
--

LOCK TABLES `data_version_to_do` WRITE;
/*!40000 ALTER TABLE `data_version_to_do` DISABLE KEYS */;
INSERT INTO `data_version_to_do` VALUES (1,3,'Add active directory login.\r'),(2,3,'Add Google login.\r');
/*!40000 ALTER TABLE `data_version_to_do` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_version_to_do_AFTER_INSERT` AFTER INSERT ON `data_version_to_do` FOR EACH ROW BEGIN
	CALL create_entity_todo(NEW.entity_id, NEW.todo_desc);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `employee_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`employee_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_email_employee_idx` (`employee_id`),
  CONSTRAINT `fk_email_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'sbrown@dakarsoftware.com','','SB_1\r');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `employee_type_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_employee_employee_type1_idx` (`employee_type_id`),
  CONSTRAINT `fk_employee_employee_type1` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('SB_1','Steve','Brown','1\r');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_type`
--

DROP TABLE IF EXISTS `employee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_type` (
  `id` varchar(10) NOT NULL,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_type`
--

LOCK TABLES `employee_type` WRITE;
/*!40000 ALTER TABLE `employee_type` DISABLE KEYS */;
INSERT INTO `employee_type` VALUES ('1','QA\r'),('2','Developer\r');
/*!40000 ALTER TABLE `employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_version_id` int(10) unsigned NOT NULL,
  `entity_name` varchar(100) NOT NULL,
  `entity_type_details_id` int(10) unsigned NOT NULL,
  `entity_type_id` int(10) unsigned NOT NULL,
  `entity_type_entity_type_name` varchar(45) NOT NULL COMMENT 'The entiry''s parent.\nZero = no parent',
  `entity_help_id` int(10) unsigned NOT NULL,
  `entity_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `entity_parent_version_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_id`,`entity_version_id`,`entity_help_id`,`entity_parent`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_version_id_UNIQUE` (`entity_version_id`),
  KEY `fk_entity_entity_type_details1_idx` (`entity_type_details_id`),
  KEY `fk_entity_entity_type1_idx` (`entity_type_id`,`entity_type_entity_type_name`),
  KEY `fk_entity_entity1_idx` (`entity_parent`,`entity_parent_version_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_entity2_idx` (`entity_id`,`entity_version_id`),
  KEY `fk_entity_entity_help1_idx` (`entity_help_id`),
  KEY `fk_entity_entity3_idx` (`entity_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_entity4_idx` (`entity_version_id`,`entity_id`),
  CONSTRAINT `fk_entity_entity1` FOREIGN KEY (`entity_parent`, `entity_parent_version_id`) REFERENCES `entity` (`entity_id`, `entity_version_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_entity_help1` FOREIGN KEY (`entity_help_id`) REFERENCES `entity_help` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_entity_type1` FOREIGN KEY (`entity_type_id`, `entity_type_entity_type_name`) REFERENCES `entity_type` (`id`, `entity_type_name`),
  CONSTRAINT `fk_entity_entity_type_details1` FOREIGN KEY (`entity_type_details_id`) REFERENCES `entity_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` VALUES (1,1,1,'Root',1,1,'Root',1,0,NULL),(2,2,2,'Dakar Web',2,2,'Application',2,1,1),(3,3,3,'Login Screen',3,8,'Parent Form',3,2,2),(4,4,4,'User Name',4,18,'Text In',4,3,3),(5,5,5,'User Password',5,18,'Text In',5,3,3),(6,6,6,'Login Button',6,22,'Button - Redirect',6,3,3),(7,7,7,'Home Page',7,8,'Parent Form',7,2,2),(8,8,8,'Home Page Info Bar',8,11,'Info Bar',8,7,7),(9,9,9,'Dakar Logo',9,13,'Image',9,8,8),(10,10,10,'Current Module Indicator',10,20,'Label',10,8,8),(11,11,11,'Menu Toggle',11,24,'Button - Function',11,8,8),(12,12,12,'Current Company',12,15,'List',12,8,8),(13,13,13,'Home Page Top Right Nav Bar',13,10,'Nav Bar',13,7,7),(14,14,14,'Authorisations',14,23,'Button - Display',14,13,13),(15,15,15,'Employee Creation Wizard',15,23,'Button - Display',15,13,13),(16,16,16,'Employee CV',16,23,'Button - Display',16,13,13),(17,17,17,'Employee Grid View',17,23,'Button - Display',17,13,13),(18,18,18,'Visual Reports',18,23,'Button - Display',18,13,13),(19,19,19,'Dakar Intelligence',19,23,'Button - Display',19,13,13),(20,20,20,'Organisation Chart',20,23,'Button - Display',20,13,13),(21,21,21,'My Company / Last Viewed',21,23,'Button - Display',21,13,13),(22,22,22,'All Notifications',22,23,'Button - Display',22,13,13),(23,23,23,'New Employments',23,23,'Button - Display',23,13,13),(24,24,24,'Terminations',24,23,'Button - Display',24,13,13),(25,25,25,'Quick Links',25,23,'Button - Display',25,13,13),(26,26,26,'User Avatar',26,23,'Button - Display',26,13,13),(27,27,27,'Main Menu',27,3,'Module',27,7,7),(28,28,28,'Employee List',28,23,'Button - Display',28,27,27),(29,29,29,'Documents',29,23,'Button - Display',29,27,27),(30,30,30,'Employees',30,23,'Button - Display',30,27,27),(31,31,31,'Employee Others',31,23,'Button - Display',31,27,27),(32,32,32,'Payroll',32,23,'Button - Display',32,27,27),(33,33,33,'Employee Statistics',33,23,'Button - Display',33,27,27),(34,34,34,'Payroll Statistics',34,23,'Button - Display',34,27,27),(35,35,35,'Absence Statistics',35,23,'Button - Display',35,27,27),(36,36,36,'Reports',36,23,'Button - Display',36,27,27),(37,37,37,'Monthly Reports',37,23,'Button - Display',37,27,27),(38,38,38,'Yearly Reports',38,23,'Button - Display',38,27,27),(39,39,39,'Bulk Updates',39,23,'Button - Display',39,27,27),(40,40,40,'Settings',40,23,'Button - Display',40,27,27);
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_action`
--

DROP TABLE IF EXISTS `entity_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_action_desc` varchar(1000) NOT NULL,
  `entity_action_data` varchar(1000) DEFAULT NULL COMMENT 'Any data the entity might need, i.e. user name.',
  `entity_action_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_action_entity_action_type1_idx` (`entity_action_type_id`),
  CONSTRAINT `fk_entity_action_entity_action_type1` FOREIGN KEY (`entity_action_type_id`) REFERENCES `entity_action_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_action`
--

LOCK TABLES `entity_action` WRITE;
/*!40000 ALTER TABLE `entity_action` DISABLE KEYS */;
INSERT INTO `entity_action` VALUES (1,'Text Box Enter Data: User Name - User name entry box','steve\r',2),(2,'Text Box Enter Data: User Password - User password entry box','1234\r',2),(3,'Button - Redirect: Login Button - Click to login','NA\r',1),(4,'Image: Dakar Logo - Dakar logo','logo.png\r',3),(5,'Label: Current Module Indicator label text','Payroll~Personell~Absence~T&A\r',3),(6,'Button Function: Menu Toggle - Toggles the main menu view on/off','NA\r',1),(7,'List: Current Company - Displays current company and list of all available companies','Mars Northern Products Ltd~Mars Incorporated Ltd\r',4),(8,'Button Display: Employee Creation Wizard - Display the employee creation wizard form','NA\r',3),(9,'Button Display: Employee Grid View - Display the employee grid view form','NA\r',3),(10,'Button Display: Visual Reports - Display summary graphs form','NA\r',3),(11,'Button Display: Dakar Intelligence - Display the DI form','NA\r',3),(12,'Button Display: Organisation Chart - Display the organisation chart form','NA\r',3),(13,'Button Display: My Company / Last Viewed - Display the last  viewed popup form','NA\r',3),(14,'Button Display: All Notifications - Display the last  all notifications popup form. Displays total notifications (if there are any)','NA\r',3),(15,'Button Display: New Employments - Display the new employments popup form.','NA\r',3),(16,'Button Display: Terminations - Display the terminations popup form.','NA\r',3),(17,'Button Display: Quick Links - Display the quick links popup form.','NA\r',3),(18,'Button Display: User Avatar - Display the user config/action popup form. Displays the user image if setup.','NA\r',3),(19,'Button Display: Employee List - Display the Employee List form.','NA\r',3),(20,'Button Display: Documents - Display the user to the Employee Document form.','NA\r',3),(21,'Button Display: Employees - Display the Employees sub menu.','NA\r',3),(22,'Button Display: Payroll - Display the Payroll sub menu.','NA\r',3),(23,'Button Display: Employee Statistics - Display the Employee Statistics sub menu.','NA\r',3),(24,'Button Display: Payroll Statistics - Display the Payroll Statistics sub menu.','NA\r',3),(25,'Button Display: Absence Statistics - Display the Absence Statistics sub menu.','NA\r',3),(26,'Button Display: Reports - Display the Reports sub menu.','NA\r',3),(27,'Button Display: Yearly Reports - Display the Yearly Payroll Reports form.','NA\r',3),(28,'Button Display: Bulk Updates - Display the Bulk Updates sub menu.','NA\r',3),(29,'Button Display: Settings - Display the user to the Settings form.','NA\r',3),(30,'Button Display: Authorisations - Display the authorisations form','NA\r',3);
/*!40000 ALTER TABLE `entity_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_action_type`
--

DROP TABLE IF EXISTS `entity_action_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_action_type` (
  `id` int(10) unsigned NOT NULL,
  `entity_action_type_parent_id` int(10) unsigned NOT NULL,
  `entity_action_type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`entity_action_type_parent_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_action_type_entity_action_type1_idx` (`entity_action_type_parent_id`),
  CONSTRAINT `fk_entity_action_type_entity_action_type1` FOREIGN KEY (`entity_action_type_parent_id`) REFERENCES `entity_action_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_action_type`
--

LOCK TABLES `entity_action_type` WRITE;
/*!40000 ALTER TABLE `entity_action_type` DISABLE KEYS */;
INSERT INTO `entity_action_type` VALUES (1,1,'Click\r'),(2,2,'Data In\r'),(3,3,'Data Out\r'),(4,4,'Data InOut\r'),(5,5,'Function\r');
/*!40000 ALTER TABLE `entity_action_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_can_have_action`
--

DROP TABLE IF EXISTS `entity_can_have_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_can_have_action` (
  `entity_id` int(10) unsigned NOT NULL,
  `entity_version_id` int(10) unsigned NOT NULL,
  `entity_action_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`entity_version_id`,`entity_action_id`),
  UNIQUE KEY `entity_id_version_action_id` (`entity_id`,`entity_version_id`,`entity_action_id`),
  KEY `fk_entity_has_entity_action_entity_action1_idx` (`entity_action_id`),
  CONSTRAINT `fk_entity_has_entity_action_entity1` FOREIGN KEY (`entity_id`, `entity_version_id`) REFERENCES `entity` (`entity_id`, `entity_version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_has_entity_action_entity_action1` FOREIGN KEY (`entity_action_id`) REFERENCES `entity_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_can_have_action`
--

LOCK TABLES `entity_can_have_action` WRITE;
/*!40000 ALTER TABLE `entity_can_have_action` DISABLE KEYS */;
INSERT INTO `entity_can_have_action` VALUES (4,4,1),(5,5,2),(6,6,3),(9,9,4),(10,10,5),(11,11,6),(12,12,7),(15,15,8),(17,17,9),(18,18,10),(19,19,11),(20,20,12),(21,21,13),(22,22,14),(23,23,15),(24,24,16),(25,25,17),(26,26,18),(28,28,19),(29,29,20),(30,30,21),(32,32,22),(33,33,23),(34,34,24),(35,35,25),(36,36,26),(38,38,27),(39,39,28),(40,40,29),(14,14,30);
/*!40000 ALTER TABLE `entity_can_have_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_details`
--

DROP TABLE IF EXISTS `entity_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text,
  `date_added` date NOT NULL,
  `creation_type` enum('AUTO','MAN') NOT NULL DEFAULT 'MAN' COMMENT 'AUTO: The test was not in the DB when run from the TestBench (TB) so the TB added it to this DB.\nMAN: The test was added to this DB before it was run in the TB.\n\nNote: the name of the test case should match that in the TB or another TC will be added.',
  `last_tested_date` date DEFAULT NULL,
  `last_tested_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_details`
--

LOCK TABLES `entity_details` WRITE;
/*!40000 ALTER TABLE `entity_details` DISABLE KEYS */;
INSERT INTO `entity_details` VALUES (1,'FALSE','2021-05-04','MAN',NULL,NULL),(2,'The Dakar Web App','2021-05-04','MAN',NULL,NULL),(3,'The login screen that a user first encounters','2021-05-04','MAN',NULL,NULL),(4,'User name entry box','2021-05-04','MAN',NULL,NULL),(5,'User password entry box','2021-05-04','MAN',NULL,NULL),(6,'Click to login','2021-05-04','MAN',NULL,NULL),(7,'First page after login. Controls navigation of the app and provides some data to the user.','2021-05-04','MAN',NULL,NULL),(8,'Top left info bar. Displays - 1: Logo 2: Current module 3:Full Screen Icon 4: TCL Icon 5: Current Company','2021-05-04','MAN',NULL,NULL),(9,'Dakar logo','2021-05-04','MAN',NULL,NULL),(10,'Displays the currentlt selected module','2021-05-04','MAN',NULL,NULL),(11,'Toggles the main menu view on/off','2021-05-04','MAN',NULL,NULL),(12,'Displays current company and list of all available companies','2021-05-04','MAN',NULL,NULL),(13,'Provides shortcuts to app elements. Also is the only way to swap between modules.','2021-05-04','MAN',NULL,NULL),(14,'Display the authorisations form','2021-05-04','MAN',NULL,NULL),(15,'Display the employee creation wizard form','2021-05-04','MAN',NULL,NULL),(16,'Display the employee CV form','2021-05-04','MAN',NULL,NULL),(17,'Display the employee grid view form','2021-05-04','MAN',NULL,NULL),(18,'Display summary graphs form','2021-05-04','MAN',NULL,NULL),(19,'Display the DI form','2021-05-04','MAN',NULL,NULL),(20,'Display the organisation chart form','2021-05-04','MAN',NULL,NULL),(21,'Display the last  viewed popup form','2021-05-04','MAN',NULL,NULL),(22,'Display the last  all notifications popup form. Displays total notifications (if there are any)','2021-05-04','MAN',NULL,NULL),(23,'Display the new employments popup form.','2021-05-04','MAN',NULL,NULL),(24,'Display the terminations popup form.','2021-05-04','MAN',NULL,NULL),(25,'Display the quick links popup form.','2021-05-04','MAN',NULL,NULL),(26,'Display the user config/action popup form. Displays the user image if setup.','2021-05-04','MAN',NULL,NULL),(27,'Main navigation bar for the currently selected module in the app.','2021-05-04','MAN',NULL,NULL),(28,'Display the Employee List form.','2021-05-04','MAN',NULL,NULL),(29,'Display the user to the Employee Document form.','2021-05-04','MAN',NULL,NULL),(30,'Display the Employees sub menu.','2021-05-04','MAN',NULL,NULL),(31,'Display the Employee Others sub menu.','2021-05-04','MAN',NULL,NULL),(32,'Display the Payroll sub menu.','2021-05-04','MAN',NULL,NULL),(33,'Display the Employee Statistics sub menu.','2021-05-04','MAN',NULL,NULL),(34,'Display the Payroll Statistics sub menu.','2021-05-04','MAN',NULL,NULL),(35,'Display the Absence Statistics sub menu.','2021-05-04','MAN',NULL,NULL),(36,'Display the Reports sub menu.','2021-05-04','MAN',NULL,NULL),(37,'Display the Monthly Payroll Reports form.','2021-05-04','MAN',NULL,NULL),(38,'Display the Yearly Payroll Reports form.','2021-05-04','MAN',NULL,NULL),(39,'Display the Bulk Updates sub menu.','2021-05-04','MAN',NULL,NULL),(40,'Display the user to the Settings form.','2021-05-04','MAN',NULL,NULL);
/*!40000 ALTER TABLE `entity_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entity_details_BEFORE_INSERT` BEFORE INSERT ON `entity_details` FOR EACH ROW BEGIN
	SET NEW.date_added = now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entity_has_version`
--

DROP TABLE IF EXISTS `entity_has_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_has_version` (
  `version_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`entity_id`),
  KEY `fk_entity_has_version_version1_idx` (`version_id`),
  CONSTRAINT `fk_entity_has_version_entity1` FOREIGN KEY (`version_id`, `entity_id`) REFERENCES `entity` (`entity_version_id`, `entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_has_version`
--

LOCK TABLES `entity_has_version` WRITE;
/*!40000 ALTER TABLE `entity_has_version` DISABLE KEYS */;
INSERT INTO `entity_has_version` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40);
/*!40000 ALTER TABLE `entity_has_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_help`
--

DROP TABLE IF EXISTS `entity_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_help` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `has_tool_tip` varchar(5) NOT NULL DEFAULT 'FALSE',
  `tool_tip_text` varchar(500) DEFAULT NULL,
  `help_file_name` varchar(250) DEFAULT NULL,
  `help_text` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_help`
--

LOCK TABLES `entity_help` WRITE;
/*!40000 ALTER TABLE `entity_help` DISABLE KEYS */;
INSERT INTO `entity_help` VALUES (1,'FALSE','NA',NULL,NULL),(2,'FALSE','NA',NULL,NULL),(3,'FALSE','NA',NULL,NULL),(4,'FALSE','NA',NULL,NULL),(5,'FALSE','NA',NULL,NULL),(6,'FALSE','NA',NULL,NULL),(7,'FALSE','NA',NULL,NULL),(8,'FALSE','NA',NULL,NULL),(9,'FALSE','NA',NULL,NULL),(10,'FALSE','NA',NULL,NULL),(11,'TRUE','Show or hide main menu. ',NULL,NULL),(12,'FALSE','NA',NULL,NULL),(13,'FALSE','NA',NULL,NULL),(14,'TRUE','Authorisations',NULL,NULL),(15,'TRUE','Employee Creation',NULL,NULL),(16,'TRUE','Employee CV',NULL,NULL),(17,'TRUE','Employee Grid View',NULL,NULL),(18,'TRUE','Visual Reports',NULL,NULL),(19,'TRUE','Dakar Intelligence',NULL,NULL),(20,'TRUE','My Company / Last Viewed',NULL,NULL),(21,'TRUE','Notifications',NULL,NULL),(22,'TRUE','New Employements',NULL,NULL),(23,'TRUE','Terminations',NULL,NULL),(24,'TRUE','User Management',NULL,NULL),(25,'TRUE','Quick Links',NULL,NULL),(26,'TRUE','User',NULL,NULL),(27,'FALSE','NA',NULL,NULL),(28,'FALSE','NA',NULL,NULL),(29,'FALSE','NA',NULL,NULL),(30,'FALSE','NA',NULL,NULL),(31,'FALSE','NA',NULL,NULL),(32,'FALSE','NA',NULL,NULL),(33,'FALSE','NA',NULL,NULL),(34,'FALSE','NA',NULL,NULL),(35,'FALSE','NA',NULL,NULL),(36,'FALSE','NA',NULL,NULL),(37,'FALSE','NA',NULL,NULL),(38,'FALSE','NA',NULL,NULL),(39,'FALSE','NA',NULL,NULL),(40,'FALSE','NA',NULL,NULL);
/*!40000 ALTER TABLE `entity_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test`
--

DROP TABLE IF EXISTS `entity_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_version_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_version_id` int(10) unsigned NOT NULL,
  `entity_test_name` varchar(200) NOT NULL,
  `description` text,
  `created_on` date NOT NULL,
  `initial_value` varchar(1000) DEFAULT NULL COMMENT 'Value at the start of the test',
  `expected_value` varchar(1000) DEFAULT NULL COMMENT 'Expected value at the end of the test',
  `received_value` varchar(1000) DEFAULT NULL COMMENT 'Value from another source',
  `insert_value` varchar(1000) DEFAULT NULL,
  `failure_halts_test` tinyint(4) NOT NULL DEFAULT '0',
  `created_by_employee_id` varchar(45) NOT NULL,
  `last_run_date` date DEFAULT NULL,
  `last_run_time` time DEFAULT NULL,
  `entity_test_parent` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Point to a test''s parent.\nIf zero then there is no parent.',
  `entity_test_parent_version_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_test_id`,`entity_test_version_id`,`entity_id`,`entity_version_id`,`entity_test_parent`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_test_employee1_idx` (`created_by_employee_id`),
  KEY `fk_entity_test_entity_test1_idx` (`entity_test_parent`,`entity_test_parent_version_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_test_entity_test2_idx` (`entity_test_id`,`entity_test_version_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_test_result_entity_test1_idx` (`entity_id`,`entity_test_id`,`entity_test_version_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_test_has_one_or_more_categories1_idx` (`entity_test_id`,`entity_id`,`entity_test_version_id`),
  KEY `fk_test_suite_has_entity_test1_idx` (`entity_test_version_id`,`entity_test_id`),
  KEY `fk_entity_test_entity1_idx` (`entity_id`,`entity_version_id`),
  KEY `fk_entity_test_has_version_entity_test1_idx` (`entity_test_id`,`entity_test_version_id`),
  CONSTRAINT `fk_entity_test_employee1` FOREIGN KEY (`created_by_employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_entity_test_entity1` FOREIGN KEY (`entity_id`, `entity_version_id`) REFERENCES `entity` (`entity_id`, `entity_version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_test_entity_test1` FOREIGN KEY (`entity_test_parent`, `entity_test_parent_version_id`) REFERENCES `entity_test` (`entity_test_id`, `entity_test_version_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test`
--

LOCK TABLES `entity_test` WRITE;
/*!40000 ALTER TABLE `entity_test` DISABLE KEYS */;
INSERT INTO `entity_test` VALUES (1,1,48,1,1,'Root - Top Level Test Case','This is the top level test for Root. For this to pass all its children must pass.','2021-05-03','','','','',0,'SB_1',NULL,NULL,0,NULL),(2,2,49,2,2,'Dakar Web - Top Level Test Case','This is the top level test for Dakar Web. For this to pass all its children must pass.','2021-05-03','','','','',0,'SB_1',NULL,NULL,1,48),(3,3,50,3,3,'Login Screen - Top Level Test Case','This is the top level test for Login Screen. For this to pass all its children must pass.','2021-05-03','','','','',0,'SB_1',NULL,NULL,2,49),(4,4,51,4,4,'Login Screen - User Name - Text In','Enter the user name to login to the app.','2021-05-03','','','','steve',0,'SB_1','2021-05-04','15:24:57',3,50),(5,5,52,5,5,'Login Screen - User Password - Text In','Enter the user password to login to the app.','2021-05-03','','','','1234',0,'SB_1','2021-05-04','15:25:00',3,50),(6,6,53,6,6,'Login Screen - Login Button - Button - Redirect','Click the login button to login.','2021-05-03','','','','',0,'SB_1','2021-05-04','15:25:04',3,50),(7,7,54,7,7,'Home Page - Top Level Test Case','This is the top level test for Home Page. For this to pass all its children must pass.','2021-05-03','','','','',0,'SB_1',NULL,NULL,2,49),(8,8,55,8,8,'Home Page Info Bar - Top Level Test Case','This is the top level test for Home Page Info Bar. For this to pass all its children must pass.','2021-05-03','','','','',0,'SB_1','2021-05-04','15:58:37',7,54),(9,9,56,10,10,'Home Page Info Bar - Current Module Indicator - Label','Display the name of the current module.','2021-05-03','','Payroll','','',0,'SB_1','2021-05-04','16:00:48',8,55),(10,10,57,11,11,'Home Page Info Bar - Menu Toggle - Button - Function','Toggles between displaying and hiding the main menu.','2021-05-03','','','','',0,'SB_1','2021-05-04','15:58:26',8,55),(11,11,58,12,12,'Home Page Info Bar - Current Company - List','Displays a list of companies available to the user.','2021-05-03','','Mars Incorporated Ltd  Mars Northern Products Ltd','','',0,'SB_1','2021-05-04','16:01:09',8,55),(12,12,59,13,13,'Home Page Top Right Nav Bar - Top Level Test Case','This is the top level test for Home Page Top Right Nav Bar. For this to pass all its children must pass.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:06:57',7,54),(13,13,60,14,14,'Home Page Top Right Nav Bar - Authorisations - Button - Display','Display the authorisations page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:03:19',13,NULL),(14,14,61,15,15,'Home Page Top Right Nav Bar - Employee Creation Wizard - Button - Display','Display the employee creation wizard form.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:01:47',13,60),(15,15,62,16,16,'Home Page Top Right Nav Bar - Employee CV - Button - Display','Display the employee cv page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:01:50',13,60),(16,16,63,17,17,'Home Page Top Right Nav Bar - Employee Grid View - Button - Display','Display the employee grid view page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:03:12',13,60),(17,17,64,18,18,'Home Page Top Right Nav Bar - Visual Reports - Button - Display','Display the visual reports page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:02:39',13,60),(18,18,65,19,19,'Home Page Top Right Nav Bar - Dakar Intelligence - Button - Display','Display the dakar intelligence page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:03:23',13,60),(19,19,66,20,20,'Home Page Top Right Nav Bar - Organisation Chart - Button - Display','Display the organisation chart page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:03:44',13,60),(20,20,67,21,21,'Home Page Top Right Nav Bar - My Company / Last Viewed - Button - Display','Display the my company / last viewed popup.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:03:58',13,60),(21,21,68,22,22,'Home Page Top Right Nav Bar - All Notifications - Button - Display','Display the all notifications popup.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:04:37',13,60),(22,22,69,23,23,'Home Page Top Right Nav Bar - New Employments - Button - Display','Display the new employements popup.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:04:50',13,60),(23,23,70,24,24,'Home Page Top Right Nav Bar - Terminations - Button - Display','Display the terminations popup.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:05:00',13,60),(24,24,71,25,25,'Home Page Top Right Nav Bar - Quick Links - Button - Display','Display the quick links popup','2021-05-03','','','','',0,'SB_1','2021-05-04','16:05:26',13,60),(25,25,72,26,26,'Home Page Top Right Nav Bar - User Avatar - Button - Display','Display the user propfile popup.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:06:24',13,60),(26,26,73,27,27,'Main Menu - Top Level Test Case','This is the top level test for Main Menu. For this to pass all its children must pass.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:10:25',7,54),(27,27,74,28,28,'Main Menu - Employee List - Button - Display','Display the user to the employee list page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:08:00',27,NULL),(28,28,75,29,29,'Main Menu - Documents - Button - Display','Display the user to the documents page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:08:07',27,74),(29,29,76,30,30,'Main Menu - Employees - Button - Display','Display the employees sub menu.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:08:31',27,74),(30,30,77,31,31,'Main Menu - Employee Others - Button - Display','Display the employee others sub menu.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:09:11',27,74),(31,31,78,32,32,'Main Menu - Payroll - Button - Display','Display the payroll sub menu.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:09:14',27,74),(32,32,79,33,33,'Main Menu - Employee Statistics - Button - Display','Display the employee statistics sub menu.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:09:22',27,74),(33,33,80,34,34,'Main Menu - Payroll Statistics - Button - Display','Display the payroll statistics sub menu.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:09:26',27,74),(34,34,81,35,35,'Main Menu - Absence Statistics - Button - Display','Display the absence statistics sub menu.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:09:40',27,74),(35,35,82,36,36,'Main Menu - Reports - Button - Display','Display the reports sub menu.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:09:58',27,74),(36,36,83,37,37,'Main Menu - Monthly Reports - Button - Display','Display the monthly reports page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:10:02',27,74),(37,37,84,38,38,'Main Menu - Yearly Reports - Button - Display','Display the yearly reports page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:10:08',27,74),(38,38,85,39,39,'Main Menu - Bulk Updates - Button - Display','Display the bulk updates sub menu.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:10:14',27,74),(39,39,86,40,40,'Main Menu - Settings - Button - Display','Display the settings page.','2021-05-03','','','','',0,'SB_1','2021-05-04','16:10:20',27,74);
/*!40000 ALTER TABLE `entity_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_category`
--

DROP TABLE IF EXISTS `entity_test_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_test_category_name` varchar(45) NOT NULL,
  `entity_test_category_description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_category`
--

LOCK TABLES `entity_test_category` WRITE;
/*!40000 ALTER TABLE `entity_test_category` DISABLE KEYS */;
INSERT INTO `entity_test_category` VALUES (1,'None','No test category\r'),(2,'App','Overall test for the app\r'),(3,'Group App Functions','A group of app functions eg a module\r'),(4,'Group Module Functions','A group of functions for a module\r'),(5,'Group Data','An entity that groups related data\r'),(6,'Group Controls','An entity that groups controls\r'),(7,'Redirect','An entity that redirects the user eg button\r'),(8,'Info','An entity that supplies information eg info bar\r'),(9,'Display Image','Displays an image\r'),(10,'Data In/Out','Has data in and out eg text box\r'),(11,'Data In','Has data in eg text box\r'),(12,'Data Out','Has data out eg label\r'),(13,'Display Child','Displays a child form/pop up form etc\r');
/*!40000 ALTER TABLE `entity_test_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_has_one_or_more_test_categories`
--

DROP TABLE IF EXISTS `entity_test_has_one_or_more_test_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_has_one_or_more_test_categories` (
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_version_id` int(10) unsigned NOT NULL,
  `entity_test_category_id` int(10) unsigned NOT NULL,
  `category_level` tinyint(4) NOT NULL,
  PRIMARY KEY (`entity_test_id`,`entity_test_entity_id`,`entity_test_entity_test_version_id`,`entity_test_category_id`),
  KEY `fk_entity_test_has_entity_test_category_entity_test_categor_idx` (`entity_test_category_id`),
  CONSTRAINT `fk_entity_test_has_entity_test_category_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_entity_id`, `entity_test_entity_test_version_id`) REFERENCES `entity_test` (`entity_test_id`, `entity_id`, `entity_test_version_id`),
  CONSTRAINT `fk_entity_test_has_entity_test_category_entity_test_category1` FOREIGN KEY (`entity_test_category_id`) REFERENCES `entity_test_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_has_one_or_more_test_categories`
--

LOCK TABLES `entity_test_has_one_or_more_test_categories` WRITE;
/*!40000 ALTER TABLE `entity_test_has_one_or_more_test_categories` DISABLE KEYS */;
INSERT INTO `entity_test_has_one_or_more_test_categories` VALUES (2,2,49,2,1),(3,3,50,5,2),(3,3,50,6,1),(4,4,51,11,1),(5,5,52,11,1),(6,6,53,7,1),(7,7,54,5,2),(7,7,54,6,1),(8,8,55,7,2),(8,8,55,12,1),(9,10,56,12,1),(11,12,58,11,2),(11,12,58,12,1),(12,13,59,7,1),(12,13,59,12,2),(13,14,60,13,1),(14,15,61,13,1),(15,16,62,13,1),(16,17,63,13,1),(17,18,64,13,1),(18,19,65,13,1),(19,20,66,13,1),(20,21,67,13,1),(21,22,68,13,1),(22,23,69,13,1),(23,24,70,13,1),(24,25,71,13,1),(25,26,72,13,1),(26,27,73,3,1),(27,28,74,13,1),(28,29,75,13,1),(29,30,76,13,1),(30,31,77,13,1),(31,32,78,13,1),(32,33,79,13,1),(33,34,80,13,1),(34,35,81,13,1),(35,36,82,13,1),(36,37,83,13,1),(37,38,84,13,1),(38,39,85,13,1),(39,40,86,13,1);
/*!40000 ALTER TABLE `entity_test_has_one_or_more_test_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_has_version`
--

DROP TABLE IF EXISTS `entity_test_has_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_has_version` (
  `version_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`entity_test_id`),
  KEY `fk_entity_test_has_version_version1_idx` (`version_id`),
  CONSTRAINT `fk_entity_test_has_version_entity_test1` FOREIGN KEY (`version_id`, `entity_test_id`) REFERENCES `entity_test` (`entity_test_version_id`, `entity_test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_test_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_has_version`
--

LOCK TABLES `entity_test_has_version` WRITE;
/*!40000 ALTER TABLE `entity_test_has_version` DISABLE KEYS */;
INSERT INTO `entity_test_has_version` VALUES (48,1),(49,2),(50,3),(51,4),(52,5),(53,6),(54,7),(55,8),(56,9),(57,10),(58,11),(59,12),(60,13),(61,14),(62,15),(63,16),(64,17),(65,18),(66,19),(67,20),(68,21),(69,22),(70,23),(71,24),(72,25),(73,26),(74,27),(75,28),(76,29),(77,30),(78,31),(79,32),(80,33),(81,34),(82,35),(83,36),(84,37),(85,38),(86,39);
/*!40000 ALTER TABLE `entity_test_has_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_result`
--

DROP TABLE IF EXISTS `entity_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `result_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_passed` enum('Pass','Fail','NR') DEFAULT NULL,
  `test_ignored` enum('TRUE','FALSE') NOT NULL,
  `comments` text,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_version_id` int(10) unsigned NOT NULL,
  `entity_test_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`entity_test_id`,`entity_test_version_id`,`entity_test_entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_test_result_entity_test1_idx` (`entity_test_entity_id`,`entity_test_id`,`entity_test_version_id`),
  CONSTRAINT `fk_entity_test_result_entity_test1` FOREIGN KEY (`entity_test_entity_id`, `entity_test_id`, `entity_test_version_id`) REFERENCES `entity_test` (`entity_id`, `entity_test_id`, `entity_test_version_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_result`
--

LOCK TABLES `entity_test_result` WRITE;
/*!40000 ALTER TABLE `entity_test_result` DISABLE KEYS */;
INSERT INTO `entity_test_result` VALUES (1,'2021-05-04 13:26:34','Pass','FALSE','Test completed notes.',4,51,4),(2,'2021-05-04 13:26:34','Pass','FALSE','Test completed notes.',5,52,5),(3,'2021-05-04 13:26:34','Pass','FALSE','Test completed notes.',6,53,6),(4,'2021-05-04 14:28:10','Fail','FALSE','Test completed notes.',8,55,8),(5,'2021-05-04 14:28:10','Pass','FALSE','Test completed notes.',9,56,10),(6,'2021-05-04 14:28:10','Fail','FALSE','Test completed notes.',10,57,11),(7,'2021-05-04 14:28:10','Pass','FALSE','Test completed notes.',11,58,12),(8,'2021-05-04 14:28:10','Fail','FALSE','Test completed notes.',12,59,13),(9,'2021-05-04 14:28:10','Pass','FALSE','Test completed notes.',13,60,14),(10,'2021-05-04 14:28:10','Pass','FALSE','Test completed notes.',14,61,15),(11,'2021-05-04 14:28:10','Pass','FALSE','Test completed notes.',15,62,16),(12,'2021-05-04 14:28:10','Pass','FALSE','Test completed notes.',16,63,17),(13,'2021-05-04 14:28:10','Pass','FALSE','Test completed notes.',17,64,18),(14,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',18,65,19),(15,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',19,66,20),(16,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',20,67,21),(17,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',21,68,22),(18,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',22,69,23),(19,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',23,70,24),(20,'2021-05-04 14:28:11','Fail','FALSE','Test completed notes.',24,71,25),(21,'2021-05-04 14:28:11','Fail','FALSE','Test completed notes.',25,72,26),(22,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',26,73,27),(23,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',27,74,28),(24,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',28,75,29),(25,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',29,76,30),(26,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',30,77,31),(27,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',31,78,32),(28,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',32,79,33),(29,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',33,80,34),(30,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',34,81,35),(31,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',35,82,36),(32,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',36,83,37),(33,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',37,84,38),(34,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',38,85,39),(35,'2021-05-04 14:28:11','Pass','FALSE','Test completed notes.',39,86,40);
/*!40000 ALTER TABLE `entity_test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_type`
--

DROP TABLE IF EXISTS `entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_type` (
  `id` int(10) unsigned NOT NULL,
  `entity_type_name` varchar(45) NOT NULL,
  `entity_type_parent_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`entity_type_name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_name_UNIQUE` (`entity_type_name`),
  KEY `fk_entity_type_entity_type1_idx` (`entity_type_parent_id`),
  CONSTRAINT `fk_entity_type_entity_type1` FOREIGN KEY (`entity_type_parent_id`) REFERENCES `entity_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_type`
--

LOCK TABLES `entity_type` WRITE;
/*!40000 ALTER TABLE `entity_type` DISABLE KEYS */;
INSERT INTO `entity_type` VALUES (1,'Root',1),(2,'Application',1),(25,'Function',1),(3,'Module',2),(6,'Form',2),(4,'Module Category',3),(5,'Module Sub-Category',4),(7,'Popup Form',6),(8,'Parent Form',6),(9,'Child Form',6),(10,'Nav Bar',6),(11,'Info Bar',6),(12,'Grid',6),(13,'Image',6),(14,'Control',6),(15,'List',14),(16,'Tab',14),(17,'Text Out',14),(18,'Text In',14),(19,'Text In/Out',14),(20,'Label',14),(21,'Button',14),(22,'Button - Redirect',21),(23,'Button - Display',21),(24,'Button - Function',21);
/*!40000 ALTER TABLE `entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_test_result`
--

DROP TABLE IF EXISTS `import_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `import_test_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '	has_tool_tip	tool_tip_text	initial_value	expected_value	received_value	insert_value	failure_halts_test	run_by	pass_fail_or_not_run	fail_severity	fail_reason	test_complete_notes\n',
  `test_run_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_parent` int(10) unsigned NOT NULL,
  `entity_test_version_id` int(10) unsigned NOT NULL,
  `entity_test_version_num` varchar(11) DEFAULT NULL,
  `entity_test_name` varchar(100) NOT NULL,
  `entity_test_description` text,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_name` varchar(100) NOT NULL,
  `entity_type_name` varchar(45) NOT NULL,
  `entity_description` text,
  `entity_last_tested_date` date DEFAULT NULL,
  `entity_last_tested_time` time DEFAULT NULL,
  `has_tool_tip` enum('TRUE','FALSE') NOT NULL,
  `tool_tip_text` varchar(500) DEFAULT NULL,
  `initial_value` varchar(1000) DEFAULT NULL,
  `expected_value` varchar(1000) DEFAULT NULL,
  `received_value` varchar(1000) DEFAULT NULL,
  `insert_value` varchar(1000) DEFAULT NULL,
  `failure_halts_test` tinyint(4) DEFAULT NULL,
  `run_by` varchar(45) NOT NULL,
  `pass_fail_or_not_run` enum('Pass','Fail','NR') NOT NULL DEFAULT 'NR',
  `fail_severity` enum('1','2','3','4','5') DEFAULT NULL,
  `fail_reason` varchar(45) DEFAULT NULL,
  `test_complete_notes` text,
  `endl` varchar(4) NOT NULL,
  PRIMARY KEY (`id`,`test_run_id`,`test_suite_id`,`entity_test_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_test_result`
--

LOCK TABLES `import_test_result` WRITE;
/*!40000 ALTER TABLE `import_test_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_test_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `import_test_result_AFTER_INSERT` AFTER INSERT ON `import_test_result` FOR EACH ROW BEGIN
	/*SET @IMPORT_TEST_RUN_ID_RESULT = NEW.test_run_id;
    SET @IMPORT_TEST_RUN_BY_EMP_ID = NEW.run_by;
	CALL add_test_case_result(
		NEW.pass_fail_or_not_run,
		NEW.test_complete_notes,
		NEW.entity_test_version_id,
		NEW.entity_test_id,
		NEW.entity_id);*/
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `test_run`
--

DROP TABLE IF EXISTS `test_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_run` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_run_name` varchar(100) NOT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run`
--

LOCK TABLES `test_run` WRITE;
/*!40000 ALTER TABLE `test_run` DISABLE KEYS */;
INSERT INTO `test_run` VALUES (1,'Login Form','Test the user login form with user name and password. Should redirect the user to the home page with successful login.'),(2,'Home Page','Test the home page and all entities on it. ');
/*!40000 ALTER TABLE `test_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run_has_test_suite`
--

DROP TABLE IF EXISTS `test_run_has_test_suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_run_has_test_suite` (
  `test_run_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `test_suite_version_id` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `test_run_id_suite_id_ver_num_UNIQUE` (`test_run_id`,`test_suite_id`,`test_suite_version_id`),
  KEY `fk_test_run_has_test_suite_test_run1_idx` (`test_run_id`),
  KEY `fk_test_run_has_test_suite_test_suite1_idx` (`test_suite_id`,`test_suite_version_id`),
  CONSTRAINT `fk_test_run_has_test_suite_test_run1` FOREIGN KEY (`test_run_id`) REFERENCES `test_run` (`id`),
  CONSTRAINT `fk_test_run_has_test_suite_test_suite1` FOREIGN KEY (`test_suite_id`, `test_suite_version_id`) REFERENCES `test_suite` (`test_suite_id`, `test_suite_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run_has_test_suite`
--

LOCK TABLES `test_run_has_test_suite` WRITE;
/*!40000 ALTER TABLE `test_run_has_test_suite` DISABLE KEYS */;
INSERT INTO `test_run_has_test_suite` VALUES (1,3,43),(2,7,44);
/*!40000 ALTER TABLE `test_run_has_test_suite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run_result`
--

DROP TABLE IF EXISTS `test_run_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_run_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_run_id` int(10) unsigned NOT NULL,
  `test_run_run_by_employee_id` varchar(45) NOT NULL,
  `result_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `number_test_cases_run` mediumint(9) NOT NULL,
  `number_failures` mediumint(9) NOT NULL,
  `number_passed` mediumint(9) NOT NULL,
  `number_ignored` mediumint(9) NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`,`test_run_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_run_result_test_run1_idx` (`test_run_id`),
  KEY `fk_test_run_result_employee1_idx` (`test_run_run_by_employee_id`),
  CONSTRAINT `fk_test_run_result_employee1` FOREIGN KEY (`test_run_run_by_employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_test_run_result_test_run1` FOREIGN KEY (`test_run_id`) REFERENCES `test_run` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run_result`
--

LOCK TABLES `test_run_result` WRITE;
/*!40000 ALTER TABLE `test_run_result` DISABLE KEYS */;
INSERT INTO `test_run_result` VALUES (1,1,'SB_1','2021-05-04 13:26:34',3,0,3,0,'Test completed notes.'),(2,2,'SB_1','2021-05-04 14:28:11',32,5,27,0,'Test completed notes.');
/*!40000 ALTER TABLE `test_run_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite`
--

DROP TABLE IF EXISTS `test_suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_suite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_suite_id` int(10) unsigned NOT NULL,
  `test_suite_version_id` int(10) unsigned NOT NULL,
  `test_suite_name` varchar(100) DEFAULT NULL,
  `test_suite_notes` text,
  `test_suite_parent_id` int(10) unsigned NOT NULL,
  `test_suite_parent_version_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`test_suite_id`,`test_suite_version_id`,`test_suite_parent_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_suite_test_suite1_idx` (`test_suite_parent_id`,`test_suite_parent_version_id`) /*!80000 INVISIBLE */,
  KEY `fk_test_suite_test_suite2_idx` (`test_suite_id`,`test_suite_version_id`) /*!80000 INVISIBLE */,
  KEY `fk_test_suite_test_suite3_idx` (`test_suite_version_id`,`test_suite_id`),
  CONSTRAINT `fk_test_suite_test_suite1` FOREIGN KEY (`test_suite_parent_id`, `test_suite_parent_version_id`) REFERENCES `test_suite` (`test_suite_id`, `test_suite_version_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite`
--

LOCK TABLES `test_suite` WRITE;
/*!40000 ALTER TABLE `test_suite` DISABLE KEYS */;
INSERT INTO `test_suite` VALUES (1,1,41,'Root','Is the root of all test suites. Has no further function.',0,NULL),(2,2,42,'Dakar Web','Top level of Dakar Web. All other Dakar Web test suites are children of this.',1,41),(3,3,43,'Login Screen','Login Form',2,42),(4,7,44,'Home Page','Home page and its children',2,42),(5,8,45,'Home Page Info Bar','The top-left info bar on the home page',7,44),(6,13,46,'Home Page Top Right Nav Bar','The top-right nav bar on the home page',7,44),(7,27,47,'Main Menu','The main menu on the home page',7,44);
/*!40000 ALTER TABLE `test_suite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite_has_entity_test`
--

DROP TABLE IF EXISTS `test_suite_has_entity_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_suite_has_entity_test` (
  `test_suite_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_version_id` int(10) unsigned NOT NULL,
  KEY `fk_test_suite_has_entity_test_test_suite1_idx` (`test_suite_id`),
  KEY `fk_test_suite_has_entity_test_entity_test1_idx` (`entity_test_id`,`entity_test_version_id`),
  CONSTRAINT `fk_test_suite_has_entity_test_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_version_id`) REFERENCES `entity_test` (`entity_test_id`, `entity_test_version_id`),
  CONSTRAINT `fk_test_suite_has_entity_test_test_suite1` FOREIGN KEY (`test_suite_id`) REFERENCES `test_suite` (`test_suite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite_has_entity_test`
--

LOCK TABLES `test_suite_has_entity_test` WRITE;
/*!40000 ALTER TABLE `test_suite_has_entity_test` DISABLE KEYS */;
INSERT INTO `test_suite_has_entity_test` VALUES (0,1,48),(1,2,49),(2,3,50),(3,4,51),(3,5,52),(3,6,53),(2,7,54),(7,8,55),(8,9,56),(8,10,57),(8,11,58),(7,12,59),(13,13,60),(13,14,61),(13,15,62),(13,16,63),(13,17,64),(13,18,65),(13,19,66),(13,20,67),(13,21,68),(13,22,69),(13,23,70),(13,24,71),(13,25,72),(7,26,73),(27,27,74),(27,28,75),(27,29,76),(27,30,77),(27,31,78),(27,32,79),(27,33,80),(27,34,81),(27,35,82),(27,36,83),(27,37,84),(27,38,85),(27,39,86);
/*!40000 ALTER TABLE `test_suite_has_entity_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite_has_version`
--

DROP TABLE IF EXISTS `test_suite_has_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_suite_has_version` (
  `version_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`test_suite_id`),
  KEY `fk_test_suite_has_version_version1_idx` (`version_id`),
  CONSTRAINT `fk_test_suite_has_version_test_suite1` FOREIGN KEY (`version_id`, `test_suite_id`) REFERENCES `test_suite` (`test_suite_version_id`, `test_suite_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_test_suite_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite_has_version`
--

LOCK TABLES `test_suite_has_version` WRITE;
/*!40000 ALTER TABLE `test_suite_has_version` DISABLE KEYS */;
INSERT INTO `test_suite_has_version` VALUES (41,1),(42,2),(43,3),(44,7),(45,8),(46,13),(47,27);
/*!40000 ALTER TABLE `test_suite_has_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(200) NOT NULL COMMENT 'Either the test name of the entity name',
  `version_note` text NOT NULL,
  `version_type` enum('ENTITY','TEST','TEST_SUITE') NOT NULL,
  `major` smallint(6) NOT NULL DEFAULT '1',
  `minor` smallint(6) NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '1',
  `version_to_do_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'Root','No existing version. New major version of Root','ENTITY',1,0,0,NULL),(2,'Dakar Web','No existing version. New major version of Dakar Web','ENTITY',1,0,0,NULL),(3,'Login Screen','No existing version. New major version of Login Screen','ENTITY',1,0,0,NULL),(4,'User Name','No existing version. New major version of User Name','ENTITY',1,0,0,NULL),(5,'User Password','No existing version. New major version of User Password','ENTITY',1,0,0,NULL),(6,'Login Button','No existing version. New major version of Login Button','ENTITY',1,0,0,NULL),(7,'Home Page','No existing version. New major version of Home Page','ENTITY',1,0,0,NULL),(8,'Home Page Info Bar','No existing version. New major version of Home Page Info Bar','ENTITY',1,0,0,NULL),(9,'Dakar Logo','No existing version. New major version of Dakar Logo','ENTITY',1,0,0,NULL),(10,'Current Module Indicator','No existing version. New major version of Current Module Indicator','ENTITY',1,0,0,NULL),(11,'Menu Toggle','No existing version. New major version of Menu Toggle','ENTITY',1,0,0,NULL),(12,'Current Company','No existing version. New major version of Current Company','ENTITY',1,0,0,NULL),(13,'Home Page Top Right Nav Bar','No existing version. New major version of Home Page Top Right Nav Bar','ENTITY',1,0,0,NULL),(14,'Authorisations','No existing version. New major version of Authorisations','ENTITY',1,0,0,NULL),(15,'Employee Creation Wizard','No existing version. New major version of Employee Creation Wizard','ENTITY',1,0,0,NULL),(16,'Employee CV','No existing version. New major version of Employee CV','ENTITY',1,0,0,NULL),(17,'Employee Grid View','No existing version. New major version of Employee Grid View','ENTITY',1,0,0,NULL),(18,'Visual Reports','No existing version. New major version of Visual Reports','ENTITY',1,0,0,NULL),(19,'Dakar Intelligence','No existing version. New major version of Dakar Intelligence','ENTITY',1,0,0,NULL),(20,'Organisation Chart','No existing version. New major version of Organisation Chart','ENTITY',1,0,0,NULL),(21,'My Company / Last Viewed','No existing version. New major version of My Company / Last Viewed','ENTITY',1,0,0,NULL),(22,'All Notifications','No existing version. New major version of All Notifications','ENTITY',1,0,0,NULL),(23,'New Employments','No existing version. New major version of New Employments','ENTITY',1,0,0,NULL),(24,'Terminations','No existing version. New major version of Terminations','ENTITY',1,0,0,NULL),(25,'Quick Links','No existing version. New major version of Quick Links','ENTITY',1,0,0,NULL),(26,'User Avatar','No existing version. New major version of User Avatar','ENTITY',1,0,0,NULL),(27,'Main Menu','No existing version. New major version of Main Menu','ENTITY',1,0,0,NULL),(28,'Employee List','No existing version. New major version of Employee List','ENTITY',1,0,0,NULL),(29,'Documents','No existing version. New major version of Documents','ENTITY',1,0,0,NULL),(30,'Employees','No existing version. New major version of Employees','ENTITY',1,0,0,NULL),(31,'Employee Others','No existing version. New major version of Employee Others','ENTITY',1,0,0,NULL),(32,'Payroll','No existing version. New major version of Payroll','ENTITY',1,0,0,NULL),(33,'Employee Statistics','No existing version. New major version of Employee Statistics','ENTITY',1,0,0,NULL),(34,'Payroll Statistics','No existing version. New major version of Payroll Statistics','ENTITY',1,0,0,NULL),(35,'Absence Statistics','No existing version. New major version of Absence Statistics','ENTITY',1,0,0,NULL),(36,'Reports','No existing version. New major version of Reports','ENTITY',1,0,0,NULL),(37,'Monthly Reports','No existing version. New major version of Monthly Reports','ENTITY',1,0,0,NULL),(38,'Yearly Reports','No existing version. New major version of Yearly Reports','ENTITY',1,0,0,NULL),(39,'Bulk Updates','No existing version. New major version of Bulk Updates','ENTITY',1,0,0,NULL),(40,'Settings','No existing version. New major version of Settings','ENTITY',1,0,0,NULL),(41,'Root','No existing version. New major version of Root','TEST_SUITE',1,0,0,NULL),(42,'Dakar Web','No existing version. New major version of Dakar Web','TEST_SUITE',1,0,0,NULL),(43,'Login Screen','No existing version. New major version of Login Screen','TEST_SUITE',1,0,0,NULL),(44,'Home Page','No existing version. New major version of Home Page','TEST_SUITE',1,0,0,NULL),(45,'Home Page Info Bar','No existing version. New major version of Home Page Info Bar','TEST_SUITE',1,0,0,NULL),(46,'Home Page Top Right Nav Bar','No existing version. New major version of Home Page Top Right Nav Bar','TEST_SUITE',1,0,0,NULL),(47,'Main Menu','No existing version. New major version of Main Menu','TEST_SUITE',1,0,0,NULL),(48,'Root - Top Level Test Case','No existing version. New major version of Root - Top Level Test Case','TEST',1,0,0,NULL),(49,'Dakar Web - Top Level Test Case','No existing version. New major version of Dakar Web - Top Level Test Case','TEST',1,0,0,NULL),(50,'Login Screen - Top Level Test Case','No existing version. New major version of Login Screen - Top Level Test Case','TEST',1,0,0,NULL),(51,'Login Screen - User Name - Text In','No existing version. New major version of Login Screen - User Name - Text In','TEST',1,0,0,NULL),(52,'Login Screen - User Password - Text In','No existing version. New major version of Login Screen - User Password - Text In','TEST',1,0,0,NULL),(53,'Login Screen - Login Button - Button - Redirect','No existing version. New major version of Login Screen - Login Button - Button - Redirect','TEST',1,0,0,NULL),(54,'Home Page - Top Level Test Case','No existing version. New major version of Home Page - Top Level Test Case','TEST',1,0,0,NULL),(55,'Home Page Info Bar - Top Level Test Case','No existing version. New major version of Home Page Info Bar - Top Level Test Case','TEST',1,0,0,NULL),(56,'Home Page Info Bar - Current Module Indicator - Label','No existing version. New major version of Home Page Info Bar - Current Module Indicator - Label','TEST',1,0,0,NULL),(57,'Home Page Info Bar - Menu Toggle - Button - Function','No existing version. New major version of Home Page Info Bar - Menu Toggle - Button - Function','TEST',1,0,0,NULL),(58,'Home Page Info Bar - Current Company - List','No existing version. New major version of Home Page Info Bar - Current Company - List','TEST',1,0,0,NULL),(59,'Home Page Top Right Nav Bar - Top Level Test Case','No existing version. New major version of Home Page Top Right Nav Bar - Top Level Test Case','TEST',1,0,0,NULL),(60,'Home Page Top Right Nav Bar - Authorisations - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - Authorisations - Button - Display','TEST',1,0,0,NULL),(61,'Home Page Top Right Nav Bar - Employee Creation Wizard - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - Employee Creation Wizard - Button - Display','TEST',1,0,0,NULL),(62,'Home Page Top Right Nav Bar - Employee CV - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - Employee CV - Button - Display','TEST',1,0,0,NULL),(63,'Home Page Top Right Nav Bar - Employee Grid View - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - Employee Grid View - Button - Display','TEST',1,0,0,NULL),(64,'Home Page Top Right Nav Bar - Visual Reports - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - Visual Reports - Button - Display','TEST',1,0,0,NULL),(65,'Home Page Top Right Nav Bar - Dakar Intelligence - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - Dakar Intelligence - Button - Display','TEST',1,0,0,NULL),(66,'Home Page Top Right Nav Bar - Organisation Chart - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - Organisation Chart - Button - Display','TEST',1,0,0,NULL),(67,'Home Page Top Right Nav Bar - My Company / Last Viewed - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - My Company / Last Viewed - Button - Display','TEST',1,0,0,NULL),(68,'Home Page Top Right Nav Bar - All Notifications - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - All Notifications - Button - Display','TEST',1,0,0,NULL),(69,'Home Page Top Right Nav Bar - New Employments - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - New Employments - Button - Display','TEST',1,0,0,NULL),(70,'Home Page Top Right Nav Bar - Terminations - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - Terminations - Button - Display','TEST',1,0,0,NULL),(71,'Home Page Top Right Nav Bar - Quick Links - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - Quick Links - Button - Display','TEST',1,0,0,NULL),(72,'Home Page Top Right Nav Bar - User Avatar - Button - Display','No existing version. New major version of Home Page Top Right Nav Bar - User Avatar - Button - Display','TEST',1,0,0,NULL),(73,'Main Menu - Top Level Test Case','No existing version. New major version of Main Menu - Top Level Test Case','TEST',1,0,0,NULL),(74,'Main Menu - Employee List - Button - Display','No existing version. New major version of Main Menu - Employee List - Button - Display','TEST',1,0,0,NULL),(75,'Main Menu - Documents - Button - Display','No existing version. New major version of Main Menu - Documents - Button - Display','TEST',1,0,0,NULL),(76,'Main Menu - Employees - Button - Display','No existing version. New major version of Main Menu - Employees - Button - Display','TEST',1,0,0,NULL),(77,'Main Menu - Employee Others - Button - Display','No existing version. New major version of Main Menu - Employee Others - Button - Display','TEST',1,0,0,NULL),(78,'Main Menu - Payroll - Button - Display','No existing version. New major version of Main Menu - Payroll - Button - Display','TEST',1,0,0,NULL),(79,'Main Menu - Employee Statistics - Button - Display','No existing version. New major version of Main Menu - Employee Statistics - Button - Display','TEST',1,0,0,NULL),(80,'Main Menu - Payroll Statistics - Button - Display','No existing version. New major version of Main Menu - Payroll Statistics - Button - Display','TEST',1,0,0,NULL),(81,'Main Menu - Absence Statistics - Button - Display','No existing version. New major version of Main Menu - Absence Statistics - Button - Display','TEST',1,0,0,NULL),(82,'Main Menu - Reports - Button - Display','No existing version. New major version of Main Menu - Reports - Button - Display','TEST',1,0,0,NULL),(83,'Main Menu - Monthly Reports - Button - Display','No existing version. New major version of Main Menu - Monthly Reports - Button - Display','TEST',1,0,0,NULL),(84,'Main Menu - Yearly Reports - Button - Display','No existing version. New major version of Main Menu - Yearly Reports - Button - Display','TEST',1,0,0,NULL),(85,'Main Menu - Bulk Updates - Button - Display','No existing version. New major version of Main Menu - Bulk Updates - Button - Display','TEST',1,0,0,NULL),(86,'Main Menu - Settings - Button - Display','No existing version. New major version of Main Menu - Settings - Button - Display','TEST',1,0,0,NULL);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_can_have_version_to_do`
--

DROP TABLE IF EXISTS `version_can_have_version_to_do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `version_can_have_version_to_do` (
  `version_id` int(10) unsigned NOT NULL,
  `version_to_do_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`version_to_do_id`),
  KEY `fk_version_has_version_to_do_version_to_do1_idx` (`version_to_do_id`),
  KEY `fk_version_has_version_to_do_version1_idx` (`version_id`),
  CONSTRAINT `fk_version_has_version_to_do_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`),
  CONSTRAINT `fk_version_has_version_to_do_version_to_do1` FOREIGN KEY (`version_to_do_id`) REFERENCES `version_to_do` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Any items that have not been covered on the entity or entity test.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_can_have_version_to_do`
--

LOCK TABLES `version_can_have_version_to_do` WRITE;
/*!40000 ALTER TABLE `version_can_have_version_to_do` DISABLE KEYS */;
INSERT INTO `version_can_have_version_to_do` VALUES (3,1),(3,2);
/*!40000 ALTER TABLE `version_can_have_version_to_do` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_to_do`
--

DROP TABLE IF EXISTS `version_to_do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `version_to_do` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `when_was_todo_added` date NOT NULL,
  `todo_desc` varchar(1000) NOT NULL,
  `is_todo_done` tinyint(4) DEFAULT '0',
  `when_was_todo_done` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_to_do`
--

LOCK TABLES `version_to_do` WRITE;
/*!40000 ALTER TABLE `version_to_do` DISABLE KEYS */;
INSERT INTO `version_to_do` VALUES (1,'2021-05-04','Add active directory login.\r',0,NULL),(2,'2021-05-04','Add Google login.\r',0,NULL);
/*!40000 ALTER TABLE `version_to_do` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `version_to_do_BEFORE_INSERT` BEFORE INSERT ON `version_to_do` FOR EACH ROW BEGIN
	SET NEW.when_was_todo_added = now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-04 17:19:11
