


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


diag_log "//________________ 4_Snipers_Hide.sqf _____________";

sleep 2;

	if (GF_Missions_Systemchat_info) then {
	systemchat "4_Snipers_Hide  Initializing";
	};

//________________	Spawn Objects	________________

_Building_array = [
// 	Land_BagBunker_Large_F	Land_BagBunker_Small_F	Land_BagBunker_Small_F
"CamoNet_INDP_F",
"CamoNet_BLUFOR_F",
"CamoNet_OPFOR_F",
"CamoNet_INDP_open_F",
"CamoNet_BLUFOR_open_F",
"CamoNet_OPFOR_open_F",
"CamoNet_INDP_big_F",
"CamoNet_BLUFOR_big_F",
"CamoNet_OPFOR_big_F"
];

_Building_Spawn = selectRandom _Building_array;
_Building = _Building_Spawn createVehicle GF_Missions_pos;
_Building setDir (random 360);


//________________ Positions of objects  ________________
_Group_Pos = _Building getRelPos [0, 12];
_Flag_Pos = _Building getRelPos [6, 12];
_Object_1_Pos = _Building getRelPos [3, 6];
_Object_2_Pos = _Building getRelPos [1, 3];
_Object_3_Pos = _Building getRelPos [5, 8];


//________________ Create _Object_1 ________________
_Object_1_array = selectRandom [
"Land_SatelliteAntenna_01_F",
"Land_SatelliteAntenna_01_F",
"Land_Photos_V3_F",
"Land_Photos_V2_F",
"Land_Photos_V1_F",
"Land_Notepad_F"
];
_Object_1 = createVehicle [_Object_1_array, _Object_1_Pos, [], 0, "CAN_COLLIDE"];
_Object_1 setDir (random 360);


//________________ Create _Object_2 ________________
_Object_2_array = selectRandom [
"ShootingMat_01_OPFOR_F",
"ShootingMat_01_Khaki_F",
"ShootingMat_01_folded_OPFOR_F",
"ShootingMat_01_Olive_F",
"ShootingMat_01_folded_Khaki_F",
"ShootingMat_01_folded_Olive_F"
];
_Object_2 = createVehicle [_Object_2_array, _Object_2_Pos, [], 0, "CAN_COLLIDE"];
_Object_2 setDir (random 360);


//________________ Create _Object_3 ________________
_Object_3_array = selectRandom [
"Land_SatellitePhone_F",
"Land_HandyCam_F",
"Land_Laptop_02_unfolded_F",
"Land_Tablet_02_F",
"Land_Camera_01_F"
];
_Object_3 = createVehicle [_Object_3_array, _Object_3_Pos, [], 0, "CAN_COLLIDE"];
_Object_3 setDir (random 360);


//________________	Disable damage	________________
_Building allowDamage false;


//________________ Spawn Groups	________________

_Overwatch_Pos = [(_Group_Pos)] call BIS_fnc_findOverwatch;

//________________	Overwatch	________________
_Group_Overwatch = [ _Overwatch_Pos, WEST, [
"WD_A2Camo_Marksman","WD_A2Camo_Marksman","WD_A2Camo_Marksman"
]] call BIS_fnc_spawnGroup;

_Group_Overwatch setBehaviour "COMBAT";		//	AWARE
_Group_Overwatch setCombatMode "RED";	//	YELLOW


//________________	Patrol	________________
_Group_Patrol = [ _Group_Pos, WEST, [
"WD_A2Camo_Marksman","WD_A2Camo_Marksman","WD_A2Camo_Marksman","WD_A2Camo_Marksman",
"OPTRE_UNSC_Army_FML_Soldier_Sniper_SNO", "OPTRE_UNSC_Army_Soldier_Sniper_SNO"
]] call BIS_fnc_spawnGroup;

[_Group_Patrol, _Overwatch_Pos,(random(150)+150)] call BIS_fnc_taskPatrol;


//________________	Defend	________________
_Group_Defend = [ _Group_Pos, WEST, [
"WD_A2Camo_Rifleman_Light","WD_A2Camo_Rifleman_Light", "WD_A2Camo_Rifleman_Light", "WD_A2Camo_Rifleman_Light", "WD_A2Camo_Rifleman_Light"
]] call BIS_fnc_spawnGroup;

[_Group_Defend, _Group_Pos] call BIS_fnc_taskDefend;


	if (GF_Missions_Systemchat_info) then {
	systemchat "Mission is Generated";
	};

	//________________	Set Task	________________

	[GF_Missions_allPlayers,["4_Snipers_Hide","GF_Missions_Pack"],["Устраните снайперов","Устраните снайперов",""], _Group_Pos,true,1,true,"kill",true] call BIS_fnc_taskCreate;
	["4_Snipers_Hide","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	sleep 2;

	waitUntil {sleep 3;({alive _x} count units _Group_Overwatch) isEqualTo 0;};
	waitUntil {sleep 3;({alive _x} count units _Group_Patrol) isEqualTo 0;};
	waitUntil {sleep 3;({alive _x} count units _Group_Defend) isEqualTo 0;};

	["4_Snipers_Hide", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

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
_Object_2,
_Object_3
];
};
