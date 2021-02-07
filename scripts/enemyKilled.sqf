/*
	Scaramorey8

	This script runs every time an enemy is killed.

	It handles the player's current perks as well as removing
	actions from dead units.
*/

_killer = _this select 1;
_unit = _this select 0;
//systemChat str(_killer);

_veh = vehicle player;
_commander = effectiveCommander _veh;

// Checks if the player killed the enemy unit
if(_killer == player || _killer == _veh)then{
	KillCount = KillCount + 1; 
	systemChat str(KillCount);
};

// if player kill count is higher than fatigueCost set in init.sqf, disable player fatigue
if(KillCount == FatigueCost)then{
	player enableFatigue false;
	hint "Indefatigable Perk Aquired!";
};

// if player kill count is higher than medicCost set in init.sqf, give the player medic perk
// Also adds medikit to persistent storage crate
if(KillCount == MedicCost)then{
	player setUnitTrait ["Medic", true];
	storageCrate addItemCargoGlobal ["Medikit", 1];
	hint "Medic Perk Aquired!";
};

// if player kill count is higher than engineercost set in init.sqf, give the player engineer perk
// Also adds toolkit to persistent storage crate
if(KillCount == EngineerCost)then{
	player setUnitTrait ["Engineer", true];
	storageCrate addItemCargoGlobal ["Toolkit", 1];
	hint "Engineer Perk Aquired!";
};

// if player kill count is lower than fatigueCost set in init.sqf, then enable player fatigue
if(KillCount < FatigueCost)then{
	player enableFatigue true;
};

// if player kill count is lower than medicCDost set in init.sqf, remove player medic perk
if(KillCount < MedicCost)then{
	player setUnitTrait ["Medic", false];
};

// if player kill count is lower than engineerCost set in init.sqf, remove player engineer perk
if(KillCount < EngineerCost)then{
	player setUnitTrait ["Engineer", false];
};

// Removes the recruit action from unit on death
removeAllActions _unit;