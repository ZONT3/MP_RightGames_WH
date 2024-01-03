diag_log ("Fetching locker " + _this);

private _res = [MPS_BDL_lockers, "getLocker", [_this]] call ZONT_fnc_bd_customRequest;
private _new = [[[],[]],[[],[]],[[],[]],[[],[]]];

private ['_content'];

try {
  _content = _res select 0 select 0;
} catch { };

if (not isNil '_content') exitWith {
  diag_log ("Fetched");
  _content
};

diag_log ("Creating new");
[MPS_BDL_lockers, "addLocker", [_this]] call ZONT_fnc_bd_customRequest;
[MPS_BDL_lockers, "updLocker", [_new, _this]] call ZONT_fnc_bd_customRequest;
_new
