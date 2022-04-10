
waituntil { sleep 0.1; !isnull player and {alive player} };
waituntil { sleep 0.1; !isNil 'ZPR_roles' };


private _astartes   = [["Astartes", "Capellanus", "Bibli"]]   call ZONT_fnc_checkRole;
private _mechanicus = [["Mechanicus"]] call ZONT_fnc_checkRole;
private _inqusition = [["Inqusition"]] call ZONT_fnc_checkRole;
private _comissare  = [["Comissare"]]  call ZONT_fnc_checkRole;
private _tempestus  = [["Tempestus"]]  call ZONT_fnc_checkRole;
private _hirurg     = [["Hirurg"]]     call ZONT_fnc_checkRole;
private _apot       = [["Apot"]]       call ZONT_fnc_checkRole;
private _fist       = [["Fist"]]       call ZONT_fnc_checkRole;


player enableFatigue false;
Player enableStamina false;

player setUnitTrait ['engineer', _mechanicus];
player setUnitTrait ['medic', _hirurg or _apot];

if (_mechanicus or _astartes or _fist) then {
  player setCustomAimCoef 0.01;
};
