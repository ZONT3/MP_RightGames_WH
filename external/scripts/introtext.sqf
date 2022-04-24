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
  ["Планета Атрия. Сегментум Ультима. ", "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
  ["","<br/>"],
  ["117-й Кадианский полк", "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'", "#aaaaaa"], 
  ["","<br/>"], 
  ["Военная база Андвари","align = 'center' shadow = '1' size = '1.0'"]
 ] 
] spawn BIS_fnc_typeText2;

uisleep 12; //Время до начала титров

_role1 = "Warhammer 40.000";
_role1names = ["Right Games"];
_role2 = "Во мраке далекого будущего";
_role2names = ["есть только война"];
_role3 = "Где-то на полях бесконечных сражений";
_role3names = [""];
_role4 = "Бог-Император смотрит на тебя";
_role4names = [profileName];
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
[_role3, _role3names],
[_role4, _role4names]
];