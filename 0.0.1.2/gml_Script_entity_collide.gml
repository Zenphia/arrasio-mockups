var did_collide, stillselfhit, i, n, goahead, combinedradius, tock, xdiff, ydiff, xdelt, ydelt, n_dist, n_dir, xdir, ydir, component, tmin, tmax, A, B, C, det, t1, t2, reductionfactor, accelerationfactor, mydepthfactor, n_depthfactor, combinedupdepthfactor, combineddndepthfactor, mysqrpen, n_sqrpen, mysqrtpen, n_sqrtpen, combinedshieldfactor, speedfactor, n_speedfactor, componentnorm, mydamage, n_damage, mydamagetoapply, n_damagetoapply, mybit, n_bit, stuff, resistdiff, elasticity, spring, elasticimpulse, springimpulse, force, mymodifiers, n_modifiers;
if (my_Health <= 0 || AlreadyRanCollisions)
    return 0;
did_collide = 0
stillselfhit = 0
for (i = 0; i < 2; i++)
{
    n = instance_nth_nearest(x, y, Entity, (i + 2))
    if (ds_list_find_index(CollisionArray, n.id) == -1 && masterid != n.id && n.masterid != id && n.my_Health > 0 && n != id)
    {
        goahead = 0
        combinedradius = (my_Size + n.my_Size)
        tock = min(stepremaining, n.stepremaining)
        xdiff = (x - n.x)
        ydiff = (y - n.y)
        xdelt = (tock * (((xspeed + xaccel) - n.xspeed) - n.xaccel))
        ydelt = (tock * (((yspeed + yaccel) - n.yspeed) - n.yaccel))
        n_dist = instance_distance(n, id)
        n_dir = point_direction(x, y, n.x, n.y)
        xdir = dcos(n_dir)
        ydir = (-dsin(n_dir))
        component = max(0, ((xdir * xdelt) + (ydir * ydelt)))
        if (!(component < (n_dist - combinedradius)))
        {
            tmin = (1 - tock)
            tmax = 1
            A = ((xdelt * xdelt) + (ydelt * ydelt))
            B = (((2 * xdelt) * xdiff) + ((2 * ydelt) * ydiff))
            C = (((xdiff * xdiff) + (ydiff * ydiff)) - (combinedradius * combinedradius))
            det = ((B * B) - ((4 * A) * C))
            if (A == 0 || det < 0 || C < 0)
            {
                t = 0
                if (C < 0)
                    goahead = 1
            }
            else
            {
                t1 = (((-B) - sqrt(det)) / (2 * A))
                t2 = (((-B) + sqrt(det)) / (2 * A))
                if (t1 < tmin || t1 > tmax)
                {
                    if (t2 < tmin || t2 > tmax)
                        t = 0
                    else
                    {
                        t = t2
                        goahead = 1
                    }
                }
                else if (t2 >= tmin && t2 <= tmax)
                {
                    t = min(t1, t2)
                    goahead = 1
                }
                else
                {
                    t = t1
                    goahead = 1
                }
            }
            if goahead
            {
                if t
                {
                    x += ((xspeed + xaccel) * t)
                    y += ((yspeed + yaccel) * t)
                    n.x += ((n.xspeed + n.xaccel) * t)
                    n.y += ((n.yspeed + n.yaccel) * t)
                    stepremaining -= t
                    n.stepremaining -= t
                    xdiff = (x - n.x)
                    ydiff = (y - n.y)
                    n_dist = instance_distance(n, id)
                    n_dir = point_direction(x, y, n.x, n.y)
                    xdir = dcos(n_dir)
                    ydir = (-dsin(n_dir))
                    component = max(0, ((xdir * xdelt) + (ydir * ydelt)))
                }
                reductionfactor = 1
                if length(xdelt, ydelt)
                    accelerationfactor = ((combinedradius / 4) / (floor((combinedradius / length(xdelt, ydelt))) + 1))
                else
                    accelerationfactor = 0.001
                mydepthfactor = clamp(((combinedradius - n_dist) / (2 * my_Size)), 0, 1)
                n_depthfactor = clamp(((combinedradius - n_dist) / (2 * n.my_Size)), 0, 1)
                combinedupdepthfactor = (mydepthfactor * n_depthfactor)
                combineddndepthfactor = ((1 - mydepthfactor) * (1 - n_depthfactor))
                mysqrpen = sqr(my_Penetration)
                n_sqrpen = sqr(n.my_Penetration)
                mysqrtpen = sqrt(my_Penetration)
                n_sqrtpen = sqrt(n.my_Penetration)
                if n.shieldfactor
                    combinedshieldfactor = ((2 * arctan(((1 - (0.8 * shieldfactor)) / (1 - (0.8 * n.shieldfactor))))) / pi)
                else if shieldfactor
                    combinedshieldfactor = 1
                else
                    combinedshieldfactor = 0.5
                if (id.masterid != n.masterid)
                {
                    if my_MaxSpeed
                        speedfactor = sqrt((length((xspeed + xaccel), (yspeed + yaccel)) / my_MaxSpeed))
                    else
                        speedfactor = 1
                    if n.my_MaxSpeed
                        n_speedfactor = sqrt((length((n.xspeed + n.xaccel), (n.yspeed + n.yaccel)) / n.my_MaxSpeed))
                    else
                        n_speedfactor = 1
                    componentnorm = (component / length(xdelt, ydelt))
                    mydamage = (((1 * my_Damage) * max(speedfactor, 1)) * speedfactor)
                    n_damage = (((1 * n.my_Damage) * max(n_speedfactor, 1)) * n_speedfactor)
                    if RatioEffects
                        mydamage *= (1 * my_Ratio)
                    if n.RatioEffects
                        n_damage *= (1 * n.my_Ratio)
                    if DamageEffects
                        mydamage *= ((((1 * accelerationfactor) * (1 + ((componentnorm - 1) * (1 - n_depthfactor)))) * ((1 + (n_sqrtpen * n_depthfactor)) - n_depthfactor)) / n_sqrtpen)
                    if n.DamageEffects
                        n_damage *= ((((1 * accelerationfactor) * (1 + ((componentnorm - 1) * (1 - mydepthfactor)))) * ((1 + (mysqrtpen * mydepthfactor)) - mydepthfactor)) / mysqrtpen)
                    mydamagetoapply = mydamage
                    n_damagetoapply = n_damage
                    if n.my_MaxShield
                        mydamagetoapply = (mydamagetoapply - get_shield_damage(mydamagetoapply, n.my_MaxShield, n.my_Shield, n.my_Resist))
                    if my_MaxShield
                        n_damagetoapply = (n_damagetoapply - get_shield_damage(n_damagetoapply, my_MaxShield, my_Shield, my_Resist))
                    mybit = 1
                    n_bit = 1
                    stuff = get_health_damage(mydamagetoapply, n.my_Health, n.my_Resist)
                    if (stuff > my_Health)
                        mybit = (my_Health / stuff)
                    stuff = get_health_damage(n_damagetoapply, my_Health, my_Resist)
                    if (stuff > n.my_Health)
                        n_bit = (n.my_Health / stuff)
                    reductionfactor = min(mybit, n_bit)
                    resistdiff = ((n.my_Resist - my_Resist) + 1)
                    DamageRecieved += ((n_damage * n_bit) * resistdiff)
                    n.DamageRecieved += ((mydamage * mybit) * (2 - resistdiff))
                    did_collide = 1
                }
                else if ((!selfhit) && (!n.selfhit))
                    stillselfhit = 1
                if ((id.masterid != n.masterid || (selfhit && n.selfhit)) && my_Pushability && n.my_Pushability)
                {
                    elasticity = (2 - ((4 * arctan((mysqrpen * n_sqrpen))) / pi))
                    if (MotionEffects && n.MotionEffects)
                        elasticity *= ((my_Ratio / mysqrtpen) + (n.my_Ratio / n_sqrtpen))
                    spring = (0.5 * sqrt((my_Ratio * n.my_Ratio)))
                    elasticimpulse = (((((sqr(combineddndepthfactor) * elasticity) * component) * mass) * n.mass) / (mass + n.mass))
                    springimpulse = (spring * combinedupdepthfactor)
                    force = (((-((elasticimpulse + springimpulse))) * reductionfactor) * accelerationfactor)
                    mymodifiers = ((combinedshieldfactor / mass) / my_Penetration)
                    n_modifiers = (((1 - combinedshieldfactor) / n.mass) / n.my_Penetration)
                    apply_acceleration(id, (mymodifiers * force), n_dir)
                    apply_acceleration(n, ((-n_modifiers) * force), n_dir)
                    did_collide = 1
                }
                ds_list_add(n.CollisionArray, id)
                ds_list_add(CollisionArray, n.id)
            }
        }
    }
}
selfhit = stillselfhit
AlreadyRanCollisions = 1
return did_collide;
