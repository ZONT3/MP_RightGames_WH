{
  private _changed = false;
  private _broken = 0;
  private _open = [];
  private _unknown = [];
  if (isNil 'ZZL_STATES_ALL') then {
    ZZL_STATES_ALL = createHashMap;
    _changed = true;
  };

  {
    private _uid = getPlayerUID _x;
    if (_uid find "7656" >= 0) then {
      private _var = format ["ZZL_STATE_%1", _uid];
      private _state = missionNamespace getVariable [_var, "UNKNOWN"];
      if ((ZZL_STATES_ALL getOrDefault [_uid, "UNKNOWN"]) != _state) then {
        _changed = true;
        ZZL_STATES_ALL set [_uid, _state];
      };
      switch (_state) do {
        case ("OPEN"): { _open pushBack _x };
        case ("UNKNOWN"): { _unknown pushBack _x };
      };
    } else {
      _broken = _broken + 1;
    };
  } foreach allPlayers;

  if _changed then {
    private _text = "";
    if (count _open > 0) then {
      _text = _text + "<t color='#00FF00'>Активные зевсы:</t>";
      { _text = _text + (format ["<br/>%1 <t color='#F5A010'>%2</t>", name _x, getPlayerUID _x]);
      } forEach _open;
    };
    if (count _unknown > 0) then {
      if (count _text > 0) then { _text = _text + "<br/><br/>" };
      _text = _text + "<t color='#f55510'>НЕИЗВЕСТНО:</t><br/><t color='#8f8f8f'>Сломаны, либо загружаются</t>";
      { _text = _text + (format ["<br/>%1 <t color='#F5A010'>%2</t>", name _x, getPlayerUID _x]);
      } forEach _open;
      _text = _text + "<br/><t color='#f55510'>Если эти игроки уже долго находятся в таком состоянии, попросите их перезайти на сервер / в игру</t>";
    };
    if (_broken > 0) then {
      if (count _text > 0) then { _text = _text + "<br/><br/>" };
      _text = _text + (format ["<t color='#f55510'>НАЙДЕНО ЕЩЕ %1 СЛОМАННЫХ ИГРОКОВ</t><br/>", _broken])
        + "Невозможно узнать не их ник, не стимайди. В зевсе они должны не отображаться как игроки. Найдите их и попросите перезайти на сервер / в игру";
    };

    ZZL_PUBLIC_TEXT = _text;
    publicVariable "ZZL_PUBLIC_TEXT";
  };
} spawn {
  while {true} do {
    call _this;
    sleep 0.25;
  };
};
