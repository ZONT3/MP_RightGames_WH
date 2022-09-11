params ["_obj", "_access", "_fn_restriction", "_fn_allowance", ["_allowServer", false], ["_allowClient", true]];

if (!hasInterface and !isServer) exitWith {};
if (isServer and !hasInterface and !_allowServer) exitWith {};
if (hasInterface and !_allowClient) exitWith {};

if (isNil "_obj" or {isNull _obj}) exitWith {};
if (typeName _access != typeName []) exitWith {};
if (count _access > 0 and {typeName (_access select 0) != typeName []}) then {
	_access = [_access];
};

if ((isNil "_fn_restriction") and (isNil "_fn_allowance")) then {
	_fn_restriction = {
		_this lockInventory true;
	};
};

[_obj, _access, _fn_restriction, _fn_allowance] spawn {
	params ["_obj", "_access", "_fn_restriction", "_fn_allowance"];
  	waituntil { sleep 0.1; !isNil "ZPR_roles" };
	
	private _chk = (_access call ZONT_fnc_checkRole);
	diag_log format ["[ZPR] Restriction %1 - %2", str _obj, str not _chk];

	if not _chk then {
		if (!isNil "_fn_restriction") then {
			_obj call _fn_restriction;
		}
	} else {
		if (!isNil "_fn_allowance") then {
			_obj call _fn_allowance;
		}
	};
};
