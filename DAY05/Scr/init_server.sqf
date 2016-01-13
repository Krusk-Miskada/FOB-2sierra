diag_log "ADF RPT: Init - executing init_server.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_uosition.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_createIED.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_objectMarker.sqf";
call compile preprocessFileLineNumbers "scr\ADF_redress_NRF.sqf";
call compile preprocessFileLineNumbers "Scr\ADF_redress_Rebels.sqf";
call compile preprocessFileLineNumbers "Scr\ADF_redress_Russians.sqf";
call compile preprocessFileLineNumbers "Scr\ADF_redress_Cherno.sqf";

// Load vehicle Supplies
[MRAP_2PC] execVM "Core\C\ADF_vCargo_B_Car.sqf";
{[_x] execVM "Core\C\ADF_vCargo_B_CarSQD.sqf"} forEach [MRAP_2_1_SQUAD, MRAP_2_2_SQUAD];
{[_x] execVM "Core\C\ADF_vCargo_B_CarIFT.sqf"} forEach [MRAP_2_1_ALPHA, MRAP_2_1_BRAVO, MRAP_2_2_ALPHA, MRAP_2_2_BRAVO];
{[_x] execVM "Core\C\ADF_vCargo_B_CarIWT.sqf"} forEach [MRAP_2_3_WT1, MRAP_2_3_WT2];
{[_x] execVM "Core\C\ADF_vCargo_B_TruckMedi.sqf"} forEach [MEDITRUCK_XO, MedFacil];

///// NRF FARGO

// Foot patrols	
NRF_grp_1 = [getPos oGunshipPad_1, west, (configFile >> "CfgGroups" >> "west" >> "BLU_F" >> "Infantry" >> "BUS_InfSentry")] call BIS_fnc_spawnGroup;
NRF_grp_1 setGroupIdGlobal ["5-1 ALPHA"];

NRF_grp_2 = [getPos oAirbusPad_1, west, (configFile >> "CfgGroups" >> "west" >> "BLU_F" >> "Infantry" >> "BUS_InfSentry")] call BIS_fnc_spawnGroup;
NRF_grp_2 setGroupIdGlobal ["5-1 BRAVO"];

// Static Defences & Ambient Vehicles
private "_u";
NRF_grp_3 = createGroup west; 
_u = NRF_grp_3 createUnit ["B_Soldier_F", getPos b_net, [], 0, "SERGEANT"]; _u moveInGunner oStat_01;
_u = NRF_grp_3 createUnit ["B_Soldier_F", getPos b_net, [], 0, "CORPORAL"]; _u moveInGunner oStat_02;
_u = NRF_grp_3 createUnit ["B_Soldier_F", getPos b_net, [], 0, "PRIVATE"]; _u moveInGunner oStat_03;
_u = NRF_grp_3 createUnit ["B_Soldier_F", getPos b_net, [], 0, "PRIVATE"]; _u moveInGunner oStat_08;
NRF_grp_3 setGroupIdGlobal ["5-1 CHARLIE"];

{_x enableSimulationGlobal false} forEach units NRF_grp_3;
{{[_x] call ADF_fnc_redressNRF;} forEach units _x} forEach [NRF_grp_1,NRF_grp_2,NRF_grp_3];

{[_x, position leader _x, 150, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;} forEach [NRF_grp_1,NRF_grp_2];

sleep .5;
{{_x setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"];} forEach units _x} forEach [NRF_grp_1,NRF_grp_2,NRF_grp_3];

// Create random IED's
private ["_a", "_i"];
_a = ["mIED_1", "mIED_2", "mIED_3", "mIED_4", "mIED_5", "mIED_6", "mIED_7", "mIED_8", "mIED_9", "mIED_10", "mIED_11", "mIED_12", "mIED_13", "mIED_14", "mIED_15", "mIED_16", "mIED_17", "mIED_18", "mIED_19"];
for "_i" from 1 to 10 do {
	private "_p";
	_p = _a call BIS_fnc_selectRandom;
	_a = _a - [_p];
	[_p, 100, 250, 4.5] call ADF_fnc_createRandomIEDs;
};

// Cache CAF CP's
indep_cp1 = [CP_1a, CP_1b, CP_1c, CP_1d]; {_x enableSimulationGlobal false; _x hideObjectGlobal true;} forEach indep_cp1;
indep_cp2 = [CP_2a, CP_2b, CP_2c, CP_2d]; {_x enableSimulationGlobal false; _x hideObjectGlobal true;} forEach indep_cp2;
indep_cp3 = [CP_3a, CP_3b, CP_3c, CP_3d]; {_x enableSimulationGlobal false; _x hideObjectGlobal true;} forEach indep_cp3;
indep_cp4 = [CP_4a, CP_4b, CP_4c, CP_4d]; {_x enableSimulationGlobal false; _x hideObjectGlobal true;} forEach indep_cp4;

// Medical vehicles EVEREST
vObj1 addEventHandler ["killed", {[1] remoteExec ["ADF_fnc_Everest", 0, true]}];
vObj2 addEventHandler ["killed", {[2] remoteExec ["ADF_fnc_Everest", 0, true]}];
[vObj1] execVM "Core\C\ADF_vCargo_B_TruckMedi.sqf"; vObj1 addItemCargoGlobal ["FirstAidKit",300]; vObj1 addItemCargoGlobal ["Medikit",45];
[vObj2] execVM "Core\C\ADF_vCargo_B_TruckMedi.sqf"; vObj2 addItemCargoGlobal ["FirstAidKit",300]; vObj2 addItemCargoGlobal ["Medikit",45];

ADF_fnc_Everest = {
	params ["_o"];
	diag_log	"-----------------------------------------------------";
	diag_log format ["TWO SIERRA: Everest%1 destroyed", _o];
	diag_log	"-----------------------------------------------------";	
};

#include "init_AO.sqf"