DROP TABLE IF EXISTS `character_npcbot`;
CREATE TABLE `character_npcbot` (
  `owner` int(10) default NULL,
  `entry` int(10) default NULL,
  `race` tinyint(3) default NULL,
  `class` tinyint(3) default NULL,
  `istank` tinyint(3) default NULL,
  `equipMhEx` int(10) default NULL,
  `equipOhEx` int(10) default NULL,
  `equipRhEx` int(10) default NULL,
  `active` tinyint(3) default NULL,
  PRIMARY KEY  (`owner`,`entry`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;
