params ["_units"];

private _horrorUnits = [];
private _allLightCones = [];
player setVariable ["showAnimation", false];
/*
cutText["", "WHITE OUT", 0.05];
*/
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
		_horrorUnit switchMove "RR_anim_horrorTwitchPose_1";		
		// [{
		// 	params ["_allLightCones", "_horrorUnit"];
		// 	private _lightCone = "Reflector_Cone_01_narrow_orange_F" createVehicleLocal (getPos _horrorUnit);
		// 	_allLightCones pushBackUnique _lightCone;
		// 	_lightCone setPosASl (eyePos _horrorUnit);
		// 	_lightCone setDir (getDir _horrorUnit);
		// 	[_lightCone, -55, 0] call BIS_fnc_setPitchBank;
		// }, [_allLightCones, _horrorUnit], 0.35] call CBA_fnc_waitAndExecute;
		private _lightPoint = "#lightpoint" createVehicleLocal (getPos _horrorUnit);
		_allLightCones pushBackUnique _lightPoint;
		_lightPoint attachTo [_horrorUnit, [0,0,1.5], "vicka"];
		_lightPoint setLightColor [0.5,0.1,0];
		_lightPoint setLightBrightness 0.3;
		// _lightPoint setLightAttenuation [0.5, 4, 4, 0, 0.5, 5];
		_lightPoint setLightUseFlare true;
		_lightPoint setLightFlareSize 1;
		_lightpoint setLightFlareMaxDistance 2;
	};

} forEach _units;
/*
cutText["", "WHITE IN", 0.05];
*/
sleep 3;
/*
cutText["", "WHITE IN", 0.1];	
*/
{
	deleteVehicle _x;	
} forEach (_allLightCones + _horrorUnits) ;

{
	_x hideObject false;
} forEach _units;