params ["_units"];

private _horrorUnits = [];
private _allLightPoints = [];

{	
	if ((vehicle _x) == _x) then {
		private _loadout = getUnitLoadout _x;
		hideObject _x;
		private _horrorUnit = (typeOf _x) createVehicleLocal (getPosATL _x);
		_horrorUnit setPos (getPosATL _x);
		_horrorUnits pushBackUnique _horrorUnit;
		_horrorunit setUnitLoadout _loadout;
		removeAllWeapons _horrorUnit;
		_horrorUnit unassignItem "NVGoggles";
		_horrorUnit removeItem "NVGoggles";		
		_horrorUnit setDir (_horrorUnit getDir player);
		private _lightPoint = "#lightpoint" createVehicleLocal (getPos _horrorUnit);
		_allLightPoints pushBackUnique _lightPoint;
		_lightPoint attachTo [_horrorUnit, [0,0,1.5], "vicka"];
		_lightPoint setLightColor [0.5,0.1,0];
		_lightPoint setLightBrightness 0.4;
		// _lightPoint setLightAttenuation [0.5, 4, 4, 0, 0.5, 5];
		_lightPoint setLightUseFlare true;
		_lightPoint setLightFlareSize 0.5;
		_lightpoint setLightFlareMaxDistance 3;
		_horrorUnit switchMove "RR_anim_horrorTwitchPose_1";
	};

} forEach _units;

sleep 3;

{
	deleteVehicle _x;	
} forEach _allLightPoints ;

{
	deleteVehicle _x;	
} forEach _horrorUnits;

{
	_x hideObject false;
} forEach _units;