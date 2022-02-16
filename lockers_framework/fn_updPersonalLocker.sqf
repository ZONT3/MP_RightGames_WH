params ["_uid", "_cont"];

[MPS_BDL_lockers, "updLocker", [_cont call ZONT_fnc_getContainerGear, _uid]] call ZONT_fnc_bd_customRequest
//diag_log str (_this call ZONT_fnc_getContainerGear)
