var UPDATE, gunplacing, _settings, _basic, _BLANK, _DUMMY, _pound, _destroy, _arty, _spread, _sniper, _rifle, _assass, _hunter, _hunter2, _mach, _blaster, _gatling, _ministream, _flank, _twin, _triple, _quint, _dual, _bent, _gunner, _power, _2reload, _morerecoil, _halfreload, _lessreload, _halfrecoil, _morespeed, _lowpower, gun, lowpowergun, booster, sidegun, powergun, smallgun, i, settings, position;
UPDATE = argument1
gunplacing = ds_list_create()
if UPDATE
{
    if (!(variable_instance_exists(id, "gunsettings")))
        gunsettings = ds_list_create()
    else
        ds_list_clear(gunsettings)
    _settings = array(1, 6, 10, 1, 1)
    _basic = array(20, 0.5, 0.1, 1, 1, 1, 1, 5, 4, 1, 1, 15, 1)
    _BLANK = array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
    _DUMMY = array(0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1)
    _pound = array(2, 3, 0.5, 1, 2, 2, 3, 0.6, 0.6, 1, 1.25, 1, 1)
    _destroy = array(2, 2, 0.5, 1, 1, 2, 1, 1, 0.6, 1, 1.1, 1, 1.5)
    _arty = array(1, 0.8, 1, 1, 1, 1, 1, 1.3, 1.3, 1, 1, 1, 1)
    _spread = array(0.78125, 0.5, 0.5, 1, 0.8, 1, 1, 1.923076923076923, 1, 1, 1, 1, 1)
    _sniper = array(1.5, 1.5, 0.25, 1, 2, 2, 2, 1.5, 2, 2, 1, 0.2, 1)
    _rifle = array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
    _assass = array(2, 3, 0.25, 1, 1, 1.5, 1, 1.25, 1.25, 1, 1, 1, 1.5)
    _hunter = array(1.25, 0.7, 1, 1, 0.7, 0.8, 1, 1.2, 1.2, 1.2, 1, 1, 0.9)
    _hunter2 = array(1, 1, 1, 0.9, 3, 0.33, 2, 1, 1, 1, 1.5, 1, 1.2)
    _mach = array(0.5, 1, 2, 1, 0.8, 0.8, 1, 1, 1, 1, 1, 2, 1)
    _blaster = array(1, 1.2, 1.25, 1.1, 1.5, 1, 0.8, 1.5, 0.25, 0.6, 0.25, 1.25, 1)
    _gatling = array(1.25, 1.2, 0.8, 1, 0.8, 1, 1.5, 1.8, 2, 1.1, 1.5, 0.5, 1.1)
    _ministream = array(1, 0.8, 1, 0.7, 0.5, 0.45, 1.5, 1.2, 0.6, 1.2, 1, 0.5, 1)
    _flank = array(1.2, 1.2, 1, 1, 1.5, 0.9, 0.8, 0.8, 1, 1, 1, 1, 1)
    _twin = array(1, 0.5, 0.9, 1, 1, 0.667, 1, 1, 1.5, 1, 1, 0.9, 1)
    _triple = array(1.5, 0.667, 0.9, 1, 1, 1, 1, 1.1, 1.1, 1, 1.1, 0.9, 1)
    _quint = array(1.5, 0.667, 0.9, 1, 1, 0.75, 1, 1.1, 1.1, 1, 1.1, 0.9, 1)
    _dual = array(1.5, 3, 0.8, 1.25, 1.5, 0.8, 1.1, 1.1, 1.3, 1, 1.25, 1, 1.25)
    _bent = array(1.25, 1.1, 1.2, 1, 1, 1, 1, 1, 1, 1, 0.8, 1, 0.9)
    _gunner = array(1.25, 1, 1.3, 1.1, 0.8, 0.7, 1, 1, 0.8, 1, 2, 1, 1)
    _power = array(1.25, 1, 0.8, 1.2, 1, 1, 1.1, 1.3, 1, 1, 1, 1, 1)
    _2reload = array(0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
    _morerecoil = array(1, 1.25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
    _halfreload = array(2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
    _lessreload = array(1.33, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
    _halfrecoil = array(1, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
    _morespeed = array(1, 1, 1, 1, 1, 1, 1, 1.3, 1.3, 1, 1, 1, 1)
    _lowpower = array(1, 1, 2, 1, 1, 0.5, 0.7, 1, 1, 1, 1, 1, 0.5)
}
switch argument0
{
    case "basic":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _BLANK))
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(19, 8, 1, 0, 0, 0, 0))
        break
    case "pounder":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _pound))
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 12, 1, 0, 0, 0, 0))
        break
    case "artillery":
        if UPDATE
        {
            gun = multiply_array(_basic, _gunner, _power)
            ds_list_add(gunsettings, gun, gun)
            ds_list_add(gunsettings, multiply_array(_basic, _pound, _arty))
            _settings = multiply_array(array(1, 0.8, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(17, 3, 1, 0, 6, -7, 0.25))
        ds_list_add(gunplacing, array(17, 3, 1, 0, -6, 7, 0.75))
        ds_list_add(gunplacing, array(19, 12, 1, 0, 0, 0, 0))
        break
    case "mortar":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _gunner, _power)
            ds_list_add(gunsettings, gun, gun, gun, gun)
            ds_list_add(gunsettings, multiply_array(_basic, _pound, _arty, _arty))
            _settings = multiply_array(array(1, 0.8, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(12, 4, 1, 0, 8, 0, 0.2))
        ds_list_add(gunplacing, array(12, 4, 1, 0, -8, 0, 0.4))
        ds_list_add(gunplacing, array(13.5, 4, 1, 0, 5.5, 0, 0.6))
        ds_list_add(gunplacing, array(13.5, 4, 1, 0, -5.5, 0, 0.8))
        ds_list_add(gunplacing, array(19, 10, 1, 0, 0, 0, 0))
        break
    case "spread":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _gunner, _power, _lowpower, _lessreload)
            ds_list_add(gunsettings, gun, gun, gun, gun, gun, gun, gun, gun, gun, gun)
            ds_list_add(gunsettings, multiply_array(_basic, _pound, _spread, _lessreload))
            _settings = multiply_array(array(1, 0.8, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(13, 3, 1, 0, -1.2, 90, 0.8333333333333334))
        ds_list_add(gunplacing, array(14, 3, 1, 0, -1.4, 70, (2/3)))
        ds_list_add(gunplacing, array(15, 3, 1, 0, -1.8, 50, 0.5))
        ds_list_add(gunplacing, array(16, 3, 1, 0, -2.3, 30, (1/3)))
        ds_list_add(gunplacing, array(17, 3, 1, 0, -3.5, 10, 0.16666666666666666))
        ds_list_add(gunplacing, array(13, 3, 1, 0, 1.2, -90, 0.8333333333333334))
        ds_list_add(gunplacing, array(14, 3, 1, 0, 1.4, -70, (2/3)))
        ds_list_add(gunplacing, array(15, 3, 1, 0, 1.8, -50, 0.5))
        ds_list_add(gunplacing, array(16, 3, 1, 0, 2.3, -30, (1/3)))
        ds_list_add(gunplacing, array(17, 3, 1, 0, 3.5, -10, 0.16666666666666666))
        ds_list_add(gunplacing, array(19, 9, 1, 0, 0, 0, 0))
        break
    case "destroy":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _pound, _destroy))
            _settings = multiply_array(array(1, 0.9, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(19, 15, 1, 0, 0, 0, 0))
        break
    case "destroygun":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _pound, _destroy))
            ds_list_add(gunsettings, multiply_array(_basic, _gunner, _power))
            ds_list_add(gunsettings, multiply_array(_basic, _gunner, _power), _DUMMY)
            _settings = multiply_array(array(1, 0.85, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(19, 15, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(16, 3, 1, 0, -4, 180, 0.25))
        ds_list_add(gunplacing, array(16, 3, 1, 0, 4, 180, 0.75))
        ds_list_add(gunplacing, array(12, 15, 1, 0, 0, 180, 0))
        break
    case "wubdub":
        if UPDATE
        {
            gun = multiply_array(_basic, _pound, _destroy, _halfreload)
            ds_list_add(gunsettings, gun, gun, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 0.75, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(16, 14, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(16, 14, 1, 0, 0, 120, 0))
        ds_list_add(gunplacing, array(16, 14, 1, 0, 0, 240, 0))
        ds_list_add(gunplacing, array(16, 14, 1, 0, 0, 60, 0.05))
        ds_list_add(gunplacing, array(16, 14, 1, 0, 0, 180, 0.05))
        ds_list_add(gunplacing, array(16, 14, 1, 0, 0, 300, 0.05))
        break
    case "anni":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _pound, _destroy, _morerecoil))
            _settings = multiply_array(array(1, 0.9, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(19.5, 19.5, 1, 0, 0, 0, 0))
        break
    case "sniper":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _sniper))
            _settings = multiply_array(array(0.5, 0.8, 1, 1, 1.1), _settings)
        }
        ds_list_add(gunplacing, array(22, 8, 1, 0, 0, 0, 0))
        break
    case "hunter":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _sniper, _hunter, _hunter2))
            ds_list_add(gunsettings, multiply_array(_basic, _sniper, _hunter))
            _settings = multiply_array(array(0.5, 0.7, 1, 1, 1.15), _settings)
        }
        ds_list_add(gunplacing, array(22, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(19.5, 11.5, 1, 0, 0, 0, 0.2))
        break
    case "preda":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _sniper, _hunter, _hunter2, _hunter2))
            ds_list_add(gunsettings, multiply_array(_basic, _sniper, _hunter, _hunter2))
            ds_list_add(gunsettings, multiply_array(_basic, _sniper, _hunter))
            _settings = multiply_array(array(0.5, 0.65, 1, 1, 1.15), _settings)
        }
        ds_list_add(gunplacing, array(22, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(19.5, 11.5, 1, 0, 0, 0, 0.2))
        ds_list_add(gunplacing, array(17, 14, 1, 0, 0, 0, 0.4))
        break
    case "assass":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _sniper, _assass), _DUMMY)
            _settings = multiply_array(array(0.35, 0.6, 1, 1, 1.25), _settings)
        }
        ds_list_add(gunplacing, array(26, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(10, 8, -1.1, 6, 0, 0, 0))
        break
    case "buttbutt":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _sniper, _assass, _halfreload))
            ds_list_add(gunsettings, multiply_array(_basic, _gunner, _power))
            ds_list_add(gunsettings, multiply_array(_basic, _gunner, _power))
            ds_list_add(gunsettings, _DUMMY, _DUMMY)
            _settings = multiply_array(array(0.35, 0.6, 1, 1, 1.25), _settings)
        }
        ds_list_add(gunplacing, array(26, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(16, 3, 1, 0, -3, 180, 0.25))
        ds_list_add(gunplacing, array(16, 3, 1, 0, 3, 180, 0.75))
        ds_list_add(gunplacing, array(12, 12, 1, 0, 0, 180, 0))
        ds_list_add(gunplacing, array(10, 8, -1.1, 6, 0, 0, 0))
        break
    case "ranger":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _sniper, _assass), _DUMMY)
            _settings = multiply_array(array(0.35, 0.6, 1, 1, 1.5), _settings)
        }
        ds_list_add(gunplacing, array(30, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(10, 8, -1.1, 6, 0, 0, 0))
        break
    case "machine":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _mach))
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1.7, 0, 0, 0, 0))
        break
    case "doublemach":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _mach))
            ds_list_add(gunsettings, multiply_array(_basic, _mach))
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1.7, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(20, 8, 1.7, 0, 0, 180, 0.5))
        break
    case "triplemach":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _mach))
            ds_list_add(gunsettings, multiply_array(_basic, _mach))
            ds_list_add(gunsettings, multiply_array(_basic, _mach))
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1.7, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(20, 8, 1.7, 0, 0, 120, 0.333))
        ds_list_add(gunplacing, array(20, 8, 1.7, 0, 0, 240, 0.667))
        break
    case "halfnhalf":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _mach, _blaster))
            ds_list_add(gunsettings, multiply_array(_basic, _mach, _gatling))
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(13, 8, 1.9, 4, 0, 0, 0))
        ds_list_add(gunplacing, array(24, 8, 1.5, 0, 0, 180, 0.5))
        break
    case "gatling":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _mach, _gatling))
            _settings = multiply_array(array(1, 1, 1, 1, 1.15), _settings)
        }
        ds_list_add(gunplacing, array(24, 8, 1.5, 0, 0, 0, 0))
        break
    case "sprayer":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _mach, _gatling))
            ds_list_add(gunsettings, multiply_array(_basic, _mach, _lowpower))
            _settings = multiply_array(array(1, 1, 1, 1, 1.15), _settings)
        }
        ds_list_add(gunplacing, array(24, 8, 1.5, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(20, 8, 1.7, -1, 0, 0, 0.5))
        break
    case "blaster":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _mach, _blaster))
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(13, 8, 1.9, 4, 0, 0, 0))
        break
    case "machblaster":
        if UPDATE
        {
            ds_list_add(gunsettings, multiply_array(_basic, _mach, _lowpower))
            ds_list_add(gunsettings, multiply_array(_basic, _mach, _blaster))
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1.7, 0, 0, 0, 0.5))
        ds_list_add(gunplacing, array(13, 8, 1.9, 3, 0, 0, 0))
        break
    case "bentblaster":
        if UPDATE
        {
            gun = multiply_array(_basic, _mach, _blaster, _bent, _halfrecoil)
            lowpowergun = multiply_array(gun, _lowpower)
            ds_list_add(gunsettings, lowpowergun, lowpowergun, gun)
            _settings = multiply_array(array(0.8, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(13, 8, 1.7, 4, -2, 15, 0.5))
        ds_list_add(gunplacing, array(13, 8, 1.7, 4, 2, -15, 0.5))
        ds_list_add(gunplacing, array(13, 8, 1.9, 6, 0, 0, 0))
        break
    case "ministream":
        if UPDATE
        {
            gun = multiply_array(_basic, _ministream)
            ds_list_add(gunsettings, gun, gun, gun)
            _settings = multiply_array(array(1, 1, 1, 1, 1.1), _settings)
        }
        ds_list_add(gunplacing, array(23, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 0, 0, 0.333))
        ds_list_add(gunplacing, array(17, 8, 1, 0, 0, 0, 0.667))
        break
    case "stream":
        if UPDATE
        {
            gun = multiply_array(_basic, _ministream, _ministream)
            ds_list_add(gunsettings, gun, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 1, 1, 1, 1.15), _settings)
        }
        ds_list_add(gunplacing, array(29, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(26, 8, 1, 0, 0, 0, 0.2))
        ds_list_add(gunplacing, array(23, 8, 1, 0, 0, 0, 0.4))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 0, 0, 0.6))
        ds_list_add(gunplacing, array(17, 8, 1, 0, 0, 0, 0.8))
        break
    case "hotshot":
        if UPDATE
        {
            gun = multiply_array(_basic, _pound, _ministream, _halfreload)
            ds_list_add(gunsettings, gun, gun, gun)
            _settings = multiply_array(array(1, 0.5, 1, 1, 1.1), _settings)
        }
        ds_list_add(gunplacing, array(24, 12, 1, 0, 0, 0, 0.667))
        ds_list_add(gunplacing, array(20, 12, 1, 0, 0, 0, 0.333))
        ds_list_add(gunplacing, array(16, 12, 1, 0, 0, 0, 0))
        break
    case "flank":
        if UPDATE
        {
            gun = multiply_array(_basic, _flank)
            ds_list_add(gunsettings, gun, gun, gun)
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(18, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(18, 8, 1, 0, 0, 120, 0))
        ds_list_add(gunplacing, array(18, 8, 1, 0, 0, 240, 0))
        break
    case "tri":
        if UPDATE
        {
            gun = multiply_array(_basic, _flank, _halfrecoil)
            booster = multiply_array(_basic, _flank, _lowpower)
            ds_list_add(gunsettings, gun, booster, booster)
            _settings = multiply_array(array(1.1, 1.1, 0.9, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(16, 8, 1, 0, 0, 145, 0))
        ds_list_add(gunplacing, array(16, 8, 1, 0, 0, 215, 0))
        break
    case "booster":
        if UPDATE
        {
            gun = multiply_array(_basic, _flank, _halfrecoil)
            booster = multiply_array(_basic, _flank, _lowpower)
            ds_list_add(gunsettings, gun, booster, booster, booster, booster)
            _settings = multiply_array(array(1.1, 1.1, 0.7, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(15, 7, 1, 0, 0, 130, 0.5))
        ds_list_add(gunplacing, array(15, 7, 1, 0, 0, 230, 0.5))
        ds_list_add(gunplacing, array(16, 8, 1, 0, 0, 145, 0))
        ds_list_add(gunplacing, array(16, 8, 1, 0, 0, 215, 0))
        break
    case "fighter":
        if UPDATE
        {
            gun = multiply_array(_basic, _flank, _halfrecoil)
            sidegun = multiply_array(_basic, _flank, _flank)
            booster = multiply_array(_basic, _flank, _lowpower)
            ds_list_add(gunsettings, gun, sidegun, sidegun, booster, booster)
            _settings = multiply_array(array(1.1, 1.1, 0.9, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(17, 7, 1, 0, 1, 90, 0))
        ds_list_add(gunplacing, array(17, 7, 1, 0, -1, 270, 0))
        ds_list_add(gunplacing, array(16, 8, 1, 0, 0, 145, 0))
        ds_list_add(gunplacing, array(16, 8, 1, 0, 0, 215, 0))
        break
    case "hexa":
        if UPDATE
        {
            gun = multiply_array(_basic, _flank, _flank)
            ds_list_add(gunsettings, gun, gun, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(18, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(18, 8, 1, 0, 0, 120, 0))
        ds_list_add(gunplacing, array(18, 8, 1, 0, 0, 240, 0))
        ds_list_add(gunplacing, array(18, 8, 1, 0, 0, 60, 0.5))
        ds_list_add(gunplacing, array(18, 8, 1, 0, 0, 180, 0.5))
        ds_list_add(gunplacing, array(18, 8, 1, 0, 0, 300, 0.5))
        break
    case "octo":
        if UPDATE
        {
            gun = multiply_array(_basic, _flank, _flank)
            ds_list_add(gunsettings, gun, gun, gun, gun, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(19, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(19, 8, 1, 0, 0, 90, 0))
        ds_list_add(gunplacing, array(19, 8, 1, 0, 0, 180, 0))
        ds_list_add(gunplacing, array(19, 8, 1, 0, 0, 270, 0))
        ds_list_add(gunplacing, array(19, 8, 1, 0, 0, 45, 0.5))
        ds_list_add(gunplacing, array(19, 8, 1, 0, 0, 135, 0.5))
        ds_list_add(gunplacing, array(19, 8, 1, 0, 0, 225, 0.5))
        ds_list_add(gunplacing, array(19, 8, 1, 0, 0, 315, 0.5))
        break
    case "duodeca":
        if UPDATE
        {
            gun = multiply_array(_basic, _flank, _flank, _flank)
            ds_list_add(gunsettings, gun, gun, gun, gun, gun, gun, gun, gun, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 120, (2/3)))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 240, (1/3)))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 60, (1/3)))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 180, 0))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 300, (2/3)))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 30, 0.16666666666666666))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 150, 0.8333333333333334))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 270, 0.5))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 90, 0.5))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 210, 0.16666666666666666))
        ds_list_add(gunplacing, array(16, 6, 1, 0, 0, 330, 0.8333333333333334))
        break
    case "twin":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin)
            ds_list_add(gunsettings, gun, gun)
            _settings = multiply_array(array(1, 1, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1, 0, 5.5, 0, 0))
        ds_list_add(gunplacing, array(20, 8, 1, 0, -5.5, 0, 0.5))
        break
    case "gunner":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _gunner)
            ds_list_add(gunsettings, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 0.7, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(14, 5, 1, 0, 7, 0, 0.5))
        ds_list_add(gunplacing, array(14, 5, 1, 0, -7, 0, 0.75))
        ds_list_add(gunplacing, array(17, 5, 1, 0, 4, 0, 0))
        ds_list_add(gunplacing, array(17, 5, 1, 0, -4, 0, 0.25))
        break
    case "heavy":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _gunner)
            powergun = multiply_array(_basic, _twin, _gunner)
            ds_list_add(gunsettings, powergun, powergun, gun, gun, powergun)
            _settings = multiply_array(array(1, 0.7, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(13, 5, 1, 0, 7, 0, 0.8))
        ds_list_add(gunplacing, array(13, 5, 1, 0, -7, 0, 0.6))
        ds_list_add(gunplacing, array(16, 5, 1, 0, 4, 0, 0.4))
        ds_list_add(gunplacing, array(16, 5, 1, 0, -4, 0, 0.2))
        ds_list_add(gunplacing, array(20, 5, 1, 0, 0, 0, 0))
        break
    case "double":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin)
            ds_list_add(gunsettings, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 0.95, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1, 0, 5.5, 0, 0))
        ds_list_add(gunplacing, array(20, 8, 1, 0, -5.5, 0, 0.5))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 5.5, 180, 0))
        ds_list_add(gunplacing, array(20, 8, 1, 0, -5.5, 180, 0.5))
        break
    case "doubledouble":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin)
            ds_list_add(gunsettings, gun, gun, gun, gun, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 0.9, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1, 0, 5.5, 0, 0))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 5.5, 180, 0))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 5.5, 90, 0))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 5.5, 270, 0))
        ds_list_add(gunplacing, array(20, 8, 1, 0, -5.5, 0, 0.5))
        ds_list_add(gunplacing, array(20, 8, 1, 0, -5.5, 180, 0.5))
        ds_list_add(gunplacing, array(20, 8, 1, 0, -5.5, 90, 0.5))
        ds_list_add(gunplacing, array(20, 8, 1, 0, -5.5, 270, 0.5))
        break
    case "doublebent":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _bent)
            ds_list_add(gunsettings, gun, gun, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 0.9, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1, 0, -2, 15, 0.5))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 2, -15, 0.5))
        ds_list_add(gunplacing, array(22, 8, 1, 0, 0, 0, 0))
        ds_list_add(gunplacing, array(20, 8, 1, 0, -2, 195, 0.5))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 2, 165, 0.5))
        ds_list_add(gunplacing, array(22, 8, 1, 0, 0, 180, 0))
        break
    case "bent":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _bent)
            ds_list_add(gunsettings, gun, gun, gun)
            _settings = multiply_array(array(1, 0.7, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(20, 8, 1, 0, -2, 15, 0.5))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 2, -15, 0.5))
        ds_list_add(gunplacing, array(22, 8, 1, 0, 0, 0, 0))
        break
    case "penta":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _bent, _bent)
            ds_list_add(gunsettings, gun, gun, gun, gun, gun)
            _settings = multiply_array(array(1, 0.7, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(16, 8, 1, 0, -3, 30, 0.667))
        ds_list_add(gunplacing, array(16, 8, 1, 0, 3, -30, 0.667))
        ds_list_add(gunplacing, array(20, 8, 1, 0, -2, 15, 0.333))
        ds_list_add(gunplacing, array(20, 8, 1, 0, 2, -15, 0.333))
        ds_list_add(gunplacing, array(23, 8, 1, 0, 0, 0, 0))
        break
    case "triplet":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _triple)
            ds_list_add(gunsettings, gun, gun, gun)
            _settings = multiply_array(array(1, 0.7, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(18, 9, 1, 0, -5, 0, 0.5))
        ds_list_add(gunplacing, array(18, 9, 1, 0, 5, 0, 0.5))
        ds_list_add(gunplacing, array(21, 9, 1, 0, 0, 0, 0))
        break
    case "dual":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _dual)
            smallgun = multiply_array(_basic, _twin, _dual, _lowpower)
            ds_list_add(gunsettings, smallgun, smallgun, gun, gun)
            _settings = multiply_array(array(0.8, 0.6, 1, 1, 1.05), _settings)
        }
        ds_list_add(gunplacing, array(20, 7, 1, 0, 5.5, 0, 0))
        ds_list_add(gunplacing, array(20, 7, 1, 0, -5.5, 0, 0.5))
        ds_list_add(gunplacing, array(18, 8.5, 1, 0, 5.5, 0, 0))
        ds_list_add(gunplacing, array(18, 8.5, 1, 0, -5.5, 0, 0.5))
        break
    case "quint":
        if UPDATE
        {
            gun = multiply_array(_basic, _twin, _triple, _quint)
            ds_list_add(gunsettings, gun, gun, gun, gun)
            ds_list_add(gunsettings, multiply_array(_2reload, gun))
            _settings = multiply_array(array(1, 0.6, 1, 1, 1), _settings)
        }
        ds_list_add(gunplacing, array(16, 10, 1, 0, -5, 0, 0.667))
        ds_list_add(gunplacing, array(16, 10, 1, 0, 5, 0, 0.667))
        ds_list_add(gunplacing, array(19, 10, 1, 0, -3, 0, 0.333))
        ds_list_add(gunplacing, array(19, 10, 1, 0, 3, 0, 0.333))
        ds_list_add(gunplacing, array(22, 10, 1, 0, 0, 0, 0))
        break
}

if UPDATE
{
    my_Acceleration = _settings[0]
    topspeed = _settings[1]
    realtopspeed = topspeed
    my_BodyHealth = _settings[2]
    my_BodyDamage = _settings[3]
    my_FOV = _settings[4]
    my_MaxSpeed = 0
    entity_initalize()
    my_GunNumber = ds_list_size(gunsettings)
    for (i = 0; i < my_GunNumber; i++)
    {
        settings = ds_list_find_value(gunsettings, i)
        position = ds_list_find_value(gunplacing, i)
        g_motion[i] = 0
        g_position[i] = 0
        gunreload[i] = settings[0]
        gunrecoil[i] = settings[1]
        gunshudder[i] = settings[2]
        gunlength[i] = position[0]
        gunheight[i] = position[1]
        gunaspect[i] = position[2]
        gunsetx[i] = position[3]
        gunsety[i] = position[4]
        gunangle[i] = position[5]
        gundelay[i] = position[6]
        g_armed[i] = ((gunreload[i] * gundelay[i]) * stat_Reload)
    }
    ds_list_destroy(gunplacing)
    return argument0;
}
else
    return gunplacing;
