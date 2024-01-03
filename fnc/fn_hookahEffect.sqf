// by Schaer#3743

sleep 2;

"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;


for "_i" from 0 to 44 do
{
    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 3;
    addCamShake [random 5, 1, random 10];
    uisleep 1;
};

"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 5;

"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
resetCamShake;
