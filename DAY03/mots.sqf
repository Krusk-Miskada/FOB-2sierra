// Mission Objective Test Script
// DAY 3

diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) started";

private "_a";
if (!isMultiplayer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) only works on a dedicated server environment!</t><br/><br/>"};
if (!isServer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) needs to be executed by the server!</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>Click the </t><t color='#43c3ff' align='left' size='1'>SERVER EXEC </t><t color='#FFFFFF' align='left' size='.9'>button in the debug window. Do NOT use LOCAL EXEC or GLOBAL EXEC!</t><br/><br/>"};
if (MotsActive) exitWith {"MOTS has already been executed!" remoteExec ["hint", -2];};
MotsActive = true;
_a = allPlayers - entities "HeadlessClient_F";
remoteExec ["ADF_fnc_MOTS",_a,true];

"Mission Objective Test Script started. JIP is not supported!" remoteExec ["systemChat", -2]; sleep 2;

if !(ADF_missionInit) then {"Waiting for mission init to finish..." remoteExec ["systemChat", -2];};
waitUntil {ADF_missionInit};

if (!ADF_init_AO) then {
	waitUntil {
		"Waiting for the AO to finish initializing..." remoteExec ["systemChat", -2]; uiSleep 5;
		ADF_init_AO
	};	
	"Done initializing the AO." remoteExec ["systemChat", -2]; uiSleep 2;
};

"Starting MOTS process. Make sure you are NOT in a vehicle!" remoteExec ["systemChat", -2]; uiSleep 5;
"Teleporting to DOLPHIN in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;

{_x setCaptive false; _x setPos (getMarkerPos "mDolphin")} forEach ADF_mots_uArray; uiSleep 2;
"Init DOLPHIN mission process" remoteExec ["systemChat", -2]; uiSleep 25;

"Neutralizing Pashtun forces" remoteExec ["systemChat", -2]; 
execVM "Core\ADF_simpleStats.sqf"; uiSleep 3;
_cntQ2 = nearestObjects [getMarkerPos "mDolphin", ["MAN"], 5000];
{if ((side _x == INDEPENDENT) && (alive _x) && (_X in _cntQ2)) then {deleteVehicle _x}} forEach allUnits;
"Pashtun neutralized" remoteExec ["systemChat", -2];  uiSleep 3;
"Init End Mission mission process" remoteExec ["systemChat", -2];  uiSleep 25;
"Teleporting back to LMAB in 5 seconds" remoteExec ["systemChat", -2];  uiSleep 5;
{_x setPos (getMarkerPos "mMOTS_end")} forEach ADF_mots_uArray; uiSleep 2;

"Mission Objective Test Script completed" remoteExec ["systemChat", -2];

diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) finished";