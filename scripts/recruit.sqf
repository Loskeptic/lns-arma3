_unit = _this select 0;
_unitSide = side _unit;
if(_unitSide == WEST)then{
    if(alive _unit)then{
        [_unit] join player; 
        removeAllActions _unit;
    };
};