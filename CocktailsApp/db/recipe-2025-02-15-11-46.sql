-- Astoria SQL Client Dump
-- App Version: 0.9.8-beta
-- https://sql-client.com
--
-- Dump Time: 2025-02-15T10:46:56.247Z

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- ------------------------------------------------------------
-- SCHEMA DUMP FOR TABLE: recipe
-- ------------------------------------------------------------

CREATE TABLE
  `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `ingredients` text NOT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

-- ------------------------------------------------------------
-- DATA DUMP FOR TABLE: recipe
-- ------------------------------------------------------------

INSERT INTO `recipe` (`id`,`title`,`description`,`ingredients`,`image_url`) VALUES
(4, 'Mojito', '1. Cut 1 round from the center of 1 medium lime and reserve for garnish. Juice the remaining lime until you have 3/4 ounce.\n\n2. Place 5 fresh mint leaves in a cocktail shaker. Muddle gently with a muddler or wooden spoon. Add the lime juice, 1 1/2 ounces white rum, and 3/4 ounce simple syrup. Fill the shaker halfway with ice, seal, and shake until the outside of the shaker is very frosty, about 20 seconds.\n\n3. Slap or twist the remaining 5 fresh mint leaves and place in a Collins or highball glass. Fill the glass with ice. Strain the cocktail into the glass. Top with 2 to 4 ounces of club soda (to fill the glass) and garnish with the lime wheel.', '1 medium lime\n10 fresh mint leaves, divided\n1 1/2 ounces white rum\n3/4 ounce simple syrup\nIce, preferably crushed ice\n2 to 4 ounces club soda, preferably chilled', 'https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fit,w_730,h_913/k%2FPhoto%2FRecipes%2F2024-04-mojito%2Fmojito-212'),
(5, 'Moscow Mule', '1. Make crushed ice, if desired. Crack the ice from 1 standard tray ice cubes into a clean kitchen towel. Wrap the ice up in the towel, then beat with a mallet or rolling pin into smaller, uneven pieces.\n\n2. Fill mugs or glasses with the ice. Transfer the ice into 2 Moscow mule mugs or highball glasses.\n\n3. Add the lime juice. Juice 1 medium lime to get about 2 tablespoons juice. Pour 1 tablespoon lime juice into each glass.\n\n4. Add the vodka. Pour 1/4 cup vodka (2 ounces) into each glass.\n\n5. Pour in the ginger beer. Divide 1 (12-ounce) bottle or can of ginger beer between the glasses, pouring about 3/4 cup into each.\n\n6. Stir and garnish. Stir gently to combine and serve each garnished with 1 lime wedge.', '1 standard tray ice cubes\r\n1 medium lime\r\n1/2 cup vodka (4 ounces)\r\n1 (12-ounce) bottle or can ginger beer, preferably chilled\r\n2 lime wedges, for garnish', 'https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fit,w_730,h_913/k%2FPhoto%2FRecipes%2F2024-03-moscow-mule%2Fmoscow-mule-318_1'),
(6, 'Cowboy Margarita', '1. Spread 2 teaspoons Diamond Crystal kosher salt in an even layer on a small flat plate. Cut 1 thin half-moon orange slice from 1/2 medium orange. Run the orange slice over the rim of an old-fashioned or margarita glass to moisten; reserve the slice for garnish. Invert the glass into the salt, turning it as needed, to coat the rim. Fill the glass with ice.\n\n2. Cut 4 (1/4-inch-thick) rounds from 1/2 medium jalapeño if using. Juice the remaining orange until you have 1 1/2 ounces. Juice 1/2 medium lime until you have 1/2 ounce.\n\n3. Place 2 of the jalapeño rounds, lime juice, orange juice, 1 1/2 ounces blanco tequila, and 1/2 ounce agave nectar or simple syrup in a cocktail shaker. Fill the shaker halfway with ice, seal, and shake until the outside of the shaker is very frosty, about 20 seconds.\n\n4. Pour through a strainer into the glass. Top with a splash of beer. Garnish with the orange slice and remaining jalapeño rounds if using.', '2 teaspoons Diamond Crystal kosher salt\r\n1/2 medium orange\r\nIce\r\n1/2 medium jalapeño pepper (optional)\r\n1/2 medium lime\r\n1 1/2 ounces blanco or silver tequila\r\n1/2 ounces agave nectar or simple syrup\r\nBeer\r\n', 'https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_auto,w_1220,h_915/k%2FPhoto%2FRecipes%2F2024-07-cowboy-marg%2FWC-cowboy-margarita-215');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
