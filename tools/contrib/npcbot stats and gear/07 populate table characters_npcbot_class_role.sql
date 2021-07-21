-- 

-- existing bots
TRUNCATE TABLE `characters_npcbot_class_role`;
INSERT INTO `characters_npcbot_class_role` (`entry`) (SELECT `entry` FROM `characters_npcbot`);

-- trigger `characters_npcbot_class_role`.`class_roles` update
UPDATE `characters_npcbot` SET `roles`=`roles`;
