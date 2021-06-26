--
-- Create schema
--

DROP SCHEMA IF EXISTS `test_bench_lite`;
CREATE SCHEMA `test_bench_lite`;
USE test_bench_lite;

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
-- Table structure for table `issue_status`
--

DROP TABLE IF EXISTS `issue_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `issue_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phase` varchar(45) NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `status` varchar(100) NOT NULL,
  `status_description` varchar(1000) DEFAULT NULL,
  `issue_status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`status_id`,`status`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_issue_status_issue_status1_idx` (`issue_status_id`) /*!80000 INVISIBLE */,
  KEY `fk_issue_status_issue_status2_idx` (`status_id`),
  CONSTRAINT `fk_issue_status_issue_status1` FOREIGN KEY (`issue_status_id`) REFERENCES `issue_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_status`
--

LOCK TABLES `issue_status` WRITE;
/*!40000 ALTER TABLE `issue_status` DISABLE KEYS */;
INSERT INTO `issue_status` VALUES (1,'Initial',0,'None','The entity has no status',1),(2,'Testing',1,'Testing','The entity is in testing',2),(3,'Testing',1,'Testing','The entity is in testing',3),(4,'Testing',1,'Testing','The entity is in testing',4),(5,'Post Test',2,'Tested Pass','The entity passed testing',7),(6,'Post Test',3,'Tested Fail','The entity failed testing',5),(7,'Post Test',4,'Tested QP','The entity had a qualified pass after testing',5),(8,'Investigation',5,'Investigation','The entity is being investigated.',6),(9,'Regression Test',6,'Regression Test','The entity is being re-tested.',2),(10,'Regression Test',6,'Regression Test','The entity is being re-tested.',3),(11,'Regression Test',6,'Regression Test','The entity is being re-tested.',4),(12,'Production',7,'Production','The entity is fine and can be put into production',8),(13,'Release',8,'Release','The entity has been released.',1);
/*!40000 ALTER TABLE `issue_status` ENABLE KEYS */;
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
INSERT INTO `employee` VALUES ('AS_1','Ariana','Swain','2'),('JC_1','James','Cilia','2'),('SB_1','Steve','Brown','1\r');
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
-- Table structure for table `fixed_reason`
--

DROP TABLE IF EXISTS `fixed_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fixed_reason` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(300) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `reason_UNIQUE` (`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_reason`
--

LOCK TABLES `fixed_reason` WRITE;
/*!40000 ALTER TABLE `fixed_reason` DISABLE KEYS */;
INSERT INTO `fixed_reason` VALUES (1,'None','No reason'),(2,'No Issue','No issue was found after investigation'),(3,'More Info Needed','Further investigation not possible without more information'),(4,'Bug','A bug was found'),(5,'Update User Interface','A change to the user interface was required.');
/*!40000 ALTER TABLE `fixed_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Stored Procedures
--

DELIMITER $
DROP PROCEDURE IF EXISTS `get_fixed_reasons`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_fixed_reasons`()
BEGIN
	SELECT * FROM fixed_reason;
END $
DELIMITER ;

DELIMITER $
DROP PROCEDURE IF EXISTS `get_next_entity_issue_phase`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_next_entity_issue_phase`(IN statusId INT UNSIGNED)
BEGIN
	SELECT 		is2.phase 
	FROM 		issue_status is1
	JOIN		issue_status is2 
	ON			is2.status_id = is1.issue_status_id
	WHERE 		is1.status_id = statusId
	GROUP BY 	is2.phase ;
END $
DELIMITER ;

DELIMITER $
DROP PROCEDURE IF EXISTS `get_developers`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_developers`()
BEGIN
	SELECT 	id, concat(first_name, " ", last_name) AS dev_name 
    FROM 	test_bench.employee 
    WHERE 	employee_type_id = 2;
END $
DELIMITER ;