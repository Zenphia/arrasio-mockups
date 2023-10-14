var _damagetoapply, _maxshield, _shieldlevel, nothing;
_damagetoapply = argument0
_maxshield = argument1
_shieldlevel = argument2
nothing = argument3
return min((_damagetoapply * shield_level(_maxshield, _shieldlevel)), _maxshield);
