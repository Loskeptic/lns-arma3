flagPole = getMarkerPos "centerPointMarker";

_spawnRadius = 300;
_lootType = 0;

_weaponProb = 7;
_vestProb = 6;
_backpackProb = 5;
_clothingProb = 4;
_attachmentProb = 2;
_usableProb = 0;

// Array that holds each house with radius
_houseArray = flagPole nearObjects ["house", _spawnRadius];

// Create an array of all position in each house in _houseArray
_buildingPositions = [];
{
	_currentBuilding = [_x] call BIS_fnc_buildingPositions;
	_buildingPositions append _currentBuilding;
}forEach _houseArray


while{true}do{
	{
		//_buildingPositions = [_x] call BIS_fnc_buildingPositions; // gets all the positions in building for each house in _houseArray
		{
			// Spawns loot at 1/10 spots		
			if(random 10 > lootProb)then{
				_lootType = random 10;
			
				if(_lootType >= _weaponProb)then{
					_weapon = weaponArray select (floor(random(count weaponArray))); // gets a random number between zero and weaponArray size, floor rounds random number down
					_itemBox = "Land_PlasticCase_01_small_F" createVehicle [0,0,0]; // creates weapon container
					_itemBox setPos _x; // sets container to current house pos
					_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"); // looks at the currently selected weapon, then finds correct magazines in config to spawn with it
					_mag = _magazines select (floor(random(count _magazines))); // selects random type of mag with correct caliber
					_itemBox addMagazineCargoGlobal [_mag, floor((random 4) + 1)]; // amount of mags to spawn
					_itemBox addWeaponCargoGlobal [_weapon,1]; // puts selected weapon in container, weapon is added after mag so the weapon will spawn with mag already loaded
				};
				
				if(_lootType < _weaponProb && _lootType >= _vestProb)then{
					_vest = vestArray select (floor(random(count vestArray))); // gets a random number between zero and weaponArray size, floor rounds random number down
					_itemBox = "Land_PlasticCase_01_small_F" createVehicle [0,0,0]; // creates weapon container
					_itemBox setPos _x; // sets container to current house pos
					_itemBox addItemCargoGlobal [_vest, 1]; // puts selected weapon in container
				};
				
				if(_lootType < _vestProb && _lootType >= _backpackProb)then{
					_backpack = backpackArray select (floor(random(count backpackArray))); // gets a random number between zero and weaponArray size, floor rounds random number down
					_itemBox = "Land_PlasticCase_01_small_F" createVehicle [0,0,0]; // creates weapon container
					_itemBox setPos _x; // sets container to current house pos
					_itemBox addBackpackCargoGlobal [_backpack, 1]; // puts selected weapon in container
				};
				
				if(_lootType < _backpackProb && _lootType >= _clothingProb)then{
					_clothing = clothingArray select (floor(random(count clothingArray))); // gets a random number between zero and weaponArray size, floor rounds random number down
					_itemBox = "Land_PlasticCase_01_small_F" createVehicle [0,0,0]; // creates weapon container
					_itemBox setPos _x; // sets container to current house pos
					_itemBox addItemCargoGlobal [_clothing,1]; // puts selected weapon in container
				};
				
				if(_lootType < _clothingProb && _lootType >= _attachmentProb)then{
					_attachment = attachmentArray select (floor(random(count attachmentArray))); // gets a random number between zero and weaponArray size, floor rounds random number down
					_itemBox = "Land_PlasticCase_01_small_F" createVehicle [0,0,0]; // creates weapon container
					_itemBox setPos _x; // sets container to current house pos
					_itemBox addItemCargoGlobal [_attachment,1]; // puts selected weapon in container
				};
				
				if(_lootType < _attachmentProb && _lootType >= _usableProb)then{
					_itemBox = "Land_PlasticCase_01_small_F" createVehicle [0,0,0]; // creates weapon container
					_itemBox setPos _x; // sets container to current house pos
					_usable = usableArray select (floor(random(count usableArray))); // gets a random number between zero and weaponArray size, floor rounds random number down
					_itemBox addItemCargoGlobal [_usable, floor((random 4) + 1)]; // puts selected weapon in container
					_usable = usableArray select (floor(random(count usableArray))); // gets a random number between zero and weaponArray size, floor rounds random number down
					_itemBox addItemCargoGlobal [_usable, floor((random 4) + 1)]; // puts selected weapon in container
				};
			
			
			};
		
		}forEach _buildingPositions;
	
	}forEach _houseArray;
	
	
	
	// Spawns new loot every 10 minutes
	hint "Loot Spawned!";
	sleep 570;
	hint "Loot Wipe in 30 seconds!";
	sleep 30;
	
	
	// Deletes previous loot before spawning new loot
	{
		deleteVehicle _x;
	}foreach nearestObjects [flagPole, ["Land_PlasticCase_01_small_F"], 9999];
	
};
