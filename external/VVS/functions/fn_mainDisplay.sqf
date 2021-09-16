/*
	File: fn_mainDisplay.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for the VVS Menu Display. Handles filters and more.
*/
private["_mode","_control","_row","_vehicleList","_checkBox"];
disableSerialization;
waitUntil{!isNull (findDisplay 38100)};
if(isNil "VVS_Cfg") then{_mode = "Все";} else {_mode = VVS_Cfg};

_control = ((findDisplay 38100) displayCtrl 38101);
if((lnbSize 38101) select 0 > -1) then
{
	lnbClear _control;
};


_checkBox = ((findDisplay 38100) displayCtrl 38103);

if(VVS_Checkbox) then
{
	_checkBox ctrlSetText "Да";
	_checkBox ctrlSetTextColor [0,1,0,1];
}
	else
{
	_checkBox ctrlSetText "Нет";
	_checkBox ctrlSetTextColor [1,0,0,1];
};

//Fill out the filter menu.

call {
	ctrlShow[38102,false]; //Hide it.
	_row = 0;
	_vehicleList = [_mode] call VVS_fnc_filterType;
	VVS_spawnMode = _mode;
	VVS_onSpawn = (_mode call ZONT_fnc_onSpawnVVS);

	if(count _vehicleList == 0) exitWith {hint "ОЙ, что-то пошло не так! Попробуйте позже!"};
	{
		_cfgInfo = [_x] call VVS_fnc_cfgInfo;
		if(count _cfgInfo > 0) then
		{
			_sideName = switch ((_cfgInfo select 5)) do {case 0: {"         EAST"}; case 1: {"         WEST"}; case 2: {"         GUER"}; case 3: {"         CIV"}; default {"         UNKNOWN"}};
			_control lnbAddRow["",_cfgInfo select 3,_sideName,_cfgInfo select 4];
			_control lnbSetPicture[[_row,0],_cfgInfo select 2];
			_control lnbSetData[[_row,0],_x]; //Set the classname to index/column 0
			_control lnbSetData[[_row,1],(_cfgInfo select 3)]; //Set the displayName to index/column 1
			_row = _row + 1;
		};
	} foreach _vehicleList;
};
