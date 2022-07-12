used = player getVariable ['Heal_Used', 0];
last_used = player getVariable ['Last_Used', 0];
amount_charges = 2;  // вводите количество поднятий которые возможны
timer = 45; // вводите количество времени между поднятиями 
if ((time - last_used < timer) && (used != 0)) then
    {
    hint format ["Стимуляторы еще не готовы"];
    sleep 1;
    }
else
{
    sleep 1;
    if (used+1 < amount_charges) then
        {
            player setVariable ["Heal_Used", used + 1, true];
            player setVariable ["Last_Used", time, true];
            hint format ["Вводятся стимуляторы. Осталось зарядов: %1", amount_charges-used-1];
            sleep 5;
            addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
            titleCut ["", "WHITE IN", 2];
            player call ace_medical_treatment_fnc_fullHealLocal;
            hintSilent "";
        }
    else
        {
            if (used+1 == amount_charges) then
            {
                player setVariable ["Heal_Used", 1000, true];
                hint format ["Это последный заряд. Стимуляторов больше нет."];
                player removeItem "ACE_ATNAA";
                player removeItem "ACE_adenosine";
                sleep 5;
                addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
                titleCut ["", "WHITE IN", 2];
                player call ace_medical_treatment_fnc_fullHealLocal;
                hintSilent "";
            }
           else
            {
                hint format ["Стимуляторов больше нет."];
                sleep 5;
            }
        };
};
