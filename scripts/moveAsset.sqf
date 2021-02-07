obj = _this select 0;
obj attachTo [player, [0, 2, 0.75]];

obj setDir 180;

_objectAttached = true;


if(count attachedObjects player > 0)then{
    player addAction ["Drop this Asset", "detach obj"];

    // Keep checking if no objects are attached until there are none attached
    while {_objectAttached} do {
        if(count attachedObjects player == 0)then{
            _objectAttached = false;
        };
    };

    removeAllActions player;
}