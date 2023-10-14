var did_collide, i, n, goahead, combinedradius, tock, xdiff, ydiff, xdelt, ydelt, n_dist, n_dir, xdir, ydir, component, tmin, tmax, A, B, C, det, t1, t2, reductionfactor, accelerationfactor, mydepthfactor, n_depthfactor, combinedupdepthfactor, combineddndepthfactor, mysqrpen, n_sqrpen, mysqrtpen, n_sqrtpen, speedfactor, n_speedfactor, componentnorm, damCon, resistdiff, mydamage, n_damage, mydamagetoapply, n_damagetoapply, mybit, n_bit, stuff, elasticity, spring, elasticimpulse, springimpulse, force, mymodifiers, n_modifiers;
if (my_Health <= 0 || AlreadyRanCollisions)
    return 0;
did_collide = 0
for (i = 0; i < 2; i++)
{
    n = instance_nth_nearest(x, y, Entity, (i + 2))
    if (ds_list_find_index(CollisionArray, n.id) == -1 && n.my_Health > 0 && n != id)
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
                    damCon = 1
                    resistdiff = (my_Resist - n.my_Resist)
                    mydamage = ((((damCon * (1 + resistdiff)) * my_Damage) * max(speedfactor, 1)) * speedfactor)
                    n_damage = ((((damCon * (1 - resistdiff)) * n.my_Damage) * max(n_speedfactor, 1)) * n_speedfactor)
                    if RatioEffects
                        mydamage *= (1 * min(1, power((my_Health / my_MaxHealth), (my_Penetration - 0.5))))
                    if n.RatioEffects
                        n_damage *= (1 * min(1, power((n.my_Health / n.my_MaxHealth), (n.my_Penetration - 0.5))))
                    if DamageEffects
                        mydamage *= ((((1 * accelerationfactor) * (1 + (((componentnorm - 1) * (1 - n_depthfactor)) / my_Penetration))) * ((1 + (n_sqrtpen * n_depthfactor)) - n_depthfactor)) / n_sqrtpen)
                    if n.DamageEffects
                        n_damage *= ((((1 * accelerationfactor) * (1 + (((componentnorm - 1) * (1 - mydepthfactor)) / n.my_Penetration))) * ((1 + (mysqrtpen * mydepthfactor)) - mydepthfactor)) / mysqrtpen)
                    mydamagetoapply = mydamage
                    n_damagetoapply = n_damage
                    if n.my_MaxShield
                        mydamagetoapply = (mydamagetoapply - get_shield_damage(mydamagetoapply, n.my_MaxShield, n.my_Shield, n.my_Resist))
                    if my_MaxShield
                        n_damagetoapply = (n_damagetoapply - get_shield_damage(n_damagetoapply, my_MaxShield, my_Shield, my_Resist))
                    mybit = 1
                    n_bit = 1
                    stuff = get_health_damage(n_damagetoapply, my_Health, my_Resist)
                    if (stuff > my_Health)
                        mybit = (my_Health / stuff)
                    stuff = get_health_damage(mydamagetoapply, n.my_Health, n.my_Resist)
                    if (stuff > n.my_Health)
                        n_bit = (n.my_Health / stuff)
                    reductionfactor = min(mybit, n_bit)
                    DamageRecieved += (n_damage * n_bit)
                    n.DamageRecieved += (mydamage * mybit)
                    did_collide = 1
                }
                if (my_Pushability && n.my_Pushability)
                {
                    if (!((object_index == Bullet && n.object_index == Bullet && masterid == n.masterid)))
                    {
                        elasticity = (2 - ((4 * arctan((my_Penetration * n.my_Penetration))) / pi))
                        if (MotionEffects && n.MotionEffects)
                            elasticity *= ((my_Ratio / mysqrtpen) + (n.my_Ratio / n_sqrtpen))
                        else
                            elasticity *= 2
                        spring = sqrt((my_Ratio * n.my_Ratio))
                        elasticimpulse = (((((sqr(combineddndepthfactor) * elasticity) * component) * mass) * n.mass) / (mass + n.mass))
                        springimpulse = (spring * combinedupdepthfactor)
                        force = ((((-((elasticimpulse + springimpulse))) * reductionfactor) * my_Pushability) * n.my_Pushability)
                        mymodifiers = ((1 - shield_level(my_MaxShield, my_Shield)) / mass)
                        n_modifiers = ((1 - shield_level(n.my_MaxShield, n.my_Shield)) / n.mass)
                        apply_acceleration(id, (mymodifiers * force), n_dir)
                        apply_acceleration(n, ((-n_modifiers) * force), n_dir)
                        did_collide = 1
                    }
                }
                ds_list_add(n.CollisionArray, id)
                ds_list_add(CollisionArray, n.id)
            }
        }
    }
}
AlreadyRanCollisions = 1
return did_collide;
