--
-- NorthCoastC: make horde-only
UPDATE `creature_template_npcbot_wander_nodes` SET `flags`=`flags`|4 WHERE (`id`='283');
-- DurotarCanyon1_8: make horde-only
UPDATE `creature_template_npcbot_wander_nodes` SET `flags`=`flags`|4 WHERE (`id`='1379');
