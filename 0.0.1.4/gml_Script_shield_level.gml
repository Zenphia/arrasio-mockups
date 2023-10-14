var _maxshield, _shieldlevel;
_maxshield = argument0
_shieldlevel = argument1
if (!_maxshield)
    return 0;
return sqrt(clamp((_shieldlevel / _maxshield), 0, 1));
