var i, k, upgrades, len, facing, key_shoot, key_shoot_pressed, key_up, key_dn, key_lf, key_rg, move_mass, horz, vert, rate, powercoeff, move, realtopspeed, vfrict, hfrict, g, sizey, g_facing, recoilforce, gundistance, gundirection, g_x, g_y, theta, yoffset1, yoffset2, h1, h2;
if (keyboard_check(ord("N")) && skilllevel < 135)
    scorevalue += get_level(skilllevel)
if (skilllevel < 135)
{
    while ((scorevalue - skilldeduction) >= get_level(skilllevel))
    {
        skilldeduction += get_level(skilllevel)
        skilllevel += 1
        skillpoints += get_skill_point(skilllevel)
        if (skilllevel == 10 || skilllevel == 25 || skilllevel == 45)
            upgrade = 1
        my_Size = tank_get_size(skilllevel)
        my_Density = (1 + (0.1 * skilllevel))
        stats_implement()
    }
}
i = 0
while (i < 10 && skillpoints)
{
    k = translate_stats(i, "out")
    if (keyboard_check_pressed(ord(string(((i + 1) % 10)))) && skill[k] != 10 && (!((skilllevel < 30 && skill[k] == 7))))
    {
        skillpoints -= 1
        skill[k] += 1
        stats_do()
        stats_implement()
    }
    i++
}
if upgrade
{
    upgrades = upgrade_tree(_tank)
    len = array_length_1d(upgrades)
    i = 1
    while (i < len)
    {
        if keyboard_check_pressed(ord(string_upper(get_upgrade_key(i))))
        {
            _tank = set_gun(upgrades[i], 1)
            if (skilllevel < get_upgrade_skill_level((upgrades[0] + 1)))
                upgrade = 0
            break
        }
        else
        {
            i++
            continue
        }
    }
}
facing = point_direction(x, y, mouse_x, mouse_y)
key_shoot = mouse_check_button(mb_left)
key_shoot_pressed = mouse_check_button_pressed(mb_left)
key_up = keyboard_check(MoveKeys[1])
key_dn = keyboard_check(MoveKeys[2])
key_lf = keyboard_check(MoveKeys[3])
key_rg = keyboard_check(MoveKeys[4])
move_mass = (mass / 145)
horz = 0
vert = 0
rate = max(0, (length(xspeed, yspeed) / my_MaxSpeed))
powercoeff = 1
move = ((my_Acceleration * powercoeff) / sqrt(move_mass))
realtopspeed = ((stat_Mobility * topspeed) * max((1 - (0.01 * skilllevel)), 0.5))
my_Damp = (move / realtopspeed)
if (key_up ^ key_dn)
    vert = 1
if (key_lf ^ key_rg)
    horz = 1
if (vert && horz)
    move *= 0.7071
vfrict = (((-my_Friction) * yspeed) / my_Size)
hfrict = (((-my_Friction) * xspeed) / my_Size)
if vert
{
    if key_up
    {
        if (yspeed > 0)
            yaccel += vfrict
        yaccel -= move
    }
    if key_dn
    {
        if (yspeed < 0)
            yaccel += vfrict
        yaccel += move
    }
}
else
    yaccel += vfrict
if horz
{
    if key_lf
    {
        if (xspeed > 0)
            xaccel += hfrict
        xaccel -= move
    }
    if key_rg
    {
        if (xspeed < 0)
            xaccel += hfrict
        xaccel += move
    }
}
else
    xaccel += hfrict
for (g = 0; g < my_GunNumber; g++)
{
    if (gunreload[g] && key_shoot_pressed && (!g_armed[g]))
        g_armed[g] += ((gunreload[g] * gundelay[g]) * stat_Reload)
}
sizey = (0.1 * my_Size)
for (g = 0; g < my_GunNumber; g++)
{
    g_facing[g] = (gunangle[g] + facing)
    g_motion[g] += ((-my_Spring) * g_position[g])
    g_position[g] += g_motion[g]
    if (g_position[g] < 0)
    {
        g_position[g] = 0
        g_motion[g] = (-g_motion[g])
    }
    if (g_motion[g] > 0)
    {
        recoilforce = (((gunrecoil[g] * g_motion[g]) * my_ShockAbsorb) / 8)
        xaccel -= (recoilforce * dcos(g_facing[g]))
        yaccel += (recoilforce * dsin(g_facing[g]))
        g_motion[g] *= (1 - my_ShockAbsorb)
    }
    gundistance = length(gunsetx[g], gunsety[g])
    gundirection = (point_direction(0, 0, gunsetx[g], gunsety[g]) + g_facing[g])
    g_x[g] = (lengthdir_x(gundistance, gundirection) + lengthdir_x(((gunlength[g] - g_position[g]) / 2), g_facing[g]))
    g_y[g] = (lengthdir_y(gundistance, gundirection) + lengthdir_y(((gunlength[g] - g_position[g]) / 2), g_facing[g]))
    if gunreload[g]
    {
        g_armed[g] -= min(1, g_armed[g])
        while (key_shoot && g_armed[g] < 1)
        {
            g_motion[g] -= (4 * ln(((stat_Speed * gunrecoil[g]) + 1)))
            shoot_bullet((x + (sizey * g_x[g])), (y + (sizey * g_y[g])), g_facing[g], my_Size, gunheight[g], g_armed[g], ds_list_find_value(gunsettings, g), array(stat_Damage, stat_Penetration, stat_Speed, stat_Strength))
            g_armed[g] += (gunreload[g] * stat_Reload)
        }
    }
}
if entity_step()
{
    for (g = 0; g < my_GunNumber; g++)
    {
        theta = arctan(((gunheight[g] * (gunaspect[g] - 1)) / gunlength[g]))
        yoffset1 = (2 * tan((0.7853981633974483 - (theta / 2))))
        yoffset2 = (2 * tan((0.7853981633974483 + (theta / 2))))
        if (gunaspect[g] > 0)
        {
            h1 = (sizey * gunheight[g])
            h2 = ((sizey * gunheight[g]) * gunaspect[g])
        }
        else if (gunaspect[g] < 0)
        {
            h1 = (((-sizey) * gunheight[g]) * gunaspect[g])
            h2 = (sizey * gunheight[g])
        }
        draw_rotated_trapezoid(((x + 1) + (sizey * g_x[g])), ((y + 1) + (sizey * g_y[g])), ((sizey * (gunlength[g] - g_position[g])) + 4), (h1 + (2 * yoffset1)), (h2 + (2 * yoffset2)), g_facing[g], merge_color($888888, c_black, 0.4), fade_out)
        draw_rotated_trapezoid(((x + 1) + (sizey * g_x[g])), ((y + 1) + (sizey * g_y[g])), (sizey * (gunlength[g] - g_position[g])), h1, h2, g_facing[g], $888888, fade_out)
    }
    entity_draw()
}
