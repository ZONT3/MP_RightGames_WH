/** by ZONT_
 ** part of Profiles Framework
 **
 ** Summary
 **   Проверяет, есть (нет) ли роль(и) у игрока
 **   ЗАМЕЧАНИЕ: в параметрах указываются не ID ролей, а строка - имя класса из CfgRoles (roles.ext)
 **   Условия нормальной работы: инициализирована система профилей, профиль загружен с сервера
 **
 ** Params
 **   0: white-list <ARRAY of STRINGS>:
 **     условие выполняется при наличии хотя бы одной из этих ролей
 **   1: black-list <ARRAY of STRINGS>:
 **     условие НЕ выполняется при наличии хотя бы одной из этих ролей
 **   2: required-list <ARRAY of STRINGS>:
 **     условие выполняется при наличии ВСЕХ из этих ролей
 **
 ** Returns
 **   <BOOLEAN> true если выполнены условия 0,1,2.
 **/

params [["_wl", [], [[]]], ["_bl", [], [[]]], ["_rl", [], [[]]]];

if not assert (!isNil "ZPR_roles") exitWith { };

private _roles = call ZONT_fnc_getRoles;
private _fn_toID = {
  private _id = 0;
  {
      _x params ["_xid", "_name", "_classname"];
      if (toLowerANSI _classname == toLowerANSI _this) exitWith {
        _id = _xid
      };
  } foreach _roles;
  _id
};

{
  call compile format [
      "%1 = %1 apply {_x call _fn_toID}; " +
      "%1 = (%1 arrayIntersect %1) - [0]",
       _x ];
} foreach ["_wl", "_bl", "_rl"];


if (-100 in ZPR_roles) exitWith { true };

private _b = true;

{
  if not (_x in ZPR_roles) exitWith {_b = false};
} foreach _rl;

if not _b exitWith {false};

{
  if (_x in _bl) exitWith {_b = false};
} foreach ZPR_roles;

if not _b exitWith {false};

_b = count _wl == 0;
{
  if (_x in ZPR_roles) exitWith {_b = true};
} foreach _wl;
_b
