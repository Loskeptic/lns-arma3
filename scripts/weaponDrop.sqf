if(KillCount >= WeaponDropCost)then{
    KillCount = KillCount - WeaponDropCost;
    hint "Click on the map to select a drop point.";
    openmap true;
    DropPos = [0,0,0];
    clicked = false;
    onMapSingleClick "DropPos = _pos; clicked = true; onMapSingleClick """"";

    waitUntil {clicked};
    openmap false;

    _parachute = createVehicle ["B_Parachute_02_F", [(DropPos select 0), (DropPos select 1), (DropPos select 2) + 150], [], 0, 'FLY'];
    _crate = createVehicle ["B_supplyCrate_F", position _parachute, [], 0, 'NONE'];
    _crate attachTo [_parachute, [0, 0, -1.3]];
    _crate allowdamage false;

    clearItemCargoGlobal _crate;
    clearMagazineCargoGlobal _crate;
    clearWeaponCargoGlobal _crate;
    clearBackpackCargoGlobal _crate;

    _weapon = weaponArray select (floor(random(count weaponArray))); // gets a random number between zero and weaponArray size, floor rounds random number down
	_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"); // looks at the currently selected weapon, then finds correct magazines in config to spawn with it
	_mag = _magazines select (floor(random(count _magazines))); // selects random type of mag with correct caliber
	_sight = attachmentArray select (floor(random(count attachmentArray)));
	_backpack = backpackArray select (floor(random(count backpackArray)));
	_crate addMagazineCargoGlobal [_mag, floor((random 6) + 5)]; // amount of mags to spawn, atleast 5
	_crate addWeaponCargoGlobal [_weapon,1]; // puts selected weapon in container, weapon is added after mag so the weapon will spawn with mag already loaded
	_crate addBackpackCargoGlobal [_backpack, 1];
	_crate addItemCargoGlobal [_sight, 1];

    hint "Weapon Drop Incoming!";
    systemChat str(KillCount);

	waitUntil{getPos _crate select 2 < 3};
	deleteVehicle _parachute;
	_markerName = Format["Drop%1", time];
	createMarkerLocal [_markerName, position _crate];
	_markerName setMarkerTypeLocal "hd_objective";
	_markerName setMarkerColorLocal "ColorGreen";
    _smoke = "SmokeShellGreen" createVehicle position _crate;

	sleep 300;
	deleteVehicle _crate;
	deleteMarkerLocal _markerName;
}
else{
	hint "Not enough points!";
	systemChat str(KillCount);
};