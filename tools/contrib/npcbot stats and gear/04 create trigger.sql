-- 

DROP TRIGGER IF EXISTS characters_npcbot_stat_update_class_role;

DELIMITER $$

CREATE TRIGGER characters_npcbot_stat_update_class_role AFTER UPDATE ON characters_npcbot 
FOR EACH ROW 
BEGIN
	if EXISTS (SELECT entry FROM characters_npcbot_class_role WHERE characters_npcbot_class_role.entry = NEW.entry)
	then
		UPDATE characters_npcbot_class_role
		SET characters_npcbot_class_role.class_role = Get_BOT_CLASSSPEC(new.entry)
		WHERE characters_npcbot_class_role.entry = NEW.entry;
	else
		INSERT INTO characters_npcbot_class_role (entry, class_role)
		VALUES (NEW.entry, Get_BOT_CLASSSPEC(new.entry));
	END if;
END $$

DELIMITER ;
