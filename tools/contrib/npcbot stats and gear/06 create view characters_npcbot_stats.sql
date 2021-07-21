-- 

DROP VIEW IF EXISTS vw_characters_npcbot_stats;

CREATE VIEW vw_characters_npcbot_stats as


SELECT 
       characters.name AS 'Owner',
       characters.name AS 'Bot name' , 
       case
		 	 when characters.class = 1 then 'Warrior'
			 when characters.class = 2 then 'Paladin'
			 when characters.class = 3 then 'Hunter'
			 when characters.class = 4 then 'Rogue'
			 when characters.class = 5 then 'Priest'
			 when characters.class = 6 then 'DK'
			 when characters.class = 7 then 'Shaman'
			 when characters.class = 8 then 'Mage'
			 when characters.class = 9 then 'Warlock'
			 when characters.class = 11 then 'Druid'
		 end AS 'NPCBot Classe',
       char_stats.maxhealth AS 'HP',
		 char_stats.maxpower1 AS 'Mana/Rage/Energy',
		 char_stats.strength AS 'Strength',
		 char_stats.agility AS 'Agility',
		 char_stats.stamina AS 'Stamina',
		 char_stats.intellect AS 'Intellect',
		 char_stats.spirit AS 'Spirit',
		 char_stats.armor AS 'Armor',
		 '0' AS 'Defense', 
		 char_stats.resHoly AS 'Holy resist',
		 char_stats.resFire AS 'Fire resist',
		 char_stats.resNature AS 'Nature resist',
		 char_stats.resFrost AS 'Frost resist',
		 char_stats.resShadow as 'Shadow resist',
		 char_stats.resArcane AS 'Arcane resist',
		 round(char_stats.blockPct, 2) AS 'Block %',
		 round(char_stats.dodgePct, 2) AS 'Dodge %',
		 round(char_stats.parryPct, 2) AS 'Parry %',
		 case
		 	When characters.class IN (3) then round (char_stats.rangedCritPct,2)
		 	when characters.class IN (1,2,4,6,11) then round(char_stats.critPct,2)
			when characters.class in (5,7,8,9) then round(char_stats.spellCritPct,2)
		 END AS 'Critical %',
		 case
		 	When characters.class IN (3) then char_stats.rangedAttackPower 
		 	when characters.class IN (1,2,4,6,11) then char_stats.attackPower
		 	when characters.class in (5,7,8,9) then char_stats.rangedAttackPower
		 END AS 'Att Power',
		 char_stats.spellPower AS 'Spell Power',
		 '0' AS 'Hast %' ,
		 '0' AS 'Hit %',
		'0' AS 'Expertise',
		'0' AS 'Armor Pen %'
FROM characters.character_stats char_stats
INNER JOIN characters.characters ON characters.guid = char_stats.guid 

UNION ALL

SELECT 
       characters.name AS 'Owner' , 
       creature_template.name AS 'Bot name',
       npcbot_class_role.class_role AS 'NPCBot Classe',
       npcbot_stats.maxhealth AS 'HP',
		 npcbot_stats.maxpower AS 'Mana/Rage/Energy',
		 npcbot_stats.strength AS 'Strength',
		 npcbot_stats.agility AS 'Agility',
		 npcbot_stats.stamina AS 'Stamina',
		 npcbot_stats.intellect AS 'Intellect',
		 npcbot_stats.spirit AS 'Spirit',
		 npcbot_stats.armor AS 'Armor',
		 npcbot_stats.defense AS 'Defense', 
		 npcbot_stats.resHoly AS 'Holy resist',
		 npcbot_stats.resFire AS 'Fire resist',
		 npcbot_stats.resNature AS 'Nature resist',
		 npcbot_stats.resFrost AS 'Frost resist',
		 npcbot_stats.resShadow as 'Shadow resist',
		 npcbot_stats.resArcane AS 'Arcane resist',
		 round(npcbot_stats.blockPct,2) AS 'Block %',
		 round(npcbot_stats.dodgePct,2) AS 'Dodge %',
		 round(npcbot_stats.parryPct,2) AS 'Parry %',
		 round(npcbot_stats.critPct,2) AS 'Critical %',
		 npcbot_stats.attackPower AS 'Attack Power',
		 npcbot_stats.spellPower AS 'Spell Power',
		 round(npcbot_stats.hastePct,2) AS 'Hast %' ,
		 round(npcbot_stats.hitBonusPct,2) AS 'Hit %',
		 round(npcbot_stats.expertise,2) AS 'Expertise',
		 round(npcbot_stats.armorPenPct,2) AS 'Armor Pen %'
FROM characters.characters_npcbot_stats npcbot_stats
INNER JOIN characters.characters_npcbot npcbot ON npcbot_stats.entry = npcbot.entry
INNER JOIN world.creature_template ON creature_template.entry = npcbot.entry
INNER JOIN characters.characters ON characters.guid = npcbot.owner
left join characters.characters_npcbot_class_role npcbot_class_role on npcbot_class_role.entry = npcbot.entry ;
