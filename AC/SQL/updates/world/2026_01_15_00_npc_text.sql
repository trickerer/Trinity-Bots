--
SET @LOCALIZED_STRINGS_START = 70694;
SET @LOCALIZED_STRINGS_END   = 70700;

DELETE FROM `npc_text` WHERE ID BETWEEN @LOCALIZED_STRINGS_START and @LOCALIZED_STRINGS_END;
INSERT INTO `npc_text` (`ID`,`text0_0`,`VerifiedBuild`) VALUES
(@LOCALIZED_STRINGS_START+0,'Manage ownership...','-1'),
(@LOCALIZED_STRINGS_START+1,'<Add owner>','-1'),
(@LOCALIZED_STRINGS_START+2,'WARNING: by sharing ownership over your bot you give another player FULL control over their inventory, roles and all other settings (including sharing them with others)','-1'),
(@LOCALIZED_STRINGS_START+3,'<Remove owner>','-1'),
(@LOCALIZED_STRINGS_START+4,'Owners limit exceeded','-1'),
(@LOCALIZED_STRINGS_START+5,'Shared with','-1'),
(@LOCALIZED_STRINGS_START+6,'Owner','-1');
