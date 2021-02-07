clicked = false;
_AISkillArray = [
	// 0 - 1.0, higher is better
	
	0.1, // Aiming Accuracy
	0.1, // Aiming Shake
	0.05, // Aiming Speed
	0.4, // Spot Distance
	0.6, // Spot Time
	1.0, // Courage
	0.5, // Commanding
	0.5, // General
	0.5, // Endurance - Disabled in Arma 3
	0.5 // Reload Speed
];

waitUntil {clicked};

_customInit = "this addMPeventhandler ['MPKilled', {nul = _this execVM 'scripts\enemyKilled.sqf'}]; [[this, ['Recruit', 'scripts\recruit.sqf']], 'addAction', true, true] call BIS_fnc_MP;";

nul = [200, 400, 10, 60, 5, [0.5,1,1], flagPole, _AISkillArray, 0, 2000, _customInit, 1, false] execVM "LV\ambientCombat.sqf";