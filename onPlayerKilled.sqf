
if(KillCount >= 10)then{
	KillCount = KillCount - 10;
	systemChat str(KillCount);
}
else{
	KillCount = 0;
	systemChat str(KillCount);
};

if(KillCount < 10)then{
	player setUnitTrait ["Medic", false];
};

if(KillCount < 20)then{
	player setUnitTrait ["Engineer", false];
};