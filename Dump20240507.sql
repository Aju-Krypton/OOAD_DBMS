CREATE DATABASE  IF NOT EXISTS `employee_portal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `employee_portal`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: employee_portal
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `announcement_id` int NOT NULL AUTO_INCREMENT,
  `announcement_topic` varchar(30) NOT NULL,
  `announcement_content` varchar(200) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `announcement_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (1,'Welcoming New Batch','We are pleased to inform you that our companys new batch of trainees will start their training on 15th April 2024.',3,'2024-05-03 00:37:32',3),(2,'New Financial Year','I would like to inform you that the financial year will begin on 1st of April 2024',4,'2024-05-03 00:37:32',4),(3,'Employee Wellness','The HR team has taken initiative to conduct an employee wellness survey to make required adjustments to the workspace.',3,'2024-05-03 00:37:32',3),(4,'System Upgrade','We will be upgrading the system tomorrow. Please make sure to save your work.',1,'2024-05-03 10:00:00',1),(5,'Holiday Schedule','The holiday schedule for next month has been posted. Please check it out.',2,'2024-05-01 09:30:00',2),(6,'New Project Launch','We are excited to announce the launch of our new project. Stay tuned for updates!',5,'2024-05-10 08:00:00',5),(7,'Employee Training Session','There will be a mandatory training session for all employees next week. Details to follow.',3,'2024-05-15 13:30:00',3),(8,'Team Building Event','Join us for a fun-filled team building event next Friday. Don\'t miss out!',6,'2024-05-20 10:45:00',6),(9,'Policy Update','Please be advised of the recent policy update regarding remote work. Details will be emailed to all employees.',2,'2024-05-25 09:15:00',2),(10,'Company Meeting','There will be a company-wide meeting next month to discuss our goals and objectives for the upcoming quarter.',1,'2024-06-01 14:00:00',1);
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'hr'),(2,'finance'),(3,'sales'),(4,'developing'),(5,'testing');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(30) NOT NULL,
  `dept_id` int DEFAULT NULL,
  `emp_role` varchar(20) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Fardheen',4,'Senior developer'),(2,'Darshan',4,'Team lead'),(3,'Subhalakshmi',1,'Senior HR Mangager'),(4,'Aleesha',2,'CFO'),(5,'Jobin',3,'Sales Manager'),(6,'Sreeram',5,'Testing Engineer');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter` (
  `newsletter_id` int NOT NULL AUTO_INCREMENT,
  `newsletter_name` varchar(30) NOT NULL,
  `newsletter_content` varchar(200) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`newsletter_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `newsletter_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `newsletter_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
INSERT INTO `newsletter` VALUES (1,'Beauty of success - May 2024','In life, success is the vibrant thread weaving brilliance into our journey,each step forward revealing beauty of hard work.',1,'2024-05-03 01:44:21',1),(2,'Design for change - May 2024','Empower change with intentional design. Innovate for a brighter future. Together, let us shape a world of chances.',2,'2024-05-03 01:44:21',2),(3,'A Place called Home','Home: Where love resides, memories are made, and dreams take flight. Cherish the warmth of belonging in your place called home.',3,'2024-05-03 01:44:21',3),(4,'HR Newsletter - May 2024','Welcome to the May edition of the HR Newsletter. In this issue, we cover updates on employee benefits and upcoming events.',3,'2024-05-02 15:45:00',3),(5,'Finance Newsletter - Q2 2024','Check out the latest updates and news from the finance department in our Q2 2024 newsletter.',4,'2024-05-05 11:20:00',4),(6,'Technology Update - June 2024','Check out the latest technology updates and trends in our June 2024 newsletter.',3,'2024-06-05 10:00:00',3),(7,'Sales Highlights - Q2 2024','Get insights into our sales performance and achievements in the second quarter of 2024.',4,'2024-06-10 11:30:00',4),(8,'Health and Wellness Tips','Learn about maintaining a healthy lifestyle with our health and wellness tips newsletter.',5,'2024-06-15 09:45:00',5),(9,'Product Updates - Summer 2024','Stay updated on our latest product releases and enhancements for the summer season.',6,'2024-06-20 08:20:00',6),(10,'Employee Spotlight','Read inspiring stories and achievements of our employees in the Employee Spotlight newsletter.',2,'2024-06-25 12:00:00',2);
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 15:16:57
