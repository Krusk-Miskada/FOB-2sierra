/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / JANUARY 2016

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car Infantry Fire Team
Author: Whiztler
Script version: 2.0

Game type: n/a
File: ADF_vCargo_B_CarIFT.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_CarIFT.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo.
****************************************************************/

// Init
if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
params ["_v"];

// VIDAGE
clearWeaponCargoGlobal _v;
clearBackpackCargoGlobal _v;
clearMagazineCargoGlobal _v;
clearItemCargoGlobal _v;

// Primary weapon
_v addWeaponCargoGlobal ["rhs_weap_hk416d10", 2]; // R
_v addWeaponCargoGlobal ["rhs_weap_hk416d10_m320", 2]; // GL

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_v addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer", 20]; // HK416
	_v addMagazineCargoGlobal ["R3F_10Rnd_762x51_FRF2", 10]; // FRF2
	_v addMagazineCargoGlobal ["R3F_200Rnd_556x45_MINIMI", 10]; // MINIMI
} else {
	_v addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 15]
};

// Launchers + LGI
_v addweaponCargoGlobal ["R3F_AT4CS", 1]; // AT4
_v addweaponCargoGlobal ["R3F_ERYX", 1]; // ERYX
_v addweaponCargoGlobal ["R3F_STINGER", 1]; // STINGER
_v addweaponCargoGlobal ["R3F_LGI_DEM", 1]; // LGI


// Rockets/Missiles
_v addMagazineCargoGlobal ["R3F_AT4CS_mag", 5]; // AT4
_v addMagazineCargoGlobal ["R3F_ERYX_mag", 5]; // ERYX
_v addMagazineCargoGlobal ["R3F_STINGER_mag", 5]; // STINGER
_v addMagazineCargoGlobal ["R3F_1Rnd_EXP_LGI", 20]; // LGI

// Demo/Explosives
_v addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 4];
if (ADF_mod_ACE3) then {
	_v addItemCargoGlobal ["ACE_Clacker", 1];
	_v addItemCargoGlobal ["ACE_DefusalKit", 1];
	_v addItemCargoGlobal ["ACE_wirecutter", 1];
	_v addItemCargoGlobal ["ACE_VMH3", 1];
};

// Weapon mountings
if (ADF_mod_ACE3) then {
	_v addItemCargoGlobal ["SMA_eotech552_3XDOWN", 4]; // EOTECH
	_v addItemCargoGlobal ["optic_Hamr", 4]; // RCO
	_v addItemCargoGlobal ["optic_AMS", 4]; // AMS
	_v addItemCargoGlobal ["optic_MRCO", 4]; // MRCO
	_v addItemCargoGlobal ["rhsusf_acc_nt4_black", 4]; // SILENCIEUX
	_v addItemCargoGlobal ["rhsusf_acc_anpeq15_bk", 4]; // LASER
	_v addItemCargoGlobal ["R3F_NF", 2]; // TP NIGHTFORCE x15
} else {
	_v addItemCargoGlobal ["acc_pointer_IR", 2];
	_v addItemCargoGlobal ["optic_ACO", 1];
	_v addItemCargoGlobal ["acc_flashlight", 2];
};

// GL Ammo
_v addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 10];
if (ADF_mod_ACE3) then {
	_v addItemCargoGlobal ["ACE_HuntIR_M203", 2];
};

// Grenades
_v addMagazineCargoGlobal ["HandGrenade", 10];
_v addMagazineCargoGlobal ["SmokeShell", 10];
_v addMagazineCargoGlobal ["SmokeShellGreen", 5];
_v addMagazineCargoGlobal ["SmokeShellRed", 5];
_v addMagazineCargoGlobal ["SmokeShellBlue", 5];

// ACRE / TFAR and cTAB
if (ADF_mod_TFAR) then {
	_v addItemCargoGlobal ["tf_anprc152", 1];
};

// ACE3 Specific
if (ADF_mod_ACE3) then {_v addItemCargoGlobal ["ACE_EarPlugs", 4]};
if (ADF_mod_ACE3) then {_v addItemCargoGlobal ["ace_mapTools", 1]};
if (ADF_mod_ACE3) then {_v addItemCargoGlobal ["ACE_CableTie", 10]};

// Medical Items
if (ADF_mod_ACE3) then {
	_v addItemCargoGlobal ["ACE_fieldDressing", 40];
	_v addItemCargoGlobal ["ACE_morphine", 40];
	_v addItemCargoGlobal ["ACE_epinephrine", 10];
	_v addItemCargoGlobal ["ACE_bloodIV", 5];
	_v addItemCargoGlobal ["ACE_bloodIV_500", 10];
	_v addItemCargoGlobal ["ACE_bloodIV_250", 20];
} else {
	_v addItemCargoGlobal ["FirstAidKit", 15];
	_v addItemCargoGlobal ["Medikit", 1];
};

if (ADF_mod_ACE3) then {
	_v addItemCargoGlobal ["ACE_UAVBattery", 1];
	_v addItemCargoGlobal ["ACE_TacticalLadder_Pack", 1];
};

// Misc items
_v addItemCargoGlobal ["ToolKit", 1];
