waitUntil {vehicle player == player};

[] spawn ZONT_fnc_loadProfile;
[] spawn ZONT_fnc_autoSaveInit;

[] spawn ZONT_fnc_initTeleportTerminals;

[] spawn ZONT_fnc_addReverse;

[] execVM "chatCommands.sqf";

/******                            Zeus list                             ******/
/* MCH_ZEUS_LIST = [{
  if (isnull (finddisplay 312)) exitWith {};
  mpc_cc_name = format ["%1 (%2)", name player, getPlayerUID player];
  if (isNil 'mpv_current_curators') then {mpv_current_curators = []};

  if (!(mpc_cc_name in mpv_current_curators)) then {
      mpv_current_curators pushBack mpc_cc_name;
      publicVariable 'mpv_current_curators';
      (finddisplay 312) displayAddEventHandler ["Unload", {
          mpv_current_curators deleteAt (mpv_current_curators find mpc_cc_name);
          publicVariable 'mpv_current_curators';
          hintSilent "";
      }];
  };
  private _str = "<t color='#00FF00'>Активные зевсы:</t>";
  { _str = format ["%1<br/>%2", _str, _x]; } forEach mpv_current_curators;
  hintSilent parseText _str;
}, 1] call CBA_fnc_addPerFrameHandler; */

private _fn_moveToSpawn = {
  params ["_player", "_cg"];
  private _side = side _player;
  private _spawn = MP_spawn_east;
  if (_side == west)       then { _spawn = MP_spawn_west };
  if (_side == resistance) then { _spawn = MP_spawn_guer };
  if (!isNil '_spawn') then {
    _player setPosATL getPosATL _spawn;
  };
  if (_cg) then {
    private _g = createGroup _side;
    [_player] joinSilent _g;
    _g deleteGroupWhenEmpty true;
  };
};

[player, false] call _fn_moveToSpawn;
