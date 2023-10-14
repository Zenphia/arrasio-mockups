var _maxshield, _shieldlevel;
_maxshield = argument0
_shieldlevel = argument1
return (1 - power(abs((clamp((_shieldlevel / _maxshield), 0, 1) - 1)), 2));
