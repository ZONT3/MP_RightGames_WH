while {true} do 
{
	{
		if (count units _x==0) then 
		{
			[_x] remoteExec ["deleteGroup"];
		};
	} forEach allGroups;
	sleep 180;
};