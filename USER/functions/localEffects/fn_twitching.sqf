params ["_units"];

systemChat "test";

private _horrorUnits = [];

{	
	private _loadout = getUnitLoadout _x;
	hideObject _x;
	private _horrorUnit = (typeOf _x) createVehicleLocal (getPosATL _x);
	_horrorUnit setPos (getPosATL _x);
	_horrorUnits pushBackUnique _horrorUnit;
	_horrorunit setUnitLoadout _loadout;
	removeAllWeapons _horrorUnit;
	_horrorUnit setDir (_horrorUnit getDir player);
	_horrorUnit switchMove "RR_anim_horrorTwitchPose_1";

} forEach _units;

sleep 3;

{
	deleteVehicle _x;	
} forEach _horrorUnits;

{
	_x hideObject false;
} forEach _units;