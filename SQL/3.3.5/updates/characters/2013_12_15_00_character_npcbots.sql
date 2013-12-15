SET @ROLE_DPS:=2;
SET @ROLE_HEAL:=4;
SET @ROLE_RANGED:=8;

ALTER TABLE `character_npcbot` CHANGE `istank` `roles` tinyint(3) NULL;
UPDATE `character_npcbot` SET `roles`=`roles` | @ROLE_DPS;
UPDATE `character_npcbot` SET `roles`=`roles` | @ROLE_HEAL | @ROLE_RANGED WHERE `class` IN (2,5,7,11);
