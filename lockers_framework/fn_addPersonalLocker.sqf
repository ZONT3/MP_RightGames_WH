_this spawn {
  params ["_target", "_roles"];

  private _limited = (not isNil "_roles") and { _roles isEqualType [] or _roles isEqualType "" };
  if _limited then {
    waitUntil { sleep 0.1; !isNil 'ZPR_roles' };
    if (_roles isEqualType "") then { _roles = [_roles] };
  };

  private _cond = call {
    if (not _limited) exitWith { "true" };
    ( "[ " + str _roles + " ] call ZONT_fnc_checkRole" )
  };

  _target addAction [
    "Открыть личное хранилище",	// title
  	{
      if not hasInterface exitWith { diag_log "PL: no interface" };
  		params ["_target", "_caller", "_actionId", "_arguments"]; // script
      private _hol = MPV_locker_holders getOrDefault [getPlayerUID _caller, objNull];
      if (isNull _hol) exitWith {
        hint parseText "<t color='#a00000'>Произошла ошибка</t><br/>Попробуйте перезайти на сервер";
      };
      private _holPos = getPosATL _hol;
      private _pos = getPosATL _caller;
      _hol setPosATL (_pos vectorAdd [0,0,1]);
      _caller action ["Gear", _hol];

      [[_hol, _holPos, _pos, player], {
        params ["_hol", "_holPos", "_pos", "_player"];
        private _until = time + 120;
        while {_until > time and { _player distance _hol < 2 }} do {
          sleep 5;
          [getPlayerUID _player, _hol] spawn ZONT_fnc_updPersonalLocker;
        };
        _hol setPos _holPos;
      }] remoteExec ["bis_fnc_call", 2];
      [_hol, true] remoteExec ["hideObject", -2];
  	},
  	nil,		// arguments
  	15,		// priority
  	true,		// showWindow
  	true,		// hideOnUse
  	"",			// shortcut
  	_cond, 	// condition
  	3 			// radius
  ];

  if (isNil "MPV_locker_list") then { MPV_locker_list = [] };
  MPV_locker_list pushBack _target;
};
