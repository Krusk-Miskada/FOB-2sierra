/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Loadout Gear West
Author: Whiztler
Script version: 5.61

Game type: n/a
File: ADF_fnc_loadoutWest.sqf
****************************************************************
NOTE: Gear loads on actual players only. Does not load on AI's!!

Instructions:

This script is called by the loadoutClient.sqf script. The client
script call for a specific role that matches the name of the playable
unit. Make sure that the names of your playable units match exactly
with the names (variables) in both the client and the gear script else
the script will not execute for that specific player causing him to have
an incorrect loadout.

Make sure to check the capacity of the backpack and vest before adding
(more) items. Do not delete lines but comment them out when you do not
want it included.
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_LoadoutWest.sqf"; // Reporting. Do NOT edit/remove


/**[  FOB EQUIPEMENT RECO  ]*********************************************************************/
ADF_fnc_loadoutFow = {

	/* ID FOB */
	_dream = "76561198021431479";
	_krusk = "76561198070259658";
	_noxx = "76561197996228383";
	_marsouin = "";
	_philippe = "";
	_did = "";
	_yohann = "";
	_danys = "";
	_jack = "76561198015658351";
	_lolo = "76561198198675218";
	_romulad = "";
	_strike = "";


	// get player id
	_uid = getPlayerUID _ADF_unit;


	// define shared loadout
	ADF_FOBW_uniform = "rhs_uniform_g3_blk";
	ADF_FOBW_vest = "R3F_veste_ce300";
	ADF_FOBW_weaponHK416 = "rhs_weap_hk416d10";
	ADF_FOBW_weaponFrF2 = "R3F_FRF2";
	ADF_FOBW_weaponCDEHK416 = "rhs_weap_hk416d10_m320";
	ADF_FOBW_2weapon = "R3F_PAMAS";
	ADF_FOBW_nv = "rhsusf_ANPVS_15";

	ADF_FOBW_magHK416 = "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer";

	// random headgear
	ADF_FOBW_headgear = ["rhsusf_protech_helmet_rhino","R3F_casqueFS_noir","H_Watchcap_blk","rhsusf_opscore_bk", "rhsusf_opscore_bk_pelt"] call BIS_fnc_selectRandom;

	// add shared loadout to unit
	_ADF_unit addUniform ADF_FOBW_uniform;
	_ADF_unit addHeadgear ADF_FOBW_headgear;
	_ADF_unit addVest ADF_FOBW_vest;
	_ADF_unit addMagazine "R3F_15Rnd_9x19_PAMAS";
	_ADF_unit addWeapon ADF_FOBW_2weapon;
	_ADF_unit addHandgunItem "muzzle_snds_L";
	_ADF_unit linkItem ADF_FOBW_nv;


	// primary weapon + ammo
	if((_r != "cde") && (_r != "tp")) then
	{
		_ADF_unit addMagazine ADF_FOBW_magHK416;
		_ADF_unit addWeapon ADF_FOBW_weaponHK416;

		_ADF_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_ADF_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
		// base optic
		_ADF_unit addPrimaryWeaponItem "optic_Hamr";

		if((_uid == _dream)||(_uid == _lolo)) then
		{
			_ADF_unit addPrimaryWeaponItem "SMA_eotech552_3XDOWN";
		};

		if((_uid == _marsouin)||(_uid == _jack)) then
		{
			_ADF_unit addPrimaryWeaponItem "optic_Hamr";
		};

		// ammo
		for "_i" from 1 to 6 do {_ADF_unit addItemToVest ADF_FOBW_magHK416;};
	}
	else
	{
		if(_r == "cde") then
		{
			_ADF_unit addMagazine ADF_FOBW_magHK416;
			_ADF_unit addWeapon ADF_FOBW_weaponCDEHK416;

			_ADF_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
			_ADF_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
			// base optic
			_ADF_unit addPrimaryWeaponItem "optic_Hamr";

			if((_uid == _dream)||(_uid == _lolo)) then
			{
				_ADF_unit addPrimaryWeaponItem "SMA_eotech552_3XDOWN";
			};

			if((_uid == _marsouin)||(_uid == _jack)) then
			{
				_ADF_unit addPrimaryWeaponItem "optic_Hamr";
			};

			// ammo
			for "_i" from 1 to 6 do {_ADF_unit addItemToVest ADF_FOBW_magHK416;};
		}
		else // TP
		{
			_ADF_unit addMagazine "R3F_10Rnd_762x51_FRF2";
			_ADF_unit addWeapon ADF_FOBW_weaponFrF2;

			_ADF_unit addPrimaryWeaponItem "R3F_SILENCIEUX_FRF2";
			_ADF_unit addPrimaryWeaponItem "R3F_NF";

			// ammo
			for "_i" from 1 to 6 do {_ADF_unit addItemToVest "R3F_10Rnd_762x51_FRF2";};
		};

		// binoculars
		_ADF_unit addWeapon "Laserdesignator";
	};


	// AT
	if(_r == "at") then
	{
		_ADF_unit addBackpack "R3F_sac_moyen_CE";
		_ADF_unit addItemToBackpack "R3F_AT4CS_mag";
		_ADF_unit addWeapon "R3F_AT4CS";
		removeBackpack _ADF_unit;
	};

	// ADD TO UNIFORM
	// Personal Radios all units
	if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_PersonalRadio}; // TFAR RF7800

	if((_r == "med")||(_r == "cde")) then
	{
		if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_SWRadio}; // TFAR PRC152
	};

	// microDAGR
	if (ADF_microDAGR_all == 1) then {_ADF_unit addItemToUniform ADF_microDAGR};
	// ACE3
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToUniform "ACE_EarPlugs";
		_ADF_unit addItemToUniform "ACE_CableTie";
		_ADF_unit addItemToUniform "ACE_IR_Strobe_Item";
		_ADF_unit addItemToUniform "ACE_Flashlight_XL50";
	};

	// cTab
	if (ADF_mod_CTAB) then {_ADF_unit addItemToUniform "ItemcTabHCam"};
	// GPS
	_ADF_unit linkItem "ItemGPS";

	_ADF_unit addItemToUniform "Chemlight_green";
	_ADF_unit addItemToUniform "Chemlight_red";

	if(_r == "tp") then
	{
		_ADF_unit addItemToUniform "ACE_Kestrel4500";
		_ADF_unit addItemToUniform "ACE_RangeCard";
	};

	if((_r == "tp")||(_r == "cde")) then
	{
		// battery for laser designator
		_ADF_unit addItemToUniform "Laserbatteries";
	};

	// ADD TO VEST
	for "_i" from 1 to 2 do {_ADF_unit addItemToVest "rhs_mag_m67";};
	for "_i" from 1 to 2 do {_ADF_unit addItemToVest "SmokeShell";};
	_ADF_unit addItemToVest "SmokeShellBlue";
	_ADF_unit addItemToVest "SmokeShellGreen";
	_ADF_unit addItemToVest "SmokeShellRed";

	if (ADF_mod_ACE3) then {
		for "_i" from 1 to 10 do {
			_ADF_unit addItemToVest "ACE_fieldDressing";
			_ADF_unit addItemToVest "ACE_morphine";
		};
	};

	// ADD TO BACKPACK
	if(_r == "gv") then
	{
		_ADF_unit addBackpack "R3F_sac_petit_noir";
		for "_i" from 1 to 10 do {_ADF_unit addItemToBackpack ADF_FOBW_magHK416;};
	};


	if(_r == "cde") then
	{
		_ADF_unit addBackpack "tf_rt1523g_black";
		_ADF_unit addItemToBackpack "ACE_HuntIR_monitor";
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "ACE_HuntIR_M203";};
	};

	if(_r == "eod") then
	{
		_ADF_unit addBackpack "R3F_sac_petit_noir";
		_ADF_unit addItemToBackpack "ACE_DefusalKit";
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "ACE_Clacker";};
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
	};

	if(_r == "med") then
	{
		_ADF_unit addBackpack "R3F_sac_moyen_medic_noir";
		for "_i" from 1 to 15 do
		{
			_ADF_unit addItemToBackpack "ACE_fieldDressing";
			_ADF_unit addItemToBackpack "ACE_morphine";
			_ADF_unit addItemToBackpack "ACE_bloodIV_500";
			_ADF_unit addItemToBackpack "ACE_epinephrine";
		}
	};

	if(_r == "uav") then
	{
		_ADF_unit addBackpack "B_UAV_01_backpack_F";
		_ADF_unit linkItem "B_UavTerminal";
	};

	// finish load
	_ADF_unit selectWeapon (primaryWeapon _ADF_unit);
	//if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
	if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
	ADF_gearLoaded = true;
	_ADF_perfDiagStop = diag_tickTime;
	if (ADF_debug) then {
		_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
		_debugText = "LOADOUT - SOP units loadout applied.";
		_debugMsg = _debugText + _debugDiag;
		[_debugMsg,false] call ADF_fnc_log;
	};
};

