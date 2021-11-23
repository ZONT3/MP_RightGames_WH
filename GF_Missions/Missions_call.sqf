[GF_Missions_allPlayers,["GF_Missions"],["Have a good Game ! ","GF_Missions",""], objNull,1,1,true,"whiteboard"] call BIS_fnc_taskCreate;
["GF_Missions","ASSIGNED",true] spawn BIS_fnc_taskSetState;

if (count GF_Missions_Array > 0)
    then {

_Random_Missions = floor (random count GF_Missions_Array);
_Random_Script = GF_Missions_Array select _Random_Missions;

null = [] execVM _Random_Script;

if (!GF_Repeat_Missions)  then {
GF_Missions_Array = GF_Missions_Array - [_Random_Script];

if (GF_Missions_Systemchat_info) then {
systemchat "Next mission is generating";
};

diag_log "//________________ Next GF_Missions is generating    _____________";

    };
    }else{

["GF_Missions","SUCCEEDED",true] spawn BIS_fnc_taskSetState;

if (GF_Missions_Systemchat_info) then {
systemchat "Well done! All the GF_Missions are Complete";
};

diag_log "//________________ All the GF_Missions are Complete _____________";

sleep 3;

    if (GF_Missions_saveGame) then {
    saveGame;
    };
};
