if (!isServer) exitWith {};
params ["_info", "_class", "_mode", "_player"];
_info params ["_positionSpawn", "_position", "_direction", "_cfgInfo", "_checkbox", "_displayName"];

_vehicle = _class createVehicle _positionSpawn;
while {isDamageAllowed _vehicle} do {
    _vehicle allowDamage false;
};
_vehicle setPosATL _position; //Make sure it gets set onto the position.
_vehicle setDir _direction; //Set the vehicles direction the same as the marker.

if((_cfgInfo select 4) == "Autonomous") then
{
	createVehicleCrew _vehicle;
};

if(_checkbox) then
{
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
};

[_vehicle, _class, _mode] call ZONT_fnc_onSpawnVVS;

(format ["Вы заспавнили %1", _displayName]) remoteExec ["hint", _player];
sleep 3;
_vehicle allowDamage true;
