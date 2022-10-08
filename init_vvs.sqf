_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос Техники БМО",
  VVS_fnc_openVVS,
  [VVS_west_Land,"BMO"],
  6,
  true,
  true,
  "",
  "true",
  5
];

_this addAction [
  "Запрос специальной колесной техники",
  VVS_fnc_openVVS,
  [VVS_west_Land,"SWheeled"],
  6,
  true,
  true,
  "",
  "[['SOAR']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Техники 2nd Armored Squad",
  VVS_fnc_openVVS,
  [VVS_west_Land,"CD"],
  6,
  true,
  true,
  "",
  "[['AF']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос Техники Штаба",
  VVS_fnc_openVVS,
  [VVS_west_Land,"HQ"],
  6,
  true,
  true,
  "",
  "[['HQ']] call ZONT_fnc_checkRole",
  5
];
