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
  "TIOW_Valhallan_LR_Annihilator_Camo_Blu",
  "TIOW_Valhallan_LR_Battlecannon_Camo_Blu",
  "TIOW_Valhallan_LR_Conqueror_Camo_Blu",
  "TIOW_Valhallan_LR_Demolisher_Camo_Blu",
  "TIOW_Valhallan_LR_Executioner_Camo_Blu",
  "TIOW_Valhallan_LR_Exterminator_Camo_Blu",
  "TIOW_Valhallan_LR_Punisher_Camo_Blu",
  "TIOW_Valhallan_LR_Vanquisher_Camo_Blu",
  "IC_Taurox_HS_snow",
  "IC_Tauros_GMG_snow_F",
  "IC_Tauros_HMG_snow_F",
  "IC_Tauros_unarmed_snow_F",
  "TIOW_ValhallanChimAuto_White",
  "TIOW_ValhallanHydra_White",
  "TIOW_ValhallanWyvern_White",
  "ML700_Basalisk_ARTY_base"
];

VVS_West_Land_K = [
  "TIOW_Krieg_LR_Annihilator_1489th_Blu",
  "TIOW_Krieg_LR_Battlecannon_1489th_Blu",
  "TIOW_Krieg_LR_Conqueror_1489th_Blu",
  "TIOW_Krieg_LR_Demolisher_1489th_Blu",
  "TIOW_Krieg_LR_Executioner_1489th_Blu",
  "TIOW_Krieg_LR_Exterminator_1489th_Blu",
  "TIOW_Krieg_LR_Punisher_1489th_Blu",
  "TIOW_Krieg_LR_Vanquisher_1489th_Blu",
  "TIOW_Centaur_01_Krieg_1489_Blu",
  "_1489thChimAuto",
  "TIOW_KriegHydra_1489th",
  "TIOW_KriegWyvern_1489th",
  "Sentinel_AC_1489th_1",
  "Sentinel_PC_1489th_1",
  "Sentinel_LC_1489th_1"
];

VVS_West_Mech = [
  "TIOW_Warhound_LP_TLD_BLU",
  "AM_Chimerro",
  "AM_Hellhound",
  "TIOW_Warhound_LP_VMB_BLU",
  "IC_Taurox_HS_snow"
];

VVS_west_car = [
  "IC_Tauros_unarmed_woodland_F"
];

VVS_West_Air = [
  "ML700_Valkyrie_Transport",
  "ML700_Valkyrie_Multilas",
  "TIOW_Valkyrie_Fuel_B",
  "TIOW_Valkyrie_Fuel_M_B",
  "TIOW_Valkyrie_Rocket_B",
  "TIOW_Valkyrie_Rocket_M_B",
  "ML700_Avenger_BLU",
  "ML700_Thunderbolt_BLU"
];

VVS_West_Astartes = [
  "TIOW_SM_Rhino_SW",
  "TIOW_SM_Predator_SW",
  "TIOW_SM_Vindicator_SW"
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
