params ["_obj"];

systemChat str (_obj);

private _action = [
	"TeleportToAC",
	"Teleport To V-44 X Blackfish",
	"",
	{
		if (isNull (gunner vtol01)) then {
			_player moveInGunner vtol01;
		} else {
			if (fullCrew [vtol01, "turret"] isEqualTo []) then {
				_player moveInTurret [vtol01, [2]];
			} else {
				hintSilent "AC-VTOL is full!";
			};
		};
	},
	{true},
	{}
] call ace_interact_menu_fnc_createAction;
[_obj, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action1 = [
	"TeleportToAO",
	"Teleport To AO",
	"",
	{
		cutText ["", "BLACK", 0.1];

		[{
			params ["_unit", "_target"];

			private _portTarget = _target getVariable "grandPrix_portTarget";

			playSound "jumpTPSound";
			_unit setPos ((getPosATL _portTarget) vectorAdd [(random 2) -4, (random 2) -4, 1]);
			
			cutText ["", "BLACK IN", 3];
		},[_player, _target], 0.3] call CBA_fnc_waitAndExecute;
	},
	{true},
	{}
] call ace_interact_menu_fnc_createAction;
[_obj, 0, ["ACE_MainActions"], _action1] call ace_interact_menu_fnc_addActionToObject;
