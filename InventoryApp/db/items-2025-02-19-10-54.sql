-- Astoria SQL Client Dump
-- App Version: 0.9.8-beta
-- https://sql-client.com
--
-- Dump Time: 2025-02-19T09:54:59.023Z

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- ------------------------------------------------------------
-- SCHEMA DUMP FOR TABLE: items
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;
CREATE TABLE
  `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

-- ------------------------------------------------------------
-- DATA DUMP FOR TABLE: items
-- ------------------------------------------------------------

INSERT INTO `items` (`id`,`name`,`description`,`location`,`quantity`) VALUES
(2367778432, '4x50 Screw', 'Inox, 100x package', 'B1-S366-R3', 50),
(2367778823, '5x60 Screw', 'Steel, 200x package', 'B1-S353-R1', 37),
(2367778423, '3x40 Screw', 'Steel, 500x package', 'B1-S316-R2', 66),
(2367775632, '4x50 Screw', 'Steel, 200x package', 'B1-S365-R4', 43),
(2367658432, 'D18 nut', 'Steel, 200x package', 'B1-S135-R4', 43),
(2367754432, 'D20 nut', 'Steel, 200x package', 'B1-S136-R4', 13),
(2365478432, 'D24 nut', 'Steel, 200x package', 'B1-S137-R4', 12);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
