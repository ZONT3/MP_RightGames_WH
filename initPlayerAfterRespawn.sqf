
waituntil { sleep 1; !isnull player and {alive player} };
waituntil { sleep 1; !isNil 'ZPR_roles' };

private _mechanicus = [["Mechanicus"]] call ZONT_fnc_checkRole;


player enableStamina !_mechanicus;
