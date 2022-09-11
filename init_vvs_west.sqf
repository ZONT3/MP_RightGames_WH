_this disableAI "move"; _this disableAI "radioprotocol"; _this disableAI "autocombat"; _this disableAI "weaponaim";

_this addAction [
  "Запрос техники NATO",
  VVS_fnc_openVVS,
  [VVS_west_land,"Second"],
  6,
  true,
  true,
  "",
  "[['Second']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос наземной техники NATO",
  VVS_fnc_openVVS,
  [VVS_west_land,"EX"],
  6,
  true,
  true,
  "",
  "[['EX']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос наземной техники NATO",
  VVS_fnc_openVVS,
  [VVS_west_land,"SAPNATO"],
  6,
  true,
  true,
  "",
  "[['SAPNATO']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос наземной техники NATO",
  VVS_fnc_openVVS,
  [VVS_west_land,"AIRNATO"],
  6,
  true,
  true,
  "",
  "[['AIRNATO']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос наземной техники NATO",
  VVS_fnc_openVVS,
  [VVS_west_land,"MEDNATO"],
  6,
  true,
  true,
  "",
  "[['MEDNATO']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Запрос наземной техники NATO",
  VVS_fnc_openVVS,
  [VVS_west_land,"ARTNATO"],
  6,
  true,
  true,
  "",
  "[['ARTNATO']] call ZONT_fnc_checkRole",
  5
];

_this addAction [
  "Ты админ, у тебя есть всё.",
  VVS_fnc_openVVS,
  [VVS_west_land,"AllNATO"],
  6,
  true,
  true,
  "",
  "[['AD']] call ZONT_fnc_checkRole",
  5
];