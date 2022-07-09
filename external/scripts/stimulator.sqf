used = player getVariable ['Heal_Used', 0];
last_used = player getVariable ['Last_Used', 0];
if ((time - last_used < 45) && (used != 0)) then
	{
	hint format ["Стимуляторы еще не готовы"];
}
else
{
	if (used < 3) then
		{
			player setVariable ["Heal_Used", used + 1, true];
			player setVariable ["Last_Used", time, true];
			hint format ["Вводятся стимуляторы. Осталось зарядов: %1", 3-used];
			sleep 5;
			addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
			titleCut ["", "WHITE IN", 2];
			player call ace_medical_treatment_fnc_fullHealLocal;
			hintSilent "";
		}
	else
		{
			player setVariable ["Heal_Used", 0, true];
			hint format ["Это последный заряд. Стимуляторов больше нет."];
			player removeItem "ACE_ATNAA";
			sleep 5;
			addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
			titleCut ["", "WHITE IN", 2];
			player call ace_medical_treatment_fnc_fullHealLocal;
			hintSilent "";
		};
};