/**[  FOB EQUIPEMENT INF CE  ]*********************************************************************/
ADF_fnc_loadoutFoc = {

	/* ID FOB */
	_dream = "76561198021431479";
	_krusk = "76561198070259658";
	_noxx = "76561197996228383";
	_marsouin = "";
	_philippe = "";
	_did = "76561197963257710";
	_yohann = "";
	_danys = "76561198272794375";
	_jack = "76561198015658351";
	_lolo = "76561198198675218";
	_romuald = "";
	_strike = "76561198064610678";


	// get player id
	_uid = getPlayerUID _ADF_unit;


	// define shared loadout
	ADF_FOBW_uniformDag = "R3F_uniform_apso_DA";
	ADF_FOBW_uniformCE = "R3F_uniform_urr";
	ADF_FOBW_vestDag = "R3F_veste_TAN";
	ADF_FOBW_vestCe = "R3F_veste_ce300";
	ADF_FOBW_weaponA = "rhs_weap_hk416d10";
	ADF_FOBW_weaponS = "R3F_FRF2";
	ADF_FOBW_weaponM = "R3F_Minimi";
	ADF_FOBW_weaponC = "rhs_weap_hk416d10_m320";
	ADF_FOBW_2weapon = "R3F_PAMAS";
	ADF_FOBW_nv = "rhsusf_ANPVS_15";
	ADF_microDAGR = "ACE_microDAGR";

	ADF_FOBW_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer";

	// random headgear
	ADF_FOBW_headgearCE = ["rhsusf_protech_helmet_rhino","R3F_casqueFS_noir","rhsusf_opscore_bk", "rhsusf_opscore_bk_pelt"] call BIS_fnc_selectRandom;

	// add shared loadout to unit CE
	_ADF_unit addUniform ADF_FOBW_uniformCE;
	_ADF_unit addHeadgear ADF_FOBW_headgearCE;
	_ADF_unit addVest ADF_FOBW_vestCe;
	ADF_sac_lourd = "R3F_sac_lourd_CE";
	ADF_sac_moyen = "R3F_sac_moyen_CE";
	ADF_sac_medic = "R3F_sac_moyen_medic_CE";
	ADF_sac_radio = "tf_rt1523g_black";


	// LUNETTES / MASQUES
	if(_uid == _dream) then
	{
		_ADF_unit addGoggles "G_Balaclava_TI_G_blk_F";
	};

	// add shared loadout to unit
	_ADF_unit addMagazine "R3F_15Rnd_9x19_PAMAS";
	_ADF_unit addWeapon ADF_FOBW_2weapon;
	_ADF_unit addHandgunItem "muzzle_snds_L";
	_ADF_unit linkItem ADF_FOBW_nv;


	// ADD TO UNIFORM
	// Personal Radios all units
	if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_SWRadio}; // TFAR PRC152

	// ACE3
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToUniform ADF_microDAGR;
		_ADF_unit addItemToUniform "ACE_EarPlugs";
		_ADF_unit addItemToUniform "ACE_CableTie";
		_ADF_unit addItemToUniform "ACE_CableTie";
		_ADF_unit addItemToUniform "ACE_IR_Strobe_Item";
		_ADF_unit addItemToUniform "ACE_Flashlight_XL50";
	};

	// cTab
	if (ADF_mod_CTAB) then {_ADF_unit addItemToUniform "ItemcTabHCam"};


	_ADF_unit addItemToUniform "Chemlight_green";
	_ADF_unit addItemToUniform "Chemlight_red";

	if(_r == "tp") then
	{
		_ADF_unit addItemToUniform "ACE_Kestrel4500";
		_ADF_unit addItemToUniform "ACE_RangeCard";
	};

	if((_r == "tp")||(_r == "cde")||(_r == "lgi"))then
	{
		// battery for laser designator
		_ADF_unit addItemToUniform "Laserbatteries";
	};

	// ADD TO VEST
	for "_i" from 1 to 4 do {_ADF_unit addItemToVest "rhs_mag_m67";};
	for "_i" from 1 to 4 do {_ADF_unit addItemToVest "SmokeShell";};
	_ADF_unit addItemToVest "SmokeShellBlue";
	_ADF_unit addItemToVest "SmokeShellGreen";
	_ADF_unit addItemToVest "SmokeShellRed";

	// ADD TO BACKPACK
	if(_r == "gv") then
	{
		_ADF_unit addBackpack ADF_sac_moyen;
		for "_i" from 1 to 15 do {_ADF_unit addItemToBackpack ADF_FOBW_mag;};
	};


	if(_r == "cde") then
	{
		_ADF_unit addBackpack ADF_sac_radio;
		_ADF_unit addItemToBackpack "ACE_HuntIR_monitor";
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "ACE_HuntIR_M203";};
	};

	if(_r == "eod") then
	{
		_ADF_unit addBackpack ADF_sac_lourd;
		_ADF_unit addItemToBackpack "ACE_DefusalKit";
		_ADF_unit addItemToBackpack "ACE_Clacker";
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
		_ADF_unit addBackpack "ToolKit";
	};

	if(_r == "min") then
	{
		_ADF_unit addBackpack ADF_sac_lourd;
	};

	if(_r == "med") then
	{
		_ADF_unit addBackpack ADF_sac_medic;
		for "_i" from 1 to 15 do
		{
			_ADF_unit addItemToBackpack "ACE_fieldDressing";
			_ADF_unit addItemToBackpack "ACE_morphine";
			_ADF_unit addItemToBackpack "ACE_bloodIV_500";
			_ADF_unit addItemToBackpack "ACE_epinephrine";
		}
	};

	if(_r == "uav") then
	{
		_ADF_unit addBackpack "B_UAV_01_backpack_F";
		_ADF_unit linkItem "B_UavTerminal";
	};

	if((_r == "at")||(_r == "aa")||(_r == "atl")||(_r == "lgi")) then
	{
		_ADF_unit addBackpack ADF_sac_lourd;
	};

	if(_r == "tp") then
	{
		_ADF_unit addBackpack ADF_sac_moyen;
	};

	// Soins pour toutes classes dans le sac
	if (ADF_mod_ACE3) then
	{
		for "_i" from 1 to 15 do
		{
			_ADF_unit addItemToBackpack "ACE_fieldDressing";
			_ADF_unit addItemToBackpack "ACE_morphine";
		};
	};

	// primary weapon + ammo
	if((_r != "cde") && (_r != "tp") && (_r != "min") && (_r != "lgi")) then
	{
		_ADF_unit addMagazine ADF_FOBW_mag;
		_ADF_unit addWeapon ADF_FOBW_weaponA;

		_ADF_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_ADF_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";

		///////////////////////////////////// OPTIC /////////////////////////////////////
		_ADF_unit addPrimaryWeaponItem "optic_Hamr";

		if((_uid == _dream)||(_uid == _lolo)) then
		{
			_ADF_unit addPrimaryWeaponItem "SMA_eotech552_3XDOWN";
		};

		if((_uid == _marsouin)||(_uid == _jack)) then
		{
			_ADF_unit addPrimaryWeaponItem "optic_AMS";
		};

		if(_uid == _strike) then
		{
			_ADF_unit addPrimaryWeaponItem "optic_ERCO_blk_F";
		};

		if(_uid == _did) then
		{
			_ADF_unit addPrimaryWeaponItem "optic_Arco_blk_F";
		};


		///////////////////////////////////// FIN OPTIC /////////////////////////////////////

		// ammo
		for "_i" from 1 to 3 do {_ADF_unit addItemToVest ADF_FOBW_mag;};
		for "_i" from 1 to 4 do {_ADF_unit addItemToBackpack ADF_FOBW_mag;};
	}
	else
	{
		if((_r == "cde")||(_r == "lgi")) then // CDE
		{
			_ADF_unit addMagazine ADF_FOBW_mag;
			_ADF_unit addWeapon ADF_FOBW_weaponC;

			_ADF_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
			_ADF_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";

			///////////////////////////////////// OPTIC /////////////////////////////////////
			_ADF_unit addPrimaryWeaponItem "optic_Hamr";

			if((_uid == _dream)||(_uid == _lolo)) then
			{
				_ADF_unit addPrimaryWeaponItem "SMA_eotech552_3XDOWN";
			};

			if((_uid == _marsouin)||(_uid == _jack)) then
			{
				_ADF_unit addPrimaryWeaponItem "optic_AMS";
			};

			if(_uid == _strike) then
			{
				_ADF_unit addPrimaryWeaponItem "optic_ERCO_blk_F";
			};

			if(_uid == _did) then
			{
				_ADF_unit addPrimaryWeaponItem "optic_Arco_blk_F";
			};



			///////////////////////////////////// FIN OPTIC /////////////////////////////////////

			// ammo
			for "_i" from 1 to 3 do {_ADF_unit addItemToVest ADF_FOBW_mag;};
			for "_i" from 1 to 3 do {_ADF_unit addItemToBackpack ADF_FOBW_mag;};

			// binoculars
			_ADF_unit addWeapon "Laserdesignator";
		};

		if(_r == "tp") then // TP
		{
			_ADF_unit addMagazine "R3F_10Rnd_762x51_FRF2";
			_ADF_unit addWeapon ADF_FOBW_weaponS;

			_ADF_unit addPrimaryWeaponItem "R3F_SILENCIEUX_FRF2";

			///////////////////////////////////// OPTIC /////////////////////////////////////
			_ADF_unit addPrimaryWeaponItem "R3F_NF";


			///////////////////////////////////// FIN OPTIC /////////////////////////////////////

			// ammo
			for "_i" from 1 to 3 do {_ADF_unit addItemToVest "R3F_10Rnd_762x51_FRF2";};
			for "_i" from 1 to 9 do {_ADF_unit addItemToBackpack "R3F_10Rnd_762x51_FRF2";};

			// binoculars
			_ADF_unit addWeapon "Laserdesignator";
		};

		if(_r == "min") then // MINIMI
		{
			_ADF_unit addMagazine "R3F_200Rnd_556x45_MINIMI";
			_ADF_unit addWeapon ADF_FOBW_weaponM;

			///////////////////////////////////// OPTIC /////////////////////////////////////
			_ADF_unit addPrimaryWeaponItem "optic_MRCO";

			if((_uid == _noxx)||(_uid == _jack)) then
			{
				_ADF_unit addPrimaryWeaponItem "optic_Hamr";
			};

			if((_uid == _strike)||(_uid == _did)) then
			{
				_ADF_unit addPrimaryWeaponItem "optic_Arco_blk_F";
			};

			if(_uid == _lolo) then
			{
				_ADF_unit addPrimaryWeaponItem "R3F_J4";
			};

			///////////////////////////////////// FIN OPTIC /////////////////////////////////////

			// ammo
			for "_i" from 1 to 4 do {_ADF_unit addItemToBackpack "R3F_200Rnd_556x45_MINIMI";};
		};
	};

	// AT
	if(_r == "at") then
	{
		_ADF_unit addItemToBackpack "R3F_AT4CS_mag";
		_ADF_unit addWeapon "R3F_AT4CS";
	};

	// AA
	if(_r == "aa") then
	{
		_ADF_unit addItemToBackpack "R3F_STINGER_mag";
		_ADF_unit addWeapon "R3F_STINGER";
	};

	// ATL
	if(_r == "atl") then
	{
		_ADF_unit addItemToBackpack "R3F_ERYX_mag";
		_ADF_unit addWeapon "R3F_ERYX";
	};

	// LGI
	if(_r == "lgi") then
	{
		for "_i" from 1 to 7 do {_ADF_unit addItemToBackpack "R3F_1Rnd_EXP_LGI";};
		_ADF_unit addWeapon "R3F_LGI_DEM";
	};


	// finish load
	_ADF_unit selectWeapon (primaryWeapon _ADF_unit);
	//if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
	if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
	ADF_gearLoaded = true;
	_ADF_perfDiagStop = diag_tickTime;
	if (ADF_debug) then {
		_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
		_debugText = "LOADOUT - SOP units loadout applied.";
		_debugMsg = _debugText + _debugDiag;
		[_debugMsg,false] call ADF_fnc_log;
	};
};

