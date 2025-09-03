/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.42 : Database - expediaflight_bookings
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expediaflight_bookings` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `expediaflight_bookings`;

/*Table structure for table `airlines` */

DROP TABLE IF EXISTS `airlines`;

CREATE TABLE `airlines` (
  `airline_id` int NOT NULL AUTO_INCREMENT,
  `airline_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`airline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `airlines` */

insert  into `airlines`(`airline_id`,`airline_name`) values 
(2,'Precision Air'),
(3,'Ethiopian Airlines'),
(4,'Kenya Airways'),
(5,'Air Tanzania'),
(6,'Kenya Airways'),
(7,'Air Tanzania'),
(8,'Kenya Airways'),
(9,'Air Tanzania'),
(10,'Kenya Airways'),
(11,'Ethiopian Airlines'),
(12,'Emirates'),
(13,'Kenya Airways'),
(14,'Ethiopian Airlines'),
(15,'Emirates');

/*Table structure for table `airports` */

DROP TABLE IF EXISTS `airports`;

CREATE TABLE `airports` (
  `airport_id` int NOT NULL AUTO_INCREMENT,
  `airport_name` varchar(150) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`airport_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `airports_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `airports` */

insert  into `airports`(`airport_id`,`airport_name`,`city_id`) values 
(3,'Julius Nyerere International Airport',2),
(4,'Jomo Kenyatta International Airport',26),
(5,'Moi International Airport',26),
(6,'Jomo Kenyatta International Airport',26),
(7,'Moi International Airport',26),
(8,'Jomo Kenyatta International Airport',26),
(9,'Moi International Airport',26),
(10,'Jomo Kenyatta International Airport',26),
(11,'Moi International Airport',26),
(12,'Jomo Kenyatta International Airport',26),
(13,'Moi International Airport',26),
(14,'Julius Nyerere International Airport',2),
(15,'Jomo Kenyatta International Airport',26),
(27,'Bole International Airport',24),
(30,'Julius Nyerere International Airport',2),
(33,'Julius Nyerere International Airport',2),
(36,'Julius Nyerere International Airport',2),
(39,'Julius Nyerere International Airport',2),
(42,'Julius Nyerere International Airport',2),
(44,'Jomo Kenyatta International Airport',26),
(45,'Julius Nyerere International Airport',2),
(48,'Julius Nyerere International Airport',2),
(50,'Jomo Kenyatta International Airport',26),
(51,'Julius Nyerere International Airport',2),
(58,'Entebbe International Airport',28),
(59,'Entebbe International Airport',28),
(60,'Entebbe International Airport',28),
(61,'Entebbe International Airport',28),
(62,'Entebbe International Airport',28),
(63,'Entebbe International Airport',28),
(64,'Entebbe International Airport',28),
(65,'Entebbe International Airport',28),
(66,'Jomo Kenyatta International Airport',2),
(67,'Moi International Airport',2);

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `passenger_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  `seat_id` int DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`booking_id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `flight_id` (`flight_id`),
  KEY `seat_id` (`seat_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`),
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bookings` */

insert  into `bookings`(`booking_id`,`passenger_id`,`flight_id`,`seat_id`,`booking_date`,`status`) values 
(35,1,12,13,'2025-08-25 20:25:21','Confirmed'),
(38,1,12,13,'2025-08-25 21:31:51','Confirmed'),
(41,1,12,13,'2025-08-25 21:32:04','Confirmed'),
(45,1,12,13,'2025-08-26 00:54:26','Confirmed'),
(46,1,12,13,'2025-08-26 00:54:38','Confirmed');

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `cities_ibfk_1` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cities` */

insert  into `cities`(`city_id`,`city_name`,`country_id`) values 
(2,'Dar es Salaam',2),
(7,'Nairobi',2),
(8,'Dar es Salaam',3),
(24,'Addis Ababa',NULL),
(25,'Dubai',3),
(26,'Nairobi',3),
(28,'Kampala',21),
(47,'Thika',3),
(48,'Thika',3),
(49,'Nakuru',3);

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `classes` */

insert  into `classes`(`class_id`,`class_name`) values 
(1,'Economy'),
(2,'Business'),
(3,'First Class'),
(4,'Economy'),
(5,'Business'),
(6,'First Class');

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `countries` */

insert  into `countries`(`country_id`,`country_name`) values 
(2,'Tanzania'),
(3,'Kenya'),
(21,'Uganda'),
(22,'Eritrea'),
(23,'Ethiopia'),
(27,'Sudan'),
(28,'Sudan');

/*Table structure for table `countries_backup` */

DROP TABLE IF EXISTS `countries_backup`;

CREATE TABLE `countries_backup` (
  `country_id` int NOT NULL DEFAULT '0',
  `country_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `countries_backup` */

