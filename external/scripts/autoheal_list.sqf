while {true} do {
    waitUntil {lifeState player == "INCAPACITATED"};
    if (('ACE_adenosine' in (items player)) && ('ACE_ATNAA' in (items player))) then {
        [] execVM 'external\scripts\stimulator.sqf';
    }
	else
	{
	hint format ["Стимуляторы повреждены"];
	};
	sleep 10;
}