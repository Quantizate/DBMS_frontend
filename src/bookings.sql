DROP database IF exists lab_bookings;
CREATE DATABASE IF NOT EXISTS lab_bookings;

USE lab_bookings;

CREATE TABLE IF NOT EXISTS bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    lab_name VARCHAR(255) NOT NULL,
    time_slot VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);


-- CREATE TABLE IF NOT EXISTS `inventory` (
--   `ID` bigint NOT NULL,
--   `Equipment_Name` varchar(255) NOT NULL,
--   `Price` float DEFAULT NULL,
--   `Vendor_Address` varchar(255) DEFAULT NULL,
--   `Vendor_Phone_Number` varchar(255) DEFAULT NULL,
--   `Manufacturer_Name` varchar(255) DEFAULT NULL,
--   `Status` varchar(255) DEFAULT NULL,
--     `Lab_Name` ENUM('Anatomy Lab', 'Biochemistry Lab', 'Biology Lab', 'Botany Lab', 'Chemistry Lab', 'Computer Lab', 'Ecology Lab', 'Engineering Lab', 'Genetics Lab', 'Geology Lab', 'Microbiology Lab', 'Neuroscience Lab', 'Physics Lab', 'Psychology Lab', 'Zoology Lab') NOT NULL, 
--   `Quantity` int DEFAULT NULL,
--   PRIMARY KEY (`ID`),
--   UNIQUE KEY `ID` (`ID`)
-- );