insert  into `countries_backup`(`country_id`,`country_name`) values 
(2,'Tanzania'),
(3,'Kenya'),
(21,'Uganda'),
(22,'Eritrea');

/*Table structure for table `flight_bookings` */

DROP TABLE IF EXISTS `flight_bookings`;

CREATE TABLE `flight_bookings` (
  `fb_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  PRIMARY KEY (`fb_id`),
  KEY `booking_id` (`booking_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `flight_bookings_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`),
  CONSTRAINT `flight_bookings_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `flight_bookings` */

insert  into `flight_bookings`(`fb_id`,`booking_id`,`flight_id`) values 
(24,35,12),
(25,38,12),
(26,41,12);

/*Table structure for table `flight_classes` */

DROP TABLE IF EXISTS `flight_classes`;

CREATE TABLE `flight_classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `flight_classes` */

insert  into `flight_classes`(`class_id`,`class_name`) values 
(2,'Business'),
(3,'First'),
(4,'Economy'),
(5,'Business'),
(6,'First'),
(7,'Economy Plus'),
(8,'Economy'),
(9,'Business'),
(10,'First'),
(11,'Economy Plus'),
(12,'Economy'),
(13,'Economy'),
(14,'Economy'),
(15,'Economy'),
(16,'Economy'),
(17,'Economy'),
(18,'Economy'),
(19,'Economy'),
(20,'Economy'),
(21,'Economy'),
(22,'Economy');

/*Table structure for table `flights` */

DROP TABLE IF EXISTS `flights`;

