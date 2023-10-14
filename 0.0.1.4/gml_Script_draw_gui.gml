var alcovesize, xx, yy, XX, YY, upgrades, len, XXX, YYY, SurfaceAspect, InterpolateFactor, i, sizey, _surf, gunplacing, gunnum, endpoints, j, position, gunlength, gunsetx, gunangle, middle, XDRAW, YDRAW, gunheight, gunaspect, gunsety, gundistance, gundirection, theta, yoffset1, yoffset2, h1, h2, _surf_interpolate, xplace, yplace, data, newi, XMAP, YMAP, BARHEIGHT, n, hotspot, textcolor;
alcovesize = 0.2
if TARGET.upgrade
{
    rotation += 0.5
    xx = 10
    yy = 10
    XX = ((alcovesize * 1000) - 10)
    YY = XX
    upgrades = upgrade_tree(TARGET._tank)
    len = array_length_1d(upgrades)
    XXX = ((XX - 20) / 2)
    YYY = ((YY - 20) / 2)
    SurfaceAspect = 2
    InterpolateFactor = 2
    for (i = Swarm; i < len; i++)
    {
        sizey = ((0.1 * SurfaceAspect) * tank_get_size(get_upgrade_skill_level(upgrades[0])))
        _surf = surface_create(((XXX * sizey) / 1.6), ((YYY * sizey) / 1.6))
        surface_set_target(_surf)
        draw_surface_part_ext(application_surface, (xx * 2), (yy * 2), (XXX * 2), (YYY * 2), 0, 0, (surface_get_width(_surf) / (XXX * 2)), (surface_get_height(_surf) / (YYY * 2)), 16777215, 1)
        draw_set_color(c_dkgray)
        draw_set_alpha(0.5)
        draw_rectangle(0, 0, surface_get_width(_surf), surface_get_height(_surf), false)
        draw_set_color(c_white)
        draw_set_alpha(1)
        gunplacing = set_gun(upgrades[i], 0)
        gunnum = ds_list_size(gunplacing)
        endpoints = ds_list_create()
        for (j = 0; j < gunnum; j++)
        {
            position = ds_list_find_value(gunplacing, j)
            gunlength = position[0]
            gunsetx = position[3]
            gunangle = position[5]
            ds_list_add(endpoints, (gunsetx + (gunlength * dcos(gunangle))))
        }
        ds_list_add(endpoints, -10)
        ds_list_add(endpoints, 10)
        ds_list_sort(endpoints, 1)
        middle = mean(ds_list_find_value(endpoints, 0), ds_list_find_value(endpoints, (ds_list_size(endpoints) - 1)))
        ds_list_destroy(endpoints)
        XDRAW = ((surface_get_width(_surf) / 2) - lengthdir_x(((sizey * middle) / 2), rotation))
        YDRAW = ((surface_get_height(_surf) / 2) - lengthdir_y(((sizey * middle) / 2), rotation))
        for (j = 0; j < gunnum; j++)
        {
            position = ds_list_find_value(gunplacing, j)
            gunlength = position[0]
            gunheight = position[1]
            gunaspect = position[2]
            gunsetx = position[3]
            gunsety = position[4]
            gunangle = (position[5] + rotation)
            gundistance = length(gunsetx, gunsety)
            gundirection = (point_direction(0, 0, gunsetx, gunsety) + gunangle)
            g_x = (lengthdir_x(gundistance, gundirection) + lengthdir_x((gunlength / 2), gunangle))
            g_y = (lengthdir_y(gundistance, gundirection) + lengthdir_y((gunlength / 2), gunangle))
            theta = arctan(((gunheight * (gunaspect - 1)) / gunlength))
            yoffset1 = ((SurfaceAspect * 2) * tan((0.7853981633974483 - (theta / 2))))
            yoffset2 = ((SurfaceAspect * 2) * tan((0.7853981633974483 + (theta / 2))))
            if (gunaspect > 0)
            {
                h1 = (sizey * gunheight)
                h2 = ((sizey * gunheight) * gunaspect)
            }
            else if (gunaspect < 0)
            {
                h1 = (((-sizey) * gunheight) * gunaspect)
                h2 = (sizey * gunheight)
            }
            draw_rotated_trapezoid(((1 + XDRAW) + (sizey * g_x)), ((1 + YDRAW) + (sizey * g_y)), ((sizey * gunlength) + ((2 * SurfaceAspect) * 2)), (h1 + (2 * yoffset1)), (h2 + (2 * yoffset2)), gunangle, merge_color($888888, c_black, 0.4), 1)
            draw_rotated_trapezoid(((1 + XDRAW) + (sizey * g_x)), ((1 + YDRAW) + (sizey * g_y)), (sizey * gunlength), h1, h2, gunangle, $888888, 1)
        }
        draw_set_color(merge_color($D66633, c_black, 0.4))
        draw_circle(XDRAW, YDRAW, ((10 * sizey) + (2 * SurfaceAspect)), 0)
        draw_set_color($D66633)
        draw_circle(XDRAW, YDRAW, (10 * sizey), 0)
        ds_list_destroy(gunplacing)
        surface_reset_target()
        _surf_interpolate = surface_create((surface_get_width(_surf) * InterpolateFactor), (surface_get_height(_surf) * InterpolateFactor))
        surface_set_target(_surf_interpolate)
        draw_clear_alpha(c_white, 0)
        draw_surface_stretched_ext(_surf, 0, 0, (surface_get_width(_surf) * InterpolateFactor), (surface_get_height(_surf) * InterpolateFactor), 16777215, 1)
        surface_reset_target()
        texture_set_interpolation(true)
        draw_surface_stretched_ext(_surf_interpolate, xx, yy, XXX, YYY, 16777215, 1)
        surface_free(_surf)
        surface_free(_surf_interpolate)
        draw_set_alpha(1)
        draw_set_halign(fa_center)
        draw_text_diep((((xx + xx) + XXX) / 2), ((yy + YYY) - 14), (((tank_get_name(upgrades[i]) + " [ ") + get_upgrade_key(i)) + " ]"), c_white, 7, 0, 1, 20)
        draw_set_color(merge_color($888888, c_black, 0.4))
        draw_set_alpha(1)
        draw_rectangle(xx, yy, (xx + XXX), (yy + YYY), true)
        if (i % 2)
            yy += (YYY + 10)
        else
        {
            yy -= (YYY + 10)
            xx += (XXX + 10)
        }
    }
}
xx = 990
yy = 590
XX = (((1 - alcovesize) * 1000) + 10)
YY = (yy - (xx - XX))
draw_set_color($888888)
draw_set_alpha(0.5)
draw_rectangle(xx, yy, XX, YY, false)
with (Entity)
{
    if (!(irandom((15 * my_Stealth))))
        ds_map_set(GameControl.MINIMAP, id, array(x, y))
}
xplace = ((xx - XX) / room_width)
yplace = ((yy - YY) / room_height)
i = ds_map_find_first(MINIMAP)
if (!is_undefined(i))
{
    repeat ds_map_size(MINIMAP)
    {
        data = ds_map_find_value(MINIMAP, i)
        newi = ds_map_find_next(MINIMAP, i)
        XMAP = data[0]
        YMAP = data[1]
        draw_sprite_ext(MaskDot, 0, round((XX + (xplace * XMAP))), round((YY + (yplace * YMAP))), 1, 1, 0, merge_color($888888, c_black, 0.4), 0.25)
        if (!instance_exists(i))
        {
            if (!irandom(15))
                ds_map_delete(MINIMAP, i)
        }
        i = newi
    }
}
with (TARGET)
{
    if (my_Health > 0)
        draw_sprite_ext(MaskArrow, 0, round((XX + (xplace * x))), round((YY + (yplace * y))), 1, 1, point_direction(x, y, mouse_x, mouse_y), c_black, 1)
}
draw_set_color($888888)
draw_set_alpha(1)
draw_rectangle(round((XX + (xplace * view_xview[0]))), round((YY + (yplace * view_yview[0]))), round((XX + (xplace * (view_xview[0] + view_wview[0])))), round((YY + (yplace * (view_yview[0] + view_hview[0])))), true)
draw_set_color(merge_color($888888, c_black, 0.4))
draw_set_alpha(1)
draw_rectangle(xx, yy, XX, YY, true)
BARHEIGHT = 15
xx = ((alcovesize * 1000) + 10)
XX = (((1 - alcovesize) * 1000) - 10)
yy = (590 - BARHEIGHT)
YY = 590
draw_set_color($888888)
draw_rectangle(xx, yy, XX, YY, false)
draw_set_color($15A0DB)
draw_rectangle(xx, yy, (xx + ((XX - xx) * clamp((displayed_score / displayed_score_level), 0, 1))), YY, false)
draw_set_color(merge_color($888888, c_black, 0.4))
draw_rectangle(xx, yy, XX, YY, true)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_diep(((xx + XX) / 2), ((yy + YY) / 2), ((("Level " + string(TARGET.skilllevel)) + " ") + tank_get_name(TARGET._tank)), c_white, (BARHEIGHT - 4), 0, 1, 8)
YY -= (BARHEIGHT + 4)
BARHEIGHT = 10
yy = (YY - BARHEIGHT)
draw_set_color($888888)
draw_rectangle(xx, yy, XX, YY, false)
draw_set_color($16A039)
draw_rectangle(xx, yy, (xx + ((XX - xx) * 1)), YY, false)
draw_set_color(merge_color($888888, c_black, 0.4))
draw_rectangle(xx, yy, XX, YY, true)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_diep(((xx + XX) / 2), ((yy + YY) / 2), ("Score: " + handle_large_number(TARGET.scorevalue)), c_white, (BARHEIGHT - 2), 0, 1, 8)
BARHEIGHT = 11
xx = 10
XX = ((alcovesize * 1000) - 10)
yy = (590 - BARHEIGHT)
YY = 590
for (n = 9; n >= 0; n--)
{
    i = translate_stats(n, "out")
    draw_set_color($888888)
    draw_rectangle(xx, yy, XX, YY, false)
    draw_set_color(StatInfo[i, 2])
    draw_rectangle(xx, yy, (xx + ((XX - xx) * (TARGET.skill[i] / 10))), YY, false)
    draw_set_color(merge_color($888888, c_black, 0.4))
    if (TARGET.skilllevel < 30)
    {
        draw_rectangle((xx + ((XX - xx) * 0.7)), yy, XX, YY, false)
        draw_set_color($888888)
        for (j = 7; j < 10; j++)
        {
            hotspot = (xx + ((XX - xx) * (j / 10)))
            draw_line(hotspot, yy, hotspot, YY)
        }
    }
    draw_set_color(merge_color($888888, c_black, 0.4))
    for (j = 1; j < (TARGET.skill[i] + 1); j++)
    {
        hotspot = (xx + ((XX - xx) * (j / 10)))
        draw_line(hotspot, yy, hotspot, YY)
    }
    if (TARGET.skill[i] == 10)
        textcolor = StatInfo[i, 2]
    else if ((!TARGET.skillpoints) || (TARGET.skilllevel < 30 && TARGET.skill[i] == 7))
        textcolor = 8947848
    else
        textcolor = 16777215
    draw_set_color(merge_color($888888, c_black, 0.4))
    draw_rectangle(xx, yy, XX, YY, true)
    draw_set_valign(fa_top)
    draw_set_halign(fa_center)
    draw_text_diep(((xx + XX) / 2), (yy + 1), StatInfo[i, 0], textcolor, (BARHEIGHT - 5), 0, 1, 8)
    draw_text_diep(((1 + xx) + (((XX - xx) * 9.5) / 10)), (yy + 1), StatInfo[i, 1], textcolor, (BARHEIGHT - 5), 0, 1, 8)
    yy -= (BARHEIGHT + 4)
    YY -= (BARHEIGHT + 4)
}
if TARGET.skillpoints
{
    draw_set_halign(fa_left)
    draw_text_diep((XX + 2), yy, ("x" + string(TARGET.skillpoints)), c_white, 12, 15, 1, 8)
}
