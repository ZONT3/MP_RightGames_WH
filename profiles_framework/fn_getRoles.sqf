private _res = [];
private _resRs = [];
if (isNil 'ZPR_allowedIDs' or { typeName ZPR_allowedIDs != typeName [] }) then { ZPR_allowedIDs = [] };
{
  private _id =   [_x, "id", 0] call BIS_fnc_returnConfigEntry;
  private _hide = [_x, "hide", "false"] call BIS_fnc_returnConfigEntry == "true";
  private _restricted =
    ( [_x, "free", "false"] call BIS_fnc_returnConfigEntry != "true" ) and
    not ( _id in ZPR_allowedIDs );

  if (_id != 0 and not _hide) then {
    private _elem = [
      _id,
      [_x, "name", configName _x] call BIS_fnc_returnConfigEntry,
      configName _x,
      [_x, "tags", []] call BIS_fnc_returnConfigEntry,
      ! _restricted,
      [_x, "autoRemove", "false"] call BIS_fnc_returnConfigEntry == "true"
    ];
    if not _restricted
    then { _res   pushBack _elem }
    else { _resRs pushBack _elem };
  };
} foreach ("true" configClasses (missionConfigFile >> "CfgRoles"));

_res + _resRs
