/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / JANUARY 2016

Script: Vehicle Cargo Script (BLUEFOR) - Medical Truck/Ambulance
Author: Whiztler
Script version: 2.0

Game type: n/a
File: ADF_vCargo_B_TruckMedi.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_TruckMedi.sqf";

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

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_v addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer", 10];
} else {
	_v addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 5]
};

// Grenades
_v addMagazineCargoGlobal ["SmokeShell", 20];
_v addMagazineCargoGlobal ["SmokeShellGreen", 20];
_v addMagazineCargoGlobal ["SmokeShellRed", 5];
_v addMagazineCargoGlobal ["SmokeShellBlue", 5];

// ACE3 Specific
if (ADF_mod_ACE3) then {_v addItemCargoGlobal ["ACE_EarPlugs", 5]};
if (ADF_mod_ACE3) then {_v addItemCargoGlobal ["ACE_CableTie", 5]};

// Medical Items
if (ADF_mod_ACE3) then {
	_v addItemCargoGlobal ["ACE_fieldDressing", 200];
	_v addItemCargoGlobal ["ACE_morphine", 150];
	_v addItemCargoGlobal ["ACE_epinephrine", 50];
	_v addItemCargoGlobal ["ACE_bloodIV", 50];
	_v addItemCargoGlobal ["ACE_bloodIV_500", 50];
	_v addItemCargoGlobal ["ACE_bloodIV_250", 50];
	_v addItemCargoGlobal ["ACE_bodyBag", 50];
} else {
	_v addItemCargoGlobal ["FirstAidKit", 150];
	_v addItemCargoGlobal ["Medikit", 5];
};

// Misc items
_v addItemCargoGlobal ["ToolKit", 1];
