//	edited by [TF]def 2015 09 20 (0.4.1)
/**/
//Only display vehicles for that players side, if true Opfor can only spawn Opfor vehicles and so on.
VVS_SideOnly = false;

//Only set to true if you are making pre-made vehicle lists with VVS_x (i.e VVS_Car)
VVS_Premade_List = false;

ZONT_fnc_filterVVS = {
  switch(_this) do {
  	case "HQ": { VVS_HQ + VVS_Wheeled };
  	case "BMO": { VVS_BMO };
    case "RMO": { VVS_RMO };
  	case "A10": { VVS_A10 };
  	case "Wheeled": { VVS_Wheeled };
  	case "SWheeled": { VVS_Wheeled_Spec };
  	case "CD": { VVS_CD };
    case "USAF": { VVS_USAF };
    case "CBRN": { VVS_CBRN };
    case "BSO": { VVS_BSO };

  	default {[]};
  };
};

ZONT_fnc_onSpawnVVS = {
  params ["_vehicle", "_class", "_mode"];


  private _fnc_class = switch (_class) do {
    case "OPTRE_M12_FAV_APC": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_LRV": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12A1_LRV": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12G1_LRV": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12R_AA": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M914_RV": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_FAV_APC_MED": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_FAV": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_FAV": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M813_TT": {
      [_vehicle, "colorsnow"] call BIS_fnc_initVehicle;
    };
    case "optre_catfish_atgm_f": {
      [_vehicle, "texWhite"] call BIS_fnc_initVehicle;
    };
    case "optre_catfish_gauss_f": {
      [_vehicle, "texWhite"] call BIS_fnc_initVehicle;
    };
    case "optre_catfish_mg_f": {
      [_vehicle, "texWhite"] call BIS_fnc_initVehicle;
    };
    case "optre_catfish_unarmed_f": {
      [_vehicle, "texWhite"] call BIS_fnc_initVehicle;
    };
  	case "212th_B_APC_Wheeled_02_cannon_F": {
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
    };
    case "212th_B_APC_Wheeled_fs_cannon_F": {
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
    };
    case "212th_B_APC_Wheeled_aa_cannon_F": {
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
    };
    case "212th_B_APC_Wheeled_mg_F": {
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
    };
    case "212th_B_APC_Wheeled_unarmed_F": {
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
    };
  };
};


VVS_HQ = [
];

VVS_Wheeled = [
];

VVS_CD = [
  "TIOW_Krieg_LR_Exterminator_1491st_Blu"
];

VVS_A10 = [
  "Sentinel_CS_404th",
  "B_T_Quadbike_01_F",
  "TIOW_Centaur_01_Krieg_1489_Blu"
];

VVS_Wheeled_Spec = [
];

VVS_BMO = [
  "TIOW_Centaur_01_Krieg_1489_Blu",
  "Cargo_6_Transport",
  "Cargo_6_Transport_closed"
];

VVS_RMO = [
  "B_T_Truck_01_flatbed_F",
  "B_T_Truck_01_cargo_F",
  "Cargo_6_Transport",
  "Cargo_6_Transport_closed",
  "Cargo_6_Supply",
  "Cargo_6_repair"
];

VVS_USAF = [
  "ArvusLighter",
  "ML700_Valkyrie_Transport"
];

VVS_CBRN = [
];

VVS_BSO = [
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
