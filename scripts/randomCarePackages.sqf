while {true} do {
    _distance = 150;
    // select a random amount of time to wait, 5-10 minutes
    _waitTime = random 300;
    sleep _waitTime;

    // spawn care package and parachute at random position
    _parachute = createVehicle [
        "B_Parachute_02_F",
        [(flagPole select 0) + ((random _distance) - _distance), (flagPole select 1) + ((random _distance) - _distance), 200],
        [],
        0,
        'FLY'
        ];
    _crate = createVehicle ["B_supplyCrate_F", position _parachute, [], 0, 'NONE'];
    // attach parachute to crate and turn of damage
    _crate attachTo [_parachute, [0, 0, -1.3]];
    _crate allowdamage false;


    // clear the crate
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

    waitUntil{getPos _crate select 2 < 3};
    deleteVehicle _parachute;
    _smoke = "SmokeShellGreen" createVehicle position _crate;

    // wait 5 minutes then delete the crate
    sleep 300;
	deleteVehicle _crate;
};