/**[  FOB EQUIPEMENT INF DAGUET  ]*********************************************************************/
ADF_fnc_loadoutFod = {


	/* ID FOB */
	_dream = "76561198021431479";
	_krusk = "76561198070259658";
	_noxx = "76561197996228383";
	_marsouin = "";
	_philippe = "";
	_did = "";
	_yohann = "";
	_danys = "";
	_jack = "76561198015658351";
	_lolo = "76561198198675218";
	_romulad = "";
	_strike = "";


	// get player id
	_uid = getPlayerUID _ADF_unit;


	// define shared loadout
	ADF_FOBW_uniformDag = "R3F_uniform_apso_DA";
	ADF_FOBW_uniformCE = "R3F_uniform_urr";
	ADF_FOBW_vestDag = "R3F_veste_TAN";
	ADF_FOBW_vestCe = "R3F_veste_ce300";
	ADF_FOBW_weaponA = "rhs_weap_hk416d10";
	ADF_FOBW_weaponS = "R3F_FRF2";
	ADF_FOBW_weaponM = "R3F_Minimi";
	ADF_FOBW_weaponC = "rhs_weap_hk416d10_m320";
	ADF_FOBW_2weapon = "R3F_PAMAS";
	ADF_FOBW_nv = "rhsusf_ANPVS_15";
	ADF_microDAGR = "ACE_microDAGR";

	ADF_FOBW_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer";

	// random headgear
	ADF_FOBW_headgearDag = ["rhsusf_lwh_helmet_marpatd_ess","R3F_casqueFS_tan","rhsusf_opscore_paint_pelt_nsw_cam", "rhsusf_opscore_ut_pelt_nsw_cam", "rhsusf_mich_bare_norotos_arc_alt_tan"] call BIS_fnc_selectRandom;

	// add shared loadout to unit DAG
	_ADF_unit addUniform ADF_FOBW_uniformDag;
	_ADF_unit addHeadgear ADF_FOBW_headgearDag;
	_ADF_unit addVest ADF_FOBW_vestDag;


	// add shared loadout to unit
	_ADF_unit addMagazine "R3F_15Rnd_9x19_PAMAS";
	_ADF_unit addWeapon ADF_FOBW_2weapon;
	_ADF_unit addHandgunItem "muzzle_snds_L";
	_ADF_unit linkItem ADF_FOBW_nv;


	// ADD TO UNIFORM
	// Personal Radios all units
	if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_SWRadio}; // TFAR PRC152

	// ACE3
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToUniform ADF_microDAGR;
		_ADF_unit addItemToUniform "ACE_EarPlugs";
		_ADF_unit addItemToUniform "ACE_CableTie";
		_ADF_unit addItemToUniform "ACE_CableTie";
		_ADF_unit addItemToUniform "ACE_IR_Strobe_Item";
		_ADF_unit addItemToUniform "ACE_Flashlight_XL50";
	};

	// cTab
	if (ADF_mod_CTAB) then {_ADF_unit addItemToUniform "ItemcTabHCam"};
	// GPS
	_ADF_unit linkItem "ItemGPS";

	_ADF_unit addItemToUniform "Chemlight_green";
	_ADF_unit addItemToUniform "Chemlight_red";

	if(_r == "tp") then
	{
		_ADF_unit addItemToUniform "ACE_Kestrel4500";
		_ADF_unit addItemToUniform "ACE_RangeCard";
	};

	if((_r == "tp")||(_r == "cde")) then
	{
		// battery for laser designator
		_ADF_unit addItemToUniform "Laserbatteries";
	};

	// ADD TO VEST
	for "_i" from 1 to 4 do {_ADF_unit addItemToVest "rhs_mag_m67";};
	for "_i" from 1 to 4 do {_ADF_unit addItemToVest "SmokeShell";};
	_ADF_unit addItemToVest "SmokeShellBlue";
	_ADF_unit addItemToVest "SmokeShellGreen";
	_ADF_unit addItemToVest "SmokeShellRed";

	// ADD TO BACKPACK
	if(_r == "gv") then
	{
		_ADF_unit addBackpack "R3F_sac_moyen_TAN";
		for "_i" from 1 to 15 do {_ADF_unit addItemToBackpack ADF_FOBW_mag;};
	};


	if(_r == "cde") then
	{
		_ADF_unit addBackpack "tf_rt1523g_sage";
		_ADF_unit addItemToBackpack "ACE_HuntIR_monitor";
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "ACE_HuntIR_M203";};
	};

	if(_r == "eod") then
	{
		_ADF_unit addBackpack "R3F_sac_lourd_TAN";
		_ADF_unit addItemToBackpack "ACE_DefusalKit";
		_ADF_unit addItemToBackpack "ACE_Clacker";
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
		_ADF_unit addBackpack "ToolKit";
	};

	if(_r == "min") then
	{
		_ADF_unit addBackpack "R3F_sac_lourd_TAN";
	};

	if(_r == "med") then
	{
		_ADF_unit addBackpack "R3F_sac_moyen_medic_TAN";
		for "_i" from 1 to 15 do
		{
			_ADF_unit addItemToBackpack "ACE_fieldDressing";
			_ADF_unit addItemToBackpack "ACE_morphine";
			_ADF_unit addItemToBackpack "ACE_bloodIV_500";
			_ADF_unit addItemToBackpack "ACE_epinephrine";
		}
	};

	if(_r == "uav") then
	{
		_ADF_unit addBackpack "B_UAV_01_backpack_F";
		_ADF_unit linkItem "B_UavTerminal";
	};

	if(_r == "at") then
	{
		_ADF_unit addBackpack "R3F_sac_lourd_TAN";
	};

	if(_r == "tp") then
	{
		_ADF_unit addBackpack "R3F_sac_moyen_TAN";
	};

	if (ADF_mod_ACE3) then
	{
		for "_i" from 1 to 15 do
		{
			_ADF_unit addItemToBackpack "ACE_fieldDressing";
			_ADF_unit addItemToBackpack "ACE_morphine";
		};
	};

	// primary weapon + ammo
	if((_r != "cde") && (_r != "tp") && (_r != "min")) then
	{
		_ADF_unit addMagazine ADF_FOBW_mag;
		_ADF_unit addWeapon ADF_FOBW_weaponA;

		_ADF_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_ADF_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
		// base optic
		_ADF_unit addPrimaryWeaponItem "optic_Hamr";

		if((_uid == _dream)||(_uid == _lolo)) then
		{
			_ADF_unit addPrimaryWeaponItem "SMA_eotech552_3XDOWN";
		};

		if((_uid == _marsouin)||(_uid == _jack)) then
		{
			_ADF_unit addPrimaryWeaponItem "optic_AMS";
		};

		// ammo
		for "_i" from 1 to 3 do {_ADF_unit addItemToVest ADF_FOBW_mag;};
		for "_i" from 1 to 4 do {_ADF_unit addItemToBackpack ADF_FOBW_mag;};
	}
	else
	{
		if(_r == "cde") then // CDE
		{
			_ADF_unit addMagazine ADF_FOBW_mag;
			_ADF_unit addWeapon ADF_FOBW_weaponC;

			_ADF_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
			_ADF_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
			// base optic
			_ADF_unit addPrimaryWeaponItem "optic_Hamr";

			if((_uid == _dream)||(_uid == _lolo)) then
			{
				_ADF_unit addPrimaryWeaponItem "SMA_eotech552_3XDOWN";
			};

			if((_uid == _marsouin)||(_uid == _jack)) then
			{
				_ADF_unit addPrimaryWeaponItem "optic_AMS";
			};

			// ammo
			for "_i" from 1 to 3 do {_ADF_unit addItemToVest ADF_FOBW_mag;};
			for "_i" from 1 to 3 do {_ADF_unit addItemToBackpack ADF_FOBW_mag;};

			// binoculars
			_ADF_unit addWeapon "Laserdesignator";
		};

		if(_r == "tp") then // TP
		{
			_ADF_unit addMagazine "R3F_10Rnd_762x51_FRF2";
			_ADF_unit addWeapon ADF_FOBW_weaponS;

			_ADF_unit addPrimaryWeaponItem "R3F_SILENCIEUX_FRF2";
			_ADF_unit addPrimaryWeaponItem "optic_AMS";

			// ammo
			for "_i" from 1 to 3 do {_ADF_unit addItemToVest "R3F_10Rnd_762x51_FRF2";};
			for "_i" from 1 to 9 do {_ADF_unit addItemToBackpack "R3F_10Rnd_762x51_FRF2";};

			// binoculars
			_ADF_unit addWeapon "Laserdesignator";
		};

		if(_r == "min") then // MINIMI
		{
			_ADF_unit addMagazine "R3F_200Rnd_556x45_MINIMI";
			_ADF_unit addWeapon ADF_FOBW_weaponM;

			_ADF_unit addPrimaryWeaponItem "optic_MRCO";

			// ammo
			for "_i" from 1 to 4 do {_ADF_unit addItemToBackpack "R3F_200Rnd_556x45_MINIMI";};
		};
	};

	// AT
	if(_r == "at") then
	{
		_ADF_unit addItemToBackpack "R3F_AT4CS_mag";
		_ADF_unit addWeapon "R3F_AT4CS";
	};


	// finish load
	_ADF_unit selectWeapon (primaryWeapon _ADF_unit);
	//if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
	if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
	ADF_gearLoaded = true;
	_ADF_perfDiagStop = diag_tickTime;
	if (ADF_debug) then {
		_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
		_debugText = "LOADOUT - SOP units loadout applied.";
		_debugMsg = _debugText + _debugDiag;
		[_debugMsg,false] call ADF_fnc_log;
	};
};
