_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос техники Имперской гвардии",
  VVS_fnc_openVVS,
  [VVS_west_Land,"Guard"],
  6,
  true,
  true,
  "",
  "true",
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
  "true",
  5
];
