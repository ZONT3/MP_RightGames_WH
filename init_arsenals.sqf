//this execVM "init_arsenals.sqf"   -  Вот это вписывай в инициализацию бота



[ _this,
	ars_fist,
	["Fist"],
	"Запросить арсенал Имперской Гвардии",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_tempestus,
	["Tempestus"],
	"Запросить арсенал Штурмовиков Инквизиции",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_comissare,
	["Comissare"],
	"Запросить арсенал Коммисаров",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_psy,
	["Psy"],
	"Запросить арсенал Псайкеров",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;

[ _this,
	ars_monk,
	["Monk"],
	"Запросить арсенал Священника",
	[["Здарова", "Hello"], ["Бб", "Бывай"]]
] call ZONT_fnc_attachArsenal;