//	edited by [TF]def 2015 09 20 (0.4.1)
/**/
//Only display vehicles for that players side, if true Opfor can only spawn Opfor vehicles and so on.
VVS_SideOnly = false;

//Only set to true if you are making pre-made vehicle lists with VVS_x (i.e VVS_Car)
VVS_Premade_List = false;

ZONT_fnc_filterVVS = {
  switch(_this) do {
  	case "PDF": { VVS_West_Guard };
  	case "Mechanicus": { VVS_West_Mech };
  	case "Astartes": { VVS_West_Astartes };
  	case "SM": { VVS_West_sm };
	case "Navy": { VVS_West_Navy };
	case "Scion": { VVS_West_Scion };

  	default {[]};
  };
};

ZONT_fnc_onSpawnVVS = {
  // params ["_mode", "_vehicle"];
  switch(_this) do {
  	case "TV": { {
      _vehicle setVehicleAmmo 0;
      _vehicle setFuel 0
    } };

  	default {nil};
  };
};


VVS_West_Mech = [
  "TIOW_Centaur_01_Cadian_667_Blu",
  "IC_Chimera_01_snow",
  "O_ScorpiusDisintegrator",
  "AM_Chimerro",
  "AM_Hellhound",
  "B_Truck_01_cargo_F",
  "VNG_Vanguard_Trojan",
  "B_Truck_01_transport_F"
];

VVS_West_Guard = [
  "IC_Taurox_HS_snow",
  "IC_Tauros_GMG_snow_F",
  "IC_Tauros_HMG_snow_F",
  "IC_Tauros_unarmed_snow_F",
  "IC_Tauros_Venator_snow_F",
  "IC_Chimera_01_snow",
  "TIOW_CadianChimAuto_667",
  "TIOW_Cad_LR_Battlecannon_667th_Blu",
  "TIOW_Cad_LR_Punisher_667th_Blu",
  "Sentinel_AC_1490th_1",
  "Sentinel_HB_1490th_1",
  "Sentinel_MLA_1490th_1",
  "Sentinel_HB_1490th_1",
  "TIOW_CadianTrojan_667",
  "TIOW_Centaur_01_Cadian_667_Blu",
  "TIOW_CadianHydra_667",
  "B_Truck_01_cargo_F",
  "B_Truck_01_transport_F"
];

VVS_West_sm = [
  "TIOW_SM_Whirlwind_Arty_BA",
  "TIOW_SM_Rhino_BA",
  "TIOW_SM_Razorback_LC_BA",
  "TIOW_SM_Razorback_BA",
  "TIOW_SM_Razorback_AC_BA",
  "TIOW_SM_Vindicator_BA",
  "TIOW_SM_Predator_BA",
  "Steve_Ass_Ram_BA_1",
  "TIOW_BA_Storm",
  "TIOW_BA_Temp",
  "TIOW_BA_Tornado",
  "TIOW_BA_Typhoon",
  "TIOW_Drop_Pod_BA"
];

VVS_West_Astartes = [
  "DW_Rhino",
  "DW_VIND",
  "TIOW_SM_Whirlwind_Arty_IH",
  "TIOW_SM_Razorback_LC_IH",
  "TIOW_SM_Razorback_IH",
  "TIOW_SM_Razorback_AC_IH",
  "TIOW_SM_Predator_IH",
  "TIOW_IH_Temp",
  "TIOW_IH_Storm",
  "TIOW_IH_Tornado",
  "TIOW_IH_Typhoon",
  "TIOW_SM_Rhino_IH"
];

VVS_West_Navy = [
  "ML700_Thunderbolt_BLU",
  "TIOW_Thunderbolt_Base",
  "ML700_Avenger_BLU",
  "ML700_Valkyrie_Multilas",
  "ML700_Valkyrie_Transport",
  "TIOW_Valkyrie_Fuel_B",
  "TIOW_Valkyrie_Fuel_M_B",
  "TIOW_Valkyrie_Rocket_B",
  "TIOW_Valkyrie_Rocket_M_B",
  "testHelo_Rocket_Auto",
  "testHelo_Rocket_Las",
  "TIOW_CadianTrojan_667"
];

VVS_West_Scion = [
  "IC_Taurox_GatlingGun",
  "IC_Taurox_BattleCannon",
  "IC_Taurox_AutoCannon"
];

VVS_Car = [];
VVS_Air = [];
VVS_Ship = [];
VVS_Armored = [];
VVS_Autonomous = [];
VVS_Support = [];

VVS_R_Car = [];
VVS_R_Air = [];
VVS_R_Ship = [];
VVS_R_Armored = [];
VVS_R_Autonomous = [];
VVS_R_Support = [];


/*
this disableAI "move"; this disableAI "radioprotocol"; this disableAI "autocombat"; this disableAI "weaponaim";
this addAction [
"Запрос Техники",
VVS_fnc_openVVS,
[VVS_west_Land,"West"],
6,
true,
true,
"",
"true",
5
];
*/
