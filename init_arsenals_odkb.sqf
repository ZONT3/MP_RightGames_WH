//this execVM "init_arsenals.sqf"   -  Вот это вписывай в инициализацию бота



[ _this,
	ars_vdv,
	["First"],
	"Запросить арсенал 119-о Гв. парашютно-десантного полка Александра Невского",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_medic,
	["MEDIC"],
	"Запросить арсенал 313-о отдельного медицинского батальона",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_air,
	["AIR"],
	"Запросить арсенал 535-й отдельной смешанной авиационной эскадрильи",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_art,
	["ART"],
	"Запросить арсенал 83-о самоходно-артиллерийского дивизиона",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_raz,
	["RAZ"],
	"Запросить арсенал 72-й отдельной разведывательной роты",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_sap, //Обязательно без строчных, иначе багается
	["SAP"],
	"Запросить арсенал 143-о гвардейского инженерно-сапёрного батальона",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;