-- CREATE TABLE IF NOT EXISTS users (
--     `id` INT AUTO_INCREMENT PRIMARY KEY,
--     `name` VARCHAR(255) NOT NULL,
--     `email` VARCHAR(255) NOT NULL UNIQUE,
--     `password` VARCHAR(255) NOT NULL,
--     `role` VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS `course` (
-- 	`email` varchar(255) NOT NULL,
--   `Course_ID` varchar(255) NOT NULL,
--   `Credits` int DEFAULT NULL,
--   `Course_Name` varchar(255) DEFAULT NULL,
--   PRIMARY KEY (`Course_ID`),
--   UNIQUE KEY `Course_ID` (`Course_ID`)
-- );


-- CREATE TABLE IF NOT EXISTS `student_enrolled` (
--   `Course_ID` varchar(255) NOT NULL,
--   `email` VARCHAR(255) NOT NULL,
--   PRIMARY KEY (`Course_ID`,`email`)
-- );

CREATE TABLE IF NOT EXISTS EquipmentIssued (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR(255),
    -- equipment_type VARCHAR(255),
    -- number_of_equipment INT,
    equipmentID bigint,
    issue_date DATE,
    return_date DATE
);

-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_assignment4
-- ------------------------------------------------------
-- Server version	8.0.34

-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
--  SET NAMES utf8 ;
-- /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
-- /*!40103 SET TIME_ZONE='+00:00' */;
-- /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
-- /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



--
-- Dumping data for table `accessed_tool`
--

-- LOCK TABLES `accessed_tool` WRITE;
-- /*!40000 ALTER TABLE `accessed_tool` DISABLE KEYS */;
-- INSERT INTO `accessed_tool` VALUES (1071836795,11637578,'2023-01-15 09:00:00','2023-01-20 17:00:00',1),(1075740988,12278656,'2023-02-01 10:30:00','2023-02-08 16:45:00',2),(1255132186,14790536,'2023-01-28 11:15:00','2023-02-10 14:20:00',1),(1327765137,15216734,'2023-01-18 08:45:00','2023-01-25 12:30:00',1),(1408207556,15606155,'2023-02-05 13:20:00','2023-02-15 10:00:00',1),(1518960694,15823784,'2023-01-20 14:00:00','2023-01-25 16:30:00',2),(1646723846,16512225,'2023-02-10 09:45:00','2023-02-20 15:15:00',1),(1752873487,16950074,'2023-02-03 11:10:00','2023-02-15 09:00:00',1),(1863431996,17901162,'2023-01-25 10:00:00','2023-02-01 14:45:00',1),(1946080615,18222390,'2023-02-08 08:30:00','2023-02-18 12:20:00',1),(1981161062,18611564,'2023-01-22 12:15:00','2023-02-05 17:30:00',1),(2026186089,21258441,'2023-01-30 09:00:00','2023-02-10 16:00:00',1),(2153987310,21321656,'2023-02-02 11:30:00','2023-02-12 14:45:00',1),(2647425042,21334196,'2023-01-28 10:00:00','2023-02-08 15:30:00',2),(2733023357,23465720,'2023-02-05 13:45:00','2023-02-15 11:20:00',1),(2805815877,24002624,'2023-01-18 09:30:00','2023-01-28 13:40:00',1),(3578021385,24728224,'2023-02-07 08:15:00','2023-02-20 16:15:00',1),(3698294903,26088398,'2023-01-24 12:30:00','2023-02-05 14:00:00',1),(3887836424,26160676,'2023-02-01 10:00:00','2023-02-10 13:45:00',2),(4012674336,26194497,'2023-01-26 09:15:00','2023-02-05 16:30:00',1),(4058143857,26690114,'2023-02-03 08:45:00','2023-02-13 12:00:00',1),(4092211621,27362381,'2023-01-29 11:30:00','2023-02-08 15:45:00',1),(4168867761,28505383,'2023-01-21 12:00:00','2023-01-28 16:15:00',1),(4681468028,29810599,'2023-02-04 09:30:00','2023-02-15 17:00:00',1),(4744644598,29952133,'2023-01-27 11:15:00','2023-02-08 14:45:00',1),(4837634116,31650436,'2023-02-02 08:30:00','2023-02-12 12:30:00',1),(4943710983,32018957,'2023-01-31 09:45:00','2023-02-10 15:20:00',1),(4984959034,33237899,'2023-02-05 11:00:00','2023-02-15 16:30:00',1);
-- /*!40000 ALTER TABLE `accessed_tool` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `Course_ID` varchar(255) NOT NULL,
  `Credits` int DEFAULT NULL,
  `Course_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Course_ID`),
  UNIQUE KEY `Course_ID` (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('AQ264',1,'Paramedic'),('AY572',3,'Radio'),('CT740',2,'Researcher'),('EB565',2,'Environmental'),('FG378',2,'Seismologist'),('FN914',3,'Dealer'),('GB578',2,'Quality_Manager'),('GE392',1,'Media'),('ID617',3,'Engineer'),('KM959',4,'Accounts'),('MQ319',1,'Solicitor'),('OR177',1,'Worker'),('PJ264',2,'Advertising'),('UJ495',3,'Mechanical'),('UY580',5,'Lexicographer'),('VH458',3,'Programmer'),('WV691',5,'Engineer'),('WV937',1,'Manager'),('YW710',2,'horticultural'),('ZJ857',1,'electronics');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `time_slot` (
  `Time_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`Time_ID`),
  UNIQUE KEY `Time_ID` (`Time_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES ('A1'),('A2'),('A3'),('A4'),('A5'),('A6'),('B1'),('B2'),('B3'),('B4'),('B5'),('B6'),('C1'),('C2'),('C3'),('C4'),('C5'),('C6'),('D1'),('D2'),('D3'),('D4'),('D5'),('D6'),('E1'),('E2'),('E3'),('E4'),('E5'),('E6');
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;


-- DROP TABLE IF EXISTS `lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `lab` (
   `Lab_Name` ENUM('Anatomy Lab', 'Biochemistry Lab', 'Biology Lab', 'Botany Lab', 'Chemistry Lab', 'Computer Lab', 'Ecology Lab', 'Engineering Lab', 'Genetics Lab', 'Geology Lab', 'Microbiology Lab', 'Neuroscience Lab', 'Physics Lab', 'Psychology Lab', 'Zoology Lab') NOT NULL, 
  `Room_No` int DEFAULT NULL,
  `Block_No` int DEFAULT NULL,
  `Amount_Allocated` float DEFAULT '0',
  `Working_Hours` int DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `Email_ID` VARCHAR(255) CHECK (Email_ID REGEXP'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
  `Contact` bigint DEFAULT NULL,
  PRIMARY KEY (`Lab_Name`),
  UNIQUE KEY `Lab_Name` (`Lab_Name`),
  CONSTRAINT `lab_chk_2` CHECK (((`Contact` >= 1000000000) and (`Contact` < 10000000000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `lab` WRITE;
/*!40000 ALTER TABLE `lab` DISABLE KEYS */;
INSERT INTO `lab` VALUES ('Anatomy Lab',484,6,4034.13,18,49,'anatomylab@example.com',9467853210),('Biochemistry Lab',101,9,3684.54,8,70,'biochemistrylab@example.com',8129467035),('Biology Lab',313,8,1396.74,13,66,'biologylab@example.com',7341582096),('Botany Lab',493,8,9720.5,18,75,'botanylab@example.com',2196754038),('Chemistry Lab',567,10,8154.55,22,60,'chemistrylab@example.com',5309178642),('Computer Lab',465,4,5388.87,17,25,'computerlab@example.com',8023946715),('Ecology Lab',887,10,1399.11,22,19,'ecologylab@example.com',3698120475),('Engineering Lab',678,9,4050.05,8,85,'engineeringlab@example.com',6407912835),('Genetics Lab',375,10,8596.84,12,40,'geneticslab@example.com',5187249036),('Geology Lab',200,6,6725.97,23,62,'geologylab@example.com',9046812573),('Microbiology Lab',482,6,4602.45,10,17,'microbiologylab@example.com',2761948350),('Neuroscience Lab',909,9,6753.61,23,92,'neurosciencelab@example.com',8105273469),('Physics Lab',645,2,2134.6,10,82,'physicslab@example.com',6291480753),('Psychology Lab',508,4,8302.33,18,35,'psychologylab@example.com',4125968370),('Zoology Lab',493,8,2394.3,15,74,'zoologylab@example.com',9580276134);
/*!40000 ALTER TABLE `lab` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `course_slot`
--

DROP TABLE IF EXISTS `course_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course_slot` (
  `Time_ID` varchar(255) NOT NULL,
	`Lab_Name` ENUM('Anatomy Lab', 'Biochemistry Lab', 'Biology Lab', 'Botany Lab', 'Chemistry Lab', 'Computer Lab', 'Ecology Lab', 'Engineering Lab', 'Genetics Lab', 'Geology Lab', 'Microbiology Lab', 'Neuroscience Lab', 'Physics Lab', 'Psychology Lab', 'Zoology Lab') NOT NULL, 
  PRIMARY KEY (`Time_ID`,`Lab_Name`),
  KEY `Lab_Name` (`Lab_Name`),
  CONSTRAINT `course_slot_fk_1` FOREIGN KEY (`Time_ID`) REFERENCES `time_slot` (`Time_ID`),
  CONSTRAINT `course_slot_fk_2` FOREIGN KEY (`Lab_Name`) REFERENCES `lab` (`Lab_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Dumping data for table `course_slot`
--

LOCK TABLES `course_slot` WRITE;
/*!40000 ALTER TABLE `course_slot` DISABLE KEYS */;
INSERT INTO `course_slot` VALUES ('A1','Anatomy Lab'),('B2','Anatomy Lab'),('C4','Anatomy Lab'),('D5','Anatomy Lab'),('A1','Biochemistry Lab'),('B3','Biochemistry Lab'),('C4','Biochemistry Lab'),('D6','Biochemistry Lab'),('A2','Biology Lab'),('B3','Biology Lab'),('C5','Biology Lab'),('D6','Biology Lab'),('A2','Botany Lab'),('B4','Botany Lab'),('C5','Botany Lab'),('E1','Botany Lab'),('A3','Chemistry Lab'),('B4','Chemistry Lab'),('C6','Chemistry Lab'),('E1','Chemistry Lab'),('A3','Computer Lab'),('B5','Computer Lab'),('C6','Computer Lab'),('E2','Computer Lab'),('A4','Ecology Lab'),('B5','Ecology Lab'),('D1','Ecology Lab'),('E2','Ecology Lab'),('A4','Engineering Lab'),('B6','Engineering Lab'),('D1','Engineering Lab'),('E3','Engineering Lab'),('A5','Genetics Lab'),('B6','Genetics Lab'),('D2','Genetics Lab'),('E3','Genetics Lab'),('A5','Geology Lab'),('C1','Geology Lab'),('D2','Geology Lab'),('E4','Geology Lab'),('A6','Microbiology Lab'),('C1','Microbiology Lab'),('D3','Microbiology Lab'),('E4','Microbiology Lab'),('A6','Neuroscience Lab'),('C2','Neuroscience Lab'),('D3','Neuroscience Lab'),('E5','Neuroscience Lab'),('B1','Physics Lab'),('C2','Physics Lab'),('D4','Physics Lab'),('E5','Physics Lab'),('B1','Psychology Lab'),('C3','Psychology Lab'),('D4','Psychology Lab'),('E6','Psychology Lab'),('B2','Zoology Lab'),('C3','Zoology Lab'),('D5','Zoology Lab'),('E6','Zoology Lab');
/*!40000 ALTER TABLE `course_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  Dept_Name ENUM('CE', 'CL', 'CSE', 'EE', 'ME', 'MSE') NOT NULL,
  `No_of_Faculties` int DEFAULT '0',
  PRIMARY KEY (`Dept_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('CE',33),('CL',26),('CSE',25),('EE',35),('ME',43),('MSE',16);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grants`
--

DROP TABLE IF EXISTS `grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `grants` (
  `ID` int NOT NULL,
   `Lab_Name` ENUM('Anatomy Lab', 'Biochemistry Lab', 'Biology Lab', 'Botany Lab', 'Chemistry Lab', 'Computer Lab', 'Ecology Lab', 'Engineering Lab', 'Genetics Lab', 'Geology Lab', 'Microbiology Lab', 'Neuroscience Lab', 'Physics Lab', 'Psychology Lab', 'Zoology Lab') NOT NULL, 
  `Donor` varchar(255) NOT NULL,
  `Donating_Organization` varchar(255) NOT NULL,
  `Amount` float NOT NULL,
  `Receiving_Date` date NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `idx_donating_organization` (`Donating_Organization`),
  KEY `idx_amount` (`Amount`),
  KEY `idx_receiving_date` (`Receiving_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grants`
--

LOCK TABLES `grants` WRITE;
/*!40000 ALTER TABLE `grants` DISABLE KEYS */;
INSERT INTO `grants` VALUES (1,'Anatomy Lab','Tyler Lopez','Green, Johnson and Powell',9633.55,'2024-01-14'),(2,'Anatomy Lab','Vanessa King','Brown-French',3111.92,'2024-02-03'),(3,'Biochemistry Lab','Mary Garza','Delacruz PLC',9745.92,'2024-01-17'),(4,'Biochemistry Lab','Michael Salas','Ross, Williams and Williams',2435.62,'2024-01-23'),(5,'Biochemistry Lab','Michelle Mcmillan','Howard, Martinez and Hernandez',1270.68,'2024-01-15'),(6,'Biology Lab','Brian Davis','Livingston PLC',3402.83,'2024-02-08'),(7,'Biology Lab','Jacqueline Parker','Ayala, Pena and Medina',4366.4,'2024-01-20'),(8,'Biology Lab','James Phillips','Galloway, Gibbs and Erickson',1121.73,'2024-01-11'),(9,'Biology Lab','Kim Holt','Jones-Riley',7286.42,'2024-01-01'),(10,'Biology Lab','Matthew Doyle','Perez-Martin',7320.92,'2024-01-06'),(11,'Biology Lab','Monica Love','Anderson Ltd',2831.02,'2024-02-02'),(12,'Biology Lab','Patricia Graham','Landry-Mullen',5262.97,'2024-01-22'),(13,'Biology Lab','Scott Wilson','Anderson, Horn and Torres',4939.11,'2024-01-12'),(14,'Biology Lab','Stacey Robinson','Rodriguez Inc',4877.95,'2024-02-01'),(15,'Biology Lab','Stephen Castaneda','Johnson PLC',2636.63,'2024-02-08'),(16,'Biology Lab','Tanya Woods','Morgan, Johnson and Gomez',1582.83,'2024-01-28'),(17,'Biology Lab','Virginia Gallegos','Lopez-Gray',9637.23,'2024-01-01'),(18,'Biology Lab','William Moore','Meadows Ltd',2400.14,'2024-01-05'),(19,'Botany Lab','Alexandra Gonzalez','Lutz-Colon',6908.48,'2024-01-03'),(20,'Botany Lab','Katherine Anderson','Adams Inc',9926.12,'2024-01-23'),(21,'Botany Lab','Matthew Harris','Rodriguez, Meadows and Johnson',2594.82,'2024-01-26'),(22,'Chemistry Lab','Amy Frye','Osborne-Schneider',4353.63,'2024-02-04'),(23,'Chemistry Lab','Brian Hill','Hayes, Brown and Lloyd',7473.81,'2024-01-18'),(24,'Chemistry Lab','Laura Sullivan','Miller, Soto and Gonzalez',5943.39,'2024-02-03'),(25,'Chemistry Lab','Nicole Robertson','Scott-Reid',8177.25,'2024-01-18'),(26,'Chemistry Lab','Terri Cervantes','Walton, Arnold and Smith',2913.52,'2024-01-31'),(27,'Computer Lab','Brian Burke','Whitaker, Bates and Thomas',2703.19,'2024-01-07'),(28,'Computer Lab','Chelsea Lee','Hammond, Palmer and Reynolds',1554.87,'2024-02-07'),(29,'Computer Lab','Dustin Miller','Moon Inc',3093.36,'2024-02-01'),(30,'Computer Lab','Erika Davis','Ford Ltd',1302.86,'2024-01-17'),(31,'Computer Lab','Jessica Wright','Duarte-Haynes',4951.7,'2024-01-08'),(32,'Computer Lab','Luis Turner','Sharp, Richards and Keller',9036.96,'2024-01-12'),(33,'Computer Lab','Thomas Vazquez','Wallace, Navarro and Jones',7651.21,'2024-01-30'),(34,'Ecology Lab','Charles Foster','Ellis, Branch and Lee',3101.24,'2024-01-12'),(35,'Engineering Lab','Anna Velasquez','Fry, King and Austin',5032.98,'2024-02-04'),(36,'Engineering Lab','Margaret Meadows','Russell, Owens and Horn',8361.32,'2024-01-30'),(37,'Engineering Lab','Robert Gutierrez','Price Ltd',2577.09,'2024-01-05'),(38,'Engineering Lab','Victoria Porter','Wise, Harvey and Johnson',6813.5,'2024-01-07'),(39,'Genetics Lab','Andrea Bowman','Reynolds Ltd',4470.78,'2024-01-25'),(40,'Genetics Lab','Michael Salazar MD','Barrett Ltd',6295.81,'2024-01-29'),(41,'Geology Lab','Aaron Silva','Vincent, Berry and Chavez',8707.27,'2024-01-10'),(42,'Geology Lab','Vickie Gilmore','Whitney Inc',1947.48,'2024-02-09'),(43,'Microbiology Lab','Julia Davis','Brown PLC',1732.47,'2024-01-22'),(44,'Microbiology Lab','Susan Collins','Young, Robbins and Lewis',9521.14,'2024-02-07'),(45,'Physics Lab','David Mccoy','Owens, Jones and Johnson',5335.93,'2024-01-09'),(46,'Psychology Lab','Clifford Harper','Harris, Dennis and Torres',7944.17,'2024-01-10'),(47,'Psychology Lab','Keith Jensen','Burke PLC',7867,'2024-01-29'),(48,'Psychology Lab','Michelle Ramirez','Alvarez, Davis and Adams',3997.5,'2024-01-01'),(49,'Psychology Lab','Sara Klein','Sloan Group',1202.47,'2024-01-20'),(50,'Zoology Lab','Sherri Moss','Tucker-Saunders',5646.11,'2024-01-17');
/*!40000 ALTER TABLE `grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `professor` (
  `Employee_ID` bigint NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `Grant_Aid` float DEFAULT '0',
  `Office_Number` varchar(255) DEFAULT NULL,
  `Email_ID` VARCHAR(255) CHECK (Email_ID REGEXP'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
  `Contact` bigint DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `professor_chk_2` CHECK (((`Contact` >= 1000000000) and (`Contact` < 10000000000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

create index Prof_name on professor(First_Name);

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `instructor` (
  `Course_ID` varchar(255) NOT NULL,
  `Employee_ID` bigint NOT NULL,
  PRIMARY KEY (`Course_ID`,`Employee_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `instructor_fk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`),
  CONSTRAINT `instructor_fk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `professor` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Dumping data for table `instructor`
--

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `inventory` (
  `ID` bigint NOT NULL,
  `Equipment_Name` varchar(255) NOT NULL,
  `Price` float DEFAULT NULL,
  `Vendor_Address` varchar(255) DEFAULT NULL,
  `Vendor_Phone_Number` varchar(255) DEFAULT NULL,
  `Manufacturer_Name` varchar(255) DEFAULT NULL,
  `isAvailable` BOOLEAN DEFAULT 1,
  `Lab_Name` ENUM('Anatomy Lab', 'Biochemistry Lab', 'Biology Lab', 'Botany Lab', 'Chemistry Lab', 'Computer Lab', 'Ecology Lab', 'Engineering Lab', 'Genetics Lab', 'Geology Lab', 'Microbiology Lab', 'Neuroscience Lab', 'Physics Lab', 'Psychology Lab', 'Zoology Lab') NOT NULL, 
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

create index Eqp_name on inventory(Equipment_Name);


--
-- Table structure for table `lab_department`
--

DROP TABLE IF EXISTS `lab_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lab_department` (
  `Dept_Name` ENUM('CE', 'CL', 'CSE', 'EE', 'ME', 'MSE') NOT NULL,
   `Lab_Name` ENUM('Anatomy Lab', 'Biochemistry Lab', 'Biology Lab', 'Botany Lab', 'Chemistry Lab', 'Computer Lab', 'Ecology Lab', 'Engineering Lab', 'Genetics Lab', 'Geology Lab', 'Microbiology Lab', 'Neuroscience Lab', 'Physics Lab', 'Psychology Lab', 'Zoology Lab') NOT NULL, 
  PRIMARY KEY (`Dept_Name`,`Lab_Name`),
  KEY `lab_department_fk_1` (`Lab_Name`),
  CONSTRAINT `lab_department_fk_1` FOREIGN KEY (`Lab_Name`) REFERENCES `lab` (`Lab_Name`),
  CONSTRAINT `lab_department_fk_2` FOREIGN KEY (`Dept_Name`) REFERENCES `department` (`Dept_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_grant`
--

DROP TABLE IF EXISTS `lab_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lab_grant` (
   `Lab_Name` ENUM('Anatomy Lab', 'Biochemistry Lab', 'Biology Lab', 'Botany Lab', 'Chemistry Lab', 'Computer Lab', 'Ecology Lab', 'Engineering Lab', 'Genetics Lab', 'Geology Lab', 'Microbiology Lab', 'Neuroscience Lab', 'Physics Lab', 'Psychology Lab', 'Zoology Lab') NOT NULL, 
  `ID` int NOT NULL,
  `Donating_Organization` varchar(255) DEFAULT NULL,
  `Amount` float NOT NULL,
  `Receiving_Date` date DEFAULT NULL,
  PRIMARY KEY (`Lab_Name`,`ID`),
  KEY `lab_grant_fk_1` (`ID`),
  CONSTRAINT `lab_grant_fk_1` FOREIGN KEY (`ID`) REFERENCES `grants` (`ID`),
  CONSTRAINT `lab_grant_fk_2` FOREIGN KEY (`Lab_Name`) REFERENCES `lab` (`Lab_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_tool`
--

DROP TABLE IF EXISTS `lab_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lab_tool` (
  `ID` bigint NOT NULL,
   `Lab_Name` ENUM('Anatomy Lab', 'Biochemistry Lab', 'Biology Lab', 'Botany Lab', 'Chemistry Lab', 'Computer Lab', 'Ecology Lab', 'Engineering Lab', 'Genetics Lab', 'Geology Lab', 'Microbiology Lab', 'Neuroscience Lab', 'Physics Lab', 'Psychology Lab', 'Zoology Lab') NOT NULL, 
  `Procured_Through` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`,`Lab_Name`),
  KEY `Lab_Name` (`Lab_Name`),
  CONSTRAINT `lab_tool_fk_1` FOREIGN KEY (`Lab_Name`) REFERENCES `lab` (`Lab_Name`),
  CONSTRAINT `lab_tool_fk_2` FOREIGN KEY (`ID`) REFERENCES `inventory` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `prof_department`
--

DROP TABLE IF EXISTS `prof_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prof_department` (
  Dept_Name ENUM('CE', 'CL', 'CSE', 'EE', 'ME', 'MSE') NOT NULL,
  `Employee_ID` bigint NOT NULL,
  PRIMARY KEY (`Dept_Name`,`Employee_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `prof_department_fk_1` FOREIGN KEY (`Dept_Name`) REFERENCES `department` (`Dept_Name`),
  CONSTRAINT `prof_department_fk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `professor` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;











--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project` (
  `Project_ID` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Grant_Aid` float DEFAULT '0',
  PRIMARY KEY (`Project_ID`),
  UNIQUE KEY `Project_ID` (`Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `Employee_ID` bigint NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `Salary` float DEFAULT NULL,
  `Role` enum('Assistant','Researcher','Technician') DEFAULT NULL,
  `Lab_Name` ENUM('Anatomy Lab', 'Biochemistry Lab', 'Biology Lab', 'Botany Lab', 'Chemistry Lab', 'Computer Lab', 'Ecology Lab', 'Engineering Lab', 'Genetics Lab', 'Geology Lab', 'Microbiology Lab', 'Neuroscience Lab', 'Physics Lab', 'Psychology Lab', 'Zoology Lab') NOT NULL, 
  `Email_ID` VARCHAR(255) CHECK (Email_ID REGEXP'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
  `Contact` bigint DEFAULT NULL,
  `img_url` VARCHAR(255) DEFAULT NULL,
  `img_caption` VARCHAR(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `staff_chk_2` CHECK (((`Contact` >= 1000000000) and (`Contact` < 10000000000))),
  CONSTRAINT `staff_fk_2` FOREIGN KEY (`Lab_Name`) REFERENCES `lab` (`Lab_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

create index staff_name_idx on staff(First_Name);

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `Roll_Number` int NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `Batch` int DEFAULT NULL,
  `Degree` ENUM('MTech','BTech','PhD') NOT NULL,
  `Amount_Due` float DEFAULT '0',
  `Purpose` varchar(255) DEFAULT NULL, 
  `Dept_Name` ENUM('CE', 'CL', 'CSE', 'EE', 'ME', 'MSE') NOT NULL,
  `Email_ID` VARCHAR(255) CHECK (Email_ID REGEXP'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
  `Contact` bigint DEFAULT NULL,
  `password` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`Roll_Number`),
  UNIQUE KEY `Roll_Number` (`Roll_Number`),
  CONSTRAINT `students_chk_2` CHECK (((`Contact` >= 1000000000) and (`Contact` < 10000000000))),
  CONSTRAINT `students_fk_2`FOREIGN KEY (`Dept_Name`) REFERENCES `department` (`Dept_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

create index student_name on students(Roll_Number);

--
-- Table structure for table `student_enrolled`
--

DROP TABLE IF EXISTS `student_enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_enrolled` (
  `Course_ID` varchar(255) NOT NULL,
  `Roll_Number` int NOT NULL,
  PRIMARY KEY (`Course_ID`,`Roll_Number`),
  KEY `Roll_Number` (`Roll_Number`),
  CONSTRAINT `student_enrolled_fk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`),
  CONSTRAINT `student_enrolled_fk_2` FOREIGN KEY (`Roll_Number`) REFERENCES `students` (`Roll_Number`)  ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `proj_taken`
--

DROP TABLE IF EXISTS `proj_taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proj_taken` (
  `Employee_ID` bigint NOT NULL,
  `Roll_Number` int NOT NULL,
  `Project_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`Employee_ID`,`Roll_Number`,`Project_ID`),
  KEY `Roll_Number` (`Roll_Number`),
  KEY `Project_ID` (`Project_ID`),
  CONSTRAINT `proj_taken_fk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `professor` (`Employee_ID`)  ON UPDATE CASCADE,
  CONSTRAINT `proj_taken_fk_2` FOREIGN KEY (`Roll_Number`) REFERENCES `students` (`Roll_Number`)  ON UPDATE CASCADE,
  CONSTRAINT `proj_taken_fk_3` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`Project_ID`)  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accessed_tool`
--

DROP TABLE IF EXISTS `accessed_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accessed_tool` (
  `ID` bigint NOT NULL,
  `Roll_Number` int NOT NULL,
  `Issued_Date` DATE,
  -- `Return_Time` varchar(255) DEFAULT NULL,
  -- `Quantity_Issued` int NOT NULL,
  PRIMARY KEY (`ID`,`Roll_Number`),
  KEY `Roll_Number` (`Roll_Number`),
  CONSTRAINT `accessed_tool_fk_1` FOREIGN KEY (`Roll_Number`) REFERENCES `students` (`Roll_Number`) ON UPDATE CASCADE,
  CONSTRAINT `accessed_tool_fk_2` FOREIGN KEY (`ID`) REFERENCES `inventory` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;










CREATE TABLE CSE as (select * from students where Dept_Name = 'CSE');
CREATE TABLE EE as (select * from students where Dept_Name = 'EE');
CREATE TABLE ME as (select * from students where Dept_Name = 'ME');
CREATE TABLE CE as (select * from students where Dept_Name = 'CE');
CREATE TABLE CL as (select * from students where Dept_Name = 'CL');
CREATE TABLE MSE as (select * from students where Dept_Name = 'MSE');



--
-- Dumping events for database 'db_assignment4'
--

--
-- Dumping routines for database 'db_assignment4'
--
-- Dump completed on 2024-02-13  1:47:56
