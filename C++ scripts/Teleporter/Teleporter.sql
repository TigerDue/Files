
SET
@NPCID := 100000, -- Set the npc Entry ID
@WEAPONID := 5276, -- Set the weapon Entry ID
@TEXT_A_ENTRY := '100000', -- Set the interraction text for alliance
@TEXT_H_ENTRY := '100001', -- Set the interraction text for alliance
@TEXT_A := 'Battle Stars Alliance menu access', -- Set the interraction text for alliance
@TEXT_H := 'Battle Stars Horde menu access', -- Set the interraction text for horde
@NPC_SCRIPT : ='AlexeWarrTeleporter_Gossip'; -- Set the script id


-- [[ DO NOT TOUCH ANYTHING AFTER THIS LINE ]] --
-- Clean before insertion
DELETE FROM `creature` WHERE `id` = @NPCID; 					-- clean creature
DELETE FROM `creature_template` WHERE `entry` = @NPCID; 		-- clean creature template
DELETE FROM `creature_equip_template` WHERE `entry` = @NPCID; 	-- clean creature equip template
DELETE FROM `creature_template_addon` WHERE `entry` = @NPCID; 	-- clean creature template addon
DELETE FROM `npc_text` WHERE `ID` = @TEXT_A_ENTRY; 				-- clean npc text
DELETE FROM `npc_text` WHERE `ID` = @TEXT_H_ENTRY; 				-- clean npc text

-- Inserting..
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (100000, 0, 0, 0, 0, 0, 29829, 0, 0, 0, 'Teleporter', '|cFFFFCD00Battle Stars|r', NULL, 0, 80, 80, 0, 35, 35, 1, 1, 1.14286, 1.8, 1, 0, 0, 0, 0, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 183.149, 0.113456, 12.7845, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, @NPC_SCRIPT, 1);

-- Add weapon on back-side
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES (@NPCID, 1, @WEAPONID, 0, 0);

-- Required to make the weapon sheath on back-side
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPCID, 0, 0, 0, 0, 0, NULL);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`) VALUES 
(@TEXT_A_ENTRY, @TEXT_A, NULL),
(@TEXT_H_ENTRY, @TEXT_H, NULL);

-- Inserting teleporter text languages
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (51100, '|TInterface\\icons\\Achievement_BG_3flagcap_nodeaths:24:24:0:0|t World Global Cities', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (51101, '|TInterface\\icons\\Achievement_BG_KillFlagCarriers_grabFlag_CapIt:24:24:0:0|t World Battle Arenas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (51102, '|TInterface\\icons\\Ability_Hunter_Pet_WindSerpent:24:24:0:0|t Silver Instances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (51103, '|TInterface\\icons\\INV_Misc_PheonixPet_01:24:24:0:0|t Golden Instances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (51104, '|TInterface\\icons\\Achievement_Dungeon_Outland_DungeonMaster:24:24:0:0|t Platinum Instances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (51105, '|TInterface\\icons\\Achievement_Dungeon_Outland_Dungeon_Hero:24:24:0:0|t Titanium Instances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
