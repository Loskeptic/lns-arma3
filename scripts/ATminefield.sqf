if(KillCount >= MinefieldCost)then{
    KillCount = KillCount - MinefieldCost;
    hint "Click on the map to select a deploy point.";
    openmap true;
    DropPos = [0,0,0];
    clicked = false;
    onMapSingleClick "DropPos = _pos; clicked = true; onMapSingleClick """"";

    waitUntil {clicked};
    openmap false;

    _mine = createMine ["ATMine", [(DropPos select 0), (DropPos select 1), (DropPos select 2)], [], 0];

    hint "Mines Deployed!";
    systemChat str(KillCount);
}
else{
	hint "Not enough points!";
	systemChat str(KillCount);
};