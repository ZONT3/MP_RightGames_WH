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

VVS_AFRF_Land = [
  "rhs_bmd4m_vdv",
  "rhs_btr80a_vdv",
  "rhs_t90am_tv",
  "rhs_t72be_tv",
  "CUP_O_2S6M_RU",
  "LOP_US_2S1",
  "min_rf_sa_22",
  "min_rf_2b26"
];

VVS_AFRF_Wheel = [
  "rhs_kamaz5350_open_vdv",
  "rhs_kamaz5350_vdv",
  "B_LSV_01_unarmed_F",
  "av_rus_Truck_03_covered_F",
  "av_Quadbike_F",
  "rhs_tigr_m_3camo_vdv",
  "rhs_tigr_3camo_vdv",
  "rhs_tigr_sts_3camo_vdv",
  "JMSRUS_rf_truck_covered_MP",
  "av_UAZ_patp2",
  "av_r007_mg"
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
