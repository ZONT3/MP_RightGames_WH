/*
	File: introtext.sqf
	Description: Добавляет текст после загрузки игрока на сервер
*/

PlayMusic ""; 
["Nigth Qween VIP", "Jyc Row"] spawn BIS_fnc_infoText;
playMusic "music1";
sleep 34.5;

["<t size='2' color='#888888' align=`left` font='PuristaBold'>Warhammer 40k</t><br /><t size='2' color='#888888' align=`left` font='PuristaBold'>Right Games</t><br />", -0.45, 1, 5, 0, 0] spawn BIS_fnc_dynamicText;
["unnamed.paa", [-0.7,1,0.23,0.3]] spawn BIS_fnc_textTiles;

PlayMusic "";
