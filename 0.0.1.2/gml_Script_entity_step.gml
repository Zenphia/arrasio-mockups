var i, t, reps, obj, shielddamage, healthdamage, motion, excess, k, drag, finalspeed;
if (0 && check_in_view(x, y, my_Size))
{
    abreak = 0
    for (i = 0; i < ds_list_size(HitTimeList); i++)
    {
        t = ds_list_find_value(HitTimeList, i)
        draw_set_colour(c_dkgray)
        draw_circle((x - (xspeed * t)), (y - (yspeed * t)), my_Size, 1)
        draw_circle((x + (xspeed * (1 - t))), (y + (yspeed * (1 - t))), my_Size, 1)
        draw_text(x, ((y + my_Size) + 50), string(stepremaining))
        draw_set_colour(c_blue)
        draw_arrow((x - (xspeed * t)), (y - (yspeed * t)), x, y, 5)
        draw_set_colour(c_red)
        draw_circle(x, y, my_Size, 1)
        abreak = 1
    }
    ds_list_clear(HitTimeList)
    draw_set_colour(c_red)
    draw_arrow(x, y, (x + xspeed), (y + yspeed), 5)
    draw_arrow(x, y, (x + (xspeed * stepremaining)), (y + (yspeed * stepremaining)), 5)
    draw_set_colour(c_green)
    draw_arrow(x, y, (x + xaccel), (y + yaccel), 5)
    draw_arrow(x, y, (x + (xaccel * stepremaining)), (y + (yaccel * stepremaining)), 5)
    draw_set_colour(c_blue)
    draw_arrow(x, y, (x + (xspeed + xaccel)), (y + (yspeed + yaccel)), 5)
    draw_arrow(x, y, (x + ((xspeed + xaccel) * stepremaining)), (y + ((yspeed + yaccel) * stepremaining)), 5)
    reps = ds_list_size(CheckedList)
    i = 0
    repeat reps
    {
        obj = ds_list_find_value(CheckedList, i++)
        draw_set_color(c_fuchsia)
        draw_arrow(x, y, obj.x, obj.y, 10)
    }
    ds_list_clear(CheckedList)
}
AlreadyRanCollisions = 0
if my_MaxShield
{
    if (my_Shield < 0)
        my_Shield = 0
    if (my_Shield < my_MaxShield)
        my_Shield += (my_ShieldRegen * shield_recharge((my_Shield / my_MaxShield)))
    if (my_Shield > my_MaxShield)
        my_Shield = my_MaxShield
}
if DamageRecieved
{
    if my_MaxShield
    {
        shielddamage = get_shield_damage(DamageRecieved, my_MaxShield, my_Shield, my_Resist)
        DamageRecieved -= shielddamage
        my_Shield -= shielddamage
        drawcolor = merge_color(drawcolor, merge_color($D66633, $660A82, 0.5), (shielddamage / my_MaxShield))
    }
    if (DamageRecieved > 0)
    {
        healthdamage = get_health_damage(DamageRecieved, my_Health, my_Resist)
        my_Health -= healthdamage
        drawcolor = merge_color(drawcolor, $1B15C4, (healthdamage / my_MaxHealth))
        DamageRecieved = 0
    }
}
if (my_Health <= 0.001)
{
    if (fade_out == 1)
    {
        reps = ds_list_size(CollisionArray)
        i = 0
        repeat reps
        {
            obj = ds_list_find_value(CollisionArray, i++)
            if variable_instance_exists(obj.masterid, "scorevalue")
                obj.masterid.scorevalue += (scorevalue / reps)
            else
                obj.scorevalue += (scorevalue / reps)
        }
    }
    fade_out -= 0.25
    if (fade_out == 0)
    {
        instance_destroy(id)
        ds_list_destroy(CollisionArray)
        return 0;
    }
}
else
{
    my_Ratio = sqrt((my_Health / my_MaxHealth))
    ds_list_clear(CollisionArray)
}
xspeed += xaccel
yspeed += yaccel
motion = length(xspeed, yspeed)
excess = (motion - my_MaxSpeed)
if (excess > 0)
{
    k = my_Damp
    drag = (excess / (k + 1))
    finalspeed = (my_MaxSpeed + drag)
    xspeed = ((finalspeed * xspeed) / motion)
    yspeed = ((finalspeed * yspeed) / motion)
}
if (length(xspeed, yspeed) <= 0.1 && xaccel == 0 && yaccel == 0)
{
    yspeed = 0
    xspeed = 0
}
x += (stepremaining * xspeed)
y += (stepremaining * yspeed)
stepremaining = 1
xaccel = 0
yaccel = 0
return 1;
