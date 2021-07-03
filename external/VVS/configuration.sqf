//	edited by [TF]def 2015 09 20 (0.4.1)
/**/
//Only display vehicles for that players side, if true Opfor can only spawn Opfor vehicles and so on.
VVS_SideOnly = false;

//Only set to true if you are making pre-made vehicle lists with VVS_x (i.e VVS_Car)
VVS_Premade_List = false;

/*
									Pre-set VVS Vehicles
		This is similar to VAS's functionality, using these variables will only make those vehicles available.
		Leave them the way they are if you want to auto-fetch the entire vehicle config and list every vehicle.

		Example:
		VVS_Car = ["C_Offroad_01_F","C_Quadbike_01_F"];
		VVS_Air = ["B_Heli_Light_01_armed_F"];
*/

VVS_Car = [	];

VVS_Air = [ ];
VVS_CIS = [ ];
VVS_Ship = [];
VVS_Armored = [];
VVS_Autonomous = [];
VVS_Support = [];

VVS_Civ_Land = [ ];

VVS_West_Land = [
  "TIOW_CadianChimAuto_836",
  "TIOW_Centaur_01_Cadian_836_Blu",
  "TIOW_CadianTrojan_836",
  "TIOW_CadianWyvern_836",
  "IC_Taurox_HS_woodland",
  "TIOW_Cad_LR_Battlecannon_836th_Blu",
  "TIOW_Cad_LR_Punisher_836th_Blu",
  "TIOW_Cad_LR_Vanquisher_836th_Blu",
  "Sentinel_PC_1490th_1",
  "Sentinel_AC_1490th_1",
  "Sentinel_HB_1490th_1",
  "ML700_Basalisk_ARTY_base"
];

VVS_West_Land_K = [
  "Sentinel_AC_1489th_1",
  "Dos_SOB_Rhino_1",
  "TIOW_CadianChimAuto_IQ",
  "TIOW_Cad_LR_Vanquisher_IQ_Blu",
  "TIOW_DKOKTrojan_1489"
];

VVS_West_Mech = [
  "AM_Chimerro", 
  "AM_Hellhound",
  "IC_Taurox_HS_desert",
  "IC_Tauros_Venator_desert_F",
  "B_Truck_01_covered_F",
  "TIOW_Centaur_01_Cadian_700_Blu"
];

VVS_West_Inq = [
  "Dos_SOB_Rhino_1",
  "TIOW_CadianChimAuto_IQ",
  "TIOW_Cad_LR_Vanquisher_IQ_Blu"
];

VVS_West_scy = [
"IC_Taurox_AutoCannon",
"IC_Taurox_BattleCannon",
"IC_Taurox_GatlingGun"
];

VVS_West_Guard = [
  "IC_Taurox_HS_desert",
  "IC_Tauros_GMG_desert_F",
  "IC_Tauros_HMG_desert_F",
  "IC_Tauros_unarmed_desert_F",
  "IC_Tauros_Venator_desert_F",
  "TIOW_CadianChimAuto_700",
  "TIOW_Cad_LR_Battlecannon_700th_Blu",
  "TIOW_Cad_LR_Punisher_700th_Blu",
  "Sentinel_AC_1491th_1",
  "Sentinel_HB_1491th_1",
  "TIOW_CadianTrojan_700",
  "TIOW_Centaur_01_Cadian_700_Blu",
  "TIOW_CadianHydra_700",
  "Sentinel_PC_1491th_1"
];

VVS_West_sm = [
  "TIOW_SM_Whirlwind_Arty_BA",
  "TIOW_SM_Rhino_BA",
  "TIOW_SM_Razorback_LC_BA",
  "TIOW_SM_Razorback_BA",
  "TIOW_SM_Razorback_AC_BA",
  "TIOW_SM_Vindicator_BA",
  "TIOW_SM_Predator_BA",
  "TIOW_BA_Storm",
  "TIOW_BA_Temp",
  "TIOW_BA_Tornado",
  "TIOW_BA_Typhoon",
  "TIOW_Drop_Pod_BA"
];

VVS_west_car = [
  "IC_Tauros_unarmed_desert_F",
  "TIOW_Centaur_01_Cadian_700_Blu"
];

VVS_West_Air = [
  "ML700_Valkyrie_Multilas",
  "ML700_Avenger_BLU",
  "ML700_Thunderbolt_BLU"
];

VVS_West_Astartes = [
  "TIOW_SM_Rhino_BA",
  "TIOW_SM_Predator_BA",
  "TIOW_SM_Vindicator_BA"
];

VVS_West_Titans = [
  "TIOW_Warhound_LP_TLD_BLU",
  "TIOW_Warhound_LP_VMB_BLU",
  "TIOW_Warhound_LP_VMB_OP",
  "TIOW_Warhound_LP_PBG_OP",
  "TIOW_Warhound_LP_TLD_OP"
];

/*
									Vehicle restriction
		Again, similar to VAS's functionality. If you want to restrict a specific vehicle you can do it or
		you can restrict an entire vehicle set by using its base class.

		Example:
		VVS_Car = ["Quadbike_01_base_F"]; //Completely removes all quadbikes for all sides
		VVS_Air = ["B_Heli_Light_01_armed_F"]; //Removes the Pawnee
*/
VVS_R_Car = [	];
VVS_R_Air = [ ];
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
]
*/
