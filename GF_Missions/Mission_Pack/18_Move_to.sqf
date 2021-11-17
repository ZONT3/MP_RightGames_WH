


//________________  Author : GEORGE FLOROS [GR] ___________ 29.08.18 _____________

/*
________________ GF Missions Script ________________

https://forums.bohemia.net/forums/topic/219080-gf-missions-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


sleep GF_Missions_Wait_Time;


diag_log "//________________ 18_Move_to.sqf _____________";

sleep 2;

	if (GF_Missions_Systemchat_info) then {
	systemchat "18_Move_to  Initializing";
	};

//________________	Spawn Objects	________________


_Move_to = "C_Offroad_01_repair_F" createVehicle GF_Missions_pos;
_Move_to setObjectTextureGlobal [0, "GF_Missions\images\GF_Police_Offroad.paa"];

//Type of loot
_weapons_Loot = selectRandom [
			//LightMachineGuns
			"arifle_MX_SW_Black_F",
			"arifle_MX_SW_F",
			"LMG_Mk200_F",
			"LMG_Zafir_F",
			"LMG_03_F",
			"MMG_01_hex_F",
			"MMG_01_tan_F",
			"MMG_02_black_F",
			"MMG_02_camo_F",
			"MMG_02_sand_F",
			//Apex
			"LMG_03_F",

			//AssaultRifles
			"arifle_Katiba_C_F",
			"arifle_Katiba_F",
			"arifle_Katiba_GL_F",
			"arifle_Mk20_F",
			"arifle_Mk20_GL_F",
			"arifle_Mk20_GL_plain_F",
			"arifle_Mk20_plain_F",
			"arifle_Mk20C_F",
			"arifle_Mk20C_plain_F",
			"arifle_MX_Black_F",
			"arifle_MX_F",
			"arifle_MX_GL_Black_F",
			"arifle_MX_GL_F",
			"arifle_MXC_Black_F",
			"arifle_MXC_F",
			"arifle_SDAR_F",
			"arifle_TRG20_F",
			"arifle_TRG21_F",
			"arifle_TRG21_GL_F",
			//Apex AssaultRifles
			"arifle_AK12_F",
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKM_FL_F",
			"arifle_AKS_F",
			//AK x2
			"arifle_AK12_F",
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKM_FL_F",
			"arifle_AKS_F",
			//
			"arifle_ARX_blk_F",
			"arifle_ARX_ghex_F",
			"arifle_ARX_hex_F",
			"arifle_CTAR_blk_F",
			"arifle_CTAR_hex_F",
			"arifle_CTAR_ghex_F",
			"arifle_CTAR_GL_blk_F",
			"arifle_CTARS_blk_F",
			"arifle_CTARS_hex_F",
			"arifle_CTARS_ghex_F",
			"arifle_SPAR_01_blk_F",
			"arifle_SPAR_01_khk_F",
			"arifle_SPAR_01_snd_F",
			"arifle_SPAR_01_GL_blk_F",
			"arifle_SPAR_01_GL_khk_F",
			"arifle_SPAR_01_GL_snd_F",
			"arifle_SPAR_02_blk_F",
			"arifle_SPAR_02_khk_F",
			"arifle_SPAR_02_snd_F",
			"arifle_SPAR_03_blk_F",
			"arifle_SPAR_03_khk_F",
			"arifle_SPAR_03_snd_F",
			"arifle_MX_khk_F",
			"arifle_MX_GL_khk_F",
			"arifle_MXC_khk_F",
			"arifle_MXM_khk_F",

			//SniperRifles
			"arifle_MXM_Black_F",
			"arifle_MXM_F",
			"srifle_DMR_01_F",
			"srifle_DMR_02_camo_F",
			"srifle_DMR_02_F",
			"srifle_DMR_02_sniper_F",
			"srifle_DMR_03_F",
			"srifle_DMR_03_khaki_F",
			"srifle_DMR_03_multicam_F",
			"srifle_DMR_03_tan_F",
			"srifle_DMR_03_woodland_F",
			"srifle_DMR_04_F",
			"srifle_DMR_04_Tan_F",
			"srifle_DMR_05_blk_F",
			"srifle_DMR_05_hex_F",
			"srifle_DMR_05_tan_f",
			"srifle_DMR_06_camo_F",
			"srifle_DMR_06_olive_F",
			"srifle_EBR_F",
			"srifle_GM6_camo_F",
			"srifle_GM6_F",
			"srifle_LRR_camo_F",
			"srifle_LRR_F",
			//Apex SniperRifles
			"srifle_LRR_tna_F",
			"srifle_GM6_ghex_F",
			"srifle_DMR_07_blk_F",
			"srifle_DMR_07_hex_F",
			"srifle_DMR_07_ghex_F",

			// Launchers
			"launch_NLAW_F",
			"launch_RPG32_F",
			"launch_RPG32_ghex_F",
			"launch_RPG7_F",
			"launch_RPG7_F",	//x2
			"launch_Titan_F",
			"launch_I_Titan_F",
			"launch_O_Titan_ghex_F",
			"launch_O_Titan_F",
			"launch_B_Titan_F",
			"launch_B_Titan_tna_F",
			"launch_Titan_short_F",
			"launch_O_Titan_short_F",
			"launch_O_Titan_short_ghex_F",
			"launch_I_Titan_short_F",
			"launch_B_Titan_short_F",
			"launch_B_Titan_short_tna_F"
			];


_sideweapons_loot = selectRandom [
			//Pistols
			"hgun_ACPC2_F",
			"hgun_P07_F",
			"hgun_Pistol_heavy_01_F",
			"hgun_Pistol_heavy_02_F",
			"hgun_Pistol_Signal_F",
			"hgun_Rook40_F",
			//Apex
			"hgun_Pistol_01_F",
			"hgun_P07_khk_F",

			//SubMachineGuns
			"hgun_PDW2000_F",
			"SMG_01_F",
			"SMG_02_F",
			"SMG_05_F"
			];


_items_loot1 = selectRandom [
			//for RyanZombies
			//"RyanZombiesAntiVirusTemporary_Item",
			//"RyanZombiesAntiVirusCure_Item",

			//Vanilla
			"ToolKit",
			"MediKit",
			"FirstAidKit",
			"FirstAidKit",
			//Tools
			"Binocular",
			"Rangefinder",
			"Laserdesignator",
			"Laserdesignator_02",
			"Laserdesignator_03"
			];


_items_loot2 = selectRandom [
			//Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"ItemMap",
			//x2
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"ItemMap",
			//PointerAttachments
			"acc_flashlight",
			"acc_pointer_IR",
			//BipodAttachments
			"bipod_01_F_blk",
			"bipod_01_F_mtp",
			"bipod_01_F_snd",
			"bipod_02_F_blk",
			"bipod_02_F_hex",
			"bipod_02_F_tan",
			"bipod_03_F_blk",
			"bipod_03_F_oli",
			//Apex
			"bipod_01_F_khk",
			//MuzzleAttachments
			"muzzle_snds_338_black",
			"muzzle_snds_338_green",
			"muzzle_snds_338_sand",
			"muzzle_snds_93mmg",
			"muzzle_snds_93mmg_tan",
			"muzzle_snds_acp",
			"muzzle_snds_B",
			"muzzle_snds_H",
			"muzzle_snds_H_MG",
			"muzzle_snds_H_SW",
			"muzzle_snds_L",
			"muzzle_snds_M",
			//Apex
			"muzzle_snds_H_khk_F",
			"muzzle_snds_H_snd_F",
			"muzzle_snds_58_blk_F",
			"muzzle_snds_m_khk_F",
			"muzzle_snds_m_snd_F",
			"muzzle_snds_B_khk_F",
			"muzzle_snds_B_snd_F",
			"muzzle_snds_58_wdm_F",
			"muzzle_snds_65_TI_blk_F",
			"muzzle_snds_65_TI_hex_F",
			"muzzle_snds_65_TI_ghex_F",
			"muzzle_snds_H_MG_blk_F",
			"muzzle_snds_H_MG_khk_F",
			//OpticAttachments
			"optic_Aco",
			"optic_ACO_grn",
			"optic_ACO_grn_smg",
			"optic_Aco_smg",
			"optic_AMS",
			"optic_AMS_khk",
			"optic_AMS_snd",
			"optic_Arco",
			"optic_DMS",
			"optic_Hamr",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_KHS_blk",
			"optic_KHS_hex",
			"optic_KHS_old",
			"optic_KHS_tan",
			"optic_LRPS",
			"optic_MRCO",
			"optic_MRD",
			"optic_Nightstalker",
			"optic_NVS",
			"optic_SOS",
			"optic_tws",
			"optic_tws_mg",
			"optic_Yorris",
			//Apex
			"optic_Arco_blk_F",
			"optic_Arco_ghex_F",
			"optic_DMS_ghex_F",
			"optic_Hamr_khk_F",
			"optic_ERCO_blk_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_snd_F",
			"optic_SOS_khk_F",
			"optic_LRPS_tna_F",
			"optic_LRPS_ghex_F",
			"optic_Holosight_blk_F",
			"optic_Holosight_khk_F",
			"optic_Holosight_smg_blk_F",

			//NVG
			"NVGoggles",
			"NVGoggles_INDEP",
			"NVGoggles_OPFOR",
			//Apex
			"O_NVGoggles_hex_F",
			"O_NVGoggles_urb_F",
			"O_NVGoggles_ghex_F",
			"NVGoggles_tna_F"
			];


_items_loot3 = selectRandom [
			//Flares
			"Chemlight_blue",
			"Chemlight_green",
			"Chemlight_red",
			//Smokes
			"SmokeShell",
			"SmokeShellBlue",
			"SmokeShellGreen",
			"SmokeShellOrange",
			"SmokeShellPurple",
			"SmokeShellRed",
			"SmokeShellYellow",
			"1Rnd_Smoke_Grenade_shell",
			"1Rnd_SmokeBlue_Grenade_shell",
			"1Rnd_SmokeGreen_Grenade_shell",
			"1Rnd_SmokeOrange_Grenade_shell",
			"1Rnd_SmokePurple_Grenade_shell",
			"1Rnd_SmokeRed_Grenade_shell",
			"1Rnd_SmokeYellow_Grenade_shell",
			"3Rnd_Smoke_Grenade_shell",
			"3Rnd_SmokeBlue_Grenade_shell",
			"3Rnd_SmokeGreen_Grenade_shell",
			"3Rnd_SmokeOrange_Grenade_shell",
			"3Rnd_SmokePurple_Grenade_shell",
			"3Rnd_SmokeRed_Grenade_shell",
			"3Rnd_SmokeYellow_Grenade_shell",
			//Explosives
			"HandGrenade",
			"MiniGrenade",
			"B_IR_Grenade",
			"O_IR_Grenade",
			"I_IR_Grenade",
			"1Rnd_HE_Grenade_shell",
			"3Rnd_HE_Grenade_shell",
			"APERSBoundingMine_Range_Mag",
			"APERSMine_Range_Mag",
			"APERSTripMine_Wire_Mag",
			"ClaymoreDirectionalMine_Remote_Mag",
			"DemoCharge_Remote_Mag",
			"IEDLandBig_Remote_Mag",
			"IEDLandSmall_Remote_Mag",
			"IEDUrbanBig_Remote_Mag",
			"IEDUrbanSmall_Remote_Mag",
			"SatchelCharge_Remote_Mag",
			"SLAMDirectionalMine_Wire_Mag"
			];


			_Ravage_item = selectRandom [
			// Ravage_items
			//x1
			"rvg_plasticBottleEmpty",
			"rvg_canteenEmpty",
			"rvg_hose",
			"rvg_sleepingBag_Blue",
			"rvg_foldedTent",
			"rvg_rustyCan",
			"rvg_Geiger",
			"rvg_canisterFuel_Empty",
			"rvg_toolkit",
			"rvg_tire",
			//x2 Vital
			"rvg_money",
			"rvg_notepad",
			"rvg_docFolder",
			"rvg_canOpener",
			"rvg_guttingKnife",
			"rvg_matches",
			"rvg_plasticBottle",
			"rvg_plasticBottlePurified",
			"rvg_spirit",
			"rvg_franta",
			"rvg_beans",
			"rvg_bacon",
			"rvg_milk",
			"rvg_rice",
			"rvg_antiRad",
			"rvg_purificationTablets",
			//x2 Vital
			"rvg_money",
			"rvg_notepad",
			"rvg_docFolder",
			"rvg_canOpener",
			"rvg_guttingKnife",
			"rvg_matches",
			"rvg_plasticBottle",
			"rvg_plasticBottlePurified",
			"rvg_spirit",
			"rvg_franta",
			"rvg_beans",
			"rvg_bacon",
			"rvg_milk",
			"rvg_rice",
			"rvg_antiRad",
			"rvg_purificationTablets",

			//addon Ravage
			"Mask_M40_OD",
			"Mask_M40",
			"Mask_M50"
			];



//addweaponcargo	addItemCargo	addMagazineCargo

//	weapons
_Move_to addweaponcargo [_weapons_Loot, 5];	//	5 is the amount

//	sideweapons
_Move_to addweaponcargo [_sideweapons_loot, 5];

//	items 1
_Move_to addweaponcargo [_items_loot1, 5];

//	items 2 Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
_Move_to addItemCargo [_items_loot2, 5];

//	items 2 Here ONLY :Flares , Smokes , Explosives
_Move_to addMagazineCargo [_items_loot3, 5];

//lootitems6 items 3 Ravage
_Move_to addItemCargo [_Ravage_item, 5];

//	weapon's cargo mags
_magazines_weapon = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass_weapon = _magazines_weapon call bis_fnc_selectRandom;

_Move_to addMagazineCargoGlobal [_magazineClass_weapon, 10];		//	10 mags


//	sideweapon's cargo mag
_magazines_sideweapon = getArray (configFile / "CfgWeapons" / _sideweapons_loot / "magazines");
_magazineClass_sideweapon = _magazines_sideweapon call bis_fnc_selectRandom;

_Move_to addMagazineCargoGlobal [_magazineClass_sideweapon, 10];	//	10 mags


//	Extra type of magazines
_magazines_Extra = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass_Extra = _magazines_Extra call bis_fnc_selectRandom;
_Move_to addMagazineCargoGlobal [_magazineClass_Extra, 10];	//	10 mags



	if (GF_Missions_Systemchat_info) then {
	systemchat "Mission is Generated";
	};

	//________________	Set Task	________________

	[GF_Missions_allPlayers,["18_Move_to","GF_Missions_Pack"],["Move to Location , Follow directions","Move to Location",""], _Move_to,true,1,true,"move",true] call BIS_fnc_taskCreate;
	["18_Move_to","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	waitUntil { { _x distance _Move_to < 20 } count GF_Missions_allPlayers > 0 };

	sleep 2;
	if (GF_Missions_saveGame) then {
	saveGame;
	};


	sleep 5;

	["18_Move_to", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

	sleep 5;


//________________	Spawn Objects	________________

_randomPos_Building = [] call BIS_fnc_randomPos;
_Building = "Land_BagBunker_Tower_F" createVehicle _randomPos_Building;
_Building setDir (random 360);


//________________ Positions / distance , direction	________________
_Group_Pos	= getpos _Building;
_Object_1_Pos = [_Group_Pos, -10, 20] call BIS_fnc_relPos;
_Object_2_Pos = [_Group_Pos, 10, 20] call BIS_fnc_relPos;
_Object_3_Pos = [_Group_Pos, 25, 60] call BIS_fnc_relPos;
_Object_4_Pos = [_Group_Pos, 25, 90] call BIS_fnc_relPos;
_Patrol_Pos = [_Group_Pos, 50, 15] call BIS_fnc_relPos;
_Defend_Pos = [_Group_Pos, 50, 15] call BIS_fnc_relPos;


//________________ Create _Object_1 ________________

_Object_1 = "Land_BagBunker_Tower_F" createVehicle _Object_1_Pos;
_Object_1 setDir (random 360);


//________________ Create _Object_2 ________________

_Object_2 = "Box_FIA_Wps_F" createVehicle _Object_2_Pos;
_Object_2 setDir (random 360);


//________________ Create _Object_3 ________________
_Object_3_array = selectRandom [
"C_SUV_01_F",
"C_Offroad_01_F",
"C_Hatchback_01_sport_F",
"C_Van_01_transport_F",
"C_Quadbike_01_F"
];

_Object_3 = createVehicle [_Object_3_array, _Object_3_Pos, [], 0, "CAN_COLLIDE"];
_Object_3 setDir (random 360);

//________________ Create _Object_4 ________________
_Object_4 = createVehicle [_Object_3_array, _Object_4_Pos, [], 0, "CAN_COLLIDE"];
_Object_4 setDir (random 360);

//________________ Create a Flag with your pic 256x256 ________________
_Flag = "FlagPole_F" createVehicle getpos _Building;
_Flag setFlagTexture "GF_Missions\images\GF_Spartan_Flag.jpg";	//	Set your image for the flag
_Flag setDir (random 360);


//________________ Spawn Groups	________________

//________________	Defend	________________
_Group_Defend = [ _Group_Pos, WEST, [
"O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F",
"O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F",
"O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F",
"O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F"
]] call BIS_fnc_spawnGroup;

_Group_Defend setBehaviour "COMBAT";	//	AWARE
_Group_Defend setCombatMode "RED";		//	YELLOW

[_Group_Defend, _Group_Pos] call BIS_fnc_taskDefend;

{

//________________	Type of _weapons	________________
_weapons = selectRandom [
			//LightMachineGuns
			"arifle_MX_SW_Black_F",
			"arifle_MX_SW_F",
			"LMG_Mk200_F",
			"LMG_Zafir_F",
			"LMG_03_F",
			"MMG_01_hex_F",
			"MMG_01_tan_F",
			"MMG_02_black_F",
			"MMG_02_camo_F",
			"MMG_02_sand_F",
			//Apex
			"LMG_03_F",

			//AssaultRifles
			"arifle_Katiba_C_F",
			"arifle_Katiba_F",
			"arifle_Katiba_GL_F",
			"arifle_Mk20_F",
			"arifle_Mk20_GL_F",
			"arifle_Mk20_GL_plain_F",
			"arifle_Mk20_plain_F",
			"arifle_Mk20C_F",
			"arifle_Mk20C_plain_F",
			"arifle_MX_Black_F",
			"arifle_MX_F",
			"arifle_MX_GL_Black_F",
			"arifle_MX_GL_F",
			"arifle_MXC_Black_F",
			"arifle_MXC_F",
			"arifle_SDAR_F",
			"arifle_TRG20_F",
			"arifle_TRG21_F",
			"arifle_TRG21_GL_F",
			//Apex AssaultRifles
			"arifle_AK12_F",
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKM_FL_F",
			"arifle_AKS_F",
			//AK x2
			"arifle_AK12_F",
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKM_FL_F",
			"arifle_AKS_F",
			//
			"arifle_ARX_blk_F",
			"arifle_ARX_ghex_F",
			"arifle_ARX_hex_F",
			"arifle_CTAR_blk_F",
			"arifle_CTAR_hex_F",
			"arifle_CTAR_ghex_F",
			"arifle_CTAR_GL_blk_F",
			"arifle_CTARS_blk_F",
			"arifle_CTARS_hex_F",
			"arifle_CTARS_ghex_F",
			"arifle_SPAR_01_blk_F",
			"arifle_SPAR_01_khk_F",
			"arifle_SPAR_01_snd_F",
			"arifle_SPAR_01_GL_blk_F",
			"arifle_SPAR_01_GL_khk_F",
			"arifle_SPAR_01_GL_snd_F",
			"arifle_SPAR_02_blk_F",
			"arifle_SPAR_02_khk_F",
			"arifle_SPAR_02_snd_F",
			"arifle_SPAR_03_blk_F",
			"arifle_SPAR_03_khk_F",
			"arifle_SPAR_03_snd_F",
			"arifle_MX_khk_F",
			"arifle_MX_GL_khk_F",
			"arifle_MXC_khk_F",
			"arifle_MXM_khk_F",

			//SniperRifles
			"arifle_MXM_Black_F",
			"arifle_MXM_F",
			"srifle_DMR_01_F",
			"srifle_DMR_02_camo_F",
			"srifle_DMR_02_F",
			"srifle_DMR_02_sniper_F",
			"srifle_DMR_03_F",
			"srifle_DMR_03_khaki_F",
			"srifle_DMR_03_multicam_F",
			"srifle_DMR_03_tan_F",
			"srifle_DMR_03_woodland_F",
			"srifle_DMR_04_F",
			"srifle_DMR_04_Tan_F",
			"srifle_DMR_05_blk_F",
			"srifle_DMR_05_hex_F",
			"srifle_DMR_05_tan_f",
			"srifle_DMR_06_camo_F",
			"srifle_DMR_06_olive_F",
			"srifle_EBR_F",
			"srifle_GM6_camo_F",
			"srifle_GM6_F",
			"srifle_LRR_camo_F",
			"srifle_LRR_F",
			//Apex SniperRifles
			"srifle_LRR_tna_F",
			"srifle_GM6_ghex_F",
			"srifle_DMR_07_blk_F",
			"srifle_DMR_07_hex_F",
			"srifle_DMR_07_ghex_F"
			];

//________________	weapon's mags	________________
_magazines_weapon = getArray (configFile / "CfgWeapons" / _weapons / "magazines");
_magazineClass_weapon = _magazines_weapon call bis_fnc_selectRandom;



_Vests_array = selectRandom [
			"V_Rangemaster_belt",
			"V_TacVest_blk_POLICE",
			""
			];

removeAllWeapons _x;
removeAllItems _x;
removeAllAssignedItems _x;
removeUniform _x;
removeVest _x;
removeBackpack _x;
removeHeadgear _x;
removeGoggles _x;

comment "Add containers";
_x forceAddUniform "U_C_WorkerCoveralls";
_x setObjectTextureGlobal [0, "GF_Missions\images\GF_Uniform_Prisoner.paa"];
_x addVest _Vests_array;
_x addWeapon _weapons;
for "_i" from 1 to 6 do {_x addItemToUniform _magazineClass_weapon;};

comment "Add items";
_x linkItem "ItemMap";
_x linkItem "ItemCompass";
_x linkItem "ItemWatch";
_x linkItem "ItemRadio";

_x setskill 0.9;
}forEach units _Group_Defend;



	//________________	Set Task 2	________________

	[GF_Missions_allPlayers,["18_Move_to_2","GF_Missions_Pack"],["Заложники убежали, найдите их","Найдите местоположение заложников",""], _Group_Pos,true,1,true,"navigate",true] call BIS_fnc_taskCreate;
	["18_Move_to_2","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	waitUntil { { _x distance _Building < 400 } count GF_Missions_allPlayers > 0 };

	sleep 2;
	if (GF_Missions_saveGame) then {
	saveGame;
	};


	sleep 5;

	["18_Move_to_2", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

	sleep 5;


	//________________	Set Task 2	________________

	[GF_Missions_allPlayers,["18_Move_to_3","GF_Missions_Pack"],["Заложники находятся в 400 метрах, они вооружены, Устраните все угрозы","Устраните все угрозы",""], _Group_Pos,true,1,true,"attack",true] call BIS_fnc_taskCreate;
	["18_Move_to_3","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	waitUntil {sleep 3;({alive _x} count units _Group_Defend) isEqualTo 0;};

	["18_Move_to_3", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

	sleep 2;
	if (GF_Missions_Systemchat_info) then {
	systemchat "saving Game Wait";
	systemchat "Next mission";
	};

	sleep 2;
	if (GF_Missions_saveGame) then {
	saveGame;
	};

	sleep 8;

null = []execVM "GF_Missions\Missions_init.sqf";

//________________	Delete mission's objects	________________
if (GF_Missions_Delete_Objects) then {
waitUntil { { _x distance _Building > GF_Missions_Delete_Objects_Distance } count GF_Missions_allPlayers > 0 };
systemchat "Delete mission's objects";
{ deleteVehicle _x } forEach [
_Building,
_Object_1,
_Flag
];
};
