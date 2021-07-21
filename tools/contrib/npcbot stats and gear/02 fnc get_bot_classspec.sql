-- 

DROP FUNCTION IF EXISTS Get_BOT_CLASSSPEC;

DELIMITER //

CREATE function Get_BOT_CLASSSPEC (bot_entry INT)
RETURNS VARCHAR(20)

BEGIN
	DECLARE BOT_CLASSSPEC VARCHAR(20);
	
	select 
	case 
		when creature_template.unit_class = 1 and characters_npcbot.spec IN (1,2) then 'Warrior DPS'
		when creature_template.unit_class = 1 and characters_npcbot.spec = 3 then 'Warrior Tank'
		when creature_template.unit_class = 2 and characters_npcbot.spec = 4 then 'Paladin Healer'
		when creature_template.unit_class = 2 and characters_npcbot.spec = 5 then 'Paladin Tank'
		when creature_template.unit_class = 2 and characters_npcbot.spec = 6 then 'Paladin DPS'
		when creature_template.unit_class = 3 then 'Hunter'
		when creature_template.unit_class = 4 then 'Rogue'
		when creature_template.unit_class = 5 and characters_npcbot.spec IN (13,14) then 'Priest Healer'
		when creature_template.unit_class = 5 and characters_npcbot.spec = 15 then 'Priest DPS'
		when creature_template.unit_class = 6 and Get_BOT_Role(characters_npcbot.roles) = 'DPS' then 'DK DPS'
		when creature_template.unit_class = 6 and Get_BOT_Role(characters_npcbot.roles) = 'Tank' then 'DK Tank'
		when creature_template.unit_class = 7 and characters_npcbot.spec = 19 then 'Shaman Elemental'
		when creature_template.unit_class = 7 and characters_npcbot.spec = 20 then 'Shaman Enhancement'
		when creature_template.unit_class = 7 and characters_npcbot.spec = 21 then 'Shaman Healer'
		when creature_template.unit_class = 8 then 'Mage'
		when creature_template.unit_class = 9 then 'Warlock'
		when creature_template.unit_class = 11 and characters_npcbot.spec = 28 then 'Druid Balance'
		when creature_template.unit_class = 11 and characters_npcbot.spec = 29 and Get_BOT_Role(characters_npcbot.roles) = 'DPS' then 'Druid Feral DPS'
		when creature_template.unit_class = 11 and characters_npcbot.spec = 29 and Get_BOT_Role(characters_npcbot.roles) = 'Tank' then 'Druid Feral Tank'
		when creature_template.unit_class = 11 and characters_npcbot.spec = 30  then 'Druid Healer'
	END INTO BOT_CLASSSPEC
	FROM characters.characters_npcbot
	INNER JOIN world.creature_template ON creature_template.entry = characters_npcbot.entry
   WHERE characters_npcbot.entry = bot_entry;
	
	RETURN BOT_CLASSSPEC;

END //

DELIMITER ;
