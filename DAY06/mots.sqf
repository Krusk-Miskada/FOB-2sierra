// Mission Objective Test Script
// DAY 6

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

"Teleporting to the AO, just for scenery" remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getMarkerPos "mGuerPaxPatrol_2")} forEach ADF_mots_uArray; uiSleep 2;

"Detonating 1st random cache" remoteExec ["systemChat", -2]; uiSleep 3;
cacheObj1 setDamage 1;
"Waiting for 'Cache destroyed' messages'" remoteExec ["systemChat", -2]; uiSleep 40;
"Detonating 2nd random cache" remoteExec ["systemChat", -2]; uiSleep 3;
cacheObj2 setDamage 1;
"Waiting for 'Cache destroyed' messages'" remoteExec ["systemChat", -2]; uiSleep 40;
"Detonating 3rd random cache" remoteExec ["systemChat", -2]; uiSleep 3;
cacheObj3 setDamage 1;
"Waiting for 'Cache destroyed' messages'" remoteExec ["systemChat", -2]; uiSleep 40;
"Detonating 4th random cache" remoteExec ["systemChat", -2]; uiSleep 3;
cacheObj4 setDamage 1;
"Waiting for 'Cache destroyed' messages'" remoteExec ["systemChat", -2]; uiSleep 40;
"Detonating 5th random cache" remoteExec ["systemChat", -2]; uiSleep 3;
cacheObj5 setDamage 1;
"Waiting for 'Cache destroyed' messages'" remoteExec ["systemChat", -2]; uiSleep 40;

"Teleporting back to BGOGOTA AB in 5 seconds" remoteExec ["systemChat", -2]; uiSleep 5;
{_x setCaptive false} forEach ADF_mots_uArray;
{_x setPos (getMarkerPos "mFargo")} forEach ADF_mots_uArray; uiSleep 2;

"Mission Objective Test Script completed" remoteExec ["systemChat", -2]; 

diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) finished";