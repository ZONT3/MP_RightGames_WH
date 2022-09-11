ZZL_CLIENT_NEXT = 0;
["ZZL_CLIENT_LOOP", "onEachFrame", {
  if (time < ZZL_CLIENT_NEXT) exitWith {};

  private _closed = isNull findDisplay 312;
  if (not _closed and {not isNil "ZZL_PUBLIC_TEXT" and { typeName "" == typeName ZZL_PUBLIC_TEXT }}) then {
    hintSilent parseText ZZL_PUBLIC_TEXT;
  };

  private _state = ZZL_STATE_UNKNOWN;
  private _uid = getPlayerUID player;
  private _var = "";
  if (_uid find "7656" >= 0) then { _var = format ["ZZL_STATE_%1", _uid]; };
  if (count _var > 0) then {
    _state = (if _closed then { "CLOSED" } else { "OPEN" });
    if (_state != (missionNamespace getVariable [_var, "UNKNOWN"])) then {
      missionNamespace setVariable [_var, _state];
      publicVariableServer _var;
    };
  };

  ZZL_CLIENT_NEXT = time + 0.25;
}] call BIS_fnc_addStackedEventHandler;
