params [["_target", objNull, [objNull]], ["_cargo", [], [[]]], ["_clear", true, [true]]];

if (isNull _target) exitWith {};
if (count _cargo < 4) exitWith {};
if (
  {
    if not (_x isEqualType []) exitWith { true };
    false
  } foreach _cargo
) exitWith {};

_cargo params ["_weap", "_item", "_mag", "_back"];

if _clear then {
  clearWeaponCargoGlobal _target;
  clearItemCargoGlobal _target;
  clearMagazineCargoGlobal _target;
  clearBackpackCargoGlobal _target;
};

{ _target addWeaponCargoGlobal   [_x, _weap # 1 # _forEachIndex] } foreach (_weap # 0);
{ _target addItemCargoGlobal     [_x, _item # 1 # _forEachIndex] } foreach (_item # 0);
{ _target addMagazineCargoGlobal [_x, _mag  # 1 # _forEachIndex] } foreach (_mag  # 0);
{ _target addBackpackCargoGlobal [_x, _back # 1 # _forEachIndex] } foreach (_back # 0);
