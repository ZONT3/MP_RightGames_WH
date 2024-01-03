_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос Пехотного ТС",
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
  "Запрос Тяжелой Техники",
  VVS_fnc_openVVS,
  [VVS_west_Land,"CD"],
  6,
  true,
  true,
  "",
  "true",
  5
];

_this addAction [
  "Запрос Разведовательного ТС",
  VVS_fnc_openVVS,
  [VVS_west_Land,"A10"],
  6,
  true,
  true,
  "",
  "true",
  5
];
