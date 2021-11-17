


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


diag_log "//________________ 15_Clear_Bunker.sqf _____________";

sleep 2;

	if (GF_Missions_Systemchat_info) then {
	systemchat "15_Clear_Bunker  Initializing";
	};

//________________	Spawn Objects	________________

_Building = "Land_BagBunker_Large_F" createVehicle GF_Missions_pos;
_Building setDir (random 360);


//________________ Positions ________________
_Group_Pos	= getpos _Building;
_Object_1_Pos = [_Group_Pos, -10, 20] call BIS_fnc_relPos;
_Object_2_Pos = [_Group_Pos, 10, 20] call BIS_fnc_relPos;
_Object_3_Pos = [_Group_Pos, 25, 60] call BIS_fnc_relPos;
_Patrol_Pos = [_Group_Pos, 50, 15] call BIS_fnc_relPos;
_Defend_Pos = [_Group_Pos, 50, 15] call BIS_fnc_relPos;


//________________ Create _Object_1 ________________

_Object_1 = "Land_BagBunker_Small_F" createVehicle _Object_1_Pos;
_Object_1 setDir (random 360);


//________________ Create _Object_2 ________________

_Object_2 = "Land_BagBunker_Small_F" createVehicle _Object_2_Pos;
_Object_2 setDir (random 360);


//________________ Create _Object_3 ________________
_Object_3_array = selectRandom [
"O_Truck_02_Ammo_F",
"I_Truck_02_medical_F",
"O_G_Van_01_fuel_F",
"O_Truck_03_repair_F",
"O_G_Van_01_transport_F"
];

_Object_3 = createVehicle [_Object_3_array, _Object_3_Pos, [], 0, "CAN_COLLIDE"];
_Object_3 setDir (random 360);


//________________ Create a Flag with your pic 256x256 ________________
_Flag = "FlagPole_F" createVehicle getpos _Building;
_Flag setFlagTexture "GF_Missions\images\GF_Spartan_Flag.jpg";	//	Set your image for the flag
_Flag setDir (random 360);


//________________ Spawn Groups	________________

_Overwatch_Pos = [(_Group_Pos)] call BIS_fnc_findOverwatch;
_random_Pos = [[[_Group_Pos, ((random(15)+15))],[]],["water","out"]] call BIS_fnc_randomPos;

//________________	Overwatch	________________
_Group_Overwatch = [ _Overwatch_Pos, WEST, [
"O_spotter_F","O_sniper_F","O_G_Sharpshooter_F","O_G_Sharpshooter_F","O_G_Soldier_M_F"
]] call BIS_fnc_spawnGroup;

_Group_Overwatch setBehaviour "COMBAT";		//	AWARE
_Group_Overwatch setCombatMode "RED";	//	YELLOW


//________________	Patrol	________________
_Group_Patrol = [ _Patrol_Pos, WEST, [
"O_G_officer_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F",
"O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_LAT_F"
]] call BIS_fnc_spawnGroup;

[_Group_Patrol, _Overwatch_Pos,(random(150)+150)] call BIS_fnc_taskPatrol;

sleep 1;

//________________	Defend	________________
_Group_Defend = [ _Defend_Pos, WEST, [
"O_G_officer_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F",
"O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_LAT_F"
]] call BIS_fnc_spawnGroup;

[_Group_Defend, _Group_Pos] call BIS_fnc_taskDefend;

