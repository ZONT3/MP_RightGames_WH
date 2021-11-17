


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


diag_log "//________________ 11_DAC_Search_Stolen.sqf _____________";

sleep 2;

	if (GF_Missions_Systemchat_info) then {
	systemchat "11_DAC_Search_Stolen Initializing";
	};

sleep 2;


//________________	Spawn Objects	________________
//________________ Spawn Groups	________________

_Building = createVehicle ["Land_TentHangar_V1_F", GF_Missions_pos, [], 0, "CAN_COLLIDE"];
_Building setDir (random 360);


//________________ Create _Object_1 ________________
_Object_1_array = selectRandom [
"C_Offroad_01_F",
"C_SUV_01_F",
"C_Hatchback_01_sport_F",
"C_Van_01_transport_F",
"C_Truck_02_transport_F",
"C_Quadbike_01_F",
"C_Heli_Light_01_civil_F"
];
_Object_1 = createVehicle [_Object_1_array, getpos _Building, [], 0, "CAN_COLLIDE"];
_Object_1 setDir (random 360);


//________________ Positions of objects  ________________
_Group_Pos = getPos _Building;
_Overwatch_Pos = [(_Group_Pos)] call BIS_fnc_findOverwatch;

//________________ Spawn the Units	________________

for "_x" from 0 to (random(8)+10) do {

_Spawn_Group_Patrol = createGroup WEST;
_taskPatrol = [_Spawn_Group_Patrol, _Group_Pos,(random(150)+150)] call BIS_fnc_taskPatrol;
_Group_Patrol = _Spawn_Group_Patrol createUnit ["WD_A2Camo_Rifleman_Medium", _Overwatch_Pos, [], 0, "CAN_COLLIDE"];
units _Group_Patrol joinSilent _Spawn_Group_Patrol;



//	add rarity
if (floor (random 10) < 2) then {_Group_Patrol addBackpack _Backpacks_array;};


_Group_Patrol addWeapon _weapons;
for "_i" from 1 to 6 do {_Group_Patrol addItemToUniform _magazineClass_weapon;};

};



//________________ Spawn the Defend Units	________________

//________________	Defend	________________
_Group_Defend = [ _Group_Pos, WEST, [
"WD_A2Camo_Marksman","WD_A2Camo_Marksman","WD_A2Camo_Marksman","WD_A2Camo_Rifleman_Medium","WD_A2Camo_Rifleman_Medium","WD_A2Camo_Rifleman_Medium","WD_A2Camo_Rifleman_Medium","WD_A2Camo_Rifleman_Medium","WD_A2Camo_Rifleman_Medium","WD_A2Camo_Rifleman_Medium","WD_A2Camo_Rifleman_Heavy","WD_A2Camo_Rifleman_Heavy","WD_A2Camo_Rifleman_Heavy"
]] call BIS_fnc_spawnGroup;

[_Group_Defend, _Group_Pos] call BIS_fnc_taskDefend;



//	add rarity
if (floor (random 10) < 2) then {_x addBackpack _Backpacks_array;};


_x addWeapon _weapons;
for "_i" from 1 to 6 do {_x addItemToUniform _magazineClass_weapon;};

_x setskill 0.8;
} forEach units _Group_Defend;


	if (GF_Missions_Systemchat_info) then {
	systemchat "Mission is Generated";
	};


	[GF_Missions_allPlayers,["11_DAC_Search_Stolen","GF_Missions_Pack"],["Найдите угнанную технику","Найдите угнанную технику",""], _Group_Pos,true,1,true,"search",true] call BIS_fnc_taskCreate;
	["11_DAC_Search_Stolen","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	sleep 2;

	waitUntil { { _x distance _Building < 20 } count GF_Missions_allPlayers > 0 };
	waitUntil {sleep 3;({alive _x} count units _Group_Defend) isEqualTo 0;};

	["11_DAC_Search_Stolen", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

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
_Building
];
};
