["Initialize"] call BIS_fnc_dynamicGroups;

if (isServer) then {
    cbrn_zoneSimulationRange = 500;
    publicVariable "cbrn_zoneSimulationRange";
};

[getMarkerPos "marker_7", 5, 50, 150] call cbrn_fnc_createZone;
[getMarkerPos "marker_8", 2.5, 50, 140] call cbrn_fnc_createZone;
[getMarkerPos "marker_9", 2.5, 50, 140] call cbrn_fnc_createZone;