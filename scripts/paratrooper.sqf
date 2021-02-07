/*
    Spawns a random number of paratroopers within a certain distance of the player, then waits for all troopers to die then spawns some more after a random time
*/
_spawnRate = 300; // minimum wait time before new paratrooper group spawns after last group dies
_grpSize = 7; // max size of paratrooper group
_spawnDistance = 400; // spawn distance from player


sleep ((random _spawnRate) + _spawnRate);// initial wait for first troopers
while {true} do{
    _rand = random _grpSize;
    _counter = 0;
    _grp = createGroup east;
    _trooper = player;
    while {_counter < _rand} do{
        _trooper = _grp createUnit ["O_soldier_PG_F",[(position player select 0) + ((random _spawnDistance) - (_spawnDistance / 2)), (position player select 1) + ((random _spawnDistance) - (_spawnDistance / 2)), _spawnDistance], [], 50, "FORM"]; 
        _trooper addMPeventhandler ['MPKilled', {nul = _this execVM 'scripts\enemyKilled.sqf'}];
        _counter = _counter + 1;
        sleep 3;
    };

    // stores paratrooper group in array, loops until all units in group are dead
    _array = units _grp;
    while {count _array > 0} do {
        _playerWP = _grp addWaypoint [position player, 0];
        {if(!alive _x)then{_array = _array - [_x]}}foreach _array;
        sleep 5;
    };
    sleep ((random _spawnRate) + _spawnRate); // sleeps atleast the _spawnRate, up to 2*_spawnRate
};

