


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


diag_log "//________________ 16_Find_the_Prisoners.sqf _____________";

sleep 2;

	if (GF_Missions_Systemchat_info) then {
	systemchat "16_Find_the_Prisoners  Initializing";
	};

//________________	Spawn Objects	________________

_Building = "C_Offroad_01_repair_F" createVehicle GF_Missions_pos;
_Building setObjectTextureGlobal [0, "GF_Missions\images\GF_Police_Offroad.paa"];
_Building setDamage 0.5;

//________________ Positions of objects  ________________
_Group_Pos	= getpos _Building;
_Object_1_Pos = [_Group_Pos, 12, 0] call BIS_fnc_relPos;
_Object_2_Pos = [_Group_Pos, 24, 0] call BIS_fnc_relPos;
_Object_3_Pos = [_Group_Pos, 36, 0] call BIS_fnc_relPos;


//________________ Create _Object_1 ________________

_Object_1 = "C_Truck_02_box_F" createVehicle _Object_1_Pos;
_Object_1 setDamage 0.5;

//________________ Create _Object_2 ________________

_Object_2 = "C_Van_01_box_F" createVehicle _Object_2_Pos;
_Object_2 setDamage 0.5;

//________________ Create _Object_3 ________________

_Object_3 = "C_Offroad_01_repair_F" createVehicle _Object_3_Pos;
_Object_3 setObjectTextureGlobal [0, "GF_Missions\images\GF_Police_Offroad.paa"];
_Object_3 setDamage 0.9;

//________________ Spawn Groups	________________

_Overwatch_Pos = [(_Group_Pos)] call BIS_fnc_findOverwatch;

//________________	Overwatch	________________
_Group_Overwatch = [ _Overwatch_Pos, WEST, [
"O_spotter_F","O_sniper_F","O_G_Sharpshooter_F","O_G_Sharpshooter_F","O_G_Soldier_M_F"
]] call BIS_fnc_spawnGroup;

_Group_Overwatch setBehaviour "COMBAT";		//	AWARE
_Group_Overwatch setCombatMode "RED";		//	YELLOW


//________________	Defend	________________
_Group_Defend = [ _Group_Pos, WEST, [
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

_x setskill 0.8;
}forEach units _Group_Defend;



	if (GF_Missions_Systemchat_info) then {
	systemchat "Mission is Generated";
	};

	//________________	Set Task	________________

	[GF_Missions_allPlayers,["16_Find_the_Prisoners","GF_Missions_Pack"],["Найдите заложников","Найдите заложников",""], _Group_Pos,true,1,true,"scout ",true] call BIS_fnc_taskCreate;
	["16_Find_the_Prisoners","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	waitUntil { { _x distance _Building < 400 } count GF_Missions_allPlayers > 0 };

	sleep 2;
	if (GF_Missions_saveGame) then {
	saveGame;
	};


	sleep 5;

	["16_Find_the_Prisoners", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

	sleep 5;

	//________________	Set Task 2	________________

	[GF_Missions_allPlayers,["16_Find_the_Prisoners_2","GF_Missions_Pack"],["Заложники находятся в 400 метрах, они вооружены, Устраните все угрозы","Устраните все угрозы",""], _Group_Pos,true,1,true,"attack ",true] call BIS_fnc_taskCreate;
	["16_Find_the_Prisoners_2","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	waitUntil {sleep 3;({alive _x} count units _Group_Overwatch) isEqualTo 0;};
	waitUntil {sleep 3;({alive _x} count units _Group_Defend) isEqualTo 0;};

	["16_Find_the_Prisoners_2", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

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
