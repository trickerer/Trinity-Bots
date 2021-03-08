SELECT #characters.guid AS 'Character ID', 
       characters.name AS 'Character Name', 
		 creature_template.name AS 'NPCBot Name',
		# npcbot.spec, npcbot.roles,
		#MhEx_n.stat_type1 , MhEx_n.stat_type2 , MhEx_n.stat_type3 , MhEx_n.stat_type4 , MhEx_n.stat_type5 ,MhEx_n.stat_type6,
		#MhEx.enchantments,
		case 
		   when creature_template.unit_class = 1 and npcbot.spec IN (1,2) then 'Warrior DPS'
		   when creature_template.unit_class = 1 and npcbot.spec = 3 then 'Warrior Tank'
		   when creature_template.unit_class = 2 and npcbot.spec = 4 then 'Paladin Healer'
		   when creature_template.unit_class = 2 and npcbot.spec = 5 then 'Paladin Tank'
		   when creature_template.unit_class = 2 and npcbot.spec = 6 then 'Paladin DPS'
		   when creature_template.unit_class = 3 then 'Hunter'
		   when creature_template.unit_class = 4 then 'Rogue'
		   when creature_template.unit_class = 5 and npcbot.spec IN (13,14) then 'Priest Healer'
		   when creature_template.unit_class = 5 and npcbot.spec = 15 then 'Priest DPS'
		   when creature_template.unit_class = 6 and npcbot.roles = 18 then 'DK DPS'
		   when creature_template.unit_class = 6 and npcbot.roles IN (17,19) then 'DK Tank'
		   when creature_template.unit_class = 7 and npcbot.spec = 19 then 'Shaman Elemental'
		   when creature_template.unit_class = 7 and npcbot.spec = 20 then 'Shaman Enhancement'
		   when creature_template.unit_class = 7 and npcbot.spec = 21 then 'Shaman Healer'
		   when creature_template.unit_class = 8 then 'Mage'
		   when creature_template.unit_class = 9 then 'Warlock'
		   when creature_template.unit_class = 11 and npcbot.spec = 28 then 'Druid Balance'
		   when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2 then 'Druid DPS'
		   when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 'Druid Tank'
		   when creature_template.unit_class = 11 and npcbot.spec = 30 then 'Druid Healer'
		end  AS 'NPCBot Classe',
		CONCAT (MhEx_n.ItemLevel, ' ', MhEx_n.name) AS '01 Main Hand',
		CONCAT (OhEx_n.ItemLevel, ' ', OhEx_n.name) AS '02 Off Hand',
		CONCAT (RhEx_n.ItemLevel, ' ', RhEx_n.name) AS '03 Range' ,
		CONCAT (Head_n.ItemLevel, ' ', Head_n.name) AS '04 Head',
 		CONCAT (Shoulders_n.ItemLevel, ' ', Shoulders_n.name) AS '05 Shoulder',
		CONCAT (Chest_n.ItemLevel, ' ', Chest_n.name) AS '06 Chest',
		CONCAT (Waist_n.ItemLevel, ' ', Waist_n.name) AS '07 Waist',
		CONCAT (Legs_n.ItemLevel , ' ', Legs_n.name) AS '08 Legs', 
		CONCAT (Feet_n.ItemLevel, ' ', Feet_n.name) AS '09 Feet',
		CONCAT (Wrist_n.ItemLevel , ' ', Wrist_n.name) AS '10 Wrist', 
		CONCAT (Hands_n.ItemLevel, ' ', Hands_n.name) AS '11 Hand', 
		CONCAT (Back_n.ItemLevel, ' ', Back_n.name) AS '12 Back', 		 
		CONCAT (Finger1_n.ItemLevel, ' ', Finger1_n.name) AS '13 Finger 1',
		CONCAT (Finger2_n.ItemLevel, ' ', Finger2_n.name) AS '14 Finger 2', 
		CONCAT (Trinket1_n.ItemLevel, ' ', Trinket1_n.name) AS '15 Trincket 1',
		CONCAT (Trinket2_n.ItemLevel, ' ',Trinket2_n.name) AS '16 Trincket 2', 
		CONCAT (Neck_n.ItemLevel, ' ', Neck_n.name) AS '17 Neck',  
		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(mhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 258 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then 
								case
									when MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(mhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then
								case
									when MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(mhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 258 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then 
						  		case
						  			when MhEx_n.ItemLevel < 251 then '3 Heroic'
						  			when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(mhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 258 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then
								case
									when MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(mhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 258 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then
								case
									when MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(mhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 258 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (12,13,14) or MhEx_n.stat_type2 IN (12,13,14) or MhEx_n.stat_type3 IN (12,13,14) or MhEx_n.stat_type4 IN (12,13,14) or MhEx_n.stat_type5 IN (12,13,14) or MhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (MhEx_n.stat_type1 = 4 or MhEx_n.stat_type2 = 4 or MhEx_n.stat_type3 = 4 or MhEx_n.stat_type4 = 4 or MhEx_n.stat_type5 = 4 or MhEx_n.stat_type6 = 4) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (MhEx_n.stat_type1 = 3 or MhEx_n.stat_type2 = 3 or MhEx_n.stat_type3 = 3 or MhEx_n.stat_type4 = 3 or MhEx_n.stat_type5 = 3 or MhEx_n.stat_type6 = 3) AND (MhEx_n.stat_type1 IN (0,31,32,38,44) or MhEx_n.stat_type2 IN (0,31,32,38,44) or MhEx_n.stat_type3 IN (0,31,32,38,44) or MhEx_n.stat_type4 IN (0,31,32,38,44) or MhEx_n.stat_type5 IN (0,31,32,38,44) or MhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when MhEx_n.ItemLevel < 251 then '3 Heroic'
									when MhEx_n.socketColor_1 = 0 and MhEx_n.socketColor_2 = 0 and MhEx_n.socketColor_3 = 0 then
										case
											when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when MhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(MhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(mhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when MhEx_n.ItemLevel >= 251 AND MhEx_n.ItemLevel < 258 then '4 ICC10'
									When MhEx_n.ItemLevel >= 264 AND MhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When MhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (31) or MhEx_n.stat_type2 IN (31) or MhEx_n.stat_type3 IN (31) or MhEx_n.stat_type4 IN (31) or MhEx_n.stat_type5 IN (31) or MhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (MhEx_n.stat_type1 = 5 or MhEx_n.stat_type2 = 5 or MhEx_n.stat_type3 = 5 or MhEx_n.stat_type4 = 5 or MhEx_n.stat_type5 = 5 or MhEx_n.stat_type6 = 5) AND (MhEx_n.stat_type1 IN (32,36,45) or MhEx_n.stat_type2 IN (32,36,45) or MhEx_n.stat_type3 IN (32,36,45) or MhEx_n.stat_type4 IN (32,36,45) or MhEx_n.stat_type5 IN (32,36,45) or MhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '01 Main hand Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Ohex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 258 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then 
								case
									when OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Ohex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then
								case
									when OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Ohex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 258 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then 
						  		case
									when OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Ohex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 258 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then
								case
									when OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Ohex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 258 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then
								case
									when OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Ohex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 258 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (12,13,14) or OhEx_n.stat_type2 IN (12,13,14) or OhEx_n.stat_type3 IN (12,13,14) or OhEx_n.stat_type4 IN (12,13,14) or OhEx_n.stat_type5 IN (12,13,14) or OhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (OhEx_n.stat_type1 = 4 or OhEx_n.stat_type2 = 4 or OhEx_n.stat_type3 = 4 or OhEx_n.stat_type4 = 4 or OhEx_n.stat_type5 = 4 or OhEx_n.stat_type6 = 4) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (OhEx_n.stat_type1 = 3 or OhEx_n.stat_type2 = 3 or OhEx_n.stat_type3 = 3 or OhEx_n.stat_type4 = 3 or OhEx_n.stat_type5 = 3 or OhEx_n.stat_type6 = 3) AND (OhEx_n.stat_type1 IN (0,31,32,38,44) or OhEx_n.stat_type2 IN (0,31,32,38,44) or OhEx_n.stat_type3 IN (0,31,32,38,44) or OhEx_n.stat_type4 IN (0,31,32,38,44) or OhEx_n.stat_type5 IN (0,31,32,38,44) or OhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when OhEx_n.ItemLevel < 251 then '3 Heroic'
									when OhEx_n.socketColor_1 = 0 and OhEx_n.socketColor_2 = 0 and OhEx_n.socketColor_3 = 0 then
										case
											when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when OhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(OhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Ohex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when OhEx_n.ItemLevel >= 251 AND OhEx_n.ItemLevel < 258 then '4 ICC10'
									When OhEx_n.ItemLevel >= 264 AND OhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When OhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (31) or OhEx_n.stat_type2 IN (31) or OhEx_n.stat_type3 IN (31) or OhEx_n.stat_type4 IN (31) or OhEx_n.stat_type5 IN (31) or OhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (OhEx_n.stat_type1 = 5 or OhEx_n.stat_type2 = 5 or OhEx_n.stat_type3 = 5 or OhEx_n.stat_type4 = 5 or OhEx_n.stat_type5 = 5 or OhEx_n.stat_type6 = 5) AND (OhEx_n.stat_type1 IN (32,36,45) or OhEx_n.stat_type2 IN (32,36,45) or OhEx_n.stat_type3 IN (32,36,45) or OhEx_n.stat_type4 IN (32,36,45) or OhEx_n.stat_type5 IN (32,36,45) or OhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '02 Off hand Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		#when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 IN (3,4) or RhEx_n.stat_type2 IN (3,4) or RhEx_n.stat_type3 IN (3,4) or RhEx_n.stat_type4 IN (3,4) or RhEx_n.stat_type5 IN (3,4) or RhEx_n.stat_type6 IN (3,4)) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when RhEx_n.ItemLevel < 251 then '3 Heroic'
									when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
										case
											when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Rhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 258 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then 
								case
									when RhEx_n.ItemLevel < 251 then '3 Heroic'
									when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
										case
											when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Rhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 258 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then
								case
									when RhEx_n.ItemLevel < 251 then '3 Heroic'
									when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
										case
											when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Rhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 258 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then 
						  		case
									when RhEx_n.ItemLevel < 251 then '3 Heroic'
									when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
										case
											when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Rhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 258 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then
								case
									when RhEx_n.ItemLevel < 251 then '3 Heroic'
									when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
										case
											when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Rhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 258 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then
								case
									when RhEx_n.ItemLevel < 251 then '3 Heroic'
									when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
										case
											when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Rhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 258 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (12,13,14) or RhEx_n.stat_type2 IN (12,13,14) or RhEx_n.stat_type3 IN (12,13,14) or RhEx_n.stat_type4 IN (12,13,14) or RhEx_n.stat_type5 IN (12,13,14) or RhEx_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (RhEx_n.stat_type1 = 4 or RhEx_n.stat_type2 = 4 or RhEx_n.stat_type3 = 4 or RhEx_n.stat_type4 = 4 or RhEx_n.stat_type5 = 4 or RhEx_n.stat_type6 = 4) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (RhEx_n.stat_type1 = 3 or RhEx_n.stat_type2 = 3 or RhEx_n.stat_type3 = 3 or RhEx_n.stat_type4 = 3 or RhEx_n.stat_type5 = 3 or RhEx_n.stat_type6 = 3) AND (RhEx_n.stat_type1 IN (0,31,32,38,44) or RhEx_n.stat_type2 IN (0,31,32,38,44) or RhEx_n.stat_type3 IN (0,31,32,38,44) or RhEx_n.stat_type4 IN (0,31,32,38,44) or RhEx_n.stat_type5 IN (0,31,32,38,44) or RhEx_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when RhEx_n.ItemLevel < 251 then '3 Heroic'
									when RhEx_n.socketColor_1 = 0 and RhEx_n.socketColor_2 = 0 and RhEx_n.socketColor_3 = 0 then
										case
											when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when RhEx.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(RhEx.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Rhex.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when RhEx_n.ItemLevel >= 251 AND RhEx_n.ItemLevel < 258 then '4 ICC10'
									When RhEx_n.ItemLevel >= 264 AND RhEx_n.ItemLevel <=271 then '5 ICC25/10H'
									When RhEx_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (31) or RhEx_n.stat_type2 IN (31) or RhEx_n.stat_type3 IN (31) or RhEx_n.stat_type4 IN (31) or RhEx_n.stat_type5 IN (31) or RhEx_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (RhEx_n.stat_type1 = 5 or RhEx_n.stat_type2 = 5 or RhEx_n.stat_type3 = 5 or RhEx_n.stat_type4 = 5 or RhEx_n.stat_type5 = 5 or RhEx_n.stat_type6 = 5) AND (RhEx_n.stat_type1 IN (32,36,45) or RhEx_n.stat_type2 IN (32,36,45) or RhEx_n.stat_type3 IN (32,36,45) or RhEx_n.stat_type4 IN (32,36,45) or RhEx_n.stat_type5 IN (32,36,45) or RhEx_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '03 Range Analyze',
		 

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 258 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then 
								case
									when Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then
								case
									when Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 258 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 258 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then
								case
									when Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 258 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then
								case
									when Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 258 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (12,13,14) or Head_n.stat_type2 IN (12,13,14) or Head_n.stat_type3 IN (12,13,14) or Head_n.stat_type4 IN (12,13,14) or Head_n.stat_type5 IN (12,13,14) or Head_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Head_n.stat_type1 = 4 or Head_n.stat_type2 = 4 or Head_n.stat_type3 = 4 or Head_n.stat_type4 = 4 or Head_n.stat_type5 = 4 or Head_n.stat_type6 = 4) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Head_n.stat_type1 = 3 or Head_n.stat_type2 = 3 or Head_n.stat_type3 = 3 or Head_n.stat_type4 = 3 or Head_n.stat_type5 = 3 or Head_n.stat_type6 = 3) AND (Head_n.stat_type1 IN (0,31,32,38,44) or Head_n.stat_type2 IN (0,31,32,38,44) or Head_n.stat_type3 IN (0,31,32,38,44) or Head_n.stat_type4 IN (0,31,32,38,44) or Head_n.stat_type5 IN (0,31,32,38,44) or Head_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Head_n.ItemLevel < 251 then '3 Heroic'
									when Head_n.socketColor_1 = 0 and Head_n.socketColor_2 = 0 and Head_n.socketColor_3 = 0 then
										case
											when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Head.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Head.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Head.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Head_n.ItemLevel >= 251 AND Head_n.ItemLevel < 258 then '4 ICC10'
									When Head_n.ItemLevel >= 264 AND Head_n.ItemLevel <=271 then '5 ICC25/10H'
									When Head_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (31) or Head_n.stat_type2 IN (31) or Head_n.stat_type3 IN (31) or Head_n.stat_type4 IN (31) or Head_n.stat_type5 IN (31) or Head_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Head_n.stat_type1 = 5 or Head_n.stat_type2 = 5 or Head_n.stat_type3 = 5 or Head_n.stat_type4 = 5 or Head_n.stat_type5 = 5 or Head_n.stat_type6 = 5) AND (Head_n.stat_type1 IN (32,36,45) or Head_n.stat_type2 IN (32,36,45) or Head_n.stat_type3 IN (32,36,45) or Head_n.stat_type4 IN (32,36,45) or Head_n.stat_type5 IN (32,36,45) or Head_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '04 Head Analyze',

	 		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then 
								case
									when Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then
								case
									when Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END #'Wrong Weapon used: Intellect DPS/Heal'
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then
								case
									when Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then
								case
									when Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (12,13,14) or Shoulders_n.stat_type2 IN (12,13,14) or Shoulders_n.stat_type3 IN (12,13,14) or Shoulders_n.stat_type4 IN (12,13,14) or Shoulders_n.stat_type5 IN (12,13,14) or Shoulders_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Shoulders_n.stat_type1 = 4 or Shoulders_n.stat_type2 = 4 or Shoulders_n.stat_type3 = 4 or Shoulders_n.stat_type4 = 4 or Shoulders_n.stat_type5 = 4 or Shoulders_n.stat_type6 = 4) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Shoulders_n.stat_type1 = 3 or Shoulders_n.stat_type2 = 3 or Shoulders_n.stat_type3 = 3 or Shoulders_n.stat_type4 = 3 or Shoulders_n.stat_type5 = 3 or Shoulders_n.stat_type6 = 3) AND (Shoulders_n.stat_type1 IN (0,31,32,38,44) or Shoulders_n.stat_type2 IN (0,31,32,38,44) or Shoulders_n.stat_type3 IN (0,31,32,38,44) or Shoulders_n.stat_type4 IN (0,31,32,38,44) or Shoulders_n.stat_type5 IN (0,31,32,38,44) or Shoulders_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Shoulders_n.ItemLevel < 251 then '3 Heroic'
									when Shoulders_n.socketColor_1 = 0 and Shoulders_n.socketColor_2 = 0 and Shoulders_n.socketColor_3 = 0 then
										case
											when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Shoulders.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Shoulders.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Shoulders.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Shoulders_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Shoulders_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Shoulders_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (31) or Shoulders_n.stat_type2 IN (31) or Shoulders_n.stat_type3 IN (31) or Shoulders_n.stat_type4 IN (31) or Shoulders_n.stat_type5 IN (31) or Shoulders_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Shoulders_n.stat_type1 = 5 or Shoulders_n.stat_type2 = 5 or Shoulders_n.stat_type3 = 5 or Shoulders_n.stat_type4 = 5 or Shoulders_n.stat_type5 = 5 or Shoulders_n.stat_type6 = 5) AND (Shoulders_n.stat_type1 IN (32,36,45) or Shoulders_n.stat_type2 IN (32,36,45) or Shoulders_n.stat_type3 IN (32,36,45) or Shoulders_n.stat_type4 IN (32,36,45) or Shoulders_n.stat_type5 IN (32,36,45) or Shoulders_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '05 Shoulder Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then 
								case
									when Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 	#Magic DPS
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then
								case
									when Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then
								case
									when Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then
								case
									when Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (12,13,14) or Chest_n.stat_type2 IN (12,13,14) or Chest_n.stat_type3 IN (12,13,14) or Chest_n.stat_type4 IN (12,13,14) or Chest_n.stat_type5 IN (12,13,14) or Chest_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Chest_n.stat_type1 = 4 or Chest_n.stat_type2 = 4 or Chest_n.stat_type3 = 4 or Chest_n.stat_type4 = 4 or Chest_n.stat_type5 = 4 or Chest_n.stat_type6 = 4) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Chest_n.stat_type1 = 3 or Chest_n.stat_type2 = 3 or Chest_n.stat_type3 = 3 or Chest_n.stat_type4 = 3 or Chest_n.stat_type5 = 3 or Chest_n.stat_type6 = 3) AND (Chest_n.stat_type1 IN (0,31,32,38,44) or Chest_n.stat_type2 IN (0,31,32,38,44) or Chest_n.stat_type3 IN (0,31,32,38,44) or Chest_n.stat_type4 IN (0,31,32,38,44) or Chest_n.stat_type5 IN (0,31,32,38,44) or Chest_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Chest_n.ItemLevel < 251 then '3 Heroic'
									when Chest_n.socketColor_1 = 0 and Chest_n.socketColor_2 = 0 and Chest_n.socketColor_3 = 0 then
										case
											when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Chest.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Chest.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Chest.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Chest_n.ItemLevel >= 251 AND Shoulders_n.ItemLevel < 258 then '4 ICC10'
									When Chest_n.ItemLevel >= 264 AND Shoulders_n.ItemLevel <=271 then '5 ICC25/10H'
									When Chest_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (31) or Chest_n.stat_type2 IN (31) or Chest_n.stat_type3 IN (31) or Chest_n.stat_type4 IN (31) or Chest_n.stat_type5 IN (31) or Chest_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Chest_n.stat_type1 = 5 or Chest_n.stat_type2 = 5 or Chest_n.stat_type3 = 5 or Chest_n.stat_type4 = 5 or Chest_n.stat_type5 = 5 or Chest_n.stat_type6 = 5) AND (Chest_n.stat_type1 IN (32,36,45) or Chest_n.stat_type2 IN (32,36,45) or Chest_n.stat_type3 IN (32,36,45) or Chest_n.stat_type4 IN (32,36,45) or Chest_n.stat_type5 IN (32,36,45) or Chest_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '06 Chest Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Waist_n.ItemLevel < 251 then '3 Heroic'
									when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
										case
											when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 258 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then 
								case
									when Waist_n.ItemLevel < 251 then '3 Heroic'
									when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
										case
											when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then
								case
									when Waist_n.ItemLevel < 251 then '3 Heroic'
									when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
										case
											when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 258 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Waist_n.ItemLevel < 251 then '3 Heroic'
									when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
										case
											when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 258 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then
								case
									when Waist_n.ItemLevel < 251 then '3 Heroic'
									when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
										case
											when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 258 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then
								case
									when Waist_n.ItemLevel < 251 then '3 Heroic'
									when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
										case
											when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 258 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (12,13,14) or Waist_n.stat_type2 IN (12,13,14) or Waist_n.stat_type3 IN (12,13,14) or Waist_n.stat_type4 IN (12,13,14) or Waist_n.stat_type5 IN (12,13,14) or Waist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Waist_n.stat_type1 = 4 or Waist_n.stat_type2 = 4 or Waist_n.stat_type3 = 4 or Waist_n.stat_type4 = 4 or Waist_n.stat_type5 = 4 or Waist_n.stat_type6 = 4) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Waist_n.stat_type1 = 3 or Waist_n.stat_type2 = 3 or Waist_n.stat_type3 = 3 or Waist_n.stat_type4 = 3 or Waist_n.stat_type5 = 3 or Waist_n.stat_type6 = 3) AND (Waist_n.stat_type1 IN (0,31,32,38,44) or Waist_n.stat_type2 IN (0,31,32,38,44) or Waist_n.stat_type3 IN (0,31,32,38,44) or Waist_n.stat_type4 IN (0,31,32,38,44) or Waist_n.stat_type5 IN (0,31,32,38,44) or Waist_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Waist_n.ItemLevel < 251 then '3 Heroic'
									when Waist_n.socketColor_1 = 0 and Waist_n.socketColor_2 = 0 and Waist_n.socketColor_3 = 0 then
										case
											when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Waist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Waist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Waist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Waist_n.ItemLevel >= 251 AND Waist_n.ItemLevel < 258 then '4 ICC10'
									When Waist_n.ItemLevel >= 264 AND Waist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Waist_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (31) or Waist_n.stat_type2 IN (31) or Waist_n.stat_type3 IN (31) or Waist_n.stat_type4 IN (31) or Waist_n.stat_type5 IN (31) or Waist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Waist_n.stat_type1 = 5 or Waist_n.stat_type2 = 5 or Waist_n.stat_type3 = 5 or Waist_n.stat_type4 = 5 or Waist_n.stat_type5 = 5 or Waist_n.stat_type6 = 5) AND (Waist_n.stat_type1 IN (32,36,45) or Waist_n.stat_type2 IN (32,36,45) or Waist_n.stat_type3 IN (32,36,45) or Waist_n.stat_type4 IN (32,36,45) or Waist_n.stat_type5 IN (32,36,45) or Waist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '07 Waist Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 258 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then 
								case
									when Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then
								case
									when Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 258 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 258 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then
								case
									when Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 258 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then
								case
									when Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 258 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (12,13,14) or Legs_n.stat_type2 IN (12,13,14) or Legs_n.stat_type3 IN (12,13,14) or Legs_n.stat_type4 IN (12,13,14) or Legs_n.stat_type5 IN (12,13,14) or Legs_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Legs_n.stat_type1 = 4 or Legs_n.stat_type2 = 4 or Legs_n.stat_type3 = 4 or Legs_n.stat_type4 = 4 or Legs_n.stat_type5 = 4 or Legs_n.stat_type6 = 4) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Legs_n.stat_type1 = 3 or Legs_n.stat_type2 = 3 or Legs_n.stat_type3 = 3 or Legs_n.stat_type4 = 3 or Legs_n.stat_type5 = 3 or Legs_n.stat_type6 = 3) AND (Legs_n.stat_type1 IN (0,31,32,38,44) or Legs_n.stat_type2 IN (0,31,32,38,44) or Legs_n.stat_type3 IN (0,31,32,38,44) or Legs_n.stat_type4 IN (0,31,32,38,44) or Legs_n.stat_type5 IN (0,31,32,38,44) or Legs_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Legs_n.ItemLevel < 251 then '3 Heroic'
									when Legs_n.socketColor_1 = 0 and Legs_n.socketColor_2 = 0 and Legs_n.socketColor_3 = 0 then
										case
											when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Legs.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Legs.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Legs.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Legs_n.ItemLevel >= 251 AND Legs_n.ItemLevel < 258 then '4 ICC10'
									When Legs_n.ItemLevel >= 264 AND Legs_n.ItemLevel <=271 then '5 ICC25/10H'
									When Legs_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (31) or Legs_n.stat_type2 IN (31) or Legs_n.stat_type3 IN (31) or Legs_n.stat_type4 IN (31) or Legs_n.stat_type5 IN (31) or Legs_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Legs_n.stat_type1 = 5 or Legs_n.stat_type2 = 5 or Legs_n.stat_type3 = 5 or Legs_n.stat_type4 = 5 or Legs_n.stat_type5 = 5 or Legs_n.stat_type6 = 5) AND (Legs_n.stat_type1 IN (32,36,45) or Legs_n.stat_type2 IN (32,36,45) or Legs_n.stat_type3 IN (32,36,45) or Legs_n.stat_type4 IN (32,36,45) or Legs_n.stat_type5 IN (32,36,45) or Legs_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '08 legs Analyze',
 
		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 258 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then 
								case
									when Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then
								case
									when Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 258 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 258 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then
								case
									when Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 258 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then
								case
									when Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 258 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (12,13,14) or Feet_n.stat_type2 IN (12,13,14) or Feet_n.stat_type3 IN (12,13,14) or Feet_n.stat_type4 IN (12,13,14) or Feet_n.stat_type5 IN (12,13,14) or Feet_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Feet_n.stat_type1 = 4 or Feet_n.stat_type2 = 4 or Feet_n.stat_type3 = 4 or Feet_n.stat_type4 = 4 or Feet_n.stat_type5 = 4 or Feet_n.stat_type6 = 4) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Feet_n.stat_type1 = 3 or Feet_n.stat_type2 = 3 or Feet_n.stat_type3 = 3 or Feet_n.stat_type4 = 3 or Feet_n.stat_type5 = 3 or Feet_n.stat_type6 = 3) AND (Feet_n.stat_type1 IN (0,31,32,38,44) or Feet_n.stat_type2 IN (0,31,32,38,44) or Feet_n.stat_type3 IN (0,31,32,38,44) or Feet_n.stat_type4 IN (0,31,32,38,44) or Feet_n.stat_type5 IN (0,31,32,38,44) or Feet_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Feet_n.ItemLevel < 251 then '3 Heroic'
									when Feet_n.socketColor_1 = 0 and Feet_n.socketColor_2 = 0 and Feet_n.socketColor_3 = 0 then
										case
											when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Feet.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Feet.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Feet.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Feet_n.ItemLevel >= 251 AND Feet_n.ItemLevel < 258 then '4 ICC10'
									When Feet_n.ItemLevel >= 264 AND Feet_n.ItemLevel <=271 then '5 ICC25/10H'
									When Feet_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (31) or Feet_n.stat_type2 IN (31) or Feet_n.stat_type3 IN (31) or Feet_n.stat_type4 IN (31) or Feet_n.stat_type5 IN (31) or Feet_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Feet_n.stat_type1 = 5 or Feet_n.stat_type2 = 5 or Feet_n.stat_type3 = 5 or Feet_n.stat_type4 = 5 or Feet_n.stat_type5 = 5 or Feet_n.stat_type6 = 5) AND (Feet_n.stat_type1 IN (32,36,45) or Feet_n.stat_type2 IN (32,36,45) or Feet_n.stat_type3 IN (32,36,45) or Feet_n.stat_type4 IN (32,36,45) or Feet_n.stat_type5 IN (32,36,45) or Feet_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '09 Feet Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 258 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then 
								case
									when Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then
								case
									when Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 258 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 258 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then
								case
									when Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 258 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then
								case
									when Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 258 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (12,13,14) or Wrist_n.stat_type2 IN (12,13,14) or Wrist_n.stat_type3 IN (12,13,14) or Wrist_n.stat_type4 IN (12,13,14) or Wrist_n.stat_type5 IN (12,13,14) or Wrist_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Wrist_n.stat_type1 = 4 or Wrist_n.stat_type2 = 4 or Wrist_n.stat_type3 = 4 or Wrist_n.stat_type4 = 4 or Wrist_n.stat_type5 = 4 or Wrist_n.stat_type6 = 4) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Wrist_n.stat_type1 = 3 or Wrist_n.stat_type2 = 3 or Wrist_n.stat_type3 = 3 or Wrist_n.stat_type4 = 3 or Wrist_n.stat_type5 = 3 or Wrist_n.stat_type6 = 3) AND (Wrist_n.stat_type1 IN (0,31,32,38,44) or Wrist_n.stat_type2 IN (0,31,32,38,44) or Wrist_n.stat_type3 IN (0,31,32,38,44) or Wrist_n.stat_type4 IN (0,31,32,38,44) or Wrist_n.stat_type5 IN (0,31,32,38,44) or Wrist_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Wrist_n.ItemLevel < 251 then '3 Heroic'
									when Wrist_n.socketColor_1 = 0 and Wrist_n.socketColor_2 = 0 and Wrist_n.socketColor_3 = 0 then
										case
											when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Wrist.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Wrist.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Wrist.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Wrist_n.ItemLevel >= 251 AND Wrist_n.ItemLevel < 258 then '4 ICC10'
									When Wrist_n.ItemLevel >= 264 AND Wrist_n.ItemLevel <=271 then '5 ICC25/10H'
									When Wrist_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (31) or Wrist_n.stat_type2 IN (31) or Wrist_n.stat_type3 IN (31) or Wrist_n.stat_type4 IN (31) or Wrist_n.stat_type5 IN (31) or Wrist_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Wrist_n.stat_type1 = 5 or Wrist_n.stat_type2 = 5 or Wrist_n.stat_type3 = 5 or Wrist_n.stat_type4 = 5 or Wrist_n.stat_type5 = 5 or Wrist_n.stat_type6 = 5) AND (Wrist_n.stat_type1 IN (32,36,45) or Wrist_n.stat_type2 IN (32,36,45) or Wrist_n.stat_type3 IN (32,36,45) or Wrist_n.stat_type4 IN (32,36,45) or Wrist_n.stat_type5 IN (32,36,45) or Wrist_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '10 Wrist Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 258 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then 
								case
									when Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then
								case
									when Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 258 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 258 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then
								case
									when Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 258 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then
								case
									when Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 258 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (12,13,14) or Hands_n.stat_type2 IN (12,13,14) or Hands_n.stat_type3 IN (12,13,14) or Hands_n.stat_type4 IN (12,13,14) or Hands_n.stat_type5 IN (12,13,14) or Hands_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Hands_n.stat_type1 = 4 or Hands_n.stat_type2 = 4 or Hands_n.stat_type3 = 4 or Hands_n.stat_type4 = 4 or Hands_n.stat_type5 = 4 or Hands_n.stat_type6 = 4) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Hands_n.stat_type1 = 3 or Hands_n.stat_type2 = 3 or Hands_n.stat_type3 = 3 or Hands_n.stat_type4 = 3 or Hands_n.stat_type5 = 3 or Hands_n.stat_type6 = 3) AND (Hands_n.stat_type1 IN (0,31,32,38,44) or Hands_n.stat_type2 IN (0,31,32,38,44) or Hands_n.stat_type3 IN (0,31,32,38,44) or Hands_n.stat_type4 IN (0,31,32,38,44) or Hands_n.stat_type5 IN (0,31,32,38,44) or Hands_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Hands_n.ItemLevel < 251 then '3 Heroic'
									when Hands_n.socketColor_1 = 0 and Hands_n.socketColor_2 = 0 and Hands_n.socketColor_3 = 0 then
										case
											when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Hands.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Hands.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Hands.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Hands_n.ItemLevel >= 251 AND Hands_n.ItemLevel < 258 then '4 ICC10'
									When Hands_n.ItemLevel >= 264 AND Hands_n.ItemLevel <=271 then '5 ICC25/10H'
									When Hands_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (31) or Hands_n.stat_type2 IN (31) or Hands_n.stat_type3 IN (31) or Hands_n.stat_type4 IN (31) or Hands_n.stat_type5 IN (31) or Hands_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Hands_n.stat_type1 = 5 or Hands_n.stat_type2 = 5 or Hands_n.stat_type3 = 5 or Hands_n.stat_type4 = 5 or Hands_n.stat_type5 = 5 or Hands_n.stat_type6 = 5) AND (Hands_n.stat_type1 IN (32,36,45) or Hands_n.stat_type2 IN (32,36,45) or Hands_n.stat_type3 IN (32,36,45) or Hands_n.stat_type4 IN (32,36,45) or Hands_n.stat_type5 IN (32,36,45) or Hands_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '11 Hand Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 258 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then 
								case
									when Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then
								case
									when Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 258 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 258 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then
								case
									when Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 258 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then
								case
									when Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 258 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (12,13,14) or Back_n.stat_type2 IN (12,13,14) or Back_n.stat_type3 IN (12,13,14) or Back_n.stat_type4 IN (12,13,14) or Back_n.stat_type5 IN (12,13,14) or Back_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Back_n.stat_type1 = 4 or Back_n.stat_type2 = 4 or Back_n.stat_type3 = 4 or Back_n.stat_type4 = 4 or Back_n.stat_type5 = 4 or Back_n.stat_type6 = 4) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Back_n.stat_type1 = 3 or Back_n.stat_type2 = 3 or Back_n.stat_type3 = 3 or Back_n.stat_type4 = 3 or Back_n.stat_type5 = 3 or Back_n.stat_type6 = 3) AND (Back_n.stat_type1 IN (0,31,32,38,44) or Back_n.stat_type2 IN (0,31,32,38,44) or Back_n.stat_type3 IN (0,31,32,38,44) or Back_n.stat_type4 IN (0,31,32,38,44) or Back_n.stat_type5 IN (0,31,32,38,44) or Back_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Back_n.ItemLevel < 251 then '3 Heroic'
									when Back_n.socketColor_1 = 0 and Back_n.socketColor_2 = 0 and Back_n.socketColor_3 = 0 then
										case
											when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
										end
									when Back.enchantments = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' then '7 Gear missing enchanting / gem'
									when left(Back.enchantments,5) = '0 0 0' then '8 Gear missing enchanting'
									when RIGHT(Back.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Back_n.ItemLevel >= 251 AND Back_n.ItemLevel < 258 then '4 ICC10'
									When Back_n.ItemLevel >= 264 AND Back_n.ItemLevel <=271 then '5 ICC25/10H'
									When Back_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (31) or Back_n.stat_type2 IN (31) or Back_n.stat_type3 IN (31) or Back_n.stat_type4 IN (31) or Back_n.stat_type5 IN (31) or Back_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Back_n.stat_type1 = 5 or Back_n.stat_type2 = 5 or Back_n.stat_type3 = 5 or Back_n.stat_type4 = 5 or Back_n.stat_type5 = 5 or Back_n.stat_type6 = 5) AND (Back_n.stat_type1 IN (32,36,45) or Back_n.stat_type2 IN (32,36,45) or Back_n.stat_type3 IN (32,36,45) or Back_n.stat_type4 IN (32,36,45) or Back_n.stat_type5 IN (32,36,45) or Back_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '12 Back Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 258 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then 
								case
									when Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then
								case
									when Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 258 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 258 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then
								case
									when Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 258 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then
								case
									when Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 258 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (12,13,14) or Finger1_n.stat_type2 IN (12,13,14) or Finger1_n.stat_type3 IN (12,13,14) or Finger1_n.stat_type4 IN (12,13,14) or Finger1_n.stat_type5 IN (12,13,14) or Finger1_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger1_n.stat_type1 = 4 or Finger1_n.stat_type2 = 4 or Finger1_n.stat_type3 = 4 or Finger1_n.stat_type4 = 4 or Finger1_n.stat_type5 = 4 or Finger1_n.stat_type6 = 4) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger1_n.stat_type1 = 3 or Finger1_n.stat_type2 = 3 or Finger1_n.stat_type3 = 3 or Finger1_n.stat_type4 = 3 or Finger1_n.stat_type5 = 3 or Finger1_n.stat_type6 = 3) AND (Finger1_n.stat_type1 IN (0,31,32,38,44) or Finger1_n.stat_type2 IN (0,31,32,38,44) or Finger1_n.stat_type3 IN (0,31,32,38,44) or Finger1_n.stat_type4 IN (0,31,32,38,44) or Finger1_n.stat_type5 IN (0,31,32,38,44) or Finger1_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Finger1_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger1.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger1_n.ItemLevel >= 251 AND Finger1_n.ItemLevel < 258 then '4 ICC10'
									When Finger1_n.ItemLevel >= 264 AND Finger1_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger1_n.ItemLevel >= 277 then '6 ICC25H'
								END 
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (31) or Finger1_n.stat_type2 IN (31) or Finger1_n.stat_type3 IN (31) or Finger1_n.stat_type4 IN (31) or Finger1_n.stat_type5 IN (31) or Finger1_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger1_n.stat_type1 = 5 or Finger1_n.stat_type2 = 5 or Finger1_n.stat_type3 = 5 or Finger1_n.stat_type4 = 5 or Finger1_n.stat_type5 = 5 or Finger1_n.stat_type6 = 5) AND (Finger1_n.stat_type1 IN (32,36,45) or Finger1_n.stat_type2 IN (32,36,45) or Finger1_n.stat_type3 IN (32,36,45) or Finger1_n.stat_type4 IN (32,36,45) or Finger1_n.stat_type5 IN (32,36,45) or Finger1_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
		 end  AS '13 Finger 1 Analyze',

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 258 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then 
								case
									when Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then
								case
									when Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 258 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 258 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then
								case
									when Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 258 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then
								case
									when Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 258 then '4 ICC10'
									When Finger2_n.ItemLevel >= 264 AND Finger2_n.ItemLevel <=271 then '5 ICC25/10H'
									When Finger2_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (31) or Finger2_n.stat_type2 IN (31) or Finger2_n.stat_type3 IN (31) or Finger2_n.stat_type4 IN (31) or Finger2_n.stat_type5 IN (31) or Finger2_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Finger2_n.stat_type1 = 5 or Finger2_n.stat_type2 = 5 or Finger2_n.stat_type3 = 5 or Finger2_n.stat_type4 = 5 or Finger2_n.stat_type5 = 5 or Finger2_n.stat_type6 = 5) AND (Finger2_n.stat_type1 IN (32,36,45) or Finger2_n.stat_type2 IN (32,36,45) or Finger2_n.stat_type3 IN (32,36,45) or Finger2_n.stat_type4 IN (32,36,45) or Finger2_n.stat_type5 IN (32,36,45) or Finger2_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (12,13,14) or Finger2_n.stat_type2 IN (12,13,14) or Finger2_n.stat_type3 IN (12,13,14) or Finger2_n.stat_type4 IN (12,13,14) or Finger2_n.stat_type5 IN (12,13,14) or Finger2_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Finger2_n.stat_type1 = 4 or Finger2_n.stat_type2 = 4 or Finger2_n.stat_type3 = 4 or Finger2_n.stat_type4 = 4 or Finger2_n.stat_type5 = 4 or Finger2_n.stat_type6 = 4) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Finger2_n.stat_type1 = 3 or Finger2_n.stat_type2 = 3 or Finger2_n.stat_type3 = 3 or Finger2_n.stat_type4 = 3 or Finger2_n.stat_type5 = 3 or Finger2_n.stat_type6 = 3) AND (Finger2_n.stat_type1 IN (0,31,32,38,44) or Finger2_n.stat_type2 IN (0,31,32,38,44) or Finger2_n.stat_type3 IN (0,31,32,38,44) or Finger2_n.stat_type4 IN (0,31,32,38,44) or Finger2_n.stat_type5 IN (0,31,32,38,44) or Finger2_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Finger2_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Finger2.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Finger2_n.ItemLevel >= 251 AND Finger2_n.ItemLevel < 258 then '4 ICC10'
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
						when Trinket1_n.ItemLevel < 251 then '3 Heroic Tank'
						when Trinket1_n.ItemLevel >= 251 AND Trinket1_n.ItemLevel < 258 then '4 ICC10 Tank'
						When Trinket1_n.ItemLevel >= 264 AND Trinket1_n.ItemLevel <=271 then '5 ICC25/10H Tank'
						When Trinket1_n.ItemLevel >= 277 then '6 ICC25H Tank'
					END
  			  when (Trinket1_n.stat_type1 IN (31,32,38,44) or Trinket1_n.stat_type2 IN (31,32,38,44) or Trinket1_n.stat_type3 IN (31,32,38,44) or Trinket1_n.stat_type4 IN (31,32,38,44) or Trinket1_n.stat_type5 IN (31,32,38,44) or Trinket1_n.stat_type6 IN (31,32,38,44)) then
					case
						when Trinket1_n.ItemLevel < 251 then '3 Heroic DPS'
						when Trinket1_n.ItemLevel >= 251 AND Trinket1_n.ItemLevel < 258 then '4 ICC10 DPS'
						When Trinket1_n.ItemLevel >= 264 AND Trinket1_n.ItemLevel <=271 then '5 ICC25/10H DPS'
						When Trinket1_n.ItemLevel >= 277 then '6 ICC25H DPS'
					END
			  when (Trinket1_n.stat_type1 IN (43) or Trinket1_n.stat_type2 IN (43) or Trinket1_n.stat_type3 IN (43) or Trinket1_n.stat_type4 IN (43) or Trinket1_n.stat_type5 IN (43) or Trinket1_n.stat_type6 IN (43)) then
					case
						when Trinket1_n.ItemLevel < 251 then '3 Heroic DPS/heal'
						when Trinket1_n.ItemLevel >= 251 AND Trinket1_n.ItemLevel < 258 then '4 ICC10 DPS/heal'
						When Trinket1_n.ItemLevel >= 264 AND Trinket1_n.ItemLevel <=271 then '5 ICC25/10H DPS/heal'
						When Trinket1_n.ItemLevel >= 277 then '6 ICC25H DPS/heal'
					end
		 END AS '15 Trinket 1 Analyze',

		 case 
		 	  when (Trinket2_n.stat_type1 IN (12,13,14) or Trinket2_n.stat_type2 IN (12,13,14) or Trinket2_n.stat_type3 IN (12,13,14) or Trinket2_n.stat_type4 IN (12,13,14) or Trinket2_n.stat_type5 IN (12,13,14) or Trinket2_n.stat_type6 IN (12,13,14)) then
		 	  		case
						when Trinket2_n.ItemLevel < 251 then '3 Heroic Tank'
						when Trinket2_n.ItemLevel >= 251 AND Trinket2_n.ItemLevel < 258 then '4 ICC10 Tank'
						When Trinket2_n.ItemLevel >= 264 AND Trinket2_n.ItemLevel <=271 then '5 ICC25/10H Tank'
						When Trinket2_n.ItemLevel >= 277 then '6 ICC25H Tank'
					END
  			  when (Trinket2_n.stat_type1 IN (31,32,38,44) or Trinket2_n.stat_type2 IN (31,32,38,44) or Trinket2_n.stat_type3 IN (31,32,38,44) or Trinket2_n.stat_type4 IN (31,32,38,44) or Trinket2_n.stat_type5 IN (31,32,38,44) or Trinket2_n.stat_type6 IN (31,32,38,44)) then
					case
						when Trinket2_n.ItemLevel < 251 then '3 Heroic DPS'
						when Trinket2_n.ItemLevel >= 251 AND Trinket2_n.ItemLevel < 258 then '4 ICC10 DPS'
						When Trinket2_n.ItemLevel >= 264 AND Trinket2_n.ItemLevel <=271 then '5 ICC25/10H DPS'
						When Trinket2_n.ItemLevel >= 277 then '6 ICC25H DPS'
					END
			  when (Trinket2_n.stat_type1 IN (43) or Trinket2_n.stat_type2 IN (43) or Trinket2_n.stat_type3 IN (43) or Trinket2_n.stat_type4 IN (43) or Trinket2_n.stat_type5 IN (43) or Trinket2_n.stat_type6 IN (43)) then
					case
						when Trinket2_n.ItemLevel < 251 then '3 Heroic DPS/heal'
						when Trinket2_n.ItemLevel >= 251 AND Trinket2_n.ItemLevel < 258 then '4 ICC10 DPS/heal'
						When Trinket2_n.ItemLevel >= 264 AND Trinket2_n.ItemLevel <=271 then '5 ICC25/10H DPS/heal'
						When Trinket2_n.ItemLevel >= 277 then '6 ICC25H DPS/heal'
					END
		 END AS '16 Trinket 2 analyze',
		 

		 case
			 #Strength DPS
		     when (creature_template.unit_class = 1 and npcbot.spec IN (1,2)) OR (creature_template.unit_class = 2 and npcbot.spec = 6) OR (creature_template.unit_class = 6 and npcbot.roles = 18) then 
		     		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 258 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END 
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Strength Tank
		     when (creature_template.unit_class = 1 and npcbot.spec = 3) OR (creature_template.unit_class = 2 and npcbot.spec = 5) OR (creature_template.unit_class = 6 and npcbot.roles IN (17,19)) then
		     		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then 
								case
									when Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 258 then '4 ICC10'
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
		      when (creature_template.unit_class in (8,9)) OR (creature_template.unit_class = 7 and npcbot.spec = 19) OR (creature_template.unit_class = 11 and npcbot.spec = 28) OR (creature_template.unit_class = 5 and npcbot.spec = 15) then
			 		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then
								case
									when Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 258 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then 
						  		case
									when Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 258 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			  #Healer / DPS
		     when (creature_template.unit_class = 2 and npcbot.spec = 4) OR (creature_template.unit_class = 5 and npcbot.spec IN (13,14)) OR (creature_template.unit_class in (8,9)) OR 
			       (creature_template.unit_class = 7 and npcbot.spec = 21) OR (creature_template.unit_class = 11 and npcbot.spec = 30) then 
			 		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then '2 Gear not optimal for Healer'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then
								case
									when Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 258 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END
			 	  	END
			 	#Agility Tank
		     when creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles IN (17,19) then 
			 		case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then
								case
									when Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 258 then '4 ICC10'
									When Neck_n.ItemLevel >= 264 AND Neck_n.ItemLevel <=271 then '5 ICC25/10H'
									When Neck_n.ItemLevel >= 277 then '6 ICC25H'
								END
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (31) or Neck_n.stat_type2 IN (31) or Neck_n.stat_type3 IN (31) or Neck_n.stat_type4 IN (31) or Neck_n.stat_type5 IN (31) or Neck_n.stat_type6 IN (31)) then '1 Gear with wrong stat'
				  		when (Neck_n.stat_type1 = 5 or Neck_n.stat_type2 = 5 or Neck_n.stat_type3 = 5 or Neck_n.stat_type4 = 5 or Neck_n.stat_type5 = 5 or Neck_n.stat_type6 = 5) AND (Neck_n.stat_type1 IN (32,36,45) or Neck_n.stat_type2 IN (32,36,45) or Neck_n.stat_type3 IN (32,36,45) or Neck_n.stat_type4 IN (32,36,45) or Neck_n.stat_type5 IN (32,36,45) or Neck_n.stat_type6 IN (32,36,45)) then '1 Gear with wrong stat'
			 	  	END
			 #Agility DPS
		     when (creature_template.unit_class IN (3,4)) OR (creature_template.unit_class = 11 and npcbot.spec = 29 AND npcbot.roles = 2) OR (creature_template.unit_class = 7 and npcbot.spec = 20) then 
					case 
			 	  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (12,13,14) or Neck_n.stat_type2 IN (12,13,14) or Neck_n.stat_type3 IN (12,13,14) or Neck_n.stat_type4 IN (12,13,14) or Neck_n.stat_type5 IN (12,13,14) or Neck_n.stat_type6 IN (12,13,14)) then '1 Gear with wrong stat'
	  			  		when (Neck_n.stat_type1 = 4 or Neck_n.stat_type2 = 4 or Neck_n.stat_type3 = 4 or Neck_n.stat_type4 = 4 or Neck_n.stat_type5 = 4 or Neck_n.stat_type6 = 4) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then '1 Gear with wrong stat'
			 	  		when (Neck_n.stat_type1 = 3 or Neck_n.stat_type2 = 3 or Neck_n.stat_type3 = 3 or Neck_n.stat_type4 = 3 or Neck_n.stat_type5 = 3 or Neck_n.stat_type6 = 3) AND (Neck_n.stat_type1 IN (0,31,32,38,44) or Neck_n.stat_type2 IN (0,31,32,38,44) or Neck_n.stat_type3 IN (0,31,32,38,44) or Neck_n.stat_type4 IN (0,31,32,38,44) or Neck_n.stat_type5 IN (0,31,32,38,44) or Neck_n.stat_type6 IN (0,31,32,38,44)) then 
								case
									when Neck_n.ItemLevel < 251 then '3 Heroic'
									when RIGHT(Neck.enchantments,70) = '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ' then '9 Gear missing gem'
									when Neck_n.ItemLevel >= 251 AND Neck_n.ItemLevel < 258 then '4 ICC10'
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
left JOIN world.item_template MhEx_n ON MhEx_n.entry = mhex.itementry
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
