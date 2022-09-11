[ // by Schaer#3743
    _this,                                            // Object the action is attached to
    "Дунуть бэбру",                                        // Title of the action
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa",    // Idle icon shown on screen
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa",    // Progress icon shown on screen
    "_this distance _target < 3",                        // Condition for the action to be shown
    "_caller distance _target < 3",                        // Condition for the action to progress
    {
        params ["_target"];
        playSound3D ["base\snd\hookah.ogg", _target, true, getPosASL _target, 5, 1, 15];
        [_target] spawn {
        params ["_target"];
        _seed = random 100;
        _particle = "SmallDestructionSmoke";
        if (_seed > 97) then { _particle = "WPCloud"};
        if (_seed > 98.5) then { _particle = "MediumDestructionFire"};
        _FX_smoke_source = "#particlesource" createVehicle (getpos _target);
        _FX_smoke_source setParticleClass _particle;
        _smokePos = [getPosASL _target # 0, getPosASL _target # 1, (getPosASL _target # 2) + 0.7 ];
        _FX_smoke_source setPosASL _smokePos;
        sleep 4;
        deleteVehicle _FX_smoke_source;};
    },    // Code executed when action starts
    {},                                                    // Code executed on every progress tick
    {
        [player] spawn fnc_HookahEffect; systemChat("Жмыхнуло знатно");
        playSound3D ["base\snd\hookah_out.ogg", player, true, getPosASL player, 5, 1, 10];
    },                // Code executed on completion
    {},                // Code executed on interrupted
    [],                                                    // Arguments passed to the scripts as _this select 3
    4,                                                    // Action duration [s]
    0,                                                    // Priority
    false,                                                // Remove on completion
    false                                                // Show in unconscious state
]
call BIS_fnc_holdActionAdd;
