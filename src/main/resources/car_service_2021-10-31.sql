# ************************************************************
# Sequel Pro SQL dump
# Версия 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Адрес: 127.0.0.1 (MySQL 5.5.5-10.6.4-MariaDB-1:10.6.4+maria~focal)
# Схема: car_service
# Время создания: 2021-10-31 09:37:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Дамп таблицы Cars
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cars`;

CREATE TABLE `Cars` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `car` varchar(15) NOT NULL DEFAULT '',
  `vin` varchar(17) NOT NULL DEFAULT '',
  `number` varchar(7) NOT NULL DEFAULT '',
  `year` int(4) NOT NULL,
  `customer_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer's car` (`customer_id`),
  CONSTRAINT `customer's car` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Cars` WRITE;
/*!40000 ALTER TABLE `Cars` DISABLE KEYS */;

INSERT INTO `Cars` (`id`, `car`, `vin`, `number`, `year`, `customer_id`)
VALUES
	(1,'Kia','KNAPE813DBK010143','3424PH7',2010,1),
	(2,'Fiat','ZFA19800004052124','4425AB7',2007,2),
	(3,'Opel','W0L0TGF4815273881','1295CA7',2001,3),
	(4,'Volvo','YV1RS59G942361095','5050CB7',2005,4),
	(5,'Volvo','YV1CM714671334802','6573PT5',2007,5),
	(6,'Volvo','YV1LFA4BCG1021856','5388OK7',2016,6),
	(7,'BMW','WBAWY31020L539296','3499OA2',2011,7);

/*!40000 ALTER TABLE `Cars` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы Customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `tel_number` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;

INSERT INTO `Customer` (`id`, `first_name`, `last_name`, `tel_number`)
VALUES
	(1,'Timur','Kotkovski','+375445638351'),
	(2,'Artem','Kulinchik','+375296682759'),
	(3,'Vitaly','Lukoshus','+375292254473'),
	(4,'Kirill','Tagiev','+375297077707'),
	(5,'Andrey','Meleshko','+375296144029'),
	(6,'Aleksey','Volkonovski','+375296113113'),
	(7,'Nikita','Busigin','+374449874653'),
	(11,'Lizaveta','Kotkovskaya','+375293656565'),
	(12,'Anna','Eroshina','+375295300807');

/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы Employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Employees`;

CREATE TABLE `Employees` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(11) NOT NULL DEFAULT '',
  `last_name` varchar(11) NOT NULL DEFAULT '',
  `Position_id` int(1) unsigned DEFAULT NULL,
  `Qualification_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Position` (`Position_id`),
  KEY `Qualification` (`Qualification_id`),
  CONSTRAINT `Position` FOREIGN KEY (`Position_id`) REFERENCES `Position_id` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Qualification` FOREIGN KEY (`Qualification_id`) REFERENCES `Qualification_id` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;

INSERT INTO `Employees` (`id`, `first_name`, `last_name`, `Position_id`, `Qualification_id`)
VALUES
	(1,'Andrey','Sergeychek',1,NULL),
	(2,'Maxim','Kravchenko',2,4),
	(3,'Alexander','Murashko',3,NULL),
	(4,'Alexander','Kovalchuk',5,NULL),
	(5,'Alexander','Amelchenko',4,3),
	(6,'Yuri','Borcev',4,2),
	(7,'Denis','Turov',4,3),
	(8,'Alexsander','Ponski',4,2),
	(9,'Dmitriy','Mazurov',4,1),
	(10,'Gennady','Mur',5,NULL);

/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы Maintenance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Maintenance`;

CREATE TABLE `Maintenance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_list` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Maintenance` WRITE;
/*!40000 ALTER TABLE `Maintenance` DISABLE KEYS */;

INSERT INTO `Maintenance` (`id`, `service_list`, `price`)
VALUES
	(1,'oil_change_in_automatic_transmission',70),
	(2,'oil_change_in_manual_transmission',35),
	(3,'replacing_the_cabin_filter',15),
	(4,'replacement_of_air_filter',15),
	(5,'replacing_antifreeze',40),
	(6,'replacing_the_oil_filter',20),
	(7,'replacing_the_fuel_filter',20);

/*!40000 ALTER TABLE `Maintenance` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы Online_form
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Online_form`;

CREATE TABLE `Online_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) NOT NULL DEFAULT '',
  `last_name` varchar(15) NOT NULL DEFAULT '',
  `tel_number` int(12) NOT NULL,
  `car_brand` varchar(15) NOT NULL DEFAULT '',
  `vin_number` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Дамп таблицы Operations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Operations`;

CREATE TABLE `Operations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_list` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Operations` WRITE;
/*!40000 ALTER TABLE `Operations` DISABLE KEYS */;

INSERT INTO `Operations` (`id`, `service_list`)
VALUES
	(1,'maintenance'),
	(2,'installation_of_additional_equipment'),
	(3,'filling_the_air_conditioning_system'),
	(4,'headlight_repair'),
	(5,'exhaust_system_repair'),
	(6,'steering_repair'),
	(7,'exchange_windows'),
	(8,'engine_repair'),
	(9,'car_painting'),
	(10,'gearbox_repair'),
	(11,'chip_tuning'),
	(12,'write_your_own_version');

/*!40000 ALTER TABLE `Operations` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы Orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `car_id` int(11) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `mileage` varchar(6) NOT NULL DEFAULT '',
  `repair_request_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Select car` (`car_id`),
  KEY `Select operation` (`repair_request_id`),
  CONSTRAINT `Select car` FOREIGN KEY (`car_id`) REFERENCES `Cars` (`id`),
  CONSTRAINT `Select operation` FOREIGN KEY (`repair_request_id`) REFERENCES `Operations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;

INSERT INTO `Orders` (`id`, `car_id`, `start_date`, `finish_date`, `mileage`, `repair_request_id`)
VALUES
	(1,1,'2021-08-20','2021-08-21','184000',1),
	(2,4,'2020-03-14','2020-03-17','298785',6),
	(3,2,'2021-04-15','2021-04-16','163480',8),
	(4,6,'2018-05-24','2018-05-24','105365',4),
	(5,5,'2021-10-19',NULL,'441000',12),
	(6,3,'2021-06-06','2021-06-08','538765',5);

/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы Position_id
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Position_id`;

CREATE TABLE `Position_id` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Position_id` WRITE;
/*!40000 ALTER TABLE `Position_id` DISABLE KEYS */;

INSERT INTO `Position_id` (`id`, `position`)
VALUES
	(1,'CEO'),
	(2,'head_master'),
	(3,'car_receptionist'),
	(4,'auto_repairman'),
	(5,'car_part_department');

/*!40000 ALTER TABLE `Position_id` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы Qualification_id
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Qualification_id`;

CREATE TABLE `Qualification_id` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Qualification` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Qualification_id` WRITE;
/*!40000 ALTER TABLE `Qualification_id` DISABLE KEYS */;

INSERT INTO `Qualification_id` (`id`, `Qualification`)
VALUES
	(1,'Junior'),
	(2,'Middle'),
	(3,'Senior'),
	(4,'Head');

/*!40000 ALTER TABLE `Qualification_id` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
