if (!hasInterface) exitWith { };

private _types = ["ztt_terminals", []] call ZONT_fnc_getConst;

private _teleportTerms = [];
{{
  private _params = _x getVariable ["ZTT_params", nil];
  if (not isNil '_params') then {
    _teleportTerms pushBack ( [_x] + _params );
  };
} forEach allMissionObjects _x } forEach _types;

{
  private _thisTermX = _x select 0;
  removeAllActions _thisTermX;
  _thisTermX addAction ["==========================", {},[],150,false,false,"","true",5];
  {
    _x params ["_thisTerm", "_tooltip", "_color", "_posATL", "_cond", "_priority", "_createCond"];

    private _cc = call _createCond;
    if (typeName _cc != typeName true) then { _cc = true };

    if (_thisTermX != _thisTerm && { _cc }) then {
      _thisTermX addAction [
      format ["<t color='%1'>%2</t>", _color, _tooltip],
      {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _arguments spawn {
          params ["_pos", "_term"];
          titleText ["Перемещение...","BLACK OUT",0.5];
          sleep 1;
          player setPosATL _pos;
          player setDir ((getDir player) + (player getRelDir _term) + 180);
          sleep 1;
          titleText ["Перемещение...","BLACK IN",3];
        }
      },
      [_posATL, _thisTerm], _priority + 100, true,true,"",_cond,5];
    }
  } forEach _teleportTerms;
  _thisTermX addAction ["==========================", {},[],100,false,false,"","true",5];
} forEach _teleportTerms;
