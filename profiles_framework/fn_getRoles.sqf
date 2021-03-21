private _res = [];
if (isNil 'ZPR_allowedIDs' or { typeName ZPR_allowedIDs != typeName [] }) then { ZPR_allowedIDs = [] };
{
  private _id =   [_x, "id", 0] call BIS_fnc_returnConfigEntry;
  private _hide = [_x, "hide", "false"] call BIS_fnc_returnConfigEntry == "true";
  private _restricted =
    ( [_x, "free", "false"] call BIS_fnc_returnConfigEntry != "true" ) or
    ( _id in ZPR_allowedIDs );

  if (_id != 0 and not _hide) then {
    _res pushBack [
      _id,
      [_x, "name", configName _x] call BIS_fnc_returnConfigEntry,
      configName _x,
      [_x, "tags", []] call BIS_fnc_returnConfigEntry,
      ! _restricted
    ];
  };
} foreach ("true" configClasses (missionConfigFile >> "CfgRoles"));
_res
