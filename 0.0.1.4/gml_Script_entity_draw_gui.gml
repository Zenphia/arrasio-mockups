var guiratio, X, Y, guisize, healthlength, _health, _shield, healthamount, shieldamount;
if (!(check_in_view(x, (y + 10), (my_Size + 10))))
    exit
draw_set_color(my_Color)
drawdark = merge_color(my_Color, c_black, 0.4)
guiratio = ((view_hport[0] / 2) / view_hview[0])
X = (guiratio * (x - view_xview[0]))
Y = ((guiratio * (y - view_yview[0])) + 10)
guisize = (guiratio * my_realSize)
healthlength = my_Size
_health = 0
_shield = 0
if (my_Ratio != 1 && DRAWHEALTH)
    _health = 1
if (my_Shield != my_MaxShield && DRAWHEALTH)
    _shield = 1
if (my_MaxShield != 0 && my_Shield == my_MaxShield && _health)
    _shield = 1
if (_health || _shield)
{
    healthamount = max(0, ((2 * healthlength) * (my_Health / my_MaxHealth)))
    draw_set_alpha(fade_out)
    draw_set_color(merge_color($888888, c_black, 0.4))
    draw_rectangle(((X - 1) - healthlength), ((Y + guisize) - 2), ((X + 1) + healthlength), ((Y + guisize) + 2), false)
    draw_set_color($16A039)
    draw_rectangle((X - healthlength), ((Y + guisize) - 1), ((X - healthlength) + healthamount), ((Y + guisize) + 1), false)
}
if _shield
{
    shieldamount = max(0, ((2 * healthlength) * (my_Shield / my_MaxShield)))
    draw_set_alpha(((0.8 * fade_out) * shield_level(my_MaxShield, my_Shield)))
    draw_set_color(merge_color($D66633, $660A82, 0.5))
    draw_rectangle((X - healthlength), ((Y + guisize) - 1), ((X - healthlength) + shieldamount), ((Y + guisize) + 1), false)
}
