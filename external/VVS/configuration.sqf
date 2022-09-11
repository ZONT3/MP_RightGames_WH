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
  	case "VDV": { VVS_VDV };
	  case "ART": { VVS_ART };
	  case "TV": { VVS_TV };
  	case "Wheeled": { VVS_Wheeled };
  	case "SWheeled": { VVS_Wheeled_Spec };

  	default {[]};
  };
};

ZONT_fnc_onSpawnVVS = {
  params ["_vehicle", "_class", "_mode"];


  private _fnc_class = switch (_class) do {
    case "OPTRE_M808S": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M808B2": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M808B_UNSC": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M813_TT": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12A1_LRV": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12R_AA": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12G1_LRV": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_FAV_APC": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_LRV": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M412_IFV_UNSC": {
      [_vehicle, "colortan"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M413_MGS_UNSC": {
      [_vehicle, "colortan"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M494": {
      [_vehicle, "colordes"] call BIS_fnc_initVehicle;
    };
  };
};


VVS_HQ = [
];

VVS_Wheeled = [
];

VVS_BMO = [
  "rhs_tigr_vdv",
  "rhs_tigr_sts_vdv",
  "rhs_tigr_m_3camo_vdv",
  "RHS_Ural_Fuel_VDV_01",
  "RHS_Ural_Repair_VDV_01",
  "rhs_gaz66_flat_vdv",
  "RHS_Ural_VDV_01"
];

VVS_TV = [
  "rhs_t72be_tv",
  "rhs_t90sab_tv",
  "rhs_t80um"
];

VVS_ART = [
  "rhs_2s1_tv"
];

VVS_VDV = [
  "rhs_bmd4ma_vdv",
  "rhs_bmd4m_vdv",
  "rhs_btr80a_vdv",
  "rhs_btr80_vdv"
];

VVS_Wheeled_Spec = [
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
