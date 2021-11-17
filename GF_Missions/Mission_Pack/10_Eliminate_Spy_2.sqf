


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


diag_log "//________________ 10_Eliminate_Spy_2.sqf _____________";

sleep 2;

	if (GF_Missions_Systemchat_info) then {
	systemchat "10_Eliminate_Spy_2  Initializing";
	};

//________________ Spawn the Unit	________________

_Overwatch_Pos = [(GF_Missions_pos)] call BIS_fnc_findOverwatch;

_Spawn_Unit = createGroup civilian;
_taskPatrol = [_Spawn_Unit, _Overwatch_Pos,(random(150)+150)] call BIS_fnc_taskPatrol;
_Unit = _Spawn_Unit createUnit ["O_G_Survivor_F", _Overwatch_Pos, [], 0, "CAN_COLLIDE"];
units _Unit joinSilent _Spawn_Unit;

_Unit setskill 1;

removeAllWeapons _Unit;
removeAllItems _Unit;
removeAllAssignedItems _Unit;
removeUniform _Unit;
removeVest _Unit;
removeBackpack _Unit;
removeHeadgear _Unit;
removeGoggles _Unit;


_Unit forceAddUniform GF_Missions_Civilian_Uniform;
_Unit addHeadgear GF_Missions_Headgear;
_Unit addGoggles GF_Missions_Goggles;


	if (GF_Missions_Systemchat_info) then {
	systemchat "Mission is Generated";
	};

	//________________	Set Task	________________

	[GF_Missions_allPlayers,["10_Eliminate_Spy_2","GF_Missions_Pack"],["Устраните шпиона","УСтраните шпиона",""], getPos _Unit,true,1,true,"kill",true] call BIS_fnc_taskCreate;
	["10_Eliminate_Spy_2","ASSIGNED",true] spawn BIS_fnc_taskSetState;

	//________________	Distance from the Players	________________
	waitUntil { { _x distance _Unit < 15 } count GF_Missions_allPlayers > 0 };

	if (GF_Missions_Systemchat_info) then {
	systemchat "distance _Unit < 15";
	};


	//________________	Change Behaviour	________________
	_Unit setBehaviour "STEALTH";	//	AWARE	STEALTH	COMBAT
	_Unit setCombatMode "YELLOW";		//	YELLOW	RED

	//________________	Change Side	________________
	_Join_West = creategroup west;
	units _Unit joinSilent _Join_West;

 	//________________	Arm	________________
	for "_i" from 1 to 6 do {_Unit addItemToUniform "30Rnd_45ACP_Mag_SMG_01";};
	_Unit addItemToUniform "MiniGrenade";
	_Unit addItemToUniform "SmokeShellPurple";
	_Unit addItemToUniform "FirstAidKit";

	comment "Add weapons";
	_Unit addWeapon "SMG_01_F";
	_Unit addPrimaryWeaponItem "muzzle_snds_acp";
	_Unit addPrimaryWeaponItem "optic_MRCO";


	sleep 2;

	waitUntil {sleep 3;!alive _Unit};

	["10_Eliminate_Spy_2", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;


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
