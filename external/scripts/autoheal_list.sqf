while {true} do {
    waitUntil {lifeState player == "INCAPACITATED"};
    if (('ACE_adenosine' in (items player)) && ('ACE_ATNAA' in (items player))) then {
        [] execVM 'external\scripts\stimulator.sqf';;
    }
    else
    {
    hint format ["Стимуляторы повреждены"];
    };

        used = player getVariable ['Heal_Used', 0];

    if (used == 1000) then
    {
    waitUntil {lifeState player == "DEAD"};
    player setVariable ["Heal_Used", 0, true];
    };
    //used = player getVariable ['Heal_Used', 0];
    //hint format ["осталось %1", used];
    sleep 10;
} 
