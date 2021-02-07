if(KillCount >= SupplyDropCost)then{
    KillCount = KillCount - SupplyDropCost;
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

    _crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", (random 8) + 3];
    _crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", (random 8) + 3];
    _crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_green", (random 8) + 3];
    _crate addBackpackCargoGlobal ["B_AssaultPack_blk", 1];

    hint "Supply Drop Incoming!";
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

