DELIMITER $$
CREATE PROCEDURE tmpAddColumnIfNotExists( IN p_column_name    VARCHAR(64), IN p_add_statement  TEXT )
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
          AND TABLE_NAME = 'creature_template_npcbot_wander_nodes'
          AND COLUMN_NAME = p_column_name
    ) THEN
        SET @sql = CONCAT( 'ALTER TABLE `creature_template_npcbot_wander_nodes` ', p_add_statement );

        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$
DELIMITER ;

CALL tmpAddColumnIfNotExists( 'minwaittime', 'ADD `minwaittime` INT UNSIGNED NOT NULL DEFAULT 3000 AFTER `maxlevel`' );
CALL tmpAddColumnIfNotExists( 'maxwaittime', 'ADD `maxwaittime` INT UNSIGNED NOT NULL DEFAULT 7000 AFTER `minwaittime`' );
CALL tmpAddColumnIfNotExists( 'proximity', 'ADD `proximity` FLOAT NOT NULL DEFAULT 0 AFTER `maxwaittime`' );

DROP PROCEDURE tmpAddColumnIfNotExists;
