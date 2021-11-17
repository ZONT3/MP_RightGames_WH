


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


diag_log "//________________ 2_Eliminate_Suspects.sqf _____________";

sleep 2;

	if (GF_Missions_Systemchat_info) then {
	systemchat "2_Eliminate_Suspects  Initializing";
	};

//________________ Spawn the Unit	________________

_Overwatch_Pos = [(GF_Missions_pos)] call BIS_fnc_findOverwatch;

//________________	Overwatch	________________
_Group_Overwatch = [ _Overwatch_Pos, WEST, [
"O_spotter_F","O_G_Survivor_F"
]] call BIS_fnc_spawnGroup;

_Group_Overwatch setBehaviour "COMBAT";		//	AWARE
_Group_Overwatch setCombatMode "RED";		//	YELLOW

//________________	Patrol	________________
_Group_Patrol = [ _Overwatch_Pos, WEST, [
"O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F","O_G_Survivor_F"
]] call BIS_fnc_spawnGroup;

[_Group_Patrol, _Overwatch_Pos,(random(150)+150)] call BIS_fnc_taskPatrol;

_Group_Patrol setBehaviour "COMBAT";	//	AWARE
_Group_Patrol setCombatMode "RED";		//	YELLOW


{

removeAllWeapons _x;
removeAllItems _x;
removeAllAssignedItems _x;
removeUniform _x;
removeVest _x;
removeBackpack _x;
removeHeadgear _x;
removeGoggles _x;

comment "Add containers";
_x forceAddUniform "U_O_PilotCoveralls";
for "_i" from 1 to 3 do {_x addItemToUniform "10Rnd_93x64_DMR_05_Mag";};
_x addVest "V_PlateCarrier_Kerry";
for "_i" from 1 to 8 do {_x addItemToVest "10Rnd_93x64_DMR_05_Mag";};
_x addBackpack "B_FieldPack_ocamo";
for "_i" from 1 to 4 do {_x addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 2 do {_x addItemToBackpack "MiniGrenade";};
for "_i" from 1 to 2 do {_x addItemToBackpack "HandGrenade";};
for "_i" from 1 to 4 do {_x addItemToBackpack "SmokeShellRed";};
for "_i" from 1 to 7 do {_x addItemToBackpack "10Rnd_93x64_DMR_05_Mag";};
for "_i" from 1 to 2 do {_x addItemToBackpack "SmokeShellPurple";};
_x addHeadgear "H_Booniehat_mcamo";
_x addGoggles "G_Bandanna_khk";

comment "Add weapons";
_x addWeapon "srifle_DMR_05_hex_F";
_x addPrimaryWeaponItem "muzzle_snds_93mmg_tan";
_x addPrimaryWeaponItem "acc_pointer_IR";
_x addPrimaryWeaponItem "optic_KHS_hex";
_x addPrimaryWeaponItem "bipod_02_F_hex";
_x addWeapon "Laserdesignator_02";

comment "Add items";
_x linkItem "ItemMap";
_x linkItem "ItemCompass";
_x linkItem "ItemWatch";
_x linkItem "ItemRadio";
_x linkItem "ItemGPS";
_x linkItem "NVGoggles_INDEP";

_x setskill 0.8;
} forEach units _Group_Overwatch;



{

removeAllWeapons _x;
removeAllItems _x;
removeAllAssignedItems _x;
removeUniform _x;
removeVest _x;
removeBackpack _x;
removeHeadgear _x;
removeGoggles _x;

comment "Add containers";
_x forceAddUniform GF_Missions_Civilian_Uniform;
for "_i" from 1 to 2 do {_x addItemToUniform "FirstAidKit";};
_x addVest "V_TacVestIR_blk";
for "_i" from 1 to 5 do {_x addItemToVest "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_x addItemToVest "MiniGrenade";};
_x addBackpack "B_AssaultPack_blk";
for "_i" from 1 to 2 do {_x addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 4 do {_x addItemToBackpack "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 3 do {_x addItemToBackpack "MiniGrenade";};
for "_i" from 1 to 4 do {_x addItemToBackpack "SmokeShellPurple";};
_x addItemToBackpack "30Rnd_65x39_caseless_mag";
_x addHeadgear "H_Cap_blk";
_x addGoggles "G_Shades_Black";

comment "Add weapons";
_x addWeapon "arifle_MX_SW_Black_F";
_x addPrimaryWeaponItem "muzzle_snds_H";
_x addPrimaryWeaponItem "optic_DMS";
_x addPrimaryWeaponItem "bipod_01_F_blk";

comment "Add items";
_x linkItem "ItemMap";
_x linkItem "ItemCompass";
_x linkItem "ItemWatch";

_x setskill 0.8;
} forEach units _Group_Patrol;


	if (GF_Missions_Systemchat_info) then {
	systemchat "Mission is Generated";
	};

	//________________	Set Task	________________

	[GF_Missions_allPlayers,["2_Eliminate_Suspects","GF_Missions_Pack"],["Убейте Подозреваемых","Убейте Подозреваемых",""], _Overwatch_Pos,true,1,true,"kill",true] call BIS_fnc_taskCreate;
	["2_Eliminate_Suspects","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	sleep 2;

	waitUntil {sleep 3;({alive _x} count units _Group_Overwatch) isEqualTo 0;};
	waitUntil {sleep 3;({alive _x} count units _Group_Patrol) isEqualTo 0;};


	["2_Eliminate_Suspects", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

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
