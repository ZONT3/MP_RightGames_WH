/******         Database, Database, just living in the Database...       ******/
MPS_spawn_BDINIT = [] spawn {
  [] call ZONT_fnc_bd_initBasic;
  MPS_BDL_pres =
      ["profiles"] call ZONT_fnc_bd_initCustom;
  MPS_BDL_status =
      ["status"] call ZONT_fnc_bd_initCustom;
      MPS_BDL_lockers =
    ["lockers"] call ZONT_fnc_bd_initCustom;
};

MPH_COMMITER = [{ [] call ZONT_fnc_commitInfo }, 20] call CBA_fnc_addPerFrameHandler;

/******                               ???                                ******/
private _fortif_list = [
    ["Land_RepairDepot_01_green_F",100],
	["Box_NATO_AmmoVeh_F",50],
	["836th_flag",10],
	["land_Aquila",25],
	["Land_PortableLight_double_F",10],
	["Land_Campfire_F",10],
	["Land_WoodenLog_F",10],
	["Land_tent_east",15],
	["Land_Trench_01_forest_F",20],
	["Land_fort_rampat",20],
	["Land_BagFence_Long_F",15],
	["Land_BagFence_Short_F",15],
	["Land_BagFence_Corner_F",15],
	["Land_BagFence_Round_F",15],
	["Land_Plank_01_4m_F",10],
	["Land_BagBunker_Small_F",25],
	["Land_BagBunker_Large_F",50],
	["CUP_A2_Road_Bridge_wood_25",100],
    ["B_Boat_Transport_01_F",50]
];
[west,       15000, _fortif_list] call acex_fortify_fnc_registerObjects;
[east,       15000, _fortif_list] call acex_fortify_fnc_registerObjects;
[resistance, 15000, _fortif_list] call acex_fortify_fnc_registerObjects;
