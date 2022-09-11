waitUntil {vehicle player == player};

[] spawn ZONT_fnc_loadProfile;
[] spawn ZONT_fnc_autoSaveInit;

[] spawn ZONT_fnc_initTeleportTerminals;
//[] spawn ZONT_fnc_initArsenals;

[] spawn ZONT_fnc_addReverse;

[] execVM "chatCommands.sqf";

[] execVM "initPlayerAfterRespawn.sqf";

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

MPC_Whitelist = true; // кикать людей без роли

private _fn_checkSlotPermission = {
  waituntil { sleep 0.1; !isNil 'ZPR_roles' };

  if (( isNil 'ZPR_roles' ) or { MPC_Whitelist and (count ZPR_roles) == 0 }) exitWith {
    ["whitelist"] call ZONT_fnc_forceExit;
  };

  if not ([[],[],_this] call ZONT_fnc_checkRole) exitWith {
    ["absrole"] call ZONT_fnc_forceExit;
  };
};

private _var = [];
private _varg = group player getVariable ["ZPR_rr", ""];
private _vars =       player getVariable ["ZPR_rr", ""];
if (_varg != "") then { _var pushBack _varg };
if (_vars != "") then { _var pushBack _vars };
if (MPC_Whitelist or { count _var > 0 }) then {
  _var spawn _fn_checkSlotPermission;
};

private _fn_moveToCustomSpawn = {
  params ['_player','_fn_moveToSpawn'];
  waituntil { sleep 0.1; !isNil 'ZPR_roles' };

    private _sso = [["SSO"]] call ZONT_fnc_checkRole;
  if _sso exitWith { [_player, true, 'MP_spawn_sso'] call _fn_moveToSpawn };
    private _vdv = [["VDV"]] call ZONT_fnc_checkRole;
  if _vdv exitWith { [_player, true, 'MP_spawn_vdv'] call _fn_moveToSpawn };
    private _svr = [["SVR"]] call ZONT_fnc_checkRole;
  if _svr exitWith { [_player, true, 'MP_spawn_svr'] call _fn_moveToSpawn };
    private _train = [["Train"]] call ZONT_fnc_checkRole;
  if _train exitWith { [_player, true, 'MP_spawn_train'] call _fn_moveToSpawn };
    private _train = [["Train"]] call ZONT_fnc_checkRole;
  if _train exitWith { [_player, true, 'MP_spawn_train'] call _fn_moveToSpawn };
    private _md = [["MD"]] call ZONT_fnc_checkRole;
  if _md exitWith { [_player, true, 'MP_spawn_md'] call _fn_moveToSpawn };
    private _vks = [["VKS"]] call ZONT_fnc_checkRole;
  if _vks exitWith { [_player, true, 'MP_spawn_vks'] call _fn_moveToSpawn };
    private _india = [["India"]] call ZONT_fnc_checkRole;
  if _india exitWith { [_player, true, 'MP_spawn_india'] call _fn_moveToSpawn };
};

private _fn_moveToSpawn = {
  params ["_player", "_cg", '_spawnName'];
  private _side = side _player;
  private _spawn = objnull;

  if (isNil '_spawnName') then {
    if (_side == east)       then { _spawn = MP_spawn_east };
    if (_side == west)       then { _spawn = MP_spawn_west };
    if (_side == resistance) then { _spawn = MP_spawn_guer };
    if (_side == civilian)   then { _spawn = MP_spawn_civ };
  } else {
    _spawn = missionNamespace getVariable _spawnName;
  };

  if (!isNil '_spawn') then {
    _player setPosATL getPosATL _spawn;
    _player setDir getDir _spawn;
  };

  if (_cg) then {
    private _g = createGroup _side;
    [_player] joinSilent _g;
    _g deleteGroupWhenEmpty true;
  };
};

[player, false] call _fn_moveToSpawn;
[player, _fn_moveToSpawn] spawn _fn_moveToCustomSpawn;

MPC_DISPLAY_OPENED = createHashMap;
MPH_DisplyChecker = [{
  private _tmp = [];
  private _report = [];
  {
    private _id = str _x;
    if not (_id in MPC_DISPLAY_OPENED) then {
      _report pushBack _id;
    };
    _tmp pushBack [_id, true];
  } forEach allDisplays;
  MPC_DISPLAY_OPENED = createHashMapFromArray _tmp;
  _report spawn {
    {
      [format ["%1 [%2] OPENED %3", name player, getPlayerUID player, _this]] remoteExec ["ZONT_fnc_log", 2];
    } forEach _this;
  };
}, 1] call CBA_fnc_addPerFrameHandler;

/*
// Delete agents
[] spawn {
  waitUntil {
  	{
  		if (
        agent _x isKindOf "Rabbit_F" ||
        agent _x isKindOf "Snake_random_F" ||
        agent _x isKindOf "Servo_skull"
      ) then {
  			deleteVehicle agent _x;
  		};
  	} forEach agents;

  	sleep 0.01; false;
  };
};*/

[] spawn ZONT_fnc_ZZL_initPlayer