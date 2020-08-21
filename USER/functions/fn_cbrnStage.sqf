params ["_unit"];

private _started = _unit getVariable ["GRAD_USER_cbrnStageStarted", false];
private _finished = _unit getVariable ["GRAD_USER_cbrnStageFinished", false];

if (_finished) exitWith {};

/*
if () then {
	_unit setVariable ["GRAD_USER_cbrnStageGotCase", true];
};
*/

switch (true) do {
	case (!_started && {!_finished}) : {
		_unit setVariable ["GRAD_USER_cbrnStageStarted", true];
		if (isNil "diwako_ambientFogglets") then {
			diwako_ambientFogglets = true;

			[] call grad_user_fnc_diwakoFog;
		};
	};
	case (_started && {!_finished} && {_unit getVariable ["GRAD_USER_cbrnStageGotCase", false]}) : {
		if !(isNil "diwako_ambientFogglets") then {
			diwako_ambientFogglets = false;
		};
	};
};