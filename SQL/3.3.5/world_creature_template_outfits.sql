	

    -- --------------------------------------------------------
    -- Host:                         localhost
    -- Server version:               5.6.10 - MySQL Community Server (GPL)
    -- Server OS:                    Win64
    -- HeidiSQL Version:             8.0.0.4491
    -- --------------------------------------------------------
     
    /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
    /*!40101 SET NAMES utf8 */;
    /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
    /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
     
    -- Dumping structure for table e2_w.creature_template_outfits
    CREATE TABLE IF NOT EXISTS `creature_template_outfits` (
      `entry` INT(10) UNSIGNED NOT NULL,
      `race` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
      `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 for male, 1 for female',
      `skin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
      `face` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
      `hair` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
      `haircolor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
      `facialhair` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
      `head` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `shoulders` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `body` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `chest` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `waist` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `legs` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `feet` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `wrists` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `hands` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `back` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      `tabard` INT(10) UNSIGNED NOT NULL DEFAULT '0',
      PRIMARY KEY  (`entry`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
     
    -- Data exporting was unselected.
    /*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
    /*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
    /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

