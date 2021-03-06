diag_log "ADF RPT: Init - executing Scr\init_client.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_typeWriter.sqf";
player createDiarySubject ["Two Sierra Log","Two Sierra Log"];
player createDiaryRecord ["Two Sierra Log",["Two Sierra Communications Log","<br/><br/><font color='#6c7169'>The Two Sierra Log is a logbook of all operational radio comms between Two Sierra and ACO<br/>The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font><br/><br/>"]];

ADF_fnc_MOTS = {player allowDamage false; MotsActive = true};
ADF_fnc_MOTS_captive = {params ["_c"]; player setCaptive _c};

waitUntil {ADF_gearLoaded}; // Wait till the unit has their gear before continuing

sleep 3; // Loadout finished > pri weapon loaded

if (!didJIP) then {
	// PC 		- MRAP_2PC
	if !(isNil "INF_RTO_1") then {if (player == INF_RTO_1) then {INF_RTO_1 assignAsDriver MRAP_2PC; INF_RTO_1 moveInDriver MRAP_2PC}};
	if !(isNil "INF_PC") then {if (player == INF_PC) then {INF_PC assignAsCargo MRAP_2PC; INF_PC moveInCargo MRAP_2PC}};

	// 2-1 SQUAD L	- MRAP_2_1_SQUAD
	if !(isNil "INF_SQL_1") then {if (player == INF_SQL_1) then {INF_SQL_1 assignAsDriver MRAP_2_1_SQUAD; INF_SQL_1 moveInDriver MRAP_2_1_SQUAD}};
	if !(isNil "INF_CLS_1") then {if (player == INF_CLS_1) then {INF_CLS_1 assignAsCargo MRAP_2_1_SQUAD; INF_CLS_1 moveInCargo MRAP_2_1_SQUAD}};
	// 2-1 ALPHA	- MRAP_2_1_ALPHA
	if !(isNil "INF_AR_1") then {if (player == INF_AR_1) then {INF_AR_1 assignAsDriver MRAP_2_1_ALPHA; INF_AR_1 moveInDriver MRAP_2_1_ALPHA}};
	if !(isNil "INF_AAR_1") then {if (player == INF_AAR_1) then {INF_AAR_1 assignAsGunner MRAP_2_1_ALPHA; INF_AAR_1 moveInGunner MRAP_2_1_ALPHA}};
	if !(isNil "INF_RAT_1") then {if (player == INF_RAT_1) then {INF_RAT_1 assignAsCargo MRAP_2_1_ALPHA; INF_RAT_1 moveInCargo MRAP_2_1_ALPHA}};
	if !(isNil "INF_FTL_1") then {if (player == INF_FTL_1) then {INF_FTL_1 assignAsCargo MRAP_2_1_ALPHA; INF_FTL_1 moveInCargo MRAP_2_1_ALPHA}};
	// 2-1 BRAVO	- MRAP_2_1_BRAVO
	if !(isNil "INF_AR_2") then {if (player == INF_AR_2) then {INF_AR_2 assignAsDriver MRAP_2_1_BRAVO; INF_AR_2 moveInDriver MRAP_2_1_BRAVO}};
	if !(isNil "INF_AAR_2") then {if (player == INF_AAR_2) then {INF_AAR_2 assignAsCargo MRAP_2_1_BRAVO; INF_AAR_2 moveInCargo MRAP_2_1_BRAVO}};
	if !(isNil "INF_RAT_2") then {if (player == INF_RAT_2) then {INF_RAT_2 assignAsCargo MRAP_2_1_BRAVO; INF_RAT_2 moveInCargo MRAP_2_1_BRAVO}};
	if !(isNil "INF_FTL_2") then {if (player == INF_FTL_2) then {INF_FTL_2 assignAsCargo MRAP_2_1_BRAVO; INF_FTL_2 moveInCargo MRAP_2_1_BRAVO}};

	// 2-2 SQUAD L	- MRAP_2_2_SQUAD
	if !(isNil "INF_SQL_2") then {if (player == INF_SQL_2) then {INF_SQL_2 assignAsDriver MRAP_2_2_SQUAD; INF_SQL_2 moveInDriver MRAP_2_2_SQUAD}};
	if !(isNil "INF_CLS_2") then {if (player == INF_CLS_2) then {INF_CLS_2 assignAsCargo MRAP_2_2_SQUAD; INF_CLS_2 moveInCargo MRAP_2_2_SQUAD}};
	// 2-2 ALPHA	- MRAP_2_2_ALPHA
	if !(isNil "INF_AR_3") then {if (player == INF_AR_3) then {INF_AR_3 assignAsDriver MRAP_2_2_ALPHA; INF_AR_3 moveInDriver MRAP_2_2_ALPHA}};
	if !(isNil "INF_AAR_3") then {if (player == INF_AAR_3) then {INF_AAR_3 assignAsGunner MRAP_2_2_ALPHA; INF_AAR_3 moveInGunner MRAP_2_2_ALPHA}};
	if !(isNil "INF_RAT_3") then {if (player == INF_RAT_3) then {INF_RAT_3 assignAsCargo MRAP_2_2_ALPHA; INF_RAT_3 moveInCargo MRAP_2_2_ALPHA}};
	if !(isNil "INF_FTL_3") then {if (player == INF_FTL_3) then {INF_FTL_3 assignAsCargo MRAP_2_2_ALPHA; INF_FTL_3 moveInCargo MRAP_2_2_ALPHA}};
	// 2-2 BRAVO	- MRAP_2_2_BRAVO
	if !(isNil "INF_AR_4") then {if (player == INF_AR_4) then {INF_AR_4 assignAsDriver MRAP_2_2_BRAVO; INF_AR_4 moveInDriver MRAP_2_2_BRAVO}};
	if !(isNil "INF_AAR_4") then {if (player == INF_AAR_4) then {INF_AAR_4 assignAsCargo MRAP_2_2_BRAVO; INF_AAR_4 moveInCargo MRAP_2_2_BRAVO}};
	if !(isNil "INF_RAT_4") then {if (player == INF_RAT_4) then {INF_RAT_4 assignAsCargo MRAP_2_2_BRAVO; INF_RAT_4 moveInCargo MRAP_2_2_BRAVO}};
	if !(isNil "INF_FTL_4") then {if (player == INF_FTL_4) then {INF_FTL_4 assignAsCargo MRAP_2_2_BRAVO; INF_FTL_4 moveInCargo MRAP_2_2_BRAVO}};

	// 2-3 ALPHA	- MRAP_2_3_WT1
	if !(isNil "INF_AMG_1") then {if (player == INF_AMG_1) then {INF_AMG_1 assignAsDriver MRAP_2_3_WT1; INF_AMG_1 moveInDriver MRAP_2_3_WT1}};
	if !(isNil "INF_MG_1") then {if (player == INF_MG_1) then {INF_MG_1 assignAsGunner MRAP_2_3_WT1; INF_MG_1 moveInGunner MRAP_2_3_WT1}};
	if !(isNil "INF_WTL_1") then {if (player == INF_WTL_1) then {INF_WTL_1 assignAsCargo MRAP_2_3_WT1; INF_WTL_1 moveInCargo MRAP_2_3_WT1}};
	if !(isNil "INF_CLS_3") then {if (player == INF_CLS_3) then {INF_CLS_3 assignAsCargo MRAP_2_3_WT1; INF_CLS_3 moveInCargo MRAP_2_3_WT1}};
	// 2-3 ALPHA	- MRAP_2_3_WT2
	if !(isNil "INF_AMS_1") then {if (player == INF_AMS_1) then {INF_AMS_1 assignAsDriver MRAP_2_3_WT2; INF_AMS_1 moveInDriver MRAP_2_3_WT2}};
	if !(isNil "INF_MS_1") then {if (player == INF_MS_1) then {INF_MS_1 assignAsGunner MRAP_2_3_WT2; INF_MS_1 moveInGunner MRAP_2_3_WT2}};
	if !(isNil "INF_HMG_1") then {if (player == INF_HMG_1) then {INF_HMG_1 assignAsCargo MRAP_2_3_WT2; INF_HMG_1 moveInCargo MRAP_2_3_WT2}};
	if !(isNil "INF_AHMG_1") then {if (player == INF_AHMG_1) then {INF_AHMG_1 assignAsCargo MRAP_2_3_WT2; INF_AHMG_1 moveInCargo MRAP_2_3_WT2}};
};

