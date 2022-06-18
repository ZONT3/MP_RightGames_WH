if (!hasInterface) exitWith {};

if (isNil {player}) exitWith {diag_log "ZONT_PRS: PLAYER IS NIL"; []};
private _uid = getPlayerUID player;
if (!("7656" in _uid)) exitWith {diag_log "ZONT_PRS: UID IS INVALID"; []};

waitUntil {sleep 0.1; !dialog};

[{
  params ["_uid"];
  [
    [MPS_BDL_pres, "getChars", [_uid]] call ZONT_fnc_bd_customRequest,
    [MPS_BDL_pres, "getRoles", [_uid]] call ZONT_fnc_bd_customRequest
  ]
},{
  params ["_chars", "_roles"];
  ZPR_ID = nil;

  try {
    ZPR_allowedIDs = _roles select 0 select 0;
  } catch {
    diag_log "ZPR ERROR: CANNOT FETCH ROLES";
    ZPR_allowedIDs = [];
  };

  {
    _x params ["_id", "_name", "_side", "_roles", "_equip", "_pos"];
    if (_name == name player and _side == str side player) exitWith {
      ZPR_ID = _id;
      ZPR_roles = _roles;
      [_equip, _pos] spawn ZONT_fnc_loadDone;
    };
  } foreach _chars;

  if (not isNil "ZPR_ID") exitWith { diag_log format ["ZPR ID: %1", ZPR_ID]; };

  diag_log format ["ZPR Char not found (%1 %2) in %3", name player, str side player, str _chars];
  waitUntil {sleep 0.1; !isNull findDisplay 46};
  [_chars] call ZONT_fnc_profilesGUI;
}, _uid] call ZONT_fnc_remoteExecCallback;
