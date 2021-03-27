
waituntil { sleep 0.1; !isnull player and {alive player} };
waituntil { sleep 0.1; !isNil 'ZPR_roles' };


private _mechanicus = [["Mechanicus"]] call ZONT_fnc_checkRole;
private _inqusition = [["Inqusition"]] call ZONT_fnc_checkRole;


player enableStamina !(_mechanicus || _inqusition);

player setUnitTrait ['engineer', _mechanicus];
