//this execVM "init_arsenals.sqf"   -  Вот это вписывай в инициализацию бота



[ _this,
	ars_mp,
	["Second"],
	"Запросить арсенал 1-я экспедиционной бригады морской пехоты",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_mednato,
	["MEDNATO"],
	"Запросить арсенал 1-о медицинского батальона",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_airnato,
	["AIRNATO"],
	"Запросить арсенал 1-й штабной эскадрильи крыла морской пехоты",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_artnato,
	["ARTNATO"],
	"Запросить арсенал 11-о артиллерийского полка",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_ex,
	["EX"],
	"Запросить арсенал Разведки МП США",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_sapnato,
	["SAPNATO"],
	"Запросить арсенал 1-о инженерно-сапёрного батальона",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;