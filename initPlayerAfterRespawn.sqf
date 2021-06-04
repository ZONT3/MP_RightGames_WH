
waituntil { sleep 0.1; !isnull player and {alive player} };
waituntil { sleep 0.1; !isNil 'ZPR_roles' };


private _mechanicus = [["Mechanicus"]] call ZONT_fnc_checkRole;
private _inqusition = [["Inqusition"]] call ZONT_fnc_checkRole;
private _astartes   = [["Astartes"]]   call ZONT_fnc_checkRole;
private _comissare  = [["Comissare"]]  call ZONT_fnc_checkRole;


player enableStamina !(_mechanicus or _inqusition or _astartes or _comissare);

player setUnitTrait ['engineer', _mechanicus];

if (_mechanicus or _astartes) then {
  player setCustomAimCoef 0.01;
};
