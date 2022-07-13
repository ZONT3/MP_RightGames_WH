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
private _sl         = [["SL"]]         call ZONT_fnc_checkrole;
private _tech         = [["Tech"]]         call ZONT_fnc_checkrole;

player enableFatigue true;
player enableStamina true;

player setUnitTrait ['engineer', _mechanicus or _tech];
player setUnitTrait ['medic', _hirurg or _apot];
if (_mechanicus or _tech) then {
player setVariable ["ace_advanced_fatigue_performanceFactor", 20, true];
player setVariable ["ace_advanced_fatigue_recoveryFactor", 15, true];
};
if (_astartes or _sl or _mechanicus or _tech or _apot) then {
  player enableStamina false;
  player enableFatigue false;
  player setCustomAimCoef 0.001;
};
