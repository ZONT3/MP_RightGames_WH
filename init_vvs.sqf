_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос техники Имперских Кулаков",
  VVS_fnc_openVVS,
  [VVS_west_Land,"Fist"],
  6,
  true,
  true,
  "",
  "[['Fist']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос техники Саламандр",
  VVS_fnc_openVVS,
  [VVS_west_Land,"SL"],
  6,
  true,
  true,
  "",
  "[['SL']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос техники Механикус",
  VVS_fnc_openVVS,
  [VVS_west_Land_Mec,"Mechanicus"],
  6,
  true,
  true,
  "",
  "[['Mechanicus']] call ZONT_fnc_checkRole",
  5
];
