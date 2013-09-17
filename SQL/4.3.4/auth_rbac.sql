SET @NPCB_PERM := '1000';

DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @NPCB_PERM AND @NPCB_PERM+9;
INSERT INTO `rbac_permissions` (`id`,`name`) VALUES
(@NPCB_PERM+0,'npcbot'),
(@NPCB_PERM+1,'npcbot add'),
(@NPCB_PERM+2,'npcbot remove'),
(@NPCB_PERM+3,'npcbot reset'),
(@NPCB_PERM+4,'npcbot command'),
(@NPCB_PERM+5,'npcbot distance'),
(@NPCB_PERM+6,'npcbot info'),
(@NPCB_PERM+7,'npcbot helper'),
(@NPCB_PERM+8,'npcbot revive'),
(@NPCB_PERM+9,'maintank (mt)');

DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @NPCB_PERM AND @NPCB_PERM+9;
INSERT INTO `rbac_role_permissions` (`roleId`,`permissionId`) VALUES
('1',@NPCB_PERM+0),
('1',@NPCB_PERM+1),
('1',@NPCB_PERM+2),
('1',@NPCB_PERM+3),
('1',@NPCB_PERM+4),
('1',@NPCB_PERM+5),
('1',@NPCB_PERM+6),
('1',@NPCB_PERM+7),
('2',@NPCB_PERM+8),
('1',@NPCB_PERM+9);
