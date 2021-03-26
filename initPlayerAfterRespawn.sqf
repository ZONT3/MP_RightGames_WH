
waituntil { sleep 0.1; !isnull player and {alive player} };
waituntil { sleep 0.1; !isNil 'ZPR_roles' };


private _mechanicus = [["Mechanicus"]] call ZONT_fnc_checkRole;


player enableStamina !_mechanicus;
player setUnitTrait ['engineer', _mechanicus];
