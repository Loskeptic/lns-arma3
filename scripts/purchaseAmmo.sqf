if(KillCount >= AmmoCost)then{
    KillCount = KillCount - AmmoCost;

    _weapon = currentWeapon player;
    _magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
	_mag = _magazines select 0/*(floor(random(count _magazines)))*/;
	player addMagazine _mag;

    systemChat str(KillCount);
}
else{
    hint "Not enough points!";
    systemChat str(KillCount); 
};