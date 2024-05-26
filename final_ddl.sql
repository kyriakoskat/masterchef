CREATE DATABASE  IF NOT EXISTS `master_chef` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `master_chef`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: master_chef
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `chef_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `age` int unsigned NOT NULL,
  `phone_number` bigint DEFAULT NULL,
  `birthday` date NOT NULL,
  `experience_year` int NOT NULL,
  `training_level` varchar(50) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`chef_id`),
  KEY `idx_chef_id` (`chef_id`),
  KEY `idx_chef_name` (`first_name`,`last_name`),
  CONSTRAINT `chef_chk_1` CHECK ((`training_level` in (_utf8mb4'Γ μάγειρας',_utf8mb4'Β μάγειρας',_utf8mb4'Α μάγειρας',_utf8mb4'Βοηθός αρχιμάγειρα',_utf8mb4'αρχιμάγειαρας(σεφ)')))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_judge` AFTER INSERT ON `chef` FOR EACH ROW BEGIN
    INSERT INTO judge (first_name, last_name, age, phone_number, birthday, experience_year, training_level)
    VALUES (new.first_name, new.last_name, new.age, new.phone_number, new.birthday, new.experience_year, new.training_level);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_judge` AFTER UPDATE ON `chef` FOR EACH ROW BEGIN
    UPDATE judge
    SET first_name = new.first_name,
        last_name = new.last_name,
        age = new.age,
        phone_number = new.phone_number,
        birthday = new.birthday,
        experience_year = new.experience_year,
        training_level = new.training_level
    WHERE judge_id = old.chef_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_judge` AFTER DELETE ON `chef` FOR EACH ROW BEGIN
    DELETE FROM judge WHERE judge_id = old.chef_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `chef_expertise`
--

