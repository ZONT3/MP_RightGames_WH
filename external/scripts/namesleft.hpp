#include "common.hpp"

#define names_idc 99999

class HudNames {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 10000000000;
	name= "HudNames";
	onLoad = "uiNamespace setVariable ['HudNames', _this select 0]";
	
	class controlsBackground {
		class HudNames_1:RscStructuredText
		{
			idc = names_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = (SafeZoneX + 0.015);
			y = (SafeZoneY + 0.60);
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			font = "PuristaLight";
			shadow = 2;
			class Attributes {
				align = "left";
			};
		};

	};
};

class HudMedic {
    idd = -1;
    fadeout=0;
    fadein=0;
    duration = 10000000000;
    name= "HudMedic";
    onLoad = "uiNamespace setVariable ['HudMedic', _this select 0]";
    
    class controlsBackground {
        class HudMedic_1:RscStructuredText
        {
            idc = 66666;
            type = CT_STRUCTURED_TEXT;
            size = 0.040;
            x = (SafeZoneXAbs + SafeZoneW * 0.85);
            y = (SafeZoneY + SafeZoneH * 0.25);
            w = SafeZoneW * 0.15; h = SafeZoneH * 0.7;
            colorText[] = {1,1,1,1};
            lineSpacing = 3;
            colorBackground[] = {0,0,0,0};
            text = "";
            font = "PuristaLight";
            shadow = 2;
            class Attributes {
                align = "left";
            };
        };

    };
};

class HudWarden {
    idd = -1;
    fadeout=0;
    fadein=0;
    duration = 10000000000;
    name= "HudWarden";
    onLoad = "uiNamespace setVariable ['HudWarden', _this select 0]";
    
    class controlsBackground {
        class HudWarden_1:RscStructuredText
        {
            idc = 66667;
            type = CT_STRUCTURED_TEXT;
            size = 0.040;
            x = (SafeZoneXAbs + SafeZoneW * 0.85);
            y = (SafeZoneY + SafeZoneH * 0.25);
            w = SafeZoneW * 0.15; h = SafeZoneH * 0.7;
            colorText[] = {1,1,1,1};
            lineSpacing = 3;
            colorBackground[] = {0,0,0,0};
            text = "";
            font = "PuristaLight";
            shadow = 2;
            class Attributes {
                align = "left";
            };
        };

    };
};

class HudHunter {
    idd = -1;
    fadeout=0;
    fadein=0;
    duration = 10000000000;
    name= "HudHunter";
    onLoad = "uiNamespace setVariable ['HudHunter', _this select 0]";
    
    class controlsBackground {
        class HudHunter_1:RscStructuredText
        {
            idc = 66668;
            type = CT_STRUCTURED_TEXT;
            size = 0.040;
            x = (SafeZoneXAbs + SafeZoneW * 0.85);
            y = (SafeZoneY + SafeZoneH * 0.25);
            w = SafeZoneW * 0.15; h = SafeZoneH * 0.7;
            colorText[] = {1,1,1,1};
            lineSpacing = 3;
            colorBackground[] = {0,0,0,0};
            text = "";
            font = "PuristaLight";
            shadow = 2;
            class Attributes {
                align = "left";
            };
        };

    };
};