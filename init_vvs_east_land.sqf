_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Здравия, начальник. Нужна техника?",
  VVS_fnc_openVVS,
  [VVS_east_land,"First_W"],
  6,
  true,
  true,
  "",
  "[['First']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Здарова, артиллерист. Кого сегодня градом накрываем?",
  VVS_fnc_openVVS,
  [VVS_east_land,"ART"],
  6,
  true,
  true,
  "",
  "[['ART']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Пилот, вы решили сегодня не летать?",
  VVS_fnc_openVVS,
  [VVS_east_land,"AIR"],
  6,
  true,
  true,
  "",
  "[['AIR']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Здаров, бери технику, только не подорви её на своих минах!",
  VVS_fnc_openVVS,
  [VVS_east_land,"SAP"],
  6,
  true,
  true,
  "",
  "[['SAP']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Здаров, бери технику. Только поробуй запачкать её кровью!",
  VVS_fnc_openVVS,
  [VVS_east_land,"MEDIC"],
  6,
  true,
  true,
  "",
  "[['MEDIC']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Нужна техника для разведки? Только попробуй её потерять в лесу!",
  VVS_fnc_openVVS,
  [VVS_east_land,"RAZ"],
  6,
  true,
  true,
  "",
  "[['RAZ']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Ты админ, у тебя есть всё.",
  VVS_fnc_openVVS,
  [VVS_east_land,"All"],
  6,
  true,
  true,
  "",
  "[['AD']] call ZONT_fnc_checkRole",
  5
];