DROP TABLE IF EXISTS `chef_expertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef_expertise` (
  `chef_id` int unsigned NOT NULL,
  `nationality_id` int unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`chef_id`,`nationality_id`),
  KEY `fk_chef_expertise_nationality_id` (`nationality_id`),
  CONSTRAINT `fk_chef_expertise_chef_id` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_chef_expertise_nationality_id` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`nationality_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chef_participation`
--

DROP TABLE IF EXISTS `chef_participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef_participation` (
  `episode_id` int unsigned NOT NULL,
  `chef_id` int unsigned NOT NULL,
  `recipe_id` int unsigned NOT NULL,
  `nationality_id` int unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`episode_id`,`chef_id`,`recipe_id`,`nationality_id`),
  KEY `recipe_id` (`recipe_id`),
  KEY `nationality_id` (`nationality_id`),
  KEY `idx_chef_id` (`chef_id`),
  KEY `idx_episode_id` (`episode_id`),
  CONSTRAINT `chef_participation_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `episode` (`episode_id`),
  CONSTRAINT `chef_participation_ibfk_2` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`),
  CONSTRAINT `chef_participation_ibfk_3` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`),
  CONSTRAINT `chef_participation_ibfk_4` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`nationality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateJudgeRatingAfterInsert` AFTER INSERT ON `chef_participation` FOR EACH ROW BEGIN
    UPDATE judge_rating
    SET episode_id = NEW.episode_id,
        chef_id = NEW.chef_id
    WHERE episode_id IS NULL
      AND chef_id IS NULL; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_judge_rating` AFTER INSERT ON `chef_participation` FOR EACH ROW BEGIN
    INSERT INTO judge_rating (episode_id, chef_id)
    VALUES (new.episode_id, new.chef_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_chef_participation` AFTER INSERT ON `chef_participation` FOR EACH ROW BEGIN
    INSERT INTO judge_rating_with_judges (episode_id, chef_id, rating_number)
    VALUES 
    (NEW.episode_id, NEW.chef_id, 1), 
           (NEW.episode_id, NEW.chef_id, 2),
           (NEW.episode_id, NEW.chef_id, 3);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateJudgeRating` AFTER UPDATE ON `chef_participation` FOR EACH ROW BEGIN
    UPDATE judge_rating
    SET episode_id = NEW.episode_id,
        chef_id = NEW.chef_id
    WHERE episode_id = OLD.episode_id
      AND chef_id = OLD.chef_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `diet_info`
--

DROP TABLE IF EXISTS `diet_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_info` (
  `recipe_id` int unsigned NOT NULL,
  `fat` int unsigned NOT NULL,
  `protein` int unsigned NOT NULL,
  `carbohydrates` int unsigned NOT NULL,
  `calories` int unsigned DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipe_id`,`fat`,`protein`,`carbohydrates`),
  CONSTRAINT `fk_diet_info_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `episode_id` int unsigned NOT NULL AUTO_INCREMENT,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`episode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `equipment_name` varchar(50) DEFAULT NULL,
  `equipment_manual` varchar(500) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`equipment_id`),
  KEY `idx_equipment_id` (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `food_type`
--

DROP TABLE IF EXISTS `food_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_type` (
  `food_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `food_type_name` varchar(100) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`food_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredient_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(50) DEFAULT NULL,
  `food_type_id` int unsigned NOT NULL,
  `ingredient_cals` int unsigned NOT NULL,
  `recipe_category` varchar(20) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ingredient_id`),
  KEY `fk_ingredients_food_type` (`food_type_id`),
  KEY `idx_ingredient_name` (`ingredient_name`),
  CONSTRAINT `fk_ingredients_food_type` FOREIGN KEY (`food_type_id`) REFERENCES `food_type` (`food_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `judge`
--

DROP TABLE IF EXISTS `judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judge` (
  `judge_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `age` int unsigned NOT NULL,
  `phone_number` bigint DEFAULT NULL,
  `birthday` date NOT NULL,
  `experience_year` int NOT NULL,
  `training_level` varchar(50) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`judge_id`),
  CONSTRAINT `judge_chk_1` CHECK ((`training_level` in (_utf8mb4'Γ μάγειρας',_utf8mb4'Β μάγειρας',_utf8mb4'Α μάγειρας',_utf8mb4'Βοηθός αρχιμάγειρα',_utf8mb4'αρχιμάγειαρας(σεφ)')))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `judge_participation`
--

DROP TABLE IF EXISTS `judge_participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judge_participation` (
  `episode_id` int unsigned NOT NULL,
  `judge_id` int unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rating_number` int unsigned DEFAULT NULL,
  PRIMARY KEY (`episode_id`,`judge_id`),
  KEY `judge_id` (`judge_id`),
  CONSTRAINT `judge_participation_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `episode` (`episode_id`),
  CONSTRAINT `judge_participation_ibfk_2` FOREIGN KEY (`judge_id`) REFERENCES `judge` (`judge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `put_rating_number` BEFORE INSERT ON `judge_participation` FOR EACH ROW BEGIN
    DECLARE total_rows INT;
    SELECT COUNT(*) INTO total_rows FROM judge_participation;
    SET NEW.rating_number = (total_rows % 3) + 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_judge_rating_with_judges` AFTER INSERT ON `judge_participation` FOR EACH ROW BEGIN
        UPDATE judge_rating_with_judges
        SET judge_id = NEW.judge_id
        WHERE episode_id = NEW.episode_id AND rating_number = NEW.rating_number;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `judge_rating`
--

DROP TABLE IF EXISTS `judge_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judge_rating` (
  `episode_id` int unsigned NOT NULL,
  `chef_id` int unsigned NOT NULL,
  `judge1_rating` int unsigned DEFAULT NULL,
  `judge2_rating` int unsigned DEFAULT NULL,
  `judge3_rating` int unsigned DEFAULT NULL,
  `total_rating` int unsigned DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`episode_id`,`chef_id`),
  KEY `chef_id` (`chef_id`),
  CONSTRAINT `judge_rating_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `episode` (`episode_id`),
  CONSTRAINT `judge_rating_ibfk_2` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`),
  CONSTRAINT `judge_rating_chk_1` CHECK ((`judge1_rating` between 1 and 5)),
  CONSTRAINT `judge_rating_chk_2` CHECK ((`judge2_rating` between 1 and 5)),
  CONSTRAINT `judge_rating_chk_3` CHECK ((`judge3_rating` between 1 and 5)),
  CONSTRAINT `judge_rating_chk_4` CHECK ((`total_rating` between 3 and 15))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calculate_total_rating` BEFORE INSERT ON `judge_rating` FOR EACH ROW BEGIN
    SET NEW.total_rating = NEW.judge1_rating + NEW.judge2_rating + NEW.judge3_rating;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `judge_rating_with_judges`
--

DROP TABLE IF EXISTS `judge_rating_with_judges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judge_rating_with_judges` (
  `episode_id` int unsigned NOT NULL,
  `chef_id` int unsigned NOT NULL,
  `judge_id` int unsigned DEFAULT NULL,
  `rating_number` int unsigned NOT NULL,
  `rating` int unsigned DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`episode_id`,`chef_id`,`rating_number`),
  KEY `chef_id` (`chef_id`),
  KEY `judge_id` (`judge_id`),
  CONSTRAINT `judge_rating_with_judges_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `episode` (`episode_id`),
  CONSTRAINT `judge_rating_with_judges_ibfk_2` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`),
  CONSTRAINT `judge_rating_with_judges_ibfk_3` FOREIGN KEY (`judge_id`) REFERENCES `judge` (`judge_id`),
  CONSTRAINT `judge_rating_with_judges_chk_1` CHECK ((`rating_number` between 1 and 3)),
  CONSTRAINT `judge_rating_with_judges_chk_2` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_judge_rating_with_judges` AFTER UPDATE ON `judge_rating_with_judges` FOR EACH ROW BEGIN
    UPDATE judge_rating
    SET judge1_rating = CASE WHEN NEW.rating_number = 1 THEN NEW.rating ELSE judge1_rating END,
        judge2_rating = CASE WHEN NEW.rating_number = 2 THEN NEW.rating ELSE judge2_rating END,
        judge3_rating = CASE WHEN NEW.rating_number = 3 THEN NEW.rating ELSE judge3_rating END
    WHERE episode_id = NEW.episode_id AND chef_id = NEW.chef_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `label` (
  `label_id` int unsigned NOT NULL AUTO_INCREMENT,
  `label_name` varchar(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`label_id`),
  KEY `idx_label_id` (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationality` (
  `nationality_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nationality_name` varchar(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nationality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipe_id` int unsigned NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(50) NOT NULL,
  `recipe_description` varchar(200) NOT NULL,
  `nationality_id` int unsigned NOT NULL,
  `difficulty_level` int unsigned NOT NULL,
  `cooking_time` int NOT NULL,
  `preparing_time` int NOT NULL,
  `sum_time` int GENERATED ALWAYS AS ((`cooking_time` + `preparing_time`)) STORED,
  `portions` int NOT NULL,
  `main_ingredient` varchar(20) NOT NULL,
  `tip1` varchar(200) DEFAULT NULL,
  `tip2` varchar(200) DEFAULT NULL,
  `tip3` varchar(200) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipe_id`),
  KEY `fk_recipe_nationality` (`nationality_id`),
  KEY `idx_recipe_last_update` (`last_update`),
  CONSTRAINT `fk_recipe_nationality` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`nationality_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `recipe_chk_1` CHECK (((`difficulty_level` <= 5) and (`difficulty_level` >= 1))),
  CONSTRAINT `recipe_chk_2` CHECK ((`sum_time` = (`cooking_time` + `preparing_time`)))
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_equipment`
--

DROP TABLE IF EXISTS `recipe_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_equipment` (
  `recipe_id` int unsigned NOT NULL,
  `equipment_id` int unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipe_id`,`equipment_id`),
  KEY `fk_recipe_equipment_equipment_id` (`equipment_id`),
  KEY `idx_recipe_id` (`recipe_id`),
  CONSTRAINT `fk_recipe_equipment_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_equipment_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_ingredient`
--

DROP TABLE IF EXISTS `recipe_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredient` (
  `recipe_id` int unsigned NOT NULL,
  `ingredient_name` varchar(50) NOT NULL,
  `ingredient_amount` int unsigned DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `unit_measurement` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`,`ingredient_name`),
  KEY `fk_recipe_ingredient_ingredient_name` (`ingredient_name`),
  CONSTRAINT `fk_recipe_ingredient_ingredient_name` FOREIGN KEY (`ingredient_name`) REFERENCES `ingredients` (`ingredient_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_ingredient_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_label`
--

DROP TABLE IF EXISTS `recipe_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_label` (
  `recipe_id` int unsigned NOT NULL,
  `label_id` int unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipe_id`,`label_id`),
  KEY `fk_recipe_label_label_id` (`label_id`),
  KEY `idx_recipe_id_label` (`recipe_id`,`label_id`),
  CONSTRAINT `fk_recipe_label_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`label_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_label_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_recipe_type`
--

DROP TABLE IF EXISTS `recipe_recipe_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_recipe_type` (
  `recipe_type_id` int unsigned NOT NULL,
  `recipe_id` int unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipe_type_id`,`recipe_id`),
  KEY `fk_recipe_recipe_type_recipe_id` (`recipe_id`),
  CONSTRAINT `fk_recipe_recipe_type_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_recipe_type_recipe_type_id` FOREIGN KEY (`recipe_type_id`) REFERENCES `recipe_type` (`recipe_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_steps`
--

DROP TABLE IF EXISTS `recipe_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_steps` (
  `recipe_id` int unsigned NOT NULL,
  `step_number` int unsigned NOT NULL,
  `step` varchar(500) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipe_id`,`step_number`),
  CONSTRAINT `fk_recipe_steps_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_type`
--

DROP TABLE IF EXISTS `recipe_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_type` (
  `recipe_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `recipe_type_name` varchar(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipe_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_unit`
--

DROP TABLE IF EXISTS `recipe_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_unit` (
  `recipe_id` int unsigned NOT NULL,
  `unit_id` int unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipe_id`,`unit_id`),
  KEY `fk_recipe_unit_unit_id` (`unit_id`),
  CONSTRAINT `fk_recipe_unit_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_unit_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_level_position`
--

DROP TABLE IF EXISTS `training_level_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_level_position` (
  `training_level_position_id` int unsigned NOT NULL AUTO_INCREMENT,
  `training_level` varchar(50) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`training_level_position_id`),
  CONSTRAINT `training_level_position_chk_1` CHECK ((`training_level` in (_utf8mb4'Γ μάγειρας',_utf8mb4'Β μάγειρας',_utf8mb4'Α μάγειρας',_utf8mb4'Βοηθός αρχιμάγειρα',_utf8mb4'αρχιμάγειαρας(σεφ)')))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `unit_id` int unsigned NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(50) DEFAULT NULL,
  `unit_description` varchar(200) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'master_chef'
--

--
-- Dumping routines for database 'master_chef'
--
/*!50003 DROP PROCEDURE IF EXISTS `FillJudgeParticipationForEpisode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FillJudgeParticipationForEpisode`(IN episode_id INT)
BEGIN
    
    CREATE TEMPORARY TABLE IF NOT EXISTS AvailableChefs (
        chef_id INT UNSIGNED
    );

    
    INSERT INTO AvailableChefs (chef_id)
    SELECT chef_id
    FROM chef
    WHERE chef_id NOT IN (
        SELECT c.chef_id
        FROM chef_participation c
        WHERE c.episode_id = episode_id
    )
    AND chef_id NOT IN (
        SELECT jp.judge_id
        FROM judge_participation jp
        WHERE jp.episode_id = episode_id - 1
        AND chef_id NOT IN (
            SELECT cp.chef_id
            FROM chef_participation cp
            WHERE cp.episode_id = episode_id - 2
        )
        AND chef_id NOT IN (
            SELECT cp.chef_id
            FROM chef_participation cp
            WHERE cp.episode_id = episode_id - 3
        )
    )
    AND chef_id NOT IN (
        SELECT jp.judge_id
        FROM judge_participation jp
        WHERE jp.episode_id = episode_id - 2
        AND chef_id NOT IN (
            SELECT cp.chef_id
            FROM chef_participation cp
            WHERE cp.episode_id = episode_id - 1
        )
        AND chef_id NOT IN (
            SELECT cp.chef_id
            FROM chef_participation cp
            WHERE cp.episode_id = episode_id - 3
        )
    )
    AND chef_id NOT IN (
        SELECT jp.judge_id
        FROM judge_participation jp
        WHERE jp.episode_id = episode_id - 3
        AND chef_id NOT IN (
            SELECT cp.chef_id
            FROM chef_participation cp
            WHERE cp.episode_id = episode_id - 1
        )
        AND chef_id NOT IN (
            SELECT cp.chef_id
            FROM chef_participation cp
            WHERE cp.episode_id = episode_id - 2
        )
    );

    
    INSERT INTO judge_participation (episode_id, judge_id)
    SELECT episode_id, chef_id FROM AvailableChefs ORDER BY RAND() LIMIT 3;

    
    DROP TEMPORARY TABLE IF EXISTS AvailableChefs;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAvailableChefs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAvailableChefs`(IN episode_id INT)
BEGIN
    
    CREATE TEMPORARY TABLE IF NOT EXISTS AvailableChefs (
        chef_id INT UNSIGNED
    );

    
    INSERT INTO AvailableChefs (chef_id)
    SELECT chef_id
    FROM chef
    WHERE chef_id NOT IN (
        SELECT c.chef_id
        FROM chef_participation c
        WHERE c.episode_id = episode_id
    );

    
    SELECT chef_id FROM AvailableChefs;

    
    DROP TEMPORARY TABLE IF EXISTS AvailableChefs;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetChefsByCuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetChefsByCuisine`(IN cuisine_name VARCHAR(255))
BEGIN
    SELECT DISTINCT c.first_name, c.last_name, e.episode_id
    FROM chef c
    JOIN chef_expertise ce ON c.chef_id = ce.chef_id
    JOIN nationality n ON ce.nationality_id = n.nationality_id
    JOIN chef_participation cp ON c.chef_id = cp.chef_id
    JOIN episode e ON cp.episode_id = e.episode_id
    WHERE n.nationality_name = cuisine_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetChefsByCuisineAndYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetChefsByCuisineAndYear`(IN cuisine_name VARCHAR(255), IN year INT)
BEGIN
    
    SET @start_episode = (year - 1) * 10 + 1;
    SET @end_episode = year * 10;

    
    SELECT c.first_name, c.last_name,
           IFNULL(GROUP_CONCAT(e.episode_id ORDER BY e.episode_id SEPARATOR ', '), 'No Participation') AS episodes_participated
    FROM chef c
    LEFT JOIN chef_expertise ce ON c.chef_id = ce.chef_id
    LEFT JOIN nationality n ON ce.nationality_id = n.nationality_id
    LEFT JOIN chef_participation cp ON c.chef_id = cp.chef_id
    LEFT JOIN episode e ON cp.episode_id = e.episode_id AND e.episode_id BETWEEN @start_episode AND @end_episode
    WHERE n.nationality_name = cuisine_name
    GROUP BY c.chef_id, c.first_name, c.last_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetChefsWithHighestTotalRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetChefsWithHighestTotalRating`(IN group_num INT)
BEGIN
    DECLARE start_episode INT;
    DECLARE end_episode INT;
    DECLARE highest_rating INT UNSIGNED;

    
    SET start_episode = (group_num - 1) * 10 + 1;
    SET end_episode = group_num * 10;

    
    SELECT MAX(total_rating) INTO highest_rating
    FROM judge_rating
    WHERE episode_id BETWEEN start_episode AND end_episode;

    
    SELECT chef_id
    FROM judge_rating
    WHERE episode_id BETWEEN start_episode AND end_episode
    AND total_rating = highest_rating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopChefWithTrainingLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTopChefWithTrainingLevel`(IN group_num INT)
BEGIN
    DECLARE start_episode INT;
    DECLARE end_episode INT;
    DECLARE max_total_rating INT UNSIGNED;
    
    
    SET start_episode = (group_num - 1) * 10 + 1;
    SET end_episode = group_num * 10;
    
    
    SELECT MAX(total_rating) INTO max_total_rating
    FROM judge_rating
    WHERE episode_id BETWEEN start_episode AND end_episode;
    
    
    SELECT j.chef_id, c.training_level
    FROM judge_rating AS j
    INNER JOIN chef AS c ON j.chef_id = c.chef_id
    WHERE j.episode_id BETWEEN start_episode AND end_episode
    AND j.total_rating = max_total_rating
    ORDER BY c.chef_id DESC, c.training_level DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetWinner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetWinner`(IN episode_num INT)
BEGIN
    DECLARE max_total_rating INT UNSIGNED;
    
    
    SELECT MAX(total_rating) INTO max_total_rating
    FROM judge_rating
    WHERE episode_id = episode_num;
    
    
    SELECT j.chef_id, c.training_level
    FROM judge_rating AS j
    INNER JOIN chef AS c ON j.chef_id = c.chef_id
    WHERE j.episode_id = episode_num
    AND j.total_rating = max_total_rating
    ORDER BY c.chef_id DESC, c.training_level DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertParticipation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertParticipation`()
BEGIN
    
    INSERT INTO chef_participation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT
        episode_id,
        chef_id,
        recipe_id,
        nationality_id
    FROM (
        SELECT
            e.episode_id,
            c.chef_id,
            r.recipe_id,
            n.nationality_id,
            ROW_NUMBER() OVER (PARTITION BY e.episode_id, n.nationality_id ORDER BY RAND()) AS row_num
        FROM
            episode e
        CROSS JOIN (
            SELECT nationality_id 
            FROM nationality 
        ) n
        JOIN (
            SELECT chef_id, nationality_id 
            FROM chef_expertise
        ) c ON c.nationality_id = n.nationality_id
        JOIN (
            SELECT recipe_id, nationality_id 
            FROM recipe
        ) r ON r.nationality_id = n.nationality_id
        LEFT JOIN chef_participation cp ON e.episode_id = cp.episode_id AND c.chef_id = cp.chef_id
        WHERE
            cp.episode_id IS NULL 
    ) numbered_participants
    WHERE row_num = 1 
    GROUP BY episode_id, chef_id, recipe_id, nationality_id; 

    
    INSERT INTO judge_participation (episode_id, judge_id)
    SELECT
        episode_id,
        judge_id
    FROM (
        SELECT
            e.episode_id,
            j.judge_id,
            ROW_NUMBER() OVER (PARTITION BY e.episode_id ORDER BY RAND()) AS row_num
        FROM
            episode e
        CROSS JOIN judge j
        LEFT JOIN chef_participation cp ON e.episode_id = cp.episode_id AND j.judge_id = cp.chef_id
        WHERE
            cp.episode_id IS NULL 
    ) numbered_judges
    WHERE row_num <= 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `participation50` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `participation50`()
BEGIN
    DECLARE counter INT DEFAULT 1;

    WHILE counter < 51 DO
        CALL populatechefparticipation_e(counter);
        CALL FillJudgeParticipationForEpisode(counter);
	SET counter = counter + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PopulateChefParticipation_a` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PopulateChefParticipation_a`(IN current_episode INT)
BEGIN
    
    CREATE TEMPORARY TABLE TempParticipation (
        episode_id INT UNSIGNED,
        chef_id INT UNSIGNED,
        recipe_id INT UNSIGNED,
        nationality_id INT UNSIGNED
    );

    
    INSERT INTO TempParticipation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT 
        current_episode AS episode_id,
        (SELECT 
            IFNULL((
                SELECT ce.chef_id 
                FROM chef_expertise ce 
                LEFT JOIN chef_participation cp ON ce.chef_id = cp.chef_id 
                WHERE ce.nationality_id = n.nationality_id 
                    AND cp.episode_id <= current_episode - 1
                GROUP BY ce.chef_id
                HAVING COUNT(DISTINCT cp.episode_id) < 3
                ORDER BY RAND() 
                LIMIT 1
            ), 
            (
                SELECT ce2.chef_id 
                FROM chef_expertise ce2 
                WHERE ce2.nationality_id = n.nationality_id 
                ORDER BY RAND() 
                LIMIT 1
            )
        )) AS chef_id,
        (SELECT 
            IFNULL((
                SELECT r.recipe_id 
                FROM recipe r 
                LEFT JOIN chef_participation cp ON r.recipe_id = cp.recipe_id 
                WHERE r.nationality_id = n.nationality_id 
                    AND cp.episode_id <= current_episode - 1
                GROUP BY r.recipe_id
                HAVING COUNT(DISTINCT cp.episode_id) < 3
                ORDER BY RAND() 
                LIMIT 1
            ), 
            (
                SELECT r2.recipe_id 
                FROM recipe r2 
                WHERE r2.nationality_id = n.nationality_id 
                ORDER BY RAND() 
                LIMIT 1
            )
        )) AS recipe_id,
        (SELECT 
            IFNULL((
                SELECT n.nationality_id 
                FROM nationality n 
                LEFT JOIN chef_participation cp ON n.nationality_id = cp.nationality_id 
                WHERE cp.episode_id <= current_episode - 1
                GROUP BY n.nationality_id
                HAVING COUNT(DISTINCT cp.episode_id) < 3
                ORDER BY RAND() 
                LIMIT 1
            ), 
            (
                SELECT n2.nationality_id 
                FROM nationality n2 
                ORDER BY RAND() 
                LIMIT 1
            )
        )) AS nationality_id
    FROM 
        nationality AS n
    WHERE 
        n.nationality_id IN (SELECT nationality_id FROM chef_expertise GROUP BY nationality_id)
    ORDER BY 
        RAND()
    LIMIT 10;

    
    INSERT INTO chef_participation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT episode_id, chef_id, recipe_id, nationality_id FROM TempParticipation;

    
    DROP TEMPORARY TABLE TempParticipation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PopulateChefParticipation_b` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PopulateChefParticipation_b`(IN current_episode INT)
BEGIN
    
    CREATE TEMPORARY TABLE TempParticipation (
        episode_id INT UNSIGNED,
        chef_id INT UNSIGNED,
        recipe_id INT UNSIGNED,
        nationality_id INT UNSIGNED
    );

    
    INSERT INTO TempParticipation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT 
        current_episode AS episode_id,
        (SELECT 
            IFNULL((
                SELECT ce.chef_id 
                FROM chef_expertise ce 
                LEFT JOIN chef_participation cp ON ce.chef_id = cp.chef_id 
                WHERE ce.nationality_id = n.nationality_id 
                    AND cp.episode_id <= current_episode - 1
                GROUP BY ce.chef_id
                HAVING COUNT(DISTINCT cp.episode_id) < 3
                ORDER BY RAND() 
                LIMIT 1
            ), 
            (
                SELECT ce2.chef_id 
                FROM chef_expertise ce2 
                WHERE ce2.nationality_id = n.nationality_id 
                ORDER BY RAND() 
                LIMIT 1
            )
        )) AS chef_id,
        (SELECT 
            IFNULL((
                SELECT r.recipe_id 
                FROM recipe r 
                LEFT JOIN chef_participation cp ON r.recipe_id = cp.recipe_id 
                WHERE r.nationality_id = n.nationality_id 
                    AND cp.episode_id <= current_episode - 1
                GROUP BY r.recipe_id
                HAVING COUNT(DISTINCT cp.episode_id) < 3
                ORDER BY RAND() 
                LIMIT 1
            ), 
            (
                SELECT r2.recipe_id 
                FROM recipe r2 
                WHERE r2.nationality_id = n.nationality_id 
                ORDER BY RAND() 
                LIMIT 1
            )
        )) AS recipe_id,
        n.nationality_id
    FROM 
        nationality AS n
    WHERE 
        n.nationality_id IN (SELECT nationality_id FROM chef_expertise GROUP BY nationality_id)
    ORDER BY 
        RAND()
    LIMIT 10;

    
    INSERT INTO chef_participation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT episode_id, chef_id, recipe_id, nationality_id FROM TempParticipation;

    
    DROP TEMPORARY TABLE TempParticipation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PopulateChefParticipation_c` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PopulateChefParticipation_c`(IN current_episode INT)
BEGIN
    
    CREATE TEMPORARY TABLE TempParticipation (
        episode_id INT UNSIGNED,
        chef_id INT UNSIGNED,
        recipe_id INT UNSIGNED,
        nationality_id INT UNSIGNED
    );

    
    INSERT INTO TempParticipation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT 
        episode_id,
        chef_id,
        recipe_id,
        nationality_id
    FROM (
        SELECT 
            current_episode AS episode_id,
            (SELECT 
                IFNULL((
                    SELECT ce.chef_id 
                    FROM chef_expertise ce 
                    LEFT JOIN chef_participation cp ON ce.chef_id = cp.chef_id 
                    WHERE ce.nationality_id = n.nationality_id 
                        AND cp.episode_id <= current_episode - 1
                    GROUP BY ce.chef_id
                    HAVING COUNT(DISTINCT cp.episode_id) < 3
                    ORDER BY RAND() 
                    LIMIT 1
                ), 
                (
                    SELECT ce2.chef_id 
                    FROM chef_expertise ce2 
                    WHERE ce2.nationality_id = n.nationality_id 
                    ORDER BY RAND() 
                    LIMIT 1
                )
            )) AS chef_id,
            (SELECT 
                IFNULL((
                    SELECT r.recipe_id 
                    FROM recipe r 
                    LEFT JOIN chef_participation cp ON r.recipe_id = cp.recipe_id 
                    WHERE r.nationality_id = n.nationality_id 
                        AND cp.episode_id <= current_episode - 1
                    GROUP BY r.recipe_id
                    HAVING COUNT(DISTINCT cp.episode_id) < 3
                    ORDER BY RAND() 
                    LIMIT 1
                ), 
                (
                    SELECT r2.recipe_id 
                    FROM recipe r2 
                    WHERE r2.nationality_id = n.nationality_id 
                    ORDER BY RAND() 
                    LIMIT 1
                )
            )) AS recipe_id,
            (SELECT 
                IFNULL((
                    SELECT n.nationality_id 
                    FROM nationality n 
                    LEFT JOIN chef_participation cp ON n.nationality_id = cp.nationality_id 
                    WHERE cp.episode_id <= current_episode - 1
                    GROUP BY n.nationality_id
                    HAVING COUNT(DISTINCT cp.episode_id) < 3
                    ORDER BY RAND() 
                    LIMIT 1
                ), 
                (
                    SELECT n2.nationality_id 
                    FROM nationality n2 
                    ORDER BY RAND() 
                    LIMIT 1
                )
            )) AS nationality_id,
            ROW_NUMBER() OVER (PARTITION BY n.nationality_id ORDER BY RAND()) AS row_num
        FROM 
            nationality AS n
        WHERE 
            n.nationality_id IN (SELECT nationality_id FROM chef_expertise GROUP BY nationality_id)
        ORDER BY 
            RAND()
        LIMIT 10
    ) AS temp
    WHERE row_num = 1;

    
    INSERT INTO chef_participation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT episode_id, chef_id, recipe_id, nationality_id FROM TempParticipation;

    
    DROP TEMPORARY TABLE TempParticipation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PopulateChefParticipation_e` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PopulateChefParticipation_e`(IN current_episode INT)
BEGIN
    
    CREATE TEMPORARY TABLE TempParticipation (
        episode_id INT UNSIGNED,
        chef_id INT UNSIGNED,
        recipe_id INT UNSIGNED,
        nationality_id INT UNSIGNED
    );

    
    INSERT INTO TempParticipation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT 
        episode_id,
        chef_id,
        recipe_id,
        nationality_id
    FROM (
        SELECT 
            episode_id,
            chef_id,
            recipe_id,
            nationality_id,
            ROW_NUMBER() OVER (PARTITION BY episode_id, chef_id ORDER BY RAND()) AS chef_row_num,
            ROW_NUMBER() OVER (PARTITION BY episode_id, recipe_id ORDER BY RAND()) AS recipe_row_num,
            ROW_NUMBER() OVER (PARTITION BY episode_id, nationality_id ORDER BY RAND()) AS nationality_row_num
        FROM (
            SELECT 
                current_episode AS episode_id,
                (SELECT 
                    IFNULL((
                        SELECT ce.chef_id 
                        FROM chef_expertise ce 
                        LEFT JOIN chef_participation cp ON ce.chef_id = cp.chef_id 
                        WHERE ce.nationality_id = n.nationality_id 
                            AND cp.episode_id <= current_episode - 1
                        GROUP BY ce.chef_id
                        HAVING COUNT(DISTINCT cp.episode_id) < 3
                        ORDER BY RAND() 
                        LIMIT 1
                    ), 
                    (
                        SELECT ce2.chef_id 
                        FROM chef_expertise ce2 
                        WHERE ce2.nationality_id = n.nationality_id 
                        ORDER BY RAND() 
                        LIMIT 1
                    )
                )) AS chef_id,
                (SELECT 
                    IFNULL((
                        SELECT r.recipe_id 
                        FROM recipe r 
                        LEFT JOIN chef_participation cp ON r.recipe_id = cp.recipe_id 
                        WHERE r.nationality_id = n.nationality_id 
                            AND cp.episode_id <= current_episode - 1
                        GROUP BY r.recipe_id
                        HAVING COUNT(DISTINCT cp.episode_id) < 3
                        ORDER BY RAND() 
                        LIMIT 1
                    ), 
                    (
                        SELECT r2.recipe_id 
                        FROM recipe r2 
                        WHERE r2.nationality_id = n.nationality_id 
                        ORDER BY RAND() 
                        LIMIT 1
                    )
                )) AS recipe_id,
                n.nationality_id
            FROM 
                nationality AS n
            WHERE 
                n.nationality_id IN (SELECT nationality_id FROM chef_expertise GROUP BY nationality_id)
            ORDER BY 
                RAND()
            LIMIT 10
        ) AS temp
    ) AS temp2
    WHERE chef_row_num = 1 AND recipe_row_num = 1 AND nationality_row_num = 1;

    
    INSERT INTO chef_participation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT episode_id, chef_id, recipe_id, nationality_id FROM TempParticipation;

    
    DROP TEMPORARY TABLE TempParticipation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PopulateChefParticipation_f` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PopulateChefParticipation_f`(IN current_episode INT)
BEGIN
    
    CREATE TEMPORARY TABLE TempParticipation (
        episode_id INT UNSIGNED,
        chef_id INT UNSIGNED,
        recipe_id INT UNSIGNED,
        nationality_id INT UNSIGNED
    );

    
    CREATE TEMPORARY TABLE TempJudges (
        episode_id INT UNSIGNED,
        judge_id INT UNSIGNED
    );

    
    INSERT INTO TempJudges (episode_id, judge_id)
    SELECT current_episode, chef_id
    FROM (
        SELECT chef_id
        FROM (
            SELECT DISTINCT chef_id
            FROM chef_expertise
            ORDER BY RAND()
            LIMIT 13
        ) AS temp_chefs
    ) AS temp_chefs;

    
    INSERT INTO TempParticipation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT 
        current_episode AS episode_id,
        chef_id,
        recipe_id,
        nationality_id
    FROM (
        SELECT 
            (SELECT 
                IFNULL((
                    SELECT ce.chef_id 
                    FROM chef_expertise ce 
                    LEFT JOIN chef_participation cp ON ce.chef_id = cp.chef_id 
                    LEFT JOIN judge_participation jp ON ce.chef_id = jp.judge_id
                    WHERE ce.nationality_id = n.nationality_id 
                        AND cp.episode_id <= current_episode - 1
                        AND jp.episode_id <= current_episode - 1
                        AND cp.chef_id IS NULL 
                    GROUP BY ce.chef_id
                    HAVING COUNT(DISTINCT cp.episode_id) < 3
                       AND COUNT(DISTINCT jp.episode_id) < 3
                    ORDER BY RAND() 
                    LIMIT 1
                ), 
                (
                    SELECT ce2.chef_id 
                    FROM chef_expertise ce2 
                    WHERE ce2.nationality_id = n.nationality_id 
                    ORDER BY RAND() 
                    LIMIT 1
                )
            )) AS chef_id,
            (SELECT 
                IFNULL((
                    SELECT r.recipe_id 
                    FROM recipe r 
                    LEFT JOIN chef_participation cp ON r.recipe_id = cp.recipe_id 
                    WHERE r.nationality_id = n.nationality_id 
                        AND cp.episode_id <= current_episode - 1
                    GROUP BY r.recipe_id
                    HAVING COUNT(DISTINCT cp.episode_id) < 3
                    ORDER BY RAND() 
                    LIMIT 1
                ), 
                (
                    SELECT r2.recipe_id 
                    FROM recipe r2 
                    WHERE r2.nationality_id = n.nationality_id 
                    ORDER BY RAND() 
                    LIMIT 1
                )
            )) AS recipe_id,
            n.nationality_id
        FROM 
            nationality AS n
        WHERE 
            n.nationality_id IN (SELECT nationality_id FROM chef_expertise GROUP BY nationality_id)
        ORDER BY 
            RAND()
        LIMIT 10
    ) AS temp;

    
    INSERT INTO chef_participation (episode_id, chef_id, recipe_id, nationality_id)
    SELECT episode_id, chef_id, recipe_id, nationality_id FROM TempParticipation;

    
    INSERT INTO judge_participation (episode_id, judge_id)
    SELECT episode_id, judge_id
    FROM (
        SELECT DISTINCT episode_id, judge_id
        FROM (
            SELECT episode_id, judge_id FROM TempJudges ORDER BY RAND() LIMIT 3
        ) AS temp_judges
    ) AS final_judges;

    
    DROP TEMPORARY TABLE TempParticipation;
    DROP TEMPORARY TABLE TempJudges;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `q5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `q5`(IN year int)
BEGIN
    SET @start_episode = year;
    SET @end_episode = year + 49;       
    SELECT judge_id, COUNT(episode_id) AS appearances
    FROM judge_participation
    WHERE episode_id BETWEEN @start_episode AND @end_episode
    GROUP BY judge_id
    HAVING appearances > 3
    ORDER BY appearances DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateTotalRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTotalRating`()
BEGIN
    UPDATE judge_rating
    SET total_rating = judge1_rating + judge2_rating + judge3_rating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_random_ratings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_random_ratings`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_episode_id INT;
    DECLARE current_chef_id INT;
    DECLARE current_judge_id INT;
    DECLARE current_rating_number INT;
    DECLARE random_rating INT;
    
    
    DECLARE cursor1 CURSOR FOR
    SELECT episode_id, chef_id, judge_id, rating_number FROM judge_rating_with_judges;

    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cursor1;

    read_loop: LOOP
        FETCH cursor1 INTO current_episode_id, current_chef_id, current_judge_id, current_rating_number;
        IF done THEN
            LEAVE read_loop;
        END IF;

        
        SET random_rating = FLOOR(1 + (RAND() * 5));

        
        UPDATE judge_rating_with_judges
        SET rating = random_rating
        WHERE episode_id = current_episode_id
          AND chef_id = current_chef_id
          AND judge_id = current_judge_id
          AND rating_number = current_rating_number;
    END LOOP;

    CLOSE cursor1;
END ;;
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

-- Dump completed on 2024-05-26 14:34:13