CREATE TABLE `flights` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `airline_id` int DEFAULT NULL,
  `departure_airport_id` int DEFAULT NULL,
  `arrival_airport_id` int DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `airline_id` (`airline_id`),
  KEY `departure_airport_id` (`departure_airport_id`),
  KEY `arrival_airport_id` (`arrival_airport_id`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`airline_id`),
  CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`departure_airport_id`) REFERENCES `airports` (`airport_id`),
  CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`arrival_airport_id`) REFERENCES `airports` (`airport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `flights` */

insert  into `flights`(`flight_id`,`airline_id`,`departure_airport_id`,`arrival_airport_id`,`departure_time`,`arrival_time`) values 
(12,4,4,65,'2025-08-20 10:00:00','2025-08-20 12:00:00');

/*Table structure for table `passengers` */

DROP TABLE IF EXISTS `passengers`;

CREATE TABLE `passengers` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `passengers` */

insert  into `passengers`(`passenger_id`,`first_name`,`last_name`,`email`,`phone`) values 
(1,'Sasha','Mutheu','sasha_new@example.com','+254711111111'),
(2,'Sasha','Mutheu','john@example.com','+254700000000'),
(3,'Sasha','Mutheu','john@example.com','+254700000000'),
(4,'Sasha','Mutheu','john@example.com','+254700000000'),
(5,'Sasha','Mutheu','john@example.com','+254700000000'),
(6,'Sasha','Mutheu','john@example.com','+254700000000'),
(7,'Sasha','Mutheu','john@example.com','+254700000000'),
(8,'Sasha','Mutheu','john@example.com','+254700000000'),
(9,'Sasha','Mutheu','john@example.com','+254700000000'),
(10,'Sasha','Mutheu','john@example.com','+254700000000'),
(11,'Sasha','Mutheu','john@example.com','+254700000000'),
(12,'Sasha','Mutheu','john@example.com','+254700000000'),
(13,'Sasha','Mutheu','john@example.com','+254700000000'),
(14,'Sasha','Mutheu','sasha@example.com','+254700000000'),
(15,'Sasha','Mutheu','sasha@example.com','+254700000000'),
(16,'Sasha','Mutheu','john@example.com','+254700000000'),
(17,'Sasha','Mutheu','john@example.com','+254700000000');

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `payments` */

insert  into `payments`(`payment_id`,`booking_id`,`amount`,`payment_date`,`method`) values 
(6,35,150.00,'2025-08-25 20:48:05','Credit Card');

/*Table structure for table `seats` */

DROP TABLE IF EXISTS `seats`;

CREATE TABLE `seats` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `flight_id` int DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`seat_id`),
  KEY `flight_id` (`flight_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`),
  CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `flight_classes` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `seats` */

insert  into `seats`(`seat_id`,`flight_id`,`seat_number`,`class_id`,`is_available`) values 
(13,12,'14C',15,0),
(15,12,'12A',15,1),
(17,12,'12A',15,1),
(19,12,'12A',15,1),
(20,12,'14B',15,1),
(21,12,'14B',15,1),
(22,12,'14B',15,1),
(24,12,'12A',15,1),
(26,12,'12A',15,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`password`,`role`) values 
(1,'alice','securepass123','admin'),
(2,'bob','mypassword456','editor'),
(4,'alice','securepass123','admin'),
(5,'bob','mypassword456','editor'),
(6,'charlie','charliepass789','viewer');

/* Procedure structure for procedure `sp_checkairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairline`(
    IN p_airline_name VARCHAR(150)
)
BEGIN
    SELECT airline_id
    FROM airlines
    WHERE airline_name = p_airline_name;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairport`(
    IN p_airport_name VARCHAR(150),
    IN p_city_id INT
)
BEGIN
    -- Check if city exists
    IF EXISTS (SELECT 1 FROM cities WHERE city_id = p_city_id) THEN
        -- Check if airport exists in that city
        SELECT airport_id
        FROM airports
        WHERE airport_name = p_airport_name AND city_id = p_city_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: city_id does not exist in cities table';
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbooking`(
    IN p_passenger_id INT,
    IN p_flight_id INT,
    IN p_seat_id INT
)
BEGIN
    SELECT booking_id
    FROM bookings
    WHERE passenger_id = p_passenger_id
      AND flight_id = p_flight_id
      AND seat_id = p_seat_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcity`(
    IN p_city_name VARCHAR(100),
    IN p_country_id INT
)
BEGIN
    -- Check if country exists
    IF EXISTS (SELECT 1 FROM countries WHERE country_id = p_country_id) THEN
        -- Check if city exists in that country
        SELECT city_id
        FROM cities
        WHERE city_name = p_city_name AND country_id = p_country_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: country_id does not exist in countries table';
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcountry`(
    IN p_country_name VARCHAR(100)
)
BEGIN
    SELECT country_id, country_name
    FROM countries
    WHERE country_name = p_country_name;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflight`(
    IN p_airline_id INT,
    IN p_departure_airport_id INT,
    IN p_arrival_airport_id INT,
    IN p_departure_time DATETIME
)
BEGIN
    SELECT flight_id
    FROM flights
    WHERE airline_id = p_airline_id
      AND departure_airport_id = p_departure_airport_id
      AND arrival_airport_id = p_arrival_airport_id
      AND departure_time = p_departure_time;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflightbooking`(
    IN p_booking_id INT,
    IN p_flight_id INT
)
BEGIN
    SELECT fb_id
    FROM flight_bookings
    WHERE booking_id = p_booking_id AND flight_id = p_flight_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflightclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflightclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflightclass`(
    IN p_class_name VARCHAR(50)
)
BEGIN
    SELECT class_id
    FROM flight_classes
    WHERE class_name = p_class_name;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkpassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkpassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkpassenger`(
    IN p_email VARCHAR(150)
)
BEGIN
    SELECT passenger_id
    FROM passengers
    WHERE email = p_email;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkpayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkpayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkpayment`(
    IN p_booking_id INT,
    IN p_payment_date DATETIME,
    IN p_amount DECIMAL(10,2)
)
BEGIN
    SELECT payment_id
    FROM payments
    WHERE booking_id = p_booking_id
      AND payment_date = p_payment_date
      AND amount = p_amount;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkseat` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkseat` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkseat`(
    IN p_flight_id INT,
    IN p_seat_number VARCHAR(10)
)
BEGIN
    SELECT seat_id
    FROM seats
    WHERE flight_id = p_flight_id
      AND seat_number = p_seat_number;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkuser`(
    IN p_username VARCHAR(100)
)
BEGIN
    SELECT user_id
    FROM users
    WHERE username = p_username;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairline`(
    IN p_airline_id INT
)
BEGIN
    DELETE FROM airlines
    WHERE airline_id = p_airline_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairport`(IN p_airport_id INT)
BEGIN
    DELETE FROM airports
    WHERE airport_id = p_airport_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookings`(
    IN p_booking_id INT
)
BEGIN
    DECLARE v_seat_id INT;

    -- Get the seat_id before deleting
    SELECT seat_id INTO v_seat_id
    FROM bookings
    WHERE booking_id = p_booking_id;

    -- Delete the booking
    DELETE FROM bookings
    WHERE booking_id = p_booking_id;

    -- Set seat back to available (optional)
    IF v_seat_id IS NOT NULL THEN
        UPDATE seats
        SET is_available = TRUE
        WHERE seat_id = v_seat_id;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecity`(
    IN p_city_id INT
)
BEGIN
    DELETE FROM cities
    WHERE city_id = p_city_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecountries`(
    IN p_country_id INT
)
BEGIN
    DELETE FROM countries WHERE country_id = p_country_id;
    SELECT ROW_COUNT() AS rows_deleted;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflight`(
    IN p_flight_id INT
)
BEGIN
    -- Check if the flight exists
    IF EXISTS (SELECT 1 FROM flights WHERE flight_id = p_flight_id) THEN
        DELETE FROM flights WHERE flight_id = p_flight_id;
        SELECT CONCAT('Flight with ID ', p_flight_id, ' has been deleted.') AS message;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Flight does not exist';
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbookings`(
    IN p_fb_id INT
)
BEGIN
    DELETE FROM flight_bookings
    WHERE fb_id = p_fb_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightclass`(
    IN p_class_id INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM flight_classes WHERE class_id = p_class_id) THEN
        DELETE FROM flight_classes WHERE class_id = p_class_id;
        SELECT CONCAT('Flight class with ID ', p_class_id, ' has been deleted.') AS message;
    ELSE
        SELECT CONCAT('No flight class found with ID ', p_class_id) AS message;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepassenger`(
    IN p_passenger_id INT
)
BEGIN
    DELETE FROM passengers
    WHERE passenger_id = p_passenger_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepayments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepayments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepayments`(
    IN p_payment_id INT
)
BEGIN
    DELETE FROM payments
    WHERE payment_id = p_payment_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteseats` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteseats` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteseats`(
    IN p_seat_id INT
)
BEGIN
    DELETE FROM seats
    WHERE seat_id = p_seat_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteusers`(
    IN p_user_id INT
)
BEGIN
    DELETE FROM users
    WHERE user_id = p_user_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairlinedetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairlinedetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairlinedetails`(
    IN p_airline_id INT
)
BEGIN
    SELECT airline_id, airline_name
    FROM airlines
    WHERE airline_id = p_airline_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairlines`()
BEGIN
    SELECT * FROM airlines;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairportdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairportdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairportdetails`(
    IN p_airport_id INT
)
BEGIN
    SELECT airport_id, airport_name, city_id
    FROM airports
    WHERE airport_id = p_airport_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairports` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairports` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairports`()
BEGIN
    SELECT a.airport_id, a.airport_name, a.city_id, c.city_name, co.country_name
    FROM airports a
    JOIN cities c ON a.city_id = c.city_id
    JOIN countries co ON c.country_id = co.country_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingdetails`(
    IN p_booking_id INT
)
BEGIN
    SELECT booking_id, passenger_id, flight_id, seat_id, booking_date, status
    FROM bookings
    WHERE booking_id = p_booking_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookings`()
BEGIN
    SELECT 
        b.booking_id,
        CONCAT(p.first_name, ' ', p.last_name) AS passenger_name,
        p.email,
        p.phone,
        f.flight_id,
        f.departure_airport_id,
        f.arrival_airport_id,
        f.departure_time,
        f.arrival_time,
        s.seat_number,
        fc.class_name AS seat_class,
        b.booking_date,
        b.status
    FROM bookings b
    JOIN passengers p ON b.passenger_id = p.passenger_id
    JOIN flights f ON b.flight_id = f.flight_id
    JOIN seats s ON b.seat_id = s.seat_id
    JOIN flight_classes fc ON s.class_id = fc.class_id
    ORDER BY b.booking_date DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcities`()
BEGIN
    SELECT c.city_id, c.city_name, c.country_id, co.country_name
    FROM cities c
    JOIN countries co ON c.country_id = co.country_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcitydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcitydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcitydetails`(
    IN p_city_id INT
)
BEGIN
    SELECT city_id, city_name, country_id
    FROM cities
    WHERE city_id = p_city_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountries`()
BEGIN
    SELECT * FROM countries;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountrydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountrydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountrydetails`(
    IN p_country_id INT
)
BEGIN
    SELECT * FROM countries
    WHERE country_id = p_country_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingdetails`(
    IN p_fb_id INT
)
BEGIN
    SELECT fb_id, booking_id, flight_id
    FROM flight_bookings
    WHERE fb_id = p_fb_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookings`()
BEGIN
    SELECT * FROM flight_bookings;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightclassdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightclassdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightclassdetails`(
    IN p_class_id INT
)
BEGIN
    SELECT class_id, class_name
    FROM flight_classes
    WHERE class_id = p_class_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightclasses`()
BEGIN
    SELECT * FROM flight_classes;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightdetails`(
    IN p_flight_id INT
)
BEGIN
    SELECT flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time
    FROM flights
    WHERE flight_id = p_flight_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflights`()
BEGIN
    SELECT 
        f.flight_id,
        a.airline_name,
        dep.airport_name AS departure_airport,
        arr.airport_name AS arrival_airport,
        f.departure_time,
        f.arrival_time
    FROM flights f
    JOIN airlines a ON f.airline_id = a.airline_id
    JOIN airports dep ON f.departure_airport_id = dep.airport_id
    JOIN airports arr ON f.arrival_airport_id = arr.airport_id
    ORDER BY f.flight_id DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpassengerdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpassengerdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpassengerdetails`(
    IN p_passenger_id INT
)
BEGIN
    SELECT passenger_id, first_name, last_name, email, phone
    FROM passengers
    WHERE passenger_id = p_passenger_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpassengers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpassengers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpassengers`(
    IN p_passenger_id INT
)
BEGIN
    IF p_passenger_id IS NULL THEN
        -- Get all passengers
        SELECT * FROM passengers;
    ELSE
        -- Get one passenger by ID
        SELECT * FROM passengers
        WHERE passenger_id = p_passenger_id;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpaymentdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpaymentdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpaymentdetails`(
    IN p_payment_id INT
)
BEGIN
    SELECT payment_id, booking_id, amount, payment_date, method
    FROM payments
    WHERE payment_id = p_payment_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpayments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpayments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpayments`()
BEGIN
    SELECT 
        p.payment_id,
        p.booking_id,
        b.passenger_id,
        CONCAT(ps.first_name, ' ', ps.last_name) AS passenger_name,
        p.amount,
        p.payment_date,
        p.method
    FROM payments p
    INNER JOIN bookings b ON p.booking_id = b.booking_id
    INNER JOIN passengers ps ON b.passenger_id = ps.passenger_id
    ORDER BY p.payment_date DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getseatdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getseatdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getseatdetails`(
    IN p_seat_id INT
)
BEGIN
    SELECT seat_id, flight_id, seat_number, class_id, is_available
    FROM seats
    WHERE seat_id = p_seat_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getseats` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getseats` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getseats`()
BEGIN
    SELECT 
        s.seat_id,
        s.flight_id,
        s.seat_number,
        c.class_name,
        s.is_available
    FROM seats s
    LEFT JOIN classes c ON s.class_id = c.class_id
    ORDER BY s.seat_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getuserdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getuserdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserdetails`(
    IN p_user_id INT
)
BEGIN
    SELECT user_id, username, password, role
    FROM users
    WHERE user_id = p_user_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getusers`()
BEGIN
    SELECT * FROM users;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairline`(
    IN p_airline_name VARCHAR(150)
)
BEGIN
    INSERT INTO airlines(airline_name)
    VALUES (p_airline_name);
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairport`(
    IN p_airport_name VARCHAR(150),
    IN p_city_id INT
)
BEGIN
    -- Check if city exists
    IF EXISTS (SELECT 1 FROM cities WHERE city_id = p_city_id) THEN
        INSERT INTO airports(airport_name, city_id)
        VALUES (p_airport_name, p_city_id);
    ELSE
        -- Raise a clear error if city_id does not exist
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: city_id does not exist in cities table';
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebooking`(
    IN p_passenger_id INT,
    IN p_flight_id INT,
    IN p_seat_id INT,
    IN p_booking_date DATETIME,
    IN p_status VARCHAR(50)
)
BEGIN
    INSERT INTO bookings(passenger_id, flight_id, seat_id, booking_date, status)
    VALUES (p_passenger_id, p_flight_id, p_seat_id, p_booking_date, p_status);
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecity`(
    IN p_city_name VARCHAR(100),
    IN p_country_id INT
)
BEGIN
    -- Check if country exists
    IF EXISTS (SELECT 1 FROM countries WHERE country_id = p_country_id) THEN
        INSERT INTO cities(city_name, country_id)
        VALUES (p_city_name, p_country_id);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: country_id does not exist in countries table';
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountry`(
    IN p_country_id INT,
    IN p_country_name VARCHAR(100)
)
BEGIN
    -- If ID is 0 or NULL, insert a new country
    IF p_country_id IS NULL OR p_country_id = 0 THEN
        INSERT INTO countries (country_name)
        VALUES (p_country_name);
    ELSE
        -- Otherwise, update the existing record
        UPDATE countries
        SET country_name = p_country_name
        WHERE country_id = p_country_id;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflight`(
    IN p_airline_id INT,
    IN p_departure_airport_id INT,
    IN p_arrival_airport_id INT,
    IN p_departure_time DATETIME,
    IN p_arrival_time DATETIME
)
BEGIN
    -- validate departure airport
    IF NOT EXISTS (SELECT 1 FROM airports WHERE airport_id = p_departure_airport_id) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Departure airport does not exist';
    END IF;

    -- validate arrival airport
    IF NOT EXISTS (SELECT 1 FROM airports WHERE airport_id = p_arrival_airport_id) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Arrival airport does not exist';
    END IF;

    -- prevent same airport
    IF p_departure_airport_id = p_arrival_airport_id THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Departure and arrival airports cannot be the same';
    END IF;

    -- insert flight
    INSERT INTO flights (airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time)
    VALUES (p_airline_id, p_departure_airport_id, p_arrival_airport_id, p_departure_time, p_arrival_time);
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbooking`(
    IN p_booking_id INT,
    IN p_flight_id INT
)
BEGIN
    INSERT INTO flight_bookings(booking_id, flight_id)
    VALUES (p_booking_id, p_flight_id);
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightclasses`(
    IN p_class_id INT,
    IN p_class_name VARCHAR(50)
)
BEGIN
    -- If ID is provided and exists, update
    IF p_class_id IS NOT NULL AND EXISTS (SELECT 1 FROM flight_classes WHERE class_id = p_class_id) THEN
        UPDATE flight_classes
        SET class_name = p_class_name
        WHERE class_id = p_class_id;

        SELECT CONCAT('Flight class with ID ', p_class_id, ' has been updated.') AS message;
    ELSE
        -- Otherwise insert a new flight class
        INSERT INTO flight_classes (class_name)
        VALUES (p_class_name);

        SELECT CONCAT('Flight class "', p_class_name, '" has been added with ID ', LAST_INSERT_ID()) AS message;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepassenger`(
    IN p_passenger_id INT,       -- NULL for new passengers
    IN p_first_name VARCHAR(100),
    IN p_last_name VARCHAR(100),
    IN p_email VARCHAR(150),
    IN p_phone VARCHAR(50)
)
BEGIN
    IF p_passenger_id IS NULL THEN
        -- Insert a new passenger
        INSERT INTO passengers (first_name, last_name, email, phone)
        VALUES (p_first_name, p_last_name, p_email, p_phone);
    ELSE
        -- Update an existing passenger
        UPDATE passengers
        SET first_name = p_first_name,
            last_name = p_last_name,
            email = p_email,
            phone = p_phone
        WHERE passenger_id = p_passenger_id;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepayment`(
    IN p_payment_id INT,
    IN p_booking_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_payment_date DATETIME,
    IN p_method VARCHAR(50)
)
BEGIN
    IF p_payment_id IS NULL THEN
        -- Insert a new payment
        INSERT INTO payments (booking_id, amount, payment_date, method)
        VALUES (p_booking_id, p_amount, p_payment_date, p_method);
    ELSE
        -- Update an existing payment
        UPDATE payments
        SET booking_id = p_booking_id,
            amount = p_amount,
            payment_date = p_payment_date,
            method = p_method
        WHERE payment_id = p_payment_id;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveseats` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveseats` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveseats`(
    IN p_seat_id INT,
    IN p_flight_id INT,
    IN p_seat_number VARCHAR(10),
    IN p_class_id INT,
    IN p_is_available TINYINT(1)
)
BEGIN
    IF p_seat_id IS NULL THEN
        -- Insert a new seat
        INSERT INTO seats (flight_id, seat_number, class_id, is_available)
        VALUES (p_flight_id, p_seat_number, p_class_id, p_is_available);
    ELSE
        -- Update an existing seat
        UPDATE seats
        SET flight_id = p_flight_id,
            seat_number = p_seat_number,
            class_id = p_class_id,
            is_available = p_is_available
        WHERE seat_id = p_seat_id;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveusers`(
    IN p_username VARCHAR(100),
    IN p_password VARCHAR(255),
    IN p_role VARCHAR(50)
)
BEGIN
    INSERT INTO users(username, password, role)
    VALUES (p_username, p_password, p_role);
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
