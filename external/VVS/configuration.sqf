//	edited by [TF]def 2015 09 20 (0.4.1)
/**/
//Only display vehicles for that players side, if true Opfor can only spawn Opfor vehicles and so on.
VVS_SideOnly = false;

//Only set to true if you are making pre-made vehicle lists with VVS_x (i.e VVS_Car)
VVS_Premade_List = false;

ZONT_fnc_filterVVS = {
  switch(_this) do {
	/*Наборы ОДКБ*/
  	case "All": { VVS_all_vechicle };
  	case "First_W": { VVS_rolls + VVS_gus };
  	case "ART": { VVS_rolls + VVS_art };
  	case "AIR": { VVS_rolls };
	case "SAP": { VVS_rolls };
	case "MEDIC": { VVS_rolls };
	case "RAZ": { VVS_rolls };
	/*Наборы НАТО*/
	case "Second": { VVS_land_nato + VVS_hw_nato };
	case "EX": { VVS_land_nato };
	case "SAPNATO": { VVS_land_nato };
	case "AIRNATO": { VVS_land_nato };
	case "MEDNATO": { VVS_land_nato };
	case "ARTNATO": { VVS_land_nato + VVS_art_nato };
	case "AllNATO": { VVS_All };

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

/*Ниже техника ОДКБ*/
VVS_all_vechicle = [
"rhs_2s3_tv",
"rhs_D30_vdv",
"rhs_bmd2",
"rhs_bmd1p",
"UK3CB_CW_SOV_O_LATE_UAZ_AGS30",
"UK3CB_CW_SOV_O_LATE_UAZ_Closed",
"UK3CB_CW_SOV_O_LATE_UAZ_MG",
"UK3CB_CW_SOV_O_LATE_UAZ_SPG9",
"UK3CB_ARD_O_MTLB_PKT",
"rhs_gaz66_vdv",
"rhs_gaz66_flat_vdv",
"rhs_gaz66_r142_vdv",
"rhs_gaz66_ammo_vdv",
"rhs_gaz66o_vdv",
"rhs_gaz66_ap2_vdv",
"rhs_btr80_vdv",
"rhsgref_BRDM2_vdv",
"rhs_bmp2d_vdv",
"rhs_bmp1p_vdv",
"RHS_Ural_Fuel_MSV_01"
];

VVS_rolls = [
"UK3CB_CW_SOV_O_LATE_UAZ_AGS30",
"UK3CB_CW_SOV_O_LATE_UAZ_Closed",
"UK3CB_CW_SOV_O_LATE_UAZ_MG",
"UK3CB_CW_SOV_O_LATE_UAZ_SPG9",
"rhs_gaz66_vdv",
"rhs_gaz66_flat_vdv",
"rhs_gaz66_r142_vdv",
"rhs_gaz66_ammo_vdv",
"rhs_gaz66o_vdv",
"rhs_gaz66_ap2_vdv",
"RHS_Ural_Fuel_MSV_01"
];

VVS_gus = [
"rhs_bmd2",
"rhs_bmd1p",
"UK3CB_ARD_O_MTLB_PKT",
"rhs_btr80_vdv",
"rhsgref_BRDM2_vdv",
"rhs_bmp2d_vdv",
"rhs_bmp1p_vdv"
];

VVS_art = [
"rhs_2s3_tv",
"rhs_D30_vdv"
];



/*Ниже техника Нато*/

VVS_All = [
"UK3CB_B_MTVR_Repair_USMC_DES",
"UK3CB_B_MTVR_Open_USMC_DES",
"UK3CB_B_MTVR_Refuel_USMC_DES",
"UK3CB_B_MTVR_Closed_USMC_DES",
"UK3CB_B_MTVR_Reammo_USMC_DES",
"rhsusf_m1025_d_s_m2",
"rhsusf_m1025_d_s_Mk19",
"rhsusf_m1025_d_s",
"rhsusf_m998_d_s_2dr_halftop",
"rhsusf_m998_d_s_4dr",
"rhsusf_m109d_usarmy",
"RHS_M119_D",
"rhsusf_m109d_usarmy",
"RHS_M119_D",
"UK3CB_B_LAV25_HQ_US_DES",
"UK3CB_B_LAV25_US_DES",
"UK3CB_B_AAV_US_DES",
"UK3CB_KRG_B_M2A2"
];

VVS_land_nato = [
"UK3CB_B_MTVR_Repair_USMC_DES",
"UK3CB_B_MTVR_Open_USMC_DES",
"UK3CB_B_MTVR_Refuel_USMC_DES",
"UK3CB_B_MTVR_Closed_USMC_DES",
"UK3CB_B_MTVR_Reammo_USMC_DES",
"rhsusf_m1025_d_s_m2",
"rhsusf_m1025_d_s_Mk19",
"rhsusf_m1025_d_s",
"rhsusf_m998_d_s_2dr_halftop",
"rhsusf_m998_d_s_4dr"
];

VVS_art_nato = [
"rhsusf_m109d_usarmy",
"RHS_M119_D"
];

VVS_hw_nato = [
"rhsusf_m109d_usarmy",
"RHS_M119_D",
"UK3CB_B_LAV25_HQ_US_DES",
"UK3CB_B_LAV25_US_DES",
"UK3CB_B_AAV_US_DES",
"UK3CB_KRG_B_M2A2"
];



/*
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