//________________	Defend Static_Weapons	________________
for "_x" from 0 to (random(3)+2) do {
_Vehicle_Patrol = createGroup WEST;
_random_Land_Vehicle = GF_Pool_Static_Weapons call BIS_fnc_selectRandom;
_random_Gunner = GF_Pool_Units call BIS_fnc_selectRandom;
_randomPos = [[[_Group_Pos, ((random(25)+25))],[]],["water","out"]] call BIS_fnc_randomPos;

_create_Land_Vehicle = _random_Land_Vehicle createVehicle _randomPos;
waitUntil{!isNull _create_Land_Vehicle};

_random_Gunner 		createUnit [_randomPos, _Vehicle_Patrol];

((units _Vehicle_Patrol) select 0) assignAsGunner _create_Land_Vehicle;
((units _Vehicle_Patrol) select 0) moveInGunner _create_Land_Vehicle;

};


	if (GF_Missions_Systemchat_info) then {
	systemchat "Mission is Generated";
	};

	//________________	Set Task	________________

	[GF_Missions_allPlayers,["15_Clear_Bunker","GF_Missions_Pack"],["Зачистите Бункер","Зачистите Бункер",""], _Group_Pos,true,1,true,"attack",true] call BIS_fnc_taskCreate;
	["15_Clear_Bunker","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	sleep 2;

	waitUntil {sleep 3;({alive _x} count units _Group_Overwatch) isEqualTo 0;};
	waitUntil {sleep 3;({alive _x} count units _Group_Patrol) isEqualTo 0;};
	waitUntil {sleep 3;({alive _x} count units _Group_Defend) isEqualTo 0;};

	["15_Clear_Bunker", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

	sleep 2;
	if (GF_Missions_saveGame) then {
	saveGame;
	};


	sleep 5;


	//________________	Set Task 2	________________

	[GF_Missions_allPlayers,["15_Clear_Bunker_2","GF_Missions_Pack"],["Защитите Бункер","Защитите Бункер",""], _Group_Pos,true,1,true,"defend",true] call BIS_fnc_taskCreate;
	["15_Clear_Bunker_2","ASSIGNED",true] spawn BIS_fnc_taskSetState;


	sleep 2;

	//________________	Spawn Units	________________

for "_x" from 0 to (random(3)+3) do {
_Vehicle_Patrol = createGroup WEST;
_random_Land_Vehicle = GF_Pool_Land_Vehicles call BIS_fnc_selectRandom;

_random_Driver = GF_Pool_Units call BIS_fnc_selectRandom;
_random_Gunner = GF_Pool_Units call BIS_fnc_selectRandom;
_random_Commander = GF_Pool_Units call BIS_fnc_selectRandom;
_random_Cargo = GF_Pool_Units call BIS_fnc_selectRandom;


_randomPos = [[[_Group_Pos, (1500)],[]],["water","out"]] call BIS_fnc_randomPos;

_create_Land_Vehicle = _random_Land_Vehicle createVehicle _randomPos;
waitUntil{!isNull _create_Land_Vehicle};

_random_Driver 		createUnit [_randomPos, _Vehicle_Patrol];
_random_Gunner 		createUnit [_randomPos, _Vehicle_Patrol];
_random_Commander 	createUnit [_randomPos, _Vehicle_Patrol];
_random_Cargo		createUnit [_randomPos, _Vehicle_Patrol];

((units _Vehicle_Patrol) select 0) assignAsCargo _create_Land_Vehicle;
((units _Vehicle_Patrol) select 0) moveInCargo _create_Land_Vehicle;
((units _Vehicle_Patrol) select 1) assignAsCargo  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 1) moveInCargo  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 2) assignAsCargo  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 2) moveInCargo  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 3) assignAsDriver  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 3) moveInDriver  _create_Land_Vehicle;

[_Vehicle_Patrol, _Group_Pos] call BIS_fnc_taskAttack;

};


for "_x" from 0 to 1 do {
_Vehicle_Patrol = createGroup WEST;
_random_Land_Vehicle = GF_Pool_Armoured_Vehicles call BIS_fnc_selectRandom;

_random_Driver = GF_Pool_Units call BIS_fnc_selectRandom;
_random_Gunner = GF_Pool_Units call BIS_fnc_selectRandom;
_random_Commander = GF_Pool_Units call BIS_fnc_selectRandom;
_random_Cargo = GF_Pool_Units call BIS_fnc_selectRandom;


_randomPos = [[[_Group_Pos, (1500)],[]],["water","out"]] call BIS_fnc_randomPos;

_create_Land_Vehicle = _random_Land_Vehicle createVehicle _randomPos;
waitUntil{!isNull _create_Land_Vehicle};

_random_Driver 		createUnit [_randomPos, _Vehicle_Patrol];
_random_Gunner 		createUnit [_randomPos, _Vehicle_Patrol];
_random_Commander 	createUnit [_randomPos, _Vehicle_Patrol];
_random_Cargo		createUnit [_randomPos, _Vehicle_Patrol];

((units _Vehicle_Patrol) select 0) assignAsCargo _create_Land_Vehicle;
((units _Vehicle_Patrol) select 0) moveInCargo _create_Land_Vehicle;
((units _Vehicle_Patrol) select 1) assignAsCargo  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 1) moveInCargo  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 2) assignAsCargo  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 2) moveInCargo  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 3) assignAsDriver  _create_Land_Vehicle;
((units _Vehicle_Patrol) select 3) moveInDriver  _create_Land_Vehicle;

[_Vehicle_Patrol, _Group_Pos] call BIS_fnc_taskAttack;

};

_Trigger_WEST_PRESENT = createTrigger ["EmptyDetector", _Group_Pos];
_Trigger_WEST_PRESENT setTriggerArea [GF_Missions_DAC_Area_Spawn_Meters, GF_Missions_DAC_Area_Spawn_Meters, 0, false];
_Trigger_WEST_PRESENT setTriggerActivation ["WEST", "PRESENT", false];
_Trigger_WEST_PRESENT setTriggerStatements ["this","",""];


	waitUntil {sleep 3; count list _Trigger_WEST_PRESENT < 1};

	deleteVehicle _Trigger_WEST_PRESENT;

	["15_Clear_Bunker_2", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;


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
_Flag
];
};
