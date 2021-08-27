-- 

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS Get_BOT_Role;

DELIMITER //

CREATE function Get_BOT_Role (role_mask INT)
RETURNS VARCHAR(20)


BEGIN
	DECLARE role VARCHAR(20);

	IF		role_mask & 8 THEN	SET role = 'Heal';
	ELSEIF	role_mask & 4 THEN	SET role = 'DPS';
	ELSEIF	role_mask & 1 THEN	SET role = 'Tank';
	END IF;

	RETURN role;

END //

DELIMITER ;
