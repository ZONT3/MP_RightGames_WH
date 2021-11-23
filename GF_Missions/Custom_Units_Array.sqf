


//________________  Author : GEORGE FLOROS [GR] ___________ 29.08.18 _____________

/*
________________ GF Missions Script ________________

https://forums.bohemia.net/forums/topic/219080-gf-missions-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


//________________	Description	________________
//	This is an extra file for the missions that use DAC
//	You can add here the selected units

//________________	DAC	________________
GF_DAC_Pool_Units = [
	"WD_ACamo_Rifleman_Heavy","WD_ACamo_Rifleman_Light","WD_ACamo_Rifleman_Medium","WD_A2Camo_Rifleman_Heavy","WD_A2Camo_Rifleman_Light","WD_A2Camo_Rifleman_Medium","SC_AR_Urban_Officer","WD_ACamo_Marksman"
	];
GF_DAC_Pool_Land_Vehicles = [
	"I_G_Offroad_01_repair_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_Quadbike_01_F","I_G_Quadbike_01_F","I_MRAP_03_hmg_F",
	"I_MRAP_03_gmg_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_C_Offroad_02_unarmed_F","I_C_Offroad_02_unarmed_brown_F",
	"I_C_Offroad_02_unarmed_olive_F","I_C_Van_01_transport_F","B_LSV_01_armed_black_F","B_LSV_01_armed_olive_F","B_G_Offroad_01_AT_F",
	"B_LSV_01_armed_sand_F","B_G_Van_01_transport_F","O_Truck_03_transport_F","I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F",
	"B_G_Offroad_01_armed_F","O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F","O_Truck_03_covered_F","O_Truck_02_transport_F",
	"O_G_Van_01_transport_F","O_T_LSV_02_armed_viper_F","O_LSV_02_armed_F","O_T_LSV_02_armed_black_F","O_LSV_02_armed_arid_F",
	"C_Hatchback_01_sport_F","C_SUV_01_F","C_Offroad_01_repair_F","C_Truck_02_covered_F","C_Quadbike_01_black_F"
	];
GF_DAC_Pool_Armoured_Vehicles = [
	"I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","O_MBT_02_arty_F","O_MBT_02_cannon_F",
	"O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_v2_F","I_Truck_02_MRL_F",
	//	static
	"I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_Mortar_01_F","I_G_Mortar_01_F","I_static_AA_F",
	"I_static_AT_F"
	];
GF_DAC_Pool_Air_Vehicles = [
	"O_Heli_Attack_02_F","O_Heli_Light_02_armed_F","I_Heli_light_03_F","O_Heli_Light_02_F","B_Heli_Attack_01_F",
	"B_Heli_Light_01_armed_F","O_Heli_Attack_02_black_F","B_Heli_Transport_03_F","B_Heli_Transport_01_F",
	"O_Heli_Light_02_dynamicLoadout_F","O_Heli_Light_02_v2_F","O_Heli_Transport_04_bench_black_F","O_Heli_Transport_04_covered_F",
	"B_Heli_Light_01_F","B_Heli_Light_01_dynamicLoadout_F",
	//	static
	"I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_Mortar_01_F","I_G_Mortar_01_F","I_static_AA_F",
	"I_static_AT_F"
	];



	//________________	Pool_Units	________________

GF_Pool_Units = [
	"ML700_Bloodpact_Autorifleman","ML700_Bloodpact_Etogaur","ML700_Bloodpact_Light_AT","ML700_Bloodpact_Marksman","ML700_Bloodpact_Officer","ML700_Bloodpact_Plasma","ML700_Bloodpact_Rifleman_Autogun","ML700_Bloodpact_VOX"
	];

GF_Pool_Land_Vehicles = [
	"ML700_Taurox_Stubber_BP","Sentinel_ML_Possessed_0_BL","Sentinel_CS_Possessed_0_BL"
	];
GF_Pool_Armoured_Vehicles = [
	"ML700_Chimera_Multilas_BP"
	];
GF_Pool_Air_Vehicles = [
	"ML700_Valk_Multilas_BLOOD"
	];

GF_Pool_Static_Weapons = [
	];
