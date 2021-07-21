-- 

DROP TABLE IF EXISTS `characters_npcbot_class_role`;

CREATE TABLE `characters_npcbot_class_role` (
	`entry` INT(11) unsigned NOT NULL DEFAULT '0',
	`class_role` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`entry`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;
