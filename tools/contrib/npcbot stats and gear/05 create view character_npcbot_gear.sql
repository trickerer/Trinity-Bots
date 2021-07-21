-- 

DROP VIEW IF EXISTS vw_characters_npcbot_gear;

CREATE VIEW vw_characters_npcbot_gear AS


SELECT  
       characters.name AS 'Character Name', 
		 creature_template.name AS 'NPCBot Name',
		IFNULL(MhEx_n.ItemLevel,0) + IFNULL(OhEx_n.ItemLevel,0) + IFNULL(RhEx_n.ItemLevel,0) + IFNULL(Head_n.ItemLevel,0) + IFNULL(Shoulders_n.ItemLevel,0) + IFNULL(Chest_n.ItemLevel,0) + IFNULL(Waist_n.ItemLevel,0) + IFNULL(Legs_n.ItemLevel,0) + IFNULL(Feet_n.ItemLevel,0) + IFNULL(Wrist_n.ItemLevel,0) + IFNULL(Hands_n.ItemLevel,0) + IFNULL(Back_n.ItemLevel,0) +	IFNULL(Finger1_n.ItemLevel,0) + IFNULL(Finger2_n.ItemLevel,0) + IFNULL(Trinket1_n.ItemLevel,0) + IFNULL(Trinket2_n.ItemLevel,0) + IFNULL(Neck_n.ItemLevel,0) AS 'Gear Score',
		characters_npcbot_class_role.class_role AS 'NPCBot Classe',


		CASE
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (MhEx.itemEntry in (50070,50412,50425)) THEN CONCAT('LBis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (MhEx.itemEntry in (50730,49623,50672,50737,50735)) THEN CONCAT('Bis ',MhEx_n.ItemLevel,' ',MhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank')) AND (MhEx.itemEntry in (49997)) THEN CONCAT('LBis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank')) AND (MhEx.itemEntry in (50738)) THEN CONCAT('Bis ',MhEx_n.ItemLevel,' ',MhEx_n.name)			
			WHEN (characters_npcbot_class_role.class_role IN ('DK Tank')) AND (MhEx.itemEntry in (50730)) THEN CONCAT('LBis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('DK Tank')) AND (MhEx.itemEntry in (50070,49623)) THEN CONCAT('Bis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (MhEx.itemEntry in (50428)) THEN CONCAT('LBis ',MhEx_n.ItemLevel,' ',MhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (MhEx.itemEntry in (50734)) THEN CONCAT('Bis ',MhEx_n.ItemLevel,' ',MhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock')) AND (MhEx.itemEntry in (50427)) THEN CONCAT('LBis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock')) AND (MhEx.itemEntry in (50732)) THEN CONCAT('Bis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (MhEx.itemEntry in (50428,50427,50028,46017,50429)) THEN CONCAT('LBis ',MhEx_n.ItemLevel,' ',MhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (MhEx.itemEntry in (50734,50732,50685,70731)) THEN CONCAT('Bis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (MhEx.itemEntry = 50426) THEN CONCAT('LBis ',MhEx_n.ItemLevel,' ',MhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (MhEx.itemEntry = 50735) THEN CONCAT('Bis ',MhEx_n.ItemLevel,' ',MhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Druid Feral DPS')) AND (MhEx.itemEntry in (50423)) THEN CONCAT('LBis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Druid Feral DPS')) AND (MhEx.itemEntry in (50735)) THEN CONCAT('Bis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Rogue', 'Shaman Enhancement')) AND (MhEx.itemEntry in (50426,50012)) THEN CONCAT('LBis ',MhEx_n.ItemLevel,' ',MhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Rogue', 'Shaman Enhancement')) AND (MhEx.itemEntry in (50736,50737)) THEN CONCAT('Bis ',MhEx_n.ItemLevel,' ',MhEx_n.name)			
		ELSE 
			CONCAT(MhEx_n.ItemLevel,' ',MhEx_n.name) 
		END AS '01 Main Hand',
		CASE 
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (OhEx.itemEntry in (49919)) THEN CONCAT('LBis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (OhEx.itemEntry in (50603)) THEN CONCAT('Bis ',OhEx_n.ItemLevel,' ',OhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('DK DPS')) AND (OhEx.itemEntry in (50412,50012)) THEN CONCAT('LBis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('DK DPS')) AND (OhEx.itemEntry in (50737,50672)) THEN CONCAT('Bis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank')) AND (OhEx.itemEntry in (50065)) THEN CONCAT('LBis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank')) AND (OhEx.itemEntry in (50729)) THEN CONCAT('Bis ',OhEx_n.ItemLevel,' ',OhEx_n.name)			
			WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Shaman Healer', 'Shaman Elemental')) AND (OhEx.itemEntry in (49976)) THEN CONCAT('LBis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Shaman Healer', 'Shaman Elemental')) AND (OhEx.itemEntry in (50616)) THEN CONCAT('Bis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Druid Balance', 'Priest DPS', 'Priest Healer')) AND (OhEx.itemEntry in (50173)) THEN CONCAT('LBis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Druid Balance', 'Priest DPS', 'Priest Healer')) AND (OhEx.itemEntry in (50719)) THEN CONCAT('Bis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Druid Healer')) AND (OhEx.itemEntry in (50423)) THEN CONCAT('LBis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Druid Healer')) AND (OhEx.itemEntry in (50635)) THEN CONCAT('Bis ',OhEx_n.ItemLevel,' ',OhEx_n.name)
			
			WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (OhEx.itemEntry in (50654,50737)) THEN CONCAT('Bis ',OhEx_n.ItemLevel,' ',OhEx_n.name) 
		ELSE 
			CONCAT(OhEx_n.ItemLevel,' ',OhEx_n.name) 
		END AS '02 Off Hand',
		CASE 
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (RhEx.itemEntry in (49981)) THEN CONCAT('LBis ',RhEx_n.ItemLevel,' ',RhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (RhEx.itemEntry in (50455,50733)) THEN CONCAT('Bis ',RhEx_n.ItemLevel,' ',RhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (RhEx.itemEntry in (50462,51561)) THEN CONCAT('LBis ',RhEx_n.ItemLevel,' ',RhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (RhEx.itemEntry in (51834)) THEN CONCAT('Bis ',RhEx_n.ItemLevel,' ',RhEx_n.name) 
			WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Priest DPS')) AND (RhEx.itemEntry in (50033)) THEN CONCAT('LBis ',RhEx_n.ItemLevel,' ',RhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Priest DPS')) AND (RhEx.itemEntry in (50684)) THEN CONCAT('Bis ',RhEx_n.ItemLevel,' ',RhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (RhEx.itemEntry in (50472)) THEN CONCAT('LBis ',RhEx_n.ItemLevel,' ',RhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (RhEx.itemEntry in (50631)) THEN CONCAT('Bis ',RhEx_n.ItemLevel,' ',RhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Shaman Healer', 'Druid Healer', 'Shaman Elemental')) AND (RhEx.itemEntry in (50458,50454,40705)) THEN CONCAT('Bis ',RhEx_n.ItemLevel,' ',RhEx_n.name)
			WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (RhEx.itemEntry = 50456) THEN CONCAT('Bis ',RhEx_n.ItemLevel,' ',RhEx_n.name)
			
			WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (RhEx.itemEntry in (50733,50456,50463)) THEN CONCAT('Bis ',RhEx_n.ItemLevel,' ',RhEx_n.name) 
		ELSE 
			CONCAT(RhEx_n.ItemLevel,' ',RhEx_n.name) 
		END AS '03 Range',
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Head.itemEntry in (51212,51127,51162)) THEN CONCAT('LBis ',Head_n.ItemLevel,' ',Head_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Head.itemEntry in (51227,51312,51277)) THEN CONCAT('Bis ',Head_n.ItemLevel,' ',Head_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank')) AND (Head.itemEntry in (49986)) THEN CONCAT('LBis ',Head_n.ItemLevel,' ',Head_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank')) AND (Head.itemEntry in (50640)) THEN CONCAT('Bis ',Head_n.ItemLevel,' ',Head_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('DK Tank')) AND (Head.itemEntry in (51133)) THEN CONCAT('LBis ',Head_n.ItemLevel,' ',Head_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('DK Tank')) AND (Head.itemEntry in (51306)) THEN CONCAT('Bis ',Head_n.ItemLevel,' ',Head_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Head.itemEntry in (51149,51158,51184,51202,51208)) THEN CONCAT('LBis ',Head_n.ItemLevel,' ',Head_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Head.itemEntry in (51290,51255,51237,51231,51281)) THEN CONCAT('Bis ',Head_n.ItemLevel,' ',Head_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Head.itemEntry in (51137,51167,51178,51192)) THEN CONCAT('LBis ',Head_n.ItemLevel,' ',Head_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Head.itemEntry in (51302,51272,51261,51247)) THEN CONCAT('Bis ',Head_n.ItemLevel,' ',Head_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS','Druid Feral Tank', 'Shaman Enhancement')) AND (Head.itemEntry in (51143,51153,51187,51197)) THEN CONCAT('LBis ',Head_n.ItemLevel,' ',Head_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS','Druid Feral Tank', 'Shaman Enhancement')) AND (Head.itemEntry in (51286,51296,51252,51242)) THEN CONCAT('Bis ',Head_n.ItemLevel,' ',Head_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue')) AND (Head.itemEntry in (50073)) THEN CONCAT('LBis ',Head_n.ItemLevel,' ',Head_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue')) AND (Head.itemEntry in (50713)) THEN CONCAT('Bis ',Head_n.ItemLevel,' ',Head_n.name)
	ELSE 
		CONCAT(Head_n.ItemLevel,' ',Head_n.name) 
	END AS '04 Head',
 	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Shoulders.itemEntry in (51210,51125,51160)) THEN CONCAT('LBis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Shoulders.itemEntry in (51229,51314,51279)) THEN CONCAT('Bis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank')) AND (Shoulders.itemEntry in (51383)) THEN CONCAT('LBis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank')) AND (Shoulders.itemEntry in (51847)) THEN CONCAT('Bis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Tank')) AND (Shoulders.itemEntry in (50003)) THEN CONCAT('LBis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Tank')) AND (Shoulders.itemEntry in (50660)) THEN CONCAT('Bis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('DK Tank')) AND (Shoulders.itemEntry in (51130)) THEN CONCAT('LBis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('DK Tank')) AND (Shoulders.itemEntry in (51309)) THEN CONCAT('Bis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Shoulders.itemEntry in (51147,51155,51182,51204,51205)) THEN CONCAT('LBis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Shoulders.itemEntry in (51292,51284,51257,51235,51234)) THEN CONCAT('Bis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Shoulders.itemEntry in (51135,51166,51175,51194)) THEN CONCAT('LBis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Shoulders.itemEntry in (51245,51304,51273,51264)) THEN CONCAT('Bis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue')) AND (Shoulders.itemEntry = 49987) THEN CONCAT('LBis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue')) AND (Shoulders.itemEntry = 50646) THEN CONCAT('Bis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Druid Feral Tank', 'Shaman Enhancement')) AND (Shoulders.itemEntry in (51140,51151,51185,51199)) THEN CONCAT('LBis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Druid Feral Tank', 'Shaman Enhancement')) AND (Shoulders.itemEntry in (51288,51299,51254,51240)) THEN CONCAT('Bis ',Shoulders_n.ItemLevel,' ',Shoulders_n.name) 
	ELSE 
		CONCAT(Shoulders_n.ItemLevel,' ',Shoulders_n.name) 
	END AS '05 Shoulder',
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Chest.itemEntry in (51214,51129,51164)) THEN CONCAT('LBis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Chest.itemEntry in (51225,51310,51275)) THEN CONCAT('Bis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Chest.itemEntry in (51134,51174,51219)) THEN CONCAT('LBis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Chest.itemEntry in (51220,51265,51305)) THEN CONCAT('Bis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Chest.itemEntry in (51145,61156,51180,51200,51206)) THEN CONCAT('LBis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Chest.itemEntry in (51294,51259,51239,51233,51283)) THEN CONCAT('Bis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer')) AND (Chest.itemEntry in (50027,51176,51190)) THEN CONCAT('LBis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer')) AND (Chest.itemEntry in (50680,51263,51249)) THEN CONCAT('Bis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Chest.itemEntry in (50172)) THEN CONCAT('LBis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Chest.itemEntry in (50717)) THEN CONCAT('Bis ',Chest_n.ItemLevel,' ',Chest_n.name)
		when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank', 'Rogue')) AND (Chest.itemEntry = 50001) THEN CONCAT('LBis ',Chest_n.ItemLevel,' ',Chest_n.name) 
		when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank', 'Rogue')) AND (Chest.itemEntry = 50656) THEN CONCAT('Bis ',Chest_n.ItemLevel,' ',Chest_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (Chest.itemEntry in (51141,51150,51189)) THEN CONCAT('LBis ',Chest_n.ItemLevel,' ',Chest_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (Chest.itemEntry in (51289,51298,51250)) THEN CONCAT('Bis ',Chest_n.ItemLevel,' ',Chest_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Enhancement')) AND (Chest.itemEntry in (50038)) THEN CONCAT('LBis ',Chest_n.ItemLevel,' ',Chest_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Enhancement')) AND (Chest.itemEntry in (50689)) THEN CONCAT('Bis ',Chest_n.ItemLevel,' ',Chest_n.name) 		
	ELSE 
		CONCAT(Chest_n.ItemLevel,' ',Chest_n.name) 
	END AS '06 Chest',
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'DK DPS')) AND (Waist.itemEntry in (50187)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'DK DPS')) AND (Waist.itemEntry in (50620)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Waist.itemEntry in (50067)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Waist.itemEntry in (50707)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank')) AND (Waist.itemEntry in (50036)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank')) AND (Waist.itemEntry in (50691)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Tank', 'DK Tank')) AND (Waist.itemEntry in (50991)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)		
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Waist.itemEntry in (49978,53488)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Waist.itemEntry in (54587,50613)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Healer')) AND (Waist.itemEntry in (50069)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Healer')) AND (Waist.itemEntry in (50705)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Shaman Healer')) AND (Waist.itemEntry in (53488)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Shaman Healer')) AND (Waist.itemEntry in (54587)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (Waist.itemEntry in (49978,50063)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (Waist.itemEntry in (50613,50702)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank','Rogue')) AND (Waist.itemEntry = 50067) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank', 'Druid Feral DPS','Rogue')) AND (Waist.itemEntry = 50707) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral DPS')) AND (Waist.itemEntry IN (50067,50995)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Shaman Enhancement')) AND (Waist.itemEntry in (50413)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Shaman Enhancement')) AND (Waist.itemEntry in (50688)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue')) AND (Waist.itemEntry in (47107)) THEN CONCAT('LBis ',Waist_n.ItemLevel,' ',Waist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue')) AND (Waist.itemEntry in (47112)) THEN CONCAT('Bis ',Waist_n.ItemLevel,' ',Waist_n.name)
	ELSE 
		CONCAT(Waist_n.ItemLevel,' ',Waist_n.name) 
	END AS '07 Waist',
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Legs.itemEntry in (51211,51126,51161)) THEN CONCAT('LBis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Legs.itemEntry in (51228,51313,51278)) THEN CONCAT('Bis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'DK Tank')) AND (Legs.itemEntry in (49964)) THEN CONCAT('LBis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'DK Tank')) AND (Legs.itemEntry in (50612)) THEN CONCAT('Bis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Tank')) AND (Legs.itemEntry in (5904)) THEN CONCAT('Bis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Legs.itemEntry = 50056) THEN CONCAT('LBis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Legs.itemEntry = 50694) THEN CONCAT('Bis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Legs.itemEntry in (51136,50056,51177,51193)) THEN CONCAT('LBis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Legs.itemEntry in (51246,51303,51262,50694)) THEN CONCAT('Bis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (Legs.itemEntry in (51142,51186,51198)) THEN CONCAT('LBis ',Legs_n.ItemLevel,' ',Legs_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (Legs.itemEntry in (51297,51253,51241)) THEN CONCAT('Bis ',Legs_n.ItemLevel,' ',Legs_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter')) AND (Legs.itemEntry in (49988)) THEN CONCAT('LBis ',Legs_n.ItemLevel,' ',Legs_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter')) AND (Legs.itemEntry in (50645)) THEN CONCAT('Bis ',Legs_n.ItemLevel,' ',Legs_n.name)
	ELSE 
		CONCAT(Legs_n.ItemLevel,' ',Legs_n.name) 
	END AS '08 Legs',
	CASE
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (Feet.itemEntry IN (53125,49983)) THEN CONCAT('LBis ',Feet_n.ItemLevel,' ',Feet_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (Feet.itemEntry IN (50639,54578)) THEN CONCAT('Bis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS', 'DK DPS')) AND (Feet.itemEntry IN (53125)) THEN CONCAT('LBis ',Feet_n.ItemLevel,' ',Feet_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS', 'DK DPS')) AND (Feet.itemEntry IN (54578)) THEN CONCAT('Bis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Feet.itemEntry in (53129)) THEN CONCAT('LBis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Feet.itemEntry in (54579)) THEN CONCAT('Bis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS', 'Priest Healer', 'Shaman Healer')) AND (Feet.itemEntry = 50062) THEN CONCAT('LBis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS', 'Priest Healer', 'Shaman Healer')) AND (Feet.itemEntry = 50699) THEN CONCAT('Bis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Feet.itemEntry in (53487)) THEN CONCAT('LBis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Feet.itemEntry in (54586)) THEN CONCAT('Bis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Healer')) AND (Feet.itemEntry in (50009)) THEN CONCAT('LBis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Healer')) AND (Feet.itemEntry in (50665)) THEN CONCAT('Bis ',Feet_n.ItemLevel,' ',Feet_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank', 'Druid Feral DPS')) AND (Feet.itemEntry in (49895,49950)) THEN CONCAT('LBis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank', 'Druid Feral DPS','Rogue')) AND (Feet.itemEntry = 50607) THEN CONCAT('Bis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue')) AND (Feet.itemEntry = 49950) THEN CONCAT('LBis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Shaman Enhancement')) AND (Feet.itemEntry in (53127)) THEN CONCAT('LBis ',Feet_n.ItemLevel,' ',Feet_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Shaman Enhancement')) AND (Feet.itemEntry in (54577)) THEN CONCAT('Bis ',Feet_n.ItemLevel,' ',Feet_n.name)
	ELSE 
		CONCAT(Feet_n.ItemLevel,' ',Feet_n.name) 
	END AS '09 Feet',
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Wrist.itemEntry in (50333,50002,53126)) THEN CONCAT('LBis ',Wrist_n.ItemLevel,' ',Wrist_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Wrist.itemEntry in (50670,50659,54580)) THEN CONCAT('Bis ',Wrist_n.ItemLevel,' ',Wrist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Wrist.itemEntry in (50802)) THEN CONCAT('LBis ',Wrist_n.ItemLevel,' ',Wrist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Wrist.itemEntry in (51901)) THEN CONCAT('Bis ',Wrist_n.ItemLevel,' ',Wrist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS', 'Paladin Healer', 'Priest Healer')) AND (Wrist.itemEntry = 53486) THEN CONCAT('LBis ',Wrist_n.ItemLevel,' ',Wrist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS', 'Paladin Healer', 'Priest Healer')) AND (Wrist.itemEntry = 54582) THEN CONCAT('Bis ',Wrist_n.ItemLevel,' ',Wrist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Healer')) AND (Wrist.itemEntry in (50417,53134)) THEN CONCAT('LBis ',Wrist_n.ItemLevel,' ',Wrist_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Healer')) AND (Wrist.itemEntry in (50630,54584)) THEN CONCAT('Bis ',Wrist_n.ItemLevel,' ',Wrist_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Healer')) AND (Wrist.itemEntry in (50030)) THEN CONCAT('LBis ',Wrist_n.ItemLevel,' ',Wrist_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Healer')) AND (Wrist.itemEntry in (50687)) THEN CONCAT('Bis ',Wrist_n.ItemLevel,' ',Wrist_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank','Rogue', 'Druid Feral DPS')) AND (Wrist.itemEntry in (50333,53126)) THEN CONCAT('LBis ',Wrist_n.ItemLevel,' ',Wrist_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank','Rogue', 'Druid Feral DPS')) AND (Wrist.itemEntry in (50670,54580)) THEN CONCAT('Bis ',Wrist_n.ItemLevel,' ',Wrist_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter',  'Shaman Enhancement')) AND (Wrist.itemEntry in (50000)) THEN CONCAT('LBis ',Wrist_n.ItemLevel,' ',Wrist_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter',  'Shaman Enhancement')) AND (Wrist.itemEntry in (50655)) THEN CONCAT('Bis ',Wrist_n.ItemLevel,' ',Wrist_n.name)
	ELSE 
		CONCAT(Wrist_n.ItemLevel,' ',Wrist_n.name) 
	END AS '10 Wrist', 
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (Hands.itemEntry in (50021)) THEN CONCAT('LBis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (Hands.itemEntry in (50675)) THEN CONCAT('Bis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS', 'DK DPS')) AND (Hands.itemEntry in (50037)) THEN CONCAT('LBis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS', 'DK DPS')) AND (Hands.itemEntry in (50690)) THEN CONCAT('Bis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Hands.itemEntry in (51132,51172,51217)) THEN CONCAT('LBis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Hands.itemEntry in (51222,51267,51307)) THEN CONCAT('Bis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Hands.itemEntry in (51148,51159,51183,51201,51209)) THEN CONCAT('LBis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Hands.itemEntry in (51291,51256,51238,51230,51280)) THEN CONCAT('Bis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Druid Healer')) AND (Hands.itemEntry in (49995,51179,51138)) THEN CONCAT('LBis ',Hands_n.ItemLevel,' ',Hands_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Druid Healer')) AND (Hands.itemEntry in (50650,51260,51301)) THEN CONCAT('Bis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (Hands.itemEntry in (50176)) THEN CONCAT('LBis ',Hands_n.ItemLevel,' ',Hands_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (Hands.itemEntry in (50722)) THEN CONCAT('Bis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Healer')) AND (Hands.itemEntry in (50064)) THEN CONCAT('LBis ',Hands_n.ItemLevel,' ',Hands_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Healer')) AND (Hands.itemEntry in (50703)) THEN CONCAT('Bis ',Hands_n.ItemLevel,' ',Hands_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank', 'Hunter', 'Rogue', 'Shaman Enhancement' )) AND (Hands.itemEntry in (51144,51154,51188,51196)) THEN CONCAT('LBis ',Hands_n.ItemLevel,' ',Hands_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank', 'Hunter', 'Rogue', 'Shaman Enhancement' )) AND (Hands.itemEntry in (51295,51285,51251,51243)) THEN CONCAT('Bis ',Hands_n.ItemLevel,' ',Hands_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue', 'Druid Feral DPS' )) AND (Hands.itemEntry in (50021)) THEN CONCAT('LBis ',Hands_n.ItemLevel,' ',Hands_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue', 'Druid Feral DPS' )) AND (Hands.itemEntry in (50675)) THEN CONCAT('Bis ',Hands_n.ItemLevel,' ',Hands_n.name) 
	ELSE 
		CONCAT(Hands_n.ItemLevel,' ',Hands_n.name) 
	END AS '11 Hand', 
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'DK DPS')) AND (Back.itemEntry in (50019,47545)) THEN CONCAT('LBis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'DK DPS')) AND (Back.itemEntry in (50677)) THEN CONCAT('Bis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Back.itemEntry in (49998)) THEN CONCAT('LBis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Back.itemEntry in (50653)) THEN CONCAT('Bis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Back.itemEntry = 50466) THEN CONCAT('Bis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Back.itemEntry = 53489) THEN CONCAT('LBis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Back.itemEntry = 54583) THEN CONCAT('Bis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer')) AND (Back.itemEntry in (53489)) THEN CONCAT('LBis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer')) AND (Back.itemEntry in (54583)) THEN CONCAT('Bis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Back.itemEntry in (50014)) THEN CONCAT('LBis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Back.itemEntry in (50668)) THEN CONCAT('Bis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Back.itemEntry = 50466) THEN CONCAT('Bis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Rogue')) AND (Back.itemEntry = 50470) THEN CONCAT('LBis ',Back_n.ItemLevel,' ',Back_n.name)		
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (Back.itemEntry in (49998,47545)) THEN CONCAT('LBis ',Back_n.ItemLevel,' ',Back_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (Back.itemEntry in (50653)) THEN CONCAT('LBis ',Back_n.ItemLevel,' ',Back_n.name) 
	ELSE 
		CONCAT(Back_n.ItemLevel,' ',Back_n.name) 
	END AS '12 Back', 		 
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (Finger1.itemEntry in (52571,49999)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (Finger1.itemEntry in (52572,50657)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Finger1.itemEntry in (52571,50401,50414,53133)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Finger1.itemEntry in (52572,50402,50693,54576)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('DK DPS')) AND (Finger1.itemEntry in (52571,50414,49999)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('DK DPS')) AND (Finger1.itemEntry in (52572,50693,50657)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Finger1.itemEntry in (50403,50185)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Finger1.itemEntry in (50622,50404)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Finger1.itemEntry in (50397,50170,49977,50008)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Finger1.itemEntry in (50398,50714,50614,50664)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Finger1.itemEntry in (50399)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Finger1.itemEntry in (50400)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Finger1.itemEntry in (50424)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Finger1.itemEntry in (50636)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (Finger1.itemEntry in (49990)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (Finger1.itemEntry in (50664)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Finger1.itemEntry in (53490)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Finger1.itemEntry in (54585)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer','Shaman Healer')) AND (Finger1.itemEntry in (50008)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer','Shaman Healer')) AND (Finger1.itemEntry in (50664)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Finger1.itemEntry in (50403,50185,50025,53133)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Finger1.itemEntry in (50404,50622,50678,54576)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral DPS')) AND (Finger1.itemEntry in (50401,50186,53133)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral DPS')) AND (Finger1.itemEntry in (50402,40618,54578)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue')) AND (Finger1.itemEntry in (50401,50186,53133)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue')) AND (Finger1.itemEntry in (50402,50618,54576)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Enhancement')) AND (Finger1.itemEntry in (50401,50025)) THEN CONCAT('LBis ',Finger1_n.ItemLevel,' ',Finger1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Enhancement')) AND (Finger1.itemEntry in (50402,50678)) THEN CONCAT('Bis ',Finger1_n.ItemLevel,' ',Finger1_n.name) 
	ELSE 
		CONCAT(Finger1_n.ItemLevel,' ',Finger1_n.name) 
	END AS '13 Finger 1',
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (Finger2.itemEntry in (52571,49999)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS')) AND (Finger2.itemEntry in (52572,50657)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Finger2.itemEntry in (52571,50401,50414,53133)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Finger2.itemEntry in (52572,50402,50693,54576)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('DK DPS')) AND (Finger2.itemEntry in (52571,50414,49999)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('DK DPS')) AND (Finger2.itemEntry in (52572,50693,50657)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Finger2.itemEntry in (50403,50185)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Finger2.itemEntry in (50622,50404)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Finger2.itemEntry in (50397,50170,49977,50008)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Finger2.itemEntry in (50398,50714,50614,50664)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Finger2.itemEntry in (50399)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Finger2.itemEntry in (50400)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Finger2.itemEntry in (50424)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Finger2.itemEntry in (50636)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (Finger2.itemEntry in (49990)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer')) AND (Finger2.itemEntry in (50664)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Finger2.itemEntry in (53490)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Finger2.itemEntry in (54585)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer','Shaman Healer')) AND (Finger2.itemEntry in (50008)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer','Shaman Healer')) AND (Finger2.itemEntry in (50664)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Finger2.itemEntry in (50403,50185,50025,53133)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Finger2.itemEntry in (50404,50622,50678,54576)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral DPS')) AND (Finger2.itemEntry in (50401,50186,53133)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral DPS')) AND (Finger2.itemEntry in (50402,40618,54578)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue')) AND (Finger2.itemEntry in (50401,50186,53133)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue')) AND (Finger2.itemEntry in (50402,50618,54576)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Enhancement')) AND (Finger2.itemEntry in (50401,50025)) THEN CONCAT('LBis ',Finger2_n.ItemLevel,' ',Finger2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Shaman Enhancement')) AND (Finger2.itemEntry in (50402,50678)) THEN CONCAT('Bis ',Finger2_n.ItemLevel,' ',Finger2_n.name)  
	ELSE
		CONCAT(Finger2_n.ItemLevel,' ',Finger2_n.name) 
	END AS '14 Finger 2',
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'DK DPS')) AND (Trinket1.itemEntry in (50362,54569)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'DK DPS')) AND (Trinket1.itemEntry in (50363,54590)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Trinket1.itemEntry in (54569,50351)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Trinket1.itemEntry in (54590,50706)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'DK Tank')) AND (Trinket1.itemEntry in (50352,50356,54571,50361,50341)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'DK Tank')) AND (Trinket1.itemEntry in (50349,54591,50364,50344)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Tank')) AND (Trinket1.itemEntry in (54571,50361)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Tank')) AND (Trinket1.itemEntry in (54591,50364)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Trinket1.itemEntry in (54572,50360,50353)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Trinket1.itemEntry in (54588,50365,50348)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Trinket1.itemEntry in (50359,54573)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Trinket1.itemEntry in (50366,54589)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Trinket1.itemEntry in (56051,47041,48724)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Trinket1.itemEntry in (47059)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Trinket1.itemEntry in (50356,50361,50341)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Trinket1.itemEntry in (50364,50344)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter','Druid Feral DPS', 'Rogue')) AND (Trinket1.itemEntry in (50362,64569)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter','Druid Feral DPS', 'Rogue')) AND (Trinket1.itemEntry in (50363,54590)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ( 'Rogue', 'Shaman Enhancement')) AND (Trinket1.itemEntry in (54569,50351)) THEN CONCAT('LBis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ( 'Rogue', 'Shaman Enhancement')) AND (Trinket1.itemEntry in (54590,50506)) THEN CONCAT('Bis ',Trinket1_n.ItemLevel,' ',Trinket1_n.name) 
	ELSE 
		CONCAT(Trinket1_n.ItemLevel,' ',Trinket1_n.name) 
	END AS '15 Trincket 1',
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'DK DPS')) AND (Trinket2.itemEntry in (50362,54569)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'DK DPS')) AND (Trinket2.itemEntry in (50363,54590)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Trinket2.itemEntry in (54569,50351)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin DPS')) AND (Trinket2.itemEntry in (54590,50706)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'DK Tank')) AND (Trinket2.itemEntry in (50352,50356,54571,50361,50341)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'DK Tank')) AND (Trinket2.itemEntry in (50349,54591,50364,50344)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Tank')) AND (Trinket2.itemEntry in (54571,50361)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Tank')) AND (Trinket2.itemEntry in (54591,50364)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Trinket2.itemEntry in (54572,50360,50353)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Trinket2.itemEntry in (54588,50365,50348)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Trinket2.itemEntry in (50359,54573)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Shaman Healer', 'Druid Healer')) AND (Trinket2.itemEntry in (50366,54589)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Trinket2.itemEntry in (56051,47041,48724)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer')) AND (Trinket2.itemEntry in (47059)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Trinket2.itemEntry in (50356,50361,50341)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Trinket2.itemEntry in (50364,50344)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter','Druid Feral DPS', 'Rogue')) AND (Trinket2.itemEntry in (50362,64569)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter','Druid Feral DPS', 'Rogue')) AND (Trinket2.itemEntry in (50363,54590)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ( 'Rogue', 'Shaman Enhancement')) AND (Trinket2.itemEntry in (54569,50351)) THEN CONCAT('LBis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ( 'Rogue', 'Shaman Enhancement')) AND (Trinket2.itemEntry in (54590,50506)) THEN CONCAT('Bis ',Trinket2_n.ItemLevel,' ',Trinket2_n.name) 
	ELSE 
		CONCAT(Trinket2_n.ItemLevel,' ',Trinket2_n.name) 
	END AS '16 Trincket 2', 
	CASE 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Neck.itemEntry in (53132)) THEN CONCAT('LBis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) AND (Neck.itemEntry in (54581)) THEN CONCAT('Bis ',Neck_n.ItemLevel,' ',Neck_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Neck.itemEntry in (50023)) THEN CONCAT('LBis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) AND (Neck.itemEntry in (50682)) THEN CONCAT('Bis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Neck.itemEntry = 50182) THEN CONCAT('LBis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) AND (Neck.itemEntry = 50724) THEN CONCAT('Bis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer')) AND (Neck.itemEntry in (50182)) THEN CONCAT('LBis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Shaman Healer')) AND (Neck.itemEntry in (50724)) THEN CONCAT('Bis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Neck.itemEntry in (49975)) THEN CONCAT('LBis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Priest Healer', 'Druid Healer')) AND (Neck.itemEntry in (50609)) THEN CONCAT('Bis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Neck.itemEntry = 50023) THEN CONCAT('LBis ',Neck_n.ItemLevel,' ',Neck_n.name) 
		WHEN (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) AND (Neck.itemEntry = 50682) THEN CONCAT('Bis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (Neck.itemEntry = 50421) THEN CONCAT('LBis ',Neck_n.ItemLevel,' ',Neck_n.name)
		WHEN (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) AND (Neck.itemEntry = 50633) THEN CONCAT('Bis ',Neck_n.ItemLevel,' ',Neck_n.name) 
	ELSE 
		CONCAT(Neck_n.ItemLevel,' ',Neck_n.name) 
	END AS '17 Neck', 
		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when MhEx_n.ItemLevel >=200 AND MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(MhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 264 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then 
								case
									when MhEx_n.ItemLevel >=200 AND MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(MhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 264 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then
								case
									when MhEx_n.ItemLevel >=200 AND MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(MhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 264 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then 
						  		case
						  			when MhEx_n.ItemLevel >=200 AND MhEx_n.ItemLevel < 251 then '3 Heroic'
						  			when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(MhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 264 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer')) then 
			 		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then
								case
									when MhEx_n.ItemLevel >=200 AND MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(MhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 264 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then
								case
									when MhEx_n.ItemLevel >=200 AND MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(MhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 264 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
			 
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when MhEx_n.ItemLevel >=200 AND MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(MhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 264 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '01 Main hand Analyze',

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when OhEx_n.ItemLevel >=200 AND OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(OhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 264 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then 
								case
									when OhEx_n.ItemLevel >=200 AND OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(OhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 264 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then
								case
									when OhEx_n.ItemLevel >=200 AND OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(OhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 264 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then 
						  		case
									when OhEx_n.ItemLevel >=200 AND OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(OhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 264 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then
								case
									when OhEx_n.ItemLevel >=200 AND OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(OhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 264 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then
								case
									when OhEx_n.ItemLevel >=200 AND OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(OhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 264 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when OhEx_n.ItemLevel >=200 AND OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(OhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 264 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '02 Off hand Analyze',
		 
		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 IN (3,4) or RhEx_n.stat_type2 IN (3,4) or RhEx_n.stat_type3 IN (3,4) or RhEx_n.stat_type4 IN (3,4) or RhEx_n.stat_type5 IN (3,4) or RhEx_n.stat_type6 IN (3,4)) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then 
						case
							when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
								case
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									else
									case
										when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
										when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
										When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
										When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
									end
								end
							when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
							when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
							when RIGHT(RhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
							else
								case
									when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
							end 
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then 
						case
							when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
								case
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									else
									case
										when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
										when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
										When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
										When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
									end
								end
							when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
							when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
							when RIGHT(RhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
							else
								case
									when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
							end 
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then
						case
							when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
								case
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									else
									case
										when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
										when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
										When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
										When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
									end
								end
							when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
							when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
							when RIGHT(RhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
							else
								case
									when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
							end 
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then 
						case
							when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
								case
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									else
									case
										when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
										when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
										When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
										When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
									end
								end
							when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
							when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
							when RIGHT(RhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
							else
								case
									when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
							end 
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then
						case
							when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
								case
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									else
									case
										when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
										when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
										When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
										When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
									end
								end
							when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
							when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
							when RIGHT(RhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
							else
								case
									when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
							end 
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then
						case
							when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
								case
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									else
									case
										when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
										when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
										When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
										When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
									end
								end
							when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
							when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
							when RIGHT(RhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
							else
								case
									when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
							end 
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then 
						case
							when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
								case
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									else
									case
										when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
										when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
										When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
										When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
									end
								end
							when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
							when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
							when RIGHT(RhEx.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
							else
								case
									when RhEx_n.ItemLevel >=200 AND RhEx_n.ItemLevel< 251 then '3 Heroic'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 264 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
							end 
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '03 Range Analyze',
		 

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Head_n.ItemLevel >=200 AND Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 264 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then 
								case
									when Head_n.ItemLevel >=200 AND Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 264 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then
								case
									when Head_n.ItemLevel >=200 AND Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 264 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Head_n.ItemLevel >=200 AND Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 264 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then
								case
									when Head_n.ItemLevel >=200 AND Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 264 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then
								case
									when Head_n.ItemLevel >=200 AND Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 264 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Head_n.ItemLevel >=200 AND Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 264 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '04 Head Analyze',

	 		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Shoulders_n.ItemLevel >=200 AND Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 264 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then 
								case
									when Shoulders_n.ItemLevel >=200 AND Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 264 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then
								case
									when Shoulders_n.ItemLevel >=200 AND Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 264 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Shoulders_n.ItemLevel >=200 AND Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 264 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END #'Wrong Weapon used: Intellect DPS/Heal'
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then
								case
									when Shoulders_n.ItemLevel >=200 AND Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 264 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then
								case
									when Shoulders_n.ItemLevel >=200 AND Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 264 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Shoulders_n.ItemLevel >=200 AND Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 264 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '05 Shoulder Analyze',

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Chest_n.ItemLevel >=200 AND Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Chest_n.ItemLevel < 264 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Chest_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then 
								case
									when Chest_n.ItemLevel >=200 AND Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Chest_n.ItemLevel < 264 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Chest_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then
								case
									when Chest_n.ItemLevel >=200 AND Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Chest_n.ItemLevel < 264 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Chest_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Chest_n.ItemLevel >=200 AND Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Chest_n.ItemLevel < 264 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Chest_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then
								case
									when Chest_n.ItemLevel >=200 AND Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Chest_n.ItemLevel < 264 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Chest_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then
								case
									when Chest_n.ItemLevel >=200 AND Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Chest_n.ItemLevel < 264 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Chest_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Chest_n.ItemLevel >=200 AND Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Chest_n.ItemLevel < 264 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Chest_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '06 Chest Analyze',

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Waist_n.ItemLevel >=200 AND Waist_n.ItemLevel < 251 then '3 Heroic'
									#when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
									#	case
									#		when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									#	end
									#when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									#when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 264 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then 
								case
									when Waist_n.ItemLevel >=200 AND Waist_n.ItemLevel < 251 then '3 Heroic'
									#when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
									#	case
									#		when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									#	end
									#when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									#when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 264 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then
								case
									when Waist_n.ItemLevel >=200 AND Waist_n.ItemLevel < 251 then '3 Heroic'
									#when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
									#	case
									#		when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									#	end
									#when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									#when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 264 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Waist_n.ItemLevel >=200 AND Waist_n.ItemLevel < 251 then '3 Heroic'
									#when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
									#	case
									#		when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									#	end
									#when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									#when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 264 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then
								case
									when Waist_n.ItemLevel >=200 AND Waist_n.ItemLevel < 251 then '3 Heroic'
									#when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
									#	case
									#		when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									#	end
									#when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									#when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 264 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then
								case
									when Waist_n.ItemLevel >=200 AND Waist_n.ItemLevel < 251 then '3 Heroic'
									#when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
									#	case
									#		when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									#	end
									#when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									#when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 264 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Waist_n.ItemLevel >=200 AND Waist_n.ItemLevel < 251 then '3 Heroic'
									#when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
									#	case
									#		when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									#	end
									#when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									#when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 264 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '07 Waist Analyze',

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Legs_n.ItemLevel >=200 AND Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 264 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then 
								case
									when Legs_n.ItemLevel >=200 AND Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 264 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then
								case
									when Legs_n.ItemLevel >=200 AND Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 264 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Legs_n.ItemLevel >=200 AND Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 264 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then
								case
									when Legs_n.ItemLevel >=200 AND Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 264 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then
								case
									when Legs_n.ItemLevel >=200 AND Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 264 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Legs_n.ItemLevel >=200 AND Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 264 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '08 Legs Analyze',
 
		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Feet_n.ItemLevel >=200 AND Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 264 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then 
								case
									when Feet_n.ItemLevel >=200 AND Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 264 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then
								case
									when Feet_n.ItemLevel >=200 AND Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 264 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Feet_n.ItemLevel >=200 AND Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 264 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then
								case
									when Feet_n.ItemLevel >=200 AND Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 264 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then
								case
									when Feet_n.ItemLevel >=200 AND Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 264 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Feet_n.ItemLevel >=200 AND Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 264 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '09 Feet Analyze',

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Wrist_n.ItemLevel >=200 AND Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 264 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then 
								case
									when Wrist_n.ItemLevel >=200 AND Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 264 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then
								case
									when Wrist_n.ItemLevel >=200 AND Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 264 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Wrist_n.ItemLevel >=200 AND Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 264 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then
								case
									when Wrist_n.ItemLevel >=200 AND Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 264 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then
								case
									when Wrist_n.ItemLevel >=200 AND Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 264 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Wrist_n.ItemLevel >=200 AND Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 264 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '10 Wrist Analyze',

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Hands_n.ItemLevel >=200 AND Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 264 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then 
								case
									when Hands_n.ItemLevel >=200 AND Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 264 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then
								case
									when Hands_n.ItemLevel >=200 AND Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 264 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Hands_n.ItemLevel >=200 AND Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 264 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then
								case
									when Hands_n.ItemLevel >=200 AND Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 264 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then
								case
									when Hands_n.ItemLevel >=200 AND Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 264 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Hands_n.ItemLevel >=200 AND Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 264 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '11 Hand Analyze',

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Back_n.ItemLevel >=200 AND Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 264 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then 
								case
									when Back_n.ItemLevel >=200 AND Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 264 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then
								case
									when Back_n.ItemLevel >=200 AND Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 264 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Back_n.ItemLevel >=200 AND Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 264 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then
								case
									when Back_n.ItemLevel >=200 AND Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 264 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then
								case
									when Back_n.ItemLevel >=200 AND Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 264 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Back_n.ItemLevel >=200 AND Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 264 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '12 Back Analyze',

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Finger1_n.ItemLevel >=200 AND Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 264 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then 
								case
									when Finger1_n.ItemLevel >=200 AND Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 264 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then
								case
									when Finger1_n.ItemLevel >=200 AND Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 264 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Finger1_n.ItemLevel >=200 AND Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 264 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then
								case
									when Finger1_n.ItemLevel >=200 AND Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 264 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then
								case
									when Finger1_n.ItemLevel >=200 AND Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 264 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Finger1_n.ItemLevel >=200 AND Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 264 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '13 Finger 1 Analyze',

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Finger2_n.ItemLevel >=200 AND Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 264 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then 
								case
									when Finger2_n.ItemLevel >=200 AND Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 264 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then
								case
									when Finger2_n.ItemLevel >=200 AND Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 264 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Finger2_n.ItemLevel >=200 AND Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 264 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then
								case
									when Finger2_n.ItemLevel >=200 AND Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 264 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then
								case
									when Finger2_n.ItemLevel >=200 AND Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 264 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Finger2_n.ItemLevel >=200 AND Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 264 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '14 Finger 2 Analyze',
 
		 case 
		 	  when (Trinket1_n.stat_type1 IN (12,13,14) or Trinket1_n.stat_type2 IN (12,13,14) or Trinket1_n.stat_type3 IN (12,13,14) or Trinket1_n.stat_type4 IN (12,13,14) or Trinket1_n.stat_type5 IN (12,13,14) or Trinket1_n.stat_type6 IN (12,13,14)) then
					case
						when Trinket1_n.ItemLevel >=200 AND Trinket1_n.ItemLevel < 251 then '3 Heroic'
						when Trinket1_n.ItemLevel >= 251 AND Trinket1_n.ItemLevel < 264 then '4 ICC10 Tank'
						When Trinket1_n.ItemLevel >= 264 AND Trinket1_n.ItemLevel <=271 then '5 ICC25/10H Tank'
						When Trinket1_n.ItemLevel >= 277 then '6 ICC25H Tank'
					END
  			  when (Trinket1_n.stat_type1 IN (31,32,38,44) or Trinket1_n.stat_type2 IN (31,32,38,44) or Trinket1_n.stat_type3 IN (31,32,38,44) or Trinket1_n.stat_type4 IN (31,32,38,44) or Trinket1_n.stat_type5 IN (31,32,38,44) or Trinket1_n.stat_type6 IN (31,32,38,44)) then
					case
						when Trinket1_n.ItemLevel >=200 and Trinket1_n.ItemLevel < 251 then '3 Heroic DPS'
						when Trinket1_n.ItemLevel >= 251 AND Trinket1_n.ItemLevel < 264 then '4 ICC10 DPS'
						When Trinket1_n.ItemLevel >= 264 AND Trinket1_n.ItemLevel <=271 then '5 ICC25/10H DPS'
						When Trinket1_n.ItemLevel >= 277 then '6 ICC25H DPS'
					END
			  when (Trinket1_n.stat_type1 IN (43) or Trinket1_n.stat_type2 IN (43) or Trinket1_n.stat_type3 IN (43) or Trinket1_n.stat_type4 IN (43) or Trinket1_n.stat_type5 IN (43) or Trinket1_n.stat_type6 IN (43)) then
					case
						when Trinket1_n.ItemLevel > 200 and Trinket1_n.ItemLevel < 251 then '3 Heroic DPS/heal'
						when Trinket1_n.ItemLevel >= 251 AND Trinket1_n.ItemLevel < 264 then '4 ICC10 DPS/heal'
						When Trinket1_n.ItemLevel >= 264 AND Trinket1_n.ItemLevel <=271 then '5 ICC25/10H DPS/heal'
						When Trinket1_n.ItemLevel >= 277 then '6 ICC25H DPS/heal'
					end
		 END AS '15 Trinket 1 Analyze',

		 case 
		 	  when (Trinket2_n.stat_type1 IN (12,13,14) or Trinket2_n.stat_type2 IN (12,13,14) or Trinket2_n.stat_type3 IN (12,13,14) or Trinket2_n.stat_type4 IN (12,13,14) or Trinket2_n.stat_type5 IN (12,13,14) or Trinket2_n.stat_type6 IN (12,13,14)) then
		 	  		case
						when Trinket2_n.ItemLevel > 200 and Trinket2_n.ItemLevel < 251 then '3 Heroic Tank'
						when Trinket2_n.ItemLevel >= 251 AND Trinket2_n.ItemLevel < 264 then '4 ICC10 Tank'
						When Trinket2_n.ItemLevel >= 264 AND Trinket2_n.ItemLevel <=271 then '5 ICC25/10H Tank'
						When Trinket2_n.ItemLevel >= 277 then '6 ICC25H Tank'
					END
  			  when (Trinket2_n.stat_type1 IN (31,32,38,44) or Trinket2_n.stat_type2 IN (31,32,38,44) or Trinket2_n.stat_type3 IN (31,32,38,44) or Trinket2_n.stat_type4 IN (31,32,38,44) or Trinket2_n.stat_type5 IN (31,32,38,44) or Trinket2_n.stat_type6 IN (31,32,38,44)) then
					case
						when Trinket2_n.ItemLevel > 200 and Trinket2_n.ItemLevel < 251 then '3 Heroic DPS'
						when Trinket2_n.ItemLevel >= 251 AND Trinket2_n.ItemLevel < 264 then '4 ICC10 DPS'
						When Trinket2_n.ItemLevel >= 264 AND Trinket2_n.ItemLevel <=271 then '5 ICC25/10H DPS'
						When Trinket2_n.ItemLevel >= 277 then '6 ICC25H DPS'
					END
			  when (Trinket2_n.stat_type1 IN (43) or Trinket2_n.stat_type2 IN (43) or Trinket2_n.stat_type3 IN (43) or Trinket2_n.stat_type4 IN (43) or Trinket2_n.stat_type5 IN (43) or Trinket2_n.stat_type6 IN (43)) then
					case
						when Trinket2_n.ItemLevel > 200 and Trinket2_n.ItemLevel < 251 then '3 Heroic DPS/heal'
						when Trinket2_n.ItemLevel >= 251 AND Trinket2_n.ItemLevel < 264 then '4 ICC10 DPS/heal'
						When Trinket2_n.ItemLevel >= 264 AND Trinket2_n.ItemLevel <=271 then '5 ICC25/10H DPS/heal'
						When Trinket2_n.ItemLevel >= 277 then '6 ICC25H DPS/heal'
					END
		 END AS '16 Trinket 2 analyze',
		 

		 case
			 #Strength DPS
		     when (characters_npcbot_class_role.class_role IN ('Warrior DPS', 'Paladin DPS', 'DK DPS')) then 
		     		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Neck_n.ItemLevel >=200 AND Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 264 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (characters_npcbot_class_role.class_role IN ('Warrior Tank', 'Paladin Tank', 'DK Tank')) then
		     		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then 
								case
									when Neck_n.ItemLevel >=200 AND Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 264 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (characters_npcbot_class_role.class_role IN ('Mage', 'Warlock', 'Shaman Elemental', 'Druid Balance', 'Priest DPS')) then
			 		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then
								case
									when Neck_n.ItemLevel >=200 AND Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 264 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Neck_n.ItemLevel >=200 AND Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 264 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (characters_npcbot_class_role.class_role IN ('Paladin Healer', 'Priest Healer', 'Warlock', 'Mage', 'Shaman Healer', 'Druid Healer'))
			        then 
			 		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then
								case
									when Neck_n.ItemLevel >=200 AND Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 264 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when (characters_npcbot_class_role.class_role IN ('Druid Feral Tank')) then 
			 		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then
								case
									when Neck_n.ItemLevel >=200 AND Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 264 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (characters_npcbot_class_role.class_role IN ('Hunter', 'Rogue', 'Druid Feral DPS', 'Shaman Enhancement')) then 
					case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Neck_n.ItemLevel >=200 AND Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 264 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
				  	END
		 end  AS '17 Neck Analyze'
FROM characters.characters_npcbot npcbot
INNER JOIN world.creature_template ON creature_template.entry = npcbot.entry
inner JOIN characters.characters ON characters.guid = npcbot.owner
left JOIN characters.item_instance MhEx ON MhEx.guid = npcbot.equipMhEx
left JOIN world.item_template MhEx_n ON MhEx_n.entry = MhEx.itemEntry
left JOIN characters.item_instance OhEx ON OhEx.guid = npcbot.equipOhEx
left JOIN world.item_template OhEx_n ON OhEx_n.entry = OhEx.itementry
left JOIN characters.item_instance RhEx ON RhEx.guid = npcbot.equipRhEx
left JOIN world.item_template RhEx_n ON RhEx_n.entry = RhEx.itementry
left JOIN characters.item_instance Head ON Head.guid = npcbot.equipHead
left JOIN world.item_template Head_n ON Head_n.entry = Head.itementry
left JOIN characters.item_instance Shoulders ON Shoulders.guid = npcbot.equipShoulders
left JOIN world.item_template Shoulders_n ON Shoulders_n.entry = Shoulders.itementry
left JOIN characters.item_instance Chest ON Chest.guid = npcbot.equipChest
left JOIN world.item_template Chest_n ON Chest_n.entry = Chest.itementry
left JOIN characters.item_instance Waist ON Waist.guid = npcbot.equipWaist
left JOIN world.item_template Waist_n ON Waist_n.entry = Waist.itementry
left JOIN characters.item_instance Legs ON Legs.guid = npcbot.equipLegs
left JOIN world.item_template Legs_n ON Legs_n.entry = Legs.itementry
left JOIN characters.item_instance Feet ON Feet.guid = npcbot.equipFeet
left JOIN world.item_template Feet_n ON Feet_n.entry = Feet.itementry
left JOIN characters.item_instance Wrist ON Wrist.guid = npcbot.equipWrist
left JOIN world.item_template Wrist_n ON Wrist_n.entry = Wrist.itementry
left JOIN characters.item_instance Hands ON Hands.guid = npcbot.equipHands
left JOIN world.item_template Hands_n ON Hands_n.entry = Hands.itementry
left JOIN characters.item_instance Back ON Back.guid = npcbot.equipBack
left JOIN world.item_template Back_n ON Back_n.entry = Back.itementry
left JOIN characters.item_instance Body ON Body.guid = npcbot.equipBody
left JOIN world.item_template Body_n ON Body_n.entry = Body.itementry
left JOIN characters.item_instance Finger1 ON Finger1.guid = npcbot.equipFinger1
left JOIN world.item_template Finger1_n ON Finger1_n.entry = Finger1.itementry
left JOIN characters.item_instance Finger2 ON Finger2.guid = npcbot.equipFinger2
left JOIN world.item_template Finger2_n ON Finger2_n.entry = Finger2.itementry
left JOIN characters.item_instance Trinket1 ON Trinket1.guid = npcbot.equipTrinket1
left JOIN world.item_template Trinket1_n ON Trinket1_n.entry = Trinket1.itementry
left JOIN characters.item_instance Trinket2 ON Trinket2.guid = npcbot.equipTrinket2
left JOIN world.item_template Trinket2_n ON Trinket2_n.entry = Trinket2.itementry
left JOIN characters.item_instance Neck ON Neck.guid = npcbot.equipNeck
left JOIN world.item_template Neck_n ON Neck_n.entry = Neck.itementry
left join characters.characters_npcbot_class_role on characters_npcbot_class_role.entry = npcbot.entry ;
