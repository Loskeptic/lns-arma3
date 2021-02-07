if(KillCount >= MrapDropCost)then{
    KillCount = KillCount - MrapDropCost;
    hint "Click on the map to select a drop point.";
    openmap true;
    DropPos = [0,0,0];
    clicked = false;
    onMapSingleClick "DropPos = _pos; clicked = true; onMapSingleClick """"";

    waitUntil {clicked};
    openmap false;

    _parachute = createVehicle ["B_Parachute_02_F", [(DropPos select 0), (DropPos select 1), (DropPos select 2) + 150], [], 0, 'FLY'];
    _mrap = mrapArray select (floor(random(count mrapArray)));
    _veh = createVehicle [_mrap, position _parachute, [], 0, 'NONE'];
    _veh attachTo [_parachute, [0, 0, -1.3]];

    clearMagazineCargoGlobal _veh;
    clearWeaponCargoGlobal _veh;
    clearBackpackCargoGlobal _veh;
    clearItemCargoGlobal _veh;

    _counter = 0;
    while{_counter < 3}do{
        _usable = usableArray select (floor(random(count usableArray))); // gets a random number between zero and weaponArray size, floor rounds random number down
	    _veh addMagazineCargoGlobal [_usable, floor((random 4) + 1)]; // puts selected weapon in container
        _counter = _counter + 1;
    };
    _veh addItemCargoGlobal ["FirstAidKit", 5];



    hint "Mrap Drop Incoming!";
    systemChat str(KillCount);

    waitUntil{getPos _veh select 2 < 3};
    _vehPos = getPos _veh select 0;
    deleteVehicle _parachute;
    _markerName = Format["Drop%1", time];
	createMarkerLocal [_markerName, position _veh];
	_markerName setMarkerTypeLocal "hd_objective";
	_markerName setMarkerColorLocal "ColorGreen";
    _smoke = "SmokeShellGreen" createVehicle position _veh;

    waitUntil{abs (_vehPos - (getPos _veh select 0)) > 5};
    deleteMarkerLocal _markerName;
}
else{
	hint "Not enough points!";
	systemChat str(KillCount);
};