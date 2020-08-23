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

			[
				80, // ["_maxDist", 80, [0]],
				20, // ["_minDist", 10, [0]],
				10, // ["_amount", 15, [0]],
				0.3, // ["_dropTimer", 0.15, [0]],
				15, // ["_maxSize", 7, [0]],
				5, // ["_minSize", 3, [0]],
				5, // ["_height", -0.3, [0]],
				0.07, // ["_transparency", 0.3, [0]],
				[1,0.5,0.5], // ["_color", [1,1,1], [[]], 3],
				nil, // ["_spawn", 15, [0]],
				nil, // ["_maxLifetime", 15, [0]],
				nil, // ["_minLifetime", 8, [0]],
				false, // ["_windAffected", true, [false]],
				0, // ["_windstrength", 1, [0]],
				nil, // ["_windForward", 0, [0]],
				nil, // ["_windRight", 0, [0]],
				nil // ["_windUp", 0, [0]],
				// {!([vehicle ace_player] call ace_common_fnc_isInBuilding)} // ["_cond", {true}, [{}]]
			] call grad_user_fnc_diwakoFog;
		};
	};
	case (_started && {!_finished} && {_unit getVariable ["GRAD_USER_cbrnStageGotCase", false]}) : {
		if !(isNil "diwako_ambientFogglets") then {
			diwako_ambientFogglets = false;
		};
	};
};