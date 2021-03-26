if (!hasInterface) exitWith { };


removeAllActions player;

private _text = "<t color='#d40000' size='3'>Вы очнулись</t><br/><t color='#ffffff' size='1'>и не помните, что с Вами случилось!</t>";
titleText [_text, "PLAIN", 0.2, true, true];

[] spawn {
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [15];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 5;
};


[player, {
private _curators = call ZONT_fnc_retrieveCurators;
if not ((getPlayerUID _this) in _curators) exitWith { };
_this call ZONT_fnc_giveZeus;
}] remoteExec ["bis_fnc_call", 2];


[] execVM "initPlayerAfterRespawn.sqf";

/* { [_x select 0, player, _x select 1, true] spawn ZONT_fnc_addSkillAction } foreach MPC_skills_actions; */