waitUntil {sleep 2; ADF_missionInit}; sleep 5;

if (!didJIP) then {
	[
		["02 SEP 2019","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		["UNITED SAHRANI","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"],
		["OP CRIMSHAW, EVERON","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]
	] spawn ADF_fnc_typeWriter;

	["2S","","VADER this is TWO SIERRA at LIMA. We are OSCAR MIKE. Over."] call ADF_fnc_MessageParser; sleep 8;
	["ACO","ACO","TWO SIERRA this is VADER. Solid copy. 3RD PLT is commencing the distraction op in 20 mikes. Over."] call ADF_fnc_MessageParser; sleep 11;
	["2S","","VADER this is TWO SIERRA. Roger. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_intel = {
	["2S","","VADER this is TWO SIERRA. Message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["ACO","ACO","TWO SIERRA this is VADER. Send traffic. Over."] call ADF_fnc_MessageParser; sleep 8;
	["2S","","VADER this is TWO SIERRA. We're at the main research building at PASTEUR. No intel, no research material. Over."] call ADF_fnc_MessageParser; sleep 14;
	["ACO","ACO","TWO SIERRA this is VADER. Roger. Wait. Over."] call ADF_fnc_MessageParser; sleep 25;
	["ACO","ACO","TWO SIERRA this is VADER. Continue clearing PASTEUR and search for intel or research material. Over"] call ADF_fnc_MessageParser; sleep 14;
	["2S","","VADER this is TWO SIERRA. Wilco. Out."] call ADF_fnc_MessageParser; 
};

ADF_AO_evac = {
	sleep 5;
	["2S","","VADER this is TWO SIERRA. Stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 7;
	["ACO","ACO","TWO SIERRA this is VADER. Send. Over."] call ADF_fnc_MessageParser; sleep 8;
	["2S","","VADER this is TWO SIERRA. We're closing in on PASTEUR. Break. Three helicopters and five trucks departed PASTEUR heading for Paraiso. Over."] call ADF_fnc_MessageParser; sleep 17;
	["ACO","ACO","TWO SIERRA this is VADER. Roger. MOTHER thinks they are evacing strategic assets. Break. Secure and search pasteur for intel asap. How copy?"] call ADF_fnc_MessageParser; sleep 25;
	["2S","","VADER this is TWO SIERRA. Solid copy. Out."] call ADF_fnc_MessageParser; sleep 7;
};

ADF_msg_distraction = {
	["ACO","ACO","TWO SIERRA this is VADER. Message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["2S","","VADER this is TWO SIERRA. Send. Over."] call ADF_fnc_MessageParser; sleep 9;
	["ACO","ACO","TWO SIERRA this is VADER. 3RD PLT in effect in 2 mikes. Over."] call ADF_fnc_MessageParser; sleep 11;
	["2S","","VADER this is TWO SIERRA. Roger. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_pasteurClear	= {
	params ["_t"];
	if (_t) then {
		["ACO","ACO","TWO SIERRA this is VADER. Message. Over."] call ADF_fnc_MessageParser; sleep 7;
		["2S","","VADER this is TWO SIERRA. Send. Over."] call ADF_fnc_MessageParser; sleep 9;
		["ACO","ACO","TWO SIERRA this is VADER. We are pulling you out. Break. ACE reported an armored squadron heading your way. ETA four mikes. RTB. How copy?"] call ADF_fnc_MessageParser; sleep 17;
	} else {
		["2S","","VADER this is TWO SIERRA. Message over."] call ADF_fnc_MessageParser; sleep 11;
		["ACO","ACO","TWO SIERRA this is VADER. Send traffic. Over."] call ADF_fnc_MessageParser; sleep 7;
		["2S","","VADER this is TWO SIERRA. PASTEUR is clear. No intel, No reasearch material. How copy?"] call ADF_fnc_MessageParser; sleep 14;
		["ACO","ACO","TWO SIERRA this is VADER. Stand by. Over."] call ADF_fnc_MessageParser; sleep 19;
		["ACO","ACO","TWO SIERRA this is VADER. ACE is tracking an armored squadron heading your way. ETA four mikes. RTB. How copy?"] call ADF_fnc_MessageParser; sleep 17;
	};
	["2S","","TWO SIERRA this is VADER. Solid copy. TWO SIERRA is OSCAR MIKE to LIMA. Over."] call ADF_fnc_MessageParser; sleep 9;
	["ACO","ACO","TWO SIERRA this is VADER. Roger. SPG will deal the the Tigers. RTB now! Out."] call ADF_fnc_MessageParser;	
};

ADF_msg_endMission = {			
	sleep 25;
	["ACO","ACO","Capt. James O'Conner:. Welcome back TWO SIERRA<br/><br/>It seems we have taken PASTEUR by surprice. It is unfortunate CSAT was able to evac the research assets.<br/><br/>MOTHER wants you back at BRONSON. Tomorrow morning we start our assault on Paraiso.<br/><br/>Get some rest and chow. See you in a few hours for brieding."] call ADF_fnc_MessageParser;
	sleep 20;
	_l = ["tLayer"] call BIS_fnc_rscLayer; 
	_l cutText ["", "BLACK", 20];
	["<img size= '10' shadow='false' image='Img\intro_TwoSierra.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 11 | Warlord</t>",0,0,9,8] spawn BIS_fnc_dynamicText;		
	['END1',true,22] call BIS_fnc_endMission;
};

[] spawn {
	waitUntil {sleep 30; time > 7200}; // 30 mins left
	["ACO","ACO","TWO SIERRA this is VADER. Message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["2S","","VADER this is TWO SIERRA. Send. Over."] call ADF_fnc_MessageParser; sleep 8;
	["ACO","ACO","TWO SIERRA this is VADER. You have 30 mikes left before MOTHER pulls you out. Break. After that it is RTB and mission aborted. Over."] call ADF_fnc_MessageParser; sleep 16;
	["2S","","VADER this is TWO SIERRA. Roger. Out."] call ADF_fnc_MessageParser; 
};

	