/*
	File: introtext.sqf
	Description: Добавляет текст после загрузки игрока на сервер
*/
txt1Layer = "txt1" call BIS_fnc_rscLayer;
txt2Layer = "txt2" call BIS_fnc_rscLayer;
txt3Layer = "txt3" call BIS_fnc_rscLayer;
txt4Layer = "txt4" call BIS_fnc_rscLayer;

_onScreenTime = 7;

titleCut ["","BLACK IN",20];
uisleep 10;
[
 [
  ["2004 год, ноябрь. Южная Европа. Королество Такистан.", "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
  ["","<br/>"],
  ["Окрестности Заргабада.", "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'", "#aaaaaa"],
  ["","<br/>"],
 ]
] spawn BIS_fnc_typeText2;

uisleep 12; //Время до начала титров

_role1 = "Operation New Hope";
_role1names = ["Right Games"];
_role2 = "Родина надеется на тебя!";
_role2names = ["Как сказал великий поэт и воин Ice Cube - «Если день прошел и калаш не пригодился — это был пиздатый день!»"];
{
sleep 2; // #1f75fe
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.7' color='#aaaaaa' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.8' color='#ffeeee' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.6);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.7], //Стандарт: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //Стандарт: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//В списке ниже должно быть точно такое же количество ролей, как и в списке выше
[_role1, _role1names],
[_role2, _role2names],
];
