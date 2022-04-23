//init.sqf:   [] execvm "medic.sqf";
medic_adv_equipment = ["ACE_Kestrel4500"];
medic_equipment = ["ACE_Kestrel4500"];

   
Private ["_name","_hudmedic","_ui"];   
	   
disableSerialization;
  while {true} do  {
   	 1005 cutRsc ["HudMedic","PLAIN"];
   	 _ui = uiNameSpace getVariable "HudMedic";
 	   _HudMedic = _ui displayCtrl 66666;

    
 
	   //player getVariable ['ACE_medical_heartrate', 0]
    if(alive player && ((Items player find "ACE_Kestrel4500")> -1 )) then
    {
        _name = "";
        _name = format ["<t size='1.25' color='#FFCC00' shadow='1'>%1</t><br/>", " Статус бойцов"];
        {
          _hr1 = _x getVariable ['ACE_medical_heartrate', 0];
          _bv1 = _x getVariable ['ACE_medical_bloodVolume', 0];
		  
		  _gv = _x getVariable ['digi_medical_enteredPoisen', 0];
		  
         // _spo2 = _x getVariable ["KAT_medical_airwayStatus", 100];

          _hr = (floor (_hr1 * 100) ) / 100;
          _bv = (floor (_bv1 * 100) ) / 100;
		 // _gv = (floor (_gv1 * 100) ) / 100;
         // _O2 = floor _spO2;

          if(_hr > 70) then {
            if(_hr > 130) then {
              _name = format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><t size='0.85' color='#FF8888' shadow='1'>%2</t><t size='0.85' color='#FFFFFF' shadow='1'> | </t><t size='0.85' color='#FF1111' shadow='1'>%3</t>  <t size='0.85' color='#FF8888' shadow='1'>%4</t><t size='0.85' color='#FFFFFF' shadow='1'> : %5</t><br/>", _name, (_hr), _bv, _gv, (name _x)]; 
            } else {
              _name = format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><t size='0.85' color='#88FF88' shadow='1'>%2</t><t size='0.85' color='#FFFFFF' shadow='1'> | </t><t size='0.85' color='#FF1111' shadow='1'>%3</t>  <t size='0.85' color='#FF8888' shadow='1'>%4</t><t size='0.85' color='#FFFFFF' shadow='1'> : %5</t><br/>", _name, (_hr), _bv, _gv, (name _x)]; 
            };
          } else {
              _name = format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><t size='0.85' color='#8888FF' shadow='1'>%2</t><t size='0.85' color='#FFFFFF' shadow='1'> | </t><t size='0.85' color='#FF1111' shadow='1'>%3</t>  <t size='0.85' color='#FF8888' shadow='1'>%4</t><t size='0.85' color='#FFFFFF' shadow='1'> : %5</t><br/>", _name, (_hr), _bv, _gv, (name _x)]; 
          };

              
        } forEach units player;

      	_HudMedic ctrlSetStructuredText parseText _name;
      	_HudMedic ctrlCommit 0;
       	
    //hint parseText format ["<t color='#00FF00'> %1 </t>", _name];
       
    	} else {
        if(alive player && ((Items player find "ACE_Kestrel4500")> -1 )) then {
          _name = "";
        _name = format ["<t size='1.25' color='#FFCC00' shadow='1'>%1</t><br/>", "Статус бойцов"];
        {
          _hr1 = _x getVariable ['ACE_medical_heartrate', 0];
          _bv1 = _x getVariable ['ACE_medical_bloodVolume', 0];

          _hr = (floor (_hr1 * 100) ) / 100;
          _bv = (floor (_bv1 * 100) ) / 100;

          if(_hr > 70) then {
            if(_hr > 130) then {
              _name = format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><t size='0.85' color='#FF8888' shadow='1'>%2</t><t size='0.85' color='#FFFFFF' shadow='1'> : %3</t><br/>", _name, (_hr), (name _x)]; 
            } else {
              _name = format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><t size='0.85' color='#88FF88' shadow='1'>%2</t><t size='0.85' color='#FFFFFF' shadow='1'> : %3</t><br/>", _name, (_hr), (name _x)]; 
            };
          } else {
              _name = format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><t size='0.85' color='#8888FF' shadow='1'>%2</t><t size='0.85' color='#FFFFFF' shadow='1'> : %3</t><br/>", _name, (_hr), (name _x)]; 
          };

              
        } forEach units player;

      	_HudMedic ctrlSetStructuredText parseText _name;
      	_HudMedic ctrlCommit 0;
        };
      };
      if ( alive player && ("ACE_DAGR" in (assignedItems player))) then {
        
          _name = "";
        _name = format ["<t size='1.25' color='#FFCC00' shadow='1'>%1</t><br/>", "MedCore HUD"];
        {
          _namePlayer = name _x;
            _hr1 = _x getVariable ['ACE_medical_heartrate', 0];
            _bv1 = _x getVariable ['ACE_medical_bloodVolume', 0];
            _spO2 = _x getVariable ["KAT_medical_airwayStatus", 100];
  
            _hr = (floor (_hr1 * 100) ) / 100;
            _bv = (floor (_bv1 * 100) ) / 100;
            _O2 = floor _spO2;
  
            if(_hr > 70) then {
              if(_hr > 130) then {
                _name = format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><t size='0.85' color='#FF8888' shadow='1'>%2</t> | <t size='0.85' color='#FF8888' shadow='1'>%4</t><t size='0.85' color='#FFFFFF' shadow='1'> : %3</t><br/>", _name, (_hr), (name _x), (_O2)]; 
              } else {
                _name = format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><t size='0.85' color='#88FF88' shadow='1'>%2</t> | <t size='0.85' color='#FF8888' shadow='1'>%4</t><t size='0.85' color='#FFFFFF' shadow='1'> : %3</t><br/>", _name, (_hr), (name _x), (_O2)]; 
              };
            } else {
                _name = format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><t size='0.85' color='#8888FF' shadow='1'>%2</t> | <t size='0.85' color='#FF8888' shadow='1'>%4</t><t size='0.85' color='#FFFFFF' shadow='1'> : %3</t><br/>", _name, (_hr), (name _x), (_O2)]; 
            };
              
        } forEach units player;

      	_HudMedic ctrlSetStructuredText parseText _name;
      	_HudMedic ctrlCommit 0;
      };
    sleep 1;
  };  
  