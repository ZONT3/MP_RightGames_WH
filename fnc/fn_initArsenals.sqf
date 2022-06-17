private _cls = call compile preprocessFileLineNumbers "cfg_arsenals.sqf";
waitUntil {sleep 1; vehicle player == player};

{
  _x params ["_name", "_list"];
  try {
    assert (typeName [] == typeName _list);
    missionNamespace setVariable [format ["ZARS_L_%1", _name], _list];
  } catch {
    diag_log format ["ZARS INIT ERROR (%1): %2", _name, _exception];
  };
} foreach _cls;
